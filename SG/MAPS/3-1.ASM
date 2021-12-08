
;	IFEQ	1
;3-1-1;
	setrestart
	pathobj	1000,3000,0000,1000,nullshape,e_gate,10,10
;
	mapwait	500
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
	cspecial	0000,-200,-700,-500,zaco_5,zaco1L_istrat
	special	0000,0200,-900,-500,zaco_a,zaco1R_istrat
.houdai	mapobj	0000,-700,0000,5000,HOUDAI_0,HOUDAINS_ISTRAT
	mapobj	0000,0700,0000,5000,HOUDAI_0,HOUDAIns_ISTRAT
;andross

	mapobj	0000,-1200,0000,4800,BU_1,HARD180YR_ISTRAT
	mapobj	1500,01200,0000,4800,BU_1,HARD180YR_ISTRAT
	maploop .houdai,02

	skillfly_init
	skillfly_set 0000,-60,4000,100

	mapobj	0000,0000,0000,4000,arch_0,hard_ISTRAT
	mapobj	0000,-1200,0000,5000,BU_1,HARD180YR_ISTRAT
	mapobj	1500,01200,0000,5000,BU_1,HARD180YR_ISTRAT

	mapobj	0000,0400,-110,4000,RADER_0,RADER0_ISTRAT
	mapobj	0000,0400,0000,4000,RADER_1,RADER1_ISTRAT
	mapobj	0000,-400,-110,4000,RADER_0,RADER0_ISTRAT
	mapobj	1500,-400,0000,4000,RADER_1,RADER1_ISTRAT
;
	mapobj	0000,0000,-110,4000,RADER_0,RADER0_ISTRAT
	mapobj	2000,0000,0000,4000,RADER_1,RADER1_ISTRAT
	mapobj	0000,-250,0000,3200,HOUDAI_0,HOUDAI_ISTRAT
	mapobj	1200,0250,0000,3200,HOUDAI_0,HOUDAI_ISTRAT
	cspecial	0200,-600,-700,-200,zaco_5,zaco1L_istrat
	special	0200,0400,-700,-300,zaco_a,zaco1r_istrat
	cspecial	1000,0600,-900,-500,zaco_5,zaco1R_istrat
	skillfly_set -300,-60,4000,100
	mapobj	0000,-300,0000,4000,arch_0,hard_ISTRAT
	setalvar	roty,deg45
.bu_0	mapobj	0000,-1200,0000,5000,BU_0,HARD180YR_ISTRAT
	mapobj	1000,01200,0000,5000,BU_0,HARD180YR_ISTRAT
	maploop .bu_0,03
	skillfly_set 0300,-60,4000,100
	mapobj	0000,0300,0000,4000,arch_0,hard_ISTRAT
	setalvar	roty,-deg45
;3-1-2;
	cspecial	0500,0000,-50,3200,bom_wing,bomwing_Istrat,2,8
	mapobj	0000,0900,0000,4000,TOWER_2,TOWER0_ISTRAT
	mapobj	3000,-900,0000,4000,TOWER_2,TOWER0_ISTRAT
;across_robot
	mapif	playertwocheck,.norob
	pathobj	0000,-350,0000,5000,robot_0,robot,6,4
;across_robot
	pathobj	0000,0350,0000,5000,robot_0,robot,6,4
.norob
	mapobj	0000,0900,0000,4000,TOWER_2,TOWER0_ISTRAT
	mapobj	1000,-900,0000,4000,TOWER_2,TOWER0_ISTRAT
	skillfly_set 0000,-60,4000,100
	mapobj	3000,0000,0000,4000,arch_0,hard_ISTRAT

;friend
	mapif		assaultcheck,.nofriends1
	pathobj	0000,0000,-400,-150,friendship_4,chase7_1,10,10

	pathcspecial	1000,0000,-400,-150,zaco_a,chase7_2,10,10
