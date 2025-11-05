#include <stdio.h>
#include <string.h>

#define ESCAPE_CHAR '\033'

// Function to replace \033 with the actual escape character
void process_escape_sequences(char *input, char *output) {
    while (*input) {
        // Check for "\033"
        if (*input == '\\' && *(input + 1) == '0' && *(input + 2) == '3' && *(input + 3) == '3') {
            *output = ESCAPE_CHAR; // Replace with the escape character
            input += 4;            // Skip over "\033"
        } else {
            *output = *input;      // Copy other characters as is
            input++;
        }
        output++;
    }
    *output = '\0'; // Null-terminate the output string
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Usage: %s <input_string>\n", argv[0]);
        return 1;
    }

    char processed_string[1024]; // Buffer for processed string
    process_escape_sequences(argv[1], processed_string);

    // Print the processed string
    printf("%s\n", processed_string);

    return 0;
}
