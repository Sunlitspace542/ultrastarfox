
level1_2
	initlevel	1_2,mstarwipe_circle

	mapjsr	map1_2

	IFEQ	CONTEST

	mapjsr	cl_warp
	mapend	4

	ELSEIF

	mapjsr	cl_turn
	mapend

	ENDC


