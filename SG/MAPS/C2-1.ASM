;2-1-1;
	setrestart
	pathobj	1000,3000,0000,1000,nullshape,e_gate,10,10
;test

	cspecial	0000,-700,-500,0000,zaco_5,zaco1l_istrat
;	mapobj	0000,-1200,0000,5200,TOWER_2,TOWER0_ISTRAT
;	mapobj	2000,01200,0000,5200,TOWER_2,TOWER0_ISTRAT
;	mapobj	0000,-1200,0000,5500,TOWER_2,TOWER0_ISTRAT
;	mapobj	2000,01200,0000,5500,TOWER_2,TOWER0_ISTRAT
;
;	cspecial	0000,-200,-600,-500,zaco_5,zaco1L_istrat
;	pathobj	0000,-500,0000,5000,tow_0,tow_0,10,10
;	pathobj	0000,0500,0000,5000,tow_0,tow_0,10,10
;	mapobj	0000,-600,0000,4000,HOUDAI_0,HOUDAINS_ISTRAT
;	cspecial	1000,-0500,-200,4000,kamikaze,zaco3_istrat
;;friend
;	pathobj	0000,-850,-400,0000,friendship_4,chase6_1,10,10
;	pathcspecial	0000,-820,-400,0000,zaco_a,chase6_2,10,10
;
;	pathcspecial	0400,0000,-50,3200,bom_wing,ponpon,2,8
;	mapobj	0000,-1000,0000,5000,BU_0,HARD180YR_ISTRAT
;	mapobj	2000,01000,0000,5000,BU_0,HARD180YR_ISTRAT
;rader
	mapobj	0000,-300,-110,4000,RADER_0,RADER0_ISTRAT
	mapobj	0000,-300,0000,4000,RADER_1,RADER1_ISTRAT
	mapobj	0000,0300,-110,4000,RADER_0,RADER0_ISTRAT
	mapobj	1000,0300,0000,4000,RADER_1,RADER1_ISTRAT
	skillfly_init
;	skillfly_set 0000,-60,4000,100
;	mapobj	1000,0000,0000,4000,arch_0,hard_ISTRAT
;;across_robot
;	pathobj	0000,-800,0000,5000,robot_0,robot,6,4
;	setalvar	roty,-deg45
;	mapobj	0000,1000,0000,5000,BU_5,HARD_ISTRAT
;	setalvar	roty,96
;	mapwait	2000
;	mapobj	0000,-1000,0000,5000,BU_6,HARD_ISTRAT
;	setalvar	roty,64
;	mapobj	0000,-200,0000,4000,arch_0,hard_ISTRAT
;	skillfly_set -200,-60,4000,100
;	mapwait	2000
;;robot_walking
;	pathobj	0000,1600,0000,4000,nullshape,robotwithlog,6,4
;	setalvar	roty,deg45+deg22
;
;	mapobj	1200,0800,0000,5000,BU_6,HARD180YR_ISTRAT
;	skillfly_set -300,-60,4000,100
;	mapobj	1200,-300,0000,4000,arch_0,hard_ISTRAT
;	mapobj	2000,-700,0000,5000,BU_1,HARD180YR_ISTRAT
;	mapobj	0000,0700,0000,5000,BU_4,HARD180YR_ISTRAT
;	setalvar	roty,96
	skillfly_set 0200,-60,4000,100
	mapobj	2000,0200,0000,4000,arch_0,hard_ISTRAT
;base
	mapobj	2000,-250,0000,5200,base_1,base_1_ISTRAT
	skillfly_bonus 0000,-250,-50,3400,item_7,item7_istrat
	setalvar	sbyte1,1
	mapwait	600
