
	ifeq	1

;-----------------------------------
;scan convert and sliver draw polygon
;On entry
; r0 number of points
;(x1,y1,x2,y2,...)

_maxy	=	r1
_miny	=	r2
_mrl	=	r4
_mrh	=	r5
_rampt	=	_mrh
_mr	=	r6
_x1	=	r7
_y1	=	r8
_x2	=	r9
_y2	=	r10
_npcp	=	r11	;np hi , cp lo
_cnt	=	r12
_loop	=	r13
_romf	=	r14
_x	=	_romf


msc_poly
	lms	r1,[m_texturemap]
	mtest	r1
	mlbne	mtscanstart

	dec	r0
	dec	r0
	mlbeq	mline

	inc	r0

;	mcache

	lob
	to	_npcp
	swap
	to	_npcp
	or	_npcp
	mult	#4
	miwt	_mr,m_polybuf	;m_polybuf
	to	_mr
	add	_mr
	to	_x2
	mldw	(_mr)
	inc	_mr
	inc	_mr
	to	_y2
	mldw	(_mr)
	move	_maxy,_y2
	move	_miny,_y2
	miwt	pc,.next
	dec	_npcp

;	---	
.more
	miwt	_romf,reciptab16s	;read ignored

	with	_x2	;calc dx
	sub	_x1

	with	_y2	;calc dy
	sub	_y1
			;look up recip tab
	to	_loop	;save in dy*2 in _loop
	from	_y2	;
	add	_y2
	with	_romf
	add	_loop
	;---do something here
	to	_mr
	getb
	inc	_romf
	with	_mr
	getbh	
	from	_x2
	to	r5
	lmult
	with	_mrl
	add	_mrl
	with	_mrh
	adc	_mrh

	with	_mrl
	hib
	from	_mrh
	lob
	swap
	to	_mrl
	or	_mrl
	from	_x1
	to	_x
	swap

	ibt	r0,#127	;fudge factor
	with	_x
	add	r0

	move	_rampt,_y1
	moves	_cnt,_y2

	move	_x2,_x1
	move	_y2,_y1

;	mexec	z
;	miwt	pc,.next
;	mexec	on

	mlbeq	.next

;	mexec	m
;	miwt	pc,.scup
;	mexec	on

	mlbmi	.scup

;Scan down

	from	_y2
	sub	_miny

;	mexec	m
;	move	_miny,_y2
;	mexec	on

	bpl	.1
	nop
	move	_miny,_y2
.1

	miwt	r0,m_scdwntab
	with	_rampt
	add	r0
	from	_x
	hib
	mstb	(_rampt)

	move	_loop,pc	

	inc	_rampt
	with	_x
	add	_mrl
	from	_x
	hib
	mstb	(_rampt)
	loop
	nop

	miwt	pc,.next
	nop

;scan up
.scup
	with	_cnt	;count neg make pos
	sub	_loop	;y2*2

	from	_y2
	sub	_maxy

;	mexec	p
;	move	_maxy,_y2
;	mexec	on

	bmi	.2
	nop
	move	_maxy,_y2
.2

	miwt	r0,m_scuptab
	with	_rampt
	add	r0

	from	_x
	hib
	mstb	(_rampt)

	move	_loop,pc

	dec	_rampt
	with	_x
	sub	_mrl
	from	_x
	hib
	mstb	(_rampt)
	loop
	nop

.next
	moves	r0,_npcp

	bvs	.3
	nop

;	mexec	vc
.last	mult	#4
	miwt	_mr,m_polybuf	;m_polybuf
	to	_mr
	add	_mr
	to	_x1
	mldw	(_mr)
	inc	_mr
	inc	_mr
	to	_y1
	mldw	(_mr)
	dec	_npcp
	miwt	pc,.more
;	mexec	on
	nop
.3

	from	_npcp
	hib

	bmi	.4
	nop

;	mexec	p
	inc	r0
	miwt	_npcp,-1
	miwt	pc,.last
;	mexec	on
	nop
.4	

