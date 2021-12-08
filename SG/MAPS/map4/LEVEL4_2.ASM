level4_2


	mapif	chkeasteregg2,.hello
	setfadedown	quick
	mapwaitfade
	setbg	2_3a
	initbg
	setfadeup	quick
	setrestart
	mapgoto	.nohello
.hello
	initlevel	2_3a,mscramwipe_circle
.nohello
	mapjsr	map4_2


;-----------------------
;	pathobj	18000,0000,-170,5000,nullshape,kanihaha,10,10

	mapwait	3000
;27 specials
;chase 3 times
bigbasez	=	10000
kichi2_pos	=	bigbasez+kichi0_door
	mapobj	0000,0000,0000,kichi2_pos,k_door,kdoor_istrat
kichi2_pos	=	kichi2_pos+kichi2_len/2
	mapobj	0000,0000,0000,kichi2_pos,kichi_3,kichi2_istrat
kichi2_pos	=	kichi2_pos+kichi2_len
	mapobj	0000,0000,0000,kichi2_pos,kichi_3,kichi2_istrat
kichi2_pos	=	kichi2_pos+kichi2_len
	mapobj	0000,0000,0000,kichi2_pos,kichi_3,kichi2_istrat
;kichi2_pos	=	kichi2_pos+kichi2_len
;	mapobj	0000,0000,0000,kichi2_pos,kichi_3,kichi2_istrat
kichi2_pos	=	kichi2_pos+kichi2_len/2
	mapobj	0000,0000,0000,kichi2_pos,k_door,kdoor2_istrat
	mapobj	kichi2_pos-kichi2_len-kichi2_len/2-medpspeed*20,0000,0000,bigbasez,kichi_0,massivebase_istrat
	setbgm	$f1	; fade out music
	mapwait	medpspeed*20

	setbg	2_3c
	initbg
	setrestart
	mapjsr	map2_3c

	setbg	2_3b
	mapwait	kichi2_len*2
	initbg
	mapwait	2000


.waitabit	mapwait	100


	start_65816
	a8
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
	setvar	gsvar_byte1,5
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

;	mapobj	0050,0000,0000,3000-2000,sea_0_0,seamon_Istrat
;	mapobj	0000,-100,0000,3100-2000,sea_0_0,seamon_Istrat
;	mapobj	0050,0100,0000,3100-2000,sea_0_0,seamon_Istrat
;	mapobj	0000,-200,0000,3200-2000,sea_0_0,seamon_Istrat
;	mapobj	0050,0200,0000,3200-2000,sea_0_0,seamon_Istrat
;	mapobj	0000,-300,0000,3300-2000,sea_0_0,seamon_Istrat
;	mapobj	8000,0300,0000,3300-2000,sea_0_0,seamon_Istrat

	mapgoto	.waitabit
.carryon
	mapwaitboss	nosound
	markboss	boss23

	IFEQ	1
.loop
	mapobj	3000,-400,0000,1000,nullshape,torpedo_Istrat
	mapobj	3000,0400,0000,1000,nullshape,torpedo_Istrat
	mapobj	1000,-200,0000,1000,nullshape,torpedo_Istrat
	mapobj	1000,0200,0000,1000,nullshape,torpedo_Istrat
	mapobj	500,-200,0000,1000,nullshape,torpedo_Istrat
	mapobj	500,0200,0000,1000,nullshape,torpedo_Istrat
	mapobj	300,-200,0000,1000,nullshape,torpedo_Istrat
	mapobj	300,0200,0000,1000,nullshape,torpedo_Istrat
	mapobj	200,-200,0000,1000,nullshape,torpedo_Istrat
	mapobj	200,0200,0000,1000,nullshape,torpedo_Istrat
	mapobj	200,-200,0000,1000,nullshape,torpedo_Istrat
	mapobj	200,0200,0000,1000,nullshape,torpedo_Istrat
	mapobj	200,-200,0000,1000,nullshape,torpedo_Istrat
	mapobj	3000,0200,0000,1000,nullshape,torpedo_Istrat

	mapobj	3000,0000,0000,400,sea_0_0,seamon_Istrat

	mapobj	0050,0000,0000,3000-2000,sea_0_0,seamon_Istrat
	mapobj	0000,-100,0000,3100-2000,sea_0_0,seamon_Istrat
	mapobj	0050,0100,0000,3100-2000,sea_0_0,seamon_Istrat
	mapobj	0000,-200,0000,3200-2000,sea_0_0,seamon_Istrat
	mapobj	0050,0200,0000,3200-2000,sea_0_0,seamon_Istrat
	mapobj	0000,-300,0000,3300-2000,sea_0_0,seamon_Istrat
	mapobj	8000,0300,0000,3300-2000,sea_0_0,seamon_Istrat

	mapobj	500,-200,0000,1000,nullshape,torpedo_Istrat
	mapobj	500,0200,0000,1000,nullshape,torpedo_Istrat

	mapobj	2000,0150,0000,1000,saucer,saucer_istrat
	mapobj	1200,0000,0000,0100,saucer,saucer_istrat
	mapobj	7000,-150,0000,0100,saucer,saucer_istrat

	mapobj	500,-200,0000,1000,nullshape,torpedo_Istrat
	mapobj	500,0200,0000,1000,nullshape,torpedo_Istrat


	mapobj	0300,-300,0000,3000-2000,sea_0_0,seamon_Istrat
	mapobj	0250,-200,0000,3000-2000,sea_0_0,seamon_Istrat
	mapobj	0200,-100,0000,3000-2000,sea_0_0,seamon_Istrat
	mapobj	0150,0000,0000,3000-2000,sea_0_0,seamon_Istrat
	mapobj	0100,0100,0000,3000-2000,sea_0_0,seamon_Istrat
	mapobj	0050,0200,0000,3000-2000,sea_0_0,seamon_Istrat
	mapobj	8000,0300,0000,3000-2000,sea_0_0,seamon_Istrat

	mapobj	0300,0300,0000,3000-2000,sea_0_0,seamon_Istrat
	mapobj	0250,0200,0000,3000-2000,sea_0_0,seamon_Istrat
	mapobj	0200,0100,0000,3000-2000,sea_0_0,seamon_Istrat
	mapobj	0150,0000,0000,3000-2000,sea_0_0,seamon_Istrat
	mapobj	0100,-100,0000,3000-2000,sea_0_0,seamon_Istrat
	mapobj	0050,-200,0000,3000-2000,sea_0_0,seamon_Istrat
	mapobj	8000,-300,0000,3000-2000,sea_0_0,seamon_Istrat
	ENDC

	mapwait	1000
	mapif	chkeasteregg2,.nochange
	mapjsr	level4_3
.nochange
	start_65816
	stz	twoplayer
	lda	#0
	sta.l	m_damagetwo
	lda	#5
	sta	specialobjtotal
	lda	#5
	sta	specials_dead
	stz	speccnttwo
	end_65816

	mapjsr	cl_bridge
	mapend