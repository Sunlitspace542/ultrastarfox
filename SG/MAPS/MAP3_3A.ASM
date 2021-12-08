map3_3a
	mapif	chkeasteregg2,.nothx
	start_65816
	lda	superspeeddelay
	cmp	#ktest
	bne	.noneed
	jsl	changeviewmode_l
.noneed
	end_65816
.nothx


	mapwait	500
	mapwait		1000
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
	mapwait	1500
;--------------------------------------------------
;	pathobj	6000,0000,0000,3000,nullshape,trn_ck,10,10
;.et
;	mapwait	2000
;	pathobj	0000,-750,-400,0000,friendship_4,chase6_1,10,10
;	pathobj	19000,-720,-400,0000,zaco_a,chase6_2,10,10
;	pathobj	0000,000,-400,-150,friendship_4,chase7_1,10,10
;	pathobj	19000,000,-400,-150,zaco_a,chase7_2,10,10
;	pathobj	0000,750,-100,000,friendship_4,chase8_1,10,10
;	pathobj	0000,3800,-3600,4260,zaco_a,chase8_2,10,10
;	pathobj	19000,750,-100,000,zaco_a,chase8_3,10,10
;	pathobj	19000,000,-170,5000,nullshape,kanihaha,10,10
;	mapwait	19000
;	pathobj	5000,0000,-100,2000,r_bu_2,e_kururi,10,10
;	pathobj	4000,1000,-600,1300,zaco_5,cyou,10,10
;	pathobj	1000,1000,-100,0000,boss_d_4,kamome,10,10
;	pathobj	10000,-1000,-100,0000,boss_d_4,kamome,10,10
;	pathobj	10000,0000,-40,3500,stalk,tomset,10,10
;	pathobj	10000,0000,-100,3500,beeanim,e_bee,10,10
;	pathobj	10000,0000,0000,3500,walker_2,korori,10,10
;	pathcspecial	5000,0200,000,6000,f_fish,e_flyfish,10,10
;	pathobj	5000,-200,000,6000,f_fish,e_flyfish,10,10
;
;	mapgoto	.et
;-----------------------------------------------------
	pathobj	1000,0000,0000,2500,nullshape,e_flower,10,8
	pathobj	1000,-200,0000,2500,nullshape,e_flower,10,8
	pathobj	1000,0200,0000,2500,nullshape,e_flower,10,8

	mapobj	1000,-200,0000,2500,stalk,tree1_istrat
	mapobj	1000,0200,0000,2500,stalk,tree1_istrat
	mapobj	1000,0000,0000,2500,stalk,tree1_istrat
	mapif	chkeasteregg1,.finn
	mapobj	0000,-100,0000,4000,androsscube,boss2_Istrat
	mapwaitboss
	setbg	3_3a
	initbg
	setrestart
.finn
	mapobj	0400,-300,0000,4000,flower_2,hard180yr_Istrat
	mapobj	0900,100,0000,4000,flower_1,hard180yr_Istrat
	mapobj	1000,-800,0000,4000,flower_1,hard180yr_Istrat
	pathcspecial	0800,0300,-150,2000,beeanim,e_bee,10,10
	pathcspecial	0400,-400,-170,2000,beeanim,e_bee,10,10
	mapobj	1400,-1000,0000,4000,flower_1,hard180yr_Istrat
	mapobj	2400,-800,0000,4000,flower_1,hard180yr_Istrat
	mapif		assaultcheck,.nofriends1
	pathobj	0000,-750,-400,0000,friendship_4,chase6_1,10,10

	pathcspecial	0000,-720,-400,0000,zaco_a,chase6_2,10,10
.nofriends1
	pathobj	3000,0400,-40,4000,stalk,tomset,10,10
	mapobj	2000,100,0000,4000,flower_2,hard180yr_Istrat
	pathobj	2000,-300,-40,4000,stalk,tomset,10,10
	pathcspecial	0600,100,-120,2000,beeanim,e_bee,10,10
	pathcspecial	1400,-100,-120,2000,beeanim,e_bee,10,10
	mapobj	0500,200,0000,4000,flower_2,hard180yr_Istrat
;	mapobj	0500,-200,0000,4000,flower_2,hard180yr_Istrat
	mapobj	0500,-900,0000,4000,flower_2,hard180yr_Istrat
	mapobj	1000,0900,0000,4000,flower_2,hard180yr_Istrat
	pathobj	3000,0000,-1000,4000,nullshape,tomhaha,10,10
	mapobj	1000,400,0000,4000,flower_1,hard180yr_Istrat
;	mapobj	1000,-500,0000,4000,flower_1,hard180yr_Istrat
	mapobj	1000,100,0000,4000,flower_2,hard180yr_Istrat
;	mapobj	2000,-200,0000,4000,flower_2,hard180yr_Istrat

	mapobj	0300,0300,0000,1500,stalk,tree1_istrat
