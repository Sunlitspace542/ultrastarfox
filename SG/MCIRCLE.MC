m_circlebuf	equ	m_drawlist		;m_scuptab
m_circlebuf2	equ	m_drawlist+224*2	;m_scuptab+224*2

madd2buf	macro
  	iwt	r0,#240
	cmp	ry
	bcc	.dontplot\@
	nop
	from	rbufbase
	add	ry		;r0=rbufbase+(ry*2)
	add	ry
	from	rx
	stw	[r0]
.dontplot\@
	endm


mplot8xy	macro
	from	rxc
	to	rx
	add	rxp
	from	ryc
	to	ry
	add	ryp
	madd2buf

	from	rxc
	to	rx
	add	rxp
	from	ryc
	to	ry
	sub	ryp
	madd2buf

	from	rxc
	to	rx
	add	ryp
	from	ryc
	to	ry
	add	rxp
	madd2buf

	from	rxc
	to	rx
	add	ryp
	from	ryc
	to	ry
	sub	rxp
	madd2buf
	endm


rx	equr	1
ry	equr	2
rxp	equr	3
ryp	equr	4
rxc	equr	5
ryc	equr	6
ru	equr	7
rv	equr	8
re	equr	9
rrad	equr	13

rbufptr	equr	10
rbufbase	equr	12

mcalc_circle
	miwt	rbufptr,m_circlebuf	;clear buffer
	miwt	r12,224
	sub	r0
	move	r13,r15
	mcache
ploppy
	stw	[rbufptr]
	inc	rbufptr
	loop
	inc	rbufptr

	lms	rrad,[m_rotx]
	lms	rxc,[m_bigx]
	lms	ryc,[m_bigy]
	miwt	rbufbase,m_circlebuf

	ibt	rxp,#0
	move	ryp,rrad

	ibt	re,#1
	with	re
	sub	ryp		; e = 1 - y

	ibt	ru,#1
	with	ru
	add	rxp
	with	ru
	add	rxp		; u = 1 + 2x

	from	re
	to	rv
	sub	ryp		; v = 1 + 2x - 2y

; circle draw loop
	mcache
mcir1
	from	rxp
	sub	ryp

	mlbpl	mcir2

	mplot8xy

	inc	rxp
	inc	ru
	inc	ru
	inc	rv
	inc	rv

	moves	re,re

	bpl	.1
	nop
	with	re
	add	ru
	miwt	pc,mcir1+1
	from	rxp
.1
	inc	rv
	inc	rv
	with	re
	add	rv
	miwt	pc,mcir1
	dec	ryp
mcir2
	mplot8xy



;------ clipping
	miwt	r1,m_circlebuf
	miwt	r2,m_circlebuf
	miwt	r5,m_circlebuf2
	iwt	r12,#224
	move	r13,r15

	to	r6		;r6=left edge
	ldw	[r1]
	inc	r1
	inc	r1

	lms	r3,[m_bigx]
	from	r3
	to	r4
	sub	r6
	from	r4
	to	r7		;r7=right edge
	add	r3

rleft	equr	7
rright	equr	6

	iwt	r4,#240		;if left>240 then off screen
	with	rleft
	cmp	r4
	bpl	.offscreen
	nop

	iwt	r4,#16		;if right<16 then off screen
	with	rright
	cmp	r4
	bmi	.offscreen
	nop


	iwt	r4,#16		;if left<16 then left=16
	with	rleft
	cmp	r4
	bpl	.leftok
	nop
	iwt	rleft,#16
.leftok
	iwt	r4,#240		;if right>240 then right=240
	with	rright
	cmp	r4
	bmi	.rightok
	nop
	iwt	rright,#240
.rightok

	from	r6		;store left edge
	stb	[r2]
	inc	r2
	inc	r2
	from	r7
	stb	[r5]		;store right edge
	inc	r5
	inc	r5

	loop
	nop

	stop
	nop


.offscreen
	iwt	r0,#100
	stb	[r2]
	inc	r2
	inc	r2
	iwt	r0,#200
	stb	[r5]
	inc	r5
	inc	r5
	loop
	nop
	stop
	nop


