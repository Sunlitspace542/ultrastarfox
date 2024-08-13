; 3-7 Venom 3 Surface Part A
restart3_7
	mapwait	2000
	mapgoto	cont3_7



map3_7a

	incmap	planet
	mapobj	0000,0200,-0125,2000,r_bu_7,hard180YR_Istrat
	mapobj	0400,-200,-0125,2000,r_bu_7,hard180YR_Istrat
	mapobj	0000,0200,-0125,2000,r_bu_7,hard180YR_Istrat
	mapobj	0400,-200,-0125,2000,r_bu_7,hard180YR_Istrat
	mapobj	0000,0200,-0125,2000,r_bu_7,hard180YR_Istrat
	mapobj	0400,-200,-0125,2000,r_bu_7,hard180YR_Istrat
	mapobj	0000,0200,-0125,2000,r_bu_7,hard180YR_Istrat
	mapobj	0400,-200,-0125,2000,r_bu_7,hard180YR_Istrat


	setrestart	restart3_7
cont3_7

	mapobj	0000,0300,0,3000,bu_0,hard180YR_Istrat
	mapobj	0200,-300,0,3000,bu_0,hard180YR_Istrat
	map_setbarshape	solid

.ougi
	map_spacebarIC	0,0,15,0,-2
	map_spacebarX	-2,0,-15,0
	setalvar.w	worldx,-clen*150/100
	map_spacebarwait	2

	map_spacebarIC	0,0,15,0,2
	map_spacebarX	2,0,-15,0
	setalvar.w	worldx,clen*150/100
	map_spacebarwait	2

	map_spacebarIC	0,0,15,0,-2
	map_spacebarX	-2,0,-15,0
	setalvar.w	worldx,-clen*150/100
	map_spacebarwait	2

	map_spacebarIC	0,0,15,0,2
	map_spacebarX	2,0,-15,0
	setalvar.w	worldx,clen*150/100
	map_spacebarwait	3
	mapobj	0000,0300,0,2970,bu_0,hard180YR_Istrat
	mapobj	0000,-300,0,2970,bu_0,hard180YR_Istrat
.bars
	map_spacebarIC	0,0,15,0,-2
	map_spacebarX	-2,0,-15,0
	setalvar.w	worldx,-clen*150/100
	map_spacebarwait	2

	map_spacebarIC	0,0,15,0,2
	map_spacebarX	2,0,-15,0
	setalvar.w	worldx,clen*150/100
	map_spacebarwait	2
	maploop	.bars,06
	map_spacebarIC	0,0,15,0,0
	map_spacebarX	0,-2,-15,2
	mapwait	1000


;dossun
	pathobj	0000,-450,-150,3000,r_bu_2,e_kururi,10,8	
	pathobj	0000,0450,-200,3000,r_bu_2,e_kururi,10,8	
	mapobj	0000,0000,-50,4000,item_6,item6_Istrat
	pathobj	0000,-200,-350,3000,r_bu_1,e_dosun,10,8
	pathobj	0000,0200,-300,3000,r_bu_1,itadosun,10,8
	pathobj	0400,0000,-250,3000,r_bu_1,e_dosun,10,8	
.boards
	pathobj	0000,-450,-350,3000,r_bu_2,itadosun,10,8	
	pathobj	0000,-200,-200,3000,r_bu_2,itadosun,10,8
	pathobj	0400,0200,-350,3000,r_bu_2,e_kururi,10,8	
	pathobj	0000,0450,-200,3000,r_bu_2,itadosun,10,8	
	pathobj	0400,0100,-200,3000,r_bu_2,itadosun,10,8	
	pathobj	0000,-300,-150,3000,r_bu_2,itadosun,10,8
	pathobj	0000,0300,-200,3000,r_bu_2,e_kururi,10,8
	pathobj	0400,0000,-350,3000,r_bu_2,e_kururi,10,8	
	pathobj	0000,0450,-200,3000,r_bu_2,e_kururi,10,8	
	pathobj	0400,-200,-200,3000,r_bu_2,e_kururi,10,8	
	pathobj	0000,-450,-350,3000,r_bu_2,e_kururi,10,8	
	pathobj	0400,-100,-200,3000,r_bu_2,itadosun,10,8	
	maploop	.boards,03
	pathobj	4000,0000,-200,3000,r_bu_2,itadosun,10,8	

           	mapobj	0000,0800,0000,4000,rpillar3,flypillars_ISTRAT
           	mapobj	0000,-1000,0000,5000,rpillar3,flypillars_ISTRAT
           	mapobj	0000,1200,0000,6000,rpillar3,flypillars_ISTRAT
           	mapobj	0000,-900,0000,6000,rpillar3,flypillars_ISTRAT
	mapobj	0000,0000,0000,3000,rpillar3,pillar3_ISTRAT
           	mapobj	0000,0200,0000,3000,rpillar3,flypillars_ISTRAT
           	mapobj	0400,-200,0000,3000,rpillar3,flypillars_ISTRAT
           	mapobj	0000,0500,0000,3000,rpillar3,flypillars_ISTRAT
           	mapobj	0200,-500,0000,3000,rpillar3,flypillars_ISTRAT
	mapobj	1800,0000,0000,3000,rpillar3,pillar3_ISTRAT