;	mapobj	0000,0000,0000,1500,stalk,tree1_istrat
	cspecial	0000,000,0000,4000,bom_wing,bomwing_Istrat
	special	0500,-400,0000,3100,bom_wing,bomwing_Istrat,10,10
	pathcspecial	400,100,-120,2000,beeanim,e_bee,10,10
;	pathcspecial	400,-100,-100,2000,beeanim,e_bee,10,10
;	pathspecial	1000,400,0000,3100,bom_wing,ponpon,10,10
	pathcspecial	400,100,-120,2000,beeanim,e_bee,10,10
	mapobj	3500,0200,0000,1500,stalk,tree1_istrat
;	mapobj	0900,-200,0000,1300,stalk,tree1_istrat
	mapobj	0900,0000,0000,1300,stalk,tree1_istrat
;	mapobj	0900,0200,0000,1300,stalk,tree1_istrat
	mapobj	1200,-300,0000,1300,stalk,tree1_istrat
;	mapobj	0500,0300,0000,1800,stalk,tree2_istrat
	mapobj	2500,0000,0000,1800,stalk,tree2_istrat

	mapobj	1000,0000,-100,2000,gate_0,gate_Istrat

	pathobj	0000,3000,3000,3000,nullshape,e_gate,10,10

	mapwait		1000
	start_65816
	lda	bgmspeed
	beq	.nochangexxx
	cmp	#1
	beq	.slowxxx
	cmp	#2
	beq	.fastxxx
.slowxxx
	startbgm	$f4
	bra	.nochangexxx
.fastxxx
	startbgm	$f5
.nochangexxx
	end_65816
.pdead2	mapwait	1000
	mapgotoifplayerdead	.pdead2
	mapif	chkeasteregg1,.nofun1
	SETVAR.N	FADEPAL,33
	setvar	palfrom,0
	setvar	palto,0
	setvar	pallen,32
	SETVAR.N	INFOG,0
	MAPCODE_JSL	BG_HOLE_1
	mapgoto	.fun1
.nofun1
	mapfadetosea
.fun1
	mapwait	0600
	mapplayermode	onwater
	mapwait	1000

;	pathcspecial	1000,0200,000,4000,f_fish,e_flyfish,10,10
	pathcspecial	5000,0000,000,4000,f_fish,e_flyfish,10,10
;	pathcspecial	1000,0-200,000,4000,f_fish,e_flyfish,10,10

;	mapobj	0500,0000,0000,2000,nullshape,torpedo_Istrat	
	mapobj	0500,0-300,0000,2000,nullshape,torpedo_Istrat	
	mapobj	2000,0300,0000,2000,nullshape,torpedo_Istrat	

	pathcspecial	1000,1000,-100,0000,boss_d_4,kamome,10,10
	mapobj	0000,0000,0000,2000,nullshape,torpedo_Istrat	
;	pathcspecial	1000,-1000,-100,0000,boss_d_4,kamome,10,10
	mapobj	0000,0-300,0000,2000,nullshape,torpedo_Istrat	
	pathcspecial	2000,1000,-100,0000,boss_d_4,kamome,10,10
	mapobj	2000,0300,0000,2000,nullshape,torpedo_Istrat	
;seadragon
	mapif		assaultcheck,.nofriends2
	pathobj	0000,0000,-400,-150,friendship_4,chase7_1,10,10

	pathcspecial	4000,0000,-400,-150,zaco_a,chase7_2,10,10
.nofriends2
	pathcspecial	1000,-1000,-100,0000,boss_d_4,kamome,10,10
;	pathcspecial	1000,1000,-100,0000,boss_d_4,kamome,10,10
	pathcspecial	2000,-1000,-100,0000,boss_d_4,kamome,10,10
	nessie	6000,-400,0000,5000,deg180,40
	mapobj	0000,0100,-50,4700,item_6,item6_Istrat
	setalvar	sbyte1,1
	nessie	3000,-400,0000,5000,deg45,40
;	mapmother	4000,0000,0000,3000,mother1,mother2_istrat,mother_snakes
;	mapobj	3000,0300,0000,4000,snake_1,seadragon2_Istrat	
	mapobj	2500,-400,0000,4000,snake_1,seadragon2_Istrat	
;	nessie	3000,-200,0000,5000,deg22,10
	maprem	mother1
;	mapobj	3000,0150,0000,4000,snake_1,seadragon2_Istrat		
	mapobj	2500,0000,-140,4000,nullshape,up1man_Istrat
;	mapobj	2000,0000,0000,4000,snake_1,seadragon2_Istrat		
	nessie	2000,-200,0000,5000,deg45,60
	pathcspecial	1500,-1000,-100,0000,boss_d_4,kamome,10,10
;	pathcspecial	1500,1000,-100,0000,boss_d_4,kamome,10,10
	mapif		assaultcheck,.nofriends3
	pathobj	0000,-750,-400,0000,friendship_4,chase6_1,10,10

	pathcspecial	0000,-720,-400,0000,zaco_a,chase6_2,10,10
