;
; File:	MCLIP.MC
;
; Use:	2D and 3D clip
; Code:	MARIO
; By:	Peter Warnes
;	Copyright 1991
;


;mprintword
;mprintspace
;mprintnewline


rx1	equr	1
ry1	equr	2
rz1	equr	3
rx2	equr	4
ry2	equr	5
rz2	equr	6


	ifeq	1
mtestclip3dline
	miwt	rx2,40
	miwt	ry2,40
	miwt	rz2,20
	miwt	rx1,0
	miwt	ry1,0
	miwt	rz1,-60

	mcall	mclip3dline
	nop

	stop
	nop
	endc


mclip3dline
	mcache

	moves	rz1,rz1
	bmi	mmp2
	nop
	moves	rz2,rz2
	bmi	mmpc1
	nop
	sub	r0
	jmp	r11
	nop

mmp2
	moves	rz2,rz2
	bpl	mmpc2
	nop
	ibt	r0,#-1
	jmp	r11
	nop

mmpc1
	sms	[m_clipx],rx1
	sms	[m_clipy],ry1
	sms	[m_clipz],rz1

	mexg	rx1,rx2,r0
	mexg	ry1,ry2,r0
	mexg	rz1,rz2,r0

mmp0
	from	rz1
	add	rz2
	div2
	beq	mmpx
	nop
	bmi	mmp1
	nop

	move	rz2,r0
	from	rx1
	add	rx2
	to	rx2
	div2
	from	ry1
	add	ry2
	to	ry2
	div2
	bra	mmp0
	nop

mmp1
	move	rz1,r0
	from	rx1
	add	rx2
	to	rx1
	div2
	from	ry1
	add	ry2
	to	ry1
	div2
	bra	mmp0
	nop

mmpx
	move	rz2,r0
	from	rx1
	add	rx2
	to	rx2
	div2
	from	ry1
	add	ry2
	to	ry2
	div2

	lms	rx1,[m_clipx]
	lms	ry1,[m_clipy]
	lms	rz1,[m_clipz]

	ibt	r0,#1
	jmp	r11
	nop


mmpc2
	sms	[m_clipx],rx2
	sms	[m_clipy],ry2
	sms	[m_clipz],rz2

mmp20
	from	rz1
	add	rz2
	div2
	beq	mmp2x
	nop
	bmi	mmp21
	nop

	move	rz2,r0
	from	rx1
	add	rx2
	to	rx2
	div2
	from	ry1
	add	ry2
	to	ry2
	div2
	bra	mmp20
	nop

mmp21
	move	rz1,r0
	from	rx1
	add	rx2
	to	rx1
	div2
	from	ry1
	add	ry2
	to	ry1
	div2
	bra	mmp20
	nop

mmp2x
	move	rz1,r0
	from	rx1
	add	rx2
	to	rx1
	div2
	from	ry1
	add	ry2
	to	ry1
	div2

	lms	rx2,[m_clipx]
	lms	ry2,[m_clipy]
	lms	rz2,[m_clipz]

	ibt	r0,#1
	jmp	r11
	nop



;************************************************

; 3d polygon clip

rrotptr	equr	1
rpolyptr	equr	2
;rscale		=	4
rbigx	equr	5
rbigy	equr	6
rbigz	equr	7
rnumpnts	equr	9

mclippoly3d
;	mlbra	mclip3dexit

	mpush	r11

;	miwt	rsp,m_stack
	move	rnumpnts,r0


	ifne	mario_stats3d
	mincm	m_polys_clip3d
	endc


;	lms	rscale,[m_scale]
	lms	rbigx,[m_bigx]
	lms	rbigy,[m_bigy]
	lms	rbigz,[m_bigz]
	miwt	rpolyptr,m_polybuf
	move	r12,rnumpnts
	move	r13,pc

; copy poly rotpnts to poly buffer

	getb			; p1
	inc	rshapeptr
	umult	#6		; p1*6
	miwt	rrotptr,m_rotpnts
	with	rrotptr
	add	r0		; rrotptr = m_rotpnts + p1*6

	mldwi	rrotptr	; x
;	mult	rscale
	add	rbigx
	mstwi	rpolyptr

	mldwi	rrotptr	; y
;	mult	rscale
	add	rbigy
	mstwi	rpolyptr

	ldw	[rrotptr]	; z
;	mult	rscale
	add	rbigz
	stw	[rpolyptr]

	inc	rpolyptr
	loop
	inc	rpolyptr

;	mlbra	mclip3dexit

	ifeq	1		; debug print
	mtabxy	5,0
	lms	r0,[m_numfaces]
	mcall	mprintword
	nop

	mtabxy	0,0
	miwt	r3,m_polybuf
	move	r0,rnumpnts
	mcall	mprintn3
	nop
	endc



;************************************************

rx1	equr	1
ry1	equr	2
rz1	equr	3
rx2	equr	4
ry2	equr	5
rz2	equr	6
rcpolyptr	equr	7
rpolyptr	equr	8
rnumptsin	equr	9


; 3d clip poly

	move	rnumptsin,rnumpnts
	sub	r0
	sms	[m_cnt],r0

	miwt	rcpolyptr,m_polybuf
	miwt	rpolyptr,m_clippolybuf
