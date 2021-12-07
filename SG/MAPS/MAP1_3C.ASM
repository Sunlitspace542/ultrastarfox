

map1_3c
;near_side
	mapobj	0000,-1000,space_viewCY,0350,ship_4,cruiser1_Istrat
	setalvar	vel,200
	setalvar	rotz,230
;nomal
	mapobj	0000,-3400,space_viewCY+100,3000,ship_4,cruiser1f_Istrat
	setalvar	sbyte1,25
	setalvar	vel,55
	setalvar	rotz,20
	mapwait	2000	
;far_big_ship
	mapobj	0000,600,space_viewCY,8000,Sship_0_c,ship3a_Istrat
	setalvar	vel,125
	setalvar	rotx,10

	cspecial	000,-100,-200,5000,r_hou_0,shou0a_istrat
;from_top
	mapobj	0000,space_minX-2000,space_viewCY-3000,3000,ship_4,cruiser1_Istrat
	setalvar	vel,100
	setalvar	rotx,025 
	setalvar	rotz,230
	mapwait	3500	
;revease
	mapobj	0000,-2500,space_viewCY-100,4000,ship_4,cruiser1F_Istrat
	setalvar	vel,55
	setalvar	rotz,150
	mapwait	1000	
	cspecial	2000,0200,0300,5000,r_hou_0,shou0a_istrat
	cspecial	9000,-200,-200,5000,r_hou_0,shou0a_istrat
;gate
	mapobj	2000,0000,100,5000,gate_0,gate_ISTRAT
	pathobj	4000,3000,3000,1000,nullshape,e_gate,10,10
;
	pathspecial	0800,600,400,-100,s_zaco_0,patret,10,10
	pathcspecial	0800,500,-100,-100,bzaco_8,patret,10,10
	pathcspecial	4000,-400,200,-100,bzaco_8,patret,10,10
	cspecial	1000,0000,0200,4000,s_hou_0,shou0_istrat
;supply_bird
;	pathobj	1000,-380,-180,0,my_bird,my_bird,10,10


spsdist	=	13000

sphigh	equ	6000
		    
	mapobj	0000,0000,sphigh,spsdist,ship_0_c,ship3_Istrat
	setvarobj	mapvar1


	mapobj	0000,0000,sphigh-140,spsdist-240,bshipexitface,exitopensnd2_Istrat
	setalvar.w	sword1,400
	setalvarptr.w	sword2,mapvar1
	setalvar	sbyte1,-10

	
	mapobj	0000,0000,sphigh+140,spsdist-240,bshipexitface,exitopensnd2_Istrat
	setalvar.w	sword1,400
	setalvarptr.w	sword2,mapvar1
	setalvar	sbyte1,10


	mapwait	4000
	setbgm	$f1
	mapwait	medpspeed*7
	setbgm	5



.loop	mapif	chkstratdone1,.cont
	mapgoto	.loop
.cont

	setbg	1_3b
	initbg


	incmap	1-3-t3


;	mapjsr	Mtunnelexit
;	setbgm	$f1	; fade out music


	maprts







