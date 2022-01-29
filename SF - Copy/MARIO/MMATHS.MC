;
; File:	MMATHS.MC
;
; Use:		Maths library
; Code:	MARIO
; By:		Peter Warnes
; 		Copyright 1991
;		Argonaut Software Ltd.
;


; Routines:
;
; msqrt16   	16 bit square root
; msqrt32	32 bit square root
; mdivs3216	32 bit by 16 bit signed divide
; mdivu3216	32 bit by 16 bit approx. unsigned divide
; mdivu3115	31 bit by 15 bit unsigned divide
; marctan16	16 bit arctangent of x/y
; mnormalise16	16 bit normalise x,y,z vector



;************************************************

; Square root of 16 bit number
;
; in:	rsqr = square
; out:	rsqrt = square root
; dead: rt,r11,r12,r13
; min cycles = 10 + 18*8 = 154
; min cycles = 10 + 21*8 = 178
; bytes = 33

rsqr	equr	3
rsqrt	equr	6
rt	equr	4


; msqrt16
;
; proc_leaf 	msqrt16(unsigned int rsqr)
; ret_type	reg unsigned int rsqrt
; local	reg r0,rt,r12,r13
; extern


msqrt16
	ibt	rsqrt,#0
	ibt	rt,#0
	ibt	r12,#8
	miwt	r13,.2
	with	rsqr
.2
	add	rsqr		; sqr += sqr
	with	rt		; rt += rt + c
	rol

	with	rsqr		; sqr += sqr
	add	rsqr
	with	rt  		; rt += rt + c
	rol

	with	rsqrt		; sqrt += sqrt
	add	rsqrt

	from	rsqrt		; r0 = sqrt + sqrt
	add	rsqrt

	cmp	rt		; r0 - t
	bcs	.1		; if c=0 then t = t - t2 + 1; sqrt += 1
;	nop
	with	rt
	sbc	r0
	inc	rsqrt
.1
	loop
	with	rsqr

	jmp	r11
	nop


;************************************************

rsqrhi	equr	4
rsqr	equr	5
rsqrt	equr	6
rt2	equr	7
rt	equr	8

mtestsqrt32
	miwt	rsqr,$ffff
	miwt	rsqrhi,$7fff
	mcall	msqrt32
	nop
	stop
	nop

;************************************************

; Square root of 32 bit number
;
; in:	rsqr   = low  16 bits of square
; 	rsqrhi = high 16 bits of square
; out:	rsqrt = square root
; dead: rt,rt2,r11,r12,r13

msqrt32
	ibt	rsqrt,#0
	ibt	rt,#0
	ibt	r12,#16
	miwt	r13,.2
	with	rsqr
.2
	add	rsqr
	with	rsqrhi
	rol
	with	rt
	rol

	with	rsqr
	add	rsqr
	with	rsqrhi
	rol
	with	rt
	rol

	with	rsqrt
	add	rsqrt
	from	rsqrt
	to	rt2
	add	rsqrt
	from	rt2
	sub	rt

	bcs	.1
;	nop
	with	rt
	sbc	rt2
	inc	rsqrt
.1
	loop
	with	rsqr

	jmp	r11
	nop


;************************************************

mtestnorm16
	miwt	r1,$0100
	miwt	r2,$0100
	miwt	r3,$7d00

	mcall	mnormalise16
	nop

	stop
	nop


; calc normalised vector from (r4,r5,r6) to (r1,r2,r3)

mvector_from
;	with	r1
;	sub	r4
;	with	r2
;	sub	r5
;	with	r3
;	sub	r6
	from	r4
	to	r1
	sub	r1
	from	r5
	to	r2
	sub	r2
	from	r6
	to	r3
	sub	r3


; normalise a 16 bit x,y,z vector in r1,r2,r3

rx	equr	1
ry	equr	2
rz	equr	3
rxhi	equr	7
ryhi	equr	8
rshiftcnt	equr	9

rsqrhi	equr	4
rsqr	equr	5
rsqrt	equr	6
rt2	equr	7
rt	equr	8

mnormalise16
	mpush	r11

	mmul	rx,rx
	mmuladd	ry,ry
	mmuladd	rz,rz		; r0,r5 = x*x + y*y + z*z

	mtest	r0
	bne	.1		; check for r0,r5 = 0
	nop
	mtest	r5
	bne	.1
	nop
	ibt	rx,#0
	ibt	ry,#0
	ibt	rz,#0
	mpop	pc
	nop
.1
;	move	rsqr,r5
	move	rsqrhi,r0
	mcall	msqrt32		; rsqrt = sqrt(rsqrhi,rsqr)
	nop
	move	r0,rsqrt

	ibt	rshiftcnt,#0
