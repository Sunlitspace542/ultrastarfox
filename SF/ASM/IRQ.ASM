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
;*   File: IRQ.ASM                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr: IRQ routines.                                                   *
;*                                                                         *
;***************************************************************************
	incpublics	EXT\irq.ext

NOBGTRANS	=	0 ; something to do with the transfer loop? (BG = background?)

	shorta
	shorti
irqcode_l	ldx	trans_flag ; Load transfer flag into X
	jmp	(.tab&WM,x) ; Jump to LUT &$FFFF?
.tab	irv	irqblank ; declare IRQ variables?
	irv	irqbit1		;2
	irv	irqbit2		;4
	irv	irqbit3		;6
	irv	irqplanets	;8
	irv	foxirq1		;10
	irv	foxirq2		;12
	irv	foxirq3		;14
	irv	newbg2chr	;16
	irv	newbg2scr	;18
	irv	randtrans	;20
	irv	newbg3		;22
	irv	contirqbit3	;24
	irv	endseqbit1	;26
	irv	endseqbit2	;28
	irv	endseqbit3	;30
	irv	endseqbit0	;32
	irv	irqplanets2	;34
	irv	irqsetmode1	;36
	irv	irqsetmode2	;38


	shorta
	shorti
irqsetmode1	i16 ; enable interrupts
	lda	#hdmaf_inidisp+hdmaf_win
	sta	hdmaen_gc
	sta	hdmaen
	lda	#1
	sta	bgmode
	stz	gamemode
	lda	#1+2+16
	sta	tm
	lda	#(vsc_base2+1*k)>>8
	sta	bg3sc
	lda	#vsc_base2>>12
	sta	bg34nba
	stz	bg2vofs
	stz	bg2vofs

	stz	bg3scrollflag
	stz	flashtunnelon
	stz	flashbg
	stz	dospacesc
	gamepal	norm
	set_zdepthtable	normal
	a16
	lda	#128
	sta.l	m_scrollXoff
	stz	lastpalfade
	stz	defaultID
	stz	bg2Xscroll
	lda	#0
	sta.l	bholescaleval
	a8
	stz	noxrot
	stz	fadepal
	stz	tunnelscroll

	stz	trans_flag
	rtl

irqsetmode2
	shorta
	shorti
	i16
	lda	#hdmaf_inidisp+hdmaf_win
	sta	hdmaen_gc
	sta	hdmaen
	lda	#2
	sta	bgmode		; mode 2
	stz	gamemode
	lda	#1+2+16
	sta	tm

	stz	bg3sc
	stz	bg3hofs
	stz	bg3hofs
	stz	bg3vofs
	stz	bg3vofs
	lda	#bg2offsets>>8	; set bg2 offsets
	sta	bg3sc
	lda	#%11100000
	sta	bg3hofs
	stz	bg3vofs

	stz	bg2vofs
	stz	bg2vofs

	stz	bg3scrollflag
	stz	flashtunnelon
	stz	flashbg
	stz	dospacesc
	gamepal	norm
	set_zdepthtable	normal
	a16
	lda	#128
	sta.l	m_scrollXoff
	stz	lastpalfade
	stz	defaultID
	stz	bg2Xscroll
	lda	#0
	sta.l	bholescaleval
	a8
	stz	tunnelscroll
	stz	noxrot
	stz	fadepal
	stz	trans_flag
	rtl


	shorta
	shorti
newbg2chr
	i16
	lda	#cgdata&$ff		;DNLD palette
	sta	ch0addrb
	lda	#0
	sta	cgadd
	ldx	vram3addr
	stx	ch0addra1tl
	lda	vram3addr+2
	sta	ch0atbank
	ldx	vram3len
	stx	ch0dataddrl
	stz	ch0params
	lda	#1
	sta	mdmaen

	lda	#$80		;DNLD chars
	sta	vmainc
	lda	#(vmdatal&$ff)
	sta	ch0addrb
	ldx	vram1addr
	stx	vmaddl
	ldx	#($700000+dec_base)&WM
	stx	ch0addra1tl
	lda	#(($700000+dec_base)>>16)
	sta	ch0atbank
	ldx	vram1len
	stx	ch0dataddrl
	lda	#1
	sta	ch0params
	lda	#1
	sta	mdmaen

	inc	trans_flag
	inc	trans_flag
	rtl


	shorta
	shorti
newbg2scr	i16
	lda	#$80		;DNLD screen
	sta	vmainc
	lda	#(vmdatal&$ff)
	sta	ch0addrb
	ldx	vram2addr
	stx	vmaddl
	ldx	#($700000+dec_base+6144)&WM
	stx	ch0addra1tl
	lda	#(($700000+dec_base+6144)>>16)
	sta	ch0atbank
	ldx	vram2len
	stx	ch0dataddrl
	lda	#1
	sta	ch0params
	lda	#1
	sta	mdmaen

	lda	#cgdata&$ff		;DNLD game palette
	sta	ch0addrb
	lda	#16*pal3d
	sta	cgadd
	a16
	lda	#gamepalbuff&WM
	sta	ch0addra1tl
	a8
	lda	#gamepalbuff>>16
	sta	ch0atbank
	ldx	#32
	stx	ch0dataddrl
	stz	ch0params
	lda	#1
	sta	mdmaen

	stz	trans_flag
	rtl

	shorta
	shorti
