#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define MAX_LINE 1024
#define MAX_MAP 256

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
        int wrapped_in_brackets = (val[1] == '[' && val[strlen(val) - 2] == ']');

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
        if (c == '<') in_tag = 1;
        else if (c == '>') in_tag = 0;

        if (in_tag) {
            // don't use angle brackets
            if (c == '<' || c == '>') {
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


void tokenize_file(FILE *in, FILE *out) {
    int in_tag = 0;
    int c;

    while ((c = fgetc(in)) != EOF) {
        if (c == '<') {
            in_tag = 1;
            fputc(c, out);
            continue;
        } else if (c == '>') {
            in_tag = 0;
            fputc(c, out);
            continue;
        }

        if (!in_tag) {
            fputc(c, out);
            continue;
        }

        // Inside <...>
        if (c == '<' || c == '>') {
            // Protect angle brackets inside tag content
            fputc(c, out);
            continue;
        }

        // Inside <...>
        if (c == '[') {
            // Try to read symbolic token like [St], [0x83], [D^]
            char token[64];
            int pos = 0;
            token[pos++] = '[';

            while ((c = fgetc(in)) != EOF && c != ']' && pos < (int)sizeof(token) - 2) {
                token[pos++] = (char)c;
            }

            if (c == ']') {
                token[pos++] = ']';
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





int main(int argc, char *argv[]) {
    if (argc < 4 || argc > 5) {
        fprintf(stderr, "Usage: chrmap --tokenize|--detokenize charmap.txt input.txt [output.txt]\n", argv[0]);
        return 1;
    }

    int mode_tokenize = strcmp(argv[1], "--tokenize") == 0;
    int mode_detokenize = strcmp(argv[1], "--detokenize") == 0;
    if (!mode_tokenize && !mode_detokenize) {
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

    if (mode_tokenize)
        tokenize_file(in, out);
    else
        detokenize_file(in, out);

    fclose(in);
    if (out != stdout) fclose(out);

    return 0;
}