;	miwt	rsp,m_stack

	from	rnumptsin
	sub	#2
	bne	mclip3dloop	; check for line
	nop

	to	rx1		; get p1
	mldwi	rcpolyptr
	to	ry1
	mldwi	rcpolyptr
	to	rz1
	mldwi	rcpolyptr

	to	rx2		; get p2
	mldwi	rcpolyptr
	to	ry2
	mldwi	rcpolyptr
	to	rz2
	ldw	[rcpolyptr]

	mcall	mclip3dline
	nop

	from	rx1
	mstwi	rpolyptr
	from	ry1
	mstwi	rpolyptr
	from	rz1
	mstwi	rpolyptr

	from	rx2
	mstwi	rpolyptr
	from	ry2
	mstwi	rpolyptr
	from	rz2
	mstwi	rpolyptr

	ibt	r0,#2
	sms	[m_cnt],r0

	mlbra	mprojectpoly



mclip3dloop
;	mlbra	mclip3dexit

	to	rx1		; get p1
	mldwi	rcpolyptr
	to	ry1
	mldwi	rcpolyptr
	to	rz1
	mldwi	rcpolyptr

	move	r0,rnumptsin	; if numptsin = 1 then wrap ptr
	dec	r0
	bne	.nowrap
	nop
	miwt	rcpolyptr,m_polybuf
.nowrap

	to	rx2		; get p2
	mldwi	rcpolyptr
	to	ry2
	mldwi	rcpolyptr
	to	rz2
	ldw	[rcpolyptr]

	with	rcpolyptr	; I forgot about this!
	sub	#4

	from	rz2
	and	rz1
	mlbmi	mclip3doff	; if z1<0  and z2<0  nextline

; if z1<0  and z2>=0 clip: addp1: nextline

	mtest	rz1
	mlbmi	.p1off

; addp1			; if z1>=0 and z2>=0 addp1: nextline

	from	rx1
	mstwi	rpolyptr
	from	ry1
	mstwi	rpolyptr
	from	rz1
	mstwi	rpolyptr

	lms	r0,[m_cnt]
	inc	r0
	sbk

; if z1>=0 and z2<0  addp1: clip: addp2: nextline

	mtest	rz2
	mlbpl	mclip3doff

	mcall	mclip3dline
	nop

; addp2

	from	rx2
	mstwi	rpolyptr
	from	ry2
	mstwi	rpolyptr
	from	rz2
	mstwi	rpolyptr
	
	lms	r0,[m_cnt]
	inc	r0
	sbk

	mlbra	mclip3doff

.p1off
	mcall	mclip3dline
	nop

; addp1

	from	rx1
	mstwi	rpolyptr
	from	ry1
	mstwi	rpolyptr
	from	rz1
	mstwi	rpolyptr

	lms	r0,[m_cnt]
	inc	r0
	sbk

mclip3doff
	dec	rnumptsin
	mlbne	mclip3dloop

	lms	r0,[m_cnt]
	sub	#3	
	mlbmi	mclip3dexit		; exit if <3 points left

;	mlbra	mclip3dexit


	ifeq	1			; debug print
	mtabxy	5,8
	lms	r0,[m_numfaces]
	mcall	mprintword
	nop

	mtabxy	0,8
	miwt	r3,m_clippolybuf
	lms	r0,[m_cnt]
	mcall	mprintn3
	nop
	endc




;************************************************


; project poly points



rx	equr	1
ry	equr	2
rz	equr	3
rrotptr	equr	7
rprojptr	equr	8
rnumpnts	equr	9

mprojectpoly
	lms	r0,[m_cnt]
	move	rnumpnts,r0

	sub	r0
	sms	[m_or_of_outcodes],r0

	miwt	rrotptr,m_clippolybuf
	miwt	rprojptr,m_polybuf

.projloop
	to	rx
	mldwi	rrotptr		; x
	to	ry
	mldwi	rrotptr		; y
	to	rz
	mldwi	rrotptr		; z

	mcall	mprojectpnt
	nop

	from	rx
	mstwi	rprojptr		; x
	from	ry
	mstwi	rprojptr		; y

	lms	rz,[m_or_of_outcodes]
	or	rz
	sbk

	dec	rnumpnts
	bne	.projloop
	nop


;	mtabxy	0,8
;	miwt	r3,m_polybuf
;	lms	r0,[m_cnt]
;	mcall	mprintn2
;	nop

     	ifeq	0
	lms	r0,[m_or_of_outcodes]
	miwt	r1,$0f00
	and	r1
	cmp	r1	
	mlbne	mclip3dexit		; skip if all clipped off one edge
	nop
	endc



;************************************************


; 2d clip poly

;	mlbra	mclip3dexit


	lms	r0,[m_cnt]
;	mlbra	mclp_poly	  	; draw clipped poly

	mpop	pc
	nop


mclip3dexit
	sub	r0
	mpop	pc
	nop




;************************************************


	ifeq	1


; clip a polygon whose verticies list is pointed
; at by a0. No. of points is
; passed in d0.


templist
	ds.w	maxpolypts*2
point_list
	ds.w	maxpolypts*2


