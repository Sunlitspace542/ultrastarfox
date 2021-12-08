	incpublics	bootnmi.ext

	shorti
startboot	disable
	clc
	xce
	ai16
	lda	#0
	tcd
	ldx	#$02ff
	txs
	ai8
	pha
	plb

	ai8
	jsl	startsfx_l

	jsr	initialise_ram

	i16
	ldx	#$2ff
	txs			; reset the stack
	ai8

;	lda	#1
;	sta	$3039
;	stz	$3037
;	lda	#$15
;	sta	$ffd6

	lda	#1
	sta	rapidfire
	sta	superfx2
	lda	#2
	sta	firerate
	
	jsl	initialise_l
	IFEQ	contest
	jsl	intro_l
	ENDC

;** TEST, COMMENT OUT IN FINAL VERSION
;	jsl	endseq_l

	jsl	titleseq_l


	a8
	lda	#0
	sta.l	contexit
	lda	#0
	sta	defaulttrain
	jmp	firsttimeuse

resettomenu	ai16
	clc
	xce
	lda	#0
	tcd
	ldx	#$2ff
	txs			; reset the stack
	ai8

	disable

	jsl	startsfx_l

	lda	#8
	sta	stopcounting
	lda	#1
	sta	credits
	a8
	lda	#-1
	sta	fadedir
	jsl	setblack_l
	jsl	transfer_l

	a8
	stz	bg2vofsoverride
	jml	foxy_continue_l


restart	ai16
	clc
	xce
	lda	#0
	tcd
	ldx	#$2ff
	txs			; reset the stack
	ai8

	disable

	jsl	startsfx_l

	
;--------------------------LOAD AND PUSH AND THEN PULL AND STORE ANY ALCS THAT YOU WANT TO KEEP
	lda	newgameplus
	and	#1
	pha
	lda	defaulttrain
	pha
	lda.l	contexit
	pha
	lda	c_type
	pha

	lda	godmode
	pha
	lda	randomfire
	pha
	lda	scored
	and	#1
	pha
	lda	snesmini
	pha
	lda	endurance
	pha
	lda	levelfeatures
	pha
	lda	enemy_firing
	pha
	lda	rainbowlaser
	pha
	lda	bigheadmode
	pha
	lda.l	m_bigheadmode
	pha
	lda.l	m_biggerheadmode
	pha
	lda	playertwocpuactivated
	pha
	lda	font
	pha
	lda	skipscramble
	and	#1
	pha
	lda.l	m_playertwoactivated
	pha
	lda	nosfx
	and	#1
	pha
	lda	nobgm
	and	#1
	pha
	lda	rapidfire
	and	#1
	pha
	lda	firerate
	pha
	lda	darkmode
	pha
	lda	mistmode
	pha
	lda	nodotsmode
	pha
	lda	palnumber
	pha
	lda	secretgodmode
	pha
	lda	strat_valid
	pha
	lda	pweptemp
	pha
	lda	bgmspeed
	pha
	lda	quickstart
	pha
	lda	curr_ship
	pha	
	lda	showcolbox
	pha
	lda	mosaicon
	pha
	lda	nanmode
	pha
	lda	superfx2
	pha
	lda	wiremode
	pha
	lda	nobgmode
	pha
	
;-----------------------------------
	jsr	initialise_ram			;clear all values
;-----------------------------------

	pla
	sta	nobgmode

	pla
	sta	wiremode
	lda	wiremode
	sta.l	m_wiremode

	pla
	sta	superfx2
	pla
	sta	nanmode
	lda	nanmode
	sta.l	m_nanmode
	
	pla
	sta	mosaicon
	lda	mosaicon
	sta	mosaic

	pla
	sta	showcolbox
	pla
	sta	curr_ship
	pla
	sta	quickstart
	pla
	sta	bgmspeed
	pla
	sta	pweptemp
	pla
	sta	strat_valid
	pla
	sta	secretgodmode
	pla	
	sta	palnumber
	pla
	sta	nodotsmode
	pla
	sta	mistmode
	pla
	sta	darkmode
	pla
	sta	firerate
	pla
	sta	rapidfire
	pla
	sta	nobgm
	pla
	sta	nosfx

	lda	nosfx
	and	#1
	beq	.skipnosfx
	lda	#1
	sta	nosetport3		;shuts off sound fx
