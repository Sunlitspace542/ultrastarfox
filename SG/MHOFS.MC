
mnograd
	lms	r7,[m_viewposx]
	with	r7
	asr
	from	r7
	asr
	asr
 
	iwt	r7,#128
	add	r7
	
	lms	r6,[m_scrollxoff]
	add	r6

	ibt	r6,#1
	miwt	r10,(bg_scrollbuffer)&WM
	miwt	r12,224
	mcache
	move	r13,r15
	from	r6
	stb	[r10]
	inc	r10
	stb	[r10]
	inc	r10
	swap
	stb	[r10]
	inc	r10
	loop
	swap

	stop
	nop

mrotplanet
	ibt	r1,#0
	ibt	r2,#0
	lms	r3,[m_viewposx]
	move	r0,r3		;rotating
	not	r0
	asr
	asr
	asr
	asr
	asr
	asr
	asr

	to	r3
	hib
	with	r3
	sex
	to	r4
	lob
	with	r4
	swap

	ibt	r5,#0
	lms	r7,[m_y1]
	with	r7
	asr
	with	r7
	asr
	with	r7
	asr
	lms	r6,[m_scrollxoff]
	with	r7
	add	r6  
	ibt	r6,#1
	miwt	r9,(bg_scrollbuffer+112*3)&WM
	miwt	r10,(bg_scrollbuffer+111*3+2)&WM
	miwt	r12,112
	mcache
	move	r13,r15
.lp	with	r2
	add	r4
	with	r1
	adc	r3
	from	r1
	add	r5

	not	r0
	add	r7
	from	r6
	stb	[r9]		;control byte
	inc	r9
	stb	[r9]
	inc	r9
	swap
	stb	[r9]
	inc	r9
	swap

	sub	r7
	not	r0
	add	r7
	swap
	stb	[r10]		;control byte
	dec	r10
	swap
	stb	[r10]
	dec	r10
	from	r6
	stb	[r10]
	dec	r10

	loop
	nop

	stop
	nop

mtunnelgrad
	ibt	r1,#0
	ibt	r2,#0
	lms	r3,[m_viewposx]
	move	r0,r3
	add	r3	
	add	r3
	add	r3
	with	r3
	asr	
	with	r3
	asr	
	add	r3

	to	r3
	hib
	with	r3
	sex
	to	r4
	lob
	with	r4
	swap

	miwt	r5,128
	ibt	r6,#1
	miwt	r9,(bg_scrollbuffer+112*3)&WM
	miwt	r10,(bg_scrollbuffer+112*3)&WM
	miwt	r12,112
	mcache
	move	r13,r15
.lp	with	r2
	add	r4
	with	r1
	adc	r3
	from	r1
	add	r5

	from	r6
	stb	[r9]
	inc	r9
	stb	[r9]
	swap
	inc	r9
	stb	[r9]
	inc	r9

	dec	r10
	stb	[r10]
	swap
	dec	r10
	stb	[r10]
	dec	r10
	from	r6
	stb	[r10]

	loop
	nop

	stop
	nop

mwibbletunnel
	ibt	r1,#0
	ibt	r2,#0
	lms	r3,[m_viewposx]
	move	r0,r3
	add	r3	
	add	r3
	add	r3
	with	r3
	asr	
	with	r3
	asr	
	add	r3
	to	r3
	hib
	with	r3
	sex
	to	r4
	lob
	with	r4
	swap


	iwt	r5,#128
	ibt	r6,#1
	iwt	r9,#(bg_scrollbuffer+112*3)&WM
	iwt	r10,#(bg_scrollbuffer+112*3)&WM

	ibt	r7,#watersinetab>>16
	from	r7
	romb

	lms	r7,[m_sineoffset]
	dec	r7
	bpl	.kk
	nop
	iwt	r13,#watersinetabend-watersinetab
	with	r7
	add	r13
.kk	sms	[m_sineoffset],r7

	iwt	r14,#watersinetab&WM
	with	r14
	add	r7

	to	r8			;r8=sine value offset
	getb
	with	r8
	sex
	ibt	r13,#0
	iwt	r12,#112
	mcache
.lp
	with	r2
	add	r4
	with	r1
	adc	r3
	from	r1
	add	r5

	swap
	dec	r10
	stb	[r10]
	swap
	dec	r10
	stb	[r10]
	dec	r10
	from	r6
	stb	[r10]

