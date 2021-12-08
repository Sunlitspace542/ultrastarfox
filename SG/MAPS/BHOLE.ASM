


blackholemap
	mapwait	1000
	start_65816
	lda	bgmspeed
	beq	.nochange3
	cmp	#1
	beq	.slow3
	cmp	#2
	beq	.fast3
.slow3
	startbgm	$f4
	bra	.nochange3
.fast3
	startbgm	$f5
.nochange3
	end_65816
	mapwait	1000

	mapmother	08000,0000,0,5000,mother1,mother1_istrat,map_bhole
	maprem		mother1
	mapobj	1000,000,00,5000,nullshape,up1man_Istrat
.bhole
	mapmother	04000,0000,0,5000,mother1,mother1_istrat,map_bhole
	cspecial	4000,0000,0000,4500,zaco_0,shou0a_istrat
	maprem		mother1
 	mapobj	0200,000,000,4000,iris,iris_ISTRAT
 	mapobj	0000,000,000,4000,item_7,item7_ISTRAT
	setalvar	sbyte1,1
	mapmother	04000,0000,0,5000,mother1,mother1_istrat,map_bhole
	maprem		mother1
;exitgate2_4
	mapobj	0000,0100,0000,5400,gate_0,bholeexit2_ISTRAT
	pathobj	4500,3000,3000,1000,nullshape,e_gate,10,10
	mapmother	04000,0000,0,4000,mother1,mother1_istrat,map_bhole
	special	1000,0000,0000,4500,para_0,shou0a_istrat
	maprem		mother1
	mapmother	02000,0000,0,5000,mother1,mother1_istrat,map_bhole
	maprem		mother1
 	mapobj	0200,000,000,4000,iris,iris_ISTRAT
 	mapobj	0000,000,000,4000,item_5,item5_ISTRAT
	setalvar	sbyte1,1
	mapmother	04000,0000,0,5000,mother1,mother1_istrat,map_bhole
	maprem		mother1
;exitgate3_4
	mapobj	0000,-0200,-100,5400,gate_0,bholeexit3_ISTRAT
	pathobj	4500,3000,3000,1000,nullshape,e_gate,10,10
	mapmother	04000,0000,0,4000,mother1,mother1_istrat,map_bhole
	special	3000,0000,0000,4500,shieldr,shou0a_istrat
	maprem		mother1
 	mapobj	0200,000,000,4000,iris,iris_ISTRAT
 	mapobj	0000,000,000,4000,item_5,item5_ISTRAT
	setalvar	sbyte1,1
	mapmother	04000,0000,0,5000,mother1,mother1_istrat,map_bhole
	maprem		mother1
;exitgate1_5
	mapobj	0000,0200,0100,5400,gate_0,bholeexit1_ISTRAT
	pathobj	4500,3000,3000,1000,nullshape,e_gate,10,10
	mapgoto	.bhole
	maprts


