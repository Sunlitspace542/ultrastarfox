cl_bridge
	mapplayeroutview

	setbgm	$f1
	mapwait	2200	; 700
	
	mapCLplayermode	ClearBridge
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
	mapwait	1900
;	printlevelfin

	mapif	chkfastend,.hello
	mapgoto	.ending
.hello

friendwait	=	medpspeed*30

	setvar.n	stageclear,1
	mapmsg	1

	mapif	chkfastend,.hello2
	mapgoto	.ending
.hello2
	mapwait	friendwait


	mapjmpfrienddead	frog,.nf
	mapif		assaultcheck,.nofriends1
	mapobj	friendwait,-1000,-300,50,slippy1,clshipBRIDGEb_Istrat
.nofriends1
	clfriendmsg	frog
.nf
	mapif	chkfastend,.hello3
	mapgoto	.ending
.hello3
	mapjmpfrienddead	bunny,.nb
	mapif		assaultcheck,.nofriends2
	mapobj	friendwait,1000,-300,50,peppy1,clshipBRIDGEa_Istrat
.nofriends2
	clfriendmsg	bunny
.nb
	mapif	chkfastend,.hello4
	mapgoto	.ending
.hello4
	mapjmpfrienddead	cock,.nc
	mapif		assaultcheck,.nofriends3
	mapobj	friendwait,00000,0,-2000,falco1,clshipBRIDGEc_Istrat
.nofriends3
	clfriendmsg	cock
.nc

	mapif	chkfastend,.hello5
	mapgoto	.ending
.hello5
	mapwait	5000
	setvar.b	clb2,0
	setvar.n	stageclear,0
	printlevelfin	
	mapif	chkfastend,.hello6
	mapgoto	.ending
.hello6
.eswait	mapwait		1
	maploop		.eswait,100
.ending
	mapendwipe	roundwipefill,32*medpspeed
	maprts










