;***************************************************************************
;*                              -----------                                *
;*                              StarGlider                                 *
;*                              -----------                                *
;*                                                                         *
;*                           SuperNES version.                             *
;*                                                                         *
;*                           Argonaut Software.      		      *	   
;*_________________________________________________________________________*
;*                                                                         *
;*   File: CONTINUE.ASM                                                    *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr: CONTINUE/CREDIT SCREEN    and pre-game menu                     *
;*_________________________________________________________________________*
;*                                                                         *
;*   Date: 26/6/92                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;* Author:   Dylan Cuthbert.                                               *
;*                                                                         *
;***************************************************************************


	INCPUBLICS	continue.ext

; shadow temp vars with unused existing zero page
foxy_option	equ	ocode1
foxy_frame	equ	ocode2
foxy_xa	equ	cla1
foxy_ya	equ	cla2
foxy_za	equ	clb1
foxy_foot	equ	clb2
foxy_ptr	equ	clac
foxy_shape	equ	clam
foxy_flag	equ	clbm


shapeslist
.start
	dw	.end-.start
	dw	a_wing
	dw	paltest1
	dw	paltest2
	dw	texttest1
	dw	gradius
	dw	etame
	dw	brokenbu
	dw	drwing
	dw	LUIGIHT
	dw	yellowbird
	dw	doge
	dw	YOSHIANM
	dw	tri
	dw	protecc
	dw	POINTYANIM
	dw	cobramk3
	dw	smallballz
	dw	ballz
	dw	bigballz
	dw	blueballz
	dw	fireballz	
	dw	lock_man
	dw	guard_0
	dw	rex_b
	dw	rex_b2
	dw	rex_b3
	dw	rex_f_l
	dw	rex_f_l2
	dw	rex_f_l3
	dw	rex_f_r
	dw	rex_f_r2
	dw	rex_f_r3

	dw	D_ASHI_L
	dw	D_ASHI_R
	dw	DODORA_R
	dw	DODORA_L
	dw	DODORA_0
	dw	DODORA_1
	dw	DODORA_2
	dw	DODORA_3

	dw	pilar3
	dw	PIERROT
	dw	SCORPION
	dw	EISEI_0
	dw	TOTEM_2
	dw	BIGFROG
	dw	SF2BLIMP
	dw	TAIGUN

	dw	crab

	dw	minispider
	dw	palmtree
	dw	mantis
	dw	bigfly
	dw	robosf2

	dw	TEKIKAN
	dw	quadcrab
	dw	cricket
	dw	flyingbug
	dw	hand_l
	dw	hand_r
	dw	LONGFACE
	dw	DRAGON_HEAD
	dw	LOG
	dw	HAPPYFACESHIP

	dw	ninja_1
	dw	spaceplane
	dw	boxxie
	dw	ehead

	dw	pinetree
	dw	tree

	dw	AIR_1
	dw	AMISSILE
	dw	andross
	dw	androsscube
	dw	androsscubee
	dw	androsshole
	dw	arch_0
	dw	ARM
;	dw	ASTEROID1
;	dw	ASTEROID2
;	dw	ASTEROID3
;	dw	ASTEROID4
;	dw	ASTEROIDB
	dw	b_holl
	dw	b_wing
	dw	BARRIER
	dw	BASE_0
	dw	BASE_0_0
	dw	BASE_0_1
	dw	base_1
	dw	BAZOOKA
	dw	BAZOOKA1
	dw	BAZOOKA2
	dw	bazz_1p
	dw	bazz_1q
	dw	BEEANIM
;	dw	BHYPER
	dw	big_bird
	dw	big_gate
	dw	BIG_M
	dw	big_meteor
	dw	blackhole
	dw	BLTUNNELFACE
	dw	BMTUNNELFACE
	dw	bmyship_4
	dw	bmyship_b
	dw	bmyship_l
	dw	bmyship_r
	dw	BOLL
	dw	BOM_WING
	dw	bonfireball
	dw	boostshape
	dw	BOSS_0_0
	dw	BOSS_0_0A
	dw	BOSS_0_1
	dw	BOSS_0_2
	dw	BOSS_0_3
	dw	BOSS_1_0
	dw	BOSS_1_1
	dw	BOSS_1_2
	dw	BOSS_2_0
	dw	BOSS_2_1
	dw	BOSS_2_2
	dw	BOSS_2_3
	dw	BOSS_2_4
	dw	BOSS_2_5
	dw	BOSS_2_6
	dw	BOSS_7_0
	dw	BOSS_7_1
	dw	BOSS_7_1O
	dw	BOSS_7_2
	dw	BOSS_7_3
	dw	BOSS_7_4
	dw	BOSS_8_0
	dw	BOSS_8_1
	dw	BOSS_8_1C
	dw	BOSS_8_4
	dw	BOSS_8_5
	dw	BOSS_9_0
	dw	boss_9_5
;	dw	BOSS_9_6
	dw	BOSS_A_1
	dw	BOSS_A_2
	dw	BOSS_A_3
	dw	BOSS_A_4
	dw	BOSS_A_5
	dw	BOSS_A_6
	dw	BOSS_B_0
	dw	BOSS_B_1
	dw	BOSS_B_6
	dw	BOSS_B_7
	dw	BOSS_B_H
	dw	BOSS_B_L
	dw	BOSS_B_R
	dw	BOSS_D_0
	dw	BOSS_D_1
	dw	BOSS_D_2
	dw	BOSS_D_4
	dw	BOSS_D_5
	dw	BOSS_D_6
	dw	BOSS_D_7
	dw	BOSS_D_8
	dw	BOSS_D_9
	dw	BOSS_D_A
	dw	BOSS_E_0
	dw	BOSS_E_1
	dw	BOSS_E_1A
	dw	BOSS_E_3
	dw	BOSS_E_4
	dw	BOSS_F_0
	dw	BOSS_F_1
;	dw	BOSS_F_1A
	dw	BOSS_F_2
	dw	BOSS_F_3
	dw	BOSS_F_4
	dw	BOSS_F_5
	dw	BOSS_F_6
	dw	BOSS_F_7
	dw	BOSS_F_8
	dw	BOSS_F_8A
	dw	BOSS_F_9
	dw	BOSS_F_9A
	dw	BOSS_F_B
	dw	BOSS_G_0
	dw	boss_g_s
	dw	boss_h_0
	dw	boss_h_1
	dw	boss_h_1a
	dw	boss_h_2
	dw	boss_h_3
	dw	bou_0
	dw	bou_1
	dw	bou_1b
	dw	bouncyball
	dw	BSHIPEXITFACE
	dw	BU_0
	dw	BU_1
	dw	BU_2
	dw	BU_3
	dw	BU_4
	dw	BU_5
	dw	BU_6
	dw	BU_7
	dw	BULGE
	dw	BWARKER_3
	dw	c_miss
	dw	c_robo
	dw	c_wing
	dw	CAMELEON
	dw	car_0
	dw	car_10
	dw	CARRIER
	dw	clasteroid
	dw	clisla_L
	dw	clisla_m
	dw	clisla_S
	dw	COCKPIT
	dw	COLONY_0
	dw	COLONY_1
	dw	COLONY_2
;	dw	COLONY_3L
	dw	COLONY3L
	dw	COLONY3R
	dw	CORE_1_0
	dw	CORE_1_1
	dw	D_BODY_0
	dw	D_HEAD_0
	dw	d_pilar
	dw	deboss_0
	dw	deboss_2
	dw	DFX
	dw	DJPA
	dw	DOOR_1
	dw	DRAIL_0
	dw	DRAIL_4
	dw	EGG
;	dw	EJECT
	dw	ELASER2
	dw	ELASER2A
	dw	elaserfire
	dw	escapee
	dw	EXIT_0
	dw	EXIT_1
	dw	EXIT_2
	dw	EXITFACE
	dw	EXITLIGHT
	dw	EXPL_4
	dw	EXPL_6
	dw	EXPL_8
	dw	EXPLOSION
	dw	EXPLOSION2
	dw	EXPLOSION3
	dw	EXPLOSION4
	dw	explosion5
	dw	F_DRA_1
	dw	F_DRAGON
	dw	F_FISH
	dw	face_0
	dw	face_0_1
	dw	face_1
	dw	face_b
	dw	face_box
	dw	falco1
	dw	FCTA
	dw	FIRE
	dw	FIREBALL
	dw	FIREBREATH
	dw	fireface_B
	dw	fireface1_B
	dw	flingboss
	dw	flower_1
	dw	flower_2
	dw	flower
	dw	FOLARGESHAPE
	dw	FOLsmoke
	dw	font_d
	dw	font_d2
	dw	font_e
	dw	font_e2
	dw	font_e3
	dw	font_h
	dw	font_h2
	dw	font_n
	dw	font_n2
	dw	font_t
	dw	font_t2
	dw	friendship_4
	dw	gamesh
	dw	GATE_0
	dw	GATE_1
	dw	gate_2
;	dw	GNDLCUBE
	dw	grabber
	dw	GRABBER2
	dw	GRABBER3
	dw	GRO_5
	dw	half_d
	dw	HELI
	dw	helpball
	dw	HOU_3
	dw	HOU_4
	dw	HOU_5
	dw	HOU_L
	dw	HOU_R
	dw	HOUDAI_0
	dw	HOUDAI_1
	dw	HYPER
	dw	HYPER2
	dw	HYPER3
	dw	HYPER4
	dw	ika
	dw	imyship_4
	dw	IRIS
	dw	iris_1
	dw	IRONBALL
	dw	IRONBALL2
	dw	ITEM_0
	dw	ITEM_4
	dw	ITEM_5
	dw	ITEM_6
	dw	ITEM_7
	dw	KAMI_S
	dw	KAMIKAZE
	dw	KELLOGS
	dw	KICHI_0
	dw	KICHI_1
	dw	KICHI_2
	dw	KICHI_3
	dw	k_door
	dw	L2smoke
	dw	LARGEPLASMA
	dw	LARGESHAPE
	dw	laserline
	dw	last_b_0
	dw	last_b_3
	dw	LBLACKFACE
;	dw	LCUBE
	dw	LENG_0
;	dw	LEXIT_0
	dw	LFDIE
	dw	LFIREBALL
	dw	LFLASH_0
	dw	LINE
;	dw	LINE_0
;	dw	LINE_1
	dw	LINE_2
	dw	LINE2
	dw	LINE3
	dw	LINKHEAD
	dw	LMARK
	dw	LMISSILE
	dw	LSMOKE
	dw	LSPIECE
	dw	LUIGIH
	dw	LWIREEXIT
	dw	M_TANK
	dw	MARIOH
	dw	MBLACKFACE
	dw	MEDIUMSHAPE
	dw	meteo_0
	dw	MEXITFACE
	dw	MFLASH_0
	dw	MINE_0
	dw	MINE_0_S
	dw	mine_2
	dw	MISS_1_1
	dw	MISS_1_2
	dw	MISSILE
	dw	MMARK
	dw	MOTHER1
	dw	MSPIECE
	dw	MWIREEXIT
	dw	MY_B_W
	dw	my_bird
	dw	MY_DEMO
	dw	myship2
	dw	peppy2
	dw	slippy2
	dw	falco2
	dw	playertwo2
	dw	my_demoS
	dw	MY_L_W
	dw	MY_R_W
	dw	MY_UP
	dw	mybase_0
	dw	MYBASE_1
	dw	MYSHIP_4
	dw	MYSHIP_B
	dw	MYSHIP_L
	dw	MYSHIP_R
	dw	myzoom_4
	dw	myzoom_b
	dw	myzoom_l
	dw	myzoom_r
	dw	NECK
	dw	NUKE
;	dw	old_type
	dw	old_type2
;	dw	old_typp
	dw	op_0
	dw	op_1
	dw	op_2
	dw	ovalbeam
	dw	oversh
;	dw	paper_1
	dw	paper_3
	dw	PARA_0
	dw	PARA_1
;	dw	PCOLB
;	dw	PCOLRW
	dw	peppy1
	dw	PETECUBE
	dw	PEXPLOD
	dw	PHAZER
	dw	PILLAR2
	dw	PILLAR3
	dw	pillar3_ns
	dw	pilon
	dw	pipe_0
	dw	pipe_1
	dw	pipe_2
	dw	pipe_3
	dw	pipe_4
	dw	pipe_5
	dw	pipe_6
	dw	pipe_8
	dw	pipe_8_0
	dw	pipe_9
	dw	pipe_9_0
	dw	PLANE1
	dw	PLASMA
	dw	playerbeam
	dw	playertwo1
	dw	pole_0
	dw	R_BU_0
	dw	R_BU_1
	dw	R_BU_2
	dw	R_BU_3
	dw	R_BU_4
	dw	R_BU_5
	dw	R_BU_6
	dw	R_BU_7
	dw	R_BUT_2
	dw	R_HOU_0
	dw	RADER_0
	dw	RADER_1
	dw	rail_4
	dw	ray_0
	dw	ray_1
	dw	ray_blue
	dw	ray_bred
	dw	RINGLASER
	dw	RIPAIR_W
	dw	RO_0
	dw	RO_1
	dw	RO_2
	dw	RO_3
	dw	RO_4
	dw	RO_5
	dw	RO_6
	dw	robot_0
	dw	rockbeam
	dw	ROUND_0
;	dw	ROUND_0S
	dw	round0p
	dw	rpillar3
	dw	ryousan
	dw	S_0
	dw	S_1
	dw	S_DOOR
	dw	S_DOOR_1
	dw	S_DOOR_2
	dw	s_fish
	dw	S_HOU_0
	dw	S_TANK_0
	dw	SAUSHAD
	dw	SEA_0
	dw	SEA_0_0
	dw	SEA_0_1
	dw	sface_b
	dw	sface2_b
	dw	SFLASH_0
	dw	SHARK
	dw	SHARK1
	dw	shelpball
	dw	shieldr
	dw	SHIP_0_C
	dw	SHIP_1
	dw	SHIP_1_S
	dw	SHIP_3
	dw	SHIP_3_S
	dw	SHIP_4
	dw	SHIP_5
	dw	SHIP_5_S
	dw	SHIP_5L
	dw	SHIP_5M
	dw	ship_5s
	dw	SHIP_S_0
	dw	SHIP_S_1
	dw	SHIP3EXITFACE
	dw	SHIPS
	dw	SHRAP1
	dw	SHYPER
	dw	SJPA
	dw	slippy1
	dw	slot_0
	dw	slot_1
	dw	slot_2
	dw	slot_3
	dw	slot_4
	dw	SMALL_M
	dw	SMALLSHAPE
	dw	SMARK
	dw	SMOKE
	dw	snake_0
	dw	snake_1
	dw	snake_2
	dw	snake_3
	dw	snake_4
	dw	spacepilon
	dw	SPARKLAS
	dw	SPEXPLOD
	dw	SPILLAR2
	dw	SPLASH
	dw	SSHIP_0_C
	dw	SSPIECE
	dw	SSPLASH
	dw	stalk
	dw	stalk_1
	dw	leaf
	dw	SXPSOLIDSPACEBAR
;	dw	SXPSOLIDSPACEBARROTY
	dw	SXPWIRESPACEBAR
;	dw	SXPWIRESPACEBARROTY
	dw	SXSOLIDSPACEBAR
	dw	SXWIRESPACEBAR
	dw	SYSOLIDSPACEBAR
	dw	SYWIRESPACEBAR
	dw	SZSOLIDSPACEBAR
	dw	SZWIRESPACEBAR
	dw	tadpole
	dw	TANK_1
	dw	TANK_2
	dw	tow_0
	dw	tow_1
	dw	TOWER_2
	dw	tower_2a
	dw	training
	dw	TRUCK
	dw	TUNNEL_0
	dw	TUNNEL_6
