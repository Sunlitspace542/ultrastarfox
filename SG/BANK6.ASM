	include	header.inc
	include	strathdr.inc
	include	gastrats.ext
	include	pstrats.ext
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
	

	incpublics	mhofs.ext

;------------------------------------------------------------------
	bank	6
	incfile	blink.asm
	incfile	gcstrats.asm
	incfile	expstrat.asm

cacheon	=	1
     	incfile	mmacs.mc
	mario	on
	incfile	mhofs.mc		;Kristers .mc files
	mario	off


	bankend	6

	bank	33
	incfile	gstrats.asm
	bankend	33

	include	tail.inc



