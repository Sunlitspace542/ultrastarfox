level4_4
	mapif	chkeasteregg2,.nochange
	setfadedown	quick
	mapwaitfade
	setbg	3_5
	initbg
	setfadeup	quick
	setrestart
	mapgoto	.changed
.nochange
	initlevel	3_5,mscramwipe_circle
.changed
	mapjsr	map4_4

	setbg	3_5
	initbg
	setrestart
	mapwait	3000
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

	mapjsr	cl_under
	mapend





