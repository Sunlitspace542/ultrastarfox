; disable player's movement and wobble:
	setfadedown	quick
	mapwaitfade
	setbg	cred
	initbg

	start_65816
	a16
	stz	lastplayz
	stz	pviewposz
	ldx	playpt
	stz	al_worldz,x
	stz	plrotx
	stz	plroty
	stz	plrotz
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
	textpath 0000,-3000,-700,4000,kandowontu,dintro1,14
	textpath 0000,0000,-500,4000,presents,dintro1,14,-32
	textpath 0000,6000,-100,4000,starfox,dintro1,14
	textpath 0000,9000,100,4000,exploration,dintro1,14,-32
	textpath 0000,12000,300,4000,showcase,dintro1,14,-32

	ELSEIF
	textpath 0000,-3000,-150,4000,ces,dintro1,14,42
	textpath 0000,3000,0150,4000,demo,dintro1,14,42
	ENDC

	mapwait	3000

	mapobj	1000,50,-400,-700,f_fish,playerdown2intro_Istrat
	mapobj	1000,50,-400,-700,beeanim,playerdown3intro_Istrat

	mapobj	medpspeed*5,50,-400,-700,ray_1,playerdown3intro_Istrat
	setvarobj	mapvar1
;	mapobj	0000,0,-400,-700,nullshape,playerfireintro_Istrat
	setalvarptr.w	sword1,mapvar1
	

	mapwait	2000

	mapobj	1000,50,-400,-700,ray_0,playerdown2intro_Istrat
	mapobj	1000,50,-400,-700,ray_1,playerdown3intro_Istrat

	mapobj	medpspeed*5,50,-400,-700,f_fish,playerdown3intro_Istrat

	mapwait	2000

	mapobj	0000,0000,0,1500,face_b,monolith_istrat

	mapwait	8000
;	mapobj	600,-400,-800,2000,zaco_a,zacointro_Istrat
;	mapobj	600,400,-800,2000,zaco_a,zacointro_Istrat

	mapobj	400,-400,-800,2000,f_fish,zacointro_Istrat
	mapobj	400,400,-800,2000,beeanim,zacointro_Istrat
	mapobj	400,-400,-800,2000,snake_1,zacointro_Istrat
	mapobj	400,400,-800,2000,bom_wing,zacointro_Istrat
	mapobj	400,-400,-800,2000,ray_1,zacointro_Istrat
	mapobj	400,400,-800,2000,walker_0,zacointro_Istrat

	mapobj	400,-400,-800,2000,air_1,zacointro_Istrat
	mapobj	400,400,-800,2000,myship_4,zacointro_Istrat
	mapobj	400,-400,-800,2000,boss_2_2,zacointro_Istrat
	mapobj	400,400,-800,2000,iris,zacointro_Istrat
	mapobj	400,000,-800,2000,ray_0,zaco2intro_Istrat

;	setvar.b	exitintro,1

.lp	mapwait	5000
	mapgoto	.lp



