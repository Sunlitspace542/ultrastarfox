cl_ground
;	mapplayeroutview

;	mapwait	1000               DON'T REMOVE COMENT

	setbgm	$f1

	mapwait	2000
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
	mapwait	2000

	mapif	chkfastend,.hello
	mapgoto	.ending
.hello
	setvar.n	stageclear,1
	mapCLplayermode	ClearDemo

friendwait	=	medpspeed*30

	mapmsg	1
	mapif	chkfastend,.hello2
	mapgoto	.ending
.hello2


;	start_65816
;	lda	playertwoactivated
;	beq	.nop2
;	lda	livestwo
;	beq	.nop2
;	end_65816
;	mapobj	friendwait,0000,-1900,-100,playertwo1,clshipGNDd_Istrat
;	mapgoto	.p2
;.nop2
;	end_65816
;.p2
	mapwait	500

	mapjmpfrienddead	frog,.nf
	clfriendmsg	frog
	mapif	assaultcheck,.nf
	mapobj	friendwait,0500,-50,50,slippy1,clshipGNDb_Istrat
.nf
	mapif	chkfastend,.hello3
	mapgoto	.ending
.hello3

	mapjmpfrienddead	bunny,.nb
	clfriendmsg	bunny
	mapif	assaultcheck,.nb
	mapobj	friendwait,-500,-50,50,peppy1,clshipGNDa_Istrat
.nb
	mapif	chkfastend,.hello4
	mapgoto	.ending
.hello4

	mapjmpfrienddead	cock,.nc
	clfriendmsg	cock
	mapif	assaultcheck,.nc
	mapobj	friendwait,0000,-500,-300,falco1,clshipGNDc_Istrat
.nc
	mapif	chkfastend,.hello5
	mapgoto	.ending
.hello5
	mapwait	3800

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
