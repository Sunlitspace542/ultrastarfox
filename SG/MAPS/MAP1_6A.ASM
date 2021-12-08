restart1_6
;	mapplayermode	onplanet
;	setvar	keeppstrat,1
;	mapwait	1000
	start_65816
	lda	bgmspeed
	beq	.nochange2
	cmp	#1
	beq	.slow2
	cmp	#2
	beq	.fast2
.slow2
	startbgm	$f4
	bra	.nochange2
.fast2
	startbgm	$f5
.nochange2
	end_65816
	mapwait	1000
	mapgoto	cont1_6

map1_6a
;				16 specials
	mapwait	1000
	start_65816
	lda	bgmspeed
	beq	.nochange
	cmp	#1
	beq	.slow
	cmp	#2
	beq	.fast
.slow
	startbgm	$f4
	bra	.nochange
.fast
	startbgm	$f5
.nochange
	end_65816
	incmap	planet
;
;	mapgoto	map1_6a
;

;	mapgoto	map1666
	mapif	chkeasteregg1,.cont
	mapwait	2000
.ll2	mapobj	000,972,-969,1000,font_t2,theend_t_istrat
	mapobj	000,-1120,1377,1000,font_h2,theend_h_istrat
	mapobj	000,-1019,-1530,1000,font_e2,theend_e_istrat
	mapobj	000,1070,-1326,1000,font_e3,theend_e2_istrat
	mapobj	000,1550+29,1323+54,1000,font_n2,theend_n_istrat
	mapobj	000,-1050+129,1428,1000,font_d2,theend_d_istrat
.ll	mapif	theenddead,.cont
	mapgoto	.ll
.cont

	mapobj	0000,0200,-0125,2000,r_bu_7,hard180YR_Istrat
	mapobj	0400,-200,-0125,2000,r_bu_7,hard180YR_Istrat
	mapobj	0000,0200,-0125,2000,r_bu_7,hard180YR_Istrat
	mapobj	0400,-200,-0125,2000,r_bu_7,hard180YR_Istrat
	mapobj	0000,0200,-0125,2000,r_bu_7,hard180YR_Istrat
	mapobj	0400,-200,-0125,2000,r_bu_7,hard180YR_Istrat
	mapobj	0000,0200,-0125,2000,r_bu_7,hard180YR_Istrat
	mapobj	0400,-200,-0125,2000,r_bu_7,hard180YR_Istrat

	setrestart	restart1_6
cont1_6

	mapobj	0000,-0500,0000,4000,bu_6,hard180yr_Istrat
	mapobj	0400,0500,0000,4000,bu_6,hard180yr_Istrat
	map_setbarshape	solid
speed	=	30


	map_SBtype16	4,-10,-1,0,speed,0
	map_SBtype16	0,10,-2,0,-speed,0
	map_SBtype16	4,10,0,0,-speed,0
	mapwait	800
;	
;;;;;	mapHARDRot	wait,   x,   y,   z, shape, x,y,z(+or- speed)
	mapobj	0000,-0600,0000,4000,bu_0,hard180yr_Istrat
	mapobj	0000,0600,0000,4000,bu_0,hard180yr_Istrat
       	mapobj	3400,0000,0000,4200,wall1,wallr_ISTRAT

	mapobj	0000,-400,-020,5000,R_BU_0,HARD180YR_ISTRAT
	mapobj	0800,400,-020,5000,R_BU_0,HARD180YR_ISTRAT

	mapblocksnd
	mapobj	0100,-100,-50,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0100,0000,-150,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0100,0100,-250,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0100,0200,-350,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0100,0300,-450,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0100,0350,-350,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0100,0400,-250,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0100,0450,-150,1000,R_BU_1,HARD180YR_ISTRAT
	pathspecial	0000,1000,-600,2000,zaco_a,patrol,10,10
	mapobj	0300,0500,-050,1000,R_BU_1,HARD180YR_ISTRAT


	mapblocksnd
	mapobj	0100,0300,-50,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0100,0200,-150,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0100,0100,-250,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0100,0050,-350,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0100,0000,-450,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0100,-050,-350,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0100,-150,-250,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0100,-250,-150,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0400,-350,-050,1000,R_BU_1,HARD180YR_ISTRAT

	mapblocksnd
	mapobj	0000,0450,-50,1000,R_BU_1,HARD180YR_ISTRAT
	mapobj	0080,-450,-50,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0000,0350,-150,1000,R_BU_1,HARD180YR_ISTRAT
	mapobj	0080,-350,-150,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0000,0250,-250,1000,R_BU_1,HARD180YR_ISTRAT
	mapobj	0080,-250,-250,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0000,0150,-350,1000,R_BU_1,HARD180YR_ISTRAT
	mapobj	0080,-150,-350,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0000,0100,-450,1000,R_BU_1,HARD180YR_ISTRAT
	mapobj	0080,-100,-450,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0000,0050,-350,1000,R_BU_1,HARD180YR_ISTRAT
	mapobj	0100,-050,-350,1000,R_BU_1,HARD180YR_ISTRAT
	mapobj	0100,0000,-250,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0000,-100,-150,1000,R_BU_1,HARD180YR_ISTRAT
	mapobj	0100,0100,-150,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0000,-200,-050,1000,R_BU_1,HARD180YR_ISTRAT
	mapobj	0000,0200,-050,1000,R_BU_1,HARD180YR_ISTRAT

	mapobj	0000,-400,-020,5000,R_BU_0,HARD180YR_ISTRAT
	mapobj	0800,400,-020,5000,R_BU_0,HARD180YR_ISTRAT

