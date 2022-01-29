
;***************************************************************************
;*                                                                         *
;*                               Star Fox                                  *
;*                              -----------                                *
;*                                                                         *
;*                           SuperNES version.                             *
;*                                                                         *
;*                                                                         *
;*                           Argonaut Software.                            *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   File: MOTHER.ASM                                                      *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr: The routines to deal with the mother objects                    *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   Date: 12/2/92                                                         *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;* Author:						                                           *
;*                                                                         *
;*	Dylan Cuthbert				                                           *
;*                                                                         *
;***************************************************************************

	public	bemother_l

;----------------------------------------------------------------------
; bemother:
; this routine makes the specified alien a mother ship type and will
; create objects according to the list pointed to by al_ptr
;----------------------------------------------------------------------

bemother_l
	php
	a16
.nxtone
	lda	al_sword1,x
	bmi	.doobj
	bne	.out
.doobj
	phx
	lda	al_ptr,x
	txy
	tax

	pea	(.ret-1)&WM

	lda.l	moth_count,x
	sta.w	al_sword1,y

	lda.l	moth_ctrl,x
	and	#$ff
	tax
	jmp	(.motherjmp&WM,x)

.motherjmp	dw	motherobj&WM
	dw	motherloop&WM
	dw	motherend&WM
	dw	motherrnd&WM
	dw	mothergoto&WM
	dw	motherwait&WM
	dw	mothercount&WM
	dw	motherjump&WM

.ret
	plx
	bra	.nxtone


.out	sec
	sbc	lastzchange
	sta	al_sword1,x
	plp
	rtl

;-----------------------
	longa
motherobj
	lda.w	al_ptr,y
	tax
	phy
	lda.w	al_worldx,y
	sta	x1
	lda.w	al_worldy,y
	sta	y1
	lda.w	al_worldz,y
	sta	z1
	phx

	ldx	allst
	l_add	allst,alfreelst,.nofreeblks
	txy
	plx
	a8
	jsl	init_objvars_l
	a16

	lda	x1
	clc
	adc.l	mo_x,x
	sta.w	al_worldx,y

	lda	y1
	clc
	adc.l	mo_y,x
	sta.w	al_worldy,y

	lda	z1
	clc
	adc.l	mo_z,x
	sta.w	al_worldz,y

	lda.l	mo_shape,x
	sta.w	al_shape,y

	lda.l	mo_strat,x
	sta.w	al_stratptr,y
	lda.l	mo_strat+1,x
	sta.w	al_stratptr+1,y

	phx
	tyx
	lda	#0
	sta.l	alx_collstratptr,x
	sta.l	alx_expstratptr,x
	plx

	a8
	lda	#0
	sta.w	al_flags,y
	sta.w	al_sflags,y
	sta.w	al_rotx,y
	sta.w	al_roty,y
	sta.w	al_rotz,y

	lda	#atzremove
	sta.w	al_type,y

	a16
	txa
	clc
	adc	#mo_sizeof
	tax

	ply
	txa
	sta.w	al_ptr,y
	rts

.nofreeblks
	a16
	pla	; (x)
	ply
	clc
	adc	#mo_sizeof
	sta.w	al_ptr,y
	rts


;-----------------------
	longa
motherwait
	lda.w	al_ptr,y
	clc
	adc	#moth_sizeof
	sta.w	al_ptr,y
	rts

;-----------------------
	longa
mothergoto
	lda.w	al_ptr,y
	tax

	lda.l	mg_loop,x
	sta.w	al_ptr,y

	rts

;-----------------------
	longa
motherjump
	lda.w	al_ptr,y
	tax
	phy

	lda.l	mj_func,x
	and	#255
	cmp	#mj_EQ
	beq	.eq
	cmp	#mj_NE
	beq	.ne
	cmp	#mj_GT
	beq	.gt
	cmp	#mj_LT
	beq	.lt
	bra	.nojump
.lt
	lda	motheraccum
	cmp.l	mj_val,x
	bcs	.jump
	bra	.nojump
.gt
	lda	motheraccum
	cmp.l	mj_val,x
	bcc	.jump
	bra	.nojump
