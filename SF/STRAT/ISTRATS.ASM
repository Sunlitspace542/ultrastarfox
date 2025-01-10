;***************************************************************************
;*                              -----------                                *
;*                               Star Fox                                  *
;*                              -----------                                *
;*                                                                         *
;*                           SuperNES version.                             *
;*                                                                         *
;*                           Argonaut Software.      		               *	   
;*_________________________________________________________________________*
;*                                                                         *
;*   File: ISTRATS.ASM                                                     *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr: Definitions for istrats referenced in the maps                  *
;*_________________________________________________________________________*
;*                                                                         *
;*   Date: 6/24/92                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;* Author:   Dylan Cuthbert.                                               *
;*                                                                         *
;***************************************************************************


	IFND	real_istrats
real_istrats =	1
	ENDC

ci	=	0
cs	=	0

;---------------------------------------------------------------

def_istrat	MACRO

	IFNE	real_istrats
; table of istrats:

is_\1_istrat	equ	ci
	dw	\1_istrat&WM
	db	\1_istrat>>16

	IFEQ	NARG-1
	db	is_nullshape
sh_\1_istrat	=	is_nullshape
	ELSEIF
	db	is_\2
sh_\1_istrat	equ	is_\2
	ENDC


	IFNE	MAKE_SHAPE_REPORT
	FOPEN	+status.doc
	IFND	tmpfirst
tmpfirst
	printf	"[10]","***** STRATEGY NAME (_ISTRAT) ******** SHAPE NAME ****%n"
	ENDC
	printf	"[10]","* ","[31,.]\1"," * ","[16]\2"," *%n"
	FCLOSE
	ENDC

ci	=	ci+1
	IFEQ	ci-256
	fail	; oops .. too many Istrats defined
	ENDC

	ELSEIF
; symbols of istrats only:

is_\1_istrat	equ	ci
	IFEQ	NARG-1
sh_\1_istrat	=	is_nullshape
	ELSEIF
sh_\1_istrat	equ	is_\2
	ENDC

ci	=	ci+1

;;	printf	"is_\1_istrat%n"

	ENDC
	ENDM

;---------------------------------------------------------------

def_shape	MACRO
	IFNE	real_istrats
; real shapes:
is_\1	equ	cs
	dw	\1&WM
cs	=	cs+1
	IFEQ	cs-256
	fail	; oops .. too many shapes defined
	ENDC

	ELSEIF
; symbols only:

is_\1	equ	cs
cs	=	cs+1

	ENDC
	ENDM

;---------------------------------------------------------------


	IFNE	real_istrats
	public	shapes
shapes
	ELSEIF
	extern	shapes
	ENDC

	def_shape	nullshape
;	def_shape	pcolb
;	def_shape	pcollw
;	def_shape	pcolrw
	def_shape	exitlight
	def_shape	myship_4
;	def_shape	beambox
	def_shape	iris
	def_shape	truck
	def_shape	rail_4
	def_shape	m_tank
	def_shape	gate_0
	def_shape	miss_1_2
	def_shape	kamikaze
;	def_shape	tunnel1
;	def_shape	tunnel2
;	def_shape	tunnel3
	def_shape	largeplasma
	def_shape	flingboss
	def_shape	shark
;	def_shape	swing
	def_shape	d_head_0
	def_shape	d_body_0
	def_shape	cameleon
	def_shape	beeanim
	def_shape	round_0
	def_shape	big_m
	def_shape	boss_1_2
	def_shape	ship_1
	def_shape	ship_3
	def_shape	ship_0_c
	def_shape	Sship_0_c
	def_shape	wall1
	def_shape	wall2
	def_shape	walker_0
;	def_shape	floor1
;	def_shape	sfloor1
	def_shape	pillar3
	def_shape	Mwireexit
	def_shape	Lwireexit
	def_shape	Bltunnelface
	def_shape	sea_0_0
	def_shape	exit_1
	def_shape	Lblackface
	def_shape	Lcube
	def_shape	rail_0
	def_shape	miss_1_1
	def_shape	exitface
	def_shape	mexitface
	def_shape	bshipexitface
	def_shape	ship3exitface
	def_shape	pillar2
	def_shape	spillar2
;	def_shape	floor2
	def_shape	boss_8_5
	def_shape	hou_4
	def_shape	boss_8_4
	def_shape	boss_8_0
	def_shape	wire_man
	def_shape	bom_wing
	def_shape	w_l
