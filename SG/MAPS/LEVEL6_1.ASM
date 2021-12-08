level6_1
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
	setbg	6_1
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

;	pathobj	0000,3000,3000,3000,nullshape,matemsg,10,10

	mapobj	0000,-600,0000,2000,BU_1,HARD180YR_ISTRAT
	mapobj	0000,0600,0000,2000,BU_1,HARD180YR_ISTRAT

	mapobj	0000,-700,0000,3500,BU_1,HARD180YR_ISTRAT
	mapobj	0000,0700,0000,3500,BU_1,HARD180YR_ISTRAT
	roottree	2500,-200,0000,3000,deg11,10
	mapobj	0000,-900,0000,5000,bu_1,hard180yr_ISTRAT
	mapobj	2000,0900,0000,5000,bu_1,hard180yr_ISTRAT

	mapobj	0000,-1100,0000,4800,bu_1,hard180yr_ISTRAT
	mapobj	0000,01100,0000,4800,bu_1,hard180yr_ISTRAT
	mapobj	0000,-1200,0000,4800,bu_1,hard180yr_ISTRAT
	mapobj	2000,01200,0000,4800,bu_1,hard180yr_ISTRAT

	roottree	1500,-200,0000,3000,deg11,10
	mapobj	0200,0100,0000,1500,stalk,tree1_istrat
;	mapobj	0200,-100,0000,2200,stalk,tree2_istrat

	mapobj	0000,-1200,0000,4800,bu_1,hard180yr_ISTRAT
	mapobj	0000,01200,0000,4800,bu_1,hard180yr_ISTRAT

	

	mapobj	1400,0000,0000,4000,arch_0,hard_ISTRAT
	mapobj	1600,0000,0000,4000,arch_0,hard_ISTRAT
	mapobj	1800,0000,0000,4000,arch_0,hard_ISTRAT	

	mapwait	500

	setrestart
	
	pathobj	0800,0200,-120,3000,r_but_2,flip_board,10,10
	mapwait	300
	
	pathobj	0800,0-200,-120,3000,r_but_2,flip_board,10,10

	mapwait	500
	
	mapobj	0000,-1100,0000,4800,bu_1,hard180yr_ISTRAT
	mapobj	0000,01100,0000,4800,bu_1,hard180yr_ISTRAT
	mapobj	0000,-1200,0000,4800,bu_1,hard180yr_ISTRAT
	mapobj	2000,01200,0000,4800,bu_1,hard180yr_ISTRAT

	mapobj	0000,-1200,0000,4800,bu_1,hard180yr_ISTRAT
	mapobj	0000,01200,0000,4800,bu_1,hard180yr_ISTRAT	
	mapobj	0900,100,0000,4000,flower_1,hard180yr_Istrat
	mapobj	0950,0050,0000,4000,stalk,tree1_istrat
	pathcspecial	0400,100,-120,2000,beeanim,e_bee,10,10
	pathcspecial	0400,-100,-120,2000,beeanim,e_bee,10,10	
	mapobj	1000,-100,0000,4000,flower_1,hard180yr_Istrat
	mapobj	1100,-200,0000,4000,flower_1,hard180yr_Istrat
	mapobj	1150,0000,0000,4000,stalk,tree1_istrat
	mapobj	1200,200,0000,4000,flower_1,hard180yr_Istrat
	mapobj	1300,100,0000,4000,flower_1,hard180yr_Istrat
	mapobj	1350,-100,0000,4000,stalk,tree1_istrat
	mapobj	1400,-100,0000,4000,flower_1,hard180yr_Istrat

	SETVAR.N	FADEPAL,5
	setvar	palfrom,0
	setvar	palto,0
	setvar	pallen,5
	SETVAR.N	INFOG,0
	mapwait	500
	MAPCODE_JSL	BG_5_1b_1

	mapif		assaultcheck,.block
	pathobj	0000,-750,-480,0000,friendship_4,chase6_1,10,10

	pathobj	0800,-720,-480,0000,zaco_a,chase6_2,10,10
