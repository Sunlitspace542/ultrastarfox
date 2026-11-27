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
;*  Descr: IRQ handler.                                                    *
;*                                                                         *
;***************************************************************************

; Copies IRQ handler to RAM at addr $010C
copy_to_010c_l
	php ; Push Processor status to stack
	phb ; Push DBR onto stack (MVN changes it to destination bank)

	ai16
	ldx	#irqhan&WM ; src data addr
	ldy	#$010C ; dest data addr
	lda	#irqhanend-irqhan-1 ; len of data to copy
	IFNE	FASTROM
	_mvn	(irqhan>>16),$80
	ELSEIF
	_mvn	(irqhan>>16),$00
	ENDC

	; Copy xroutines into RAM
	ldx	#xrstart&WM ; src data addr
	ldy	#xroutines&WM ; dest data addr
	lda	#xlen-1 ; len of data to copy
	_mvn	(xrstart>>16),(xroutines>>16)

	plb ; Pull DBR from stack
	plp ; Pull Processor status from stack
	rtl ; Return from subroutine (Long)

;---------------------------------------------------------------------------

irqhan	; Start of IRQ handler
.irq	; $010c	irq
	ai16
	pha	; Push A to stack
	lda.l	m_sfr ; Load m_sfr into A (MARIO chip flags?)
	bpl	.irqq
.qexit	pla ; Pull A from stack
	rti ; Return from interrupt

.irqq
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

	IFNE	RUMBLE
; Randy's rumble controller fix for hardware
; HACK: Force re-read of controller bits to get timing right for rumble handler

; This part is to make sure that you don't overrun blanking
	lda	slhvr				; Latch Raster Position
	lda	stat78r				; Update H/V Counters
	lda	opvctr				; Get Low 8Bits VPos
	xba
	lda	opvctr				; Get High 8Bits VPos
	xba
	cmp	#40
	bcc	.to_skip_rumble
	cmp	#220
	bcc	.readjoy
.to_skip_rumble
	brl	.skip_rumble

; This part does the equivalent of the auto-read of the controllers,
; which is what the rumble hardware is looking for
.readjoy
	IFNE	mouseon	;MUST be here for speed!
	lda	mouse_con1
	bne	.to_skip_rumble
	ENDC
	lda	#$01
	sta	JOYSER0				; Reset Data Counter
	nop
	nop
	stz	JOYSER0
	nop
	nop

;	ldy	#16-1				; Read 16 Controller Bits
;.readjoy2
;	lda	JOYSER0				; Controller I
;	dey
;	bpl	.readjoy2

; Clock controller port 1 16 times
; Saves 70 cycles
	jsl	clkjoyser016x_l

; Handle rumble controller commands

	ldx	#$40

; Send magic number 01110010 (rumble sentry)
; send a bit, clock controller port 1
	stz	WRIO				; %0
	bit	JOYSER0

	stx	WRIO				; %1
	bit	JOYSER0

;							; %1
	bit	JOYSER0

;							; %1
	bit	JOYSER0

	stz	WRIO				; %0
	bit	JOYSER0

;							; %0
	bit	JOYSER0

	stx	WRIO				; %1
	bit	JOYSER0

	stz	WRIO				; %0
	bit	JOYSER0
.rumblehan_recheck
; Handle sequenced rumbles
	lda	rumble_index
	beq	.notable	; If rumble_index == 0, handle timed rumbles
	ldx	rumble_index
	lda.l	rumble_table-1,x
	inx
	stx	rumble_index
	cmp #0
	beq	.rumblehan_turnoffmotors
	cmp #rmblend	; So I don't have to pull X twice - Kando
	bne	.rumblehan_donerumblecmd2	; If you hit a rmblend, end it all. Otherwise, run it.
	stz	rumble_index
	bra	.rumblehan_turnoffmotors

.notable
; Check rumble timer
; Only send a nonzero rumble command if the timer is nonzero
	lda	rumble_time
	beq	.rumblehan_turnoffmotors	; if 0, turn off motors!
	lda	rumble_cmd		; get rumble cmd bits
	bra	.rumblehan_donerumblecmd
	
.rumblehan_donerumblecmd2
	cmp	#rmblloop	; Is the current table value == rmblloop?
	bne	.rumblehan_donerumblecmd
	lda	#1	; Yes! Loop rumble sequence.
	sta	rumble_index
	bra .rumblehan_recheck

.rumblehan_turnoffmotors
	lda	#0	; 0 = no rumble!
.rumblehan_donerumblecmd

; send rumble command bits out to controller port 1
; read in a bit, send it, clock controller port 1

	lsr	a				; .7 -> .6 / .0 -> .C
	sta	WRIO
	bit	JOYSER0

	rol	a				; .6 / .C -> .0
	sta	WRIO
	bit	JOYSER0

	asl	a				; .5
	sta	WRIO
	bit	JOYSER0

	asl	a				; .4
	sta	WRIO
	bit	JOYSER0

	asl	a				; .3
	sta	WRIO
	bit	JOYSER0

	asl	a				; .2
	sta	WRIO
	bit	JOYSER0

	asl	a				; .1
	sta	WRIO
	bit	JOYSER0

	asl	a				; .0
	sta	WRIO
	bit	JOYSER0

	lda	#$ff				; Restore WRIO
	sta	WRIO

; Check rumble timer
	lda	rumble_time
	beq	.rumblehan_dontdectime	; If 0, don't decrement or we'll overflow!!
	dec	rumble_time
.rumblehan_dontdectime

.skip_rumble
	ENDC	;RUMBLE

	IFNE	MSU1
; Handle MSU-1 fades
	lda msufadeflag	; check fade flag
	beq .msu1han_nofade	; if zero, don't fade
	lda curmsuvolume	; load current volume
	beq .msu1han_nofade	; if zero, don't fade
	sec
	sbc	#msu_voldecrement
	sta curmsuvolume	; store new volume
	sta msu_volume	; set msu-1 volume
.msu1han_nofade
	ENDC


	nastyon ; Turn MARIO nasty mode on
	jsl	irqcode_l ; Jump to irqcode_l
	a8 ; Set A to 8 bit
	inc	framec ; increment frame count?
	lda	timeupr ; Load TIMEUPR register into A
	longa

.exit	ai16
	ply ; Pull Y from stack
	plx ; Pull X from stack
	plb ; Pull data bank from stack
	pla	; Pull A from stack
	rti ; Return from interrupt

irqhanend ; End of IRQ Handler

