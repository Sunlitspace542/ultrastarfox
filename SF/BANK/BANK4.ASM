
	include	INC\header.inc
	include	INC\strathdr.inc
	include	INC\bgmacs.inc

	include	EXT\gstrats.ext
	include	EXT\pstrats.ext
	include	EXT\dstrats.ext
	include	EXT\d3strats.ext
	include	EXT\incbins.ext
	include	EXT\fontdata.ext
	include	EXT\bgs.ext
	include	EXT\planets.ext
	include	EXT\ramstuff.ext
	include	EXT\irq.ext
	include	EXT\bootnmi.ext
	include	EXT\mdata.ext
	include	EXT\expstrat.ext
	include	EXT\gastrats.ext
	include	EXT\ga2strat.ext
	include	EXT\continue.ext
	include	EXT\coltabs.ext
	include	EXT\mem.ext
	include	EXT\msu.ext
	include	EXT\kstrats.ext

;------------------------------------------------------------------
	bank	4
	incfile	PATH\paths.asm
	incfile	STRAT\d2strats.asm
	bankend	4
;------------------------------------------------------------------


	include	INC\tail.inc



