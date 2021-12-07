*****************************************************************
*								*
* SGOBJ.ASM							*
*								*
* 6502 3D SHAPE KERNAL						*
*								*
* by P. R. Warnes, Copyright 1990				*
*								*
*****************************************************************


init3d2
	php
	bra	init3d1
init3d_l
	php
	ai8
;	jsr	gameclipwindow

init3d1
	lda	#$3a
	sta	rand
	lda	#$a7
	sta	rand+1
	lda	#$55
	sta	rand+2
	lda	#$7f
	sta	rand+3

;	colouri	linecolour

	stz	pauseflag
	stz	expcnt
	stz	noclipx
	stz	rotx
	stz	roty
	stz	rotz
	stz	strptr
	stz	drawopt
	stz	viewrotx
	stz	viewroty
	stz	viewrotz
	stz	demoshape
	stz	demoshape+1

	lda	#0
	sta	viewtype

;	movi	demoz,bigz

	jsl	initwmat_l

	jsl	copychars_l

	jsl	initmario3d_l

	plp
	rtl



initmario3d_l
	lda	#-1
	sta	mariocode

	jsl	minitdust_l

	lda	vanishx
	sta.l	m_vanishx
	lda	vanishy
	sta.l	m_vanishy
	lda	clx1
	sta.l	m_xleft
	lda	clx2
	sta.l	m_xright
	lda	cly1
	sta.l	m_ytop
	lda	cly2
	sta.l	m_ybot
	rtl




	shorta
	shorti


copychars_l
	php
	ai8

	ldy	#0
	ldx	#0
	lda	#8*16		; copy hex charset to mario RAM
	sta	count1
.loopy
	lda	debugchars,y
	sta.l	m_debugchars,x
	inx
	iny
	iny
	dec	count1
	bne	.loopy	

	plp
	rtl



initwmat_l		; view angles = 0
	php
	a16
	stz viewrotxw
	stz viewrotyw
	stz viewrotzw

	lda viewrotxw
	sta matxw
	lda viewrotyw
	sta matyw
	lda viewrotzw
	sta matzw
	a8

	jsl crotmat16_l

	a16
	copymat16 mat,wmat
	a8

	unitmat pmat	; wmat = unit matrix
	plp
	rtl

wmatrotp16_l
	phx	
	phy
	php

	ai16
	lda	x1
	sta.l	m_x1
	lda	y1
	sta.l	m_y1
	lda	z1
	sta.l	m_z1

	a8
	lda	#mwmatrotp16>>16
	ldx	#mwmatrotp16&$ffff
	jsl	runmario_l

	a16
	lda.l	m_bigx
	sta	bigx
	lda.l	m_bigy
	sta	bigy
	lda.l	m_bigz
	sta	bigz

	plp
	ply
	plx

	rtl


crotmat16_l
	a16
	lda	matxw
	sta.l	m_rotx
	lda	matyw
	sta.l	m_roty
	lda	matzw
	sta.l	m_rotz

	a8i16
	lda	#mcrotwmatzxy16>>16
	ldx	#mcrotwmatzxy16&$ffff
	jsl	runmario_l

	a16
	lda.l	m_wmat11
	sta	mat11w
	lda.l	m_wmat12
	sta	mat12w
	lda.l	m_wmat13
	sta	mat13w

	lda.l	m_wmat21
	sta	mat21w
	lda.l	m_wmat22
	sta	mat22w
	lda.l	m_wmat23
	sta	mat23w

	lda.l	m_wmat31
	sta	mat31w
	lda.l	m_wmat32
	sta	mat32w
	lda.l	m_wmat33
	sta	mat33w

	ai8
	rtl




	IFEQ	1

showobj_l

;	lda strptr		; if strptr<>0 then showmess
;	lbne showmess

;	lda shapenum		; get shape data ptr
;	asl a
;	tax
;	lda shapetab,x
;	sta sptr
;	lda shapetab+1,x
;	sta sptr+1



showobj0_l
;	lda	expcnt
;	beq	.ok
;	rtl
.ok



	lda	gameframe	; animate shading
	and	#15
