	include	header.inc
	include	marioi.inc
	include	stratmac.inc
	include	stratlib.inc
	include	bgmacs.inc
	include	blink.ext

	include	mapstructs.inc
	include	mapmacs.inc
	include	shmacs.inc

	include	mario.ext
	include	incbins.ext
	include	mdata.ext

	include	sgdata.ext
	include	dstrats.ext
	include	d3strats.ext
	include	pstrats.ext
	include	pistrats.ext
	include	pcstrats.ext
	include	gb2strats.ext
	include	gstrats.ext
	include	gbstrats.ext
	include	gcstrats.ext
	include	gistrats.ext
	include	kstrats.ext
	include	ga2strats.ext
	include	gb3strats.ext
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
	fail
	endc

	org	$28000+xoffset,$8000*2+xoffset
	minfo
	incfile	trans.asm
	minfo	trans
	incfile	main.asm
	minfo	main
	incfile	game.asm
	minfo	game
	incfile	windows.asm
	minfo	windows
	bankend	2



;------------------------------------------------------------------
	bank	3
planetdmapos1	dw	228
planetdmapos2	dw	100
	minfo
	incfile	coltabs.asm
	minfo	coltabs
	incfile	bgs.asm
	minfo	bgs
	incfile	sound.asm
	minfo	sound
	incfile	obj.asm
	minfo	obj
	incfile	planets.asm
	minfo	planets
	incfile	sprites.asm
	minfo	sprites
	incfile	continue.asm
	minfo	<continue>
	incfile	world.asm
	minfo	world
	bankend	3

	org	$1f8000+$3db0,$8000*$1f+$3db0
	minfo
	incfile	debug.asm
	minfo	<debug>
	incfile	bootnmi.asm
	minfo	bootnmi
	incfile	stratrou.asm
	minfo	<stratrou>
	incfile	nmi.asm
	minfo	nmi
	incfile	draw.asm
	minfo	draw
	incfile	endseq.asm
	bankend	31

	bank	36
	inccru	bgf1pcr,data\f-1.pcr
	incfile	cont.asm
	minfo	cont
	bankend	36
;------------------------------------------------------------------


	include	tail.inc




