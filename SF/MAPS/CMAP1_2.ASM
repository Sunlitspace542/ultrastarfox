; SPACE
;				52 specials

map1_2

	mapwait		1000
;-------------------------------------------------------------------------
.z4test
	cspecial	1800,0,Space_viewCY-1000,800,zaco_4,szaco0_istrat
	pathobj	5000,3000,3000,3000,nullshape,astemsg,10,10
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

;friend
	pathobj	00000,1200,200,0600,friendship_4,chase1_1,200,10
	pathcspecial	02000,1200,200,0600,zaco_b,chase1_2,10,10
	mapobj	0400,-400,Space_viewCY,4000,asteroid1,slowmeteor_Istrat
	mapobj	0200,0200,0100,4000,asteroid2,break_meteor_istrat
	mapobj	1400,-400,Space_viewCY+200,4000,asteroid1,slowmeteor_Istrat
	cspecial	1200,-200,0100,4000,asteroid2,break_meteor_istrat
	mapobj	1400,0300,Space_viewCY-200,4000,asteroid1,slowmeteor_Istrat
	mapobj	2000,-100,-200,4000,asteroid2,break_meteor_istrat
	mapmother	3000,0000,0,4000,mother1,mother1_istrat,mother_3
	cspecial	4000,-200,0000,4000,asteroid2,break_meteort_istrat
	maprem	mother1

	pathcspecial	1000,0000,-100,4000,nullshape,insekikun,10,10	
	pathcspecial	400,-200,0200,4000,b_hou_0,screw,10,10
	pathcspecial	0200,100,-100,4000,b_hou_0,damyscr,10,10
;big_meteos
	mapobj	1500,0600,0500,7000,big_meteor,big_meteor_istrat
	cspecial	0500,-200,0100,7000,r_hou_0,shou0a_istrat

	special	3000,0000,0000,800,cameleon,cameleon2_istrat
	mapobj	0400,-500,Space_viewCY+100,4000,asteroid1,slowmeteor_Istrat
	cspecial	1000,0000,0000,800,cameleon,cameleon2_istrat

	special	2500,0200,space_viewcy-200,3000,tadpole,tadpole_Istrat	
	mapobj	0200,0200,-300,4000,asteroid2,break_meteort_istrat
;supply_bird
	pathobj	4000,-250,-350,0,my_bird,my_bird,10,10
	mapobj	2000,-500,Space_viewCY-400,4000,asteroid1,slowmeteor_Istrat
	mapobj	2000,-200,Space_viewCY+100,4000,asteroid1,slowmeteor_Istrat

	mapmother	04000,0000,0,4000,mother1,mother1_istrat,map_shou0
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
