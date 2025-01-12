
	incpublics	EXT\stratrou.ext

wchrlen		equ	15*32


	shorta
	longi
;demove dead alien from alien list
Removedeadal_l
	jsr	removedeadal
	rtl
Removedeadal 
	phx
	phy
	php

	
	jsl	divorcefamily_l

	a16
	l_rem	allst,alfreelst	;unlink al_block

	plp
	ply
	plx
	rts

	
generate_collist_l
	php
	ai16

	stz	collistcnt
	ldx	allst
	beq	.ret

	ldy	#0
.nextone
	phx

	test_alcollflags	x,acf_firstframe
	bne	.isff

	test_alsflag	x,colldisable
	bne	.isff
	lda	al_hp,x
	and	#255
	beq	.isff
	lda	al_flags,x
	bit	#afexp
	bne	.isff

	phx

	lda	al_shape,x
	tyx
	tay

	pla
	sta.l	cl_alien,x

	lda.w	sh_radius,y
	sta.l	cl_colbox,x

	lda.w	sh_xmax,y
	sta.l	cl_xmax,x

	lda.w	sh_ymax,y
	sta.l	cl_ymax,x

	lda.w	sh_zmax,y
	sta.l	cl_zmax,x

	inc	collistcnt

	txa
	clc
	adc	#cl_sizeof
	tay
.isff
	plx
	lda	_next,x
	tax
	bne	.nextone

.ret
	plp
	rtl


;----------------------------------------------------------------

;*****************************************************************************


;Calc X Z velocity vectors ------------------------
	shorta
	longi
alvelvecs_l
	lda	al_vel,x
velvecs_l
	sta	tmpz
	phb
	stx	tmpx
	sty	tmpy
	stz	y1
	stz	y1+1
	lda	al_roty,x
	tax

	i8

	IFNE	FASTROM
	lda	#$80
	pha
	plb
	ELSEIF
	lda	#0
	pha
	plb
	ENDC

	lda	sintab,x
	sta	siny
	lda	costab,x
	sta	cosy
	mulslogmac	tmpz,siny
	ldx	#0
	sta	x1
	cmp	#0
	bpl	velvec1
	dex
velvec1
	stx	x1+1
	mulslogmac	tmpz,cosy
	ldx	#0
	sta	z1
	cmp	#0
	bpl	velvec2
	dex
velvec2
	stx	z1+1
	i16
	ldx	tmpx
	ldy	tmpy
	plb
	rtl

;*****************************************************************************

	shorta
	longi	

		
nalvelvecs_l
	lda	al_vel,x
	sta	tmpz
nvelvecs_l
	lda	al_roty,x

nvecs_l
	stx	tmpx
	sty	tmpy
	stz	y1
	stz	y1+1

	nega
	tax

	i8
	phb
	IFNE	FASTROM
	lda	#$80
	pha
	plb
	ELSEIF
	lda	#0
	pha
	plb
	ENDC

	inx
	iny
	lda	sintab,x
	sta	siny
	lda	costab,x
	sta	cosy
	mulslogmac	tmpz,siny
	ldx	#0
	sta	x1
	cmp	#0
	bpl	nvelvec1
	dex
nvelvec1
	stx	x1+1
	mulslogmac	tmpz,cosy
	ldx	#0
	sta	z1
	cmp	#0
	bpl	nvelvec2
	dex
nvelvec2
	stx	z1+1
	i16
	ldx	tmpx
	ldy	tmpy
	plb
	rtl




;*****************************************************************************



;Calc X Y Z velocity vectors ------------------------
	shorta
	longi
alvel3vecs_l
	lda	al_vel,x
vel3vecs_l
	sta	tmpz
	stz	x1+1
	stz	y1+1
	stz	z1+1
	stx	tmpx
	sty	tmpy
	lda	al_roty,x
	tay
	lda	al_rotx,x
	nega
	tax

	i8
	phb
	IFNE	FASTROM
	lda	#$80
	pha
	plb
	ELSEIF
	lda	#0
	pha
	plb
	ENDC

	lda	sintab,y
	sta	siny
	lda	costab,y
	sta	cosy
	lda	sintab,x
	sta	sinx
	lda	costab,x
	sta	cosx
	mulslogmac	tmpz,siny
	sta	x1
	mulslogmac	x1,cosx
	sta	x1
	cmp	#0
	bpl	.x1pos
	dec	x1+1
.x1pos

	mulslogmac	tmpz,cosy
	sta	z1
	mulslogmac	z1,cosx
	sta	z1
	cmp	#0
	bpl	.z1pos
	dec	z1+1
.z1pos
	mulslogmac	tmpz,sinx
	sta	y1
	cmp	#0
	bpl	.y1pos
	dec	y1+1
.y1pos
	i16
	ldx	tmpx
	ldy	tmpy
	plb
	rtl

;*****************************************************************************

	shorta
	longi
nalvel3vecs_l
	lda	al_vel,x
nvel3vecs_l
	sta	tmpz
	lda	al_roty,x
	sta	troty
	lda	al_rotx,x
	sta	trotx
n3dvecs_l
 
	stz	x1+1
	stz	y1+1
	stz	z1+1
	stx	tmpx
	sty	tmpy
	
	phb
	IFNE	FASTROM
	lda	#$80
	pha
	plb
	ELSEIF
	lda	#0
	pha
	plb
	ENDC
	
	lda	troty
	nega
	tay

	lda	trotx
	tax

	i8

	lda	sintab,y
	sta	siny
	lda	costab,y
	sta	cosy
	lda	sintab,x
	sta	sinx
	lda	costab,x
	sta	cosx
	mulslogmac	tmpz,siny
	sta	x1
	mulslogmac	x1,cosx
	sta	x1
	cmp	#0
	bpl	.x1pos
	dec	x1+1
.x1pos

	mulslogmac	tmpz,cosy
	sta	z1
	mulslogmac	z1,cosx
	sta	z1
	cmp	#0
	bpl	.z1pos
	dec	z1+1
.z1pos
	mulslogmac	tmpz,sinx
	sta	y1
	cmp	#0
	bpl	.y1pos
	dec	y1+1
.y1pos
	i16
	ldx	tmpx
	ldy	tmpy
	plb
	rtl



;*****************************************************************************

;-------------------------------------
;Calc sideways vectors
	shorta
	longi	
sidevecs_l
	sta	tmpz
	stx	tmpx
	sty	tmpy
	stz	y1
	stz	y1+1
	sec	
	lda	#64
	sbc	al_roty,x
	tax

	i8
	phb
	IFNE	FASTROM
	lda	#$80
	pha
	plb
	ELSEIF
	lda	#0
	pha
	plb
	ENDC

	inx
	lda	sintab,x
	sta	siny
	lda	costab,x
	sta	cosy
	mulslogmac	tmpz,siny
	ldx	#0
	sta	x1
	cmp	#0
	bpl	sidevec1
	dex
