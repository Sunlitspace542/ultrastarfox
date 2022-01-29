;***************************************************************************
;*                                                                         *
;*                                StarFox                                  *
;*                              -----------                                *
;*                                                                         *
;*                           SuperNES version.                             *
;*                                                                         *
;*                           Argonaut Software.                            *	   
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*  File : cont.asm                                                        *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr : controller type selecting screen                               *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*  Date created : 7/12/1992                                               *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*  Author: Krister Wombell                                                *
;*                                                                         *
;***************************************************************************


briefing_l
	php
	a8i16
	bgm	ops
	disable
	lda	#$80
	setinidisp1
	waitdma	200
	waitdma	190
	a8
	lda	#1
	sta.l	oncewipe
	lda	#contmap>>16
	ldx	#contmap&$7fff
	sta	mapbank
	stx	mapptr
	jsl	initgame_l

	jsl	setcharmapfox_l
	decvramnotrans	0,vobj_base,obj2ccr,4*k
	dmacgram	0,128,obj2pac,256

	lda	#65
	sta.l	xinidisp1-1
	lda	#67
	sta.l	xinidisp2-1
	lda	#58
	sta.l	xinidisp1a-1

	a16
	lda	#0
	sta.l	m_meters
	lda	#8*8
	sta.l	m_vanishx
	lda	#6*8
	sta.l	m_vanishy

	a8
	lda	#1
	sta	dogyirq
	stz	gameframe
	stz	gameframe+1

	lda	defaulttrain
	lbne	conttraining
	lda.l	contexit
	lbne	conttraining

contcancel	a8
	s_playerctrl	on

.self	jsl	setblack_l
	a16
	stz	spritespos
	jsl	reset_sprites_l
	jsr	conttrans
	a8
	testjoypad	select
	beq	.nosel
	lda	c_type
	inc	a
	and	#3
	sta	c_type
	trigse	011h
.nosel
	jsr	set_c_type

	a16
	lda	gameframe
	cmp	#16
	lbcc	.self
	IFNE	CONTEST
	cmp	#20*10
	a8
	bcs	.autoexit
	ELSEIF
	a8
	ENDC
	testjoypad	start
	lbeq	.self
.autoexit
	trigse	$10
conttraining
	IFEQ	contest

	a8
	enable
.lp	jsl	setblack_l
	jsr	contsprites
	jsr	conttrans
	jsr	set_c_type
	a8
	s_playerctrl	off

	testjoypad	select
	beq	.nosel
	lda.l	contexit
	eor	#1
	sta.l	contexit
	trigse	011h
.nosel
	lda.l	contexit
	beq	.noup
	testjoypad	up
	beq	.noup
	lda	#0
	sta.l	contexit
	trigse	011h
.noup
	lda.l	contexit
	bne	.nodown
	testjoypad	down
	beq	.nodown
	lda	#1
	sta.l	contexit
	trigse	011h
.nodown
	testjoypad	x
	lbne	contcancel
	testjoypad	y
	lbne	contcancel

	testjoypad	a
	bne	.xit
	testjoypad	b
	bne	.xit

	testjoypad start
	lbeq	.lp
.xit
	ELSEIF
	a8
	lda	#1
	sta.l	contexit
	ENDC

	a8

	trigse	$10
	startbgm	$f1

	lda	#-1
	sta	fadedir
.lp2	jsl	setblack_l

	IFEQ	contest
	jsr	contsprites
	ENDC

	jsr	conttrans
	a8
	untilfaded .lp2
	stz	dogyirq

	lda.l	contexit
	lbne	gotogame

	jsl	initialise_l
	a8i16
	lda	#trainingmap>>16
	ldx	#trainingmap&$7fff
	sta	mapbank
	stx	mapptr
	jsl	initgame_l
	a8
	lda	#1
	sta	lives
	stz	gameframe
	stz	gameframe+1
.lp3	jsl	setblack_l
	jsl	transfer_l
	jsl	friends_messages_l
	a16
	lda	gameframe
	cmp	#20
	bcc	.lp3
	a8
	lda	levelfinished
	cmp	#le_gameover
	beq	.gameover
	lda	gameflags2
	and	#gf2_ingame
	beq	.tstst
	lda	pshipflags2
	bit	#psf2_playerHP0
	bne	.lp3
.tstst	testjoypad start
	beq	.lp3
.fade
	a8
	startbgm $f1
	lda	#-1
	sta	fadedir
