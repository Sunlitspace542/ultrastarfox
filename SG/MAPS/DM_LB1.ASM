; last base entrance 1.

	mapwait	medpspeed*44
	setbgm	$12
	
	mapobj	0000,0000,0000,6000,last_b_0,gnd_Istrat
	setvarobj	mapvar1
	mapobj	0000,0000,0000,6000,last_b_2,lastb2_Istrat
	setalvar	roty,deg180
	mapobj	0000,0000,-48<<4,6000,last_b_3,lastb3_Istrat
	mapobj	0000,0000,(100<<4)-30,6000-64,door_l,lastb4_Istrat

	mapplayermode	intoLB1

.wait
	mapif	chkstratdone1,.cont
	mapwait	1
   	mapgoto	.wait
.cont


	setbg	1_6b
	initbg
