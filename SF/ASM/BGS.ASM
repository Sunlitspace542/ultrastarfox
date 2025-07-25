;***************************************************************************
;*                                                                         *
;*                               Star Fox                                  *
;*                              -----------                                *
;*                                                                         *
;*                           SuperNES version.                             *
;*                                                                         *
;*                                                                         *
;*                           Argonaut Software.      		               *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   File: BGS.ASM                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr: Definitions for level backgrounds.                              *
;*_________________________________________________________________________*
;*                                                                         *
;*   Date: 5/5/92                                                          *
;*_________________________________________________________________________*
;*                                                                         *
;* Author:                                                                 *
;*   Krister Wombell, Dylan Cuthbert                                       *
;*                                                                         *
;***************************************************************************

	INCPUBLICS	EXT\bgs.ext

******************************************************
**
** Screen set up code
**


if_vofson	equ	1
if_hofson	equ	2
if_zroton	equ	4
if_ground	equ	8
if_space	equ	16
if_snow	equ	32
if_pollen	equ	64

	shorta
	longi

;---------------------------------------------------------------

bg_hole_1	init_bg	mode2
	bg2chr	bhole
	bg2scr	bhole
	palette	2d
	set_bg
	info	hon,voff,zon,space
	pstrat	playerspaceflyin,a,abc
	bg2Yscroll	0
	hofmode	bhole
	a16
	lda	#0
	sta.l	testk2
	lda	#bholelimit
	sta.l	testk3
	lda	#1
	sta.l	testk4
	a8
	bgm	bhole
	IFNE	MSU1
	msuplay	levelblackhole,repeat
	lda	#msu_orch
	sta	orchorband
	ENDC
	space	night

bg_1_1i_1	init_bg	mode2
	bg2chr	b
	bg2scr	b
	palette	2b
	set_bg
	info	hon,voff,zoff,nodots
	pstrat	playeropening,a,ab
	hofmode	tunnel3
	set_zdepthtable	tunnel
	bgm	10
	IFNE	MSU1
	msuplay	scramble,repeat
	ENDC
	lda	#0
	sta.l	m_meters
	shadowheight 0
	tunnel	night

bg_1_1a_1	blink

bg_1_1b_1	blink

bg_1_1c_1	init_bg	mode2		;what I see from the tunnel
	bg2chr	stp
	bg2scr	stp
	palette	2d
	gamepal	blue
	set_bg
	set_zdepthtable	stage1
	info	hon,von,zon,ground	;what I see from the ground
	hofmode	rotate
	shadowheight 0
	bg2Yscroll	232
	bgm	11
	IFNE	MSU1
	msuplay	level1_1,repeat
	lda	#msu_band
	sta	orchorband
	ENDC
	lda	#1
	sta.l	m_meters
	planet	night

bg_3_1c_1	init_bg	mode2		;what I see from the tunnel
	bg2chr	stp
	bg2scr	stp
	palette	2g
	gamepal	red
	set_bg
	set_zdepthtable	stage1
	info	hon,von,zon,ground	;what I see from the ground
	hofmode	rotate
	shadowheight 0
	bg2Yscroll	232
	bgm	11
	IFNE	MSU1
	msuplay	level1_1,repeat
	lda	#msu_band
	sta	orchorband
	ENDC
	lda	#1
	sta.l	m_meters
	planet	red

bg_training_1	init_bg	mode2
	bg2chr	stp
	bg2scr	stp
	palette	2d
	gamepal	blue
	set_bg
	pstrat	playeronplanet,a,ab
	set_zdepthtable	stage1
	info	hon,von,zon,ground	;what I see from the ground
	hofmode	rotate
	shadowheight 0
	bg2Yscroll	232
	bgm	training
	IFNE	MSU1
	msuplay trainingmode,repeat
	lda	#msu_band
	sta	orchorband
	ENDC
	planet	night

bg_1_2_1	init_bg	mode2
	bg2chr	stars
	bg2scr	stars
	palette	stars
	set_bg
	info	von,hon,zon,space
	pstrat	playerinsidespaceflyin,b,abc
	bgm	12
	IFNE	MSU1
	msuplay	level1_2,repeat
	lda	#msu_orch
	sta	orchorband
	ENDC
	hofmode	rotate
	bg2Yscroll	232
	space	night