;	dw	TUNNEL_7
;	dw	TUNNEL_8
	dw	UP1_MAN
	dw	UPER_M
	dw	W_L
	dw	walk_4_0
	dw	walk_4_l
	dw	walk_4_r
	dw	WALKER_0
	dw	WALKER_2
	dw	WALKER_L
	dw	WALKER_R
	dw	WALL_0
	dw	WALL_1
	dw	WALL_2
	dw	WALL_3
	dw	WALL_4
	dw	WALL_5
	dw	WALL_6
	dw	WALL_7
	dw	WALL_L
	dw	WALL_R
	dw	WALL1
	dw	WARKER_3
	dw	WARP
	dw	WARP_1
	dw	WARP_2
	dw	WARP_3
	dw	whale
	dw	whale1
	dw	WIRE_MAN
	dw	wired
	dw	WIREPLAYERTWO
	dw	wolf
	dw	wolf_1
	dw	XPSOLIDSPACEBAR
	dw	XPSOLIDSPACEBARROTY
	dw	XPWIRESPACEBAR
	dw	XPWIRESPACEBARROTY
	dw	XSOLIDSPACEBAR
	dw	XWIRESPACEBAR
	dw	YSOLIDSPACEBAR
	dw	YWIRESPACEBAR
	dw	zaco_0
	dw	zaco_1
	dw	ZACO_4
	dw	ZACO_4p
	dw	ZACO_5
	dw	ZACO_6
	dw	ZACO_7
	dw	ZACO_7p
	dw	ZACO_8
	dw	ZACO_8p
	dw	ZACO_9
	dw	zaco_a
	dw	zaco_b
	dw	ZSOLIDSPACEBAR
	dw	ZWIRESPACEBAR
	dw	.end-.start
.end
	dw	0
	
	structure	shapeslist
	struct		shape_size,1
	struct		shape_text,0


shiplistshape
	dw	myship_4
	dw	wired
	dw	nullshape
	dw	my_up
	dw	nullshape
	dw	Bmyship_4
	dw	myzoom_4
	dw	plane1
	dw	my_demoS
	dw	old_type2
	dw	ryousan
	dw	a_wing
	dw	b_wing
	dw	c_wing
	dw	wolf
	dw	wolf_1
	dw	c_robo
	dw	petecube
	dw	androsscubee
	dw	boss_g_s
	dw	ray_blue
	dw	ray_bred
	dw	ray_0
	dw	wire_man
	dw	cockpit2
	dw	f_fish
	dw	tadpole
	dw	whale1
	dw	my_bird
	dw	shark1
	dw	zaco_1
	dw	zaco_5
	dw	zaco_6
	dw	zaco_8
	dw	zaco_a
	dw	zaco_b
	dw	heli
	dw	ika
	dw	f_dragon
	dw	air_1
	dw	car_10
	dw	phazer
	dw	boss_d_a
	dw	wired
	dw	bmyship_4
	dw	myship2
	dw	dfx
	dw	fcta
	dw	sjpa
	dw	djpa
;-------------------------------------------------
;-------------------------------------------------

foxy_continue_l							;Start here
;	init_bg	mode1						;
;	bg2chr	and							;BG stuff
;	bg2scr	and							;
;	palette	2e							;
;	set_bg								;
	php									;
	phb									;
	a8i16								;
	lda	#0								;
	pha									;
	plb									;
	lda	credits
	lbeq	end2
	stz	trans_flag
	stz	hdmaen
	stz	pweptemp
	stz	strat_valid

	jsr	setdefaultpos

	lda	pagenumber
	bne	.noworries
	lda	#1
	sta	pagenumber
	waitdma	150
	waitdma	140
.noworries
	lda	#$80
	sta	inidisp
	setinidisp1
	disable
	a8
	lda	stopcounting					;Important stuff here, load this into accumulator
	and	#15								;only read the last 4 bits
	cmp	#1
	beq	nobg1
	cmp	#12
	beq	nobg1
	cmp	#2
	beq	nobg1
	cmp	#3
	beq	nobg1
	cmp	#4
	beq	nobg1
	cmp	#8								;compare to #8
	bpl	nobg1							;if its 8 or more, no fox background
	dmacgram	0,0,(bgfoxpac),512		;Yes Fox
	bra	goon1
nobg1
	dmacgram	0,0,0,512				;No Fox
goon1
	lda	#1
	jsl	setpal_l
	a8
	lda	stopcounting					;load stopcounting into accumulator
	cmp	#2
	beq	cont
	cmp	#1
	beq	cont
	cmp	#12
	beq	cont
	cmp	#3
	beq	cont
	cmp	#4
	beq	cont

	cmp	#9
	beq	cont
	cmp	#8								;compare to 8
	beq	cont							;if its not = 8, use standard continue bgm
	cmp	#10
	beq	.br
	cmp	#11
	bne	regbgm
.br
	bgm2	bossroll					;otherwise, play the bossbgm1 bgm
	bra	cont
regbgm
	bgm2	continue					;blah blah why are you reading my comments
cont
	lda	stopcounting
	cmp	#11
	bne	.noset
	lda	#8
	sta	stopcounting
.noset
;	lda	#%11100000						;more continue mode crap
;	sta	coldata							;
	stz	cgadsub							;
	stz	cgswsel
	stz	w12sel
	stz	w34sel
	stz	wobjsel
	stz	tmw
	stz	tsw
	lda	newgameplus						;Check if newgameplus is activated
	and	#1								;only check the last bit
	bne	ngp							;if != 0 go to ngp and get 6 lives when continuing
	lda	#4								;otherwise, only 4 lives when continuing
	sta	lives
	bra	donelives
ngp
	lda	#6								;6 lives for ngp
	sta	lives
donelives


	a16
	stz	foxy_option						;
	stz	foxy_frame						;Zero some shit
	stz	foxy_foot						;
	lda	#350
	sta.l	m_bigz
	a8
	lda	stopcounting					;Check if we are in model test mode or startup menu
	and	#15								;only read last 4 bits
	cmp	#1
	beq	zerospin
	cmp	#2
	beq	zerospin
	cmp	#3
	beq	zerospin
	cmp	#4
	beq	zerospin
	cmp	#8								;compare to 8
	bpl	zerospin						;if 8 or greater, don't worry about the object spin

	lda	#4								;Default spin for objects in continue screen
	sta	foxy_ya
	bra	donespin
zerospin
	stz	foxy_ya
donespin
	stz	foxy_xa							;Zero a bunch of stuff
	stz	foxy_za
	lda	#0
	sta.l	m_rotx
	sta.l	m_roty
	sta.l	m_rotz
	stz	cont0l
	stz	cont1l
	stz	trig0
	stz	trig1
	a8									;8 bit accumulator
	lda	stopcounting					;check if we are in the pre-game menu
	cmp	#8
	beq	noshape						;if so, don't load a shape
	cmp	#9
	beq	noshape
	cmp	#10
	beq	noshape
	cmp	#12
	beq	noshape
	cmp	#1
	beq	noshape
	cmp	#2
	beq	noshape
	cmp	#3
	beq	noshape
	cmp	#4
	beq	noshape
	lda	#2								;otherwise, load position #2 and the a_wing shape
	sta	foxy_ptr
	a16
	lda	#a_wing
	sta	foxy_shape
noshape
	a8

	jsl	setcharmapfox_l
	a8
	lda	stopcounting					;more bg stuff, skip if not in model test or pre-game menu
	and	#15
	cmp	#1
	lbeq	donebg
	cmp	#12
	lbeq	donebg
	cmp	#2
	lbeq	donebg
	cmp	#3
	lbeq	donebg
	cmp	#4
	lbeq	donebg
	cmp	#9
	lbeq	donebg
	cmp	#8
	lbmi	regbg

	decvramnotrans	0,vchr_logback,bgetestccr,6*k			;blank stuff
	decbg2vramnotrans	0,vsc_base2,bgbpcr,8*k				;blank stuff
	decvramnotrans	0,vobj_base,fobjccr,4*k					;blank stuff
	jmp	donebg
regbg
	decvramnotrans	0,vchr_logback,bgfoxccr,6*k				;continue screen stuff
	decbg2vramnotrans	0,vsc_base2,bgfoxpcr,8*k			;
	decvramnotrans	0,vobj_base,fobjccr,4*k					;
donebg
	decclear
;-------------------------------------------;more continue stuff below up to .self
	lda	#$80
	sta	vmainc
	a16
	lda	#vsc_base2+32*24+29
	sta	vmaddl
	lda	credits
	clc
	adc	#((vchr_logback-vchr_physback)/16+$8a)!(5<<10)!(1<<13)
	sta	vmdatal
	a8

	jsl	clronehalf_l
	jsl	clrotherhalf_l
	jsl	clearsprites_l
	jsl	fox_sprites_l
	jsl	dma_sprites_l

	ldx		vmap2
	dmaxvram	0,(bitmapbase+bitmap1),gametranlen1+gametranlen2

	setdepth	night
	set_zdepthtable	normal

; set inidisp position
	lda	#127
	sta.l	xinidisp1-1
	lda	#190-127-5
	sta.l	xinidisp2-1
	lda	#5
	sta.l	xinidisp1a-1

	stz	bg2vofs
	stz	bg2vofs
	stz	bg2hofs
	stz	bg2hofs

	lda	#1
	sta	bgmode
	lda	#1+2+16
	sta	tm
	stz	ts
	lda	#0
	setinidisp1
	lda	stopcounting
	cmp	#1
	beq	.skipout
	cmp	#2
	beq	.skipout
	cmp	#3
	beq	.skipout
	cmp	#4
	beq	.skipout
	cmp	#9
	beq	.skipout
	cmp	#8
	beq	.skipout
	waitdma	240
	lda	#2
	sta	hdmaen
	waitdma	150
	waitdma	140
	enable
	bra	.noskipout
.skipout
	lda	#2
	sta	hdmaen
	enable
.noskipout
	jsl	foxytrans_l
	jsl	foxytrans_l


	
	lda	#0
fadeloop
	pha
	waitdma	224
	pla
	inc	a
	setinidisp1
	cmp	#15
	bne	fadeloop

;---------------------------------------------------------------------	
self							;START OF MAIN LOOP
	jsl	foxytrans_l	
	a8
	lda	stopcounting			;
	and	#15						;
	cmp	#1
	lbeq	notselect2
	cmp	#2
	lbeq	notselect2
	cmp	#3
	lbeq	notselect2
	cmp	#4
	lbeq	notselect2
	cmp	#8						;
	lbeq	notselect2			;if we are in pre-game menu, skip all of these controls
	lda	foxy_frame
	beq	noinc
	inc	foxy_frame
	cmp	#32
	lbeq	yahay
	jmp	notselect
noinc
	lda	bgmspeed
	beq	.nochange
	cmp	#1
	beq	.slow2
	cmp	#2
	beq	.fast2
.slow2
	startbgm	$f4
	bra	.nochange
.fast2
	startbgm	$f5
.nochange





nohilite

	
	a8
	lda	#1
	sta	foxy_flag
	bra	cont2
	
nocont2
	stz	foxy_flag
cont2
	TESTKEYDOWN	SELECT
	beq	notselect
	a8
	lda	stopcounting
	and	#15
	cmp	#1
	beq	notselect
	cmp	#2
	beq	notselect
	cmp	#3
	beq	notselect
	cmp	#4
	beq	notselect
	cmp	#8
	bpl	notselect
	lda.l	lastselected
	bne	notselect2
	lda	foxy_option
	eor	#255
	sta	foxy_option
	trigse	se_cursor

	lda	#1
	bra	setit

notselect
	lda	#0
setit
	sta.l	lastselected
notselect2		;--------------------------;done with those controls
	a8
	lda	stopcounting
	and	#15
	cmp	#10					
	beq	models					;if we are in model test mode, jump to model controls
	cmp	#12					
	beq	models					;if we are in model test mode, jump to model controls
	cmp	#8
	lbeq	specialmenu		;if we are in the pre-game menu, jump down to .specialmenu
	cmp	#9
	lbeq	specialmenupg2		;if we are in the pre-game menu, jump down to .specialmenu	
	cmp	#3
	lbeq	thanksmenu
	cmp	#4
	lbeq	bgmtestmenu
	cmp	#1
	lbeq	shipselectmenu
	cmp	#2
	lbeq	specialmenupg3
	;standard controls for continue screen
	TESTKEYDOWN	LEFT
	beq	noleft
	inc	foxy_ya
noleft

	TESTKEYDOWN	RIGHT
	beq	noright
	dec	foxy_ya
noright
	TESTKEYDOWN	UP
	beq	noup
	inc	foxy_xa
noup
	TESTKEYDOWN	DOWN
	beq	nodown
	dec	foxy_xa
nodown
	jmp	regular

models			;------------------------------------------------
	a8i16
	TESTKEYDOWN	B
	bne	noresetleftb
	stz	ldown
noresetleftb

	TESTKEYDOWN	Y
	bne	noresetrighty
	stz	rdown
noresetrighty

	lda	ldown
	bne	noleft2
	TESTKEYDOWN	B
	beq	noleft2
	bra	godown
noleft2
	lda	rdown
	bne	noright2
	TESTKEYDOWN	Y
	beq	noright2
	bra	goup
noright2
	bra	lefttime
godown
	lda	#1
	sta	ldown
	ldx	foxy_ptr
	dex
	dex
	bmi	reset
	beq	reset
	bra	goon
reset
	ldx	#1198			;last model  (add 2 for every new model added)
	bra	goon
zero
	ldx	#2
	bra	goon

goup
	lda	#1
	sta	rdown
	ldx	foxy_ptr
	inx
	inx
goon
	a16
	cpx	#1199			;last model number +1
	bpl	zero
	lda.l	shapeslist,x
	bne	ok
	lda	#a_wing
	ldx	#2
ok
	sta	foxy_shape
	stx	foxy_ptr

lefttime

;--------------------
	a8
	TESTKEYDOWN	X,cont0l
	lbeq	.nox

	TESTKEYDOWN	A,cont0l
	beq	.nonameswap
	
	a16
	lda	trig0
	bit	#pad_a
	beq		.nonameswap
	a8
	
	turnonoff	cockpitmode

.nonameswap
	a8
	TESTKEYDOWN	UP
	beq	.noworldup
	lda.l	m_vanishy
	sec
	sbc	#5
	sta.l	m_vanishy
	bra	.getout
.noworldup
	TESTKEYDOWN	DOWN
	beq	.noworlddown
	lda.l	m_vanishy
	clc
	adc	#5
	sta.l	m_vanishy	
	bra	.getout
.noworlddown
	TESTKEYDOWN	LEFT
	beq	.noworldleft
	lda.l	m_vanishx
	sec
	sbc	#5
	sta.l	m_vanishx
	bra	.getout
.noworldleft
	TESTKEYDOWN	RIGHT
	beq	.noworldright
	lda.l	m_vanishx
	clc
	adc	#5
	sta.l	m_vanishx
	bra	.getout
.noworldright
	
.getout
	lda.l	m_colframe
	and	#15
	settext	0,1
	a8
	printd
	bra	.noanim
.nox
	jsr	doanimation
.noanim

	TESTKEYDOWN	X,cont0l
	lbne	nodown

	a8
	TESTKEYDOWN	LEFT
	beq	noleft1
	lda.l	m_roty
	clc
	adc	#5
	sta.l	m_roty
noleft1

	TESTKEYDOWN	RIGHT
	beq	noright1
	lda.l	m_roty
	sec
	sbc	#5
	sta.l	m_roty

noright1
	TESTKEYDOWN	UP
	beq	noup1
	lda.l	m_rotx
	clc
	adc	#5
	sta.l	m_rotx
noup1
	TESTKEYDOWN	DOWN
	beq	nodown1
	lda.l	m_rotx
	sec
	sbc	#5
	sta.l	m_rotx