;friend
	mapif		assaultcheck,.nofriends1
	pathobj	0000,-750,-480,0000,friendship_4,chase6_1,10,10

	pathcspecial	2000,-720,-480,0000,zaco_a,chase6_2,10,10
.nofriends1
	mapobj	1000,-600,-020,5000,R_BU_0,HARD180YR_ISTRAT
	mapobj	2000,0500,-020,5000,R_BU_0,HARD180YR_ISTRAT
	pathspecial	2500,1000,-600,2000,zaco_a,patrol,10,10
	pathspecial	2500,-1000,-400,2000,zaco_a,patrol,10,10
	mapobj	0000,-0600,0000,4000,bu_0,hard180yr_Istrat
	cspecial	2500,0500,0000,4000,hou_5,houdai5f_istrat
	mapobj	0000,0600,0000,4000,bu_0,hard180yr_Istrat
	cspecial	2500,-700,0000,4000,hou_5,houdai5f_istrat

	mapobj	2000,-600,0000,4000,bu_0,hard180yr_Istrat
	mapobj	2000,0600,0000,4000,bu_0,hard180yr_Istrat
;movingwalls
	mapobj	0000,-700,0000,4000,bu_0,hard180yr_Istrat
       	mapobj	1000,0100,0000,4200,wall1,wallr_ISTRAT
	mapobj	2800,0500,0000,4000,bu_0,hard180yr_Istrat

	mapobj	0000,0150,-50,4500,item_5,item5_Istrat
	setalvar	sbyte1,1
	mapobj	0000,0500,0000,4000,bu_0,hard180yr_Istrat
	mapobj	0000,-700,0000,4000,bu_0,hard180yr_Istrat
       	mapobj	2500,-100,0000,4200,wall1,wallr_ISTRAT
	mapobj	0000,-500,0000,4000,bu_0,hard180yr_Istrat
       	mapobj	1000,0100,0000,4200,wall1,walll_ISTRAT
	mapobj	1000,0700,0000,4000,bu_0,hard180yr_Istrat

	map_SBtype16	0,10,-4,0,-speed,0
	map_SBtype16	5,-10,-3,0,speed,0
	map_SBtype16	0,10,-4,0,-speed,0
	map_SBtype16	5,-10,-3,0,speed,0
	mapwait	0100
	mapobj	1500,-300,0000,4000,wall1,wallr_ISTRAT
       	mapobj	1500,0300,0000,4200,wall1,walll_ISTRAT
	mapobj	0000,0600,0000,4000,bu_0,hard180yr_Istrat
       	mapobj	1500,0000,0000,4200,wall1,walll_ISTRAT
	mapobj	1400,-600,0000,4000,bu_0,hard180yr_Istrat

	map_SBtype16	0,10,-4,0,-speed,0
	map_SBtype16	5,-10,-3,0,speed,0
	map_SBtype16	0,10,-4,0,-speed,0
	map_SBtype16	5,-10,-3,0,speed,0
	map_SBtype16	0,10,-4,0,-speed,0
	map_SBtype16	4,-10,-3,0,speed,0

;extendpillars
	mapmother	3000,0000,0,1500,mother1,mother1_istrat,map_pillars
	maprem		mother1

	pathspecial	0500,-1000,-700,2000,zaco_a,patrol,10,10
	pathspecial	2500,-1000,-450,2000,zaco_a,patrol,10,10