bg_special_1	init_bg	mode2
	bg2chr	m
	bg2scr	m
	palette	space
	set_bg
	info	von,hon,zon,space
	pstrat	playerinsidespaceflyin,b,abc
	bgm	special
	IFNE	MSU1
	msuplay	levelootd,repeat
	lda	#msu_orch
	sta	orchorband
	ENDC
	hofmode	bhole
	a16
	lda	#0
	sta.l	testk2
	lda	#bholelimit
	sta.l	testk3
	lda	#1
	sta.l	testk4
	a8
	bg2Yscroll	-64
	space	night


bg_1_3i_1	init_bg	mode2
	bg2chr	34
	bg2scr	34
	palette	space
	set_bg
	info	von,hon,zon,space
	pstrat	playerwarpout,a,ab
	hofmode	rotate
	bg2Yscroll	232
	bgm	13
	IFNE	MSU1
	lda	#msu_orch
	sta	orchorband
; nasty hack to make the hyperjump exit music work,
; and have restarts play the correct stage theme
	lda	bgflags
	bit	#bgf_restart
	bne	.level13ok
	msuplay	exithyperspace,repeat
	bra	.donelevel13
.level13ok
	msuplay	level1_3,repeat
.donelevel13
	ENDC
	space	night

bg_1_3a_1	init_bg	mode2
	bg2chr	34
	bg2scr	34
	palette	space
	set_bg
	info	von,hon,zon,space
	pstrat	playerinspace,a,abc
	hofmode	rotate
	bg2Yscroll	232
	bgmrestart	13b
	IFNE	MSU1
	msubgmrestart	level1_3,repeat
	ENDC
	space	night

bg_1_3b_1	init_bg	mode1
	bg2chr	tsp
	bg2scr	tsp
	palette	tm3
	set_bg
	info	hon,voff,zoff,nodots
	pstrat	playerinmtunnel,a,ab
	hofmode	tunnel3
	shadowheight 0
	bgmrestart	13b
	IFNE	MSU1
	msubgmrestart	level1_3,repeat
	ENDC
	tunnel	night

bg_1_3c_1	init_bg	mode2
	bg2chr	34
	bg2scr	34
	palette	space
	set_bg
	info	von,hon,zon,space
	pstrat	playerinspace,a,abc
	bgmrestart	13b
	IFNE	MSU1
	msubgmrestart	level1_3,repeat
	ENDC
	hofmode	rotate
	bg2Yscroll	232
	space	night
	
bg_1_3d_1	init_bg	mode2
	bg2chr	13b
	bg2scr	13b,vsc_base2+2*k,4*k
	palette	2b
	set_bg
	info	voff,hon,zoff,nodots
	pstrat	playerinnucleus
	hofmode	nograd
	bg2Yscroll	264
	shadowheight nucleusheight
	nucleus	night

bg_1_3da_1	init_bg	mode2
	bg2chr	13b
	bg2scr	13b,vsc_base2+2*k,4*k
	palette	2b
	set_bg
	info	von,hon,zon,nodots
	pstrat	playerwashent
	hofmode	nograd
	bg2Yscroll	248		264
	shadowheight nucleusheight
	nucleus	night

bg_1_3e_1	init_bg	mode2
	bg2chr	space
	bg2scr	13
	palette	space
	set_bg
	info	von,hon,zon,space
	pstrat	playerclearship2
	hofmode	rotate
	bg2Yscroll	232
	space	night

bg_1_4_1	init_bg	mode2
	bg2chr	14
	bg2scr	14
	palette	light
	set_bg
	info	von,hon,zon,ground
	pstrat	playerplanetflyin,b,ab
	hofmode	rotate
	bg2Yscroll	232
	shadowheight 0
	bgm	14
	IFNE	MSU1
	msuplay	level1_4,repeat
	lda	#msu_band
	sta	orchorband
	ENDC
	set_zdepthtable	mist
	planet	night

bg_1_4b_1	set_zdepthtable	normal
	gamepal	red
	shadowheight 0
	setdepth red
	rtl


bg_1_5_1	init_bg	mode2
	bg2chr	lsb
	bg2scr	lsb
	palette	2c
	set_bg
	info	hon,von,zon,space
	pstrat	playerinsidespaceflyin,b,abc
	hofmode	rotate
	scrollbg	164
	bgm	15
	IFNE	MSU1
	msuplay	level1_2,repeat
	lda	#msu_orch
	sta	orchorband
	ENDC
	space	night