_x	=	r1
_maxy	=	r1
_miny	=	r2
_upp	=	r4
_dwp	=	r5
_rampt	=	_mrh
_mr	=	r6
_x1	=	r7
_y1	=	r8
_x2	=	r9
_y2	=	r10
_llop	=	r11	;np hi , cp lo
_cnt	=	r12
_loop	=	r13
_romf	=	r14

;	mcache

	to	_y2
	from	_maxy
	sub	_miny

	miwt	_upp,m_scuptab
	miwt	_dwp,m_scdwntab
	with	_upp
	add	_miny
	with	_dwp
	add	_miny

	miwt	_loop,.dline
	move	_llop,pc

.6
	to	_x1
	mldb	(_upp)
	to	_x2
	mldb	(_dwp)

	to	_cnt
	from	_x2
	sub	_x1

;	mexec	z
;	inc	_cnt
;	mexec	on		; Pete:
;	mexec	p		;	bmi	.1	; 2/3
;	move	_x,_x1		;	move	_x,_x1	; 2
;	mexec	else		;	bra	.2	; 2/3
;	to	_cnt		;.1	to	_cnt	; 1
;	from	_x1		;	from	_x1	; 1
;	sub	_x2		;	sub	_x2	; 1
;	move	_x,_x2		;	move	_x,_x2	; 2
;	mexec	on	; =10	;.2			; = 7/8 (+1 byte)

	bne	.8
	nop
	inc	_cnt
.8
	bmi	.7
	nop
	move	_x,_x1
	bra	.dline
	nop
.7
	to	_cnt
	from	_x1
	sub	_x2
	move	_x,_x2

.dline
	loop
	plot

	inc	_miny
	inc	_upp
	inc	_dwp

	dec	_y2

;	mexec	p
;	jmp	_llop
;	mexec	on

	bpl	.6
	nop
  
	miwt	pc,mfacelabel
	nop


msclen	=	*-msc_poly
;	?msclen		

	endc

;************************************************



;-----------------------------------
;line draw
rx1	equr	r1
ry1	equr	r2
rx2	equr	r3
ry2	equr	r4
rxi	equr	r5
ryi	equr	r6
rmpt	equr	r7
rlgrad	equr	r8

rcnt	equr	r12

;------
mline
;	mlbra	mfacelabel

	ifne	mario_stats3d
	mincm	m_lines_drawn
	endc

	mcache

	miwt	rmpt,m_polybuf
	to	rx1
	mldwi	rmpt
	to	ry1
	mldwi	rmpt
	to	rx2
	mldwi	rmpt
	to	ry2
	ldw	[rmpt]

	ibt	rxi,#1
	with	rx2
	sub	rx1
	bpl	.1
	nop
	ibt	rxi,#-1
	mneg	rx2
.1
	ibt	ryi,#1
	with	ry2
	sub	ry1
	bpl	.3
	nop
	ibt	ryi,#-1
	mneg	ry2
.3
	from	rx2
	sub	ry2
	bmi	.largery
	nop

	move	rcnt,rx2
	inc	rcnt
	lsr
	sub	ry2
	move	r13,pc

;Loop			8/11 cycles
	bcs	.5
	plot
	add	rx2
	with	ry1
	add	ryi
.5
	dec	rx1
	with	rx1
	add	rxi
	loop
	sub	ry2

	mlbra	mfacelabel


.largery
	move	rcnt,ry2
	inc	rcnt
	mneg	r0
	lsr

	sub	rx2
	move	r13,pc
;Loop			8/11 cycles
	bcs	.6
	plot
	add	ry2
	with	rx1
	add	rxi
.6
	dec	rx1
	with	ry1
	add	ryi
	loop
	sub	rx2

	mlbra	mfacelabel

mlinelen	equ	*-mline
;	?mlinelen








;************************************************


; 2d polygon clip



	ifeq	1

;-----------------------------------
;clip polygon
;On entry
; r0 number of points
;(x1,y1,x2,y2,...)

