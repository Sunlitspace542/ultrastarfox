; 1-1 Corneria 1 Part B
map1_1b

	INCMAP	<1-1>

.boss
	fadeoutbgm
	IFNE	MSU1
	mapmsufade
	mapwait	2000
	ENDC
	setbgm	bgm_boss1
	IFNE	MSU1
	mapmsuplay	boss1_1,repeat
	ENDC

; boss 7 test
	mapobj	0000,0000,-70<<boss7_scale,-200,boss_7_1,boss7_Istrat
	mapwaitboss
	markboss	boss11

	maprts



