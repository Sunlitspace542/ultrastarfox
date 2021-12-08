bossbgm1 ;corneria

	meters_off
	initlevel	3_1c,nofadenostage,mstarwipe_circle
	setfadeup	quick
	mapwait	3000
.ll		mapplayermode	onplanet
	mapwait	100
	
	fadeoutbgm
	
	setbgm	bgm_boss1
	mapobj	0000,0000,-70<<boss7_scale,-200,boss_7_1,boss7_Istrat
	mapwaitboss2	text51
	start_65816
	jsl	clearmap_l
	end_65816
	setbgm	$f1
	mapwait	2200	; 700
	
	setbgm	bgm_fanfare
	mapwait	2900


friendwait	=	medpspeed*120
;	setvar.n	stageclear,1
;	mapmsg	1
	mapwait	friendwait

	mapwait	5000
;	setvar.b	clb2,0
;	setvar.n	stageclear,0
.eswait	mapwait		1
	maploop		.eswait,100
	mapendwipe	roundwipefill,32*medpspeed	
	mapwait	500
	mapjsr	bossbgm3

.end333
	mapwait	50
	mapgoto	.ll

;---------5_2-------------------
bossbgm2 ;space bra 1-2
	initlevel	1_2,nofadenostage,mstarwipe_circle
	setfadeup	quick
.l2	fadeoutbgm
	setbgm	bgm_boss1
	
	mapobj	0000,0000,Space_viewCY+1000,1500,boss_1_2,boss1_Istrat
	mapwaitboss2	text52
	start_65816
	jsl	clearmap_l
	end_65816
	mapwait	4000

	setbgm	$f1  
	mapwait	2000
	setbgm	bgm_fanfare
	mapwait	1800

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
	mapwait	500
	mapjsr	bossbgm1

;----------5_3--------------
bossbgm3 ;titania
	meters_off
	initlevel	2_3a,nofadenostage,mscramwipe_circle
	setfadeup	quick
	setbg	2_3zz
	initbg
.ll	
	mapwait	3000
	
	mapplayermode	onplanet
	mapwait	100
	fadeoutbgm
	setbgm	bgm_boss1
	maprem	whale1
	maprem	whale
	mapobj	0000,0000,-060,3000,boss_g_s,bossg_istrat
;	mapwait	20000
	mapwaitboss2	text53
	mapwait	500
	start_65816
	jsl	clearmap_l
	end_65816
	setbgm	$f1
	mapwait	2200	; 700
	
;	mapCLplayermode	ClearBridge
	setbgm	bgm_fanfare
	mapwait	400
;	printlevelfin


friendwait	=	medpspeed*120
	setvar.n	stageclear,1
;	mapmsg	1
	mapwait	friendwait

	mapwait	100
	setvar.b	clb2,0
	setvar.n	stageclear,0
	printlevelfin	
.eswait	mapwait		1
	maploop		.eswait,100
	mapendwipe	roundwipefill,32*medpspeed	
	mapjsr	map5_4
.end333
	mapwait	50
	mapgoto	.ll

;------------5_4-------------------------------------------	
MAP5_4 ;fortuna
	meters_off
	initlevel	3_3a,nofadenostage,mscramwipe_circle
	setfadeup	quick
	
.ll	
	mapwait	3000
	
	mapplayermode	onplanet
	mapwait	100
	fadeoutbgm
	setbgm	bgm_boss1
	mapobj	0000,-100,0000,4000,boss_d_1,chicken_istrat
;	mapwait	20000
	mapwaitboss2	text54
	mapwait	500
	start_65816
	jsl	clearmap_l
	end_65816
	start_65816
	lda	gameflags
	AND	#~gf_nozremove
	sta	gameflags
	end_65816
	setbgm	$f1
	mapwait	2200	; 700
	
;	mapCLplayermode	ClearBridge
	setbgm	bgm_fanfare
	mapwait	100
;	printlevelfin


friendwait	=	medpspeed*120
	setvar.n	stageclear,1
;	mapmsg	1
	mapwait	friendwait

	mapwait	100
	setvar.b	clb2,0
	setvar.n	stageclear,0
	printlevelfin	
.eswait	mapwait		1
	maploop		.eswait,100
	mapendwipe	roundwipefill,32*medpspeed	
	mapjsr	map5_5
.end333
	mapwait	50
	mapgoto	.ll


	
