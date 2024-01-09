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
;*   File: PLANETS.ASM                                                     *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr: PLANET SELECTION SCREEN.                                        *
;*_________________________________________________________________________*
;*                                                                         *
;*   Date: 10/4/92                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;* Author:                                                                 *
;*	Dylan Cuthbert.                                                        *
;*                                                                         *
;***************************************************************************
planetcheat	=	0

	IFNE	planetcheaton
planetcheat	=	1
	ENDC

	incpublics	EXT\planets.ext

p_bg1_cgx1	=	0
p_bg1_scr2	=	(22*k)/2
p_bg1_cgx2	=	(24*k)/2
p_bg2_cgx	=	(40*k)/2
p_bg1_scr1	=	(60*k)/2
p_bg2_scr	=	(62*k)/2
p_vobj_base	=	(40*k)/2


planNum_col		equ	16
planNum_row		equ	16

pepperscreensize	=	16*24*32


planchar_size	equ	64
planmdm		equ	height_128!colours_256
planmdm2		equ	height_128!colours_16
planStRow		equ	2
planVW_Pos		equ	224+4
planVW_Pos2		equ	128+56
planVW_Pos3		equ	planVW_pos2+36
planmtrans		equ	((262-planVW_Pos+8*planStRow)*170)&(-30)
;planBMPSZ		equ	planNum_col*planNum_row*planchar_size
		ifge	planmtrans-planBMPSZ
planmaxtrans	equ	planBMPSZ/2
		elseif
planmaxtrans	equ	planmtrans
		endc
plantranlen1	equ	10752
plantranlen2	equ	10752


centrx	equ	128-16
centry	equ	128-16-24



; temporary variables shadow with unused zero page:

togglebit	equ	x2
currentchar	equ	y2
fadecount	equ	z2
currentaddr	equ	dx
bg1scrx	equ	lgrad
bg1scry	equ	ocode1
bg2scrx	equ	ocode2
bg2scry	equ	cla1
scrdx	equ	cla2
scrdy	equ	clb1
scrframesb	equ	clb2
scrdxl	equ	clac
scrdyl	equ	clam
remainder	equ	clbm
roty1	equ	plotx1		      ; must
roty2	equ	plotx2		      ; be
roty3	equ	ploty1		      ; consecutive
roty4	equ	clx1		      ; in
roty5	equ	cly1		      ; memory
roty6	equ	clx2
currentsprite equ	cly2
shipxy	equ	rad
flashship	equ	py1
shipangle	equ	py2
newshipxy	equ	plm
oldcomet	equ	blinktemp

	IFNE	roty6-roty1-10
	fail	; not consecutive
	ENDC

planetlines_spr	=	spriteblk+8*4
maxplanetlines	=	20


sprx	=	0
spry	=	1
sprchar	=	2
sprinfo	=	3




;----------------------------------------------------------------------
;----------------------------------------------------------------------
;----------------------------------------------------------------------
;----------------------------------------------------------------------

waitdma224
	php
	a8
	lda	#222
	sta	dmatemp
	jsl	waitdma_l

	lda	#0
.loop	dec	a
	bne	.loop
	plp
	rts
; --------------------------------------------------
; waitdma_l
; called from the macro 'waitdma' to save memory

waitdma_l
	php
	ai16
	phx
	pha
	a8
	stz	dmatemp+1

.waitforline
	a8
	lda	slhvr
	lda	opvctr
	xba
	lda	opvctr
	xba

;	a16
;	and	#%111111111
	cmp	dmatemp
	bne	.waitforline

;.vw1	lda	slhvr		;wait for screen off
;	ldx	opvctr
;	lda	opvctr
;	and	#1
;	bne	.vw1
;	cpx	dmatemp
;	bne	.vw1

	ai16
	pla
	plx
	plp

	rtl

	IFEQ	1
waitforirq
	php
	a8
	stz	irqtoggle
;.wait	lda	irqtoggle
;	bne	.wait
.wait2
	lda	irqtoggle
	beq	.wait2

	plp
	rts

	ENDC

;--------------------------------------------------------------
; initialise the planet selection, should only be done per game

initplanets_l
	php
	a8
;	stz	whichroute 	; (not to be cleared unless reset pressed)

; set starting time
	IFNE	cestimeron

	lda	#cestime
	sta.l	cesminute
	lda	#0
	sta.l	cessecond
	sta.l	cessecond10

	ENDC	;cestimeron

; Set player's lives
	lda	#numlives
	sta	lives
	IFEQ	debuginfo2
	stz	credits
	ELSEIF
	lda	#1
	sta	credits
	ENDC

; set default paths
	a16
	lda	#stagepaths.path12-stagepaths
	sta	routes
	lda	#stagepaths.path7-stagepaths
	sta	routes+2
	lda	#stagepaths.path2-stagepaths
	sta	routes+4
	lda	#stagepaths.path19-stagepaths
	sta	routes+6

; clear stage, map mode and screen transfer latch
	stz	stage
	stz	mapmode
	stz	bg_dmalist

	plp
	rtl

planetseq_l

	a8i16
	jsr	convertroute

	stz	sdpck3
	ldx	#0
	stx	sdgpt3
	stx	sdspt3
	stz	nosetport3

	disable

	a16
	lda	#0000
	sta.l	m_lxpos
	sta	lightx
	lda	#0000
	sta.l	m_lypos
	sta	lighty
	lda	#150
	sta	lightz
	sta.l	m_lzpos			; set light source position

	ldx	#planetlines_spr
	stx	currentsprite
	stz	flashship
	lda	#1
	sta	shipangle

	jsl	setup_planets_l

	jsr	copylight
	a8
	lda	drawmap+1		; set mario draw base
	lsr	a
	lsr	a
	sta	m_scbr

	lda	#-1
	sta	currentplanet
	lda	#6
	sta.l	mspr_pal
	jsr	drawplanetsprites	; draw them funky sprites/spheres

	jsr	blitscreen
	jsr	switchbuffer_fast
	jsr	blitscreen
	jsr	switchbuffer_fast

	jsl	setupplanetpal_l	; transfer the shaded palette

	ai16
	lda	#p_bg1_cgx1+(16*16+1)*8*8/2
	sta	vmaddl
	ldx	#0
.copyemall	lda	mycrapchars,x
	sta	vmdatal
	inx
	inx
	cpx	#4*8*30
	bne	.copyemall		; transfer the dot characters (4 of them)

	lda	#p_bg1_cgx2+(16*16+1)*8*8/2
	sta	vmaddl
	ldx	#0
.copyemall2	lda	mycrapchars,x
	sta	vmdatal
	inx
	inx
	cpx	#4*8*30
	bne	.copyemall2		; into both buffers (double buffered)

	a16
	stz	togglebit		; clear toggle (used when drawing lines)
	lda	#16
	sta	fadecount		; set fade to dark

	dec	stage		; stage set to previous for
				; drawing purposes
	bmi	.nodraw		; first time, so no lines
	
	inc	stage
	jsl	drawplanetlines_l
	lda	currentplanet
	pha
	dec	stage
	jsl	drawplanetlines_l	; draw lines between completed stages
	pla
.nodraw	pha
	inc	stage		; restore stage

	a8i16
	lda	currentplanet
	bpl	.nocando
	lda	#0
.nocando
	a16
	asl	a
	tax
	lda.l	startplanetpos,x
	sta	shipxy
	sta	newshipxy

	jsr	drawroutename	; tell the player how easy it is

	ai8
	lda	#1<<3
	sta	hdmaen

	waitdma	190	; wait for hdma to initialise
	waitdma	100
	a16
	pla
	a8
	pha
	enable
	bgm	map
	pla
	cmp	#14
	beq	.blackholebgm
	cmp	#10
	bne	.normbgm
.blackholebgm	startbgm	$f
.normbgm

	lda	#-1
.nxtfad	pha
	waitdma	200
	jsr	waitdma224

	pla
	inc	a
	inc	a
	sta.l	xinidisp5
	sta.l	xinidisp6
	sta.l	xinidisp7
	cmp	#$f
	bne	.nxtfad		; fade the screen in quickly
.nostart

	a8i16
	lda	stage		; first timer?
	lbne	.shownext		; no, so join the dots
	lda	#10		; set stage to maximum, so
	sta	stage		; the complete line is drawn

;--------------------------
; first timer:
; let's initiate the virgin

	a16
	lda	#16
	sta.l	mspr_pal
.loophere
	inc	gameframe

	jsr	copylight

	jsr	spinplanets		; make the planets rotate

	lda.l	mspr_pal
	pha
	lda	#6
	sta.l	mspr_pal
	lda	#-2
	sta	currentplanet	; no current planet
	jsr	drawplanetsprites	; draw them funky sprites/spheres
	pla
	sta.l	mspr_pal

	jsr	dma256screen	; dma 256 colour screen
	lda.l	mspr_pal
	beq	.full
	sec
	sbc	#4
	sta.l	mspr_pal
.full
	jsr	switchbuffer_fast	; switch in new screen
	lda	gameframe
	bit	#2
	beq	.off
	jsl	drawplanetlines_l
	bra	.on
.off
	jsl	undrawplanetlines_l
.on
	jsl	read_joypad_l		; timed key read

	lda	trig0			; check for stage select
	bit	#pad_SELECT!pad_LEFT!pad_RIGHT!pad_UP!pad_DOWN
	beq	.nopress
.fadeoot
	lda	#16
	sta.l	mspr_pal
.nomorefadeout
	jsr	waitdma224
	jsl	undrawplanetlines_l	; clear the course line entirely
	lda	trig0
	bit	#pad_LEFT!pad_SELECT!pad_UP
	a8
	bne	.doleft			; go to doleft

	lda	whichroute
	inc	a			; else select next route
	cmp	#3
	bne	.ok
	lda	#0
.ok	sta	whichroute
	bra	.carryon2
.doleft	lda	whichroute
	dec	a			; select previous route
	cmp	#-1
	bne	.ok2
	lda	#2
.ok2	sta	whichroute
.carryon2
	trigse	se_cursor
.nxtfad123
.okey

.carryon
	jsr	drawroutename		; tell the player how easy it is
	a16


; NOTE: The following bit is best removed if the final game is released

.nopress
	IFNE	planetcheat ; planetcheat
	TESTJOYPAD	X		; cheat mode select?
	beq	.nocheat
	jsr	waitdma224
	jsl	undrawplanetlines_l	; clear the appropiate bitz
	lda	#10
	sta	stage
	jsl	drawplanetlines_l
	stz	stage
	stz	togglebit
	lda	#16
	sta	fadecount
	jsl	drawplanetlines_l
	jmp	.cheatmode		; hit that funky cheat
