
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

	mapwait	300
	mapobj	0000,0000,(-50<<boss8_scale)+nucleusheight,210<<boss8_scale,boss_8_0,boss8_Istrat

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



	maptexitwait	-300
	initbg


.loop	mapif	chkstagedone,.cont
	mapgoto	.loop

.cont
 

	start_65816
	lda	#0
	sta.l	m_bossmaxHP
	IFEQ	shieldboostcolorbox
	sta.l	m_meters
	ENDC
	end_65816

	mapwait	1000
	
	setbgm	$f1

	mapplayermode	EscapeNucleus

	mapwait	4360	4160

	mapcode_jsl	clearrealobjmap_l
	mapwait		medpspeed


