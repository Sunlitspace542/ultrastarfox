	include	header.inc
	include	strathdr.inc
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
	include	paths.ext
	bank	38
	incfile	gbstrats.asm


	public	bgmd
	public	bgmdlen
bgmd	incbinfile	snd\sgbgmd.bin
bgmdlen	equ	*-bgmd

	bankend	38

	bank	39
	incfile	gastrats.asm
	bankend	39	
	include	tail.inc


