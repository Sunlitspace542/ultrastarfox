	include	INC\header.inc
	include	INC\marioi.inc
	include	INC\stratmac.inc
	include	INC\stratlib.inc
	include	INC\bgmacs.inc
	;include	EXT\blink.ext

	include	INC\mapstructs.inc
	include	INC\mapmacs.inc
	include	INC\shmacs.inc

	include	EXT\mario.ext
	include	EXT\incbins.ext
	include	EXT\mdata.ext

	include	EXT\sgdata.ext
	include	EXT\dstrats.ext
	include	EXT\d3strats.ext
	include	EXT\pstrats.ext
	include	EXT\pistrats.ext
	include	EXT\pcstrats.ext
	include	EXT\gb2strats.ext
	include	EXT\gstrats.ext
	include	EXT\gbstrats.ext
	include	EXT\gcstrats.ext
	include	EXT\gistrats.ext
	include	EXT\kstrats.ext
	include	EXT\ga2strats.ext
	include	EXT\gb3strats.ext
	include	EXT\shapes.ext
	include	EXT\sgtabs.ext
	include	EXT\gastrats.ext
	include	maps\maplist.ext
	include	EXT\fontdata.ext
	include	EXT\paths.ext
	include	EXT\expstrat.ext
	include	EXT\shbanks.ext
	include	EXT\mem.ext
	include	INC\istrats.inc

	include	EXT\mhofs.ext

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
	IFNE	FASTROM
	ifne	*-$828000
	error	<X Routines bank must be start of bank 2>
	endc
	ELSEIF
	ifne	*-$28000
	error	<X Routines bank must be start of bank 2>
	endc
	ENDC
	
	org	xroutines,$8000*2
ramstart	incfile	ASM\ramstuff.asm
xoffset	equ	*-ramstart

	ifle	xlen-xoffset
	error	<Extended code more than xlen>
	fail
	endc

	IFNE	FASTROM
	org	$828000+xoffset,$8000*2+xoffset
	ELSEIF
	org	$28000+xoffset,$8000*2+xoffset
	ENDC
	
	minfo
	incfile	ASM\trans.asm
	minfo	trans
	incfile	ASM\main.asm
	minfo	main
	incfile	ASM\game.asm
	minfo	game
	incfile	ASM\windows.asm
	minfo	windows
	bankend	2



;------------------------------------------------------------------
	bank	3
planetdmapos1	dw	228
planetdmapos2	dw	100
	minfo
	incfile	ASM\coltabs.asm
	minfo	coltabs
	incfile	ASM\bgs.asm
	minfo	bgs
	incfile	ASM\obj.asm
	minfo	obj
	incfile	ASM\planets.asm
	minfo	planets
	incfile	ASM\sprites.asm
	minfo	sprites
	incfile	ASM\continue.asm
	minfo	<continue>
	incfile	ASM\world.asm
	minfo	world
	bankend	3



	IFNE	FASTROM
	org	$9f8000+$3db0,$8000*$1f+$3db0
	ELSEIF
	org	$1f8000+$3db0,$8000*$1f+$3db0
	ENDC
	
	minfo
	incfile	ASM\debug.asm
	minfo	<debug>
	incfile	ASM\bootnmi.asm
	minfo	bootnmi
	incfile	STRAT\stratrou.asm
	minfo	<stratrou>
	incfile	ASM\blink.asm
	incfile	ASM\nmi.asm
	minfo	nmi
	incfile	ASM\draw.asm
	minfo	draw
	incfile	ASM\endseq.asm
	bankend	31

	bank	36
	inccru	bgf1pcr,data\f-1.pcr
	incfile	ASM\cont.asm
	minfo	cont
	incfile	ASM\sound.asm
	minfo	sound

	bankend	36
;------------------------------------------------------------------


	include	INC\tail.inc




