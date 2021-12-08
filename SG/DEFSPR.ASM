
sprbank	macro
	defs	$1,"\1"
cpa	=	0
	endm

cps	=	0


BIT_SHIFT	=	11


defspr	macro
\1_spr	=	cps
	dw	(\$1+((cpa&7)*32)+(256*32*((cpa&31)/8)))&$ffff
	db	(\$1+((cpa&7)*32)+(256*32*((cpa&31)/8)))>>16
cps	=	cps+1
cpa	=	cpa+1
	endm

defspr_hi	macro
\1_spr	=	cps+(1<<BIT_SHIFT)
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
{name}_spr	=	cps+(1<<BIT_SHIFT)
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
\1_spr	=	cps+(1<<BIT_SHIFT)
	dw	(\$1+((cpa&3)*64)+(256*64*((cpa&15)/4)))&$ffff
	db	(\$1+((cpa&3)*64)+(256*64*((cpa&15)/4)))>>16
cpa	=	cpa+1
cps	=	cps+1
	endm

defsprdoub_hi	macro
\1_spr	=	cps+(1<<BIT_SHIFT)
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
	defspr	asteroid2		;30


	defsprdoub_hi	test2
	defsprdoub_hi	test3
	
	defsprdoub_hi	test1
	defsprdoub_hi	bigandross

	defsprdoub_hi	fplanet
	defsprdoub_hi	bplanet
	defsprdoub_hi	cplanet1

cpa	=	cpa+2
;	defsprdoub_hi	nowt
;	defspr_hi	biker1
;	defspr_hi	rock3


	defsprdoub_hi	lplanet
	defsprdoub_hi	cplanet2

	defsprdoub_hi	planetg
	defsprdoub_hi	planetc
	defsprdoub_hi	playerplanet
	defsprdoub_hi	planeta
	defsprdoub_hi	planetb
	defsprdoub_hi	enemyplanet	;45

	sprbank	msprites2

	defspr64	largeexpl1
	defspr64	largeexpl2
	defspr64	largeexpl3
	defspr64	largeexpl4
	defspr64	largeexpl5
	defspr64	largeexpl6
	defspr64	largeexpl7
	defspr64	largeexpl8
	

;3 more open	

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

	defsprabs_hi	biker1,16,4
	defsprabs_hi	rock3,20,4

;	defsprabs_hi	hold,20,13
;	defsprabs_hi	jackpot,24,13

	defsprabs_hi	escapee,24,4


	sprbank	msprites3
	defspr	rock1
	defspr	panel3
	defspr	box1	
	defspr	box2
	defspr	box3
	defspr	ball
	defspr	egg
	defspr	tame1
	defspr	tame2
	defspr	tame3
	defspr	flame1
	defspr	flame2
	defspr	eye
	defspr	aasteroid
	defspr	rock2
	defspr	face1
	defspr	orb1
	defspr	orb2
	defspr	vortex1
	defspr	vortex2
	defspr	nan
	defspr	metroid1
	defspr	metroid2
	defspr	metroid3
	defspr	splash1
	defspr	splash2
	defspr	splash3
	defspr	splash4
	defspr	splash5
	defspr	splash6
	defspr	blueasteroid
	
	sprbank	msprites3
	defspr_hi	cluster	
	defspr_hi	blackhole
	defspr_hi	nasteroid
	defspr_hi	nstars
	defspr_hi	bigships
	defspr_hi	bigmeteo
	defspr_hi	space1
	defspr_hi	space2

	defspr_hi	norb1
	defspr_hi	norb2
	defspr_hi	norb3
	defspr_hi	norb4
	defspr_hi	lava2
	defspr_hi	lava3
	defspr_hi	lava4
	defspr_hi	skull1

	defspr_hi	skull2
	defspr_hi	tex1
	defspr_hi	tex2
	defspr_hi	tex3
	defspr_hi	bigeye
	defspr_hi	bigeye2
	defspr_hi	bigeye3
	defspr_hi	bigeye4

	sprbank	msprites5
	defspr	blueo1
	defspr	blueo2
	defspr	orangeo1
	defspr	orangeo2
	defspr	tex4
	defspr	tex5
	defspr	tex6
	defspr	tex7
	defspr	tex8
	defspr	blava1
	defspr	blava2
	defspr	blava3
	defspr	blava4
	defspr	firepit1
	defspr	firepit2
	defspr	firepit3
	defspr	blueeye
	defspr	orangeeye
	defspr	elemine1
	defspr	elemine2
	defspr	nf1
	defspr	nf2
	defspr	nf3
	defspr	nf4
	
	
	
	sprbank	msprites5
	defspr_hi	nsplash1
	defspr_hi	nsplash2
	defspr_hi	nsplash3
	defspr_hi	nsplash4
	defspr_hi	nsplash5
	defspr_hi	nsplash6
	defspr_hi	nsplash7
	defspr_hi	nsplash8
	defspr_hi	flasho1
	defspr_hi	flasho2
	defspr_hi	omine
	defspr_hi	bmine
	defspr_hi	elec1
	defspr_hi	elec2
	defspr_hi	elec3
	defspr_hi	elec4
	defspr_hi	elec5
	defspr_hi	elec6
	defspr_hi	fsplash1
	defspr_hi	fsplash2
	defspr_hi	fsplash3
	defspr_hi	fsplash4
	defspr_hi	fsplash5
	defspr_hi	fsplash6
	defspr_hi	fsplash7
	defspr_hi	fsplash8
	defspr_hi	starwolfteam

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
