	incpublics	pal.ext

loadpal
	lda	palnumber
	beq	.norm
	cmp	#1
	beq	.1
	cmp	#2
	beq	.2
	cmp	#3
	beq	.3
	cmp	#4
	beq	.4
	cmp	#5
	beq	.5
	cmp	#6
	beq	.6
	cmp	#7
	beq	.7
	cmp	#8
	beq	.8
	cmp	#9
	beq	.9
	cmp	#10
	beq	.10
	cmp	#11
	beq	.11

.1
	lda	#gamepal_retro1
	bra	.doneloading
.2
	lda	#gamepal_retro2
	bra	.doneloading
.3
	lda	#gamepal_mist
	bra	.doneloading
.4
	lda	#gamepal_green
	bra	.doneloading
.5
	lda	#gamepal_rainbow
	bra	.doneloading
.6
	lda	#gamepal_rainbowk
	bra	.doneloading
.7
	lda	#gamepal_cyansc
	bra	.doneloading
.8
	lda	#gamepal_bluesc
	bra	.doneloading
.9
	lda	#gamepal_greensc
	bra	.doneloading
.10
	lda	#gamepal_whitesc
	bra	.doneloading
.11
	lda	#gamepal_blacksc
	bra	.doneloading

.norm
	lda	#gamepal_norm
.doneloading
	rtl
