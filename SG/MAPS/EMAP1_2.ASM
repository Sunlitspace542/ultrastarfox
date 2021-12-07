; SPACE
;				52 specials

map1_2

	mapwait		1000

;	pathobj time,x,y,z,shape_name,path_name,hp,ap
.z4test
	cspecial	1800,0,Space_viewCY-1000,800,zaco_4,szaco0_istrat
	pathobj	5000,3000,3000,3000,nullshape,astemsg,10,10
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

;;mini_worm
;	special	0000,-250,Space_viewCY,2500,d_head_0,wormhead_Istrat
;	setvarobj	mapvar1
;	mapwait	150
;	
;	REPT	5
;	cspecial	0000,-250,Space_viewCY,2500,d_body_0,worm_Istrat
;	setalvarptr.w	sword1,mapvar1
;	setvarobj	mapvar1
;	mapwait	150
;	ENDR
;	mapwait	4500
;	mapmother	3500,0000,0,4000,mother1,mother1_istrat,mother_1
;	maprem	mother1
;
;	mapobj	2000,0200,0100,4000,asteroid2,break_meteor_istrat
;	cspecial	1000,0000,Space_viewCY,800,cameleon,cameleon_istrat
;friend
	pathobj	00000,1200,200,0600,friendship_4,chase1_1,200,10
	pathcspecial	02000,1200,200,0600,zaco_b,chase1_2,10,10
	mapobj	0400,-400,Space_viewCY,4000,asteroid1,slowmeteor_Istrat
	cspecial	0200,0200,0100,4000,asteroid2,break_meteor_istrat
	mapobj	1400,-400,Space_viewCY+200,4000,asteroid1,slowmeteor_Istrat
	cspecial	1200,-200,0100,4000,asteroid2,break_meteor_istrat
	mapobj	1400,0300,Space_viewCY-200,4000,asteroid1,slowmeteor_Istrat
	cspecial	2000,-100,-200,4000,asteroid2,break_meteor_istrat
;;mini_worm
;	special	0000,-128,Space_viewCY+128,2000,d_head_0,wormhead_Istrat
;	setvarobj	mapvar1
;	mapwait	150
;	
;	REPT	5
;	cspecial	0000,-128,Space_viewCY+128,2000,d_body_0,worm_Istrat
;	setalvarptr.w	sword1,mapvar1
;	setvarobj	mapvar1
;	mapwait	150
;	ENDR
;	mapobj	1400,-300,Space_viewCY-200,4000,asteroid1,slowmeteor_Istrat
;	mapobj	2000,100,00,4000,asteroid2,break_meteor_istrat
;camereon_area
;	cspecial	0000,0200,Space_viewCY,800,cameleon,cameleon_istrat
;	special	2000,-200,Space_viewCY,800,cameleon,cameleon_istrat
;	mapobj	0400,300,Space_viewCY-300,4000,asteroid1,slowmeteor_Istrat
;	cspecial	0000,0000,Space_viewCY+200,800,cameleon,cameleon_istrat
;	special	4000,0000,Space_viewCY-200,800,cameleon,cameleon_istrat

	mapmother	0200,0000,0,4000,mother1,mother1_istrat,mother_3
	cspecial	0400,-200,0100,4000,asteroid2,break_meteor_istrat
	cspecial	0400,0300,-100,4000,asteroid2,break_meteor_istrat
	cspecial	0400,0000,-300,4000,asteroid2,break_meteor_istrat
	cspecial	0400,-100,0150,4000,asteroid2,break_meteor_istrat
	cspecial	0400,-400,0000,4000,asteroid2,break_meteor_istrat

	cspecial	0400,0200,0000,4000,asteroid2,break_meteor_istrat
	cspecial	0400,-300,0200,4000,asteroid2,break_meteor_istrat
	cspecial	0400,0000,-200,4000,asteroid2,break_meteor_istrat
	cspecial	0400,-100,0000,4000,asteroid2,break_meteor_istrat
	cspecial	0400,0050,0100,4000,asteroid2,break_meteor_istrat

	cspecial	0400,-150,-100,4000,asteroid2,break_meteor_istrat
	cspecial	0400,-600,0000,4000,asteroid2,break_meteor_istrat
	cspecial	0400,0300,0050,4000,asteroid2,break_meteor_istrat
	cspecial	0400,0700,0150,4000,asteroid2,break_meteor_istrat
	cspecial	0400,-100,-200,4000,asteroid2,break_meteor_istrat

	mapobj	0000,0000,space_viewcy-100,4000,item_5,item5_istrat
	setalvar	sbyte1,1

	cspecial	0400,-200,0000,4000,asteroid2,break_meteor_istrat
	cspecial	0400,0100,0300,4000,asteroid2,break_meteor_istrat
	cspecial	0400,0600,-100,4000,asteroid2,break_meteor_istrat
	cspecial	0400,0000,0000,4000,asteroid2,break_meteor_istrat
	maprem	mother1
