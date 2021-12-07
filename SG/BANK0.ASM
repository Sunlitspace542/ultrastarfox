	include	header.inc
	include	shmacs.inc


	include	stratmac.inc
	include	stratlib.inc

	include	stratrou.ext
	include	game.ext
	include	world.ext
	include	main.ext
	include	draw.ext
;	include	blink.ext
	include	mario.ext
	include	mother.ext
	include	sound.ext
	include	trans.ext
	include	sprites.ext
	include	windows.ext


	include	gstrats.ext
	include	dstrats.ext
	include	kstrats.ext
	include	d2strats.ext
	include	gastrats.ext
	include	ga2strats.ext
	include	gbstrats.ext
	include	gb2strats.ext
	include	gb3strats.ext
	include	gistrats.ext
	include	gcstrats.ext
	include	pstrats.ext
	include	pistrats.ext
	include	pcstrats.ext
	include	expstrat.ext

	include	coltabs.ext
	include	bootnmi.ext
	include	colboxes.ext
	include	paths.ext
	include	mem.ext
	include	endseq.ext

;------------------------------------
	bank	0		;Bank 0

	db	0,0,0,0,0,0

	incfile	sgtabs.asm
	incfile	sgdata.asm

	incfile	data\arctan.asm


Do_HDR	=	1
	incfile	ushapes.asm
	incfile	shapes.asm
	incfile	shapes2.asm
	incfile	shapes3.asm
	incfile	pshapes.asm
	incfile	shapes4.asm
	incfile	shapes5.asm
	incfile	kshapes.asm
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
	incfile	istrats.asm
	incfile	d3strats.asm
	bankend	32

	org	$00ffc0,$7fc0

	IFEQ	JANGLISH

	IFEQ	PAL
; american
	db	"STAR FOX             "
	db	$20,$13,$a,$0,$1,$1,$0,$ff,$ff,$0,$0
	ELSEIF

	IFEQ	GERMAN+FRENCH
; british
	db	"STAR FOX             "
	db	$20,$13,$a,$0,$2,$1,$0,$ff,$ff,$0,$0

	ENDC

	IFNE	GERMAN
; german
	db	"STAR FOX             "
	db	$20,$13,$a,$0,$9,$1,$0,$ff,$ff,$0,$0
	ENDC

	IFNE	FRENCH
; france
	db	"STAR FOX             "
	db	$20,$13,$a,$0,$6,$1,$0,$ff,$ff,$0,$0
	ENDC

	ENDC

	ELSEIF

	db	"STAR FOX             "
	db	$20,$13,$a,$0,$0,$1,$0,$ff,$ff,$0,$0

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


	include	tail.inc