newclip
;;	lea	point_list(pc),a0
	move.w	d0,d7

;************************************************

	move.w	d7,a5		;no. pnts.
	subq.w	#1,d7		;loop index.
	add.w	d0,d0
	add.w	d0,d0
	move.l	(a0),(a0,d0.w)	;copy 1st pnt to end of list.

	move.w	clipleft(a6),d6
	lea	templist(pc),a1
	lea	lrp(pc),a4
clplp1
	movem.w	(a0),d0-d3	;get 1st edge.
	addq.w	#4,a0		;move to next edge.
	move.w	d0,d5
	sub.w	d6,d5
	bmi	p1outleft
	move.w	d2,d5
	sub.w	d6,d5
	bmi	cliplinevertiadd	;add point if edge on way out.
	move.w	d0,(a1)+		;copy point to temp list.
	move.w	d1,(a1)+
lrp
	dbra	d7,clplp1

	lea	templist(pc),a0
	move.w	a5,d7
;	bmi	end_clip
	ble	end_clip

;************************************************

	move.w	a5,d0	
	subq.w	#1,d7		;loop index.
	add.w	d0,d0
	add.w	d0,d0
	move.l	(a0),(a0,d0.w)	;copy 1st pnt to end of list.

	move.w	cliprite(a6),d6
	lea	point_list(pc),a1
	lea	lrp2(pc),a4
clplp2
	movem.w	(a0),d0-d3	;get 1st edge.
	addq.w	#4,a0		;move to next edge.
	move.w	d0,d5
	sub.w	d6,d5
	bgt	p1outright
	move.w	d2,d5
	sub.w	d6,d5
	bgt	cliplinevertiadd
	move.w	d0,(a1)+		;copy point to temp list.
	move.w	d1,(a1)+
lrp2
	dbra	d7,clplp2

	lea	point_list(pc),a0
	move.w	a5,d7
;	bmi	end_clip
	ble	end_clip

;************************************************

	subq.w	#1,d7
	move.w	a5,d0
	add.w	d0,d0
	add.w	d0,d0
	move.l	(a0),(a0,d0.w)	;copy 1st pnt to end of list.

	move.w	clipup(a6),d6
	lea	templist(pc),a1
	lea	lrp3(pc),a4
clplp3
	movem.w	(a0),d0-d3	;get 1st edge.
	addq.w	#4,a0		;move to next edge.
	move.w	d1,d5
	sub.w	d6,d5
	bmi	p1outtop
	move.w	d3,d5
	sub.w	d6,d5
	bmi	cliplinehoriadd	;add point if edge on way out.
	move.w	d0,(a1)+		;copy point to temp list.
	move.w	d1,(a1)+
lrp3
	dbra	d7,clplp3	 

	lea	templist(pc),a0
	move.w	a5,d7
;	bmi	end_clip
	ble	end_clip

;************************************************

	subq.w	#1,d7
	move.w	a5,d0
	add.w	d0,d0
	add.w	d0,d0
	move.l	(a0),(a0,d0.w)	;copy 1st pnt to end of list.

	move.w	clipdown(a6),d6
	lea	point_list(pc),a1
	lea	lrp4(pc),a4
clplp4
	movem.w	(a0),d0-d3	;get 1st edge.
	addq.w	#4,a0		;move to next edge.
	move.w	d1,d5
	sub.w	d6,d5
	bgt	p1outbottom
	move.w	d3,d5
	sub.w	d6,d5
	bgt	cliplinehoriadd	;add point if edge on way out.
	move.w	d0,(a1)+		;copy point to temp list.
	move.w	d1,(a1)+
lrp4
	dbra	d7,clplp4


	move.w	#-1,(a1)
end_clip
	rts


;************************************************

p1outleft
	move.w	d2,d5
	sub.w	d6,d5
	bpl	cliplineverti	;add point if edge on way in.
	subq.w	#1,a5		;decrement no. pnts.
	jmp	(a4)

;************************************************

p1outtop
	move.w	d3,d5
	sub.w	d6,d5
	bpl	cliplinehori			
	subq.w	#1,a5		;decrement no. pnts.
	jmp	(a4)

;************************************************

p1outright
	move.w	d2,d5
	sub.w	d6,d5
	bmi	cliplineverti	
	subq.w	#1,a5		;decrement no. pnts.
	jmp	(a4)

;************************************************

p1outbottom
	move.w	d3,d5
	sub.w	d6,d5
	bmi	cliplinehori			
	subq.w	#1,a5		;decrement no. pnts.
	jmp	(a4)

;************************************************

cliplinevertiadd		;called if p1 in and p2 out.
	addq.w	#1,a5
	move.w	d0,(a1)+
	move.w	d1,(a1)+

; x = clipx
; y = y1 + (clipx-x1)*(y1-y2)/(x1-x2)


; x = clipx
; y = y1 + (clipx-x1)*(y2-y1)/(x2-x1)

