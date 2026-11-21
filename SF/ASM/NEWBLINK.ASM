;***************************************************************************
;*                                                                         *
;*   File: NEWBLINK.ASM                                                    *
;*_________________________________________________________________________*
;*                                                                         *
;*   Descr: Verbose crash handler.                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   Date: 24/10/26                                                        *
;*_________________________________________________________________________*
;*                                                                         *
;*   Author(s):                                                            *
;*        Sunlit                                                           *
;*                                                                         *
;***************************************************************************

	INCPUBLICS	EXT\BLINK.EXT

; Include crash screen tiles
crashgfx	incbin	DATA\CRASHGFX.cgx

; Crash screen font tile numbers (words)
crash_sp	equ	$0000	;' '
crash_0		equ	$0001
crash_1		equ	$0002
crash_2		equ	$0003
crash_3		equ	$0004
crash_4		equ	$0005
crash_5		equ	$0006
crash_6		equ	$0007
crash_7		equ	$0008
crash_8		equ	$0009
crash_9		equ	$000A
crash_A		equ	$000B
crash_B		equ	$000C
crash_C		equ	$000D
crash_D		equ	$000E
crash_E		equ	$000F
crash_F		equ	$0010
crash_G		equ	$0011
crash_H		equ	$0012
crash_I		equ	$0013
crash_J		equ	$0014
crash_K		equ	$0015
crash_L		equ	$0016
crash_M		equ	$0017
crash_N		equ	$0018
crash_O		equ	$0019
crash_P		equ	$001A
crash_Q		equ	$001B
crash_R		equ	$001C
crash_S		equ	$001D
crash_T		equ	$001E
crash_U		equ	$001F
crash_V		equ	$0020
crash_W		equ	$0021
crash_X		equ	$0022
crash_Y		equ	$0023
crash_Z		equ	$0024
crash_ex	equ	$0025	;'!'
crash_cl	equ	$0026	;':'
crash_cm	equ $0027	;','

; Crash screen macros
crashprintnum	macro	[number] ; .w to print word
	; print SFR value
	IFNE	LONGA
	a8
	ENDC
	IFC	"\0","W"
	lda	{number}+1
	jsr	crashscreen_printnum1
	lda	{number}+1
	jsr	crashscreen_printnum2
	ENDC

	lda	{number}
	jsr	crashscreen_printnum1
	lda	{number}
	jsr	crashscreen_printnum2
	ENDM

crashdefstring	macro	[string]
; string 1 is original string, rotated left after each iteration
; string 2 is isolated first char of string 1 (corrected if ' ', '!', ':', or ',')
; string 3 is final define name made from string 2
	defs	1,"\1" ; create string 1
	UPPER	1 ; uppercase it

	REPT	(strlen	1) ; iterate through length of string

	strcpy	2,1 ; copy string 1 to 2
	substr	0,1,2 ; isolate first char of string 2

	IFS	2,0," "
	defs	2,"sp"
	ENDC

	IFS	2,0,"!"
	defs	2,"ex"
	ENDC

	IFS	2,0,":"
	defs	2,"cl"
	ENDC

	IFS	2,0,","
	defs	2,"cm"
	ENDC

	defs	3,"crash_%$2"

	run	" dw %$3%n"

	rols	1,1 ; rotate string 1 left by 1

	ENDR

	ENDM

crashprintstring	macro	[string]
; string 1 is original string, rotated left after each iteration
; string 2 is isolated first char of string 1 (corrected if ' ', '!', ':', or ',')
; string 3 is final define name made from string 2
; .d (as in double) means store last character twice

	IFEQ	LONGA
	a16
	ENDC

	defs	1,"\1" ; create string 1
	UPPER	1 ; uppercase it

	REPT	(strlen	1) ; iterate through length of string

	strcpy	2,1 ; copy string 1 to 2
	substr	0,1,2 ; isolate first char of string 2

	IFS	2,0," "
	defs	2,"sp"
	ENDC

	IFS	2,0,"!"
	defs	2,"ex"
	ENDC

	IFS	2,0,":"
	defs	2,"cl"
	ENDC

	IFS	2,0,","
	defs	2,"cm"
	ENDC

	defs	3,"crash_%$2"

	run	" lda #%$3%n"
	sta	vmdatal

	rols	1,1 ; rotate string 1 left by 1

	ENDR

	IFC "\0","D"
	sta	vmdatal
	ENDC

	ENDM