nodown1


	TESTKEYDOWN	TLEFT,cont0l
	beq	nozoomup
	TESTKEYDOWN	TRIGHT,cont0l
	bne	resetposition


	a16
	lda.l	m_bigz
	sec
	sbc	#20
	cmp	#50
	bcc	nozoomup
	sta.l	m_bigz
nozoomup
	a8
	TESTKEYDOWN	TRIGHT,cont0l
	beq	nozoomout
	a16
	lda.l	m_bigz
	clc
	adc	#20
	cmp	#3000
	bcs	nozoomout
	sta.l	m_bigz
nozoomout
	a8
	TESTJOYPAD	start
	bne		noclearst
	stz	keyrdown

noclearst

	lda	keyrdown
	bne	doner
	a8
	TESTJOYPAD	start
	beq		doner
	a16
	lda	trig0
	bit	#pad_start
	beq		doner
	a16
	lda	#2
	sta	stopcounting
	stz	foxy_ptr
	stz	foxy_shape
	jmp	foxy_continue_l
	
resetposition
	a16
	jmp	foxy_continue_l
doner
;---------------------
	a8
	TESTKEYDOWN	A,cont0l
	beq		clrbitmaps1
	lda		#0
	bra		dontclear1
clrbitmaps1
	lda		#1
dontclear1	sta.l		m_clrbitmaps

skipout
;------------------
	lda	cockpitmode
	bne	.notext
	
	ldx	foxy_ptr
	stz	textpt
	settext	0,1
	a16
	lda.l	shapeslist,x
	clc
	adc	#foxy_shape-4
	sta	textpt
	stz	textpt+2

	jsl	printt_l
;-------------------
.notext
	jmp	self


	a8
;----------------
	lda	weaponnumber
	cmp	#10
	beq	dontclr
	lda	#10
	sta	weaponnumber
	ldx	foxy_ptr
	stz	textpt
	settext	0,1
	a16
	lda.l	shapeslist,x
	clc
	adc	#foxy_shape-4
	sta	textpt
	stz	textpt+2

	jsl	printt_l
;-------------------
regular
	a8
dontclr
	TESTKEYDOWN	A,cont0l
	beq		clrbitmaps
	lda		#0
	bra		dontclear
clrbitmaps
	stz	weaponnumber
	lda		#1
dontclear	;sta.l		m_clrbitmaps



;	TESTJOYPAD	X
;	beq	notx
;	stz	foxy_xa
;	stz	foxy_ya
;	stz	foxy_za

	
	
notx

	TESTJOYPAD	START
	beq	.notstart
	a8
	lda	stopcounting
	and	#15
	cmp	#10
	beq	.notstart
	lda	foxy_option
	bne	.end
	lda	foxy_frame
	bne	.notstart
	dec	credits
	inc	foxy_frame
	trigse	$67
	startbgm	$f1
.notstart

	jmp	self
.end
	trigse		$10
	startbgm	$f1


	lda	#15
fadeloop3
	pha
	waitdma	224
	pla
	setinidisp1
	cmp	#15
	dec	a
	bpl	fadeloop3
end2
	jsl	setnoclash_l

	jml	restart
yahay
	a8
	lda	newgameplus
	and	#1
	bne	ngp2
	lda	#4
	sta	lives
	bra	done2
ngp2
	lda	#6
	sta	lives
done2
	jsl	playerstart_init_l

	lda	#15
fadeloop2
	pha
	waitdma	224
	pla
	setinidisp1
	cmp	#15
	dec	a
	bpl	fadeloop2

	jsl	setnoclash_l

	plb
	plp
	rtl

;-----------------------------------------------	
;-----------------------------------------------	
;-----------------------------------------------	
	;			START SPECIAL MENU CODE
;-----------------------------------------------	
;-----------------------------------------------	
;-----------------------------------------------		
;-----------------------------------------------	
;-----------------------------------------------	
;-----------------------------------------------	
;				SPECIAL MENU CODE PAGE 1
;-----------------------------------------------	
;-----------------------------------------------	
;-----------------------------------------------	
;---------------SPECIAL PRE-GAME MENU-----------------
specialmenu					;MenuSelected = 0 - God Mode
	stz	foxy_ptr				;MenuSelected = 1 - Random Fire Mode
	stz	foxy_shape				;MenuSelected = 2 - SNES Mini Mode
								;MenuSelected = 3 - Scored
								;MenuSelected = 4 - New Game+

;-----------SPECIAL MENU TITLE-----------
	settext	6,0
	showtxt	menutitletext
		
;----------CHEATS-----------		
	settext	10,3
	showtxt	menucheatstext

;----------god mode----------	
	lda	menuselected
	bne	nohilite1

	TESTKEYDOWN	Y
	lbeq	.nogm

	jsr	checkgodmodecode
.nogm	
	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite1
	settext	0,5
	showtxt	menu1text

	stz	hilite
	stz	hilite+1
parentl	
	settext	23,5
	lda	secretgodmode
	lbeq	regulargm
	lda	#2
	sta	godmode
	onofftxt	godmode
	lda	#1
	sta	godmode
	jmp	donegmstuff
regulargm
	onofftxt	godmode
donegmstuff
;-------Random Fire----------
	lda	menuselected
	cmp	#1
	bne	nohilite3

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite3	
	settext	0,6
	showtxt	menu3text

	stz	hilite
	stz	hilite+1
	settext	23,6
	onofftxt	randomfire
	
;-------Enemy Fire----------
	lda	menuselected
	cmp	#2
	bne	nohilite8

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite8	
	settext	0,7
	showtxt	menu8text

	stz	hilite
	stz	hilite+1
	settext	23,7
	offontxt	enemy_firing
	
;-------Rapid Fire----------
	lda	menuselected
	cmp	#3
	bne	nohilite111xxxxx

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite111xxxxx
	settext	0,8
	showtxt	rapidfiretext

	stz	hilite
	stz	hilite+1

	settext	23,8
	onofftxt	rapidfire

	lda	#0
	sta.l		m_clrbitmaps	
	
	
;------GAME MODES---------------------

	settext	8,10
	showtxt	menumodestext	

;-------snes mini mode-------
	lda	menuselected
	cmp	#4
	bne	nohilite2

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite2
	
	settext	0,12
	showtxt	menu2text

	stz	hilite
	stz	hilite+1
	settext	23,12
	onofftxt	snesmini



;-------Scored Mode----------
	lda	menuselected
	cmp	#5
	bne	nohilite4

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite4	
	settext	0,13
	showtxt	menu4text

	stz	hilite
	stz	hilite+1
	settext	23,13
	onofftxt	scored
;-------Newgame+----------
	lda	menuselected
	cmp	#6
	bne	nohilite5

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite5	
	settext	0,14
	showtxt	menu5text

	stz	hilite
	stz	hilite+1
	settext	23,14
	onofftxt	newgameplus

;-------Endurance----------
	lda	menuselected
	cmp	#7
	bne	nohilite6

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite6	
	settext	0,15
	showtxt	menu6text

	stz	hilite
	stz	hilite+1
	settext	23,15
	onofftxt	endurance	
	
	lda	#0
	sta.l		m_clrbitmaps
	
;-------Level Features----------
	lda	menuselected
	cmp	#8
	bne	nohilite9

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite9	
	settext	0,16
	showtxt	menu7text

	stz	hilite
	stz	hilite+1
	settext	23,16
	onofftxt	levelfeatures	
	
	lda	#0
	sta.l		m_clrbitmaps
	
	
;-------2 Player Mode----------
	lda	menuselected
	cmp	#9
	bne	nohilite10

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite10
	settext	0,17
	showtxt	menu9text

	stz	hilite
	stz	hilite+1
	settext	23,17
	lda	playertwocpuactivated
	lbne	offwithit
	onofftxt	playertwoactivated	
	bra	noneedforoff
offwithit
	showtxt	offtext
noneedforoff
	lda	#0
	sta.l		m_clrbitmaps	

;-------2 Player CPU Mode----------
	lda	menuselected
	cmp	#10
	bne	nohilite15

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite15
	settext	0,18
	showtxt	menu12text

	stz	hilite
	stz	hilite+1

	settext	23,18
	onofftxtspcl	playertwocpuactivated	
	
	lda	#0
	sta.l		m_clrbitmaps	
	

;---------NEXT PAGE------	
	lda	menuselected
	cmp	#11
	bne	nohilite1222

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite1222
	settext	4,21
	showtxt	menupagetext

	stz	hilite
	stz	hilite+1

	settext	11,21
	printvar	pagenumber

	lda	#0
	sta.l		m_clrbitmaps		

;---------PRESS START TO EXIT TEXT------	
	lda	menuselected
	cmp	#12
	bne	nohilite12222

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite12222
	settext	4,22
	showtxt	menustartgametext

	stz	hilite
	stz	hilite+1
	lda	#0
	sta.l		m_clrbitmaps		
	

;---------SELECT-----------------
	
	TESTKEYDOWN	SELECT
	beq	.noselect1
	lda	trig0
	bit	#pad_SELECT
	beq	.noselect1
	jmp	select1


.noselect1
;---------DOWN-----------------
	TESTKEYDOWN	Y
	bne	nodownn

	TESTKEYDOWN	DOWN
	beq	nodownn
	lda	trig0
	bit	#pad_down
	beq	nodownn

select1
	a8
	trigse	9
	a16
	lda	menuselected
	cmp	#12						;Max number of items on menu
	bpl	top
	inc	menuselected
	bra	downpt2
top
	stz	menuselected
downpt2

nodownn


;----------UP--------------------
	TESTKEYDOWN	Y
	bne	noupp
	TESTKEYDOWN	UP
	beq	noupp
	lda	trig0
	bit	#pad_up
	beq	noupp
	a8
	trigse	9
	a16
	lda	menuselected
	beq	bottom				;Don't go lower than 0, go to the bottom
	dec	menuselected
	bra	uppart2
bottom
	lda	#12					;Last item on list (same as above)
	sta	menuselected
uppart2

noupp
;-------------------------------
;	TESTKEYDOWN	SELECT
;	lbeq	.noonpl
;	lda	trig0
;	bit	#pad_SELECT
;	lbeq	.noonpl	
;	lda	menuselected
;	cmp	#10
;	bne	.noonpl

;	lda	#1
;	;sta.l		m_clrbitmaps
;	sta.l		m_playertwoactivated
;	sta			playertwoactivated
;	inc	playertwocpuactivated
;	lda	playertwocpuactivated
;	cmp	#4
;	bpl	.zeroout
;	jmp	noleftt
;.zeroout
;	stz	playertwocpuactivated
;	stz	playertwoactivated
;	lda	#0
;	sta.l		m_playertwoactivated
;	jmp	noleftt
;----------RIGHT--------------------
.noonpl
	TESTKEYDOWN	RIGHT
	lbeq	norightt
	lda	trig0
	bit	#pad_right
	lbeq	norightt
	a8
	trigse	10
	a16
	lda	menuselected
	cmp	#0
	beq	.0
	cmp	#1
	beq	.1
	cmp	#2
	lbeq	.2
	cmp	#3
	lbeq	.3
	cmp	#4
	lbeq	.4
	cmp	#5
	lbeq	.5
	cmp	#6
	lbeq	.6
	cmp	#7
	lbeq	.7
	cmp	#8
	lbeq	.8
	cmp	#9
	lbeq	.9
	cmp	#10
	lbeq	.10
	cmp	#11
	lbeq	.11
	lbpl	norightt
.0
	lda	newgameplus
	lbne	doneright				;no change if new game plus on
	turnonoff	godmode
	jmp	doneright
	
	
.1
	lda	newgameplus
	lbne	doneright				;no change if new game plus on
	turnonoff	randomfire
	jmp	doneright

.2
	lda	newgameplus
	lbne	doneright				;no change if new game plus on
	lda	enemy_firing
	beq	.turnenemy_firingon
	stz	enemy_firing
	jmp	doneright
.turnenemy_firingon
	lda	#1
	sta	enemy_firing
	jmp	doneright
.3
	turnonoff	rapidfire
	jmp	doneright	
.4
	turnonoff	snesmini
	jmp	doneright
	
.5
	turnonoff	scored
	jmp	doneright
	
.6
	lda	newgameplus
	and	#1
	beq	.turnngpon
	stz	newgameplus
	jmp	doneright
.turnngpon
	lda	#1
	sta	newgameplus
	sta	enemy_firing			;enable enemy firing
	lda	secretgodmode
	bne	.nogodoffman
	stz	godmode					;disable godmode
.nogodoffman
	stz	randomfire				;disable randomfire
	jmp	doneright

.7
	turnonoff	endurance
	jmp	doneright	
	
.8
	turnonoff	levelfeatures
	jmp	doneright	
	
.9
	lda	playertwoactivated
	and	#1
	beq	.turnplayertwoactivatedon
	stz	playertwoactivated
	lda	#0
	sta.l	m_playertwoactivated
	jmp	doneright
.turnplayertwoactivatedon
	lda	#1
	sta	playertwoactivated
	sta.l	m_playertwoactivated
	stz	playertwocpuactivated
	jmp	doneright	

.10
	lda	playertwocpuactivated
	and	#3
	beq	.turnplayertwocpuactivatedon
	cmp	#1
	beq	.p2plus
	cmp	#2
	beq	.p4
	stz	playertwocpuactivated
	stz	playertwoactivated
	lda	#0
	sta.l	m_playertwoactivated
	bra	doneright
.turnplayertwocpuactivatedon
	lda	#1
	sta	playertwoactivated
	sta	playertwocpuactivated
	sta.l	m_playertwoactivated
	bra	doneright	
.p2plus
	lda	#2
	sta	playertwocpuactivated
	bra	doneright	
.p4
	lda	#3
	sta	playertwocpuactivated
	bra	doneright	

.11
	lda	#9
	sta	stopcounting
	lda	#14					;POSITION of PAGE on page 2
	sta	menuselected
	lda	#2
	sta	pagenumber
	lda	#1
	sta.l	m_clrbitmaps
	jmp	foxy_continue_l

doneright

norightt
;----------LEFT--------------------
	TESTKEYDOWN	LEFT
	lbeq	noleftt
	lda	trig0
	bit	#pad_left
	lbeq	noleftt
	a8
	trigse	10
	a16
	lda	menuselected
	beq	.01
	cmp	#1
	beq	.1x
	cmp	#2
	lbeq	.21
	cmp	#3
	lbeq	.31
	cmp	#4
	lbeq	.41
	cmp	#5
	lbeq	.51
	cmp	#6
	lbeq	.61
	cmp	#7
	lbeq	.71
	cmp	#8
	lbeq	.81
	cmp	#9
	lbeq	.91
	cmp	#10
	lbeq	.101
	cmp	#11
	lbeq	.111
	lbpl	noleftt
.01
	lda	newgameplus
	lbne	doneleft				;no change if new game plus on
	turnonoff	godmode
	jmp	doneleft
	
.1x
	lda	newgameplus
	lbne	doneleft				;no change if new game plus on
	turnonoff	randomfire
	jmp	doneleft

.21
	lda	newgameplus
	lbne	doneleft				;no change if new game plus on
	turnonoff	enemy_firing
	jmp	doneleft
.31
	turnonoff	rapidfire
	jmp	doneleft		
.41
	turnonoff	snesmini
	jmp	doneleft	
.51
	turnonoff	scored
	jmp	doneleft
	
.61
	lda	newgameplus
	and	#1
	beq	.turnngpon1
	stz	newgameplus
	jmp	doneleft
.turnngpon1
	lda	#1
	sta	newgameplus
	sta	enemy_firing			;enable enemy firing
	lda	secretgodmode
	bne	.noturnoffgodagain
	stz	godmode					;disable godmode