cliplineverti	
	sub.w	d0,d2		;dx = x2 - x1
	sub.w	d1,d3		;dy = y2 - y1
	move.w	d6,d5		;get boundry value.
	sub.w	d0,d5		;x = clipx - x1
	muls	d3,d5		;x*dy
	divs	d2,d5		;x*dy/dx
	add.w	d1,d5		;x*dy/dx+y1
	move.w	d6,(a1)+	;store clipped point.
	move.w	d5,(a1)+
	jmp	(a4)

;************************************************
	
; x  = x1 + (clipy-y1)*(x2-x1)/(y2-y1)
; y  = clipy

cliplinehoriadd
	addq.w	#1,a5
	move.w	d0,(a1)+
	move.w	d1,(a1)+

cliplinehori
	sub.w	d0,d2		;dx = x2 - x1
	sub.w	d1,d3		;dy = y2 - y1
	move.w	d6,d5		;
	sub.w	d1,d5		; y = clipy - y1
	muls	d2,d5		; y*dx
	divs	d3,d5		; y*dx/dy
	add.w	d0,d5		; y*dx/dy+x1
	move.w	d5,(a1)+
	move.w	d6,(a1)+
	jmp	(a4)

	endc

;************************************************


; 2d clip texture map poly


	ifeq	0

rx1	equr	1
ry1	equr	2
rx2	equr	3
ry2	equr	6
rinptr	equr	8
routptr	equr	9

mtxcopyxp1yp1	macro
	with	rinptr		; ptr to last xp,yp
	sub	#4
	mldwi	rinptr	; copy xp,yp to outptr
	mstwi	routptr
	mldwi	rinptr
	mstwi	routptr
	endm	


; x  = x1 + (clipy-y1)*(x2-x1)/(y2-y1)
; y  = clipy
; xp = xp1 + (clipy-y1)*(xp2-xp1)/(y2-y1)
; yp = yp1 + (clipy-y1)*(yp2-yp1)/(y2-y1)

mtxcliphori	macro
	with	rx2   		; dx = x2 - x1
	sub	rx1
	with	ry2		; dy = y2 - y1
	sub	ry1
	mexg	rx2,ry2,r0	; swap dx,dy

	lms	r0,[\1]		; r0 = \1 - y1
	sub	ry1
	sms	[m_clipdx],r0

	to	r5
	lmult			; r5:r4 = r0 * dx
	move	r6,rx2		; r6 = dy

	mcall	mdivs3216	; r4 = r5:r4 / r6 uses r7,r12,r13
	nop

	from	r4		; r0 = r4 + x1
	add	rx1
	lms	r6,[\1]
	mstwi	routptr	; out x = r0	
	from	r6
	mstwi	routptr	; out y = \1

	with	rinptr
	add	#4
	to	ry2
	ldw	[rinptr]	; xp2

	with	rinptr
	sub	#8
	to	ry1
	mldwi	rinptr	; xp1

	with	ry2
	sub	ry1		; r6 = xp2 - xp1

	lms	r0,[m_clipdx]	; r0 = \1 - y1
	to	r5
	lmult			; r5:r4 = r0 * dxp
	move	r6,rx2		; r6 = dy

	mcall	mdivs3216	; r4 = r5:r4 / r6 uses r7,r12,r13
	nop

	from	r4		; r0 = r4 + xp1
	add	ry1
	mstwi	routptr	; out xp

	to	ry1
	ldw	[rinptr]

	with	rinptr
	add	#8
	to	ry2
	ldw	[rinptr]
	with	rinptr
	sub	#6

	with	ry2
	sub	ry1		; r6 = yp2 - yp1

	lms	r0,[m_clipdx]	; r0 = \1 - y1
	to	r5
	lmult			; r5:r4 = r0 * dyp
	move	r6,rx2		; r6 =dy

	mcall	mdivs3216	; r4 = r5:r4 / r6 uses r7,r12,r13
	nop

	from	r4		; r0 = r4 + yp1
	add	ry1
	mstwi	routptr	; out yp

;	mtxcopyxp1yp1

	endm

; x  = clipx
; y  = y1 + (clipx-x1)*(y2-y1)/(x2-x1)
; xp = xp1 + (clipx-x1)*(xp2-xp1)/(x2-x1)
; yp = yp1 + (clipx-x1)*(yp2-yp1)/(x2-x1)

mtxclipverti	macro
	with	rx2   		; dx = x2 - x1
	sub	rx1
	with	ry2		; dy = y2 - y1
	sub	ry1
	lms	r0,[\1]		; r0 = \1 - x1
	sub	rx1
	to	r5
	lmult			; r5:r4 = r0 * dy
	move	r6,rx2

	mcall	mdivs3216	; r4 = r5:r4 / r6 uses r7,r12,r13
	nop

	from	r4		; r0 = r4 + y1
	add	ry1
	lms	r6,[\1]
	from	r6
	mstwi	routptr	; out x = \1	
	mstwi	routptr	; out y = r0

	with	rinptr
	add	#4
	to	ry2
	ldw	[rinptr]	; xp2

	with	rinptr
	sub	#8
	to	ry1
	mldwi	rinptr	; xp1

	with	ry2
	sub	ry1

	lms	r0,[\1]		; r0 = \1 - x1
	sub	rx1
	to	r5
	lmult			; r5:r4 = r0 * dy
	move	r6,rx2

	mcall	mdivs3216	; r4 = r5:r4 / r6 uses r7,r12,r13
	nop

	from	r4		; r0 = r4 + y1
	add	ry1
	mstwi	routptr	; out xp

	to	ry1
	ldw	[rinptr]

	with	rinptr
	add	#8
	to	ry2
	ldw	[rinptr]
	with	rinptr
	sub	#6

	with	ry2
	sub	ry1

	lms	r0,[\1]		; r0 = \1 - x1
	sub	rx1
	to	r5
	lmult			; r5:r4 = r0 * dy
	move	r6,rx2

	mcall	mdivs3216	; r4 = r5:r4 / r6 uses r7,r12,r13
	nop

	from	r4		; r0 = r4 + y1
	add	ry1
	mstwi	routptr	; out yp

