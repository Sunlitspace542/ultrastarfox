

	INCPUBLICS	sgdata.ext


	public	logtab8s

bg2ptrs	dw bg2tab1&WM ,bg2tab1&WM
	dw bg2tab2&WM ,bg2tab2&WM
	dw bg2tab3&WM ,bg2tab3&WM
	dw bg2tab4&WM ,bg2tab4&WM
	dw bg2tab5&WM ,bg2tab5&WM
	dw bg2tab6&WM ,bg2tab6&WM
	dw bg2tab6&WM ,bg2tab6&WM
	dw bg2tab6&WM ,bg2tab6&WM
	dw bg2tab6&WM ,bg2tab6&WM
	dw bg2tab6&WM ,bg2tab6&WM

bg2tab1	dw 16384+0+16
	dw 16384+0+16,16384+0+16,16384+0+16
	dw 16384+0+16,16384+0+16,16384+0+16,16384+0+16,16384+0+16
	dw 16384+0+16,16384+0+16,16384+0+16,16384+0+16
	dw 16384+0+16,16384+0+16,16384+0+16,16384+0+16,16384+0+16
	dw 16384+0+16,16384+0+16,16384+0+16,16384+0+16
	dw 16384+0+16,16384+0+16,16384+0+16,16384+0+16,16384+0+16
	dw 16384+0+16,16384+0+16,16384+0+16
	dw 16384+0+16,16384+0+16

bg2tab2	dw 16384+8+12
	dw 16384+7+12,16384+7+12,16384+7+12
	dw 16384+6+12,16384+6+12,16384+6+12,16384+6+12,16384+6+12
	dw 16384+5+12,16384+5+12,16384+5+12,16384+5+12
	dw 16384+4+12,16384+4+12,16384+4+12,16384+4+12,16384+4+12
	dw 16384+3+12,16384+3+12,16384+3+12,16384+3+12
	dw 16384+2+12,16384+2+12,16384+2+12,16384+2+12,16384+2+12
	dw 16384+1+12,16384+1+12,16384+1+12
	dw 16384+0+12,16384+0+12

bg2tab3	dw 16384+14+9
	dw 16384+13+9
	dw 16384+12+9,16384+12+9
	dw 16384+11+9,16384+11+9,16384+11+9
	dw 16384+10+9,16384+10+9
	dw 16384+9+9,16384+9+9,16384+9+9
	dw 16384+8+9,16384+8+9
	dw 16384+7+9,16384+7+9,16384+7+9
	dw 16384+6+9,16384+6+9
	dw 16384+5+9,16384+5+9,16384+5+9
	dw 16384+4+9,16384+4+9
	dw 16384+3+9,16384+3+9,16384+3+9
	dw 16384+2+9,16384+2+9
	dw 16384+1+9
	dw 16384+0+9,16384+0+9

bg2tab4	dw 16384+18+7
	dw 16384+17+7,16384+17+7
	dw 16384+16+7,16384+16+7
	dw 16384+15+7
	dw 16384+14+7,16384+14+7
	dw 16384+13+7,16384+13+7
	dw 16384+12+7
	dw 16384+11+7,16384+11+7
	dw 16384+10+7,16384+10+7
	dw 16384+9+7
	dw 16384+8+7,16384+8+7
	dw 16384+7+7,16384+7+7
	dw 16384+6+7
	dw 16384+5+7,16384+5+7
	dw 16384+4+7,16384+4+7
	dw 16384+3+7
	dw 16384+2+7,16384+2+7
	dw 16384+1+7,16384+1+7
	dw 16384+0+7,16384+0+7

bg2tab5	dw 16384+24+4
	dw 16384+23+4
	dw 16384+22+4
	dw 16384+21+4
	dw 16384+20+4,16384+20+4
	dw 16384+19+4
	dw 16384+18+4
	dw 16384+17+4,16384+17+4
	dw 16384+16+4
	dw 16384+15+4
	dw 16384+14+4,16384+14+4
	dw 16384+13+4
	dw 16384+12+4
	dw 16384+11+4
	dw 16384+10+4,16384+10+4
	dw 16384+9+4
	dw 16384+8+4
	dw 16384+7+4,16384+7+4
	dw 16384+6+4
	dw 16384+5+4
	dw 16384+4+4,16384+4+4
	dw 16384+3+4
	dw 16384+2+4
	dw 16384+1+4
	dw 16384+0+4,16384+0+4

bg2tab6	dw 16384+32
	dw 16384+31,16384+30,16384+29
	dw 16384+28,16384+27,16384+26
	dw 16384+25,16384+24,16384+23,16384+22,16384+21
	dw 16384+20,16384+19,16384+18,16384+17
	dw 16384+16
	dw 16384+15,16384+14,16384+13,16384+12
	dw 16384+11,16384+10,16384+9,16384+8
	dw 16384+7,16384+6,16384+5
	dw 16384+4,16384+3,16384+2,16384+1

;Block -----------------------------------------V

X_data_start

st_lineM	dw	%1111111111111111
	dw	%0111111101111111
	dw	%0011111100111111
	dw	%0001111100011111
	dw	%0000111100001111
	dw	%0000011100000111
	dw	%0000001100000011
	dw	%0000000100000001

ed_lineM	dw	%1000000010000000
	dw	%1100000011000000
	dw	%1110000011100000
	dw	%1111000011110000
	dw	%1111100011111000
	dw	%1111110011111100
	dw	%1111111011111110
	dw	%1111111111111111




pbittab
	IFEQ	1
	rept	32	;num_col
	dw	$8080,$4040,$2020,$1010,$808,$404,$202,$101
	endr
	ENDC

pbittabn
	IFEQ	1
	rept	32	;num_col
	dw	$7f7f,~$4040,~$2020,~$1010,~$808,~$404,~$202,~$101
	endr
	ENDC


pxoftab
tbtv	=	0
ttx	=	0
	IFEQ	1
	rept	32	;num_col
	dw	tbtv,tbtv,tbtv,tbtv,tbtv,tbtv,tbtv,tbtv
tbtv	=	tbtv+col_size
	endr
	ENDC

