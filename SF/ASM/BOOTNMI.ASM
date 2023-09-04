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
;*   File: BOOTNMI.ASM                                                     *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr: Boot routines.                                                  *
;*                                                                         *
;***************************************************************************

	incpublics	EXT\bootnmi.ext

	shorti ; set interrupt disable flag
startboot	disable ; Disable Interrupts
	clc	; Clear Carry Flag
	xce ; Exchange Carry Flag with Emulation Flag (Exit 65c02 mode)
	ai16 ; set A/X/Y to 16 bit
	lda	#0 ; load 0 into A
	tcd ; Transfer 16 bit A (C) to Direct Page
	ldx	#$02ff ; load $02FF into X
	txs ; transfer X to SP (set stack at $02FF)
	ai8 ; set A/X/Y to 8 bit
	pha ; Push A to stack
	plb ; Pull data bank from stack

	ai8 ; set A/X/Y to 8 bit
	jsl	startsfx_l ; Initialize the SNES

	jsr	initialise_ram ; Clear RAM

	i16 ; clears interrupt disable flag
	ldx	#$2ff ; Load $2FF into X
	txs ; Transfer X to SP (set stack to $2FF, resets the stack)
	ai8 ; Set A/X/Y to 8 bit

	jsl	initialise_l ; initialize game

	IFNE	TWENTYONEMHZ ; start conditional: if TWENTYONEMHZ !=0 (=1)
	fast ; Tell MARIO chip to run @ 21.4mhz (no clock divider)
	ENDC ; end conditional

	IFNE	mouseon ; start conditional: If SNES mouse enabled
	lda	#1 ; Load 1 into A
	sta	mousemode		; store A at these variables
	sta	mousemodetemp	; (enable mouse)
	ENDC ; End conditional

	IFEQ	contest ; start conditional: if CONTEST = 0 (Not SSFW)
	jsl	intro_l ; Jump to Intro Sequence
	ENDC ; End conditional

	jsl	titleseq_l ; Jump to Title Sequence


	a8 ; set A to 8 bit
	lda	#0 ; Load 0 into A
	sta.l	contexit ; Store A @ contexit (variable allocated in Extended RAM)
	lda	#0 ; load 0 into A
	sta	defaulttrain ; Store A @ defaulttrain (variable allocated in RAM)
	bra	firsttimeuse ; Branch to firsttimeuse

; Restarts the game (Used in retail when the game crashes instead of calling BLINK)
restart	ai16 ; set A/X/Y to 16 bit
	clc ; Clear Carry flag
	xce ; Exchange Carry with Emulation Flag (Enter 65816 mode?)
	lda	#0 ; load 0 into A
	tcd ; Transfer A to DP
	ldx	#$2ff ; load $2FF into X
	txs ; Set the stack to $2FF
	ai8 ; set A/X/Y to 8 bit
	disable ; disable interrupts (sei)

	jsl	startsfx_l ; Initialize the SNES

	lda.l	whichroute ; Load Route # into A
	pha	; Push A to stack, preserving route number
	lda	defaulttrain ; Load defaulttrain into A
	pha ; push A to stack
	lda.l	contexit ; load contexit into A
	pha ; push A to stack
	lda	c_type ; Load controller type into A
	pha ; push A to stack

	IFNE	mouseon ; start conditional: If SNES mouse enabled
	lda	mousemode ; load value in mousemode var to A
	pha ; Push A to stack
	lda	mousemodetemp ; load value in mousemode temp var to A
	pha ; Push A to stack
	ENDC ; End conditional

	jsr	initialise_ram ; Clear RAM

	IFNE	mouseon ; start conditional: If SNES mouse enabled
	pla ; Pull A from stack
	sta	mousemodetemp ; store A at mousemodetemp var
	pla ; Pull A from stack
	sta	mousemode ; store A at mousemode var
	ENDC ; End conditional

	pla ; pull A from stack
	sta	c_type ; Store A to controller type variable
	pla ; pull A from stack
	sta.l	contexit ; store A at contexit variable
	pla ; Pull A from stack
	sta	defaulttrain ; Store A at defaulttrain variable
	pla ; Pull A from stack
	sta.l	whichroute ; Store A to Route selection variable
	lda	#1 ; load 1 into A
	sta	firstdnld ; store @ firstdnld variable (this has to do with initializing the SPC700)
	sta.l	oncewipe ; Store A at oncewipe variable

	IFNE	CONTEST ; start conditional: If CONTEST !=0 (=1) (SSFW)
	jsl	initialise_l ; Initialize game
	jsl	titleseq_l ; Go to Title Sequence
	ENDC ; End conditional
	jsl	initialise_l ; Initialize game