; reserve RAM
crashvarbase = $0000
crashalc	macro	[name,size]
crashvar_{name}	equ	crashvarbase
crashvarbase = crashvarbase+{size}
	endm

; Crash screen RAM definitions
; Should all fit in zeropage
; PBR - PSR saved to stack by BRK
; CPU registers
	crashalc pbr,1		; ROM bank
	crashalc pclo,1		; PC low byte
	crashalc pchi,1		; PC high byte
	crashalc psr,1		; P reg
	crashalc dbr,1		; RAM bank
	crashalc sp,2		; SP
	crashalc dp,2		; DP
	crashalc AR,2		; A reg
	crashalc XR,2		; X reg
	crashalc YR,2		; Y reg
; MARIO registers
	crashalc mr0,2		; $3000
	crashalc mr1,2
	crashalc mr2,2
	crashalc mr3,2
	crashalc mr4,2
	crashalc mr5,2
	crashalc mr6,2
	crashalc mr7,2
	crashalc mr8,2
	crashalc mr9,2
	crashalc mr10,2
	crashalc mr11,2
	crashalc mr12,2
	crashalc mr13,2
	crashalc mr14,2
	crashalc mr15,2		; $301E
	crashalc msfr,2		; $3030
	crashalc mpbr,1		; $3034
	crashalc mrombr,1	; $3036
	crashalc mrambr,1	; $303C
	crashalc mcbr,1		; $303E
; misc vars
	crashalc type,1		; crash type: 0=brk/cop,1=jsl
	crashalc color,2	; text color (related to type, can be white, pink, yellow, cyan, or green)
	crashalc zero,2		; zeroes (word) used to clear vram

; Crash screen strings
blinktitle
	crashdefstring	<OOPS, I THINK I JUST BLINKED!>
blinktitleend
blinktitlelen	equ	blinktitleend-blinktitle

; Error messages
blinkmsgjsl
	crashdefstring	<BLINK CALLED BY PROGRAM >
blinkmsgjslend
blinkmsgjsllen	equ	blinkmsgjslend-blinkmsgjsl

blinkmsgbrk
	crashdefstring	<A BRK OR COP OCCURRED!>
blinkmsgbrkend
blinkmsgbrklen	equ	blinkmsgbrkend-blinkmsgbrk

	IFNE	SUPERFX3
blinkmsgnofx3
	crashdefstring	<SUPER FX 3 WAS NOT FOUND!!>
blinkmsgnofx3end
blinkmsgnofx3len	equ	blinkmsgnofx3end-blinkmsgnofx3
	ENDC	;SUPERFX3

blinkjslentry	macro	[errorlevel]
	php	; save PSR to stack

	disable	; Disable IRQs

	ai16
	sta	crashvar_AR	; backup AXY
	stx	crashvar_XR
	sty	crashvar_YR

	ai8
	pla	; fetch PSR from stack
	sta	crashvar_psr	; save PSR

	lda	#{errorlevel}+1
	sta crashvar_type	; BLINK called by user program

	ai16
	ENDM

	;JSL entry
doblink
	blinkjslentry	0
	lda	#$7FFF ; White
	sta	crashvar_color
	bra	doblink_continue
doblink1
	blinkjslentry	1
	lda	#$7C1F	; pink
	sta	crashvar_color
	bra	doblink_continue
doblink2
	blinkjslentry	2
	lda	#$03FF	; yellow
	sta	crashvar_color
	bra	doblink_continue
doblink3
	blinkjslentry	3
	lda	#$7FE0	; cyan
	sta	crashvar_color
	bra	doblink_continue
doblink4
	blinkjslentry	4
	lda	#$03E0 ; green (sound loop crashed)
	sta	crashvar_color
doblink_continue

	tsx	; save SP
	inx
	inx
	inx
	stx	crashvar_sp

	tdc	; save DP to A
	sta	crashvar_dp

	lda	m_sfr	; stop MARIO chip
	and	#~$20
	sta	m_sfr

	ai8
	phb
	pla
	sta	crashvar_dbr	; save DBR
	; start getting info from stack
	pla	; fetch PC lo byte from stack
	dec	a	; dec 3x to account for JSL instruction length
	dec	a
	dec	a
	sta	crashvar_pclo	; save lo byte PC
	pla
	sta	crashvar_pchi	; save hi byte PC
	pla
	sta	crashvar_pbr	; save ROM bank

	bra	newblink_continue
	; BRK/COP entry
