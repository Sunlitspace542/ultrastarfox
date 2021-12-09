
	mapobj	1000,-400,-60,1000,air_1,madbiker_istrat
	mapobj	1000,-300,-60,0300,air_1,madbiker_istrat
.mad	mapobj	1000,-050,-060,4000,WALL_4,HARD180yr_ISTRAT
	mapobj	1000,-200,-060,4000,bou_1b,HARD180yr_ISTRAT
	maploop	.mad,06	

	mapobj	0000,-50,-60,-200,air_1,madbiker_istrat
	mapobj	0100,50,-10,-400,air_1,madbiker_istrat

.loop

	start_65816
	ldy	#air_1
	jsl	find_y_l
	cpy	dummyobj
	bne	.still_bikers
	switch	.carryon
.still_bikers
	end_65816

	mapwait	100
	mapgoto	.loop
.carryon
	fadeoutbgm
	setbgm	5
	start_65816
	trigse	$0b
	end_65816
	mapwait	3000
	mapobj	0000,-200,-70,-300,boss_9_5,madtrucker_istrat
	mapwait	1
.loop2
	start_65816
	lda	maptrigger
	stz	maptrigger
	bit	#1
	beq	.norightblock
	switch	.rightblockbit
.norightblock
	bit	#2
	beq	.notdead
	switch	.continue
.notdead
	end_65816

	
	mapwait	500
	mapgoto	.loop2
.rightblockbit
	mapjsr	.rightblock
	mapgoto	.loop2
	


.rightblock
	mapobj	0000,60,0,1600,line_2,roadline_istrat
	mapobj	0000,40,0,2400,line_2,roadline_istrat
	mapobj	0000,20,0,3100,line_2,roadline_istrat
	mapobj	0000,00,0,3400,line_2,roadline_istrat
	mapobj	0000,90,-60,3600,bou_1b,hard180YR_istrat
	maprts


.continue
	
	mapplayercantdie	
	start_65816
	lda	#0
	sta.l	m_bossmaxHP
	end_65816
	setbgm	$f1