;flypillar
	mapmother	8000,0000,0,4000,mother1,mother1_istrat,map_flypillars
       	mapobj	0800,0000,0000,3000,rpillar3,pillar3_ISTRAT
       	mapobj	0800,-200,0000,3000,rpillar3,pillar3_ISTRAT
       	mapobj	0800,0100,0000,3000,rpillar3,pillar3_ISTRAT
       	mapobj	0800,0300,0000,3000,rpillar3,pillar3_ISTRAT
       	mapobj	0800,-340,0000,3000,rpillar3,pillar3_ISTRAT
       	mapobj	0800,0050,0000,3000,rpillar3,pillar3_ISTRAT
       	mapobj	0800,-100,0000,3000,rpillar3,pillar3_ISTRAT
	maprem		mother1
;friend
	pathobj	0000,-750,-480,0000,friendship_4,chase6_1,10,10
	pathobj	1500,-720,-480,0000,zaco_a,chase6_2,10,10
	pathspecial	1500,0000,0000,3000,s_tank_0,e_tank,4,2
	mapobj	1000,-600,0,4000,bu_0,hard180YR_Istrat
;appear_blocks
	pathcspecial	2000,0300,0000,3000,tank_1,e_tank,4,2
	pathcspecial	2000,-250,0000,3000,tank_1,e_tank,4,2
;
	pathspecial	0500,-1100,-600,2000,zaco_a,patrol,10,10
	mapobj	0100,-500,-50,1800,R_BU_6,HARD_ISTRAT
	setalvar	roty,127
	mapobj	0100,-400,-150,1800,R_BU_6,HARD_ISTRAT
	setalvar	roty,110
	mapobj	0100,-300,-250,1800,R_BU_6,HARD_ISTRAT
	setalvar	roty,97
	mapobj	0100,-200,-300,1800,R_BU_6,HARD_ISTRAT
	setalvar	roty,86
	mapobj	0100,-100,-350,1800,R_BU_6,HARD_ISTRAT
	setalvar	roty,75
	mapobj	0100,0000,-400,1800,R_BU_6,HARD_ISTRAT
	setalvar	roty,64
	mapobj	0100,0100,-350,1800,R_BU_6,HARD_ISTRAT
	setalvar	roty,180
	mapobj	0100,0200,-300,1800,R_BU_6,HARD_ISTRAT
	setalvar	roty,168
	mapobj	0100,0300,-250,1800,R_BU_6,HARD_ISTRAT
	setalvar	roty,155
	mapobj	0100,0400,-150,1800,R_BU_6,HARD_ISTRAT
	setalvar	roty,140
	mapobj	0100,0500,-050,1800,R_BU_6,HARD_ISTRAT
	setalvar	roty,127
	pathcspecial	2500,0000,0000,3000,tank_1,e_tank,4,2
	mapobj	2000,-400,0,5000,bu_0,hard180YR_Istrat
	mapobj	2000,0400,0,5000,bu_0,hard180YR_Istrat

