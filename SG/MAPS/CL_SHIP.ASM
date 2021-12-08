cl_ship3_4
	setbg	3_4d
	initbg

	mapCLplayermode	ClearShip2
	start_65816
	lda	#0
	sta	hudrot+1
	lda	nobgm
	bne	.nofanfare
	end_65816
	setbgm	bgm_fanfare
	mapgoto	.fanfare
.nofanfare
	end_65816
.fanfare

	mapobj	0000,0000,space_viewCY,0,colony_0,ship0cdown_Istrat
	setalvar	roty,deg180

	mapgoto	cl_ship_cont
cl_ship1_3
	setbg	1_3e
	initbg

	mapCLplayermode	ClearShip2
	start_65816
	lda	nobgm
	bne	.nofanfare
	end_65816
	setbgm	bgm_fanfare
	mapgoto	.fanfare
.nofanfare
	end_65816
.fanfare

	mapobj	0000,0000,space_viewCY,0,Sship_0_c,ship0cdown_Istrat

cl_ship_cont
	mapwait	1000
	start_65816
	lda	bgmspeed
	beq	.nochange33
	cmp	#1
	beq	.slow23
	cmp	#2
	beq	.fast23
.slow23
	startbgm	$f4
	bra	.nochange33
.fast23
	startbgm	$f5
.nochange33
	end_65816
friendwait	=	medpspeed*30
	mapif	chkfastend,.hello
	mapgoto	.ending
.hello
	mapwait	9000-friendwait
;	printlevelfin

	mapmother	0,0,0,3000,mother1,mother1_istrat,mother_CLasteroids
	mapif	chkfastend,.hello2
	mapgoto	.ending
.hello2
	setvar.n	stageclear,1
	mapmsg	1

	mapif	chkfastend,.hello3
	mapgoto	.ending
.hello3
	mapwait	friendwait


	mapjmpfrienddead	frog,.nf
	mapif		assaultcheck,.nofriends1
	mapobj	friendwait,-1000,-50,50,slippy1,clshipSHIPa_Istrat
.nofriends1
	clfriendmsg	frog
.nf
	mapif	chkfastend,.hello4
	mapgoto	.ending
.hello4
	mapjmpfrienddead	bunny,.nb
	mapif		assaultcheck,.nofriends2
	mapobj	friendwait,01000,-50,50,peppy1,clshipSHIPb_Istrat		
.nofriends2
	clfriendmsg	bunny
.nb
	mapif	chkfastend,.hello5
	mapgoto	.ending
.hello5
	mapjmpfrienddead	cock,.nc
	mapif		assaultcheck,.nofriends3
	mapobj	friendwait,00000,200,-500,falco1,clshipSHIPc_Istrat		; 200,-1000
.nofriends3
	clfriendmsg	cock
.nc
	mapif	chkfastend,.hello6
	mapgoto	.ending
.hello6
	

	mapwait	3000
	setvar.b	clb2,0
	setvar.n	stageclear,0
	printlevelfin
	mapif	chkfastend,.hello7
	mapgoto	.ending
.hello7
.sdloop	mapif	chkstagedone,.sdcont
	mapgoto	.sdloop
.sdcont
.ending
	mapendwipe	roundwipefill,(45*(medpspeed))*2
	maprts