;------------------------------------------
.block

	pathspecial	0000,0000,0000,3000,s_tank_0,e_tank,4,2	
	cspecial	0200,0600,0000,1000,walker_0,walking_istrat
	mapobj	0500,0300,0000,1800,stalk,tree2_istrat
	roottree	1500,-200,0000,3000,deg11,10
	mapobj	0500,0100,0000,1500,stalk,tree1_istrat
	mapobj	0500,-100,0000,2200,stalk,tree2_istrat
	mapwait	500
	
	mapobj	400,-200,-2000,3000,Svolcano,firepillar_Istrat
	mapobj	400,0200,-2000,3000,Svolcano,firepillar_Istrat
	pathobj	0500,0500,-075,4000,ray_0,e_ray_0,10,10
	pathobj	0800,0200,-170,4500,ray_1,e_ray_1,10,10
	pathspecial	1000,0000,0000,3000,s_tank_0,e_tank,4,2	
	cspecial	1200,0600,0000,1000,walker_0,walking_istrat	
	mapwait	500


	
	mapobj	0500,0300,0000,1800,stalk,tree2_istrat
	roottree	1500,-200,0000,3000,deg11,10
	mapobj	0000,0900,0000,4000,TOWER_2,TOWER0_ISTRAT
	mapobj	1500,-900,0000,4000,TOWER_2,TOWER0_ISTRAT
	cspecial	1500,0000,-50,3200,bom_wing,bomwing_Istrat,2,8
	mapobj	0500,0100,0000,1500,stalk,tree1_istrat
	mapobj	0500,-100,0000,2200,stalk,tree2_istrat

	mapwait		2000

	mapobj	0200,-600,0000,3400,RO_4,rockhard_ISTRAT    ; L      R  ;
	mapobj	0200,0600,0000,3400,RO_5,rockhard_istrat    ;           ;

	mapobj	0400,-500,0000,3400,RO_4,rockhard_ISTRAT    ; L      R  ;
	mapobj	0400,0500,0000,3400,RO_5,rockhard_istrat    ;           ;
	mapobj	0300,-400,0000,2800,RO_4,rockhard_ISTRAT    ; L      R  ;
	mapobj	0200,0400,0000,2800,RO_5,rockhard_istrat    ;           ;
	pathcspecial	0200,100,-120,2000,beeanim,e_bee,10,10
	pathcspecial	0200,-100,-120,2000,beeanim,e_bee,10,10	
	mapobj	0200,-400,0000,3800,RO_4,rockhard_ISTRAT    ;  L    R   ;
	mapobj	0200,0550,0000,3800,RO_1,rockhard_ISTRAT    ;           ;
	cspecial	0000,0200,-1300,2000,zaco_6,zacos_istrat
	cspecial	0000,-100,-1500,2300,zaco_6,zacos_istrat
	cspecial	0000,0500,-1500,2300,zaco_6,zacos_istrat
	mapobj	0200,-400,0000,4800,RO_0,rockhard_ISTRAT    ;  L    R   ;
	mapobj	0200,0400,0000,4800,RO_5,rockhard_ISTRAT    ;           ;
	mapobj	0200,0300,0000,1800,stalk,tree2_istrat
	roottree	1500,-200,0000,3000,deg11,10
	mapobj	0200,0100,0000,1500,stalk,tree1_istrat
	mapobj	0200,-100,0000,2200,stalk,tree2_istrat
	mapobj	0200,-900,0000,5800,RO_2,rockhard_ISTRAT    ;L     R    ;	
	mapobj	0200,-600,0000,2400,RO_4,rockhard_ISTRAT    ; L      R  ;
	mapobj	0200,0600,0000,2400,RO_5,rockhard_istrat    ;           ;

	SETVAR.N	FADEPAL,12
	setvar	palfrom,0
	setvar	palto,0
	setvar	pallen,11
	SETVAR.N	INFOG,0
	mapwait	1100
	MAPCODE_JSL	BG_5_1c_1

	mapwait	3000
	
	mapobj	0200,-500,0000,2400,RO_4,rockhard_ISTRAT    ; L      R  ;
	mapobj	0200,0500,0000,2400,RO_5,rockhard_istrat    ;           ;
	mapobj	0200,0300,0000,1800,stalk,tree2_istrat
	roottree	1500,-200,0000,3000,deg11,10
	mapobj	0200,0100,0000,1500,stalk,tree1_istrat
	mapobj	0200,-100,0000,2200,stalk,tree2_istrat
	mapobj	0200,-400,0000,2800,RO_4,rockhard_ISTRAT    ; L      R  ;
	mapobj	0200,0400,0000,2800,RO_5,rockhard_istrat    ;           ;
	mapobj	0200,-400,0000,3800,RO_4,rockhard_ISTRAT    ;  L    R   ;
	mapobj	0200,0300,0000,1800,stalk,tree2_istrat
	roottree	1500,-200,0000,3000,deg11,10
	mapobj	0200,0100,0000,1500,stalk,tree1_istrat
	mapobj	0200,-100,0000,2200,stalk,tree2_istrat
	mapobj	0200,0550,0000,3800,RO_1,rockhard_ISTRAT    ;           ;
	mapobj	0200,-400,0000,4800,RO_0,rockhard_ISTRAT    ;  L    R   ;
	mapobj	0200,0400,0000,4800,RO_5,rockhard_ISTRAT    ;           ;
	mapobj	0200,-900,0000,5800,RO_2,rockhard_ISTRAT    ;L     R    ;
	mapobj	0200,0300,0000,2800,stalk,tree2_istrat
	roottree	1500,-200,0000,3000,deg11,10
	mapobj	0200,0100,0000,1500,stalk,tree1_istrat
	mapobj	0200,-100,0000,2200,stalk,tree2_istrat