_am	equr	r1
_bm	equr	r2
_as	equr	r3
_bs	equr	r4
_x1	equr	r5
_y1	equr	r6
_x2	equr	r7
_y2	equr	r8
_ae	equr	r9
_be	equr	r10
_rampt	equr	r11
_npcp	equr	r12	;np hi , cp lo
_jp	equr	r13
_acl	equr	r14



mdiv2bugfix_am	macro
	to	_am
	div2
	endm

mdiv2bugfix_bm	macro
	to	_bm
	div2
	endm



mclippoly2d

mclp_poly

;PART 1
;x clip from m_polybuf to m_cpolybuf

;	mcache

	mpush	r11			; stack return addr
	sms	[m_clip2drsp],rsp	; save rsp

	sms	[m_inpoints],r0

	dec	r0	;set _npcp lo & hi to ro-1
	lob
	to	_npcp
	swap
	to	_npcp
	or	_npcp
	to	_am
	mult	#4
	miwt	r0,m_polybuf	;get x1,y1
	add	_am
	to	_x1
	mldwi	r0
	to	_y1
	ldw	[r0]
	miwt	_rampt,m_cpolybuf
	miwt	pc,.GetX2Y2
	dec	_npcp


.Checkside
	miwt	_jp,.nvert
	from	_x2
	sub	_x1

;	mexec	m
;	miwt	pc,.dxneg
;	mexec	on

	mlbmi	.dxneg

;dx pos
	miwt	r0,mleftclp
	sub	_x2

;	mexec	nz
;	mexec	p
;	jmp	_jp
;	mexec	on

	beq	.1
	nop
	bmi	.1
	nop
	jmp	_jp
	nop
.1

	miwt	r0,mrightclp
	sub	_x1

;	mexec	m
;	jmp	_jp
;	mexec	on

	bpl	.2
	nop
	jmp	_jp
	nop
.2

	miwt	_acl,mleftclp
	from	_x1
	sub	_acl

;	mexec	m
;	miwt	pc,.dxpx1ofl
;	mexec	on

	bmi	.dxpx1ofl
	nop

	from	_x1	;_x1,_y1 on screen
	stw	[_rampt]
	inc	_rampt
	inc	_rampt
	from	_y1
	stw	[_rampt]
	inc	_rampt
	miwt	pc,.dxpx1done
	inc	_rampt

.dxpx1ofl			;_x1,_y1 off screen
	move	_as,_x1
	move	_bs,_y1
	move	_ae,_x2
	move	_be,_y2
;mid point clip side
	from	_ae
	sub	_acl

;	mexec	z
;	move	_as,_ae
;	move	_bs,_be
;	mexec	on

	bne	.3
	nop
	move	_as,_ae
	move	_bs,_be
.3

	move	_jp,pc
	from	_bs	
	add	_be
;	to	_bm
;	div2
	mdiv2bugfix_bm
	from	_as
	add	_ae
;	to	_am
;	div2
	mdiv2bugfix_am
	from	_am
	sub	_acl

;	mexec	p		;	bmi	.1	; 2/3
;	move	_ae,_am
;	move	_be,_bm
;	mexec	else		;	bra	.2	; 2/3
;	move	_as,_am		; .1
;	move	_bs,_bm
;	mexec	on	; =11	; .2			; = 9/7 (+1 byte)

	bmi	.4
	nop
	move	_ae,_am
	move	_be,_bm
	bra	.5
	nop
.4
	move	_as,_am
	move	_bs,_bm
.5

;	mexec	nz	
;	jmp	_jp
;	mexec	on

	beq	.6
	nop
	jmp	_jp
	nop
.6

	from	_am	;store first point clipped
	stw	[_rampt]
	inc	_rampt
	inc	_rampt
	from	_bm
	stw	[_rampt]
	inc	_rampt
	inc	_rampt
.dxpx1done			;check second point
	miwt	_acl,mrightclp
	from	_acl
	sub	_x2

;	mexec	p
;	miwt	pc,.nvert
;	mexec	on

	mlbpl	.nvert

	move	_as,_x1
	move	_bs,_y1
	move	_ae,_x2
	move	_be,_y2
