#include <stdio.h>
#include <stdlib.h>

// this is specifically for building on DOS with Zortech Make -- if we ever switch to a native-based or otherwise more modern toolchain in the future, this will be rendered obsolete

void copyData(FILE *source, FILE *destination, long startOffset, long endOffset) {
    fseek(source, startOffset, SEEK_SET);  // Move to the start offset
    size_t dataSize = (size_t)(endOffset - startOffset);
    char *buffer = (char *)malloc(dataSize);
    
    if (buffer == NULL) {
        fprintf(stderr, "Memory allocation failed\n");
        exit(EXIT_FAILURE);
    }

    fread(buffer, 1, dataSize, source);    // Read data from source file
    fwrite(buffer, 1, dataSize, destination);  // Write data to destination file

    free(buffer);
}

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <file_name> <start_offset> <end_offset>\n", argv[0]);
        return EXIT_FAILURE;
    }

    char *fileName = argv[1];
    long startOffset = strtol(argv[2], NULL, 10) * 32;
    long endOffset = strtol(argv[3], NULL, 10) * 32;

    FILE *sourceFile = fopen(fileName, "rb");
    if (sourceFile == NULL) {
        fprintf(stderr, "Error opening file: %s\n", fileName);
        return EXIT_FAILURE;
    }

    FILE *destinationFile = fopen("col.tmp", "wb");
    if (destinationFile == NULL) {
        fprintf(stderr, "Error creating output file: col.tmp\n");
        fclose(sourceFile);
        return EXIT_FAILURE;
    }

    copyData(sourceFile, destinationFile, startOffset, endOffset);

    fclose(sourceFile);
    fclose(destinationFile);

    // Execute commands from MC.BAT internally so Zortech Make can actually catch errors
    if (system("copy /b allcols.col col2.tmp") != 0) {
        fprintf(stderr, "Error executing: copy /b allcols.col col2.tmp\n");
        return EXIT_FAILURE;
    }

    if (system("copy /b col2.tmp+col.tmp allcols.col") != 0) {
        fprintf(stderr, "Error executing: copy /b col2.tmp+col.tmp allcols.col\n");
        return EXIT_FAILURE;
    }

    printf("%s stripped successfully.\n", argv[1]);

    return EXIT_SUCCESS;
}
