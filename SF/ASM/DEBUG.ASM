;***************************************************************************
;*                                                                         *
;*                               Star Fox                                 *
;*                              ----------                                 *
;*                                                                         *
;*                           SuperNES version.                             *
;*                                                                         *
;*                           Argonaut Software.      		      *	   
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   File: DEBUG.ASM                                                       *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr: STRATEGY DEBUGGING ROUTINES.                                    *
;*_________________________________________________________________________*
;*                                                                         *
;*   Date: 3/9/92                                                          *
;*_________________________________________________________________________*
;*                                                                         *
;* Author:		Dylan Cuthbert.      				      *	
;*                                                                         *
;***************************************************************************

	IFNE	debuginfo

altype_shapeptr	=	1
altype_alptr		=	2
altype_norm		=	3
altype_flag		=	4
altype_zrel		=	5

signed		=	64


aldebug	MACRO	[alvar,type,x,y]
.1\@
	DB	.\@-.1\@
	DW	al_{alvar}
	DB	((SIZE_AL_{alvar}-1)<<7)!altype_{type}
	DW	{x}*col_size+{y}*32
	DB	"{alvar}",0
	DB	.\@-.1\@
.\@
	ENDM

aldebugend	MACRO
	DB	0
	ENDM

aliendebugtable
	aldebug	shape,shapeptr,0,4
	aldebug	worldx,norm,0,5
	aldebug	worldy,norm,0,6
	aldebug	worldz,zrel,0,7
	aldebug	rotx,norm!SIGNED,0,8
	aldebug	roty,norm!SIGNED,0,9
	aldebug	rotz,norm!SIGNED,0,10
;	aldebug	vel,norm!SIGNED,0,11
;	aldebug	animframe,norm,0,12
;	aldebug	colframe,norm,0,13
	aldebug	tx,norm,0,14


	aldebugend



	structure	aliendebugtable
	struct		ald_size,1
	struct		ald_var,2
	struct		ald_type,1
	struct		ald_scraddr,2
	struct		ald_text,0


	ENDC

; prints alien information about the specified alien

stratdebug_l
	IFEQ	debuginfo
	rtl
	ELSEIF

	php
	phb
	a8i16

	lda	#$7e
	pha
	plb

	lda	singlestep
	beq	.noforceentry
	sta	debugalien
	stz	singlestep
.noforceentry
	TESTKEYDOWN2	TRIGHT
	beq		.nottright
	inc		debugalien
	stz		selected
	stz		selected+1
	lda		#20
	sta		debugflash
.nottright

	TESTKEYDOWN2	TLEFT
	beq		.nottleft
	lda		debugalien
	beq		.nottleft
	cmp		#1
	beq		.nottleft
	dec		debugalien
	stz		selected
	stz		selected+1
	lda		#20
	sta		debugflash
.nottleft

	stz	alientemp
	stz	alientemp+1
	stz	freezestrats

	lda	debugalien
	lbeq	.notfound
	pha
	lda	#1
	sta	freezestrats
	pla

	ldy	allst
.andagain	tyx
	lbeq	.notfound
	ldy	_next,x
	dec	a
	bne	.andagain

	stx	alientemp

	ldx	#0

.mainloop
	lda.l	ald_size,x
	lbeq	.finished
	pha
	phx

	a16
	lda.l	ald_scraddr,x
	sta	printpt

	txa
	clc
	adc	#ald_text&WM
	sta	textpt
	a8

	cpx	selected
	bne	.nohilite
	lda	#$ff
	sta	hilite
	sta	hilite+1
.nohilite


	lda	#ald_text>>16
	sta	textpt+2

	jsl	printt_l

	stz	hilite
	stz	hilite+1

	a16
	lda	printpt
	clc
	adc	#col_size
	sta	printpt

	lda.l	ald_var,x
	clc
	adc	alientemp
	tay
	lda.w	0,y
	sta	x1
	a8

	lda.l	ald_type,x
	sta	aliendflags
	txy
	asl	a
	a16
	and	#127
	tax
	jmp	(.tab,x)
