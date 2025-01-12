;***************************************************************************
;*                              -----------                                *
;*                               Star Fox                                 *
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
;*  Descr: CONTINUE/CREDIT SCREEN                                          *
;*_________________________________________________________________________*
;*                                                                         *
;*   Date: 26/6/92                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;* Author:   Dylan Cuthbert.                                               *
;*                                                                         *
;***************************************************************************


	INCPUBLICS	EXT\continue.ext

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



;-------------------------------------------------

foxy_continue_l
	php
	phb
	a8i16
	IFNE	FASTROM
	lda	#$80
	pha
	plb
	ELSEIF
	lda	#0
	pha
	plb
	ENDC
	lda	credits
	lbeq	.end2
	stz	trans_flag
	stz	hdmaen
	waitdma	150
	waitdma	140
	lda	#$80
	sta	inidisp
	setinidisp1
	disable
	dmacgram	0,0,(bgfoxpac),512
	lda	#1
	jsl	setpal_l
	bgm	continue
	lda	#%11100000
	sta	coldata
	stz	cgadsub
	stz	cgswsel
	stz	w12sel
	stz	w34sel
	stz	wobjsel
	stz	tmw
	stz	tsw
	lda	#3
	sta	lives
	a16
	stz	foxy_option
	stz	foxy_frame
	stz	foxy_foot
	lda	#350
	sta.l	m_bigz
	lda	#4
	stz	foxy_xa
	sta	foxy_ya
	stz	foxy_za
	lda	#0
	sta.l	m_rotx
	sta.l	m_roty
	sta.l	m_rotz
	stz	cont0l
	stz	cont1l
	stz	trig0
	stz	trig1
	stz	foxy_ptr
	lda	#my_demo
	sta	foxy_shape
	a8

	jsl	setcharmapfox_l

	decvramnotrans	0,vchr_logback,bgfoxccr,6*k
	decbg2vramnotrans	0,vsc_base2,bgfoxpcr,8*k
	decvramnotrans	0,vobj_base,fobjccr,4*k
	decclear

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
	waitdma	240
	lda	#2
	sta	hdmaen
	waitdma	150
	waitdma	140
	enable

	jsl	foxytrans_l
	jsl	foxytrans_l

	lda	#0
.fadeloop
	pha
	waitdma	224
	pla
	inc	a
	setinidisp1
	cmp	#15
	bne	.fadeloop

.self
	jsl	foxytrans_l

	lda	foxy_frame
	beq	.noinc
	inc	foxy_frame
	cmp	#32
	lbeq	.yahay
	jmp	.notselect
.noinc

	lda	contl1
	ora	cont1
	beq	.nocont2
	lda	foxy_flag
	bne	.cont2

	ldx	foxy_ptr
	inx
	inx
	a16
	lda.l	shapeslist,x
	bne	.ok
	lda	#my_demo
	ldx	#0
.ok
	sta	foxy_shape
	stx	foxy_ptr
	a8
	lda	#1
	sta	foxy_flag
	bra	.cont2
	
.nocont2
	stz	foxy_flag
.cont2
	TESTKEYDOWN	SELECT
	beq	.notselect
	lda.l	lastselected
	bne	.notselect2
	lda	foxy_option
	eor	#255
	sta	foxy_option
	trigse	se_cursor

	lda	#1
	bra	.setit

.notselect
	lda	#0
.setit
	sta.l	lastselected
.notselect2

	TESTKEYDOWN	LEFT
	beq	.noleft
	inc	foxy_ya
.noleft

	TESTKEYDOWN	RIGHT
	beq	.noright
	dec	foxy_ya
.noright
	TESTKEYDOWN	UP
	beq	.noup
	inc	foxy_xa
.noup
	TESTKEYDOWN	DOWN
	beq	.nodown
	dec	foxy_xa
.nodown

	TESTKEYDOWN	TLEFT,cont0l
	beq	.nozoomup
	a16
	lda.l	m_bigz
	sec
	sbc	#20
	cmp	#150
	bcc	.nozoomup
	sta.l	m_bigz
