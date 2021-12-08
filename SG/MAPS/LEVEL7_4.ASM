level7_4
	start_65816
	lda	playertwoactivated
	cmp	#0
	beq	.anop2
	lda	#40
	sta	playertwoready
.anop2
	end_65816

	initlevel	7_4,mscramwipe_circle

	setrestart
	
	mapwait	2000
	mapwait	2000

	mapobj	0000,0000,-100,600,pointyanim,skyboss_istrat

	
.loo	mapwait	1000
	mapgoto	.loo


	mapend
