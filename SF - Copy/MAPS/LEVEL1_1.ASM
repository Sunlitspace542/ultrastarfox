level1_1
	IFEQ	contest

	meters_off
	initlevel	1_1i,nofadenostage,mstarwipe_circle
	mapwait	100
	setvar.b	scramble,50

	mapjsr	map1_1a

	setfadedown
	waitfadefin

	ENDC

	mapcode_jsl	initblack_l
	mapwait	1

	meters_on	trans

	setvar	keeppstrat,1
	setbg	1_1c
	initbg
	wipein	mscramwipe_circle
	mapwait	medpspeed*2
	setfadeup	quick

	mapplayermode   ExitBase
	mapobj		0000,0000,0000,0000,mybase_1,nocoll_Istrat	
	mapobj		0000,0000,0000,0000,mybase_0,nocoll_Istrat	
	mapobj		0000,-27<<mybase_scale,-39<<mybase_scale,-200,myship_4,friendexitbase_Istrat
	setalvar	sbyte1,17
	mapobj		0000,-27<<mybase_scale,-39<<mybase_scale,-200,myship_4,friendexitbase_Istrat
	setalvar	sbyte1,17+(1000/pexitbasespeed)

	pathobj	0000,3000,3000,3000,nullshape,matemsg,10,10
	pathobj	0000,100,-90,1400,friendship_4,falco_lv1,10,10
	pathobj	0000,-80,-140,1200,friendship_4,frog_lv1,10,10

	mapobj	0000,-600,0000,2000,BU_1,HARD180YR_ISTRAT
	mapobj	0000,0600,0000,2000,BU_1,HARD180YR_ISTRAT

	mapobj	0000,-800,0000,3500,BU_1,HARD180YR_ISTRAT
	mapobj	0000,0800,0000,3500,BU_1,HARD180YR_ISTRAT
.buloop
	mapobj	0000,-1000,0000,5000,BU_1,HARD180YR_ISTRAT
	mapobj	1500,01000,0000,5000,BU_1,HARD180YR_ISTRAT
	maploop	.buloop,03

	cspecial	0000,-500,-300,0000,zaco_5,zaco1l_istrat
	mapobj	0000,-1100,0000,5000,BU_1,HARD180YR_ISTRAT
	mapobj	1500,01100,0000,5000,BU_1,HARD180YR_ISTRAT

	mapobj	0000,-1200,0000,5000,BU_1,HARD180YR_ISTRAT
	mapobj	0000,01200,0000,5000,BU_1,HARD180YR_ISTRAT

	pathobj	0000,00000,-400,-100,friendship_4,frog1_1,10,10

	setrestart	
	mapplayermode	onplanet
	mapjsr	map1_1b

	mapobj	0500,1000,0000,8000,BU_6,HARD180YR_ISTRAT
	mapobj	1000,-0800,0000,10000,BU_5,HARD180YR_ISTRAT
	mapobj	1000,-1200,0000,12000,BU_4,HARD180YR_ISTRAT

	mapjsr	cl_ground
	mapend



