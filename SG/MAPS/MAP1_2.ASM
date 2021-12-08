; SPACE
;				52 specials

map1_2

	mapwait		1000
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
;	mapgoto	map12boss
;-------------------------------------------------------------------------
;.e12
;	pathspecial	3000,0000,-100,4000,nullshape,insekikun,10,10
;	pathspecial	8000,300,Space_viewCY-100,7000,walker_2,pyonta,10,10
;	pathobj	8000,0000,0000,4000,walker_2,korori,10,10
;	pathobj	10000,1000,-700,2000,shark,call_fol,10,10
;	pathobj	10000,-1000,-700,2000,shark,call_fol,10,10
;	pathobj	8500,0050,-75,2000,clisla_s,l_clisla,10,10
;	pathobj	8500,0050,-75,2000,clisla_s,r_clisla,10,10
;	pathobj	10000,800,-170,5000,nullshape,kanihaha,10,10
;
;	mapgoto	.e12
;-------------------------------------------------------------------------
.z4test
	cspecial	1800,0,Space_viewCY-1000,800,zaco_4,szaco0_istrat
	pathobj	5000,3000,3000,3000,nullshape,astemsg,10,10
	cspecial	2000,1000,Space_viewCY,800,zaco_4,szaco0_istrat
	cspecial	5000,1000,Space_viewCY+1000,800,zaco_4,szaco0_istrat
;hazusu
;	cspecial	1000,-400,space_viewCY,3000,w_l,winglazerman_istrat ;;;
; M formation
	szaco2_mapobj	0,2000,0,0,100
	mapwait	500

	szaco2_mapobj	-500,2000,-300,100,0
	mapwait	500

	szaco2_mapobj	-1000,2000,-400,-100,0
	mapwait	2000
	szaco2_mapobj	0,2000,0,0,100
	mapwait	500
	szaco2_mapobj	500,2000,300,100,100
	mapwait	500
	szaco2_mapobj	1000,2000,400,-100,100
	mapwait	1500
	mapif	chkeasteregg1,.finn
	cspecial	0000,-300,Space_viewCY+100,3000,asteroid2,blackhole_istrat
	cspecial	0000,300,Space_viewCY+100,2000,asteroid2,blackhole_istrat
	cspecial	0000,0,Space_viewCY+100,2500,asteroid2,blackhole_istrat
	cspecial	0000,300,Space_viewCY+100,3500,asteroid2,blackhole_istrat
	cspecial	0000,-300,Space_viewCY+100,1000,asteroid2,blackhole_istrat
.finn
;mini_worm
	special	0000,-250,Space_viewCY,2500,d_head_0,wormhead_Istrat
	setvarobj	mapvar1
	mapwait	150
	
	REPT	5
	cspecial	0000,-250,Space_viewCY,2500,d_body_0,worm_Istrat
	setalvarptr.w	sword1,mapvar1
	setvarobj	mapvar1
	mapwait	150
	ENDR
	mapwait	4500
	mapmother	3500,0000,0,4000,mother1,mother1_istrat,mother_1
	maprem	mother1

	mapobj	2000,0200,0100,4000,asteroid2,break_meteor_istrat
	cspecial	1000,0000,Space_viewCY,800,cameleon,cameleon_istrat
;friend
	mapif		assaultcheck,.nofriends1
	pathobj	00000,1200,200,0600,friendship_4,chase1_1,200,10

	pathcspecial	02000,1200,200,0600,zaco_b,chase1_2,10,10
.nofriends1
	mapobj	0400,-400,Space_viewCY,4000,asteroid1,slowmeteor_Istrat
	mapobj	0200,0200,0100,4000,asteroid2,break_meteor_istrat
	cspecial	2000,0,Space_viewCY-1000,800,zaco_4,szaco0_istrat
	mapobj	1400,-400,Space_viewCY+200,4000,asteroid1,slowmeteor_Istrat
	cspecial	1200,-200,0100,4000,asteroid2,break_meteor_istrat
	mapobj	1400,0300,Space_viewCY-200,4000,asteroid1,slowmeteor_Istrat
	mapobj	2000,-100,-200,4000,asteroid2,break_meteor_istrat
;mini_worm
	special	0000,-128,Space_viewCY+128,2000,d_head_0,wormhead_Istrat
	setvarobj	mapvar1
	mapwait	150
	
	REPT	5
	cspecial	0000,-128,Space_viewCY+128,2000,d_body_0,worm_Istrat
	setalvarptr.w	sword1,mapvar1
	setvarobj	mapvar1
	mapwait	150
	ENDR
	mapobj	1400,-300,Space_viewCY-200,4000,asteroid1,slowmeteor_Istrat
	mapobj	2000,100,00,4000,asteroid2,break_meteor_istrat