.noturnoffgodagain
	stz	randomfire				;disable randomfire
	jmp	doneleft
	
.71
	turnonoff	endurance
	jmp	doneleft	
	
.81
	turnonoff	levelfeatures
	jmp	doneleft
	
.91
	lda	playertwoactivated
	and	#1
	beq	.turnplayertwoactivatedon2
	stz	playertwoactivated
	lda	#0
	sta.l	m_playertwoactivated
	jmp	doneleft
.turnplayertwoactivatedon2
	lda	#1
	sta	playertwoactivated
	sta.l	m_playertwoactivated
	stz	playertwocpuactivated
	jmp	doneleft

.101
	lda	playertwocpuactivated
	and	#3
	beq	.p42
	cmp	#3
	beq	.p2plus2
	cmp	#2
	beq	.turnplayertwocpuactivatedon2
	stz	playertwocpuactivated
	stz	playertwoactivated
	lda	#0
	sta.l	m_playertwoactivated
	bra	doneleft
.turnplayertwocpuactivatedon2
	lda	#1
	sta	playertwocpuactivated
	bra	doneleft	
.p2plus2
	lda	#2
	sta	playertwocpuactivated
	bra	doneleft	
.p42
	lda	#1
	sta	playertwoactivated
	sta.l	m_playertwoactivated
	lda	#3
	sta	playertwocpuactivated

	bra	doneleft	
	
.111
	lda	#2
	sta	stopcounting
	lda	#3					;page number
	sta	pagenumber			
	lda	#4					;position of PAGE on page 3
	sta	menuselected
	lda	#1
	sta.l	m_clrbitmaps
	jmp	foxy_continue_l
doneleft	


noleftt

;---------L Trigger-------------------
	TESTJOYPAD	TLEFT,cont0l
	beq		notriggerleft
	lda	trig0
	bit	#pad_tleft
	beq		notriggerleft
	lda	#2
	sta	stopcounting
	lda	#3					;page number
	sta	pagenumber			
	lda	#4					;position of PAGE on page 3
	sta	menuselected
	lda	#1
	sta.l	m_clrbitmaps
	jmp	foxy_continue_l
notriggerleft

;---------R Trigger-------------------
	TESTJOYPAD	TRIGHT,cont0l
	beq		notriggerright
	lda	trig0
	bit	#pad_tright
	beq		notriggerright

	lda	#9
	sta	stopcounting
	lda	#14					;POSITION of PAGE on page 2
	sta	menuselected
	lda	#2
	sta	pagenumber
	lda	#1
	sta.l	m_clrbitmaps
	jmp	foxy_continue_l

notriggerright

;---------start - exit-------------------
	TESTJOYPAD	START
	beq		noexit
	lda	trig0
	bit	#pad_start
	beq		noexit
	lda	menuselected
	cmp	#12
	bne	noexit
	stz	stopcounting
	jml	restart
	
noexit
;	stz	cont0
;	stz	contl0
;	stz	cont0l
;	stz	contl0l
	jmp	self

;-----------------------------------------------	
;-----------------------------------------------	
;-----------------------------------------------	
;			END SPECIAL MENU CODE PAGE 1
;-----------------------------------------------	
;-----------------------------------------------	
;-----------------------------------------------	

;-----------------------------------------------	
;-----------------------------------------------	
;-----------------------------------------------	
;				SPECIAL MENU CODE PAGE 2
;-----------------------------------------------	
;-----------------------------------------------	
;-----------------------------------------------	
	
specialmenupg2					;MenuSelected = 0 - God Mode
	stz	foxy_ptr				;MenuSelected = 1 - Random Fire Mode
	stz	foxy_shape				;MenuSelected = 2 - SNES Mini Mode
								;MenuSelected = 3 - Scored
								;MenuSelected = 4 - New Game+
;-------------------------------------------------

;-----------SPECIAL MENU TITLE-----------
	settext	6,0
	showtxt	menutitletext

;--------------MODS---------	
	settext	11,2
	showtxt	menumodstext	
	

;-------Rainbow Fire----------
	lda	menuselected
	cmp	#0
	bne	nohilite11

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite11
	settext	0,4
	showtxt	menu10text

	stz	hilite
	stz	hilite+1
	settext	23,4
	onofftxt	rainbowlaser
	
	lda	#0
	sta.l		m_clrbitmaps	

;-------Huge Models----------
	lda	menuselected
	cmp	#1
	bne	nohilite12

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite12
	settext	0,5
	showtxt	menu11text

	stz	hilite
	stz	hilite+1
	settext	23,5
	lda	bigheadmode
	beq	normal
	cmp	#1
	beq	bigger
	cmp	#2
	beq	biggest
normal
	showtxt	menunormaltext
	bra	donemodel
bigger
	showtxt	menubiggertext
	bra	donemodel
biggest
	showtxt	menubiggesttext
	;bra	donemodel
	
	
donemodel	
	lda	#0
	sta.l		m_clrbitmaps	

;-------WIRE----------
	lda	menuselected
	cmp	#2
	bne	nohilite111

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite111
	settext	0,6
	showtxt	menufonttext

	stz	hilite
	stz	hilite+1
	settext	23,6
	onofftext	wiremode
	
	lda	#0
	sta.l		m_clrbitmaps	

;-------Skip Scramble----------
	lda	menuselected
	cmp	#3
	bne	nohilite111xx

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite111xx
	settext	0,7
	showtxt	menuscrambletext

	stz	hilite
	stz	hilite+1

	settext	23,7
	onofftxt	skipscramble

	lda	#0
	sta.l		m_clrbitmaps		

;-------Dark Mode----------
	lda	menuselected
	cmp	#4
	bne	nohilite111xx1

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite111xx1
	settext	0,8
parentofaparent
	showtxt	menudarkmodetext
	stz	hilite
	stz	hilite+1

	settext	23,8
anotherparentforyou
	onofftxt	darkmode

	lda	#0
	sta.l		m_clrbitmaps		

;-------Palette Change----------
	lda	menuselected
	cmp	#5
	bne	nohilite111xx11

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite111xx11
	settext	0,9
	showtxt	menupalettetext

	stz	hilite
	stz	hilite+1

	settext	18,9
	lda	palnumber
	cmp	#0
	beq	palnum0
	cmp	#1
	beq	palnum1
	cmp	#2
	lbeq	palnum2
	cmp	#3
	lbeq	palnum3
	cmp	#4
	lbeq	palnum4
	cmp	#5
	lbeq	palnum5
	cmp	#6
	lbeq	palnum6
	cmp	#7
	lbeq	palnum7
	cmp	#8
	lbeq	palnum8
	cmp	#9
	lbeq	palnum9
	cmp	#10
	lbeq	palnum10
	cmp	#11
	lbeq	palnum11

palnum0
	showtxt	menudefaultmodetext
	jmp	nomorepal
	
palnum1
	showtxt	menuretro1modetext
	jmp	nomorepal

palnum2
	showtxt	menuretro2modetext
	jmp	nomorepal

palnum3
	showtxt	menumistmodetext
	jmp	nomorepal

palnum4
	showtxt	menugreenmodetext
	jmp	nomorepal

palnum5
	showtxt	menurainbowmodetext
	jmp	nomorepal

palnum6
	showtxt	menurainbowkmodetext
	jmp	nomorepal

palnum7
	showtxt	menucyanscmodetext
	jmp	nomorepal

palnum8
	showtxt	menubluescmodetext
	jmp	nomorepal

palnum9
	showtxt	menugreenscmodetext
	jmp	nomorepal

palnum10
	showtxt	menuwhitescmodetext
	jmp	nomorepal

palnum11
	showtxt	menublackscmodetext
	jmp	nomorepal
	
nomorepal
	lda	#0
	sta.l		m_clrbitmaps		

		

;-------No Backgrounds Mode----------
	lda	menuselected
	cmp	#6
	bne	nohilite111xx1114a

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite111xx1114a
	settext	0,10
	showtxt	nobackgroundstext

	stz	hilite
	stz	hilite+1

	settext	23,10
	onofftxt	nobgmode
	
;-------No Dots Mode----------
	lda	menuselected
	cmp	#7
	bne	nohilite111xx111

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite111xx111
	settext	0,11
	showtxt	menunodotstext

	stz	hilite
	stz	hilite+1

	settext	23,11
	onofftxt	nodotsmode

;-------Player Col Boxes----------
	lda	menuselected
	cmp	#8
	bne	nohilite111xx111321

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite111xx111321
	settext	0,12
	showtxt	playercolboxtext

	stz	hilite
	stz	hilite+1

	settext	23,12
	onofftxt	showcolbox
	
;-------NAN MODE!!----------
	lda	menuselected
	cmp	#9
	bne	nohilite111xx111321r

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite111xx111321r
	settext	0,13
	showtxt	nanmodetext

	stz	hilite
	stz	hilite+1

	settext	23,13
	printvar	nanmode
	
	
;-------Disable SFX----------
	lda	menuselected
	cmp	#10
	bne	nohilite111xxx

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite111xxx
	settext	0,14
	showtxt	menudisablesfxtext

	stz	hilite
	stz	hilite+1

	settext	23,14
	onofftxt	nosfx
		
	
;-------Disable BGM----------
	lda	menuselected
	cmp	#11
	bne	nohilite111xxxx

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite111xxxx
	settext	0,15
	showtxt	menudisablebgmtext

	stz	hilite
	stz	hilite+1

	settext	23,15
anotherparent
	onofftxt	nobgm
	
;-------BGM SPEED----------
	lda	menuselected
	cmp	#12
	bne	nohilite111xxxxy

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite111xxxxy
	settext	0,16
	showtxt	bgmspeedtext

	stz	hilite
	stz	hilite+1

	settext	22,16
anotherparentt
	lda	bgmspeed
	beq	.orig
	cmp	#1
	beq	.slow
	cmp	#2
	beq	.fast
	bra	.orig
.orig
	showtxt	menuorigtext
	bra	nomoretxt
.slow
	showtxt	slowtext
	bra	nomoretxt
.fast
	showtxt	fasttext

nomoretxt

;-------SUPERFX 2----------
	lda	menuselected
	cmp	#13
	bne	nohilite111xxxxy444

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite111xxxxy444
	settext	0,17
	showtxt	superfx2text

	stz	hilite
	stz	hilite+1

	settext	23,17
anotherparentt444
	onofftext	superfx2

;---------PAGE------	
	lda	menuselected
	cmp	#14
	bne	nohilite1222xa

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite1222xa
	settext	4,21
	showtxt	menupagetext

	stz	hilite
	stz	hilite+1

	settext	11,21
	printvar	pagenumber

;---------PRESS START TO EXIT TEXT------	
	lda	menuselected
	cmp	#15
	lbne	nohilite12222x

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite12222x
	settext	4,22
	showtxt	menustartgametext

	stz	hilite
	stz	hilite+1

;---------SELECT-----------------
	
	TESTKEYDOWN	SELECT
	beq	.noselect2
	lda	trig0
	bit	#pad_SELECT
	beq	.noselect2
	jmp	select2


.noselect2

;---------DOWN-----------------
	TESTKEYDOWN	DOWN
	beq	nodownn2
	lda	trig0
	bit	#pad_down
	beq	nodownn2
select2
	a8
	trigse	9
	a16
	lda	menuselected
	cmp	#15				;Max number of items on menu
	bpl	top2
	inc	menuselected
	bra	downpt22
top2
	stz	menuselected
downpt22

nodownn2


;----------UP--------------------
	TESTKEYDOWN	UP
	beq	noupp2
	lda	trig0
	bit	#pad_up
	beq	noupp2
	a8
	trigse	9
	a16
	lda	menuselected
	beq	bottom2				;Don't go lower than 0, go to the bottom
	dec	menuselected
	bra	uppart22
bottom2
	lda	#15				;Last item on list (same as above)
	sta	menuselected
uppart22

noupp2


;----------RIGHT--------------------
	TESTKEYDOWN	RIGHT
	lbeq	norighttxa
	lda	trig0
	bit	#pad_right
	lbeq	norighttxa
	a8
	trigse	10
	lda	menuselected
	cmp	#0
	beq	.0xa
	cmp	#1
	lbeq	.1xa
	cmp	#2
	lbeq	.2xa
	cmp	#3
	lbeq	.3xa
	cmp	#4
	lbeq	.4xa
	cmp	#5
	lbeq	.5xa
	cmp	#6
	lbeq	.6xa
	cmp	#7
	lbeq	.7xa
	cmp	#8
	lbeq	.8xa
	cmp	#9
	lbeq	.9xa
	cmp	#10
	lbeq	.10xa
	cmp	#11
	lbeq	.11xa
	cmp	#12
	lbeq	.12xa
	cmp	#13
	lbeq	.13xa
	cmp	#14
	lbeq	.14xa
	jmp	norighttxa
	
.0xa
	turnonoff	rainbowlaser
	jmp	donerightxa

.1xa
	lda	bigheadmode
	beq	.turnbigheadon
	cmp	#1
	beq	.turnbiggerheadon
	stz	bigheadmode
	lda	#0
	sta.l	m_bigheadmode
	sta.l	m_biggerheadmode
	jmp	donerightxa
.turnbigheadon
	lda	#1
	sta	bigheadmode
	sta.l	m_bigheadmode
	lda	#0
	sta.l	m_biggerheadmode

	jmp	donerightxa
.turnbiggerheadon
	lda	#2
	sta	bigheadmode
	lda	#1
	sta.l	m_biggerheadmode
	lda	#0
	sta.l	m_bigheadmode

	jmp	donerightxa

.2xa
	turnonoff	wiremode
	lda	wiremode
	sta.l	m_wiremode
	jmp	donerightxa
	
.3xa
	turnonoff	skipscramble
	jmp	donerightxa
.4xa
	turnonoff	darkmode
	jmp	donerightxa
.5xa
	a8
	inc	palnumber
	lda	palnumber
	cmp	#12				;too high, only (this number-1) is the amount of pal entries
	bmi	.noresetpal
	stz	palnumber
.noresetpal
	jmp	donerightxa
.6xa
	turnonoff	nobgmode
	jmp	donerightxa
.7xa
	turnonoff	nodotsmode
	jmp	donerightxa

.8xa
	turnonoff	showcolbox
	jmp	donerightxa

.9xa
	inc	nanmode
	lda	nanmode
	cmp	#5
	bpl	.resetnanmode
	jmp	donerightxa
.resetnanmode
	stz	nanmode
	jmp	donerightxa
.10xa
	turnonoff	nosfx
	jmp	donerightxa

.11xa
	turnonoff	nobgm
	lda	nobgm
	and	#1
	bne	.off
	a8
	bgm2	bossroll
	bra	donerightxa
.off
	stz	nobgm
	a8
	startbgm	$F0
	a16
	lda	#1
	sta	nobgm
	bra	donerightxa
.12xa
	a8
	inc	bgmspeed
	lda	bgmspeed
	cmp	#3				;too high, only (this number-1) is the amount of pal entries
	bmi	.noresetbgm
	stz	bgmspeed
.noresetbgm
	a8
	lda	bgmspeed
	beq	.nochange2222
	cmp	#1
	beq	.slow2222
	cmp	#2
	beq	.fast2222
.slow2222
	startbgm	$f4
	bra	.nochange2222
.fast2222
	startbgm	$f5
.nochange2222
	jmp	donerightxa
.13xa
	turnonoff	superfx2
	jmp	donerightxa


.14xa
	lda	#2
	sta	stopcounting
	lda	#3					;page number
	sta	pagenumber
	lda	#4					;position of PAGE on page 3
	sta	menuselected
	lda	#1
	sta.l	m_clrbitmaps
	jmp	foxy_continue_l

	
donerightxa	

