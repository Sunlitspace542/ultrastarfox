; disable player's movement and wobble:
	setfadedown	quick
	mapwaitfade
	setbg	intro
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

	setfadeup	quick

	mapwait	246	800

	start_65816
	a8
	lda	playerflymode
	and	#~pfm_wobble
	sta	playerflymode

	lda	pshipflags
	ora	#psf_noctrl!psf_nofire
	sta	pshipflags

	end_65816

; Starfox presented by Nintendo
	IFEQ	cesdemo
	textpath 0000,-3000,-100,4000,nintendo,dintro1,14
	textpath 0000,3000,0100,4000,presents,dintro1,14,-32
	ELSEIF
	textpath 0000,-3000,-150,4000,ces,dintro1,14,42
	textpath 0000,3000,0150,4000,demo,dintro1,14,42
	ENDC

	mapwait	2000

	mapobj	1000,50,-400,-700,old_type,playerdown2intro_Istrat
	mapobj	1000,50,-400,-700,old_type,playerdown3intro_Istrat

	mapobj	medpspeed*5,50,-400,-700,old_type,playerdownintro_Istrat
	setvarobj	mapvar1
	mapobj	0000,0,-400,-700,nullshape,playerfireintro_Istrat
	setalvarptr.w	sword1,mapvar1
	

	mapwait	2000

	mapobj	0000,0000,-800,-400,deboss_1,boss7intro_Istrat

	mapwait	8000
	mapobj	600,-400,-800,2000,zaco_a,zacointro_Istrat
	mapobj	600,400,-800,2000,zaco_a,zacointro_Istrat

	mapobj	400,-400,-800,2000,zaco_5,zacointro_Istrat
	mapobj	400,400,-800,2000,zaco_5,zacointro_Istrat
	mapobj	400,-400,-800,2000,zaco_5,zacointro_Istrat
	mapobj	400,400,-800,2000,zaco_5,zacointro_Istrat
	mapobj	400,-400,-800,2000,zaco_5,zacointro_Istrat
	mapobj	400,400,-800,2000,zaco_5,zacointro_Istrat

	mapobj	400,000,-800,2000,zaco_5,zaco2intro_Istrat

	mapobj	400,-400,-800,2000,zaco_5,zacointro_Istrat
	mapobj	400,400,-800,2000,zaco_5,zacointro_Istrat
	mapobj	400,-400,-800,2000,zaco_5,zacointro_Istrat
	mapobj	400,400,-800,2000,zaco_5,zacointro_Istrat


;	setvar.b	exitintro,1

.lp	mapwait	5000
	mapgoto	.lp



