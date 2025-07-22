// Tool to decode Argonaut .MAP linker address map files into a usable symbol listing (C version)
// To use:
// argonautmapdecoder [.map file] [output file]
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Option for more detailed output
//#define	VERBOSE

void decode_byte_sequence(unsigned char *byte_seq, FILE *output) {
    // Extract address in little endian format
    unsigned int address = byte_seq[0] | (byte_seq[1] << 8) | (byte_seq[2] << 16) | (byte_seq[3] << 24);

    // Extract length of symbol name
    unsigned char name_length = byte_seq[4];

    // Extract symbol name
    char symbol_name[name_length + 1];
    memcpy(symbol_name, byte_seq + 5, name_length);
    symbol_name[name_length] = '\0';

	#ifdef	VERBOSE
    fprintf(output, "Address: $%x, Name Length: $%x, Symbol Name: %s\n", address, name_length, symbol_name);
	#else
    fprintf(output, "%s\t$%08x\n", symbol_name, address);
	#endif
}

void read_byte_sequences_from_file(const char *file_path, const char *output_file) {
    FILE *file = fopen(file_path, "rb");
    if (file == NULL) {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }

    // Skip until "SM32" is found
    unsigned char buffer[4];
    while (fread(buffer, 1, 4, file) == 4) {
        if (buffer[0] == 'S' && buffer[1] == 'M' && buffer[2] == '3' && buffer[3] == '2') {
            fseek(file, 2, SEEK_CUR);  // Skip 2 bytes after "SM32"
            break;
        }
    }

    // Begin decoding byte sequences
    FILE *output = fopen(output_file, "w");
    if (output == NULL) {
        perror("Error opening output file");
        fclose(file);
        exit(EXIT_FAILURE);
    }

    unsigned char byte_seq[256];  // Assuming max length of byte sequence is 256
    while (fread(byte_seq, 1, 5, file) == 5) {
        unsigned char name_length = byte_seq[4];
        fread(byte_seq + 5, 1, name_length, file);  // Read the symbol name
        decode_byte_sequence(byte_seq, output);
    }

    fclose(output);
    fclose(file);
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Argonaut Software .MAP file decoder\nDecodes Argonaut .MAP linker address map files into a usable symbol listing\nUsage: %s <.MAP file> <output file>\n", argv[0]);
        return EXIT_FAILURE;
    }

    read_byte_sequences_from_file(argv[1], argv[2]);

    return EXIT_SUCCESS;
}
