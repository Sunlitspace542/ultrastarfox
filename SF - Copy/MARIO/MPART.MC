;*****************************************************************************
;* PARTICLES 
;*
;* Giles Goddard  
;*

maxparticles	=	300		mmaxpnts

part_LIFE	equ	0	; must be 0!
part_FLAGS	equ	1
part_COLOUR	equ	2
part_VX		equ	3
part_VY		equ	4
part_VZ		equ	5
part_POSX	equ	6
part_POSY	equ	8
part_POSZ	equ	10
part_UNIQUE	equ	12
part_len	equ	14


partF_objalive	equ	1
partF_gravity	equ	2
partF_line	equ	4
partF_friction	equ	8 
partF_fadeout	equ	16 
		  
	Zmalc	m_particlerand,2

	malc	m_particles,part_len*(maxparticles+1)
;	malc	m_particlerand2,2
;	malc	m_drawparticles,(8+6)*(maxparticles+1)



;*****************************************************************************
; entry:
;	 r0 : particle type - 
;
; 1 =	biggendexplosion
; 2 =	fireup
; 3 =	firedown
; 4 =	bigtabexplosion		MAX 255 particles
; 5 =	smallgendexplosion
; 6 =	smalltabexplosion
; 7 =	smallfasttabexplosion
; 
;	 r1 : life of each particle
; 	 r2 : unique object number
;	 r3 : number of particles to generate

rtype		equr	8
rcount		equr	9
rvec		equr	4	
runique		equr	5
rlife		equr	6
rt		equr	7
rpartrand	equr	2
rpartrand2	equr	1
rpartptr	equr	3

rt2		equr	8

mparticlerand	macro
	from	rpartrand
	swap
	ror
	add	rpartrand
	to	rpartrand
	adc	rpartrand

;	from	rpartrand
;	div2
;	add	rpartrand
;	with	rpartrand2
;	div2	
;	with	rpartrand2
;	xor	r0
;
;	move	rt,rpartrand
;	move	rpartrand,rpartrand2
;	move	rpartrand2,rt

	endm


mmake_particles
	mpush	r11

	move	rtype,r0		; type 
	move	rlife,r1		; lifetime
	move	runique,r2		; unique number
	move	rcount,r3		; num particles

	ibt	r0,#ztab>>16
	romb

	miwt	rpartptr,m_particles

;	lms	rpartrand,[m_bigz]
;	iwt	rpartrand,#$1234
;	lms	rpartrand,[m_rand]
	lms	rpartrand,[m_particlerand]

;	iwt	rpartrand,#50580
;	iwt	rpartrand2,#31060

	miwt	r12,maxparticles

	mcache

	move	r13,pc	

;	mloadb		r0,part_LIFE,rpartptr,rt
 	ldb		[rpartptr]
	lob
;	mlbne		.next
	bne		.next
	nop

	sub		r0
	mstorew2	r0,part_POSX,rpartptr,rt
	mstorew2	r0,part_POSY,rpartptr,rt
	mstorew2	r0,part_POSZ,rpartptr,rt

	mstorew2	runique,part_UNIQUE,rpartptr,rt

;	mstoreb2	rlife,part_LIFE,rpartptr,rt
	from		rlife
 	stb		[rpartptr]

	ifeq	0
	ibt	r0,#1
	cmp	rtype
	mlbeq	.biggendexplosion
	ibt	r0,#2
	cmp	rtype
	mlbeq	.fireup
	ibt	r0,#3
	cmp	rtype
	mlbeq	.firedown
	ibt	r0,#4
	cmp	rtype
	mlbeq	.bigtabexplosion
	ibt	r0,#5
	cmp	rtype
	mlbeq	.smallgendexplosion
	ibt	r0,#6
	cmp	rtype
	mlbeq	.smalltabexplosion
	ibt	r0,#7
	cmp	rtype
	mlbeq	.smallfasttabexplosion
	endc

.done
	dec	rcount
	beq	.end
	nop

.next
;	miwt	r0,part_len
;	with	rpartptr
;	add	r0

	with	rpartptr
	add	#part_len

	loop
	nop

.end
	sms	[m_particlerand],rpartrand

	mpop	pc
	nop