norighttxa

	
;----------LEFT--------------------
	a16
	TESTKEYDOWN	LEFT
	lbeq	nolefttxa
	lda	trig0
	bit	#pad_left
	lbeq	nolefttxa
	a8
	trigse	10
	lda	menuselected
	cmp	#0
	beq	.0xaa
	cmp	#1
	lbeq	.1xaa
	cmp	#2
	lbeq	.2xaa
	cmp	#3
	lbeq	.3xaa
	cmp	#4
	lbeq	.4xaa
	cmp	#5
	lbeq	.5xaa
	cmp	#6
	lbeq	.6xaa
	cmp	#7
	lbeq	.7xaa
	cmp	#8
	lbeq	.8xaa
	cmp	#9
	lbeq	.9xaa
	cmp	#10
	lbeq	.10xaa
	cmp	#11
	lbeq	.11xaa
	cmp	#12
	lbeq	.12xaa
	cmp	#13
	lbeq	.13xaa
	cmp	#14
	lbeq	.14xaa
	jmp	doneleftxa
.0xaa
	turnonoff	rainbowlaser
	jmp	doneleftxa

.1xaa
	lda	bigheadmode
	beq	.turnbiggerheadona
	cmp	#2
	beq	.turnbigheadona
	stz	bigheadmode
	lda	#0
	sta.l	m_bigheadmode
	sta.l	m_biggerheadmode
	jmp	doneleftxa
.turnbigheadona
	lda	#1
	sta	bigheadmode
	sta.l	m_bigheadmode
	lda	#0
	sta.l	m_biggerheadmode

	jmp	doneleftxa
.turnbiggerheadona
	lda	#2
	sta	bigheadmode
	lda	#1
	sta.l	m_biggerheadmode
	lda	#0
	sta.l	m_bigheadmode

	jmp	doneleftxa

.2xaa
	turnonoff	wiremode
	lda	wiremode
	sta.l	m_wiremode
	jmp	doneleftxa

.3xaa
	turnonoff	skipscramble
	jmp	doneleftxa
.4xaa
	turnonoff	darkmode
	jmp	doneleftxa	
.5xaa
	a8
	dec	palnumber
	lda	palnumber
	bpl	.noresetleft
	lda	#11			;too low, reset to the amount of pal entries
	sta	palnumber
.noresetleft
	jmp	doneleftxa

.6xaa
	turnonoff	nobgmode
	jmp	doneleftxa
.7xaa
	turnonoff	nodotsmode
	jmp	doneleftxa
.8xaa
	turnonoff	showcolbox
	jmp	doneleftxa
.9xaa
	dec	nanmode
	lda	nanmode
	bmi	.resetnanmode2
	jmp	doneleftxa
.resetnanmode2
	lda	#4
	sta	nanmode
	jmp	doneleftxa	
.10xaa
	turnonoff	nosfx
	jmp	doneleftxa

.11xaa
	a8
	turnonoff	nobgm
	lda	nobgm
	and	#1
	bne	.offxa
	a8
	bgm2	bossroll
	bra	doneleftxa
.offxa
	stz	nobgm
	a8
	startbgm	$F0
	lda	#1
	sta	nobgm
	bra	doneleftxa
.12xaa
	dec	bgmspeed
	lda	bgmspeed
	bpl	.noresetleftbgm
	lda	#2			;too low, reset to the amount of entries
	sta	bgmspeed
.noresetleftbgm
	a8
	lda	bgmspeed
	beq	.nochange22
	cmp	#1
	beq	.slow22
	cmp	#2
	beq	.fast22
.slow22
	startbgm	$f4
	bra	.nochange22
.fast22
	startbgm	$f5
.nochange22
	bra	doneleftxa

.13xaa
	turnonoff	superfx2
	jmp	doneleftxa	

.14xaa
	lda	#8
	sta	stopcounting
	lda	#11					;position of PAGE on page 1
	sta	menuselected
	lda	#1
	sta	pagenumber
	sta	keyldown
	sta.l	m_clrbitmaps
	jmp	foxy_continue_l

doneleftxa	

nolefttxa
	a16
;---------L Trigger-------------------
	TESTJOYPAD	TLEFT,cont0l
	beq		notriggerleftt
	lda	trig0
	bit	#pad_tleft
	beq		notriggerleftt
	lda	#8
	sta	stopcounting
	lda	#1					;page number
	sta	pagenumber			
	lda	#11					;position of PAGE on page 1
	sta	menuselected
	lda	#1
	sta.l	m_clrbitmaps
	jmp	foxy_continue_l
notriggerleftt

;---------R Trigger-------------------
	TESTJOYPAD	TRIGHT,cont0l
	beq		notriggerrightt
	lda	trig0
	bit	#pad_tright
	beq		notriggerrightt

	lda	#2
	sta	stopcounting
	lda	#4				;POSITION of PAGE on page 3
	sta	menuselected
	lda	#3
	sta	pagenumber
	lda	#1
	sta.l	m_clrbitmaps
	jmp	foxy_continue_l

notriggerrightt

;---------start - exit-------------------
	a16
	TESTJOYPAD	START
	lbeq		noexit2
	lda	trig0
	bit	#pad_start
	lbeq		noexit2
	lda	menuselected
	cmp	#15
	bne	noexit2
	stz	stopcounting
	jml	restart
	
noexit2
;	stz	cont0
;	stz	contl0
;	stz	cont0l
;	stz	contl0l
	jmp	self
	
;-----------------------------------------------	
;-----------------------------------------------	
;-----------------------------------------------	
;				END SPECIAL MENU CODE PAGE 2
;-----------------------------------------------	
;-----------------------------------------------	
;-----------------------------------------------		
;-----------------------------------------------	
;-----------------------------------------------	
;-----------------------------------------------	
;				START THANKS PAGE
;-----------------------------------------------	
;-----------------------------------------------	
;-----------------------------------------------		
thanksmenu					
	stz	foxy_ptr				
	stz	foxy_shape				
								
								
;-------------------------------------------------

;-----------SPECIAL MENU TITLE-----------
	settext	0,0
	showtxt	thanks1
	showtxt	thanks2
	showtxt	thanks3
	lda	#0
	sta.l	m_clrbitmaps
	
;---------PREV PAGE------	
	lda	menuselected
	cmp	#0
	bne	nohilite1222xa6

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite1222xa6
	settext	4,21
parentlabel6x
	showtxt	menupreviouspagetext

	stz	hilite
	stz	hilite+1
	lda	#0
	sta.l		m_clrbitmaps		

;---------PRESS START TO EXIT TEXT------	
	lda	menuselected
	cmp	#1
	lbne	nohilite12222x5

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite12222x5
	settext	4,22
	showtxt	menustartgametext

	stz	hilite
	stz	hilite+1
	lda	#0
	sta.l		m_clrbitmaps	
;--------------------------
;---------SELECT-----------------
	
	TESTKEYDOWN	SELECT
	beq	.noselect3
	lda	trig0
	bit	#pad_SELECT
	beq	.noselect3
	jmp	select3


.noselect3

;---------DOWN-----------------
	TESTKEYDOWN	DOWN
	beq	nodownn2x
	lda	trig0
	bit	#pad_down
	beq	nodownn2x
select3
	a8
	trigse	9
	a16
	lda	menuselected
	cmp	#1				;Max number of items on menu -1
	bpl	top2x
	inc	menuselected
	bra	downpt22x
top2x
	stz	menuselected
downpt22x

nodownn2x


;----------UP--------------------
	TESTKEYDOWN	UP
	beq	noupp2x
	lda	trig0
	bit	#pad_up
	beq	noupp2x
	a8
	trigse	9
	a16
	lda	menuselected
	beq	bottom2x				;Don't go lower than 0, go to the bottom
	dec	menuselected
	bra	uppart22x
bottom2x
	lda	#1				;Last item on list (same as above)
	sta	menuselected
uppart22x

noupp2x

;---------start - exit-------------------
	a16
	TESTJOYPAD	START
	beq		noexit2x
	lda	trig0
	bit	#pad_start
	beq		noexit2x
	lda	menuselected
	cmp	#0
	beq	page2
	cmp	#1
	bne	noexit2x
	stz	stopcounting
	jml	restart
	
page2
	lda	#2
	sta	stopcounting
	lda	#3					;page number
	sta	pagenumber			
	lda	#3					;position of THANKS on page 3
	sta	menuselected
	lda	#1
	sta.l	m_clrbitmaps
	jmp	foxy_continue_l
	
noexit2x
	jmp	self





	
;-----------------------------------------------	
;-----------------------------------------------	
;-----------------------------------------------	
			;BGM TEST SCREEN
;-----------------------------------------------
;-----------------------------------------------
;-----------------------------------------------

bgmtestmenu
	stz	foxy_ptr				
	stz	foxy_shape		
	
	a8
	


	
	
;----------TRACK NUMBER--------------	

	lda	menuselected
	cmp	#1
	lbne	nohilite12222xty

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite12222xty
	settext	3,5
	showtxt	tracknumbertext

	stz	hilite
	stz	hilite+1


	settext	18,5
	printvar	bgmtest
	showtxt	blankspace
	
	lda	#0
	sta.l	m_clrbitmaps

	
;----------SUBBGM--------------	
	lda	subbgmmode
	lbeq	.nosub
	lda	menuselected
	lbne	.nohi12222xtyii

	lda	#$FF
	sta	hilite
	sta	hilite+1
.nohi12222xtyii
	settext	0,1
	showtxt	subtracknumbertext

	stz	hilite
	stz	hilite+1


	settext	18,1
	printvar	subbgm
	showtxt	blankspace
	showtxt	blankspace
	
	lda	#0
	sta.l	m_clrbitmaps
.nosub
;-------------TRACK TITLE------------
	settext	0,3

	lda	bgmtest
	dec	a
	and	#$00FF
	asl	a
	tax
	lda.l	bgmlisttext,x
	sta	textpt
	a8
	lda	#bgmlisttext>>16
	sta	textpt+2
	a16
	jsl	printt_l
	a8
	
donewiththetext


;-----------PLAY--------
	lda	menuselected
	cmp	#2
	lbne	nohiliters

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohiliters
	settext	6,7
	showtxt	playrestarttext

	stz	hilite
	stz	hilite+1

;-----------FADE OUT--------
	lda	menuselected
	cmp	#3
	lbne	nohiliters2t

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohiliters2t
	settext	6,8
	showtxt	fadeouttext

	stz	hilite
	stz	hilite+1
	lda	#0
	sta.l	m_clrbitmaps
	
;-----------SPEED UP--------
	lda	menuselected
	cmp	#4
	lbne	nohiliters1

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohiliters1
	settext	6,9
	showtxt	speeduptext

	stz	hilite
	stz	hilite+1
	lda	#0
	sta.l	m_clrbitmaps

;-----------SLOW DOWN--------
	lda	menuselected
	cmp	#5
	lbne	nohiliters2

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohiliters2
	settext	6,10
	showtxt	slowdowntext

	stz	hilite
	stz	hilite+1
	lda	#0
	sta.l	m_clrbitmaps

;-----------ALT SOUNDFONT--------
	lda	menuselected
	cmp	#6
	lbne	nohiliters287

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohiliters287
	settext	0,12
	showtxt	altsoundfonttext

	stz	hilite
	stz	hilite+1
	
	settext	18,12
	printvar	soundfont
	lda	#0
	sta.l	m_clrbitmaps
	
;-------------SFX TITLE------------
	settext	0,15

	lda	soundtest
	dec	a
	and	#$00FF
	asl	a
	tax
	lda.l	sfxplaylist,x
	sta	textpt
	a8
	lda	#sfxplaylist>>16
	sta	textpt+2
	a16
	jsl	printt_l
	a8

;----------SOUND FX NUMBER--------------	
	lda	menuselected
	cmp	#7
	lbne	nohilite12222xty666

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite12222xty666
	settext	0,17
	showtxt	soundfxnumbertext

	stz	hilite
	stz	hilite+1


	settext	18,17
	printvar	soundtest
	showtxt	blankspace
	showtxt	blankspace
	
	lda	#0
	sta.l	m_clrbitmaps

;----------PLAY SOUND--------------	
	lda	menuselected
	cmp	#8
	lbne	nohilite12222xty6666

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite12222xty6666
	settext	6,19
	showtxt	playsoundtext

	stz	hilite
	stz	hilite+1
	
	lda	#0
	sta.l	m_clrbitmaps	
	
;---------PREV PAGE------	
	lda	menuselected
	cmp	#9
	bne	nohilite1222xapp

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite1222xapp
	settext	4,21
parentlabelpp
	showtxt	menupreviouspagetext

	stz	hilite
	stz	hilite+1
	lda	#0
	sta.l		m_clrbitmaps		

;---------PRESS START TO EXIT TEXT------	
	lda	menuselected
	cmp	#10
	lbne	nohilite12222xll

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite12222xll
	settext	4,22
	showtxt	menustartgametext

	stz	hilite
	stz	hilite+1
	lda	#0
	sta.l		m_clrbitmaps	

;---------SELECT-----------------
	
	TESTKEYDOWN	SELECT
	beq	.noselect4
	lda	trig0
	bit	#pad_SELECT
	beq	.noselect4
	jmp	select4


.noselect4

;---------DOWN-----------------
	TESTKEYDOWN	DOWN
	beq	nodownn2aa
	lda	trig0
	bit	#pad_down
	beq	nodownn2aa
select4
	a8
	trigse	9
	a16
	lda	menuselected
	cmp	#10				;Max number of items on menu
	bpl	top2aa
	inc	menuselected
	bra	downpt22aa
top2aa
	lda	subbgmmode
	beq	.do1
	stz	menuselected
	bra	downpt22aa
.do1
	lda	#1
	sta	menuselected
	
downpt22aa

nodownn2aa


;----------UP--------------------
	TESTKEYDOWN	UP
	beq	noupp2aa
	lda	trig0
	bit	#pad_up
	beq	noupp2aa
	a8
	trigse	9
	a16
	lda	subbgmmode
	bne	.norm
	lda	menuselected
	cmp	#1
	beq	bottom2aa
	bra	.rest
.norm
	lda	menuselected
	beq	bottom2aa				;Don't go lower than 0, go to the bottom
.rest
	dec	menuselected
	bra	uppart22aa
bottom2aa
	lda	#10				;Last item on list (same as above)
	sta	menuselected
uppart22aa




	;lda	#1
	;sta.l		m_clrbitmaps

noupp2aa


;----------subbgm--------------------
	TESTKEYDOWN	A,cont0l
	beq	rightstuff
	testkeydown	X,cont0l
	beq	rightstuff
	lda	#1
	sta	subbgmmode

	
rightstuff
;----------RIGHT--------------------
	TESTKEYDOWN	RIGHT
	lbeq	noright4u
	lda	trig0
	bit	#pad_right
	lbeq	noright4u
	a8
	trigse	10
	lda	menuselected
	cmp	#6
	beq	.altsoundfont
	cmp	#7
	beq	.rightsound
	cmp	#0
	beq	.subright
	cmp	#1
	bne	noright4u

	inc	bgmtest
	lda	bgmtest
	cmp	#45				;number of entries on the list
	bmi	noright4u
	beq	noright4u
	lda	#1
	sta	bgmtest
	bra	noright4u
.subright
	inc	subbgm
	bra	noright4u
.altsoundfont
	lda	soundfont
	cmp	#2
	beq	.resetsf
	inc	soundfont
	bra	noright4u
.resetsf
	stz	soundfont
	bra	noright4u
	bra	noright4u
.rightsound
	lda	soundtest
	cmp	#175
	beq	.resetsoundteststart
	cmp	#1
	beq	.doubleinc
	inc	soundtest
	bra	.donerightsound
.doubleinc
	lda	#3
	sta	soundtest
	bra	.donerightsound