;mid point clip side
	from	_ae
	sub	_acl

;	mexec	z
;	move	_as,_ae
;	move	_bs,_be
;	mexec	on

	bne	.7
	nop
	move	_as,_ae
	move	_bs,_be
.7

	move	_jp,pc
	from	_bs	
	add	_be
;	to	_bm
;	div2
	mdiv2bugfix_bm
	from	_as
	add	_ae
;	to	_am
;	div2
	mdiv2bugfix_am
	from	_am
	sub	_acl

;	mexec	p
;	move	_ae,_am
;	move	_be,_bm
;	mexec	else
;	move	_as,_am
;	move	_bs,_bm
;	mexec	on

	bmi	.8
	nop
	move	_ae,_am
	move	_be,_bm
	bra	.9
	nop
.8
	move	_as,_am
	move	_bs,_bm
.9

;	mexec	nz	
;	jmp	_jp
;	mexec	on

	beq	.10
	nop
	jmp	_jp
	nop
.10

	from	_am	;store second point clipped
	stw	[_rampt]
	inc	_rampt
	inc	_rampt
	from	_bm
	stw	[_rampt]
	inc	_rampt
	miwt	pc,.nvert
	inc	_rampt

.dxneg			;dx negative
	miwt	r0,mleftclp
	sub	_x1

;	mexec	nz
;	mexec	p
;	jmp	_jp
;	mexec	on

	beq	.11
	nop
	bmi	.11
	nop
	jmp	_jp
	nop
.11

	miwt	_acl,mrightclp
	from	_acl
	sub	_x2

;	mexec	m
;	jmp	_jp
;	mexec	on

	bpl	.12
	nop
	jmp	_jp
	nop
.12

	from	_acl
	sub	_x1

;	mexec	m
;	miwt	pc,.dxmx1ofl
;	mexec	on

	bmi	.dxmx1ofl
	nop

	from	_x1	;_x1,_y1 on screen
	stw	[_rampt]
	inc	_rampt
	inc	_rampt
	from	_y1
	stw	[_rampt]
	inc	_rampt
	miwt	pc,.dxmx1done
	inc	_rampt

.dxmx1ofl			;_x1,_y1 off screen

	move	_as,_x2
	move	_bs,_y2
	move	_ae,_x1
	move	_be,_y1
;mid point clip side
	from	_ae
	sub	_acl

;	mexec	z
;	move	_as,_ae
;	move	_bs,_be
;	mexec	on

	bpl	.13
	nop
	move	_as,_ae
	move	_bs,_be
.13

	move	_jp,pc
	from	_bs	
	add	_be
;	to	_bm
;	div2
	mdiv2bugfix_bm
	from	_as
	add	_ae
;	to	_am
;	div2
	mdiv2bugfix_am
	from	_am
	sub	_acl

;	mexec	p
;	move	_ae,_am
;	move	_be,_bm
;	mexec	else
;	move	_as,_am
;	move	_bs,_bm
;	mexec	on

	bmi	.14
	nop
	move	_ae,_am
	move	_be,_bm
	bra	.15
	nop
.14
	move	_as,_am
	move	_bs,_bm
.15

;	mexec	nz	
;	jmp	_jp
;	mexec	on

	beq	.16
	nop
	jmp	_jp
	nop
.16

	from	_am	;store first point clipped
	stw	[_rampt]
	inc	_rampt
	inc	_rampt
	from	_bm
	stw	[_rampt]
	inc	_rampt
	inc	_rampt
.dxmx1done			;check second point
	miwt	_acl,mleftclp
	from	_x2
	sub	_acl

;	mexec	p
;	miwt	pc,.nvert
;	mexec	on

	bpl	.nvert
	nop

	move	_as,_x2
	move	_bs,_y2
	move	_ae,_x1
	move	_be,_y1
;mid point clip side
	from	_ae
	sub	_acl

;	mexec	z
;	move	_as,_ae
;	move	_bs,_be
;	mexec	on

	bne	.17
	nop
	move	_as,_ae
	move	_bs,_be
