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
	include	EXT\ga2strats.ext
	include	EXT\gbstrats.ext
	include	EXT\gb2strats.ext
	include	EXT\gb3strats.ext
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
	bank	0		;Bank 0

	db	0,0,0,0,0,0

	incfile	ASM\sgtabs.asm
	incfile	ASM\sgdata.asm

	incfile	INC\arctan.asm


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

start	jmp.l	startboot


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
	IFEQ	CONTEST
	inccru	bgandpcr,data\and.pcr
	ELSEIF
bgandpcr
	ENDC
	incfile	ASM\STRAT\istrats.asm
	incfile	ASM\STRAT\d3strats.asm
	bankend	32

	org	$00ffc0,$7fc0

; TODO: make this cleaner by adding IF's for dest code (and map mode if we decide to make fastrom disable-able, that is, if snes9x 1.61 is ever released)
; also check to make sure each dest code is correct

	IFEQ	internalname	; if internalname = 0
	db	"STAR FOX             "  
	ELSEIF					; if internalname = 1
	db	"STAR WING            "  
	ENDC

	IFEQ	JAPAN

	IFEQ	PAL
; american
	db	$20					;Map Mode (SlowROM LoROM)
	db	$15					;Cartridge Type (13 = MC1, 15 = GSU-2)
	db	$0a					;ROM Size
	db	$00					;RAM Size (if 0, use exp RAM size above)
	db	$01					;Destination Code (USA)
	db	$01					;Fixed Value
	db	$00					;Mask ROM Version
	dw	$ffff				;Compliment Check
	dw	$0000				;Check Sum
	ELSEIF

	IFEQ	GERMAN+FRENCH+SPANISH
; british
	db	$20					;Map Mode (SlowROM LoROM)
	db	$15					;Cartridge Type
	db	$0a					;ROM Size
	db	$00					;ROM Size (if 0, use exp RAM size above)
	db	$02					;Destination Code (PAL)
	db	$01					;Fixed Value
	db	$00					;Mask ROM Version
	dw	$ffff				;Compliment Check
	dw	$0000				;Check Sum

	ENDC

	IFNE	GERMAN
; german
	db	$20					;Map Mode (SlowROM LoROM)
	db	$15					;Cartridge Type (13 = MC1, 15 = GSU-2)
	db	$0a					;ROM Size
	db	$00					;RAM Size (if 0, use exp RAM size above)
	db	$09					;Destination Code (GER)
	db	$01					;Fixed Value
	db	$00					;Mask ROM Version
	dw	$ffff				;Compliment Check
	dw	$0000				;Check Sum
	ENDC

	IFNE	FRENCH
; france
	db	$20					;Map Mode (SlowROM LoROM)
	db	$15					;Cartridge Type (13 = MC1, 15 = GSU-2)
	db	$0a					;ROM Size
	db	$00					;RAM Size (if 0, use exp RAM size above)
	db	$06					;Destination Code (FRA)
	db	$01					;Fixed Value
	db	$00					;Mask ROM Version
	dw	$ffff				;Compliment Check
	dw	$0000				;Check Sum
	ENDC
	
	IFNE	SPANISH
; spanish
	db	$20					;Map Mode (SlowROM LoROM)
	db	$15					;Cartridge Type (13 = MC1, 15 = GSU-2)
	db	$0a					;ROM Size
	db	$00					;RAM Size (if 0, use exp RAM size above)
	db	$08					;Destination Code (SPN)
	db	$01					;Fixed Value
	db	$00					;Mask ROM Version
	dw	$ffff				;Compliment Check
	dw	$0000				;Check Sum
	ENDC

	ENDC

	ELSEIF
; japan
	db	$20					;Map Mode (SlowROM LoROM)
	db	$15					;Cartridge Type (13 = MC1, 15 = GSU-2)
	db	$0a					;ROM Size
	db	$00					;RAM Size (if 0, use exp RAM size above)
	db	$00					;Destination Code (JPN)
	db	$01					;Fixed Value
	db	$00					;Mask ROM Version
	dw	$ffff				;Compliment Check
	dw	$0000				;Check Sum

	ENDC

;------------------------------------

;Hardware Vectors	-------------------------
	org	$00ffe4,$7fe4
	dw	cop_vn
	dw	break_vn
	dw	abort_vn
	dw	$0108
	dw	$0000
	dw	$010c

	org	$00fff4,$7ff4
	dw	cop_ve
	dw	0
	dw	abort_ve
	dw	nmi_ve
	dw	start
	dw	irq_ve




;------------------------------------


	include	INC\tail.inc