.nocheat
	ENDC ; planetcheat

	lda	trig0
	bit	#pad_START!pad_A!pad_B
	lbeq	.loophere			; and around we go again, unless
					; the berk pushed start!A
					; now yer do' wanna do thaet...

	stz	stage			; select stage 0
	stz	currentplanet		; and the start planet
	jsl	drawplanetlines_l	; set the stage
	a8
	startbgm	$f1
	a16
	lbra	.continuewithgame	; and get on with it

	IFNE	planetcheat ; planetcheat

.cheatmode
	jsr	drawroutename		; easy, normal or hard
	a8i16
.cheatloop
	jsl	read_joypadt_l		; cheat
	TESTJOYPAD	DOWN
	bne		.newroute
	TESTJOYPAD	UP
	beq		.nocheatdown
.newroute3
	inc	stage			; cheat
	jsr	waitdma224		; cheat
	jsl	undrawplanetlines_l	; cheat
	stz	stage			; cheat
	lda	whichroute		; cheat
	inc	a			; cheat
	cmp	#3			; cheat
	bne	.cheatok3		; cheat
	lda	#0			; cheat
.cheatok3	sta	whichroute		; cheat
	bra	.newroute2

.nocheatdown
	TESTJOYPAD	SELECT		; cheat
	beq	.cheatnosel		; cheat
.newroute	inc	stage			; cheat
	jsr	waitdma224		; cheat
	jsl	undrawplanetlines_l	; cheat
	lda	#10
	sta	stage
	jsl	drawplanetlines_l
	stz	stage			; cheat
	lda	whichroute		; cheat
	dec	a			; cheat
	cmp	#3			; cheat
	bcc	.cheatok45		; cheat
	lda	#2			; cheat
.cheatok45	sta	whichroute		; cheat
.newroute2
	trigse	se_cursor
	jsl	drawplanetlines_l	; cheat
	lda	#16			; cheat
	sta	fadecount		; cheat
	stz	togglebit		; cheat
	jsr	drawroutename		; cheat
	jsr	setshippos
.cheatnosel					; cheat
	TESTJOYPAD	LEFT		; cheat
	beq	.nocheatleft		; cheat
	lda	stage			; cheat
	beq	.nocheatleft		; cheat
	dec	stage			; cheat
	jsr	setshippos
	bra	.waitoncemore		; cheat
.nocheatleft					; cheat
	TESTJOYPAD	RIGHT		; cheat
	beq	.nocheatright		; cheat
	inc	stage			; cheat
	lda	#16			; cheat
	sta	fadecount		; cheat
	stz	togglebit		; cheat
	jsr	waitdma224		; cheat
	jsl	drawplanetlines_l	; cheat
	lbcs	.cheatfinished		; cheat
	dec	stage			; cheat
	bra	.waitoncemore		; cheat
.nocheatright				; cheat
	jsr	waitdma224		; cheat
	jsl	drawplanetlines_l	; cheat

.waitoncemore				; cheat
	jsl	read_joypadt_l		; cheat
	TESTJOYPAD	START		; cheat
	lbne	.cheatfinished		; cheat
	TESTJOYPAD	UP
	lbne	.newroute
	TESTJOYPAD	DOWN
	lbne	.newroute3
	TESTJOYPAD	SELECT		; cheat
	lbne	.newroute		; cheat
	TESTJOYPAD	RIGHT		; cheat
	beq	.noright		; cheat
	trigse	se_cursor
	inc	stage			; cheat
	jsr	setshippos
	bra	.continue
.noright	TESTJOYPAD	LEFT		; cheat
	beq	.noleft			; cheat
	lda	stage
	beq	.continue
	dec	stage			; cheat
	jsr	setshippos
	trigse	se_cursor
.noleft					; cheat
	bra	.waitoncemore		; cheat
.continue					; cheat
	brl	.waitoncemore
	brl	.cheatloop		; cheat
.cheatfinished				; cheat
	jsl	drawplanetlines_l	; cheat
	jmp	.continuewithgame	; cheat

	ENDC

	shorta
	longi
.shownext
	a8
	jsr	drawroutename		; tell the player how easy it is
.switchonloop
	ldx	x1
	phx
	lda	#-1
	sta	currentplanet
	jsr	copylight
	jsr	spinplanets
	jsr	drawplanetsprites
	jsr	dma256screen
	jsr	switchbuffer_fast
	plx
	stx	x1
	jsr	moveshipalongpath
	bcc	.switchonloop
.loopyd

	jsr	waitdma224
	jsl	drawplanetlines_l	; just to make sure, draw it again

	lda	#tm_planets
	sta	trans_flag
	lda	currentplanet
	pha
	lda	#-2
	sta	currentplanet
.rotateforabit
	jsr	copylight
	jsr	spinplanets
	jsr	drawplanetsprites
	jsr	dma256screen		; dma 256 colour screen
	jsr	switchbuffer_fast
	jsl	read_joypad_l

	a16
	lda	trig0
	bit	#pad_B!pad_START!pad_Y!pad_A!pad_X
	a8
	beq	.rotateforabit

	pla
	sta	currentplanet

.continuewithgame
	a8i16
	startbgm	$f1
	trigse	$10
	lda	#1
	sta	flashship

	lda	#4*20+3
.andagainwait
	pha
	jsr	waitdma224
	pla
	dec	a
	bne	.andagainwait

	disable
	waitdma	224
	jsr	setupplanetwindow	; set up the filter window's parameters
	jsr	waitdma224
	jsr	waitdma224

; here, we fade everything apart from the selected planet by using
; window 1 on BG1 and hdma channel 2

	a8i16
	ldx	#0
.andagainfade
	phx
	lda	#1
.nxtwait	pha
	txa
	jsr	fadecol0		; fade colour 0 and timed wait
	pla
	dec	a
	bne	.nxtwait		; slow down the fade a bit
	plx
	txa
	ora	#%11100000
	sta	coldata			; fade it (5 bit resolution - )
	inx				;         (better than inidisp)
	cpx	#32
	bne	.andagainfade
.finished
; now clear the mario bitmap entirely
	jsr	clearscreen

	a8
	jsr	waitdma224
	waithtime	0,15
	lda	#1
	sta	tm			; enable only bg1
	a16

	jsr	clearlines		; clear the lines
	jsr	drawselectedplanet	; redraw the selected planet only
	enable
	jsr	dma256screen		; and dma it
	disable
	jsr	switchbuffer		; and show it
	jsr	disablewindow		; turn off the window

	stz	bg1scrx
	stz	bg1scry
	stz	bg2scrx
	stz	bg2scry
	stz	scrdxl
	stz	scrdyl			; clear all scroll registers

;-----------------------------------
	ldx	#32			; 32 frames and counting

.scrollitabit
	phx
	stx	scrframesb
	jsr	calcdxdy		; gradient for smooth scroll

	a16

	lda	scrdx
	clc
	adc	bg1scrx
	sta	bg1scrx
	lda	scrdy
	clc
	adc	bg1scry
	sta	bg1scry			; add the vectors

	jsr	waitdma224
; copy the scroll regs in
	a8
	lda	bg1scrx
	sta	bg1hofs
	lda	bg1scrx+1
	sta	bg1hofs
	lda	bg1scry
	sta	bg1vofs
	lda	bg1scry+1
	sta	bg1vofs			; set the scroll registers

	plx
	dex
	bne	.scrollitabit

;----------------------------------------------------------
; initialise the hdma
	a8i16
	lda	#1<<1
	sta	hdmaen			; start inidisp hdma going
	waitdma	100
	waitdma	98			; wait for hdma to take hold


;----------------------------------------------------------
; ok, now for a bit of General Pepper...


	decvramwait	0,(p_bg2_cgx+pepperscreensize/2)+64/2,dogccr,4*k,0,planvw_pos2
	decbg2vramwait	0,p_bg2_scr,dogpcr,2*k,2,planvw_pos2


	jsr	copyfox


	waitdma	planvw_pos2
; set up the fade to just fade bg2
	lda	#1+2
	sta	tm
	lda	#%10000010
	sta	cgadsub
	stz	cgswsel
	lda	#%11111111
	sta	coldata			; set up a filter fade
	sta.l	pepperfade

	ldx	#planvw_pos2+2	; top of the screen
	stx	vtimel		; set position for irq

	lda	#tm_planets2
	sta	trans_flag
	enable


	jsr	clearpepperscreen
	jsr	dmapepperscreen


;----------------------------------------------------------
; clear the mario bitmap again

	jsr	clearscreen

	a16
	lda	#15
	sta.l	m_radius		; radius=16 (32x32)
	lda	#(15*32768)/16
	sta.l	m_scale			; set the intensity to max

; now comes the tricky bit, all the cgx and scr change entirely but
; the selected stage stays in the centre of the screen and the player
; shouldn't spot a thing (fingers crossed)

	jsr	drawplanetincentre	; reposition planet in bitmap
	jsr	dma256screen_fast	; dma it

	a8
	lda	#-40
	sta	bg1vofs
	stz	bg1vofs
	stz	bg1hofs
	stz	bg1hofs			; reposition all scroll offsets

	lda	#p_bg1_scr2>>8
	sta	bg1sc			; change bg1 screen to square

; da da.. the screen format has been changed without anyone noticing

; trigger the zoom sound...
	a16
	lda	currentplanet
	asl	a
	tax
	a8
	lda.l	planetsprs,x
	bit	#128
	bne	.spheresnd
	startbgm	bgm_mapselectshort
	bra	.miss
.spheresnd	startbgm	bgm_mapselect
.miss

; now the hdma is switching the screen on and off to give us an effective
; forced blanking period of over half the screen
	ldx	#40
.pauseabit
	phx
	jsr	spinplanets
	jsr	drawplanetincentre	; draw it
	jsr	dma256screen_fast	; transfer it \
;	jsr	switchbuffer_fast	; show it      >(should only take 1 vbl)

	a16
	lda	currentplanet
	asl	a
	tax
	lda.l	planetsprs,x
	bit	#128
	bne	.sphere
; zoom up for texture map
	lda.l	m_radius
	inc	a
	cmp	#126
	beq	.nomore
	sta.l	m_radius
	bit	#1
	beq	.nomore
	plx

	cpx	#20
	bne	.nofadeup
	a8
	lda	#254
	sta.l	pepperfade
.nofadeup	a16

	inx
	phx
	bra	.nomore
.sphere
; zoom up for sphere
	plx

	cpx	#5
	bne	.nofadeup2
	a8
	lda	#254
	sta.l	pepperfade
