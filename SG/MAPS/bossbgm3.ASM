;----------5_9---------------------------------------------	
MAP5_9 ;andross
	meters_off
	initlevel	3_7a,nofadenostage,mscramwipe_circle
	setfadeup	quick
	setbg	1_6c
	initbg
	mapwait	3000
	
.ll0	mapplayermode	inspace
	start_65816
	lda	pshipflags3
	ORA	#psf3_nocollisions
	sta	pshipflags3	
	end_65816
	setbgm	$13
	mapwait	2000
	mapobj	1000,0,Space_viewCY,-200,face_b,monolith_istrat
	mapwait	6000
	mapwaitboss2	text59
	start_65816
	jsl	clearmap_l
	end_65816
	mapwait	500
	setbgm	$f1
	mapwait	2200	; 700
	
;	mapCLplayermode	ClearBridge
	setbgm	bgm_fanfare
	mapwait	2900
;	printlevelfin


friendwait	=	medpspeed*120
	setvar.n	stageclear,1
;	mapmsg	1
	mapwait	friendwait

	mapwait	5000
	setvar.b	clb2,0
	setvar.n	stageclear,0
	printlevelfin	
.eswait	mapwait		1
	maploop		.eswait,100
	mapendwipe	roundwipefill,32*medpspeed	
	mapjsr	map5_8
.end333
	mapwait	50
	mapgoto	.ll0

;------------5_10--------------------------------------------------
bossbgm10 ;Nucleus
	meters_off
	initlevel	1_3d,nofadenostage,mscramwipe_circle
	setfadeup	quick
.ll	
	
	mapwait	3000
	start_65816
	bgm2	13b
	end_65816
;	mapplayermode	onplanet
	mapwait	100
	fadeoutbgm
	setbgm	6

;	setbgm	$12
	mapobj	0000,0000,(-50<<3)+((100/2)<<3),210<<3,boss_8_0,boss8_Istrat
	setvarobj	mapvar1
	mapobj	0000,0000,(-50<<3)+((100/2)<<3),150<<3,hou_4,nucleuslauncher_Istrat
	setalvar	sbyte2,deg90+deg22
	mapobj	0000,0000,(-50<<3)+((100/2)<<3),150<<3,hou_4,nucleuslauncher_Istrat
	setalvar	sbyte2,deg135+deg22
	mapobj	0000,0000,(-50<<3)+((100/2)<<3),150<<3,hou_4,nucleuslauncher_Istrat
	setalvar	sbyte2,deg270-deg22
	mapobj	0000,0000,(-50<<3)+((100/2)<<3),150<<3,hou_4,nucleuslauncher_Istrat
	setalvar	sbyte2,-deg22
	mapobj	0000,0000,0000+((100/2)<<3),150<<3,boss_8_4,nucleuspillar_Istrat
	setalvar	sbyte2,deg45*0
	mapwait	6000
	mapwaitboss2	text510
	mapwait	500
	start_65816
	jsl	clearmap_l
	end_65816
	setbgm	$f1
	mapwait	2200	; 700
	
;	mapCLplayermode	ClearBridge
	setbgm	bgm_fanfare
	mapwait	2900
;	printlevelfin


friendwait	=	medpspeed*120
	setvar.n	stageclear,1
;	mapmsg	1
	mapwait	friendwait

	mapwait	5000
	setvar.b	clb2,0
	setvar.n	stageclear,0
	printlevelfin	
.eswait	mapwait		1
	maploop		.eswait,100
	mapendwipe	roundwipefill,32*medpspeed	
	mapjsr	bossbgm11
.end333
	mapwait	50
	mapgoto	.ll


;-------------5_11 end wait screen----------------------------------------------
bossbgm11
	initlevel	2_3a,nofadenostage,mscramwipe_circle
	setfadeup	quick
	setbg	2_3zz
	initbg

.wait	mapwait	10
	start_65816
	settext	9,8
	showtxt	pressstarttext

	testjoypad	START
	lbeq	.notdone
	lda	#8
	sta	stopcounting
	lda	#1
	sta	credits
	a8
	lda	#-1
	sta	fadedir
	jsl	setblack_l
	jsl	transfer_l

	a8
	stz	bg2vofsoverride
	end_65816
	setbg	title
	initbg
	start_65816
	jml	foxy_continue_l
.notdone
	end_65816
	mapgoto	.wait