cl_chase
	mapmother	0,0,0,3000,mother1,mother1_istrat,mother_CLasteroids
	mapplayeroutview

	setbgm	$f1
	
	mapCLplayermode	clearChase
	setbgm	bgm_fanfare
	mapwait	3800



	setvar.n	stageclear,1

friendwait	=	medpspeed*30

	mapmsg	1
	mapwait	friendwait


	mapjmpfrienddead	frog,.nf
	mapobj	friendwait,1000,-300,50,myship_4,clshipCHASEa_Istrat
	clfriendmsg	frog
.nf
	mapjmpfrienddead	bunny,.nb
	mapobj	friendwait,-2000,-300,50,myship_4,clshipCHASEb_Istrat
	clfriendmsg	bunny
.nb
	mapjmpfrienddead	cock,.nc
	mapobj	friendwait,00000,0,-2000,myship_4,clshipCHASEc_Istrat
	clfriendmsg	cock
.nc
	mapwait	7000

	setvar.b	clb2,0
	setvar.n	stageclear,0
	printlevelfin
.eswait	mapwait		1
	maploop		.eswait,100
	mapendwipe	roundwipefill,32*medpspeed
	maprts






