.nofadeup2	a16
	phx

	lda.l	m_radius
	inc	a
	cmp	#58
	beq	.nomore
	sta.l	m_radius		; zooooom in reet close
.nomore
; now to play around with light source position
	lda.l	m_roty
	clc
	adc	#4*256
	sta.l	m_roty

	lda.l	m_lxpos
	sec
	sbc	#10
	sta.l	m_lxpos

	lda.l	m_lzpos
	clc
	adc	#10
	sta.l	m_lzpos

	plx
	cpx	#16+2
	bcs	.con

	txy
	a8
	dex
	lda.l	fadetable,x
;	sta	coldata			; fade the screen out

	tyx
	a16
.con
	dex
	lbne	.pauseabit


;-------------------------------------------------------------------
; now for the Pepper to speak
	a8i16
	ldx	#planvw_pos3+2	; top of the screen
	stx	vtimel		; set position for irq

	lda	#planmdm2
	sta	mario_draw_mode

	lda	#0
	sta.l	pepperchars

	lda	#34
	sta.l	xinidisp4-1

	waitdma	planvw_pos3

	stz	bg2vofs
	stz	bg2vofs
	stz	bg2hofs
	stz	bg2hofs

.muttering2
	jsr	clearpepperscreen
	jsr	showplanetname
	jsr	dmapepperscreen

	a16
	lda.l	m_totalchars
	a8
	bne	.exitmutter
	lda.l	m_lastchar
	cmp	#39
	beq	.nosound2
	trigse	$89
.nosound2
;	lda	#5
;.waitabit2	pha
;	waitdma	121
;	waitdma	120
;	pla
;	dec	a
;	beq	.waitabit2

	lda.l	pepperchars
	inc	a
	sta.l	pepperchars

	bra	.muttering2
.exitmutter
	lda	#0
	sta.l	pepperchars
.muttering
	jsr	clearpepperscreen
	lda.l	pepperchars
	pha
	lda	#255
	sta.l	pepperchars
	jsr	showplanetname
	pla
	sta.l	pepperchars
	jsr	pepperspeaking
	jsr	dmapepperscreen

	a16
	lda.l	m_totalchars
	a8
	bne	.nosound
	lda.l	m_lastchar
	cmp	#39
	beq	.nosound
	trigse	$89
.nosound

	lda	#50
.waitabit	pha
	jsl	read_joypadt_l
	waitdma	120
	TESTJOYPAD	start
	bne		.exitpepper
	TESTJOYPAD	B
	bne		.exitpepper
	TESTJOYPAD	A
	bne		.exitpepper
	pla
	dec	a
	beq	.waitabit

	lda.l	pepperchars
	cmp	#255
	beq	.exitpepper2
	inc	a
	sta.l	pepperchars

	bra	.muttering

.exitpepper
	pla
.exitpepper2
	trigse	$13

	waitdma	224
	waitdma	222	; wait one frame to trigger se
	waitdma	224
	waitdma	222	; wait another frame to trigger se

	disable
	a8
	lda	#%10000011
	sta	cgadsub
	stz	cgswsel
	lda	#%11100000
	sta	coldata			; set up a filter fade


	lda	#0
.fadeitallout
	pha
	waitdma	planvw_pos3+1
	waitdma	planvw_pos3
	pla
	ora	#%11100000
	sta	coldata
	and	#%11111
	inc	a
	cmp	#32
	bne	.fadeitallout



;------------------------------------------
; initialise game

	jsr	convertroute

	jsr	waitdma224

.leaveplanets
	IFEQ	1
	a8
	stz	bg1hofs
	stz	bg1hofs
	stz	bg1vofs
	stz	bg1vofs

	stz	bg2hofs
	stz	bg2hofs
	stz	bg2vofs
	stz	bg2vofs

	stz	bg3hofs
	stz	bg3hofs
	stz	bg3vofs
	stz	bg3vofs

	stz	bg4hofs
	stz	bg4hofs
	stz	bg4vofs
	stz	bg4vofs

	stz	hdmaen

	lda	#$80
	sta	inidisp			; screen no more

	setdepth	night

	ai16
	jsl	kill_list_l
	a8i16
	lda	drawmap+1		;set mario draw base
	lsr	a
	lsr	a
	sta	m_scbr
	stz	trans_flag

	a16				;set text prt parameters
	lda	#1
	sta.l	m_clrbitmaps
	ENDC

	ai16
	setlevel			; set starting level

;	slow
	jml	gamestart

; and there we have it, all over and done with
























;-----------------------------------------------------
setshippos
	php
	a8i16
	jsl	drawplanetlines_l

	lda	currentplanet
	a16
	and	#255
	asl	a
	asl	a
	tax
	lda.l	planetpos+2,x
	sta	newshipxy
	sta	shipxy

	a8
	lda	stage
	pha
	lda	#20
	sta	stage
	jsl	drawplanetlines_l

	pla
	sta	stage

	plp
	rts
;-----------------------------------------------------
moveshipalongpath
	php
	ai16

	lda	shipxy
	cmp	newshipxy
	lbne	.different

	a8
	ldx	x1
	beq	.nochk
	lda.l	stagepaths,x
	bpl	.noprobs
.nochk
	jsl	drawplanetlines_l
	lda	currentplanet
	a16
	stz	x1
	asl	a
	tax
	lda.l	endplanetpos,x
	sta	newshipxy
	cmp	shipxy
	beq	.finished
	a8
	lda	newshipxy+1	; if new y<old y then new y = old y
	cmp	shipxy+1
	bmi	.different
	lda	shipxy+1
	sta	newshipxy+1
	a16
	lda	shipxy
	cmp	newshipxy
	beq	.finished
	a8
	jmp	.different
.noprobs	SHORTA
	cmp	#upchar&255
	beq	.oneangle
	cmp	#uprightchar&255
	beq	.otherangle
	lda	#2
	bra	.onedone
.otherangle
	lda	#1
	bra	.onedone
.oneangle	lda	#0
.onedone
	sta	shipangle

	a16
	ldy	currentsprite
	lda.l	stagepaths,x
	sta.w	sprchar,y
	lda	y1
	sta.w	sprx,y
	iny
	iny
	iny
	iny
	sty	currentsprite

	lda	y1
	clc
	adc.l	stagepaths+2,x
	sta	y1
	sec
	sbc	#16+(8<<8)
	sta	newshipxy


	inx
	inx
	inx
	inx
	stx	x1


.different
	plp
	clc
	rts

.finished	plp
	sec
	rts

;-----------------------------------------------------
copylight
	php
	a8
	lda	oldcomet
	bne	.nosound
	lda	comet
	beq	.nosound
	trigse	$91
.nosound
	lda	comet
	sta	oldcomet
	ai16
	lda	lightz
	sta.l	m_lzpos

	lda	comet
	and	#255
	bne	.faster
	lda.l	m_lxpos
	ldx	lightx
	jsr	.chase
	sta.l	m_lxpos
	
	lda.l	m_lypos
	ldx	lighty
	jsr	.chase
	sta.l	m_lypos

	plp
	rts

.faster
	lda.l	m_lxpos
	ldx	lightx
	jsr	.chase2
	sta.l	m_lxpos
	
	lda.l	m_lypos
	ldx	lighty
	jsr	.chase2
	sta.l	m_lypos

	plp
	rts

.chase	stx	x1
	cmp	x1
	bmi	.incme
	dec	a
	rts
.incme	inc	a
	rts
.chase2	stx	x1
	cmp	x1
	bmi	.incmetwice
	sec
	sbc	#16
	rts
.incmetwice	clc
	adc	#16
	rts

;-----------------------------------------------------
spinplanets
; spin the planets around at their appropiate rates
	php
	ai16

	ldx	#0
.nxtone
	lda	roty1,x
	clc
	adc.l	.speeds,x
	sta	roty1,x
	inx
	inx
	cpx	#6*2
	bne	.nxtone

	plp
	rts

.speeds	dw	6*256
	dw	-3*256
	dw	4*256
	dw	3*256
	dw	-5*256
	dw	-5*256

planet_rotz
	dw	28*256
	dw	-10*256
	dw	40*256
	dw	50*256
	dw	-20*256
	dw	-28*256

;-----------------------------------------------------
clearlines
; clear the line character data
	IFEQ	1
	php
	ai16
	jsr	waitdma224
	lda	vmap2
	clc
	adc	#(16*16+singledot)*8*8/2
	sta	vmaddl

	ldx	#(64*4)/2/8
.andagainclear
	stz	vmdatal
	stz	vmdatal
	stz	vmdatal
	stz	vmdatal
	stz	vmdatal
	stz	vmdatal
	stz	vmdatal
	stz	vmdatal
	stz	vmdatal
	dex
	bne	.andagainclear
	
	lda	vmap1
	clc
	adc	#(16*16+singledot)*8*8/2
	sta	vmaddl

	ldx	#(64*4)/2/8
.andagainclear2
	stz	vmdatal
	stz	vmdatal
	stz	vmdatal
	stz	vmdatal
	stz	vmdatal
	stz	vmdatal
	stz	vmdatal
	stz	vmdatal
	stz	vmdatal
	dex
	bne	.andagainclear2

	plp
	ENDC
	rts


;-----------------------------------------------------
disablewindow
	php
	a8
	jsr	waitdma224
	stz	coldata
;	lda	#1<<3
;	sta	hdmaen
	stz	cgswsel
	stz	cgadsub
	stz	wobjsel
	plp
	rts

;-----------------------------------------------------
; copy the fox graphic from the map screen into
; its new position on the pepper screen (0-$180)

copyfox
	php
	ai16

	waitdma	planvw_pos2

	disable

	a8
	lda	#128
	sta	vmainc
	a16

	ldx	#p_bg2_cgx+32*16
	ldy	#p_bg2_cgx+pepperscreensize/2+($40+2)*16
.madacopyshiteinai
	stx	vmaddl
	lda	vmdatalr
	sty	vmaddl
	sta	vmdatal	; copy word

	inx
	iny

	cpx	#(p_bg2_cgx+32*16)+20*16
	bne	.madacopyshiteinai

	enable

	plp
	rts
;-----------------------------------------------------

setupplanetwindow
	php
	ai16

	waitdma	224

