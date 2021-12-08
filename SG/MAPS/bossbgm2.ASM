;--------------5_5-----------------------------------------	
MAP5_5 ;meteor
	meters_off
	initlevel	1_4,nofadenostage,mscramwipe_circle
	setfadeup	quick
	start_65816
	jsl	clearmap_l
	end_65816
.ll	
	mapwait	3000
	
	mapplayermode	onplanet
	mapwait	100
	fadeoutbgm
	setbgm	bgm_boss1
	mapobj	0000,2000,-600,1000,boss_h_0,bossh_istrat
;	mapwait	20000
	mapwaitboss2	text55
	mapwait	500
	start_65816
	jsl	clearmap_l
	end_65816
	setbgm	$f1
	mapwait	2200	; 700
	
;	mapCLplayermode	ClearBridge
	setbgm	bgm_fanfare
	mapwait	900
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
	mapjsr	map5_6
.end333
	mapwait	50
	mapgoto	.ll
	

;-----------5_6--------------------------------------------	
MAP5_6 ;macbeth
	meters_off
	initlevel	3_5,nofadenostage,mscramwipe_circle
	setfadeup	quick
	
.ll	
	mapwait	3000
	
	mapplayermode	onplanet
	mapwait	100
	fadeoutbgm
	setbgm	bgm_boss1
	mapobj	0000,0000,0<<boss2_scale,4000,boss_2_2,boss2_Istrat
;	mapwait	20000
	mapwaitboss2	text56
	mapwait	500
	start_65816
	jsl	clearmap_l
	end_65816
	setbgm	$f1
	mapwait	2200	; 700
	
;	mapCLplayermode	ClearBridge
	setbgm	bgm_fanfare
	mapwait	900
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
	mapjsr	map5_7
.end333

	mapwait	50
	mapgoto	.ll

;----------5_7----------------------------------------------
MAP5_7 ;venom 1-6
	meters_off
	initlevel	1_6a,nofadenostage,mscramwipe_circle
	setfadeup	quick

	
.ll	
	mapwait	3000
	
	mapplayermode	onplanet
	mapwait	100
	fadeoutbgm
	setbgm	6
;	mapobj	0000,0000,-1000,4000,boss_b_1,bossBrob_Istrat
;	mapwait	20000
	mapobj	0000,-100,-500,0000,boss_f_4,airship_istrat
	mapwaitboss2	text57
	start_65816
	jsl	clearmap_l
	end_65816
	
	mapwait	500
	maprem	boss_b_0
	maprem	boss_b_1

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
	mapjsr	map5_9
.end333

	mapwait	50
	mapgoto	.ll

;----------5_8----------------------------------------------
MAP5_8 ;special
	meters_off
	initlevel	special,nofadenostage,mstarwipe_circle
	setfadeup	quick
	mapwait	1000
	
.ll0	mapplayermode	inspace
	
	setbgm	5
	mapwait	1000
	pathobj	0000,3000,0000,4200,slot_0,slotmachine,10,10
	mapobj	000,972,-969,1000,font_t2,theend_t_istrat
	mapobj	000,-1120,1377,1000,font_h2,theend_h_istrat
	mapobj	000,-1019,-1530,1000,font_e2,theend_e_istrat
	mapobj	000,1070,-1326,1000,font_e3,theend_e2_istrat
	mapobj	000,1550+29,1323+54,1000,font_n2,theend_n_istrat
	mapobj	000,-1050+129,1428,1000,font_d2,theend_d_istrat
	mapwaitboss2	text58
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
	mapjsr	bossbgm10
.end333
	mapwait	50
	mapgoto	.ll0

