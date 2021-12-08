map1_3a1
;					9 specials
	mapwait	2500

;	map_farships0	0,-1000,8000,20,-40,1
;	mapobj	0000,space_minX-4000,space_viewCY-500,6000,ship_1,ship1a_Istrat
;	setalvar	vel,60
;	setalvar	roty,160
;	setalvar	rotx,010
;	mapwait	4000
;	mapobj	0000,-400,space_viewcy+200,4000,zaco_7,szaco5_Istrat	; fly out of ship2
;	mapwait	2000
	
	mapobj	0000,space_minX+2000,space_viewCY+600,9000,ship_1,ship1a_Istrat
	setalvar	vel,60
	setalvar	roty,115
	setalvar	rotx,250
	setalvar	rotz,20
	pathcspecial	0300,space_minX+1000,space_viewCY+400,8000,zaco_7,patcom,10,10
	pathcspecial	0000,space_minX+500,space_viewCY+500,7500,zaco_7,patcom,10,10
	mapwait	6000	;;;11000	

	pathspecial	0600,0000,-600,-100,s_zaco_0,patret_ifal,10,10
	pathcspecial	0600,-500,100,-100,bzaco_8,patret_irab,10,10
	pathcspecial	2500,500,100,-100,bzaco_8,patret_ifro,10,10


	mapobj	0000,space_maxX-300,space_viewCY+200,10000,ship_1,ship1a_Istrat
	setalvar	vel,50
	setalvar	roty,134
	setalvar	rotz,250
	pathcspecial	0300,space_maxX,space_viewCY+800,8000,zaco_7,patcom,10,10
	pathcspecial	0000,space_maxX+200,space_viewCY+700,7500,zaco_7,patcom,10,10
	map_farships2	-500,-300,8000,-16,-25,2
	mapwait	8000	
	map_farships1	0,-0500,8000,20,-40,1
	mapcspecial	0000,-350,space_viewcy-300,4000,zaco_7,szaco5_Istrat	; fly out of ship2
	mapwait	1000	
	map_farships0	500,-1000,6000,30,-20,2
	pathspecial	0500,-700,-400,-100,s_zaco_0,patret,10,10
	pathcspecial	0500,-800,200,-100,bzaco_8,patret,10,10
	mapwait		1000

	cspecial	0000,-300,space_viewcy-200,3400,zaco_7,szaco5_Istrat	; fly out of ship2
	mapwait		2000


spsdist	=	6000
	pathobj	0000,3000,3000,3000,nullshape,totumsg,10,10
	mapobj	0000,0300,space_viewCY-1500,spsdist,ship_3,ship2_Istrat
	setvarobj	mapvar1
	mapobj	0000,0300,space_viewCY-1500,spsdist,s_door_1,sdoor1_Istrat
	setalvarptr.w	sword1,mapvar1
	mapobj	0000,0300,space_viewCY-1500,spsdist,s_door_2,sdoor2_Istrat
	setalvarptr.w	sword1,mapvar1
	

.loop1	
	mapif	chkstratdone1,.cont1
	mapif	chkstratdone2,map1_3a1
	mapwait	1
	mapgoto	.loop1


; DO TUNNEL
.cont1

	

	maprts










