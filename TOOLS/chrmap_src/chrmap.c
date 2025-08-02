#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define MAX_LINE 1024
#define MAX_MAP 256
#define SKIP_WORDS 2 // number of words to skip if --detokenize-sf2j mode is selected
#define OPENING_DELIMITER '<' // delimiters that contain string(s) to be operated upon
#define CLOSING_DELIMITER '>'
#define MULTICHAR_OPENING '[' // multichar token symbol opening and closing delimiters
#define MULTICHAR_CLOSING ']'

// stringification macros
#define _STR(x) #x
#define STR(x) _STR(x)

typedef struct {
    unsigned char byte;
    char utf8[8];
} CharmapEntry;

CharmapEntry map[MAX_MAP];
int map_len = 0;

void trim(char *s) {
    char *p = s;
    while (isspace(*p)) p++;
    memmove(s, p, strlen(p) + 1);
    char *end = s + strlen(s) - 1;
    while (end > s && isspace(*end)) *end-- = '\0';
}

void parse_charmap(const char *filename) {
    FILE *f = fopen(filename, "r");
    if (!f) { perror("charmap open"); exit(1); }

    char line[MAX_LINE];
    while (fgets(line, sizeof(line), f)) {
        char *comment = strstr(line, "//");
        if (comment) *comment = '\0';
        trim(line);
        if (!*line) continue;

        char *eq = strchr(line, '=');
        if (!eq) continue;

        *eq = '\0';
        char *hex = line;
        char *val = eq + 1;

        trim(hex);
        trim(val);

        if (strncmp(hex, "0x", 2) != 0)
            continue;

        unsigned int byte;
        if (sscanf(hex, "0x%x", &byte) != 1 || byte > 255)
            continue;

        // Detect if wrapped in quotes or brackets
        int wrapped_in_quotes = (val[0] == '"' && val[strlen(val) - 1] == '"');
        int wrapped_in_brackets = (val[1] == MULTICHAR_OPENING && val[strlen(val) - 2] == MULTICHAR_CLOSING);

        if (wrapped_in_quotes || wrapped_in_brackets) {
            val[strlen(val) - 1] = '\0';
            val++;
        }

        // Check number of UTF-8 characters
        int utf8_count = 0;
        const char *p = val;
        while (*p) {
            unsigned char c = (unsigned char)*p;
            if ((c & 0x80) == 0) p += 1;
            else if ((c & 0xE0) == 0xC0) p += 2;
            else if ((c & 0xF0) == 0xE0) p += 3;
            else if ((c & 0xF8) == 0xF0) p += 4;
            else break;
            utf8_count++;
        }

        if (utf8_count > 1 && wrapped_in_quotes && !wrapped_in_brackets) {
            fprintf(stderr,
                "Error in charmap '%s':\n"
                "  Token symbol for 0x%02X has multiple UTF-8 characters in quotes: \"%s\"\n"
                "  Hint: Wrap symbols with multiple characters in square brackets: [%s]\n",
                filename, byte, val, val);
            exit(1);
        }

        map[map_len].byte = (unsigned char)byte;
        strncpy(map[map_len].utf8, val, sizeof(map[map_len].utf8) - 1);
        map[map_len].utf8[sizeof(map[map_len].utf8) - 1] = '\0';
        map_len++;
    }

    fclose(f);
}

char *find_utf8(unsigned char byte) {
    for (int i = 0; i < map_len; i++)
        if (map[i].byte == byte)
            return map[i].utf8;
    return NULL;
}

int find_byte(const char *utf8) {
    for (int i = 0; i < map_len; i++)
        if (strcmp(map[i].utf8, utf8) == 0)
            return map[i].byte;
    return -1;
}

// UTF-8 parsing
int read_utf8_char(const char *s, char *out) {
    int len = 1;
    unsigned char c = (unsigned char)s[0];
    if (c >= 0xC0 && c < 0xE0) len = 2;
    else if (c >= 0xE0 && c < 0xF0) len = 3;
    else if (c >= 0xF0) len = 4;

    strncpy(out, s, len);
    out[len] = '\0';
    return len;
}