newblink
	disable	; Disable IRQs
	ai16
	sta	crashvar_AR	; backup AXY
	stx	crashvar_XR
	sty	crashvar_YR

	tsx	; save SP
	inx
	inx
	inx
	inx
	stx	crashvar_sp

	tdc	; save DP to A
	sta	crashvar_dp

	lda	m_sfr	; stop MARIO chip
	and	#~$20
	sta	m_sfr

	ai8
	phb
	pla
	sta	crashvar_dbr	; save DBR
	; start getting BRK/COP info from stack
	pla	; fetch PSR from stack
	sta	crashvar_psr	; save PSR
	pla	; fetch PC lo byte from stack
	dec	a	; dec 2x to account for BRK instruction length
	dec	a
	sta	crashvar_pclo	; save lo byte PC
	pla
	sta	crashvar_pchi	; save hi byte PC
	pla
	sta	crashvar_pbr	; save ROM bank

	wdm
	stz crashvar_type	; BRK/COP occurred

	a16
	lda	#$7FFF ; White
	sta	crashvar_color

newblink_continue
	; backup MARIO registers
	a16i8
	ldy	#$00
.getmarioregs
	lda	mr0,y
	sta.w crashvar_mr0,y ; has to be .w otherwise the assembler tries to optimize it and fails because there is no zp version of this instruction
	iny
	iny
	cpy	#$20
	bne	.getmarioregs
	a8
	lda	m_pbr
	sta	crashvar_mpbr
	lda	m_rombr
	sta	crashvar_mrombr
	lda	m_rambr
	sta	crashvar_mrambr
	lda	m_cbr
	sta	crashvar_mcbr
	a16
	lda	m_sfr
	sta	crashvar_msfr

	; done backing up registers, now we can begin setting up
	; the screen
	a8 ; Set A to 8 bit
	IFNE	FASTROM
	lda	#$9f
	pha
	plb
	ELSEIF
	lda	#$1f
	pha
	plb
	ENDC

	; stop all audio
	IFNE	MSU1
	msustop
	ENDC
	lda	#$F0
	sta	apu_port0
	stz	apu_port1
	stz	apu_port2
	stz	apu_port3

	; play crash sfx
	lda	#se_destructbossnear
	sta	apu_port3

	a8i16

; wait for start of new frame before setting forced blank so we have time to do everything
.vblank_wait2	; Check if VBlank is ongoing
	lda	rdnmir
	bpl	.vblank_wait2	; wait until we're in VBlank (bit 7 clear)
.vblank_wait3	; Check if VBlank has ended (new frame)
	lda	rdnmir
	bmi	.vblank_wait3	; wait until we're not in VBlank (bit 7 set)

	lda	#$80
	sta	inidisp	; turn screen off, force blank
	sta	vmainc	; vram addr increment mode

	; Set up screen
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

	stz	bg1vofs ; Store 0 at BG1VOFS register
	stz	bg1vofs ; Store 0 at BG1VOFS register
	lda	#-7 ; Load -7 into A
	sta	bg1hofs ; Store A into BG1HOFS register (Set Horizontal scroll pos)
	lda	#-1 ; Load -1 into A
	sta	bg1hofs ; Store A into BG1HOFS register (Set Horizontal scroll pos)

	; clear vram
	jsr	crashscreen_clearvram

	a8i16

	; setup text colors
	stz	cgadd

	; paper color
	lda	#$00
	sta cgdata
	lda #$21
	sta cgdata

	; ink color
	lda	crashvar_color
	sta	cgdata
	lda	crashvar_color+1
	sta	cgdata

	; upload crash screen tiles
	dmavram	0,0,crashgfx,$600

	ai16
	; start drawing tiles
	lda	#$4061
	sta	vmaddl

	; print title
	ldy	#$0000
