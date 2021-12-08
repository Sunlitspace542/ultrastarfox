level4_3
	mapif	chkeasteregg2,.nochange
	setfadedown	quick
	mapwaitfade
	setbg	3_6
	initbg
	setfadeup	quick
	setrestart
	mapgoto	.changed
.nochange
	initlevel	3_6,mscramwipe_circle
.changed
	mapjsr	map4_3


;	mapwait	medpspeed*30
	mapwait	1000
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

	mapjsr	cl_ground
	mapend



