; 3-2 Asteroid Belt 3
; SPACE
map3_2

	mapwait		3300
; M formation
	szaco2_mapobj	0,2000,0,0,100
	szaco2_mapobj	-500,2000,-300,100,0
	szaco2_mapobj	500,2000,300,100,100
	pathobj	000,3000,3000,3000,nullshape,astemsg,10,10
	szaco2_mapobj	-1000,2000,-500,-100,0
	szaco2_mapobj	1000,2000,500,-100,100
	mapwait		2000
	pathcspecial	2000,-200,100,4000,zaco_0,itachi_a,2,4
	pathcspecial	4000,0200,-100,4000,zaco_0,itachi_a,2,4

;friend
	pathcspecial	0000,0000,-90,4000,zaco_0,itachi_a,2,4
	pathobj	0000,-900,000,0000,friendship_4,chase2_1,10,10
	pathcspecial	1000,-900,000,0000,zaco_b,chase2_2,10,10
	cspecial	1000,0000,0100,4000,asteroid2,break_meteor_istrat
	mapobj	0500,400,Space_viewCY-100,4000,asteroid1,slowmeteor_Istrat
	pathcspecial	0500,0200,00,4000,zaco_0,itachi_a,2,4
	mapobj	1000,-400,Space_viewCY+200,4000,asteroid1,slowmeteor_Istrat
	cspecial	1000,-200,0100,4000,asteroid2,break_meteor_istrat
	cspecial	1000,-400,0100,4000,asteroid2,break_meteor_istrat
	mapobj	1000,200,Space_viewCY-200,4000,asteroid1,slowmeteor_Istrat
	cspecial	1000,0000,0300,4000,asteroid2,break_meteort_istrat
	pathcspecial	0500,0250,-100,4000,zaco_0,itachi_a,2,4
	pathcspecial	0500,-100,-200,4000,zaco_0,itachi_a,2,4
	mapobj	1000,-300,Space_viewCY+200,4000,asteroid1,slowmeteor_Istrat
	pathcspecial	0500,0200,100,4000,zaco_0,itachi_a,2,4

	mapmother	1300,0000,0,4000,mother1,mother1_istrat,mother_1
	cspecial	1300,-350,-100,4000,asteroid2,break_meteor_istrat
	cspecial	1300,0000,0000,4000,asteroid2,break_meteor_istrat
	mapobj	1300,-700,-300,7000,big_meteor,big_meteor_istrat
	cspecial	1300,0450,0050,4000,asteroid2,break_meteor_istrat
	cspecial	1300,0050,-150,4000,asteroid2,break_meteor_istrat
	cspecial	1300,-350,0100,4000,asteroid2,break_meteor_istrat
	pathobj	1300,0970,-100,7000,big_meteor,bird_meteor,10,10
	cspecial	1300,0550,0000,4000,asteroid2,break_meteor_istrat
	cspecial	1300,-250,-120,4000,asteroid2,break_meteor_istrat
	cspecial	1300,450,0100,4000,asteroid2,break_meteor_istrat
	maprem		mother1
;-----------------------------------------------------------------------
;friend
	pathcspecial	2000,050,-70,4000,zaco_0,itachi_b,2,4
	pathcspecial	3000,-50,-140,4000,zaco_0,itachi_b,2,4
	pathobj	0000,1200,200,0600,friendship_4,chase1_1,200,10
	pathcspecial	1500,1200,200,0600,zaco_b,chase1_2,10,10
	pathcspecial	0500,-100,00,4000,zaco_0,itachi_a,2,4


	mapobj	1000,-300,Space_viewCY+200,4000,asteroid1,slowmeteor_Istrat
	pathcspecial	1000,-200,00,4000,zaco_0,itachi_a,2,4
	cspecial	1000,-400,0100,4000,asteroid2,break_meteor_istrat
	mapmother	02000,0000,0,4000,mother1,mother1_istrat,mother_2
	pathcspecial	1000,200,-100,4000,zaco_0,itachi_a,2,4
	maprem	mother1
;skillfly
	skillfly_init
	skillfly_set	 0000,-50,4500,120
	cspecial	0000,0180,100,4000,asteroid2,break_meteor_istrat
	cspecial	0000,-180,100,4000,asteroid2,break_meteor_istrat
	cspecial	0400,0000,-200,4000,asteroid2,break_meteor_istrat
	mapmother	4000,0000,0,4000,mother1,mother1_istrat,mother_1
	maprem		mother1
	skillfly_bonus 0000,0,Space_viewCY,1500,item_5,item5_istrat
	setalvar	sbyte1,1
	cspecial	2000,-400,space_viewCY,3000,w_l,winglazerman_istrat
	special	0000,-200,Space_viewCY+100,800,cameleon,cameleon_istrat
	cspecial	1500,0200,Space_viewCY-100,800,cameleon,cameleon_istrat
;meteo&launcher
	mapmother	4000,0000,0,4000,mother1,mother1_istrat,map_shou0
	pathcspecial	2000,000,-130,4000,zaco_0,itachi_a,2,4
	pathcspecial	2000,-200,000,4000,zaco_0,itachi_a,2,4
	pathcspecial	2000,200,-100,4000,zaco_0,itachi_b,2,4
	maprem		mother1