;----------------------------------------
	dec	r13			;get new sine value?
	bpl	.noinc
	nop
	inc	r14
	to	r8			;r8=sine value offset
	getb
	with	r8
	sex
	ibt	r13,#112
	with	r13
	sub	r12
	with	r13
	lsr
	with	r13
	lsr
	with	r13
	lsr
.noinc

	move	r11,r14
	iwt	r14,#wsctab&WM
	with	r14
	add	r12
	to	r6
	getb
	move	r14,r11
	with	r6
	sex
	move	r11,r8
	moves	r6,r6
	beq	.no
	nop
.kklp	with	r11
	div2
	dec	r6
	bne	.kklp
	nop
.no
	add	r11

	ibt	r6,#1
	from	r6
	stb	[r9]
	inc	r9
	stb	[r9]
	swap
	inc	r9
	stb	[r9]
	inc	r9
;----------------------------------------

	dec	r12
	bne	.lp
	nop

	stop
	nop





bholelimit equ	$a0
mbhole
	lms	r0,[testk3]
	dec	r0
	bne	.ok
	sbk
	lms	r0,[testk4]
	mneg	r0
	sbk
	iwt	r0,#bholelimit*2
	sms	[testk3],r0
.ok
	lms	r1,[testk4]
	lms	r0,[testk2]
	add	r1
	sbk
	move	r3,r0
	add	r3	
	add	r3
	add	r3
	with	r3
	asr	
	with	r3
	asr	
	add	r3

	ibt	r1,#0
	ibt	r2,#0

	to	r3
	hib
	with	r3
	sex
	to	r4
	lob
	with	r4
	swap


	ibt	r0,#bholetab>>16
	romb
	lms	r0,[testk]
	add	#3
	ibt	r6,#bholetabend-bholetab
	cmp	r6
	blt	.kk
	nop
	sub	r6
.kk	sbk

	iwt	r14,#bholetab&WM
	with	r14
	add	r0

	miwt	r5,512

	miwt	r7,bg_scrollbuffer+112*3
	miwt	r8,bg_scrollbuffer+112*3
	ibt	r9,#1

	lms	r11,[m_scrollxoff]

	iwt	r12,#112
	cache
	move	r13,r15
.lp
	with	r2
	add	r4
	with	r1
	adc	r3
	from	r1
	to	r6
	add	r5

	getb
	inc	r14
	sex
	add	r6
	add	r11		;scroll offset

	from	r9
	stb	[r8]
	inc	r8
	stb	[r8]
	swap
	inc	r8
	stb	[r8]
	inc	r8

	dec	r7
	stb	[r7]
	dec	r7
	swap
	stb	[r7]
	dec	r7
	from	r9
	stb	[r7]

	loop
	nop

	stop
	nop


	IFEQ	1

mbholescaledown
	lms	r0,[testk3]
	dec	r0
	bne	.ok
	sbk
	lms	r0,[testk4]
	mneg	r0
	sbk
	iwt	r0,#bholelimit*2
	sms	[testk3],r0
.ok
	lms	r1,[testk4]
	lms	r0,[testk2]
	add	r1
	sbk
	move	r3,r0
	add	r3	
	add	r3
	add	r3
	with	r3
	asr	
	with	r3
	asr	
	add	r3

	ibt	r1,#0
	ibt	r2,#0

	to	r3
	hib
	with	r3
	sex
	to	r4
	lob
	with	r4
	swap


	ibt	r0,#bholetab>>16
	romb
	lms	r0,[testk]
	add	#3
	ibt	r6,#bholetabend-bholetab
	cmp	r6
	blt	.kk
	nop
	sub	r6
.kk	sbk

	iwt	r14,#bholetab&WM
	with	r14
	add	r0

	miwt	r5,512

	miwt	r7,bg_scrollbuffer+112*3
	miwt	r8,bg_scrollbuffer+112*3
	ibt	r9,#1

	lms	r10,[m_y1]
	lms	r11,[m_scrollxoff]

	iwt	r12,#112
	cache
	move	r13,r15
.lp
	with	r2
	add	r4
	with	r1
	adc	r3
	from	r1
	to	r6
	add	r5

	getb
	inc	r14
	sex
	add	r6
	add	r11		;scroll offset

	mtest	r0
	beq	.sk
	nop
	bpl	.pos
	nop
.min	with	r0
	add	r10
	bmi	.sk
	nop
	ibt	r0,#0
	bra	.sk
	nop