sidevec1
	stx	x1+1
	mulslogmac	tmpz,cosy
	ldx	#0
	sta	z1
	cmp	#0
	bpl	sidevec2
	dex
sidevec2
	stx	z1+1
	i16
	ldx	tmpx
	ldy	tmpy
	plb
	rtl

;-------------------------------------
;Calc front vectors
	shorta
	longi	
frontvecs_l
	sta	tmpz
	stx	tmpx
	sty	tmpy
	stz	y1
	stz	y1+1
	lda	al_roty,x
	tax

	i8

	phb
	IFNE	FASTROM
	lda	#$80
	pha
	plb
	ELSEIF
	lda	#0
	pha
	plb
	ENDC

	inx
	lda	sintab,x
	sta	siny
	lda	costab,x
	sta	cosy
	mulslogmac	tmpz,siny
	ldx	#0
	sta	x1
	cmp	#0
	bpl	fvec1
	dex
fvec1
	stx	x1+1
	mulslogmac	tmpz,cosy
	ldx	#0
	sta	z1
	cmp	#0
	bpl	fvec2
	dex
fvec2
	stx	z1+1
	i16
	ldx	tmpx
	ldy	tmpy
	plb
	rtl




;*****************************************************************************


;----------------------------
	shorta
	longi
addvecs4_l
	a16
	asl	x1
	asl	y1
	asl	z1
	asl	x1
	asl	y1
	asl	z1
	bra	addvecs0_l
addvecs2_l
	a16
	asl	x1
	asl	y1
	asl	z1

addvecs_l
	a16
addvecs0_l
	lda	al_worldx,x
	clc
	adc	x1
	sta	al_worldx,x

	lda	al_worldy,x
	clc
	adc	y1
	sta	al_worldy,x

	lda	al_worldz,x
	clc
	adc	z1
	sta	al_worldz,x
	a8
	rtl

;*****************************************************************************
addalvecs_l
	a16
	lda	al_worldx,x
	clc
	adc	al_vx,x
	sta	al_worldx,x

	lda	al_worldy,x
	clc
	adc	al_vy,x
	sta	al_worldy,x

	lda	al_worldz,x
	clc
	adc	al_vz,x
	sta	al_worldz,x
	a8
	rtl


;*****************************************************************************
;* find_object
;*
;*
;* entry:		ai16
;* 	A    : shape number.
;*	fobj   : first object.
;*
;* exit:		ai16
;*	X : not changed.
;*	Y : ptr. to object. (0=not found)
;*	fobj   : ptr to object.
;*


	LONGA
	LONGI
find_object_l
findtarget_l
	stx	tpx
	ldx	fobj
	beq	bad_fobj

	cmp	#0
	beq	get_anyobj


	txy
.loop	cmp	al_shape,x
	beq	.gotone
.next	ldy	_next,x
	tyx
	bne	.loop
.gotone	cpx	tpx
	beq	.next
	ldy	_next,x
	sty	fobj
	txy
	ldx	tpx
	rtl	

bad_fobj	ldy	#0
	sty	fobj
	ldx	tpx
	rtl


get_anyobj
	ldy	_next,x
	beq	bad_fobj
	tyx
	cpx	tpx
	beq	get_anyobj

	lda_sflags	x,realobj
	and	#asf_realobj
	beq	get_anyobj

	stx	fobj
	ldx	tpx
	rtl


;*****************************************************************************
;* find_Mobject
;*
;*
;* entry:		ai16
;* 	A    : shape number.
;*	X1   : SFLAGS mask
;*	fobj   : first object.
;*
;* exit:		ai16
;*	X : not changed.
;*	Y : ptr. to object. (0=not found)
;*	fobj   : ptr to object.
;*


	LONGA
	LONGI
find_Mobject_l
	cmp	#0
	beq	get_anyMobj

	stx	tpx
	ldx	fobj
	lbeq	bad_fobj
	txy
.loop	cmp	al_shape,x
	beq	.gotone
.next	ldy	_next,x
	tyx
	bne	.loop

.gotone	
	cpx	tpx
	beq	.next
	sta	tpa
	a8
	lda	al_sflags,x
	and	x1
	a16
	bne	.got_mobj
	lda	tpa
	bra	.next
.got_mobj	
	ldy	_next,x
	sty	fobj

	txy
	ldx	tpx
	rtl	


get_anyMobj		   	
	stx	tpx
	ldx	fobj
	lbeq	bad_fobj
	txy
	a8
.loop	
	cpx	tpx
	beq	.next
	lda	al_sflags,x
	and	x1
	bne	.got_mobj

.next	ldy	_next,x
	tyx
	bne	.loop
	
.got_mobj	
	ldy	_next,x
	sty	fobj
	txy
	ldx	tpx
	a16
	rtl


;*****************************************************************************
;* find_nearobject
;*
;*
;* entry:		ai16
;* 	A 	: shape number.
;*	TPZ	: min radius. less than 8000
;*	TPX	: max radius. less than 8000
;*	fobj      : first object.
;*
;* exit:		ai16
;*	X	: not changed.
;*	Y 	: ptr. to object. (0=not found)
;*	fobj   : ptr to object.
;*

	LONGA
	LONGI
find_nearobject_l
findntarget_l

	stx	x2		; store current object.
	ldx	fobj		; first object list.
	lbeq	badfend

	cmp	#0
	beq	find_anynearobject_l

	sta	y2
	stz	tpy		; nearest object

.loop	
	cpx    	x2
	beq	.not_near

	lda	al_shape,x
	cmp	y2
	bne	.not_near

	ldy	x2
	jsl	xzdiffs_l
	a16

	lda	rangexz
	cmp	tpx
	bpl	.not_near
	cmp	tpz
	bmi	.not_near
	sta	tpx
	stx	tpy
.not_near

	ldy	_next,x
	tyx
	bne	.loop
	ldy	_next,x
	sty	fobj
	ldy	tpy
     	ldx	x2
	rtl
	
badfend	ldy	#0
	ldx	x2		
	rtl


;*****************************************************************************
;* find_anynearobject
;*
;*
;* entry:		ai16
;*	TPX	: max radius. less than 8000
;*	fobj      : first object.
;*
;* exit:		ai16
;*	X	: not changed.
;*	Y 	: ptr. to object. (0=not found)
;*	fobj   : ptr to object.
;*

	LONGA
	LONGI
find_anynearobject_l
	stz	tpy		; nearest object