.resetsoundteststart
	stz	soundtest
	inc	soundtest
	bra	.donerightsound	
.donerightsound
noright4u

;----------LEFT--------------------
	a16
	TESTKEYDOWN	LEFT
	lbeq	noleft4u
	lda	trig0
	bit	#pad_left
	lbeq	noleft4u
	a8
	trigse	10
	lda	menuselected
	cmp	#6
	beq	.altsoundfont1
	cmp	#7
	beq	.leftsound
	cmp	#0
	beq	.subleft
	cmp	#1
	bne	noleft4u
	dec	bgmtest
	lda	bgmtest
	bne	noleft4u
	lda	#45				;number of entries on the list
	sta	bgmtest
	bra	noleft4u
.subleft
	dec	subbgm
	bra	noleft4u
.altsoundfont1
	lda	soundfont
	beq	.jumptotop
	dec	soundfont
	bra	.donesf
.jumptotop
	lda	#2				;top number in list
	sta	soundfont
.donesf
	bra	noleft4u
	
.leftsound
	lda	soundtest
	cmp	#1
	beq	.resetsoundtestend
	cmp	#3
	beq	.goto1
	dec	soundtest
	bra	.doneleftsound
.goto1
	lda	#1
	sta	soundtest
	bra	.doneleftsound
.resetsoundtestend
	lda	#175
	sta	soundtest
.doneleftsound

noleft4u


;---------start - exit-------------------
	a16
	TESTJOYPAD	START
	lbeq		noexit2xmm
	lda	trig0
	bit	#pad_start
	lbeq		noexit2xmm
	a8
	lda	menuselected
	cmp	#0
	beq	.playsubbgm
	cmp	#1
	beq	.playbgm
	cmp	#2
	beq	.playbgm
	cmp	#3
	lbeq	.fadeout
	cmp	#4
	lbeq	.speedupbgm
	cmp	#5
	lbeq	.slowdownbgm
	cmp	#7
	lbeq	.playsound
	cmp	#8
	lbeq	.playsound
	cmp	#9
	lbeq	.page2back
	cmp	#10
	lbne	noexit2xmm
	stz	stopcounting
	jml	restart
	
.playsubbgm
	a8
	lda	subbgm
	sta	bgm_music
	stz	bgmcnt
	jmp	self
.playbgm
	ai16
	lda	bgmtest
	and	#$00FF
	dec	a
	asl	a
	tax
	lda.l	bgmplaylist,x
	sta	textpt+0
	a8
	lda	#bgmplaylist>>16
	sta	textpt+2
	lda	soundfont
	beq	.norm
	cmp	#1
	beq	.corn
	cmp	#2
	beq	.scram
.scram
	jsl	do_bgm_10
	bra	.startwait
.corn
	jsl	do_bgm_11death
	bra	.startwait
.norm
	jsl	do_bgm_map
.startwait
	ldy	#5000		;wait about 1 frame
.wait	dey
	bne	.wait
	jsl	do_bgm_generic_l
	jmp	self

	

.playsound
	lda	soundtest
	jsl	setport3_l
	jmp	self
	
.fadeout
	a8
	startbgm	$F1
	jmp	self

.slowdownbgm
	a8
	startbgm	$F4
	jmp	self
.speedupbgm
	a8
	startbgm	$F5
	jmp	self
.page2back
	lda	#2
	sta	stopcounting
	lda	#3					;page number
	sta	pagenumber			
	lda	#2					;position of BGM TEST on page 3
	sta	menuselected
	lda	#1
	sta.l	m_clrbitmaps
	jmp	foxy_continue_l
	
noexit2xmm
	jmp	self

	

;-----------------------------------------------	
;-----------------------------------------------	
;-----------------------------------------------	
;-----------------------------------------------	
;				END BGM TEST MENU
;-----------------------------------------------	
;-----------------------------------------------	
;-----------------------------------------------	
;-----------------------------------------------	
;-----------------------------------------------	
;-----------------------------------------------	
;-----------------------------------------------	
;				START SHIP SELECT MENU
;-----------------------------------------------	
;-----------------------------------------------	
;-----------------------------------------------	


shipselectmenu
	stz	foxy_ptr
	stz	foxy_shape

;-------SHIP--------------
	lda	menuselected						;Load menuselected
	cmp	#1									;Compare against 0	(redundant)
	bne	nohilite11hgandnullshape1			;if this line is not the highlighted line, skip past the highlighting code
	lda	#$FF								;
	sta	hilite								;highlight code
	sta	hilite+1							;
nohilite11hgandnullshape1				
	settext	0,4								;set position
	showtxt	SHIPTEXT						;show the text "SHIP"
	stz	hilite								;end highlight
	stz	hilite+1							;
	settext	15,4							;set position

	lda	curr_ship							;Load current ship TEXT
	asl	a									;multiply by 2 (each ship takes up 2 slots)
	tax										;Transfer this number to X
	lda.l	shiplist,x						;load the ship on the list at position x
	sta	textpt								;store this into the variable textpt
	a8										;8 bit accumulator mode
	lda	#shiplist>>16						;load bank data for the ship	list
	sta	textpt+2							;store to the relevant location
	a16										;16 bit accumulator mode
	jsl	printt_l							;print text stored in textpt

	lda	curr_ship							;load current ship number
	asl	a									;multiply by 2 (each ship takes up 2 slots)
	tax										;transfer to X
	lda.l	shiplistshape,x					;load the proper ship SHAPE
	sta	foxy_shape							;store this to Foxy_Shape, which will envoke the code that displays models in this screen

	lda	#1									;load #1 into accumulator
	sta.l	m_clrbitmaps					;store this, enabling the screen to erase each frame

;-------Model View--------------
	lda	ptwodead
	bne	nohilitemodelview	;if its not = 0 (is = 1), dont highlight
	lda	menuselected						;Load menuselected
	cmp	#2									;Compare against 1
	bne	nohilitemodelview					;if this line is not the highlighted line, skip past the highlighting code
	lda	#$FF								;
	sta	hilite								;highlight code
	sta	hilite+1							;
nohilitemodelview
	settext	0,5								;set position
	showtxt	modelviewtext					;show the text "MODEL VIEW"
	stz	hilite								;end highlight
	stz	hilite+1							;	
	
;---------PREV PAGE------	
	lda	menuselected
	cmp	#3
	bne	nohiliteforprev

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohiliteforprev
	settext	7,22
	showtxt	menupreviouspagetext
	stz	hilite								;end highlight
	stz	hilite+1							;
	
	
;---------SELECT-----------------
	
	TESTKEYDOWN	SELECT
	beq	.noselect5
	lda	trig0
	bit	#pad_SELECT
	beq	.noselect5
	jmp	select5


.noselect5

;---------DOWN-----------------
	jsr	doanimation			;do ship animation

	lda	ptwodead
	bne	downpt22aa1

	TESTKEYDOWN	DOWN	;these 5 lines check to see if down has been pressed, but to also jump out if its being held down after the first time it executes the code
	beq	downpt22aa1
	lda	trig0
	bit	#pad_down
	beq	downpt22aa1
select5
	a8
	trigse	9
	a16
	lda	menuselected
	cmp	#3				;Max number of items on menu
	bpl	top2aa1			;if its at that number or higher, reset it
	inc	menuselected	;otherwise, increase and skip the zeroing out
	bra	downpt22aa1	
top2aa1
	lda	#1
	sta	menuselected	;reset it to 1
	bra	downpt22aa1
downpt22aa1


;----------UP--------------------
	lda	ptwodead
	bne	uppart22aa1
	TESTKEYDOWN	UP
	beq	uppart22aa1
	lda	trig0
	bit	#pad_up
	beq	uppart22aa1
	a8
	trigse	9
	a16
	lda	menuselected
	cmp	#1
	beq	bottom2aa1
	dec	menuselected
	bra	uppart22aa1
bottom2aa1
	lda	#3				;Last item on list (same as above)
	sta	menuselected
uppart22aa1

;----------RIGHT--------------------
	lda	ptwodead
	bne	norightforthis	;if its not = 0 (is = 1), dont highlight
	TESTKEYDOWN	RIGHT
	beq	norightforthis
	lda	trig0
	bit	#pad_right
	beq	norightforthis
	a8
	trigse	10
	a16

	lda	menuselected
	cmp	#1
	bne	norightforthis
	
	lda	curr_ship
	beq	jumpupto7		;if = 0, go here
	cmp	#49				;max number of ships
	beq	jumpdownto0
	inc	curr_ship
	bra	endthissection
jumpupto7
	lda	#7
	sta	curr_ship
	bra	endthissection
jumpdownto0
	stz	curr_ship

endthissection
	lda	curr_ship
	asl	a
	tax
	lda.l	shiplistshape,x
	sta	foxy_shape
	
norightforthis

;----------LEFT--------------------
	lda	ptwodead
	bne	noleftforthis	;if its not = 0 (is = 1), dont highlight
	TESTKEYDOWN	LEFT
	beq	noleftforthis
	lda	trig0
	bit	#pad_left
	beq	noleftforthis
	a8
	trigse	10
	a16

	lda	menuselected
	cmp	#1
	bne	noleftforthis
	
	lda	curr_ship
	beq	jumpuptoendoflist		;if = 0, go here
	cmp	#7				
	beq	resetittozero			;if = 7, go here
	dec	curr_ship
	bra	alsoendthissection
jumpuptoendoflist
	lda	#49						;max number of ships
	sta	curr_ship				;store it to be at the end of the list
	bra	alsoendthissection
resetittozero
	stz	curr_ship				;zero it out

alsoendthissection
	lda	curr_ship
	asl	a
	tax
	lda.l	shiplistshape,x
	sta	foxy_shape

noleftforthis

;---------start - exit-------------------
	TESTJOYPAD	START
	beq		nostarttogoback
	lda	trig0
	bit	#pad_start
	beq		nostarttogoback
	
	lda	menuselected
	cmp	#2
	beq	modelviewcode
	cmp	#3
	bne	nostarttogoback

	lda	#2
	sta	stopcounting
	stz	menuselected
	stz	foxy_shape
	lda	#1
	sta	m_clrbitmaps
	jmp	foxy_continue_l
	
modelviewcode
	lda	ptwodead	;load
	eor	#1			;flip bit 1
	sta	ptwodead	;store
	jmp	self
	
nostarttogoback

	lda	ptwodead	;load
	lbeq	nocontrols	;if = 0, jump out

	TESTKEYDOWN	LEFT
	beq	noleft11
	lda.l	m_roty
	clc
	adc	#5
	sta.l	m_roty
noleft11

	TESTKEYDOWN	RIGHT
	beq	noright11
	lda.l	m_roty
	sec
	sbc	#5
	sta.l	m_roty

noright11
	TESTKEYDOWN	UP
	beq	noup11
	lda.l	m_rotx
	clc
	adc	#5
	sta.l	m_rotx
noup11
	TESTKEYDOWN	DOWN
	beq	nodown11
	lda.l	m_rotx
	sec
	sbc	#5
	sta.l	m_rotx
nodown11

	TESTKEYDOWN	TLEFT,cont0l
	beq	nozoomup1
	a16
	lda.l	m_bigz
	sec
	sbc	#20
	cmp	#50
	bcc	nozoomup1
	sta.l	m_bigz
nozoomup1
	a8
	TESTKEYDOWN	TRIGHT,cont0l
	beq	nozoomout1
	a16
	lda.l	m_bigz
	clc
	adc	#20
	cmp	#3000
	bcs	nozoomout1
	sta.l	m_bigz
nozoomout1

nocontrols
	jmp	self
;-----------------------------------------------	
;-----------------------------------------------	
;-----------------------------------------------	
;-----------------------------------------------	
;				END SHIP SELECT CODE 
;-----------------------------------------------	
;-----------------------------------------------	
;-----------------------------------------------	
;-----------------------------------------------	
;-----------------------------------------------	
;				START MENU PAGE 3 CODE 
;-----------------------------------------------	
;-----------------------------------------------	
;-----------------------------------------------	

specialmenupg3

	
;-----------SPECIAL MENU TITLE-----------
	settext	6,0
	showtxt	menutitletext

;---------SHIP SELECT------	
	lda	menuselected
	cmp	#0
	bne	uniquelabelhere

	lda	#$FF
	sta	hilite
	sta	hilite+1
uniquelabelhere
	settext	8,4
	showtxt	shipselecttext

	stz	hilite
	stz	hilite+1
	lda	#0
	sta.l		m_clrbitmaps

;-----------MODEL TEST MODE-------------

	lda	menuselected
	cmp	#1				;position of selection
	bne	nomodl

	lda	#$FF
	sta	hilite
	sta	hilite+1
nomodl

	settext	6,6
	showtext	menumodeltestmodetext

	stz	hilite
	stz	hilite+1

;---------BGM TEST------	
	lda	menuselected
	cmp	#2
	bne	nohilite1222xa16

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite1222xa16
	settext	9,8
parentlabel44xxx
	showtxt	BGMTESTtext

	stz	hilite
	stz	hilite+1
	lda	#0
	sta.l		m_clrbitmaps


;---------THANKS------	
	lda	menuselected
	cmp	#3
	bne	nohilite1222xa1

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite1222xa1
	settext	10,10
parentlabel44
	showtxt	thankstext

	stz	hilite
	stz	hilite+1
	lda	#0
	sta.l		m_clrbitmaps

;---------PAGE------	
	lda	menuselected
	cmp	#4				;position of selection
	bne	nohilite1222xapper

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite1222xapper
	settext	4,21
	showtxt	menupagetext

	stz	hilite
	stz	hilite+1

	settext	11,21
	printvar	pagenumber

	lda	#0
	sta.l		m_clrbitmaps	
	
;---------PRESS START TO EXIT TEXT------	
	lda	menuselected
	cmp	#5
	lbne	nohilite12222x5pl

	lda	#$FF
	sta	hilite
	sta	hilite+1
nohilite12222x5pl
	settext	4,22
	showtxt	menustartgametext

	stz	hilite
	stz	hilite+1

;---------SELECT-----------------
	
	TESTKEYDOWN	SELECT
	beq	.noselect6
	lda	trig0
	bit	#pad_SELECT
	beq	.noselect6
	jmp	select6


.noselect6
	
;---------DOWN-----------------
	a8
	TESTKEYDOWN	DOWN	;these 5 lines check to see if down has been pressed, but to also jump out if its being held down after the first time it executes the code
	beq	nodownpg3
	a16
	lda	trig0
	bit	#pad_down
select6
	a8
	beq	nodownpg3
	a8
	trigse	9
	a16
	lda	menuselected
	cmp	#5				;Max number of items on menu
	bpl	topothelist		;if its at that number or higher, reset it
	inc	menuselected	;otherwise, increase and skip the zeroing out
	bra	nodownpg3	
topothelist
	stz	menuselected	;reset it to 1
	bra	nodownpg3
nodownpg3


;----------UP--------------------
	a8
	TESTKEYDOWN	UP
	beq	nouppg3
	a16
	lda	trig0
	bit	#pad_up
	a8
	beq	nouppg3
	a8
	trigse	9
	a16
	lda	menuselected
	beq	bottomothelist
	dec	menuselected
	bra	nouppg3
bottomothelist
	lda	#5				;Last item on list (same as above)
	sta	menuselected
nouppg3

;----------RIGHT--------------------
	a8
	TESTKEYDOWN	RIGHT
	bne	noclearright
	stz	keyldown
	
noclearright

	lda	keyldown
	lbne	donerightpg3

	a8
	TESTKEYDOWN	RIGHT
	lbeq	donerightpg3
	a16
	lda	trig0
	bit	#pad_right
	a8
	lbeq	donerightpg3
	a8
	trigse	10
	a16

	lda	menuselected
	cmp	#4
	beq	.4s
	bra	donerightpg3
	
