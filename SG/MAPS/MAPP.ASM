mapp
	mapobj	0,0,-30,0,nullshape,player_Istrat
	setalvar.w	worldz,0

	start_65816
	lda	showcolbox
	beq	.normal
	bra	.showem
.normal
	end_65816
	mapobj	0,0,0,0,nullshape,pBody_Istrat
	setalvar.w	worldz,0
	mapobj	0,0,0,0,nullshape,pLWing_Istrat
	setalvar.w	worldz,0
	mapobj	0,0,0,0,nullshape,pRWing_Istrat
	setalvar.w	worldz,0
	mapgoto	.endit
.showem
	end_65816
	mapobj	0,0,0,0,pcolB,pBody_Istrat
	setalvar.w	worldz,0
	mapobj	0,0,0,0,pcolLW,pLWing_Istrat
	setalvar.w	worldz,0
	mapobj	0,0,0,0,pcolRW,pRWing_Istrat
	setalvar.w	worldz,0
.endit
	mapend
	