;gate
	mapobj	0000,0000,-150,4000,gate_0,gate_ISTRAT	
	pathobj	1000,3000,0000,1000,nullshape,e_gate,10,10
	mapwait	500	

	mapwait	2000	
	special	0300,0600,-200,-300,zaco_a,zaco1R_istrat
	cspecial	0300,0600,-200,-250,zaco_5,zaco1R_istrat
	cspecial	0900,0600,-200,-500,zaco_5,zaco1R_istrat
	maphardrot	0000,0300,-075,4000,clisla_m,0,-8,0
	pathobj	3000,0500,-075,4000,clisla_s,l_clisla,10,10
	pathobj	1500,0200,-170,4500,walk_4_0,e_kani_0,10,10
	pathcspecial	0200,100,-120,2000,beeanim,e_bee,10,10
	pathcspecial	0200,-100,-120,2000,beeanim,e_bee,10,10	
	pathcspecial	0700,200,-120,2000,beeanim,e_bee,10,10
	pathcspecial	0700,-200,-120,2000,beeanim,e_bee,10,10	
;	mapif	playertwocheck,.norob2
;	pathobj	0000,1600,0000,4000,nullshape,robotwithlog,6,4
;	setalvar	roty,deg45+deg22
;.norob2
	maphardrot	0000,-300,-075,4000,clisla_m,0,-8,0
	pathobj	4000,-500,-075,4000,clisla_s,r_clisla,10,10
	pathobj	1000,-200,-170,4500,walk_4_0,e_kani_0,10,10
	pathobj	0400,-300,-200,2000,clisla_s,mini_cli,10,10
	pathobj	0400,400,-100,2000,clisla_s,mini_cli,10,10

	mapwait	500

	mapobj	0000,-1000,0000,4500,BU_1,HARD180YR_ISTRAT
	mapobj	0000,1000,0000,4500,BU_6,HARD180YR_ISTRAT
	mapobj	0000,-800,0000,5000,BU_2,HARD180YR_ISTRAT
	pathcspecial	2000,-150,0000,5000,heli,e_heli,10,10
	pathcspecial	2200,0150,0000,5800,heli,e_heli,10,10
	mapobj	0000,500,0000,5000,BU_5,HARD_ISTRAT
	setalvar	roty,64
	pathcspecial	2000,-250,0000,5000,heli,e_heli,10,10
	pathcspecial	2200,0250,0000,5800,heli,e_heli,10,10
	mapobj	2000,-350,0000,5000,BU_4,HARD180YR_ISTRAT
	mapobj	0000,-400,0000,4000,BU_4,HARD180YR_ISTRAT
	mapobj	0000,400,0000,4000,BU_4,HARD_ISTRAT
	setalvar	roty,64
	cspecial	0000,0200,-1300,2000,zaco_6,zacos_istrat
	cspecial	0000,-100,-1500,2300,zaco_6,zacos_istrat
	cspecial	0000,0500,-1500,2300,zaco_6,zacos_istrat
	mapwait	1400

	SETVAR.N	FADEPAL,12
	setvar	palfrom,0
	setvar	palto,0
	setvar	pallen,11
	SETVAR.N	INFOG,0
	mapwait	1100
	MAPCODE_JSL	BG_5_1b_1

	mapobj	1200,0000,0000,4000,BU_7,HARD180YR_ISTRAT
	mapobj	0000,-1000,0000,4000,BU_6,HARD180YR_ISTRAT
	mapobj	0600,1000,0000,4000,BU_6,HARD180YR_ISTRAT
	special	0300,0600,-200,-300,zaco_a,zaco1R_istrat
	cspecial	0300,0600,-200,-250,zaco_5,zaco1R_istrat
	cspecial	0900,0600,-200,-500,zaco_5,zaco1R_istrat

	mapobj	0000,-450,0000,4000,BU_6,HARD180YR_ISTRAT
	mapobj	0700,0450,0000,4000,BU_6,HARD180YR_ISTRAT
	mapwait	500
	special	0300,0600,-200,-300,zaco_a,zaco1R_istrat
	cspecial	0300,0600,-200,-250,zaco_5,zaco1R_istrat
	cspecial	0900,0600,-200,-500,zaco_5,zaco1R_istrat
	cspecial	1000,0000,-300,3000,w_l,winglazerman_istrat	
	pathcspecial	0000,-150,0000,5000,heli,e_heli,10,10
	pathspecial	1000,0000,0000,3000,s_tank_0,e_tank,4,2
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
	mapif		assaultcheck,.nofriends2
	pathobj	0000,0000,-400,-150,friendship_4,chase7_1,10,10

	pathcspecial	1600,0000,-400,-150,zaco_a,chase7_2,10,10
