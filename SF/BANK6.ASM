	include	INCLUDE\header.inc
	include	INCLUDE\strathdr.inc
	include	gastrats.ext
	include	pstrats.ext
	include	paths.ext
	include	pistrats.ext
	include	pcstrats.ext
	include	gb2strats.ext
	include	ga2strats.ext
	include	dstrats.ext
	include	INCLUDE\shmacs.inc
	include	windows.ext
	include	INCLUDE\bgmacs.inc
	include	maps\maplist.ext
	include	INCLUDE\marioi.inc
	include	bootnmi.ext
	

	incpublics	mhofs.ext

;------------------------------------------------------------------
	bank	6
	incfile	blink.asm
	incfile	gcstrats.asm
	incfile	expstrat.asm

cacheon	=	1
     	incfile	MARIO\mmacs.mc
	mario	on
	incfile	MARIO\mhofs.mc		;Kristers .mc files
	mario	off


	bankend	6

	bank	33
	incfile	gstrats.asm
	bankend	33

	include	INCLUDE\tail.inc