.pos	with	r0
	sub	r10
	bpl	.sk
	nop
	ibt	r0,#0
.sk
	iwt	r0,#0
	from	r9
	stb	[r8]
	inc	r8
	stb	[r8]
	swap
	inc	r8
	stb	[r8]
	inc	r8

	dec	r7
	stb	[r7]
	dec	r7
	swap
	stb	[r7]
	dec	r7
	from	r9
	stb	[r7]

	loop
	nop

	stop
	nop

	ENDC


watersinetab
	db	-20,-19,-18,-17,-14,-10,-6,-2
	db	2,6,10,14,17,18,19,20,20,19,18,17,14,10,6,2
	db	-2,-6,-10,-14,-17,-18,-19,-20
watersinetabend
	db	-20,-19,-18,-17,-14,-10,-6,-2
	db	2,6,10,14,17,18,19,20,20,19,18,17,14,10,6,2
	db	-2,-6,-10,-14,-17,-18,-19,-20
	db	-20,-19,-18,-17,-14,-10,-6,-2
	db	2,6,10,14,17,18,19,20,20,19,18,17,14,10,6,2
	db	-2,-6,-10,-14,-17,-18,-19,-20
	db	-20,-19,-18,-17,-14,-10,-6,-2
	db	2,6,10,14,17,18,19,20,20,19,18,17,14,10,6,2
	db	-2,-6,-10,-14,-17,-18,-19,-20
	db	-20,-19,-18,-17,-14,-10,-6,-2
	db	2,6,10,14,17,18,19,20,20,19,18,17,14,10,6,2
	db	-2,-6,-10,-14,-17,-18,-19,-20
	db	-20,-19,-18,-17,-14,-10,-6,-2
	db	2,6,10,14,17,18,19,20,20,19,18,17,14,10,6,2
	db	-2,-6,-10,-14,-17,-18,-19,-20
	db	-20,-19,-18,-17,-14,-10,-6,-2
	db	2,6,10,14,17,18,19,20,20,19,18,17,14,10,6,2
	db	-2,-6,-10,-14,-17,-18,-19,-20

bholetab
	db	-20,-20,-20,-20,-19,-19,-19,-18,-18,-17,-16,-15,-14,-13,-11,-9,-7,-5,-3,-1
	db	2,4,6,8,11,13,14,15,16,17,18,18,19,19,19,20,20,20,20
	db	19,19,19,18,18,17,16,15,14,12,11,8,6,4,2
	db	-1,-3,-5,-7,-9,-11,-13,-14,-15,-16,-17,-18,-18,-19,-19,-19
bholetabend
	db	-20,-20,-20,-20,-19,-19,-19,-18,-18,-17,-16,-15,-14,-13,-11,-9,-7,-5,-3,-1
	db	2,4,6,8,11,13,14,15,16,17,18,18,19,19,19,20,20,20,20
	db	19,19,19,18,18,17,16,15,14,12,11,8,6,4,2
	db	-1,-3,-5,-7,-9,-11,-13,-14,-15,-16,-17,-18,-18,-19,-19,-19
	db	-20,-20,-20,-20,-19,-19,-19,-18,-18,-17,-16,-15,-14,-13,-11,-9,-7,-5,-3,-1
	db	2,4,6,8,11,13,14,15,16,17,18,18,19,19,19,20,20,20,20
	db	19,19,19,18,18,17,16,15,14,12,11,8,6,4,2
	db	-1,-3,-5,-7,-9,-11,-13,-14,-15,-16,-17,-18,-18,-19,-19,-19
	db	-20,-20,-20,-20,-19,-19,-19,-18,-18,-17,-16,-15,-14,-13,-11,-9,-7,-5,-3,-1
	db	2,4,6,8,11,13,14,15,16,17,18,18,19,19,19,20,20,20,20
	db	19,19,19,18,18,17,16,15,14,12,11,8,6,4,2
	db	-1,-3,-5,-7,-9,-11,-13,-14,-15,-16,-17,-18,-18,-19,-19,-19

wsctab	rept	8
	db	2,2,2,2,2,2,2,2,2,2
	endr
	db	2,2,2,2,2,2,2
	db	2,2,2,2,2,2,2
	db	3,3,3,3,3,3,3
	db	4,4,4,4,4,4,4
	db	5,5,6,6
	rept	8
	db	6
	endr