.skipnosfx

	pla
	sta.l	m_playertwoactivated	
	pla
	sta	skipscramble
	pla
	sta	font
	pla
	sta	playertwocpuactivated
	pla
	sta.l	m_biggerheadmode
	pla
	sta.l	m_bigheadmode
	pla
	sta	bigheadmode
	pla
	sta	rainbowlaser

	lda.l	m_playertwoactivated
	sta	playertwoactivated

	pla
	sta	enemy_firing
	pla
	sta	levelfeatures
	pla
	sta	endurance
	pla
	sta	snesmini
	pla
	sta	scored
	pla	
	sta	randomfire
	pla
	sta	godmode

	
	pla
	sta	c_type
	pla
	sta.l	contexit
	pla
	sta	defaulttrain
	pla
	sta	newgameplus

	lda	#1
	sta	firstdnld
	sta.l	oncewipe

	lda	superfx2
	beq	.donefx
	lda	#1
	sta	$3039
	stz	$3037
	lda	#$15
	sta	$ffd6
.donefx
	IFNE	CONTEST
	jsl	initialise_l
	jsl	titleseq_l
	ENDC
	jsl	initialise_l
	

firsttimeuse	a16
	jsl	briefing_l
	jsl	initialise_l
	jml	planetseq_l


;-----------------------------------------------------------------------
; clear all ram
initialise_ram
	php

	a8
	lda	#$7e
	pha
	plb

	ai16
	ldx	#$2000	;clr ext. RAM
.7epage	stz.w	0,x
	stz.w	2,x
	stz.w	4,x
	stz.w	6,x
	txa
	clc
	adc	#8
	tax
	bne	.7epage

	a8
	lda	#$7f
	pha
	plb
	a16

.7fpage	stz.w	0,x
	stz.w	2,x
	stz.w	4,x
	stz.w	6,x
	txa
	clc
	adc	#8
	tax
	bne	.7fpage

	a8
	lda	#$70
	pha
	plb

	ai16

	ldx	#32768-8	; clear mario ram
.ooop2
	stz.w	0,x
	stz.w	2,x
	stz.w	4,x
	stz.w	6,x
	txa
	sec
	sbc	#8
	tax
	bpl	.ooop2

	a8
	lda	#0
	pha
	plb
	a16

	ldx	#$2000-$300-8	;clr Work RAM
.sssp	stz	$300,x
	stz	$302,x
	stz	$304,x
	stz	$306,x
	txa
	sec
	sbc	#8
	tax
	bpl	.sssp

	ldx	#$fe
.zpage	stz	0,x
	dex
	dex
	bpl	.zpage

	jsl	copy_to_0101_l

	a8
	lda	stat78r		; ntsc/pal
	and	#1<<4
	sta	ntscpal


	plp
	rts


	shorta
	shorti
;------ reset SFX regs ------------------------------
startsfx_l
	disable

	waitdma	1
	waitdma	0

	lda	#$8f
	sta	$2100
	lda	#0
	sta	$2101
	sta	$2102
	sta	$2103

	sta	$2105
	sta	$2106
	sta	$2107
	sta	$2108
	sta	$2109
	sta	$210a
	sta	$210b
	sta	$210c

	sta	$210d
	sta	$210d
	sta	$210e
	sta	$210e
	sta	$210f
	sta	$210f
	sta	$2110
	sta	$2110
	sta	$2111
	sta	$2112
	sta	$2112
	sta	$2113
	sta	$2113
	sta	$2114
	sta	$2114

	ldx	#$80
	stx	$2115
	
	sta	$2116
	sta	$2117

	sta	$211a

	ldx	#1
	sta	$211b
	stx	$211b
	sta	$211c
	sta	$211c
	sta	$211d
	sta	$211d
	sta	$211e
	stx	$211e
	sta	$211f
	sta	$211f
	sta	$2120
	sta	$2120

	sta	$2121

	sta	$2122
	sta	$2123
	sta	$2124
	sta	$2125
	sta	$2126
	sta	$2127
	sta	$2128
	sta	$2129
	sta	$212a
	sta	$212b
	sta	$212c
	sta	$212d
	sta	$212e

	ldy	#$30
	sty	$2130

	sta	$2131
	ldx	#$e0
	stx	$2132
	sta	$2133

	sta	$4200
	ldx	#$ff
	stx	$4201
	sta	$4202
	sta	$4203
	sta	$4204
	sta	$4205
	sta	$4206
	sta	$4207
	sta	$4208
	sta	$4209
	sta	$420a
	sta	$420b
	sta	$420c
	sta	$420d


	rtl

	shorta
	longi
fnmi_l
	rtl



