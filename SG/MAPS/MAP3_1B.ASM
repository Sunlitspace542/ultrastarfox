map3_1b
	start_65816
	lda	playertwoactivated
	beq	.nop2xa
	lda	endurance
	beq	.nop2xa
	jsl	scenedone
	
.nop2xa
	end_65816
	incmap	3-1

	fileslog	maps\c3-1.asm

	fadeoutbgm
	setbgm	bgm_boss1

;	mapobj	0000,0000,-70<<boss7_scale,-200,boss_7_1,boss7_Istrat
; 	mapwaitboss
;	markboss	boss31
;----------------------------------------

; boss A test
	mapif	chkeasteregg2,.hello40
	mapobj	0000,0000,-1000,4000,boss_b_1,bossBrob_Istrat
	mapgoto	.hello50
.hello40
	mapobj	0000,3000,0000,375<<bossa_scale,boss_A_2,bossA_Istrat
.hello50
	mapwaitboss
	markboss	boss31
	mapif	chkeasteregg2,.hello
	setfadedown	quick
	mapwaitfade

	setbg	2_2
	initbg
	setfadeup	quick
	mapplayermode	inspace
	mapif	chkeasteregg2,.nothx
	start_65816
	lda	superspeeddelay
	cmp	#ktest
	bne	.noneed
	jsl	changeviewmode_l
.noneed
	end_65816
.nothx
	setrestart
;gate
	mapobj	2000,0000,-100,5000,gate_0,gate_ISTRAT
	pathobj	4000,3000,3000,1000,nullshape,e_gate,10,10
	mapjsr	map2_2
.hello
	maprts

