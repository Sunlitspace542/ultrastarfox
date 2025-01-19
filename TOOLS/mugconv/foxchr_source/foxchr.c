#include <stdio.h>
#include <stdlib.h>
#include "foxchr.h"


int main(int argc, char *argv[])
{
	if (argc < 2){
		printf("* " CLI_FILEDESCRIPTION_STR " " CLI_FILEVERSION_STR " *\n\n");
		printf("USAGE: foxchr graphics.cgx\n");
		exit(EX_USAGE);
	}

	// create output filename
	char *outputFileName = createOutputFileName(argv[1]);

	// verify input file size, create file pointer
	FILE * fpInput = openSnes(argv[1]);

	// convert horizontal format to vertical format and save to disk
	convertHoriz2Vert(fpInput, outputFileName);

	printf("PROGRAM ERROR: Foxchr ended unexpectedly.\n");
	exit(EX_SOFTWARE);
}

void convertHoriz2Vert(FILE * fpInput, char * outputFileName)
{
	int fileSize = ftell(fpInput);
	fseek(fpInput, 0, SEEK_SET);

	// determine how many mugshots there are
	int mugShotCnt = fileSize / MUGSIZE;

	// create input buffer, and a pointer that we can mangle
	char *inBuff = malloc(fileSize * sizeof(*inBuff));
	char *inBuffPtr = inBuff;

	// copy graphics from disk to buffer
	fread(inBuff, 1, fileSize, fpInput);
	fclose(fpInput);

	// create 4bpp output buffer, zero filled, and pointer to mangle
	char *outBuff = calloc(fileSize, sizeof(*outBuff));
	char *outBuffPtr = outBuff;

	#define NEXTTILEDOWN (TILESIZE * MUGWDTH * mugShotCnt)

	for (int mugShot = 0; mugShot < mugShotCnt; mugShot++) {
		// copy a single 4x5 tile mugshot
		for (int outCol = 0; outCol < MUGWDTH; outCol++) {
			// copy a single 5 tile column to the output
			for (int outTile = 0; outTile < MUGHGHT; outTile++) {
				// copy 1 tile
				memcpy(outBuffPtr, inBuffPtr, TILESIZE);
				inBuffPtr += NEXTTILEDOWN;
				outBuffPtr += TILESIZE;
			}
			inBuffPtr -= MUGSIZE * mugShotCnt - TILESIZE;
		}
	}

	#ifdef DEBUG
	if (inBuffPtr != inBuff + NEXTTILEDOWN) {
		printf("DEBUG ERROR: inBuffPtr off by %d\n", inBuffPtr - (inBuff + NEXTTILEDOWN));
		free(inBuff);
		free(outBuff);
		exit(EX_SOFTWARE);
	}
	#endif

	// open 4bpp output file
	FILE *fpOut;
	if ((fpOut = fopen(outputFileName, "wb")) == NULL) {
		printf("ERROR: Cannot create file \"%s\" for saving.\n", outputFileName);
		exit(EX_CANTCREAT);
	}

	// save 4bpp outBuff to output file
	fwrite(outBuff, 1, fileSize, fpOut);
	fclose(fpOut);

	// don't need output buffers anymore
	free(inBuff);
	free(outBuff);

	printf("Foxchr done, output: %s\n", outputFileName);

	exit(EX_OK);
}

FILE * openSnes(char *fileName)
{
	// ==================================
	// open fileName and verify file size
	// return file pointer
	// ==================================
	static FILE *fpInput;

	if ((fpInput = fopen(fileName, "rb")) == NULL)	{
		printf("ERROR: Cannot open input .cgx file \"%s\"\n", fileName);
		exit(EX_NOINPUT);
	}

	// get file size for error detection
	fseek(fpInput, 0, SEEK_END);
	int fileSize = ftell(fpInput);

	if (fileSize > 0x10000) {
		printf("ERROR: \"%s\" file size is larger than 64KB.\n", fileName);
		fclose(fpInput);
		exit(EX_DATAERR);
	}

	if (fileSize < MUGSIZE) {
		printf("ERROR: \"%s\" file size must at least %d bytes.\n", fileName, MUGSIZE);
		fclose(fpInput);
		exit(EX_DATAERR);
	}

	if (fileSize & 0x1F) {
		printf("ERROR: \"%s\" file size must be a multiple of 32 bytes.\n", fileName);
		fclose(fpInput);
		exit(EX_DATAERR);
	}

	return fpInput;
}

char * createOutputFileName(char * inputFileName)
{
	// =============================================
	// check file size to make sure it's not too big
	// and that it's 8x8 snes 4bpp tiles
	// =============================================
	static char outputFileName[MAX_PATH + 1] = {0};			// MAX_PATH + null termination

	if ((strlen(inputFileName) + strlen(EXT_SCR)) > MAX_PATH) {
		printf("ERROR: Output file name is longer than %d characters.\n", MAX_PATH);
		exit(EX_CANTCREAT);
	}

	// length of fileName without the .cgx extension
	#define NOEXTLEN	(strlen(inputFileName) - strlen(EXT_CGX))

	// copy input filename without null termination
	strncpy(outputFileName, inputFileName, NOEXTLEN);

	// add -SCRAMBLED to filename
	strncpy(outputFileName + NOEXTLEN, EXT_SCR, strlen(EXT_SCR));

	// add .cgx extension to outputFileName
	strncpy(outputFileName + NOEXTLEN + strlen(EXT_SCR), EXT_CGX, strlen(EXT_CGX));

	if (strlen(inputFileName) != strlen(outputFileName) - strlen(EXT_SCR)) {
		printf("PROGRAM ERROR: outputFileName is different length than inputFileName\n");
		exit(EX_SOFTWARE);
	}

	return outputFileName;
}