;	mtxcopyxp1yp1

	endm

mtxcopytolast	macro
	to	rx1
	mldwi	rinptr
	to	ry1
	mldwi	rinptr

	to	rx2
	mldwi	rinptr
	to	ry2
	ldw	[rinptr]
		
	with	rinptr
	sub	#6
	lms	r0,[m_cnt]
	mult	#8
	add	rinptr

	from	rx1
	mstwi	r0	; out x1
	from	ry1
	mstwi	r0	; out y1

	from	rx2
	mstwi	r0	; out xp1
	from	ry2
	stw	[r0]	; out yp1
	endm

mtxinx1y1x2y2	macro
	to	rx1		; load x1,y1
	mldwi	rinptr
	to	ry1
	mldwi	rinptr
	with	rinptr		; skip xp1,yp1
	add	#4
	to	rx2
	mldwi	rinptr	; load x2,y2
	to	ry2
	ldw	[rinptr]
	with	rinptr		; point at x2,y2
	sub	#2
	endm

mtxoutx1y1	macro
	from	rx1
	mstwi	routptr	; out x1
	from	ry1
	mstwi	routptr	; out y1

	mtxcopyxp1yp1
	endm

;************************************************


mtxclippoly2d
	mpush	r11
	ibt	r1,#3
	cmp	r1
	mlbmi	mtxclippoly2dexit	; skip lines

	sms	[m_clippnts],r0

;	mlbra	mtxclippolynorm

	ifeq	0
mtxclip2d_left
	sms	[m_cnt],r0

	miwt	rinptr,m_polybuf
	miwt	routptr,m_clippolybuf
	mtxcopytolast

	ifne	mario_stats3d
	mincm	m_polys_clip2d
	endc

.3
	mtxinx1y1x2y2
	lms	r0,[m_xleft]
	from	rx1
	sub	r0
	mlbge	.2

	lms	r0,[m_xleft]
	from	rx2
	sub	r0
	mlbge	.5

	mdecm	m_clippnts
	mlbra	.1
.2
	lms	r0,[m_xleft]
	from	rx2
	sub	r0
	mlbge	.4

	mincm	m_clippnts
	mtxoutx1y1
.5
	mtxclipverti	m_xleft
	mlbra	.1
.4
	mtxoutx1y1
.1
	mdecm	m_cnt
	mlbne	.3

	lms	r0,[m_clippnts]
	sub	#3
	mlbmi	mtxclippoly2dexit
	add	#3


;************************************************

mtxclip2d_right
	sms	[m_cnt],r0
	miwt	rinptr,m_clippolybuf
	miwt	routptr,m_polybuf
	mtxcopytolast
.3
  	mtxinx1y1x2y2
	lms	r0,[m_xright]
	from	rx1
	sub	r0
	sub	#1
	mlblt	.2

	lms	r0,[m_xright]
	from	rx2
	sub	r0
	sub	#1
	mlblt	.5

	mdecm	m_clippnts
	mlbra	.1
.2
	lms	r0,[m_xright]
	from	rx2
	sub	r0
	sub	#1
	mlblt	.4

	mincm	m_clippnts
	mtxoutx1y1
.5
	mtxclipverti	m_xright
	mlbra	.1
.4
	mtxoutx1y1
.1
	mdecm	m_cnt
	mlbne	.3

	lms	r0,[m_clippnts]
	sub	#3
	mlbmi	mtxclippoly2dexit
	add	#3

	endc

;************************************************

mtxclip2d_top
	sms	[m_cnt],r0
	miwt	rinptr,m_polybuf
	miwt	routptr,m_clippolybuf
	mtxcopytolast
.3
	mtxinx1y1x2y2
	lms	r0,[m_ytop]
	from	ry1
	sub	r0
	mlbge	.2

	lms	r0,[m_ytop]
	from	ry2
	sub	r0
	mlbge	.5

	mdecm	m_clippnts
	mlbra	.1
.2
	lms	r0,[m_ytop]
	from	ry2
	sub	r0
	mlbge	.4

	mincm	m_clippnts
	mtxoutx1y1
.5
	mtxcliphori	m_ytop
	mlbra	.1
.4
	mtxoutx1y1
.1
	mdecm	m_cnt
	mlbne	.3

	lms	r0,[m_clippnts]
	sub	#3
	mlbmi	mtxclippoly2dexit
	add	#3

;************************************************

