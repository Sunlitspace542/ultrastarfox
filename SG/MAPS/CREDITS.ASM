; disable player's movement and wobble:

	setfadedown	quick
	mapwaitfade

	meters_off	trans
	setbg	cred
	initbg

	start_65816
	a16
	stz	lastplayz
	stz	pviewposz
	ldx	playpt
	stz	al_worldz,x
	a8
	end_65816

	mapcode_jsl	initblack_l
	setvar		stayblack,10

	setvar.b	bg2vofsoverride,1
	setvar.w	bg2hofsreq,0
	setvar.w	bg2vofsreq,0

	setfadeup	quick
	mapwait	200
	start_65816
	a8
	lda	playerflymode
	and	#~pfm_wobble
	sta	playerflymode

	lda	pshipflags
	ora	#psf_noctrl!psf_nofire
	sta	pshipflags

	end_65816

	mapjsr	actualcreds

	pathobj	000,972,-969,1000,font_t,theendt,6,4
	pathobj	000,-1120,1377,1000,font_h,theendh,6,4
	pathobj	000,-1019,-1530,1000,font_e,theende,6,4
	pathobj	000,1070,-1326,1000,font_e,theende2,6,4
	pathobj	000,1550+29,1323+54,1000,font_n,theendn,6,4
	pathobj	000,-1050+129,1428,1000,font_d,theendd,6,4
	mapwait	6000
	setvar.b	levelfinished,le_endofcreds
.lp	mapwait	5000
	mapgoto	.lp

	IFEQ	PAL
credwait	=	5000
	ELSEIF
	IFEQ	GERMAN
credwait	=	4700
	ELSEIF
credwait	=	4000
	ENDC
	ENDC

actualcreds
; Starfox presented by Nintendo
	mapjsr	cutcreds
	mapwait	credwait
	textpath	1000,2000,-1000,3500,superfxstaff,dsideslip,14
	textpath	1000,2000,-600,3500,jez,dsideslip,14,32
	textpath	1000,2000,-300,3500,ben,dsideslip,14,32
	textpath	1000,2000,0000,3500,rick,dsideslip,14,32
	textpath	1000,2000,0300,3500,nishiumi,dsideslip,14,32
	textpath	1000,2000,0600,3500,kakui,dsideslip,14,32

	mapwait	credwait
	textpath	1000,2000,-450,3500,software,dsideslip,14
	textpath	1000,2000,-150,3500,nishida,dsideslip,14,32
	textpath	1000,2000,0150,3500,kawaguchi,dsideslip,14,32
	textpath	1000,2000,0450,3500,yamashiro,dsideslip,14,32

	mapwait	credwait
	textpath	1000,2000,-600,3500,english,dsideslip,14
	textpath	1000,2000,-300,3500,dan,dsideslip,14,32
	textpath	1000,2000,0000,3500,tony,dsideslip,14,32
	textpath	1000,2000,0300,3500,jondean,dsideslip,14,32
	textpath	1000,2000,0600,3500,ian,dsideslip,14,32

	mapwait	credwait
	textpath	1000,2000,-1000,3500,japanese,dsideslip,14
	textpath	1000,2000,-600,3500,kato,dsideslip,14,32
	textpath	1000,2000,-300,3500,shimizu,dsideslip,14,32
	textpath	1000,2000,0000,3500,kimura,dsideslip,14,32
	textpath	1000,2000,0300,3500,yajima,dsideslip,14,32
	textpath	1000,2000,0600,3500,yamamoto,dsideslip,14,32

	IFNE	GERMAN
	mapwait	credwait
	textpath	1000,2000,-200,3500,deutscher,dsideslip,14
	textpath	1000,2000,200,3500,claude,dsideslip,14,32
	ENDC

	mapwait	9000-31*medpspeed
	maprts

cutcreds

	mapwait	2000
	pathobj	1200,0,-1500,3500,nullshape,dstarfox,10,10
	textpath 0000,1535,0000,1800,presented,dpresented,14,-48
	textpath 800,-1265,0000,1800,by,dpresented,14,-48
	pathobj	1200,0,1500,3500,nullshape,dnintendo,10,10

	mapwait	3000
	textpath	1000,2000,-200,3000,executive,dsideslip,14
	textpath	1000,2000,0200,3000,yamauchi,dsideslip,14,32

	mapwait	credwait
	textpath	1000,2000,-200,3000,producer,dsideslip,14
	textpath	1000,2000,0200,3000,miyamoto,dsideslip,14,32

	mapwait	credwait
	textpath	1000,2000,-200,3000,director,dsideslip,14
	textpath	1000,2000,0200,3000,eguchi,dsideslip,14,32

	mapwait	credwait
	textpath	1000,2000,-200,3000,assistantdirector,dsideslip,14
	textpath	1000,2000,0200,3000,yamada,dsideslip,14,32

	mapwait	credwait
	textpath	1000,2000,-600,3000,programmed,dsideslip,14,32
	textpath	1000,2000,-300,3000,by,dsideslip,14
	textpath	1000,2000,0000,4400,dylan,dsideslip,14,100
	textpath	1000,2000,0400,4400,giles,dsideslip,14,100
	textpath	1000,2000,0800,4400,krister,dsideslip,14,100

	mapwait	credwait
	textpath	1000,2000,-300,3000,3dsystem,dsideslip,14
	textpath	1000,2000,0000,3000,pete,dsideslip,14,32
	textpath	1000,2000,0300,3000,carl,dsideslip,14,32

	mapwait	credwait
	textpath	1000,2000,-200,3000,graphicdesigner,dsideslip,14
	textpath	1000,2000,0200,3000,imamura,dsideslip,14,32

	mapwait	credwait
	textpath	1000,2000,-200,3000,shapedesigner,dsideslip,14
	textpath	1000,2000,0200,3000,watanabe,dsideslip,14,16

	mapwait	credwait
	textpath	1000,2000,-200,3000,effects,dsideslip,14
	textpath	1000,2000,0200,3000,kondo,dsideslip,14,32


	mapwait	credwait
	textpath	1000,2000,-200,3000,composer,dsideslip,14
	textpath	1000,2000,0200,3000,hirasawa,dsideslip,14,32

	mapwait	credwait
	textpath	1000,2000,-300,3000,developed,dsideslip,14,24
	textpath	1000,2000,0000,3000,by,dsideslip,14,-32
	textpath	1000,2000,0300,3000,argonaut,dsideslip,14,24
	
	maprts
