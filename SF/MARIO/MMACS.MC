;
; File:	MMACS.MC
;
; Use: 	MARIO code macros
; Code:	MARIO
; By:  	Peter Warnes
;      	Copyright 1991
;		Argonaut Software Ltd.


; increment word in memory
;
; uses r0

mincm	macro
	move	r0,[\1]
	inc	r0
	sbk
	endm

; decrement word in memory
;
; uses r0

mdecm	macro
	move	r0,[\1]
	dec	r0
	sbk
	endm

; test \1
;
; set s,v and z flags on reg value
;
; s = reg \1 bit 15
; v = reg \1 bit 7
; z = reg \1 == 0

mtest	macro
	moves	\1,\1
	endm

; not \1
;
; ones complement a reg

mnot	macro
	ifne	\1
	with	\1
	endc
	not
	endm

; neg \1
;
; twos complement a reg

mneg	macro
	ifne	\1
	with	\1
	endc
	not
	inc	\1
	endm

; \1 = abs(\2)
;
; absolute value of a reg

mabs	macro
	moves	\1,\2
	bpl	.\@
	nop
	ifne	\1
	with	\1
	endc
	not
	inc	\1
.\@
	endm

; swap \1,\2 using \3 as temp

mexg	macro
	move	\3,\1
	move	\1,\2
	move	\2,\3
	endm

; swap \1,\2 using XORs (NO temp, but +3 bytes/cycles) 

mexgx	macro
	with	\1
	xor 	\2
	with	\2
	xor	\1
	with	\1
	xor	\2
	endm

; zero extend low byte of reg

mzext	macro
	ifne	\1
	with	\1
	endc
	lob
	endm

; logical shift right 8 times a reg

mlsr8	macro
	ifne	\1
	with	\1
	endc
	hib
	endm

; arithmetic shift right 8 times a reg

masr8	macro
	ifne	\1
	with	\1
	endc
	hib
	ifne	\1
	with	\1
	endc
	sex
	endm

; arithmetic shift left 8 times a reg

masl8	macro
	ifne	\1
	with	\1
	endc
	lob
	ifne	\1
	with	\1
	endc
	swap
	endm

; logical shift left 8 times a reg

mlsl8	macro
	ifne	\1
	with	\1
	endc
	lob
	ifne	\1
	with	\1
	endc
	swap
	endm

; lsr reg

mlsr	macro
	ifne	\1
	with	\1
	endc
	lsr
	endm

; asr reg

masr	macro
	ifne	\1
	with	\1
	endc
	asr
	endm

; div2 reg

mdiv2	macro
	ifne	\1
	with	\1
	endc
	div2
	endm

; ror reg

mror	macro
	ifne	\1
	with	\1
	endc
	ror
	endm

; asl reg

masl	macro
	ifne	\1
	with	\1
	endc
	add	\1
	endm

; rol reg

mrol	macro
	ifne	\1
	with	\1
	endc
	rol
	endm

; asl 32 bit, \1 is high word, \2 is low word

masll	macro
	masl	\2
	mrol	\1
	endm

; asr 32 bit, \1 is high word, \2 is low word

masrl	macro
	masr	\1
	mror	\2
	endm

; lsr 32 bit, \1 is high word, \2 is low word

mlsrl	macro
	mlsr	\1
	mror	\2
	endm

; ror 32 bit, \1 is high word, \2 is low word

mrorl	macro
	mror	\1
	mror	\2
	endm

; lsr 32 bit, \1 is high word, \2 is low word

mroll	macro
	mrol	\2
	mrol	\1
	endm


; get unsigned byte from ROM buffer and inc r14

mgetbi	macro
	ifne	\1
	to	\1
	endc
	getb
	inc	r14
	endm

; get signed byte from ROM buffer and inc r14

mgetbsi	macro
	ifne	\1
	to	\1
	endc
	getbs
	inc	r14
	endm

; get word from ROM buffer and inc r14

mgetw	macro
	ifne	\1
	to	\1
	endc
	getb
	inc	r14
	ifne	\1
	with	\1
	endc
	getbh
	endm

; get word from ROM buffer and inc r14 by 2

mgetwi	macro
	ifne	\1
	to	\1
	endc
	getb
	inc	r14
	ifne	\1
	with	\1
	endc
	getbh
	inc	r14
	endm

