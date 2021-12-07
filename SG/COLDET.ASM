	shorta
	longi


; this macro does a collision detection check
; xcol,ycol,zcol = sh_maxx-z of shape #1
; xp,ys,zp = x,y,z of shape #1
; tpx,tpy,tpz = x,y,z of shape #2
; x points to shape header or collision box structure
coldet	MACRO	; notcollidedroutine,collidedroutine,offset value for x y and z

;offsetforx	=	\3	;sh_xmax
;offsetfory	=	\4	;sh_ymax
;offsetforz	=	\5	;sh_zmax


	lda.w	\5,x
	clc
	adc	zcol
	sta	rangexz
	lda	tpz	; alien's z
	sec
	sbc	zp
	bpl	.chkcoll5\@
	eor	#WM
	inc	a
.chkcoll5\@
	sec
	sbc	rangexz
	bmi	.chkcoll6\@
	jmp	\1
.chkcoll6\@
	lda.w	\3,x
	clc
	adc	xcol
	sta	rangexz
	lda	tpx		; alien's x
	sec
	sbc	xp
	bpl	.chkcoll2\@
	eor	#WM
	inc	a
.chkcoll2\@
	sec
	sbc	rangexz
	bmi	.chkcoll3\@
	jmp	\1
.chkcoll3\@

	lda.w	\4,x
	clc
	adc	ycol
	sta	rangexz
	lda	tpy	; alien's y + height
	sec
	sbc	ys
	bpl	.chkcoll51\@
	eor	#WM
	inc	a
.chkcoll51\@
	sec
	sbc	rangexz
	bmi	\2
	jmp	\1
	ENDM


scale_a	MACRO
	sta	x1
	lda	scale
	and	#cbf_scale
	beq	.noscale\@
	sty	scalecnt
	tay
;	sta	scalecnt
	lda	x1
.keepscaling\@
	asl	a
	dey
;	dec	scalecnt
	bne	.keepscaling\@
	ldy	scalecnt
	bra	.scaled\@
.noscale\@
	lda	x1
.scaled\@

;	sta	x1
;	lda	scale
;	and	#cbf_scale
;	beq	.ns\@
;
;	stx	scalecnt
;	asl	a
;	tax
;	lda	x1
;	jmp	(.tab\@,x)
;.tab\@	dw	.s0\@
;	dw	.s1\@
;	dw	.s2\@
;	dw	.s3\@
;	dw	.s4\@
;	dw	.s5\@
;	dw	.s6\@
;	dw	.s7\@
;.s0\@	ldx	scalecnt
;	bra	.sd\@
;.s1	asl	a
;	ldx	scalecnt
;	bra	.sd\@
;.s2	asl	a
;	asl	a
;	ldx	scalecnt
;	bra	.sd\@
;.s3	asl	a
;	asl	a
;	asl	a
;	ldx	scalecnt
;	bra	.sd\@
;.s4	asl	a
;	asl	a
;	asl	a
;	asl	a
;	ldx	scalecnt
;	bra	.sd\@
;
;.s5	asl	a
;	asl	a
;	asl	a
;	asl	a
;	asl	a
;	ldx	scalecnt
;	bra	.sd\@
;.s6	asl	a
;	asl	a
;	asl	a
;	asl	a
;	asl	a
;	asl	a
;	ldx	scalecnt
;	bra	.sd\@
;.s7	asl	a
;	asl	a
;	asl	a
;	asl	a
;	asl	a
;	asl	a
;	asl	a
;	ldx	scalecnt
;	bra	.sd\@
;
;.ns\@	lda	x1
;.sd\@
	ENDM



; tmpx,xp,ys,zp,x1,y1,z1,collradius

chkcoll_l
	jsr	chkcoll
	rtl


init_strats_ram_l
	phb
	php

	a8i16

	IFEQ	0
	ldx	allst
.ccf	s_jmp_alsflag	x,collide,.ncci
;	lda	al_sflags,x
;;	bit	#asf_colldisable
;;	bne	.nclc
;	bit	#asf_collide
;	bne	.ncci
	s_set_alvar		B,x,al_collcount,#1
	bra	.nclc
.ncci	s_set_alsflag		x,Lcollide
.nclc	s_clr_alsflag		x,collide
	s_set_alvar		W,x,al_collobjptr,#0
.nc	txy
	ldx	_next,y
	bne	.ccf

	ENDC

	a8
	lda	#$7e
	pha
	plb		; set data bank register

