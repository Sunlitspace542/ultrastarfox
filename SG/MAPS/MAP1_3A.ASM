map1_3a
	mapwait	5000


	cspecial	1000,100,Space_viewCY-100,3000,zaco_7,szaco5_istrat
;	map_farships0	x,y,z,x speed,y speed,depth

	map_farships2	-2000,-500,9000,-30,8,2
	map_farships2	-1000,0,9000,-10,20,4
	map_farships1	1500,-300,9000,20,18,2

	map_farships0	2000,0,9000,10,10,3
	map_farships2	-0800,500,8000,-20,16,2
	map_farships2	-1500,1200,8000,-30,20,2
	map_farships0	1000,-800,7700,10,-8,2
	map_farships1	0,-1200,7700,16,-40,2
	map_farships2	500,-1000,7700,20,-16,1
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
	mapobj	1500,-500,-300,3000,w_l,winglazerman_Istrat
;----
;	mapwait	1000

	mapif	chkeasteregg1,.finn
	SETVAR.N	FADEPAL,33
	setvar	palfrom,0
	setvar	palto,0
	setvar	pallen,32
	SETVAR.N	INFOG,0
	MAPCODE_JSL	BG_CRED_1
	mapwait	1500
	cspecial	1000,0000,space_viewcy-200,3000,zaco_7,szaco5_Istrat	; fly out of ship2
	cspecial	0000,400,space_viewcy+200,3000,zaco_7,szaco5_Istrat	; fly out of ship2
	cspecial	3000,-400,space_viewcy+200,3000,zaco_7,szaco5_Istrat	; fly out of ship2
	map_farships2	-1000,0,9000,-10,20,4
	map_farships1	1500,-300,9000,20,18,2
	map_farships0	2000,0,9000,10,10,3
	map_farships2	-0800,500,8000,-20,16,2
	mapobj	2500,-500,-300,3000,w_l,winglazerman_Istrat
	mapobj	2500,0000,000,3000,w_l,winglazerman_Istrat
	pathspecial	0400,-2700,2200,1500,s_zaco_0,egu6,10,10
	pathspecial	0400,2700,2200,1500,s_zaco_0,egu6,10,10
	cspecial	0000,0180,100,4000,asteroid2,break_meteor_istrat
	cspecial	0000,-180,100,4000,asteroid2,break_meteor_istrat
	cspecial	0400,0000,-200,4000,asteroid2,break_meteor_istrat
	mapobj	0300,0200,Space_viewCY+200,4000,asteroid1,slowmeteor_Istrat
	pathcspecial	0400,-2500,2200,1800,zaco_8,egu6,10,10
	pathcspecial	0400,2500,2200,1800,zaco_8,egu6,10,10
	pathcspecial	0400,-2900,2200,2100,zaco_8,egu6_irab,10,10
	pathcspecial	6000,2900,2200,2100,zaco_8,egu6_ifal,10,10
	cspecial	0000,0180,100,4000,asteroid2,break_meteor_istrat
	cspecial	0000,-180,100,4000,asteroid2,break_meteor_istrat
	cspecial	0400,0000,-200,4000,asteroid2,break_meteor_istrat
	mapobj	0300,0200,Space_viewCY+200,4000,asteroid1,slowmeteor_Istrat
	map_farships2	-1000,0,9000,-10,20,4
	map_farships1	1500,-300,9000,20,18,2
	map_farships0	2000,0,9000,10,10,3
	map_farships2	-0800,500,8000,-20,16,2
	mapobj	2500,500,300,3000,w_l,winglazerman_Istrat
	cspecial	0000,0180,100,4000,asteroid2,break_meteor_istrat
	cspecial	0000,-180,100,4000,asteroid2,break_meteor_istrat
	cspecial	0400,0000,-200,4000,asteroid2,break_meteor_istrat
	mapobj	0300,0200,Space_viewCY+200,4000,asteroid1,slowmeteor_Istrat
	pathobj	0700,000,2000,2600,boss_e_4,minicas2,10,10
	pathobj	0700,100,2000,2600,boss_e_4,minicas2,10,10
	pathobj	4000,-100,2000,2600,boss_e_4,minicas2,10,10
	pathobj	5000,-200,0200,3000,paper_1,paper_1b,10,10
	pathobj	5000,0100,-100,3000,paper_1,paper_1b,10,10
	pathobj	5000,-200,400,1500,paper_1,paper_1,10,10
	pathobj	6000,-400,150,3000,paper_3,paper_3,10,10
	mapobj	6000,000,-200,4000,pole_0,pole0_istrat
	mapobj	6000,-100,100,4000,pole_0,pole0_istrat
	map_farships2	-1000,0,9000,-10,20,4
	map_farships1	1500,-300,9000,20,18,2
	map_farships0	2000,0,9000,10,10,3
	map_farships2	-0800,500,8000,-20,16,2
	cspecial	0000,0180,100,4000,asteroid2,break_meteor_istrat
	cspecial	0000,-180,100,4000,asteroid2,break_meteor_istrat
	cspecial	0400,0000,-200,4000,asteroid2,break_meteor_istrat
	mapobj	0300,0200,Space_viewCY+200,4000,asteroid1,slowmeteor_Istrat
	pathobj	6000,0400,0000,3000,paper_1,paper_1b,10,10
	pathobj	6000,0000,-400,1500,paper_1,paper_1,10,10
	pathobj	8000,0200,200,2000,paper_3,paper_3,10,10
	cspecial	1000,0000,space_viewcy-200,3000,zaco_7,szaco5_Istrat	; fly out of ship2
	cspecial	0000,400,space_viewcy+200,3000,zaco_7,szaco5_Istrat	; fly out of ship2
	cspecial	3000,-400,space_viewcy+200,3000,zaco_7,szaco5_Istrat	; fly out of ship2

	mapwait 2000
	SETVAR.N	FADEPAL,33
	setvar	palfrom,0
	setvar	palto,0
	setvar	pallen,32
	SETVAR.N	INFOG,0
	MAPCODE_JSL	BG_1_3A_1
	mapwait	1000
;----
.finn
	map_farships2	-2500,-300,8000,-30,15,2
	mapwait	1000
	map_farships2	0,-1200,8000,16,-40,1
	mapwait	1000
	map_farships1	500,-1000,6000,30,-20,2
	mapwait	3000

	map_farships0	500,-0500,6000,50,-30,1

	cspecial	1000,0000,space_viewcy-200,3000,zaco_7,szaco5_Istrat	; fly out of ship2
	cspecial	0000,400,space_viewcy+200,3000,zaco_7,szaco5_Istrat	; fly out of ship2
	cspecial	3000,-400,space_viewcy+200,3000,zaco_7,szaco5_Istrat	; fly out of ship2
;	szaco2_mapobj	-500,2000,-300,100,0
;	szaco2_mapobj	500,2000,300,100,200
;	szaco2_mapobj	-1000,2000,-500,-100,0
;	szaco2_mapobj	1000,2000,500,-100,100
;
;	mapwait	3000	
;
;	cspecial	1000,-200,space_viewcy+200,3400,zaco_7,szaco5_Istrat	; fly out of ship2

	mapobj	0000,100,-100,5000,nullshape,up1man_Istrat
	maprts