;	sta	tshade
;	stz	tshade+1

	ldy #0			; get point data ptr
	lda (sptr),y
	sta pptr
	iny
	lda (sptr),y
	sta pptr+1
	iny


	ldy	#sh_bank		; get shape data bank number
	lda	(sptr),y
	sta.l	m_shapebank 

	lda	rotx
	sta.l	m_rotx
	lda	#0
	sta.l	m_rotx+1
	lda	roty
	sta.l	m_roty
	lda	#0
	sta.l	m_roty+1
	lda	rotz
	sta.l	m_rotz
	lda	#0
	sta.l	m_rotz+1

	lda	expcnt
	sta.l	m_expcnt
	lda	#0
	sta.l	m_expcnt+1
		
	ldy	#sh_shift
	lda	(sptr),y

;	lda	#0		; shape scale
	sta.l	m_shift
	lda	#0
	sta.l	m_shift+1




;-------------------------------------------------
; giles. 21/2/92
	lda	sflags
	and	#asf_hitflash
	beq	.no_hf
	a16
	lda	#white_c&WM
	sta.l	m_colourptr
	bra	.gotcptr
.no_hf
;-------------------------------------------------
	a16
	ldy	#sh_col_ptr
	lda	(sptr),y
	sta.l	m_colourptr
.gotcptr


	lda	depthtabptr
	sta.l	m_depthstab

	lda	bigx
	sta.l	m_bigx
	lda	bigy
	sta.l	m_bigy
	lda	bigz
	sta.l	m_bigz



	lda	animframe
	and	#127
	sta.l	m_framenum
	lda	colframe
	and	#127
	sta.l	m_colframe

	lda	pptr
	sta.l	m_pntptr
	ldy	#sh_faces
	lda	(sptr),y
	sta.l	m_faceptr

	a8i16
	lda	#mshowobj>>16
	ldx	#mshowobj&$ffff
	jsl	runmario_l
	ai8
	rtl



	ENDC








masra	macro		; asr a (but -1 goes to 0)
	cmp #255
	bne \@1
	inc a
\@1
	asra
	endm


projectlog_l
	mov	x1,px
	mov	z1,pz
	jsl	projlog_l
	mov	pr,xs

	mov	y1,px
	mov	z1,pz
	jsl	projlog_l
	mov	pr,ys
	add	vanishy,ys,ys
	sub	vanishx,ys,ys
	rtl



projlog_l
	projlogmac	px,pz,pr,vanishx
	rtl


dividend equ divdnd
divisor  equ divsor
flipflag equ sign



	IFEQ	1


************************************************************8
; 32 bit Signed divide
; 32 bit divided by 16 bit giving 32 bit result
;
; In:	dividend signed 32 bit
;	divisor  signed 16 bit
; Out:	quotient signed 32 bit
; Uses: sign, shift and dtb

divs3216
	a8

	stz	flipflag

	a16

	stz	quotient
	stz	quotient+2

	lda	dividend+2
	bpl	dpos1

	lda	#0
	sec
	sbc	dividend
	sta	dividend
	lda	#0
	sbc	dividend+2
	sta	dividend+2

	a8
	inc	flipflag
	a16
dpos1

	lda	divisor
	bpl	dpos2

	eor	#$ffff
	inc	a
	sta	divisor

	a8
	inc	flipflag
	a16
	
dpos2
	a8
	jsr	divu3216
	a16


	lda	flipflag
	and	#1
	beq	dout

	lda	#0
	sec
	sbc	quotient
	sta	quotient
	lda	#0
	sbc	quotient+2
	sta	quotient+2

dout
	a8

	rts











; 31 bit Unsigned divide
; 31 bit divided by 15 bit giving 15 bit result
;
; In:	dividend unsigned 31 bit
;	divisor  unsigned 15 bit
; Out:	quotient unsigned 15 bit
; Uses: A,X
; Cycles:	47 + 16*21 = 383 max

divmac	macro
	rol	dividend	; 7
	rol	a		; 2
	tax			; 2
	clc			; 2
	adc	divisor		; 4
	bcs	\@		; 2/3
	txa			; 2	= 21/20
\@
	endm



divu3115_l
	jsr	divu3115
	rtl


;divu3216
divu3216test
divu3115
	phx
	php
	ai16

	lda	#0
	sec
	sbc	divisor
	sta	divisor

	lda	dividend+2

	asl	dividend	; 7
	rol	a		; 2
	tax			; 2
	clc			; 2
	adc	divisor		; 4
	bcs	div1		; 2/3
	txa			; 2	= 21/20