;movingwalls
       	mapobj	0000,0000,0000,4000,wall1,walll_ISTRAT
	map_setbarshape	wire
	map_SBtype16	0,10,-4,0,-speed,0
	map_SBtype16	5,-10,-3,0,speed,0
	map_SBtype16	0,10,-4,0,-speed,0
	map_SBtype16	5,-10,-3,0,speed,0
	mapwait	3000
       	mapobj	1500,-200,0000,4000,wall1,wallr_ISTRAT
       	mapobj	2000,0400,0000,4000,wall1,walll_ISTRAT
       	mapobj	0400,0000,0000,4000,rpillar3,pillar3_ISTRAT
       	mapobj	2000,0100,0000,4000,wall1,wallleftright_ISTRAT
	map_SBtype16	5,-10,-3,0,speed,0
	map_SBtype16	0,10,-4,0,-speed,0
	mapobj	0000,0000,-50,4000,item_7,item7_Istrat

	mapobj	1500,-350,0000,4000,wall1,wallr_ISTRAT
       	mapobj	0500,0350,0000,4200,wall1,walll_ISTRAT
	map_SBtype16	0,10,-4,0,-speed,0
	map_SBtype16	5,-10,-3,0,speed,0
	map_SBtype16	0,10,-4,0,-speed,0
	map_SBtype16	5,-10,-3,0,speed,0
	mapwait	1000
       	mapobj	1500,0000,0000,4000,wall1,wallleftright_ISTRAT
       	mapobj	1500,0400,0000,4200,wall1,wallleftright_ISTRAT
       	mapobj	0800,-400,0000,4200,wall1,wallleftright_ISTRAT
	map_SBtype16	0,10,-4,0,-speed,0
	map_SBtype16	5,-10,-3,0,speed,0
	map_SBtype16	0,10,-4,0,-speed,0
	map_SBtype16	5,-10,-3,0,speed,0
	map_SBtype16	0,10,-4,0,-speed,0
	map_SBtype16	4,-10,-3,0,speed,0
	mapobj	1500,-450,0000,4000,wall1,wallr_ISTRAT
       	mapobj	1500,0450,0000,4200,wall1,walll_ISTRAT
;gate
	mapobj	2000,0000,-200,4000,gate_0,gate_ISTRAT
	pathobj	1000,0000,-200,4000,nullshape,e_gate,10,10

;friend
	pathspecial	0000,0300,0000,3000,s_tank_0,e_tank,4,2
	pathobj	0000,000,-370,-150,friendship_4,chase7_1,10,10
	pathobj	1000,000,-370,-150,zaco_a,chase7_2,10,10
	special	0000,0,-270,3000,s_wark_0,spacebarwalker_Istrat
	mapobj	0000,-100,-125,3000,r_bu_7,hard180YR_Istrat
	mapobj	0100,0100,-125,3000,r_bu_7,hard180YR_Istrat
	skillfly_init
	skillfly_set 0000,-150,3000,150
	mapobj	0100,0000,-260,3000,r_bu_2,hard180YR_Istrat
	mapobj	0000,-100,-125,3000,r_bu_7,hard180YR_Istrat
	mapobj	1000,0100,-125,3000,r_bu_7,hard180YR_Istrat

	mapobj	0000,-300,-125,3000,r_bu_7,hard180YR_Istrat
	mapobj	0100,-100,-125,3000,r_bu_7,hard180YR_Istrat
	skillfly_set -200,-150,3000,150
	mapobj	0100,-200,-260,3000,r_bu_2,hard180YR_Istrat
	mapobj	0000,-300,-125,3000,r_bu_7,hard180YR_Istrat
	mapobj	1500,-100,-125,3000,r_bu_7,hard180YR_Istrat

	mapobj	0000,0000,-125,3000,r_bu_7,hard180YR_Istrat
	mapobj	0000,-200,-125,3000,r_bu_7,hard180YR_Istrat
	mapobj	0100,0200,-125,3000,r_bu_7,hard180YR_Istrat
	mapobj	0000,-100,-260,3000,r_bu_2,hard180YR_Istrat
	skillfly_set 0100,-150,3000,150
	mapobj	0100,0100,-260,3000,r_bu_2,hard180YR_Istrat
	mapobj	0000,0000,-125,3000,r_bu_7,hard180YR_Istrat
	mapobj	0000,-200,-125,3000,r_bu_7,hard180YR_Istrat
	mapobj	1000,0200,-125,3000,r_bu_7,hard180YR_Istrat

	mapobj	0000,0350,-300,3000,Bwarker_3,spacebarwalker_Istrat
	mapobj	0150,0350,-125,3000,r_bu_7,hard180YR_Istrat
	mapobj	0150,0350,-280,3000,r_bu_6,hard180YR_Istrat
	mapobj	0150,0350,-125,3000,r_bu_7,hard180YR_Istrat
	mapobj	0150,0350,-280,3000,r_bu_6,hard180YR_Istrat
	mapobj	0000,0350,-125,3000,r_bu_7,hard180YR_Istrat
	mapobj	0000,0200,-280,3000,r_bu_6,hard_Istrat
	setalvar	roty,deg90
	mapobj	0150,0050,-125,3000,r_bu_7,hard180YR_Istrat
	mapobj	0150,0050,-280,3000,r_bu_6,hard180YR_Istrat
	mapobj	1000,0050,-125,3000,r_bu_7,hard180YR_Istrat
	skillfly_bonus 0000,200,-100,1500,item_5,item5_istrat
	setalvar	sbyte1,1
