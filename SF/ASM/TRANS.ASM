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
;*  File : trans.asm                                                       *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr : Transfer loop, etc.                                            *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*  Date created : 15/2/1992                                               *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*  Author: Krister Wombell                                                *
;*                                                                         *
;***************************************************************************

	INCPUBLICS	EXT\trans.ext

;-----------------------------------------------------------------------
;-----------------------------------------------------------------------
;-----------------------------------------------------------------------
;-----------------------------------------------------------------------
;-----------------------------------------------------------------------

transfer_l
	a8i16
	lda	framec
	sta	framer
	stz	framec
.notfinished
	lda	trans_flag
	bne	.notfinished
	stz	noirqbit3
	lda	#2		;start screen transferring
	sta	trans_flag

	jsr	do_circle_explosion
	jsl	calcbgscroll_l

	jsr	calcbg2voffsets

	ai16
	lda	bgsscrollZ
	sta	oldviewposz

	lda	bg3scrollflag
	beq	.noscroll
	ldx	viewpt
	lda	al_worldx,x
	asra
	asra
	asra
	dec	a
	dec	a
	dec	a
	dec	a
	sta	bg3scroll
.noscroll
	lda	dospacesc
	and	#$ff
	beq	.noscrollsp
	cmp	#1
	beq	.l15

	lda	spacescz
	clc
	adc	lastzchange
	cmp	#500
	bcc	.stspsc
	lda	bg2yscroll
	cmp	#-294
	beq	.noscrollsp
	dec	a
	sta	bg2yscroll
	lda	#0
	bra	.stspsc
.l15
	lda	spacescz
	clc
	adc	lastzchange
	cmp	#2000
	bcc	.stspsc
	lda	bg2yscroll
	cmp	#212
	beq	.noscrollsp
	inc	a
	sta	bg2yscroll
	lda	#0
.stspsc	sta	spacescz
.noscrollsp
	jsr	do_hpositions
	jsr	dmahpos
	jsl	find_window_pri_l

	a8i16
	lda	doingwipe
	bne	.skip
	inc	noirqbit3
.skip
	lda	freezestrats
	bit	#1
	lbne	stratsfrozen


	IFNE	debuginfo2
	a8
	s_jmp_keyup		b,normstrats2
	s_jmp_keyup		x,normstrats2

	s_jmp_keyup		left,.ndec
	s_jmp_lastkeydown	left,.ndec
	s_dec_var		B,superspeeddelay
.ndec

	s_jmp_keyup		right,.ninc
	s_jmp_lastkeydown	right,.ninc
	s_inc_var		B,superspeeddelay
.ninc


	lda	superspeedcnt
	beq	normstrats
	bpl	.faster
	inc	a
	sta	superspeedcnt	
	bra	stratsfrozen
.faster	pha
	php
	jsr	dostrats
	plp
	pla
	dec	a
	bne	.faster
	s_set_var	B,superspeedcnt,superspeeddelay
	bra	stratsfrozen
normstrats2
	s_set_var	B,superspeeddelay,#0
normstrats
	s_set_var	B,superspeedcnt,superspeeddelay
	ENDC

	jsr	dostrats

stratsfrozen
	a8

	lda	cont0
	sta	lastcont0
	lda	contl0
	sta	lastcontl0

	jsl	getview_l

	jsl	dosounds_l
	jsl	palgoto_l
	jsl	fadepalto_l
	jsl	showview_l
	jsl	build_drawlist_l
	jsl	do_sprites_l
	jsr	calcmeters

	jsl	generate_collist_l

	a8
.twait	lda	transbmp1
	beq	.twait

	lda	bgflags
	beq	.normal
	jsr	transswap
.normal
	jsl	clronehalf_l

.twait2	lda	transbmp1
	cmp	#2
	bne	.twait2
	stz	transbmp1

	ai16
	lda	dotsflag
	sta.l	m_dotsorstars
	beq	.skip
	jsl	mshowgrid_l
