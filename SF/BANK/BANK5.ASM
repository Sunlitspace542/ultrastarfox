

	include	INC\header.inc
	include	INC\mapmacs.inc

	include	INC\stratequ.inc
	include	INC\mapstruc.inc
	include	EXT\strings.ext
	include	EXT\mario.ext
	include	EXT\dstrats.ext
	include	EXT\d2strats.ext
	include	EXT\d3strats.ext
	include	EXT\pstrats.ext
	include	EXT\pistrats.ext
	include	EXT\pcstrats.ext
	include	EXT\gb2strat.ext
	include	EXT\gstrats.ext
	include	EXT\gbstrats.ext
	include	EXT\gcstrats.ext
	include	EXT\gistrats.ext
	include	EXT\kstrats.ext
	include	EXT\ga2strat.ext
	include	EXT\ga3strat.ext
	include	EXT\gb3strat.ext
	include	EXT\shapes.ext
	include	EXT\stratrou.ext
	include	EXT\sgtabs.ext
	include	EXT\gastrats.ext
	include	EXT\main.ext
	include	EXT\bgs.ext
	include	EXT\paths.ext
	;include	EXT\blink.ext
	include	EXT\sound.ext
	include	EXT\mdata.ext
	include	EXT\endseq.ext
	include	EXT\windows.ext
	include	EXT\expstrat.ext
	include	EXT\continue.ext
	include	EXT\trans.ext
	include	INC\bgmacs.inc
	include	EXT\bootnmi.ext



real_istrats =	0
	include	STRAT\istrats.asm


;------------------------------------------------------------------
	bank	5
	incfile	maps\maplist.asm

	public	bgandccr
	inccru	bgandccr,data\and.ccr


	bankend	5
;------------------------------------------------------------------
	bank	13
	incfile	maps\maplist2.asm

	bankend	13
;------------------------------------------------------------------

	bank	39
	incfile	maps\maplist3.asm
	bankend	39


	include	INC\tail.inc