.loop	
	cpx	x2
	beq	.not_near

	lda_sflags	x,realobj
	and	#asf_realobj
	beq	.not_near

	ldy	x2
	jsl	xzdiffs_l
	a16

	lda	rangexz
	cmp	tpx
	bpl	.not_near
	cmp	tpz
	bmi	.not_near
	sta	tpx
	stx	tpy
.not_near

	ldy	_next,x
	tyx
	lbne	.loop
	sty	fobj

	ldy	tpy
     	ldx	x2
	rtl




;*****************************************************************************
;* find_radiusobject
;*
;*
;* entry:		ai16
;* 	A 	: shape number.
;*	TPZ	: min radius. less than 8000
;*	TPX	: max radius. less than 8000
;*	fobj      : first object.
;*
;* exit:		ai16
;*	X	: not changed.
;*	Y 	: ptr. to object. (0=not found)
;*	fobj   : ptr to object.
;*

	LONGA
	LONGI
find_radiusobject_l

	stx	x2		; store current object.
	ldx	fobj		; first object list.
	lbeq	badfend

	cmp	#0
	beq	find_anyradiusobject_l

	sta	y2
	stz	tpy		; nearest object

.loop	
	cpx    	x2
	beq	.not_near

	lda	al_shape,x
	cmp	y2
	bne	.not_near

	ldy	x2
	jsl	xzdiffs_l
	a16

	lda	rangexz
	cmp	tpx
	bpl	.not_near
	cmp	tpz
	bpl	.found
.not_near

	ldy	_next,x
	tyx
	bne	.loop

.found	ldy	_next,x
	sty	fobj
	txy
     	ldx	x2
	rtl
	


;*****************************************************************************
;* find_anyradiusobject
;*
;*
;* entry:		ai16
;*	TPX	: max radius. less than 8000
;*	fobj      : first object.
;*
;* exit:		ai16
;*	X	: not changed.
;*	Y 	: ptr. to object. (0=not found)
;*	fobj   : ptr to object.
;*

	LONGA
	LONGI
find_anyradiusobject_l

.loop	
	cpx	x2
	beq	.not_near

	lda_sflags	x,realobj
	and	#asf_realobj
	beq	.not_near

	ldy	x2
	jsl	xzdiffs_l
	a16

	lda	rangexz
	cmp	tpx
	bpl	.not_near
	cmp	tpz
	bpl	.found
.not_near

	ldy	_next,x
	tyx
	lbne	.loop

.found	ldy	_next,x
	sty	fobj
	txy
     	ldx	x2
	rtl


;*****************************************************************************
;* find_shape_l
;*
;* entry:	ai16
;*	A : shape.
;*
;* exit:		ai16
;*	X : ptr to obj
;*	uses Y
;*	
;*
	longa
	longi
find_shape_l
	php
	ldy	allst
.findloop
	tyx
	cmp	al_shape,x
	beq	.foundobj
	ldy	_next,x
	bne	.findloop
	ldx	#0
.foundobj	
	plp
	rtl



;*****************************************************************************
;* count_shapes_l
;*
;* entry:	ai16
;*	A : shape.
;*
;* exit:		ai16
;*	A : number of shapes.
;*	uses Y,X
;*	
;*
	longa
	longi
count_shapes_l
	php
	ldy	allst
	stz	tpa
.findloop
	tyx
	cmp	al_shape,x
	bne	.nfound
	inc	tpa
.nfound	ldy	_next,x
	bne	.findloop	
.end
	lda	tpa
	plp
	rtl




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
rotate_8xz_l
	phy
	phx
	php
	phb

	i8

	nega
	tax
	IFNE	FASTROM
	lda	#$80
	pha
	plb
	ELSEIF
	lda	#0
	pha
	plb
	ENDC
	lda	costab,x
	sta	cy
	lda	sintab,x
	sta	sy

	mulslogmac x1,cy
	stx x2
	mulslogmac z1,sy
	txa
	clc
	adc x2
	sta x2
	sexam	x2+1

	mulslogmac x1,sy
	txa
	nega
	sta z2
	mulslogmac z1,cy
	txa
	clc
	adc z2
	sta z2
	sexam	z2+1

	plb
	plp
	plx
	ply


	rtl

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
rotate_8yz_l
	phx
	phy
	php
	phb

	i8

	tax
	IFNE	FASTROM
	lda	#$80
	pha
	plb
	ELSEIF
	lda	#0
	pha
	plb
	ENDC
	lda	costab,x
	sta	cy
	lda	sintab,x
	sta	sy

	mulslogmac y1,cy
	stx y2
	mulslogmac z1,sy
	txa
	clc
	adc y2
	sta y2
	sexam	y2+1

	mulslogmac y1,sy
	txa
	nega
	sta z2
	mulslogmac z1,cy
	txa
	clc
	adc z2
	sta z2
	sexam	z2+1

	plb
	plp
	ply
	plx


	rtl


;*****************************************************************************
;* rotate_8yx
;*
;*
;* entry:		a8i16
;*	A  : Y angle
;*	x1 : x vector 8bit
;*	y1 : y vector 8bit
;*
;*
;* exit:		a8i16
;*
;*	x2 : rotated x vector 16bit
;*	y2 : rotated y vector 16bit
;*
;*
	
	SHORTA
	LONGI
rotate_8yx_l
	phy
	phx
	php
	phb

	i8

	tax
	IFNE	FASTROM
	lda	#$80
	pha
	plb
	ELSEIF
	lda	#0
	pha
	plb
	ENDC
	lda	costab,x
	sta	cy
	lda	sintab,x
	sta	sy

	mulslogmac x1,cy
	stx x2
	mulslogmac y1,sy
	txa
	clc
	adc x2
	sta x2
	sexam	x2+1

	mulslogmac x1,sy
	txa
	nega
	sta y2
	mulslogmac y1,cy
	txa
	clc
	adc y2
	sta y2
	sexam	y2+1

	plb
	plp
	plx
	ply


	rtl

;*****************************************************************************
;* rotate_16xz
;*
;*
;* entry:	a8
;*	A  : Y angle 
;*	x1 : x vector 16bit
;*	z1 : z vector 16bit
;*
;*
;* exit:	a8	
;*
;*	x2 : rotated x vector 16bit
;*	z2 : rotated z vector 16bit
;*
;*
	SHORTA
	LONGI

rotate_16xz_l
	stx	tpx
	sty	tpy
	php
	phb

	i8

	tax
	IFNE	FASTROM
	lda	#$80
	pha
	plb
	ELSEIF
	lda	#0
	pha
	plb
	ENDC
	lda sintab,x
	sta sinvy
	lda costab,x
	sta cosvy

	mulslog168 x1,sinvy
	lda m4
	sta z2
	lda m5
	sta z2+1
	mulslog168 z1,cosvy
	lda m4
	clc
	adc z2
	sta z2
	lda m5
	adc z2+1
	sta z2+1

	mulslog168 z1,sinvy
	lda m4
	sta x2
	lda m5
	sta x2+1
	mulslog168 x1,cosvy
	lda m4
	sec
	sbc x2
	sta x2
	lda m5
	sbc x2+1
	sta x2+1

	plb
	plp
	ldy	tpy
	ldx	tpx
	rtl