.skip	jsl	do_3d_display_l

	jsr	do_window_wipe

	a8
	lda	doingwipe
	beq	.nd3
	inc	noirqbit3
.nd3
	a8
	lda	framec
	sta	framerate
	lda	framecount
	clc
	adc	framer
	sta	framecount
	inc	frames
	lda	framecount
	cmp	#consoleframerate	; SNES framerate
	bcc	.noreset
	lda	frames
	sta	framesb
	stz	frames
	lda	framecount
	sec
	sbc	#consoleframerate	; SNES framerate
	sta	framecount
.noreset

;	IFNE	msuvoice
;	lda	voiceline ; voiceline debug
;	printd	1,2
;	ENDC

	ifne	mario_stats3d

	lda	framesb ; framerate
	printd	1,2

	lda.l	m_numshapes		; shapes in drawlist
	printd	1,3

	;lda.l	m_shapes_notdrawn+1	; shapes rejected by new quick tests
	;printd	1,3
	;lda.l	m_shapes_notdrawn	; shapes rejected after rot\proj pnts
	;printd	5,3

	lda.l	m_polys_drawn
	printd	1,4

	lda.l	m_lines_drawn
	printd	1,5

	;lda.l	m_points_done+1		; I've seen >600 pnts being rotated!
	;printd	1,6
	lda.l	m_points_done
	printd	1,6

	;lda.l	m_visis_done+1
	;printd	1,7
	;lda.l	m_visis_done
	;printd	5,7

	;lda.l	m_polys_clip2d
	;printd	5,8
		
	;lda.l	m_polys_clip3d
	;printd	5,9

	endc





	rtl



	shorta
	longi
transswap_l	jsr	transswap
	rtl
transswap
	lda	transbmp1		;...but this isn't!
	cmp	#2
	bne	transswap

	disable
	lda	trans_flag
	stz	trans_flag
	pha
	enable

	a8			;DO BG CHANGES ETC.
	lda	bgflags
	bit	#bgf_restart
	beq	.nores
	jsl	restart_l
.nores
	ai16
	lda	bgflags
	bit	#bgf_bg
	beq	.noreq
	jsl	dobgreq_l
.noreq
	ai16
	lda	bgflags
	bit	#bgf_info
	beq	.noreqinfo
	jsl	setbginforeq_l
.noreqinfo
	a8
	lda	bgflags
	and	#~(bgf_info+bgf_bg+bgf_restart)
	sta	bgflags
	pla
	sta	trans_flag
	rts


;-----------------------------------------------------------------------
dostrats
 	incw	gameframe

	phb
	lda	#$7e
	pha
	plb
	jsl	init_strats_l		;init coll player move, etc.
	jsl	update_objects_l
	ldx	allst			;do all strategies
stratlp	stz	aldead
	jsl	do_strat_l
	lda	aldead
	bne	.killal
	ldy	_next,x
.killed	tyx
	bne	stratlp
	bra	.cont
.killal	ldy	_next,x
 	jsl	removedeadal_l
	bra	.killed
.cont	plb
	rts

;-----------------------------------------------------------------------
find_window_pri_l
	php
	a8i16
	jsr	find_window_pri
	plp
	rtl

find_window_pri
	stz	tpa+1
	lda	windowmode
	sta	tpa
	a16
	beq	.nothing
	ldx	#maxwindows
	lda	#windowarray
.findhighest
	ror	tpa
	bcs	.found
	adc	#wm_sizeof
	dex
	bne	.findhighest
.nothing	lda	#0
.found	sta	windowptr
	rts


;-----------------------------------------------------------------------
calcbg2voffsets_l
	jsr	calcbg2voffsets
	rtl
calcbg2voffsets
	ai16
	stz	dobg2
	lda	dovofs
	and	#$ff
	bne	.do
	rts
.do	longa
 
	lda	dozrot
	and	#$ff
	bne	.dorotz
	lda	#0
	bra	.gotzrot
