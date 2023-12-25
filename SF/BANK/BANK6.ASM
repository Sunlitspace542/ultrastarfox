	include	INC\header.inc
	include	INC\strathdr.inc
	include	EXT\gastrats.ext
	include	EXT\pstrats.ext
	include	EXT\paths.ext
	include	EXT\pistrats.ext
	include	EXT\pcstrats.ext
	include	EXT\gb2strats.ext
	include	EXT\ga2strats.ext
	include	EXT\dstrats.ext
	include	INC\shmacs.inc
	include	EXT\windows.ext
	include	INC\bgmacs.inc
	include	maps\maplist.ext
	include	INC\marioi.inc
	include	EXT\bootnmi.ext
	

	incpublics	EXT\mhofs.ext

;------------------------------------------------------------------
	bank	6
	incfile	ASM\blink.asm
	incfile	STRAT\gcstrats.asm
	incfile	STRAT\expstrat.asm

     	incfile	MARIO\mmacs.mc
	mario	on
	incfile	MARIO\mhofs.mc		;Kristers .mc files
	mario	off


	bankend	6

	bank	33
	incfile	STRAT\gstrats.asm
	bankend	33

	include	INC\tail.inc