pyoftab
tbtv	=	0
	IFEQ	1
	rept	16
	dw	tbtv
	dw	tbtv+2
	dw	tbtv+4
	dw	tbtv+6
	dw	tbtv+8
	dw	tbtv+10
	dw	tbtv+12
	dw	tbtv+14
tbtv	=	tbtv+32
	endr
	ENDC

X_data_end

;Block---------------------------------------------A

	
;
;pxoftab
;tbtv	=	0
;
;	rept	32	;num_col
;	dw	tbtv,tbtv,tbtv,tbtv,tbtv,tbtv,tbtv,tbtv
;tbtv	=	tbtv+col_size
;	endr
;
;pyoftab
;tbtv	=	0
;	rept	16
;	dw	tbtv
;	dw	tbtv+2
;	dw	tbtv+4
;	dw	tbtv+6
;	dw	tbtv+8
;	dw	tbtv+10
;	dw	tbtv+12
;	dw	tbtv+14
;tbtv	=	tbtv+32
;	endr
;






;x	=	0
;y	=	0
;n	=	0


colourtab0
	db	0,$ff,0,$ff,0,$ff,0,$ff,0,$ff,0,$ff,0,$ff,0,$ff
colourtab1
	db	0,0,$ff,$ff,0,0,$ff,$ff,0,0,$ff,$ff,0,0,$ff,$ff
colourtab2
	db	0,0,0,0,$ff,$ff,$ff,$ff,0,0,0,0,$ff,$ff,$ff,$ff
colourtab3
	db	0,0,0,0,0,0,0,0,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff



colourtab01
	dw	$0000,$00ff,$ff00,$ffff,$0000,$00ff,$ff00,$ffff
	dw	$0000,$00ff,$ff00,$ffff,$0000,$00ff,$ff00,$ffff
colourtab23
	dw	$0000,$0000,$0000,$0000,$00ff,$00ff,$00ff,$00ff
	dw	$ff00,$ff00,$ff00,$ff00,$ffff,$ffff,$ffff,$ffff


;testshl	db	0,0,0,0,0,0,0,0
;testshh	db	3,4,4,5,4,1,6,7
;testshh	db	1,10,15,5,12,10,6,3





;----------------------------------------------------------------






;************************************************

rndbyte	macro
rndval =	(rndval*91+$61d7)&$ffff
	db	rndval&255
	endm

rndval	=	$5a79

mrndtab
	rept	256
	rndbyte
	endr


Intro256Pal
	incbinfile	data\nintendo.pal
;	rgbw	0,0,0
;;	shades	15,1,1,1,31,31,31	; $00 greys
;;	shades	15,5,5,5,20,20,20	; $00 greys
;	rgbw	2,2,2
;	rgbw	3,3,3
;	rgbw	4,4,4
;	rgbw	6,6,6
;	rgbw	8,8,8
;	rgbw	10,10,10
;	rgbw	11,11,11
;	rgbw	13,13,13
;	rgbw	15,15,15
;	rgbw	17,17,17
;	rgbw	19,19,19
;	rgbw	21,21,21
;	rgbw	23,23,23
;	rgbw	26,26,26
;	rgbw	29,29,29
;
;
;	rgbw	0,0,0
;	shades	15,1,0,0,31,0,0		; $10 reds
;
;	rgbw	0,0,0
;	shades	15,0,1,0,0,31,0		; $20 greens
;
;	rgbw	0,0,0
;	shades	15,0,0,1,0,0,31		; $30 blues
;
;	rgbw	0,0,0
;	shades	15,0,0,1,31,31,0 	; $40 yellows
;
;	rgbw	0,0,0
;	shades	15,0,0,1,31,0,31	; $50 magentas
;
;	rgbw	0,0,0
;	shades	15,0,0,1,0,31,31	; $60 cyans
;
;	rept	16			; $70 game palette
;	dw	0
;	endr
;
;	rgbw	0,0,0
;	shades	3,31,1,1,31,15,1	; $80 rainbow
;	shades	3,31,15,1,31,31,1
;	shades	3,31,31,1,1,31,1
;	shades	3,1,31,1,1,1,31
;	shades	3,1,1,31,15,1,15
;

	rgbw	0,0,0
gs	=	1			; $90 combat (green/brown)
	rept	7
	rgbw	0,gs,0
	rgbw	gs/2,gs/2,0
gs	=	gs+4
	endr
	rgbw	0,31,0


	rgbw	0,0,0
gs	=	1			; $a0 blue marble
	rept	7
	rgbw	0,0,gs
	rgbw	0,0,gs/2
gs	=	gs+4
	endr
	rgbw	0,0,31


;************************************************




ddbw	macro
	db	\1,\1
	endm

chardw	macro
	ifne	easytext
	db	\1,0
	elseif
	db	\1,\1
	endc
	endm

debugspace
	chardw	%00000000
	chardw	%00000000
	chardw	%00000000
	chardw	%00000000
	chardw	%00000000
	chardw	%00000000
	chardw	%00000000
	chardw	%00000000


debugchars
;0
	chardw	%00000000
	chardw	%01111100
	chardw	%11000110
	chardw	%11001110
	chardw	%11010110
	chardw	%11100110
	chardw	%11000110
	chardw	%01111100

;1
	chardw	%00000000
	chardw	%00110000
	chardw	%01110000
	chardw	%00110000
	chardw	%00110000
	chardw	%00110000
	chardw	%00110000
	chardw	%01111000

;2
	chardw	%00000000
	chardw	%01111000
	chardw	%00001100
	chardw	%00001100
	chardw	%01111000
	chardw	%11000000
	chardw	%11000000
	chardw	%11111100

;3
	chardw	%00000000
	chardw	%11111100
	chardw	%00001100
	chardw	%00011000
	chardw	%00110000
	chardw	%00001100
	chardw	%11001100
	chardw	%01111000

;4
	chardw	%00000000
	chardw	%00011100
	chardw	%00111100
	chardw	%01101100
	chardw	%11001100
	chardw	%11111110
	chardw	%00001100
	chardw	%00001100