;camereon_area
	cspecial	0000,0200,Space_viewCY,800,cameleon,cameleon_istrat
	special	2000,-200,Space_viewCY,800,cameleon,cameleon_istrat
	mapobj	0400,300,Space_viewCY-300,4000,asteroid1,slowmeteor_Istrat
	cspecial	0000,0000,Space_viewCY+200,800,cameleon,cameleon_istrat
	special	4000,0000,Space_viewCY-200,800,cameleon,cameleon_istrat

	mapmother	3000,0000,0,4000,mother1,mother1_istrat,mother_3
	cspecial	4000,-200,0000,4000,asteroid2,break_meteort_istrat
	maprem	mother1

	mapobj	1000,0100,Space_viewCY+100,3000,asteroid2,break_meteor_istrat
	mapmother	4000,0000,0,4000,mother1,mother1_istrat,mother_1
	maprem	mother1
	mapobj	0000,0000,space_viewcy-100,6800,item_5,item5_istrat
	setalvar	sbyte1,1
	pathspecial	1000,250,Space_viewCY,7000,walker_2,pyonta,10,10
	mapobj	800,-300,Space_viewCY+200,4000,asteroid1,slowmeteor_Istrat
	mapobj	800,300,-200,4000,asteroid2,break_meteor_istrat
;friend
	mapif		assaultcheck,.nofriends2
	pathobj	0000,900,-60,0000,friendship_4,chase4_1,200,10

	pathcspecial	0000,900,-60,0000,zaco_b,chase4_2,200,10
	pathcspecial	2000,900,-60,0000,zaco_b,chase4_3,200,10
.nofriends2
	mapobj	0200,-400,Space_viewCY,4000,asteroid1,slowmeteor_Istrat
	mapobj	1800,100,200,4000,asteroid2,break_meteor_istrat
;skillfly
	skillfly_init
	skillfly_set	 0000,-50,4000,100
	cspecial	0000,0180,100,4000,asteroid2,break_meteor_istrat
	cspecial	0000,-180,100,4000,asteroid2,break_meteor_istrat
	cspecial	0400,0000,-200,4000,asteroid2,break_meteor_istrat
	mapobj	0300,0200,Space_viewCY+200,4000,asteroid1,slowmeteor_Istrat
	mapmother	02000,0000,0,4000,mother1,mother1_istrat,mother_2
	maprem	mother1

	mapmother	1300,0000,0,4000,mother1,mother1_istrat,mother_1
	maprem	mother1
	skillfly_bonus 0000,100,Space_viewCY-100,1500,item_7,item7_istrat
	setalvar	sbyte1,1
;worm
	special	0000,-128,Space_viewCY+128,2000,d_head_0,wormhead_Istrat
	setvarobj	mapvar1
	mapwait	150
	
	REPT	15
	cspecial	0000,-128,Space_viewCY+128,2000,d_body_0,worm_Istrat
	setalvarptr.w	sword1,mapvar1
	setvarobj	mapvar1
	mapwait	150
	ENDR
	mapobj	0000,-128,Space_viewCY+128,2000,d_body_0,worm_Istrat
	setalvarptr.w	sword1,mapvar1
	setvarobj	mapvar1
	mapwait	2500
;	mapmother	1200,0000,0,4000,mother1,mother1_istrat,mother_1
;	maprem	mother1
;	mapwait	2000
;	mapmother	0200,0000,0,4000,mother1,mother1_istrat,mother_0
;	maprem	mother1
;	mapwait	2000
;tadpoles
	cspecial	1000,0200,space_viewcy-500,3000,tadpole,tadpole_Istrat	
	skillfly_init
	skillfly_set	 0000,Space_viewCY-100,4000
	pathcspecial	1000,0000,-100,4000,nullshape,insekikun,10,10
	special	1000,1000,space_viewcy+100,3000,tadpole,tadpole_Istrat	
	pathcspecial	400,-200,0200,4000,b_hou_0,screw,10,10
	mapmother	0200,0000,0,4000,mother1,mother1_istrat,mother_1
	maprem	mother1
	pathcspecial	0200,100,-100,4000,b_hou_0,damyscr,10,10
	mapmother	0200,0000,0,4000,mother1,mother1_istrat,mother_1
	maprem	mother1
;space_houdais
	pathcspecial	2000,0200,-200,4000,b_hou_0,screw,10,10
	mapobj	2000,-200,-200,4000,asteroid2,break_meteor_istrat
	pathcspecial	1800,300,-100,4000,b_hou_0,damyscr,10,10
	pathcspecial	400,-300,00,4000,b_hou_0,screw,10,10
	mapobj	0800,0300,-100,4000,asteroid2,break_meteor_istrat
	skillfly_set	 0000,Space_viewCY-100,4000
	pathcspecial	1000,0000,-100,4000,nullshape,insekikun,10,10
	mapobj	1000,-100,0000,4000,asteroid2,break_meteort_istrat
	mapmother	1000,0000,0,4000,mother1,mother1_istrat,mother_0
	maprem	mother1
	skillfly_set	 -200,Space_viewCY-100,4000
	pathcspecial	1000,-200,-100,4000,nullshape,insekikun,10,10
	pathcspecial	1000,000,-200,3500,b_hou_0,damyscr,10,10
	mapobj	1000,-400,-100,4000,asteroid2,break_meteort_istrat
	mapobj	1000,200,0100,4000,asteroid2,break_meteort_istrat