mtxclip2d_bot
	sms	[m_cnt],r0
	miwt	rinptr,m_clippolybuf
	miwt	routptr,m_polybuf
	mtxcopytolast
.3
  	mtxinx1y1x2y2
	lms	r0,[m_ybot]
	from	ry1
	sub	r0
	sub	#1
	mlblt	.2

	lms	r0,[m_ybot]
	from	ry2
	sub	r0
	sub	#1
	mlblt	.5

	mdecm	m_clippnts
	mlbra	.1
.2
	lms	r0,[m_ybot]
	from	ry2
	sub	r0
	sub	#1
	mlblt	.4

	mincm	m_clippnts
	mtxoutx1y1
.5
	mtxcliphori	m_ybot
	mlbra	.1
.4
	mtxoutx1y1
.1
	mdecm	m_cnt
	mlbne	.3

	lms	r0,[m_clippnts]
	sub	#3
	mlbmi	mtxclippoly2dexit
	add	#3



	ifeq	1

	move	r12,r0

	sub	r0
	sms	[m_texturemap],r0	; make normal poly

	miwt	rinptr,m_polybuf
	miwt	routptr,m_polybuf
	
	move	r13,pc

	mldwi	rinptr	; copy x,y
	mstwi	routptr
	mldwi	rinptr
	mstwi	routptr

	with	rinptr		; skip xp,yp
	add	#4

	loop
	nop

	lms	r0,[m_clippnts]
	endc


	ifeq	1
mtxclippolynorm
	move	r12,r0

	sub	r0
	sms	[m_texturemap],r0	; make normal poly

	miwt	rinptr,m_polybuf
	miwt	routptr,m_clippolybuf
	
	move	r13,pc

	mldwi	rinptr	; copy x,y
	mstwi	routptr
	mldwi	rinptr
	mstwi	routptr

	with	rinptr		; skip xp,yp
	add	#4

	loop
	nop



	lms	r0,[m_clippnts]
	move	r12,r0

	miwt	rinptr,m_clippolybuf
	miwt	routptr,m_polybuf
	
	move	r13,pc

	mldwi	rinptr	; copy x,y
	mstwi	routptr
	mldwi	rinptr
	mstwi	routptr

	loop
	nop

	lms	r0,[m_clippnts]
	endc


; exit

	mpop	pc
	nop


mtxclippoly2dexit
	sub	r0

	mpop	pc
	nop

	endc

;************************************************

; 2d clip poly


	ifeq	0

rx1	equr	1
ry1	equr	2
rx2	equr	3
ry2	equr	6
rinptr	equr	8
routptr	equr	9

mcliphori	macro
	with	rx2   		; dx = x2 - x1
	sub	rx1
	with	ry2		; dy = y2 - y1
	sub	ry1
	mexg	rx2,ry2,r0	; swap dx,dy
	lms	r0,[\1]		; r0 = \1 - y1
	sub	ry1
	to	r5
	lmult			; r5:r4 = r0 * dx
	move	r6,rx2

	mcall	mdivs3216	; r4 = r5:r4 / r6 uses r7,r12,r13
	nop

	from	r4		; r0 = r4 + x1
	add	rx1
	lms	r6,[\1]
	mstwi	routptr	; out x = r0	
	from	r6
	mstwi	routptr	; out y = \1
	endm

mcliphori2	macro
	mexg	rx1,rx2,r0
	mexg	ry1,ry2,r0
	with	rx2   		; dx = x1 - x2
	sub	rx1
;	mneg	rx2
	with	ry2		; dy = y1 - y2
	sub	ry1
;	mneg	ry2
	mexg	rx2,ry2,r0	; swap dx,dy
	lms	r0,[\1]		; r0 = \1 - y1
	sub	ry1
	to	r5
	lmult			; r5:r4 = r0 * dx
	move	r6,rx2

	mcall	mdivs3216	; r4 = r5:r4 / r6 uses r7,r12,r13
	nop

	from	r4		; r0 = r4 + x1
	add	rx1
	lms	r6,[\1]
	mstwi	routptr	; out x = r0	
	from	r6
	mstwi	routptr	; out y = \1
	endm

; x = clipx
; y = y1 + (clipx-x1)*(y2-y1)/(x2-x1)

mclipverti	macro
	with	rx2   		; dx = x2 - x1
	sub	rx1
	with	ry2		; dy = y2 - y1
	sub	ry1
	lms	r0,[\1]		; r0 = \1 - x1
	sub	rx1
	to	r5
	lmult			; r5:r4 = r0 * dy
	move	r6,rx2

	mcall	mdivs3216	; r4 = r5:r4 / r6 uses r7,r12,r13
	nop

	from	r4		; r0 = r4 + y1
	add	ry1
	lms	r6,[\1]
	from	r6
	mstwi	routptr	; out x = \1	
	mstwi	routptr	; out y = r0
	endm

; x = clipx
; y = y1 + (clipx-x1)*(y1-y2)/(x1-x2)

mclipverti2	macro
	mexg	rx1,rx2,r0
	mexg	ry1,ry2,r0
	with	rx2   		; dx = x1 - x2
	sub	rx1
;	mneg	rx2
	with	ry2		; dy = y1 - y2
	sub	ry1