;	def_shape	rip_man
	def_shape	rader_0
	def_shape	rader_1
	def_shape	zaco_6
	def_shape	zaco_5
	def_shape	houdai_0
	def_shape	boss_7_1
	def_shape	boss_A_1
	def_shape	boss_A_2
	def_shape	tower_2
	def_shape	para_0
	def_shape	bu_0
	def_shape	bu_1
	def_shape	bu_2
	def_shape	bu_3
	def_shape	bu_4
	def_shape	bu_5
	def_shape	bu_6
	def_shape	bu_7
	def_shape	bu_8
	def_shape	boss_2_2
	def_shape	core_1_0
	def_shape	core_1_1
	def_shape	exit_2
	def_shape	bMtunnelface
	def_shape	Mblackface
	def_shape	boss_b_0
	def_shape	boss_b_1
	def_shape	boss_d_1
	def_shape	boss_9_5
	def_shape	air_1
	def_shape	line_2
	def_shape	boss_f_3
	def_shape	tunnel_8
	def_shape	tunnel_6
	def_shape	boss_0_1
	def_shape	door_1	
	def_shape	wall_0
	def_shape	wall_1
	def_shape	wall_2
	def_shape	wall_3
	def_shape	wall_4
	def_shape	wall_5
	def_shape	wall_6
	def_shape	wall_7
	def_shape	boss_f_4
	def_shape	r_bu_0
	def_shape	r_bu_1
	def_shape	r_bu_2
	def_shape	r_bu_3
	def_shape	r_bu_4
	def_shape	r_bu_5
	def_shape	r_bu_6
	def_shape	r_bu_7
	def_shape	amoeba2
	def_shape	zaco_8
	def_shape	zaco_4
	def_shape	ship_5
	def_shape	ship_5L
	def_shape	ship_5M
	def_shape	ship_5S
	def_shape	ships
	def_shape	s_door_1  
	def_shape	s_door_2
	def_shape	leng_0
;	def_shape	leng_1
	def_shape	carrier
	def_shape	base_0
	def_shape	kellogs
	def_shape	k_door
	def_shape	kichi_3
	def_shape	kichi_0
	def_shape	boss_g_0
;	def_shape	tsu_0
	def_shape	tunnel_0
	def_shape	tunnel_4
	def_shape	tunnel_7
	def_shape	mybase_1
	def_shape	ship_s_0
	def_shape	ship_s_1
	def_shape	ship_4
;	def_shape	crane_0	
;	def_shape	catapult
	def_shape	zaco_7
	def_shape	warker_3
	def_shape	heli
;	def_shape	ro_0
;	def_shape	ro_1
;	def_shape	ro_2
;	def_shape	ro_3
;	def_shape	ro_4
;	def_shape	ro_5
	def_shape	bazooka
	def_shape	uper_m
	def_shape	warp
	def_shape	tank_2
	def_shape	f_dragon
	def_shape	Xwirespacebar
	def_shape	XPwirespacebar
	def_shape	SXPwirespacebar
	def_shape	Ywirespacebar
	def_shape	Zwirespacebar
	def_shape	SXwirespacebar
	def_shape	SYwirespacebar
	def_shape	SZwirespacebar

	def_shape	Xsolidspacebar
	def_shape	XPsolidspacebar
	def_shape	SXPsolidspacebar
	def_shape	Ysolidspacebar
	def_shape	Zsolidspacebar
	def_shape	SXsolidspacebar
	def_shape	SYsolidspacebar
	def_shape	SZsolidspacebar

	def_shape	colony_0
	def_shape	colony_1
	def_shape	colony_2
	def_shape	colony3L
	def_shape	colony3R
	def_shape	Bwarker_3
	
	def_shape	item_5
	def_shape	item_6
	def_shape	item_7
	def_shape	r_hou_0
	def_shape	s_hou_0
	def_shape	b_hou_0
	
	def_shape	walker_2

	def_shape	base_0_0
	def_shape	base_0_1
	def_shape	tank_1
	def_shape	hou_5
	def_shape	ro_0
	def_shape	ro_1
	def_shape	ro_2
	def_shape	ro_3
	def_shape	ro_4
	def_shape	ro_5
	def_shape	ro_6
	def_shape	bro_0
	def_shape	bro_1
	def_shape	bro_2
	def_shape	bro_3
	def_shape	bro_4
	def_shape	bro_5
	def_shape	bro_6
	def_shape	gro_0
	def_shape	gro_1
	def_shape	gro_2
	def_shape	gro_3
	def_shape	gro_4
	def_shape	gro_5
	def_shape	gro_6
	def_shape	volcano
	def_shape	Svolcano
	def_shape	meteo_0
	def_shape	blackhole
	def_shape	asteroid2
	def_shape	b_holl
	def_shape	car_0
	def_shape	clisla_m
	def_shape	clisla_s
	def_shape	clisla_l
	def_shape	snake_1
	def_shape	zaco_b
	def_shape	shieldr
	def_shape	ray_0
	def_shape	ray_1
	def_shape	boss_e_4
	def_shape	flower_1
	def_shape	flower_2
	def_shape	stalk
	def_shape	mine_2
	def_shape	gate_2
	def_shape	s_fish
	def_shape	last_b_0
	def_shape	last_b_2
	def_shape	last_b_3
	def_shape	door_l
	def_shape	car_1

	def_shape	zaco_a
	def_shape	friendship_4
	def_shape	s_wark_0
	def_shape	ika
	def_shape	s_zaco_0
	def_shape	bazz_1

	def_shape	face_b
	def_shape	my_demoS
	def_shape	my_demo

	def_shape	helpball
	def_shape	tadpole
	def_shape	arch_0
	def_shape	s_tank_0
	def_shape	zaco_1
	def_shape	bzaco_8
	
	def_shape	base_1
	def_shape	big_gate
	def_shape	r_hou
	def_shape	open_l
	
	def_shape	up_door
	def_shape	big_meteor
	def_shape	boss_d_4