;friend
	mapif		assaultcheck,.nofriends2
	pathobj	0000,000,-400,-150,friendship_4,chase7_1,10,10

	pathcspecial	2000,000,-400,-150,zaco_a,chase7_2,10,10
.nofriends2
	mapobj	1000,-400,-020,5000,R_BU_0,HARD180YR_ISTRAT
	mapobj	1000,0600,-020,5000,R_BU_0,HARD180YR_ISTRAT
	mapobj	1000,-800,-020,5000,R_BU_0,HARD180YR_ISTRAT
	cspecial	0000,0500,0000,4000,hou_5,houdai5f_istrat
	cspecial	2500,-500,0000,4000,hou_5,houdai5f_istrat
	mapobj	1000,-600,0000,4000,bu_0,hard180yr_Istrat
	mapobj	1000,0600,0000,4000,bu_0,hard180yr_Istrat
	mapobj	1000,-600,0000,4000,bu_0,hard180yr_Istrat
	pathspecial	0500,1000,-700,2000,zaco_a,patrol,10,10
	pathspecial	2500,-1000,-450,2000,zaco_a,patrol,10,10
	cspecial	0000,0500,0000,4000,hou_5,houdai5f_istrat
	cspecial	2000,-500,0000,4000,hou_5,houdai5f_istrat
	mapobj	1500,0600,0000,4000,bu_0,hard180yr_Istrat
	mapobj	0000,-600,0000,4000,bu_0,hard180yr_Istrat
	cspecial	1500,0200,0000,4000,hou_5,houdai5f_istrat
	mapobj	1000,-600,0000,4000,bu_0,hard180yr_Istrat
	mapobj	1000,0600,0000,4000,bu_0,hard180yr_Istrat
	mapobj	1000,-600,0000,4000,bu_0,hard180yr_Istrat

           	mapobj	0000,0800,0000,4000,rpillar3,flypillars_ISTRAT
           	mapobj	0000,-1000,0000,5000,rpillar3,flypillars_ISTRAT
           	mapobj	0000,1200,0000,6000,rpillar3,flypillars_ISTRAT
           	mapobj	0000,-900,0000,6000,rpillar3,flypillars_ISTRAT
;flying_pillars
	mapobj	0000,0000,0000,3000,rpillar3,flypillars_ISTRAT
           	mapobj	0000,0200,0000,3000,rpillar3,flypillars_ISTRAT
           	mapobj	0400,-200,0000,3000,rpillar3,flypillars_ISTRAT
           	mapobj	0000,0500,0000,3000,rpillar3,flypillars_ISTRAT
           	mapobj	0400,-500,0000,3000,rpillar3,flypillars_ISTRAT
           	mapobj	0000,0350,0000,3000,rpillar3,flypillars_ISTRAT
           	mapobj	0400,-350,0000,3000,rpillar3,flypillars_ISTRAT
       	mapobj	0000,0150,0000,3000,rpillar3,flypillars_ISTRAT
       	mapobj	0400,-150,0000,3000,rpillar3,flypillars_ISTRAT
       	mapobj	0000,0400,0000,3000,rpillar3,flypillars_ISTRAT
       	mapobj	2000,-400,0000,3000,rpillar3,flypillars_ISTRAT

	
	mapmother	6000,0000,0,4000,mother1,mother1_istrat,map_flypillars
	maprem		mother1
	mapwait	2000
	map_SBtype17	0,-4,-11,0,speed,0
	map_SBtype17	0,-2,-11,0,speed,0
	map_SBtype17	0,0,-11,0,speed,0
	map_SBtype17	0,2,-11,0,speed,0
	map_SBtype17	6,4,-11,0,speed,0


	map_SBtype17	0,-5,-12,0,speed,0
	map_SBtype17	0,-3,-12,0,speed,0
	map_SBtype17	0,-1,-12,0,speed,0
	map_SBtype17	0,1,-12,0,speed,0
	map_SBtype17	0,3,-12,0,speed,0
	map_SBtype17	6,5,-12,0,speed,0


	map_SBtype17	0,-4,-12,0,speed,0
	map_SBtype17	0,-2,-12,0,speed,0
	map_SBtype17	0,0,-12,0,speed,0
	map_SBtype17	0,2,-12,0,speed,0
	map_SBtype17	5,4,-12,0,speed,0