;----------------------------------------------------
	lda	collistcnt
	beq	.mmiss

	ldx	#0
.dc
	phx
	jsr	chkcoll
	plx

	a16
	txa
	clc
	adc	#cl_sizeof
	tax
	a8

	dec	collistcnt
	bne	.dc
.mmiss

	plp
	plb
	rtl


	shorta
	longi


chkcoll
	stx	tmpy

	ldy	cl_alien&WM,x
	tyx
	stx	tmpx

	test_alsflag	x,collide
	lbne	.finish

	ldy	al_shape,x
	sty	currshape
	ldy	tmpy

	stz	flagset
	stz	scale+1

	a16

.usexyz	lda.w	cl_colbox&WM,y
	lbeq	.normcol		; normal collision detection?
.andagain	tay			; y is now box list pointer
	a8
	stz	temphitflag
	lda.w	cb_frame,y
	beq	.noanim		; check for animated box
	dec	a
	sta	x1
	lda.l	alx_animframe,x
	bpl	.normanim
	and	x1
	beq	.firstframe
	bra	.intoanim
.normanim	lda	x1
	and	gameframe
	beq	.firstframe
.intoanim	a16
	and	#127
	sta	x1
	tya			; y->a
	ldy	x1		; a->y
	clc
.add
	adc	#cb_sizeof		; crappy and slow..
	dey
	bne	.add
	tay
	a8
	
.firstframe
.noanim
	lda.w	cb_rotz,y
	sta	scale
	bit	#cbf_rotz!cbf_roty!cbf_rotx
	lbeq	.normrot
	bit	#cbf_rotz
	lbne	.rotz
	bit	#cbf_roty
	lbne	.roty
	bit	#cbf_rotx
	lbne	.rotx
.rotxyz
; full rotation... zxy
; first, z rotation...
	lda.w	cb_xoff,y
	sta	x1
	sta	x2

	lda.w	cb_yoff,y
	sta	y1
	sta	y2

	lda	al_rotz,x
	beq	.missrotz2
	jsr	rotate_8yx_ram
.missrotz2
; next, x rotation...
	lda	y2
	sta	y1	; get y from previous rotate

	lda.w	cb_zoff,y
	sta	z1
	sta	z2

	lda	al_rotx,x
	beq	.missrotx2
	jsr	rotate_8yz_ram
.missrotx2
; next y rotation...
	lda	x2
	sta	x1	; values from previous rotates

	lda	y2
	sta	y1

	lda	al_roty,x
	beq	.missroty2
	jsr	rotate_8xz_ram
.missroty2
; now to scale and add to offsets...
	a16
	lda	x2
	sexa
	SCALE_A
	clc
	adc	al_worldx,x
	sta	xp		; x scaled and stored

	lda	z2
	sexa
	SCALE_A
	clc
	adc	al_worldz,x
	sta	zp		; z scaled and stored

	lda	y2
	sexa
	SCALE_A
	clc
	adc	al_worldy,x
	sta	ys
; finished (phew!)
	jmp	.normnon


; SINGLE AXIS ROTATION ---------------------------------------------------

.rotx	lda.w	cb_yoff,y		; y offset
	sta	y1
	sta	y2
	lda.w	cb_zoff,y		; z offset
	sta	z1
	sta	z2

	lda	al_rotx,x
	beq	.missrotx
	jsr	rotate_8yz_ram	; rotate it
.missrotx	a16
	lda	y2		; get result y
	sexa
	SCALE_A			; scale it
	clc
	adc	al_worldy,x
	sta	ys		; store the y position
	lda	z2
	sexa
	SCALE_A			; scale it
	clc
	adc	al_worldz,x
	sta	zp		; store the z position
	lda.w	cb_xoff,y		; add the collision box offsets
	clc
	adc	al_worldx,x
	sta	xp
	jmp	.normnon

	shorta

.roty	lda.w	cb_xoff,y		; x offset
	sta	x1
	sta	x2
	lda.w	cb_zoff,y		; y offset
	sta	z1
	sta	z2

	lda	al_roty,x
	beq	.missroty
	jsr	rotate_8xz_ram	; rotate it
.missroty	a16
	lda	x2		; get result x
	sexa
	SCALE_A
	clc
	adc	al_worldx,x
	sta	xp		; store the x position
	lda	z2
	sexa
	SCALE_A
	clc
	adc	al_worldz,x
	sta	zp		; store the z position
	lda.w	cb_yoff,y
	clc
	adc	al_worldy,x
	sta	ys
	jmp	.normnon

	shorta