;	mneg	ry2
	lms	r0,[\1]		; r0 = \1 - x1
	sub	rx1
	to	r5
	lmult			; r5:r4 = r0 * dy
	move	r6,rx2

	mcall	mdivs3216	; r4 = r5:r4 / r6 uses r7,r12,r13
	nop

	from	r4		; r0 = r4 + y1
	add	ry1
	lms	r6,[\1]
	from	r6
	mstwi	routptr	; out x = \1	
	mstwi	routptr	; out y = r0
	endm


mcopytolast	macro
	to	rx1
	mldwi	rinptr
	to	ry1
	ldw	[rinptr]
	with	rinptr
	sub	#2
	lms	r0,[m_cnt]
	mult	#4
	add	rinptr
	from	rx1
	mstwi	r0	; out x1
	from	ry1
	stw	[r0]	; out y1
	endm

minx1y1x2y2	macro
	to	rx1
	mldwi	rinptr
	to	ry1
	mldwi	rinptr
	to	rx2
	mldwi	rinptr
	to	ry2
	ldw	[rinptr]
	with	rinptr
	sub	#2
	endm

moutx1y1	macro
	from	rx1
	mstwi	routptr	; out x1
	from	ry1
	mstwi	routptr	; out y1
	endm




;**************************************************************************
; dylan.11/3/92 an extremely quick hack into the clipper to cope with lines

mtclipline2d
	sms	[m_clippnts],r0

mtlclip2d_left
	sms	[m_cnt],r0
	miwt	rinptr,m_polybuf
	miwt	routptr,m_clippolybuf
	mcopytolast
.3
	minx1y1x2y2
	lms	r0,[m_xleft]
	from	rx1
	sub	r0
	mlbge	.2

	lms	r0,[m_xleft]
	from	rx2
	sub	r0
	mlbge	.5

	mdecm	m_clippnts
	mlbra	.1
.2
	lms	r0,[m_xleft]
	from	rx2
	sub	r0
	mlbge	.4

	mincm	m_clippnts
	moutx1y1
.5
	mclipverti	m_xleft
	mlbra	.1
.4
	moutx1y1
.1
	mdecm	m_cnt
	mlbne	.3

	lms	r0,[m_clippnts]
	sub	#2
	mlbmi	mtclippoly2dexit
	add	#2


;************************************************

mtlclip2d_right
	sms	[m_cnt],r0
	miwt	rinptr,m_clippolybuf
	miwt	routptr,m_polybuf
	mcopytolast
.3
  	minx1y1x2y2
	lms	r0,[m_xright]
	from	rx1
	sub	r0
	sub	#1
	mlblt	.2

	lms	r0,[m_xright]
	from	rx2
	sub	r0
	sub	#1
	mlblt	.5

	mdecm	m_clippnts
	mlbra	.1
.2
	lms	r0,[m_xright]
	from	rx2
	sub	r0
	sub	#1
	mlblt	.4

	mincm	m_clippnts
	moutx1y1
.5
	mclipverti	m_xright
	mlbra	.1
.4
	moutx1y1
.1
	mdecm	m_cnt
	mlbne	.3

	lms	r0,[m_clippnts]
	sub	#2
	mlbmi	mtclippoly2dexit
	add	#2


;************************************************

mtlclip2d_top
	sms	[m_cnt],r0
	miwt	rinptr,m_polybuf
	miwt	routptr,m_clippolybuf
	mcopytolast
.3
	minx1y1x2y2
	lms	r0,[m_ytop]
	from	ry1
	sub	r0
	mlbge	.2

	lms	r0,[m_ytop]
	from	ry2
	sub	r0
	mlbge	.5

	mdecm	m_clippnts
	mlbra	.1
.2
	lms	r0,[m_ytop]
	from	ry2
	sub	r0
	mlbge	.4

	mincm	m_clippnts
	moutx1y1
.5
	mcliphori	m_ytop
	mlbra	.1
.4
	moutx1y1
.1
	mdecm	m_cnt
	mlbne	.3

	lms	r0,[m_clippnts]
	sub	#2
	mlbmi	mtclippoly2dexit
	add	#2

;************************************************

mtlclip2d_bot
	sms	[m_cnt],r0
	miwt	rinptr,m_clippolybuf
	miwt	routptr,m_polybuf
	mcopytolast
.3
  	minx1y1x2y2
	lms	r0,[m_ybot]
	from	ry1
	sub	r0
	sub	#1
	mlblt	.2

	lms	r0,[m_ybot]
	from	ry2
	sub	r0
	sub	#1
	mlblt	.5

	mdecm	m_clippnts
	mlbra	.1
.2
	lms	r0,[m_ybot]
	from	ry2
	sub	r0
	sub	#1
	mlblt	.4

	mincm	m_clippnts
	moutx1y1
.5
	mcliphori	m_ybot
	mlbra	.1
.4
	moutx1y1
.1
	mdecm	m_cnt
	mlbne	.3

	lms	r0,[m_clippnts]
	sub	#2
	mlbmi	mtclippoly2dexit
	add	#2

	ibt	r0,#2

	mpop	pc
	nop

; end of hack
;************************************************


