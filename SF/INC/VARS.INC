
; This file contains various constants used in Star Fox.

; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
; !! This is advanced stuff, be careful! !!
; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

; ## other variables ##

; angles
deg360	equ	256
deg180	equ	deg360/2
deg90	equ	deg360/4
deg45	equ	deg360/8
deg22	equ	deg360/16
deg11	equ	deg360/32
deg5	equ	deg360/64
deg270	equ	deg180+deg90
deg0	equ	0
deg120	equ	deg360/3
deg60	equ	deg120/2
deg240	equ	deg120*2
deg300	equ	deg240+deg60

deg135	equ	deg90+deg45
deg225	equ	deg180+deg45
deg315	equ	deg180+deg90+deg45

deg72	equ	deg360/5
deg144	equ	(deg360*2)/5
deg216	equ	(deg360*3)/5
deg288	equ	(deg360*4)/5

wallhgt	equ	120
walldist	equ	60+10

; processor flags
           ;nvmxdizc
p_n		equ	10000000b ; $80/#128
p_v		equ	01000000b ; $40/#64
p_a		equ	00100000b ; $20/#32
p_x		equ	00010000b ; $10/#16
p_d		equ	00001000b ; $8/#8
p_int	equ	00000100b ; $4/#4
p_z		equ	00000010b ; $2/#2
p_c		equ	00000001b ; $1/#1

;Key pad Codes		(ends in l = in contl0)
Key_al		equ	$80
Key_b		equ	$80
key_xl		equ	$40
key_y		equ	$40
key_start	equ	$10
key_select	equ	$20
key_leftl	equ	$20
key_rightl	equ	$10
key_jup		equ	$08
key_jdown	equ	$04
key_jleft	equ	$02
key_jright	equ	$01

pad_B		equ	1<<15
pad_Y		equ	1<<14
pad_SELECT	equ	1<<13
pad_START	equ	1<<12
pad_UP		equ	1<<11
pad_DOWN	equ	1<<10
pad_LEFT	equ	1<<9
pad_RIGHT	equ	1<<8
pad_A		equ	1<<7
pad_X		equ	1<<6
pad_TLEFT	equ	1<<5
pad_TRIGHT	equ	1<<4

padl_B		equ	pad_B>>8
padl_Y		equ	pad_Y>>8
padl_SELECT	equ	pad_SELECT>>8
padl_START	equ	pad_START>>8
padl_UP		equ	pad_UP>>8
padl_DOWN	equ	pad_DOWN>>8
padl_LEFT	equ	pad_LEFT>>8
padl_RIGHT	equ	pad_RIGHT>>8
padl_A		equ	pad_A
padl_X		equ	pad_X
padl_TLEFT	equ	pad_TLEFT
padl_TRIGHT	equ	pad_TRIGHT



NULL	equ	0

;Game limit vars --------------------------------------
number_al	equ	70	;Max aliens
number_zb	equ	70	;Max z srot blocks

;Base addresses for RAM alocation -----------------
zmempt	=	0		;zero page
wmempt	=	$300	;work space
xmempt	=	$7e2000	;extended RAM
xxmempt	=	$7f0000	;extended RAM
zmmempt	=	$700000
mmempt	=	$700200
bitmap1		equ	16384
bitmapbase	equ	$700000

WM	equ	$ffff	; wordmask
BM	equ	$ff		; bytemask
K	equ	1024


gameNum_col		equ	28
gameNum_row		equ	24

vchr_base1		equ	0
vsc_base1		equ	22*k/2
vchr_base2		equ	24*k/2
vchr_physback	equ	40*k/2
vchr_logback	equ	46*k/2
vobj_base		equ	52*k/2
vsc_base2		equ	56*k/2
bg2offsets		equ	vsc_base1+32*28

num_col		equ	28
num_row		equ	24
char_size	equ	32
col_size	equ	char_size*num_row
usedchar	equ	col_size*num_col
pal3d		equ	7