;5
	chardw	%00000000
	chardw	%11111110
	chardw	%11000000
	chardw	%11111100
	chardw	%00000110
	chardw	%00000110
	chardw	%11000110
	chardw	%01111100

;6
	chardw	%00000000
	chardw	%01111100
	chardw	%11000000
	chardw	%11111100
	chardw	%11000110
	chardw	%11000110
	chardw	%11000110
	chardw	%00111100

;7
	chardw	%00000000
	chardw	%11111100
	chardw	%00001100
	chardw	%00001100
	chardw	%00011100
	chardw	%00110000
	chardw	%00110000
	chardw	%00110000

;8
	chardw	%00000000
	chardw	%01111100
	chardw	%11000110
	chardw	%11000110
	chardw	%01111100
	chardw	%11000110
	chardw	%11000110
	chardw	%01111100

;9
	chardw	%00000000
	chardw	%01111100
	chardw	%11000110
	chardw	%11000110
	chardw	%11000110
	chardw	%01111110
	chardw	%00000110
	chardw	%00111100

;A
	chardw	%00000000
	chardw	%00111000
	chardw	%01101100
	chardw	%11000110
	chardw	%11000110
	chardw	%11111110
	chardw	%11000110
	chardw	%11000110

;B
	chardw	%00000000
	chardw	%11111100
	chardw	%11000110
	chardw	%11000110
	chardw	%11111000
	chardw	%11000110
	chardw	%11000110
	chardw	%11111100

;C
	chardw	%00000000
	chardw	%01111100
	chardw	%11000110
	chardw	%11000000
	chardw	%11000000
	chardw	%11000000
	chardw	%11000110
	chardw	%01111100

;D
	chardw	%00000000
	chardw	%11111000
	chardw	%11001100
	chardw	%11000110
	chardw	%11000110
	chardw	%11000110
	chardw	%11001100
	chardw	%11111000

;E
	chardw	%00000000
	chardw	%11111110
	chardw	%11000000
	chardw	%11000000
	chardw	%11111000
	chardw	%11000000
	chardw	%11000000
	chardw	%11111110

;F
	chardw	%00000000
	chardw	%11111110
	chardw	%11000000
	chardw	%11000000
	chardw	%11111000
	chardw	%11000000
	chardw	%11000000
	chardw	%11000000

;G
	chardw	%00000000
	chardw	%01111100
	chardw	%11000110
	chardw	%11000000
	chardw	%11011110
	chardw	%11000110
	chardw	%11000110
	chardw	%01111100

;H
	chardw	%00000000
	chardw	%11000110
	chardw	%11000110
	chardw	%11000110
	chardw	%11111110
	chardw	%11000110
	chardw	%11000110
	chardw	%11000110

;I
	chardw	%00000000
	chardw	%01111000
	chardw	%00110000
	chardw	%00110000
	chardw	%00110000
	chardw	%00110000
	chardw	%00110000
	chardw	%01111000

;J
	chardw	%00000000
	chardw	%00111110
	chardw	%00000110
	chardw	%00000110
	chardw	%00000110
	chardw	%00000110
	chardw	%11000110
	chardw	%01111100
;k
	chardw	%00000000
	chardw	%11000110
	chardw	%11011000
	chardw	%11110000
	chardw	%11100000
	chardw	%11110000
	chardw	%11001100
	chardw	%11000110
;L
	chardw	%00000000
	chardw	%11000000
	chardw	%11000000
	chardw	%11000000
	chardw	%11000000
	chardw	%11000000
	chardw	%11000000
	chardw	%11111110
;M
	chardw	%00000000
	chardw	%10000010
	chardw	%11000110
	chardw	%11101110
	chardw	%11111110
	chardw	%11010110
	chardw	%11000110
	chardw	%11000110
;N
	chardw	%00000000
	chardw	%10000110
	chardw	%11000110
	chardw	%11100110
	chardw	%11110110
	chardw	%11011110
	chardw	%11001110
	chardw	%11000110
;O
	chardw	%00000000
	chardw	%01111100
	chardw	%11000110
	chardw	%11000110
	chardw	%11000110
	chardw	%11000110
	chardw	%11000110
	chardw	%01111100
;P
	chardw	%00000000
	chardw	%11111100
	chardw	%11000110
	chardw	%11000110
	chardw	%11000110
	chardw	%11111100
	chardw	%11000000
	chardw	%11000000
;Q
	chardw	%00000000
	chardw	%01111100
	chardw	%11000110
	chardw	%11000110
	chardw	%11010110
	chardw	%11011110
	chardw	%11001110
	chardw	%01111110
;R
	chardw	%00000000
	chardw	%11111100
	chardw	%11000110
	chardw	%11000110
	chardw	%11111100
	chardw	%11011000
	chardw	%11001100
	chardw	%11000110
;S
	chardw	%00000000
	chardw	%00111100
	chardw	%11000110
	chardw	%11000000
	chardw	%01111100
	chardw	%00000110
	chardw	%11000110
	chardw	%01111100
;T
	chardw	%00000000
	chardw	%11111110
	chardw	%00110000
	chardw	%00110000
	chardw	%00110000
	chardw	%00110000
	chardw	%00110000
	chardw	%00110000
;U
	chardw	%00000000
	chardw	%11000110
	chardw	%11000110
	chardw	%11000110
	chardw	%11000110
	chardw	%11000110
	chardw	%11000110
	chardw	%01111100
;V
	chardw	%00000000
	chardw	%11000110
	chardw	%11000110
	chardw	%11000110
	chardw	%01101100
	chardw	%01101100
	chardw	%00111000
	chardw	%00010000
;W
	chardw	%00000000
	chardw	%11000110
	chardw	%11000110
	chardw	%11010110
	chardw	%11111110
	chardw	%11101110
	chardw	%11000110
	chardw	%10000010
;X
	chardw	%00000000
	chardw	%11000110
	chardw	%01101100
	chardw	%00111000
	chardw	%00111000
	chardw	%01101100
	chardw	%11000110
	chardw	%11000110
