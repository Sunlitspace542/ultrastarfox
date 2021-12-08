	include	header.inc
	include	strathdr.inc
	include	gastrats.ext
	include	pstrats.ext
	include	strings.ext
	include	paths.ext
	include	pistrats.ext
	include	pcstrats.ext
	include	gb2strats.ext
	include	ga2strats.ext
	include	dstrats.ext
	include	shmacs.inc
	include	windows.ext
	include	bgmacs.inc
	include	maps\maplist.ext
	include	marioi.inc
	include	bootnmi.ext
	include	coltabs.ext
	include	debug.ext
	include	continue.ext
	incpublics	mhofs.ext

;------------------------------------------------------------------
	bank	10
	incfile	blink.asm
	incfile	gcstrats.asm
	incfile	expstrat.asm
cacheon	=	1
     	incfile	mmacs.mc
	mario	on
	incfile	mhofs.mc		;Kristers .mc files
	mario	off


	bankend	10

	bank	11
	incfile	gstrats.asm
	bankend	11

	bank	12
	incfile	gstrats2.asm
	bankend	12


	include	tail.inc



