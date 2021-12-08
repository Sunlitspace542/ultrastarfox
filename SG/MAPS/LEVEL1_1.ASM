level1_1
	IFEQ	contest
	mapif	scrambleskip,.noskip
	mapgoto	.skipped
.noskip
	meters_off
	initlevel	1_1i,nofadenostage,mstarwipe_circle
	mapwait	100
	setvar.b	scramble,50

	mapjsr	map1_1a

	setfadedown
	waitfadefin

	ENDC
.skipped
	start_65816
	lda	endurance
	beq	.noadjust
	lda	#2
	sta	whichroute						;set to route 3
.noadjust
	lda	playertwoactivated
	cmp	#0
	beq	.nop2
	lda	#40
	sta	playertwoready
.nop2
	end_65816
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
	mapobj		0000,0008,0000,0000,mybase_1,nocoll_Istrat	
	mapobj		0000,0000,0000,0000,mybase_0,nocoll_Istrat	
	mapobj		0000,-27<<mybase_scale,-39<<mybase_scale,-200,falco1,friendexitbase_Istrat
	setalvar	sbyte1,17
	mapobj		0000,-27<<mybase_scale,-39<<mybase_scale,-200,slippy1,friendexitbase_Istrat
	setalvar	sbyte1,17+(1000/pexitbasespeed)
	mapif	assaultcheck,.nofriends

	pathobj	0000,3000,3000,3000,nullshape,matemsg,10,10
	pathobj	0000,100,-90,1400,falco1,falco_lv1,10,10
	pathobj	0000,-80,-140,1200,slippy1,frog_lv1,10,10
.nofriends
	mapobj	0000,-600,0000,2000,BU_1,HARD180YR_ISTRAT
	mapobj	0000,0600,0000,2000,BU_1,HARD180YR_ISTRAT

	mapobj	0000,-800,0000,3500,BU_1,HARD180YR_ISTRAT
	mapobj	0000,0800,0000,3500,BU_1,HARD180YR_ISTRAT
.buloop
	mapobj	0000,-1000,0000,5000,BU_1,HARD180YR_ISTRAT
	mapobj	1500,01000,0000,5000,BU_1,HARD180YR_ISTRAT
	maploop	.buloop,03
	mapif	chkeasteregg1,.hello2
	setbg	1_6c
	initbg
.hello2
	cspecial	0000,-500,-300,0000,zaco_5,zaco1l_istrat
	mapobj	0000,-1100,0000,5000,BU_1,HARD180YR_ISTRAT
	mapobj	1500,01100,0000,5000,BU_1,HARD180YR_ISTRAT

	mapobj	0000,-1200,0000,5000,BU_1,HARD180YR_ISTRAT
	mapobj	0000,01200,0000,5000,BU_1,HARD180YR_ISTRAT

	mapif	assaultcheck,.nofriends3
	pathobj	0000,00000,-400,-100,slippy1,frog1_1,10,10
.nofriends3
	setrestart	
	mapplayermode	onplanet2
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
	mapjsr	map1_1b

	mapif	chkeasteregg2,.hello
	mapjsr	cl_earth
	mapend
.hello
	mapobj	0500,1000,0000,8000,BU_6,HARD180YR_ISTRAT
	mapobj	1000,-0800,0000,10000,BU_5,HARD180YR_ISTRAT
	mapobj	1000,-1200,0000,12000,BU_4,HARD180YR_ISTRAT

	mapjsr	cl_ground
	mapend