;Y
	chardw	%00000000
	chardw	%11001100
	chardw	%11001100
	chardw	%11001100
	chardw	%01111000
	chardw	%00110000
	chardw	%00110000
	chardw	%00110000
;Z
	chardw	%00000000
	chardw	%11111110
	chardw	%00001100
	chardw	%00011000
	chardw	%00110000
	chardw	%01100000
	chardw	%11000000
	chardw	%11111110
;- 36
	chardw	%00000000
	chardw	%00000000
	chardw	%00000000
	chardw	%00000000
	chardw	%01111110
	chardw	%00000000
	chardw	%00000000
	chardw	%00000000
;- 37
	chardw	%01001000
	chardw	%10101000
	chardw	%11101000
	chardw	%10101110
	chardw	%00010000
	chardw	%00110000
	chardw	%00010000
	chardw	%00010000
;- 38
	chardw	%01001000
	chardw	%10101000
	chardw	%11101000
	chardw	%10101110
	chardw	%00010000
	chardw	%00101000
	chardw	%00011000
	chardw	%00111000
;- 39
	chardw	%00000000
	chardw	%01000000
	chardw	%01000000
	chardw	%01010000
	chardw	%01010000
	chardw	%00010000
	chardw	%00010000
	chardw	%00011110
;- 40
	chardw	%00000000
	chardw	%01000000
	chardw	%01000000
	chardw	%01010010
	chardw	%01010010
	chardw	%00011110
	chardw	%00010010
	chardw	%00010010
;+ 41
	chardw	%00000000
	chardw	%00000000
	chardw	%00110000
	chardw	%00110000
	chardw	%11111100
	chardw	%00110000
	chardw	%00110000
	chardw	%00000000
;_ 42
	chardw	%00000000
	chardw	%00000000
	chardw	%00000000
	chardw	%00000000
	chardw	%00000000
	chardw	%00000000
	chardw	%00000000
	chardw	%11111110



reciptab8
	db	0
	db	255
tv	=	2
	rept	254
	db	256/tv
tv	=	tv+1
	endr

;--------------------------------
;signed 32768/n tab (n=-255 to +255)
tv	=	-255
	rept	254
	dw	32768/tv
tv	=	tv+1
	endr
	dw	-32767
reciptab16s
	dw	0
	dw	32767
tv	=	2
	rept	254
	dw	32768/tv
tv	=	tv+1
	endr




;laser bolt positions
numlaserpos	equ	12
zv	=	256
dv	=	150
xv	=	90*zv
yv	=	50*zv
zv	=	zv+dv*(numlaserpos-1)
laserxytab
;	rept	numlaserpos
	db	xv/zv,yv/zv+92
;;	?zv
;zv	=	zv-dv
;	endr	
;



hover1mess	db	"HOVER 1",0
tankmess	db	"TANK",0
walkermess1	db	"WALKER 1",0
rellmess1	db	"REL AXIS 1",0
rellmess2	db	"REL AXIS 2",0
demo_mess	db	"DEMO",0
PauseMess	db	"GAME PAUSED",0
nullmess	db	" ",0

;argtankmess	db	"ARG TANK",0
;walkermess2	db	"WALKER 2",0
;walkermess3	db	"WALKER 3",0
;starshipmess
;	db	"STARSHIP",0
rellmess3	db	"REL AXIS 3",0


typenames
	dw	Hover1mess
	dw	tankmess
	dw	walkermess1
	dw	rellmess1
	dw	rellmess2

;	dw	argtankmess
;	dw	walkermess2
;	dw	walkermess3
;	dw	rellmess3


menutab
;	menutitle	<STAR GLIDER 01 NOV 1991>
;	menub	<WALKER JUMP TIME    >,0,0,255,NULL
;	menub	<WALKER JUMP SPEED   >,0,0,255,NULL
;	menub	<ALIEN MISSILE2 ANGLE>,0,0,deg90,NULL
;	submenu	<WEAPON MENU>,wepmenu
;	menuend


wepmenu
;	menutitle	<WEAPON MENU>
;	menub	<P LASER VEL         >,0,40,254,NULL
;	menub	<LASER BOLT 1 COUNT  >,0,4,127,NULL
;	menub	<MISSILE 1 VEL       >,0,40,254,NULL
;	menub	<MISSILE 1 COUNT     >,0,4,127,NULL
;	menub	<MISSILE 2 VEL       >,0,40,254,NULL
;	menub	<HOME MISSILE 1 VEL  >,0,40,254,NULL
;	menub	<HOME MISSILE 1 COUNT>,0,4,127,NULL
;	menub	<HOME MISSILE 1 TURN >,0,4,deg90,NULL
;	submenu	<MAIN MENU>,menutab
;	menuend


sm2	macro
	db	\1,\1,\2,\2,\3,\3,\4,\4,\5,\5,\6,\6,\7,\7,\8,\8
	endm

sm	macro
	db	\1,\2,\3,\4,\5,\6,\7,\8
	endm

c1	equ	$11
c2	equ	$22

b1	equ	10
b2	equ	13



shadesof	macro
;	db	$\1b
;	db	$\1b
;	db	$\1c
;	db	$\1c
;	db	$\1d
;	db	$\1d
;	db	$\1e
;	db	$\1e
;	db	$\1f
;	db	$\1f
	endm






shadestab
	IFEQ	1
ls_grey	equ	0
	dw	shades_grey
ls_red	equ	1
	dw	shades_red
ls_blue	equ	2
	dw	shades_blue
ls_green1	equ	3
	dw	shades_green1
ls_yellow1	equ	4
	dw	shades_yellow1
ls_metblue1	equ	5
	dw	shades_metblue
ls_red1	equ	6
	dw	shades_red1
ls_blue1	equ	7
	dw	shades_blue1
ls_green2	equ	8
	dw	shades_green2
ls_yellow2	equ	9
	dw	shades_yellow2
ls_red2	equ	10
	dw	shades_red2
ls_red3	equ	11
	dw	shades_red3
ls_blue2	equ	12
	dw	shades_blue2
ls_blue3	equ	13
	dw	shades_blue3
ls_metblue2	equ	14
	dw	shades_metblue2
