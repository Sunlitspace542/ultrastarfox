map2_3b

	mapwait	2000


.waitabit	mapwait	100


	start_65816
	a8
	stz	nogodgun
	lda	maptrigger
	bit	#2
	beq	.dontfinish
	switch	.carryon
.dontfinish
	bit	#1
	bne	.goahead
	switch	.waitabit
.goahead
	and	#$fe
	sta	maptrigger
	end_65816

;---------------------------------------------------
	setvar	gsvar_byte1,3
	mapobj	500,-200,0000,3300,sea_0_0,bossSeamon_Istrat
	mapobj	500,000,0000,3000,sea_0_0,bossSeamon_Istrat
	mapobj	500,0200,0000,3300,sea_0_0,bossSeamon_Istrat
	mapobj	500,0400,0000,3500,sea_0_0,bossSeamon_Istrat
	mapobj	500,0400,0000,3500,sea_0_0,bossSeamon_Istrat
	mapobj	500,-600,0000,1200,nullshape,torpedo_Istrat
	mapobj	500,0600,0000,1200,nullshape,torpedo_Istrat
	mapobj	500,-400,0000,1000,nullshape,torpedo_Istrat
	mapobj	500,0400,0000,1000,nullshape,torpedo_Istrat


.seatest
	mapwait	1
	start_65816
	a8
	lda	gsvar_byte1
	beq	.allgone
	switch	.seatest
.allgone	
	end_65816

;---------------------------------------------------

	mapgoto	.waitabit
.carryon
	mapwait	1000
	mapwaitboss	nosound
	markboss	boss23


	mapif	chkeasteregg2,.hello
	setfadedown	quick
	mapwaitfade
	setbg	3_3a
	initbg
	setfadeup	quick
	mapif	chkeasteregg2,.nothx
	start_65816
	lda	superspeeddelay
	cmp	#ktest
	bne	.noneed
	jsl	changeviewmode_l
.noneed
	end_65816
.nothx
	setrestart
;gate
	mapobj	2000,0000,-100,5000,gate_0,gate_ISTRAT
	pathobj	4000,3000,3000,1000,nullshape,e_gate,10,10
	mapwait	1000
	start_65816
	lda	bgmspeed
	beq	.nochange333
	cmp	#1
	beq	.slow333
	cmp	#2
	beq	.fast333
.slow333
	startbgm	$f4
	bra	.nochange333
.fast333
	startbgm	$f5
.nochange333
	end_65816
	mapjsr	map3_3a

.hello
;	mapwait	2000
	maprts