.dorotz
	lda	plrotz		;max is $d00
	bmi	.neg
.gotzrot
	swa
	and	#7
	asl	a
	tax
	lda.l	bg2ptrs,x
	cmp	lastrot
	bne	.set
	rts
.set	sta	lastrot
	tax
	ldy	#0
.lp	lda	0,x
	clc
	adc	bg2scroll
	sta.w	bg2voffsbak,y
	iny
	iny
	inx
	inx
	cpy	#64
	bne	.lp
	lda	#1
	sta	dobg2
	rts

	longa
	longi
.neg
	nega
	swa
	and	#7
	asl	a
	tax
	lda.l	bg2ptrs,x
	cmp	lastrot
	bne	.set2
	rts
.set2	sta	lastrot
	clc
	adc	#62
	tax
	ldy	#0
.lp2	lda	0,x
	clc
	adc	bg2scroll
	sta.w	bg2voffsbak,y
	dex
	dex
	iny
	iny
	cpy	#64
	bne	.lp2
	lda	#1
	sta	dobg2
	rts


	shorta
	longi
dmabg2voffsets_l
	php
	a8i16
	jsr	dmabg2voffsets
	plp
	rtl
dmabg2voffsets
	lda	#$80
	sta	vmainc
	lda	#(vmdatal&$ff)
	sta	ch0addrb
	ldx	#bg2voffsbak
	stx	ch0addra1tl
	stz	ch0atbank
	ldx	#(bg2offsets+32)&WM
	stx	vmaddl
	ldx	#64
	stx	ch0dataddrl
	lda	#1
	sta	ch0params
	lda	#1
	sta	mdmaen
	rts


;------------------------------------------------------------------------------
clronehalf_l
; clears one half of the 3d screen
	php
	a8i16
	lda	#mclrbitmaps2>>16
	ldx	#mclrbitmaps2&WM
	jsl	runmario_l
	plp
	rtl


;------------------------------------------------------------------------------
clrotherhalf_l
; clears one half of the 3d screen
	php
	a8i16
	lda	#mclrbitmaps3>>16
	ldx	#mclrbitmaps3&WM
	jsl	runmario_l
	plp
	rtl


;------------------------------------------------------------------------------
do_hpositions_l
	jsr	do_hpositions
	rtl
do_hpositions
	ai16
	lda	dohofs
	and	#$ff
	bne	.ok
	rts
.ok	ldx	hposjmp
	jmp	(.jmp,x)
.jmp	dw	rotplanet&WM
	dw	tunnelgrad&WM
	dw	tunnelgrad&WM
	dw	waterhofs&WM
	dw	tunnelgrad&WM
	dw	nograd&WM
	dw	bhole&WM
	dw	bholescaledown&WM

	longa
bhole	lda	viewposx
	sta.l	m_viewposx
	a8
	lda	#mbhole>>16
	ldx	#mbhole&WM
	jsl	runmario_l
	rts

	longa
bholescaledown

	longa
nograd	lda	viewposx
	sta.l	m_viewposx
	a8
	lda	#mnograd>>16
	ldx	#mnograd&WM
	jsl	runmario_l
	rts

	longa
waterhofs	lda	viewposx
	sta.l	m_viewposx
	a8
	lda	#mwibbletunnel>>16
	ldx	#mwibbletunnel&WM
	jsl	runmario_l
	rts

	longa
rotplanet	lda	plrotz
	sta.l	m_viewposx
	ldx	playpt
	lda	al_worldx,x
	sta.l	m_y1
	a8
	lda	#mrotplanet>>16
	ldx	#mrotplanet&WM
	jsl	runmario_l
	rts

	longa
tunnelgrad	lda	viewposx
	sta.l	m_viewposx
	a8
	lda	#mtunnelgrad>>16
	ldx	#mtunnelgrad&WM
	jsl	runmario_l
	rts



