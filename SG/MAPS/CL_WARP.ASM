cl_warp
	mapplayeroutview


	setbgm	$f1

;	mapwait	2000
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
	mapCLplayermode	Warp
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
	mapwait	1800		; MUST be 2800 for music timing ! 
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
	mapobj	friendwait,0300,space_viewcy,50,slippy1,clshipWARPb_Istrat
.nofriends1
	clfriendmsg	frog
.nf
	mapif	chkfastend,.hello3
	mapgoto	.ending
.hello3
	mapjmpfrienddead	bunny,.nb
	mapif		assaultcheck,.nofriends2
	mapobj	friendwait,-300,space_viewcy,50,peppy1,clshipWARPa_Istrat
.nofriends2
	clfriendmsg	bunny
.nb
	mapif	chkfastend,.hello4
	mapgoto	.ending
.hello4
	mapjmpfrienddead	cock,.nc
	mapif		assaultcheck,.nofriends3
	mapobj	friendwait,00000,space_viewcy-40,-3000,falco1,clshipWARPc_Istrat
.nofriends3
	clfriendmsg	cock
.nc
	mapif	chkfastend,.hello5
	mapgoto	.ending
.hello5
	mapwait	500
	mapmother	10000,0000,0,4000,mother1,mother1_istrat,mother_1
	setvar.b	clb2,0
	setvar.n	stageclear,0
	printlevelfin
	mapif	chkfastend,.hello6
	mapgoto	.ending
.hello6
.eswait	mapwait		1
	maploop		.eswait,100
.ending
	setvar.b	clb2,2	; remove print
	setvar.b	onecredspr,0
	mapwait		2000
	maprem		mother1
	mapwait		9000
	setvar.n	clb2,1
	maprts