.rotz	lda.w	cb_xoff,y		; x offset
	sta	x1
	sta	x2
	lda.w	cb_yoff,y		; y offset
	sta	y1
	sta	y2

	lda	al_rotz,x
	beq	.missrotz
	jsr	rotate_8yx_ram	; rotate it
.missrotz	a16
	lda	x2		; get result x
	sexa
	SCALE_A
	clc
	adc	al_worldx,x
	sta	xp		; store the x position
	lda	y2
	sexa
	SCALE_A
	clc
	adc	al_worldy,x
	sta	ys		; store the y position
	lda.w	cb_zoff,y
	clc
	adc	al_worldz,x
	sta	zp
	bra	.normnon


.normrot
	a16
	lda.w	cb_xoff,y		; add the collision box offsets
	clc
	adc	al_worldx,x
	sta	xp
	lda.w	cb_yoff,y
	clc
	adc	al_worldy,x
	sta	ys
	lda.w	cb_zoff,y
	clc
	adc	al_worldz,x
	sta	zp
.normnon

	lda.w	cb_xmax,y
	sta	xcol
	lda.w	cb_ymax,y
	sta	ycol
	lda.w	cb_zmax,y
	sta	zcol
	phx
	phy
	a8
	lda.w	cb_flagset,y
	sta	flagset
	a16
	jsr	.forcein
	ply
	plx
;	lda	temphitflag
;	bne	.finish
	a16
	lda.w	cb_next,y
	lbne	.andagain

.finish	a8
	rts

	longa	
.normcol
	lda.w	cl_xmax&WM,y
	sta	xcol
	lda.w	cl_ymax&WM,y
	sta	ycol
	lda.w	cl_zmax&WM,y
	sta	zcol
.userad	lda	al_worldx,x
	sta	xp
	lda	al_worldz,x
	sta	zp
	lda	al_worldy,x
	sta	ys
.forcein
	lda	collistcnt
	sta	collistcnt2
	ldy	tmpy
	sty	tmpcl
	jmp	chkcollnxt

chkcoll0
	a8
	sty	tmpcl
	ldx	cl_alien&WM,y

	stz	temphitflag2		; clear the hit flags

	a16

	ldy	tmpx	; x = alien1, y = alien2

	test_alsflag	y,collide
	lbne	chkcollnxt

	lda.w	al_collflags,y
	and	al_collflags,x
	and	#acf_colltype1!acf_colltype2!acf_colltype3!acf_colltype4!acf_colltype5
	lbne	chkcollnxt

	tya
	cmp	al_immuneptr,x
	lbeq	chkcollnxt
	txa
	tyx
	cmp	al_immuneptr,x
	lbeq	chkcollnxt

	txy
	tax

	lda	al_worldx,x
	sta	tpx
	lda	al_worldy,x
	sta	tpy
	lda	al_worldz,x
	sta	tpz		; store x,y, and z from the alien

	test_alsflag	x,sameshapecollide
	beq		.chkitnow
	test_alsflag	y,sameshapecollide
	beq		.chkitnow
.nochkitnow
	lda		al_shape,x
	txy
	bra		.nochk
.chkitnow
	lda	al_shape,x
	txy

	cmp	currshape		; same shape?
	lbeq	chkcollnxt
.nochk
	ldx	tmpcl
	lda.w	cl_colbox&WM,x	; collision box list
	lbeq	normalcol		; nope, normal collisions
; now for the collision box stuff
	pha
	lda	tpx
	sta	objx
	lda	tpy
	sta	objy
	lda	tpz
	sta	objz		; copy alien #2's x,y centre
	COLDET	.chkcollnxt,.nxtbox,cl_xmax&WM,cl_ymax&WM,cl_zmax&WM
.chkcollnxt	pla
	jmp	chkcollnxt
.nxtbox	pla
	tax

nxtbox
	a8
	lda.w	cb_frame,x
	beq	.noanim		; check for animated box
	dec	a
	sta	x1
	phx
	tyx
	lda.l	alx_animframe,x
	bpl	.normanim
	plx
	and	x1
	beq	.firstframe
	bra	.intoanim
.normanim	plx
	lda	x1
	and	gameframe
	beq	.firstframe
.intoanim	a16
	and	#127
	sta	x1
	txa			; x->a
	ldx	x1		; a->x
	clc
.add	adc	#cb_sizeof		; crappy and slow..
	dex
	bne	.add
	tax
	a8
	
