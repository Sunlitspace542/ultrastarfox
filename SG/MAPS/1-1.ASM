;1-1-1;
	ifeq	0
	setrestart

;***********************************************************************
	pathobj	1000,3000,0000,1000,nullshape,e_gate,10,10
;test
	start_65816
	lda	bgmspeed
	beq	.nochange3
	cmp	#1
	beq	.slow3
	cmp	#2
	beq	.fast3
.slow3
	startbgm	$f4
	bra	.nochange3
.fast3
	startbgm	$f5
.nochange3
	end_65816
	cspecial	0000,-700,-500,0000,zaco_5,zaco1l_istrat
	mapobj	0000,-1200,0000,5000,BU_1,HARD180YR_ISTRAT
	mapobj	1500,01200,0000,5000,BU_1,HARD180YR_ISTRAT

	mapobj	0000,-1200,0000,5000,BU_1,HARD180YR_ISTRAT
	mapobj	1500,01200,0000,5000,BU_1,HARD180YR_ISTRAT

	mapobj	0000,0000,0000,4000,arch_0,hard_ISTRAT
	skillfly_init
	skillfly_set 0000,-60,4000,100
	mapobj	0000,-1200,0000,5000,BU_1,HARD180YR_ISTRAT
	mapobj	1500,01200,0000,5000,BU_1,HARD180YR_ISTRAT

	mapobj	0000,0200,0000,4000,arch_0,hard_ISTRAT
	skillfly_set 0200,-60,4000,100
	mapobj	0000,-1200,0000,5000,BU_1,HARD180YR_ISTRAT
	mapobj	1500,01200,0000,5000,BU_1,HARD180YR_ISTRAT

	skillfly_set -200,-60,4000,100
	mapobj	0800,-200,0000,4000,arch_0,hard_ISTRAT
	special	0200,0400,-400,0000,zaco_a,zaco1r_istrat
	mapobj	0000,0350,-030<<2,4000,RADER_0,RADER0_ISTRAT
	mapobj	1000,0350,0000,4000,RADER_1,RADER1_ISTRAT

	cspecial	1500,0400,-400,-250,zaco_5,zaco1r_istrat
	skillfly_set 0000,-60,4000,100
	mapobj	0500,0000,0000,4000,arch_0,hard_ISTRAT

	mapobj	0000,-600,0000,5000,BU_0,HARD180YR_ISTRAT
	mapobj	1500,0600,0000,5000,BU_0,HARD180YR_ISTRAT
	mapobj	2000,0000,0000,4500,big_gate,hard_ISTRAT
	skillfly_bonus 0000,0000,-50,2500,item_7,item7_istrat
	setalvar	sbyte1,1
	cspecial	0500,0200,-30,3200,bom_wing,bomwing_Istrat,2,8
	mapobj	0000,-600,0000,5000,BU_0,HARD180YR_ISTRAT
	mapobj	3000,0600,0000,5000,BU_0,HARD180YR_ISTRAT

	pathobj	0000,-500,0000,4000,tow_0,tow_0,10,10
	pathobj	1500,0500,0000,4000,tow_0,tow_0,10,10

;1-1-3;

	special	0000,0000,-1000,2300,zaco_a,zacos_istrat
	cspecial	0000,-200,-1300,2300,zaco_6,zacos_istrat
	cspecial	3500,0200,-1300,2300,zaco_6,zacos_istrat
	mapobj	0000,0800,0000,4000,TOWER_2,TOWER0_ISTRAT
	mapobj	3000,-800,0000,4000,TOWER_2,TOWER0_ISTRAT
	cspecial	0000,-800,-300,3000,kamikaze,zaco4_istrat

	pathobj	0000,0000,0000,4000,tow_0,tow_0,10,10
	mapobj	0000,0000,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	0000,01200,0000,4000,TOWER_2,TOWER0_ISTRAT
	mapobj	0600,-1200,0000,4000,TOWER_2,TOWER0_ISTRAT
	cspecial	0000,800,-250,3000,kamikaze,zaco4_istrat
	mapobj	0000,0400,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	3500,-400,0000,4000,PILLAR3,PILLAR3_ISTRAT
