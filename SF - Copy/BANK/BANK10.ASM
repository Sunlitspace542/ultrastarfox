	include	INCLUDE\header.inc
	include	INCLUDE\strathdr.inc
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
	incfile	ASM\kstrats.asm
	incfile	ASM\ga2strats.asm
	incfile	ASM\mem.asm

	public	bgml
	public	bgmllen
bgml	incbinfile	snd\sgbgml.bin
bgmllen	equ	*-bgml
	bankend	10

	include	INCLUDE\tail.inc