;------------------------------------------------------------------------------
dmahpos_l	jsr	dmahpos
	rtl
dmahpos	ai8
.vw	lda	slhvr		;wait for screen off
	ldx	ophctr
	lda	ophctr
	and	#1
	bne	.vw
	cpx	#90
	bcc	.vw
	cpx	#100
	bcs	.vw

	i16
	disable
	ldx	hdmabg2hofs2
	stx	wmaddl
	stz	wmaddh
	lda	#wmdata&$ff
	sta	ch0addrb
	ldx	#(bg_scrollbuffer)&WM
	stx	ch0addra1tl
	lda	#(bg_scrollbuffer)>>16
	sta	ch0atbank
	ldx	#224*3
	stx	ch0dataddrl
	stz	ch0params
	lda	#1
	sta	mdmaen
	enable
	rts


;------------------------------------------------------------------------------
calcmeters	a8i16
	ifeq	shieldboostcolorbox
	lda	shieldup	; send shieldup flag to mario chip
	sta.l	m_shieldup	; note that we're in a8 mode so we're only storing to the lo byte
	endc
	ldx	pcboxobj_b
	lda	al_HP,x
	bpl	.ok
	lda	#0
.ok	sta.l	m_damage

boost	lda	boostcnt
	beq	.end
	lda.l	m_boostanim
	dec	a
	dec	a
	bpl	.ok
	lda	#0
	sta	boostcnt
.ok	sta.l	m_boostanim
	bra	.draw
.end	lda.l	m_boostanim
	cmp	#40
	beq	.draw
	lda.l	m_boostanim
	inc	a
	sta.l	m_boostanim
	and	#15
	beq	.draw
.draw
	rts



;------------------------------------------------------------------------------
init_wipe	macro
\1_circle	equ	*-circletab
	db	ct_init_wipe
	dw	\1&0ffffh
	endm

do_wipe	macro
	db	ct_wipe_do
	endm

circlegoto	macro
	db	ct_circle_goto
	dw	\1-circletab
	endm

wipeend	macro
	db	ct_wipe_end
	endm

ct_circle_init		equ	0
ct_circle_rad		equ	2
ct_circle_blue		equ	4
ct_circle_green	equ	6
ct_circle_red		equ	8
ct_circle_endifblue	equ	10
ct_circle_endifgreen	equ	12
ct_circle_endifred	equ	14
ct_circle_endifradius	equ	16
ct_circle_end		equ	18
ct_circle_loop		equ	20
ct_set_blue		equ	22
ct_set_green		equ	24
ct_set_red		equ	26
ct_circle_exit		equ	28
ct_set_rad		equ	30
ct_set_affect		equ	32
ct_init_wipe		equ	34
ct_wipe_do		equ	36
ct_circle_goto		equ	38
ct_wipe_end		equ	40

do_circle_explosion_l
	jsr	do_circle_explosion
	rtl


do_circle_explosion
	a8
	stz	doawipe
	ai16
	ldx	circleanim
	bne	circle_com
	a8
	dealloc_window	circle
	stz	doingwipe
	rts
circle_com	a16
	lda.l	circletab,x
	and	#$ff
	txy
	tax
	jmp	(circlejmp,x)
circlejmp	dw	circle_init&WM
	dw	circle_rad&WM
	dw	circle_blue&WM
	dw	circle_green&WM
	dw	circle_red&WM
	dw	circle_endifblue&WM
	dw	circle_endifgreen&WM
	dw	circle_endifred&WM
	dw	circle_endifradius&WM
	dw	circle_end&WM
	dw	circle_loop&WM
	dw	set_blue&WM
	dw	set_green&WM
	dw	set_red&WM
	dw	circle_exit&WM
	dw	set_rad&WM
	dw	set_affect&WM
	dw	wipe_init&WM
	dw	wipe_do&WM
	dw	circle_goto&WM
	dw	wipeend_do&WM

	longa
	longi
