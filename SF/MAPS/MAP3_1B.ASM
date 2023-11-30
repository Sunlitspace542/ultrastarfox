map3_1b
	incmap	3-1

	fileslog	maps\c3-1.asm

	fadeoutbgm
	setbgm	bgm_boss1
	IFNE	msu
	msuplay $FF,_147_cornboss,audiostate_repeat
	ENDC

; boss A test
	mapobj	0000,3000,0000,375<<bossa_scale,boss_A_2,bossA_Istrat

	mapwaitboss
	markboss	boss31
	maprts