; store immediate 16 bit value (\2) to memory addr (\1)
;
; NB uses r0
;
; [\1].w = \2; r0 = \2

msmsi	macro
	miwt	r0,(\2)
	move	[\1],r0
   	endm

; load unsigned byte to Dreg, from [reg], auto-incrementing reg by 1
;
; Dreg = [\1].b; \1+=1

mldbi	macro
	ifeq	NARG-2
	to	\1
	ldb	[\2]
	inc	\2
	mexit
	endc
	ldb	[\1]
	inc	\1
	endm

; load signed byte to Dreg, from [reg], auto-incrementing reg by 1
;
; Dreg = sex([\1].b); \1+=1

mldbsi	macro
	ifeq	NARG-2
	to	\1
	ldb	[\2]
	sex
	inc	\2
	mexit
	endc
	ldb	[\1]
	sex
	inc	\1
	endm

; load word to Dreg, from [reg], auto-incrementing reg by 2
;
; Dreg = [\1].w; \1+=2

mldwi	macro
	ifeq	NARG-2
	to	\1
	ldb	[\2]
	inc	\2
	inc	\2
	mexit
	endc
	ldw	[\1]
	inc	\1
	inc	\1
	endm

; store byte to [reg] from Sreg, auto-incrementing reg by 1
;
; [\1].b = Sreg; \1+=1

mstbi	macro			
	stb	[\1]
	inc	\1
	endm

; store word to [reg] from Sreg, auto-incrementing reg by 2
;
; [\1].w = Sreg; \1+=2

mstwi	macro
	stw	[\1]
	inc	\1
	inc	\1
	endm

; move.w \1,\2(\3) (-128 >= \2 <=127)
;
; Dreg = [\1+\2].w

mloadw	macro
	ifeq	\1
	ibt	r0,#(\2)
	add	\3
	ldw	[r0]
	endc
	ifne	\1
	ibt	\1,#(\2)
	with	\1
	add	\3
	to	\1
	ldw	[\1]
	endc
	endm

; move.w \1,\2(\3) (-128 >= \2 <=127)
;
; Dreg = [\1+\2].w

mloadb	macro
	ifeq	\1
	ibt	r0,#(\2)
	add	\3
	ldb	[r0]
	endc
	ifne	\1
	ibt	\1,#(\2)
	with	\1
	add	\3
	to	\1
	ldb	[\1]	
	endc
	endm


; move.w \2(\3),\1  (0 >= \2 <= 15) 

mstorewq	macro
	ifne	\2
	with	\3
	add	#\2
	endc
	ifne	\1
	from	\1
	endc
	stw	[\3]
	ifne	\2
	with	\3
	sub	#\2
	endc
	endm

; move.w \2(\3),\1 (r0 is a temp) (-128 >= \2 <=127)

mstorew	macro
	ifeq	\1
	error	illegal using mstorew r0
	endc
	ifne	\1
	ibt	r0,#(\2)
	add	\3
	from	\1
	stw	[r0]
	endc
	endm

; move.w \2(\3),\1 (\4 is a temp) (-128 >= \2 <=127)
mstorew2	macro
	ibt	\4,#(\2)
	with	\4
	add	\3
	from	\1
	stw	[\4]
	endm

; move.w \2(\3),\1 (\4 is a temp) (-128 >= \2 <=127)
mstoreb2	macro
	ibt	\4,#(\2)
	with	\4
	add	\3
	from	\1
	stb	[\4]
	endm


; push a register onto the stack
;
; Assumes rsp is valid stack pointer reg
; NB this is an ASCENDING EMPTY stack
;
; mpush	reg
;

mpush	macro
	ifne	\1
	from	\1
	endc
	stw	[rsp]
	inc	rsp
	inc	rsp
	endm


; pop a register from the stack
;
; Assumes rsp is valid stack pointer reg
; NB this is an ASCENDING EMPTY stack
;
; mpop	reg
; delayed_instruction	(ONLY if popping r15)
;

mpop	macro
	dec	rsp
	dec	rsp
	ifne	\1
	to	\1
	endc
	ldw	[rsp]
	endm


; call subroutine with short relative addr (+/-124) in same bank
;
; mcalls	addr
; delayed_instruction
;
; r11 = return addr

mcalls	macro
	link	#3
	mbra	(\1)&$ffff
	endm