mtclippoly2d
	mpush	r11
	ibt	r1,#3
	cmp	r1
	mlbmi	mtclipline2d	;mtclippoly2dexit	; skip lines


	sms	[m_clippnts],r0

	ifeq	0
mtclip2d_left
	sms	[m_cnt],r0
	miwt	rinptr,m_polybuf
	miwt	routptr,m_clippolybuf
	mcopytolast

	ifne	mario_stats3d
	mincm	m_polys_clip2d
	endc

.3
	minx1y1x2y2
	lms	r0,[m_xleft]
	from	rx1
	sub	r0
	mlbge	.2

	lms	r0,[m_xleft]
	from	rx2
	sub	r0
;	mlbge	.5
	mlblt	.51

	mclipverti2	m_xleft
	mlbra	.1

.51
	mdecm	m_clippnts
	mlbra	.1
.2
	lms	r0,[m_xleft]
	from	rx2
	sub	r0
	mlbge	.4

	mincm	m_clippnts
	moutx1y1
.5
	mclipverti	m_xleft
	mlbra	.1
.4
	moutx1y1
.1
	mdecm	m_cnt
	mlbne	.3

	lms	r0,[m_clippnts]
	sub	#3
	mlbmi	mtclippoly2dexit
	add	#3


;************************************************

mtclip2d_right
	sms	[m_cnt],r0
	miwt	rinptr,m_clippolybuf
	miwt	routptr,m_polybuf
	mcopytolast
.3
  	minx1y1x2y2
	lms	r0,[m_xright]
	from	rx1
	sub	r0
	sub	#1
	mlblt	.2

	lms	r0,[m_xright]
	from	rx2
	sub	r0
	sub	#1
;	mlblt	.5
	mlbge	.51

	mclipverti2	m_xright
	mlbra	.1

.51
	
	mdecm	m_clippnts
	mlbra	.1
.2
	lms	r0,[m_xright]
	from	rx2
	sub	r0
	sub	#1
	mlblt	.4

	mincm	m_clippnts
	moutx1y1
.5
	mclipverti	m_xright
	mlbra	.1
.4
	moutx1y1
.1
	mdecm	m_cnt
	mlbne	.3

	lms	r0,[m_clippnts]
	sub	#3
	mlbmi	mtclippoly2dexit
	add	#3

	endc

;************************************************

mtclip2d_top
	sms	[m_cnt],r0
	miwt	rinptr,m_polybuf
	miwt	routptr,m_clippolybuf
	mcopytolast
.3
	minx1y1x2y2
	lms	r0,[m_ytop]
	from	ry1
	sub	r0
	mlbge	.2

	lms	r0,[m_ytop]
	from	ry2
	sub	r0
	mlbge	.5

	mdecm	m_clippnts
	mlbra	.1
.2
	lms	r0,[m_ytop]
	from	ry2
	sub	r0
	mlbge	.4

	mincm	m_clippnts
	moutx1y1
.5
	mcliphori	m_ytop
	mlbra	.1
.4
	moutx1y1
.1
	mdecm	m_cnt
	mlbne	.3

	lms	r0,[m_clippnts]
	sub	#3
	mlbmi	mtclippoly2dexit
	add	#3

;************************************************

mtclip2d_bot
	sms	[m_cnt],r0
	miwt	rinptr,m_clippolybuf
	miwt	routptr,m_polybuf
	mcopytolast
.3
  	minx1y1x2y2
	lms	r0,[m_ybot]
	from	ry1
	sub	r0
	sub	#1
	mlblt	.2

	lms	r0,[m_ybot]
	from	ry2
	sub	r0
	sub	#1
	mlblt	.5

	mdecm	m_clippnts
	mlbra	.1
.2
	lms	r0,[m_ybot]
	from	ry2
	sub	r0
	sub	#1
	mlblt	.4

	mincm	m_clippnts
	moutx1y1
.5
	mcliphori	m_ybot
	mlbra	.1
.4
	moutx1y1
.1
	mdecm	m_cnt
	mlbne	.3

	lms	r0,[m_clippnts]
	sub	#3
	mlbmi	mtclippoly2dexit
	add	#3


	mpop	pc
	nop


mtclippoly2dexit
	sub	r0

	mpop	pc
	nop


	endc


;************************************************

	ifeq	1
mprintn3
	move	r8,r11

	move	r12,r0
	mcall	mprintword
	nop
	mcall	mprintnewline
	nop

	move	r13,pc

	mldwi	r3
	mcall	mprintword
	nop
	mcall	mprintspace
	nop
	mldwi	r3
	mcall	mprintword
	nop
	mcall	mprintspace
	nop
	mldwi	r3
	mcall	mprintword
	nop
	mcall	mprintnewline
	nop

	loop
	nop

	jmp	r8
	nop





mprintn2
	move	r8,r11

	move	r12,r0
	mcall	mprintword
	nop
	mcall	mprintnewline
	nop

	move	r13,pc

	mldwi	r3
	mcall	mprintword
	nop
	mcall	mprintspace
	nop
	mldwi	r3
	mcall	mprintword
	nop
	mcall	mprintnewline
	nop

	loop
	nop

	jmp	r8
	nop


	endc
