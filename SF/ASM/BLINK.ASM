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
;*   File: BLINK.ASM                                                       *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr: CRASH HANDLER.                                                  *
;*                                                                         *
;*                                                                         *
;***************************************************************************
; The crash handler, as seen in the September 23rd, 1992 prototype.

	INCPUBLICS	EXT\blink.ext

; get text color for each crash level, then go to stopall routine
doblink	ai16
	lda	#$1f+($1f<<5)+($1f<<10) ; White
	sta	blinkcol
	ldx	#256-86
	bra	stopall
	
doblink1	ai16
	lda	#$1f+($1f<<10)	; pink
	sta	blinkcol
	ldx	#256-85
	bra	stopall
doblink2	ai16
	lda	#$1f+($1f<<5)	; yellow
	sta	blinkcol
	ldx	#256-70
	bra	stopall
doblink3	ai16			
	lda	#($1f<<5)+($1f<<10)	; cyan
	sta	blinkcol
	ldx	#256-55
	bra	stopall
doblink4	ai16			
	lda	#($1f<<5) ; green (sound loop crashed)
	sta	blinkcol
	ldx	#256-30
	bra	stopall

stopall	stx	blinkval ; Store X to blinkval variable
	a8 ; Set A to 8 bit
	stz	nmitimen ; Store 0 at NMITIMEN register
	stz	hdmaen ; Store 0 at HDMAEN register
	disable ; Disable interrupts (sei)
	stz	tm ; Store 0 at TM register
	stz	ts ; Store 0 at TS register
	IFNE	FASTROM ; Start Conditional: If FASTROM !=1 (=1)
	lda	#$80 ; Load $80 into A (Bank 80 for FastROM)
	pha ; Push A to stack
	plb ; Pull data bank from stack
	ELSEIF ; else if FASTROM =0
	lda	#0 ; load 0 into A (Bank 0 for SlowROM)
	pha ; Push A to stack
	plb ; Pull data bank from stack
	ENDC ; End conditional
	a8i16 ; Set A to 8 bit and X/Y to 16 bit
	lda	#$80 ; Load $80 into A
	sta	inidisp ; Store A at INIDISP register

	; Load palette, tiles, and tilemap for crash handler
	dmacgram	0,0,oopspal,512
	dmavram	0,0,oopschr,16*1024
	dmavram	0,16*1024,oopspic,2*1024

	stz	cgadd ; Store 0 at CGADD register
	lda	blinkcol ; Load the BLINK text color into A
	sta	cgdata ; Store A at CGDATA register
	lda	blinkcol+1 ; Load the BLINK text color +1 into A
	sta	cgdata ; Store A at CGDATA register

	lda	#(16*1024)>>8 ; Load the result of 16*24 Shifted right by 8 into A
	sta	bg1sc ; Store A at BG1SC register
	lda	#0 ; Load 0 into A
	sta	bg12nba ; Store A at BG12NBA register

	stz	w12sel ; Store 0 at W12SEL register
	stz	w34sel	; Store 0 at W34SEL register ;wh0,1 set with hdma
	stz	wobjsel ; Store 0 at WOBJSEL register
	stz	wbglog ; Store 0 at WBGLOG register
	stz	wobjlog ; Store 0 at WOBJLOG register
	stz	tmw ; Store 0 at TMW register
	stz	tsw ; Store 0 at TSW register
	stz	wh0 ; Store 0 at WH0 register
	stz	wh1 ; Store 0 at WH1 register

	lda	#1 ; Load 1 into A
	sta	bgmode ; Store A at BGMODE register
	lda	#1 ; Load 1 into A
	sta	tm ; Store A at TM register
	stz	ts ; Store 0 at TS register
	stz	cgadsub ; Store 0 at CGADSUB register
	stz	coldata ; Store 0 at COLDATA register

	stz	ch1params ; Store 0 at CH1PARAMS register
	lda	#inidisp&$ff ; Load INIDISP register ANDed with $FF into A
	sta	ch1addrb ;  Store A into CH1ADDRB register
	lda	#oopshdma>>16 ; load OOPSHDMA shifted right by 16 into A
	sta	ch1atbank ; Store A at CH1ATBANK register
	ldx	#oopshdma&WM ; Load OOPSHDMA ANDed by $FFFF into X
	stx	ch1addra1tl ;  Store X at CH1ADDRA1TL register
	stz	ch1databank ; Store 0 at CH1DATABANK register

	stz	bg1vofs ; Store 0 at BG1VOFS register
	stz	bg1vofs ; Store 0 at BG1VOFS register
	lda	#-7 ; Load -7 into A
	sta	bg1hofs ; Store A into BG1HOFS register (Set Horizontal scroll pos)
	lda	#-1 ; Load -1 into A
	sta	bg1hofs ; Store A into BG1HOFS register (Set Horizontal scroll pos)
	lda	#$f ; Load $F into A
	sta	inidisp ; Store A at INIDISP register (Set screen brightness to 15)
	lda	#2 ; Load 2 into A
	sta	hdmaen ; Store A at HDMAEN register

	i16
.wait2	ldy	#20000	;Load 20,000 into Y ;wait about 1 frame
.wait	dey ; Decrement Y
	bne	.wait ; Repeat until Y = 0

	a16 ; Set A to 16 bit
	lda	blinkval ; Load blinkval into A
	cmp	scrollval ; Compare A with scrollval
	beq	.ok2 ; Branch to .ok2 if equal
	sec ; Set carry flag
	sbc	scrollval ; Subtract scrollval from A
	lsr	a	; Logical Shift Right A
	lsr	a	; Logical Shift Right A
	lsr	a	; Logical Shift Right A
	bne	.ok ; Branch to .ok if not equal
	lda	#1 ; Load 1 into A
.ok	clc ; Clear carry flag
	adc	scrollval ; add scrollval to A
	sta	scrollval ; store A to scrollval var

	a8 ; Set A to 8 bit
	lda	scrollval ; Load scrollval into A
	sta	bg1vofs ; Store A at BG1VOFS reg (set vertical pos)
	lda	scrollval+1 ; Load scrollval+1 into A
	sta	bg1vofs ; Store A at BG1vofs (set vertical pos)

	lda	#3 ; Load 3 into A
	sta	apu_port0 ; Store A at SPC700 port 0
	bra	.wait2 ; branch to .wait 2

.ok2	bra	.ok2 ; infinite loop


oopshdma	db	100-16,$0
	db	1,$1
	db	1,$2
	db	1,$3
	db	1,$4
	db	1,$5
	db	1,$6
	db	1,$7
	db	1,$8
	db	1,$9
	db	1,$a
	db	1,$b
	db	1,$c
	db	1,$d
	db	1,$e
midblink	db	16,$f
	db	1,$e
	db	1,$d
	db	1,$c
	db	1,$b
	db	1,$a
	db	1,$9
	db	1,$8
	db	1,$7
	db	1,$6
	db	1,$5
	db	1,$4
	db	1,$3
	db	1,$2




