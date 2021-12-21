;***************************************************************************
;*                                                                         *
;*                               Star Fox                                  *
;*                              ----------                                 *
;*                                                                         *
;*                           SuperNES version.                             *
;*                                                                         *
;*                           Argonaut Software.      		               *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   File: MEM.ASM                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr: MEMORY ALLOCATION ROUTINES FOR STRATEGIES.                      *
;*_________________________________________________________________________*
;*                                                                         *
;*   Date: 28/10/92                                                        *
;*_________________________________________________________________________*
;*                                                                         *
;* Author:		Dylan Cuthbert.      				                       *
;*                                                                         *
;***************************************************************************

	INCPUBLICS	EXT\mem.ext

; free memory structure

	structure	heap
	struct		fm_next,2
	struct		fm_prev,2
	struct		fm_length,2
	struct		fm_size,0
fm_sizeof	equ		fm_size-heap

; stack structure

	structure	heap
	struct		sp_prev,2
	struct		sp_data,4
	struct		sp_size,0
sp_sizeof	equ		sp_size-heap

firstblock	=	2

;---------------------------------------------------------
; initialise_memory_l
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Description: Initialises free memory list
;---------------------------------------------------------
initmem_l
	php
	phb
	a8
	lda	#$7e
	pha
	plb		; switch data bank
	ai16

	ldx	#firstblock
	stz	fm_next,x
	stz	fm_prev,x

	lda	#heapsize-firstblock
	sta	fm_length,x

	stx	heap

	plb
	plp
	rtl


;---------------------------------------------------------
; avail_l
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Exit: a16 = amount of memory free
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Description: returns an approximate value for free mem
;---------------------------------------------------------

avail_l	LONGA
	php
	phb
	phx
	phy
	a8
	lda	#$7e
	pha
	plb
	a16

	sprint	0,4

	ldx	heap
	lda	#0
.addagain	clc
	adc	fm_length,x
	pha
	txa
;	printw
	lda	fm_length,x
;	printw
	pla
	ldy	fm_next,x
	tyx
	bne	.addagain

	ply
	plx
	plb
	plp
	rtl

;---------------------------------------------------------
; free_l
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Entry: a16 = address of block to be freed
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Description: Frees the specified block
;---------------------------------------------------------

free_l	LONGA
	cmp	#0
	bne	.tisok
	rtl
.tisok
	phx
	phy
	php
	phb
	i8
	ldx	#$7e
	phx
	plb
	i16

	dec	a
	dec	a
	sta	fmtemp1		; start pos
	tax
	clc
	adc	heap,x
	sta	fmtemp2		; end pos
	lda	heap,x
	sta	fmtemp3		; length

	ldy	heap
	lbeq	.newlist
.scanfree
	tya
	clc
	adc	fm_length,y
	cmp	fmtemp1
	beq	.afterit

	cpy	fmtemp2
	beq	.beforeit

	lda	fm_next,y
	tay
	bne	.scanfree
; if there is no easy insertion create a new block

	lda	heap,x
	sta	fm_length,x

	ldy	heap
	stx	heap

	txa
	sta	fm_prev,y
	tya
	sta	fm_next,x
	stz	fm_prev,x

	bra	.success

.afterit
; the block to free is after the block in y

	lda	fm_length,y
	clc
	adc	heap,x
	sta	fm_length,y	; just increase the length to include it
	tyx
	jsr	.optimise
	bra	.success

.beforeit
; the block to free is before the block in y

	lda	fm_length,y
	clc
	adc	heap,x
	sta	fm_length,x
	lda	fm_next,y
	sta	fm_next,x
	lda	fm_prev,y
	sta	fm_prev,x

; alter pointers to point to x rather than y
	txa
	ldy	fm_next,x
	beq	.endoflist	
	sta	fm_prev,y
.endoflist	ldy	fm_prev,x
	beq	.first
	sta	fm_next,y
	bra	.notfirst
.first	sta	heap
.notfirst

	jsr	.optimise
	bra	.success
	
.newlist
	stx	heap
	lda	heap,x
	sta	fm_length,x
	stz	fm_prev,x
	stz	fm_next,x
.success
.cantfree
	plb
	plp
	ply
	plx
	rtl

