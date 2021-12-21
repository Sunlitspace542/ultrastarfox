	include	INCLUDE\header.inc
	include	INCLUDE\strathdr.inc
	include	gstrats.ext
	include	gistrats.ext
	include	gcstrats.ext
	include	pistrats.ext
	include	pcstrats.ext
	include	pstrats.ext
	include	dstrats.ext
	include	ga2strats.ext
	include	expstrat.ext
	include	bootnmi.ext

	bank	8
	incfile	gbstrats.asm
	incfile	gastrats.asm

	public	bgmd
	public	bgmdlen
bgmd	incbinfile	snd\sgbgmd.bin
bgmdlen	equ	*-bgmd

	bankend	8

	include	INCLUDE\tail.inc