;*****************************************************************************
;* rotate_16yz
;*
;*
;* entry:	a8
;*	A  : X angle 
;*	y1 : y vector 16bit
;*	z1 : z vector 16bit
;*
;*
;* exit:	a8	
;*
;*	y2 : rotated y vector 16bit
;*	z2 : rotated z vector 16bit
;*
;*
	SHORTA
	LONGI

rotate_16yz_l
	stx	tpx
	sty	tpy
	php
	phb

	i8

	nega
	tax
	IFNE	FASTROM
	lda	#$80
	pha
	plb
	ELSEIF
	lda	#0
	pha
	plb
	ENDC
	lda sintab,x
	sta sinvy
	lda costab,x
	sta cosvy

	mulslog168 y1,sinvy
	lda m4
	sta z2
	lda m5
	sta z2+1
	mulslog168 z1,cosvy
	lda m4
	clc
	adc z2
	sta z2
	lda m5
	adc z2+1
	sta z2+1

	mulslog168 z1,sinvy
	lda m4
	sta y2
	lda m5
	sta y2+1
	mulslog168 y1,cosvy
	lda m4
	sec
	sbc y2
	sta y2
	lda m5
	sbc y2+1
	sta y2+1

	plb
	plp
	ldy	tpy
	ldx	tpx
	rtl






;*****************************************************************************
;* anglexy_off
;*
;*
;* entry:		a8i16
;* 	x2 : X offset
;*	z2 : Z offset
;*	X  : obj 1
;*	Y  : obj 2
;*
;* exit:		a8i16
;*	A  : 8 bit angle
;* 	x2 : X offset
;*	z2 : Z offset
;*	X  : obj 1
;*	Y  : obj 2
;*
;*
;*

anglexy_off_l
	phx
	phy
	
	jsl	xzdiffs_l

	a16
	lda	x1
	clc
	adc	x2
	sta	x1

	lda	y1
	clc
	adc	z2
	sta	y1


	jsl	arctan16_l
	a16
	xba
	and	#$ff
	a8i16
	ply
	plx
	rtl

;*****************************************************************************
;* anglexy_abs
;*
;*
;* entry:		a8i16
;* 	x2 : X position
;*	z2 : Z position
;*	X  : obj 1
;*
;* exit:		a8i16
;*	A  : 8 bit angle
;* 	x2 : X pos
;*	z2 : Z pos
;*	X  : obj 1
;*
;*
;*

	LONGI
anglexy_abs_l
	phx
	phy
	
	jsl	xzdiffs_abs_l

	jsl	arctan16_l
	a16
	xba
	and	#$ff
	a8i16
	ply
	plx
	rtl

;*****************************************************************************
;* xzdiffs_off
;*
;*
;* entry:		a8i16
;*	X  		: obj 1
;*	Y  		: obj 2
;* x2,z2		: x,z offsets
;*
;*
;* exit:		a8i16
;*	X  	: obj 1
;*	Y  	: obj 2
;*	rangexz : distance. 
;*
;*


	LONGI
xzdiffs_off_l
	a16
	lda.w	al_worldx,y
	clc
	adc	x2
	sec
	sbc	al_worldx,x
	sta	x1
	bpl	.px
	lda	#0
	sec
	sbc	x1
.px	sta	rangexz

	lda.w	al_worldz,y
	clc
	adc	z2
	sec
	sbc	al_worldz,x
	sta	y1
	bmi	.ny
	clc
	adc	rangexz
	bra	.x
.ny	sec
	lda	rangexz
	sbc	y1
.x	sta	rangexz
	a8
	rtl


;*****************************************************************************
;* xzdiffs_abs
;*
;*
;* entry:		a8i16
;*	X  		: obj 1
;* 	x2,z2		: x,z position
;*
;*
;* exit:		a8i16
;*	X  	: obj 1
;*	rangexz : distance. 
;*
;*


	LONGI
xzdiffs_abs_l
	a16
	lda	x2
	sec
	sbc	al_worldx,x
	sta	x1
	bpl	.px
	lda	#0
	sec
	sbc	x1
.px	sta	rangexz

	lda	z2
	sec
	sbc	al_worldz,x
	sta	y1
	bmi	.ny
	clc
	adc	rangexz
	bra	.x
.ny	sec
	lda	rangexz
	sbc	y1
.x	sta	rangexz
	a8
	rtl

;*****************************************************************************
;* xydiffs_abs
;*
;*
;* entry:		a8i16
;*	X  		: obj 1
;* 	x2,y2		: x,y position
;*
;*
;* exit:		a8i16
;*	X  	: obj 1
;*	rangexz : distance. 
;*
;*


	LONGI
xydiffs_abs_l
	a16
	lda	x2
	sec
	sbc	al_worldx,x
	sta	x1
	bpl	.px
	lda	#0
	sec
	sbc	x1
.px	sta	rangexz

	lda	y2
	sec
	sbc	al_worldy,x
	sta	y1
	bmi	.ny
	clc
	adc	rangexz
	bra	.x
.ny	sec
	lda	rangexz
	sbc	y1
.x	sta	rangexz
	a8
	rtl



;*****************************************************************************
;* add_objvecs	- add vecs of obj1 to obj2
;*
;*
;* entry:		a8i16
;*	X  		: obj 2
;*	Y		: obj 1
;*
;* exit:		a8i16
;*	X  		: obj 2
;*	Y		: obj 1
;*
;*

	LONGI
add_objvecs_l
	a16
	stx	tpx
	tyx
	ldy	tpx

	lda	al_vx,x
	sta	x1	
	lda	al_vy,x
	sta	y1	
	lda	al_vz,x
	sta	z1    
	
	stx	tpx
	tyx
	ldy	tpx

	lda	al_vx,x
	clc
	adc	x1	
	sta	al_vx,x
	lda	al_vy,x
	clc
	adc	y1	
	sta	al_vy,x
	lda	al_vz,x
	clc
	adc	z1	
	sta	al_vz,x

	a8
	rtl




;*****************************************************************************
;* anglexy
;*
;* entry: a8i16
;*	 
;*	 x : obj1 
;*	 y : obj2 
;*	 
;*	 
;*
;* exit:  a8i16
;*	 
;*	 x : obj1 
;*	 y : obj2 
;*	 A : y angle.
;*	 
;*		
;*

	shorta
	longi
