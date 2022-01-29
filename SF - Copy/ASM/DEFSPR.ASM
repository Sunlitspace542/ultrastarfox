
sprbank	macro
	defs	$1,"\1"
cpa	=	0
	endm

cps	=	0

defspr	macro
\1_spr	=	cps
	dw	(\$1+((cpa&7)*32)+(256*32*((cpa&31)/8)))&$ffff
	db	(\$1+((cpa&7)*32)+(256*32*((cpa&31)/8)))>>16
cps	=	cps+1
cpa	=	cpa+1
	endm

defspr_hi	macro
\1_spr	=	cps!(1<<13)
	dw	(\$1+((cpa&7)*32)+(256*32*((cpa&31)/8)))&$ffff
	db	(\$1+((cpa&7)*32)+(256*32*((cpa&31)/8)))>>16
cps	=	cps+1
cpa	=	cpa+1
	endm


defsprabs	macro	[name,x,y]
{name}_spr	=	cps
	dw	(\$1+(({x})*8)+(256*8*({y})))&$ffff
	db	(\$1+(({x})*8)+(256*8*({y})))>>16
cps	=	cps+1
	endm

defsprabs_hi	macro	[name,x,y]
{name}_spr	=	cps!(1<<13)
	dw	(\$1+(({x})*8)+(256*8*({y})))&$ffff
	db	(\$1+(({x})*8)+(256*8*({y})))>>16
cps	=	cps+1
	endm

defsprdoub	macro
\1_spr	=	cps
	dw	(\$1+((cpa&7)*32)+(256*32*((cpa&31)/8)))&$ffff
	db	(\$1+((cpa&7)*32)+(256*32*((cpa&31)/8)))>>16
cps	=	cps+1
cpa	=	cpa+2
	endm

defspr64	macro
\1_spr	=	cps
	dw	(\$1+((cpa&3)*64)+(256*64*((cpa&15)/4)))&$ffff
	db	(\$1+((cpa&3)*64)+(256*64*((cpa&15)/4)))>>16
cpa	=	cpa+1
cps	=	cps+1
	endm

defspr64_hi	macro
\1_spr	=	cps!(1<<13)
	dw	(\$1+((cpa&3)*64)+(256*64*((cpa&15)/4)))&$ffff
	db	(\$1+((cpa&3)*64)+(256*64*((cpa&15)/4)))>>16
cpa	=	cpa+1
cps	=	cps+1
	endm

defsprdoub_hi	macro
\1_spr	=	cps!(1<<13)
	dw	(\$1+((cpa&7)*32)+(256*32*((cpa&31)/8)))&$ffff
	db	(\$1+((cpa&7)*32)+(256*32*((cpa&31)/8)))>>16
cps	=	cps+1
cpa	=	cpa+2
	endm


textureaddrtab
	sprbank	msprites1
	defspr	ironball
	defspr	cockpit1
	defspr	cockpit2
	defspr	asteroid3
	defspr	tunnelwall
	defspr	scrapmetal
	defspr	chicken
	defspr	space3

	defspr	expl9
	defspr	expl10
	defspr	spark1
	defspr	spark2
	defspr	starwars1
	defspr	starwars2
	defspr	starwars3
	defspr	spark3

	defspr	plasma1
	defspr	plasma2
	defspr	laserfire1
	defspr	laserfire2
	defspr	space4
	defspr	fireball1
	defspr	fireball2
	defspr	fireball3

	defspr	ricecrispies1
	defspr	specialweapon1
	defspr	specialweapon2
	defspr	asteroid1
	defspr	specialweapon3
	defspr	ring1
	defspr	ring2
	defspr	asteroid2

	defspr_hi	splash1
	defspr_hi	splash2
	defspr_hi	splash3
	defspr_hi	splash4
	defspr_hi	splash5
	defspr_hi	splash6
	defsprdoub_hi	bigandross

	defspr_hi	rock1
	defspr_hi	panel3
	defspr_hi	ball
	defspr_hi	egg
	defspr_hi	rock2
	defspr_hi	face1
	defsprdoub_hi	nowt
;	defspr_hi	biker1
;	defspr_hi	rock3

	defspr_hi	bigmeteo
	defspr_hi	space1
	defspr_hi	space2
	defspr_hi	cluster
	defspr_hi	blackhole
	defspr_hi	bigships

	defsprdoub_hi	planetc
	defsprdoub_hi	playerplanet
	defsprdoub_hi	planeta
	defsprdoub_hi	planetb
	defsprdoub_hi	enemyplanet

	sprbank	msprites2

	defspr64	largeexpl1
	defspr64	largeexpl2
	defspr64	largeexpl3
	defspr64	largeexpl4
	defspr64	largeexpl5
	defspr64	largeexpl6
	defspr64	largeexpl7
	defspr64	largeexpl8

	defsprabs_hi	smoke1,0,0
	defsprabs_hi	smoke2,4,0
	defsprabs_hi	smoke3,8,0
	defsprabs_hi	smoke4,12,0
	defsprabs_hi	smoke5,16,0
	defsprabs_hi	smoke6,20,0

	defsprabs_hi	oval1,24,0
	defsprabs_hi	oval2,28,0
	defsprabs_hi	oval3,0,4

	defsprabs_hi	boost1,4,4
	defsprabs_hi	boost2,28,4
	
	defsprabs_hi	amoeba1,16,8
	defsprabs_hi	amoeba2,20,8
	defsprabs_hi	amoeba3,24,8
	defsprabs_hi	amoeba4,28,8	; 16x16 texturemaps

	defsprabs_hi	largeblackhole,8,4

	defsprabs_hi	byebye,16,12

	defsprabs_hi	fruitmachine,16,14

	defsprabs_hi	largeasteroid,0,8

	defsprabs_hi	game,8,12
	defsprabs_hi	over,8,14

	defsprabs_hi	monkey1,16,4
	defsprabs_hi	monkey2,20,4
	defsprabs_hi	monkey3,24,4

	defsprabs_hi	hub,4,4
	defsprabs_hi	hub,6,4

	defsprabs_hi	biker1,16,4
	defsprabs_hi	rock3,20,4

	defsprabs_hi	hold,20,13
	defsprabs_hi	jackpot,24,13

	defsprabs_hi	escapee,24,4