.firstframe
.noanim
	lda.w	cb_rotz,x
	sta	scale
	and	#cbf_rotz!cbf_rotx!cbf_roty
	lbeq	.normrot		; rotated box?
	bit	#cbf_rotz
	lbne	.rotz
	bit	#cbf_roty
	lbne	.roty
	bit	#cbf_rotx
	lbne	.rotx

.rotxyz
; full rotation... zxy
; first, z rotation...
	lda.w	cb_xoff,x
	sta	x1
	sta	x2

	lda.w	cb_yoff,x
	sta	y1
	sta	y2

	lda.w	al_rotz,y
	beq	.missrotz2
	jsr	rotate_8yx_ram
.missrotz2
; next, x rotation
	lda	y2
	sta	y1	; get previous rotated value

	lda.w	cb_zoff,x
	sta	z1
	sta	z2

	lda.w	al_rotx,y
	beq	.missrotx2
	jsr	rotate_8yz_ram
.missrotx2
; next, y rotation...
	lda	x2
	sta	x1

	lda	y2
	sta	y1	; values from previous rotate

	lda.w	al_roty,y
	beq	.missroty2
	jsr	rotate_8xz_ram
.missroty2
; now to scale and add to offsets
	a16
	lda	y2
	sexa
	SCALE_A
	clc
	adc	objy
	sta	tpy	; y scaled and stored

	lda	z2
	sexa
	SCALE_A
	clc
	adc	objz
	sta	tpz	; z scaled and stored

	lda	x2
	sexa
	SCALE_A
	clc
	adc	objx
	sta	tpx	; x scaled and stored

	brl	.normnon



	shorta
.rotx
	lda.w	cb_yoff,x
	sta	y1
	sta	y2
	lda.w	cb_zoff,x
	sta	z1
	sta	z2

	lda.w	al_rotx,y
	beq	.missrotx
	jsr	rotate_8yz_ram
.missrotx	a16
	lda	y2
	sexa
	SCALE_A
	clc
	adc	objy
	sta	tpy
	lda	z2
	sexa
	SCALE_A
	clc
	adc	objz
	sta	tpz
	lda	objx
	clc
	adc.w	cb_xoff,x
	sta	tpx
	jmp	.normnon

	shorta
.roty
	lda.w	cb_xoff,x
	sta	x1
	sta	x2
	lda.w	cb_zoff,x
	sta	z1
	sta	z2

	lda.w	al_roty,y
	beq	.missroty
	jsr	rotate_8xz_ram
.missroty	a16
	lda	x2
	sexa
	SCALE_A
	clc
	adc	objx
	sta	tpx
	lda	z2
	sexa
	SCALE_A
	clc
	adc	objz
	sta	tpz
	lda	objy
	clc
	adc.w	cb_yoff,x
	sta	tpy
	brl	.normnon

	shorta
.rotz
	lda.w	cb_xoff,x
	sta	x1
	sta	x2
	lda.w	cb_yoff,x
	sta	y1
	sta	y2

	lda.w	al_rotz,y
	beq	.missrotz
	jsr	rotate_8yx_ram
.missrotz	a16
	lda	x2
	sexa
	SCALE_A
	clc
	adc	objx
	sta	tpx
	lda	y2
	sexa
	SCALE_A
	clc
	adc	objy
	sta	tpy
	lda	objz
	clc
	adc.w	cb_zoff,x
	sta	tpz
	bra	.normnon

.normrot	a16
	lda	objx
	clc
	adc.w	cb_xoff,x
	sta	tpx
	lda	objy
	clc
	adc.w	cb_yoff,x
	sta	tpy
	lda	objz
	clc
	adc.w	cb_zoff,x
	sta	tpz
.normnon

	COLDET	chknxtbox,boxhit,cb_xmax,cb_ymax,cb_zmax

boxhit	a8

	lda.w	cb_flagset,x
	ora	temphitflag2
	sta	temphitflag2	; set flags for object checking against

	a16

chknxtbox	lda.w	cb_next,x
	tax
	lbne	nxtbox

	a8
	lda	temphitflag2
	beq	.nohit
	phx
	ldx	tmpx
	s_set_alsflag	x,collide
	s_set_alvartobeobj	x,al_collobjptr,y
	s_set_alsflag	y,collide
	s_set_alvartobeobj	y,al_collobjptr,x

	lda.w	al_hitflags,y
	ora	temphitflag2
	sta.w	al_hitflags,y
	lda	al_hitflags,x
	ora	flagset
	sta	al_hitflags,x

	plx
	jmp	endccoll
