



rcosx	equr	8
rsinx	equr	12
rcosy	equr	3
rsiny	equr	4
rcosz	equr	5
rsinz	equr	7
rmatptr	equr	9
rt1	equr	1
rt2	equr	2
rt3	equr	13
rt4	equr	14

; t1= cz*sy 		 yz
; t2= cz*cy 		 yz
; t3= sz*sy		 yz
; t4= sz*cy		 yz
; m11= t3*sx + t2	xyz
; m12= t1*sx - t4	xyz
;>m13= cx*sy		xy
; m21= cx*sz		x z
; m22= cx*cz		x z
;>m23= -sx		x
; m31= t4*sx - t1	xyz
; m32= t2*sx + t3	xyz
;>m33= cx*cy		xy


; create full 16 bit world zxy matrix
; in:	m_rotx,y,z	(16 bit angles)
; out:	m_wmat

mcrotwmatzxy16
	miwt	r9,m_wmat11
	mcall	mcrotmatzxy16
	nop

	stop
	nop


; create full 16 bit world zxy matrix
; in:	m_rotx,y,z	(16 bit angles)
;	r9 = matrix ptr
; out:	
	
mcrotmatzxy16
	sub	r0
	ramb
	romb

	lms	r1,[m_rotx]
	mgetsin16	rsinx,r1,r2
	mgetcos16	rcosx,r1,r2

	lms	r1,[m_roty]
	mgetsin16	rsiny,r1,r2
	mgetcos16	rcosy,r1,r2

	lms	r1,[m_rotz]
	mgetsin16	rsinz,r1,r2
	mgetcos16	rcosz,r1,r2

; calc temps
; t1= cz*sy 		 yz
; t2= cz*cy 		 yz
; t3= sz*sy		 yz
; t4= sz*cy		 yz

	move	r6,rcosz

	from	rsiny
	fmult
	to	rt1
	rol

	from	rcosy
	fmult
	to	rt2
	rol

	move	r6,rsinz

	from	rsiny
	fmult
	to	rt3
	rol

	from	rcosy
	fmult
	to	rt4
	rol

; m11= t3*sx + t2	xyz
; m12= t1*sx - t4	xyz
;>m13= cx*sy		xy

	move	r6,rsinx

	from	rt3
	fmult
	rol
	add	rt2

	mstwi	rmatptr	; mat11

	from	rt1
	fmult
	rol
	sub	rt4

	mstwi	rmatptr	; mat12

	move	r6,rcosx

	from	rsiny
	fmult
	rol

	mstwi	rmatptr	; mat13

; m21= cx*sz		x z
; m22= cx*cz		x z
;>m23= -sx		x

	from	rsinz
	fmult
	rol

	mstwi	rmatptr	; mat21

	from	rcosz
	fmult
	rol

	mstwi	rmatptr	; mat22

	from	rsinx
	not
	inc	r0

	mstwi	rmatptr	; mat23

; m31= t4*sx - t1	xyz
; m32= t2*sx + t3	xyz
;>m33= cx*cy		xy

	move	r6,rsinx

	from	rt4
	fmult
	rol
	sub	rt1

	mstwi	rmatptr	; mat31

	from	rt2
	fmult
	rol
	add	rt3

	mstwi	rmatptr	; mat32

	move	r6,rcosx

	from	rcosy
	fmult
	rol

	stw	[rmatptr]	; mat33

	jmp	r11
	nop









