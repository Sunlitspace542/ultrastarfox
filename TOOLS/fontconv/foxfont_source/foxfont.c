#include <stdio.h>
#include <stdlib.h> // fix by sunlit
#include <string.h>
#include "foxfont.h"


int main(int argc, char *argv[])
{
	if (argc < 2){
		printf("* " CLI_FILEDESCRIPTION_STR " " CLI_FILEVERSION_STR " *\n\n");
		printf("USAGE: foxfont 8bit_56x240_font.bmp\n");
		exit(EX_USAGE);
	}

	// create output filename
	char *outputFileName = createOutputFileName(argv[1]);

	// verify input bitmap, set file pointer fpBitmap to start of pixel data
	FILE * fpBitmap = openBitmap(argv[1]);

	// convert 8bit to 2bpp and save to disk
	convertBMP2Fon(fpBitmap, outputFileName);

	printf("PROGRAM ERROR: Foxfont ended unexpectedly.\n");
	exit(EX_SOFTWARE);
}

void convertBMP2Fon(FILE * fpBitmap, char * outputFileName)
{
	// ============================================
	// flip bitmap pixel data so it's easier to use
	// ============================================

	// create buffer that will have pixels in the right orientation
	char *pixBuff = (char *) malloc(BMPWDTH * BMPHGHT * sizeof(*pixBuff));

	// create pointer to bottom row of pixBuff
	char *pixBuffPtr = pixBuff + (BMPWDTH * BMPHGHT) - BMPWDTH;

	for (int tmp = 0; tmp < BMPHGHT; tmp++) {
		fread(pixBuffPtr, 1, BMPWDTH, fpBitmap);	// copy a row from bottom of bmp to bottom of pixBuff
		pixBuffPtr -= BMPWDTH;						// set pointer to next row of pixels (descending)
	}
	fclose(fpBitmap);

	// =================================================
	// convert 8bit pixel buffer into 2bpp output buffer
	// =================================================

	// create 2bpp buffer, zero filled
	char *outBuff = (char *) calloc((BMPWDTH * BMPHGHT / 4), sizeof(*outBuff)); // fix by Sunlit

	// make some pointers we can mess with
	char *outBuffPtr = outBuff;
	pixBuffPtr = pixBuff;							// reset pixBuffPtr

	// convert 20 rows of tiles from pixBuff to outBuff
	for (int bmpRow = 0; bmpRow < (BMPHGHT / TILEHGHT); bmpRow++) {
		// draw 7 tiles (columns) per row in bitmap
		for (int tile = 0; tile < (BMPWDTH / TILEWDTH); tile++) {
			// draw 8 rows of pixels of the tile
			for (int row = 0; row < TILEHGHT; row++) {
				// draw one row of pixels of the tile
				for (int shift = 7; shift >= 0; shift--) {
					*outBuffPtr       |= (*pixBuffPtr & 0x01) << shift;
					*(outBuffPtr + 1) |= ((*pixBuffPtr & 0x02) >> 1) << shift;
					pixBuffPtr++;
				}
				outBuffPtr += 2;
				pixBuffPtr += BMPWDTH - TILEWDTH;
			}
			// set pointer to beginning of next tile
			pixBuffPtr -= (BMPWDTH * TILEHGHT) - TILEWDTH;
		}
		// set pointer to next row of tiles in the bitmap
		pixBuffPtr += BMPWDTH * (TILEHGHT - 1);
	}
	#ifdef DEBUG
	if (pixBuffPtr != pixBuff + BMPWDTH * BMPHGHT) {
		printf("DEBUG ERROR: pixBuffPtr off by %d\n", pixBuffPtr - (pixBuff + BMPWDTH * BMPHGHT));
		free(pixBuff);
		exit(EX_SOFTWARE);
	}
	#endif

	free(pixBuff);

	// open 2bpp output file
	FILE *fpFont;
	if ((fpFont = fopen(outputFileName, "wb")) == NULL) {
		printf("ERROR: Cannot create file \"%s\" for saving.\n", outputFileName);
		exit(EX_CANTCREAT);
	}

	// =====================
	// calculate font widths
	// =====================
	outBuffPtr = outBuff;						// reset pointer to beginning of 2bpp buffer
	char twoBppRowH, twoBppRowL;				// holds the pixels of each character
	int shift;									// stores the width of individual characters

	// process 140 tiles
	for(int tile = 0; tile < TILESMAX; tile++) {
		twoBppRowH = 0, twoBppRowL = 0;
		
		// each tile has 12 rows of pixels, logical OR all rows into a byte to get width
		for(int row = 0; row < TILEHGHT; row++) {
			twoBppRowL |= *outBuffPtr;			// colors 0 and 1 (transparent and extra pixels)
			twoBppRowH |= *(outBuffPtr + 1);	// colors 2 and 3 (main font color and ?)
			outBuffPtr += 2;
		}
		if(twoBppRowL == 0) {
			// if pixels are main font
			for(shift = TILEWDTH + 1; shift > 0; shift--) {
				if(shift == 1) {				// empty tile
					shift = EMPTYTILE;
					break;
				}
				if(twoBppRowH & 0x01) {			// test if rightmost pixel is blank or filled
					break;
				}
				twoBppRowH = twoBppRowH >> 1;	// remove 1 blank pixel from the right
			}
		} else {
			// if character is wider than 8
			for(shift = TILEWDTH + 1; shift > 0; shift--) {
				if(twoBppRowL & 0x01) {			// test if rightmost pixel is blank or filled
					break;
				}
				twoBppRowL = twoBppRowL >> 1;	// remove 1 blank pixel from the right
			}
			shift += TILEWDTH;
		}
		fwrite(&shift, 1, 1, fpFont);
	}
	#ifdef DEBUG
	if (outBuffPtr != outBuff + BMPWDTH * BMPHGHT / 4) {
		printf("DEBUG ERROR: outBuffPtr off by %d\n", outBuffPtr - (outBuff + BMPWDTH * BMPHGHT / 4));
		fclose(fpFont);
		free(outBuff);
		exit(EX_SOFTWARE);
	}
	#endif


	// save 2bpp outBuff to output file
	fwrite(outBuff, 1, BMPWDTH * BMPHGHT / 4, fpFont);
	fclose(fpFont);

	// don't need output buffer anymore
	free(outBuff);

	printf("Foxfont done, output: %s\n", outputFileName);

	exit(EX_OK);
}