.blinktitleloop
	lda.w	blinktitle&WM,y
	sta	vmdatal
	iny
	iny
	cpy	#blinktitlelen
	bne	.blinktitleloop

	; print "65816:"
	a16
	lda #$40A1
	sta	vmaddl

	crashprintstring	<65816:>

	; print program counter
	a16
	lda #$40E1
	sta	vmaddl

	; print "PC "
	crashprintstring	<PC >

	; print PC value
	crashprintnum	crashvar_pbr
	crashprintnum.w	crashvar_pclo

	; print cpu regs
	a16
	lda #$4101
	sta	vmaddl

	; print "A "
	crashprintstring	<A >
	; print A value
	crashprintnum.w	crashvar_AR

	; print " X "
	crashprintstring	< X >
	; print X value
	crashprintnum.w	crashvar_XR

	; print " Y "
	crashprintstring	< Y >
	; print Y value
	crashprintnum.w	crashvar_YR

	; print " PSR "
	crashprintstring	< PSR >
	; print PSR value
	crashprintnum	crashvar_psr

	; print DBR, SP, DP
	a16
	lda #$4121
	sta	vmaddl

	; print "DBR "
	crashprintstring	<DBR >
	; print DBR value
	crashprintnum	crashvar_dbr

	; print " SP "
	crashprintstring	< SP >
	; print SP value
	crashprintnum.w	crashvar_sp

	; print " DP"
	crashprintstring	< DP >
	; print DP value
	crashprintnum.w	crashvar_dp

	; print "MARIO:"
	a16
	lda #$4161
	sta	vmaddl

	crashprintstring	<MARIO:>

	; print MARIO PC (PBR:R15)
	a16
	lda #$41A1
	sta	vmaddl

	; print "PC "
	crashprintstring	<PC >
	; print MARIO PC value
	crashprintnum	crashvar_mpbr
	crashprintnum.w	crashvar_mr15

	; print MARIO registers 0,1,2
	a16
	lda #$41C1
	sta	vmaddl

	; print "R0  "
	crashprintstring.d	<R0 >
	; print R0 value
	crashprintnum.w	crashvar_mr0

	; print "R1  "
	crashprintstring.d	< R1 >

	; print R1 value
	crashprintnum.w	crashvar_mr1

	; print "R2  "
	crashprintstring.d	< R2 >
	; print R2 value
	crashprintnum.w	crashvar_mr2

	; print MARIO registers 3,4,5
	a16
	lda #$41E1
	sta	vmaddl

	crashprintstring.d	<R3 >
	; print R3 value
	crashprintnum.w	crashvar_mr3

	; print " R4  "
	crashprintstring.d	< R4 >
	; print R4 value
	crashprintnum.w	crashvar_mr4

	; print " R5  "
	crashprintstring.d	< R5 >
	; print R5 value
	crashprintnum.w	crashvar_mr5

	; print MARIO registers 6,7,8
	a16
	lda #$4201
	sta	vmaddl

	; print "R6  "
	crashprintstring.d	<R6 >
	; print R6 value
	crashprintnum.w	crashvar_mr6

	; print " R7  "
	crashprintstring.d	< R7 >
	; print R7 value
	crashprintnum.w	crashvar_mr7

	; print " R8  "
	crashprintstring.d	< R8 >
	; print R8 value
	crashprintnum.w	crashvar_mr8

	; print MARIO registers 9,10,11
	a16
	lda #$4221
	sta	vmaddl

	; print "R9  "
	crashprintstring.d	<R9 >
	; print R9 value
	crashprintnum.w	crashvar_mr9

	; print " R10 "
	crashprintstring	< R10 >
	; print R10 value
	crashprintnum.w	crashvar_mr10

	; print " R11 "
	crashprintstring	< R11 >
	; print R11 value
	crashprintnum.w	crashvar_mr11

	; print MARIO registers 12,13,14
	a16
	lda #$4241
	sta	vmaddl

	; print "R12 "
	crashprintstring	<R12 >
	; print R12 value
	crashprintnum.w	crashvar_mr12

	; print " R13 "
	crashprintstring	< R13 >
	; print R13 value
	crashprintnum.w	crashvar_mr13

	; print " R14 "
	crashprintstring	< R14 >
	; print R14 value
	crashprintnum.w	crashvar_mr14

	; print MARIO register 15
	a16
	lda #$4261
	sta	vmaddl

	; print "R15 "
	crashprintstring	<R15 >
	; print R15 value
	crashprintnum.w	crashvar_mr15

	; print MARIO registers PBR, ROM, RAM, CBR
	a16
	lda #$4281
	sta	vmaddl

	; print "PBR "
	crashprintstring	<PBR >
	; print PBR value
	crashprintnum	crashvar_mpbr

	; print " ROM "
	crashprintstring	< ROM >
	; print ROMBR value
	crashprintnum	crashvar_mrombr

	; print " RAM "
	crashprintstring	< RAM >
	; print RAMBR value
	crashprintnum	crashvar_mrambr

	; print " CBR "
	crashprintstring	< CBR >
	; print CBR value
	crashprintnum	crashvar_mcbr

	; print MARIO SFR
	a16
	lda #$42A1
	sta	vmaddl

	; print "SFR "
	crashprintstring	<SFR >
	; print SFR value
	crashprintnum.w	crashvar_msfr

	; print error msg
	a16
	lda #$42E1
	sta	vmaddl

	a8
	lda	crashvar_type
	bne	.error_jsl ; 1 = JSL
	jsr	crashscreen_printbrkerror
	bra	crashscreen_done
