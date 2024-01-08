
	INCPUBLICS	EXT\draw.ext

	IFEQ	0

clip_plot_l
	jsr	clip_plot
	rtl
noplot	rts

clip_plot	php
	ai16
	lda	xs
	sta	plotx1
	lda	ys
	sta	ploty1
	lda	plotx1
	cmp	clx1
	bmi	noplot
	lda	clx2
	cmp	plotx1
	bmi	noplot
	lda	ploty1
	cmp	cly1
	bmi	noplot
	lda	cly2
	cmp	ploty1
	bmi	noplot
	jmp	plot0


plot
	php
	ai16
plot0
	phx
	phy
	lda	plotx1	;0
	asl	a
	tay
	lda	ploty1
	asl	a
	tax		;17
	lda	pyoftab,x
	adc	pxoftab,y
	adc	drawmap
	tax		;17
	lda.l	bitmapbase,x
	and	pbittabn,y
	sta	pmask
	lda	mask1
	and	pbittab,y
	ora	pmask	;30
	sta.l	bitmapbase,x
	lda.l	bitmapbase+16,x
	and	pbittabn,y
	sta	pmask
	lda	mask2
	and	pbittab,y	;30
	ora	pmask
	sta.l	bitmapbase+16,x	;10
	ply
	plx
	plp
	rts


printt_l
	phb
	php
	ai16
	pha
	phx
	phy

	a8i16
	IFNE	FASTROM
	lda	#$80
	pha
	plb
	ELSEIF
	lda	#0
	pha
	plb
	ENDC

	ldy	#0

.andagain
	lda.l	[textpt],y
	beq	.finished
	phy

	cmp	#"_"
	bne	.notunder
	lda	#42
	bra	.drawit
.notunder
	cmp	#" "
	bne	.notspace
	lda	#-1
	bra	.drawit
.notspace
	cmp	#"a"
	bcc	.notlow
	sec
	sbc	#"a"-10
	bra	.drawit
.notlow
	cmp	#"A"
	bcc	.notchar
	sec
	sbc	#"A"-10
	bra	.drawit
.notchar	sec
	sbc	#"0"
.drawit
	jsr	printchar
	ply
	iny
	jmp	.andagain
.finished

	ai16
	ply
	plx
	pla
	plp
	plb
	rtl



	rts


printw_l
	pha
	xba
	jsl	printb_l
	xba
	jsl	printb_l
	pla
	rtl

printbd_l
	phb
	pha
	phx
	phy
	php

	a8i16
	sta	printbtemp
	IFNE	FASTROM
	lda	#$80
	pha
	plb
	ELSEIF
	lda	#0
	pha
	plb
	ENDC

	lda	printbtemp
	jsr	printbd

	plp
	ply
	plx
	pla
	plb
	rtl

printbsd_l
	phb
	pha
	phx
	phy
	php

	a8i16
	sta	printbtemp
	IFNE	FASTROM
	lda	#$80
	pha
	plb
	ELSEIF
	lda	#0
	pha
	plb
	ENDC

	lda	printbtemp
	jsr	printbsd

	plp
	ply
	plx
	pla
	plb
	rtl
	

printb_l
	phb
	pha
	phx
	phy
	php

	a8i16
	sta	printbtemp
	IFNE	FASTROM
	lda	#$80
	pha
	plb
	ELSEIF
	lda	#0
	pha
	plb
	ENDC
	lda	printbtemp
	jsr	printb

	plp
	ply
	plx
	pla
	plb
	rtl

	ENDC

	shorta
printbsd
;	IFEQ	debuginfo
;printchar
;	rts
;	ELSEIF

	pha

	cmp	#0
	bpl	.ok
	lda	#26+10
	jsr	printchar
	pla
	eor	#255
	inc	a
	jmp	printbd
.ok
	lda	#26+15
	jsr	printchar
	pla
	jmp	printbd

;	ENDC

	shorta
printbd
;	IFEQ	debuginfo
;	rts
;printb_l
;printbsd_l
;printbd_l
;printw_l
;printt_l
;	rtl
;	ELSEIF

	cmp	#200
	bcc	.not200
	sec
	sbc	#200
	pha
	lda	#2
	bra	.printit
.not200	cmp	#100
	bcc	.nofirstchar
	sec
	sbc	#100
	pha
	lda	#1
	bra	.printit
.nofirstchar	pha
	lda	#-1	; print space
.printit
	pha
	cmp	#-1
	beq	.noprt2
	jsr	printchar
.noprt2
	pla
	a16
	and	#255
	tay
	a8
	pla

	a16
	and	#255
	tax

	a8
	lda.l	.decimaltable,x
	pha
	lsr	a	
	lsr	a	
	lsr	a	
	lsr	a
	bne	.nochk
	cpy	#255
	beq	.noprt
.nochk
	jsr	printchar
.noprt

	pla
	and	#$f
	jsr	printchar

	rts


.decimaltable
tmp	=	0

	REPT	100
	defs	1,tmp
	run	" db $",tmp/10,tmp-((tmp/10)*10)
tmp	=	tmp+1
	ENDR


printchar
	php
	ai16
	pha
	lda	printpt
	clc
	adc	drawmap
	tax
	pla
	inc	a
	and	#$00ff
	asl	a
	asl	a
	asl	a
	asl	a
	tay

	lda	#8
	sta	tpy
	phx

.1	lda	debugspace,y
	eor	hilite
	and	#$ff00
	sta.l	bitmapbase,x
	lda	debugspace,y
	sta.l	bitmapbase+16,x
	inx
	inx
	iny
	iny
	dec	tpy
	bne	.1
	pla
	clc
	adc	#col_size
	tax
	sec
	sbc	drawmap

	cmp	#col_size*num_col
	bcc	.booboo
	sec
	sbc	#col_size*num_col-32
	
.booboo
	sta	printpt
.exit
	plp
	rts


;	ENDC

printb
;	IFEQ	debuginfo
;	rts
;	ELSEIF

	php
	ai16
	pha
	lda	printpt
	clc
	adc	drawmap
	tax
	pla
	pha
	and	#$00f0
	tay

	lda	#8
	sta	tpy
	phx

.1	lda	debugchars,y
	and	#$ff00
	sta.l	bitmapbase,x
	lda	debugchars,y
	sta.l	bitmapbase+16,x
	inx
	inx
	iny
	iny
	dec	tpy
	bne	.1
	pla
	clc
	adc	#col_size
	tax
	adc	#col_size
	sec
	sbc	drawmap

	cmp	#col_size*num_col
	bcc	.booboo
	sec
	sbc	#col_size*num_col-32
	
.booboo
	sta	printpt
	pla
	and	#$000f
	asl	a
	asl	a
	asl	a
	asl	a
	tay
	lda	#8
	sta	tpy
.2	lda	debugchars,y
	and	#$ff00
	sta.l	bitmapbase,x
	lda	debugchars,y
	sta.l	bitmapbase+16,x
	inx
	inx
	iny
	iny
	dec	tpy
	bne	.2
	plp
	rts


;binary print byte
printbb_l
	php
	ai8
	sta	tpy
	rept	4
	lda	#0
	lsr	tpy
	php
	lsr	tpy
	rol	a
	asl	a
	asl	a
	asl	a
	plp
	rol	a
	pha
	endr
	rept	4
	pla
	jsr	printb
	endr
	plp
	rtl

;	ENDC