newbg3	i16
	lda	#$80		;DNLD chars
	sta	vmainc
	lda	#(vmdatal&$ff)
	sta	ch0addrb
	ldx	vram1addr
	stx	vmaddl
	ldx	#($700000+dec_base)&WM
	stx	ch0addra1tl
	lda	#(($700000+dec_base)>>16)
	sta	ch0atbank
	ldx	vram1len
	stx	ch0dataddrl
	lda	#1
	sta	ch0params
	lda	#1
	sta	mdmaen

	lda	#$80		;DNLD screen
	sta	vmainc
	lda	#(vmdatal&$ff)
	sta	ch0addrb
	ldx	vram2addr
	stx	vmaddl
	ldx	#($700000+dec_base+6144)&WM
	stx	ch0addra1tl
	lda	#(($700000+dec_base+6144)>>16)
	sta	ch0atbank
	ldx	vram2len
	stx	ch0dataddrl
	lda	#1
	sta	ch0params
	lda	#1
	sta	mdmaen
	stz	trans_flag
	rtl


	shorta
	shorti
randtrans	i16
	IFEQ	NOBGTRANS
	lda	#$80
	sta	vmainc
	lda	#(vmdatal&$ff)
	sta	ch0addrb
	ldx	vram1addr
	stx	vmaddl
	ldx	#($700000+dec_base)&WM
	stx	ch0addra1tl
	lda	#(($700000+dec_base)>>16)
	sta	ch0atbank
	ldx	vram1len
	stx	ch0dataddrl
	lda	#1
	sta	ch0params
	lda	#1
	sta	mdmaen
	ENDC
	stz	trans_flag
	rtl





	shorta
	shorti


pepperscreensize	=	16*24*32
peppersize1	=	(pepperscreensize/3)&-2
peppersize2	=	peppersize1
peppersize3	=	pepperscreensize-peppersize1-peppersize2

