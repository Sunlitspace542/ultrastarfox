;****************************************************************
;*																*
;*		Super NES Mouse BIOS Version 1.00						*
;*		March 10, 1992        									*
;*		Modified by Kandowontu and Sunlit for UltraStarFox		*
;*		(c) 1992 Nintendo of America Inc.						*
;*		2022 Kandowontu											*
;*		2026 Sunlit												*
;*																*
;****************************************************************
		db	'START OF MOUSE BIOS'	;do not delete

;***************************************************************************
;*  =====================================================================  *
;*                      Mouse read (mouse_read)                            *
;*  =====================================================================  *
;*                                                                         *
;*  Calling this routine once per frame sets the mouse state in the        *
;*  registers listed below.                                                *
;*  The contents of the A and Y registers are destroyed by the call.       *
;*                                                                         *
;*  Input                                                                  *
;*  None (auto joypad read enabled)                                        *
;*                                                                         *
;*  Output                                                                 *
;*  Connection state (mouse_con1): D0=1 means mouse connected to Joy 2     *
;*                                                                         *
;*  Buttons (mouse_sw1): D0=left button held                               *
;*                       D1=right button held                              *
;*                                                                         *
;*  Buttons (mouse_swt1): D0=left-button trigger                           *
;*                        D1=right-button trigger                          *
;*                                                                         *
;*  Mouse movement (mouse_x): D7=0 forward/1 reverse, D6-D0 = X movement   *
;*                 (mouse_y): D7=0 forward/1 reverse, D6-D0 = Y movement   *
;*                                                                         *
;***************************************************************************

mouse_read
	PHB
	IFNE	FASTROM
	lda	#$80
	pha
	plb
	ELSEIF
	lda	#0
	pha
	plb
	ENDC

	php
	ai8					; 8-bit mode
.10
	lda	hvbjoyr
	and	#%00000001
	bne	.10				; Is automatic data read ready?

	lda	joy2l
	jsr	mouse_data

	lda	connect_st1		; Was mouse just connected?
	beq	.20				; No, skip initial speed change

	lda	#mouse_speed	; Prepare to change speed
	sta	mouse_sp_set1	; Note that speed changes do not affect Hyperkin mouse

	jsr	speed_change	; Change speed only immediately after connection
	stz	connect_st1
.20
	plp
	plb
	rts

mouse_data
	sta	reg0l			; ($421A is stored in reg0l)
	and	#$0F			; Mask ID bits
	cmp	#$01			; Is a mouse connected?
	beq	.m10			; Yes

	stz	mouse_con1		; Not connected

	stz	mouse_x1
	stz	mouse_y1
	stz	mouse_sw1
	stz	mouse_swt1
	stz	mouse_sb1
	
	rts
.m10
	lda	mouse_con1		; Always change speed once when a mouse first connects
	bne	.m20			; Previous connection state (checked from the low mouse_con1 bit)

	lda	#$01			; Set mouse-connection confirmation flag
	sta	mouse_con1
	sta	connect_st1		; Indicates that this is immediately after connection
	rts

  
.m20
	ldy	#16				; Read the remaining 16 bits of data
.m30
	lda	JOYSER1
	lsr	a
	rol	mouse_x1
	rol	mouse_y1
	nop					; Read delay for hyperkin mouse support, loop should be at least 170 master clocks.
	nop					; Less delay is needed if using abs/far rol, and/or SlowROM.
	nop					; This loop is 188 clocks in FastROM; it has 1 excess NOP for safety.
	nop					; (Mario Paint takes 190 clocks.)
	dey
	bne	.m30

	stz	mouse_sw1

	rol	reg0l
	rol	mouse_sw1
	rol	reg0l
	rol	mouse_sw1		; Held button state

	lda	mouse_sw1
	eor	mouse_sb1		; Detect button trigger
	bne	.m40

	stz	mouse_swt1
	rts
.m40
	lda	mouse_sw1
	sta	mouse_swt1
	sta	mouse_sb1
	rts


;*************************************************************************
;*  ===================================================================  *
;*                 Mouse speed change (speed_change)                     *
;*  ===================================================================  *
;*                                                                       *
;*  Set the speed in mouse_sp_set1 and call this routine.                *
;*  If mouse_sp_set1 is not set before the call, the most recently       *
;*  selected speed (the same as the current speed) is set again.         *
;*  On successful completion, mouse_sp1 receives the speed read from     *
;*  the mouse.                                                           *
;*  If the requested speed cannot be set, this routine stores an error   *
;*  code in mouse_sp1 and exits.                                         *
;*  Speed changes have no effect on the Hyperkin mouse.                  *
;*  The contents of the A and Y registers are destroyed by the call.     *
;*                                                                       *
;*  Input: MOUSE_SP_SET1=Joy 2 requested speed                           *
;*                                                                       *
;*  Output: MOUSE_SP1=mouse speed on Joy 2                               *
;*          (0=slow, 1=medium, 2=fast, $80=error)                        *
;*                                                                       *
;*************************************************************************

speed_change
	php
	ai8

	lda	mouse_con1		; Speed cannot be changed when no mouse is connected
	beq	.s25

	lda	#$10			; Counter used to detect an error
	sta	reg0h			; Return an error if it cannot be matched after 16 changes

.s10
	lda	#$01
	sta	JOYSER0
	lda	JOYSER1			; Change the speed by one step
	stz	JOYSER0

	lda	#$01			; Prepare to read speed data
	sta	JOYSER0			; Clear the shift register
	lda	#$00
	sta	JOYSER0

	sta	mouse_sp1		; Clear the speed register

	ldy	#10				; Drain the shift register
.s20
	lda	JOYSER1
	dey
	bne	.s20

	lda	JOYSER1			; Read the speed
	lsr	a
	rol	mouse_sp1

	lda	JOYSER1
	lsr	a
	rol	mouse_sp1
	lda	mouse_sp1

	cmp	mouse_sp_set1	; Did it reach the requested speed?
	beq	.s30

	dec	reg0h			; Limit attempts (used to detect an error)
	bne	.s10

.s25
	lda	#$80			; Speed-change error
	sta	mouse_sp1
.s30
	plp
	rts

	db	'MODIFIED FROM NINTENDO SHVC MOUSE BIOS Ver1.00'	;do not delete
;
;			if user modifies program, then change to 
;			'MODIFIED FROM SHVC MOUSE BIOS Ver1.00'
;			Original: 'NINTENDO SHVC MOUSE BIOS Ver1.00'
;
	db	'END OF MOUSE BIOS'		;do not delete