.tab	dw	.shapeptr&WM
	dw	.shapeptr&WM
	dw	.alptr&WM
	dw	.norm&WM
	dw	.flag&WM
	dw	.zrel&WM

.shapeptr	longa

	lda	x1
	clc
	adc	#sh_name

	sta	textpt
	a8
	stz	textpt+2

	jsl	printt_l

	jmp	.back


.zrel	longa
	ldx	playpt
	lda	x1
	sec
	sbc	al_worldz,x
	printw
	jmp	.back


.norm	longa
	lda	aliendflags
	bit	#128
	beq	.byte
	lda	x1
	printw
	jmp	.back
.byte
	bit	#SIGNED
	beq	.unsigned
	a8
	lda	x1
	printsd
	jmp	.back
.unsigned
	a8
	lda	x1
	printd
	jmp	.back

.alptr
.flag


.back
	a8
	

	plx
	pla
	a16
	and	#$ff
	sta	x1
	txa
	clc
	adc	x1
	tax
	a8
	jmp	.mainloop

.finished
	lda	gameflags
	ora	#gf_nozremove
	sta	gameflags

	TESTKEYDOWN2	SELECT
	lbeq		.nodup
	ldx		alientemp
	jsr		dup_alien
	lda		#2
	sta		debugalien
	lda		#20
	sta		debugflash
.nodup
	TESTKEYDOWN	A
	lbeq		.xzmove

	TESTKEYDOWN	LEFT
	lbeq		.norotleft
	a16
	lda		outvy
	sec
	sbc		#2*256
	sta		outvy
	a8
.norotleft
	TESTKEYDOWN	RIGHT
	lbeq		.norotright
	a16
	lda		outvy
	clc
	adc		#2*256
	sta		outvy
	a8
.norotright
	TESTKEYDOWN	UP
	lbeq		.norotup
	a16
	lda		outvx
	clc
	adc		#2*256
	sta		outvx
	a8
.norotup
	TESTKEYDOWN	DOWN
	lbeq		.norotdown
	a16
	lda		outvx
	clc
	sbc		#2*256
	sta		outvx
	a8
.norotdown

	jsl		calcbgscroll_l

	jmp		.notposback
.xzmove

	TESTKEYDOWN	X
	lbeq		.nozoomin
	a16
	lda		outdist
	sec
	sbc		#20
	sta		outdist
	a8

.nozoomin	TESTKEYDOWN	B
	lbeq		.nozoomout
	a16
	lda		outdist
	clc
	adc		#20
	sta		outdist
	a8
.nozoomout

	TESTKEYDOWN	LEFT
	lbeq		.notposleft
	a16
	lda		pviewposx
	sec
	sbc		#25
	sta		pviewposx
	a8
.notposleft
	TESTKEYDOWN	RIGHT
	lbeq		.notposright
	a16
	lda		pviewposx
	clc
	adc		#25
	sta		pviewposx
	a8
.notposright

	TESTKEYDOWN	UP
	lbeq		.notposfor
	a16
	lda		pviewposz
	clc
	adc		#25
	sta		pviewposz
	a8
.notposfor

	TESTKEYDOWN	DOWN
	lbeq		.notposback
	a16
	lda		pviewposz
	sec
	sbc		#25
	sta		pviewposz
	a8
.notposback

	TESTKEYDOWN2	DOWN
	lbeq		.notdown

	ldx	selected
	lda.l	ald_size,x
	a16
	and	#255
	sta	x1
	txa
	clc
	adc	x1
	tax
	a8
	lda.l	ald_size,x
	beq	.notdown
	stx	selected
.notdown

	TESTKEYDOWN2	UP
	lbeq		.notup

	ldx	#0
	stx	alientemp

	ldx	selected
	beq	.notup
	dex
	lda.l	ald_size,x
	inx
	a16
	and	#255
	sta	x1
	txa
	sec
	sbc	x1
	sta	selected
	a8
