	include	INCLUDE\header.inc
	include	INCLUDE\strathdr.inc
	include	gstrats.ext
	include	pstrats.ext
	include	paths.ext
	include	d2strats.ext
	include	d3strats.ext
	include	coltabs.ext
	include	expstrat.ext
	include	windows.ext
	include	bootnmi.ext

	bank	9
	incfile	dstrats.asm
	incfile	ga3strats.asm

	public	bgm11
	public	bgm11len
bgm11	incbinfile	snd\sgbgm11.bin
bgm11len	equ	*-bgm11

	bankend	9

	include	INCLUDE\tail.inc