.vnormlp
	lsr
	beq	.novalshft
	nop
	bra	.vnormlp
	inc	rshiftcnt
.novalshft

	sub	r0
	miwt	r4,32767	; r0,r4 = 32767

	moves	r12,rshiftcnt
	beq	.noshift
	nop

	move	r13,pc
.shift
	with	r4
	add	r4
	loop
	rol
.noshift

	move	r6,rsqrt
	mcall	mdivu3216	; r4 = r0,r4 / r6
	nop
	move	r6,r4

	from	rx
	to	rxhi
	lmult
	move	rx,r4

	from	ry
	to	ryhi
	lmult
	move	ry,r4

	from	rz
	lmult
	move	rz,r4

	moves	r12,rshiftcnt
	beq	.noshift2
	nop

	move	r13,pc
.shift2
	with	rxhi
	asr
	with	rx
	ror

	with	ryhi
	asr
	with	ry
	ror

	asr
	with	rz
	ror

	loop
	nop
.noshift2

	mpop	pc
	nop


	ifeq	1
	moveq	#0,d3		; zero shift count
.vnormlp
	lsr.w	#1,d1
	beq.s	.novalshft
	addq.w	#1,d3		; loop until d1 is zero...
	bra.s	.vnormlp

.novalshft
	move.l	#32767,d2
	asl.l	d3,d2		; shift up for extra precision...

	divu	d0,d2		; d2 = 1/d0

	muls	d2,d4		; NewX = OldX * ( 1 / d0 )
	asr.l	d3,d4
	muls	d2,d5		; NewY = OldY * ( 1 / d0 )
	asr.l	d3,d5
	muls	d2,d6		; NewZ = OldZ * ( 1 / d0 )
	asr.l	d3,d6

	move.w	d4,d0
	move.w	d5,d1
	move.w	d6,d2
	rts
	endc



;************************************************


rdividendlo	equr	4
rdividendhi	equr	5
rdivisor	equr	6
rdivsign	equr	7


	ifeq	1
mdiv1	=	$7fffff
	div2	=	256
mdiv1lo	=	mdiv1&$ffff
mdiv1hi	=	mdiv1>>16


mdivstest
	miwt	rdividendlo,mdiv1lo
	miwt	rdividendhi,mdiv1hi
	miwt	rdivisor,	div2

	mcall	mdivs3216
	nop

	stop
	nop
	endc

;************************************************

; Signed 32 bit by 16 bit divide
; with signed 16 bit quotient and 15 bit unsigned remainder
;
; In:	r5 = dividend.h
;	r4 = dividend.l
;	r6 = divisor
; Out:	r0 = remainder
;	r4 = quotient
;	r6 = divisor
;	r7 = sign of quotient
; Uses:	r7,r12,r13
; Cycles:	140-176
; Bytes:	53


mdivs3216
	mcache

	from	rdividendhi
	to	rdivsign
	xor	rdivisor	; = 3

	sub	r0	
	moves	rdivisor,rdivisor
	bpl	.16m
;	nop
	to	rdivisor
	sub	rdivisor
.16m				; = 6/7

	moves	rdividendhi,rdividendhi
	bpl	.32p
;	nop
	to	rdividendlo
	sub	rdividendlo
	to	rdividendhi
	sbc	rdividendhi
.32p				; = 5/9

; unsigned divide

	with	rdividendlo	; 1
	add	rdividendlo	; 1
	from	rdividendhi	; 1
	rol			; 1
	ibt	r12,#16		; 2
	move	r13,pc		; 2 = 8

mdivs3216loop
	sub	rdivisor	; 1
	bcc	mdivs3216cc	; 2
	nop			; 1
	with	rdividendlo	; 1
	rol		        ; 1
	loop		        ; 1
	rol			; 1 = 8

	bra	mdivs3216end	; 1
	nop			; 1

mdivs3216cc
	add	rdivisor	; 1
	with	rdividendlo	; 1
	add	rdividendlo	; 1
	loop			; 1
	rol			; 1 = 9

; sign result

mdivs3216end
	moves	rdivsign,rdivsign
	bpl	mdivs3216rts
;	nop
	with	rdividendlo
	not
	inc	rdividendlo

mdivs3216rts			; 5/7 
	jmp	r11
	nop





	ifeq	1
mdivutest
	miwt	rdividendlo,mdiv1lo
	miwt	r0,mdiv1hi
	miwt	rdivisor,	div2

	mcall	mdivu3115
	nop

	stop
	nop
	endc

;************************************************

; Approx. unsigned 32 bit by 16 bit divide
; with 16 bit quotient
;
; In:	r0 = dividend.h
;	r4 = dividend.l
;	r6 = divisor
; Out:	r0 = remainder
;	r4 = quotient
;	r6 = divisor
; Uses:	r12,r13
; Cycles:	150-171
; Bytes:	39