; call subroutine with addr in same bank
;
; mcall	addr
; delayed_instruction
;
; r11 = return addr

mcall	macro
	link	#4
	miwt	pc,(\1)&$ffff
	endm

; call subroutine with addr in reg (any one of r0,r8,r9,r10,r12,r13)
;
; mcallreg	reg
; delayed_instruction
;

mcallreg	macro
	link	#2
	jmp	\1
	endm


; call subroutine with addr in a different bank
;
; mcallfar	addr
; delayed_instruction
;
; r11 = return addr
; r1  = return bank number
; r0  = called bank number
; r8  = called addr

mcallfar	macro
	ibt	r0,#(*)>>16
	ibt	r1,#(\1)>>16
	miwt	r8,#\1
	link	#3
	ljmp	r8
	endm

; return from far subroutine call
; 
; mretfar
; delayed_instruction
;
; r11 = return addr
; r0  = return bank number

mretfar	macro
	ljmp	r11
	endm



; long branch macros
;

mlbra	macro
	miwt	pc,(\1)&$ffff
	nop
	endm


mlbeq	macro
	bne	*+7
	nop
	miwt	pc,(\1)&$ffff
	nop
	endm

mlbne	macro
	beq	*+7
	nop
	miwt	pc,(\1)&$ffff
	nop
	endm

mlbpl	macro
	bmi	*+7
	nop
	miwt	pc,(\1)&$ffff
	nop
	endm

mlbmi	macro
	bpl	*+7
	nop
	miwt	pc,(\1)&$ffff
	nop
	endm

mlbcc	macro
	bcs	*+7
	nop
	miwt	pc,(\1)&$ffff
	nop
	endm

mlbcs	macro
	bcc	*+7
	nop
	miwt	pc,(\1)&$ffff
	nop
	endm

mlbvc	macro
	bvs	*+7
	nop
	miwt	pc,(\1)&$ffff
	nop
	endm

mlbvs	macro
	bvc	*+7
	nop
	miwt	pc,(\1)&$ffff
	nop
	endm

mlbge	macro
	blt	*+7
	nop
	miwt	pc,(\1)&$ffff
	nop
	endm

mlblt	macro
	bge	*+7
	nop
	miwt	pc,(\1)&$ffff
	nop
	endm


; multiply macros
;

; r0,r5 = \1 * \2	(uses r4,r6 as tmp)

mmul	macro
	ifne	(\1)-6
	move	r6,\1
	endc
	from	\2
	lmult
	move	r5,r4
	endm

; r0,r5 += \1 * \2	(uses r4,r6 as tmp)

mmuladd	macro
	ifne	(\1)-6
	move	r6,\1
	endc
	from	\2
	to	r6
	lmult	
	with	r5
	add	r4
	adc	r6
	endm

; r0,r5 -= \1 * \2	(uses r4,r6 as tmp)

mmulsub	macro
	ifne	(\1)-6
	move	r6,\1
	endc
	from	\2
	to	r6
	lmult	
	with	r5
	sub	r4
	sbc	r6
	endm

; \2 = (\1 * r6) >> 14	(uses r0,r4 as tmp)

mmulasr14	macro
	ifne	\1
	from	\1
	endc
	lmult
	with	r4
	add	r4
	rol	
	with	r4
	add	r4
	ifne	\2
	to	\2
	endc
	rol	
	endm

; \2 = (\1 * r6) >> 15	(uses r0 as tmp)

mmulasr15	macro
	ifne	\1
	from	\1
	endc
	fmult
	ifne	\2
	to	\2
	endc
	rol
	endm


; dot product macros
;


; r0=(r1*\1 + r2*\2 + r3*\3)>>15 (uses r4-r7)

mdotprod16m	macro

	lms	r6,[\1]
	from	r1
	lmult
	move	r7,r4	; = 8	(+3+8 = 19)

	lms	r6,[\2]
	from	r2
	to	r5
	lmult
	with	r7
	add	r4
	adc	r5	        ; = 11	(+3+8 = 22)
				    
	lms	r6,[\3]
	from	r3
	to	r5
	lmult
	with	r7
	add	r4
	adc	r5		; = 11	(+3+8 = 22)

	with	r7
	add	r7
	rol			; = 3	= 33	(= 66)

	endm


; r0=(r1*\1 + r2*\2 + r3*\3)>>15 (uses r5,r6)

