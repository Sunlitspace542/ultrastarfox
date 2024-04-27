// -------- executable information -------- //

#define VER_FILEVERSION				0,3,0,0
#define VER_FILEVERSION_STR			"0,3,0,0"
#define CLI_FILEVERSION_STR			"v0.3.0b"
#define CLI_FILEDESCRIPTION_STR		"StarFox 8x12 font converter"

//#define DEBUG
#define PRIVATE
#define VER_PRIVATEBUILD_STR		"Exploration Project"

// common exit codes I found:
/* Copyright (c) 1987, 1993
 *      The Regents of the University of California.  All rights reserved.
 */
#define EX_OK						0		/* successful termination */
#define EX_USAGE					64		/* command line usage error */
#define EX_DATAERR					65		/* data format error */
#define EX_NOINPUT					66		/* cannot open input */
#define EX_UNAVAILABLE				69		/* service unavailable */
#define EX_SOFTWARE					70		/* internal software error */
#define EX_CANTCREAT				73		/* can't create (user) output file */

// ------------ file constants ------------ //

#define EXT_FON		".fon"					// should just be ".fon"
#define EXT_BMP		".bmp"					// should just be ".bmp"
#define EXT_LEN		4						// 3 character extension plus the period
#define MAX_PATH	260						// max characters for a filename

#define TILEWDTH	8
#define TILEHGHT	12
#define BMPWDTH		56
#define BMPHGHT		240
#define BMPBITS		8						// bitmap must be 8bit
#define TILESMAX	((BMPWDTH / TILEWDTH) * (BMPHGHT / TILEHGHT))
#define EMPTYTILE	5						// how wide the empty 'space' tile is

// -------- function declarations --------- //

FILE * openBitmap(char *fileName);
char * createOutputFileName(char *);
void convertBMP2Fon(FILE *, char *);

// -------- bitmap file structure --------- //

typedef struct {
	unsigned short type;
	unsigned short padding;					// padding keeps this struct int aligned
	unsigned int file_size;
	unsigned short reserved1, reserved2;
	unsigned int offset;
	unsigned int header_size;
	int width, height;
	unsigned short planes;
	unsigned short bits;
	unsigned int compression;
	unsigned int imagesize;
	int xresolution, yresolution;
	unsigned int ncolors;
	unsigned int importantcolors;
} BMP_FILE_HEADER;