.17

	move	_jp,pc
	from	_bs	
	add	_be
;	to	_bm
;	div2
	mdiv2bugfix_bm
	from	_as
	add	_ae
;	to	_am
;	div2
	mdiv2bugfix_am
	from	_am
	sub	_acl

;	mexec	p
;	move	_ae,_am
;	move	_be,_bm
;	mexec	else
;	move	_as,_am
;	move	_bs,_bm
;	mexec	on

	bmi	.18
	nop
	move	_ae,_am
	move	_be,_bm
	bra	.19
	nop
.18
	move	_as,_am
	move	_bs,_bm
.19

;	mexec	nz	
;	jmp	_jp
;	mexec	on

	beq	.20
	nop
	jmp	_jp
	nop
.20

	from	_am	;store second point clipped
	stw	[_rampt]
	inc	_rampt
	inc	_rampt
	from	_bm
	stw	[_rampt]
	inc	_rampt
	miwt	pc,.nvert
	inc	_rampt

.nvert
	move	_x1,_x2
	move	_y1,_y2
.GetX2Y2
	moves	r0,_npcp

	bvs	.21
	nop

;	mexec	vc	;lo byte _npcp pos
.last	to	_am
	mult	#4
	miwt	r0,m_polybuf	;get x2,y2
	add	_am
	to	_x2
	ldw	[r0]
	inc	r0
	inc	r0
	to	_y2
	ldw	[r0]
	dec	_npcp
	miwt	pc,.Checkside
;	mexec	on
	nop
.21
	from	_npcp
	hib

;	mexec	p
;	inc	r0
;	miwt	_npcp,-1
;	miwt	pc,.last
;	mexec	on

	bmi	.22
	nop
	inc	r0
	miwt	_npcp,-1
	miwt	pc,.last
	nop
.22

	miwt	_am,m_cpolybuf
	from	_rampt
	sub	_am
	lsr
	lsr

	lms	r1,[m_inpoints]
	with	r1
	sub	#2
	bne	.23
	nop
	ibt	r0,#2
.23






;------------------- - - - - -
mclp_PART_2
;y clip from m_cpolybuf to m_polybuf


; skip if < 2 points

	moves	r1,r0
	with	r1
	sub	#2
	mlbmi	mclp_poly_out

	dec	r0	;set _npcp lo & hi to ro-1
	lob
	to	_npcp
	swap
	to	_npcp
	or	_npcp
	to	_am
	mult	#4
	miwt	r0,m_cpolybuf	;get x1,y1
	add	_am
	to	_x1
	ldw	[r0]
	inc	r0
	inc	r0
	to	_y1
	ldw	[r0]
	miwt	_rampt,m_polybuf
	miwt	pc,.GetX2Y2
	dec	_npcp


.Checkside
	miwt	_jp,.nvert
	from	_y2
	sub	_y1

;	mexec	m
;	miwt	pc,.dyneg
;	mexec	on

	mlbmi	.dyneg

;dy pos
	miwt	r0,mtopclp
	sub	_y2

;	mexec	nz
;	mexec	p
;	jmp	_jp
;	mexec	on

	beq	.1
	nop
	bmi	.1
	nop
	jmp	_jp
	nop
.1

	miwt	r0,mbotclp
	sub	_y1

;	mexec	m
;	jmp	_jp
;	mexec	on

	bpl	.2
	nop
	jmp	_jp
	nop
.2

	miwt	_acl,mtopclp
	from	_y1
	sub	_acl

;	mexec	m
;	miwt	pc,.dypy1ofl
;	mexec	on

	bmi	.dypy1ofl
	nop

	from	_x1	;_x1,_y1 on screen
	stw	[_rampt]
	inc	_rampt
	inc	_rampt
	from	_y1
	stw	[_rampt]
	inc	_rampt
	miwt	pc,.dypy1done
	inc	_rampt

.dypy1ofl			;_x1,_y1 off screen
	move	_as,_y1
	move	_bs,_x1
	move	_ae,_y2
	move	_be,_x2
