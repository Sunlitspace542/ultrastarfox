;***************************************************************************
;*                                                                         *
;*                           UltraStarFox                                  *
;*                           ------------                                  *
;*_________________________________________________________________________*
;*                                                                         *
;*   File: MSU.ASM                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   Descr: MSU-1 handler.                                                 *
;*_________________________________________________________________________*
;*                                                                         *
;*   Date: 21/12/23                                                        *
;*_________________________________________________________________________*
;*                                                                         *
;*   Author(s):                                                            *
;*	 Kurrono, Kando, Sunlit                                                *
;*                                                                         *
;***************************************************************************

	INCPUBLICS	ext\msu.ext

; loop table
msulooptab
	;   0   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F
	db $03,$01,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03 ; 03-0F
	db $03,$01,$03,$03,$03,$03,$03,$01,$03,$03,$03,$03,$03,$03,$03,$03 ; 10-1F
	db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03 ; 20-2F
	db $01,$01,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03 ; 30-3F
	db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03 ; 40-4F
	db $03,$03,$03,$03,$03,$03,$03,$03,$01,$01,$03,$03,$01,$03,$01,$03 ; 50-5F
	db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03 ; 60-6F
	db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03 ; 70-7F
	db $03,$03,$03,$03,$03,$03,$01,$03,$03,$03,$03,$03,$03,$03,$03,$03 ; 80-8F
	db $03,$03,$03,$03,$03,$03,$03,$03,$01,$03,$03,$03,$03,$03,$03,$03 ; 90-9F
	db $03,$03,$03,$03,$01,$03,$03,$03,$03,$03,$01,$03,$03,$03,$03,$03 ; A0-AF
	db $03,$03,$03,$01,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03 ; B0-BF
	db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$01,$03 ; C0-CF
	db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03 ; D0-DF
	db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03 ; E0-EF
	db $03,$03,$03,$03,$03,$03,$03,$03,$01,$03,$03,$03,$03,$03,$03,$03 ; F0-FF

; Determines the MSU1 track to play by performing a lot of comparisons
determine_msu_track
	a8i16
	STA apu_port0
	CMP #$11
	BNE .a1 
	brl .sector
.a1	CMP #$07
	BNE .a2
	brl .sector2
.a2	CMP #$13
	BNE .a3
	LDA #_004_lastboss
	BRL .playtrack
.a3	CMP #$F0
	BNE .noF0
	CMP.l msu_017f
	BNE .a4
	RTL
.a4	STA.l msu_017f
	RTL
.noF0
	CMP #$F1
	BNE .noF1
	CMP.l msu_017f
	BNE .b1
	RTL
.b1	STA.l msu_017f
	RTL
.noF1
	ADC snd_ptr
	CMP.l msu_017f
	BNE .c1
	RTL
.c1	cmp #$91
	bne .no91
	lda snd_ptr
	cmp #$8e
	BNE .c2
	LDA #_145_corneria ; Corneria
	BRA .no91
.c2	LDA #$92
.no91
	cmp #$e1
	bne .noe1
	lda snd_ptr
	cmp #$f1
	BNE .d1
	LDA #$e6 ; load venom destroyed
	BRA .noe1
.d1	LDA #_225_asteroid_vo ; load
.noe1
	cmp #$b1
	bne .nob1
	lda snd_ptr
	cmp #$5f
	BNE .e1
	LDA #_177_unknown ; unknown track $B1
	BRA .nob1
.e1	LDA #$b2
.nob1
	cmp #$b3
	bne .nob3
	lda snd_ptr
	cmp #$ae
	BEQ .f1
	LDA #_179_exitlightspeed ;  load getting out speed of light
	BRA .nob3
.f1	LDA #$b4	;load fortuna boss
.nob3
	CMP #$03
	BNE .g1
	LDA #_002_dangerous
.g1	CMP #$e0
	BNE .playtrack
	LDA #_225_asteroid_vo ; Asteroid/Venom Orbital

.playtrack
	CMP.l msu_017f
	BNE .h1
	RTL
.h1	cmp #$0b
	BNE .continue
	lda snd_ptr
	cmp #$f9
	BNE .h2
	LDA #$0b
	BRA .continue
.h2	LDA.l msu_017f
	cmp #$39
	BEQ .h3
	LDA #$30
	BRA .continue
.h3	LDA #$0b
.continue
	STZ msu_volume
	STA msu_track
	STA.L msu_017f
	STZ msu_track2
.loopTitle
	BIT msu_status
	BVS .loopTitle 
	PHA
	lda msu_status
	AND #status_trackmissing
	BNE .error ; Track missing (error) bit set?
	LDA #$00
	XBA
	PHP
	i16
	LDX #$0000
	PLP
	PLA 
	PHX
	TAX
	LDA.l msulooptab,x
	STA msu_control
	LDA #$FF
	STA msu_volume
	STA.l msu_017e
	PLX
	RTL
.error
	PLA
	RTL

.sector ; Player Down BGM
	LDA snd_ptr
	cmp #$20
	BNE .i1
	LDA #_088_downorch ; sector X
	BRA .playtrack
.i1	cmp #$46
	BNE .i2
	LDA #_049_downorch ; Sector Y
	BRA .playtrack
.i2	cmp #$BC
	BNE .i3
	LDA #_206_downorch ; Sector Z
	BRA .playtrack
.i3	LDA #$11
	BRA .playtrack

.sector2 ; Stage Clear BGM
	LDA snd_ptr
	cmp #$f0
	BNE .j1
	LDA #_248_lastclear ; stage6 clear, hard
	BRL .playtrack
.j1	cmp #$67
	BNE .j2
	LDA #_248_lastclear ; stage6 clear, medium
	BRL .playtrack
.j2	cmp #$f1
	BNE .j3
	LDA #_248_lastclear ; stage6 clear, easy
	BRL .playtrack
.j3	cmp #$20
	BNE .j4
	LDA #_008_clearorch ; sector X
	BRL .playtrack
.j4	cmp #$46
	BNE .j5
	LDA #_009_clearorch ; Sector Y
	BRL .playtrack
.j5	cmp #$BC
	BNE .j6
	LDA #_010_clearorch ; Sector Z
	BRL .playtrack
.j6	cmp #$19
	BNE .j7
	LDA #_032_clearband ; OOTD Slot Machine Clear
	BRL .playtrack
.j7	LDA #_007_clearband ; Stage Clear (Band)
	BRL .playtrack

; Copies MSU1 handler to RAM at $FD00
transfermsu
	JSL copy_to_0101_l			;bank 32
	PHB
	ai16
	LDA #$02FF ; transfer $300 bytes
	LDX #$FD00 ; start address FD00
	LDY #$D000 ; ram address

	IFNE	fastrom
	sasm_mvn	$B2,$7E ; MVN $B27E  ; bank B2 -> 7E  (must be tricked to assemble)
	ELSEIF
	sasm_mvn	$32,$7E ; MVN $327E  ; bank 32 -> 7E  (must be tricked to assemble)
	ENDC
	
	PLB
	RTL

;fade
msufade	
	LDA.l msu_017f
	AND #$00ff
	CMP #$00f1
	BEQ .k1
	LDA.l $003030
	RTL
.k1	PHP
	a8
	lda.l msu_017e
	CMP #$00
	BEQ .endslow
	dec a
	dec a
	cmp #$10
	bcs .k2
.endslow
	lda #$00
	sta.l msu_017f ;erase fade flag
.k2	sta.l $002006
	sta.l msu_017e
	PLP
	LDA.l $003030
	RTL	