// -------- executable information -------- //

#define VER_FILEVERSION				0,1,0,0
#define VER_FILEVERSION_STR			"0,1,0,0"
#define CLI_FILEVERSION_STR			"v0.1.0a"
#define CLI_FILEDESCRIPTION_STR		"StarFox mugshot scrambler"

#define DEBUG
#define PRIVATE
#define VER_PRIVATEBUILD_STR		"Next Generation"

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

#define EXT_CGX		".cgx"					// should just be ".cgx"
#define EXT_SCR		"-SCRAMBLED"			// adds this before the extension

#define MAX_PATH	260						// max characters for a filename

#define TILEWDTH	8
#define TILEHGHT	8
#define TILESIZE	(TILEWDTH * TILEHGHT / 2)
#define MUGWDTH		4
#define MUGHGHT		5
#define MUGSIZE		(TILESIZE * MUGWDTH * MUGHGHT)

// -------- function declarations --------- //

FILE * openSnes(char *fileName);
char * createOutputFileName(char *);
void convertHoriz2Vert(FILE *, char *);

