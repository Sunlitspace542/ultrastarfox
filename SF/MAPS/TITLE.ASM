; disable player's movement and wobble:
	setfadedown	quick
	mapwaitfade
	setbg	title
	initbg

timeovercont
	start_65816
	a16
	stz	lastplayz
	stz	pviewposz
	ldx	playpt
	stz	al_worldz,x
	a8
	end_65816

	mapcode_jsl	initblack_l
	setvar		stayblack,10

	mapwait	800

	IFEQ	CONTEST
	mapobj	0,20,20,70,my_demo,tit_istrat
	ENDC

	setfadeup	quick

	start_65816
	a8
	lda	playerflymode
	and	#~pfm_wobble
	sta	playerflymode

	lda	pshipflags
	ora	#psf_noctrl!psf_nofire
	sta	pshipflags

	end_65816

.ll	mapwait	4000
	mapgoto	.ll

	IFNE	CONTEST
timeovermap
	setfadedown	quick
	mapwaitfade
	setbg	timeover
	initbg
	mapgoto	timeovercont

timeupmap
	setfadedown	quick
	mapwaitfade
	setbg	timeup
	initbg
	mapgoto	timeovercont

	ENDC


contmap	setfadedown	quick
	mapwaitfade
	setbg	cont
	initbg

	start_65816
	a16
	stz	lastplayz
	stz	pviewposz
	ldx	playpt
	stz	al_worldz,x
	a8
	lda	playerflymode
	and	#~pfm_wobble
	sta	playerflymode

	end_65816

	mapwait	medpspeed*4

	mapcode_jsl	initblack_l
	setvar.n	stayblack,3
	setfadeup	quick
.ll	mapwait	4000
	mapgoto	.ll

waitmap

.ll	mapwait	4000
	mapgoto	.ll