void detokenize_file(FILE *in, FILE *out) {
    int in_tag = 0;
    int c;
    while ((c = fgetc(in)) != EOF) {
        if (c == OPENING_DELIMITER) in_tag = 1;
        else if (c == CLOSING_DELIMITER) in_tag = 0;

        if (in_tag) {
            // don't use angle brackets
            if (c == OPENING_DELIMITER || c == CLOSING_DELIMITER) {
                fputc(c, out);
                continue;
            }
            char *utf = find_utf8((unsigned char)c);
            if (utf)
                fputs(utf, out);
            else
                fputc(c, out);
        } else {
            fputc(c, out);
        }
    }
}

void detokenize_file_sf2j(FILE *in, FILE *out) {
    int in_tag = 0;
    int c;
    char buffer[1024];
    int pos = 0;

    while ((c = fgetc(in)) != EOF) {
        if (!in_tag) {
            if (c == OPENING_DELIMITER) {
                in_tag = 1;
                fputc(c, out);
                pos = 0;
            } else {
                fputc(c, out);
            }
            continue;
        }

        // Inside a tag
        if (c == CLOSING_DELIMITER) {
            in_tag = 0;
            buffer[pos] = '\0';

            // ---- Split and preserve first two words ----
            int word_count = 0, i = 0;

            // Print out the first two space-separated words
            while (buffer[i] && word_count < SKIP_WORDS) {
                fputc(buffer[i], out);
                if (buffer[i] == ' ') word_count++;
                i++;
            }

            // Now detokenize the rest
            for (; buffer[i]; i++) {
                unsigned char b = (unsigned char)buffer[i];

                // Don't interpret angle brackets inside content
                if (b == OPENING_DELIMITER || b == CLOSING_DELIMITER) {
                    fputc(b, out);
                    continue;
                }

                char *utf = find_utf8(b);
                if (utf)
                    fputs(utf, out);
                else
                    fputc(b, out);
            }

            fputc(CLOSING_DELIMITER, out); // close tag
            continue;
        }

        if (in_tag && pos < (int)sizeof(buffer) - 1) {
            buffer[pos++] = (char)c;
        }
    }
}

void tokenize_file(FILE *in, FILE *out) {
    int in_tag = 0;
    int c;

    while ((c = fgetc(in)) != EOF) {
        if (c == OPENING_DELIMITER) {
            in_tag = 1;
            fputc(c, out);
            continue;

        } else if (c == CLOSING_DELIMITER) {
            in_tag = 0;
            fputc(c, out);
            continue;
        }

        if (!in_tag) {
            fputc(c, out);
            continue;
        }

        // Inside <...>
        if (c == OPENING_DELIMITER || c == CLOSING_DELIMITER) {
            // Protect angle brackets inside tag content
            fputc(c, out);
            continue;
        }

        // Inside <...>
        if (c == MULTICHAR_OPENING) {
            // Try to read symbolic token like [St], [0x83], [D^]
            char token[64];
            int pos = 0;
            token[pos++] = MULTICHAR_OPENING;

            while ((c = fgetc(in)) != EOF && c != MULTICHAR_CLOSING && pos < (int)sizeof(token) - 2) {
                token[pos++] = (char)c;
            }

            if (c == MULTICHAR_CLOSING) {
                token[pos++] = MULTICHAR_CLOSING;
                token[pos] = '\0';

                int byte = find_byte(token);
                if (byte >= 0) {
                    fputc(byte, out);
                    continue;
                }
            }

            // If unmatched or invalid, print raw
            fwrite(token, 1, pos, out);
            continue;
        }

        // UTF-8 handling
        unsigned char first = (unsigned char)c;
        char utf8[8];
        int len = 1;

        utf8[0] = (char)first;

        if ((first & 0xE0) == 0xC0) len = 2;
        else if ((first & 0xF0) == 0xE0) len = 3;
        else if ((first & 0xF8) == 0xF0) len = 4;

        for (int i = 1; i < len; i++) {
            int next = fgetc(in);
            if (next == EOF) {
                len = i; // Partial character
                break;
            }
            utf8[i] = (char)next;
        }

        utf8[len] = '\0';

        int byte = find_byte(utf8);
        if (byte >= 0) {
            fputc(byte, out);
        } else {
            fwrite(utf8, 1, len, out);
        }
    }
}