.nofriends2
	pathcspecial	1000,-250,0000,5000,heli,e_heli,10,10
	pathspecial	1400,0000,0000,3000,s_tank_0,e_tank,4,2
	pathspecial	1800,0000,0000,3000,s_tank_0,e_tank,4,2
	pathspecial	2400,0000,0000,3000,s_tank_0,e_tank,4,2



;	mapobj	0200,0300,0000,1800,stalk,tree2_istrat
	roottree	1500,-200,0000,3000,deg11,10
;	mapobj	0200,0100,0000,1500,stalk,tree1_istrat
	mapobj	0200,-100,0000,2200,stalk,tree2_istrat
	
	mapwait	2000	
	special	0300,0600,-200,-300,zaco_a,zaco1R_istrat
	cspecial	0300,0600,-200,-250,zaco_5,zaco1R_istrat
	cspecial	0900,0600,-200,-500,zaco_5,zaco1R_istrat
;	mapobj	0200,0100,0000,1800,stalk,tree2_istrat
	roottree	1500,1200,0000,3000,deg11,10
	mapobj	0200,0300,0000,1500,stalk,tree1_istrat
;	mapobj	0200,-100,0000,2200,stalk,tree2_istrat

	pathobj	0000,-250,-150,0,my_bird,my_bird,10,10

	pathcspecial	0200,100,-120,2000,beeanim,e_bee,10,10
	pathcspecial	0200,-100,-120,2000,beeanim,e_bee,10,10	
	pathcspecial	0700,200,-120,2000,beeanim,e_bee,10,10
	pathcspecial	0700,-200,-120,2000,beeanim,e_bee,10,10	
.boss
	mapwait	3000
	mapwait	3000
	start_65816
	a8
	lda	#0
	sta	dotsflag
	stz	dotsflag+1
	end_65816

	mapCLplayermode	ClearDemo2
	
.boss6
	mapwait	3000
	start_65816
	jsl	clearmap_l
	end_65816
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
	mapobj	0000,0000,1000,3500,linkhead,bossb_Istrat
	mapwaitboss

;	mapplayermode	onplanet
;	mapjsr	map4_1
	start_65816
	stz	stage51			;turn link phantron off
	end_65816
	mapjsr	cl_warp
	mapend
