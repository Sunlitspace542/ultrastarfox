map2_3c
	start_65816
	lda	superspeeddelay
	cmp	#ktest
	bne	.noneed3
	jsl	changeviewmode_l
.noneed3
	lda	#1
	sta	nogodgun
	end_65816
	setrestart
	mapobj	0000,0000,-060,3000,boss_g_0,bossg_istrat
	start_65816
	trigse	$0b
	end_65816
	mapwait	1
	setbgm	5
	mapwait	5000
airlock_pos	=	4000
	incmap	airlock1

	maprts