anglexy_l  
Yanglexy_l
	phx
	phy
	a16	
	
	lda.w	al_worldx,y
	sec
	sbc	al_worldx,x
	sta	x1

	lda.w	al_worldz,y
	sec
	sbc	al_worldz,x
	sta	y1

	jsl	arctan16_l
	ai16
	ply
	plx
	rtl

;*****************************************************************************
;* Xanglexy
;*
;* entry: a8i16
;*	 
;*	 x : obj1 
;*	 y : obj2 
;*	 
;*	 
;*
;* exit:  ai16
;*	 
;*	 x : obj1 
;*	 y : obj2 
;*	 A : x angle.
;*	 
;*		
;*

	shorta
	longi
Xanglexy_l  
	phx
	phy
	
	jsl	xzdiffs_l
	a16
	lda	rangexz
	sta	y1
	lda.w	al_worldy,y
	sec
	sbc	al_worldy,x
	sta	x1
	jsl	arctan16_l
	ai16	
	ply
	plx
	rtl
	

;*****************************************************************************
;* Xangleabs
;*
;* entry: a8i16
;*	 
;*	 x : obj1 
;*	 x2 : position
;*	 y2 : 
;*	 z2 : 
;*	 
;*	 
;*
;* exit:  a8i16
;*	 
;*	 x : obj1 
;*	 A : x angle.
;*	 
;*		
;*

	shorta
	longi
Xanglexabs_l  
	phx
	phy
	
	jsl	xzdiffs_abs_l
	a16
	lda	rangexz
	sta	y1
	lda.w	y2
	sec
	sbc	al_worldy,x
	sta	x1
	jsl	arctan16_l
	a16	
	sta	tpx
	xba
	and	#$ff
	a8i16
	ply
	plx
	rtl



;*****************************************************************************
;* Yangleabs
;*
;* entry: a8i16
;*	 
;*	 x : obj1 
;*	 x2 : position
;*	 z2 : 
;*	 
;*	 
;*
;* exit:  a8i16
;*	 
;*	 x : obj1 
;*	 A : y angle.
;*	 
;*		
;*

	shorta
	longi
Yanglexabs_l  
	phx
	phy
	
	a16
	
	lda.w	x2
	sec
	sbc	al_worldx,x
	sta	x1

	lda.w	z2
	sec
	sbc	al_worldz,x
	sta	y1

	jsl	arctan16_l
	a16	
	sta	tpx
	xba
	and	#$ff
	a8i16
	ply
	plx
	rtl


	
	
;*****************************************************************************


	shorta
	longi
xzdiffs_l

	a16
	lda.w	al_worldx,y
	sec
	sbc	al_worldx,x
	bpl	.nnegx
	nega
.nnegx	sta	x1

	lda.w	al_worldz,y
	sec
	sbc	al_worldz,x
	bpl	.nnegz
	nega
.nnegz	sta	y1
	

xzdiffs_diffabs_l
	a16
	lda	x1
	asra
	sta	x1
	lda	y1
	asra
	sta	y1


	lda	y1
	clc
	adc	x1
	asl	a
	sta	rangexz

	lda	y1
	cmp	x1
	bmi	.xmax
	lda	y1
	bra	.done
.xmax	lda	x1
.done
	clc
	adc	rangexz
	

	sta	x1
	asl	a
	asl	a
	sta	y1
	lda	x1
	asra
	clc
	adc	y1
	asra
	asra
	asra
;	asra
	sta	rangexz

	a8	
	rtl



;*****************************************************************************


	shorta
	longi
xydiffs_l
	a16
	lda.w	al_worldx,y
	sec
	sbc	al_worldx,x
	sta	x1
	bpl	.px
	lda	#0
	sec
	sbc	x1
.px	sta	rangexy

	lda.w	al_worldy,y
	sec
	sbc	al_worldy,x
	sta	y1
	bmi	.ny
	clc
	adc	rangexy
	bra	.x
.ny	sec
	lda	rangexy
	sbc	y1
.x	sta	rangexy
	a8
	rtl


	ifeq	1
;*****************************************************************************
;* next_macweapon	
;*
;*
;* entry:	ai8
;*	A : weapon number.
;*	X : machine number.
;*
;* exit:	ai8
;*
;*	A : next weapon number.
;*	X : machine number.
;*
;*

numweapons	equ	3


next_macweapon_l
	phy
	phx
	php
	ai8

	sta	x1		; current weapon number.
	txa
	amul3			; machine num * 3
	sta	z1
	
	ldy	#0
get_nmw	
	lda	x1
	inc	a		
	inc	a		; next current weapon number. 
	iny
	cpy	#numweapons	; check for no weapons at all.
	beq	no_next_macweapon
	cmp	#numweapons*2
	bmi	not_mwn
	lda	#0
not_mwn
	sta	x1		; store current weapon num.
	clc
	adc	z1		; add machine num offset.
	tax
	lda.l	mac_Yweapons,x	; get weapon type.
	beq	get_nmw

no_next_macweapon
	lda	x1
	plp
	plx
	ply
	rtl



;*****************************************************************************
;* get_weaponaddr
;*
;*
;* entry:	ai8
;*	A : weapon type
;*	X : machine number.
;*
;* exit:	a16i8
;*
;*	A : weapon chr addr.
;*
;*

get_weaponaddr_l
	phx
	phy
	php

	ai8
	amul3
	tax
	
	a16
	lda.l	weapons_data,x

	plp
	ply
	plx
	rtl


;*****************************************************************************
;* get_macweapon	
;*
;*
;* entry:	ai8
;*	A : weapon number.
;*	X : machine number.
;*
;* exit:	ai8
;*
;*	A : weapon type.
;*	X : machine number.
;*
;*

get_macweapon_l
	phy
	phx
	php
	ai8

	sta	x1		; current weapon number.
	txa
	amul3			; machine num * 3
	clc
	adc	x1
	tax
	
	lda.l	mac_Yweapons,x	; get weapon type.
	beq	err_gmw

end_get_macweapon
	plp
	plx
	ply
	rtl

err_gmw
	lda	#-1
	bra	end_get_macweapon





;*****************************************************************************
;* next_pweapon	
;*
;*




next_pweapon_l
	IFEQ	1

	phx
	phy
	php

	a8i16

	lda.l	pcurr_weapon
	ldx	playermac
	jsl	next_macweapon_l
	sta.l	pcurr_weapon
	jsl	get_macweapon_l
	ldy	playpt
	sta.w	al_weapontype,y		

	a16
	jsl	get_weaponaddr_l
	sta	weapaddr

	
	
	plp
	ply
	plx

	ENDC
	rtl

	ENDC