.nozoomup
	a8
	TESTKEYDOWN	TRIGHT,cont0l
	beq	.nozoomout
	a16
	lda.l	m_bigz
	clc
	adc	#20
	cmp	#1000
	bcs	.nozoomout
	sta.l	m_bigz
.nozoomout
	a8
	TESTKEYDOWN	A,cont0l
	beq		.clrbitmaps
	lda		#0
	bra		.dontclear
.clrbitmaps
	lda		#1
.dontclear	sta.l		m_clrbitmaps

	TESTJOYPAD	X
	beq	.notx
	stz	foxy_xa
	stz	foxy_ya
	stz	foxy_za
.notx
	TESTJOYPAD	START
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

	jmp	.self
.end
	trigse		$10
	startbgm	$f1


	lda	#15
.fadeloop3
	pha
	waitdma	224
	pla
	setinidisp1
	cmp	#15
	dec	a
	bpl	.fadeloop3
.end2
	jsl	setnoclash_l

	jml	restart
.yahay
	a8
	lda	#3
	sta	lives
	jsl	playerstart_init_l

	lda	#15
.fadeloop2
	pha
	waitdma	224
	pla
	setinidisp1
	cmp	#15
	dec	a
	bpl	.fadeloop2

	jsl	setnoclash_l

	plb
	plp
	rtl

;-------------------------------------------------

foxytrans_l
	php
	a8i16
.aha
	lda	trans_flag
	bne	.aha

	lda	#tm_fox
	sta	trans_flag

.wait	lda	transbmp1
	beq	.wait
	jsl	clronehalf_l
.wait2
	lda	transbmp1
	cmp	#2
	bne	.wait2

	stz	transbmp1

	jsl	clrotherhalf_l

	jsl	fox_sprites_l

	jsr	drawsome3d

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
	lda	gameframe
	sta.l	m_framenum
	sta.l	m_colframe

	inc	gameframe
	lda	foxy_shape
	sta.l	m_shapeptr

	lda	#9*8+4
	sta.l	m_vanishx
	lda	#7*8+32+4
	sta.l	m_vanishy

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
.lp2	stz	spriteblk,x
	dex
	bpl	.lp2

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
.lolv
	pha
	lda	#gamenum_col*gamenum_row+(6<<10)
	rept	(32-gamenum_col)/2		;clear out borders
	sta	vmdatal
	endr
	pla

	ldx	#0
.lolh	sta	vmdatal
	clc
	adc	#gamenum_row
	inx
	cpx	#gamenum_col
	bne	.lolh

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
	bne	.lolv
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

	
	lda	#179
	sta	spr_foxcursor+1
	lda	foxy_option
	bne	.other
	lda	#45
	bra	.con
.other	lda	#93
.con	sta	spr_foxcursor
	lda	#foxcursor+spradd
	sta	spr_foxcursor+2
	lda	#%110000
	sta	spr_foxcursor+3

	lda	foxy_frame
	a16
	and	#254
	cmp	#8
	bcc	.ok1
	lda	#6
.ok1
	tax
	lda.l	foxarmanim,x
	tax
	a8

	ldy	#spr_foxarm
	jsr	copyfoxsprites

	lda	foxy_frame
	sec
	sbc	#8
	bmi	.nodo
	a16
	and	#254
	cmp	#8
	bmi	.ok2
	lda	#6
.ok2
	tax
	lda.l	foxeyeanim,x
	tax
	a8

	ldy	#spr_foxeye
	jsr	copyfoxsprites

.nodo
;	lda	foxy_frame
;	beq	.bolox
;	lda	#0
;	bra	.noyo
.bolox
	lda	foxy_foot
.noyo
	a16
	and	#7
	asl	a
	tax
	lda.l	foxfootanim,x
	tax
	a8
	ldy	#spr_foxfoot
	jsr	copyfoxsprites

	lda	foxy_foot
	and	#7
	beq	.daijobu
	inc	foxy_foot
	bra	.nornd