; set up a window for bg1 so everything can
; be faded apart from the selected planet

	lda	currentplanet
	asl	a
	asl	a
	tax
	a8
	lda.l	planetpos+2,x
	inc	a
	sta	wh0	; left edge
	clc
	adc	#29
	sta	wh1	; right edge

	lda.l	planetpos+3,x
	lsr	a
	sta	x1
	sta.l	xhdma_wv0

	lda.l	planetpos+3,x
	sec
	sbc	x1
	sta.l	xhdma_wv1	; set vertical position

	lda	#(1<<2)!(1<<3)
	sta	hdmaen

	lda	#3<<4
	sta	wobjsel

	stz	wbglog
	lda	#%1100
	stz	wobjlog

	lda	#1+2
	sta	tm
	lda	#1
	sta	ts

	stz	tmw
	stz	tsw

	lda	#%00100000
	sta	cgswsel		; set filter on

	lda	#%10010011	; set subtraction mode
	sta	cgadsub

	lda	#%11100000
	sta	coldata

	plp
	rts

;-----------------------------------------------------

drawroutename
	php
	ai16
	phx
	lda	x1
	pha
	lda	tpa
	pha

	jsl	calctotalscore_l

	jsr	waitdma224
	lda	#p_bg2_scr+32*25+24
	sta	vmaddl

	lda	whichroute
	and	#255
	asl	a
	tax
	lda.l	chars,x
	sta	vmdatal
	inc	a
	sta	vmdatal
	inc	a
	sta	vmdatal
	inc	a
	sta	vmdatal
	inc	a
	sta	vmdatal
	inc	a
	sta	vmdatal

	lda	#p_bg2_scr+32*24+24
	sta	vmaddl
	lda	#100
	jsr	.countup
	lda	#10
	jsr	.countup
	lda	#1
	jsr	.countup

	lda	#$88+32+(6<<10)
	sta	vmdatal
	sta	vmdatal

	ldy	credits
	beq	.nocreds
	lda	#p_bg2_scr+32*23+27
	sta	vmaddl
	lda	#$be+32+(6<<10)
.creds
	sta	vmdatal
	dey
	bne	.creds
.nocreds

	pla
	sta	tpa
	pla
	sta	x1
	plx
	plp
	rts
.countup	sta	x1
	ldx	#-1
	lda	tpa
.countup2
	inx
	sec
	sbc	x1
	bpl	.countup2
.counted	clc
	adc	x1
	sta	tpa
	txa
	clc
	adc	#32+$88+(6<<10)
	sta	vmdatal
	rts
	

chars
	dw	$74+32+(6<<10)	; normal
	dw	$6e+32+(6<<10)	; easy
	dw	$7a+32+(6<<10)	; hard

blitscreen
	php
	a8i16
	ldx	vmap1			; blit the mario screen in
	dmaxvram	7,(bitmapbase+bitmap1),planbmpsz
	plp
	rts

clearscreen
	php
	a8i16
	call_mario	mclrmapscreen
	plp
	rts

;-----------------------------------------------------


dmapepperscreen
	php
	a8i16

.wait	lda	planetdma
	bne	.wait

	inc	planetdma

.wait2	lda	planetdma
	bne	.wait2

;	waitdma	planvw_pos3
;	ldx	#p_bg2_cgx+64/2
;	dmaxvram	7,(bitmapbase+bitmap1),peppersize1
;
;	waitdma	planvw_pos3
;	ldx	#p_bg2_cgx+64/2+peppersize1/2
;	dmaxvram	7,(bitmapbase+bitmap1)+peppersize1,peppersize2
;
;	waitdma	planvw_pos3
;	ldx	#p_bg2_cgx+64/2+peppersize1/2+peppersize2/2
;	dmaxvram	7,(bitmapbase+bitmap1)++peppersize1+peppersize2,peppersize3

	plp
	rts

;-----------------------------------------------------
clearpepperscreen
	php
	a8i16

	call_mario	mclrpepperscreen

	plp
	rts


;-----------------------------------------------------

amount1	=	(planbmpsz/4)
amount2	=	(planbmpsz/4)
amount3	=	(planbmpsz/4)
amount4	=	(planbmpsz/4)

dma256screen
	php
	a8i16

.notyet	lda	planetdma
	bne	.notyet

	lda	#1
	sta	planetdma

.notyet2	lda	planetdma
	bne	.notyet2

;	php
;	a8i16
;	jsr	waitforirq
;	ldx	vmap2
;	dmaxvram	7,(bitmapbase+bitmap1),amount1
;
;	jsr	waitforirq
;	a16
;	lda	vmap2
;	clc
;	adc	#amount1/2
;	tax
;	a8
;	dmaxvram	7,(bitmapbase+bitmap1)+amount1,amount2
;
;	jsr	waitforirq
;	a16
;	lda	vmap2
;	clc
;	adc	#(amount1+amount2)/2
;	tax
;	a8
;	dmaxvram	7,(bitmapbase+bitmap1)+amount1+amount2,amount3
;
;	jsr	waitforirq
;	a16
;	lda	vmap2
;	clc
;	adc	#(amount1+amount2+amount3)/2
;	tax
;	a8
;	dmaxvram	0,(bitmapbase+bitmap1)+amount1+amount2+amount3,amount4
;
;;	jsr	planetanim

	plp
	rts

planetanim
	php
	a16
	lda	gameframe
	and	#7
	rol	a
	tax
	a8
	jmp	(.tab,x)
.tab	dw	.ptrn1&WM
	dw	.ptrn2&WM
	dw	.ptrn3&WM
	dw	.ptrn4&WM
	dw	.ptrn4&WM
	dw	.ptrn3&WM
	dw	.ptrn2&WM
	dw	.ptrn1&WM
mapanimchar	=	$c2+32
.ptrn1	ldx		#p_bg2_cgx+mapanimchar*2*8
	dmaxvram	0,(mapanim_chars),4*8*4
	brl		.out
.ptrn2	ldx		#p_bg2_cgx+mapanimchar*2*8
	dmaxvram	0,(mapanim_chars+4*8*4),4*8*4
	bra		.out
.ptrn3	ldx		#p_bg2_cgx+mapanimchar*2*8
	dmaxvram	0,(mapanim_chars+4*8*4*2),4*8*4
	bra		.out
.ptrn4	ldx		#p_bg2_cgx+mapanimchar*2*8
	dmaxvram	0,(mapanim_chars+4*8*4*3),4*8*4
.out
	inc	gameframe
	plp
	rts


;-----------------------------------------------------

amount1	=	planbmpsz

dma256screen_fast
	php
	a8i16
.wait	lda	planetdma
	bne	.wait
	lda	#4
	sta	planetdma
.wait2	lda	planetdma
	bne	.wait2
	plp
	rts

	

;	a8i16
;	waitdma	planvw_pos2+4
;	ldx	vmap2
;	dmaxvram	0,(bitmapbase+bitmap1),amount1
;	plp
;	rts

;--------------------------------------------------------

switchbuffer_fast
	php
	a16
	bra	switchbuffer.quick
switchbuffer
	php
	a16
	waitdma	224
.quick	LOCAL
	lda	#p_bg1_cgx1
	cmp	vmap1
	beq	.switch1
	sta	vmap1
	lda	#p_bg1_cgx2
	sta	vmap2
	bra	.con

.switch1
	sta	vmap2
	lda	#p_bg1_cgx2
	sta	vmap1
.con
	a8
	lda	vmap1+1
	lsr	a
	lsr	a
	lsr	a
	lsr	a
	ora	#(p_bg2_cgx>>12)<<4
	sta	bg12nba

	plp
	rts

;---------------------------------------------------------
calcdxdy
	php
	ai16
	lda	currentplanet
	and	#255
	asl	a
	asl	a
	tax
	lda	scrdxl
	sta	remainder
	lda.l	planetpos+2,x
	and	#255
	sec
	sbc	#centrx
	sec
	sbc	bg1scrx
	beq	.nochange
	jsr	dividebynum
.nochange	sta	scrdx
	lda	remainder
	sta	scrdxl

	lda	scrdyl
	sta	remainder
	lda.l	planetpos+3,x
	and	#255
	sec
	sbc	#centry
	sec
	sbc	bg1scry
	beq	.nochange2
	jsr	dividebynum
.nochange2	sta	scrdy
	lda	remainder
	sta	scrdyl
	
	plp
	rts

	longa
dividebynum
; a is number (16 bit) to divide by x1
	php
	phx
	i16
	cmp	#32768
	bcs	.negative divide

	ldx	#-1
.divide	inx
	sec
	sbc	scrframesb
	bcs	.divide
	clc
	adc	scrframesb
	clc
	adc	remainder
	cmp	scrframesb
	bcc	.norm2
	sec
	sbc	scrframesb
	inx
.norm2	sta	remainder
	txa
	plx
	plp
	rts

.negative	ldx	#1
.ndivide	dex
	clc
	adc	scrframesb
	bcc	.ndivide
	sec
	sbc	scrframesb
	clc
	adc	remainder
	cmp	scrframesb
	bcc	.norm
	sec
	sbc	scrframesb
	dex
.norm	sta	remainder
	txa
	plx
	plp
	rts


;---------------------------------------------------------
drawselectedplanet
	php
	ai16

	lda	currentplanet
	jsr	setupplanetcoord

	lda	currentplanet
	and	#3
	xba
	lsr	a
	lsr	a
	lsr	a
	clc
	adc	#16
	sta.l	m_xc	;mspr_x
	lda	currentplanet
	and	#(~3)&255
	asl	a
	asl	a
	asl	a
	clc
	adc	#16
	sta.l	m_yc	;mspr_y
	lda	#6
	sta.l	mspr_pal
	lda	#(15*32768)/16
	sta.l	m_scale	; set the intensity

	lda	currentplanet
	asl	a
	tax
	lda.l	planetsprs,x
	sta.l	msprite
	lda	#15
	sta.l	m_radius
	a8
	lda.l	msprite
	bmi	.sphere
	lda	#mdrawsprite32>>16
	ldx	#mdrawsprite32&$ffff
	jsl	runmario_l
	bra	.out
.sphere	and	#127
	sta.l	msprite
	lda	#mdrawtsphere>>16
	ldx	#mdrawtsphere&$ffff
	jsl	runmario_l
.out
	plp
	rts

;----------------------------------------------------------
setupplanetcoord
; grab the true x and y of the planet
	php
	ai16
	asl	a
	pha
	asl	a
	tax
	lda.l	planetpos+2,x
	and	#255
	sta.l	m_bigx
	lda.l	planetpos+3,x
	and	#255
	sta.l	m_bigy
	lda	#0
	sta.l	m_bigz
	plx
	lda.l	planetsprs+1,x
	and	#255
	tax
	lda.l	roty1,x
	sta.l	m_roty
	lda.l	planet_rotz,x
	cmp	#-1
	bne	.ok
	tay
	lda.l	m_roty
	sta.l	m_rotz
	tya
	sta.l	m_roty
	bra	.other
.ok	sta.l	m_rotz
.other
	plp
	rts