void validate_bracketed_tokens(FILE *in) {
    int c;
    int inside_token = 0;
    int numLines = 1;
    int numErrors = 0;
    printf("==BRACKETED TOKEN VALIDATION MODE==\n");
    while ((c = fgetc(in)) != EOF) {
        if (c == '\n') numLines++;
        if (!inside_token && c == MULTICHAR_CLOSING) {
            fprintf(stderr, "(%d) Error: stray " STR(MULTICHAR_CLOSING) " found.\n", numLines);
            numErrors++;
            continue;
        }
        if (c == MULTICHAR_OPENING) {
            char token[64];
            int pos = 0;
            token[pos++] = MULTICHAR_OPENING;
            inside_token = 1;

            while ((c = fgetc(in)) != EOF && c != MULTICHAR_CLOSING && pos < (int)sizeof(token) - 2) {
                token[pos++] = (char)c;
            }

            if (c == MULTICHAR_CLOSING) {
                token[pos++] = MULTICHAR_CLOSING;
                token[pos] = '\0';
                inside_token = 0;

                if (find_byte(token) < 0) {
                    fprintf(stderr, "(%d) Error: undefined token %s found.\n",numLines, token);
                    numErrors++;
                }
            } else {
                fprintf(stderr, "(%d) Error: unmatched " STR(MULTICHAR_OPENING) " found.\n", numLines);
                numErrors++;
                inside_token = 0;
            }
        }
    }
        printf("%d line(s) processed.\n%d Error(s) detected.\n", numLines, numErrors);
            if (!numErrors) {
                printf("File is valid!\n");
            }
}



int main(int argc, char *argv[]) {
    if (argc < 4 || argc > 5) {
        fprintf(stderr,
            "Star Fox (2) Character Mapper v1.0\n"
            "Usage: chrmap mode charmap.txt input.txt [output.txt]\n", argv[0]);
        fprintf(stderr,
            "\nMode options:\n--tokenize - tokenizes input file based on charmap file definitions.\n"
            "--detokenize - detokenizes file based on charmap file definitions.\n"
            "--detokenize-sf2j - detokenizes input file based on charmap file definitions,\n"
            "skipping the first 2 words of each line. (for Japanese Star Fox 2)\n"
            "--validate - scan input file for bracketed token errors.\n");
        fprintf(stderr,
            "\nExample charmap text file:\n"
            "// token byte = \"c\" or \"[name]\"\n"
            "0x11 = \"~\" // quoted single UTF-8 character\n"
            "0x7E = \"[em]\" // bracketed token symbol\n");
        fprintf(stderr,
            "\nThe input file's text to be operated upon must must be contained within " STR(OPENING_DELIMITER) " and " STR(CLOSING_DELIMITER) ".\n"
            "If no output file is specified, output will be written to stdout.\n");
        return 1;
    }

    int mode_tokenize = strcmp(argv[1], "--tokenize") == 0;
    int mode_detokenize = strcmp(argv[1], "--detokenize") == 0;
    int mode_detokenizeSF2J = strcmp(argv[1], "--detokenize-sf2j") == 0;
    int mode_validate = strcmp(argv[1], "--validate") == 0;
    if (!mode_tokenize && !mode_detokenize && !mode_validate) {
        fprintf(stderr, "Invalid mode: %s\n", argv[1]);
        return 1;
    }

    parse_charmap(argv[2]);

    FILE *in = fopen(argv[3], "r");
    if (!in) { perror("input file"); return 1; }

    FILE *out = stdout;  // default
    if (argc == 5) {
        out = fopen(argv[4], "w");
        if (!out) { perror("output file"); fclose(in); return 1; }
    }

    if (mode_tokenize) {
        tokenize_file(in, out);
    } else if (mode_detokenize) {
        detokenize_file(in, out);
    } else if (mode_detokenizeSF2J) {
        detokenize_file_sf2j(in, out);
    } else if (mode_validate) {
        validate_bracketed_tokens(in);
    }

    fclose(in);
    if (out != stdout) fclose(out);

    return 0;
}
