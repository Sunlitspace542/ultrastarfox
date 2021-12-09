cl_bridge
	mapplayeroutview

	setbgm	$f1
	mapwait	2200	; 700
	
	mapCLplayermode	ClearBridge
	setbgm	bgm_fanfare
	mapwait	2900


friendwait	=	medpspeed*30

	setvar.n	stageclear,1
	mapmsg	1
	mapwait	friendwait


	mapjmpfrienddead	frog,.nf
	mapobj	friendwait,-1000,-300,50,myship_4,clshipBRIDGEb_Istrat
	clfriendmsg	frog
.nf

	mapjmpfrienddead	bunny,.nb
	mapobj	friendwait,1000,-300,50,myship_4,clshipBRIDGEa_Istrat
	clfriendmsg	bunny
.nb

	mapjmpfrienddead	cock,.nc
	mapobj	friendwait,00000,0,-2000,myship_4,clshipBRIDGEc_Istrat
	clfriendmsg	cock
.nc


	mapwait	5000
	setvar.b	clb2,0
	setvar.n	stageclear,0
	printlevelfin	
.eswait	mapwait		1
	maploop		.eswait,100
	mapendwipe	roundwipefill,32*medpspeed
	maprts