;	def_shape	pipe_0
;	def_shape	pipe_1
;	def_shape	pipe_2
;	def_shape	pipe_3
;	def_shape	pipe_4
;	def_shape	pipe_5
;	def_shape	pipe_6
	def_shape	btank_1

	def_shape	font_t
	def_shape	font_h
	def_shape	font_e
	def_shape	font_n
	def_shape	font_d

	def_shape	gamesh
	def_shape	oversh
	def_shape	tow_0
	def_shape	bou_0

	IFNE	real_istrats
	public	istrats
istrats
	ELSEIF
	extern	istrats
	ENDC

	def_istrat	player
;	def_istrat	pbody,pcolB
;	def_istrat	plwing,pcolLW
;	def_istrat	prwing,pcolRW
	def_istrat	pbody,nullshape
	def_istrat	plwing,nullshape
	def_istrat	prwing,nullshape
	def_istrat	exitlight3,exitlight
	def_istrat	exitlight4,exitlight
	def_istrat	exitlight5,exitlight
	def_istrat	exitlight6,exitlight
	def_istrat	stayrel
	def_istrat	staydist
	def_istrat	nocoll
	def_istrat	gnd
	def_istrat	exit
	def_istrat	exitopen,exitface
	def_istrat	exitopensnd,exitface
	def_istrat	clshipGNDa,myship_4
	def_istrat	clshipGNDb,myship_4
	def_istrat	clshipGNDc,myship_4
	def_istrat	clshipWARPa,myship_4
	def_istrat	clshipWARPb,myship_4
	def_istrat	clshipWARPc,myship_4
	def_istrat	clshipSHIPa,myship_4
	def_istrat	clshipSHIPb,myship_4
	def_istrat	clshipSHIPc,myship_4
	def_istrat	clshipEARTHa,myship_4
	def_istrat	clshipEARTHb,myship_4
	def_istrat	clshipEARTHc,myship_4
	def_istrat	clshipTURNa,myship_4
	def_istrat	clshipTURNb,myship_4
	def_istrat	clshipTURNc,myship_4
	def_istrat	clshipBRIDGEa,myship_4
	def_istrat	clshipBRIDGEb,myship_4
	def_istrat	clshipBRIDGEc,myship_4
	def_istrat	clshipCHASEa,myship_4
	def_istrat	clshipCHASEb,myship_4
	def_istrat	clshipCHASEc,myship_4
	def_istrat	clshipDIVEa,myship_4
	def_istrat	clshipDIVEb,myship_4
	def_istrat	clshipDIVEc,myship_4
	def_istrat	clshipUNDERa,myship_4
	def_istrat	clshipUNDERb,myship_4
	def_istrat	clshipUNDERc,myship_4
	def_istrat	clship1,myship_4
	def_istrat	clship2,myship_4
	def_istrat	clship3,myship_4
	def_istrat	playerwarp
;	def_istrat	friendstart1,myship_4
	def_istrat	fastfighter1,zaco_5
;	def_istrat	friendf1,myship_4
;	def_istrat	friendf2,myship_4
;	def_istrat	beambox,beambox
	def_istrat	iris,iris
	def_istrat	truck,truck
	def_istrat	trackcorner,rail_4
	def_istrat	misstank,m_tank
	def_istrat	wormhead,d_head_0
	def_istrat	gate,gate_0
	def_istrat	woods,miss_1_2
	def_istrat	kami,kamikaze
	def_istrat	sokuten,flingboss
