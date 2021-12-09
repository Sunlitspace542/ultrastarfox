map1_3a

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

	mapobj	2500,-500,-300,3000,w_l,winglazerman_Istrat

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

	mapobj	0000,100,-100,5000,nullshape,up1man_Istrat
	maprts