bg_1_6a_1	init_bg	mode2
	bg2chr	f1
	bg2scr	f1
	palette	2a
	gamepal	red
	set_bg
	info	hon,von,zon,ground
	pstrat	playerdivegnd,a,ab
	hofmode	rotate
	bg2Yscroll	232
	bgm	16
	IFNE	MSU1
	msuplay	level1_6,repeat
	lda	#msu_orch
	sta	orchorband
	ENDC
	shadowheight 0
	flashbg
	planet	night


bg_1_6b_1	jsl	bg16b26c
	startbgm	$12
	pstrat	playernull,a,ab
	tunnel	red

bg16b26c	init_bg	mode1
	bg2chr	tst
	bg2scr	tst
	palette	tm3
	gamepal	red
	set_bg
	info	hon,voff,zoff,nodots
	shadowheight 0
	hofmode	tunnel3
	rtl

bg_1_6c_1	init_bg	mode2
	bg2chr	bhole
	bg2scr	last
	palette	2f
	gamepal	red
	set_bg
	info	hon,voff,zon,nodots
	pstrat	playerinLTexit,a,ab
	hofmode	bhole
	bg2Yscroll	0
	a16
	lda	#0
	sta.l	testk2
	lda	#bholelimit
	sta.l	testk3
	lda	#1
	sta.l	testk4
	a8
	final	night


bg_1_7a_1	init_bg	mode1
	bg2chr	tst
	bg2scr	tst
	palette	tm3
	gamepal	red
	set_bg
	info	hon,voff,zoff,nodots
	pstrat	playerOutofLB1,a,ab
	hofmode	tunnel3
	shadowheight 0
	set_zdepthtable	normal
	tunnel	marine

bg_1_7b_1	init_bg	mode2
	bg2chr	f1
	bg2scr	f1
	palette	2a
	gamepal	red
	set_bg
	info	hon,von,zon,ground
	pstrat	playerOutofLB2,a,ab
	hofmode	rotate
	shadowheight 0
	bg2Yscroll	224		232-32
	planet	night

bg_1_7c_1	init_bg	mode2
	bg2chr	lsb
	bg2scr	lsb
	palette	2c
	set_bg
	info	hon,von,zon,space
	pstrat	playerOutofLB3,a,ab
	hofmode	rotate
	shadowheight 0
	bg2Yscroll	232-60
	bgm	endseq
	IFNE	MSU1
	msuplay	gameenddemo,repeat
	ENDC
	space	night


bg_2_2_1	init_bg	mode2
	bg2chr	22
	bg2scr	22
	palette	space
	set_bg
	info	von,hon,zon,space
	pstrat	playerinsidespaceflyin,b,abc
	hofmode	rotate
	bg2Yscroll	232
	bgm	22
	IFNE	MSU1
	msuplay	level2_2,repeat
	lda	#msu_orch
	sta	orchorband
	ENDC
	space	night

bg_2_3a_1	init_bg	mode2
	bg2chr	23
	bg2scr	23
	palette	2a
	set_bg
	gamepal	blue
	info	von,hon,zon,snow
	pstrat	playeronplanet,a,ab
	bgm	23
	IFNE	MSU1
	msuplay	level2_3,repeat
	lda	#msu_orch
	sta	orchorband
	ENDC
	bg2Yscroll	232
	set_zdepthtable	mist
	shadowheight 0
	hofmode	rotate
	planet	mist

bg_2_3a_2	set_zdepthtable	normal
	shadowheight 0
	setdepth	night
	rtl

	
bg_2_3b_1	init_bg	mode1
	bg3chr	23b,24*k,2*k
	bg3scr	23h,25*k,2*k
	set_bg3
	waittrans

	bg2chr	bm,vchr_logback,$40*32
	bg2scr	23b
	palette	bm
	set_bg

	lda	#(25*k)>>8
	sta	bg3sc
	lda	#(24*k)>>12
	sta	bg34nba

	setbg3vofs	24
	info	hon,voff,zoff,nodots
	pstrat	playeronbridge,a,ab
	hofmode	water
	shadowheight 0
	water	marine

