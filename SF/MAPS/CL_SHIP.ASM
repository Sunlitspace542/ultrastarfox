cl_ship3_4
	setbg	3_4d
	initbg

	IFNE	MSU1
	mapmsufade
	ENDC

	mapCLplayermode	ClearShip2
	setbgm	bgm_fanfare

	IFNE	MSU1
	mapmsuplay	clearorch,repeat
	ENDC

	mapobj	0000,0000,space_viewCY,0,colony_0,ship0cdown_Istrat
	setalvar	roty,deg180

	mapgoto	cl_ship_cont
cl_ship1_3
	setbg	1_3e
	initbg

	IFNE	MSU1
	mapmsufade
	ENDC

	mapCLplayermode	ClearShip2
	setbgm	bgm_fanfare
	IFNE	MSU1
	mapmsuplay	clearorch,repeat
	ENDC

	mapobj	0000,0000,space_viewCY,0,Sship_0_c,ship0cdown_Istrat

cl_ship_cont

friendwait	=	medpspeed*30

	mapwait	9000-friendwait

	mapmother	0,0,0,3000,mother1,mother1_istrat,mother_CLasteroids

	setvar.n	stageclear,1
	mapmsg	1
	mapwait	friendwait


	mapjmpfrienddead	frog,.nf
	mapobj	friendwait,-1000,-50,50,myship_4,clshipSHIPa_Istrat
	clfriendmsg	frog
.nf

	mapjmpfrienddead	bunny,.nb
	mapobj	friendwait,01000,-50,50,myship_4,clshipSHIPb_Istrat		
	clfriendmsg	bunny
.nb

	mapjmpfrienddead	cock,.nc
	mapobj	friendwait,00000,200,-500,myship_4,clshipSHIPc_Istrat		; 200,-1000
	clfriendmsg	cock
.nc

	

	mapwait	3000
	setvar.b	clb2,0
	setvar.n	stageclear,0
	printlevelfin
.sdloop	mapif	chkstagedone,.sdcont
	mapgoto	.sdloop
.sdcont
	mapendwipe	roundwipefill,(45*(medpspeed))*2
	maprts