ls_organge1	equ	15
	dw	shades_orange1
ls_organge2	equ	16
	dw	shades_orange2
ls_brown	equ	17
	dw	shades_brown
ls_yellow3	equ	18
	dw	shades_yellow3
ls_yellow4	equ	19
	dw	shades_yellow4
ls_green3	equ	20
	dw	shades_green3
ls_green4	equ	21
	dw	shades_green4
nls_smoke	equ	22
	dw	shades_smoke
nls_yellow	equ	23
	dw	shades_pyellow




shades_grey
	db	$9a
	db	$aa
	db	$ab
	db	$bb
	db	$bb
	db	$cc
	db	$cd
	db	$dd
	db	$de
	db	$ee
shades_grey1
	db	$bb
	db	$bb
	db	$bc
	db	$bc
	db	$cc
	db	$cc
	db	$cd
	db	$dd
	db	$de
	db	$ee
shades_grey2
	db	$99
	db	$99
	db	$9a
	db	$9a
	db	$aa
	db	$aa
	db	$ab
	db	$bb
	db	$bc
	db	$cc
shades_red2
shades_red3
shades_red
	db	$1a
	db	$1a
	db	$1b
	db	$1b
	db	$2b
	db	$2b
	db	$2c
	db	$3c
	db	$3d
	db	$3e
shades_red1
	db	$19
	db	$19
	db	$1a
	db	$1a
	db	$11
	db	$11
	db	$12
	db	$22
	db	$23
	db	$33
shades_blue
shades_metblue
shades_metblue2
shades_blue3
shades_blue1
	db	$4a
	db	$4a
	db	$4b
	db	$4b
	db	$5b
	db	$5b
	db	$5c
	db	$6c
	db	$6d
	db	$6e
shades_blue2
	db	$49
	db	$49
	db	$4a
	db	$4a
	db	$44
	db	$44
	db	$45
	db	$55
	db	$56
	db	$66
shades_orange1
shades_orange2
shades_brown
shades_smoke
shades_mag
	db	$14
	db	$14
	db	$14
	db	$24
	db	$24
	db	$25
	db	$25
	db	$26
	db	$35
	db	$36
shades_green3
shades_green4
shades_green1
	db	$79
	db	$79
	db	$79
	db	$7a
	db	$7a
	db	$7b
	db	$7b
	db	$7c
	db	$7d
	db	$7e
shades_green2
	db	$79
	db	$79
	db	$79
	db	$7a
	db	$7a
	db	$7a
	db	$7b
	db	$7b
	db	$77
	db	$77
shades_yellow3
shades_yellow4
shades_pyellow
shades_yellow1
	db	$89
	db	$89
	db	$89
	db	$8a
	db	$8a
	db	$8b
	db	$8b
	db	$8c
	db	$8d
	db	$8e
shades_yellow2
	db	$89
	db	$89
	db	$89
	db	$8a
	db	$8a
	db	$8a
	db	$8b
	db	$8b
	db	$88
	db	$88

	ENDC







depthtabtab
	dw	night1&WM
	dw	mist1&WM
	dw	desert1&WM
	dw	marine1&WM









;Frames per second table BCD --------------
fpstab
	IFEQ	1
	db	$99	;0
	db	$60	;1
	db	$30	;2
	db	$20	;3
	db	$15	;4
	db	$12	;5
	db	$10	;6
	db	$09	;7
	db	$08	;8
	db	$07	;9
	db	$06	;10
	db	$05	;11
	db	$05	;12
	db	$05	;13
	db	$04	;14
	db	$04	;15
	db	$04	;16
	db	$04	;17
	db	$03	;18
	db	$03	;19
	db	$03	;20
	db	$03	;21
	db	$03	;22
	db	$03	;23
	db	$03	;24
	db	$02	;25
	db	$02	;26
	db	$02	;27
	db	$02	;28
	db	$02	;29
	db	$02	;30
	db	$02	;31
	db	$02	;32
	db	$02	;33
	db	$02	;34
	db	$02	;35
	db	$02	;36
	db	$02	;37
	db	$02	;38
	db	$02	;39
	db	$02	;40
	rept	256-40
	db	$01	;XX
	endr

	ENDC

sintab
	DB	0
	DB	3
	DB	6
	DB	9
	DB	12
	DB	15
	DB	18
	DB	21
	DB	24
	DB	27
	DB	30
	DB	33
	DB	36
	DB	39
	DB	42
	DB	45
	DB	48
	DB	51
	DB	54
	DB	57
	DB	59
	DB	62
	DB	65
	DB	67
	DB	70
	DB	73
	DB	75
	DB	78
	DB	80
	DB	82
	DB	85
	DB	87
	DB	89
	DB	91
	DB	94
	DB	96
	DB	98
	DB	100
	DB	102
	DB	103
	DB	105
	DB	107
	DB	108
	DB	110
	DB	112
	DB	113
	DB	114
	DB	116
	DB	117
	DB	118
	DB	119
	DB	120
	DB	121
	DB	122
	DB	123
	DB	123
	DB	124
	DB	125
	DB	125
	DB	126
	DB	126
	DB	126
	DB	126
	DB	126