;---------------------------------------------------------

drawplanetincentre
	php
	ai16
	lda	#64
	sta.l	m_xc	;mspr_x
	sta.l	m_yc	;mspr_y
	lda	#6
	sta.l	mspr_pal

	lda	#32
	sta.l	m_sprsize

	lda.l	m_radius
	clc
	adc	#32-15
	sta.l	m_sprxscale

	lda	currentplanet
	jsr	setupplanetcoord

	lda	currentplanet
	asl	a
	tax
	lda.l	planetsprs,x
	sta.l	msprite
	a8
	lda.l	msprite
	bmi	.sphere
	lda	#musprite>>16
	ldx	#musprite&$ffff
	jsl	runmario_l
	bra	.out
.sphere	and	#127
	sta.l	msprite
	lda	#mdrawtsphere>>16
	ldx	#mdrawtsphere&$ffff
	jsl	runmario_l
.out
	plp
	rts
;---------------------------------------------------------

drawplanetsprites
	php
	ai16
	lda.l	mspr_pal
	eor	#15
	and	#15
	xba

	asl	a
	asl	a
	asl	a
	lda	#(15*32768)/16
	sta.l	m_scale

	ldx	#0
	lda	#-16
	sta.l	m_xc	;mspr_x
	lda	#16
	sta.l	m_yc	;mspr_y
.nxtone
	lda.l	nebula_on
	bne	.fine
	cpx	#14
	bne	.fine

	jsr	.addxy

	jmp	.end
	
.fine	phx
	txa
	asl	a
	tax
	lda.l	planetsprs,x
	and	#255
	sta.l	msprite
	txa
	lsr	a
	tax
	
; first let's grab the true x and y of the planet
	phx
	txa
	jsr	setupplanetcoord
	plx


; now let's get the phoney x and y coordinates
	jsr	.addxy

	lda	#15
	sta.l	m_radius
	a8
	cpx	currentplanet
	beq	.nocando
	lda.l	msprite
	bmi	.sphere
	lda	currentplanet
	cmp	#-2		; no texture maps
	beq	.nocando
	lda	#mdrawsprite32>>16
	ldx	#mdrawsprite32&$ffff
	jsl	runmario_l
	bra	.nocando
	
.sphere
	and	#127
	sta.l	msprite
	lda	#mdrawtsphere>>16
	ldx	#mdrawtsphere&$ffff
	jsl	runmario_l
.nocando
	a16
	plx
.end	inx
	cpx	#16
	lbne	.nxtone

	plp
	rts

.addxy
	lda.l	m_xc	;mspr_x
	clc
	adc	#32
	sta.l	m_xc	;mspr_x
	cmp	#128
	bcc	.noyinc
	lda	#16
	sta.l	m_xc	;mspr_x
	lda.l	m_yc	;mspr_y
	clc
	adc	#32
	sta.l	m_yc	;mspr_y
.noyinc	rts

;---------------------------------------------------------

setupplanetpal_l
; this sets up the palette for the planet selection screen

	php
	a8i16
	stz	cgadd
	ldx	#0
.loop
	lda.l	planselpal,x
	sta	cgdata
	inx
	cpx	#256*2
	bne	.loop

	plp
	rtl

;----------------------------------------------------------------
; fade colour 0 down with the rest of the screen
fadecol0	php
	a8i16
	pha
	jsr	waitdma224

	pla
	a16
	and	#254
	tax
	a8

	stz	cgadd
	lda.l	fadetab0,x
	sta	cgdata
	lda.l	fadetab0+1,x
	sta	cgdata
	

	plp
	rts

;----------------------------------------------------------------
fadelines2
; fade the lines on vmap1
	IFEQ	1
	php
	ai16
	jsr	waitdma224
	lda	vmap1
	jmp	fadin
	ENDC
fadelines
; fade the lines on vmap2
	IFEQ	1
	php
	ai16
	jsr	waitdma224
	lda	vmap2
fadin
	clc
	adc	#(16*16+singledot)*8*8/2
	sta	vmaddl

	ldy	#4
	ldx	#0
.andagain
temp	=	0
	REPT	16
	lda	mycrapchars+temp,x
	sta	vmdatal
temp	=	temp+2
	ENDR
	txa
	clc
	adc	#64
	tax

	phx

	lda.l	mspr_pal
	inc	a
	cmp	#16
	bne	.ok
	dec	a
.ok
	eor	#15
	asl	a
	tax
	lda.l	shaded_chars,x
	tax

temp	=	0
	REPT	16
	lda.l	shaded_chars+temp,x
	sta	vmdatal
temp	=	temp+2
	ENDR

	plx

	dey
	lbne	.andagain

	plp
	ENDC
	rts

;----------------------------------------------------------------

copychar
	IFEQ	1
	php
	ai16
	lda	#(16*16+singledot)*8*8/2
	clc
	adc	vmap1
	sta	vmaddl
	lda	currentchar
	and	#255
	dec	a
	xba
	lsr	a
	lsr	a
	tax
	ldy	#16

temp	=	0
	REPT	16
	lda	mycrapchars+temp,x
	sta	vmdatal
temp	=	temp+2
	ENDR

	lda	fadecount
	and	#15
	inc	a
	cmp	#16
	bne	.ok
	dec	a
.ok
	asl	a
	tax
	lda.l	shaded_chars,x
	tax

	lda	togglebit
	bit	#1
	lbne	.firstdot

	ldy	#mycrapmask
temp	=	0
	REPT	16
	lda.w	temp&15,y
	eor	#65535
	and.l	shaded_chars+temp,x
	sta	vmdatal
temp	=	temp+2
	ENDR

	bra	.seconddot
.firstdot
temp	=	0
	REPT	16
	lda.l	shaded_chars+temp,x
	sta	vmdatal
temp	=	temp+2
	ENDR
.seconddot


	plp
	ENDC
	rts

;----------------------------------------------------------------

fadecharsin
	php
	ai16
	lda	fadecount
	cmp	#14
	bcs	.getch
.carryon
	jsr	copychar
	lda	fadecount
	inc	a
	sta	fadecount
	cmp	#14
	bcc	.nowrite
	ldx	currentsprite
	lda	currentaddr
	sta	sprx,x
	lda	currentchar
	sta	sprchar,x
	inx
	inx
	inx
	inx
	stx	currentsprite

;	lda	currentaddr
;	sta	vmaddl
;	lda	currentchar
;	clc
;	adc	#256
;	sta	vmdatal

	bra	.out
.nowrite
;	lda	currentaddr
;	sta	vmaddl
;	lda	currentchar
;	and	#1<<15
;	ora	#singledot+256
;	sta	vmdatal

.out	plp
	clc
	rts

.exit	plp
	sec
	rts

.getch
	jsr	drawlinesbitbybit
	bcs	.exit

	stz	fadecount
	bra	.carryon

;--------------------------------------------------------------------
convertaddr
	a8
	asl	a
	asl	a
	asl	a
	xba
	asl	a
	asl	a
	asl	a
	xba
	a16
	sta	currentaddr
	rts
;--------------------------------------------------------------------

drawlinesbitbybit
	php
	ai16
	ldx	x1

;	lda	togglebit
;	bit	#1
;	bne	.norm

;	lda	y1

;	ldx	x1
;	lda.l	stagepaths,x
;	cmp	#-1
;	beq	.out
;	and	#1<<15
;	ora	#singledot
;	sta	currentchar
;	bra	.out2
	
.norm
	lda	y1
	clc
	adc.l	stagepaths+2,x
	sta	y1

	lda.l	stagepaths,x
	cmp	#-1
	beq	.out
	sta	currentchar
	inx
	inx
	inx
	inx
	stx	x1
	
.out2	inc	togglebit
	plp
	clc
	rts
.out
	plp
	sec
	rts

;------------------------------------------------------------------------

read_joypadt_l
; this sets up cont and trig after waiting for hvbjoy
	php
	a8
.notreadyyet2
	lda	hvbjoyr
	bit	#1
	beq	.notreadyyet2
.notreadyyet	lda	hvbjoyr
	bit	#1
	bne	.notreadyyet
	bra	read_joypad_l.readitall
	

;--------------------------------------------------------------------

read_joypad_l
; this sets up cont0-1 and trig0-1 (without timing)
	php
.readitall	LOCAL
	a16
	lda	joy1l
	pha
	eor	cont0l
	and	joy1l
	sta	trig0

	lda	joy2l
	pha
	eor	cont1l
	and	joy2l
	sta	trig1
	pla
	sta	cont1l
	pla
	sta	cont0l

	plp
	rtl

;-----------------------------------------------------------

undrawplanetlines_l
	php
	a8i16
	ldx	#planetlines_spr
	stx	currentsprite
	ldy	#maxplanetlines
	lda	#-8
.clragain
	sta	sprx,x
	sta	spry,x
	inx
	inx
	inx
	inx
	dey
	bne	.clragain
	
	plp
	rtl

;	stz	z1
;	bra	drawplanetlines_l.intoithere

;---------------------------------------------------------

drawplanetlines_l
	php
	ai16
	ldx	#planetlines_spr
	stx	currentsprite

;	lda	#-1
;	sta	z1
;.intoithere	LOCAL
	a8
	waitdma	30
	lda	stage
	sta	x1
	stz	x1+1
	ai16
	lda	whichroute
	asl	a
	and	#255
	tax
	lda.l	stagepaths,x
	tax

.chkformore
	lda.l	stagepaths,x
	and	#255
	lbeq	.out3
	cmp	#3
	beq	.pathstart
	cmp	#2
	beq	.pathchoice
.pathnext
	lda.l	stagepaths+1,x
	tax
	bra	.chkformore
.pathchoice
	lda.l	stagepaths+1,x
	tax
	lda	routes,x
	tax
	bra	.chkformore
.pathstart
	lda.l	stagepaths+1,x
	jsr	convertaddr	; get sprite x and y
	tay
	lda.l	stagepaths+3,x
	and	#255
	sta	currentplanet
	lda.l	stagepaths+4,x
	sta	newmap
	lda.l	stagepaths+5,x
	sta	newmap+1
	a8
	lda.l	stagepaths+7,x
	sta.l	peppermsg
	lda.l	stagepaths+8,x
	sta	currentlevel
	a16
	txa
	clc
	adc	#9
	tax
	lda	x1
	beq	.out
.nxtchar
	tya
	phx

	ldx	currentsprite
	sta	sprx,x

	plx
	clc
	adc.l	stagepaths+2,x
	tay


	lda.l	stagepaths,x
	cmp	#-1
	beq	.out2
	phx

	ldx	currentsprite
	sta	sprchar,x
	inx
	inx
	inx
	inx
	stx	currentsprite

	plx

