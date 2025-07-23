	include	INC\header.inc
	include	INC\strathdr.inc
	include	EXT\gstrats.ext
	include	EXT\gcstrats.ext
	include	EXT\gistrats.ext
	include	EXT\gastrats.ext
	include	EXT\expstrat.ext
	include	EXT\windows.ext
	include	EXT\ga2strat.ext
	include	EXT\dstrats.ext
	include	EXT\bootnmi.ext

	bank	11
	IFNE	RUMBLE
	; used by both PCSTRATS and PISTRATS
hyperspacerumbletab
	db	$FF,$7F,rmblloop
	ENDC
	incfile	STRAT\pistrats.asm
	incfile	STRAT\pcstrats.asm
	incfile	STRAT\pstrats.asm
	incfile	ASM\strings.asm
	bankend	11

	bank	40
	incfile	STRAT\gb2strat.asm
	bankend	40

	include	INC\tail.inc


