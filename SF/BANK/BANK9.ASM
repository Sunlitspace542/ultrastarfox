	include	INC\header.inc
	include	INC\strathdr.inc
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
	incfile	STRAT\dstrats.asm
	incfile	STRAT\ga3strats.asm

	public	game_overbgm
	public	game_overbgmlen
game_overbgm	incbinfile	snd\sgbgm11.bin
game_overbgmlen	equ	*-game_overbgm

	bankend	9

	include	INC\tail.inc


