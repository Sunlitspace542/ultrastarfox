	include	INCLUDE\header.inc
	include	INCLUDE\strathdr.inc
	include	EXT\gstrats.ext
	include	EXT\pstrats.ext
	include	EXT\paths.ext
	include	EXT\d2strats.ext
	include	EXT\d3strats.ext
	include	EXT\coltabs.ext
	include	EXT\expstrat.ext
	include	EXT\windows.ext
	include	EXT\bootnmi.ext

	bank	9
	incfile	ASM\dstrats.asm
	incfile	ASM\ga3strats.asm

	public	bgm11
	public	bgm11len
bgm11	incbinfile	snd\sgbgm11.bin
bgm11len	equ	*-bgm11

	bankend	9

	include	INCLUDE\tail.inc


