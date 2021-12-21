	include	INCLUDE\header.inc
	include	INCLUDE\strathdr.inc
	include	EXT\gastrats.ext
	include	EXT\pstrats.ext
	include	EXT\paths.ext
	include	EXT\pistrats.ext
	include	EXT\pcstrats.ext
	include	EXT\gb2strats.ext
	include	EXT\ga2strats.ext
	include	EXT\dstrats.ext
	include	INCLUDE\shmacs.inc
	include	EXT\windows.ext
	include	INCLUDE\bgmacs.inc
	include	maps\maplist.ext
	include	INCLUDE\marioi.inc
	include	EXT\bootnmi.ext
	

	incpublics	EXT\mhofs.ext

;------------------------------------------------------------------
	bank	6
	incfile	ASM\blink.asm
	incfile	ASM\gcstrats.asm
	incfile	ASM\expstrat.asm

cacheon	=	1
     	incfile	MARIO\mmacs.mc
	mario	on
	incfile	MARIO\mhofs.mc		;Kristers .mc files
	mario	off


	bankend	6

	bank	33
	incfile	ASM\gstrats.asm
	bankend	33

	include	INCLUDE\tail.inc