bg_2_3c_1	init_bg	mode2
	bg2chr	tsp
	bg2scr	tfs
	palette	tm3
	set_bg
	info	hon,voff,zoff,nodots
	pstrat	playerinstunnel,a,ab
	hofmode	tunnel2
	shadowheight 0
	tunnel	night


bg_2_4_1	init_bg	mode2
	bg2chr	24
	bg2scr	24
	palette	2f
	set_bg
	info	von,zon,hon,space
	pstrat	playerspaceflyin,a,abc
	bgm	24
	IFNE	MSU1
	msuplay	level2_4,repeat
	lda	#msu_orch
	sta	orchorband
	ENDC
	hofmode	rotate
	bg2Yscroll	232
	space	night
	
bg_2_5_1	init_bg	mode2
	bg2chr	lsb
	bg2scr	lsb
	palette	2c
	set_bg
	pstrat	playerspaceflyin,a,abc
	info	hon,von,zoff,space
	hofmode	nograd
	scrollbg	164
	bgm	25
	IFNE	MSU1
	msuplay	level1_2,repeat
	lda	#msu_orch
	sta	orchorband
	ENDC
	space	night
	
bg_2_6a_1
	init_bg	mode1
	bg2chr	cm
	bg2scr	tss
	palette	tm2
	set_bg
	waittrans

	lda	#(25*k)>>8
	sta	bg3sc
	lda	#(24*k)>>12
	sta	bg34nba

	bg3chr	fsbg3,24*k,2*k
	bg3scr	fsni,25*k,2*k
	set_bg3

	hofmode	tunnel2
	shadowheight 0
	info	hon,voff,zoff,nodots
	pstrat	playercolonyflyin,a,ab
	bgm	26
	IFNE	MSU1
	msuplay	level2_6,repeat
	lda	#msu_orch
	sta	orchorband
	ENDC
	water	night,colony,3

bg_2_6b_1	
;	jsl	bg16b26c
;	pstrat	playerclearcolony,a,ab
;	tunnel	red

	init_bg	mode1
	bg2chr	tst
	bg2scr	tst
	palette	tm3
	set_bg
	gamepal	red
	info	hon,voff,zon,nodots
	pstrat	playerclearcolony,a,ab
	hofmode	tunnel3
	shadowheight 0
	tunnel	night
	
bg_2_6c_1	
	init_bg	mode1
	bg2chr	tst
	bg2scr	tst
	palette	tm3
	set_bg
	gamepal	red
	info	hon,voff,zoff,nodots
	pstrat	playerinLtunnel,a,ab
	hofmode	tunnel3
	shadowheight 0
	tunnel	red

;bg_2_6b_1			;HAVEN'T GOT YET
bg_2_6b_2
bg_2_6b_3
bg_2_6b_4
	planet	night


bg_3_2_1	init_bg	mode2
	bg2chr	32
	bg2scr	32
	palette	2b
	set_bg
	info	von,hon,zon,space
	pstrat	playerinsidespaceflyin,b,abc
	hofmode	rotate
	bg2Yscroll	24
	bgm	32
	IFNE	MSU1
	msuplay	level1_2,repeat
	lda	#msu_orch
	sta	orchorband
	ENDC
	space	night

bg_3_3a_1	init_bg	mode2
	bg2chr	33
	bg2scr	33
	palette	2c
	set_bg
	gamepal	blue
	info	von,hon,zon,pollen
	pstrat	playeronplanet,b,ab	; NO FLY-IN BECAUSE STRANGE RESTART 
	shadowheight 0
	hofmode	rotate
	bg2Yscroll	232
	bgm	33
	IFNE	MSU1
	msuplay	level3_3,repeat
	lda	#msu_orch
	sta	orchorband
	ENDC
	planet	mist

bg_3_4a_1	blink

bg_3_4b_1	init_bg	mode2
	bg2chr	34
	bg2scr	34
	palette	space
	set_bg
	info	von,hon,zon,space
	pstrat	playerinsidespaceflyin,b,abc
	hofmode	rotate
	bg2Yscroll	232
	bgm	34
	IFNE	MSU1
	msuplay	level2_2,repeat
	lda	#msu_orch
	sta	orchorband
	ENDC
	space	night

