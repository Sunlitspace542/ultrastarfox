	include	INCLUDE\header.inc
	include	INCLUDE\strathdr.inc
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

	bank	10
	incfile	kstrats.asm
	incfile	ga2strats.asm
	incfile	mem.asm

	public	bgml
	public	bgmllen
bgml	incbinfile	snd\sgbgml.bin
bgmllen	equ	*-bgml
	bankend	10

	include	INCLUDE\tail.inc