;	mapobj	2000,0700,0000,5000,BU_5,HARD180YR_ISTRAT
;	mapobj	2000,-700,0000,5000,BU_6,HARD180YR_ISTRAT
;	mapobj	1000,0600,0000,5000,BU_5,HARD180YR_ISTRAT
;	special	0300,0600,-200,-300,zaco_a,zaco1R_istrat
;	cspecial	0300,0600,-200,-250,zaco_5,zaco1R_istrat
;	cspecial	0900,0600,-200,-500,zaco_5,zaco1R_istrat
;	pathcspecial	0000,-200,0000,5000,walker_2,korori,6,4
;	mapobj	0000,-1000,0000,5000,TOWER_2,TOWER0_ISTRAT
;	mapobj	1000,01000,0000,5000,TOWER_2,TOWER0_ISTRAT
;	pathcspecial	1000,0400,-50,3100,bom_wing,ponpon,10,10
;	mapobj	0000,-1000,0000,5000,TOWER_2,TOWER0_ISTRAT
;	mapobj	1000,01000,0000,5000,TOWER_2,TOWER0_ISTRAT
;	cspecial	0000,0000,-1500,2200,zaco_6,zacos_istrat
;	pathcspecial	1000,0000,-50,3100,bom_wing,ponpon,10,10
;	mapobj	0000,-1000,0000,5000,TOWER_2,TOWER0_ISTRAT
;	mapobj	2000,01000,0000,5000,TOWER_2,TOWER0_ISTRAT
;	mapobj	0000,-1000,0000,5000,TOWER_2,TOWER0_ISTRAT
;	mapobj	2000,01000,0000,5000,TOWER_2,TOWER0_ISTRAT
;	
;
;;2-1-2;
;;buildings
;	mapobj	0400,-800,0000,4000,BU_6,HARD180YR_ISTRAT
;	mapobj	0400,0800,0000,4000,BU_6,HARD180YR_ISTRAT
;  	special	0000,-300,-1300,1800,CARRIER,CARRIER_ISTRAT
;	mapobj	0000,-600,0000,4000,BU_1,HARD180YR_ISTRAT
;	mapobj	0400,0600,0000,4000,BU_1,HARD180YR_ISTRAT
;	mapobj	0000,-500,0000,4000,BU_1,HARD180YR_ISTRAT
;	mapobj	0400,0500,0000,4000,BU_1,HARD180YR_ISTRAT
;	mapobj	0000,-400,0000,4000,BU_1,HARD180YR_ISTRAT
;	mapobj	0400,0400,0000,4000,BU_1,HARD180YR_ISTRAT
;
;	mapobj	0000,0200,0000,4000,BU_2,HARD180YR_ISTRAT
;	mapobj	3000,-200,0000,4000,BU_2,HARD180YR_ISTRAT
;	cspecial	0000,0000,-400,1000,PARA_0,PARA_ISTRAT
;	cspecial	0000,0100,-500,1000,PARA_0,PARA_ISTRAT
;	cspecial	0500,-100,-500,1000,PARA_0,PARA_ISTRAT
;;2-1-3;
;	mapobj	0000,-400,0000,2000,BU_1,HARD180YR_ISTRAT
;	mapobj	0500,0400,0000,2000,BU_1,HARD180YR_ISTRAT
	mapobj	0000,-600,0000,4000,BU_5,HARD_ISTRAT
	setalvar	roty,96
	mapobj	0000,0600,0000,4000,BU_4,HARD_ISTRAT
	setalvar	roty,96
	mapwait	1000
	mapobj	0000,-600,0000,4000,BU_5,HARD_ISTRAT
	setalvar	roty,96
	mapobj	0000,0600,0000,4000,BU_4,HARD_ISTRAT
	setalvar	roty,96
	mapwait	1000
	mapobj	0000,0400,0000,4000,BU_6,HARD180YR_ISTRAT
	setalvar	roty,96
	mapobj	0000,-400,0000,4000,BU_6,HARD180YR_ISTRAT
	setalvar	roty,96
	mapwait	0800