.nohit
	jmp	chkcollnxt

	longa
normalcol
	COLDET	chkcollnxt,chkcoll61,cl_xmax&WM,cl_ymax&WM,cl_zmax&WM

chkcoll61
	phx

	ldx	tmpx

	a8

	s_set_alsflag	x,collide
	s_set_alvartobeobj	x,al_collobjptr,y
	s_set_alsflag	y,collide
	s_set_alvartobeobj	y,al_collobjptr,x

	lda	al_hitflags,x
	ora	flagset
	sta	al_hitflags,x
.out
	plx
	jmp	endccoll
chkcollnxt
	a16
	lda	tmpcl
	clc
	adc	#cl_sizeof&WM
	tay

	dec	collistcnt2
	beq	chkcoll1
	jmp	chkcoll0
chkcoll1
endccoll
	a8
	rts



;*****************************************************************************
;* rotate_8xz
;*
;*
;* entry:		a8i16
;*	A  : Y angle
;*	x1 : x vector 8bit
;*	z1 : z vector 8bit
;*
;*
;* exit:		a8i16
;*
;*	x2 : rotated x vector 16bit
;*	z2 : rotated z vector 16bit
;*
;*
	
	SHORTA
	LONGI
rotate_8xz_ram
	phy
	phx
	php

	i8

	nega
	tax
	lda.l	ramcostab,x
	sta	cy
	lda.l	ramsintab,x
	sta	sy

	mulslogmacram x1,cy
	stx	x2
	mulslogmacram z1,sy
	txa
	clc
	adc	x2
	sta	x2
	sexam	x2+1

	mulslogmacram x1,sy
	txa
	nega
	sta	z2
	mulslogmacram z1,cy
	txa
	clc
	adc	z2
	sta	z2
	sexam	z2+1

	plp
	plx
	ply


	rts

;*****************************************************************************
;* rotate_8yz
;*
;*
;* entry:		a8i16
;*	A  : X angle
;*	y1 : y vector 8bit
;*	z1 : z vector 8bit
;*
;*
;* exit:		a8i16
;*
;*	y2 : rotated y vector 16bit
;*	z2 : rotated z vector 16bit
;*
;*
	
	SHORTA
	LONGI
rotate_8yz_ram
	phx
	phy
	php

	i8

	tax
	lda.l	ramcostab,x
	sta	cy
	lda.l	ramsintab,x
	sta	sy

	mulslogmacram y1,cy
	stx	y2
	mulslogmacram z1,sy
	txa
	clc
	adc	y2
	sta	y2
	sexam	y2+1

	mulslogmacram y1,sy
	txa
	nega
	sta	z2
	mulslogmacram z1,cy
	txa
	clc
	adc	z2
	sta	z2
	sexam	z2+1

	plp
	ply
	plx


	rts


;*****************************************************************************
;* rotate_8yx
;*
;*
;* entry:		a8i16
;*	A  : Y angle
;*	x1 : x vector 8bit
;*	z1 : z vector 8bit
;*
;*
;* exit:		a8i16
;*
;*	x2 : rotated x vector 16bit
;*	z2 : rotated z vector 16bit
;*
;*
	
	SHORTA
	LONGI
rotate_8yx_ram
	phy
	phx
	php

	i8

	tax
	lda.l	ramcostab,x
	sta	cy
	lda.l	ramsintab,x
	sta	sy

	mulslogmacram x1,cy
	stx	x2
	mulslogmacram y1,sy
	txa
	clc
	adc	x2
	sta	x2
	sexam	x2+1

	mulslogmacram x1,sy
	txa
	nega
	sta	y2
	mulslogmacram y1,cy
	txa
	clc
	adc	y2
	sta	y2
	sexam	y2+1

	plp
	plx
	ply


	rts




ramsintab
	DB	0
	DB	3
	DB	6
	DB	9
	DB	12
	DB	15
	DB	18
	DB	21
	DB	24
	DB	27
	DB	30
	DB	33
	DB	36
	DB	39
	DB	42
	DB	45
	DB	48
	DB	51
	DB	54
	DB	57
	DB	59
	DB	62
	DB	65
	DB	67
	DB	70
	DB	73
	DB	75
	DB	78
	DB	80
	DB	82
	DB	85
	DB	87
	DB	89
	DB	91
	DB	94
	DB	96
	DB	98
	DB	100
	DB	102
	DB	103
	DB	105
	DB	107
	DB	108
	DB	110
	DB	112
	DB	113
	DB	114
	DB	116
	DB	117
	DB	118
	DB	119
	DB	120
	DB	121
	DB	122
	DB	123
	DB	123
	DB	124
	DB	125
	DB	125
	DB	126
	DB	126
	DB	126
	DB	126
	DB	126