;;;;;;;;;;;;;;;;;;;;;;;;;;; obsolete:
;	defspr	expl1
;	defspr	expl2
;	defspr	expl3
;	defspr	expl4
;	defspr	expl5
;	defspr	expl6
;	defspr	expl7
;	defspr	expl8
;	defspr	expl9
;	defspr	expl10
;
;	defspr	spark1
;	defspr	spark2
;	defspr	starwars1
;	defspr	starwars2
;	defspr	starwars3
;	defspr	spark3
;
;	defspr	plasma1
;	defspr	plasma2
;
;	defspr	smoke5
;	defspr	smoke6
;	defspr	smoke1
;	defspr	smoke2
;	defspr	smoke3
;	defspr	smoke4
;
;	defspr	ricecrispies1
;
;	defspr	specialweapon1
;	defspr	specialweapon2
;	defspr	asteroid1
;	defspr	specialweapon3
;	defspr	ring1
;	defspr	ring2
;	defspr	asteroid2
;
;	defspr_hi	splash1
;	defspr_hi	splash2
;	defspr_hi	splash3
;	defspr_hi	splash4
;	defspr_hi	splash5
;	defspr_hi	splash6
;
;	defspr_hi	fire1
;	defspr_hi	panel1
;	defspr_hi	panel2
;	defspr_hi	panel3
;
;	defspr_hi	ball
;	defspr_hi	egg
;	defspr_hi	crater
;	defspr_hi	face1
;	defspr_hi	biker1
;	defspr_hi	biker2
;
;	defspr_hi	bigmeteo
;	defspr_hi	space1
;	defspr_hi	asteroidfield
;	defspr_hi	cluster
;	defspr_hi	blackhole
;	defspr_hi	bigships
;
;	defsprdoub_hi	planetc
;	defsprdoub_hi	playerplanet
;	defsprdoub_hi	planeta
;	defsprdoub_hi	planetb
;	defsprdoub_hi	enemyplanet
;
;	sprbank	msprites2
;
;	defspr	ironball
;	defspr	cockpit1
;	defspr	cockpit2
;	defspr	cockpit3
;	defspr	tunnelwall
;	defspr	tunnelpillar
;	defspr	space2
;	defspr	space3
;	defspr	space4
;	defspr	space5
;	defspr	space6
;	defspr	chicken
;	defspr	fireball1
;	defspr	fireball2
;	defspr	fireball3
;	defspr	amoeba1
;	defspr	amoeba2
;	defspr	amoeba3
;	defspr	unused1
;	defspr	unused2
;	defspr	unused3
;	defspr	unused4
;	defspr	unused5
;	defspr	unused6
;	defspr	unused7
;	defspr	unused8
;	defspr	unused9
;	defspr	unused10
;	defspr	unused11
;	defspr	unused12
;	defspr	unused13
;	defspr	unused14
;
;	defspr64_hi	largeexpl1
;	defspr64_hi	largeexpl2
;	defspr64_hi	largeexpl3
;	defspr64_hi	largeexpl4
;	defspr64_hi	largeexpl5
;	defspr64_hi	largeexpl6
;	defspr64_hi	largeexpl7
;	defspr64_hi	largeexpl8

	sprbank	msprites3

	defsprabs	scrollee,0,0

	sprbank	msprites3

	defsprabs_hi	nintendo,0,0


texturexytab
	dw	texturexy0&WM
	dw	texturexy1&WM
	dw	texturexy2&WM
	dw	texturexy3&WM
	dw	texturexy4&WM
	dw	texturexy5&WM
	dw	texturexy6&WM
	dw	texturexy7&WM
	dw	texturexy8&WM


texturexy0
	dw	$1f1f
	db	0,0
	db	31,0
	db	31,31
	db	0,31
;	db	0,30
;	db	0,25
;	db	0,20
;	db	0,15
;	db	0,10
;	db	0,5

texturexy1
	dw	$3f3f
	db	63,0
	db	0,0
	db	0,63
	db	63,63

texturexy2
	db	127,15
	db	0,0
	db	0,15
	db	15,15
	db	15,0

texturexy3
	dw	$1f1f
	db	0,0
	db	127,0
	db	127,31
	db	0,31

texturexy4
	dw	$f3f
	db	0,0
	db	63,0
	db	63,15
	db	0,15

texturexy5
	dw	$f3f
	db	63,0
	db	0,0
	db	0,15
	db	63,15

texturexy6
	dw	$3f3f
	db	0,0
	db	63,0
	db	63,63
	db	0,63

texturexy7
	dw	$077f
	db	31,0
	db	0,0
	db	0,7
	db	31,7

texturexy8	dw	$1f1f
	db	31,0
	db	0,0
	db	0,31
	db	31,31



