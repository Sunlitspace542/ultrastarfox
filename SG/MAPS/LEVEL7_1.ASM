level7_1
	start_65816
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
	setbg	7_1
	initbg

	wipein	mscramwipe_circle
	mapwait	medpspeed*2
	setfadeup	quick

	mapplayermode   ExitBase
	mapobj		0000,0008,0000,0000,mybase_1,nocoll_Istrat	
	mapobj		0000,0000,0000,0000,mybase_0,nocoll_Istrat	
	mapobj		0000,-27<<mybase_scale,-39<<mybase_scale,-200,myship_4,friendexitbase_Istrat
	setalvar	sbyte1,17
	mapobj		0000,-27<<mybase_scale,-39<<mybase_scale,-200,myship_4,friendexitbase_Istrat
	setalvar	sbyte1,17+(1000/pexitbasespeed)

	mapwait	3000
;part 1	
	mapobj	1200,0100,0000,4000,BU_7,HARD180YR_ISTRAT
	mapobj	0000,-1000,0000,4000,BU_0,HARD180YR_ISTRAT
	mapobj	0600,1000,0000,4000,BU_0,HARD180YR_ISTRAT
	mapobj	0000,-400,0000,4000,BU_4,HARD180YR_ISTRAT
	mapobj	0600,0450,0000,4000,BU_6,HARD180YR_ISTRAT
	mapobj	0600,-400,0000,4000,BU_4,HARD180YR_ISTRAT
	mapobj	0000,0450,0000,4000,BU_6,HARD180YR_ISTRAT
	mapobj	1400,-400,0000,4000,BU_4,HARD180YR_ISTRAT
	
	pathcspecial	0200,100,-120,2000,yellowbird,e_bee,10,10
	pathcspecial	0200,-100,-120,2000,yellowbird,e_bee,10,10	

	mapwait	2000
	
	pathspecial	0000,0000,0000,3000,s_tank_0,e_tank,4,2	
	cspecial	0200,0600,0000,1000,walker_0,walking_istrat
	mapobj	0500,0300,0000,1800,stalk,tree2_istrat
	roottree	1500,-200,0000,3000,deg11,10
	mapobj	0500,0100,0000,1500,stalk,tree1_istrat
	mapobj	0500,-100,0000,2200,stalk,tree2_istrat
	mapwait	2500
	mapobj	0600,-400,0000,3800,RO_4,rockhard_ISTRAT    ; L      R  ;
	mapobj	0000,0400,0000,3800,RO_4,rockhard_istrat    ;           ;
	mapobj	0600,-400,0000,3800,RO_4,rockhard_ISTRAT    ; L      R  ;
	mapobj	0000,0400,0000,3800,RO_4,rockhard_istrat    ;           ;
	mapobj	0600,-400,0000,3800,RO_4,rockhard_ISTRAT    ; L      R  ;
	mapobj	0000,0400,0000,3800,RO_4,rockhard_istrat    ;           ;
	mapobj	0600,-0350,0000,3800,RO_4,rockhard_ISTRAT    ; L      R  ;
	mapobj	0000,0350,0000,3800,RO_4,rockhard_ISTRAT    ; L      R  ;
	mapobj	0600,-0350,0000,3800,RO_4,rockhard_ISTRAT    ; L      R  ;
	mapobj	0000,0350,0000,3800,RO_4,rockhard_ISTRAT    ; L      R  ;
	mapobj	0600,-0350,0000,3800,RO_4,rockhard_ISTRAT    ; L      R  ;
	mapobj	0000,0350,0000,3800,RO_4,rockhard_ISTRAT    ; L      R  ;
	mapobj	0600,-0350,0000,3800,RO_4,rockhard_ISTRAT    ; L      R  ;
	mapobj	0000,0350,0000,3800,RO_4,rockhard_ISTRAT    ; L      R  ;
	mapobj	0600,-0300,0000,3800,RO_4,rockhard_ISTRAT    ; L      R  ;
	mapobj	0000,0300,0000,3800,RO_4,rockhard_ISTRAT    ; L      R  ;
	mapobj	0600,-0300,0000,3800,RO_4,rockhard_ISTRAT    ; L      R  ;
	mapobj	0000,0300,0000,3800,RO_4,rockhard_ISTRAT    ; L      R  ;
	mapwait	3000

	mapobj	0500,0100,0000,1800,stalk,tree2_istrat
	roottree	1500,200,0000,3000,-deg11,10
	mapobj	0500,-0200,0000,1500,stalk,tree1_istrat
	mapobj	0500,-400,0000,2200,stalk,tree2_istrat

	mapwait	2000

	pathspecial	1400,0000,0000,3000,s_tank_0,e_tank,4,2
	pathspecial	1800,0000,0000,3000,s_tank_0,e_tank,4,2
	pathspecial	2400,0000,0000,3000,s_tank_0,e_tank,4,2

	mapwait	2000
	
	pathobj	1000,-100,-200,700,yellowbird,kamome,10,8
	pathobj	1000,-200,-100,700,yellowbird,kamome,10,8	
	mapobj	0000,-400,0000,4000,BU_4,HARD180YR_ISTRAT
	mapobj	0600,0450,0000,4000,BU_6,HARD180YR_ISTRAT
	mapobj	0600,-400,0000,4000,BU_4,HARD180YR_ISTRAT
	mapobj	0000,0450,0000,4000,BU_6,HARD180YR_ISTRAT
	mapobj	1400,-400,0000,4000,BU_4,HARD180YR_ISTRAT
	
	mapwait	2000
	
	pathobj	1000,100,-200,700,bird0,kamome,10,8
	pathobj	1000,200,-100,700,bird0,kamome,10,8	
	mapobj	0000,-540,0,5000,pilar3,hardrandom_istrat