firsttimeuse

	IFNE	TWENTYONEMHZ ; start conditional : if TWENTYONEMHZ !=0 (=1)
	fast	; set MARIO chip to 21.4mhz (no clock divider)
	ENDC ; end conditional

	jsl	briefing_l ; jump to briefing screen subroutine
	jsl	initialise_l ; Initialize game
	jml	planetseq_l ; Jump to planet routine


;-----------------------------------------------------------------------
; Clear all RAM (because RAM is randomized on power on and retained after resets, and we don't want that)
initialise_ram
	php ; Push processor status to stack

	a8 ; set A to 8 bit
	lda	#$7e ; load $7E into A
	pha	; push A to stack
	plb	; Pull data bank from stack

	ai16 ; set A/X/Y to 16 bit
	ldx	#$2000	; load $2000 into X to use for the following operations:
.7epage	stz.w	0,x ; Store 0 in addr defined by X
	stz.w	2,x ; Store 0 @ addr in X + 2
	stz.w	4,x ; Store 0 @ addr in X + 4
	stz.w	6,x ; Store 0 @ addr in X + 6
	txa	; Transfer X to A
	clc	; Clear carry flag
	adc	#8	; Add 8 to A
	tax	; Transfer A to X
	bne	.7epage ; repeat until X = 0

	a8 ; set A to 8 bit
	lda	#$7f ; load $7F into A
	pha ; Push A to stack
	plb ; Pull data bank from stack
	a16 ; set A to 16 bit

.7fpage	stz.w	0,x ; Store 0 @ $????
	stz.w	2,x ; Store 0 @ addr in X + 2
	stz.w	4,x ; Store 0 @ addr in X + 4
	stz.w	6,x ; Store 0 @ addr in X + 6
	txa ; Transfer X to A
	clc ; Clear carry flag
	adc	#8 ; Add 8 to A
	tax ; Transfer A to X
	bne	.7fpage ; repeat until X = 0

	a8 ; set A to 8 bit
	lda	#$70 ; load $70 into A
	pha ; Push A to stack
	plb ; Pull data bank from stack

	ai16 ; Set A/X/Y to 16 bit

	ldx	#32768-8	; (load #32760 into X) Clear MARIO chip RAM
.ooop2
	stz.w	0,x ; Store 0 @ addr in X
	stz.w	2,x ; Store 0 @ addr in X + 2
	stz.w	4,x ; Store 0 @ addr in X + 4
	stz.w	6,x ; Store 0 @ addr in X + 6
	txa ; Transfer X to A
	sec ; Set carry flag
	sbc	#8 ; Subtract 8 from A
	tax ; Transfer A to X
	BPL	.ooop2 ; repeat until x = 0

	a8 ; set A to 8 bit
	IFNE	FASTROM ; start conditional: if FASTROM !=0 (=1)
	lda	#$80 ; load $80 into A (Bank 80 for FastROM)
	pha ; Push A to stack
	plb ; Pull data bank from stack
	ELSEIF ; if FASTROM = 0
	lda	#0 ; load #0 into A (Bank 0 for SlowROM)
	pha ; Push A to stack
	plb ; Pull data bank from stack
	ENDC ; end conditional
	a16 ; set A to 16 bit

	ldx	#$2000-$300-8	; (1CF8) Clear WRAM
.sssp	stz	$300,x ; store 0 @ addr in X + $300
	stz	$302,x ; store 0 @ addr in X + $302
	stz	$304,x ; store 0 @ addr in X + $304
	stz	$306,x ; store 0 @ addr in X + $306
	txa ; transfer X to A
	sec ; set carry flag
	sbc	#8 ; Subtract 8 from A
	tax ; transfer A to X
	bpl	.sssp ; repeat until x = 0

	ldx	#$fe ; load $FE into X
.zpage	stz	0,x ; store 0 at addr in X
	dex ; decrement X
	dex ; decrement X
	bpl	.zpage ; repeat until x = 0

	jsl	copy_to_0101_l ;Copy NMI handler to RAM at $0101

; NTSC/PAL
	a8 ; set A to 8 bit
	lda	stat78r ; load stat78r ($213F) into A
	and	#1<<4 ; AND #1 Shifted left by 4 (?)
	sta	ntscpal ; Store A at ntscpal variable


	plp ; Pull Processor Status from Stack
	rts ; Return to Subroutine


	shorta ; Tell SASM that this code uses 8 bit A
	shorti ; Tell SASM that this code uses 8 bit X and Y
;------ reset SFX regs ------------------------------
startsfx_l ; Initialize the SNES 
; TODO: properly label all regs here, say what they do
	disable ; Disable interrupts (sei)

	waitdma	1 ; wait for raster line 1 (?)
	waitdma	0 ; wait for raster line 0 (?)

	lda	#$8f ; Load $8F into A
	sta	$2100 ; INIDISP
	lda	#0 ; Load 0 into A
	sta	$2101 ; OBJSEL
	sta	$2102 ; OAMADDL
	sta	$2103 ; OAMADDH

	sta	$2105 ; BGMODE
	sta	$2106 ; MOSAIC
	sta	$2107 ; BG1SC
	sta	$2108 ; BG2SC
	sta	$2109 ; BG3SC
	sta	$210a ; BG4SC
	sta	$210b ; BG12NBA
	sta	$210c ; BG34NBA

	sta	$210d ; BG1HOFS
	sta	$210d ; BG1HOFS
	sta	$210e ; BG1VOFS
	sta	$210e ; BG1VOFS
	sta	$210f ; BG2HOFS
	sta	$210f ; BG2HOFS
	sta	$2110 ; BG2VOFS
	sta	$2110 ; BG2VOFS
	sta	$2111 ; BG3HOFS
	sta	$2112 ; BG3VOFS
	sta	$2112 ; BG3VOFS
	sta	$2113 ; BG4HOFS
	sta	$2113 ; BG4HOFS
	sta	$2114 ; BG4VOFS
	sta	$2114 ; BG4VOFS

	ldx	#$80 ; Load 80 into X
	stx	$2115 ; Store X at VMAINC
	
	sta	$2116 ; VMADDL
	sta	$2117 ; VMADDH

	sta	$211a ; M7SEL

	ldx	#1 ; Load 1 into X
	sta	$211b ; M7A
	stx	$211b ; M7A
	sta	$211c ; M7B
	sta	$211c ; M7B
	sta	$211d ; M7C
	sta	$211d ; M7C
	sta	$211e ; M7D
	stx	$211e ; M7D
	sta	$211f ; M7X
	sta	$211f ; M7X
	sta	$2120 ; M7Y
	sta	$2120 ; M7Y

	sta	$2121 ; CGADD

	sta	$2122 ; CGDATA
	sta	$2123 ; W12SEL
	sta	$2124 ; W34SEL
	sta	$2125 ; WOBJSEL
	sta	$2126 ; WH0
	sta	$2127 ; WH1
	sta	$2128 ; WH2
	sta	$2129 ; WH3
	sta	$212a ; WBGLOG
	sta	$212b ; WOBJLOG
	sta	$212c ; TM
	sta	$212d ; TS
	sta	$212e ; TMW

	ldy	#$30 ; Load 30 into Y
	sty	$2130 ; CGSWSEL

	sta	$2131 ; CGADSUB
	ldx	#$e0 ; Load $E0 into X
	stx	$2132 ; COLDATA
	sta	$2133 ; SETINI

	sta	$4200 ; NMITIMEN
	ldx	#$ff ; Load $FF into X
	stx	$4201 ; WRIO
	sta	$4202 ; WRMPYA
	sta	$4203 ; WRMPYB
	sta	$4204 ; WRDIVL
	sta	$4205 ; WRDIVH
	sta	$4206 ; WRDIVB
	sta	$4207 ; HTIMEL
	sta	$4208 ; HTIMEH
	sta	$4209 ; VTIMEL
	sta	$420a ; VTIMEH
	sta	$420b ; MDMAEN
	sta	$420c ; HDMAEN

	IFNE	fastrom ; start conditional: if FASTROM != 0 (=1)
	pha ; Push A to stack
	a8 ; set A to 8 bit
	lda	#1 ; load 1 into A
	sta	$420d ; Store @ $420D (memsel) (Enable FastROM)
	pla ; Pull A from stack
	ELSEIF ; if FASTROM = 0
	sta	$420d ; Store 0 @ 420D (memsel) (Disable FastROM)
	ENDC ; end conditional

	rtl ; Return from Subroutine Long

	shorta ; Tell SASM that this code uses 8 bit A
	longi ; Tell SASM that this code uses 16 bit X/Y
fnmi_l
	rtl ; Return from Subroutine Long