.nofriends1
;base
	mapobj	0000,-400,0000,5000,base_1,base_1_ISTRAT
	mapobj	0000,0400,-50,5200,item_5,item5_Istrat
	setalvar	sbyte1,1
	skillfly_bonus 0000,-400,-50,5200,item_7,item7_istrat
	setalvar	sbyte1,1
	mapobj	2000,0400,0000,5000,base_1,base_1_ISTRAT
	mapobj	0000,0900,0000,4000,TOWER_2,TOWER0_ISTRAT
	mapobj	1500,-900,0000,4000,TOWER_2,TOWER0_ISTRAT
	mapobj	0000,0900,0000,4000,TOWER_2,TOWER0_ISTRAT
	mapobj	1500,-900,0000,4000,TOWER_2,TOWER0_ISTRAT

	mapobj	0000,0900,0000,4000,TOWER_2,TOWER0_ISTRAT
	mapobj	1500,-900,0000,4000,TOWER_2,TOWER0_ISTRAT
	cspecial	1500,0000,-50,3200,bom_wing,bomwing_Istrat,2,8

	mapobj	0000,0300,0000,4000,BU_8,HARD180YR_ISTRAT
	mapobj	1500,-300,0000,4000,BU_8,HARD180YR_ISTRAT

	mapobj	0000,1000,0000,4000,TOWER_2,TOWER0_ISTRAT
	mapobj	1000,-1000,0000,4000,TOWER_2,TOWER0_ISTRAT
	special		0000,-200,-1300,2300,zaco_a,zacos_istrat
	cspecial	1500,0200,-1300,2300,zaco_6,zacos_istrat

	mapobj	0000,0300,0000,4000,BU_8,HARD180YR_ISTRAT
	mapobj	1500,-300,0000,4000,BU_8,HARD180YR_ISTRAT


	cspecial	3000,0000,-50,3200,bom_wing,bomwing_Istrat,2,8
	mapobj	0000,1000,0000,4000,TOWER_2,TOWER0_ISTRAT
	mapobj	1200,-1000,0000,4000,TOWER_2,TOWER0_ISTRAT
;pillars
	cspecial	0300,-600,-300,5000,kamikaze,zaco4_istrat

	mapobj	0000,0300,0000,4000,BU_8,HARD180YR_ISTRAT
	mapobj	0000,-300,0000,4000,BU_8,HARD180YR_ISTRAT

	mapobj	0500,0000,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	0000,-600,0000,4000,BU_0,HARD180YR_ISTRAT
	mapif	playertwocheck,.skip1
	mapobj	0000,0600,0000,4000,BU_0,HARD180YR_ISTRAT
	mapobj	0500,0000,0000,4000,PILLAR3,PILLAR3_ISTRAT
.skip1
	mapobj	0000,-600,0000,4000,BU_0,HARD180YR_ISTRAT
	mapobj	0000,0600,0000,4000,BU_0,HARD180YR_ISTRAT
	mapif	playertwocheck,.skip2
	mapobj	0500,0000,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	0000,-600,0000,4000,BU_0,HARD180YR_ISTRAT
.skip2
	mapobj	0000,0600,0000,4000,BU_0,HARD180YR_ISTRAT
	mapobj	0000,-150,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapif	playertwocheck,.skip3
	mapobj	0500,0150,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	0000,-300,0000,4000,PILLAR3,PILLAR3_ISTRAT
.skip3
	mapobj	3000,0300,0000,4000,PILLAR3,PILLAR3_ISTRAT
	cspecial	0000,0200,-1300,2000,zaco_6,zacos_istrat
	cspecial	0000,-100,-1500,2300,zaco_6,zacos_istrat
	cspecial	0000,0500,-1500,2300,zaco_6,zacos_istrat
	special	0000,0050,-1700,2500,zaco_a,zacos_istrat
	special	1000,0350,-1700,2500,zaco_a,zacos_istrat
.tow
	pathobj	0000,0800,0000,4000,tow_0,tow_0,10,10
	pathobj	3000,-800,0000,4000,tow_0,tow_0,10,10
	maploop	.tow,02
;CITY1
	mapobj	0000,0380,0000,4000,BU_1,HARD180YR_ISTRAT
	mapobj	0000,-380,0000,4000,BU_1,HARD180YR_ISTRAT
	mapobj	0000,0180,0000,5000,BU_7,HARD180YR_ISTRAT
	mapobj	2000,-180,0000,5000,BU_7,HARD180YR_ISTRAT
	mapobj	0000,0000,0000,4000,BU_7,HARD180YR_ISTRAT
	mapobj	0000,0480,0000,4000,BU_6,HARD180YR_ISTRAT
	mapobj	1000,-480,0000,4000,BU_6,HARD180YR_ISTRAT
	special	0700,-1800,-500,3800,zaco_a,zaco0_istrat