ramcostab
	DB	127
	DB	126
	DB	126
	DB	126
	DB	126
	DB	126
	DB	125
	DB	125
	DB	124
	DB	123
	DB	123
	DB	122
	DB	121
	DB	120
	DB	119
	DB	118
	DB	117
	DB	116
	DB	114
	DB	113
	DB	112
	DB	110
	DB	108
	DB	107
	DB	105
	DB	103
	DB	102
	DB	100
	DB	98
	DB	96
	DB	94
	DB	91
	DB	89
	DB	87
	DB	85
	DB	82
	DB	80
	DB	78
	DB	75
	DB	73
	DB	70
	DB	67
	DB	65
	DB	62
	DB	59
	DB	57
	DB	54
	DB	51
	DB	48
	DB	45
	DB	42
	DB	39
	DB	36
	DB	33
	DB	30
	DB	27
	DB	24
	DB	21
	DB	18
	DB	15
	DB	12
	DB	9
	DB	6
	DB	3
	DB	0
	DB	-3
	DB	-6
	DB	-9
	DB	-12
	DB	-15
	DB	-18
	DB	-21
	DB	-24
	DB	-27
	DB	-30
	DB	-33
	DB	-36
	DB	-39
	DB	-42
	DB	-45
	DB	-48
	DB	-51
	DB	-54
	DB	-57
	DB	-59
	DB	-62
	DB	-65
	DB	-67
	DB	-70
	DB	-73
	DB	-75
	DB	-78
	DB	-80
	DB	-82
	DB	-85
	DB	-87
	DB	-89
	DB	-91
	DB	-94
	DB	-96
	DB	-98
	DB	-100
	DB	-102
	DB	-103
	DB	-105
	DB	-107
	DB	-108
	DB	-110
	DB	-112
	DB	-113
	DB	-114
	DB	-116
	DB	-117
	DB	-118
	DB	-119
	DB	-120
	DB	-121
	DB	-122
	DB	-123
	DB	-123
	DB	-124
	DB	-125
	DB	-125
	DB	-126
	DB	-126
	DB	-126
	DB	-126
	DB	-126
	DB	-127
	DB	-126
	DB	-126
	DB	-126
	DB	-126
	DB	-126
	DB	-125
	DB	-125
	DB	-124
	DB	-123
	DB	-123
	DB	-122
	DB	-121
	DB	-120
	DB	-119
	DB	-118
	DB	-117
	DB	-116
	DB	-114
	DB	-113
	DB	-112
	DB	-110
	DB	-108
	DB	-107
	DB	-105
	DB	-103
	DB	-102
	DB	-100
	DB	-98
	DB	-96
	DB	-94
	DB	-91
	DB	-89
	DB	-87
	DB	-85
	DB	-82
	DB	-80
	DB	-78
	DB	-75
	DB	-73
	DB	-70
	DB	-67
	DB	-65
	DB	-62
	DB	-59
	DB	-57
	DB	-54
	DB	-51
	DB	-48
	DB	-45
	DB	-42
	DB	-39
	DB	-36
	DB	-33
	DB	-30
	DB	-27
	DB	-24
	DB	-21
	DB	-18
	DB	-15
	DB	-12
	DB	-9
	DB	-6
	DB	-3
	DB	0
	DB	3
	DB	6
	DB	9
	DB	12
	DB	15
	DB	18
	DB	21
	DB	24
	DB	27
	DB	30
	DB	33
	DB	36
	DB	39
	DB	42
	DB	45
	DB	48
	DB	51
	DB	54
	DB	57
	DB	59
	DB	62
	DB	65
	DB	67
	DB	70
	DB	73
	DB	75
	DB	78
	DB	80
	DB	82
	DB	85
	DB	87
	DB	89
	DB	91
	DB	94
	DB	96
	DB	98
	DB	100
	DB	102
	DB	103
	DB	105
	DB	107
	DB	108
	DB	110
	DB	112
	DB	113
	DB	114
	DB	116
	DB	117
	DB	118
	DB	119
	DB	120
	DB	121
	DB	122
	DB	123
	DB	123
	DB	124
	DB	125
	DB	125
	DB	126
	DB	126
	DB	126
	DB	126
	DB	126

	incfile	colboxes.asm