.notup


	TESTKEYDOWN2	RIGHT
	lbeq		.notleft

	TESTKEYDOWN2	Y
	lbeq		.nochanger2
	stz		x1
	lda		#1
	sta		x1+1
	bra		.carryonr2
.nochanger2
	TESTKEYDOWN2	A
	lbeq		.nochanger
	lda		#10
	bra		.carryonr
.nochanger
	lda		#1
.carryonr
	sta	x1
	stz	x1+1
.carryonr2
	jsr	altervar
	

.notleft
	TESTKEYDOWN2	LEFT
	lbeq		.notright

	TESTKEYDOWN2	Y
	lbeq		.nochangel2
	stz		x1
	lda		#-1
	sta		x1+1
	bra		.carryonl2
.nochangel2

	TESTKEYDOWN2	A
	lbeq		.nochangel
	lda	#-10
	bra	.carryonl
.nochangel
	lda	#-1
.carryonl
	sta	x1
	lda	#-1
	sta	x1+1
.carryonl2
	jsr	altervar
.notright

; flash the shape a bit
	lda	debugflash
	beq	.noflash
	dec	debugflash
	bra	.flashing
.noflash	TESTKEYDOWN2	A
	bne		.flashing
	stz	alientemp
	stz	alientemp+1
.flashing

	TESTKEYDOWN2	START
	beq		.nostart
	stz		debugalien
	lda		gameflags
	and		#~gf_nozremove
	sta		gameflags
.nostart
	TESTKEYDOWN	START
	beq		.nosinglestep

	lda		gameflags
	and		#~gf_nozremove
	sta		gameflags
	lda		debugalien
	sta		singlestep
	stz		debugalien
	stz		freezestrats

.nosinglestep

.notfound
	plb
	plp
	rtl



;-----------------------------------------------------------------
find_shape
	php
	ai16

	ldx	#0
.search
	lda.l	shapes,x
	beq	.notfound
	cmp	x1
	beq	.found
	inx
	inx
	bra	.search


.found
	plp
	sec
	rts
.notfound
	plp
	clc
	rts

;-----------------------------------------------------------------
; this creates an exact copy of an alien
; x is alien to copy

dup_alien
	php
	a8i16

	phx
	ldx		allst
	l_add	allst,alfreelst,.badobj
	txy
	bra	.safe
.badobj	plx
	jmp	.exit
.safe	plx
	phx
	phy

	lda	#al_size-4
.mada	pha

	lda	4,x
	sta.w	4,y

	inx
	iny
	pla
	dec	a
	bne	.mada

	ply
	plx

	lda	#al_size
.mada2	pha

	lda.w	xalblks-alblks,x
	sta.w	xalblks-alblks,y

	inx
	iny
	pla
	dec	a
	bne	.mada2

.exit
	plp
	rts


;-----------------------------------------------------------------


altervar
	php
	a8i16
	ldx	selected
	a16
	lda.l	ald_var,x
	clc
	adc	alientemp
	tay
	a8
	lda.l	ald_type,x
	and	#63
	cmp	#altype_shapeptr
	beq	.altershape
	cmp	#altype_zrel
	beq	.cando
	cmp	#altype_norm
	bne	.cantchangeyet
.cando
	lda.l	ald_type,x
	bit	#128
	beq	.bytealterr
	a16
.bytealterr
	lda.w	0,y
	clc
	adc	x1
	sta.w	0,y
	a8
.cantchangeyet
	plp
	rts
.altershape
	a16
	lda	x1
	pha
	lda.w	0,y
	sta	x1
	jsr	find_shape
	pla
	bcc	.out
	bmi	.dec
	lda	#2
	bra	.setit
.dec	lda	#-2
.setit	sta	x1

	txa
	clc
	adc	x1
	bmi	.out
	tax

	lda.l	shapes,x
	beq	.out
	sta.w	0,y
.out
	plp
	rts

	ENDC






