hdmaf_inidisp	equ	%00000010
hdmaf_bg2hofs	equ	%00000100
hdmaf_win	equ	%00001000
hdmaf_bg2vofs	equ	%00010000


hdma_start	equ	(*-ramstart)+$28000

xhdma_start

xhdma_wh0wh1_1	db	15
	dw	0ff00h
	rept	192
	db	1
	dw	0ff00h
	endr
	db	0

xhdma_wh0wh1_2	db	15
	dw	0ff00h
	rept	192
	db	1
	dw	0ff00h
	endr
	db	0


xhdma_inidisp
	db	15+safeinidisptop
	db	$80

	db	95	;makes 190
xinidisp1	db	$80
	db	45
xinidisp2	db	$80
	db	50
xinidisp1a	db	$80

	db	127
	db	$80
	db	0

xhdma_inidisp2
	db	47
	db	$80

	db	127
xinidisp3	db	$f
	db	2
xinidisp4	db	$f
	db	120
	db	$80	; turn off below sphere
	db	0

xhdma_inidisp3
	db	15
	db	$80
	db	70
xinidisp5	db	$f
	db	127
xinidisp6	db	$f	; 100 = 200 scanlines of visiblescreen
	db	3
xinidisp7	db	$f	; 100 = 200 scanlines of visiblescreen
	db	100
	db	$80	
	db	0




xhdma_window
xhdma_wv0	db	0
	db	0
xhdma_wv1	db	0
	db	0

	db	30
	db	2<<4	; window 1 enable for bg1
	db	100
	db	0
	db	0

xhdma_bg2hofs1
	rept	250
	db	1
	dw	128
	endr
	db	0

xhdma_bg2hofs2
	rept	250
	db	1
	dw	128
	endr
	db	0


xhdma_bg2vofs
	db	10
	dw	0
	rept	250
	db	1
	dw	0
	endr
	db	0

hdma_end	equ	(*-ramstart)+$28000


;xhdma_s	=	xhdma_tables
;xhdmaalc	macro
;\1	=	xhdma_s
;xhdma_s	=	xhdma_s+\2
;	endm
;
;	xhdmaalc	xhdma_start,0
;	xhdmaalc	xhdma_inidisp,hdma_inidisplen
;	xhdmaalc	xhdma_inidisp2,hdma_inidisp2len
;	xhdmaalc	xhdma_inidisp3,hdma_inidisp3len
;	xhdmaalc	xhdma_window,hdma_windowlen
;	xhdmaalc	xhdma_bg2hofs1,hdma_bg2hofslen
;	xhdmaalc	xhdma_bg2hofs2,hdma_bg2hofs2len
;	xhdmaalc	xhdma_wh0l,hdma_wh0llen
;	xhdmaalc	xhdma_wh0r,hdma_wh0rlen
;	xhdmaalc	xhdma_wh1l,hdma_wh1llen
;	xhdmaalc	xhdma_wh1r,hdma_wh1rlen
;	xhdmaalc	xhdma_bg2vofs,hdma_bg2vofslen
;	xhdmaalc	xhdma_end,0
;
;	IFGE	(xhdma_s-xhdma_start)-xhdma_max
;	progress_off
;	printf	"Error: XHDMA tables too large in %$6.%n"
;	progress_on
;	ENDC
;
;hdmadef	macro
;x\1	equ	((\1-hdma_start)+xhdma_start)
;	endm
;
;	hdmadef	inidisp1
;	hdmadef	inidisp2
;	hdmadef	inidisp3
;	hdmadef	inidisp4
;	hdmadef	inidisp5
;	hdmadef	inidisp6
;	hdmadef	hdma_wv0
;	hdmadef	hdma_wv1
;	hdmadef	hdma_wh0ld
;	hdmadef	hdma_wh0rd
;	hdmadef	hdma_wh1ld
;	hdmadef	hdma_wh1rd
;	hdmadef	inidisp1a
;
;	IFEQ	1
;xinidisp1	equ	((inidisp1-hdma_inidisp)+xhdma_inidisp)
;xinidisp2	equ	((inidisp2-hdma_inidisp)+xhdma_inidisp)
;
;xinidisp3	equ	((inidisp3-hdma_inidisp2)+xhdma_inidisp2)
;xinidisp4	equ	((inidisp4-hdma_inidisp2)+xhdma_inidisp2)
;
;xinidisp5	equ	((inidisp5-hdma_inidisp3)+xhdma_inidisp3)
;xinidisp6	equ	((inidisp6-hdma_inidisp3)+xhdma_inidisp3)
;
;xhdma_wv0	equ	((hdma_wv0-hdma_start)+xhdma_start)
;xhdma_wv1	equ	((hdma_wv1-hdma_start)+xhdma_start)
;	ENDC
;
