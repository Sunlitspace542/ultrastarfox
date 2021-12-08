map2_1b
	start_65816
	lda	playertwoactivated
	beq	.nop2xa
	lda	endurance
	beq	.nop2xa
	jsl	scenedone
	
.nop2xa
	end_65816
	incmap	2-1
	fileslog	maps\c2-1.asm

	fadeoutbgm
	setbgm	bgm_boss1
	mapif	chkeasteregg2,.hello20
	mapobj	0000,3000,0000,375<<bossa_scale,boss_A_2,bossA_Istrat
	mapgoto	.hello30
.hello20
	mapobj	0000,0000,-70<<boss7_scale,-200,boss_7_1,boss7_Istrat
.hello30
 	mapwaitboss
	markboss	boss21
	mapif	chkeasteregg2,.hello
	setfadedown	quick
	mapwaitfade
	mapplayermode	onplanet
	mapif	chkeasteregg1,.finn
	setbg	3_1k
	mapgoto	.done
.finn
	setbg	3_1c
.done
	initbg
	setfadeup	quick
	setrestart
;gate
	mapobj	2000,0000,-100,5000,gate_0,gate_ISTRAT
	pathobj	4000,3000,3000,1000,nullshape,e_gate,10,10
	mapjsr	map3_1b
.hello
	maprts



































