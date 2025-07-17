; ############################
; ## Graphics Configuration ##
; ############################

;####################################################################################################################

; Disables Level of Detail (LOD, AKA simple1/2/3) model support in the shape format and renderer.
; Saves 6 bytes per shape, and may improve performance slightly?
NOLODS	equ	0

; High poly arwing [0 = low poly (default) 1 = hi poly]
; replaces the player's ship, teammates' ships, and the scramble sequence
; ship models with a custom high poly model based on my_demo.
; [0 = off, 1 = on]
hipolyarwing	equ	0

; Title screen logo to use
; 0 = Star Fox JP
; 1 = Star Fox US Rev 0
; 2 = Star Fox US Rev 1/2
; 3 = Starwing
titlelogo	equ 1

; Controls screen palette to use. 
; [0 = NTSC, 1 = PAL] (DOES NOT AFFECT JP)
controlsscreenpal	equ	0

; Enable colored window over shield and boost meters as in vanilla.
; Set this to 0 if moving meter positions.
; [0 = off, 1 = on]
shieldboostcolorbox	equ	0

; Hides the HUD when a boss is defeated.
; [0 = off, 1 = on]
hidehudonbossdeath	equ	1

;; HUD Sprite positions

; X values start at the left of the screen
; Y values start at the top of the screen

; Shield and Boost meter positions/height
shieldmeterx		equ	8
shieldmetery		equ	22*8
shieldmeterheight	equ	8

boostmeterx			equ	22*8
boostmetery			equ	22*8
boostmeterheight	equ	8

; Lives position ($YYXX)
livesPos1 equ $1110			; arwing
livesPos2 equ livesPos1+$8	; x
livesPos3 equ livesPos2+$8	; #

; Shield text position ($YYXX)
ShieldTextPos1 equ $b718
ShieldTextPos2 equ ShieldTextPos1+$8
ShieldTextPos3 equ ShieldTextPos2+$8
ShieldTextPos4 equ ShieldTextPos3+$8

; Initial nova bomb icon position ($YYXX)
bombIconPos equ $b6e1

; Spacing between each bomb icon in the HUD
bombIconSpacing	equ	$9

; Nova bomb counter direction
; [0 = L -> R, 1 = R -> L]
bombcounterdirection	equ	0

; Teammate message positions

; X position to clip overflowing message text and start a new line
friendmsgrighttextclip	equ	174

; Change these to change the overall position of the message box on screen
friendmsgxadd	equ	0
friendmsgyadd	equ	0

; relative positions of each part of the message box

; real text
friendmsgxpos	equ	82+friendmsgxadd
friendmsgypos	equ	169-friendmsgyadd

; text shadow
shadowmsgxpos	equ 83+friendmsgxadd
shadowmsgypos	equ	170-friendmsgyadd

; friend hp meter
friendhpx	equ	82+friendmsgxadd
friendhpy	equ	177-friendmsgyadd

; friend mugshot pos
friendmugshotx	equ	6+(friendmsgxadd/8)
friendmugshoty	equ	152-((friendmsgyadd/8)*8)

;; Palettes

; Max number of palette lines allowed in ALLCOLS.PAC. (stock = 256)
; Raise this number if you have more than about 36 palettes and the
; latest in the list won't load.
; setting this to 512 has been tested, and appears to work.
; For reference, a palette line is 32 bytes in size. 7 of those is 224 bytes.
;!! If this number is too large, bad things might happen, so be careful!!
; see also: gamepalettes xxalc in INC\KALCS.INC.
maxcolscru	equ	256

;####################################################################################################################