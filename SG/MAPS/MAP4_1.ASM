map4_1
;	mapgoto	.test
	fadeoutbgm
	setbgm	bgm_boss1
	mapwait	1000
	mapobj	0000,0000,-70<<boss7_scale,-200,boss_7_1,boss7_Istrat

	mapwaitboss
	markboss	boss11
	setbg	1_1c
	initbg
	setrestart
	mapwait	1500
;gate
	mapobj	2000,0000,-100,5000,gate_0,gate_ISTRAT
	pathobj	4000,3000,3000,1000,nullshape,e_gate,10,10
	mapobj	0000,0900,0000,4000,TOWER_2,TOWER0_ISTRAT
	mapobj	3000,-900,0000,4000,TOWER_2,TOWER0_ISTRAT
;across_robot
	pathobj	0000,-350,0000,5000,robot_0,robot,6,4
;across_robot
	pathobj	0000,0350,0000,5000,robot_0,robot,6,4
	mapobj	0000,0900,0000,4000,TOWER_2,TOWER0_ISTRAT
	mapobj	1000,-900,0000,4000,TOWER_2,TOWER0_ISTRAT
	mapobj	3000,0000,0000,4000,arch_0,hard_ISTRAT
	mapobj 0000,0000,-100,1500,item_5,item5_istrat
	mapobj 0000,0000,-100,1500,item_5,item5_istrat
	mapwait	2000
	fadeoutbgm
	setbgm	bgm_boss1
	mapwait	1000
	mapobj	0000,3000,0000,375<<bossa_scale,boss_A_2,bossA_Istrat
	mapwaitboss
	markboss	boss31
	mapwait	3000
	setfadedown	quick
	mapwaitfade

	setbg	2_2
	initbg
	setfadeup	quick
	setrestart
	mapplayermode	inspace
	mapobj	0000,1400,0000,4000,PILLAR3,pillar3_ISTRAT
	mapobj	1200,-1400,0000,4000,PILLAR3,pillar3_ISTRAT
	mapobj	0000,1200,0000,4000,PILLAR3,pillar3_ISTRAT
	mapobj	1200,-1200,0000,4000,PILLAR3,pillar3_ISTRAT
;gate
	mapobj	2000,0000,-100,5000,gate_0,gate_ISTRAT
	pathobj	4000,3000,3000,1000,nullshape,e_gate,10,10
	skillfly_bonus 0000,0100,-80,1500,item_6,item6_istrat
	mapobj	0000,1000,0000,4000,PILLAR3,pillar3_ISTRAT
	mapobj	1200,-1000,0000,4000,PILLAR3,pillar3_ISTRAT
	mapobj	0000,0800,0000,4000,PILLAR3,pillar3_ISTRAT
	mapobj	1200,-800,0000,4000,PILLAR3,pillar3_ISTRAT
	mapobj	0000,0600,0000,4000,PILLAR3,pillar3_ISTRAT
	mapobj	1400,-500,0000,4000,PILLAR3,pillar3_ISTRAT
	mapobj	0000,-900,0000,5000,BU_2,HARD180YR_ISTRAT
	mapobj	0000,0900,0000,5000,BU_2,HARD180YR_ISTRAT
	mapobj	0000,0400,0000,4000,PILLAR3,pillar3_ISTRAT
	mapobj	1200,-400,0000,4000,PILLAR3,pillar3_ISTRAT
	mapobj	0000,-300,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	1000,0300,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	0000,0250,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	1000,-250,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	0000,0200,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	0900,-200,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	0000,-700,0000,5000,BU_0,HARD180YR_ISTRAT
	mapobj	0000,0700,0000,5000,BU_0,HARD180YR_ISTRAT
	mapobj	0000,0150,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	0800,-150,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	0000,0150,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	0700,-150,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	0000,0200,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	0600,-200,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	0000,0000,0000,4000,item_5,item5_istrat
	mapobj	1000,0000,0000,4000,item_5,item5_istrat
	mapwait 4000
	setbgm	bgm_boss1
	mapobj	0000,0000,Space_viewCY+1000,1500,boss_1_2,boss1_Istrat
	mapwaitboss
	markboss	boss12
	setrestart
	setbg	2_2
	initbg
	mapwait	2500