;black_hole
	skillfly_bonus 0000,-300,Space_viewCY+100,3000,asteroid2,blackhole_istrat
	setalvar	sbyte1,1
	cspecial	1500,-100,0000,4000,asteroid2,break_meteort_istrat
	mapobj	1200,-100,Space_viewCY-200,4000,asteroid1,slowmeteor_Istrat

;gate
	mapobj	0400,0150,-100,4000,gate_0,gate_ISTRAT

	pathobj	2400,3000,3000,1000,nullshape,e_gate,10,10
	mapwait	1000
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
	mapobj	2000,-100,100,4000,asteroid2,break_meteort_istrat

	cspecial	2000,200,-100,4000,asteroid2,break_meteor_istrat
;friend
	mapif		assaultcheck,.nofriends3
	pathobj	00000,-900,00,00,friendship_4,chase2_1,200,10
	pathcspecial	01000,-900,00,00,zaco_b,chase2_2,10,10
.nofriends3
	mapobj	0400,-200,0100,4000,asteroid2,break_meteor_istrat
	pathcspecial	1000,000,-100,3500,b_hou_0,damyscr,10,10
	mapobj	0200,0000,-300,4000,asteroid2,break_meteort_istrat
	mapobj	1000,-200,Space_viewCY+200,4000,asteroid1,slowmeteor_Istrat
	mapobj	1000,0200,Space_viewCY-100,4000,asteroid1,slowmeteor_Istrat
	mapmother	0800,0000,0,4000,mother1,mother1_istrat,mother_1
	maprem		mother1
	pathcspecial	1000,300,-150,3500,b_hou_0,screw,10,10
	mapmother	0500,0000,0,4000,mother1,mother1_istrat,mother_1
	maprem		mother1
;big_meteos
	mapobj	1500,0600,0500,7000,big_meteor,big_meteor_istrat
	cspecial	0500,-200,0100,7000,r_hou_0,shou0a_istrat

	mapobj	1000,-400,Space_viewCY-500,7000,big_meteor,big_meteor_istrat
;;; PAL CUT
;	cspecial	1000,600,-300,4000,asteroid2,break_meteort_istrat
;	mapobj	2000,-800,-300,4000,asteroid2,break_meteort_istrat
;	mapobj	1000,800,400,4000,asteroid2,break_meteort_istrat

;	special	3000,0000,0000,800,cameleon,cameleon2_istrat
;	mapobj	0400,-500,Space_viewCY+100,4000,asteroid1,slowmeteor_Istrat
;	cspecial	1000,0000,0000,800,cameleon,cameleon2_istrat

;	special	2500,0200,space_viewcy-200,3000,tadpole,tadpole_Istrat	
;	mapobj	0200,0200,-300,4000,asteroid2,break_meteort_istrat
;	pathspecial	1000,300,Space_viewCY-100,7000,walker_2,pyonta,10,10
;	cspecial	1000,400,-200,3500,asteroid2,break_meteor_istrat
;	cspecial	1000,0200,space_viewcy,3000,tadpole,tadpole_Istrat	
;	cspecial	0800,100,-200,3000,asteroid2,break_meteor_istrat
;	cspecial	1500,-200,space_viewcy-100,3000,tadpole,tadpole_Istrat	
;	mapobj	1200,100,400,3000,asteroid2,break_meteor_istrat
;	mapobj	1200,-300,-200,4000,asteroid2,break_meteor_istrat
;supply_bird
;	mapobj	2000,-500,Space_viewCY-400,4000,asteroid1,slowmeteor_Istrat
;	mapobj	2000,-200,Space_viewCY+100,4000,asteroid1,slowmeteor_Istrat
;;;;;;

	mapmother	07000,0000,0,4000,mother1,mother1_istrat,map_shou0
	maprem		mother1
	pathobj	5000,-250,-350,0,my_bird,my_bird,10,10

	mapobj	5000,000,200,2000,spacepilon,spacepilon_istrat

	mapmother	0500,0000,0,4000,mother1,mother1_istrat,mother_0
	maprem		mother1


map12boss
.boss
	fadeoutbgm
	setbgm	5
;---------------
; barricader boss
	mapobj	0000,0000,Space_viewCY+1000,1500,boss_1_2,boss1_Istrat
	mapwait	1000
	mapwaitboss
	markboss	boss12

	mapwait	1800

	maprts





		 







