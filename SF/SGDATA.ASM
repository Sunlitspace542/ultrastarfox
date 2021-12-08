

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

pbittab

pbittabn


pxoftab
tbtv	=	0
ttx	=	0

pyoftab
tbtv	=	0
X_data_end
;************************************************

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


reciptab16s
	dw	0
	dw	32767
tv	=	2
	rept	254
	dw	32768/tv
tv	=	tv+1
	endr

c1	equ	$11
c2	equ	$22

b1	equ	10
b2	equ	13


shadestab

depthtabtab
	dw	night1&WM
	dw	mist1&WM
	dw	desert1&WM
	dw	marine1&WM



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