.4s
	lda	#8
	sta	stopcounting
	lda	#11			;POSITION OF PAGE on page 1
	sta	menuselected
	lda	#1
	sta	pagenumber
	sta.l	m_clrbitmaps
	jmp	foxy_continue_l

donerightpg3

;----------LEFT--------------------
	a8
	TESTKEYDOWN	LEFT
	lbeq	doneleftpg3
	a16
	lda	trig0
	bit	#pad_left
	a8
	lbeq	doneleftpg3
	a8
	trigse	10
	a16

	lda	menuselected
	cmp	#4
	beq	.4t

	bra	doneleftpg3
.4t
	lda	#9
	sta	stopcounting
	lda	#14				;POSITION OF PAGE on page 2
	sta	menuselected
	lda	#2
	sta	pagenumber
	lda	#1
	sta.l	m_clrbitmaps
	jmp	foxy_continue_l

doneleftpg3
	a16
;---------L Trigger-------------------
	TESTJOYPAD	TLEFT,cont0l
	beq		notriggerlefttt
	lda	trig0
	bit	#pad_tleft
	beq		notriggerlefttt
	lda	#9
	sta	stopcounting
	lda	#2					;page number
	sta	pagenumber			
	lda	#14					;position of PAGE on page 2
	sta	menuselected
	lda	#1
	sta.l	m_clrbitmaps
	jmp	foxy_continue_l
notriggerlefttt

;---------R Trigger-------------------
	TESTJOYPAD	TRIGHT,cont0l
	beq		notriggerrighttt
	lda	trig0
	bit	#pad_tright
	beq		notriggerrighttt

	lda	#8
	sta	stopcounting
	lda	#11				;POSITION of PAGE on page 1
	sta	menuselected
	lda	#1
	sta	pagenumber
	lda	#1
	sta.l	m_clrbitmaps
	jmp	foxy_continue_l

notriggerrighttt

;---------start - exit-------------------
	a8
	TESTJOYPAD	START
	lbeq		nostartpg3
	a16
	lda	trig0
	bit	#pad_start
	a8
	lbeq		nostartpg3
	
	lda	menuselected
	beq	.0m				;if = 0
	cmp	#1
	beq	.1m
	cmp	#2				;start game position
	beq	.2m
	cmp	#3
	beq	.3m
	cmp	#5
	lbne	nostartpg3
	
	stz	stopcounting
	jml	restart				;start game
	
.0m
	lda	#1
	sta	stopcounting
	sta	menuselected
	lda	#1
	sta.l		m_clrbitmaps
	lda	#250
	sta.l	m_bigz
	jmp	foxy_continue_l	

.1m						;model test
	lda	#12
	sta	stopcounting
	a16
	lda	#a_wing
	ldx	#2
	sta	foxy_shape
	stx	foxy_ptr
	a8
	lda	#1
	sta.l	m_clrbitmaps
	sta	keyrdown
	jmp	foxy_continue_l

.2m								;bgm test
	lda	#4
	sta	stopcounting			;set STOPCOUNTING to a value of 4
	lda	#1
	sta.l		m_clrbitmaps
	a8
	lda	#1
	sta	menuselected
	sta	bgmtest
	sta	soundtest
	startbgm	$F1
	jmp	foxy_continue_l
	
.3m								;thanks
	a8
	lda	#3
	sta	stopcounting			;set STOPCOUNTING to a value of 3
	lda	#1
	sta.l		m_clrbitmaps
	stz	menuselected
	a8
	bgm2	kandojingle		
;	startbgm	10
	jmp	foxy_continue_l


nostartpg3

	jmp	self			;jump to main loop


;-----------------------------------------------	
;-----------------------------------------------	
;-----------------------------------------------	
;-----------------------------------------------	
;				END SPECIAL MENU CODE COMPLETE
;-----------------------------------------------	
;-----------------------------------------------	
;-----------------------------------------------	




foxytrans_l
	php
	a8i16
aha2
	lda	stopcounting
	cmp	#9
	bne	.normal
	jsr	drawsome3d
	
.normal
	lda	trans_flag
	bne	aha2

	lda	#tm_fox
	sta	trans_flag

waitx	lda	transbmp1
	beq	waitx
	jsl	clronehalf_l
waitxx
	lda	transbmp1
	cmp	#2
	bne	waitxx

	stz	transbmp1

	jsl	clrotherhalf_l

	jsl	fox_sprites_l
	lda	stopcounting
	cmp	#9
	beq	.dontdrawagain
	jsr	drawsome3d
.dontdrawagain
	plp
	rtl

	
;-------------------------------------------------

drawsome3d
	php
	a16
	lda	#0
	sta.l	m_bigx
	sta.l	m_bigy
	sta.l	m_depthoffset


	inc	gameframe
	lda	foxy_shape
	sta.l	m_shapeptr

	movi 0,clx1
	movi gamenum_col*8-1,clx2
	movi 0,cly1
	movi gamenum_row*8-1,cly2
	movi gamenum_col*4,vanishx
	movi gamenum_row*4,vanishy

	a8i16
	lda.l	m_rotz
	pha
	lda.l	m_roty
	pha
	lda.l	m_rotx
	pha

	lda	#mshowobj3>>16
	ldx	#mshowobj3&WM
	jsl	runmario_l

	a8
	pla
	clc
	adc	foxy_xa
	sta.l	m_rotx

	pla
	clc
	adc	foxy_ya
	sta.l	m_roty

	pla
	clc
	adc	foxy_za
	sta.l	m_rotz

	lda	#0
	sta.l	m_rotx+1
	sta.l	m_roty+1
	sta.l	m_rotz+1

	a16
	plp
	rts


;-------------------------------------------------

clearsprites_l
	php
	a8i16
	ldx	#128*4+128/4		; clear the buffer
lp2	stz	spriteblk,x
	dex
	bpl	lp2

	jsl	dma_sprites_L
	plp
	rtl

;-------------------------------------------------
dma_sprites_l
	php
	a8i16
	dmaoaram	0,0,spriteblk,512+128/4	; transfer oam
	plp
	rtl




;-------------------------------------------------


setcharmapfox_l
	php
	a8
	lda	#128
	sta	vmainc
	ai16
	lda	#vsc_base1+32*gameStRow		;128
	sta	vmaddl
	lda	#1024*pal3d
	ldy	#0
lolv
	pha
	lda	#gamenum_col*gamenum_row+(6<<10)
	rept	(32-gamenum_col)/2		;clear out borders
	sta	vmdatal
	endr
	pla

	ldx	#0
lolh	sta	vmdatal
	clc
	adc	#gamenum_row
	inx
	cpx	#gamenum_col
	bne	lolh

	pha
	lda	#gamenum_col*gamenum_row+(6<<10)
	rept	(32-gamenum_col)/2
	sta	vmdatal
	endr
	pla

	sec
	sbc	#gamenum_col*gamenum_row-1
	iny
	cpy	#gamenum_row
	bne	lolv
	plp
	rtl

;-------------------------------------------------

foxcursor equ	$3c

	spralc	; reset the sprmalc pointer
	spralc	spr_foxeye,14
	spralc	spr_foxarm,16
	spralc	spr_foxfoot,6
	spralc	spr_foxcursor,1

;-------------------------------------------------
fox_sprites_l
	php
	a8i16
	pha
	lda	stopcounting
	and	#15
	cmp	#1
	beq	skip1
	cmp	#2
	beq	skip1
	cmp	#3
	beq	skip1
	cmp	#4
	beq	skip1
	cmp	#8
	bpl	skip1
	pla
	lda	#179
	sta	spr_foxcursor+1
	lda	foxy_option
	bne	other
	lda	#45
	bra	con
other	lda	#93
con	sta	spr_foxcursor
	lda	#foxcursor+spradd
	sta	spr_foxcursor+2
	lda	#%110000
	sta	spr_foxcursor+3
	bra	nopla
skip1
	pla
nopla
	lda	foxy_frame
	a16
	and	#254
	cmp	#8
	bcc	ok1
	lda	#6
ok1
	tax
	lda.l	foxarmanim,x
	tax
	a8
	pha
	lda	stopcounting
	and	#15
	cmp	#1
	beq	skip2
	cmp	#2
	beq	skip2
	cmp	#3
	beq	skip2
	cmp	#4
	beq	skip2
	cmp	#8
	bpl	skip2
	pla
	ldy	#spr_foxarm
	jsr	copyfoxsprites
	bra	nopla2
skip2
	pla
nopla2
	lda	foxy_frame
	sec
	sbc	#8
	bmi	nodo
	a16
	and	#254
	cmp	#8
	bmi	ok2
	lda	#6
ok2
	tax
	lda.l	foxeyeanim,x
	tax
	a8
	lda	stopcounting
	and	#15
	cmp	#1
	beq	nodo
	cmp	#2
	beq	nodo
	cmp	#3
	beq	nodo
	cmp	#4
	beq	nodo
	cmp	#8
	bpl	nodo
	ldy	#spr_foxeye
	jsr	copyfoxsprites

nodo
	lda	foxy_foot
	a16
	and	#7
	asl	a
	tax
	lda.l	foxfootanim,x
	tax
	a8
	lda	stopcounting
	and	#15
	cmp	#1
	beq	skip3
	cmp	#2
	beq	skip3
	cmp	#3
	beq	skip3
	cmp	#4
	beq	skip3
	cmp	#8
	bpl	skip3
	ldy	#spr_foxfoot
	jsr	copyfoxsprites
skip3
	lda	foxy_foot
	and	#7
	beq	daijobu
	inc	foxy_foot
	bra	nornd
daijobu
	lda	foxy_foot
	bit	#128
	beq	.norm
	jsl	random_l
	and	#31
	bne	nornd
	lda	#129
	sta	foxy_foot
	bra	nornd
.norm
	jsl	random_l
	and	#127
	bne	nornd
	lda	foxy_foot
	clc
	adc	#8
	sta	foxy_foot
nornd


	plp
	rtl

;-------------------------------------------------
; copyfoxsprites:
;
; entry: x is a pointer to sprite list
;        y is a pointer to the sprite buffer
;-------------------------------------------------

foxsprites
fox_x	=	foxsprites
fox_y	=	foxsprites+1
fox_chr	=	foxsprites+2
fox_size	=	3

	longi
copyfoxsprites
	php
	a8
andagain
	lda.l	fox_x,x
	cmp	#-1
	beq	fin
	sta.w	0,y
	lda.l	fox_y,x
	sta.w	1,y
	lda.l	fox_chr,x
	sta.w	2,y
	lda	#%110000
	sta.w	3,y
	iny
	iny
	iny
	iny
	inx
	inx
	inx
	bra	andagain
fin
	plp
	rts


;-------------------------------------------------
;-------------------------------------------------
;-------------------------------------------------
; do animation for friends' text messages

; a = message to send
send_message_l
	php
	ai16
	and	#255
	dec	a
	cmp	#-1
	beq	.finished
	asl	a
	tax
	lda.l	messages,x
	tax
	a8
	lda.l	messages&~WM,x
	pha
	a16
	and	#127
	tay
	a8

	lda.w	friends_hp-1,y
	beq	.finished2

	lda	friends_meter
	inc	a
	bne	.nometer
	lda.w	friends_hp-1,y
	ora	#128
	sta	friends_meter
	bra	.meteron
	
.nometer	stz	friends_meter
.meteron
	pla
	sta	whichfriend

	inx
	lda.l	messages&~WM,x
	sta	friends_sound
	inx
	stx	friends_msg

	lda	#50
	sta	msg_count1
	stz	msg_count2
.finished
	plp
	rtl
.finished2
	pla
	plp
	rtl

openingframes	=	5

friends_messages_l
	php
	a8
	s_jmp_varAND	B,gameflags,#gf_playerdying!gf_playerdead,.finished

	lda	msg_count1
	lbeq	.closedown

	lda	msg_count2
	cmp	#openingframes
	lbcc	.openup

	jsl	random_l
	and	#31
	bne	.norm
	lda	#4
	bra	.doit
.norm
	and	#1
	sta	x1

	lda	msg_count1
	cmp	#30
	bcs	.normanim
	stz	x1
.normanim
	
	lda	whichfriend
	and	#127
	asl	a
	clc
	adc	#openingframes
	adc	x1
.doit
	jsr	displayface
	dec	msg_count1
	bne	.nosound
	trigse	$64
.nosound

; shadow
	lda	playertwoactivated
	beq	.normtxt
	
	ldx	friends_msg
	ai16
	lda	#83
	sta.l	m_x1
	lda	#160
	sta.l	m_y1
	txa
	sta.l	m_txtdata
	jsr	chkmeter
	a8
	lda	#msprintstr>>16
	ldx	#msprintstr&WM
	jsl	runmario_l

; real text
	ldx	friends_msg
	ai16
	lda	#82
	sta.l	m_x1
	lda	#159
	sta.l	m_y1
	txa
	sta.l	m_txtdata
	jsr	chkmeter
	a8
	lda	#mfprintstr>>16
	ldx	#mfprintstr&WM
	jsl	runmario_l
	bra	.donetxt
.normtxt
	ldx	friends_msg
	ai16
	lda	#83
	sta.l	m_x1
	lda	#148
	sta.l	m_y1
	txa
	sta.l	m_txtdata
	jsr	chkmeter
	a8
	lda	#msprintstr>>16
	ldx	#msprintstr&WM
	jsl	runmario_l

; real text
	ldx	friends_msg
	ai16
	lda	#82
	sta.l	m_x1
	lda	#147
	sta.l	m_y1
	txa
	sta.l	m_txtdata
	jsr	chkmeter
	a8
	lda	#mfprintstr>>16
	ldx	#mfprintstr&WM
	jsl	runmario_l
.donetxt


; display the hp meter?
	lda	friends_meter
	beq	.nothingdoing
	and	#127
	sta	x1
	lda	whichfriend
	a16
	and	#127
	tay
	a8
	lda.w	friends_hp-1,y
	cmp	x1
	beq	.same

	lda	x1
	dec	a
	ora	#128
	sta	friends_meter

.same	a16
	and	#127
	sta.l	m_z1
	lda	#82
	sta.l	m_x1

	lda	playertwoactivated
	beq	.normy
	lda	#172
	sta.l	m_y1
	bra	.doney
.normy
	lda	#156
	sta.l	m_y1
.doney
	call_mario	mshowteammate2
.nothingdoing
	a8

	bra	.finished
.closedown
	lda	msg_count2
	dec	a
	bmi	.finished
	sta	msg_count2
	jsr	displayface
	bra	.finished
.openup
	jsr	displayface
	inc	msg_count2
	lda	msg_count2
	cmp	#openingframes
	bcc	.finished
	lda	whichfriend
	and	#127
	asl	a
	asl	a
	clc
	adc	friends_sound
	a16
	and	#255
	tax
	a8
	lda.l	facesounds,x
	trigse	a

.finished
	plp
	rtl

chkmeter
	php
	a8
	IFEQ	JANGLISH
	lda	whichfriend
	bit	#128
	bne	.3lines
	ENDC
	and	#127
	cmp	#friend_andross
	beq	.3lines
	lda	friends_meter
	beq	notshowing
.3lines
	a16
	lda.l	m_y1
	sec
	sbc	#16
	sta.l	m_y1
notshowing
	plp
	rts
facesounds
	db	$60	; fox
	db	$60	; fox
	db	$60	; fox
	db	$60	; fox
	db	$7c	; rabbit help
	db	$7d	; rabbit down
	db	$62	; rabbit other
	db	$62	; rabbit
	db	$7a	; falcon help
	db	$7b	; falcon down
	db	$61	; falcon other
	db	$61	; falcon
	db	$7e	; frog help
	db	$7f	; frog down
	db	$63	; frog other
	db	$63	; frog
	db	$5f	; pepper
	db	$5f	; pepper
	db	$5f	; pepper
	db	$5f	; pepper
	db	$8c	; andross
	db	$8c	; andross
	db	$8c	; andross
	db	$8c	; andross

