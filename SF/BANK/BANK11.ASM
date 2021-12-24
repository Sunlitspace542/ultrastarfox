	include	INCLUDE\header.inc
	include	INCLUDE\strathdr.inc
	include	EXT\gstrats.ext
	include	EXT\gcstrats.ext
	include	EXT\gistrats.ext
	include	EXT\gastrats.ext
	include	EXT\expstrat.ext
	include	EXT\windows.ext
	include	EXT\ga2strats.ext
	include	EXT\dstrats.ext
	include	EXT\bootnmi.ext

	; admittedly, this is probably really dumb.
	; probably should just move gb2 here for good or something instead.

	bank	11
	incfile	ASM\pistrats.asm
	incfile	ASM\pcstrats.asm
	incfile	ASM\pstrats.asm
	bankend	11

	bank	40
	incfile	ASM\gb2strats.asm
	bankend 40

	include	INCLUDE\tail.inc