;gate
	mapobj	0500,400,-200,7000,big_meteor,big_meteor_istrat
	mapobj	3000,-400,200,7000,big_meteor,big_meteor_istrat

	mapobj	0000,0000,0000,4000,gate_0,gate_istrat
	pathobj	1000,3000,0000,1000,nullshape,e_gate,10,10
	cspecial	3500,-400,0200,4000,asteroid2,break_meteor_istrat

;windmil(round_1)
	special	0000,-1500,space_viewCY,4000,round_0,windmill_istrat
	setalvar	roty,160
	setalvar	vel,120
	mapwait	1200
	setalvar	roty,140
	setalvar	vel,100
	mapwait	1200
	setalvar	vel,0
	setalvar	roty,127
	mapwait	1500
	setalvar	vel,120
	setalvar	sword1,-2
;mini_worm
	special	0000,-200,Space_viewCY-100,2500,d_head_0,wormhead_Istrat
	setvarobj	mapvar1
	mapwait	150
	
	REPT	5
	cspecial	0000,-200,Space_viewCY-100,2500,d_body_0,worm_Istrat
	setalvarptr.w	sword1,mapvar1
	setvarobj	mapvar1
	mapwait	150
	ENDR

	mapobj	2000,000,100,2000,spacepilon,spacepilon_istrat
	pathcspecial	2000,-200,000,4000,zaco_0,itachi_b,2,4
;mini_worm
	special	0000,200,Space_viewCY+100,2300,d_head_0,wormhead_Istrat
	setvarobj	mapvar1
	mapwait	150
	
	REPT	5
	cspecial	0000,200,Space_viewCY+100,2300,d_body_0,worm_Istrat
	setalvarptr.w	sword1,mapvar1
	setvarobj	mapvar1
	mapwait	150
	ENDR
	map_setbarshape	solid
	pathcspecial	2000,200,-100,4000,zaco_0,itachi_a,2,4

;friend
	pathobj	00000,00,400,000,friendship_4,chase3_1,200,10
	pathcspecial	01000,00,400,000,zaco_b,chase3_2,10,10
;colony
	mapobj	0000,-4*Xlen,space_viewCY+(0*Ylen),5000,colony3R,nocoll_Istrat
	mapobj	1600,4*Xlen,space_viewCY+(0*Ylen),5000,colony3L,nocoll_Istrat

	mapobj	0000,-4*Xlen,space_viewCY+(0*Ylen),5000,colony3R,nocoll_Istrat
	mapobj	2000,4*Xlen,space_viewCY+(0*Ylen),5000,colony3L,nocoll_Istrat

	mapobj	0000,0000,00,5000,nullshape,up1man_Istrat
	setalvar	sbyte1,1
	pathcspecial	2000,200,-200,4000,zaco_0,itachi_b,2,4

	pathcspecial	2000,000,-100,4000,zaco_0,itachi_a,2,4
	mapobj	3000,000,200,2000,spacepilon,spacepilon_istrat

	mapobj	2250,0000,0000,4000,meteo_0,meteo0_Istrat
	mapobj	2250,0200,-100,4000,meteo_0,meteo0_Istrat
	mapobj	2250,-200,-160,4000,meteo_0,meteo0_Istrat

	pathcspecial	400,0200,-100,4000,b_hou_0,screw,10,10

	special	0000,-200,0000,4000,r_hou_0,shou0a_istrat

	mapobj	0000,0100,space_viewcy-100,4500,item_5,item5_istrat
	setalvar	sbyte1,1

;friend
	pathobj	0000,000,-600,000,friendship_4,chase5_1,10,10
	pathcspecial	0000,1500,100,1300,zaco_b,chase5_2,10,10
	pathcspecial	3000,000,-600,000,zaco_b,chase5_3,10,10
	cspecial	1000,0000,0300,4000,asteroid2,break_meteor_istrat
	cspecial	1000,-200,0100,4000,asteroid2,break_meteor_istrat
	mapmother	0400,0000,0,4000,mother1,mother1_istrat,mother_1
	maprem	mother1
	mapwait	2000
		
	mapmother	4000,0000,0,4000,mother1,mother1_istrat,mother_5
	maprem		mother1
;hider
	mapmother	5000,0000,0,4000,mother1,mother1_istrat,map_meteo0
	maprem		mother1

	mapmother	1500,0000,0,4000,mother1,mother1_istrat,mother_5
	pathcspecial	1000,200,-200,4000,zaco_0,itachi_b,2,4
	pathcspecial	1000,000,-100,4000,zaco_0,itachi_a,2,4
	pathcspecial	1000,-200,000,4000,zaco_0,itachi_b,2,4
	pathcspecial	1000,-200,-200,4000,zaco_0,itachi_a,2,4
	pathcspecial	1000,000,-100,4000,zaco_0,itachi_a,2,4
	pathcspecial	1000,200,000,4000,zaco_0,itachi_b,2,4
	maprem	mother1
;supply_bird
	pathobj	6000,-380,-150,0,my_bird,my_bird,10,10
	pathobj	0000,3000,3000,3000,nullshape,amebmsg2,10,10


.boss
	
;---------------
; propeller boss
	fadeoutbgm
	setbgm	bgm_boss1
	incmap	webmonst
	mapwaitboss
	markboss	boss32

	mapwait	1800

	maprts





		 







