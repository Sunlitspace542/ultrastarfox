

	include	header.inc
	include	mapmacs.inc

	include	stratequ.inc
	include	mapstructs.inc
	include	strings.ext
	include	mario.ext
	include	dstrats.ext
	include	d2strats.ext
	include	d3strats.ext
	include	pstrats.ext
	include	pistrats.ext
	include	pcstrats.ext
	include	gb2strats.ext
	include	gstrats.ext
	include	gstrats2.ext
	include	gbstrats.ext
	include	gcstrats.ext
	include	gistrats.ext
	include	kstrats.ext
	include	ga2strats.ext
	include	ga3strats.ext
	include	gb3strats.ext
	include	gb4strats.ext
	include	shapes.ext
	include	stratrou.ext
	include	sgtabs.ext
	include	gastrats.ext
	include	main.ext
	include	bgs.ext
	include	paths.ext
	include	blink.ext
	include	sound.ext
	include	mdata.ext
	include	endseq.ext
	include	windows.ext
	include	expstrat.ext
	include	continue.ext
	include	trans.ext
	include	planets.ext
	include	draw.ext
	include	bgmacs.inc
	include	bootnmi.ext
real_istrats =	0
	include	istrats.asm


;------------------------------------------------------------------
	bank	5
	incfile	maps\maplist.asm

	public	bgandccr
	inccru	bgandccr,data\and.ccr
	bankend	5

	bank	6
	incfile	maps\maplist2.asm
	bankend	6
	
	bank	7
	incfile	maps\maplist3.asm
	bankend	7

	bank	8
	incfile	maps\maplist4.asm
	bankend	8
	
	bank	9
	incfile	maps\maplist5.asm
	bankend	9
	
;------------------------------------------------------------------
	include	tail.inc


