	include	header.inc
	include	marioi.inc
	include	stratmac.inc
	include	stratlib.inc
	include	bgmacs.inc
	include	blink.ext
	include	check5.ext
	include	mapstructs.inc
	include	mapmacs.inc
	include	shmacs.inc
	include	strings.ext
	include	mario.ext
	include	incbins.ext
	include	mdata.ext

	incpublics	mhofs.ext

	include	sgdata.ext
	include	dstrats.ext
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
	include	gb3strats.ext
	include	d2strats.ext
	include	shapes.ext
;	include	stratrou.ext
	include	sgtabs.ext
	include	gastrats.ext
	include	maps\maplist.ext
	include	fontdata.ext
	include	paths.ext
	include	expstrat.ext
	include	shbanks.ext
	include	mem.ext
	include	istrats.inc
	include	mhofs.ext
	include	menu.ext
scr_offset	equ	(vchr_logback-vchr_physback)/16

	extern	bgandpcr
	extern	bgandccr
	extern	dogccr
	extern	bgml	
	extern	bgmllen	
	extern	bgmd	
	extern	bgmdlen	
	extern	bgm11	
	extern	bgm11len

;-------------------------------------------------------
	bank	2
	ifne	*-$28000
	error	<X Routines bank must be start of bank 2>
	endc

	org	xroutines,$8000*2
ramstart	incfile	ramstuff.asm
xoffset	equ	*-ramstart

	ifle	xlen-xoffset
	error	<Extended code more than xlen>
	FAIL
	endc

	org	$28000+xoffset,$8000*2+xoffset
	minfo
	incfile	trans.asm
	minfo	trans
	incfile	main.asm
	minfo	main
	incfile	windows.asm
	minfo	windows
	bankend	2
	
	bank	34
	incfile	game.asm
	minfo	game
	incfile	endseq.asm
	minfo	endseq
	bankend	34

;------------------------------------------------------------------
	bank	3
planetdmapos1	dw	228
planetdmapos2	dw	100
	minfo

	incfile	sound.asm
	minfo	sound
	incfile	obj.asm
	minfo	obj
	incfile	planets.asm
	minfo	planets
	incfile	planets2.asm
	minfo	planets
	incfile	sprites.asm
	minfo	sprites
	incfile	world.asm
	minfo	world
	bankend	3

	bank	33
	incfile	bgs.asm
	minfo	bgs
	bankend	33

	bank	30
	incfile	continue.asm
	minfo	<continue>
	bankend	30
	
	org	$1f8000+$3db0,$8000*$1f+$3db0
;	bank	31
	minfo

	incfile	bootnmi.asm
	minfo	bootnmi
	incfile	nmi.asm
	minfo	nmi
	incfile	draw.asm
	minfo	draw

	incfile	stratrou.asm
	minfo	<stratrou>
	inccru	bgf1pcr,data\f-1.pcr
	bankend	31

	bank	32
	incfile	coltabs.asm
	minfo	coltabs
	incfile	cont.asm
	minfo	cont
	incfile	debug.asm
	minfo	<debug>
	incfile	pal.asm
	bankend	32
;------------------------------------------------------------------

	include	tail.inc