.lp4	jsl	setblack_l
	jsl	transfer_l
	a8
	untilfaded .lp4
	jsl	initialise_l
	a8
	lda	#1
	sta.l	contexit
	sta	defaulttrain
	bra	.dd
.gameover
	jsl	initialise_l
	a8
	lda	#0
	sta.l	contexit
	lda	#1
	sta	defaulttrain
.dd
	stz	levelfinished
	plp
	jmp	briefing_l

gotogame	plp
	rtl


contsprites	ai16
	ldx	#0
	stx	spritespos

	ldx	#0
	lda.l	contexit
	beq	.train
	ldx	#selectgame-selecttrain
.train
	ldy	spritespos
	lda	#$97a8
	sta	tpa
.lp	lda	tpa
	sta.w	spriteblk,y
	lda.l	selecttrain,x
	clc
	adc	#spradd+(3<<12)+(0<<9)
	sta.w	spriteblk+2,y
	iny
	iny
	iny
	iny
	inx
	inx
	lda	tpa
	clc
	adc	#8
	sta	tpa
	and	#$ff
	cmp	#80+$a8
	bne	.lp

	lda	tpa
	and	#$ff00
	clc
	adc	#$0800
	cmp	#(48+$97)<<8
	beq	.end
	ora	#$00a8
	sta	tpa
	bra	.lp
.end	sty	spritespos

	jsl	reset_sprites_l
	rts

selecttrain	dw	00h,01h,01h,01h,01h,01h,01h,01h,01h,00h+spr_hflip
	dw	02h,20h,04h,05h,06h,07h,08h,09h,0ah,02h+spr_hflip
	dw	02h,20h+spr_vflip,0bh,0ch,0dh,0eh,0fh,10h,11h,02h+spr_hflip
	dw	02h,03h,12h,13h,14h,15h,16h,17h,18h,02h+spr_hflip
	dw	02h,03h,19h,1ah,1bh,1ch,1dh,1eh,1fh,02h+spr_hflip
	dw	00h+spr_vflip,01h+spr_vflip,01h+spr_vflip,01h+spr_vflip,01h+spr_vflip
	dw	01h+spr_vflip,01h+spr_vflip,01h+spr_vflip,01h+spr_vflip,00h+spr_vflip+spr_hflip
selectgame
	dw	00h,01h,01h,01h,01h,01h,01h,01h,01h,00h+spr_hflip
	dw	02h,03h,04h,05h,06h,07h,08h,09h,0ah,02h+spr_hflip
	dw	02h,03h,0bh,0ch,0dh,0eh,0fh,10h,11h,02h+spr_hflip
	dw	02h,20h,12h,13h,14h,15h,16h,17h,18h,02h+spr_hflip
	dw	02h,20h+spr_vflip,19h,1ah,1bh,1ch,1dh,1eh,1fh,02h+spr_hflip
	dw	00h+spr_vflip,01h+spr_vflip,01h+spr_vflip,01h+spr_vflip,01h+spr_vflip
	dw	01h+spr_vflip,01h+spr_vflip,01h+spr_vflip,01h+spr_vflip,00h+spr_vflip+spr_hflip



conttrans	jsl	transfer_l

	a8i16
	ldx	circleanim
	cpx	#smartbomb_circle
	bne	.ok
	lda	#40
	sta	contsmart
	stz	circleanim
	stz	circleanim+1
.ok

	lda	#3
	sta	specwepcnt

	ldx	playpt
	lda	al_vel,x
	sta	tmpz
	lda	al_rotx,x
	asl	a
	sta	trotx
	lda	al_roty,x
	sta	troty
	jsl	n3dvecs_l

	a16
	lda	kcvposx
	clc
	adc	x1
	sta	kcvposx

	lda	kcvposy
	clc
	adc	y1
	sta	kcvposy

	lda	kcvposz
	clc
	adc	z1
	sta	kcvposz
	rts

	shorta
	longi
set_c_type	a8i16
	lda	c_type
	cmp	#1
	beq	.1
	cmp	#2
	beq	.2
	cmp	#3
	beq	.3
.0	a16
	lda	#0
	sta	bg2vofsreq
	lda	#0
	sta	bg2hofsreq
	rts
.1	a16
	lda	#0
	sta	bg2vofsreq
	lda	#256
	sta	bg2hofsreq
	rts
.2	a16
	lda	#256
	sta	bg2vofsreq
	lda	#0
	sta	bg2hofsreq
	rts
.3	a16
	lda	#256
	sta	bg2vofsreq
	lda	#256
	sta	bg2hofsreq
	rts







