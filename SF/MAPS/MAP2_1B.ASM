; 1-2 Corneria 2 Part B
map2_1b
	incmap	2-1

	fadeoutbgm
	IFNE	MSU1
	mapmsufade
	mapwait	2000
	ENDC
	setbgm	bgm_boss1
	mapobj	0000,0000,-70<<boss7_scale,-200,boss_7_1,boss7_Istrat
	IFNE	MSU1
	mapmsuplay	boss1_1,repeat
	ENDC

 	mapwaitboss
	markboss	boss21


	maprts