;	sta	vmaddl
;	clc
;	adc.l	stagepaths+2,x
;	tay
;	lda.l	stagepaths,x
;	cmp	#32768
;	beq	.out2
;	and	z1
;	clc
;	adc	#256
;	sta	vmdatal
	inx
	inx
	inx
	inx
	bra	.nxtchar
.out2	inx
	inx
	dec	x1
	brl	.chkformore
.out3	plp
	sec
	rtl
	
.out	stx	x1
	sty	y1
	plp
	clc
	rtl

;---------------------------------------------------------

setup_planets_l
	php

	ai8
	disable

	stz	trans_flag
;Set Mario Chip for 16 colours 192 pixel high
	lda	#planmdm
	sta	mario_draw_mode

	screen_off

;clear video RAM
	stz	cgadd
	stz	vmaddl
	stz	vmaddh
	lda	#$80
	sta	inidisp
	sta	vmainc

;Clear VRAM
	lda	#$00
	ldx	#128
.ly	ldy	#0
.li	sta	vmdatal
	sta	vmdatah
	dey
	bne	.li
	dex
	bne	.ly

;init 3D system

	movi 0,clx1
	movi plannum_col*8-1,clx2
	movi 0,cly1
	movi plannum_row*8-1,cly2
	movi plannum_col*4,vanishx
	movi plannum_row*4,vanishy
	jsl	init3d2

	ai8

	lda	#deg180
	sta	roty
	lda	#-1
	sta	mariocode


;Set screen to blank chars
	ai16
	lda	#p_bg1_scr1
	sta	vmaddl
	lda	#plannum_col*plannum_row+1
	ldx	#1024
.cl	sta	vmdatal
	dex
	bne	.cl

	lda	#p_bg2_scr
	sta	vmaddl
	lda	#0
	ldx	#1024
.cl2	sta	vmdatal
	dex
	bne	.cl2

;Set character map 16 wide by 16 high
	a8i16
	jsl	setcharmapplan_l

;Set double buffering (VRAM only)
	i16
	ldx	#p_bg1_cgx1
	stx	vmap1
	ldx	#p_bg1_cgx2
	stx	vmap2
	ldx	#bitmap1
	stx	drawmap
	ldx	#bitmap1
	stx	showmap
	lda	drawmap+1		;set mario draw base
	lsr	a
	lsr	a
	sta	m_scbr

;Set hardware pointers to screen
	lda	vmap1+1
	lsr	a
	lsr	a
	lsr	a
	lsr	a
	ora	#(p_bg2_cgx>>12)<<4
	sta	bg12nba

	lda	#p_vobj_base>>(6+8)
	sta	objsel

;Set bg screen base address'
	lda	#p_bg1_scr1>>8
	sta	bg1sc
	lda	#p_bg2_scr>>8
	sta	bg2sc
	lda	#3
	sta	bgmode

;Set window logic, position, size.
	stz	w12sel
	stz	w34sel		;wh0,1 set with hdma
	stz	wobjsel
	stz	wbglog
	stz	wobjlog
	stz	tmw
	stz	tsw
	stz	wh0
	stz	wh1

	stz	cgswsel
	lda	#1+2+16
	sta	tm
	stz	ts
	stz	cgadsub
	stz	coldata

;Setup HDMA tables
	a16
	ldx	#0
.loop	lda.l	hdma_start,x
	sta.l	xhdma_start,x
	inx
	inx
	cpx	#hdma_end-hdma_start
	bcc	.loop

	a8
	lda	#0		;inidisp
	sta	ch1params
	lda	#inidisp&$ff
	sta	ch1addrb
	ldx	#xhdma_inidisp2&WM
	stx	ch1addra1tl
	lda	#xhdma_inidisp2>>16
	sta	ch1atbank
	stz	ch1databank

	lda	#0
	sta	ch2params
	lda	#wobjsel&$ff
	sta	ch2addrb
	ldx	#xhdma_window&WM
	stx	ch2addra1tl
	lda	#xhdma_window>>16
	sta	ch2atbank
	stz	ch2databank

	lda	#0
	sta	ch3params
	lda	#inidisp&$ff
	sta	ch3addrb
	ldx	#xhdma_inidisp3&WM
	stx	ch3addra1tl
	lda	#xhdma_inidisp3>>16
	sta	ch3atbank
	stz	ch3databank

;Enable key pad reading + hdma tables (includes inidisp)

	decvramnotrans	0,(p_bg2_cgx+1024/2),mapccr,7*k
	decbg2vramnotrans	0,p_bg2_scr,mappcr,8*k,32
	jsr	clearscreen
	jsl	p_init_sprites_l

	a8i16
	jsl	clearhvofs_l

	lda	#$80
	sta.l	xinidisp5
	sta.l	xinidisp6
	sta.l	xinidisp7

	waitdma	224

	lda	#tm_planets
	sta	trans_flag	; set irq trans mode

	lda	#%00110001
	sta	nmitimen

	stz	irqtoggle
	stz	planetdma

	a16
;	ldx	#228		; top of the screen
	lda.l	planetdmapos1
	sta	vtimel		; set position for irq
;	lda	#100
	lda.l	planetdmapos2
	sta	htimel
	a8

	plp

	rtl


;-------------------------------------------------------------
p_init_sprites_l
	php
	a8i16

	ldx	#128*4+128/4-1		; clear the buffer
.lp2	stz	spriteblk,x
	dex
	bpl	.lp2

	dmaoaram	0,0,spriteblk,128*4+128/4	; clear all oram

	plp
	rtl


;-------------------------------------------------------------
;-------------------------------------------------------------
;-------------------------------------------------------------
;-------------------------------------------------------------
;-------------------------------------------------------------
;-------------------------------------------------------------
;-------------------------------------------------------------
;-------------------------------------------------------------
;-------------------------------------------------------------
;-------------------------------------------------------------
;-------------------------------------------------------------
;-------------------------------------------------------------
;-------------------------------------------------------------
;-------------------------------------------------------------
;-------------------------------------------------------------
;-------------------------------------------------------------
;-------------------------------------------------------------
;-------------------------------------------------------------
;-------------------------------------------------------------
;-------------------------------------------------------------
;------------REPT LOAD WARNING SPACE FILLING------------------
;-------------------------------------------------------------
;-------------------------------------------------------------
;-------------------------------------------------------------
;-------------------------------------------------------------
;-------------------------------------------------------------

	longa
	longi
setsquare
	REPT	4
	stx	vmaddl
lc	=	0
	REPT	4
	sta	vmdatal
lc	=	lc+1
	IFNE	lc-4
	clc
	adc	#plannum_row
	ENDC
	ENDR
	pha
	txa
	clc
	adc	#32
	tax
	pla
	sec
	sbc	#(plannum_row*3)-1
	ENDR

	rts

currentch	=	0

planetscrnpos	MACRO
	dw	((\2)*32)+(\1)+p_bg1_scr1
	db	(\1)*8,(\2)*8
	ENDM

planetpathpos	MACRO
	db	(\1)*8,(\2)*8
	ENDM


;------------------------------------------------------------------

SetCharMapplan_l
	php
	a8
	lda	#128
	sta	vmainc
	ai16

	lda	#p_bg1_scr1
	sta	vmaddl

	lda	#16*16
	ldx	#32*32
.andagain
	sta	vmdatal
	dex
	bne	.andagain

	ldx	#0
	txy
.nxtplan	phx
	lda.l	planetpos,x
	tax
	tya
	jsr	setsquare
	tya
	clc
	adc	#16*4
	cmp	#16*16
	bcc	.ok
	sec
	sbc	#(16*16)-4
.ok
	tay
	plx
	inx
	inx
	inx
	inx
	cpx	#16*4
	bne	.nxtplan

	ldx	#((plannum_col*plannum_row)*(planchar_size/2))+p_bg1_cgx1
	stx	vmaddl
	ldx	#0
	ldy	#planchar_size/2
.lp	stx	vmdatal
	dey
	bne	.lp

	ldx	#((plannum_col*plannum_row)*(planchar_size/2))+p_bg1_cgx2
	stx	vmaddl
	ldx	#0
	ldy	#planchar_size/2
.lp2	stx	vmdatal
	dey
	bne	.lp2

;---------------------------------------------------------------

	lda	#p_bg1_scr2
	sta	vmaddl


	a8
	lda	#128
	sta	vmainc
	ai16
	lda	#p_bg1_scr2
	sta	vmaddl
	lda	#0
	ldy	#0
.lolv
	pha
	lda	#plannum_col*plannum_row+(6<<10)+(1<<13)
	rept	(32-plannum_col)/2		;clear out borders
	sta	vmdatal
	endr
	pla

	ldx	#0
.lolh	sta	vmdatal
	clc
	adc	#plannum_row
	inx
	cpx	#plannum_col
	bne	.lolh

	pha
	lda	#plannum_col*plannum_row+(6<<10)+(1<<13)
	rept	(32-plannum_col)/2
	sta	vmdatal
	endr
	pla

	sec
	sbc	#plannum_col*plannum_row-1
	iny
	cpy	#plannum_row
	bne	.lolv

	lda	#plannum_col*plannum_row+(6<<10)+(1<<13)
	ldx	#32*(32-plannum_col)/4
.nxtclr	sta	vmdatal
	sta	vmdatal
	sta	vmdatal
	sta	vmdatal
	dex
	bne	.nxtclr

	plp
	rtl


;--------------------------------------------------------




	IFEQ	1
;--------------------------------------------------------------
; this deals with the split up dma-ing of new backgrounds

modechange_l
	php
	ai16

	ldx	bg_dmalist
	beq	.continue
	lda.l	bglists,x
	sta	x1
	lda.l	bglists+1,x
	sta	x2
	ora	x1
	beq	.continue

	lda	gameframe
	and	bgtransspeed
	bne	.clear

	inx
	inx
	inx
	stx	bg_dmalist

	a8
	lda	#1+16
	sta	tm
	lda	#.clear>>16
	pha
	a16
	lda	#(.clear-1)&WM
	pha

	a8
	lda	x1
	pha
	ldx	x2
	dex
	phx

	rtl

	ENDC

.clear


.continue
	plp
	rtl

routechange1_l
	php
	a16
	lda	#stagepaths.path22-stagepaths
	sta	routes
	sta.l	nebula_on
	plp
	rtl

routechange2_l
	php
	a16
	lda	#stagepaths.path21-stagepaths
	sta	routes+2
	plp
	rtl