displayface
; a is frame to show
	php
	a16
	and	#255
	xba
	sta	x1
	lsr	x1	; *128
	asl	a	; *512
	adc	x1
	adc	#facedata&WM
	sta.l	m_faceptr
	lda	#6
	sta.l	m_bigx
	lda	playertwoactivated
	beq	normface
	lda	#18*8
	sta.l	m_bigy
	bra	doneface
normface
	lda	#16*8
	sta.l	m_bigy
doneface
	call_mario	mcopyface
	plp
	rts



;-------------------------------------------------
;-------------------------------------------------

foxanim	macro
foxx	=	\1
foxy	=	\2
	endm

foxspr	macro
	db	foxx+(\1)*8,foxy+(\2)*8
	db	\3+spradd
	endm

foxend	macro
	db	-1,-1
	endm


foxeyeanim
	dw	foxeyeanim1-foxsprites
	dw	foxeyeanim1-foxsprites
	dw	foxeyeanim2-foxsprites
	dw	foxeyeanim3-foxsprites
	dw	foxeyeanim2-foxsprites

foxarmanim
	dw	foxarmanim1-foxsprites
	dw	foxarmanim2-foxsprites
	dw	foxarmanim3-foxsprites
	dw	foxarmanim3-foxsprites
	dw	foxarmanim2-foxsprites


foxfootanim
	dw	foxfootanim1-foxsprites
	dw	foxfootanim2-foxsprites
	dw	foxfootanim3-foxsprites
	dw	foxfootanim2-foxsprites
	dw	foxfootanim1-foxsprites
	dw	foxfootanim2-foxsprites
	dw	foxfootanim3-foxsprites
	dw	foxfootanim2-foxsprites

foxeyeanim1
	foxanim	184,55
	foxspr	1,0,$00
	foxspr	2,0,$01
	foxspr	3,0,$02
	foxspr	4,0,$03
	foxspr	0,1,$04
	foxspr	1,1,$05
	foxspr	2,1,$06
	foxspr	3,1,$07
	foxspr	4,1,$08
	foxspr	0,2,$09
	foxspr	1,2,$0a
	foxspr	2,2,$0b
	foxspr	3,2,$0c
	foxspr	4,2,$0d
	foxend


foxeyeanim2
	foxanim	184,55
	foxspr	1,0,$00
	foxspr	2,0,$0e
	foxspr	3,0,$0f
	foxspr	4,0,$10
	foxspr	0,1,$04
	foxspr	1,1,$05
	foxspr	2,1,$11
	foxspr	3,1,$12
	foxspr	4,1,$08
	foxspr	0,2,$09
	foxspr	1,2,$0a
	foxspr	2,2,$13
	foxspr	3,2,$0c
	foxspr	4,2,$0d
	foxend

foxeyeanim3
	foxanim	184,55
	foxspr	1,0,$00
	foxspr	2,0,$01
	foxspr	3,0,$14
	foxspr	4,0,$15
	foxspr	0,1,$04
	foxspr	1,1,$05
	foxspr	2,1,$06
	foxspr	3,1,$07
	foxspr	4,1,$16
	foxspr	0,2,$09
	foxspr	1,2,$0a
	foxspr	2,2,$17
	foxspr	3,2,$0c
	foxspr	4,2,$0d
	foxend

foxarmanim1
	foxanim	176,80
	foxspr	2,0,$1a
	foxspr	1,1,$33
	foxspr	2,1,$1e
	foxspr	0,2,$34
	foxspr	1,2,$35
	foxspr	2,2,$36
	foxspr	0,3,$37
	foxspr	1,3,$38
	foxspr	2,3,$39
	foxspr	1,4,$3a
	foxspr	2,4,$3b
	foxspr	2,5,$31
	foxspr	10,17,$54
	foxspr	10,17,$54
	foxspr	10,17,$54
	foxspr	10,17,$54
	foxend

foxarmanim2
	foxanim	176,80
	foxspr	2,0,$1a
	foxspr	0,1,$28
	foxspr	1,1,$29
	foxspr	2,1,$1e
	foxspr	0,2,$2a
	foxspr	1,2,$2b
	foxspr	2,2,$2c
	foxspr	0,3,$2d
	foxspr	1,3,$2e
	foxspr	2,3,$2f
	foxspr	2,4,$30
	foxspr	2,5,$31
	foxspr	10,17,$60
	foxspr	10,17,$60
	foxspr	10,17,$60
	foxspr	10,17,$60
	foxend

foxarmanim3
	foxanim	168,80
	foxspr	0,0,$18
	foxspr	1,0,$19
	foxspr	3,0,$1a
	foxspr	0,1,$1b
	foxspr	1,1,$1c
	foxspr	2,1,$1d
	foxspr	3,1,$1e
	foxspr	0,2,$1f
	foxspr	1,2,$20
	foxspr	2,2,$21
	foxspr	3,2,$22
	foxspr	1,3,$23
	foxspr	2,3,$24
	foxspr	3,3,$25
	foxspr	3,4,$26
	foxspr	3,5,$27
	foxend


foxfootanim1
	foxanim	215,167
	foxspr	0,0,$3d
	foxspr	1,0,$3e
	foxspr	2,0,$3f
	foxspr	0,1,$40
	foxspr	1,1,$41
	foxspr	2,1,$42
	foxend

;	foxspr	2,0,$3d
;	foxspr	0,1,$3e
;	foxspr	1,1,$3f
;	foxspr	2,1,$40
;	foxspr	0,10,$60
;	foxspr	0,10,$60
;	foxend

foxfootanim2
	foxanim	215,167
	foxspr	0,0,$43
	foxspr	1,0,$44
	foxspr	2,0,$45
	foxspr	0,1,$46
	foxspr	1,1,$47
	foxspr	2,1,$48
	foxend

;	foxanim	184,151
;	foxspr	0,0,$41
;	foxspr	1,0,$42
;	foxspr	2,0,$3d
;	foxspr	0,1,$43
;	foxspr	1,1,$44
;	foxspr	2,1,$40
;	foxend

foxfootanim3
	foxanim	215,167
	foxspr	0,0,$49
	foxspr	1,0,$4a
	foxspr	2,0,$4b
	foxspr	0,1,$4c
	foxspr	1,1,$4d
	foxspr	2,1,$4e
	foxend

;	foxanim	184,151
;	foxspr	0,0,$45
;	foxspr	1,0,$46
;	foxspr	2,0,$3d
;	foxspr	0,1,$47
;	foxspr	1,1,$48
;	foxspr	2,1,$40
;	foxend


;specialmenuboot_l
;	init_bg	mode1
;	bg2chr	and
;	bg2scr	and
;	palette	2e
;	set_bg
;	jsl	specialmenu_l
;	rtl


checkgodmodecode
;-------God Mode Code
	php								;Push processor Status (?)			;---;			|
	phb								;Push data bank register (?)		;---;			|
	a8i16							;8 bit accumulator, 16 bit index	;---;			|
																		;---;
	lda	#$7e						;Load $7E bank						;---;	
	plb								;Pull data bank register			;---;
	lda	pweptemp
	and	#gm1
	cmp	#gm1
	beq	.gm2
	TESTKEYDOWN	A,cont0l
	lbne	.resetcombo
	TESTKEYDOWN	RIGHT
	lbne	.resetcombo
	TESTKEYDOWN	UP
	lbne	.resetcombo
	TESTKEYDOWN	LEFT
	lbne	.resetcombo
	TESTKEYDOWN	B
	lbne	.resetcombo

	TESTKEYDOWN	X,cont0l
	lbne	.resetcombo

	TESTKEYDOWN	DOWN
	lbeq	.npst

	lda	pweptemp
	ora	#gm1
	sta	pweptemp
	jmp			.npst
.gm2 ;(R Press Up)
	lda	pweptemp
	and	#gm2
	cmp	#gm2
	beq	.gm3
	TESTKEYDOWN	A,cont0l
	lbne	.resetcombo
	TESTKEYDOWN	LEFT
	lbne	.resetcombo
	TESTKEYDOWN	UP
	lbne	.resetcombo
	TESTKEYDOWN	B
	lbne	.resetcombo

	TESTKEYDOWN	X,cont0l
	lbne	.resetcombo

	TESTKEYDOWN	RIGHT
	lbeq	.npst

	lda	pweptemp
	ora	#gm2
	sta	pweptemp
	jmp			.npst

.gm3 ;(R Press Down)
	lda	pweptemp
	and	#gm3
	cmp	#gm3
	beq	.gm4
	TESTKEYDOWN	A,cont0l
	lbne	.resetcombo
	TESTKEYDOWN	UP
	lbne	.resetcombo
	TESTKEYDOWN	LEFT
	lbne	.resetcombo
	TESTKEYDOWN	B
	lbne	.resetcombo

	TESTKEYDOWN	X,cont0l
	lbne	.resetcombo

	TESTKEYDOWN	DOWN
	lbeq	.npst

	lda	pweptemp
	ora	#gm3
	sta	pweptemp
	jmp			.npst
.gm4 ;(R Press Down)
	lda	pweptemp
	and	#gm4
	cmp	#gm4
	beq	.gm5
	TESTKEYDOWN	A,cont0l
	lbne	.resetcombo
	TESTKEYDOWN	LEFT
	lbne	.resetcombo
	TESTKEYDOWN	UP
	lbne	.resetcombo
	TESTKEYDOWN	B
	lbne	.resetcombo

	TESTKEYDOWN	X,cont0l
	lbne	.resetcombo

	TESTKEYDOWN	RIGHT
	lbeq	.npst

	lda	pweptemp
	ora	#gm4
	sta	pweptemp
	jmp			.npst
.gm5 ;(R Press Left)
	lda	pweptemp
	and	#gm5
	cmp	#gm5
	beq	.gm6
	TESTKEYDOWN	A,cont0l
	lbne	.resetcombo
	TESTKEYDOWN	UP
	lbne	.resetcombo
	TESTKEYDOWN	DOWN
	lbne	.resetcombo
	TESTKEYDOWN	B
	lbne	.resetcombo

	TESTKEYDOWN	X,cont0l
	lbne	.resetcombo

	TESTKEYDOWN	LEFT
	lbeq	.npst

	lda	pweptemp
	ora	#gm5
	sta	pweptemp
	jmp			.npst
.gm6 ;(R Press Right)
	lda	pweptemp
	and	#gm6
	cmp	#gm6
	beq	.gm7
	TESTKEYDOWN	A,cont0l
	lbne	.resetcombo
	TESTKEYDOWN	RIGHT
	lbne	.resetcombo
	TESTKEYDOWN	DOWN
	lbne	.resetcombo
	TESTKEYDOWN	B
	lbne	.resetcombo

	TESTKEYDOWN	X,cont0l
	lbne	.resetcombo

	TESTKEYDOWN	UP
	lbeq	.npst

	lda	pweptemp
	ora	#gm6
	sta	pweptemp
	jmp			.npst
.gm7 ;(R Press Left)
	lda	pweptemp
	and	#gm7
	cmp	#gm7
	beq	.gm8
	TESTKEYDOWN	A,cont0l
	lbne	.resetcombo
	TESTKEYDOWN	RIGHT
	lbne	.resetcombo
	TESTKEYDOWN	DOWN
	lbne	.resetcombo
	TESTKEYDOWN	B
	lbne	.resetcombo

	TESTKEYDOWN	X,cont0l
	lbne	.resetcombo

	TESTKEYDOWN	LEFT
	lbeq	.npst

	lda	pweptemp
	ora	#gm7
	sta	pweptemp
	jmp			.npst
.gm8 ;(R Press Right)
	lda	strat_valid
	and	#gm8
	cmp	#gm8
	beq	.gm9
	TESTKEYDOWN	A,cont0l
	lbne	.resetcombo
	TESTKEYDOWN	RIGHT
	lbne	.resetcombo

	TESTKEYDOWN	DOWN
	lbne	.resetcombo
	TESTKEYDOWN	B
	lbne	.resetcombo

	TESTKEYDOWN	X,cont0l
	lbne	.resetcombo

	TESTKEYDOWN	UP
	lbeq	.npst

	lda	strat_valid
	ora	#gm8
	sta	strat_valid
	jmp			.npst
.gm9 ;(R Press B)
	lda	strat_valid
	and	#gm9
	cmp	#gm9
	beq	.gm10
	TESTKEYDOWN	A,cont0l
	lbne	.resetcombo
	TESTKEYDOWN	RIGHT
	lbne	.resetcombo
	TESTKEYDOWN	DOWN
	lbne	.resetcombo
	TESTKEYDOWN	LEFT
	lbne	.resetcombo

	TESTKEYDOWN	X,cont0l
	lbne	.resetcombo

	TESTKEYDOWN	B
	lbeq	.npst

	lda	strat_valid
	ora	#gm9
	sta	strat_valid
	jmp			.npst
.gm10 ;(R Press A)
	lda	strat_valid
	and	#gm10
	cmp	#gm10
	beq	.gm11
	TESTKEYDOWN	LEFT
	lbne	.resetcombo
	TESTKEYDOWN	RIGHT
	lbne	.resetcombo
	TESTKEYDOWN	UP
	lbne	.resetcombo
	TESTKEYDOWN	DOWN
	lbne	.resetcombo

	TESTKEYDOWN	X,cont0l
	lbne	.resetcombo

	TESTKEYDOWN	A,cont0l
	lbeq	.npst

	lda	strat_valid
	ora	#gm10
	sta	strat_valid
	jmp			.npst
.gm11 ;(R Press Start)
	lda	strat_valid
	and	#gm11
	cmp	#gm11
	beq	.gm12
	TESTKEYDOWN	RIGHT
	lbne	.resetcombo
	TESTKEYDOWN	UP
	lbne	.resetcombo
	TESTKEYDOWN	DOWN
	lbne	.resetcombo
	TESTKEYDOWN	LEFT
	lbne	.resetcombo

	TESTKEYDOWN	B
	lbne	.resetcombo
	TESTKEYDOWN	X,cont0l
	lbne	.resetcombo

	TESTKEYDOWN	START
	lbeq	.npst

	lda	strat_valid
	ora	#gm11
	sta	strat_valid
	lda	#1
	sta	godmode
	sta	secretgodmode
	trigse	88h
.gm12	
	bra	.noimdone20
.resetcombo
	lda	#0
	sta	strat_valid ;reset flags
	sta	pweptemp ;reset flags
.noimdone20
.npst
	settext	0,0
	a8

	plp
;	plb
	rts

do_bgm_generic_l
	jml	[textpt]


setdefaultpos
	a8
	lda	stopcounting
	and	#15
	cmp	#12
	beq	adjusted
	cmp	#10
	beq	adjusted
	cmp	#9
	beq	adjustedpregame
	cmp	#1
	beq	shipselectscreenx
	lda	#9*8+4
	bra	doneadjusting
shipselectscreenx
	lda	#13*8+4
	bra	doneadjusting
adjustedpregame
	lda	#21*8+4
	bra	doneadjusting
adjusted
	lda	#13*8+4
doneadjusting
	sta.l	m_vanishx
	
	lda	stopcounting
	and	#15
	cmp	#1
	beq	shipselectscreeny
	cmp	#9
	beq	adjustedy
	lda	#7*8+32+4
	bra	donewithy
shipselectscreeny
	lda	#9*8+32+4
	bra	donewithy
adjustedy
	lda	#17*8+32+4	
donewithy
	sta.l	m_vanishy
	rts


doanimation
	lda	gameframe
	sta.l	m_framenum
	sta.l	m_colframe
	rts

		