bg_3_4c_1	init_bg	mode2
	bg2chr	tsp
	bg2scr	tsp
	palette	tm3
	set_bg
	info	hon,voff,zoff,nodots
	pstrat	playerinLtunnel,a,ab
	shadowheight 0
	hofmode	tunnel3
	tunnel	night,blue,5

bg_3_4d_1	init_bg	mode2
	bg2chr	34
	bg2scr	34
	palette	space
	set_bg
	info	von,hon,zon,space
	pstrat	playerclearship2
	hofmode	rotate
	bg2Yscroll	0		
	space	night

bg_3_5_1	init_bg	mode2
	bg2chr	holea
	bg2scr	holea,vsc_base2+2*k,4*k
	palette	hole
	gamepal	red
	set_bg
	bg2Yscroll	256+16
	pstrat	playerundergnd,b,ab		playerundergnd
	info	hon,von,zon,ground
	shadowheight 0
	hofmode	rotate
	lda	#1
	sta	noxrot
	bgm	35
	IFNE	MSU1
	msuplay	level3_5,repeat
	lda	#msu_band
	sta	orchorband
	ENDC
	undergnd	red

bg_3_6_1	init_bg	mode2
	bg2chr	lsb
	bg2scr	lsb
	palette	2c
	set_bg
	info	hon,von,zon,space
	pstrat	playerinsidespaceflyin,b,abc
	hofmode	rotate
	scrollbg	164
	bgm	36
	IFNE	MSU1
	msuplay	level1_2,repeat
	lda	#msu_orch
	sta	orchorband
	ENDC
	space	night

bg_3_7a_1	init_bg	mode2
	bg2chr	f1
	bg2scr	f1
	palette	2a
	gamepal	red
	set_bg
	info	hon,von,zon,ground
	pstrat	playerdivegnd,a,ab
	hofmode	rotate
	shadowheight 0
	bg2Yscroll	232
	flashbg
	bgm	37
	IFNE	MSU1
	msuplay	level1_6,repeat
	lda	#msu_orch
	sta	orchorband
	ENDC
	planet	night


bg_cred_1	init_bg	mode2
	bg2chr	24
	bg2scr	24
	palette	2f
	set_bg
	info	von,zon,hon,space
	pstrat	playercred,b,abc
	hofmode	rotate
	bg2Yscroll	232
	space	night

bg_cont_1	init_bg	mode1
	bg2chr	cont
	bg2scr	cont
	palette	cont
	set_bg
	info	voff,zoff,hoff,space
	pstrat	playeroncont,b,ab
	hofmode	nograd
	bg2Yscroll	0
	space	night

bg_intro_1	init_bg	mode2
	bg2chr	demo
	bg2scr	demo
	palette	2b
	set_bg
	info	von,zon,hon,space
	pstrat	playercred,b,abc
	hofmode	rotate
	bg2Yscroll	24
	space	night

bg_gameover_1	init_bg	mode1
	bg2chr	and
	bg2scr	and
	palette	2e
	set_bg
	info	von,zon,hon,space
	pstrat	playercred,b,abc
	hofmode	nograd
	bg2Xscroll	-128
	bg2Yscroll	0
	space	night

bg_title_1
	init_bg	mode1
	bg3chr	ti3,0e000h/2,4*k
	bg3scr	ti3,0d000h/2,4*k
	set_bg3
	waittrans
	bg2chr	cp
	bg2scr	cp,vsc_base2+2*k,4*k

; -TITLE PALETTE CHECKS-----------

	IFEQ	titlelogo
	palette	cp ; JP
	ENDC

	IFEQ	titlelogo-1
	palette	cpusp ; US Rev. 0
	ENDC

	IFEQ	titlelogo-2
	palette	cpus ; US Rev. 1/2
	ENDC

	IFEQ	titlelogo-3
	palette	cpp ; PAL/Germany Starwing
	ENDC

; -------------------------------

	set_bg
	lda	#(0e000h/2)>>12
	sta	bg34nba
	lda	#(0d000h/2)>>8
	sta	bg3sc
	stz	pal0palette
	stz	pal0palette+1
	setbg3vofs	9
	info	voff,zoff,hoff,space
	pstrat	playercred,b,abc
	hofmode	rotate
	bg2Yscroll	257
	bgm	title
	IFNE	MSU1
	msuplay	title,repeat
	ENDC
	lda	#1+2+4
	sta	tm
	space	night