div1

	rept	15
	divmac
	endr

	lda	dividend
	rol	a
	sta	quotient
	stz	quotient+2	

	plp
	plx
	rts	

	shorta
	shorti


; 32 bit Unsigned divide
; 32 bit divided by 16 bit giving 32 bit result
;
; In:	dividend unsigned 32 bit
;	divisor  unsigned 16 bit
; Out:	quotient unsigned 32 bit
; Uses: shift and dtb

lwa1	equ	dividend
lwa2	equ	quotient
iwa1	equ	divisor
dtb	equ	shift


;	Unsigned 32 bit by 16 bit divide LWA1 / IWA1
;	32 bit result in LWA1
;	LWA2 & IWA1 destroyed

divu3216
	ldy	#3	;byte shift count in .Y
	lda	IWA1+1	; Div by Zero ?
	ora	IWA1
	beq	D32b0z
	lda	LWA1+3	;Shift LWA1 to fill
	bne	D32b3nz	;top byte
	lda	LWA1+2
	beq	D32b2z
	sta	LWA1+3
	lda	LWA1+1
	sta	LWA1+2
	lda	LWA1
	sta	LWA1+1
	ldy	#2
	lda	#0
	sta	LWA1
	pha		;Hi byte result 0
	beq	D32b3nz	;Always
D32b2z	lda	LWA1+1
	beq	D32b1z
	sta	LWA1+3
	lda	LWA1
	sta	LWA1+2
	ldy	#1
	lda	#0
	sta	LWA1
	sta	LWA1+1
	pha		;Hi 2 bytes result 0
	pha
	beq	D32b3nz	;Always
D32b1z	lda	LWA1
	beq	D32b0z
	sta	LWA1+3
	ldy	#0
	lda	#0
	sta	LWA1
	sta	LWA1+1
	sta	LWA1+2
	pha		;Hi 3 bytes result 0
	pha
	pha
	beq	D32b3nz	;Always
D32b0z
	sta	quotient	;Return zero result
	sta	quotient+1
	sta	quotient+2
	sta	quotient+3
	rts

;	Top byte of LWA1 now full
D32b3nz
	lda	IWA1+1	;Move IWA1 to top of LWA2
	bne	D32d1nz
	lda	IWA1
	sta	LWA2+3
	lda	#0
	sta	LWA2+2
	sta	LWA2+1
	sta	LWA2
	clc		;Adjust shift count
	iny
	bpl	D32sh
	bmi	D32Done
D32d1nz
	sta	LWA2+3
	lda	IWA1
	sta	LWA2+2
	lda	#0
	sta	LWA2+1
	sta	LWA2
;	A hi byte of result 0 as dividing by 256 or more
	pha
	tya
	bmi	D32Done	;LWA1 was less than 256
D32sh
	lda	#128
	sta	DTB	;Totaling byte
D32ShiftI
	lda	LWA2+3	;Shift up to match LWA2
	bmi	D32Alined	;1 in top bit
	cmp	LWA1+3
	bcs	D32Alined
	lsr	DTB
	asl	LWA2+2
	rol	LWA2+3
	bcc	D32ShiftI	;Always
D32Alined
	sec		;Divie loop --
	lda	LWA1
	sbc	LWA2
	sta	IWA1
	lda	LWA1+1
	sbc	LWA2+1
	sta	IWA1+1
	lda	LWA1+2
	sbc	LWA2+2
	tax
	lda	LWA1+3
	sbc	LWA2+3
	bcc	D32no
	sta	LWA1+3
	stx	LWA1+2
	lda	IWA1+1
	sta	LWA1+1
	lda	IWA1
	sta	LWA1
D32no
	rol	DTB
	bcc	D32AnBit
	lda	DTB
	pha
	dey
	beq	D32Done
	lda	#1
	sta	DTB
D32AnBit
	lsr	LWA2+3
	ror	LWA2+2
	ror	LWA2+1
	ror	LWA2
	bcc	D32Alined	;Again always
D32Done
	pla
	sta	quotient
	pla
	sta	quotient+1
	pla
	sta	quotient+2
	pla
	sta	quotient+3
	rts


	ENDC