circle_goto	tyx
	lda.l	circletab+1,x
	sta	circleanim
	tax
	jmp	circle_com

	longa
	longi
circle_init	tyx
	stz	circlerad
	stz	circledestrad
	a8
	stz	circleblue
	stz	circlesrcblue
	stz	circlered
	stz	circlesrcred
	stz	circlegreen
	stz	circlesrcgreen
	lda	#1+2+4+32
	sta	circleaff
	inx
	stx	circleanim
	jmp	circle_com

	longa
	longi
circle_rad	tyx
	lda.l	circletab+1,x
	sta	circledestrad
	lda.l	circletab+3,x
	sta	circlespeed
	lda.l	circletab+5,x
	sta	circlespeedadd
	inx
	inx
	inx
	inx
	inx
	inx
	inx
	jmp	circle_com

	longa
	longi
circle_blue	tyx
	a8
	lda.l	circletab+1,x
	sta	circleblue
	lda.l	circletab+2,x
	sta	circleblueframe
	sta	circleblueframesrc
	lda.l	circletab+3,x
	sta	circlebluespeed
	inx
	inx
	inx
	inx
	jmp	circle_com
	longa
	longi
circle_green
	tyx
	a8
	lda.l	circletab+1,x
	sta	circlegreen
	lda.l	circletab+2,x
	sta	circlegreenframe
	sta	circlegreenframesrc
	lda.l	circletab+3,x
	sta	circlegreenspeed
	inx
	inx
	inx
	inx
	jmp	circle_com
	longa
	longi
circle_red	tyx
	a8
	lda.l	circletab+1,x
	sta	circlered
	lda.l	circletab+2,x
	sta	circleredframe
	sta	circleredframesrc
	lda.l	circletab+3,x
	sta	circleredspeed
	inx
	inx
	inx
	inx
	jmp	circle_com
	longa
	longi
circle_endifblue
	tyx
	a8
	lda.l	circletab+1,x
	cmp	circlesrcblue
	lbne	circlecomend
	inx
	inx
	stx	circleanim
	jmp	circle_com
	longa
	longi
circle_endifgreen
	tyx
	a8
	lda.l	circletab+1,x
	cmp	circlesrcgreen
	lbne	circlecomend
	inx
	inx
	stx	circleanim
	jmp	circle_com
	longa
	longi
circle_endifred
	tyx
	a8
	lda.l	circletab+1,x
	cmp	circlesrcred
	lbne	circlecomend
	inx
	inx
	stx	circleanim
	jmp	circle_com
	longa
	longi
circle_endifradius
	tyx
	lda.l	circletab+1,x
	cmp	circlerad
	lbne	circlecomend
	inx
	inx
	inx
	stx	circleanim
	jmp	circle_com

	longa
	longi
circle_end	stz	circleobj
	stz	circleanim
	stz	circlerad
	jmp	circlecomend
	longa
	longi
circle_loop	tyx
	inx
	stx	circleanim
	jmp	circlecomend

	longa
	longi
set_blue	tyx
	a8
	lda.l	circletab+1,x
	sta	circlesrcblue
	inx
	inx
	jmp	circle_com
	longa
	longi
set_green	tyx
	a8
	lda.l	circletab+1,x
	sta	circlesrcgreen
	inx
	inx
	jmp	circle_com
	longa
	longi
set_red	tyx
	a8
	lda.l	circletab+1,x
	sta	circlesrcred
	inx
	inx
	jmp	circle_com

	longa
	longi
circle_exit	tyx
	inx
	stx	circleanim
	jmp	circlecomend

	longa
	longi
set_rad	tyx
	lda.l	circletab+1,x
	sta	circlerad
	inx
	inx
	inx
	jmp	circle_com

	longa
	longi
set_affect	tyx
	a8
	lda.l	circletab+1,x
	sta	circleaff
	inx
	inx
	jmp	circle_com