;	mapobj	1000,0000,0000,4000,BU_7,HARD180YR_ISTRAT
;	mapobj	0000,0200,0000,4000,BU_7,HARD180YR_ISTRAT
;	mapobj	1000,-200,0000,4000,BU_7,HARD180YR_ISTRAT
;	mapobj	0000,-700,0000,3500,BU_2,HARD180YR_ISTRAT
;	mapobj	0000,0700,0000,3500,BU_2,HARD180YR_ISTRAT
;	mapobj	0000,0400,0000,4000,BU_4,HARD_ISTRAT
;	setalvar	roty,96
;	mapobj	0000,-400,0000,4000,BU_4,HARD_ISTRAT
;	setalvar	roty,96
;	mapwait	1000
;	mapobj	0000,0400,0000,4000,BU_4,HARD_ISTRAT
;	setalvar	roty,96
;	cspecial	0000,-1800,-600,4400,zaco_5,zaco0_istrat
;	mapobj	0000,-400,0000,4000,BU_4,HARD_ISTRAT
;	setalvar	roty,96
;	mapwait	2000
;;formation
;	cspecial	0100,0000,-1400,2100,zaco_6,zacos_istrat
;	special	0000,-150,-1500,2300,zaco_a,zacos_istrat
;	special	0100,0150,-1500,2300,zaco_a,zacos_istrat
;	cspecial	0000,0300,-1700,2600,zaco_6,zacos_istrat
;	cspecial	2000,-300,-1700,2600,zaco_6,zacos_istrat
;	mapobj	0000,-1000,0000,5000,TOWER_2,TOWER0_ISTRAT
;	mapobj	2000,01000,0000,5000,TOWER_2,TOWER0_ISTRAT
;	mapobj	0000,-1000,0000,5000,TOWER_2,TOWER0_ISTRAT
;	mapobj	2000,01000,0000,5000,TOWER_2,TOWER0_ISTRAT
;
;	pathobj	0000,0300,0000,4000,tow_0,tow_0,10,10
;	pathobj	3000,-300,0000,4000,tow_0,tow_0,10,10

	mapobj	0000,0600,0000,4000,BU_4,HARD180YR_ISTRAT
	mapobj	1000,-600,0000,4000,BU_5,HARD180YR_ISTRAT

	mapobj	0000,0300,0000,4000,BU_6,HARD180YR_ISTRAT
	mapobj	0400,-300,0000,4000,BU_6,HARD180YR_ISTRAT
;2-1-3;
	skillfly_init
	skillfly_set 0000,-60,4000
	mapobj	0200,0000,000,4000,arch_0,hard_ISTRAT
;friend
	pathobj	0000,0000,-350,-150,friendship_4,chase7_1,10,10
	pathcspecial	3000,0000,-350,-150,zaco_a,chase7_2,10,10
	pathcspecial	0000,0150,-50,3100,bom_wing,ponpon,10,10

;;;;;	mapHARDRot	wait,   x,   y,   z, shape, x,y,z(+or- speed)
	mapHARDRot	0000,0400,0000,4000,tower_2,0,4,0
	mapHARDRot	0800,-400,0000,4000,tower_2,0,-4,0
	skillfly_bonus 0000,0000,-80,1500,gate_0,gate3_istrat

	skillfly_set 0000,-60,4000
	mapobj	1500,0000,0000,4000,arch_0,hard_ISTRAT

	mapobj	0000,0100,0000,4000,BU_8,HARD180YR_ISTRAT
	mapobj	0500,-100,0000,4000,BU_8,HARD180YR_ISTRAT
	mapHARDRot	0000,0480,0000,4000,tower_2,0,6,0
	mapHARDRot	1000,-480,0000,4000,tower_2,0,-6,0
	skillfly_set 0000,-60,4000
	mapobj	1000,0000,0000,4000,arch_0,hard_ISTRAT
;twinrobot_pillar
	skillfly_set 0250,-60,4000,100
	pathobj	0000,-1500,0000,4000,nullshape,robotswithlog,6,4
	setalvar	roty,-deg90
	mapwait	1000