;
	mapobj	0150,-050,-125,3000,r_bu_7,hard180YR_Istrat
	mapobj	0150,-050,-280,3000,r_bu_6,hard180YR_Istrat
	mapobj	0000,-050,-125,3000,r_bu_7,hard180YR_Istrat
	mapobj	0000,-200,-280,3000,r_bu_6,hard_Istrat
	setalvar	roty,deg90
	mapobj	0000,-350,-125,3000,r_bu_7,hard180YR_Istrat
	pathcspecial	0000,300,0000,3000,tank_1,e_tank,4,2
	mapobj	0000,-200,-280,3000,r_bu_6,hard_Istrat
	setalvar	roty,deg90
	mapobj	0150,-350,-125,3000,r_bu_7,hard180YR_Istrat
	mapobj	0150,-350,-280,3000,r_bu_6,hard180YR_Istrat
	mapobj	1000,-350,-125,3000,r_bu_7,hard180YR_Istrat

	mapobj	0150,0450,-125,3000,r_bu_7,hard180YR_Istrat
	mapobj	0150,0450,-280,3000,r_bu_6,hard180YR_Istrat
	mapobj	0000,0450,-125,3000,r_bu_7,hard180YR_Istrat
	skillfly_init
	skillfly_set 0300,-150,3000,150
	mapobj	0000,0300,-280,3000,r_bu_6,hard_Istrat
	setalvar	roty,deg90
	mapobj	0150,0150,-125,3000,r_bu_7,hard180YR_Istrat

	mapobj	0150,0350,-125,3000,r_bu_7,hard180YR_Istrat
	mapobj	0150,0350,-280,3000,r_bu_6,hard180YR_Istrat
	mapobj	0150,0350,-125,3000,r_bu_7,hard180YR_Istrat
	mapobj	0150,0350,-280,3000,r_bu_6,hard180YR_Istrat
	mapobj	1500,0350,-125,3000,r_bu_7,hard180YR_Istrat

	mapobj	0000,0500,0000,3000,bu_2,hard180YR_Istrat
	mapobj	1500,-200,0000,3000,bu_2,hard180YR_Istrat
	mapobj	0000,-300,-125,3000,r_bu_7,hard180YR_Istrat
	skillfly_set -150,-150,3000,150
	mapobj	0000,-150,-280,3000,r_bu_6,hard_Istrat
	setalvar	roty,deg90
	mapobj	1500,0000,-125,3000,r_bu_7,hard180YR_Istrat
	mapobj	0500,-300,0,4000,bu_8,hard180YR_Istrat
	mapobj	1200,-600,0,4000,bu_0,hard180YR_Istrat
	skillfly_bonus 0000,000,-180,1500,item_5,item5_istrat


	pathspecial	0500,1100,-600,3000,zaco_a,patrol,10,10
	cspecial	1000,-600,0000,4000,hou_5,houdai5f_istrat
	cspecial	1000,600,0000,1000,walker_0,walking_istrat
	cspecial	1000,0600,0000,4000,hou_5,houdai5f_istrat
	cspecial	1000,-600,0000,4000,hou_5,houdai5f_istrat
	cspecial	1000,-300,0000,1000,walker_0,walking_istrat
;friend
	pathobj	0000,-750,-480,0000,friendship_4,chase6_1,10,10
	pathobj	0800,-720,-480,0000,zaco_a,chase6_2,10,10
