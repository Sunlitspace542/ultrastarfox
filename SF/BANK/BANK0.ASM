	include	INC\header.inc
	include	INC\shmacs.inc


	include	INC\stratmac.inc
	include	INC\stratlib.inc

	include	EXT\stratrou.ext
	include	EXT\game.ext
	include	EXT\world.ext
	include	EXT\main.ext
	include	EXT\draw.ext
	include	EXT\mario.ext
	include	EXT\mother.ext
	include	EXT\sound.ext
	include	EXT\trans.ext
	include	EXT\sprites.ext
	include	EXT\windows.ext


	include	EXT\gstrats.ext
	include	EXT\dstrats.ext
	include	EXT\kstrats.ext
	include	EXT\d2strats.ext
	include	EXT\gastrats.ext
	include	EXT\ga2strat.ext
	include	EXT\gbstrats.ext
	include	EXT\gb2strat.ext
	include	EXT\gb3strat.ext
	include	EXT\gistrats.ext
	include	EXT\gcstrats.ext
	include	EXT\pstrats.ext
	include	EXT\pistrats.ext
	include	EXT\pcstrats.ext
	include	EXT\expstrat.ext

	include	EXT\coltabs.ext
	include	EXT\bootnmi.ext
	include	EXT\colboxes.ext
	include	EXT\paths.ext
	include	EXT\mem.ext
	include	EXT\endseq.ext

;------------------------------------
; Write BANKS.CSV header
	fopen	+BANKS.CSV
	printf	"Bank number,Bytes free%n"
	fclose	BANKS.CSV
;------------------------------------

	bank	0		;Bank 0

	db	0,0,0,0,0,0

	incfile	ASM\sgtabs.asm
	incfile	ASM\sgdata.asm

	incfile	INC\arctan.inc


Do_HDR	=	1
	incfile	SHAPES\ushapes.asm
	incfile	SHAPES\shapes.asm
	incfile	SHAPES\shapes2.asm
	incfile	SHAPES\shapes3.asm
	incfile	SHAPES\pshapes.asm
	incfile	SHAPES\shapes4.asm
	incfile	SHAPES\shapes5.asm
	incfile	SHAPES\shapes6.asm
	incfile	SHAPES\shapes7.asm
	incfile	SHAPES\kshapes.asm
Do_HDR	=	0

start	jmp.l	startboot ; Entrypoint


