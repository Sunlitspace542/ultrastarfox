;********************************************************************************
; Bum wipe window wiper.

m_winwbglog	equ	m_bigx
m_wintabptr	equ	m_bigy

m_winbuf	equ	m_circlebuf
m_winbuf2	equ	m_circlebuf2

maddtowinbuf	macro
	from	rbufbase
	to	rbufptr
	add	r2		;r0=rbufbase+(ry*2)
	with	rbufptr
	add	r2
	from	r1
	stw	[rbufptr]
	endm

rx1	equr	r1
ry1	equr	r2
rx2	equr	r3
ry2	equr	r4
rxi	equr	r5
ryi	equr	r6
rbufbase equr	r7
rbufptr	equr	r8
rcnt	equr	r12

mbumwipe
	sub	r0
	ramb
	cmode
	ibt	r0,#mwinbase>>16
	romb

	lm	r14,[m_wintabptr]
	getb
	inc	r14
	sm	[m_winwbglog],r0

	mcache
.lp
	to	rx1
	getb
	inc	r14
	iwt	r0,#255
	cmp	r1
	beq	.end
	nop

	to	ry1
	getb
	inc	r14

	to	rx2
	getb
	inc	r14

	to	ry2
	getb
	inc	r14

	to	rbufbase
	getb
	inc	r14
	moves	rbufbase,rbufbase
	beq	.buf0
	iwt	rbufbase,#m_winbuf2&WM
	bra	.doneb
	nop
.buf0	dw	m_winbuf
.doneb
	call	mwindrawline
	nop

	bra	.lp
	nop
.end
	sm	[m_wintabptr],r14

	getb
	inc	r14
	getbh
	iwt	r1,#-1
	cmp	r1
	bne	.note
	nop
	iwt	r0,#1
	sm	[m_wintabptr],r0
.note
	call	mwinswplst
	nop

	stop
	nop


mwindrawline
	ibt	rxi,#16
	with	rx1
	add	rxi
	with	rx2
	add	rxi

	add	rxi
	ibt	rxi,#1
	with	rx2
	sub	rx1
	bpl	.1
	nop
	ibt	rxi,#-1
	mneg	rx2
.1	ibt	ryi,#1
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
	move	r13,pc

	maddtowinbuf
	sub	ry2
	bcs	.5
	nop
	add	rx2
	with	ry1
	add	ryi
.5	with	rx1
	add	rxi
	loop
	nop
	jmp	r11
	nop

.largery
	move	rcnt,ry2
	inc	rcnt
	mneg	r0
	lsr
	mcache
	move	r13,pc

	maddtowinbuf
	sub	rx2
	bcs	.6
	nop
	add	ry2
	with	rx1
	add	rxi
.6	with	ry1
	add	ryi
	loop
	nop
	jmp	r11
	nop

mwinswplst
	iwt	r1,#m_winbuf&WM
	iwt	r2,#m_winbuf2&WM
	iwt	r12,#224
	mcache
	move	r13,r15

	ldw	[r1]
	to	r3
	ldw	[r2]

	cmp	r3
	beq	.dec
	nop
	bpl	.noswp
	nop
	stw	[r2]
	from	r3
	stw	[r1]
	bra	.noswp
	nop
.dec	dec	r0
	stw	[r1]
	from	r3
	stw	[r2]
.noswp
	inc	r1
	inc	r1
	inc	r2

	loop
	inc	r2

	jmp	r11
	nop



