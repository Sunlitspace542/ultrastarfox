level4_1
	start_65816
	lda	playertwoactivated
	cmp	#0
	beq	.nop2
	lda	#40
	sta	playertwoready
.nop2
	end_65816
	mapcode_jsl	initblack_l
	mapwait	1

	meters_on	trans

	setvar	keeppstrat,1
	setbg	1_1c
	initbg
	wipein	mscramwipe_circle
	mapwait	medpspeed*2
	setfadeup	quick

	mapplayermode   ExitBase
	mapobj		0000,0008,0000,0000,mybase_1,nocoll_Istrat	
	mapobj		0000,0000,0000,0000,mybase_0,nocoll_Istrat	
	mapobj		0000,-27<<mybase_scale,-39<<mybase_scale,-200,myship_4,friendexitbase_Istrat
	setalvar	sbyte1,17
	mapobj		0000,-27<<mybase_scale,-39<<mybase_scale,-200,myship_4,friendexitbase_Istrat
	setalvar	sbyte1,17+(1000/pexitbasespeed)

;	pathobj	0000,3000,3000,3000,nullshape,matemsg,10,10

	mapobj	0000,-600,0000,2000,BU_1,HARD180YR_ISTRAT
	mapobj	0000,0600,0000,2000,BU_1,HARD180YR_ISTRAT

	mapobj	0000,-700,0000,3500,BU_1,HARD180YR_ISTRAT
	mapobj	0000,0700,0000,3500,BU_1,HARD180YR_ISTRAT

	mapobj	0000,-900,0000,5000,bu_1,hard180yr_ISTRAT
	mapobj	2000,0900,0000,5000,bu_1,hard180yr_ISTRAT

	mapobj	0000,-1100,0000,4800,bu_1,hard180yr_ISTRAT
	mapobj	0000,01100,0000,4800,bu_1,hard180yr_ISTRAT
;	mapobj	0000,-500,0000,5000,HOUDAI_0,houdains_ISTRAT
;	mapobj	2000,0500,0000,5000,HOUDAI_0,houdains_ISTRAT

;	cspecial	0000,-500,-800,0000,zaco_5,zaco1l_istrat
;	cspecial	0000,-500,-300,0000,zaco_5,zaco1l_istrat
	mapobj	0000,-1200,0000,4800,bu_1,hard180yr_ISTRAT
	mapobj	2000,01200,0000,4800,bu_1,hard180yr_ISTRAT

;	cspecial	0000,0500,-300,0000,zaco_5,zaco1r_istrat

	mapobj	0000,-1200,0000,4800,bu_1,hard180yr_ISTRAT
	mapobj	0000,01200,0000,4800,bu_1,hard180yr_ISTRAT
;	mapobj	0000,-600,0000,5000,HOUDAI_0,houdains_ISTRAT
;	mapobj	0000,0600,0000,5000,HOUDAI_0,houdai_ISTRAT


;	mapwait		4000

	setrestart	
	mapplayermode	onplanet
	mapjsr	map4_1
	setbg	1_1c
	initbg
	markboss	boss13
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
