
	mapobj	0000,-100,-500,0000,boss_f_4,airship_istrat

	mapwaitboss
	markboss	boss37
	start_65816
	lda	#1
	sta.l	m_meters
	end_65816
	maprts