;	pathcspecial	2500,-1000,-100,0000,boss_d_4,kamome,10,10
.nofriends3
;	pathcspecial	1000,0200,000,4000,f_fish,e_flyfish,10,10
	pathcspecial	1000,0000,000,4000,f_fish,e_flyfish,10,10
	pathcspecial	3000,-200,000,4000,f_fish,e_flyfish,10,10
	mapobj	1000,0000,0000,2000,nullshape,torpedo_Istrat	
	mapobj	1000,0-300,0000,2000,nullshape,torpedo_Istrat	
	mapobj	4000,0300,0000,2000,nullshape,torpedo_Istrat	

	mapobj	1000,0200,-200,2000,gate_0,gate_Istrat
	pathobj	0000,3000,-100,1000,nullshape,e_gate,10,10
	mapwait		1000
	start_65816
	lda	bgmspeed
	beq	.nochangexx
	cmp	#1
	beq	.slowxx
	cmp	#2
	beq	.fastxx
.slowxx
	startbgm	$f4
	bra	.nochangexx
.fastxx
	startbgm	$f5
.nochangexx
	end_65816
.pdead	mapwait	1000
	mapgotoifplayerdead	.pdead
	mapif	chkeasteregg1,.nofun2
	setbg	3_3a
	initbg
	setrestart
	mapgoto	.fun2
.nofun2
	mapfadetoground
.fun2
	mapwait	0500
;	mapplayermode	onplanet
	mapwait	4000

	mapobj	0500,0150,0000,1500,stalk,tree1_istrat
	special	0000,-300,0000,3100,bom_wing,bomwing_Istrat,10,10
	mapobj	0500,0300,0000,1500,stalk,tree1_istrat
	mapobj	0500,-300,0000,1500,stalk,tree1_istrat
	special	0000,0300,0000,3100,bom_wing,bomwing_Istrat,10,10
;skillfly
;	skillfly_init
;	skillfly_set -300,-50,2300
	roottree	0800,-300,0000,2400,-deg45,30
	mapobj	0500,0100,0000,2500,stalk,tree2_istrat
;	mapobj	0500,-200,0000,1800,stalk,tree2_istrat
;	pathspecial	0000,0200,0000,3100,bom_wing,ponpon,10,10
;	mapobj	0500,0000,0000,2500,stalk,tree2_istrat
	skillfly_bonus 0000,-250,-80,1500,item_5,item5_istrat
	setalvar	sbyte1,1
;	mapobj	0500,0350,0000,1800,stalk,tree2_istrat
;	pathspecial	0000,-300,0000,3100,bom_wing,ponpon,10,10
;	mapobj	0500,-150,0000,1800,stalk,tree1_istrat
	mapobj	0500,0300,0000,1800,stalk,tree2_istrat
	roottree	1500,-200,0000,2400,deg11,40
	mapobj	0500,0300,0000,1800,stalk,tree2_istrat
;	roottree	1500,0000,0000,2400,deg22,10
;	mapobj	0500,-100,0000,1800,stalk,tree2_istrat
	mapobj	0000,0200,-50,2200,item_7,item7_Istrat
	setalvar	sbyte1,1
	roottree	1500,0200,0000,2400,-deg45,30
	special	0000,0000,0000,3100,bom_wing,bomwing_Istrat,10,10
;	mapobj	0500,-100,0000,1800,stalk,tree2_istrat
	roottree	1500,-200,0000,3000,deg11,10
	mapobj	0500,0300,0000,1800,stalk,tree2_istrat
	roottree	1500,-200,0000,3000,deg11,10
	mapobj	0500,0100,0000,1500,stalk,tree1_istrat
	mapobj	0500,-100,0000,2200,stalk,tree2_istrat
	roottree	0000,0000,0000,3000,deg11,10
	roottree	1500,0200,0000,3000,deg11,40
	mapobj	0500,-200,0000,1800,stalk,tree2_istrat
	mapobj	3500,0300,0000,1800,stalk,tree2_istrat

	pathobj	0000,3000,3000,3000,nullshape,dragonmsg,10,10

;32 specials
;chase 3 times

	fadeoutbgm
	setbgm	bgm_boss1
	mapobj	0000,-100,0000,4000,boss_d_1,chicken_istrat
	setalvar	roty,deg180
	mapwaitboss
	markboss	boss33
	mapif	chkeasteregg2,.hello
	setfadedown	quick
	mapwaitfade
	setbg	2_4
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
	mapwait		1000
	start_65816
	lda	bgmspeed
	beq	.nochangexxxx
	cmp	#1
	beq	.slowxxxx
	cmp	#2
	beq	.fastxxxx
.slowxxxx
	startbgm	$f4
	bra	.nochangexxxx
.fastxxxx
	startbgm	$f5
.nochangexxxx
	end_65816
	mapjsr	map2_4

.hello
	mapwait	1000

	maprts


