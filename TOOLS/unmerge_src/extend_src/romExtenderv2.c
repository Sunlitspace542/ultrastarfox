/*romExtender V2*/
/*Usage example: 
romExtender SF.ROM 16 FF*/

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]) {
    if (argc != 4) {
        printf("ROM Extender V2.0\nUsage: %s <romFile> <Padded size in MBits> <Fill Byte>\n8 Mbits = 1Mbyte, 16Mbits = 2Mbytes...\n", argv[0]);
        return 1;
    }

    const char* romFile = argv[1];
	const char* megaBits = argv[2];
	const char* padByte = argv[3];
    FILE* currentFile = fopen(romFile, "rb");

	int maxSize = atoi(megaBits) * 0x20000;
	long int actualPadByte = strtol(padByte, NULL, 16);

    if (currentFile == NULL) {
        fprintf(stderr, "Error opening file");
        return 1;
    } else if (strtol(padByte, NULL, 16) > 0xff) {
		fprintf(stderr, "Error: Pad byte too large");
        return 1;
	} 

    fseek(currentFile, 0, SEEK_END);
    long romFileSize = ftell(currentFile);
    fseek(currentFile, 0, SEEK_SET);

    if (romFileSize < maxSize) {
        long zeroFillAmt = maxSize - romFileSize;

        // Allocate memory for the ROM data
        char* romData = (char*)malloc(maxSize);

        if (romData == NULL) {
            fclose(currentFile);
            fprintf(stderr, "Error allocating memory");
            return 1;
        }

        // Read the existing ROM data
        fread(romData, 1, romFileSize, currentFile);
        fclose(currentFile);

        // Fill the remaining space with zeros
        for (long i = romFileSize; i < maxSize; i++) {
            romData[i] = actualPadByte;
        }

        // Write the modified ROM data back to the file
        currentFile = fopen(romFile, "wb");
        if (currentFile == NULL) {
           fprintf(stderr, "Error opening file for writing");
            free(romData);
            return 1;
        }

        fwrite(romData, 1, maxSize, currentFile);
        fclose(currentFile);
        free(romData);

        printf("ROM successfully expanded to %s Mbits.\nAdded %ld %lxs to ROM.\n", megaBits, zeroFillAmt, actualPadByte);
    } else {
        fclose(currentFile);
        printf("Nothing to do for %s\n", romFile);
    }

    return 0;
}