;
bombwing
;	pathcspecial	0000,0300,-50,3500,bom_wing,ponpon,2,8
;	cspecial	2200,-100,-30,3500,bom_wing,bomwing_ISTRAT
;;pillars
;	mapobj	0000,1400,0000,4000,PILLAR3,pillar3_ISTRAT
;	mapobj	1200,-1400,0000,4000,PILLAR3,pillar3_ISTRAT
;	mapobj	0000,1200,0000,4000,PILLAR3,pillar3_ISTRAT
;	mapobj	1200,-1200,0000,4000,PILLAR3,pillar3_ISTRAT
;	skillfly_bonus 0000,0100,-80,1500,item_5,item5_istrat
;	mapobj	0000,1000,0000,4000,PILLAR3,pillar3_ISTRAT
;	mapobj	1200,-1000,0000,4000,PILLAR3,pillar3_ISTRAT
;	mapobj	0000,0800,0000,4000,PILLAR3,pillar3_ISTRAT
;	mapobj	1200,-800,0000,4000,PILLAR3,pillar3_ISTRAT
;	mapobj	0000,0600,0000,4000,PILLAR3,pillar3_ISTRAT
;	mapobj	1400,-500,0000,4000,PILLAR3,pillar3_ISTRAT
;	mapobj	0000,-900,0000,5000,BU_2,HARD180YR_ISTRAT
;	mapobj	0000,0900,0000,5000,BU_2,HARD180YR_ISTRAT
;	mapobj	0000,0400,0000,4000,PILLAR3,pillar3_ISTRAT
;	mapobj	1200,-400,0000,4000,PILLAR3,pillar3_ISTRAT
;	mapobj	0000,-300,0000,4000,PILLAR3,PILLAR3_ISTRAT
;	mapobj	1000,0300,0000,4000,PILLAR3,PILLAR3_ISTRAT
;	mapobj	0000,0250,0000,4000,PILLAR3,PILLAR3_ISTRAT
;	mapobj	1000,-250,0000,4000,PILLAR3,PILLAR3_ISTRAT
;	mapobj	0000,0200,0000,4000,PILLAR3,PILLAR3_ISTRAT
;	mapobj	0900,-200,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	0000,-700,0000,5000,BU_0,HARD180YR_ISTRAT
	mapobj	0000,0700,0000,5000,BU_0,HARD180YR_ISTRAT
	mapobj	0000,0150,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	0800,-150,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	0000,0150,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	0700,-150,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	0000,0200,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	0600,-200,0000,4000,PILLAR3,PILLAR3_ISTRAT
	pathcspecial	0000,300,-50,3100,bom_wing,ponpon,10,10
	mapobj	0000,0150,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	2000,-150,0000,4000,PILLAR3,PILLAR3_ISTRAT
;gate
;	mapobj	0000,0000,-150,4000,gate_0,gate_ISTRAT
;	pathobj	1000,3000,0000,1000,nullshape,e_gate,10,10
;	mapwait	1000

	mapobj	0000,0240,0000,4000,BU_4,HARD_ISTRAT
	setalvar	roty,64
	mapobj	0000,-0240,0000,4000,BU_4,HARD180yr_ISTRAT
	mapobj	0000,0000,-120,4200,item_5,item5_Istrat
	setalvar	sbyte1,1

	pathcspecial	1400,-1500,-700,2000,zaco_5,patrol,2,10
	pathcspecial	1000,0000,-50,3500,bom_wing,ponpon,2,8
	mapwait	1000
	special	0100,0000,-1300,2000,zaco_a,zacos_istrat
	cspecial	0000,0200,-1500,2200,zaco_6,zacos_istrat
	cspecial	0100,-200,-1500,2200,zaco_6,zacos_istrat
	cspecial	0000,0300,-1700,2400,zaco_6,zacos_istrat
	cspecial	2500,-300,-1700,2400,zaco_6,zacos_istrat
;
	mapobj	0000,1400,0000,4000,BU_6,HARD180YR_ISTRAT
	setalvar	roty,96
	mapobj	0000,-1400,0000,4000,BU_6,HARD180YR_ISTRAT
	setalvar	roty,96
	mapwait	2500
	pathobj	0000,0800,0000,5000,tow_0,tow_0,10,10
	pathobj	4500,-800,0000,5000,tow_0,tow_0,10,10
;43 specials
;chase 2 times
