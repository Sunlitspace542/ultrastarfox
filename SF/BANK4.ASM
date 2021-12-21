
	include	INCLUDE\header.inc
	include	INCLUDE\strathdr.inc
	include	INCLUDE\bgmacs.inc

	include	gstrats.ext
	include	pstrats.ext
	include	dstrats.ext
	include	d3strats.ext
	include	incbins.ext
	include	fontdata.ext
	include	bgs.ext
	include	planets.ext
	include	ramstuff.ext
	include	irq.ext
	include	bootnmi.ext
	include	mdata.ext
	include	expstrat.ext
	include	gastrats.ext
	include	ga2strat.ext
	include	continue.ext
	include	coltabs.ext
	include	mem.ext
	include	kstrats.ext

;------------------------------------------------------------------
	bank	4
	incfile	paths.asm
	incfile	d2strats.asm
	bankend	4
;------------------------------------------------------------------


	include	INCLUDE\tail.inc



