map1_4

;---------------------------------------------------------------------------
;.e1_4
;	pathobj	10000,0000,-120,3000,r_but_2,pinita_a,10,10
;	pathobj	10000,0000,-120,3000,r_but_2,flip_board,10,10
;	mapgoto	.e1_4
;---------------------------------------------------------------------------
	mapif	chkeasteregg2,.nothx
	start_65816
	lda	superspeeddelay
	cmp	#ktest
	bne	.noneed
	jsl	changeviewmode_l
.noneed
	end_65816
.nothx

	setvar.n	infog,1
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
	mapwait	1000
	cspecial	0200,0750,0000,000,walker_0,walking_istrat
	cspecial	5000,0450,0000,000,walker_0,walking_istrat

;houdai
	cspecial	0000,0650,0000,4000,hou_5,houdai5f_istrat
	cspecial	3000,-650,0000,4000,hou_5,houdai5f_istrat
;-------------------------
	mapif	chkeasteregg1,.finn
.finnstart
	cspecial	0200,0750,0000,000,walker_0,walking_istrat
	cspecial	0500,0450,0000,000,walker_0,walking_istrat
	pathcspecial	1000,-50,0000,2050,walker_0,e_walk_1,10,10	
	pathcspecial	1000,0350,0000,2550,walker_0,e_walk_1,10,10	
	maploop	.finnstart,6
;---------------------------
.finn
;tank
	pathspecial	0000,-800,0000,3000,s_tank_0,e_tank,10,10
	pathspecial	4000,0800,0000,3000,s_tank_0,e_tank,10,10

	mapif		assaultcheck,.nofriends1
	pathobj	0000,-750,-400,0000,friendship_4,chase6_1,10,10

	pathcspecial	2500,-720,-400,0000,zaco_a,chase6_2,10,10
.nofriends1
	pathspecial	1500,0000,0000,3000,s_tank_0,e_tank,10,10
	pathcspecial	0000,-450,0000,3000,tank_1,e_tank,10,10
	pathcspecial	8000,0450,0000,3000,tank_1,e_tank,10,10

;pillar
	mapobj	0000,0250,-120,1250,r_bu_7,hard180yr_istrat
	mapobj	1000,-150,-120,1250,r_bu_7,hard180yr_istrat
	mapobj	0000,0100,-120,1250,r_bu_7,hard180yr_istrat
	mapobj	0000,0400,-120,1250,r_bu_7,hard180yr_istrat
	mapobj	1000,-200,-120,1250,r_bu_7,hard180yr_istrat
	mapobj	0000,-400,-120,1250,r_bu_7,hard180yr_istrat
	mapobj	0000,-250,-120,1250,item_5,item5_Istrat
	setalvar	sbyte1,1
	mapobj	0000,-100,-120,1250,r_bu_7,hard180yr_istrat
	mapobj	1000,0200,-120,1250,r_bu_7,hard180yr_istrat
	mapobj	0000,0000,-120,1250,r_bu_7,hard180yr_istrat
	mapobj	0000,0300,-120,1250,r_bu_7,hard180yr_istrat
	mapobj	1000,-300,-120,1250,r_bu_7,hard180yr_istrat
	cspecial	0000,-700,0000,3000,hou_5,houdai5f_istrat
	mapobj	0000,0400,-120,1250,r_bu_7,hard180yr_istrat
	mapobj	0000,0100,-120,1250,r_bu_7,hard180yr_istrat
	mapobj	1000,-200,-120,1250,r_bu_7,hard180yr_istrat
	cspecial	0000,0000,0000,2800,hou_5,houdai5f_istrat
	mapobj	0000,0050,-120,1250,r_bu_7,hard180yr_istrat
	mapobj	0000,0200,-120,1250,item_7,item7_Istrat
	setalvar	sbyte1,1
	mapobj	0000,0350,-120,1250,r_bu_7,hard180yr_istrat
	mapobj	1000,-250,-120,1250,r_bu_7,hard180yr_istrat
	mapobj	0000,-100,-120,1250,r_bu_7,hard180yr_istrat
	mapobj	0000,0200,-120,1250,r_bu_7,hard180yr_istrat
	mapobj	1000,-400,-120,1250,r_bu_7,hard180yr_istrat

	mapobj	0000,0400,-120,1250,r_bu_7,hard180yr_istrat
	mapobj	0000,0100,-120,1250,r_bu_7,hard180yr_istrat
	mapobj	1000,-200,-120,1250,r_bu_7,hard180yr_istrat
	mapobj	0000,0500,-120,1250,r_bu_7,hard180yr_istrat
	mapobj	0000,-500,-120,1250,r_bu_7,hard180yr_istrat
	mapobj	0000,0300,-120,1250,r_bu_7,hard180yr_istrat
	mapobj	0000,0100,-120,1250,r_bu_7,hard180yr_istrat
	mapobj	0000,-100,-120,1250,r_bu_7,hard180yr_istrat
	mapobj	2000,-300,-120,1250,r_bu_7,hard180yr_istrat

