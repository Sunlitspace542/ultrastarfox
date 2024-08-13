cl_turn
	mapplayeroutview


	setbgm	$f1

	setbgm	bgm_fanfare
	mapwait	1800

	mapjsr		clfish

	mapCLplayermode	clearturn
	mapwait	1000		

friendwait	=	medpspeed*30

	setvar.n	stageclear,1
	mapmsg	1
	mapwait	friendwait

	mapjmpfrienddead	frog,.nf
	mapobj	friendwait,700,space_viewcy,50,myship_4,clshipTURNb_Istrat
	clfriendmsg	frog
.nf
   	mapjmpfrienddead	bunny,.nb
	mapobj	friendwait,-500,space_viewcy,50,myship_4,clshipTURNa_Istrat
	clfriendmsg	bunny
.nb
	mapjmpfrienddead	cock,.nc
	mapobj	friendwait,00000,space_viewcy+400,-3000,myship_4,clshipTURNc_Istrat
	clfriendmsg	cock
.nc
	mapwait	4000
	mapjsr		clfish
	mapwait	4000

	setvar.b	clb2,0
	setvar.n	stageclear,0
	printlevelfin
	mapwait		9000
	mapendwipe	roundwipefill,32*medpspeed
	maprts

clfish
	map_sfish	0,0000,100,1000,9
      	maprts