;	mapHARDRot	0000,-250,-100,4000,gate_0,12,6,6
;	mapHARDRot	0000,0250,-100,4000,gate_0,6,6,12
	mapobj	0000,-250,-100,4000,gate_0,gate3_ISTRAT
	mapobj	0000,0250,-100,4000,gate_0,gate3_ISTRAT
	mapobj	0000,0000,-200,4000,gate_0,gate_ISTRAT
	pathobj	1000,3000,3000,3000,nullshape,e_gate,10,10
	mapwait	1000
	start_65816
	lda	bgmspeed
	beq	.nochange1
	cmp	#1
	beq	.slow1
	cmp	#2
	beq	.fast1
.slow1
	startbgm	$f4
	bra	.nochange1
.fast1
	startbgm	$f5
.nochange1
	end_65816
	mapwait	2000


	map_SBtype17	0,-4,-12,0,speed,0
	map_SBtype17	0,-2,-12,0,speed,0
	map_SBtype17	0,0,-12,0,speed,0
	map_SBtype17	0,2,-12,0,speed,0
	map_SBtype17	5,4,-12,0,speed,0

	map_SBtype16	0,-10,0,0,speed,0
	map_SBtype16	0,-11,-2,0,speed,0
	map_SBtype16	6,-12,-4,0,speed,0

	map_SBtype17	0,-4,-12,0,speed,0
	map_SBtype17	0,-2,-12,0,speed,0
	map_SBtype17	0,0,-12,0,speed,0
	map_SBtype17	0,2,-12,0,speed,0
	map_SBtype17	8,4,-12,0,speed,0
;dossun
       	mapobj	0000,0300,-250,3000,r_bu_1,hard180yr_ISTRAT
       	mapobj	0000,-300,-250,3000,r_bu_1,hard180yr_ISTRAT
	pathobj	0300,0000,-250,3000,r_bu_1,e_dosun,10,8	
	mapobj	0000,0150,-50,3000,item_5,item5_Istrat
	setalvar	sbyte1,1
	pathobj	0300,0300,-250,3000,r_bu_1,e_dosun,10,8	
       	mapobj	0000,0600,-150,3000,r_bu_1,hard180yr_ISTRAT
	pathobj	0300,-450,-300,3000,r_bu_1,e_dosun,10,8	
       	mapobj	0000,0300,-250,3000,r_bu_1,hard180yr_ISTRAT
	pathobj	0300,-150,-250,3000,r_bu_1,e_dosun,10,8	
       	mapobj	0000,-300,-150,3000,r_bu_1,hard180yr_ISTRAT
	pathobj	0300,0150,-350,3000,r_bu_1,e_dosun,10,8	
       	mapobj	0000,-150,-250,3000,r_bu_1,hard180yr_ISTRAT
	pathobj	0300,0600,-250,3000,r_bu_1,e_dosun,10,8	
	pathobj	0300,0000,-250,3000,r_bu_1,e_dosun,10,8	
	pathobj	0300,-450,-350,3000,r_bu_1,e_dosun,10,8	
	pathobj	0300,0300,-150,3000,r_bu_1,e_dosun,10,8	
       	mapobj	0000,0450,-250,3000,r_bu_1,hard180yr_ISTRAT
	pathobj	0300,-300,-250,3000,r_bu_1,e_dosun,10,8	
       	mapobj	0000,-600,-350,3000,r_bu_1,hard180yr_ISTRAT
	pathobj	0300,0000,-250,3000,r_bu_1,e_dosun,10,8	
	mapobj	0000,0000,-50,3800,item_7,item7_Istrat
	setalvar	sbyte1,1
       	mapobj	0000,0000,-250,3000,r_bu_2,hard180yr_ISTRAT
	pathobj	0000,0450,-350,3000,r_bu_2,itadosun,10,8	
	pathobj	0400,-450,-250,3000,r_bu_2,itadosun,10,8	
       	mapobj	0000,0450,-250,3000,r_bu_2,hard180yr_ISTRAT
       	mapobj	0000,-450,-200,3000,r_bu_2,hard180yr_ISTRAT
	pathobj	1500,0000,-250,3000,r_bu_2,itadosun,10,8	
       	mapobj	3200,0000,0000,4000,wall1,walll_ISTRAT

	mapmother	8000,0000,0,4000,mother1,mother1_istrat,map_flypillars
	maprem		mother1
;---------------------------------------------------------------
;	include	maps\planet.asm

;	endc

	mapwait	3000
;.wait16a
;	incmap	1-1
;	mapgoto	.wait16a


boss1666

	fadeoutbgm
	setbgm	5

; boss B robot test
	mapobj	0000,0000,-1000,4000,boss_b_1,bossBrob_Istrat
	mapwaitboss
	markboss	boss16
	start_65816
	stz	stopcounting
	end_65816
	maprts