;gate
	mapobj	2000,0000,-100,5000,gate_0,gate_ISTRAT
	pathobj	4000,3000,3000,1000,nullshape,e_gate,10,10
	mapobj	5000,0000,-100,5000,item_7,item7_ISTRAT
	pathobj	0000,-400,-300,0,my_bird,my_bird,10,10
	mapwait	4000
	fadeoutbgm
	setbgm	bgm_boss1
	incmap	webmonster
	mapwaitboss
.test
	markboss	boss32
	start_65816
	jsl	clearmap_l
	end_65816
	setrestart

	mapif	chkeasteregg2,.nochange
	mapwait	1000
;	checkcockpit
	mapwait	3000
	mapjsr	level4_2

.nochange
	start_65816
	jsl	clearmap_l
	end_65816
	setbg	2_2
	initbg
	mapwait 2000
;gate
	mapobj	2000,0000,-100,5000,gate_0,gate_ISTRAT
	pathobj	4000,3000,3000,1000,nullshape,e_gate,10,10
	mapobj	5000,0000,-100,5000,item_7,item7_ISTRAT
;	mapjsr	map1_3c			; big ship
;--------------------
	mapobj	0000,-1000,space_viewCY,0350,ship_4,cruiser1_Istrat
	setalvar	speed,200
	setalvar	rotz,230
;nomal
	mapobj	0000,-3400,space_viewCY+100,3000,ship_4,cruiser1f_Istrat
	setalvar	sbyte1,25
	setalvar	speed,55
	setalvar	rotz,20
	mapwait	2000	
;far_big_ship
	mapobj	0000,600,space_viewCY,8000,Sship_0_c,ship3a_Istrat
	setalvar	speed,125
	setalvar	rotx,10
;from_top
	mapobj	0000,space_minX-2000,space_viewCY-3000,3000,ship_4,cruiser1_Istrat
	setalvar	speed,100
	setalvar	rotx,025 
	setalvar	rotz,230
	mapwait	3500	
;revease
	mapobj	0000,-2500,space_viewCY-100,4000,ship_4,cruiser1F_Istrat
	setalvar	speed,55
	setalvar	rotz,150
	mapwait	1000	
;gate
	mapobj	2000,0000,-100,5000,gate_0,gate_ISTRAT
	pathobj	4000,3000,3000,1000,nullshape,e_gate,10,10
;
;supply_bird
	pathobj	1000,-380,-180,0,my_bird,my_bird,10,10


spsdist	=	13000

sphigh	equ	6000
		    
	mapobj	0000,0000,sphigh,spsdist,ship_0_c,ship3_Istrat
	setvarobj	mapvar1


	mapobj	0000,0000,sphigh-140,spsdist-240,bshipexitface,exitopensnd2_Istrat
	setalvar.w	sword1,400
	setalvarptr.w	sword2,mapvar1
	setalvar	sbyte1,-10

	
	mapobj	0000,0000,sphigh+140,spsdist-240,bshipexitface,exitopensnd2_Istrat
	setalvar.w	sword1,400
	setalvarptr.w	sword2,mapvar1
	setalvar	sbyte1,10
;	start_65816
;	lda	splayerflymode
;	cmp	#spfm_inside
;	bne	.nothing2
;	lda	superspeeddelay
;	ORA	#ktest
;	AND	#~ktest2
;	AND	#~ktest3
;	AND	#~ktest4
;	AND	#~ktest5
;	sta	superspeeddelay
;	jsl	changeviewmode_l
;.nothing2
;	end_65816
	mapwait	4000
	setbgm	$f1
	mapwait	medpspeed*7
	setbgm	5



.loop	mapif	chkstratdone1,.cont
	mapgoto	.loop
.cont

	setbg	1_3b
	initbg


;	incmap	1-3-t3
;-----------------
.washroom
	mapobj	0000,0070,-060,4000,bou_1,HARD180yr_ISTRAT
	mapobj	1000,-070,-060,4000,bou_1,HARD180yr_ISTRAT
	mapobj	0000,0070,-060,4000,bou_1,HARD180yr_ISTRAT
	mapobj	1000,-070,-060,4000,bou_1,HARD180yr_ISTRAT
	mapobj	0000,0070,-060,4000,bou_1,HARD180yr_ISTRAT
	mapobj	1000,-070,-060,4000,bou_1,HARD180yr_ISTRAT
	mapobj	0000,0070,-060,4000,bou_1,HARD180yr_ISTRAT
	mapobj	1000,-070,-060,4000,bou_1,HARD180yr_ISTRAT
	incmap	washent
	INCMAP	washmape
	maprts