circlecomend
	a16
	lda	circlerad
	cmp	circledestrad
	beq	.donerad
	bcc	.addrad
	sec
	sbc	circlespeed
	cmp	circledestrad
	bcs	.donerad
	lda	circledestrad
	bra	.donerad
.addrad	clc
	adc	circlespeed
	cmp	circledestrad
	bcc	.donerad
	lda	circledestrad
.donerad	cmp	#0
	bne	.radok5
	lda	#1
.radok5	sta	circlerad
	sta.l	m_rotx

	lda	circlespeed
	beq	.radok
	clc
	adc	circlespeedadd
	sta	circlespeed
.radok

	a8
	lda	circleblueframe
	dec	a
	sta	circleblueframe
	bne	.blueskip
	lda	circleblueframesrc
	sta	circleblueframe
	lda	circlesrcblue
	cmp	circleblue
	beq	.blueok
	bcc	.blueadd
	sec
	sbc	circlebluespeed
	bpl	.bluepos
	lda	#0
.bluepos	cmp	circleblue
	bcs	.blueok
	lda	circlesrcblue
	bra	.blueok
.blueadd	clc
	adc	circlebluespeed
	cmp	circleblue
	bcc	.blueok
	lda	circlesrcblue
.blueok	sta	circlesrcblue
.blueskip
	lda	circlegreenframe
	dec	a
	sta	circlegreenframe
	bne	.greenskip
	lda	circlegreenframesrc
	sta	circlegreenframe
	lda	circlesrcgreen
	cmp	circlegreen
	beq	.greenok
	bcc	.greenadd
	sec
	sbc	circlegreenspeed
	bpl	.greenpos
	lda	#0
.greenpos	cmp	circlegreen
	bcs	.greenok
	lda	circlesrcgreen
	bra	.greenok
.greenadd	clc
	adc	circlegreenspeed
	cmp	circlegreen
	bcc	.greenok
	lda	circlesrcgreen
.greenok	sta	circlesrcgreen
.greenskip
	lda	circleredframe
	dec	a
	sta	circleredframe
	bne	.redskip
	lda	circleredframesrc
	sta	circleredframe
	lda	circlesrcred
	cmp	circlered
	beq	.redok
	bcc	.redadd
	sec
	sbc	circleredspeed
	bpl	.redpos
	lda	#0
.redpos	cmp	circlered
	bcs	.redok
	lda	circlesrcred
	bra	.redok
.redadd	clc
	adc	circleredspeed
	cmp	circlered
	bcc	.redok
	lda	circlesrcred
.redok	sta	circlesrcred
.redskip



	a16
	ldx	circleobj		; get the centre of the screen
	beq	.default
	lda	#0		; LEAVE THIS FOR MERGE (giles)
	jsl	rotproj_l
	lda	xs
	clc
	adc	#((32-gameNum_col)/2)*8	; centre of real screen
	sta	xs		; store it back for later use
	sta.l	m_bigx
	lda	ys
	clc
	adc	#gameStRow*8	; centre of real screen
	sta.l	m_bigy
	bra	.continue
.default	lda	#128
	sta.l	m_bigx
	sta	xs
	lda	#112
	sta.l	m_bigy
.continue

	a8
	alloc_window circle		;allocate a window
	stz	wm_coldata,x
	lda	circlesrcblue
	sta	wm_coldata_b,x
	lda	circlesrcgreen
	sta	wm_coldata_g,x
	lda	circlesrcred
	sta	wm_coldata_r,x
	lda	#%00010000
	sta	wm_cgswsel,x
	lda	circleaff
	sta	wm_cgadsub,x
	stz	wm_ts,x

	lda	#mcalc_circle>>16
	ldx	#mcalc_circle&WM
	jsl	runmario_l


copywh0wh1	a8
	phb
	lda	#$7e
	pha
	plb

	ldx	#191*2
	ldy	#191*3+3
	lda	whichcircle
	beq	.lp2