;-----------------------------------------------
.smalltabexplosion
		  
	from		rcount
	and		#15
	from		rlife
	add		r0
	sub		#7
	mstoreb2	r0,part_LIFE,rpartptr,rt

	ibt	r0,#partF_fadeout
	mstoreb2	r0,part_FLAGS,rpartptr,rt

	move	r0,rcount
	dec	r0
	add	r0
	miwt	rt,particle_circle
	to	r14
	add	rt

	getbs
	inc	r14
	div2
	mstoreb2	r0,part_VX,rpartptr,rt
	mstorew2	r0,part_POSX,rpartptr,rt

	getbs
	div2
	mstoreb2	r0,part_VY,rpartptr,rt
	mstorew2	r0,part_POSY,rpartptr,rt

	mparticlerand
	miwt	r0,31
 	and	rpartrand
;	miwt	rt,15
;	sub	rt
	sub	#15
	mstoreb2	r0,part_VZ,rpartptr,rt
	mstorew2	r0,part_POSZ,rpartptr,rt

	ibt	rvec,#4
	ibt	r0,#1
	and	r12
	beq	.stcol
	nop
	ibt	rvec,#14
.stcol
	mstoreb2	rvec,part_COLOUR,rpartptr,rt

	mlbra	.done

;-----------------------------------------------
.bigtabexplosion
		  
	from		rcount
	and		#15
	from		rlife
	add		r0
	sub		#7
	mstoreb2	r0,part_LIFE,rpartptr,rt

	ibt	r0,#partF_fadeout
	mstoreb2	r0,part_FLAGS,rpartptr,rt

	move	r0,rcount
	dec	r0
	add	r0
	miwt	rt,particle_circle
	to	r14
	add	rt

	getbs
	inc	r14
	mstoreb2	r0,part_VX,rpartptr,rt
	mstorew2	r0,part_POSX,rpartptr,rt

	getbs
	mstoreb2	r0,part_VY,rpartptr,rt
	mstorew2	r0,part_POSY,rpartptr,rt

	mparticlerand
	miwt	r0,63
 	and	rpartrand
	miwt	rt,31
	sub	rt
	mstoreb2	r0,part_VZ,rpartptr,rt
	mstorew2	r0,part_POSZ,rpartptr,rt

	ibt	rvec,#4
	ibt	r0,#1
	and	r12
	beq	.btcol
	nop
	ibt	rvec,#14
.btcol
	mstoreb2	rvec,part_COLOUR,rpartptr,rt

	mlbra	.done

;-----------------------------------------------
.firedown

;	ibt		r0,#partF_GRAVITY
	sub		r0
	mstoreb2	r0,part_FLAGS,rpartptr,rt

	mparticlerand
	ibt	r0,#15
 	and	rpartrand
	ibt	rt,#7
	sub	rt
	mstoreb2	r0,part_VX,rpartptr,rt
	mabs	r0,r0
	move	rvec,r0

	mparticlerand
	ibt	r0,#7
 	and	rpartrand
	ibt	rt,#50
	add	rt
	mstoreb2	r0,part_VY,rpartptr,rt
	
	mparticlerand
	ibt	r0,#15
 	and	rpartrand
	ibt	rt,#7
	sub	rt
	mstoreb2	r0,part_VZ,rpartptr,rt
	mabs	r0,r0
	with	rvec
	add	r0

	mparticlerand	
	ibt	r0,#3
	and	rpartrand
	bne	.nr1
	nop
	ibt	r0,#1
.nr1
	inc	r0	

	mstoreb2	r0,part_COLOUR,rpartptr,rt

	mlbra	.done



;-----------------------------------------------
.fireup

	ibt		r0,#partF_GRAVITY
	mstoreb2	r0,part_FLAGS,rpartptr,rt

	mparticlerand
	ibt	r0,#15
 	and	rpartrand
	ibt	rt,#7
	sub	rt
	mstoreb2	r0,part_VX,rpartptr,rt
	mabs	r0,r0
	move	rvec,r0

	mparticlerand
	ibt	r0,#7
 	and	rpartrand
	ibt	rt,#-40
	add	rt
	mstoreb2	r0,part_VY,rpartptr,rt
	
	mparticlerand
	ibt	r0,#15
 	and	rpartrand
	ibt	rt,#7
	sub	rt
	mstoreb2	r0,part_VZ,rpartptr,rt
	mabs	r0,r0
	with	rvec
	add	r0

	mparticlerand	
	ibt	r0,#3
	and	rpartrand
	bne	.nr
	nop
	ibt	r0,#1