; irq code for the planet selection screen (to fade up pepper

irqplanets2
; irq code for the planet selection screen

	lda	planetdma
	lbeq	.nowt
	dec	a
	lbeq	.1
	dec	a
	lbeq	.2
	dec	a
	lbeq	.3

	i16
	ldx	vmap2
	dmaxvram	0,(bitmapbase+bitmap1),planbmpsz

	a16
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

	stz	planetdma
	
	brl	.nowt

	shorta
.3	i16
	ldx	#p_bg2_cgx+64/2+peppersize1/2+peppersize2/2
	dmaxvram	7,(bitmapbase+bitmap1)+peppersize1+peppersize2,peppersize3
	bra	.dmaed
.2	i16
	ldx	#p_bg2_cgx+64/2+peppersize1/2
	dmaxvram	7,(bitmapbase+bitmap1)+peppersize1,peppersize2
	bra	.dmaed
.1	i16
	ldx	#p_bg2_cgx+64/2
	dmaxvram	7,(bitmapbase+bitmap1),peppersize1
	bra	.dmaed

.dmaed
	lda	planetdma
	inc	a
	cmp	#4
	bne	.okay
	lda	#0
.okay	sta	planetdma

.nowt	lda.l	pepperfade
	cmp	#255
	beq	.nochange
	and	#%11111
	beq	.nochange
	dec	a

	ora	#%11100000

	sta	coldata
	sta.l	pepperfade

.nochange	jsr	startmus
	rtl

	shorta
	shorti
irqplanets
	IFEQ	1
	lda	irqtoggle
	beq	.norm

	waithtime	100,130

	a16
	lda	#228		; top of the screen
	sta	vtimel		; set position for irq

	a8
	lda	ch3hdmaline
	clc
	adc	#200-120
	sta	ch3hdmaline

	stz	irqtoggle
	rtl
.norm
	a16
	lda	#100		; top of the screen
	sta	vtimel		; set position for irq
	ENDC



	a8
	lda	#1
	sta	irqtoggle

	i16
	dmaoaram	0,0,spriteblk,4*(8+maxplanetlines)

;-------------------------------------------------------------
; planet dma:

planBMPSZ	equ	16*16*64

	IFEQ	pal
pamount1	=	(planbmpsz/4)
pamount2	=	(planbmpsz/4)
	ELSEIF
pamount1	=	(planbmpsz/2)
pamount2	=	(planbmpsz/2)
	ENDC

pamount3	=	(planbmpsz/4)
pamount4	=	(planbmpsz/4)

	lda	planetdma
	lbeq	.nodma

	dec	a
	lbeq	.1
	dec	a
	beq	.2
	dec	a
	lbeq	.3
	
.4
	a16
	lda	vmap2
	clc
	adc	#(pamount1+pamount2+pamount3)/2
	tax
	a8
	dmaxvram	0,(bitmapbase+bitmap1)+pamount1+pamount2+pamount3,pamount4
	brl		.end

.1
	a8i16
	ldx	vmap2
	dmaxvram	0,(bitmapbase+bitmap1),pamount1
	bra	.end

.2
	a16
	lda	vmap2
	clc
	adc	#pamount1/2
	tax
	a8
	dmaxvram	0,(bitmapbase+bitmap1)+pamount1,pamount2
	bra	.end

.3
	a16
	lda	vmap2
	clc
	adc	#(pamount1+pamount2)/2
	tax
	a8
	dmaxvram	0,(bitmapbase+bitmap1)+pamount1+pamount2,pamount3

.end
	lda	planetdma
	inc	a
	sta	planetdma

	IFEQ	pal
	cmp	#5
	ELSEIF
	cmp	#3
	ENDC

	bne	.nodma
	stz	planetdma

.nodma
;-------------------------------------------------------------

	lda	z2
	pha

	ldx	#4*4

	lda	flashship
	bit	#1
	beq	.normal
	clc
	adc	#64
	sta	flashship
	rol	a
	bcc	.normal

	a16
	stz	spriteblk+0,x
	stz	spriteblk+4,x
	stz	spriteblk+8,x
	stz	spriteblk+12,x
	stz	spriteblk+2,x
	stz	spriteblk+6,x
	stz	spriteblk+10,x
	stz	spriteblk+14,x
	a8
	brl	.noship

.normal
;---- move the ship
	lda	shipxy+1
	cmp	newshipxy+1
	bmi	.incit
	lda	shipxy
	sec
	sbc	newshipxy
	beq	.xok
	bcc	.oneway
	sta	z2
	lda	shipxy+1
	sec
	sbc	newshipxy+1
	beq	.dox
	cmp	z2
	bne	.xok
.dox
	dec	shipxy
	bra	.xok
.oneway
	sta	z2
	lda	newshipxy+1
	sec
	sbc	shipxy+1
	beq	.dox2
	cmp	z2
	bne	.xok
.dox2
	inc	shipxy
.xok
	lda	shipxy+1
	cmp	newshipxy+1
	beq	.yok
	bpl	.decit
.incit
	inc	shipxy+1
	lda	shipxy
	cmp	newshipxy
	beq	.yok
	inc	shipxy
	bra	.yok
.decit
	dec	shipxy+1
.yok



	lda	shipxy
	clc
	adc	#8
	sta	spriteblk,x
	sta	spriteblk+8,x
	clc
	adc	#8
	sta	spriteblk+4,x
	sta	spriteblk+12,x


	lda	shipxy+1
	clc
	adc	#8
	sta	spriteblk+1,x
	sta	spriteblk+5,x
	clc
	adc	#8
	sta	spriteblk+9,x
	sta	spriteblk+13,x

	lda	shipangle
	beq	.one
	dec	a
	beq	.other
	lda	#$b+2
	bra	.decided
.one	lda	#7+2
	bra	.decided
.other	lda	#3+2
.decided
	sta	spriteblk+2,x
	inc	a
	sta	spriteblk+6,x
	inc	a
	sta	spriteblk+10,x
	inc	a
	sta	spriteblk+14,x

	lda	#%111110
	sta	spriteblk+3,x
	sta	spriteblk+7,x
	sta	spriteblk+11,x
	sta	spriteblk+15,x
.noship
	lda	comet
	lbeq	.nocomet

	ldx	#0

	lda	lightx
	sec
	sbc	#15
	sta	spriteblk,x
	sta	spriteblk+4,x
	clc
	adc	#8
	sta	spriteblk+8,x
	sta	spriteblk+12,x
	lda	lighty
	sta	spriteblk+1,x
	sta	spriteblk+9,x
	clc
	adc	#8
	sta	spriteblk+5,x
	sta	spriteblk+13,x

	lda	spriteblk+2,x
	cmp	#15+2
	bne	.otherframe
	lda	#19+2
	bra	.thisframe
.otherframe
	lda	#15+2
.thisframe
	sta	spriteblk+2,x
	inc	a
	sta	spriteblk+10,x
	inc	a
	sta	spriteblk+6,x
	inc	a
	sta	spriteblk+14,x

	lda	#%00011110
	sta	spriteblk+3,x
	sta	spriteblk+7,x
	sta	spriteblk+11,x
	sta	spriteblk+15,x

	dec	lightx
	dec	lightx
	inc	lighty
	inc	lighty
	lda	lightx
	cmp	#18
	bcc	.finishup
	lda	lighty
	cmp	#224
	lbcc	.donecomet
.finishup	stz	comet
	lda	#deg45-deg22/8
	sta	lightangle+1
	brl	.donecomet
.nocomet
	a16
	lda	x1
	pha
	lda	z1
	pha
	lda	x2
	pha
	lda	z2
	pha

	a8
	stz	x1
	lda	#125
	sta	z1
	lda	lightangle+1
	
	jsr	rotate_8xz_ram

	a16
	lda	x2
	sexa
	clc
	adc	#128
	sta	lightx
	lda	z2
	sexa
	clc
	adc	#100
	sta	lighty
	
	lda	#200
	sta	lightz

	lda	lightangle
	clc
	adc	#16
	sta	lightangle

	a8
	lda	lightangle+1
	cmp	#deg180+deg45
	bne	.cometganai
	lda	#1
	sta	comet
	lda	#255
	sta	lightx
	lda	#0
	sta	lighty
	stz	lightx+1
	stz	lighty+1
.cometganai

	a16
	pla
	sta	z2
	pla
	sta	x2
	pla
	sta	z1
	pla
	sta	x1
	a8
.donecomet
;-------------------------------------------------------------
	pla
	sta	z2
	jsr	startmus
	rtl


	shorta
foxirq1	i16
	lda	#tm_fox2
	sta	trans_flag
	brl	irqbit1.jmpin

	shorta
foxirq2	i16
	lda	#tm_fox3
.set	sta	trans_flag
	brl	irqbit2.jmpin

	shorta
foxirq3	i16

	waithtime	50,70

	dmaoaram	0,0,spriteblk,300
	stz	trans_flag
	lda	vmap1+1		;set new screen base select
	lsr	a
	lsr	a
	lsr	a
	lsr	a
	ora	#(vchr_physback>>12)<<4
	sta	bg12nba

	ldx	vmap1		;swap double buffering
	ldy	vmap2
	stx	vmap2
	sty	vmap1

	lda	#$80
	sta	vmainc
	a16
	lda	#vsc_base2+32*24+29
	sta	vmaddl
	lda	credits
	clc
	adc	#((vchr_logback-vchr_physback)/16+$68)!(5<<10)!(1<<13)
	sta	vmdatal

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

	a8
	jsr	startmus
	rtl

;--------------------------------------------------------------------------
	shorta
	longi
contirqbit3	i16
	waithtime	50,70
	dmaoaram	0,0,spriteblk,328
	lda	#1+2+16	
	sta	tm

	stz	trans_flag
	lda	vmap1+1		;set new screen base select
	lsr	a
	lsr	a
	lsr	a
	lsr	a
	ora	#(vchr_physback>>12)<<4
	sta	bg12nba

	ldx	vmap1		;swap double buffering
	ldy	vmap2
	stx	vmap2
	sty	vmap1

	a16
	lda	joy1l
	eor	cont0l
	and	joy1l
	sta	trig0

	a8
	lda	bg2vofsreq
	sta	bg2vofs
	lda	bg2vofsreq+1
	sta	bg2vofs
	lda	bg2hofsreq
	sta	bg2hofs
	lda	bg2hofsreq+1
	sta	bg2hofs

	stz	cgadsub
	stz	coldata
	stz	wh0
	stz	wh1

	jsr	getcont0

	a16
	lda	contsmart
	and	#$ff
	beq	.skc
	lda	gameframe
	and	#1
	bne	.doc
	stz	nmitemp
	bra	.wrc
.doc
	lda	contsmart
	and	#$ff
	cmp	#31
	jbe	.ok
	lda	#31
.ok	sta	nmitemp
	asl	a
	asl	a
	asl	a
	asl	a
	asl	a
	sta	nmitemp2
	asl	a
	asl	a
	asl	a
	asl	a
	asl	a
	ora	nmitemp2
	ora	nmitemp
	sta	nmitemp
.wrc	a8
	lda	#3
	sta	cgadd
	lda	nmitemp
	sta	cgdata
	lda	nmitemp+1
	sta	cgdata
	dec	contsmart
.skc
	a8
	jsr	setinidisp
	jsr	startmus
	rtl



;--------------------------------------------------------------------------
	shorta
	shorti
endseqbit0	jsr	seqscroll
	jsr	setinidisp
	lda	#1
	sta	gamevwpos
	jsr	startmus
	rtl

	shorta
	shorti
endseqbit1	i16
	lda	#28
	sta	trans_flag
	ldx	vmap1
	ramnastyoff
	dmaxvram	0,(bitmapbase+bitmap1),gametranlen1
	ramnastyon
	jsr	seqscroll
	jsr	setinidisp
	lda	#1
	sta	transbmp1
	jsr	startmus
	rtl

	shorta
	shorti
endseqbit2	i16
	lda	#30
	sta	trans_flag
	a16
	lda	vmap1
	clc
	adc	#gametranlen1/2
	tax
	a8
	ramnastyoff
	dmaxvram	0,(bitmapbase+bitmap1+gametranlen1),gametranlen2
	ramnastyon
	jsr	seqscroll
	jsr	setinidisp
	lda	#2
	sta	transbmp1
	lda	drawmap+1
	list	off
	lsr	a
	lsr	a
	sta	m_scbr
	jsr	startmus
	rtl


	shorta
	shorti
endseqbit3	lda	noirqbit3
	bne	.doi3
	rtl
.doi3
	i16
	lda	vmap1+1		;set new screen base select
	lsr	a
	lsr	a
	lsr	a
	lsr	a
	ora	#(vchr_physback>>12)<<4
	sta	bg12nba

	ldx	vmap1		;swap double buffering
	ldy	vmap2
	stx	vmap2
	sty	vmap1

	jsr	seqtext

	jsr	window_buffer

	a8i16
	jsr	setwindowpri

	jsr	seqscroll

	jsr	setinidisp

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

	a8
	jsr	startmus

	lda	#32
	sta	trans_flag
	rtl



;--------------------------------------------------------------------------
	shorta
	shorti
irqblank	lda	#1
	sta	gamevwpos
	jsr	startmus
	rtl

	shorta
irqbit1	i16
	lda	#4
	sta	trans_flag
.jmpin	local	 
	ldx	vmap1
	ramnastyoff

	IFEQ	PAL
	dmaxvram	0,(bitmapbase+bitmap1),gametranlen1
	ELSEIF
	dmaxvram	0,(bitmapbase+bitmap1),gametranlen1+3096
	ENDC

	ramnastyon
	lda	#1
	sta	transbmp1
	jsr	startmus
	rtl

	shorta
irqbit2	i16
	lda	dogyirq
	beq	.game
.cont	lda	#24
	sta	trans_flag
	bra	.jmpin
.game
	lda	#6
	sta	trans_flag
.jmpin	local
	a16
	lda	vmap1
	clc

	IFEQ	PAL
	adc	#gametranlen1/2
	ELSEIF
	adc	#gametranlen1/2+3096/2
	ENDC

	tax
	a8
	ramnastyoff

	IFEQ	PAL
	dmaxvram	0,(bitmapbase+bitmap1+gametranlen1),gametranlen2
	ELSEIF
	dmaxvram	0,(bitmapbase+bitmap1+gametranlen1+3096),gametranlen2-3096
	ENDC

	ramnastyon
	lda	#2
	sta	transbmp1
	lda	drawmap+1
	lsr	a
	lsr	a
	sta	m_scbr
	IFEQ	PAL+_30fps
	jsr	startmus
	rtl
	ELSEIF

	lda	trans_flag
	cmp	#6
	beq	irqbit3
	jsr	startmus
	rtl

	ENDC

	shorta
	shorti
irqbit3	lda	noirqbit3
	bne	.doi3
	rtl
.doi3
	i16
	waithtime	50,70
	dmaoaram	0,0,spriteblk,328
	dmavram		0,bg2offsets+32,bg2voffsbak,64  ;DMA bg2 v offsets
	dmacgram	0,0,pal0palette,8*32		;DMA palette 0-7

	lda	flashtunnelon
	beq	.skip
	jsr	irqrand
	cmp	#((20)*255)/100		;20% chance of a flash
	bcs	.skip
	dmacgram	0,0,redtunnel,64
.skip
	lda	flashbg
	beq	.skipt
	jsr	irqrand
	cmp	#((2)*255)/100		;2% chance of a flash
	bcs	.skipt
	dmacgram	0,5*16,thundercol,32
.skipt
	lda	#2*16+4
	sta	cgadd
	lda	shieldup
	beq	.nope
	lda	#$e0
	sta	cgdata
	lda	#$7e
	sta	cgdata
	bra	.conti
.nope	lda	#$1f
	sta	cgdata
	stz	cgdata
.conti

	lda	bg3scrollflag
	beq	.nobg3
	lda	bg3scroll		;BG3 scroll
	sta	bg3hofs
	lda	bg3scroll+1
	sta	bg3hofs
.nobg3
	ldx	hdmabg2hofs1		;Double buffer HDMA
	ldy	hdmabg2hofs2
	stx	hdmabg2hofs2
	sty	hdmabg2hofs1
	sty	ch2addra1tl

	jsr	window_buffer

	jsr	setbg2vofs

	lda	vmap1+1			;Double buffer screen
	lsr	a
	lsr	a
	lsr	a
	lsr	a
	ora	#(vchr_physback>>12)<<4
	sta	bg12nba

	jsr	setwindowpri

	jsr	startmus		;Music

	IFEQ	mouseon		;if mouseon = 0
	a16
	lda	joy1l
	eor	cont0l
	and	joy1l
	sta	trig0
	jsr	getcont0
	a8
	lda	cont1
	sta	cont1l
	lda	contl1
	sta	contl1l
	lda	joy2l
	sta	contl1
	lda	joy2h
	sta	cont1
	endc
	
	IFNE	mouseon		;if mouseon=1
	a16
	lda	joy1l
	eor	cont0l
	and	joy1l
	sta	trig0
	jsr	getcont0
	lda	cont1
	sta	cont1l
	jsr	mouse_read2	
	endc
	
	jsr	setinidisp

	ldx	vmap1			;Bitmap double buffering
	ldy	vmap2
	stx	vmap2
	sty	vmap1

	stz	trans_flag
	rtl



;--------------------------------------------------------------------------
	shorta
	longi
setbg2vofs	a8
	lda	bg2vofsoverride
	beq	.ok
	lda	bg2vofsreq
	sta	bg2vofs
	lda	bg2vofsreq+1
	sta	bg2vofs
	lda	bg2hofsreq
	sta	bg2hofs
	lda	bg2hofsreq+1
	sta	bg2hofs
	rts
.ok
	lda	inatunnel
	beq	.skipdd

	a16
	lda	oldviewposz
	lsr	a
	lsr	a
	and	#62
	tax
	lda.l	chequered_tables,x
	tay
	a8
	phb
	lda	#chequered_tables>>16
	pha
	plb
	ldx	#0
.lp	lda.w	0,y
	bpl	.norm
	and	#127
	sta.l	xhdma_bg2vofs+3,x
	inx
	lda	#cscr2&BM
	sta.l	xhdma_bg2vofs+3,x
	inx
	lda	#cscr2>>8
	sta.l	xhdma_bg2vofs+3,x
	bra	.finishoff
.norm	sta.l	xhdma_bg2vofs+3,x
	inx
	lda	#cscr1&BM
	sta.l	xhdma_bg2vofs+3,x
	inx
	lda	#cscr1>>8
	sta.l	xhdma_bg2vofs+3,x
.finishoff
	inx
	iny
	cpx	#224*3
	bne	.lp
	plb
.skipdd
	rts

;--------------------------------------------------------------------------
	shorta
setinidisp	lda	fadedir		;Set inidisp
	lbeq	.done
	bpl	.fadeup
.fadedown	cmp	#-2
	beq	.qfadedown
	cmp	#-3
	beq	.sfadedown
.fade1	lda	fade
.setdown	beq	.off
	dec	a
	beq	.off
	sta.l	xinidisp1
	sta.l	xinidisp2
	sta.l	xinidisp1a
	sta	fade
	bra	.done
.off	lda	#$80
	sta.l	xinidisp1
	sta.l	xinidisp2
	sta.l	xinidisp1a
	stz	fadedir
	stz	fade
	bra	.done
.sfadedown	lda	gameframe
	and	#1
	beq	.fade1
	rts
.qfadedown	lda	fade
	beq	.off
	dec	a
	beq	.off
	bra	.setdown
.fadeup	cmp	#2
	beq	.qfadeup
	lda	fade
.setup	cmp	#15
	beq	.on
	inc	a
	sta.l	xinidisp1
	sta.l	xinidisp2
	sta.l	xinidisp1a
	sta	fade
	bra	.done
.on	stz	fadedir
	lda	#15
	sta	fade
	bra	.done
.qfadeup	lda	fade
	cmp	#15
	beq	.on
	inc	a
	cmp	#15
	beq	.on
	inc	a
	bra	.setup
.done
	rts

;-----------------------------------------------------------------------
	shorta
	longi
getcont0	a8
	lda	cont0		;store old one
	sta	cont0l
	lda	contl0
	sta	contl0l

	lda	c_type
	and	#3
	asl	a
	xba
	lda	#0
	xba
	tax
	jmp	(.conttab,x)
.conttab	dw	typea&WM
	dw	typeb&WM
	dw	typec&WM
	dw	typed&WM
typea	lda	joy1l
	sta	contl0
	lda	joy1h
	sta	cont0
	rts

typeb	lda	joy1l
	sta	contl0
	lda	joy1h
	and	#%11000000
	lsr	a
	lsr	a
	lsr	a
	lsr	a
	lsr	a
	lsr	a
	xba
	lda	#0
	xba
	tax
	lda	joy1h
	and	#%00111111
	ora.l	typey_b,x  ;nmitemp
	sta	cont0
	rts

typec	lda	joy1l
	sta	contl0
	lda	joy1h
	and	#%00001100
	lsr	a
	lsr	a
	xba
	lda	#0
	xba
	tax
	lda.l	typeu_d,x
	sta	nmitemp
	lda	joy1h
	and	#%11110011
	ora	nmitemp
	sta	cont0
	rts

typed	lda	joy1l
	sta	contl0
	lda	joy1h
	and	#%00001100
	lsr	a
	lsr	a
	xba
	lda	#0
	xba
	tax
	lda.l	typeu_d,x
	sta	nmitemp
	lda	joy1h
	and	#%00110011
	ora	nmitemp
	pha
	lda	joy1h
	and	#%11000000
	lsr	a
	lsr	a
	lsr	a
	lsr	a
	lsr	a
	lsr	a
	xba
	lda	#0
	xba
	tax
	lda.l	typey_b,x
	sta	nmitemp
	pla
	ora	nmitemp
	sta	cont0
	rts

typey_b	db	%00000000,%10000000,%01000000,%11000000
typeu_d	db	%00000000,%00001000,%00000100,%00001100


;-----------------------------------------------------------------------
seqscroll	php
	a8
	lda	bg1hofsbak
	sta	bg1hofs
	lda	bg1hofsbak+1
	sta	bg1hofs
	lda	bg1vofsbak
	sta	bg1vofs
	lda	bg1vofsbak+1
	sta	bg1vofs

	lda	bg2hofsbak
	sta	bg2hofs
	lda	bg2hofsbak+1
	sta	bg2hofs
	lda	bg2vofsbak
	sta	bg2vofs
	lda	bg2vofsbak+1
	sta	bg2vofs

	lda	bg3hofsbak
	sta	bg3hofs
	lda	bg3hofsbak+1
	sta	bg3hofs
	lda	bg3vofsbak
	sta	bg3vofs
	lda	bg3vofsbak+1
	sta	bg3vofs

	ai16
	lda	bg1hofsbak
	ldx	bg1hofsreq
	ldy	#bg1xspd
	jsr	ramchase
	sta	bg1hofsbak
	lda	bg1vofsbak
	ldx	bg1vofsreq
	ldy	#bg1yspd
	jsr	ramchase
	sta	bg1vofsbak

	lda	bg2hofsbak
	ldx	bg2hofsreq
	ldy	#bg2xspd
	jsr	ramchase
	sta	bg2hofsbak
	lda	bg2vofsbak
	ldx	bg2vofsreq
	ldy	#bg2yspd
	jsr	ramchase
	sta	bg2vofsbak

	lda	bg3hofsbak
	ldx	bg3hofsreq
	ldy	#bg3xspd
	jsr	ramchase
	sta	bg3hofsbak
	lda	bg3vofsbak
	ldx	bg3vofsreq
	ldy	#bg3yspd
	jsr	ramchase
	sta	bg3vofsbak
.skipe
	plp
	rts

seqwindow	php

	plp
	rts


;-----------------------------------------------------------------------
seqtext	php
	a8i16
	lda	bgflags
	bit	#bgf_text
	bne	.do
	plp
	rts
.do
	ldx	seq_tptr
	ldy	seq_vm
	sty	vmaddl
.lp
	lda.l	seq_buffer,x
	inx
	cmp	#0
	beq	.end
	cmp	#1
	bne	.notpos
	a16
	lda.l	seq_buffer,x
	inx
	inx
	clc
	adc	#0e000h/2
	sta	vmaddl
	tay
	a8
	bra	.lp
.notpos
	a16
	and	#0ffh
	phx
	tax
	lda.l	etesttrans-32,x
	and	#0ffh
	plx
	ora	#1<<13
	clc
	adc	#256
	sta	vmdatal
	a8
	iny
	sty	seq_vm
	stx	seq_tptr
	plp
	rts
.end
	lda	bgflags
	and	#~bgf_text
	sta	bgflags
	plp
	rts

;-----------------------------------------------------------------------
	longa
	longi
ramchase
	stx	nmitemp
	cmp	nmitemp
	sty	nmitemp
	beq	.nc
	bmi	.pos
	sec
	sbc	nmitemp
	bra	.nc
.pos	clc
	adc	nmitemp
.nc
	rts

;-----------------------------------------------------------------------
startmus	php
	ai8
	lda	bgmcnt
	beq	.start
	dec	a
	beq	.check
	bra	.trig3
.start	lda	bgm_music
	IFNE	msu
	jsr 	$7ED000 ; MSU-1 routine to determine song to play
	ELSEIF
	sta	apu_port0
	ENDC
	inc	bgmcnt
	bra	.trig3
.check	lda	apu_port0
	cmp	bgm_music
	bne	.start
	stz	apu_port0
	inc	bgmcnt
.trig3

	lda	sdpck3		;check last sound
	beq	.sndp040
	cmp	apu_port3
	bne	.reject

	stz	sdpck3
	stz	apu_port3
.sndp040
	lda	pausesnd
	bne	.pause

	ldx	sdgpt3
	cpx	sdspt3
	beq	.ret
	lda	sdport3,x
	sta	apu_port3
	sta	sdpck3
	lda	sdgpt3
	inc	a
	and	#15
	sta	sdgpt3
.ret	plp
	rts
.reject
	plp
	rts

.pause
	sta	apu_port3
	sta	sdpck3
	stz	sdspt3
	stz	sdgpt3
	stz	pausesnd
	plp
	rts


;-----------------------------------------------------------------------
irqrand	lda	rand
	clc
	sbc	rand+1
	sta	rand+1
	sbc	rand+2
	sta	rand+2
	sbc	rand+3
	sta	rand+3
	sbc	rand
	sta	rand
	rts

;-----------------------------------------------------------------------
	shorta
	longi
setwindowpri	ldx	windowptr		;Set window values
	beq	.noreq
	cpx	#wa_wipe*wm_sizeof+windowarray
	beq	.wipe
	lda	wm_cgadsub,x
	sta	cgadsub
	lda	wm_coldata,x
	beq	.nowrite
	sta	coldata
	bra	.notindiv
.nowrite	lda	wm_coldata_r,x
	and	#%11111
	ora	#%100000
	sta	coldata
	lda	wm_coldata_g,x
	and	#%11111
	ora	#%1000000
	sta	coldata
	lda	wm_coldata_b,x
	and	#%11111
	ora	#%10000000
	sta	coldata
.notindiv	lda	wm_ts,x
	sta	ts
	lda	wm_cgswsel,x
	bit	#%110000
	bne	.window
	ora	#%00010000
	sta	cgswsel
	lda	#%10000000
	sta	wobjsel		; enable window 2
	lda	#16
	sta	wh2
	lda	#256-16
	sta	wh3
	bra	.donereq
.window	sta	cgswsel
	lda	#%00100000
	sta	wobjsel		; enable window 1
	bra	.donereq
.noreq
	lda	#%00000010
	sta	cgswsel
	lda	#%01010000
	sta	cgadsub
	lda	#%11100000
	sta	coldata
	lda	#%111
	sta	ts
.donereq
	stz	w12sel
	stz	w34sel
	stz	wbglog
	lda	#%1100
	sta	wobjlog
	stz	tmw
	rts
.wipe
	lda	#%10111011
	sta	w12sel
	lda	#%10111011
	sta	w34sel
	lda	#%00001011
	sta	wobjsel
	lda	wm_wbglog,x		;#%01010101
	sta	wbglog
	and	#%11
	sta	wobjlog
	lda	#1+2+4+8+16
	sta	tmw
	stz	cgadd
	stz	cgdata
	stz	cgdata
	rts

;--------------------------------------------------------------------------------------
window_buffer	php
	a16
	ldx	hdmacirclebuf1		;Double buffer windows
	lda	hdmacirclebuf2
	stx	hdmacirclebuf2
	sta	hdmacirclebuf1
	sta	ch3addra1tl
	a8
	lda	whichcircle
	eor	#1
	sta	whichcircle
	plp
	rts

	IFNE	mouseon
;****************************************************************
;*																*
;*		Super NES Mouse BIOS									*
;*		March 10, 1992        									*
;*		Modified by Kandowontu for ultrastarfox					*
;*		(c) 1992 Nintendo of America Inc.						*
;*		2022 Kandowontu											*
;*																*
;****************************************************************
;
;****************************************************************
;****************************************************************
;*																*
;*		  Mouse Driver Routine (Ver 1.00)						*
;*						         								*
;****************************************************************
;****************************************************************
		db	'START OF SNES MOUSE BIOS'	;do not delete
; original: 'START OF MOUSE BIOS'
;	incpublics	mouse.ext
;================================================================
;		RAM Definition    
;================================================================

;reg0
;reg0l		ds	1	; Work registers
;reg0h		ds	1

;mouse_con	ds	1	;
;mouse_con0	ds	1	; Mouse connection port D0=4016
;mouse_con1	ds	1	; Mouse connection port D0=4017

;mouse_sp_set
;mouse_sp_set0	ds	1	; Mouse Speed Setting (joy1)
;mouse_sp_set1	ds	1	; Mouse Speed Setting (joy2)

;mouse_sp
;mouse_sp0	ds	1	; Mouse Speed (joy1)
;mouse_sp1	ds	1	; Mouse Speed (joy2)

;mouse_y0	ds	1	; Mouse Y-direction  (joy1)
;mouse_y1	ds	1	; Mouse Y-direction  (joy2)
;mouse_x0	ds	1	; Mouse X-direction  (joy1)
;mouse_x1	ds	1	; Mouse X-direction  (joy2)

;mouse_sw
;mouse_sw0	ds	1	; Mouse button turbo
;mouse_sw1	ds	1	; Mouse button turbo

;mouse_swt
;mouse_swt0	ds	1	; Mouse button trigger
;mouse_swt1	ds	1	; Mouse button trigger

;mouse_sb			; Previous Switch status
;mouse_sb0	ds	1
;mouse_sb1	ds	1

;cursol_x	ds	1	; Cursor X position    
;cursol_y	ds	1	; Cursor Y position

;*******************************************************************
;*  ============================================================== *
;*        Mouse_read                                               *
;*  ============================================================== *
;*								   								   *
;*  If this routine is called every frame, then the mouse status   *
;*     will be set to the appropriate registers.                   *
;*                                                                 *
;* INPUT                                                           *
;*     None (Mouse key read automatically                          *
;*                                                                 *
;* OUTPUT                                                          *
;*     Connection status (mouse_con) D0=1 Mouse connected to Joy1  *
;*	                             D1=1 Mouse connected to Joy2  	   *
;*                                                                 *
;*     Switch (mouse_sw0,1)  D0=left switch turbo                  *
;*                           D1=right switch turbo                 *
;*                                                                 *
;*     Switch (mouse_swt0,1) D0=left switch trigger                *
;*                           D1=right switch trigger               *
;*                                                                 *
;*     Mouse movement (ball) value                                 *
;*            (mouse_x) D7=0 Positive Turn, D7=1 Negative Turn     *
;*			     D6-D0 X movement value							   *
;*            (mouse_y) D7=0 Positive Turn, D7=1 Negative Turn     *
;*			     D6-D0 Y movement value                			   *
;*                                                                 *
;*                                                                 *
;******************************************************************* 

mouse_read2
	PHB
	IFNE	FASTROM
	lda	#$80
	pha
	plb
	ELSEIF
	lda	#0
	pha
	plb
	ENDC

	php
	;sep	#$30		
.10
	lda	$4212
	and	#%00000001
	bne	.10		; Automatic read okay?

	ldx	#$01		; Joy 2
	lda	$421a
	jsr	mouse_data

	lda	connect_st1
	beq	.20

	jsr	speed_change	
	stz	connect_st1
	plp
	plb
	rts
.20
	dex
	lda	$4218		; Joy 1    
	jsr	mouse_data

	lda	connect_st0
	beq	.30

	jsr	speed_change	
	stz	connect_st0
.30
	plp
	plb
	rts


mouse_data
	sta	reg0l		; (421a 4218 save to reg0)  
	and	#%00001111
	cmp	#$01		; Is mouse connected?        
	beq	.m10

	stz	mouse_con0,x	; No connection

	stz	mouse_x0,x
	stz	mouse_y0,x
	stz	mouse_sw0,x
	stz	mouse_swt0,x
	stz	mouse_sb0,x
	
	rts
.m10
	lda	mouse_con0,x	; When mouse is connected, speed will change
	bne	.m20		; Previous connection status
				;	(mouse.com judged by lower 1 bit)

	lda	#$01		; Connection check flag ON
	sta	mouse_con0,x
	sta	connect_st0,x
	rts

  
.m20
	lda	#$01		; Connection check flag ON
	sta	mouse_con0,x
	ldy	#16		; Read 16-bit data
.m30
	lda	$4016,x
	lsr	a
	rol	mouse_x0,x
	rol	mouse_y0,x
	dey
	bne	.m30

	stz	mouse_sw0,x

	rol	reg0l
	rol	mouse_sw0,x
	rol	reg0l
	rol	mouse_sw0,x	; Switch Turbo  

	lda	mouse_sw0,x
	eor	mouse_sb0,x	; Get Switch trigger 
	bne	.m40

	stz	mouse_swt0,x
	rts
.m40
	lda	mouse_sw0,x
	sta	mouse_swt0,x
	sta	mouse_sb0,x
	rts


;*******************************************************************
;*  =============================================================  *
;*	Speed_change                                   		   		   *
;*  =============================================================  *
;*  Set speed to mouse_sp_set.  Give mouse port the value of x and *
;*	call this routine.					   						   *
;*  If this routine is called without setting mouse_sp_set, then   *
;*      previous speed will be assigned to current speed.          *
;*  Normally, mouse speed data will be saved to mouse_sp.	   	   *
;*  If mouse speed cannot be set properly, then error code will    *
;*  	be set to mouse_sp.					   					   *
;*								   								   *
;* INPUT							   							   *
;*      X=connection port (X:0=joy1 1=joy2)                        *
;*      MOUSE_sp_seT0= JOY1 setting speed                          *
;*      MOUSE_sp_seT1= JOY2 setting speed                          *
;* OUTPUT							   							   *
;*      MOUSE_sp0 = Joy1 Mouse speed                               *
;*	          (0=slow, 1=medium, 2=fast, $80=error code        	   *
;*      MOUSE_sp1 = Joy2 Mouse speed                               *
;*	          (0=slow, 1=medium, 2=fast, $80=error code        	   *
;*******************************************************************

speed_change
	php
	sep	#$30

	lda	mouse_con,x	
	beq	.s25

	lda	#$10		
	sta	reg0h		

.s10
	lda	#$01
	sta	$4016
	lda	$4016,x		; Speed change (1 step)
	stz	$4016

	lda	#$01		; Read Speed data   
	sta	$4016		; Shift register clear
	lda	#$00
	sta	$4016

	sta	mouse_sp0,x	; Speed register clear  

	ldy	#10		; Shift register read has no meaning
.s20
	lda	$4016,x
	dey
	bne	.s20

	lda	$4016,x		; Read Speed  
	lsr	a
	rol	mouse_sp0,x

	lda	$4016,x
	lsr	a
	rol	mouse_sp0,x
	lda	mouse_sp0,x

	cmp	mouse_sp_set0,x	; Set speed or not? 
	beq	.s30

	dec	reg0h		; For error check         
	bne	.s10

.s25
	lda	#$80		; Speed change error    
	sta	mouse_sp0,x
.s30
	plp
	rts

	db	'MODIFIED FROM SNES MOUSE BIOS Ver1.00'	;do not delete
;
;			if user modifies program, then change to 
;			'MODIFIED FROM SHVC MOUSE BIOS Ver1.00'
;			Original: 'NINTENDO SHVC MOUSE BIOS Ver1.00'
;
	db	'END OF SNES MOUSE BIOS'	    			;do not delete
;	original: 'END OF MOUSE BIOS'
	ENDC ;mouseon