;twinrobot_pillar
;	mapif	playertwocheck,.norobhere4
;	pathobj	0000,1200,0000,3500,nullshape,robotswithlog,6,4
;	setalvar	roty,deg90
;.norobhere4
	mapwait	0800

	mapobj	0000,0200,0000,5000,BU_8,HARD180YR_ISTRAT
	mapobj	2400,-200,0000,5000,BU_8,HARD180YR_ISTRAT
;friend

	mapif	assaultcheck,.nofriends1
	pathobj	0000,0750,-100,0000,friendship_4,chase8_1,10,10	

	pathcspecial	0000,3800,-3600,4260,zaco_a,chase8_2,10,10	
.nofriends1
	mapobj	0000,0800,0000,5000,BU_6,HARD180YR_ISTRAT
	pathcspecial	0000,0000,0000,5000,walker_2,korori,6,4
	mapobj	0000,0200,-50,5000,r_BU_1,HARD180YR_ISTRAT
	mapobj	0000,-200,-50,5000,r_BU_1,HARD180YR_ISTRAT
	mapif	assaultcheck,.nofriends11
	pathcspecial	2000,0750,-100,0000,zaco_a,chase8_3,10,10	
.nofriends11
	mapobj	0000,0200,-50,5000,r_BU_1,HARD180YR_ISTRAT
	mapobj	0000,-200,-50,5000,r_BU_1,HARD180YR_ISTRAT
	mapobj	2000,-800,0000,5000,BU_2,HARD180YR_ISTRAT
	mapobj	0000,0200,-50,5000,r_BU_1,HARD180YR_ISTRAT
	mapobj	0000,-200,-50,5000,r_BU_1,HARD180YR_ISTRAT
	mapobj	0000,0200,-50,5000,r_BU_1,HARD180YR_ISTRAT
;tumble_robot
	mapif	playertwocheck,.norobhere3
	pathobj	0000,-400,0000,5000,robot_0,robot,6,4
	setalvar	roty,-deg45-deg22
.norobhere3
	mapobj	1000,-200,-50,5000,r_BU_1,HARD180YR_ISTRAT
	mapobj	0000,0800,0000,5000,BU_5,HARD_ISTRAT
	setalvar	roty,64
	mapwait	2000
;	mapexploderobot
	mapobj	0000,0820,0000,4500,BU_1,HARD180YR_ISTRAT
	mapobj	1400,-1200,0000,4000,BU_2,HARD180YR_ISTRAT
	cspecial	0000,0300,-30,4000,bom_wing,bomwing_ISTRAT
	mapobj	0000,-820,0000,4500,BU_1,HARD180YR_ISTRAT
	mapobj	2000,0820,0000,4500,BU_1,HARD180YR_ISTRAT
	mapobj	0000,-900,0000,5000,BU_0,HARD180YR_ISTRAT
	mapobj	2800,0900,0000,5000,BU_0,HARD180YR_ISTRAT
;town
	mapobj	0000,-1000,0000,4500,BU_1,HARD180YR_ISTRAT
	mapobj	0000,1000,0000,4500,BU_6,HARD180YR_ISTRAT
	mapobj	0000,-800,0000,5000,BU_2,HARD180YR_ISTRAT

	mapobj	0000,500,0000,5000,BU_5,HARD_ISTRAT
	setalvar	roty,64
	mapobj	2000,-350,0000,5000,BU_4,HARD180YR_ISTRAT
	mapobj	0000,-400,0000,4000,BU_4,HARD180YR_ISTRAT
	mapobj	0000,400,0000,4000,BU_4,HARD_ISTRAT
	setalvar	roty,64
	mapwait	1400
	mapobj	1200,0000,0000,4000,BU_7,HARD180YR_ISTRAT
	mapobj	0000,-1000,0000,4000,BU_6,HARD180YR_ISTRAT
	mapobj	0600,1000,0000,4000,BU_6,HARD180YR_ISTRAT


	mapobj	0000,-450,0000,4000,BU_6,HARD180YR_ISTRAT
	mapobj	0700,0450,0000,4000,BU_6,HARD180YR_ISTRAT

	pathcspecial	1000,-1800,-600,2000,zaco_5,patrol,10,10

	mapobj	1200,0100,0000,4000,BU_7,HARD180YR_ISTRAT
	mapobj	0000,-1000,0000,4000,BU_0,HARD180YR_ISTRAT
	mapobj	0600,1000,0000,4000,BU_0,HARD180YR_ISTRAT
	mapobj	0000,-400,0000,4000,BU_4,HARD180YR_ISTRAT
	mapobj	0600,0450,0000,4000,BU_6,HARD180YR_ISTRAT
	mapobj	0600,-400,0000,4000,BU_4,HARD180YR_ISTRAT
	mapobj	0000,0450,0000,4000,BU_6,HARD180YR_ISTRAT
	mapobj	1400,-400,0000,4000,BU_4,HARD180YR_ISTRAT