.lp	lda.l	m_circlebuf,x
	sta.w	xhdma_wh0wh1_1+2,y
	lda.l	m_circlebuf2,x
	sta.w	xhdma_wh0wh1_1+1,y
	dey
	dey
	dey
	dex
	dex
	bpl	.lp
	plb
	rts
.lp2	lda.l	m_circlebuf,x
	sta.w	xhdma_wh0wh1_2+2,y
	lda.l	m_circlebuf2,x
	sta.w	xhdma_wh0wh1_2+1,y
	dey
	dey
	dey
	dex
	dex
	bpl	.lp2
	plb
	rts




circletab
	db	0
	initcircle	fillscreen		;FILLSCREEN
	radiusto	200,4
	blueto		31,3
	greento		31,3
	redto		31,3
	setblue		14
	setgreen	14
	setred		14
	circleloop
	circleendif	radius,200
	blueto		0,1,2
	greento		0,1,2
	radiusto	500,4
	circleloop
	circleendif	blue,0
	redto		0,1,2
	circleloop
	circleendif	red,0
	circleend

	initcircle	smartbomb		;SMART BOMB
	setrad		297
	setblue		28
	setgreen	28
	setred		28
	circleexit
	setrad		0

	radiusto	9,9
	blueto		31,7
	greento		31,15
	redto		31,3
	setblue		28
	setgreen	28
	setred		28
	circleexit
	radiusto	135,9
	redto		0,1,2
	circleloop
	circleendif	radius,135
	radiusto	297,9
	blueto		0,1
	greento		0,1
	circleloop
	circleendif	green,0
	circleend

	initcircle	whitefillscreen		;WHITE FILL SCREEN
	radiusto	197,18,-1
	blueto		31,1
	greento		31,1
	redto		31,1
	setblue		14
	setgreen	14
	setred		14
	circleloop
	circleendif	radius,171
	blueto		0,1
	greento		0,1
	circleloop
	circleendif	blue,0
	radiusto	10,4
	redto		0,1
	circleloop
	circleendif	radius,0
	circleend

	initcircle	redfillscreen		;RED FILL SCREEN
	radiusto	197,18,-1
	redto		31,1
	setred		14
	circleloop
	circleendif	radius,300
	circleend

	initcircle	laststage		;FILLSCREEN
	circle_aff	2+32
	radiusto	200,4
	blueto	31,3
	greento	31,3
	redto	31,3
	setblue	14
	setgreen	14
	setred	14
	circleloop
	circleendif	radius,200
	blueto	0,1,2
	greento	0,1,2
	circleloop
	circleendif	blue,0
	redto	0,1,2
	circleloop
	circleendif	red,0
	circleend

	init_wipe	mroundwipefill
	do_wipe
.lp	init_wipe	mwipefill
	do_wipe
	circlegoto	.lp
	wipeend

	init_wipe	mscramwipe
	do_wipe
	wipeend

	init_wipe	mroundwipeclear
	do_wipe
	wipeend

	init_wipe	mstarwipe
	do_wipe
	wipeend



wipe_init	tyx
	a16
	lda.l	circletab+1,x
	sta	wintabptr
	inx
	inx
	inx
	stx	circleanim
wipe_do	a8
	inc	doawipe
	rts

	longa
	longi
wipeend_do	stz	circleanim
	a8
	dealloc_window wipe
	rts



do_window_wipe_l
	jsr	do_window_wipe
	rtl
do_window_wipe
	a8
	lda	doawipe
	bne	.do
	rts
.do
	a16
	lda	wintabptr
	sta.l	m_wintabptr
	call_mario mbumwipe
	lda.l	m_wintabptr
	sta	wintabptr

	a8
	lda	#1
	sta	doingwipe

	alloc_window wipe		;allocate a window
	lda.l	m_winwbglog
	sta	wm_wbglog,x

	a16
	lda	wintabptr
	cmp	#1
	bne	.ok
	inc	circleanim
.ok
	a8
	jmp	copywh0wh1