mdotprod16mq2	macro

	lms	r6,[\1]		; = 5
	from	r1
	fmult

	lms	r6,[\2]		; = 7
	from	r2
	to	r5
	fmult
	add	r5

	lms	r6,[\3]		; = 7
	from	r3
	to	r5
	fmult
	add	r5

	add	r0		; = 1	= 20

	endm


; r0=(r1*\1 + r2*\2 + r3*\3)>>15 (uses r5,r6)

mdotprod16mq	macro

	lms	r6,[\1]		; = 7	(+3+11 = 21)
	from	r1
	fmult
	to	r5
	rol

	lms	r6,[\2]		; = 8	(+3+11 = 22)
	from	r2
	fmult
	rol
	with	r5
	add	r0

	lms	r6,[\3]		; = 7	(+3+11 = 21)
	from	r3
	fmult
	rol
	add	r5		; = 22  (+42 = 64)

	endm

; r0=(r1*\1 + r2*\2 + r3*\3)>>15 (uses r5,r6)

mdotprod16mqr	macro

	move	r6,(\1)		; = 6	(+3 = 9)
	from	r1
	fmult
	to	r5
	rol

	move	r6,(\2)		; = 7	(+3 = 10)
	from	r2
	fmult
	rol
	with	r5
	add	r0

	move	r6,(\3)		; = 6	(+3 = 9)
	from	r3
	fmult
	rol
	add	r5		; = 19  (+9 = 28)

	endm


mdotprod816	macro
	from	rmat1211
	lob
	to	r6
	swap
	from	rx
	to	r5
	lmult
	move	rsumlo,r4
	move	rsumhi,r5	= 11

	from	rmat1211
	hib
	to	r6
	swap
	from	ry
	to	r5
	lmult
	with	rsumlo
	add	r4
	with	rsumhi
	adc	r5		= 12

	from	rmat2113
	lob
	to	r6
	swap
	from	rz
	to	r5
	lmult
	with	rsumlo
	add	r4
	from	rsumhi
	adc	r5		= 12

	with	rsumlo
	add	rsumlo
	rol			= 3

	mstwi	routptr	= 4	= 42

	endm


;  sin and cos macros
;


; r0 = sin8(r0), uses r14

mgetsin8	macro

;	hib
	lob
	miwt	r14,sintab
	to	r14
	add	r14
	getb
	swap

	endm

; r0 = cos8(r0), uses r14

mgetcos8	macro

;	hib
	lob
	miwt	r14,costab
	to	r14
	add	r14
	getb
	swap

	endm

; \1 = cos16(\2), uses \3, r6, r14

mgetcos16	macro

	miwt	r14,$4000
	with	\2
	add	r14

	mgetsin16	\1,\2,\3

	endm


	ifne	0

; r0 = sin16(r1), uses r14

mgetsin16l	macro

	moves	r0,r1
	bmi	\@neg
	nop

	to	r14
	add	r0
	bpl	\@p
	nop

	not
;	inc	r0
	miwt	r14,$4000
	add	r14
\@p

	add	r0
	add	r0
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	add	r0

;	miwt	r14,$03fe
;	and	r14

	miwt	r14,sintab16
	to	r14
	add	r14
	getb
	inc	r14
	getbh

	miwt	pc,\@exit
	nop

\@neg
	to	r14
	add	r0
	bpl	\@negp
	nop

	not
;	inc	r0
	miwt	r14,$4000
	add	r14
\@negp

	add	r0
	add	r0
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	add	r0

;	miwt	r14,$03fe
;	and	r14

	miwt	r14,sintab16
	to	r14
	add	r14
	getb
	inc	r14
	getbh

	not
	inc	r0
\@exit

	endm

;	to	\3
;	getb
;	inc	r14
;	with	\3
;	getbh
;	inc	r14
;	getb
;	inc	r14
;	getbh

	endc


; \1 = sin16(\2), \3 is temp, r6 used
; 8 bit sintab used

mgetsin16b	macro
	miwt	r6,sintab
	from	\2
	hib
	to	r14
	add	r6	; = 7

	getb		; 6+12-2 = 16
	inc	r14
	to	\3
	swap
	getb
	swap