;*****************************************************************************
;* fire_weapon
;*
;* entry: a8i16
;*	 A : weapon number.
;*	 X : object that fire it.
;*
;*
;* exit: a8i16
;*	 A : weapon number.
;*	 X : object that fire it.
;*
;*
;*

fire_weapon_l
	pha
	lda		stratflags
	and		#sf_nofiring
	bne		.nofire

	pla
.dofire

	stx	tpx
	ai8
	amul3
	tax
	lda.l	weapons_data+4,x
	pha
	a16
	lda.l	weapons_data+2,x
	dec	a
	pha

	a8i16
	ldx	tpx
	rtl

.nofire	pla
	cpx	playpt
	beq	.dofire
	ldy	#0
	rtl




weaphdr	=	0
	include	INC\weapons.inc





;*****************************************************************************
;* do_coll -	
;* 
;* entry:	a8i16	
;*	X   : obj1
;*	X1  : hit count affect.
;* 	TPA : frames per hit count affect. 
;*
;* exit:	a8i16	
;*	X   : obj1
;*	X1  : hit count affect.
;* 	TPA : frames per hit count affect. 
;*
;*


	SHORTA
	LONGI

do_coll_l


	s_decbne_alvar		B,x,al_collcount,.skip
.f2

	s_jmpNOT_varAND		B,pshipflags3,#psf3_intunnel,.ntun
	lda			x1
	cmp			#hardAP
	bne			.nhard
	asra
	sta			x1
.nhard
.ntun

	LDA	AL_HP,X	
	BMI	.o2c
	SEC
	SBC	X1
	BPL	.nnhc
	LDA	#0
.nnhc	STA	AL_HP,X
.o2c	s_set_alvar		B,x,al_collcount,tpa
.skip


;	a16
;	lda.l	svar_collx
;	sta.w	al_worldx,x
;	lda.l	svar_colly
;   	sta.w	al_worldy,x
;  	lda.l	svar_collz
; 	sta.w	al_worldz,x
;	a8

      	rtl

;*****************************************************************************
;* do_strat_l
;*
;*
;* entry:
;*	 X : ptr. to object.
;*
;*

Do_strat_l
	php
	ai16
	cpx	dummyobj
	lbeq	.estrat

	s_clr_alcollflag	x,firstframe

	lda	al_worldx,x
	sta	stratobj_posx
	lda	al_worldy,x
	sta	stratobj_posy
	lda	al_worldz,x
	sta	stratobj_posz
	
	a8
	

	stx	al1pt

	lda	al_HP,x
	bne	.nes

	s_jmp_altype	x,nuked,.nes

	a16
	lda.l	alx_endcollstratptr,x  
	beq	.nolct
	a8
	test_alsflag	x,Lcollide
	bne	.dlc
.nolct	a8


	lda.l	alx_expstratptr+2,x 
	sta	tjmp+2
	a16
	lda.l	alx_expstratptr,x 
	bne	.dostr
	a8
.nes	
	s_clr_altype	x,nuked
	test_alsflag	x,collide
	beq	.ncs
	lda.l	alx_collstratptr+2,x 
	sta	tjmp+2
	a16
	lda.l	alx_collstratptr,x  
	bne	.dostr
	a8
	s_clr_alsflag	x,collide
	bra	.ns
.ncs	test_alsflag	x,Lcollide
	beq	.ns
.dlc	s_clr_alsflag	x,Lcollide
	lda.l	alx_endcollstratptr+2,x 
	sta	tjmp+2
	a16
	lda.l	alx_endcollstratptr,x  
	bne	.dostr
	a8
.ns
	lda	al_stratptr+2,x 
	sta	tjmp+2
	a16
	lda	al_stratptr,x
	beq	.strad
		
.dostr

	sta	tjmp
	a8
	lda	#(.estrat>>16)&255
	pha
	a16
	lda	#(.estrat-1)&WM
	pha

	a8
	lda	tjmp+2
	
	pha
	a16
	stz	svar_dist
	lda	tjmp
	dec	a
	pha
	a8
	rtl

.estrat

;---------------------------------------------------------
; strategy valid ?
	a8
	lda	strat_valid
;---------------------------------------------------------
	   

.strad	plp
	rtl


.bad_strat
	badstrat



;*****************************************************************************
;* init_objvars
;*
;*
;* entry:	a8i16
;*
;*      Y : ptr. to object
;*
;* exit:	a8i16
;*
;*

	SHORTA
	LONGI
init_objvars_l
	exg_XY 

;-------------------------------------------------
; clear alien block	
	lda	#0
	phy
	phx

	ldy	#al_size-4
.clral	sta	al_start,x
	inx	
	dey	
	bne	.clral

	plx
	phx

	ldy	#al_size
.clral2	sta.l	alx_start,x
	inx	
	dey	
	bne	.clral2

	plx
	ply
;-------------------------------------------------
; set default flags

	s_set_alflag		x,inviewpl
	s_setremove_behind	x
	s_set_alcollflag	x,firstframe
	s_set_alsflag		x,realobj

	exg_XY 
	rtl


;*****************************************************************************
;* makeobj_l
;*


makeobj_l
	l_add	allst,alfreelst,.badobj
	sec
	rtl
.badobj
	clc
	rtl 

 

;*****************************************************************************
clearmap_l
	i16
	phx
	ldx	allst
	beq	.end

.loop	ldy	_next,x

	a8
	lda_sflags	x,playerobj
	and	#asf_playerobj
	bne	.next

	phy
	jsl	removedeadal_l
	ply
.next	tyx
	bne	.loop
.end

	plx
	rtl


;*****************************************************************************
clearrealobjmap_l
	i16
	phx
	ldx	allst
	beq	.end

.loop	ldy	_next,x

	a8
	lda_sflags	x,realobj
	and	#asf_realobj
	beq	.next

	phy
	jsl	removedeadal_l
	ply
.next	tyx
	bne	.loop
.end

	plx
	rtl

	
;*****************************************************************************
set_normcollptrsx_l
	
	a16
	lda	#hitflash_Istrat&WM
	sta	al_collstratptr,x
	lda	#explode_Istrat&WM
	sta	al_expstratptr,x


	a8
	lda	#hitflash_Istrat>>16
	sta	al_collstratptr+2,x
	lda	#explode_Istrat>>16
	sta	al_expstratptr+2,x

	rtl         	


;*****************************************************************************
set_normcollptrsy_l
	
	a16
	lda	#hitflash_Istrat&WM
	sta.w	al_collstratptr,y
	lda	#explode_Istrat&WM
	sta.w	al_expstratptr,y


	a8
	lda	#hitflash_Istrat>>16
	sta.w	al_collstratptr+2,y
	lda	#explode_Istrat>>16
	sta.w	al_expstratptr+2,y

	rtl         	

