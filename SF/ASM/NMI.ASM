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
;*   File: NMI.ASM                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr: NMI/IRQ handler.                                                *
;*                                                                         *
;***************************************************************************

; Copies NMI/IRQ handler to RAM at addr $0101
copy_to_0101_l
	php ; Push Processor status to stack

	ai16
	ldx	#nmihan&WM ; src data addr
	ldy	#$0101 ; dest data addr
	lda	#nmihanend-nmihan-1 ; len of data to copy
	IFNE	FASTROM
	sasm_mvn	$9f,$80
	ELSEIF
	sasm_mvn	$1f,$00
	ENDC

	IFNE	msu
; Copy MSU fade handler to $0162 (right after the NMI/IRQ handler in RAM)
	ai16
	ldx	#msufadehan&WM ; src data addr
	ldy	#$0162 ; dest data addr
	lda	#msufadehanend-msufadehan-1 ; len of data to copy
	IFNE	FASTROM
	sasm_mvn	$9f,$80
	ELSEIF
	sasm_mvn	$1f,$00
	ENDC
	ENDC

	a8i16 ; set A to 8 bit and X/Y to 16 bit

; old NMIHAN uploader code, retained for future reference
;	ldx	#nmihanend-nmihan-1 ; Load size of NMI handler routine into X(?)
;.codeloop2	lda.l	nmihan,x ; Load (Long) NMIHAN + size of NMIHAN into A(?)
;	sta.l	$0101,x ; Store A (Long) at $0101 + size of NMIHAN(?)
;	dex ; Decrement X
;	bpl	.codeloop2 ; repeat until x = 0

	; xlen = 22*1024+450
	ldx	#xlen-1 ; Load xlen-1 (22977) into X
.codeloop4	
	IFNE	fastrom ; Start conditional: if FASTROM !=0 (=1)
	lda.l	$828000,x ; Load contents of addr $828000 + 22977 into A (Long)
	elseif ; else if FASTROM =0
	lda.l	$28000,x ; Load contents of addr $28000 + 22977 into A (Long)
	endc ; End conditional
	sta.l	xroutines,x ; Store (Long) contents of A into xroutines variable + 22977
	dex ; decrement X
	bpl	.codeloop4 ; repeat until x = 0

	plp ; Pull Processor status from stack
	rtl ; Return from subroutine (Long)

;---------------------------------------------------------------------------

nmihan ; Start of NMI handler
	blink	2 ; Yellow BLINK
	blink	2 ; Yellow BLINK
	brl	.nmi	;$0108	NMI ; Branch to .NMI sublabel
	nop		;$010b ; No Operation
.irq	ai16		;$010c	irq
	pha	; Push A to stack
	IFNE	msu
	jsl	$000162 ; MSU-1 fade routine
	ELSEIF
	lda.l	m_sfr ; Load m_sfr into A (MARIO chip flags?)
	ENDC
	bmi	.qexit ; branch if a = 1
	phb ; Push data bank to stack
	disable ; disable interrupts
	phx ; Push X to stack
	phy ; Push Y to stack
	ai8 ; set A/X/Y to 8 bit
	IFNE	FASTROM ; Start conditional: if FASTROM !=0 (=1)
	lda	#$80 ; load $80 into A (Bank 80 for FastROM)
	pha ; Push A to stack
	plb ; Pull data bank from stack
	ELSEIF ; if FASTROM =0
	lda	#0 ; Load #0 into stack (Bank 0 for SlowROM)
	pha ; Push A to stack
	plb ; Pull data bank from stack
	ENDC ; End conditional

	nastyon ; Turn MARIO nasty mode on
	jsl	irqcode_l ; Jump to irqcode_l
	a8 ; Set A to 8 bit
	inc	framec ; increment frame count?
	lda	timeupr ; Load TIMEUPR register into A
	bra	.exit ; branch to .exit sublabel
	longa
.qexit	pla ; Pull A from stack
	rti ; Return from interrupt
.brk
.nmi
	ai16 ; Set A/X/Y to 16 bit
	pha ; Push A to stack
	phb ; Push data bank to stack
	phx ; Push X to stack
	phy ; Push Y to stack
	a8 ; Set A to 8 bit
	IFNE	FASTROM ; Start conditional: if FASTROM !=0 (=1)
	lda	#$80 ; load $80 into A (Bank 80 for FastROM)
	pha ; Push A to stack
	plb ; Pull data bank from stack
	ELSEIF ; if FASTROM =0
	lda	#0 ; Load #0 into stack (Bank 0 for SlowROM)
	pha ; Push A to stack
	plb ; Pull data bank from stack
	ENDC ; End conditional

	nastyoff ; Turn MARIO chip nasty mode off
	jsl	fnmi_l ; Jump to fnmi_l (Long)
	nastyon ; Turn MARIO chip nasty mode on
	a8 ; Set A to 8 bit
	lda	rdnmir ; Load RDNMIR register into A

.exit	ai16
	ply ; Pull Y from stack
	plx ; Pull X from stack
	plb ; Pull data bank from stack
	pla	; Pull A from stack
	rti ; Return from interrupt

nmihanend ; End of NMI Handler

	IFNE	MSU
msufadehan
	lda.l msu_017f
	and	#$00ff
	cmp	#$00f1
	beq	.k1
	bra	.skipfade
	rtl
.k1
	a8
	lda.l msu_017e
	beq .endslow
	dec a
	dec a
	cmp #$10
	bcs .k2
.endslow
	lda #$00
	sta.l	msu_017f ;erase fade flag
.k2	sta.l	msu_017e
	sta	msu_volume
.skipfade
	ai16
	lda.l m_sfr
	rtl
msufadehanend
	ENDC

