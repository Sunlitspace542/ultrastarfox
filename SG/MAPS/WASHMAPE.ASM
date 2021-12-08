
; giant washing machine map test. (NOT recomended by Persil)


rotsize	=	deg45
rotnum	=	deg360/rotsize
prot	=	0


map_b8beamT	MACRO
	mapobj	0000,0000,(-75<<boss8_scale)+nucleusheight,boss8_circ,boss_8_5,nucleusbeamL_Istrat
	setalvar	sbyte2,\1
		ENDM

map_b8beamB	MACRO
	mapobj	0000,0000,(-35<<boss8_scale)+nucleusheight,boss8_circ,boss_8_5,nucleusbeamL_Istrat
	setalvar	sbyte2,\1
		ENDM
	

	setbgm	6

	start_65816
	lda	#1
	sta	bossmode
	stz	superspeeddelay
	lda	#0
	sta	hudrot+1
	end_65816

	mapwait	700
	start_65816
	lda	bgmspeed
	beq	.nochange4
	cmp	#1
	beq	.slow4
	cmp	#2
	beq	.fast4
.slow4
	startbgm	$f4
	bra	.nochange4
.fast4
	startbgm	$f5
.nochange4
	end_65816
	mapobj	0000,0000,(-50<<boss8_scale)+nucleusheight,210<<boss8_scale,boss_8_0,boss8_Istrat

;	map_b8beamT	deg45+deg22
;	map_b8beamT	-(deg45+deg22)
;	map_b8beamB	deg180+deg22



	mapobj	0000,0000,(-50<<boss8_scale)+nucleusheight,boss8_circ,hou_4,nucleuslauncher_Istrat
	setalvar	sbyte2,deg90+deg22

	mapobj	0000,0000,(-50<<boss8_scale)+nucleusheight,boss8_circ,hou_4,nucleuslauncher_Istrat
	setalvar	sbyte2,deg135+deg22

	mapobj	0000,0000,(-50<<boss8_scale)+nucleusheight,boss8_circ,hou_4,nucleuslauncher_Istrat
	setalvar	sbyte2,deg270-deg22

	mapobj	0000,0000,(-50<<boss8_scale)+nucleusheight,boss8_circ,hou_4,nucleuslauncher_Istrat
	setalvar	sbyte2,-deg22


	REPT	rotnum
	mapobj	0000,0000,0000+nucleusheight,boss8_circ,boss_8_4,nucleuspillar_Istrat
	setalvar	sbyte2,rotsize*prot
prot	=	prot+1
	ENDR



;	maptexitwait	-300
;	initbg


.loop	mapif	chkstagedone,.cont
	mapgoto	.loop

.cont
	start_65816
	lda	#0
	sta.l	m_bossmaxHP
	stz	bossmode
	end_65816
 

;-------------------------------------------------
; TEST	
;.waitrqwewd
;	mapwait	1000
;	mapgoto	.waitrqwewd
;-------------------------------------------------	


	mapwait	1000

	setbgm	$f1

	mapif	chkeasteregg2,.hello
	mapgoto	.nohello
.hello
	start_65816
	stz	superspeeddelay
	lda	#0
	sta	hudrot+1
	end_65816
	mapplayermode	EscapeNucleus
.nohello
	mapwait	4360	; 4160

;	start_65816
;	trigse		$1d
;	end_65816
;	mapcode_jsl	bigwhiteFOsprite_l

	mapcode_jsl	clearrealobjmap_l
	mapwait		medpspeed


