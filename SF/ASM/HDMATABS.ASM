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
