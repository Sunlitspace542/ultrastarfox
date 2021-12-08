
; #####################################
; ## HackerStarFox Assembler Options ##
; #####################################

;###############################################################################################################
cesdemo			equ	0	; 0 = off, 1 = CES Demo (timed) 2 = Untimed CES Demo w/ planet cheat                   #
debuginfo		equ	0	; full strategy debugging - Press P2 R Button in-game to activate [1 = on 0 = off]     #
debuginfo2		equ	0	; speed up mode? [0 = off 1 = on]                                                      #
janglish		equ	0	; 0 = english, 1 = japanese                                                            #
cestime			equ	5	; CES/SSFW timer countdown (in minutes)                                                #
pal				equ	0	; PAL/NTSC [0 = NTSC 1 = PAL]                                                          #
contest			equ	0	; Super Star Fox Weekend [0 = off 1 = on]                                              #
german			equ	0	; german version [0 = off 1 = on]                                                      #
french			equ	0	; french version [0 = off 1 = on] (UNUSED VARIABLE)                                    #
;thirtyfpsunlock equ 0	; 30FPS unlock [1 = on 0 = off]                                                        #
twentyonemhz	equ 1	; 21MHZ mode [1 = on 0 = off]                                                          #
planetcheaton 	equ 0   ; Allows you to enable planet select cheat on the map before you have selected         #
; a level. Press X+Y on the same frame to activate.                                                            #
messagetest		equ	0	; Run message test in training level                                                   #
;###############################################################################################################

; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
; !! Everything else is more advanced stuff, be careful! !!
; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

; Original Lives position ($YYXX)
livesPos1 equ $1110
livesPos2 equ $1118
livesPos3 equ $1120

; Original Shield text position ($YYXX)
ShieldTextPos1 equ $b718
ShieldTextPos2 equ $b720
ShieldTextPos3 equ $b728
ShieldTextPos4 equ $b730

; Original Nova Bomb Icon Position ($YYXX)
BombIconPos equ $b6e0

mario_stats3d	equ	0
realchip	equ	1
easytext	equ	0

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

p_n	equ	10000000b
p_v	equ	01000000b
p_a	equ	00100000b
p_x	equ	00010000b
p_d	equ	00001000b
p_int	equ	00000100b
p_z	equ	00000010b
p_c	equ	00000001b

;Key pad Codes		(ends in l = in contl0)
Key_al	equ	$80
Key_b	equ	$80
key_xl	equ	$40
key_y	equ	$40
key_start	equ	$10
key_select	equ	$20
key_leftl	equ	$20
key_rightl	equ	$10
key_jup	equ	$08
key_jdown	equ	$04
key_jleft	equ	$02
key_jright	equ	$01

pad_B	equ	1<<15
pad_Y	equ	1<<14
pad_SELECT	equ	1<<13
pad_START	equ	1<<12
pad_UP	equ	1<<11
pad_DOWN	equ	1<<10
pad_LEFT	equ	1<<9
pad_RIGHT	equ	1<<8
pad_A	equ	1<<7
pad_X	equ	1<<6
pad_TLEFT	equ	1<<5
pad_TRIGHT	equ	1<<4

padl_B	equ	pad_B>>8
padl_Y	equ	pad_Y>>8
padl_SELECT	equ	pad_SELECT>>8
padl_START	equ	pad_START>>8
padl_UP	equ	pad_UP>>8
padl_DOWN	equ	pad_DOWN>>8
padl_LEFT	equ	pad_LEFT>>8
padl_RIGHT	equ	pad_RIGHT>>8
padl_A	equ	pad_A
padl_X	equ	pad_X
padl_TLEFT	equ	pad_TLEFT
padl_TRIGHT	equ	pad_TRIGHT



NULL	equ	0

;Game limit vars --------------------------------------
number_al	equ	70	;Max aliens
number_zb	equ	70	;Max z srot blocks

;Base addresses for RAM alocation -----------------
zmempt	=	0	;zero page
wmempt	=	$300	;work space
xmempt	=	$7e2000	;extended RAM
xxmempt	=	$7f0000	;extended RAM
zmmempt	=	$700000
mmempt	=	$700200
bitmap1	equ	$2c00
bitmapbase	equ	$700000

WM	equ	$ffff
BM	equ	$ff
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

num_col	equ	28
num_row	equ	24
char_size	equ	32
col_size	equ	char_size*num_row
usedchar	equ	col_size*num_col
pal3d	equ	7



;alien flags (al_flags) -------
afexp	equ	1	;Exploding
afInRngPl	equ	2	;In Range of player
afLeftPl	equ	4	;Left of player
afFrontPl	equ	8	;Infront of Player
afInviewPl	equ	16	;Inview of player
afhit	equ	32	;was hit/ shot/blasted/bumped
afonfire	equ	64	;on fire

;alien type flags (al_type) ---
atgnd	equ	1	;ground object
atmissile	equ	2	;Is misslie
atlaser	equ	4	;Is laser bolt
atzremove	equ	8	;remove when behind
atnuked	equ	16	;if hit by nuke explosion.

;player machine flags (macflags 16 bit)
MACFEXISTS	equ	1
MACFRELAXIS	equ	2


; planets.asm
num_routes	equ	4


; main
SPACE_MODE	equ	1
WATER_MODE	equ	2

xhdma_max	equ	5*K

mapbase	=	$58000
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

friend_fox	equ	0
friend_rabbit equ	1
friend_falcon equ	2
friend_frog	equ	3
friend_pepper equ	4
friend_andross equ	5
friend_anyone equ	6

friend_fox3	equ	0+128
friend_rabbit3 equ	1+128
friend_falcon3 equ	2+128
friend_frog3	equ	3+128
friend_pepper3 equ	4+128
friend_andross3 equ	5+128
friend_anyone3 equ	6+128


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
tm_fox	equ	10
tm_fox2	equ	12
tm_fox3	equ	14
tm_planets2	equ	34

dec_base	equ	2800h