costab
	DB	127
	DB	126
	DB	126
	DB	126
	DB	126
	DB	126
	DB	125
	DB	125
	DB	124
	DB	123
	DB	123
	DB	122
	DB	121
	DB	120
	DB	119
	DB	118
	DB	117
	DB	116
	DB	114
	DB	113
	DB	112
	DB	110
	DB	108
	DB	107
	DB	105
	DB	103
	DB	102
	DB	100
	DB	98
	DB	96
	DB	94
	DB	91
	DB	89
	DB	87
	DB	85
	DB	82
	DB	80
	DB	78
	DB	75
	DB	73
	DB	70
	DB	67
	DB	65
	DB	62
	DB	59
	DB	57
	DB	54
	DB	51
	DB	48
	DB	45
	DB	42
	DB	39
	DB	36
	DB	33
	DB	30
	DB	27
	DB	24
	DB	21
	DB	18
	DB	15
	DB	12
	DB	9
	DB	6
	DB	3
	DB	0
	DB	-3
	DB	-6
	DB	-9
	DB	-12
	DB	-15
	DB	-18
	DB	-21
	DB	-24
	DB	-27
	DB	-30
	DB	-33
	DB	-36
	DB	-39
	DB	-42
	DB	-45
	DB	-48
	DB	-51
	DB	-54
	DB	-57
	DB	-59
	DB	-62
	DB	-65
	DB	-67
	DB	-70
	DB	-73
	DB	-75
	DB	-78
	DB	-80
	DB	-82
	DB	-85
	DB	-87
	DB	-89
	DB	-91
	DB	-94
	DB	-96
	DB	-98
	DB	-100
	DB	-102
	DB	-103
	DB	-105
	DB	-107
	DB	-108
	DB	-110
	DB	-112
	DB	-113
	DB	-114
	DB	-116
	DB	-117
	DB	-118
	DB	-119
	DB	-120
	DB	-121
	DB	-122
	DB	-123
	DB	-123
	DB	-124
	DB	-125
	DB	-125
	DB	-126
	DB	-126
	DB	-126
	DB	-126
	DB	-126
	DB	-127
	DB	-126
	DB	-126
	DB	-126
	DB	-126
	DB	-126
	DB	-125
	DB	-125
	DB	-124
	DB	-123
	DB	-123
	DB	-122
	DB	-121
	DB	-120
	DB	-119
	DB	-118
	DB	-117
	DB	-116
	DB	-114
	DB	-113
	DB	-112
	DB	-110
	DB	-108
	DB	-107
	DB	-105
	DB	-103
	DB	-102
	DB	-100
	DB	-98
	DB	-96
	DB	-94
	DB	-91
	DB	-89
	DB	-87
	DB	-85
	DB	-82
	DB	-80
	DB	-78
	DB	-75
	DB	-73
	DB	-70
	DB	-67
	DB	-65
	DB	-62
	DB	-59
	DB	-57
	DB	-54
	DB	-51
	DB	-48
	DB	-45
	DB	-42
	DB	-39
	DB	-36
	DB	-33
	DB	-30
	DB	-27
	DB	-24
	DB	-21
	DB	-18
	DB	-15
	DB	-12
	DB	-9
	DB	-6
	DB	-3
	DB	0
	DB	3
	DB	6
	DB	9
	DB	12
	DB	15
	DB	18
	DB	21
	DB	24
	DB	27
	DB	30
	DB	33
	DB	36
	DB	39
	DB	42
	DB	45
	DB	48
	DB	51
	DB	54
	DB	57
	DB	59
	DB	62
	DB	65
	DB	67
	DB	70
	DB	73
	DB	75
	DB	78
	DB	80
	DB	82
	DB	85
	DB	87
	DB	89
	DB	91
	DB	94
	DB	96
	DB	98
	DB	100
	DB	102
	DB	103
	DB	105
	DB	107
	DB	108
	DB	110
	DB	112
	DB	113
	DB	114
	DB	116
	DB	117
	DB	118
	DB	119
	DB	120
	DB	121
	DB	122
	DB	123
	DB	123
	DB	124
	DB	125
	DB	125
	DB	126
	DB	126
	DB	126
	DB	126
	DB	126


