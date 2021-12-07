
;	IFEQ	1
;3-1-1;
	setrestart
	pathobj	1000,3000,0000,1000,nullshape,e_gate,10,10

	skillfly_init
;across_robot
	pathobj	0000,-350,0000,4000,robot_0,robot,6,4
;across_robot
	pathobj	0000,0350,0000,4000,robot_0,robot,6,4
	skillfly_set 0000,-60,4000,100
	mapobj	3000,0000,0000,4000,arch_0,hard_ISTRAT
;-------------
;friend
	pathobj	0000,0000,-400,-150,friendship_4,chase7_1,10,10
	pathcspecial	1000,0000,-400,-150,zaco_a,chase7_2,10,10
;-------------
;base
	mapobj	0000,-400,0000,5000,base_1,base_1_ISTRAT
	mapobj	0000,0400,-50,5200,item_5,item5_Istrat
	setalvar	sbyte1,1
	skillfly_bonus 0000,-400,-50,5200,item_7,item7_istrat
	setalvar	sbyte1,1
	mapobj	2500,0400,0000,5000,base_1,base_1_ISTRAT
	mapobj	0000,-800,0000,4000,BU_0,HARD180YR_ISTRAT
	mapobj	0200,0800,0000,4000,BU_0,HARD180YR_ISTRAT
;pillars
	cspecial	0300,-600,-300,5000,kamikaze,zaco4_istrat

	mapobj	0000,0300,0000,4000,BU_8,HARD180YR_ISTRAT
	mapobj	0000,-300,0000,4000,BU_8,HARD180YR_ISTRAT

	pathobj	0000,0000,0000,4000,tow_0,tow_0,10,10
	cspecial	1000,0700,-300,5000,kamikaze,zaco4_istrat
	mapobj	0500,0000,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	0500,0000,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	0000,-600,0000,4000,BU_0,HARD180YR_ISTRAT
	mapobj	0000,0600,0000,4000,BU_0,HARD180YR_ISTRAT
	mapobj	0000,-150,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	0500,0150,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	0000,-300,0000,4000,PILLAR3,PILLAR3_ISTRAT
	mapobj	1000,0300,0000,4000,PILLAR3,PILLAR3_ISTRAT
;carrier_robot
	pathobj	0000,-300,0000,5000,nullshape,robotwithlog,6,4
	setalxvar.w	pword1,boss_7_0
	setalvar	roty,-deg22

	pathobj	1000,-400,0000,5000,tow_0,tow_0,10,10
	cspecial	1000,0600,-400,0000,zaco_5,zaco1r_istrat
	cspecial	1000,0700,-500,-100,zaco_5,zaco1r_istrat
	cspecial	1000,0800,-600,-200,zaco_5,zaco1r_istrat

;carrier_robot
	pathobj	0000,-1000,0000,5000,nullshape,robotwithlog,6,4
	setalxvar.w	pword1,boss_7_3
	setalvar	roty,-deg45-deg22
	mapwait	3000
	mapobj	0000,0500,0000,4000,BU_6,HARD180YR_ISTRAT
	mapobj	0400,-500,0000,4000,BU_6,HARD180YR_ISTRAT
.bupillar	mapobj	0000,0180,0000,4000,BU_1,HARD180YR_ISTRAT
	mapobj	0000,-180,0000,4000,BU_1,HARD180YR_ISTRAT
	mapobj	1000,0180,0000,4400,PILLAR3,PILLAR3_ISTRAT
	mapobj	0000,0000,-50,4000,r_BU_1,HARD180YR_ISTRAT
	mapobj	0000,0180,0000,4000,BU_1,HARD180YR_ISTRAT
	mapobj	0000,-180,0000,4000,BU_1,HARD180YR_ISTRAT
	mapobj	1000,-180,0000,4400,PILLAR3,PILLAR3_ISTRAT

	mapobj	0000,0180,0000,4000,BU_1,HARD180YR_ISTRAT
	mapobj	0000,-180,0000,4000,BU_1,HARD180YR_ISTRAT
	mapobj	0000,0180,0000,4400,PILLAR3,PILLAR3_ISTRAT
	mapobj	2000,-180,0000,4400,PILLAR3,PILLAR3_ISTRAT
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
	mapobj	0000,0200,0000,3000,arch_0,hard_ISTRAT
	mapobj	0100,-200,0000,3000,arch_0,hard_ISTRAT
;gate
	mapobj	0000,-200,-100,3000,gate_0,gate_ISTRAT

	pathobj	1000,3000,3000,3000,nullshape,e_gate,10,10
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
;carrier_robot
	pathobj	0000,-1400,0000,5000,nullshape,robotwithlog,6,4
	setalxvar.w	pword1,boss_7_1
	setalvar	roty,-deg45-deg22

;	ENDC




