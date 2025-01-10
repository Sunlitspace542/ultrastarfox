	include	INC\header.inc
	include	INC\strathdr.inc
	include	EXT\gstrats.ext
	include	EXT\gastrats.ext
	include	EXT\pistrats.ext
	include	EXT\pstrats.ext	
	include	EXT\dstrats.ext	
	include	EXT\d2strats.ext
	include	EXT\d3strats.ext
	include	EXT\planets.ext
	include	EXT\expstrat.ext
	include	EXT\paths.ext
	include	EXT\bootnmi.ext

	bank	10
	incfile	STRAT\kstrats.asm
	incfile	STRAT\ga2strat.asm
	incfile	ASM\mem.asm

	public	black_holebgm
	public	black_holebgmlen
black_holebgm	incbinfile	snd\sgbgml.bin
black_holebgmlen	equ	*-black_holebgm
	bankend	10

	include	INC\tail.inc