;mid point clip side
	from	_ae
	sub	_acl

;	mexec	z
;	move	_as,_ae
;	move	_bs,_be
;	mexec	on

	bne	.3
	nop
	move	_as,_ae
	move	_bs,_be
.3

	move	_jp,pc
	from	_bs	
	add	_be
;	to	_bm
;	div2
	mdiv2bugfix_bm
	from	_as
	add	_ae
;	to	_am
;	div2
	mdiv2bugfix_am
	from	_am
	sub	_acl

;	mexec	p
;	move	_ae,_am
;	move	_be,_bm
;	mexec	else
;	move	_as,_am
;	move	_bs,_bm
;	mexec	on

	bmi	.4
	nop
	move	_ae,_am
	move	_be,_bm
	bra	.5
	nop
.4
	move	_as,_am
	move	_bs,_bm
.5

;	mexec	nz	
;	jmp	_jp
;	mexec	on

	beq	.6
	nop
	jmp	_jp
	nop
.6

	from	_bm	;store first point clipped
	stw	[_rampt]
	inc	_rampt
	inc	_rampt
	from	_am
	stw	[_rampt]
	inc	_rampt
	inc	_rampt
.dypy1done			;check second point
	miwt	_acl,mbotclp
	from	_acl
	sub	_y2

;	mexec	p
;	miwt	pc,.nvert
;	mexec	on

	mlbpl	.nvert

	move	_as,_y1
	move	_bs,_x1
	move	_ae,_y2
	move	_be,_x2
;mid point clip side
	from	_ae
	sub	_acl

;	mexec	z
;	move	_as,_ae
;	move	_bs,_be
;	mexec	on

	bne	.7
	nop
	move	_as,_ae
	move	_bs,_be
.7

	move	_jp,pc
	from	_bs	
	add	_be
;	to	_bm
;	div2
	mdiv2bugfix_bm
	from	_as
	add	_ae
;	to	_am
;	div2
	mdiv2bugfix_am
	from	_am
	sub	_acl

;	mexec	p
;	move	_ae,_am
;	move	_be,_bm
;	mexec	else
;	move	_as,_am
;	move	_bs,_bm
;	mexec	on

	bmi	.8
	nop
	move	_ae,_am
	move	_be,_bm
	bra	.9
	nop
.8
	move	_as,_am
	move	_bs,_bm
.9

;	mexec	nz	
;	jmp	_jp
;	mexec	on

	beq	.10
	nop
	jmp	_jp
	nop
.10

	from	_bm	;store second point clipped
	stw	[_rampt]
	inc	_rampt
	inc	_rampt
	from	_am
	stw	[_rampt]
	inc	_rampt
	miwt	pc,.nvert
	inc	_rampt

.dyneg			;dy negative
	miwt	r0,mtopclp
	sub	_y1

;	mexec	nz
;	mexec	p
;	jmp	_jp
;	mexec	on

	beq	.11
	nop
	bmi	.11
	nop
	jmp	_jp
	nop
.11

	miwt	_acl,mbotclp
	from	_acl
	sub	_y2

;	mexec	m
;	jmp	_jp
;	mexec	on

	bpl	.12
	nop
	jmp	_jp
	nop
.12

	from	_acl
	sub	_y1

;	mexec	m
;	miwt	pc,.dymy1ofl
;	mexec	on

	mlbmi	.dymy1ofl

	from	_x1	;_x1,_y1 on screen
	stw	[_rampt]
	inc	_rampt
	inc	_rampt
	from	_y1
	stw     [_rampt]
	inc	_rampt
	miwt	pc,.dymy1done
	inc	_rampt

.dymy1ofl			;_x1,_y1 off screen

	move	_as,_y2
	move	_bs,_x2
	move	_ae,_y1
	move	_be,_x1
;mid point clip side
	from	_ae
	sub	_acl

;	mexec	z
;	move	_as,_ae
;	move	_bs,_be
;	mexec	on

	bne	.13
	nop
	move	_as,_ae
	move	_bs,_be