;1-1-4;
	mapobj	1000,0000,0000,4000,BU_7,HARD180YR_ISTRAT
	mapobj	0000,-900,0000,4000,BU_0,HARD180YR_ISTRAT
	mapobj	0600,0900,0000,4000,BU_0,HARD180YR_ISTRAT
	mapobj	0000,-400,0000,4000,BU_4,HARD180YR_ISTRAT
	mapobj	1000,0400,0000,4000,BU_5,HARD90YR_ISTRAT
;item
	mapobj	0000,440,-230,4050,item_5,item5_istrat
	setalvar	sbyte1,1

	mapobj	0000,0400,0000,4000,BU_5,HARD90YR_ISTRAT
	mapobj	0800,-400,0000,4000,BU_4,HARD180YR_ISTRAT

	pathcspecial	0400,-1500,-700,2000,zaco_5,patrol,10,10
	mapobj	0000,01000,0000,4000,BU_0,HARD180YR_ISTRAT
	mapobj	0500,-1000,0000,4000,BU_0,HARD180YR_ISTRAT
	mapobj	0000,0350,0000,4000,BU_4,HARD_ISTRAT
	setalvar	roty,64
	pathcspecial	0000,0000,0000,5000,walker_2,korori,6,4
	mapobj	0800,-350,0000,4000,BU_4,HARD180YR_ISTRAT
	mapobj	0000,0350,0000,4000,BU_4,HARD_ISTRAT
	setalvar	roty,64
	mapobj	0000,-350,0000,4000,BU_4,HARD180YR_ISTRAT
	pathcspecial	0500,2000,-500,2000,zaco_5,patrol,10,10
	mapwait	800

	mapobj	0000,0450,0000,4000,BU_6,HARD180YR_ISTRAT
	setalvar	roty,64
	mapobj	0800,-400,0000,4000,BU_5,HARD180YR_ISTRAT
	mapobj	0000,0450,0000,4000,BU_6,HARD180YR_ISTRAT
	mapobj	1100,-400,0000,4000,BU_5,HARD180YR_ISTRAT

;robot_walking
;	mapif	playertwocheck,.norobhere44
;	pathobj	0000,1300,0000,3800,nullshape,robotwithlog,6,4
;	setalvar	roty,deg90
;.norobhere44
	mapwait	500
	pathcspecial	0000,0000,0000,5000,walker_2,korori,6,4
;	pathcspecial	2000,-200,-50,3200,bom_wing,ponpon,2,8
	mapobj	1000,0000,-100,4000,gate_0,gate3_ISTRAT

	mapobj	0000,-900,0000,5000,BU_0,HARD180YR_ISTRAT
	mapobj	1000,0900,0000,5000,BU_0,HARD180YR_ISTRAT
;	mapobj	0800,0350,0000,4000,PILLAR3,PILLAR3_ISTRAT
;	mapobj	0800,-350,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	0000,-900,0000,5000,BU_0,HARD180YR_ISTRAT
	mapobj	0000,0900,0000,5000,BU_0,HARD180YR_ISTRAT