;rock
	mapobj	0100,0050,0000,1500,gro_6,hard180yrfog_istrat
	pathcspecial	1000,-50,0000,2050,walker_0,e_walk_1,10,10	

	mapobj	0000,-800,0000,2000,gro_4,hard180yrfog_istrat
	mapobj	1000,0600,0000,2000,gro_5,hard180yrfog_istrat
	mapobj	0000,-600,0000,2000,gro_4,hard180yrfog_istrat
	mapobj	0000,0400,0000,2000,gro_5,hard180yrfog_istrat
	pathcspecial	1000,0350,0000,2550,walker_0,e_walk_1,10,10	

	mapobj	0000,-300,0000,2000,gro_4,hard180yrfog_istrat
	mapobj	1000,0400,0000,2000,gro_5,hard180yrfog_istrat
	pathcspecial	0000,0000,0000,3000,tank_1,e_tank,10,10
	mapobj	0000,-280,0000,2000,gro_0,hard180yrfog_istrat
	mapobj	1000,0280,0000,2000,gro_1,hard180yrfog_istrat
	mapobj	0000,-250,0000,2000,gro_0,hard180yrfog_istrat
	pathspecial	0000,-300,0000,3000,s_tank_0,e_tank,10,10
	mapobj	1000,0250,0000,2000,gro_1,hard180yrfog_istrat

	cspecial	0200,0700,0000,000,walker_0,walking_istrat
	cspecial	2500,0400,0000,000,walker_0,walking_istrat

;;;;
	setvar fadepal,32
	setvar.w palfrom,64
	setvar.w palto,1*32
	setvar.w pallen,16
	mapwait	1500
	setvar fadepal,32
	setvar.w palfrom,96
	setvar.w palto,5*32
	setvar.w pallen,15
;;;;

;heli
	pathspecial	1000,0450,0000,3000,s_tank_0,e_tank,10,10
	mapobj	1000,0900,0000,4000,gro_6,hard180yr_istrat
	mapobj	1000,-900,0000,4000,gro_6,hard180yr_istrat
	pathcspecial	0000,-800,-170,-100,heli,kamome,10,10