.nr
	inc	r0	

	mstoreb2	r0,part_COLOUR,rpartptr,rt

	mlbra	.done

;-----------------------------------------------
.smallgendexplosion
	ifeq	1

;	ibt	r0,#0				partF_LINE
	sub	r0
	mstoreb2	r0,part_FLAGS,rpartptr,rt

	ibt	rt2,#31
.sagain
	mparticlerand
;	miwt	r0,31
	from	rt2
 	and	rpartrand
;	miwt	rt,15
;	sub	rt
	sub	#15
	mstoreb2	r0,part_VX,rpartptr,rt
	mabs	r0,r0
	move	rvec,r0


	mparticlerand
;	miwt	r0,31
	from	rt2
 	and	rpartrand
;	miwt	rt,15
;	sub	rt
	sub	#15
	mstoreb2	r0,part_VY,rpartptr,rt
	mabs	r0,r0
	with	rvec
	add	r0
	
	mparticlerand
;	miwt	r0,31
	from	rt2
 	and	rpartrand
;	miwt	rt,15
;	sub	rt
	sub	#15
	mstoreb2	r0,part_VZ,rpartptr,rt
	mabs	r0,r0
	with	rvec
	add	r0

	ibt	r0,#25		; if vector too big then loop around again..
	sub	rvec		; ...this makes a circle explosion!
	bmi	.sagain
	nop

	ibt	rvec,#4
	ibt	r0,#1
	and	r12
	beq	.scol
	nop
	ibt	rvec,#14
.scol

	mstoreb2	rvec,part_COLOUR,rpartptr,rt
	endc
	mlbra	.done

;-----------------------------------------------
.biggendexplosion
	ifeq	1
	ibt	r0,#0				partF_LINE
	mstoreb2	r0,part_FLAGS,rpartptr,rt

	ibt	rt2,#63

.again
	mparticlerand
;	miwt	r0,63
	from	rt2
 	and	rpartrand
;	miwt	rt,31
	ibt	rt,#31
	sub	rt
	mstoreb2	r0,part_VX,rpartptr,rt
	mabs	r0,r0
	move	rvec,r0

	mparticlerand
;	miwt	r0,63
	from	rt2
 	and	rpartrand
;	miwt	rt,31
	ibt	rt,#31
	sub	rt
	mstoreb2	r0,part_VY,rpartptr,rt
	mabs	r0,r0
	with	rvec
	add	r0
	
	mparticlerand
;	miwt	r0,63
	from	rt2
 	and	rpartrand
;	miwt	rt,31
	ibt	rt,#31
	sub	rt
	mstoreb2	r0,part_VZ,rpartptr,rt
	mabs	r0,r0
	with	rvec
	add	r0

	ibt	r0,#50		; if vector too big then loop around again..
	sub	rvec		; ...this makes a circle explosion!
	bmi	.again
	nop


	ibt	rvec,#4
	ibt	r0,#1
	and	r12
	beq	.col
	nop
	ibt	rvec,#14
.col

	mstoreb2	rvec,part_COLOUR,rpartptr,rt
	endc
	mlbra	.done

;-----------------------------------------------
.smallfasttabexplosion

	from		rcount
	and		#15
	from		rlife
	add		r0
	sub		#7
	mstoreb2	r0,part_LIFE,rpartptr,rt
		  
	ibt	r0,#partF_fadeout
	mstoreb2	r0,part_FLAGS,rpartptr,rt

	move	r0,rcount
	dec	r0
	add	r0
	miwt	rt,particle_circle
	to	r14
	add	rt

	getbs
	inc	r14
	mstoreb2	r0,part_VX,rpartptr,rt
	mstorew2	r0,part_POSX,rpartptr,rt

	getbs
	mstoreb2	r0,part_VY,rpartptr,rt
	mstorew2	r0,part_POSY,rpartptr,rt

	mparticlerand
	miwt	r0,63
 	and	rpartrand
	miwt	rt,31
	sub	rt
	mstoreb2	r0,part_VZ,rpartptr,rt
	mstorew2	r0,part_POSZ,rpartptr,rt

	ibt	rvec,#4
	ibt	r0,#1
	and	r12
	beq	.sftcol
	nop
	ibt	rvec,#14
.sftcol
	mstoreb2	rvec,part_COLOUR,rpartptr,rt

	mlbra	.done