;------------------------------------------
.block
	mapblocksnd
	mapobj	0100,-250,-350,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0100,-150,-250,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0100,-250,-150,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0100,-150,-050,1000,R_BU_1,HARD180YR_ISTRAT

	mapblocksnd
	mapobj	0100,0250,-350,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0100,0150,-250,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0100,0250,-150,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0800,0150,-050,1000,R_BU_1,HARD180YR_ISTRAT

	mapblocksnd
	mapobj	0100,0000,-350,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0000,0100,-250,1000,R_BU_1,HARD180YR_ISTRAT
	mapobj	0100,-100,-250,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0100,0000,-150,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0000,0100,-050,1000,R_BU_1,HARD180YR_ISTRAT
	mapobj	0800,-100,-050,1000,R_BU_1,HARD180YR_ISTRAT
	maploop	.block,02

	mapblocksnd
	mapobj	0000,-500,-050,1000,R_BU_1,HARD180YR_ISTRAT
	mapobj	0100,0500,-050,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0000,-400,-150,1000,R_BU_1,HARD180YR_ISTRAT
	mapobj	0100,0400,-150,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0000,-300,-250,1000,R_BU_1,HARD180YR_ISTRAT
	mapobj	0100,0300,-250,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0000,-200,-350,1000,R_BU_1,HARD180YR_ISTRAT
	mapobj	0100,0200,-350,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0000,-100,-250,1000,R_BU_1,HARD180YR_ISTRAT
	mapobj	0100,0100,-250,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0100,0000,-150,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0000,-100,-050,1000,R_BU_1,HARD180YR_ISTRAT
	mapobj	0800,0100,-050,1000,R_BU_1,HARD180YR_ISTRAT
.block2
	mapblocksnd
	mapobj	0000,-300,-050,1000,R_BU_1,HARD180YR_ISTRAT
	mapobj	0100,0300,-050,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0000,-200,-150,1000,R_BU_1,HARD180YR_ISTRAT
	mapobj	0100,0200,-150,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0000,-100,-250,1000,R_BU_1,HARD180YR_ISTRAT
	mapobj	0100,0100,-250,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0100,0000,-350,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0100,0000,-250,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0100,0000,-150,1000,R_BU_1,HARD180YR_ISTRAT
	mapblocksnd
	mapobj	0100,0000,-050,1000,R_BU_1,HARD180YR_ISTRAT
	maploop .block2,02
;------------------------------------
	cspecial	1000,600,0000,4000,hou_5,houdai5f_istrat
	mapobj	1000,-1200,0,4000,bu_2,hard180YR_Istrat
	mapobj	1500,01200,0,4000,bu_2,hard180YR_Istrat
	mapobj	1000,0300,0,4000,bu_8,hard180YR_Istrat
	mapobj	1000,1000,0,4000,bu_2,hard180YR_Istrat
	mapobj	1000,-1400,0,4000,bu_2,hard180YR_Istrat

	pathobj	0000,-465,-420,3000,r_bu_2,e_kururi,10,8	
	pathobj	0000,-465,-120,3000,r_bu_2,e_kururi,10,8	
	pathobj	0000,-220,-220,3000,r_bu_2,e_kururi,10,8	
	pathobj	0000,-220,-520,3000,r_bu_2,e_kururi,10,8	
	pathobj	0000,0000,-420,3000,r_bu_2,e_kururi,10,8	
	pathobj	0000,0000,-120,3000,r_bu_2,e_kururi,10,8	
	pathobj	0000,0220,-220,3000,r_bu_2,e_kururi,10,8	
	pathobj	0000,0220,-520,3000,r_bu_2,e_kururi,10,8	
	pathobj	0000,0465,-420,3000,r_bu_2,e_kururi,10,8	
	pathobj	3500,0465,-120,3000,r_bu_2,e_kururi,10,8	
	pathspecial	0000,1100,-600,2000,zaco_a,patrol,10,10
	pathcspecial	0000,1300,-800,2500,zaco_a,patrol,10,10
	pathcspecial	0500,1500,-1000,3000,zaco_a,patrol,10,10

	mapobj	0000,0400,0,5000,bu_0,hard180YR_Istrat
	pathcspecial	0000,0350,0000,5250,walker_0,e_walk_1,4,4	
	mapobj	2000,-400,0,5000,bu_0,hard180YR_Istrat
	mapobj	0000,0400,0,5000,bu_0,hard180YR_Istrat
	pathcspecial	0000,-350,0000,5250,walker_0,e_walk_1,4,4	
	mapobj	2000,-400,0,5000,bu_0,hard180YR_Istrat

;------------------------------------------
	mapwait	2000
	fadeoutbgm
	setbgm	6
	incmap	transformer
	maprts