.groloop
	mapobj	1000,0900,0000,4000,gro_6,hard180yr_istrat
	mapobj	1000,-900,0000,4000,gro_6,hard180yr_istrat
	maploop	.groloop,02

	pathcspecial	0000,-800,-170,-100,heli,kamome,10,10
	mapobj	1000,0900,0000,4000,gro_6,hard180yr_istrat
	mapobj	1000,-900,0000,4000,gro_6,hard180yr_istrat
	cspecial	0800,0000,-30,3000,bom_wing,bomwing_istrat

	cspecial	0800,0000,0000,4000,hou_5,houdai5f_istrat
	cspecial	0000,-700,0000,4000,hou_5,houdai5f_istrat
	mapobj	1000,0400,-100,4000,nullshape,up1man_Istrat
	mapobj	1000,-1700,0000,5000,gro_6,hard180yr_istrat
	mapobj	0000,0600,0000,5000,gro_6,hard180yr_istrat
	pathcspecial	1500,0600,0000,5300,walker_0,e_walk_1,10,10
	mapif		assaultcheck,.nofriends2
	pathobj	0000,0000,-400,-150,friendship_4,chase7_1,10,10

	pathcspecial	1000,0000,-400,-150,zaco_a,chase7_2,10,10
.nofriends2
	pathcspecial	0000,-800,-170,-100,heli,kamome,10,10
	mapobj	1000,0900,0000,4000,gro_6,hard180yr_istrat
	pathcspecial	0000,0800,-170,-100,heli,kamome,10,10
	mapobj	1000,-900,0000,4000,gro_6,hard180yr_istrat
	pathcspecial	0000,-800,-170,-100,heli,kamome,10,10
	mapobj	1000,0900,0000,4000,gro_6,hard180yr_istrat

	cspecial	1000,0400,0000,4000,hou_5,houdai5f_istrat
	cspecial	1000,-400,0000,4000,hou_5,houdai5f_istrat

 	mapobj	0000,0400,0,5500,bu_3,hard180yr_istrat
	pathcspecial	0000,0450,0000,6000,walker_0,e_walk_1,10,10
	mapobj	0000,0500,0,6500,bu_3,hard180yr_istrat

;base&tank
	mapobj	1000,0700,0000,7000,gro_6,hard180yr_istrat
	mapobj	1000,-600,0000,7000,gro_6,hard180yr_istrat
	mapobj	0000,-1500,0,08000,base_0_0,base0_istrat
	special	0000,-1500,0,08004,s_tank_0,tank1a_istrat
	setalvar.N	sbyte1,50
	cspecial	0000,-1200,0,08004,btank_1,tank1a_istrat
	setalvar.N	sbyte1,55
	cspecial	0000,-0900,0,08004,btank_1,tank1a_istrat
	setalvar.N	sbyte1,60
	mapobj	3000,-1500,0,08005,base_0_1,base0_istrat
	mapobj	7500,1500,0000,7000,gro_6,hard180yr_istrat
;base
	cspecial	1000,-400,0000,4000,hou_5,houdai5f_istrat
	cspecial	3500,-400,0000,4000,hou_5,houdai5f_istrat
	mapobj	0000,0200,0,5000,base_0,base1_istrat
	mapif		assaultcheck,.nofriends3
	pathobj	0000,750,-100,000,friendship_4,chase8_1,10,10

	pathcspecial	0000,3800,-3600,4260,zaco_a,chase8_2,10,10
	pathcspecial	0000,750,-100,000,zaco_a,chase8_3,10,10
.nofriends3
	mapobj	0000,0200,-100,5500,gate_0,gate_ISTRAT
	pathobj	1000,3000,3000,3000,nullshape,e_gate,10,10
	mapwait	1000
	start_65816
	lda	bgmspeed
	beq	.nochangex
	cmp	#1
	beq	.slowx
	cmp	#2
	beq	.fastx
.slowx
	startbgm	$f4
	bra	.nochangex
.fastx
	startbgm	$f5
.nochangex
	end_65816
	mapwait	2000
;;;;
	setvar fadepal,32
	setvar.w palfrom,64
	setvar.w palto,1*32
	setvar.w pallen,16
	mapwait	1500
	setvar fadepal,32
	setvar.w palfrom,96
	setvar.w palto,5*32
	setvar.w pallen,15