cop_ve
abort_ve
nmi_ve
irq_ve
cop_vn
reset_vn
break_vn
abort_vn
	rti

	bankend	0

	bank	32
	public	bgandpcr
	inccru	bgandpcr,data\and.pcr
	incfile	STRAT\istrats.asm
	incfile	STRAT\d3strats.asm
	IFNE	msu_legacy
	include	ASM\MSU.ASM ; Include MSU playback logic
	ENDC
	bankend	32

	;; BEGIN ROM HEADER

	org $00ffb0,$7fb0
	db	"01"				; Maker Code (2 ASCII characters long)
	db	"FO  "				; Game Code (4 ASCII Characters long)
	db	0,0,0,0,0,0,0		; Fixed Value
	db	6					; Expansion RAM Size (5 = 32kbyte, 6 = 64kbyte)
	db	0					; Special Version
	IFNE	SUPERFX3
	db	$52					; Cartridge Type (Sub-number)
							; (52) Super FX 3 (The Ultimate DOOM) - the Super FX Version Code Register $303B also reports $52
	ELSEIF
	db	0					; (0) None
	ENDC

	org	$00ffc0,$7fc0
	; Game name (must be 21 ASCII characters long)
	; This section is controlled by CONFIG\ROM.INC.
	IFEQ	internalname	; if internalname = 0
	db	"STAR FOX             "  
	ENDC					; if internalname = 1
	
	IFEQ	internalname-1
	db	"STAR WING            "  
	ENDC

	IFEQ	internalname-2
	docustomname ; invoke macro to do custom name
	ENDC

	; Cartridge information
	;
	;!! IMPORTANT INFO ABOUT MAP MODE AND FASTROM:
	; Super FX games actually use map mode $24, though the header reports LoROM.
	; See this RGMechEX video: https://youtu.be/-U76YvWdnZM?t=839
	;
	; FastROM is **NOT** header-dependent. FastROM is activated at runtime if certain conditions are met.
	; ROM Banks must begin at $80 rather than $00, and register $420D (memsel) must be set to 1.
	; All ROM accesses (jumps, loads, stores, etc.) must also be running out of bank $80.
	;
	; FastROM is **NOT** supported by the MARIO chip or GSU series Super FX chips.
	; FastROM + Super FX works on emulators and SD2SNES/FXPak Pro due to their implementations of the chip being inaccurate.
	; Phonymike tested a FastROM build on an actual GSU-2 cartridge board and it did not boot.
	;
	; The Super FX 3 / GSU-3 **DOES** support FastROM, however.
	; See: https://forums.nesdev.org/viewtopic.php?p=301189#p301189
	; Simply put:
	; The GSU-2 memory map set aside SNES banks $80-$FF for a completely seperate ROM that was accessible only to the SNES.
	; The GSU-3 maps banks $80-$FF to the same ROM as banks $00-$7F instead, allowing FastROM to legitimately function.
	; FastROM is not indicated in the header to ensure compatibility with older emulators.
	; Some will refuse to boot if the header byte is set correctly.
	; This byte being set to $20 will not affect performance, as explained above.
	;
	; Remember that the ROM header's original purpose is to be metadata on what the cartridge should have onboard.
	; This data was required by Nintendo to be present, the actual SNES hardware does not care about this data.
	; This data is required for emulators/flashcarts to determine how to emulate the cartridge.
	;
	IFNE	FASTROM 
	db	$20					; Map Mode
							 ; (20) SlowROM LoROM
							 ; (30) FastROM LoROM
	ELSEIF
	db	$20					; Map Mode
							 ; (20) SlowROM LoROM
							 ; (30) FastROM LoROM
	ENDC
	db	$14					; Cartridge Type
							 ; (13) MARIO Chip 1 / Super FX 1 (StarFox 1)
							 ; (14) Super FX 2 (DOOM) / Super FX 3 (The Ultimate DOOM)
							 ; (15) Battery + Super FX 2 (Yoshi's Island, StarFox 2)
							 ; (1A) Battery + Super FX 1 (Stunt Race FX)
	db	$0b					; ROM Size (0A = 8mbit, 0B = 16mbit)
	db	$00					; RAM Size (if 0, use exp RAM size above)
	db	hdr_region			; Destination Code (from below)
	db	$33					; Fixed Value
	db	$00					; Mask ROM Version
	dw	$ffff				; Compliment Check
	dw	$0000				; Check Sum (Computed at assembly)



	; Region/Destination Codes
	IFEQ	JAPAN

	IFEQ	PAL				; American
hdr_region	equ	$01			; Destination Code (USA)
	ELSEIF

	IFEQ	GERMAN+FRENCH+SPANISH	; British
hdr_region	equ	$02					; Destination Code (PAL)
	ENDC

	IFNE	GERMAN			; German
hdr_region	equ	$09			; Destination Code (GER)
	ENDC

	IFNE	FRENCH			; French
hdr_region	equ	$06			; Destination Code (FRA)
	ENDC
		
	IFNE	SPANISH			; Spanish
hdr_region	equ	$08			; Destination Code (SPN)
	ENDC

	ENDC

	ELSEIF					; Japanese
hdr_region	equ	$00			; Destination Code (JPN)

	ENDC


	;; END ROM HEADER

;------------------------------------

;Hardware Vectors--------------------

	;Native (65816 Mode)
	org	$00ffe0,$7fe0
	dw	$00,$00				; 4 bytes unused
	IFD	_SASM
	dw	cop_vn				; COP
	dw	break_vn			; BRK
	dw	abort_vn			; ABORT
	ENDC
	IFD	_ARGSFX
	dw	cop_vn&WM			; COP
	dw	break_vn&WM			; BRK
	dw	abort_vn&WM			; ABORT
	ENDC
	dw	$0108				; NMI
	dw	$0000				; unused (would be RESET, but the SNES always boots in Emulation mode)
	dw	$010c				; IRQ

	;Emulation (6502 Mode)
	org	$00fff0,$7ff0
	dw	$00,$00				; unused
	IFD	_SASM
	dw	cop_ve				; COP
	dw	$00					; unused (would be BRK, but BRK and IRQ share the same vector in Emulation mode)
	dw	abort_ve			; ABORT
	dw	nmi_ve				; NMI
	dw	start				; RESET
	dw	irq_ve				; IRQ/BRK
	ENDC
	IFD	_ARGSFX
	dw	cop_ve&WM			; COP
	dw	$00					; unused (would be BRK, but BRK and IRQ share the same vector in Emulation mode)
	dw	abort_ve&WM			; ABORT
	dw	nmi_ve&WM			; NMI
	dw	start&WM			; RESET
	dw	irq_ve&WM			; IRQ/BRK
	ENDC

;------------------------------------


	include	INC\tail.inc