;----------------------------------------------------------
initmode1
	a8i16
	waittrans
	lda	#36
	sta	trans_flag
	waittrans
	rts
	
initmode2	a8i16
	waittrans
	lda	#38
	sta	trans_flag
	waittrans
	rts

dec_chr_l	php
	a16
	lda	#dec_base
	sta.l	m_decaddr
	a8
	lda	#mdecrunch>>16
	ldx	#mdecrunch&WM
	jsl	runmario_l
	plp
	rtl

dec_bg_l	php
	a16
	lda	#scr_offset
	sta.l	m_decoffset
	lda	#dec_base+6144
	sta.l	m_decaddr
	a8
	lda	#mdecrunch>>16
	ldx	#mdecrunch&WM
	jsl	runmario_l
	plp
	rtl

dec_bg3_l	php
	a16
	lda	#0
	sta.l	m_decoffset
	lda	#dec_base+6144
	sta.l	m_decaddr
	a8
	lda	#mdecrunch>>16
	ldx	#mdecrunch&WM
	jsl	runmario_l
	plp
	rtl

dec_l	php
	a16
	lda	#dec_base
	sta.l	m_decaddr
	a8
	lda	#mdecrunch>>16
	ldx	#mdecrunch&WM
	jsl	runmario_l
	plp
	rtl

bgbase	=	(*&~WM)+1

bg2chr	SHORTA
	LONGI

	a16
	pla
	tax
	clc
	adc	#7
	pha


	lda	#0
	sta.l	m_decoffset

	lda.l	bgbase+2,x
	and	#255
	sta.l	m_enddatabnk

	lda.l	bgbase,x
	sta.l	m_enddata

	lda.l	bgbase+3,x
	sta	vram1addr
	lda.l	bgbase+5,x
	sta	vram1len

	a8
	jsl	dec_chr_l

	rts


bg2scr	SHORTA
	LONGI

	a16
	pla
	tax
	clc
	adc	#7
	pha

	lda.l	bgbase,x
	sta.l	m_enddata
	lda.l	bgbase+2,x
	and	#255
	sta.l	m_enddatabnk
	lda.l	bgbase+3,x
	sta	vram2addr
	lda.l	bgbase+5,x
	sta	vram2len
	a8

	jsl	dec_bg_l

	rts

dopalette	SHORTA
	LONGI

	a16
	pla
	tax
	clc
	adc	#5
	pha

	lda.l	bgbase,x
	sta	vram3addr
	a8
	lda.l	bgbase+2,x
	sta	vram3addr+2
	a16

	lda.l	bgbase+3,x
	sta	vram3len

	lda	vram3addr
	clc
	adc	#7*32-1
	tay

	phy

	a8
	phb
	lda	vram3addr+2
	pha
	plb	; switch bank

	
	ldx	#7*32-1
.notfinished
	lda.w	0,y
	sta.l	pal0palette,x
	dey
	dex
	bpl	.notfinished
	
	plb
	ply
	rts

;----------------------------------------------------------


bglists	dw	0
	db	0

	defbg	1_1i
	defbg	1_1a,2_1a,3_1a
	defbg	1_1b,2_1b
	defbg	3_1c
	defbg	1_1c
	defbg	1_2
	defbg	1_3i
	defbg	1_3a
	defbg	1_3b
	defbg	1_3c
	defbg	1_3d
	defbg	1_3da
	defbg	1_3e
	defbg	1_4
	defbg	1_5,2_5
	defbg	1_6a
	defbg	1_6b,3_7b
	defbg	1_6c,3_7c
	defbg	1_7a
	defbg	1_7b
	defbg	1_7c
	defbg	cred

	defbg	2_2
	defbg	2_3a
	defbg	2_3b
	defbg	2_3c
	defbg	2_4
	defbg	2_6a
	defbg	2_6b
	defbg	2_6c

	defbg	3_2
	defbg	3_3a
	defbg	3_4a
	defbg	3_4b
	defbg	3_4c
	defbg	3_4d
	defbg	3_5
	defbg	3_6
	defbg	3_7a

	defbg	hole
	defbg	intro
	defbg	title
	defbg	cont
	defbg	gameover
	defbg	special
	defbg	training

	dw	0,0	; terminate list

