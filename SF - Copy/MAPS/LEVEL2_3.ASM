level2_3
	initlevel	2_3a,mscramwipe_circle


	mapjsr	map2_3a

	setbg	2_3c
	initbg
	setrestart
	mapjsr	map2_3c

	setbg	2_3b
	mapwait	kichi2_len*2
	initbg
	mapjsr	map2_3b

	mapwait	1000

	mapjsr	cl_bridge
	mapend