;friend
	mapif		assaultcheck,.nofriends2
	pathobj	0000,-750,-400,0000,friendship_4,chase6_1,10,10

	pathcspecial	4000,-720,-400,0000,zaco_a,chase6_2,10,10
.nofriends2
	pathobj	2000,0000,0000,4000,tow_0,tow_0,10,10
;robot_walking
	mapif	playertwocheck,.norob3
	pathobj	0000,-1000,0000,4300,nullshape,robotwithlog,6,4
	setalvar	roty,-deg90
.norob3
	mapobj	0000,-450,0000,3800,bu_2,hard180yr_ISTRAT
	mapobj	2000,-80,0000,3800,bu_1,hard180yr_ISTRAT
	mapobj	0000,0560,0000,4000,bu_2,hard180yr_ISTRAT
	mapobj	2000,0190,0000,4000,bu_1,hard180yr_ISTRAT
;carrier_robot
	mapif	playertwocheck,.norob4
	pathobj	0000,1200,0000,4500,nullshape,robotwithlog,6,4
.	setalxvar.w	pword1,tower_2a
	setalvar	roty,deg90
.norob4
	mapobj	1000,-1200,0000,4000,bu_5,hard180yr_ISTRAT
	mapobj	0000,0900,0000,5000,TOWER_2,TOWER0_ISTRAT
	mapobj	1000,-900,0000,5000,TOWER_2,TOWER0_ISTRAT
	cspecial	1000,-100,-50,3200,bom_wing,bomwing_Istrat,2,8
	mapobj	0000,0700,0000,5000,TOWER_2,TOWER0_ISTRAT
	mapobj	1000,-700,0000,5000,TOWER_2,TOWER0_ISTRAT
	pathcspecial	1000,0200,0000,3200,walker_2,korori,6,4
	pathcspecial	1000,-100,0000,3200,walker_2,korori,6,4
	cspecial	1800,0200,-30,4300,bom_wing,bomwing_ISTRAT
	mapobj	1000,1200,0000,4000,bu_4,hard180yr_ISTRAT
;twinrobot_pillar
	mapif	playertwocheck,.norob5
	pathobj	0000,1400,0000,4200,nullshape,robotswithlog,6,4
	setalvar	roty,deg90+deg11
.norob5
	mapobj	2400,-1000,0000,4000,bu_1,hard180yr_ISTRAT
	mapobj	3500,1200,0000,4000,bu_1,hard180yr_ISTRAT
;city2
	mapobj	0000,0000,0000,4000,BU_7,HARD180YR_ISTRAT
	mapobj	0000,0380,0000,4000,BU_1,HARD180YR_ISTRAT
	mapobj	1000,-380,0000,4000,BU_1,HARD180YR_ISTRAT
;item
	mapobj	0000,0000,-150,4050,item_5,item5_istrat
	setalvar	sbyte1,1

	mapobj	0000,0000,0000,4000,BU_6,HARD180YR_ISTRAT
	mapobj	0000,0580,0000,4000,BU_4,HARD180YR_ISTRAT
	mapobj	1000,-580,0000,4000,BU_5,HARD180YR_ISTRAT
	mapobj	0000,0230,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	0500,-270,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	0000,0230,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	0000,0230,0000,4000,PILLAR3,PILLAR3_ISTRAT
	cspecial	1000,-1500,-600,4400,zaco_5,zaco0_istrat
	mapobj	0000,0400,0000,4000,BU_2,HARD180YR_ISTRAT
	mapobj	1000,-400,0000,4000,BU_2,HARD180YR_ISTRAT
	mapobj	0000,0280,0000,4000,BU_2,HARD180YR_ISTRAT
	mapobj	1000,-280,0000,4000,BU_2,HARD180YR_ISTRAT

	pathobj	0000,-130,-150,-100,friendship_4,falcon3_1,10,10

	mapobj	0000,0000,0000,4000,BU_7,HARD180YR_ISTRAT
	mapobj	0000,0400,0000,4000,BU_2,HARD180YR_ISTRAT
	mapobj	1000,-400,0000,4000,BU_2,HARD180YR_ISTRAT
	mapobj	0000,0280,0000,4000,BU_2,HARD180YR_ISTRAT
	mapobj	1000,-280,0000,4000,BU_2,HARD180YR_ISTRAT
	mapobj	1000,0000,0000,4000,BU_7,HARD180YR_ISTRAT
	mapobj	0000,0340,0000,4000,BU_6,HARD180YR_ISTRAT
	mapobj	2000,-340,0000,4000,BU_6,HARD180YR_ISTRAT