;**********
.delink
; delink x from free list (corrupts y)
	lda	fm_prev,x
	ldy	fm_next,x
	beq	.endoflist2
	sta	fm_prev,y
.endoflist2	tax
	beq	.first2
	tya
	sta	fm_next,x
	bra	.notfirst2
.first2	sty	heap
.notfirst2	rts

;**********
.optimise
; scans for blocks to optimise, block to optimise in x
	stx	fmtemp1	; start position
	txa
	clc
	adc	fm_length,x
	sta	fmtemp2	; end position

	ldy	heap
.nextscan	cpy	fmtemp2
	beq	.joinxy
	tya
	clc
	adc	fm_length,y
	cmp	fmtemp1
	beq	.joinyx

	lda	fm_next,y
	tay
	bne	.nextscan
	rts
; ok, if x<y
.joinxy
	lda	fm_length,x
	clc
	adc	fm_length,y
	sta	fm_length,x

	stx	fmtemp1
	tyx		; delink y from free block list
	jsr	.delink

	ldx	fmtemp1
;	jsr	.optimise	; recursive until fully optimised
	rts

; ok, if y<x
.joinyx
	lda	fm_length,y
	clc
	adc	fm_length,x
	sta	fm_length,y

	sty	fmtemp1
	jsr	.delink	; delink x from free block list

	ldx	fmtemp1
;	jsr	.optimise	; recursive until fully optimised
	rts

	

;---------------------------------------------------------
; alloc_l
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Entry: a16 = length of block wanted
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Exit:  a16 = address of block wanted (0 if unavailable)
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Description: Allocates memory block
;---------------------------------------------------------

alloc_l	LONGA
	phx
	phy
	php
	phb
	i8
	ldx	#$7e
	phx
	plb		; switch data bank
	i16

	inc	a
	and	#$fffe	; round to nearest word
	beq	.notfound
	inc	a
	inc	a		; allow for mem block header (length of block)
	cmp	#fm_sizeof	; minimum size is size of free block
	bcs	.noadjust
	lda	#fm_sizeof
.noadjust

	ldx	heap	; get first pointer
	beq	.notfound
.scanfree
	cmp	fm_length,x
	bcc	.getit
	beq	.getit
	ldy	fm_next,x
	tyx
	bne	.scanfree
	lda	#0
	bra	.notfound

; found a block in x; adjust free blocks
.getit
	sta	fmtemp1		; length to allocate
	lda	fm_length,x
	sec
	sbc	fmtemp1		; get difference
	cmp	#fm_sizeof	; enough room for free block?
	bcc	.remfreeblock
	beq	.remfreeblock
; if room for free block just adjust current free block's values
	sta	fm_length,x
	txa
	clc
	adc	fm_length,x
	tax
	lda	fmtemp1
	sta	heap,x		; store length of block
	inx
	inx
	txa			; return the alloc'd address
	bra	.success
.remfreeblock
	lda	fm_length,x	; set length to allocate max
	sta	fmtemp1
	stx	fmtemp2
; adjust the pointers to ignore current free block
	lda	fm_next,x
	ldy	fm_prev,x
	beq	.first
	sta	fm_next,y
	bra	.notfirst
.first	sta	heap
.notfirst	tax
	beq	.endoflist
	tya
	sta	fm_prev,x
.endoflist	ldx	fmtemp2		; restore pointer to block
	lda	fmtemp1
	sta	heap,x		; store length
	inx
	inx
	txa

.success
.notfound
	plb
	plp
	ply
	plx
	rtl

;---------------------------------------------------------
; salloc_l
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Entry: a16 = length of block wanted
;        x16 = alien to allocate block for
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Exit:  a16 = address of block wanted (0 if unavailable)
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Description: Allocates memory block for alien
;---------------------------------------------------------

salloc_l	longa
	longi

	clc
	adc	#2

	jsl	alloc_l
	cmp	#0
	beq	.exit
	phy
	tay

	lda	al_memptr,x
	sta	heap,y

	tya
	sta	al_memptr,x

	ply

	inc	a
	inc	a

.exit	rtl


;---------------------------------------------------------
; sfree_l
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Entry: a16 = address of block to be freed
;        x16 = alien to free block for
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Description: Frees memory block for an alien
;---------------------------------------------------------

sfree_l	longa
	longi

	phy
	phx

	dec	a
	dec	a

	sta	fmtemp1

	ldy	al_memptr,x
	beq	.none
	phx
	ldx	#0
