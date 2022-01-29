map2_3b
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

;	mapwait	2000
	maprts




