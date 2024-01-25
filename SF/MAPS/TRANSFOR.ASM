
; Transformer/Great Commander II (Venom 3 Surface)
	mapobj	0000,-100,-500,0000,boss_f_4,airship_istrat

	mapwaitboss
	markboss	boss37
	start_65816
	IFEQ	shieldboostcolorbox
	lda	#1
	sta.l	m_meters
	ENDC
	end_65816
	maprts