sintab16
	dw $0000,$0324,$0647,$096A,$0C8B,$0FAB,$12C7,$15E1
	dw $18F8,$1C0B,$1F19,$2223,$2527,$2826,$2B1E,$2E10
	dw $30FB,$33DE,$36B9,$398C,$3C56,$3F16,$41CD,$447A
	dw $471C,$49B3,$4C3F,$4EBF,$5133,$539A,$55F4,$5842
	dw $5A81,$5CB3,$5ED6,$60EB,$62F1,$64E7,$66CE,$68A5
	dw $6A6C,$6C23,$6DC9,$6F5E,$70E1,$7254,$73B5,$7503
	dw $7640,$776B,$7883,$7989,$7A7C,$7B5C,$7C29,$7CE2
	dw $7D89,$7E1C,$7E9C,$7F08,$7F61,$7FA6,$7FD7,$7FF5
	dw $7FFF,$7FF5,$7FD7,$7FA6,$7F61,$7F08,$7E9C,$7E1C
	dw $7D89,$7CE2,$7C29,$7B5C,$7A7C,$7989,$7883,$776B
	dw $7640,$7503,$73B5,$7254,$70E1,$6F5E,$6DC9,$6C23
	dw $6A6C,$68A5,$66CE,$64E7,$62F1,$60EB,$5ED6,$5CB3
	dw $5A81,$5842,$55F4,$539A,$5133,$4EBF,$4C3F,$49B3
	dw $471C,$447A,$41CD,$3F16,$3C56,$398C,$36B9,$33DE
	dw $30FB,$2E10,$2B1E,$2826,$2527,$2223,$1F19,$1C0B
	dw $18F8,$15E1,$12C7,$0FAB,$0C8B,$096A,$0647,$0324
	dw $0000,$FCDC,$F9B9,$F696,$F375,$F055,$ED39,$EA1F
	dw $E708,$E3F5,$E0E7,$DDDD,$DAD9,$D7DA,$D4E2,$D1F0
	dw $CF05,$CC22,$C947,$C674,$C3AA,$C0EA,$BE33,$BB86
	dw $B8E4,$B64D,$B3C1,$B141,$AECD,$AC66,$AA0C,$A7BE
	dw $A57F,$A34D,$A12A,$9F15,$9D0F,$9B19,$9932,$975B
	dw $9594,$93DD,$9237,$90A2,$8F1F,$8DAC,$8C4B,$8AFD
	dw $89C0,$8895,$877D,$8677,$8584,$84A4,$83D7,$831E
	dw $8277,$81E4,$8164,$80F8,$809F,$805A,$8029,$800B
	dw $8001,$800B,$8029,$805A,$809F,$80F8,$8164,$81E4
	dw $8277,$831E,$83D7,$84A4,$8584,$8677,$877D,$8895
	dw $89C0,$8AFD,$8C4B,$8DAC,$8F1F,$90A2,$9237,$93DD
	dw $9594,$975B,$9932,$9B19,$9D0F,$9F15,$A12A,$A34D
	dw $A57F,$A7BE,$AA0C,$AC66,$AECD,$B141,$B3C1,$B64D
	dw $B8E4,$BB86,$BE33,$C0EA,$C3AA,$C674,$C947,$CC22
	dw $CF05,$D1F0,$D4E2,$D7DA,$DAD9,$DDDD,$E0E7,$E3F5
	dw $E708,$EA1F,$ED39,$F055,$F375,$F696,$F9B9,$FCDC
	dw $0000


	ifne	1
	DW	0
	DW	100
	DW	201
	DW	301
	DW	402
	DW	502
	DW	603
	DW	703
	DW	804
	DW	904
	DW	1005
	DW	1105
	DW	1206
	DW	1306
	DW	1407
	DW	1507
	DW	1607
	DW	1708
	DW	1808
	DW	1909
	DW	2009
	DW	2109
	DW	2210
	DW	2310
	DW	2410
	DW	2510
	DW	2611
	DW	2711
	DW	2811
	DW	2911
	DW	3011
	DW	3111
	DW	3211
	DW	3311
	DW	3411
	DW	3511
	DW	3611
	DW	3711
	DW	3811
	DW	3911
	DW	4011
	DW	4110
	DW	4210
	DW	4310
	DW	4409
	DW	4509
	DW	4609
	DW	4708
	DW	4808
	DW	4907
	DW	5006
	DW	5106
	DW	5205
	DW	5304
	DW	5403
	DW	5503
	DW	5602
	DW	5701
	DW	5800
	DW	5898
	DW	5997
	DW	6096
	DW	6195
	DW	6294
	DW	6392
	DW	6491
	DW	6589
	DW	6688
	DW	6786
	DW	6884
	DW	6983
	DW	7081
	DW	7179
	DW	7277
	DW	7375
	DW	7473
	DW	7571
	DW	7669
	DW	7766
	DW	7864
	DW	7961
	DW	8059
	DW	8156
	DW	8254
	DW	8351
	DW	8448
	DW	8545
	DW	8642
	DW	8739
	DW	8836
	DW	8933
	DW	9029
	DW	9126
	DW	9223
	DW	9319
	DW	9415
	DW	9512
	DW	9608
	DW	9704
	DW	9800
	DW	9896
	DW	9991
	DW	10087
	DW	10183
	DW	10278
	DW	10374
	DW	10469
	DW	10564
	DW	10659
	DW	10754
	DW	10849
	DW	10944
	DW	11039
	DW	11133
	DW	11228
	DW	11322
	DW	11416
	DW	11511
	DW	11605
	DW	11699
	DW	11793
	DW	11886
	DW	11980
	DW	12073
	DW	12167
	DW	12260
	DW	12353
	DW	12446
	DW	12539
	DW	12632
	DW	12725
	DW	12817
	DW	12910
	DW	13002
	DW	13094
	DW	13186
	DW	13278
	DW	13370
	DW	13462
	DW	13554
	DW	13645
	DW	13736
	DW	13828
	DW	13919
	DW	14010
	DW	14100
	DW	14191
	DW	14282
	DW	14372
	DW	14462
	DW	14552
	DW	14642
	DW	14732
	DW	14822
	DW	14912
	DW	15001
	DW	15090
	DW	15180
	DW	15269
	DW	15357
	DW	15446
	DW	15535
	DW	15623
	DW	15712
	DW	15800
	DW	15888
	DW	15976
	DW	16063
	DW	16151
	DW	16238
	DW	16325
	DW	16413
	DW	16499
	DW	16586
	DW	16673
	DW	16759
	DW	16846
	DW	16932
	DW	17018
	DW	17104
	DW	17189
	DW	17275
	DW	17360
	DW	17445
	DW	17530
	DW	17615
	DW	17700
	DW	17784
	DW	17869
	DW	17953
	DW	18037
	DW	18121
	DW	18204
	DW	18288
	DW	18371
	DW	18454
	DW	18537
	DW	18620
	DW	18703
	DW	18785
	DW	18868
	DW	18950
	DW	19032
	DW	19113
	DW	19195
	DW	19276
	DW	19358
	DW	19439
	DW	19519
	DW	19600
	DW	19681
	DW	19761
	DW	19841
	DW	19921
	DW	20001
	DW	20080
	DW	20159
	DW	20239
	DW	20318
	DW	20396
	DW	20475
	DW	20553
	DW	20631
	DW	20709
	DW	20787
	DW	20865
	DW	20942
	DW	21020
	DW	21097
	DW	21173
	DW	21250
	DW	21326
	DW	21403
	DW	21479
	DW	21555
	DW	21630
	DW	21706
	DW	21781
	DW	21856
	DW	21931
	DW	22005
	DW	22080
	DW	22154
	DW	22228
	DW	22301
	DW	22375
	DW	22448
	DW	22521
	DW	22594
	DW	22667
	DW	22740
	DW	22812
	DW	22884
	DW	22956
	DW	23027
	DW	23099
	DW	23170
	DW	23241
	DW	23312
	DW	23382
	DW	23453
	DW	23523
	DW	23593
	DW	23662
	DW	23732
	DW	23801
	DW	23870
	DW	23939
	DW	24007
	DW	24075
	DW	24144
	DW	24211
	DW	24279
	DW	24346
	DW	24414
	DW	24480
	DW	24547
	DW	24614
	DW	24680
	DW	24746
	DW	24812
	DW	24877
	DW	24943
	DW	25008
	DW	25073
	DW	25137
	DW	25201
	DW	25266
	DW	25330
	DW	25393
	DW	25457
	DW	25520
	DW	25583
	DW	25645
	DW	25708
	DW	25770
	DW	25832
	DW	25894
	DW	25955
	DW	26016
	DW	26077
	DW	26138
	DW	26199
	DW	26259
	DW	26319
	DW	26379
	DW	26438
	DW	26498
	DW	26557
	DW	26615
	DW	26674
	DW	26732
	DW	26790
	DW	26848
	DW	26905
	DW	26963
	DW	27020
	DW	27076
	DW	27133
	DW	27189
	DW	27245
	DW	27301
	DW	27356
	DW	27411
	DW	27466
	DW	27521
	DW	27576
	DW	27630
	DW	27684
	DW	27737
	DW	27791
	DW	27844
	DW	27897
	DW	27949
	DW	28002
	DW	28054
	DW	28106
	DW	28157
	DW	28208
	DW	28259
	DW	28310
	DW	28361
	DW	28411
	DW	28461
	DW	28511
	DW	28560
	DW	28609
	DW	28658
	DW	28707
	DW	28755
	DW	28803
	DW	28851
	DW	28898
	DW	28946
	DW	28993
	DW	29039
	DW	29086
	DW	29132
	DW	29178
	DW	29223
	DW	29269
	DW	29314
	DW	29359
	DW	29403
	DW	29447
	DW	29491
	DW	29535
	DW	29578
	DW	29621
	DW	29664
	DW	29707
	DW	29749
	DW	29791
	DW	29833
	DW	29874
	DW	29915
	DW	29956
	DW	29997
	DW	30037
	DW	30077
	DW	30117
	DW	30156
	DW	30196
	DW	30235
	DW	30273
	DW	30312
	DW	30350
	DW	30387
	DW	30425
	DW	30462
	DW	30499
	DW	30535
	DW	30572
	DW	30608
	DW	30644
	DW	30679
	DW	30714
	DW	30749
	DW	30784
	DW	30818
	DW	30852
	DW	30886
	DW	30919
	DW	30952
	DW	30985
	DW	31018
	DW	31050
	DW	31082
	DW	31114
	DW	31145
	DW	31176
	DW	31207
	DW	31237
	DW	31268
	DW	31298
	DW	31327
	DW	31357
	DW	31386
	DW	31414
	DW	31443
	DW	31471
	DW	31499
	DW	31526
	DW	31554
	DW	31581
	DW	31607
	DW	31634
	DW	31660
	DW	31685
	DW	31711
	DW	31736
	DW	31761
	DW	31785
	DW	31810
	DW	31834
	DW	31857
	DW	31881
	DW	31904
	DW	31927
	DW	31949
	DW	31971
	DW	31993
	DW	32015
	DW	32036
	DW	32057
	DW	32078
	DW	32098
	DW	32118
	DW	32138
	DW	32157
	DW	32176
	DW	32195
	DW	32214
	DW	32232
	DW	32250
	DW	32268
	DW	32285
	DW	32302
	DW	32319
	DW	32335
	DW	32351
	DW	32367
	DW	32383
	DW	32398
	DW	32413
	DW	32427
	DW	32442
	DW	32456
	DW	32469
	DW	32483
	DW	32496
	DW	32509
	DW	32521
	DW	32533
	DW	32545
	DW	32557
	DW	32568
	DW	32579
	DW	32589
	DW	32600
	DW	32610
	DW	32619
	DW	32629
	DW	32638
	DW	32647
	DW	32655
	DW	32663
	DW	32671
	DW	32679
	DW	32686
	DW	32693
	DW	32700
	DW	32706
	DW	32712
	DW	32718
	DW	32723
	DW	32728
	DW	32733
	DW	32737
	DW	32741
	DW	32745
	DW	32749
	DW	32752
	DW	32755
	DW	32758
	DW	32760
	DW	32762
	DW	32764
	DW	32765
	DW	32766
	DW	32767
	DW	32767
	endc


