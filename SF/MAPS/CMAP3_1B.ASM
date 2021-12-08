map3_1b
	incmap	c3-1

	fileslog	maps\3-1.asm

	fadeoutbgm
	setbgm	bgm_boss1

;	mapobj	0000,0000,-70<<boss7_scale,-200,boss_7_1,boss7_Istrat
; 	mapwaitboss
;	markboss	boss31
;----------------------------------------

; boss A test
	mapobj	0000,3000,0000,375<<bossa_scale,boss_A_2,bossA_Istrat

	mapwaitboss
	markboss	boss31
	maprts