.13

	move	_jp,pc
	from	_bs	
	add	_be
;	to	_bm
;	div2
	mdiv2bugfix_bm
	from	_as
	add	_ae
;	to	_am
;	div2
	mdiv2bugfix_am
	from	_am
	sub	_acl

;	mexec	p
;	move	_ae,_am
;	move	_be,_bm
;	mexec	else
;	move	_as,_am
;	move	_bs,_bm
;	mexec	on

	bmi	.14
	nop
	move	_ae,_am
	move	_be,_bm
	bra	.15
	nop
.14
	move	_as,_am
	move	_bs,_bm
.15

;	mexec	nz	
;	jmp	_jp
;	mexec	on

	beq	.16
	nop
	jmp	_jp
	nop
.16

	from	_bm	;store first point clipped
	stw	[_rampt]
	inc	_rampt
	inc	_rampt
	from	_am
	stw	[_rampt]
	inc	_rampt
	inc	_rampt
.dymy1done			;check second point
	miwt	_acl,mtopclp
	from	_y2
	sub	_acl

;	mexec	p
;	miwt	pc,.nvert
;	mexec	on

	bpl	.nvert
	nop

	move	_as,_y2
	move	_bs,_x2
	move	_ae,_y1
	move	_be,_x1
;mid point clip side
	from	_ae
	sub	_acl

;	mexec	z
;	move	_as,_ae
;	move	_bs,_be
;	mexec	on

	bne	.17
	nop
	move	_as,_ae
	move	_bs,_be
.17

	move	_jp,pc
	from	_bs	
	add	_be
;	to	_bm
;	div2
	mdiv2bugfix_bm
	from	_as
	add	_ae
;	to	_am
;	div2
	mdiv2bugfix_am
	from	_am
	sub	_acl

;	mexec	p
;	move	_ae,_am
;	move	_be,_bm
;	mexec	else
;	move	_as,_am
;	move	_bs,_bm
;	mexec	on

	bmi	.18
	nop
	move	_ae,_am
	move	_be,_bm
	bra	.19
	nop
.18
	move	_as,_am
	move	_bs,_bm
.19

;	mexec	nz	
;	jmp	_jp
;	mexec	on

	beq	.20
	nop
	jmp	_jp
	nop
.20

	from	_bm	;store second point clipped
	stw	[_rampt]
	inc	_rampt
	inc	_rampt
	from	_am
	stw	[_rampt]
	inc	_rampt
	miwt	pc,.nvert
	inc	_rampt

.nvert
	move	_x1,_x2
	move	_y1,_y2
.GetX2Y2
	moves	r0,_npcp

	bvs	.21
	nop

;	mexec	vc	;lo byte _npcp pos
.last	to	_am
	mult	#4
	miwt	r0,m_cpolybuf	;get x2,y2
	add	_am
	to	_x2
	ldw	[r0]
	inc	r0
	inc	r0
	to	_y2
	ldw	[r0]
	dec	_npcp
	miwt	pc,.Checkside
;	mexec	on
	nop
.21
	from	_npcp
	hib

;	mexec	p
;	inc	r0
;	miwt	_npcp,-1
;	miwt	pc,.last
;	mexec	on

	bmi	.22
	nop
	inc	r0
	miwt	_npcp,-1
	miwt	pc,.last
	nop
.22

	miwt	_am,m_polybuf
	from	_rampt
	sub	_am
	lsr
	lsr


; skip if < 2 points

	moves	r1,r0
	with	r1
	sub	#2
	mlbmi	mclp_poly_out

	lms	r1,[m_inpoints]
	with	r1
	sub	#2
	bne	.23
	nop
	ibt	r0,#2
.23

	lms	rsp,[m_clip2drsp]
;	mlbra	mdrawpoly

	mpop	pc
	nop



mclp_poly_out
	lms	rsp,[m_clip2drsp]
;	mlbra	mfacelabel

	sub	r0		; 0 = no poly left
	mpop	pc
	nop




mclp_len	=	*-mclp_poly
;	?mclp_len		

	endc