.eq
	lda	motheraccum
	cmp.l	mj_val,x
	beq	.jump
	bra	.nojump
.ne
	lda	motheraccum
	cmp.l	mj_val,x
	bne	.jump
	bra	.nojump

.jump	ply
	lda.l	mj_addr,x
	sta.w	al_ptr,y
	rts
.nojump
	ply
	txa
	clc
	adc	#mj_sizeof
	sta.w	al_ptr,y
	rts

;-----------------------
	longa
mothercount
	lda.w	al_ptr,y
	tax
	phy
	phx
	stz	motheraccum
	lda.l	mc_shape,x
	ldx	allst
.nxtone
	cmp	al_shape,x
	bne	.noinc
	inc	motheraccum
.noinc	ldy	_next,x
	tyx
	bne	.nxtone

	plx
	ply
	txa
	clc
	adc	#mc_sizeof
	sta.w	al_ptr,y
	rts

;-----------------------
	longa
motherloop
	lda.w	al_ptr,y
	tax

	a8
	lda.l	ml_count,x
	sta	x1
	lda.w	al_sbyte3,y
	inc	a
	cmp	x1
	bmi	.okay

	lda	#0
	sta.w	al_sbyte3,y
	
	a16
	txa
	clc
	adc	#ml_sizeof
	sta.w	al_ptr,y
	rts

.okay	shorta
	sta.w	al_sbyte3,y
	a16
	lda.l	ml_loop,x
	sta.w	al_ptr,y

	rts

;-----------------------
	longa
motherend
	tyx
	s_remove_obj	x
	plx
	plx
	plp
	rtl



;-----------------------
	longa
motherrnd
	lda.w	al_ptr,y
	tax
	phy
	phx

; generate the random numbers
	a8
	jsl	random_l
	sta	x2
	jsl	random_l
	sta	x2+1

	jsl	random_l
	sta	y2
	jsl	random_l
	sta	y2+1

	jsl	random_l
	sta	z2
	jsl	random_l
	sta	z2+1
	a16

; now mask off the offsets

	lda.l	mo_x,x
	beq	.nox
	lsr	a
	sta	x1
	lda.l	mo_x,x
	dec	a
	and	x2
	sec
	sbc	x1
.nox
	clc
	adc.w	al_worldx,y
	sta	x1

	lda.l	mo_y,x
	beq	.noy
	lsr	a
	sta	y1
	lda.l	mo_y,x
	dec	a
	and	y2
	sec
	sbc	y1
.noy
	clc
	adc.w	al_worldy,y
	sta	y1

	lda.l	mo_z,x
	beq	.noz
	lsr	a
	sta	z1
	lda.l	mo_z,x
	dec	a
	and	z2
	sec
	sbc	z1
.noz
	clc
	adc.w	al_worldz,y
	sta	z1

	ldx	allst
	l_add	allst,alfreelst,.nofreeblks
	txy
	plx
	a8
	jsl	init_objvars_l
	a16

	lda	x1
	sta.w	al_worldx,y

	lda	y1
	sta.w	al_worldy,y

	lda	z1
	sta.w	al_worldz,y

	lda.l	mo_shape,x
	sta.w	al_shape,y

	lda.l	mo_strat,x
	sta.w	al_stratptr,y
	lda.l	mo_strat+1,x
	sta.w	al_stratptr+1,y

	phx
	tyx
	lda	#0
	sta.l	alx_collstratptr,x
	sta.l	alx_expstratptr,x
	plx

	a8
	lda	#0
	sta.w	al_flags,y
	sta.w	al_sflags,y
	sta.w	al_rotx,y
	sta.w	al_roty,y
	sta.w	al_rotz,y

	lda	#atzremove
	sta.w	al_type,y

	a16
	txa
	clc
	adc	#mo_sizeof
	tax

	ply
	txa
	sta.w	al_ptr,y
	rts

.nofreeblks
	a16
	pla	; (x)
	ply
	clc
	adc	#mo_sizeof
	sta.w	al_ptr,y
	rts




