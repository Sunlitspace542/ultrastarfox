	include	INCLUDE\header.inc
	include	INCLUDE\shmacs.inc


	include	INCLUDE\stratmac.inc
	include	INCLUDE\stratlib.inc

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

	incfile	INCLUDE\arctan.asm


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
	incfile	ASM\istrats.asm
	incfile	ASM\d3strats.asm
	bankend	32

	org	$00ffc0,$7fc0

; Star Fox/StarWing ROM header is laid out as such:
; Internal ROM Name
; Map mode ($20 = SlowROM $30 = FastROM), ROM type, ROM size, SRAM size, Country, $1, version, checksum compliment, checksum, $0, $0

	IFEQ	internalname	; if internalname = 0
	db	"STAR FOX             "  
	ELSEIF					; if internalname = 1
	db	"STAR WING            "  
	ENDC

	IFEQ	JAPAN

	IFEQ	PAL
; american
	db	$20,$15,$a,$0,$1,$1,$0,$ff,$ff,$0,$0 
	ELSEIF

	IFEQ	GERMAN+FRENCH
; british
	db	$20,$15,$a,$0,$2,$1,$0,$ff,$ff,$0,$0

	ENDC

	IFNE	GERMAN
; german
	db	$20,$15,$a,$0,$9,$1,$0,$ff,$ff,$0,$0
	ENDC

	IFNE	FRENCH
; france
	db	$20,$15,$a,$0,$6,$1,$0,$ff,$ff,$0,$0
	ENDC

	ENDC

	ELSEIF
; japan
	db	$20,$15,$a,$0,$0,$1,$0,$ff,$ff,$0,$0

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


	include	INCLUDE\tail.inc