intro_hp_string
	db	"HP   ",3+"Z",0
intro_aw_string
	db	"A",2+"Z",0
intro_loading_string
	db	"LOADING",0
intro_empty_string
	db	"BAY EMPTY",0


wepnames
	dw	wep0&WM
	dw	wep1&WM
	dw	wep2&WM
	dw	wep3&WM
	dw	wep4&WM
	dw	wep5&WM
	dw	wep6&WM
	dw	wep7&WM
	dw	wep8&WM
	dw	wep9&WM


wep0	db	"NULL",0,0,0,0,0,0
wep1	db	"MISSILE1",0,0
wep2	db	"MISSILE2",0,0
wep3	db	"TLASER",0,0,0,0
wep4	db	"HMISSILE",0,0
wep5	db	"TM GUN",0,0,0,0,0
wep6	db	"MACH GUN",0,0
wep7	db	"LASER",0,0,0,0
wep8	db	"TRILASER",0,0
wep9	db	"SHOT GUN",0,0




mycrapmask
	db	%00000000,%00000000
	db	%00000000,%00000000
	db	%00000000,%00000000
	db	%00000000,%00000000
	db	%01110000,%01110000
	db	%01110000,%01110000
	db	%01110000,%01110000
	db	%00000000,%00000000

mycrapchars
	inccolfile	data\map-obj.cgx,0,30

	IFEQ	1

	db	%00000000,%00000000
	db	%00000000,%00000000
	db	%00000000,%00000000
	db	%00000000,%00000000
	db	%00000000,%00000000
	db	%01000000,%01000000
	db	%11100000,%11100000
	db	%01000000,%01000000

	REPT	6*8
	db	0
	ENDR


	db	%00000000,%00000000
	db	%00000100,%00000100
	db	%00001110,%00001110
	db	%00000100,%00000100
	db	%00000000,%00000000
	db	%01000000,%01000000
	db	%11100000,%11100000
	db	%01000000,%01000000

	REPT	6*8
	db	0
	ENDR

	db	%00000000,%00000000
	db	%00010000,%00010000
	db	%00111000,%00111000
	db	%00010000,%00010000
	db	%00000000,%00000000
	db	%01000000,%01000000
	db	%11100000,%11100000
	db	%01000000,%01000000

	REPT	6*8
	db	0
	ENDR

	db	%00000000,%00000000
	db	%00000000,%00000000
	db	%00000000,%00000000
	db	%00000100,%00000100
	db	%00001110,%00001110
	db	%01000100,%01000100
	db	%11100000,%11100000
	db	%01000000,%01000000

	REPT	6*8
	db	0
	ENDR

	ENDC

