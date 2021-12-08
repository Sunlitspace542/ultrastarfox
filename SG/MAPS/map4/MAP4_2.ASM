map4_2

	mapobj	0000,-600,0000,2000,bro_2,rockhard_istrat ;  M      |         ;
	mapobj	1000,0500,0000,2000,bro_1,rockhard_istrat ;         |     S   ;
	mapobj	0000,-400,0000,2000,bro_4,rockhard_istrat ;   L     |         ;
	mapobj	1000,0550,0000,2000,bro_1,rockhard_istrat ;         |      S  ;

	mapobj	0000,-650,0000,2000,bro_0,rockhard_istrat ; S       6       S ;
	mapobj	0000,0650,0000,2000,bro_1,rockhard_istrat 

	mapwait	2000
	setbgm	bgm_boss1
boss1cov_strat
	mapobj	0000,-100,0000,4000,boss_d_1,chicken_istrat
	setalvar	roty,deg180
	mapwaitboss
	start_65816
	jsl	clearmap_l
	end_65816
	markboss	boss33
	setbg	2_3a
	initbg
	setrestart
	mapwait	1000
;gate
	mapobj	2000,0000,-100,5000,gate_0,gate_ISTRAT
	pathobj	4000,3000,3000,1000,nullshape,e_gate,10,10
	mapobj	5000,0000,-100,5000,item_7,item7_ISTRAT

	pathobj	0000,-300,0000,5000,nullshape,robotwithlog,6,4
	setalxvar.w	pword1,boss_7_0
	setalvar	roty,-deg22

	mapobj	0000,-100,-100,5000,item_5,item5_istrat
	mapobj	0000,-100,-100,5000,item_5,item5_istrat
	mapobj	0000,-100,-100,5000,item_5,item5_istrat

;carrier_robot
	pathobj	0000,-1000,0000,5000,nullshape,robotwithlog,6,4
	setalxvar.w	pword1,boss_7_3
	setalvar	roty,-deg45-deg22
	mapwait	1500

;carrier_robot
	pathobj	0000,-1400,0000,5000,nullshape,robotswithlog,6,4
	setalxvar.w	pword1,boss_7_3
	setalvar	roty,-deg45-deg22
	mapwait	3000
	setbgm	bgm_boss1
	mapobj	0000,2000,-600,1000,boss_h_0,bossh_istrat
	mapwaitboss
	start_65816
	jsl	clearmap_l
	end_65816
	markboss	boss14
	setbg	2_3a
	initbg
	setrestart
	mapwait 1500
;gate
	mapobj	2000,0000,-100,5000,gate_0,gate_ISTRAT
	pathobj	4000,3000,3000,1000,nullshape,e_gate,10,10
	mapobj	5000,0000,-100,5000,item_7,item7_ISTRAT
	SETVAR.N	FADEPAL,33
	setvar	palfrom,0
	setvar	palto,0
	setvar	pallen,32
	SETVAR.N	INFOG,0
	MAPCODE_JSL	BG_1_4B_1
	start_65816

	a8
	lda	#1
	sta	dotsflag
	stz	dotsflag+1

	lda	#0
	sta.l	m_planetstars
	sta.l	m_planetstars+1

	end_65816
	mapwait	1500
	pathobj	0000,-400,-300,0,my_bird,my_bird,10,10
	mapwait	3000
	maprts