	start_65816
	lda	bgmspeed
	beq	.nochange2
	cmp	#1
	beq	.slow2
	cmp	#2
	beq	.fast2
.slow2
	startbgm	$f4
	bra	.nochange2
.fast2
	startbgm	$f5
.nochange2
	end_65816
	mapobj	0000,0000,0000,airlock_pos,k_door,kdoor_istrat
airlock_pos	=	airlock_pos+kichi2_len/2
	mapobj	0000,0000,0000,airlock_pos,kichi_3,kichi2_istrat
airlock_pos	=	airlock_pos+kichi2_len
	mapobj	0000,0000,0000,airlock_pos,kichi_3,kichi2_istrat
airlock_pos	=	airlock_pos+kichi2_len
	mapobj	0000,0000,0000,airlock_pos,kichi_3,kichi2_istrat
airlock_pos	=	airlock_pos+kichi2_len
	mapobj	0000,0000,0000,airlock_pos,kichi_3,kichi2_istrat
airlock_pos	=	airlock_pos+kichi2_len/2
	mapobj	0000,0000,0000,airlock_pos,k_door,kdoor2_istrat
	mapwait	airlock_pos-kichi2_len*2

