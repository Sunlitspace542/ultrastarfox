
	incpublics	EXT\fontdata.ext

fontdata
charbanks	dw	font0fon&WM,font0wid&WM,font0trn&WM

moji	macro
	db	\1,\2,\3,\4,\5,\6,\7,\8
	endm

incfont	macro
font0wid	incbinfile	data\\moji_\1.fon
font0trn	incfile	data\\moji_\1.trn
font0fon	equ	font0wid+\2
	endm

	IFEQ	german
	incfont	0,140
	fileslog	data\moji_d.fon
	fileslog	data\moji_d.trn
	ELSEIF

	incfont	d,140
	fileslog	data\moji_0.fon
	fileslog	data\moji_0.trn
	ENDC

	incfile	ASM\gametext.asm

