	include	header.inc
	include	strathdr.inc
	include	gstrats.ext
	include	gastrats.ext
	include	pistrats.ext
	include	pstrats.ext	
	include	dstrats.ext	
	include	d2strats.ext
	include	d3strats.ext
	include	planets.ext
	include	expstrat.ext
	include	paths.ext
	include	bootnmi.ext

	bank	44
	incfile	ga2strats.asm
	incfile	mem.asm

	public	bgml
	public	bgmllen
bgml	incbinfile	snd\sgbgml.bin
bgmllen	equ	*-bgml
	bankend	44

	bank	45
	incfile	kstrats.asm
	bankend	45
	include	tail.inc