.daijobu
	lda	foxy_foot
	bit	#128
	beq	.norm
	jsl	random_l
	and	#31
	bne	.nornd
	lda	#129
	sta	foxy_foot
	bra	.nornd
.norm
	jsl	random_l
	and	#127
	bne	.nornd
	lda	foxy_foot
	clc
	adc	#8
	sta	foxy_foot
.nornd


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
.andagain
	lda.l	fox_x,x
	cmp	#-1
	beq	.fin
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
	bra	.andagain
.fin
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
	jsr	.displayface
	dec	msg_count1
	bne	.nosound
	trigse	$64
.nosound

; shadow

	ldx	friends_msg
	ai16
	lda	#shadowmsgxpos ;set message x pos
	sta.l	m_x1 ;save value for later
	lda	#shadowmsgypos ;set message y pos
	sta.l	m_y1 ;save value for later
	txa
	sta.l	m_txtdata
	jsr	.chkmeter
	a8
	lda	#msprintstr>>16
	ldx	#msprintstr&WM
	jsl	runmario_l

; real text
	ldx	friends_msg
	ai16
	lda	#friendmsgxpos ;set message x pos
	sta.l	m_x1 ;save value for later
	lda	#friendmsgypos ;set message y pos
	sta.l	m_y1 ;save value for later
	txa
	sta.l	m_txtdata
	jsr	.chkmeter
	a8
	lda	#mfprintstr>>16
	ldx	#mfprintstr&WM
	jsl	runmario_l

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
	lda	#friendhpx ; friend hp x
	sta.l	m_x1
	lda	#friendhpy ; friend hp y
	sta.l	m_y1

	call_mario	mshowteammate2
.nothingdoing
	a8

	bra	.finished
.closedown
	lda	msg_count2
	dec	a
	bmi	.finished
	sta	msg_count2
	jsr	.displayface
	bra	.finished
.openup
	jsr	.displayface
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
	lda.l	.facesounds,x
	trigse	a

.finished
	plp
	rtl
.chkmeter
	php
	a8
	IFEQ	JAPANESE
	lda	whichfriend
	bit	#128
	bne	.3lines
	ENDC
	and	#127
	cmp	#friend_andross
	beq	.3lines
	lda	friends_meter
	beq	.notshowing
.3lines
	a16
	lda.l	m_y1
	sec
	sbc	#16
	sta.l	m_y1
.notshowing
	plp
	rts
.facesounds
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

.displayface
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
	lda	#friendmugshotx    ; Character Portrait/mugshot X pos
	sta.l	m_bigx
	lda	#friendmugshoty ; Character Portrait/mugshot Y pos
	sta.l	m_bigy
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
	IFD	_SASM
	db	foxx+(\1)*8,foxy+(\2)*8
	ENDC
	IFD	_ARGSFX
	db	(foxx+(\1)*8)&BM,(foxy+(\2)*8)&BM
	ENDC
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
;	dw	foxeyeanim2-foxsprites

foxarmanim
	dw	foxarmanim1-foxsprites
	dw	foxarmanim2-foxsprites
	dw	foxarmanim3-foxsprites
	dw	foxarmanim3-foxsprites
;	dw	foxarmanim2-foxsprites


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




shapeslist
	dw	bazz_1q	
	dw	old_type
	dw	w_l
	dw	item_7
	dw	ripair_w
	dw	wire_man
	dw	item_6
	dw	bom_wing
	dw	item_5
	dw	my_bird

	dw	zaco_0
	dw	zaco_1
	dw	zaco_4
	dw	zaco_5
	dw	zaco_6
	dw	zaco_8
	dw	zaco_9
;	dw	air_1
	dw	zaco_A
	dw	zaco_B
	dw	walker_2
	dw	kamikaze
	dw	carrier
	dw	shieldr
	dw	s_hou_0
	dw	heli
	dw	uper_m
	dw	mine_2
	dw	bazooka
	dw	round_0
	dw	shark
	dw	s_fish
	dw	ray_0
	dw	ray_1
	dw	ika
	dw	f_fish
	dw	tadpole
	dw	f_dragon
	dw	boss_d_4
	dw	0
	







