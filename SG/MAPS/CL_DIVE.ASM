cl_dive
;	mapwait	2600
	mapplayeroutview
	setbgm	$f1

	setbgm	bgm_fanfare
	mapCLplayermode	Dive
	mapwait	2800
;	printlevelfin
	

friendwait	=	medpspeed*30

	setvar.n	stageclear,1
	mapmsg	1
	mapwait	friendwait

	mapjmpfrienddead	frog,.nf
	clfriendmsg	frog
	mapobj	friendwait,0200,space_viewcy,50,myship_4,clshipDIVEb_Istrat
.nf
	mapjmpfrienddead	bunny,.nb
	clfriendmsg	bunny
	mapobj	friendwait,-200,space_viewcy,50,myship_4,clshipDIVEa_Istrat
.nb
	mapjmpfrienddead	cock,.nc
	clfriendmsg	cock
	mapobj	friendwait,00000,space_viewcy-40,-50,myship_4,clshipDIVEc_Istrat
.nc

	mapwait	5000
	setvar.b	clb2,0
	setvar.n	stageclear,0
	printlevelfin
.eswait	mapwait		1
	maploop		.eswait,100

	setbgm	$f1
	start_65816
	lda	pshipflags3
	and	#~psf3_enginesnd
	sta	pshipflags3
	end_65816

	setfadedown
	mapwaitfade
	setvar.b	clb2,1
	maprts



