;*****************************************************************************
set_0collptrsx_l
	a16
	lda	#0
	sta	al_collstratptr,x
	sta	al_expstratptr,x

	a8
	sta	al_collstratptr+2,x
	sta	al_expstratptr+2,x

	rtl         	

set_0collptrsy_l
	a16
	lda	#0
	sta.w	al_collstratptr,y
	sta.w	al_expstratptr,y
	a8
	sta.w	al_collstratptr+2,y
	sta.w	al_expstratptr+2,y

	rtl         	

;******************************************************************************
add2posobjyfobjx_l
	longa
	longi
	lda	al_worldx,x
	clc
	adc	x2
	sta.w	al_worldx,y
	lda	al_worldz,x
	clc
	adc	z2
	sta.w	al_worldz,y
	lda	al_worldy,x
	clc
	adc	y2
	sta.w	al_worldy,y
	rtl
;**********************************************************************************
	longa
perc56A_l
	asra
	sta	tpx
	asra
	asra
	asra
	clc
	adc	tpx
	rtl
perc62A_l
	asra
	sta	tpx
	asra
	asra
	clc
	adc	tpx
	rtl

perc75A_l
	asra
	sta	tpx
	asra
	clc
	adc	tpx
	rtl
perc87A_l
	asra
	sta	tpx
	asra
	sta	tpy
	asra
	clc
	adc	tpx
	clc
	adc	tpy
	rtl

perc93A_l
	asra
	sta	tpx
	asra
	sta	tpy
	asra
	sta	tpa
	asra
	clc	
	adc	tpa
	clc
	adc	tpx
	clc
	adc	tpy
	rtl



;**********************************************************************************
	shorta
	longi
sr_remove_objx

	s_jmpNOT_onfire		x,.nfr
	s_remove_fire	x
.nfr
	s_doremove_obj		x
.ero
	rtl

sr_remove_objy
	exg_xy
	jsl		sr_remove_objx
	exg_xy
	rtl

;**********************************************************************************
sr_make_obj	

	stx	tpx
	jsl	makeobj_l
	bcs	.gobj
.badobj
	ldy	#0
	ldx	tpx
	clc
	rtl
.gobj
	txy
	ldx	tpx

	a8
	jsl	init_objvars_l

	a16
	lda	tpa
	sta.w	al_shape,y

	a8
	sec
	rtl

;**********************************************************************************
	shorta
	longi
sr_make_child			; entry child number in A.
	sta	tpa

	s_set_alvar		B,y,al_sbyte1,tpa
	s_set_alvartobeobj	y,al_ptr,x
	s_set_alvar		W,y,al_sword1,#0
	
	a16
	sty	tpx
	txa

.lp	tay
	s_lda.w	al_sword1,y
	bne	.lp
	lda	tpx
	s_sta.w	al_sword1,y
	ldy	tpx
	a8


	s_set_alsflag	x,motherobj
	s_set_alsflag	y,childobj

	rtl



;**********************************************************************************
sr_gen_3dvecs
	jsl	n3Dvecs_l		; generate x,y,z vels from x,y rot and speed.

	a16
	lda	x1
	sta	al_vx,x

	lda	y1
	sta	al_vy,x

	lda	z1
	sta	al_vz,x
	a8
	rtl

sr_gen_3dvecs1
	jsl	n3Dvecs_l		; generate x,y,z vels from x,y rot and speed.

	a16
	lda	x1
	asl	a
	sta	al_vx,x

	lda	y1
	asl	a
	sta	al_vy,x

	lda	z1
	asl	a
	sta	al_vz,x
	a8
	rtl


sr_gen_3dvecs2
	jsl	n3Dvecs_l		; generate x,y,z vels from x,y rot and speed.

	a16
	lda	x1
	asl	a
	asl	a
	sta	al_vx,x

	lda	y1
	asl	a
	asl	a
	sta	al_vy,x

	lda	z1
	asl	a
	asl	a
	sta	al_vz,x
	a8
	rtl

sr_gen_3dvecs3
	jsl	n3Dvecs_l		; generate x,y,z vels from x,y rot and speed.

	a16
	lda	x1
	asl	a
	asl	a
	asl	a
	sta	al_vx,x

	lda	y1
	asl	a
	asl	a
	asl	a
	sta	al_vy,x

	lda	z1
	asl	a
	asl	a
	asl	a
	sta	al_vz,x
	a8
	rtl


;**********************************************************************************
	shorta
	longi
sr_speedto
          	sta	tpx

	lda	al_vel,x
	sec
	sbc	tpa
	beq	.nsc

	bpl	.nneg
	nega
.nneg
	cmp	tpx
	bpl	.sc
	
	lda	tpa
	bra	.fs

.sc	lda	al_vel,x
	cmp	tpa
	Fchase_A	tpx

.fs	sta 	al_vel,x
	clc
	rtl
.nsc
	sec
	rtl



;**********************************************************************************

	longa
sr16_achase_alvar1
	Achase_var2A		tpx,1,sr_achase_alvar_fin
	brl			sr_achase_alvar_end
sr16_achase_alvar2
	Achase_var2A		tpx,2,sr_achase_alvar_fin
	brl			sr_achase_alvar_end
sr16_achase_alvar3      
  	Achase_var2A		tpx,3,sr_achase_alvar_fin
	brl			sr_achase_alvar_end
sr16_achase_alvar4      
	Achase_var2A		tpx,4,sr_achase_alvar_fin
	brl			sr_achase_alvar_end
sr16_achase_alvar5      
	Achase_var2A		tpx,5,sr_achase_alvar_fin
	brl			sr_achase_alvar_end
sr16_achase_alvar6      
	Achase_var2A		tpx,6,sr_achase_alvar_fin
	brl			sr_achase_alvar_end
sr16_achase_alvar7      
	Achase_var2A		tpx,7,sr_achase_alvar_fin
	brl			sr_achase_alvar_end

	shorta
sr8_achase_alvar1
	Achase_var2A		tpx,1,sr_achase_alvar_fin
	brl			sr_achase_alvar_end
sr8_achase_alvar2
	Achase_var2A		tpx,2,sr_achase_alvar_fin
	brl			sr_achase_alvar_end
sr8_achase_alvar3      
  	Achase_var2A		tpx,3,sr_achase_alvar_fin
	brl			sr_achase_alvar_end
sr8_achase_alvar4      
	Achase_var2A		tpx,4,sr_achase_alvar_fin
	brl			sr_achase_alvar_end
sr8_achase_alvar5      
	Achase_var2A		tpx,5,sr_achase_alvar_fin
	brl			sr_achase_alvar_end