.error_jsl
	jsr	crashscreen_printjslerror

crashscreen_done

	IFNE	SUPERFX3
; If FX3 ROM, check if we're running on the correct chip
	ai16
	lda #$4301
	sta	vmaddl

	lda.l	m_vcr	; Check Super FX version code
	and	#$00FF
	cmp	#'R'
	beq	.realchip

	ldy	#$0000
.blinknofx3errorloop
	lda.w	blinkmsgnofx3&WM,y
	sta	vmdatal
	iny
	iny
	cpy	#blinkmsgnofx3len
	bne	.blinknofx3errorloop
.realchip
	ENDC	;SUPERFX3

	a8
crashscreen_infloop

; I think hardware may need this
.vblank_wait	; Check if VBlank is ongoing
	lda	rdnmir
	bpl	.vblank_wait	; wait until we're in VBlank (bit 7 clear)

	lda	#$0F
	sta	inidisp	; turn screen on
	bra	crashscreen_infloop

; exit: a8
; prints brk error message
crashscreen_printbrkerror
	ai16
	ldy	#$0000
.blinkbrkerrorloop
	lda.w	blinkmsgbrk&WM,y
	sta	vmdatal
	iny
	iny
	cpy	#blinkmsgbrklen
	bne	.blinkbrkerrorloop
	a8
	rts

; exit: a8
; prints jsl error message and error level
crashscreen_printjslerror
	ai16
	ldy	#$0000
.blinkjsrerrorloop
	lda.w	blinkmsgjsl&WM,y
	sta	vmdatal
	iny
	iny
	cpy	#blinkmsgjsllen
	bne	.blinkjsrerrorloop
	a8
	lda	crashvar_type	; print error level for user blink
	dec	a
	jsr	crashscreen_printnum2
	rts

; entry: a8
; exit: a8
; prints hi nybble of number
crashscreen_printnum1
	and #$F0
	lsr	a
	lsr	a
	lsr	a
	lsr	a
	ina
	a16
	sta	vmdatal
	a8
	rts

; entry: a8
; exit: a8
; prints lo nybble of number
crashscreen_printnum2
	and	#$0F
	ina
	a16
	sta	vmdatal
	a8
	rts

; exit: a8
crashscreen_clearvram
	a16
	stz crashvar_zero
; VRAM destination address $8000
; don't ask me why but it has to be more than $0000 to work
; i picked $8000 which is where the screen is
	lda	#$8000 
	sta vmaddl
; RAM source address
	lda	#crashvar_zero&WM
	sta ch0addra1tl
; bytes to transfer $10000
	stz ch0dataddrl
	a8
; VRAM address increment after writing to $2119
	lda #$80
	sta vmainc
; DMA transfer writes 2 bytes, 1 to $2118 and 1 to $2119, without incrementing RAM address (fixed transfer)
	lda #$09
	sta ch0params
; PPU destination register $2118
	lda #$18
	sta ch0addrb
; RAM source address bank $7E
	lda #$7E
	sta ch0atbank
; run the DMA!
	stz HDMAEN
	lda #$01
	sta mdmaen
	rts