.nextone
	cpy	fmtemp1
	beq	.found
	tyx
	ldy	heap,x
	bne	.nextone

	plx
	ply
	blink	2

	rtl
.found	lda	heap,y
	cpx	#0
	beq	.setstrat
	sta	heap,x	; store next alien ptr
	plx
	bra	.nosetstrat
.setstrat	plx
	sta	al_memptr,x
.nosetstrat
	tya
	jsl	free_l	; free it
	
.none
	plx
	ply
	rtl

;---------------------------------------------------------
; sallfree_l
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Entry: x16 = alien block
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Description: Frees ALL memory blocks for an alien
;---------------------------------------------------------

sallfree_l
	longi
	phx
	phy
	php
	phb
	a8
	lda	#$7e
	pha
	plb
	a16

	ldy	al_memptr,x
	beq	.nothing
	phx
.andagain
	ldx	heap,y
	tya
	jsl	free_l
	txy
	bne	.andagain

	plx
	stz	al_memptr,x
.nothing
	plb
	plp
	ply
	plx
	rtl


;-------------------------------------------------------------
; mpush_l
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Entry: a16 = stack pointer
;        stackdata.32 = data to push
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Exit:  returns a16=0 if failed
;        returns carry if failed
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Description: Pushes values in stackdata onto a virtual stack
;-------------------------------------------------------------

mpush_l	longa
	phx
	php
	phb
	pha
	a8
	lda	#$7e
	pha
	plb
	a16

	lda	#sp_sizeof
	jsl	alloc_l
	cmp	#0
	bne	.notfailed
	plx	; dummy, irimasen
	plb
	plp
	plx
	sec
	rtl

.notfailed	tax
	pla
	sta	sp_prev,x
	lda	stackdata
	sta	sp_data,x
	lda	stackdata+2
	sta	sp_data+2,x
	txa
.failed
	plb
	plp
	plx
	clc
	rtl


;-------------------------------------------------------------
; smpush_l
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Entry: a16 = stack pointer
;        x16 = alien block
;        stackdata.32 = data to push
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Exit:  returns a16=0 if failed
;        returns carry if failed
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Description: Pushes values in stackdata onto a virtual stack
;              and resource tracks the alloc for a strategy
;-------------------------------------------------------------

smpush_l	longa
	phx
	php
	phb
	pha
	a8
	lda	#$7e
	pha
	plb
	a16

	lda	#sp_sizeof
	jsl	salloc_l
	cmp	#0
	bne	.notfailed
	plx	; dummy, irimasen
	plb
	plp
	plx
	sec
	rtl

.notfailed	tax
	pla
	sta	sp_prev,x
	lda	stackdata
	sta	sp_data,x
	lda	stackdata+2
	sta	sp_data+2,x
	txa
.failed
	plb
	plp
	plx
	clc
	rtl




;-------------------------------------------------------------
; mpull_l
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Entry: a16 = stack pointer
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Exit:  returns a16=0 if failed
;        stackdata.32 = pulled data
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Description: Pulls values from the stack to stackdata
;-------------------------------------------------------------

mpull_l	longa
	phx
	php
	phb
	i8
	ldx	#$7e
	phx
	plb
	i16

	tax
	beq	.endofstack
	lda	sp_prev,x
	pha
	lda	sp_data,x
	sta	stackdata
	lda	sp_data+2,x
	sta	stackdata+2
	txa
	jsl	free_l
	pla
.endofstack
	plb
	plp
	plx
	rtl


;-------------------------------------------------------------
; smpull_l
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Entry: a16 = stack pointer
;        x16 = alien block
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Exit:  returns a16=0 if failed
;        stackdata.32 = pulled data
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; Description: Pulls values from the stack to stackdata
;              with resource tracking for strategies
;-------------------------------------------------------------

smpull_l	longa
	phx
	phy
	php
	phb
	pha
	a8
	lda	#$7e
	pha
	plb
	a16
	ply

	beq	.endofstack
	lda	sp_prev,y
	pha
	lda	sp_data,y
	sta	stackdata
	lda	sp_data+2,y
	sta	stackdata+2
	tya
	jsl	sfree_l
	pla
.endofstack
	plb
	plp
	ply
	plx
	rtl


