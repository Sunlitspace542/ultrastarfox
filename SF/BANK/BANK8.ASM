	include	INC\header.inc
	include	INC\strathdr.inc
	include	EXT\gstrats.ext
	include	EXT\gistrats.ext
	include	EXT\gcstrats.ext
	include	EXT\pistrats.ext
	include	EXT\pcstrats.ext
	include	EXT\pstrats.ext
	include	EXT\dstrats.ext
	include	EXT\ga2strats.ext
	include	EXT\expstrat.ext
	include	EXT\bootnmi.ext

	bank	8
	incfile	ASM\STRAT\gbstrats.asm
	incfile	ASM\STRAT\gastrats.asm

	public	bgmd
	public	bgmdlen
bgmd	incbinfile	snd\sgbgmd.bin
bgmdlen	equ	*-bgmd

	bankend	8

	include	INC\tail.inc


