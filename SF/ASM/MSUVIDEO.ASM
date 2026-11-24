;***************************************************************************
;*                                                                         *
;*                            UltraStarFox                                 *
;*                            ------------                                 *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   File: MSUVIDEO.ASM                                                    *
;*_________________________________________________________________________*
;*                                                                         *
;*   Descr: MSU-1 video player.                                            *
;*_________________________________________________________________________*
;*                                                                         *
;*   Date: 22/11/26                                                        *
;*_________________________________________________________________________*
;*                                                                         *
;*   Author(s):                                                            *
;*        ikari01, Conn, Sunlit                                            *
;*                                                                         *
;***************************************************************************
	INCPUBLICS	ext\msuvideo.ext
; MSU-1 video player by ikari01; disassembled by Conn

; User configuration
playerBank	equ	(*>>16) ; Bank containing PlayerCodeOffset.
	IFNE	MSU1
fmv_msutrack	equ	msubgmopeningfmv ; MSU-1 audio track to play.
	ELSEIF
fmv_msutrack	equ	0 ; MSU-1 audio track to play. (moved so it doesn't get in the way of voicelines)
	ENDC
msuvideoaddr	equ	$00000000 ; 32-bit Address of video data in the MSU file

; Scratch RAM
irqCounter	equ	transbmp1 ; RAM address incremented by the game's IRQ handler.
	IFEQ	MSUVIDEO_useAlcs
lineCounter	equ	$0000 ; IRQ count within the current frame.
frameValueA	equ	$0001 ; alternate frame line limit.
;frameValueB	equ	$0002 ; line limit used at the audio-frame boundary. Identical to frameValueA.
audioFrameLimit	equ	$0003 ; number of frames before switching line limits.
;frameLineLimit	equ	$0004 ; line count that ends the current frame. Identical to frameValueA.
audioFrameCounter	equ	$0005 ; counts frames up to audioFrameLimit.
videoFrameCount	equ	$0006 ; total video frames from the stream header.
audioStartPending	equ	$0008 ; starts the MSU-1 track at the first frame boundary.
bgTileBank	equ	$0009 ; selects the active video tile bank.
dmaSourceBank	equ	$000A ; source bank for the next DMA transfer.
dmaSourceAddress	equ	$000B ; source address for the next DMA transfer.
dmaDestination	equ	$000D ; B-bus destination register for the next DMA transfer.
dmaTransferLength	equ	$000E ; byte length for the next DMA transfer.
dmaMode	equ	$0010 ; mode for the next DMA transfer.
	ENDC
currentButtons	equ	cont0l ; latest sampled controller state.
pressedButtons	equ	trig0 ; newly pressed controller buttons.
previousButtons	equ	contl0l ; controller state from the previous sample.

PlayerCodeHook_l	; Long jump into the video player from here.
	jsr	uploadmsuvideoirq	; Upload video IRQ handler
	jmp PlayerCodeOffset
PlayerReturnHook
; Resume normal execution after the video player finishes here.
	jsl	copy_to_0101_l	; Reupload normal IRQ handler
	jml	restart	; Go to controls screen

PlayerCodeOffset
	pha
	phx
	phy
	php
	a8
	lda msu_id ; check whether MSU-1 is present
	cmp #'S'
	beq .msu_available
	plp
	ply
	plx
	pla
	jmp PlayerReturnHook ; MSU-1 not present
.msu_available
	phb
	IFNE	FASTROM
	lda #$80
	pha
	plb
	ELSEIF
	lda #$00
	pha
	plb
	ENDC
	jmp play_video

endroutine
;;;;;
	sei
;;;;;
	stz msu_control
	pla
	pla ; correct stack
	plb
	stz hdmaen ; disable HDMA
	plp
	ply
	plx
	pla
	jmp PlayerReturnHook

PlayerTableOffset

; HDMA tables.

hdma1
	db $00,$00
hdma4
	db $28,$8F,$7F,$0F,$11,$0F,$01,$8F,$00
hdma6
	db $38,$00,$00,$97,$01,$10,$00,$01,$87,$01,$10,$00,$00,$87,$01,$10
	db $00,$01,$77,$01,$10,$00,$00,$77,$01,$10,$00,$01,$67,$01,$10,$00
	db $00,$67,$01,$10,$00,$01,$57,$01,$10,$00,$00,$17,$01,$00
hdma5
	db $28,$BC,$7F,$BC,$01,$BC,$01,$FC,$00
hdma2
	db $00,$00,$00,$00,$02,$00,$04,$00,$06,$00,$08,$00,$0A,$00,$0C,$00
	db $0E,$00,$20,$00,$22,$00,$24,$00,$26,$00,$28,$00,$2A,$00,$00,$00
	db $00,$00,$2C,$00,$2E,$00,$40,$00,$42,$00,$44,$00,$46,$00,$48,$00
	db $4A,$00,$4C,$00,$4E,$00,$60,$00,$62,$00,$64,$00,$66,$00,$00,$00
	db $00,$00,$68,$00,$6A,$00,$6C,$00,$6E,$00,$80,$00,$82,$00,$84,$00
	db $86,$00,$88,$00,$8A,$00,$8C,$00,$8E,$00,$A0,$00,$A2,$00,$00,$00
	db $00,$00,$A4,$00,$A6,$00,$A8,$00,$AA,$00,$AC,$00,$AE,$00,$C0,$00
	db $C2,$00,$C4,$00,$C6,$00,$C8,$00,$CA,$00,$CC,$00,$CE,$00,$00,$00
	db $00,$00,$E0,$00,$E2,$00,$E4,$00,$E6,$00,$E8,$00,$EA,$00,$EC,$00
	db $EE,$00,$00,$01,$02,$01,$04,$01,$06,$01,$08,$01,$0A,$01,$00,$00
	db $00,$00,$0C,$01,$0E,$01,$20,$01,$22,$01,$24,$01,$26,$01,$28,$01
	db $2A,$01,$2C,$01,$2E,$01,$40,$01,$42,$01,$44,$01,$46,$01,$00,$00
	db $00,$00,$48,$01,$4A,$01,$4C,$01,$4E,$01,$60,$01,$62,$01,$64,$01
	db $66,$01,$68,$01,$6A,$01,$6C,$01,$6E,$01,$80,$01,$82,$01,$00,$00
	db $00,$00,$84,$01,$86,$01,$88,$01,$8A,$01,$8C,$01,$8E,$01,$A0,$01
	db $A2,$01,$A4,$01,$A6,$01,$A8,$01,$AA,$01,$AC,$01,$AE,$01,$00,$00
hdma3
	db $00,$00,$C0,$01,$C2,$01,$C4,$01,$C6,$01,$C8,$01,$CA,$01,$CC,$01
	db $CE,$01,$E0,$01,$E2,$01,$E4,$01,$E6,$01,$E8,$01,$EA,$01,$00,$00

play_video
	lda joy1h
	sta previousButtons ; prevent autofire from skipping video

	stz nmitimen
	jsr clear_dma_registers
	jsr wait_for_vblank
	jsr initialize_ppu
	IFNE	FASTROM
	lda #$01
	sta memsel	; FastROM on
	ENDC
	jsr initialize_vram
	a8i16
	stz cgswsel
	jsr configure_hdma
	jsr configure_video
	jsr initialize_msu_video
	cli	; Enable IRQs
	jsr play_video_frames

; Clear DMA channel registers.
clear_dma_registers
	stz mdmaen
	stz hdmaen
	stz ch1params
	stz ch1addrb
	stz ch1addra1tl
	stz ch1addra1th
	stz ch1atbank
	stz ch2params
	stz ch2addrb
	stz ch2addra1tl
	stz ch2addra1th
	stz ch2atbank
	stz ch3params
	stz ch3addrb
	stz ch3addra1tl
	stz ch3addra1th
	stz ch3atbank
	stz ch4params
	stz ch4addrb
	stz ch4addra1tl
	stz ch4addra1th
	stz ch4atbank
	stz ch5params
	stz ch5addrb
	stz ch5addra1tl
	stz ch5addra1th
	stz ch5atbank
	stz ch6params
	stz ch6addrb
	stz ch6addra1tl
	stz ch6addra1th
	stz ch6atbank
	rts

; Wait for one complete VBlank interval.
wait_for_vblank
.wait_for_vblank_end
	lda hvbjoyr
	and #$80
	bne .wait_for_vblank_end
.wait_for_vblank_start
	lda hvbjoyr
	and #$80
	beq .wait_for_vblank_start
	rts

; Reset CPU and PPU state used by playback.
initialize_ppu
	a8i16
	stz nmitimen
	lda #$FF
	sta wrio
	stz wrmpya
	stz wrmpyb
	stz wrdivl
	stz wrdivh
	stz wrdivb
	stz htimel
	stz htimeh
	stz vtimel
	stz vtimeh
	stz mdmaen
	stz hdmaen
	stz memsel
	lda #$8F
	sta inidisp
	stz objsel
	stz oamaddl
	stz oamaddh
	stz oamdata
	stz bgmode
	stz mosaic
	stz bg1sc
	stz bg2sc
	stz bg3sc
	stz bg4sc
	stz bg12nba
	stz bg34nba
	stz bg1hofs
	stz bg1vofs
	stz bg2hofs
	stz bg2vofs
	stz bg3hofs
	stz bg3vofs
	stz bg4hofs
	stz bg4vofs
	lda #$80
	sta vmainc ; Enable VRAM address auto-increment on write
	stz vmaddl
	stz vmaddh
	stz m7sel
	lda #$01
	sta m7a
	stz m7b
	stz m7c
	sta m7d
	stz m7x
	stz m7y
	stz cgadd
	stz w12sel
	stz w34sel
	stz wobjsel
	stz wh0
	stz wh1
	stz wh2
	stz wh3
	stz wbglog
	stz wobjlog
	stz tm
	stz ts
	stz tmw
	stz tsw
	stz cgswsel
	stz cgadsub
	lda #$E0
	sta coldata
	stz setini
	rts

; Copy initial tile and palette data to VRAM.
initialize_vram
	a8i16
	stz nmitimen
	stz mdmaen
	stz hdmaen
	ldx #$0000
	stx vmaddl
	lda #$09
	sta dmaMode
	ldx #hdma1&WM
	lda #playerBank
	stx dmaSourceAddress
	sta dmaSourceBank
	ldx #$0000
	stx dmaTransferLength
	lda #$18
	sta dmaDestination
	jsr transfer_vram
	ldx #$3F80
	stx vmaddl
	lda #$01
	sta dmaMode
	ldx #hdma2&WM
	lda #playerBank
	stx dmaSourceAddress
	sta dmaSourceBank
	ldx #$0100
	stx dmaTransferLength
	lda #$18
	sta dmaDestination
	jsr transfer_vram
	ldx #$7F80
	stx vmaddl
	lda #$01
	sta dmaMode
	ldx #hdma3&WM
	lda #playerBank
	stx dmaSourceAddress
	sta dmaSourceBank
	ldx #$0020
	stx dmaTransferLength
	lda #$18
	sta dmaDestination
	jsr transfer_vram
	ldx #$0000
	stx oamaddl
	lda #$08
	sta dmaMode
	ldx #hdma1&WM
	lda #playerBank
	stx dmaSourceAddress
	sta dmaSourceBank
	ldx #$0220
	stx dmaTransferLength
	lda #$04
	sta dmaDestination
	jsr transfer_vram
	rts

; Run one DMA transfer using the prepared parameters.
transfer_vram
	a8i16
	lda dmaMode
	sta ch0params
	lda dmaDestination
	sta ch0addrb
	lda dmaSourceBank
	ldx dmaSourceAddress
	stx ch0addra1tl
	sta ch0atbank
	ldx dmaTransferLength
	stx ch0dataddrl
	lda #$01
	sta mdmaen
	rts

; Set up HDMA for video data and scanline effects.
configure_hdma
	a8i16
	stz mdmaen
	stz hdmaen
	lda #$00
	sta ch1params
	lda #$00
	sta ch1addrb
	lda #playerBank
	ldy #hdma4&WM
	sty ch1addra1tl
	sta ch1atbank
	lda #$00
	sta ch2params
	lda #$07
	sta ch2addrb
	lda #playerBank
	ldy #hdma5&WM
	sty ch2addra1tl
	sta ch2atbank
	lda #$03
	sta ch3params
	lda #$0D
	sta ch3addrb
	lda #playerBank
	ldy #hdma6&WM
	sty ch3addra1tl
	sta ch3atbank
	ldx #$00B9
	stx vtimel
	lda #$21
	sta nmitimen
	lda #$0E
	sta hdmaen
	rts

; Configure the PPU video mode and window.
configure_video
	a8i16
	lda #$13
	sta bgmode
	lda #$3C
	sta bg1sc
	lda #$00
	sta bg12nba
	lda #$01
	sta tm
	lda #$01
	sta ts
	lda #$20
	sta wobjsel
	lda #$10
	sta wh0
	lda #$EF
	sta wh1
	lda #$40
	sta cgswsel
	stz cgadd
	lda #$0F
	sta inidisp
	rts

; Initialize MSU-1 video streaming.
initialize_msu_video
	a8i16
	IFEQ	msuvideoaddr
	ldx #$0000
	stx msu_seek
	stx msu_seek3
	ELSEIF	; Custom video address
	ldx #(msuvideoaddr&WM)
	stx msu_seek
	ldx #(msuvideoaddr>>16)
	stx msu_seek3
	ENDC
.msu_wait_for_ready
	bit msu_status
	bmi .msu_wait_for_ready
	ldx #$0000
	stx vmaddl
	lda #$04
	sta bgTileBank
	sta bg12nba
	ldx #$2001
	stx ch0addra1tl
	stz ch0atbank
	lda #$01
	sta audioStartPending
	rts

; Read frame metadata and display video until stopped.
play_video_frames
	a8i16
	stz lineCounter
	lda msu_read
	sta videoFrameCount
	lda msu_read
	sta videoFrameCount+1
	lda msu_read
;	sta frameValueA ;frameLineLimit
	sta frameValueA
	lda msu_read
;	sta frameValueA ;frameValueB
	lda msu_read
	sta audioFrameLimit
	lda #$01
	sta audioFrameCounter
	ldx videoFrameCount
	dex
process_scanline
.wait_for_irq
	lda irqCounter
	beq .wait_for_irq
	jsr check_stop_input
	lda lineCounter
	cmp #$02
	bpl .increment_line_counter
	lda #$18
	sta ch0addrb
	lda #$09
	sta ch0params
	ldy #$3F80
	sty ch0dataddrl
	lda #$01
	sta mdmaen
.increment_line_counter
	inc lineCounter
	lda lineCounter
	cmp frameValueA ;frameLineLimit
	bne .wait_for_irq
	lda audioStartPending
	beq .check_audio_restart
	lda #$01
	jsr start_audio_track
	stz audioStartPending
.check_audio_restart
	lda audioFrameCounter
	cmp audioFrameLimit
	bne .increment_audio_frame
	stz audioFrameCounter
;	lda frameValueA ;frameValueB
	bra .store_audio_frame
.increment_audio_frame
;	lda frameValueA
	inc audioFrameCounter
.store_audio_frame
;	sta frameValueA ;frameLineLimit
reset_line_state
	stz lineCounter
	dex
	beq .finish_video
	stz cgadd
	lda #$22
	sta ch0addrb
	lda #$08
	sta ch0params
	ldy #$0200
	sty ch0dataddrl
	lda #$01
	sta mdmaen
	lda bgTileBank
	bne .disable_bg_tiles
	lda #$04
	sta bg12nba
	sta bgTileBank
	ldy #$0000
	sty vmaddl
	jmp process_scanline
.disable_bg_tiles
	stz bg12nba
	stz bgTileBank
	ldy #$4000
	sty vmaddl
	jmp process_scanline
.finish_video
	jmp endroutine
; Clear the IRQ counter and detect a newly pressed button.
check_stop_input
	stz irqCounter
	lda pressedButtons
	beq .no_button_press
	ldx #$0001 ; button press detected; stop video
	rts
.no_button_press
	phy
	lda joy1h
	sta currentButtons
	tay
	eor previousButtons
	and currentButtons
	sta pressedButtons
	sty previousButtons
	ply
	rts

; Start the configured MSU-1 audio track.
start_audio_track
	stz msu_volume
	lda #fmv_msutrack
	sta msu_track
	stz msu_track2
.wait_for_audio
	bit msu_status
	bvs .wait_for_audio
	lda #$FF
	sta msu_volume
	lda #audiostate_norepeat
	sta msu_control
	rts

; Copies MSU-1 video IRQ handler to RAM at addr $010C
uploadmsuvideoirq
	php ; Push Processor status to stack
	phb ; Push DBR onto stack (MVN changes it to destination bank)

	ai16
	ldx	#msuvideoirqhan&WM ; src data addr
	ldy	#$010C ; dest data addr
	lda	#msuvideoirqhanend-msuvideoirqhan-1 ; len of data to copy
	IFNE	FASTROM
	_mvn	(msuvideoirqhan>>16),$80
	ELSEIF
	_mvn	(msuvideoirqhan>>16),$00
	ENDC

	plb ; Pull DBR from stack
	plp ; Pull Processor status from stack
	rts ; Return from subroutine

; Simplified IRQ handler for video player
msuvideoirqhan
.irq
	ai16		;$010c	irq
	pha
	lda.l	m_sfr
	bpl	.irqq
.qexit	pla
	rti

.irqq
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

	inc	irqCounter	; increment IRQ counter

	nastyon
	jsl	irqcode_l
.msuvideo_doneirq
	a8
	inc	framec
	lda	timeupr
	longa

.exit	ai16
	ply
	plx
	plb
	pla	
	rti
msuvideoirqhanend