;	mapobj	0000,-360,0,5000,pilar3,hardrandom_istrat	
	mapobj	0000,-540,0,5000,pilar3,hardrandom_istrat	
	mapobj	0000,360,0,5000,pilar3,hardrandom_istrat
	mapobj	0000,-360,0,5000,pilar3,hardrandom_istrat
	mapobj	0800,130,0,5000,pilar3,hardrandom_istrat
	mapobj	0800,-200,0,5000,pilar3,hardrandom_istrat
	mapobj	0800,330,0,5000,pilar3,hardrandom_istrat
	mapobj	0800,-50,0,5000,pilar3,hardrandom_istrat
	mapobj	0500,0000,0000,1800,stalk,tree2_istrat
	roottree	1500,100,0000,3000,-deg22,10
	mapobj	0500,0300,0000,1500,stalk,tree1_istrat
	mapobj	0500,-200,0000,2200,stalk,tree2_istrat
	mapobj	0800,500,0,5000,pilar3,hardrandom_istrat
	mapobj	0800,-300,0,5000,pilar3,hardrandom_istrat
	mapobj	0800,130,0,5000,pilar3,hardrandom_istrat
	mapobj	0800,-200,0,5000,pilar3,hardrandom_istrat
	mapobj	0800,330,0,5000,pilar3,hardrandom_istrat
	mapobj	0800,-50,0,5000,pilar3,hardrandom_istrat
	roottree	1500,100,0000,3000,deg22,10
	mapobj	0800,500,0,5000,pilar3,hardrandom_istrat
	mapobj	0800,-300,0,5000,pilar3,hardrandom_istrat

	mapwait	2000
	
	pathcspecial	0200,100,-120,2000,yellowbird,e_bee,10,10
	pathcspecial	0200,-100,-120,2000,yellowbird,e_bee,10,10	
	cspecial	0000,0200,-1300,2000,guard_0,zacos_istrat
	cspecial	0000,-100,-1500,2300,guard_0,zacos_istrat
	cspecial	0000,0500,-1500,2300,guard_0,zacos_istrat	

	mapwait	2000
	
	mapobj	0000,-200,0000,4000,minispider,hardplasma180_Istrat		
	mapobj	0600,-400,0000,3800,RO_4,rockhard_ISTRAT    ; L      R  ;
	mapobj	0000,0400,0000,3800,RO_4,rockhard_istrat    ;           ;
	mapobj	0600,-400,0000,3800,RO_4,rockhard_ISTRAT    ; L      R  ;
	mapobj	0000,0400,0000,3800,RO_4,rockhard_istrat    ;           ;
	
	mapwait	2000
	
	mapobj	0000,0380,0,4000,lock_man,HARDplasma180_ISTRAT
	mapobj	0000,-0380,0,4000,lock_man,HARDplasma180_ISTRAT
	mapobj	0000,0,0,4000,lock_man,HARDplasma180_ISTRAT
	pathobj	1000,100,-200,700,bird0,kamome,10,8
	pathobj	1000,200,-100,700,bird0,kamome,10,8	
	
	mapwait	1500
	
	cspecial	0000,0200,-1300,2000,guard_0,zacos_istrat
	cspecial	0000,-100,-1500,2300,guard_0,zacos_istrat
	cspecial	0000,0500,-1500,2300,guard_0,zacos_istrat	

	mapwait	1500	

	special		0000,-300,-1300,2300,longface,zacos_istrat
	cspecial	0000,0300,-1300,2300,longface,zacos_istrat
	special		0000,-600,-1300,2300,longface,zacos_istrat
	cspecial	0000,0600,-1300,2300,longface,zacos_istrat	
	cspecial	0000,0000,-1300,2300,longface,zacos_istrat	
	mapobj	0000,300,0000,4000,minispider,hardplasma180_Istrat	
	
	mapwait	2500
;end part 1	
;gate
	mapobj	0000,0000,-150,4000,gate_0,gate_ISTRAT	
	pathobj	1000,3000,0000,1000,nullshape,e_gate,10,10
	mapwait	2000	
;palette change	
	mapwait	2000
	SETVAR.N	FADEPAL,12
	setvar	palfrom,0
	setvar	palto,0
	setvar	pallen,11
	SETVAR.N	INFOG,0
	mapwait	1100
	MAPCODE_JSL	BG_5_1d_1
;part 2


;end part 2
;space transition point
	mapwait	3000
	mapwait	3000
	mapwait	3000
	start_65816
	a8
	lda	#0
	sta	dotsflag
	stz	dotsflag+1
	end_65816

	mapCLplayermode	ClearDemo2
	
.boss
	mapwait	3000
	mapwait	3000
	setfadedown
	mapwait	1900
;	mapwaitfade
;	MAPCODE_JSL	bg_5_1e_1

	setbg	5_1e
	initbg


	setfadeup	quick

	start_65816
	a8
	lda	#1
	sta	stage51			;set phantron to use link head/strat changes
	end_65816
	mapwait	1000
	
	mapplayermode	inspace	
	mapwait	1000

;	start_65816
;	end_65816
	
	fadeoutbgm

	setbgm	5
	mapobj	0000,0000,1000,3500,bluelinkhead,bossb_Istrat
	mapwaitboss

;	mapplayermode	onplanet
;	mapjsr	map4_1
	start_65816
	stz	stage51			;turn link phantron off
	end_65816
	mapjsr	cl_warp
	mapend