;
;	mapobj	1000,0100,Space_viewCY+100,3000,asteroid2,break_meteor_istrat
;	mapmother	4000,0000,0,4000,mother1,mother1_istrat,mother_1
;	maprem	mother1
;	mapobj	0000,0000,space_viewcy-100,6800,item_5,item5_istrat
;	setalvar	sbyte1,1
;	pathspecial	1000,200,Space_viewCY,7000,walker_2,pyonta,10,10
;	mapobj	800,-300,Space_viewCY+200,4000,asteroid1,slowmeteor_Istrat
;	mapobj	800,300,-200,4000,asteroid2,break_meteor_istrat
;;skillfly
;	skillfly_init
;	skillfly_set	 0000,-50,4000,100
;	cspecial	0000,0180,100,4000,asteroid2,break_meteor_istrat
;	cspecial	0000,-180,100,4000,asteroid2,break_meteor_istrat
;	cspecial	0400,0000,-200,4000,asteroid2,break_meteor_istrat
;	mapobj	0300,0200,Space_viewCY+200,4000,asteroid1,slowmeteor_Istrat
;	mapmother	02000,0000,0,4000,mother1,mother1_istrat,mother_2
;	maprem	mother1
;
;	mapmother	1300,0000,0,4000,mother1,mother1_istrat,mother_1
;	maprem	mother1
;	skillfly_bonus 0000,100,Space_viewCY-100,1500,item_7,item7_istrat
;	setalvar	sbyte1,1
;tadpoles
	cspecial	1000,0200,space_viewcy-500,3000,tadpole,tadpole_Istrat	
	pathcspecial	1000,0000,-100,4000,nullshape,insekikun,10,10
	pathcspecial	400,-200,0200,4000,b_hou_0,screw,10,10
	pathcspecial	0200,100,-100,4000,b_hou_0,damyscr,10,10
;space_houdais
	pathcspecial	1000,0000,-100,4000,nullshape,insekikun,10,10
	cspecial	0200,-400,-100,4000,asteroid2,break_meteor_istrat
;big_meteos
	mapobj	1500,0600,0500,7000,big_meteor,big_meteor_istrat
	cspecial	0500,-200,0100,7000,r_hou_0,shou0a_istrat

	cspecial	0200,-600,-300,4000,asteroid2,break_meteor_istrat

	cspecial	3000,0000,0000,800,cameleon,cameleon_istrat
	mapobj	0400,-500,Space_viewCY+100,4000,asteroid1,slowmeteor_Istrat
	cspecial	1000,0000,0000,800,cameleon,cameleon_istrat

	cspecial	2500,0200,space_viewcy-200,3000,tadpole,tadpole_Istrat	
	cspecial	0200,0200,-300,4000,asteroid2,break_meteor_istrat
;	cspecial	1000,400,-200,3500,asteroid2,break_meteor_istrat
;	cspecial	1000,0200,space_viewcy,3000,tadpole,tadpole_Istrat	
;	cspecial	0800,100,-200,3000,asteroid2,break_meteor_istrat
;	cspecial	1500,-200,space_viewcy-100,3000,tadpole,tadpole_Istrat	
;	mapobj	1200,100,400,3000,asteroid2,break_meteor_istrat
;	mapobj	1200,-300,-200,4000,asteroid2,break_meteor_istrat
;supply_bird
	pathobj	4000,-250,-350,0,my_bird,my_bird,10,10
	mapobj	2000,-500,Space_viewCY-400,4000,asteroid1,slowmeteor_Istrat
	mapobj	2000,-200,Space_viewCY+100,4000,asteroid1,slowmeteor_Istrat

	mapmother	0400,0000,0,4000,mother1,mother1_istrat,map_shou0
	cspecial	0400,0050,0100,4000,asteroid2,break_meteor_istrat
	cspecial	0400,-200,0200,4000,r_hou_0,shou0a_istrat
	cspecial	0400,0200,-100,4000,r_hou_0,shou0a_istrat
	cspecial	0400,-100,0000,4000,s_hou_0,shou0_istrat

	cspecial	0400,0000,0100,4000,r_hou_0,shou0a_istrat
	cspecial	0400,0350,0000,4000,asteroid2,break_meteor_istrat
	cspecial	0400,0600,-200,4000,r_hou_0,shou0a_istrat
	cspecial	0400,-400,-100,4000,s_hou_0,shou0_istrat
	cspecial	0400,-100,0000,4000,r_hou_0,shou0a_istrat

	cspecial	0400,0100,0050,4000,r_hou_0,shou0a_istrat
	cspecial	0400,-400,-150,4000,r_hou_0,shou0a_istrat
	cspecial	0400,0350,0100,4000,asteroid2,break_meteor_istrat
	cspecial	0400,0000,-200,4000,s_hou_0,shou0_istrat
	cspecial	0400,-300,-100,4000,s_hou_0,shou0_istrat
	maprem		mother1

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