FILE * openBitmap(char *fileName)
{
	// ==============================================
	// open fileName and verify bmp header data
	// return file pointer to beginning of pixel data
	// ==============================================
	static FILE *fpBitmap;

	if ((fpBitmap = fopen(fileName, "rb")) == NULL)	{
		printf("ERROR: Cannot open input image file \"%s\"\n", fileName);
		exit(EX_NOINPUT);
	}

	// get filesize for error detection
	fseek(fpBitmap, 0, SEEK_END);
	int fileSize = ftell(fpBitmap);
	fseek(fpBitmap, 0, SEEK_SET);

	BMP_FILE_HEADER bmp_header;

	fread(&bmp_header.type, 2, 1, fpBitmap);
	fread(&bmp_header.file_size, 4, 1, fpBitmap);
	fread(&bmp_header.reserved1, 2, 2, fpBitmap);		// reserved1 and reserved2
	fread(&bmp_header.offset, 4, 1, fpBitmap);
	fread(&bmp_header.header_size, 4, 1, fpBitmap);
	fread(&bmp_header.width, 4, 1, fpBitmap);
	fread(&bmp_header.height, 4, 1, fpBitmap);
	fread(&bmp_header.planes, 2, 1, fpBitmap);
	fread(&bmp_header.bits, 2, 1, fpBitmap);
	fread(&bmp_header.compression, 4, 1, fpBitmap);
	fread(&bmp_header.imagesize, 4, 1, fpBitmap);
	fread(&bmp_header.xresolution, 4, 2, fpBitmap);		// xresolution and yresolution
	fread(&bmp_header.ncolors, 4, 1, fpBitmap);
	fread(&bmp_header.importantcolors, 4, 1, fpBitmap);

	if (bmp_header.type != 0x4D42) {
		printf("ERROR: \"%s\" does not appear to be a bitmap image.\n", fileName);
		fclose(fpBitmap);
		exit(EX_DATAERR);
	}

	if (fileSize != bmp_header.file_size) {
		printf("ERROR: \"%s\" file size does not match internal header file size.\n", fileName);
		fclose(fpBitmap);
		exit(EX_DATAERR);
	}

	if (fileSize < bmp_header.offset + BMPWDTH*BMPHGHT) {
		printf("ERROR: \"%s\" file too small to hold %dx%d font data.\n", fileName, BMPWDTH, BMPHGHT);
		fclose(fpBitmap);
		exit(EX_DATAERR);
	}

	if (bmp_header.bits != BMPBITS) {
		printf("ERROR: bitmap must be indexed %dbit color.\n", BMPBITS);
		fclose(fpBitmap);
		exit(EX_DATAERR);
	}

	if ((bmp_header.width != BMPWDTH) || (bmp_header.height != BMPHGHT)) {
		printf("ERROR: bitmap must be %d pixels wide by %d pixels tall.\n", BMPWDTH, BMPHGHT);
		fclose(fpBitmap);
		exit(EX_DATAERR);
	}

	if (bmp_header.compression != 0) {
		printf("ERROR: \"%s\" appears to be a compressed bitmap, no compression plz.\n", fileName);
		fclose(fpBitmap);
		exit(EX_DATAERR);
	}

	if (!bmp_header.ncolors) {
		bmp_header.ncolors = 256;
		bmp_header.importantcolors = 256;
	}

	//if (bmp_header.ncolors > 4)
	//	printf("NOTICE: bitmap has %d colors, using first 4 only.\n", bmp_header.ncolors);

	// skip reading the palette
	fseek(fpBitmap, bmp_header.ncolors * 4, SEEK_CUR);

	// after the palette is the pixel data, this should match .offset
	if (ftell(fpBitmap) != bmp_header.offset) {
		printf("NOTICE: bitmap header offset value does not match pixel start address.\n");
		fseek(fpBitmap, bmp_header.offset, SEEK_SET);
	}

	return fpBitmap;
}

char * createOutputFileName(char * inputFileName)
{
	// length of fileName without the .bmp extension
	#define NOEXTLEN	(strlen(inputFileName) - EXT_LEN)

	static char outputFileName[MAX_PATH + 1] = {0};			// MAX_PATH + null termination

	if (strlen(inputFileName) > MAX_PATH) {
		printf("ERROR: Input file name is longer than %d characters.\n", MAX_PATH);
		exit(EX_NOINPUT);
	}

	// create pointer to last 4 characters of input file
	char *inputExt = inputFileName + NOEXTLEN;

	// verify that input file's extension is ".bmp"
	if (strncmp(inputExt, EXT_BMP, EXT_LEN)) {
		printf("ERROR: Input file must have %s extension.\n", EXT_BMP);
		exit(EX_DATAERR);
	}

	// copy input filename without null termination
	strncpy(outputFileName, inputFileName, NOEXTLEN);

	// add .fon extension to outputFileName
	strncpy(outputFileName + NOEXTLEN, EXT_FON, EXT_LEN);

	if (strlen(inputFileName) != strlen(outputFileName)) {
		printf("PROGRAM ERROR: outputFileName is different length than inputFileName\n");
		exit(EX_SOFTWARE);
	}

	return outputFileName;
}
