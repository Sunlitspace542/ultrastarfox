
	include	INC\header.inc
	include	EXT\coltabs.ext
	include	EXT\mdata.ext
	include	EXT\sgdata.ext
	include	INC\marioi.inc
	include	INC\shmacs.inc
	include	INC\gridvars.inc

	include	INC\stratequ.inc

	extern	arctantab

	include	EXT\incbins.ext

	incpublics	EXT\mario.ext


;------------------------------------------------------------------
	bank	1
rztab
mariobegin
yyy	mario	on
	incfile	MARIO\mvars.mc
    	incfile	MARIO\mmacs.mc
	incfile	MARIO\mshtab.mc	; must be at start of bank
	incfile	MARIO\mmaths.mc
	incfile	MARIO\mwrot.mc
	incfile	MARIO\mwcrot.mc
	incfile	MARIO\mobj.mc
	incfile	MARIO\mclip.mc
	incfile	MARIO\mdrawc.mc
	incfile	MARIO\mdrawp.mc
	incfile	MARIO\msprite.mc
	incfile	MARIO\mgdots.mc
	incfile	MARIO\mcircle.mc
	incfile	MARIO\mdrawlis.mc
	incfile	MARIO\mdecru.mc
	incfile	MARIO\mtxtprt.mc
	incfile	MARIO\mplanet.mc
	incfile	MARIO\mdsprite.mc
	incfile	MARIO\mpart.mc
	incfile	MARIO\mbumwipe.mc
	incfile	MARIO\mhud.mc
	mario	off


	incfile	ASM\fontdata.asm

mariocodelen	=	*-mariobegin

	bankend	1

	bank	41
oopspal	incbin	data\oops.pal
oopschr	incbin	data\oops.chr
oopspic	incbin	data\oops.pic
	bankend	41


	include	INC\tail.inc