routechange3_l
	php
	a16
	lda	#stagepaths.path17-stagepaths
	sta	routes+4
	plp
	rtl

routechangebhole1_l
	php
	a16
	lda	#stagepaths.path19-stagepaths
	sta	routes+6
	plp
	rtl


routechangebhole2_l
	php
	a16
	lda	#stagepaths.path18-stagepaths
	sta	routes+6
	plp
	rtl

routechangebhole3_l
	php
	a16
	lda	#stagepaths.path20-stagepaths
	sta	routes+6
	plp
	rtl

;------------------------------------

convertroute
	php
	a8
	lda	whichroute
	beq	.swap1
	cmp	#1
	bne	.ok
	lda	#0
	bra	.ok
.swap1	lda	#1
.ok	sta	whichroute
	plp
	rts


;------------------------------------

pepperspeaking
	php
	ai16
	lda.l	peppermsg
	and	#255
	dec	a
	cmp	#-1
	beq	.finished
	asl	a
	tax
	lda.l	messages,x
	inc	a	; skip which friend
	inc	a	; skip which sound
	sta.l	m_txtdata

	lda	#5
	sta.l	m_textcolour
	lda	#24*8
	sta.l	m_textrightclip
	lda	#2
	sta.l	m_x1
	sta.l	m_y1
	lda.l	pepperchars
	and	#255
	sta.l	m_totalchars
	txa
	call_mario	mgprintstr


	ai16
	lda	#13
	sta.l	m_textcolour
	lda	#24*8-2
	sta.l	m_textrightclip
	lda	#0
	sta.l	m_x1
	sta.l	m_y1
	lda.l	pepperchars
	and	#255
	sta.l	m_totalchars
	txa
	call_mario	mgprintstr

.finished
	plp
	rts

;------------------------------------
showplanetname
	php
	ai16
	lda	currentplanet
	and	#255
	tax
	lda.l	planetnames,x
	and	#255
	dec	a
	cmp	#-1
	beq	.finished
	asl	a
	tax
	lda.l	messages,x
	inc	a	; skip which friend
	inc	a	; skip which sound
	sta.l	m_txtdata

	lda	#1
	sta.l	m_textcolour
	lda	#24*8
	sta.l	m_textrightclip
	lda	#2
	sta.l	m_x1
	lda	#2+48
	sta.l	m_y1
	lda.l	pepperchars
	and	#255
	sta.l	m_totalchars
	txa
	call_mario	mgprintstr


	ai16
	lda	#4
	sta.l	m_textcolour
	lda	#24*8-2
	sta.l	m_textrightclip
	lda	#0
	sta.l	m_x1
	lda	#48
	sta.l	m_y1
	lda.l	pepperchars
	and	#255
	sta.l	m_totalchars
	txa
	call_mario	mgprintstr

.finished
	plp
	rts

;---------------------------------------------------------------------------
	IFNE	cestimeron

cestimer_l
	php	; Push current processor status to stack
	a8	; Set A to 8 bit
	; if the game has not handed control over to the player yet, do nothing
	s_jmp_varAND	B,pshipflags,#psf_noctrl,.end

	; Rewritten CES timer print
	a8
	; if the game has not handed control over to the player yet, don't print anything
	s_jmp_varAND	B,pshipflags,#psf_noctrl,.notimer
	; print minutes
	bra	.twodig	; Assume we're printing a 2 digit number of minutes
.twodig
	lda.l	cesminute	; Load (long) current minutes into A
	cmp	#10	; Compare with 10
	bcc	.onedig ; if minutes < 10, print only 1 digit
	printnuml	timerx+1,timery,cesminute	; Print minutes
	bra	.seconds	; Print 'M', 'TIME', and the current seconds
.onedig
	kandoprint	(timerx+1),timery,ceszerotxt	; Print fake 0 in 10s place
	printnuml	timerx+2,timery,cesminute	; Print single-digit minutes in 1s place
	bra	.seconds	; Print 'M', 'TIME', and the current seconds
.seconds
	kandoprint	(timerx+3),timery,cesmintext	; "M"
	; print seconds
	printnuml	timerx+4,timery,cessecond10	; Print current seconds 10s place value
	printnuml	timerx+5,timery,cessecond	; Print current seconds 1s place value
	kandoprint	(timerx+6),timery,cessectext	; "S"
	kandoprint	(timerx+1),(timery-1),cestimetext	; "TIME"
.notimer

	a8
	lda.l	cestimer
	clc
	adc	framer
	cmp	#60
	bcc	.daijobu3	; If framerate < 60? branch to .daijobu3
	sec
	sbc	#60
	sta.l	cestimer

	; This part makes the timer tick
	lda.l	cessecond	; Load current seconds (1s place) into A
	dec	a				; Decrement A by one
	bpl	.daijobu		; branch to .daijobu if A is positive (store time)

	lda.l	cessecond10	; Load current seconds (10s place) into A
	dec	a				; Decrement A by one
	bpl	.daijobu2		; branch to .daijobu2 if A is positive (store time)

	lda.l	cesminute	; Load current minutes into A
	bne	.notfinished	; Branch to .notfinished if cesminute != 0

	; Else if cesminute	== 0
	; Time's up!
	jsl	screenoff_l ; Fade the screen to black
	jml	restart 	; Reboot (go to control select)
.notfinished	; if time hasn't run out yet:
	dec	a	; Decrement A (current minutes) by 1
	sta.l	cesminute ; Store A in cesminute

	lda	#5

	; Store the remaining time
.daijobu2
	sta.l	cessecond10
	lda	#9
.daijobu
	sta.l	cessecond
	lda.l	cestimer
.daijobu3
	sta.l	cestimer

.end	; do nothing

	; End routine
	plp	; Retrieve process status from the stack
	rtl	; Return from subroutine (long)

	shorta
	ENDC ; cestimeron
;------------------------------------


nummodes	=	0

modechg	macro
	dw	\1-mapbase
nummodes	=	nummodes+1
	endm

dpspr	macro
	db	\1_spr&127
	db	0
	endm

rotationselect	=	0

dpsphere	macro ; planet sphere macro
	db	\1_spr!128
	db	rotationselect
rotationselect	=	rotationselect+2
	endm


planetsprs ; Stage icon definitions
	dpsphere	playerplanet ; Corneria
	dpspr		space2 asteroidfield ; 1-2 Asteroid Belt
	dpspr		space2 asteroidfield ; 3-2 Asteroid Belt
	dpspr		space1 ; 2-2 Sector X
	dpsphere	planetb ; 3-3 Fortuna
	dpsphere	planeta	; 2-3 Titania
	dpspr		bigships ; 1-3 Space Armada
	dpspr		cluster ; 3-4 Sector Z
	dpspr		bigmeteo ; 1-4 Meteor
	dpspr		space4 ; 2-4 Sector Y
	dpspr		blackhole ; Black Hole
	dpsphere	planetc ; 3-5 Macbeth
	dpspr		space3 ; Unused
	dpspr		space4 ; Unused
	dpspr		starwars3 ; Out Of this Dimension
	dpsphere	enemyplanet ; Venom
	dpspr		space3 ; Unused




planetnames
; The numbers in this table point to message IDs in the message file.
	db	93	;00 ; Corneria ; 1-1, 2-1, 3-1
	db	94	;01 ; Asteroid Belt 1 ; 1-2
	db	94	;02 ; Asteroid Belt 2 ; 3-2
	db	95	;03 ; Sector X ; 2-2
	db	96	;04 ; Fortuna ; 3-3
	db	98	;05 ; Titania ; 3-5
	db	97	;06 ; Space Armada ; 1-3
	db	102	;07 ; Sector Z ; 3-4
	db	101	;08 ; Meteor ; 1-4
	db	100	;09 ; Sector Y ; 2-4
	db	99	;10 ; Black Hole ; BHOLE
	db	103	;11 ; Macbeth ; 3-5
	db	104	;12 ; Venom 1 ; 1-5
	db	104	;13 ; Venom 2 ; 2-5
	db	105	;14 ; OOTD ; SPECIAL
	db	104	;15 ; Venom 3 ; 2-6
	db	105	;16 ; OOTD ; SPECIAL





planetpos
	planetscrnpos	$02,$16	; 0
	planetscrnpos	$08,$16	; 1
	planetscrnpos	$07,$11	; 2
	planetscrnpos	$02,$10	; 3
	planetscrnpos	$0e,$12	; 4
	planetscrnpos	$05,$08	; 5
	planetscrnpos	$10,$0c	; 6
	planetscrnpos	$17,$12	; 7
	planetscrnpos	$15,$0c	; 8
	planetscrnpos	$0e,$04	; 9
	planetscrnpos	$0a,$0a	; 10
	planetscrnpos	$1a,$0c	; 11
	planetscrnpos	$18,$05	; 12
	planetscrnpos	$18,$05	; 13
	planetscrnpos	$11,$16	; 14
	planetscrnpos	$18,$05	; 15
	planetscrnpos	$02,$16	; <16> (origami)

startplanetpos
	planetpathpos	$02,$16	; 0
	planetpathpos	$08,$16	; 1
	planetpathpos	$08,$11	; 2
	planetpathpos	$02,$10	; 3
	planetpathpos	$0e,$12	; 4
	planetpathpos	$06,$08	; 5
	planetpathpos	$10,$0d	; 6
	planetpathpos	$17,$12	; 7
	planetpathpos	$16,$0c	; 8
	planetpathpos	$0e,$04	; 9
	planetpathpos	$0a,$0a	; 10
	planetpathpos	$1a,$0c	; 11
	planetpathpos	$18,$05	; 12
	planetpathpos	$18,$05	; 13
	planetpathpos	$11,$16	; 14
	planetpathpos	$18,$05	; 15
	planetpathpos	$12,$16	; <16> (origami)

endplanetpos
	planetpathpos	$02,$16	; 0
	planetpathpos	$08,$16	; 1
	planetpathpos	$07,$11	; 2
	planetpathpos	$02,$10	; 3
	planetpathpos	$0e,$12	; 4
	planetpathpos	$05,$08	; 5
	planetpathpos	$10,$0d	; 6
	planetpathpos	$17,$12	; 7
	planetpathpos	$15,$0d	; 8
	planetpathpos	$0e,$04	; 9
	planetpathpos	$0a,$0a	; 10
	planetpathpos	$1a,$0c	; 11
	planetpathpos	$18,$05	; 12
	planetpathpos	$18,$05	; 13
	planetpathpos	$11,$16	; 14
	planetpathpos	$18,$05	; 15
	planetpathpos	$12,$16	; <16> (origami)


	IFEQ	1