;	def_istrat	tunnel,tunnel1
	def_istrat	largeplasma,largeplasma
	def_istrat	flingboss,flingboss
	def_istrat	deadflingboss,flingboss
	def_istrat	shark,shark
;	def_istrat	swing,swing
	def_istrat	worm,d_body_0
	def_istrat	worm2,d_body_0
	def_istrat	cameleon,cameleon
	def_istrat	cameleon2,cameleon
	def_istrat	bee1,beeanim
	def_istrat	fighter,zaco_5
	def_istrat	windmill,round_0
	def_istrat	misspod,big_m
	def_istrat	boss1,boss_1_2
	def_istrat	ship1a,ship_1
	def_istrat	ship2,ship_3
	def_istrat	ship3,ship_0_c
	def_istrat	ship3a,Sship_0_c
	def_istrat	flypillars,pillar3
	def_istrat	wallleftright,wall1
	def_istrat	walll,wall2
	def_istrat	wallr,wall2
	def_istrat	walking,walker_0
;	def_istrat	floor1,floor1
	def_istrat	pillar3,pillar3
	def_istrat	torpedo
	def_istrat	seamon,sea_0_0
	def_Istrat	nucleusbeamL,boss_8_5
	def_Istrat	boss8shrap
	def_Istrat	boss8,boss_8_0
	def_Istrat	bossA,boss_a_2
	def_Istrat	nucleuslauncher,hou_4
	def_Istrat	nucleuspillar,boss_8_4
	def_Istrat	wireman,wire_man
	def_Istrat	bomwing,bom_wing
	def_Istrat	up1man
	def_Istrat	winglazerman,w_l
;	def_Istrat	ripman,rip_man
	def_Istrat	rader0,rader_0
	def_Istrat	rader1,rader_1
	def_Istrat	zacos,zaco_6
	def_Istrat	zaco1L,zaco_5
	def_Istrat	zaco1R,zaco_5
	def_Istrat	houdai,houdai_0
	def_Istrat	houdaiNS,houdai_0
	def_Istrat	boss7,boss_7_1
	def_Istrat	zaco3,kamikaze
	def_Istrat	tower0,tower_2
	def_Istrat	zaco0
	def_Istrat	zaco4
	def_Istrat	hardenemy1
	def_Istrat	hard180YR
	def_Istrat	hard180YRNZR
	def_Istrat	para,para_0
	def_Istrat	boss2,boss_2_2
	def_Istrat	friend1,myship_4
	def_Istrat	friend2,myship_4
	def_Istrat	core1,core_1_1
	def_Istrat	core0,core_1_0
	def_Istrat	fzaco			,zaco_5
	def_Istrat	friend0,myship_4
	def_Istrat	bossB,boss_b_1
	def_Istrat	bossf,boss_f_3
	def_istrat	chicken,boss_d_1
	def_Istrat	bossBrob,boss_b_1
	def_istrat	madbiker,air_1
	def_istrat	madtrucker,boss_9_5
	def_istrat	roadline,line_2
	def_istrat	intro1pfall,tunnel_8
;	def_istrat	tunnel6,tunnel_6
	def_istrat	webmonster,boss_0_1
	def_istrat	castanet
	def_istrat	door1,door_1
;	def_istrat	zaco5again,zaco_5
	def_istrat	airship,boss_f_4
	def_istrat	hard90yr
	def_Istrat	amoeba
	def_Istrat	szaco2,zaco_8
	def_Istrat	szaco0,zaco_4
	def_Istrat	cruiser2fire,ship_5
	def_Istrat	cruiser2,ship_5
	def_istrat	ships,ships
	def_istrat	sdoor1,s_door_1  
	def_istrat	sdoor2,s_door_2
	def_istrat	leng0,leng_0
	def_istrat	stayrelhard180yr
	def_istrat	base0,base_0
	def_istrat	carrier,carrier
	def_istrat	kdoor,k_door
	def_istrat	kichi2,kichi_3
	def_istrat	kdoor2,k_door
	def_istrat	massivebase,kichi_0
	def_istrat	bossg,boss_g_0
;	def_istrat	tsumami,tsu_0
	def_istrat	topright1,tunnel_0
	def_istrat	topleft1,tunnel_0
	def_istrat	botright1,tunnel_0
	def_istrat	botleft1,tunnel_0
	def_istrat	rightwall,tunnel_4
	def_istrat	leftwall,tunnel_4
	def_istrat	duct,tunnel_7
	def_Istrat	friendexitbase,myship_4
;	def_Istrat	friendstart2,myship_4
	def_Istrat	cruiser1,ship_4	
	def_Istrat	cruiser1F,ship_4	
