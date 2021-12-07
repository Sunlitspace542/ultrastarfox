cl_under
	mapplayeroutview
	mapwait	1000

	setbgm	$f1

	mapwait	2000
	setbgm	bgm_fanfare

	mapwait	3000

	setvar.n	stageclear,1
	mapCLplayermode	ClearUnder

friendwait	=	medpspeed*30

	mapmsg	1
	mapwait	friendwait

	mapjmpfrienddead	frog,.nf
	clfriendmsg	frog
	mapobj	friendwait,1000,-300,50,myship_4,clshipUNDERa_Istrat
.nf
	mapjmpfrienddead	bunny,.nb
	clfriendmsg	bunny
	mapobj	friendwait,-2000,-300,50,myship_4,clshipUNDERb_Istrat
.nb
	mapjmpfrienddead	cock,.nc
	clfriendmsg	cock
	mapobj	friendwait,00000,0,-2000,myship_4,clshipUNDERc_Istrat
.nc

	mapwait	3800

	setvar.b	clb2,0
	setvar.n	stageclear,0
	printlevelfin
.eswait	mapwait		1
	maploop		.eswait,100
	mapendwipe	roundwipefill,32*medpspeed
	maprts

