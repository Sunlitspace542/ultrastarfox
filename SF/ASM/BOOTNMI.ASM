; #############################
; ## Star Fox Boot Routines. ##
; #############################

	incpublics	EXT\bootnmi.ext

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

	jsl	initialise_l

	IFNE	TWENTYONEMHZ
	fast
	ENDC

	IFEQ	contest
	jsl	intro_l
	ENDC

	jsl	titleseq_l


	a8
	lda	#0
	sta.l	contexit
	lda	#0
	sta	defaulttrain
	bra	firsttimeuse

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

	lda.l	whichroute
	pha			; preserve level number
	lda	defaulttrain
	pha
	lda.l	contexit
	pha
	lda	c_type
	pha

	jsr	initialise_ram

	pla
	sta	c_type
	pla
	sta.l	contexit
	pla
	sta	defaulttrain
	pla
	sta.l	whichroute
	lda	#1
	sta	firstdnld
	sta.l	oncewipe

	IFNE	CONTEST
	jsl	initialise_l
	jsl	titleseq_l
	ENDC
	jsl	initialise_l
firsttimeuse

	IFNE	TWENTYONEMHZ
	fast
	ENDC

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
