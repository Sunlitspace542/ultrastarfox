level6_6
	start_65816
	lda	playertwoactivated
	cmp	#0
	beq	.anop2
	lda	#40
	sta	playertwoready
.anop2
	end_65816

	initlevel	5_5,mscramwipe_circle

	setrestart
	
	mapwait	1200
	
.pill
	mapobj	0000,-540,0,5000,pilar3,hardrandom_istrat
;	mapobj	0000,-360,0,5000,pilar3,hardrandom_istrat	
	mapobj	0000,-180,0,5000,pilar3,hardrandom_istrat	
	mapobj	0000,00,0,5000,pilar3,hardrandom_istrat
	mapobj	0000,180,0,5000,pilar3,hardrandom_istrat
	mapobj	0000,360,0,5000,pilar3,hardrandom_istrat
	mapobj	0000,540,0,5000,pilar3,hardrandom_istrat

	mapwait	1800

	mapobj	0000,-540,0,5000,pilar3,hardrandom_istrat
	mapobj	0000,-360,0,5000,pilar3,hardrandom_istrat	
	mapobj	0000,-180,0,5000,pilar3,hardrandom_istrat	
	mapobj	0000,00,0,5000,pilar3,hardrandom_istrat
	mapobj	0000,180,0,5000,pilar3,hardrandom_istrat
;	mapobj	0000,360,0,5000,pilar3,hardrandom_istrat
	mapobj	0000,540,0,5000,pilar3,hardrandom_istrat

	mapwait	1800

	mapobj	0000,-540,0,5000,pilar3,hardrandom_istrat
	mapobj	0000,-360,0,5000,pilar3,hardrandom_istrat	
;	mapobj	0000,-180,0,5000,pilar3,hardrandom_istrat	
	mapobj	0000,00,0,5000,pilar3,hardrandom_istrat
	mapobj	0000,180,0,5000,pilar3,hardrandom_istrat
	mapobj	0000,360,0,5000,pilar3,hardrandom_istrat
	mapobj	0000,540,0,5000,pilar3,hardrandom_istrat

	mapwait	1800

	mapobj	0000,-540,0,5000,pilar3,hardrandom_istrat
	mapobj	0000,-360,0,5000,pilar3,hardrandom_istrat	
	mapobj	0000,-180,0,5000,pilar3,hardrandom_istrat	
	mapobj	0000,00,0,5000,pilar3,hardrandom_istrat
	mapobj	0000,180,0,5000,pilar3,hardrandom_istrat
;	mapobj	0000,360,0,5000,pilar3,hardrandom_istrat
	mapobj	0000,540,0,5000,pilar3,hardrandom_istrat

	mapwait	1800

	mapobj	0000,-540,0,5000,pilar3,hardrandom_istrat
;	mapobj	0000,-360,0,5000,pilar3,hardrandom_istrat	
	mapobj	0000,-180,0,5000,pilar3,hardrandom_istrat	
	mapobj	0000,00,0,5000,pilar3,hardrandom_istrat
	mapobj	0000,180,0,5000,pilar3,hardrandom_istrat
	mapobj	0000,360,0,5000,pilar3,hardrandom_istrat
	mapobj	0000,540,0,5000,pilar3,hardrandom_istrat

	mapwait	1800

	mapobj	0000,-540,0,5000,pilar3,hardrandom_istrat
	mapobj	0000,-360,0,5000,pilar3,hardrandom_istrat	
	mapobj	0000,-180,0,5000,pilar3,hardrandom_istrat	
	mapobj	0000,00,0,5000,pilar3,hardrandom_istrat
;	mapobj	0000,180,0,5000,pilar3,hardrandom_istrat
	mapobj	0000,360,0,5000,pilar3,hardrandom_istrat
	mapobj	0000,540,0,5000,pilar3,hardrandom_istrat
	
	mapwait	1800
	
	mapgoto	.pill
	
.loo	mapwait	1000
	mapgoto	.loo


	mapend
