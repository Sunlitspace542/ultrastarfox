
	include	header.inc
	include	coltabs.ext
	include	mdata.ext
	include	sgdata.ext
	include	marioi.inc
	include	shmacs.inc
	include	gridvars.inc

	include	stratequ.inc

	extern	arctantab

	include	incbins.ext

	incpublics	mario.ext


;------------------------------------------------------------------
	bank	1
rztab
mariobegin
yyy	mario	on
	incfile	mvars.mc
	incfile	mmacs.mc
	incfile	mshtab.mc	; must be at start of bank
	incfile	mmaths.mc
	incfile	mwrot.mc
	incfile	mwcrot.mc
	incfile	mobj.mc
	incfile	mclip.mc
	incfile	mdrawc.mc
	incfile	mdrawp.mc
	incfile	msprite.mc
	incfile	mgdots.mc
	incfile	mcircle.mc
	incfile	mdrawlis.mc
	incfile	mdecru.mc
	incfile	mtxtprt.mc
	incfile	mplanet.mc
	incfile	mdsprite.mc
;	incfile	mhofs.mc		;Kristers .mc files
	incfile	mpart.mc
	incfile	mbumwipe.mc
	incfile	mhud.mc
	mario	off


mariocodelen	=	*-mariobegin

oopspal	;incbin	data\oops.pal
oopschr	;incbin	data\oops.chr
oopspic	;incbin	data\oops.pic

	bankend	1

	bank	43
	incfile	fontdata.asm
	bankend	43

	include	tail.inc


