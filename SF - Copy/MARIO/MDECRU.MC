;-----------------------------------
; Decrunch an LZW format file into mario bitmaps.
; by Krister Wombell.
;  Entry :
;	m_enddata = end of crunched data
;	m_enddatabnk = rom bank of crunched data
;	m_decaddr = address in mario of decrunch buffer
;  Exit :
;	m_enddata = last address used


	

lsrd0s	macro			;lsr.l #1,d0
	with	rd0h
	lsr
	with	rd0l
	ror
	from	rd0h		;carry still valid
	or	rd0l
	endm

getprevd0	macro			;move.l -(a0),d0
	to	rd0l
	getb
	dec	rsrc
	with	rd0l
	getbh
	dec	rsrc
	to	rd0h
	getb
	dec	rsrc
	with	rd0h
	getbh
	endm

call	macro
	link	#4
	iwt	r15,#(\1)&$ffff
	endm



m_enddata	equ	m_x1
m_enddatabnk	equ	m_x2
m_decaddr	equ	m_y1
m_decoffset	equ	m_y2
m_decend	equ	m_tr1

rdest	equr	1
rd0h	equr	2
rd0l	equr	3
rd2	equr	4
rd3h	equr	5
rd3l	equr	6
rgetbits2	equr	7
rdecloop	equr	8
rdeststrt	equr	9
rd1	equr	12
rsrc	equr	14

mdecrunch
	lms	r0,[m_enddatabnk]
	romb
	sub	r0
	ramb

	lms	rsrc,[m_enddata]
	dec	rsrc
	to	rdest
	getb
	dec	rsrc
	with	rdest
	getbh		;rdest = length needed
	dec	rsrc

	dec	rsrc
	dec	rsrc
	getprevd0		;rd0 = suffix data length

	lms	rdeststrt,[m_decaddr]
	with	rdest		;add start of decrunch buffer
	add	rdeststrt
	sms	[m_decend],rdest

	ibt	rd2,#0
	ibt	rd3l,#0
	ibt	rd3h,#0

	iwt	rgetbits2,#mgetbits2&WM

	cache
	move	rdecloop,r15
mdecloop
	ibt	rd1,#3
	call	mgetbits
	with	rd2

	ibt	r0,#-1
	and	rd2
	mlbeq	mgetcom

	ibt	r0,#7
	cmp	rd2
	bne	.skip
	nop
	lsrd0s
	bne	.ok
	nop
	call	mgetlong
	dec	rsrc
.ok	bcc	.ok2
	nop
	ibt	rd1,#10
	call	mgetbits
	with	rd2
	moves	rd2,rd2
	bne	.skip
	nop
	ibt	rd1,#18
	call	mgetbits
	with	rd2
	bra	.skip
	nop
.ok2	ibt	rd1,#4
	call	mgetbits
	with	rd2
	with	rd2
	add	#7
.skip
.loop	ibt	rd1,#8
	move	r13,r15
.loop2	lsrd0s
	beq	.declong
	nop
	with	rd3l
	rol
	with	rd3h
	rol
	loop
	nop
	dec	rdest
	from	rd3l
	stb	[rdest]
	dec	rd2
	bne	.loop
	nop
	bra	mgetcom
	nop

.declong
	dec	rsrc
	getprevd0
	ibt	r0,#1
	ror
	with	rd0h
	ror
	with	rd0l
	ror
	with	rd3l
	rol
	with	rd3h
	rol
	loop
	nop
	dec	rdest
	from	rd3l
	stb	[rdest]
	dec	rd2
	bne	.loop
	nop


mgetcom	with	rdeststrt
	cmp	rdest
	bne	.ok
	ibt	rd1,#2
	sms	[m_enddata],r14

	lms	r3,[m_decoffset]
	moves	r3,r3
	beq	.ret
	nop
	lms	r1,[m_decaddr]
	lms	r2,[m_decend]
	to	r12
	from	r2
	sub	r1
	move	r13,r15
.lp	ldw	[r1]
	add	r3
	stw	[r1]
	inc	r1
	loop
	inc	r1
.ret
	stop
	nop
.ok
	db	2
	call	mgetbits
	with	rd2

	ibt	rd3l,#2
	ibt	rd3h,#0
	ibt	rd1,#8
	moves	rd2,rd2
	mlbeq	.comx10

	ibt	rd3l,#4
	ibt	r0,#2
	cmp	rd2
	beq	.fill
	nop

	ibt	rd3l,#3
	ibt	r0,#1
	cmp	rd2
	beq	.com1xx
	nop
	ibt	rd1,#2
	call	mgetbits
	with	rd2

	ibt	r0,#3
	cmp	rd2
	beq	.com111
	nop
	ibt	r0,#2
	cmp	rd2
	beq	.com11x
	nop
	with	rd2
	add	#5
	move	rd3l,rd2
	bra	.fill
	nop

.com11x	ibt	rd1,#2
	call	mgetbits
	with	rd2
	with	rd2
	add	#7
	move	rd3l,rd2
	bra	.fill
	nop

.com111	ibt	rd1,#8
	call	mgetbits
	with	rd2
	move	rd3l,rd2
	bra	.fill
	nop

.com1xx	ibt	rd1,#8
	lsrd0s
	bne	.skip
	nop
	call	mgetlong
	dec	rsrc
	nop
.skip	bcs	.comx10
	nop
	ibt	rd1,#14
	bra	.comx10
	nop

.fill	ibt	rd1,#16
	lsrd0s
	bne	.fill2
	nop
	call	mgetlong
	dec	rsrc
.fill2	bcc	.comx10
	nop
	ibt	rd1,#8
	lsrd0s
	bne	.fill3
	nop
	call	mgetlong
	dec	rsrc
.fill3	bcs	.comx10
	nop
	ibt	rd1,#12

.comx10	call	mgetbits
	with	rd2

	dec	rd3l
.loop	from	rdest
	add	rd2
	dec	r0
	ldb	[r0]
	dec	rdest
	stb	[rdest]
	dec	rd3l
	bpl	.loop
	nop
	jmp	rdecloop
	nop


mgetlong	getprevd0
	ibt	r0,#1
	ror
	with	rd0h
	ror
	with	rd0l
	ror
	from	rd0h
	or	rd0l
	jmp	r11
	nop

mgetbits	sub	rd2
	move	r13,rgetbits2
	with	rd0h
mgetbits2	lsr		;lsr.l #1,d0
	with	rd0l
	ror
	from	rd0h		;carry still valid
	or	rd0l
	beq	mgetbits3
	nop
	with	rd2
	rol
	loop
	with	rd0h
	jmp	r11
	nop

mgetbits3	dec	rsrc
	getprevd0
	ibt	r0,#1
	ror
	with	rd0h
	ror
	with	rd0l
	ror
	with	rd2
	rol
	loop
	with	rd0h
	jmp	r11
	nop


mdecclear
	iwt	r1,#$200
	move	r12,#(32768/2)-$100
	move	r13,r15
	sub	r0
.clear	stw	[r1]
	inc	r1
	loop
	inc	r1
	stop
	nop





