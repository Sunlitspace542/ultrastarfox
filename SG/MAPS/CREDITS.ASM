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
	stz	bgmtest
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

	lda	bgmspeed
	beq	.nochange5
	cmp	#1
	beq	.slow5
	cmp	#2
	beq	.fast5
.slow5
	startbgm	$f4
	bra	.nochange5
.fast5
	startbgm	$f5
.nochange5

	end_65816

	mapjsr	actualcreds

	pathobj	000,972,-969,1000,font_t,theendt,6,4				;THE END test / End of game
	pathobj	000,-1120,1377,1000,font_h,theendh,6,4
	pathobj	000,-1019,-1530,1000,font_e,theende,6,4
	pathobj	000,1070,-1326,1000,font_e,theende2,6,4
	pathobj	000,1550+29,1323+54,1000,font_n,theendn,6,4
	pathobj	000,-1050+129,1428,1000,font_d,theendd,6,4
	mapwait	6000
	setvar.b	levelfinished,le_endofcreds
.lp	

	mapwait	500
	start_65816
	jmp_keydown	start,.done
	end_65816
	mapgoto	.lp
.done
	lda	#1
	sta	newgameplus
	stz	weaponnumberpone
	stz	weaponnumberptwo
	stz	weapptr
	stz	weapnextptr
	jml	restart
	end_65816
	mapend

credwait	=	8000

actualcreds
; Starfox presented by Nintendo
	mapjsr	cutcreds

	mapwait	9000-31*medpspeed
	maprts

cutcreds

	mapwait	2000
	pathobj	1200,0,-1500,3500,nullshape,dstarfox,10,10
	textpath 0000,1535,0000,1800,presented,dpresented,14,-48
	textpath 800,-1265,0000,1800,by,dpresented,14,-48
	pathobj	1200,0,1500,3500,nullshape,dnintendo,10,10

	mapwait	credwait
	textpath	1000,2000,-600,3000,developed,dsideslip,14,24
	textpath	1000,2000,-300,3000,by,dsideslip,14,-32
	textpath	1000,2000,0000,3000,argonaut,dsideslip,14,24
	textpath	1000,2000,0300,3000,dylancuthbert,dsideslip,14,24
	textpath	1000,2000,0600,3000,gilesgoddard,dsideslip,14,24
	mapwait	credwait
	textpath	1000,2000,-600,3000,programmed,dsideslip,14,32
	textpath	1000,2000,-300,3000,by,dsideslip,14
	textpath	1000,2000,0000,4400,kandowontu,dsideslip,14,100
	textpath	1000,2000,0300,4400,with_code_from,dsideslip,14,100
	textpath	1000,2000,0600,4400,starxxon,dsideslip,14,100
	textpath	1000,2000,0900,4400,HayaoYokogawa,dsideslip,14,100
	textpath	1000,2000,1200,4400,coolk,dsideslip,14,100

	mapwait	credwait
	textpath	1000,2000,-600,3000,graphicmods,dsideslip,14,32
	textpath	1000,2000,-300,3000,by,dsideslip,14
	textpath	1000,2000,0000,4400,segamegadrive,dsideslip,14,100
	textpath	1000,2000,0300,4400,HayaoYokogawa,dsideslip,14,100

	mapwait	credwait
	textpath	1000,2000,-600,3000,testing,dsideslip,14,32
	textpath	1000,2000,-300,3000,by,dsideslip,14
	textpath	1000,2000,0000,4400,SunlitSpace542,dsideslip,14,100
	textpath	1000,2000,0300,4400,Pikangs,dsideslip,14,100
	textpath	1000,2000,0600,4400,RandomStuff,dsideslip,14,100
	textpath	1000,2000,0900,4400,COOLK,dsideslip,14,100
	textpath	1000,2000,1200,4400,DOCTORWAREZ,dsideslip,14,100
	
	mapwait	credwait
	textpath	1000,2000,-600,3000,ideas,dsideslip,14,32
	textpath	1000,2000,-300,4400,sunlitspace542,dsideslip,14,100
	textpath	1000,2000,0000,4400,coolk,dsideslip,14,100
	textpath	1000,2000,0300,4400,combine_soldier.mdl,dsideslip,14,100
	textpath	1000,2000,0600,4400,patch93,dsideslip,14,100	
	textpath	1000,2000,0900,4400,DoctorWarez,dsideslip,14,100

	mapwait	credwait
	textpath	1000,2000,-300,3000,sorry1,dsideslip,14,24
	textpath	1000,2000,0000,3000,sorry2,dsideslip,14,24
	textpath	1000,2000,0300,3000,sorry3,dsideslip,14,-32
	
	mapwait	credwait
	textpath	1000,2000,-300,3000,team1,dsideslip,14,24
	textpath	1000,2000,0000,3000,team2,dsideslip,14,24
	textpath	1000,2000,0300,3000,team3,dsideslip,14,-32
	
	mapwait	credwait
	textpath	1000,2000,-900,3000,thankeng,dsideslip,14,5
	textpath	1000,2000,-525,3000,thankpor,dsideslip,14,-15
	textpath	1000,2000,-375,3000,thankesp,dsideslip,14,-15
	textpath	1000,2000,0000,3000,thankrus,dsideslip,14,5
	textpath	1000,2000,0375,3000,thankfrz,dsideslip,14,-15
	textpath	1000,2000,0525,3000,thankslk,dsideslip,14,-15
	textpath	1000,2000,0900,3000,thankger,dsideslip,14,5
	maprts