;-----------------------------------------------




;*****************************************************************************


partprojpnt 	MACRO	jmp to \3 if off screen. \1,\2,r6 (x,y,z) -> \1,\2 (projx,projy)
;	move	r6,\3
	miwt	r0,maxztab
	sub	r6
	bpl	.1\@
	nop
	miwt	r6,maxztab-1
.1\@

	miwt	r0,256
	sub	r6
	bmi	.4\@
	nop
	beq	.4\@
	nop

	ifeq	1
	from	\1
	add	\1
;	bcs	.4\@
	nop
	move	\1,r0
	from	\2
	add	\2
;	bcs	.4\@
	nop
	move	\2,r0
	with	r6
	add	r6
;	mlbra	.1\@
	endc

	mlbra	\3

.4\@
	with	r6
	bic	#1

	miwt	r0,ztab
	to	r14
	add	r6
	mgetw	r6		; 32767/z

	from	\1
	fmult
	rol
	ibt	rmhi,#mvanishx		; vanishx
	to	\1
	add	rmhi

	miwt	rmlo,mrightclp-1	; x clip check
	from	\1
	sub	rmlo
	mlbcs	\3
	add	rmlo

	from	\2
	fmult
	rol
	ibt	rmhi,#mvanishy		; vanishy
	to	\2
	add	rmhi

	miwt	rmhi,mbotclp-1	; y clip check
	from	\2
	sub	rmhi
	mlbcs	\3
	add	rmhi

	ENDM


;*****************************************************************************
; entry:
; 	 r2 : unique object number


rpartptr	equr	11
rt		equr	4
runique	equr	7

; proj particles
rmlo	equr	4
rmhi	equr	5
rz1	equr	6
;rz2	equr	12
rz2	equr	13

;line draw
rx1	equr	r1
ry1	equr	r2
rx2	equr	r3
ry2	equr	r9
rxi	equr	r5
ryi	equr	r6
rlgrad	equr	r8
rcnt	equr	r12

rbigx	equr	3
rbigy	equr	8
rbigz	equr	9


mshow_particles
	mpush	r11

	sub	r0
	cmode

	move	runique,r2		; unique number

	ibt	r0,#ztab>>16
	romb

;	miwt	rpartptr,m_particles
	miwt	rpartptr,(m_particles+part_UNIQUE)
;	miwt	r0,maxparticles
;	sms	[m_cnt],r0

	miwt	rcnt,maxparticles

	mcache

;-----------------------------------------------------------------------
mrotpartloop

;	mloadw	r0,part_UNIQUE,rpartptr
;	cmp	runique
;	mlbne	.next

	ldw	[rpartptr]
	sub	runique
	beq	.gotone
	nop

.next
	with	rpartptr
	add	#part_len

	dec	rcnt
	bne	mrotpartloop
	nop


;	miwt	r0,part_len
;	with	rpartptr
;	add	r0

;	lms	r0,[m_cnt]
;	dec	r0
;	sbk
;	mlbne	mrotpartloop
;	nop

.end
	mpop	pc
	nop



.gotone	
	with	rpartptr
	sub	#part_UNIQUE

	mloadb	r0,part_VX,rpartptr
	sex
	mloadw	rx1,part_POSX,rpartptr
	move	rx2,rx1
	add	rx1
	sbk	
	lms	rt,[m_bigx]
	to	rx1
	add	rt
;	move	rx1,r0

	mloadb	r0,part_VY,rpartptr
	sex
	mloadw	ry1,part_POSY,rpartptr
	move	ry2,ry1
	add	ry1
	sbk	
	lms	rt,[m_bigy]
	to	ry1
	add	rt
;	move	ry1,r0

	mloadb	r0,part_VZ,rpartptr
	sex
	mloadw	rz1,part_POSZ,rpartptr
	move	rz2,rz1
	add	rz1
	sbk	
	lms	rt,[m_bigz]
	to	rz1
	add	rt
;	move	rz1,r0

	mloadb	rmhi,part_FLAGS,rpartptr
;	ibt	rt,#partF_objalive
;	or	rt
	from	rmhi
	or	#partF_objalive
	mstoreb2	r0,part_FLAGS,rpartptr,rt

