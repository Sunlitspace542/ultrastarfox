
level2_6
	initlevel	2_6a,0

	start_65816
	stz	helpshots
	end_65816

	mapjsr	map2_6a

	mapwait	4000
	incmap	cl_colon
	
	mapwait	2000
	mapgoto	final_tunnel



