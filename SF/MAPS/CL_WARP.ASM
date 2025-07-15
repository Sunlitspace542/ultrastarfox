cl_warp
	mapplayeroutview


	setbgm	$f1

	setbgm	bgm_fanfare
	mapCLplayermode	Warp
	mapwait	2800		; MUST be 2800 for music timing ! 

friendwait	=	medpspeed*30

	setvar.n	stageclear,1
	mapmsg	1
	mapwait	friendwait

	mapjmpfrienddead	frog,.nf
	mapobj	friendwait,0300,space_viewcy,50,myship_4,clshipWARPb_Istrat
	clfriendmsg	frog
.nf
	mapjmpfrienddead	bunny,.nb
	mapobj	friendwait,-300,space_viewcy,50,myship_4,clshipWARPa_Istrat
	clfriendmsg	bunny
.nb
	mapjmpfrienddead	cock,.nc
	mapobj	friendwait,00000,space_viewcy-40,-3000,myship_4,clshipWARPc_Istrat
	clfriendmsg	cock
.nc

	mapwait	500
	mapmother	10000,0000,0,4000,mother1,mother1_istrat,mother_1
	setvar.b	clb2,0
	setvar.n	stageclear,0
	printlevelfin
.eswait	mapwait		1
	maploop		.eswait,100
	setvar.b	clb2,2	; remove print
	setvar.b	onecredspr,0
	mapwait		2000
	maprem		mother1
	mapwait		9000
	setvar.n	clb2,1
	IFNE	RUMBLE
	start_65816
	s_end_rumble_table	; kill hyperjump rumble
	end_65816
	ENDC
	maprts


