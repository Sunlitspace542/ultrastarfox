
;***************************************************************************
;*                                                                         *
;*                               Star Fox                                  *
;*                              -----------                                *
;*                                                                         *
;*                           SuperNES version.                             *
;*                                                                         *
;*                                                                         *
;*                           Argonaut Software.      		               *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   File: NMI.ASM                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr: NMI handler.                                                    *
;*                                                                         *
;***************************************************************************
;Copy NMI handler to RAM at $0101
copy_to_0101_l
	php
	a8i16

	ldx	#nmihanend-nmihan-1
.codeloop2	lda.l	nmihan,x
	sta.l	$0101,x
	dex
	bpl	.codeloop2

	ldx	#xlen-1
.codeloop4	
	IFNE	fastrom
	lda.l	$828000,x
	elseif
	lda.l	$28000,x
	endc
	sta.l	xroutines,x
	dex
	bpl	.codeloop4

	plp
	rtl





nmihan
	blink	2
	blink	2
	brl	.nmi	;$0108	NMI
	nop		;$010b
.irq	ai16		;$010c	irq
	pha
	lda.l	mflags
	bmi	.qexit
	phb
	disable
	phx
	phy
	ai8
	IFNE	FASTROM
	lda	#$80
	pha
	plb
	ELSEIF
	lda	#0
	pha
	plb
	ENDC

	nastyon
	jsl	irqcode_l
	a8
	inc	framec
	lda	timeupr
	bra	.exit
	longa
.qexit	pla
	rti
.brk
.nmi
	ai16
	pha
	phb
	phx
	phy
	a8
	IFNE	FASTROM
	lda	#$80
	pha
	plb
	ELSEIF
	lda	#0
	pha
	plb
	ENDC

	nastyoff
	jsl	fnmi_l
	nastyon
	a8
	lda	rdnmir

.exit	ai16
	ply
	plx
	plb
	pla	
	rti

nmihanend