shaded_chars
	dw	.shade15-shaded_chars
	dw	.shade14-shaded_chars
	dw	.shade13-shaded_chars
	dw	.shade12-shaded_chars
	dw	.shade11-shaded_chars
	dw	.shade10-shaded_chars
	dw	.shade9-shaded_chars
	dw	.shade8-shaded_chars
	dw	.shade7-shaded_chars
	dw	.shade6-shaded_chars
	dw	.shade5-shaded_chars
	dw	.shade4-shaded_chars
	dw	.shade3-shaded_chars
	dw	.shade2-shaded_chars
	dw	.shade1-shaded_chars
	dw	.shade0-shaded_chars

.shade0	makeshade	0
.shade1	makeshade	1
.shade2	makeshade	2
.shade3	makeshade	3
.shade4	makeshade	4
.shade5	makeshade	5
.shade6	makeshade	6
.shade7	makeshade	7
.shade8	makeshade	8
.shade9	makeshade	9
.shade10	makeshade	10
.shade11	makeshade	11
.shade12	makeshade	12
.shade13	makeshade	13
.shade14	makeshade	14
.shade15	makeshade	15
	ENDC

rgbws	macro
tred	=	((\1)*(\4))/100
tgreen	=	((\2)*(\4))/100
tblue	=	((\3)*(\4))/100
;	printf	"*",[3]tred," ",[3]tgreen," ",[3]tblue
	rgbw	tred,tgreen,tblue
	endm

rgbscale	=	100
fadetab0
	REPT	15
rgbscale	=	rgbscale-(100/16)
	rgbws	$06,$08,$0a,rgbscale
	ENDR
	rgbws	0,0,0,100
	

planselpal
	inccolfile	data\col\map_c.col,0,15
	inccolfile	data\map-obj.col,0,1
	rgbw	$1f,$1f,0
	rgbw	$1f,$1f,0
	rgbw	$1f,$1f,0
	rgbw	$1f,$1f,0
	rgbw	$1f,$1f,0
	rgbw	$1f,$1f,0
	rgbw	$1f,$1f,0
	rgbw	$1f,$1f,0
	rgbw	$1f,$1f,0
	rgbw	$1f,$1f,0
	rgbw	$1f,$1f,0
	rgbw	$1f,$1f,0
	rgbw	$1f,$1f,0
	rgbw	$1f,$1f,0
	rgbw	$1f,$1f,0
	rgbw	$1f,$1f,0


fadetable
	db	%11100000+(32-1)
	db	%11100000+(32-1)
	db	%11100000+(32-2)
	db	%11100000+(32-3)
	db	%11100000+(32-4)
	db	%11100000+(32-6)
	db	%11100000+(32-8)
	db	%11100000+(32-10)
	db	%11100000+(32-12)
	db	%11100000+(32-14)
	db	%11100000+(32-16)
	db	%11100000+(32-18)
	db	%11100000+(32-20)
	db	%11100000+(32-22)
	db	%11100000+(32-25)
	db	%11100000+(32-28)
	db	%11100000+(32-31)

pal15	=	7<<9
xflip	=	1<<14
yflip	=	1<<15

spacechar	=	0!pal15
singledot	=	1
upchar	=	4!xflip!pal15	;3
downchar	=	4!yflip!pal15	;3+1<<15
uprightchar	=	2!pal15		;2
downrightchar =	2!yflip!pal15	;2+1<<15
rightchar	=	3!pal15		;4
highrightchar =	3!xflip!pal15	;4+1<<15


; Start of planet macros
NOMOREPATHS	MACRO
	db	0
	ENDM

PATHNEXT	MACRO
	PATHEND
	db	1	
	dw	\1-stagepaths
	ENDM

PATHCHOICE	MACRO
	PATHEND
	db	2
	dw	path_\1
	ENDM
	
PATHSTART	MACRO ; ?,?,?,map,msg,route
	db	3
	db	\1,\2	;32*(\2)+(\1)+p_bg1_scr1
	db	\3
	dw	level\4&$7fff
	db	level\4>>16
	db	\5
	db	\6
	ENDM
	

PATHUP	MACRO
	dw	upchar
	db	0,-8
	ENDM

PATHDOWN	MACRO
	dw	downchar
	db	0,8
	ENDM

PATHUPRIGHT	MACRO
	dw	uprightchar
	db	8,-8
	ENDM

PATHDOWNRIGHT MACRO
	dw	downrightchar
	db	8,8
	ENDM


PATHUP_H	MACRO
	dw	spacechar
	db	0,-8
	ENDM

PATHDOWN_H	MACRO
	dw	spacechar
	db	0,8
	ENDM

PATHUPRIGHT_H	MACRO
	dw	spacechar
	db	8,-8
	ENDM

PATHDOWNRIGHT_H	MACRO
	dw	spacechar
	db	8,8
	ENDM

PATHRIGHT_H	MACRO
	dw	spacechar
	db	8,0
	ENDM

PATHRIGHT	MACRO
	dw	rightchar
	db	8,0
	ENDM

PATHHIGHRIGHT	MACRO
	dw	highrightchar
	db	8,0
	ENDM

PATHEND	MACRO
	dw	-1
	ENDM
; End of planet macros

path_1	equ	0
path_2	equ	2
path_3	equ	4
path_4	equ	6

stagepaths ; definitions for the 3 map routes and other stages on the map screen
	dw	.path1-stagepaths	; route 1/2
	dw	.path6-stagepaths	; route 0/1
	dw	.path11-stagepaths	; route 2/3

.path1	local
; Corneria 2
	PATHSTART	4,20,0,2_1,88,1
	PATHUP
	PATHCHOICE	3

.path2	local
; Sector X
	PATHSTART	4,14,3,2_2,89,1
	PATHUP
	PATHUP
	PATHUPRIGHT
	PATHNEXT	.path3

.path3	local
; Titania
	PATHSTART	9,8,5,2_3,106,1
	PATHUPRIGHT
	PATHUPRIGHT
	PATHUPRIGHT
	PATHRIGHT
	PATHRIGHT
	PATHNEXT	.path4

.path4	local
; Sector Y
	PATHSTART	18,5,9,2_4,107,1
	PATHRIGHT
	PATHRIGHT
	PATHRIGHT
	PATHRIGHT
	PATHNEXT	.path5

.path5	local
; Venom 2 Orbital
	PATHSTART	0,0,15,2_5,114,1
	PATHNEXT	.end2

; Corneria 1
.path6	local
	PATHSTART	6,21,0,1_1,88,0
	PATHUPRIGHT
	PATHCHOICE	2

; Asteroid Field 1
.path7	local
	PATHSTART	11,17,2,1_2,89,0
	PATHUPRIGHT
	PATHUPRIGHT
	PATHUPRIGHT
	PATHRIGHT
	PATHRIGHT
	PATHNEXT	.path8

; Space Armada
.path8	local
	PATHSTART	20,14,6,1_3,90,0
	PATHRIGHT
	PATHNEXT	.path9

.path9	local
; Meteor
	PATHSTART	24,11,8,1_4,91,0
	PATHUP
	PATHNEXT	.path10

; Venom 1 Orbital
.path10	local
	PATHSTART	0,0,15,1_5,92,0
	PATHNEXT	.end

.path11	local
; Venom 3
	PATHSTART	6,23,0,3_1,108,2
	PATHRIGHT
	PATHRIGHT
	PATHCHOICE	1

.path12	local
; Asteroid Field 2
	PATHSTART	12,21,1,3_2,109,2
	PATHUPRIGHT
	PATHUPRIGHT
	PATHNEXT	.path13

.path13	local
; Fortuna
	PATHSTART	18,19,4,3_3,110,2
	PATHRIGHT
	PATHRIGHT
	PATHRIGHT
	PATHRIGHT
	PATHRIGHT
	PATHNEXT	.path14

.path14	local
; Sector Z
	PATHSTART	27,19,7,3_4,111,2
	PATHUPRIGHT
	PATHUP
	PATHNEXT	.path15

.path15	local
; Macbeth
	PATHSTART	28,11,11,3_5,112,2
	PATHUP
	PATHNEXT	.path16

.path16	local
; Venom 3 Orbital
	PATHSTART	0,0,15,3_6,116,2
	PATHNEXT	.end3

.path17	local
; Corneria 2
	PATHSTART	6,15,3,2_2,89,1
	PATHUPRIGHT_H
	PATHUPRIGHT_H
	PATHUPRIGHT_H
	PATHCHOICE	4

; Black Hole
.path18	local
	PATHSTART	12,9,10,_blackhole,113,0
	PATHUPRIGHT_H
	PATHUPRIGHT_H
	PATHNEXT	.path4

.path19	local
	PATHSTART	13,11,10,_blackhole,113,0
	PATHRIGHT_H
	PATHRIGHT_H
	PATHUPRIGHT_H
	PATHUPRIGHT_H
	PATHRIGHT_H
	PATHRIGHT_H
	PATHRIGHT_H
	PATHRIGHT_H
	PATHRIGHT_H
	PATHNEXT	.path10

.path20	local
	PATHSTART	11,14,10,_blackhole,113,0
	PATHDOWNRIGHT_H
	PATHDOWNRIGHT_H
	PATHDOWNRIGHT_H
	PATHDOWNRIGHT_H
	PATHRIGHT_H
	PATHRIGHT_H
	PATHRIGHT_H
	PATHRIGHT_H
	PATHRIGHT_H
	PATHRIGHT_H
	PATHRIGHT_H
	PATHRIGHT_H
	PATHNEXT	.path14

.path21	local
; Asteroid Field 1
	PATHSTART	9,16,2,1_2,89,0
	PATHUP_H
	PATHUP_H
	PATHUPRIGHT_H
	PATHCHOICE	4

.path22	local
; Asteroid Field 2
	PATHSTART	12,25,1,3_2,109,2
	PATHRIGHT_H
	PATHRIGHT_H
	PATHRIGHT_H
	PATHRIGHT_H
	PATHRIGHT_H
	PATHRIGHT_H
	PATHNEXT	.otherend

.end3	local
; Venom 3
	PATHSTART	0,0,15,3_7,116,2
	PATHEND
	NOMOREPATHS

.end2	local
; Venom 2 (Venom Highway)
	PATHSTART	0,0,15,2_6,114,1
	PATHEND
	NOMOREPATHS

; Venom 1
.end	local
	PATHSTART	0,0,15,1_6,92,0
	PATHEND
	NOMOREPATHS

.otherend	local
; Out of This Dimension
	PATHSTART	0,0,14,_special,115,0
	PATHEND
	NOMOREPATHS

mapanim_chars
	incbinfile	data\mapanim.chr

;	?*-waitdma224








