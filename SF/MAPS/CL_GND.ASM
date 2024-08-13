cl_ground

	setbgm	$f1

	mapwait	2000
	setbgm	bgm_fanfare

	mapwait	3000

	setvar.n	stageclear,1
	mapCLplayermode	ClearDemo

friendwait	=	medpspeed*30

	mapmsg	1
	mapwait	friendwait

	mapjmpfrienddead	frog,.nf
	clfriendmsg	frog
	mapobj	friendwait,0500,-50,50,myship_4,clshipGNDb_Istrat
.nf
	mapjmpfrienddead	bunny,.nb
	clfriendmsg	bunny
	mapobj	friendwait,-500,-50,50,myship_4,clshipGNDa_Istrat
.nb
	mapjmpfrienddead	cock,.nc
	clfriendmsg	cock
	mapobj	friendwait,0000,-500,-300,myship_4,clshipGNDc_Istrat
.nc

	mapwait	3800

	setvar.b	clb2,0
	setvar.n	stageclear,0
	printlevelfin
.eswait	mapwait		1
	maploop		.eswait,100
	mapendwipe	roundwipefill,32*medpspeed
	maprts


