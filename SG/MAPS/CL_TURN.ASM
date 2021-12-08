cl_turn
	mapplayeroutview


	setbgm	$f1

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
	mapwait	800

	IFEQ	CONTEST
	mapjsr		clfish
	ENDC
	mapif	chkfastend,.hello
	mapgoto	.ending
.hello
	mapCLplayermode	clearturn
	mapwait	1000		

friendwait	=	medpspeed*30

	setvar.n	stageclear,1
	mapmsg	1
	mapif	chkfastend,.hello2
	mapgoto	.ending
.hello2
	mapwait	friendwait

	mapjmpfrienddead	frog,.nf
	mapif		assaultcheck,.nofriends1
	mapobj	friendwait,700,space_viewcy,50,slippy1,clshipTURNb_Istrat
.nofriends1
	clfriendmsg	frog
.nf
	mapif	chkfastend,.hello3
	mapgoto	.ending
.hello3
   	mapjmpfrienddead	bunny,.nb
	mapif		assaultcheck,.nofriends2
	mapobj	friendwait,-500,space_viewcy,50,peppy1,clshipTURNa_Istrat
.nofriends2
	clfriendmsg	bunny
.nb
	mapif	chkfastend,.hello4
	mapgoto	.ending
.hello4
	mapjmpfrienddead	cock,.nc
	mapif		assaultcheck,.nofriends3
	mapobj	friendwait,00000,space_viewcy+400,-3000,falco1,clshipTURNc_Istrat
.nofriends3
	clfriendmsg	cock
.nc
	mapif	chkfastend,.hello5
	mapgoto	.ending
.hello5
	mapwait	4000
	IFEQ	CONTEST
	mapjsr		clfish
	ENDC
	mapwait	4000
	mapif	chkfastend,.hello6
	mapgoto	.ending
.hello6
	setvar.b	clb2,0
	setvar.n	stageclear,0
	printlevelfin
	mapif	chkfastend,.hello7
	mapgoto	.ending
.hello7
	mapwait		9000
.ending
	mapendwipe	roundwipefill,32*medpspeed
	maprts

clfish
	map_sfish	0,0000,100,1000,9
      	maprts