sr8_achase_alvar6      
	Achase_var2A		tpx,6,sr_achase_alvar_fin
	brl			sr_achase_alvar_end
sr8_achase_alvar7
	Achase_var2A		tpx,7,sr_achase_alvar_fin
	brl			sr_achase_alvar_end



sr_achase_alvar_end
	lda	tpx
	clc
	rtl

sr_achase_alvar_fin
	lda	tpx
	sec
	rtl

;**********************************************************************************
sr_set_expstrat_expx
	a16
	lda	#explode_Istrat&WM
	sta.l	alx_expstratptr,x
	a8
	lda	#explode_Istrat>>16
	sta.l	alx_expstratptr+2,x
	rtl

sr_set_expstrat_expy
	exg_xy
	a16
	lda	#explode_Istrat&WM
	sta.l	alx_expstratptr,x
	a8
	lda	#explode_Istrat>>16
	sta.l	alx_expstratptr+2,x
	exg_xy
	rtl



;**********************************************************************************
sr_banktoplayer
	a16
	lda		al_worldx,x
	sec
	sbc		player_posx
	sta		tpa
	asra			
	asra			
	asra			
	asra			
	asra			
	asra
	a8
	clc
	adc		al_rotz,x
	sta		al_rotz,x			


	s_jmp_notdelay	2,.fin,al1pt
	lda		tpa+1
	bmi		.nleft
	s_inc_alvar	B,x,al_roty
	bra		.dt
.nleft
	s_dec_alvar	B,x,al_roty
.dt

	a16
	lda		al_worldy,x
	sec
	sbc		player_posy
	a8

	bmi		.nup
	s_add_alvar	B,x,al_rotx,#1
	bra		.fin
.nup
	s_sub_alvar	B,x,al_rotx,#1
.fin
	rtl
;**********************************************************************************
sr_make_xyvec	
	lda	x1
	sta	trotx

	lda	z1
	sta	tmpz


	lda	#deg90
	sta	troty
	jsl	n3dvecs_l
	 
	a16
	lda	x1
	sta	al_vx,x

	lda	y1
	sta	al_vy,x

	stz	al_vz,x
	a8
	rtl


;**********************************************************************************
	SHORTA
	LONGI
sr_copyposyx
	a16
	lda	al_worldx,x
	sta.w	al_worldx,y
	lda	al_worldy,x
	sta.w	al_worldy,y
	lda	al_worldz,x
	sta.w	al_worldz,y
	a8
	rtl
sr_copyposxy
	a16
	lda.w	al_worldx,y
	sta	al_worldx,x
	lda.w	al_worldy,y
	sta	al_worldy,x
	lda.w	al_worldz,y
	sta	al_worldz,x
	a8
	rtl

sr_copyrotsyx
	s_lda.w	al_rotx,x
	s_sta.w	al_rotx,y
	s_lda.w	al_roty,x
	s_sta.w	al_roty,y
	s_lda.w	al_rotz,x
	s_sta.w	al_rotz,y
	rtl
sr_copyrotsxy
	s_lda.w	al_rotx,y
	s_sta.w	al_rotx,x
	s_lda.w	al_roty,y
	s_sta.w	al_roty,x
	s_lda.w	al_rotz,y
	s_sta.w	al_rotz,x
	rtl


sr_keeprelto_playerX
	a16
	lda	playervelZ
	sec
	sbc	pviewvelz
	clc
	adc	al_worldz,x
	sta	al_worldz,x
	a8
	rtl

sr_keeprelto_playerY
	a16
	lda	playervelZ
	sec
	sbc	pviewvelz
	clc
	adc.w	al_worldz,y
	sta.w	al_worldz,y
	a8
	rtl


sr_zero_vecsX
	a16
	stz	al_vx,x
	stz	al_vy,x
	stz	al_vz,x
	a8
	
	stz	al_vel,x  
	rtl


sr_zero_vecsY
	a16
	lda	#0
	sta.w	al_vx,y
	sta.w	al_vy,y
	sta.w	al_vz,y
	a8
	
	sta.w	al_vel,y  
	rtl


;**********************************************************************************
	shorta
	longi
nextstate	
	s_next_state		x
	s_brl			jmptostrat
setstate0	s_set_state		x,#0
	s_brl			jmptostrat
setstate1	s_set_state		x,#1
	s_brl			jmptostrat
setstate2	s_set_state		x,#2
	s_brl			jmptostrat
setstate3	s_set_state		x,#3
	s_brl			jmptostrat
setstate4	s_set_state		x,#4
	s_brl			jmptostrat
setstate5	s_set_state		x,#5
	s_brl			jmptostrat
jmptostrat
	s_jmpto_strat			




;**********************************************************************************
;* sort out child and mother objects if object in X removed.
divorcefamily_l

	a8
	s_jmpnot_alsflag	x,childobj,.nchild
	s_set_objtobemother	y,x
	s_remove_child		x,y
.nchild

	s_jmpnot_alsflag	x,motherobj,.nmother
	s_clr_alsflag		y,motherobj
	s_count_childs		x,tpa
	lda			tpa
	beq			.nmother
.killch	sta		tpa
	s_set_objtobechild	y,x,tpa
	s_jmp_objptrbad		y,.next
	s_clr_alsflag		y,childobj
	s_set_alvar		W,y,al_ptr,#0
.next	lda	tpa
	dec	a
	bne	.killch	
.nmother
	rtl

;**********************************************************************************

	SHORTA
	LONGI
jmptostratx_jml
	lda	al_stratptr+2,x
	pha
	a16
	bne	.nochk1
	lda	al_stratptr,x
	beq	.failed
	dec	a
	pha
	a8
	rtl
.nochk1	LONGA
	lda	al_stratptr,x
	dec	a
	pha
	a8
	rtl

.failed	a8
	pla
	rtl	; s_end_strat
	
;**********************************************************************************

	SHORTA
	LONGI
setobjtobechildyx_srou

	sta	tempchildnum	

	phx

.nc	ldy	al_sword1,x
	beq	.fc
.gc
	s_lda.w	al_sbyte1,y
	cmp	tempchildnum
	beq	.fc
	tyx
	bra	.nc
.fc
	plx

	rtl


setobjtobechildxy_srou
	sta	tempchildnum

	phy

.nc	ldx	al_sword1,y
	beq	.fc
.gc
	s_lda.w	al_sbyte1,x
	cmp	tempchildnum
	beq	.fc
	txy
	bra	.nc
.fc
	ply
	rtl


sr_addplayerZx
	s_add_alvar		W,x,al_worldz,pviewvelz
	rtl
sr_addplayerZy
	s_add_alvar		W,y,al_worldz,pviewvelz
	rtl


;**********************************************************************************