******************************************************************8







mmovwwsh	macro
	lda	\1
	ifne	15-mgridshift
	rept	15-mgridshift
	asra16
	endr
	endc
	sta	\2
	endm


mgridsize	equ	15	;15
mgrid2z		equ	512	; z dist where dots go to 2 dots
mgridshift	equ	8	; grid size
mgridwidth	equ	1<<mgridshift
mgridand	equ	mgridwidth-1
mgrcolshift	equ	1
mgrcoland	equ	(1<<mgrcolshift)-1


mshowgrid_l
	lbmi	mshowdust_l

	ai16

	lda	viewposx
	and	#mgridand
	eor	#mgridand
	sec
	sbc	#(mgridwidth*mgridsize)/2
	sta	x1

	lda	viewposz
	and	#mgridand
	eor	#mgridand
	sec
	sbc	#(mgridwidth*mgridsize)/2
	sta	z1

	lda	#0
	sec
	sbc	viewposy		
	sta	y1

	lda	viewposx
	and	#~mgridand
	ifne	mgridshift+mgrcolshift-1
	rept	mgridshift+mgrcolshift-1
	lsr	a
	endr
	endc
	a8
	sta	gridx

	a16
	lda	viewposz
	and	#~mgridand
	ifne	mgridshift+mgrcolshift-1
	rept	mgridshift+mgrcolshift-1
	lsr	a
	endr
	endc
	a8
	sta	gridz

	jsl	wmatrotp16_l	;grotcentre_l

	a16
	lda	bigx
	sta	x1
	lda	bigy
	sta	y1
	lda	bigz
	sta	z1
	a8

	a16
	mmovwwsh	wmat11w,pxx
	mmovwwsh	wmat12w,pxy
	mmovwwsh	wmat13w,pxz

	mmovwwsh	wmat21w,pyx
	mmovwwsh	wmat22w,pyy
	mmovwwsh	wmat23w,pyz

	mmovwwsh	wmat31w,pzx
	mmovwwsh	wmat32w,pzy
	mmovwwsh	wmat33w,pzz
	a8


	a16

	lda	x1
	sta.l	m_x1
	lda	y1
	sta.l	m_y1
	lda	z1
	sta.l	m_z1

	lda	pxx
	sta.l	m_pxx
	lda	pxy
	sta.l	m_pxy
	lda	pxz
	sta.l	m_pxz

	lda	pzx
	sta.l	m_pzx
	lda	pzy
	sta.l	m_pzy
	lda	pzz
	sta.l	m_pzz

	a8i16
	lda	gridx
	sta.l	m_gridx
	lda	gridz
	sta.l	m_gridz

;	lda	#mshowgrid>>16
;	ldx	#mshowgrid&$ffff
;	jsl	runmario_l
	ai8

	rtl



minitdust_l
	a8i16
	
	lda	#minitdust>>16
	ldx	#minitdust&$ffff
	jsl	runmario_l
	ai8
	rtl


mshowdust_l
	a16
	lda	dogyirq
	and	#$ff
	beq	.nnn

	lda	kcvposx
	sta.l	m_viewposx
	lda	kcvposy
	sta.l	m_viewposy
	lda	kcvposz
	sta.l	m_viewposz
	bra	.nslow
.nnn
	lda	viewposx
	sta.l	m_viewposx
	lda	viewposy
	sta.l	m_viewposy
	lda	viewposz
	sta.l	m_viewposz

	lda	slowstars
	and	#255
	beq	.nslow
	lda.l	slowstars_viewposz
	sta.l	m_viewposz
.nslow

	lda	wmat11w
	sta.l	m_wmat11
	lda	wmat12w
	sta.l	m_wmat12
	lda	wmat13w
	sta.l	m_wmat13

	lda	wmat21w
	sta.l	m_wmat21
	lda	wmat22w
	sta.l	m_wmat22
	lda	wmat23w
	sta.l	m_wmat23
	
	lda	wmat31w
	sta.l	m_wmat31
	lda	wmat32w
	sta.l	m_wmat32
	lda	wmat33w
	sta.l	m_wmat33
			
;	a8i16
;	lda	#mshowdust>>16
;	ldx	#mshowdust&$ffff
;	jsl	runmario_l
	ai8
	rtl





