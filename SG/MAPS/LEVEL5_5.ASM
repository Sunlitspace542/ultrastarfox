level5_5
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
	
	mapwait	200

	mapobj	1000,0000,0,600,rex_b,rex_Istrat
	mapwaitboss
	mapwait	500
	start_65816
	jsl	clearmap_l
	end_65816
	
	mapwait	2000
	
	mapjsr	cl_ground
	mapend
	
;.loo	mapwait	1000
;	mapgoto	.loo


	mapend