.torii	mapobj	0300,0000,0000,3000,arch_0,hard_ISTRAT
	maploop	.torii,05
	mapobj	0000,0000,-030,2500,item_5,item5_ISTRAT
	setalvar	sbyte1,1
	mapobj	0400,0000,0000,3000,arch_0,hard_ISTRAT
	mapobj	0000,0120,0000,3000,arch_0,hard_ISTRAT
	mapobj	0300,-120,0000,3000,arch_0,hard_ISTRAT
	mapobj	0000,0170,-030,2800,item_5,item5_ISTRAT
	mapobj	0000,0150,0000,3000,arch_0,hard_ISTRAT
	mapobj	0300,-150,0000,3000,arch_0,hard_ISTRAT
	mapobj	0000,0170,0000,3000,arch_0,hard_ISTRAT
	mapobj	0300,-170,0000,3000,arch_0,hard_ISTRAT
	mapobj	0000,0200,0000,3000,arch_0,hard_ISTRAT
	mapobj	0100,-200,0000,3000,arch_0,hard_ISTRAT
;gate
	mapobj	0000,-200,-100,3000,gate_0,gate_ISTRAT

	pathobj	1000,3000,3000,3000,nullshape,e_gate,10,10
;3-1-3;
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
;carrier_robot
	mapif	playertwocheck,.norob6
	pathobj	0000,-300,0000,5000,nullshape,robotwithlog,6,4
	setalxvar.w	pword1,boss_7_0
	setalvar	roty,-deg22
	pathobj	3500,-200,0000,5000,tow_0,tow_0,10,10

;carrier_robot
	mapif	playertwocheck,.norob7
	pathobj	0000,-1000,0000,5000,nullshape,robotwithlog,6,4
	setalxvar.w	pword1,boss_7_3
	setalvar	roty,-deg45-deg22
	mapwait	1500

;carrier_robot
	pathobj	0000,-1400,0000,5000,nullshape,robotswithlog,6,4
	setalxvar.w	pword1,boss_7_3
	setalvar	roty,-deg45-deg22
	mapwait	3000
.norob6
	mapobj	1500,0000,0000,4000,big_gate,hard_ISTRAT
;buildings2
	mapobj	0000,0360,0000,4000,BU_2,HARD180YR_ISTRAT
	mapobj	0000,-360,0000,4000,BU_2,HARD180YR_ISTRAT
.bupillar	mapobj	0000,0180,0000,4000,BU_1,HARD180YR_ISTRAT
	mapobj	0000,-180,0000,4000,BU_1,HARD180YR_ISTRAT
	mapobj	1000,0180,0000,4400,PILLAR3,PILLAR3_ISTRAT
	maploop	.bupillar,02

	mapobj	0000,0000,-50,4000,r_BU_1,HARD180YR_ISTRAT
	mapobj	0000,0180,0000,4000,BU_1,HARD180YR_ISTRAT
	mapobj	0000,-180,0000,4000,BU_1,HARD180YR_ISTRAT
	mapobj	1000,-180,0000,4400,PILLAR3,PILLAR3_ISTRAT
	mapobj	0000,0180,0000,4000,BU_1,HARD180YR_ISTRAT
	mapobj	0000,-180,0000,4000,BU_1,HARD180YR_ISTRAT
	mapobj	0000,0180,0000,4400,PILLAR3,PILLAR3_ISTRAT
	mapobj	1000,-180,0000,4400,PILLAR3,PILLAR3_ISTRAT
;;
	mapobj	1800,0000,0000,5000,big_gate,hard_ISTRAT
;carrier_robot
	mapif	playertwocheck,.norob7
	pathobj	0000,-1400,0000,5000,nullshape,robotwithlog,6,4
	setalxvar.w	pword1,boss_7_1
	setalvar	roty,-deg45-deg22
.norob7
;	mapwait	1000
;	special	1100,-2000,-600,5100,zaco_a,zaco0_istrat
;	cspecial	3000,-2000,-600,4500,zaco_5,zaco0_istrat
;35 specials
;chase 2 times

;	ENDC