;	def_Istrat	crane0,crane_0	
	def_Istrat	warker3,warker_3
	def_Istrat	szaco5,zaco_7
	def_istrat	path
	def_Istrat	bazookaL,bazooka
	def_Istrat	bazookaR,bazooka
	def_Istrat	uperM,uper_M	
	def_Istrat	warp,warp
	def_Istrat	tank2,tank_2
	def_Istrat	tzaco7cat,zaco_7
	def_Istrat	twall0,wall_0
	def_Istrat	dragonfly,f_dragon
	def_Istrat	spacebar,XPsolidspacebar
	def_Istrat	SPINspacebar,XPsolidspacebar
	def_Istrat	spacebar1,XPsolidspacebar
	def_Istrat	spacebar3,XPsolidspacebar
	def_Istrat	colony0,colony_0
	def_Istrat	colony1,colony_1
	def_Istrat	colony2,colony_2
	def_Istrat	spacebarwalker,Bwarker_3
	def_Istrat	spacebarshoot,XPsolidspacebar
	def_Istrat	item5,item_5
	def_Istrat	item6,item_6	
	def_Istrat	item7,item_7
	def_Istrat	shou0,s_hou_0
	def_Istrat	shou0a,r_hou_0
	def_Istrat	walker2,walker_2
	def_Istrat	hard180YRfog
	def_istrat	base1

	def_istrat	hard90yrfog
	def_istrat	tank1a,tank_1
	def_istrat	tank0,tank_1
	def_istrat	tank1,tank_1
	def_istrat	tank3,tank_1
	def_istrat	houdai5f,hou_5
	def_istrat	houdai5,hou_5
	def_istrat	pillar3f,pillar3
	def_Istrat	particlefire
	def_Istrat	volcano,volcano
	def_istrat	rockhard
	def_Istrat	firepillar,Svolcano
	def_Istrat	meteo0,meteo_0
	def_Istrat	blackhole,asteroid2
	def_istrat	seadragon2,snake_1
	def_istrat	lochnessmonster,nullshape

	def_Istrat	aircar1,car_0
	def_Istrat	aircar2,car_0
	def_Istrat	aircar3,car_0
	def_Istrat	aircar4,car_0
	def_Istrat	aircar5,car_0

	def_Istrat	tree1,stalk
	def_Istrat	tree2,stalk
	def_istrat	tree3
	def_Istrat	mine2,mine_2
	
	def_Istrat	gate2,gate_2
	def_Istrat	sfish,s_fish
	def_Istrat	hardRot,nullshape
	def_Istrat	lastb2,last_b_2
	def_Istrat	lastb3,last_b_3
	def_Istrat	lastb4,door_l
	def_Istrat	truck1,car_1
	def_Istrat	truck2,car_1
	def_Istrat	monolith,face_b
	def_Istrat	lseqdoor1,door_l
	def_Istrat	lseqdoor2,last_b_3

	def_Istrat   pshipoutofLB1,my_demoS
	def_istrat   viewoutofLB1,nullshape
	def_istrat   nocollanim0,nullshape

	def_Istrat   pshipoutofLB3,my_demo
	def_istrat   viewoutofLB3,nullshape
	def_Istrat   shipoutofLB3,my_demo

	def_Istrat   helpball,helpball

	def_Istrat	hard,nullshape
	
	def_Istrat	saucer,carrier
	def_Istrat	tadpole,tadpole

	def_Istrat	patht,nullshape

	def_Istrat	base_1,base_1
	def_Istrat	exitopensnd2,nullshape
	def_Istrat	openlr,open_l
	def_Istrat	updoor,up_door
	def_istrat	big_meteor,big_meteor

	def_istrat	break_meteor,asteroid2

	def_Istrat	colonyexit,nullshape
	def_Istrat	ship0cdown,Sship_0_c

	def_istrat	break_meteort,asteroid2
	def_Istrat	shipintro,myship_4
	def_istrat	boss7intro,boss_7_1
	def_istrat	skillfly,nullshape

	def_istrat	tit,my_demo

	def_istrat	pathdha,nullshape

	def_istrat	bholeexit1,gate_0
	def_istrat	bholeexit2,gate_0
	def_istrat	bholeexit3,gate_0

	IFNE	real_istrats

	IFNE	MAKE_SHAPE_REPORT
	FOPEN	+status.doc
	PRINTF	"[10]","[54,*]","%n"
	FCLOSE
	ENDC

	ENDC


number_of_map_istrats	=	ci
;	?number_of_map_istrats

number_of_map_shapes	=	cs
;	?number_of_map_shapes








