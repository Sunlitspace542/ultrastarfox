level6_5
	start_65816
	lda	playertwoactivated
	cmp	#0
	beq	.anop2
	lda	#40
	sta	playertwoready
.anop2
	end_65816

	initlevel	6_5,mscramwipe_circle

	setrestart
	
	mapwait	200



	
.loo	mapwait	1000
	mapgoto	.loo


	mapend
