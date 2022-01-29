level1_5
	initlevel	1_5,mstarwipe_circle

	mapwait		100
	setvar		dospacesc,1
	setvar.W	bg2Yscroll,172

	mapjsr	map1_5

	mapjsr	cl_dive

	mapend__not	level1_6