mdivu3216  			; NB this is not accurate!
	mtest	r0
	bmi	mdivu3216m	; if divisor > $7fff 
	nop
	mtest	rdivisor
	bpl	mdivu3115	; or dividend > $7fffffff
	nop
mdivu3216m	  		; then halve divisor and dividend
	with	rdivisor
	lsr
	lsr
	with	rdividendlo
	ror


;************************************************

; Unsigned 31 bit by 15 bit divide
; with 16 bit quotient and 15 bit remainder
;
; In:	r0 = dividend.h
;	r4 = dividend.l
;	r6 = divisor
; Out:	r0 = remainder
;	r4 = quotient
;	r6 = divisor
; Uses:	r12,r13
; Cycles:	137-153
; Bytes:	24


mdivu3115
	ibt	r12,#16		; 2
	with	rdividendlo	; 1	asl32	r0,rdividendlo 
	add	rdividendlo	; 1
	rol			; 1
	move	r13,pc		; 2 = 7

mdivu3115loop
	sub	rdivisor	; 1
	bcc	mdivu3115cc	; 2
	nop			; 1
	with	rdividendlo	; 1
	rol		        ; 1
	loop		        ; 1
	rol			; 1 = 8

	jmp	r11		; 1
	lsr			; 1

mdivu3115cc
	add	rdivisor	; 1
	with	rdividendlo	; 1
	add	rdividendlo	; 1
	loop			; 1
	rol			; 1 = 9

	jmp	r11
	lsr


;************************************************


	ifeq	1

	sub	rdivisor
	maddcc	rdivisor
	with	rdividendlo
	rol
	loop
	rol

	endc



	ifeq	1

mdivu3115
	with	rdivisor	; 1    	neg	rdivisor
	not			; 1
	inc	rdivisor	; 1 = 3

mdivu3115n
	ibt	r12,#16		; 2
	with	rdividendlo	; 1	asl32	r0,rdividendlo 
	add	rdividendlo	; 1
	rol			; 1
	move	r13,pc		; 2 = 7

mdivu3115loop
	add	rdivisor	; 1
	bcc	mdivu3115cc	; 2
	nop			; 1
	with	rdividendlo	; 1
	rol		        ; 1
	loop		        ; 1
	rol			; 1 = 8

	jmp	r11		; 1
	lsr			; 1

mdivu3115cc
	sub	rdivisor	; 1
	with	rdividendlo	; 1
	add	rdividendlo	; 1
	loop			; 1
	rol			; 1 = 9

	jmp	r11
	lsr

	endc


;************************************************

; 65816 entry point

mcallarctan16
	miwt	rsp,m_stack
	lms	r1,[m_x1]
	lms	r2,[m_y1]
	mcall	marctan16
	nop
	sms	[m_cnt],r0
	nop
	stop
	nop

;************************************************

; 16 bit arctan (rx/ry)
; r0 = arctan(rx/ry)
;
; 0 to 359 degrees is $0000 to $ffff
; rx and ry are signed words
;
; NB Changes ROM Bank to 0
;
;    Calls	mdivu3115
;
; In:	r1 = x
;	r2 = y
; Out:	r0 = angle
; Dead: r3-r6,r12,r13

rx	equr	1
ry	equr	2

marctan16
	mpush	r11
	mpush	r14

	mabs	r6,rx
	mabs	r0,ry
	bne	marctan21
	nop
	miwt	r0,deg90<<8
	mlbra	marctan4

marctan21
	ibt	r5,#0
	cmp	r6
	bne	marctan7
	nop
	miwt	r0,deg45<<8
	mlbra	marctan4

marctan7
	blt	marctan3
	nop
	mexg	r6,r0,r4
	dec	r5
marctan3
	ibt	r4,#0
	lsr
	with	r4
	ror
	lsr
	with	r4
	ror

	mcall	mdivu3115
	nop

	sub	r0
	romb

	from	r4
	lsr
	lsr
	lsr
	lsr
	lsr
;	miwt	r4,$fffe
;	and	r4
	bic	#1
	miwt	r4,arctantab	
	to	r14
	add	r4
	mgetw	r0

	mtest	r5
	bmi	marctan4
	nop
	mneg	r0
	miwt	r4,deg90<<8
	add	r4
marctan4
	from	rx
	to	r4
	xor	ry
	bpl	marctan5
	nop
	mneg	r0
marctan5
	mtest	ry
	bpl	marctan6
	nop
	miwt	r4,deg180<<8
	add	r4
marctan6
	mpop	r14
	mpop	pc
	nop






