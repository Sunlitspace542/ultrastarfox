map1_3a2
	mapwait	2000
	cspecial	0000,-250,300,4000,r_hou_0,shou0a_istrat
;friend
	pathobj	0000,0000,0400,0000,friendship_4,chase3_1,200,10
	pathobj	3000,0000,0400,0000,zaco_b,chase3_2,10,10

	mapobj	0000,-0800,space_viewCY-200,4000,ship_5S,cruiser2_Istrat
	setalvar	vel,18

	mapobj	0000,-1000,space_viewCY+400,3000,ship_5S,cruiser2_Istrat
	setalvar	roty,20
	setalvar	vel,20

	mapobj	0000,-500,space_viewCY+400,2000,ship_5m,cruiser2_Istrat
	setalvar	vel,20
	setalvar	rotx,240
	mapwait	3000 ;4000
	cspecial	0000,-200,-300,4000,r_hou_0,shou0a_istrat
	pathspecial	1500,-600,-100,-100,s_zaco_0,patret,10,10
	mapobj	0000,-2500,space_viewCY-100,3000,ship_5S,cruiser2_Istrat
	setalvar	vel,20
	mapobj	0000,-700,space_viewCY-100,4000,ship_5m,cruiser2_Istrat
	setalvar	vel,25
	setalvar	rotx,15

	mapobj	3000,000,-100,2000,spacepilon,spacepilon_istrat
	mapobj	0000,-300,0300,4000,r_hou_0,shou0a_istrat

	mapobj	0000,-1800,space_viewCY,5500,ship_5,cruiser2fire_Istrat
	setalvar	vel,40
	setalvar	rotx,254
;gate
	mapobj	2000,-150,000,5000,gate_0,gate_ISTRAT


	mapwait	4000
	cspecial	0000,0,space_viewcy+100,4000,zaco_7,szaco5_Istrat	; fly out of ship2
	setalvar	rotz,240
	mapwait		2000
;
	pathspecial	2500,-600,-400,-100,s_zaco_0,patret,10,10
	

	mapobj	1000,-250,0100,6000,r_hou_0,shou0a_istrat

spsdist	=	6000
	pathobj	0000,3000,3000,3000,nullshape,totumsg,10,10
	mapobj	0000,-300,space_viewCY-1500,spsdist,ship_3,ship2_Istrat
	setvarobj	mapvar1
	mapobj	0000,-300,space_viewCY-1500,spsdist,s_door_1,sdoor1_Istrat
	setalvarptr.w	sword1,mapvar1
	mapobj	0000,-300,space_viewCY-1500,spsdist,s_door_2,sdoor2_Istrat
	setalvarptr.w	sword1,mapvar1
	

.loop2	
	mapif	chkstratdone1,.cont2
	mapif	chkstratdone2,.again
	mapwait	1
	mapgoto	.loop2

.again
	mapgoto	map1_3a2
	

; DO TUNNEL
.cont2

	

	maprts