;	mloadb	r0,part_FLAGS,rpartptr
;	ibt	rt,#partF_GRAVITY
;	and	rt
	from	rmhi
	and	#partF_GRAVITY
	beq	.ngrav
	nop

	mloadb	r0,part_VY,rpartptr
;	sex
	add	#2
	mstoreb2	r0,part_VY,rpartptr,rt
.ngrav


	ifeq	1
	mloadb	r0,part_FLAGS,rpartptr
	ibt	rt,#partF_friction
	and	rt
	beq	.nfriction
	nop
	mloadb	r0,part_VX,rpartptr
	sex
	move	rt,r0
	div2
	div2
	with	rt
	sub	r0
	mstoreb2	rt,part_VX,rpartptr,r0

	mloadb	r0,part_VY,rpartptr
	sex
	move	rt,r0
	div2
	div2
	with	rt
	sub	r0
	mstoreb2	rt,part_VY,rpartptr,r0

	mloadb	r0,part_VZ,rpartptr
	sex
	move	rt,r0
	div2
	div2
	with	rt
	sub	r0
	mstoreb2	rt,part_VZ,rpartptr,r0

.nfriction
	endc


	mtest	rz1
;	mlbmi	.mprojpartoff
	bmi	.mprojpartoff
	nop

	partprojpnt	rx1,ry1,.mprojpartoff

	mloadb	r0,part_COLOUR,rpartptr
	colour

	mloadb	r0,part_FLAGS,rpartptr
;	ibt	rt,#partF_line
;	and	rt
	and	#partF_line
;	mlbeq	.dot
	bne	.line
	nop

.dot
	plot
	plot
	inc	ry1
	dec	rx1
	dec	rx1
	plot
	plot

.mprojpartoff
	with	rpartptr
	add	#part_UNIQUE

	mlbra	.next



.line
	lms	r0,[m_bigx]
	to	rx2
	add	rx2
	lms	r0,[m_bigy]
	to	ry2
	add	ry2
	lms	r0,[m_bigz]
	to	rz2
	add	rz2
;	mlbmi	.mprojpartoff
	bpl	.mprojpartoff
	nop

	move	r6,rz2
	partprojpnt	rx2,ry2,.mprojpartoff

	sms	[m_cnt],rcnt


	IFEQ	0
;-------------------------------------------------------------------------------
; line draw

;	mcache			; pete - don't need this cache (code < 512)

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

	lms	rcnt,[m_cnt]

	mlbra	.mprojpartoff
;	mlbra	.next

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

;-------------------------------------------------------------------------------
	ENDC

	lms	rcnt,[m_cnt]

	mlbra	.mprojpartoff
;	mlbra	.next



	printf	*-mrotpartloop,"%n"
			       

;*****************************************************************************

rt2		equr	6
rt		equr	7
rpart_len	equr	8
rpartptr	equr	9
rcmp		equr	5

mupdate_particles
	ibt	r0,#ztab>>16
	romb

	miwt	rpart_len,part_len

	miwt	rpartptr,m_particles

	miwt	r12,maxparticles

	ibt	rcmp,#32

	mcache

	move	r13,pc	

	ldb	[rpartptr]	; LIFE 
	lob

	beq	.dead
	nop

	dec	r0
	stb	[rpartptr]	; store LIFE

	move	rt,r0
	mloadb	r0,part_FLAGS,rpartptr
	ibt	rt2,#partF_fadeout
	and	rt2
	beq	.ncolf
	nop
	move	r0,rt

	cmp	rcmp
	bpl	.ncolf
	nop
	iwt	r14,#partfadetab
	with	r14
	add	r0
	getb	
	mstoreb2	r0,part_COLOUR,rpartptr,rt
	
.ncolf



	mloadb	r0,part_FLAGS,rpartptr
	move	rt2,r0


	and	#partF_objalive
	bne	.alive

	sub	r0
	stb	[rpartptr]

.dead
	mstorew2	r0,part_UNIQUE,rpartptr,rt


	with	rpartptr
	add	rpart_len

	loop	
	nop

	jmp	r11
	nop



.alive
	move	r0,rt2
;	ibt	rt,#~partF_objalive
;	and	rt

	bic	#partF_objalive
	mstoreb2	r0,part_FLAGS,rpartptr,rt

.next
;	miwt	r0,part_len
;	with	rpartptr
;	add	r0

	with	rpartptr
	add	rpart_len

	loop	
	nop

;	mpop	pc
	jmp	r11
	nop