;	mapobj	0800,0300,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	0800,-250,0000,4000,PILLAR3,PILLAR3_ISTRAT
;	mapobj	0000,-900,0000,5000,BU_0,HARD180YR_ISTRAT
;	mapobj	0000,0900,0000,5000,BU_0,HARD180YR_ISTRAT
	mapobj	0800,0250,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	0100,-200,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	1500,0200,0000,4000,PILLAR3,PILLAR3_ISTRAT
;1-1-5;
	cspecial	0100,0400,-600,-200,ZACO_5,ZACO1R_ISTRAT
	cspecial	0800,-400,-800,-200,ZACO_5,ZACO1L_ISTRAT


;robot_walking
;	mapif	playertwocheck,.norobhere
;	pathobj	0000,-1000,0000,3500,nullshape,robotwithlog,6,4
;	setalvar	roty,-deg45-deg22
;.norobhere
;friend
	mapobj	0000,-1000,0000,6000,BU_5,HARD180YR_ISTRAT

	mapobj	0000,01000,0000,6000,BU_4,HARD_ISTRAT

	setalvar	roty,64
	mapwait	1000
	mapif	assaultcheck,.nofriends2
	pathobj	0000,-750,-400,0000,friendship_4,chase6_1,10,10	
	pathcspecial	2000,-720,-400,0000,zaco_a,chase6_2,10,10	
.nofriends2
	mapobj	1000,-1000,0000,6000,BU_5,HARD180yr_ISTRAT
	mapobj	0000,1300,0000,6000,BU_5,HARD_ISTRAT
	setalvar	roty,64
	mapwait	2000
	cspecial	0000,0200,-50,3200,bom_wing,bomwing_Istrat,2,8
;robot_walking
;	mapif	playertwocheck,.norobhere2
;	pathobj	0000,800,0000,3500,nullshape,robotwithlog,6,4
;	setalvar	roty,deg45+deg22
;.norobhere2
	mapobj	1000,-1000,0000,6000,BU_4,HARD180YR_ISTRAT
	mapobj	0000,1300,0000,6000,BU_4,HARD_ISTRAT
	setalvar	roty,64
;gate
	mapobj	0000,0000,-150,4000,gate_0,gate_ISTRAT	
	pathobj	1000,3000,0000,1000,nullshape,e_gate,10,10
	mapwait	500
	start_65816
	lda	bgmspeed
	beq	.nochange3x
	cmp	#1
	beq	.slow3x
	cmp	#2
	beq	.fast3x
.slow3x
	startbgm	$f4
	bra	.nochange3x
.fast3x
	startbgm	$f5
.nochange3x
	end_65816
 	pathcspecial	1000,-250,-1800,0000,CARRIER,e_ufo,10,10
	mapobj	0000,01300,0000,6000,BU_2,HARD180YR_ISTRAT
	mapobj	2000,-1300,0000,6000,BU_2,HARD180YR_ISTRAT

	special	0400,-400,-200,-200,ZACO_a,ZACO1l_ISTRAT
	mapobj	0000,-1300,0000,7000,BU_5,HARD180YR_ISTRAT
	mapobj	0000,01300,0000,7000,BU_4,HARD_ISTRAT
	setalvar	roty,120
	mapwait	3000
	mapobj	0000,01300,0000,7000,BU_6,HARD180YR_ISTRAT
	mapobj	3000,-1300,0000,7000,BU_6,HARD180YR_ISTRAT
;	special	0400,0500,-200,-200,ZACO_a,ZACO1R_ISTRAT
;	special	2600,-500,-200,-200,ZACO_a,ZACO1L_ISTRAT
	mapobj	0000,01300,0000,6000,BU_4,HARD_ISTRAT
	setalvar	roty,120
	mapobj	4000,-1300,0000,6000,BU_5,HARD180YR_ISTRAT
;across_robot
	mapif	playertwocheck,.norobhere5
	pathobj	0000,-350,0000,4000,robot_0,robot,6,4
	setalvar	roty,-deg45
.norobhere5
	mapwait	4000
;26 specials
	endc