;;;;
	mapobj	1000,-1000,0000,4000,gro_6,hard180yr_istrat
	cspecial	1000,0300,0000,4000,tank_2,tank2_istrat
	pathobj	0000,0300,-600,3000,heli,tmp_tank,10,10
	pathobj	0000,-300,-600,3000,heli,tmp_tank,10,10
	mapobj	1000,1100,0000,4000,gro_6,hard180yr_istrat
	mapobj	1000,-1100,0000,4000,gro_6,hard180yr_istrat
	mapobj	1000,1100,0000,4000,gro_6,hard180yr_istrat
	mapobj	1000,-1100,0000,4000,gro_6,hard180yr_istrat
	mapobj	1000,1100,0000,4000,gro_6,hard180yr_istrat
	mapobj	1000,-600,0000,4000,gro_6,hard180yr_istrat
	mapobj	2000,-1650,0000,4500,gro_6,hard180yr_istrat
	mapobj	3000,1150,0000,5000,gro_6,hard180yr_istrat

	mapobj	0000,-300,0,5000,base_0,base1_istrat
	mapobj	0000,300,0,5000,base_0,base1_istrat
	mapobj	0000,-300,-50,5300,item_5,item5_istrat
	setalvar	sbyte1,1
	mapobj	1300,0900,0000,4000,gro_6,hard180yr_istrat
	mapobj	1300,-900,0000,4000,gro_6,hard180yr_istrat
	mapobj	1300,0900,0000,4000,gro_6,hard180yr_istrat
	mapobj	1300,01000,0000,4000,gro_6,hard180yr_istrat
	mapif		assaultcheck,.nofriends4
	pathobj	0000,-100,-400,-150,friendship_4,chase7_1,10,10

	pathcspecial	0000,-100,-400,-150,zaco_a,chase7_2,10,10
.nofriends4
	cspecial	0000,-100,0000,4000,tank_2,tank2_istrat
	pathobj	0000,0300,-600,3000,heli,tmp_tank,10,10
	pathobj	0000,-300,-600,2500,heli,tmp_tank,10,10
	pathobj	1000,0000,-600,2000,heli,tmp_tank,10,10
	mapobj	1000,0900,0000,4000,gro_6,hard180yr_istrat
	mapobj	1000,-900,0000,4000,gro_6,hard180yr_istrat
	mapobj	1000,0900,0000,4000,gro_6,hard180yr_istrat
	mapobj	1000,-1000,0000,4000,gro_6,hard180yr_istrat
	mapobj	6000,-500,0000,4000,gro_6,hard180yr_istrat

;48 specials
;chase 3 times


	setbgm	bgm_boss1
	mapobj	0000,2000,-600,1000,boss_h_0,bossh_istrat
	mapwaitboss
	mapif	chkeasteregg2,.hello
	setfadedown	quick
	mapwaitfade
	setbg	3_6
	initbg
	setfadeup	quick
	mapif	chkeasteregg2,.nothx2
	start_65816
	lda	superspeeddelay
	cmp	#ktest
	bne	.noneed2
	jsl	changeviewmode_l
.noneed2
	end_65816
.nothx2
	setrestart
;gate
	mapobj	2000,0000,-100,5000,gate_0,gate_ISTRAT
	pathobj	4000,3000,3000,1000,nullshape,e_gate,10,10
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
	mapobj	1000,0000,0000,1000,nullshape,kandobase_istrat
	mapwait	5000
	incmap	WASHENT
;	initlevel	2_6a,nofadenostage,mstarwipe_circle
	setfadedown	quick
	mapwaitfade
	setbg	2_6a
	initbg
	setfadeup	quick
	setrestart

	mapjsr	map2_6a
.hello
	markboss	boss14
	mapwait	1000
	maprts

;	IFEQ	1
; boss A test
;	mapobj	0000,3000,0000,375<<bossa_scale,boss_A_2,bossA_Istrat

;.loop	mapif	chkbossdead,.cont
;	mapgoto	.loop
;.cont

;	markboss	boss14
;	mapwait	4000
;	maprts
;	ENDC