;	mgetwi	\3	; 6+12-3 = 15
;	mgetw	r0	; 4+12	 = 16 = 31

	to	r6
	sub	\3	; = 2

	from	\2
	lob
	swap
	lsr
	fmult
	rol
	to	\1
	add	\3     	; = 8+3 = 11		= 23+10+3 = 36
	endm



; \1 = sin16(\2), \3 is temp, r6 used
; 16 bit sintab used

mgetsin16	macro
	miwt	r6,sintab16
	from	\2
	hib
	add	r0
	to	r14
	add	r6	; = 7

;	getb		; 6+12-2 = 16
;	inc	r14
;	to	\3
;	swap
;	getb
;	swap

	mgetwi	\3	; 6+12-3 = 15
	mgetw	r0	; 4+12	 = 16 = 31

	to	r6
	sub	\3	; = 2

	from	\2
	lob
	swap
	lsr
	fmult
	rol
	to	\1
	add	\3     	; = 8+3 = 11		= 23+10+3 = 36
	endm





	ifeq	1 		; subroutine versions

mgetcos16
	miwt	r2,$4000	; r0 = cos16(r1)   r2,r6 are temps
	with	r1
	add	r2

mgetsin16
	miwt	r6,sintab
	from	r1		; r0 = sin16(r1)   r2,r6 are temps
	hib
	to	r14
	add	r6

	getb
	inc	r14
	to	r2
	swap
	getb
	swap

;	mgetwi	r2
;	mgetw	r0

	to	r6
	sub	r2

	from	r1
	lob
	swap
	lsr
	fmult
	rol
	jmp	r11
	add	r2

	endc



; rotate 8 bit point in rx,ry,rz
; by 8 bit matrix in rwmat1211,rwmat2113,rwmat3231,rwmat0033
;


mwmatrotp	macro
	from	rwmat1211	; 11
	to	rt
	mult	rx		; m11*x

	from	rwmat2113	; 21
	hib
	mult	ry		; m21*y
	to	rt
	add	rt

	from	rwmat3231	; 31
	mult	rz		; m31*z
	add	rt

	add	r0
	hib
	stb	[routptr]	; rotx
	inc	routptr
;=31
	from	rwmat1211	; 12
	hib
	to	rt
	mult	rx		; m12*x

	from	rwmat2322	; 22
	mult	ry		; m22*y
	to	rt
	add	rt

	from	rwmat3231	; 32
	hib
	mult	rz		; m32*z
	add	rt

	add	r0
	hib
	stb	[routptr]	; roty
	inc	routptr
;=15
	from	rwmat2113	; 13
	to	rt
	mult	rx		; m13*x

	from	rwmat2322	; 23
	hib
	mult	ry		; m23*y
	to	rt
	add	rt

	from	rwmat0033	; 33
	mult	rz		; m33*z
	add	rt

	add	r0
	hib
	stb	[routptr]	; rotz
	inc	routptr
;=15
	endm




; UNTESTED
;
; read status flags
;
; r1 = s flag
; r2 = z flag
; r3 = c flag
; r4 = v flag
;
; status flags are preserved

readflags	macro
	ibt	r1,#0
	bpl	.\@s
	nop
	ibt	r1,#1
.\s
	ibt	r2,#0
	beq	.\@z
	nop
	ibt	r2,#1
.\z
	ibt	r3,#0
	bcc	.\@c
	nop
	ibt	r3,#1
.\c
	ibt	r4,#0
	bvc	.\@v
	nop
	ibt	r4,#1
.\v
	endm


; UNTESTED
;
; load status flags into r0
;
; r0 = 0000szcv
;
; r1,r2,r3,r4 are tmps
;
; c flag corrupt

	IFEQ	1
ldflags	macro
	readflags
	ibt	r0,#0
	with	r1
	lsr
	rol
	with	r2
	lsr
	rol
	with	r3
	lsr
	rol
	with	r4
	lsr
	rol
	endm
	ENDC

; UNTESTED
;

ldflags	macro
	readflags
	from	r1
	or	r2
	or	r3
	or	r4
	endm

; UNTESTED
;
; store r0 into status flags
;
; r0 = cs0000000v000000

stflags	macro
	add	r0	; set c,n,z
	moves	r0,r0	; sey v,n,z z=(n=0)&(v=0)
	endm


; UNTESTED
;
; clear status flags
;
; n=0, z=0, v=0, c=0

clrflags	macro
	sub	r0
	add	#1
	endm