;alien flags (al_flags) -------
afexp		equ	1	;Exploding
afInRngPl	equ	2	;In Range of player
afLeftPl	equ	4	;Left of player
afFrontPl	equ	8	;Infront of Player
afInviewPl	equ	16	;Inview of player
afhit		equ	32	;was hit/ shot/blasted/bumped
afonfire	equ	64	;on fire

;alien type flags (al_type) ---
atgnd		equ	1	;ground object
atmissile	equ	2	;Is misslie
atlaser		equ	4	;Is laser bolt
atzremove	equ	8	;remove when behind
atnuked		equ	16	;if hit by nuke explosion.

;player machine flags (macflags 16 bit)
MACFEXISTS	equ	1
MACFRELAXIS	equ	2


; planets.asm
num_routes	equ	4


; main
SPACE_MODE	equ	1
WATER_MODE	equ	2

xhdma_max	equ	5*K

mapbase		=	$58000
mapbase2	=	$d8000


HF1	equ	1<<0
HF2	equ	1<<1
HF3	equ	1<<2
HF4	equ	1<<3
HF5	equ	1<<4
HF6	equ	1<<5
HF7	equ	1<<6
HF8	equ	1<<7

; continue.asm
; Character mugshot list

friend_fox		equ	0
friend_rabbit 	equ	1
friend_falcon 	equ	2
friend_frog		equ	3
friend_pepper 	equ	4
friend_andross 	equ	5
friend_anyone 	equ	6

friend_fox3		equ	0+128
friend_rabbit3 	equ	1+128
friend_falcon3 	equ	2+128
friend_frog3	equ	3+128
friend_pepper3 	equ	4+128
friend_andross3 equ	5+128
friend_anyone3 	equ	6+128

; FACE.CGX Frame Index
; Comms window open animation
face_frame0		equ	0 ;facedata&WM
face_frame1		equ	1 ;facedata&WM+640
face_frame2		equ	2
face_frame3		equ	3
face_frame4		equ	4

; Characters
face_fox1		equ	5
face_fox2		equ	6
face_peppy1		equ	7
face_peppy2		equ	8
face_falco1		equ	9
face_falco2		equ	10
face_slippy1	equ	11
face_slippy2	equ	12
face_pepper1	equ	13
face_pepper2	equ	14
face_andross1	equ	15
face_andross2	equ	16

;Comms Static
face_anyone		equ	17

; sprites.asm
spradd	equ	128	;((24*28)-512+2)

; trans
gamechar_size	equ	32
gamemdm		equ	1+32
gameStRow		equ	2
gameVW_Pos		equ	(8*gameStRow+8*gameNum_row)-1
gamemtrans		equ	((262-gameVW_Pos+8*gameStRow)*170)&(-30)
gameBMPSZ		equ	gameNum_col*gameNum_row*gamechar_size
		ifge	gamemtrans-gameBMPSZ
gamemaxtrans	equ	gameBMPSZ/2
		elseif
gamemaxtrans	equ	gamemtrans
		endc
gametranlen1	equ	10752
gametranlen2	equ	10752
paltranlen1	equ	(gamemaxtrans*3)/4
paltranlen2	equ	gamemaxtrans-paltranlen1

; irq vars
tm_planets	equ	8
tm_fox		equ	10
tm_fox2		equ	12
tm_fox3		equ	14
tm_planets2	equ	34

dec_base	equ	2800h

	TIME	_TIME
_HOUR	=	_TIME>>24&$FF
_MIN	=	_TIME>>16&$FF
_SEC	=	_TIME>>8&$FF

; Include master configuration file
	include	CONFIG\CONFIG.INC

; Fix vanilla bug: incorrect FPS computation if PAL == 1
	IFEQ	PAL	; if NTSC
consoleframerate	equ	60	; NTSC = 60 frames/sec
	ELSEIF	; if PAL
consoleframerate	equ	50	; PAL = 50 frames/sec
	ENDC



