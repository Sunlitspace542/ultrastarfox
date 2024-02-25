; ############################
; ## Graphics Configuration ##
; ############################

;####################################################################################################################

; Increases framerate cap to 30FPS, no pacing changes.
; Has no effect on PAL builds, as that version already
; does this to compensate for 50hz.
_30fps	equ	0

; High poly arwing [0 = low poly (default) 1 = hi poly]
; replaces the player's ship, teammates' ships, and the scramble sequence
; ship models with a custom high poly model based on my_demo.
hipolyarwing	equ	0

; Title screen logo to use
; 0 = Star Fox JP
; 1 = Star Fox US Rev 0
; 2 = Star Fox US Rev 1/2
; 3 = Starwing
titlelogo	equ 1

; Controls screen palette to use, 0 = NTSC, 1 = PAL	(DOES NOT AFFECT JP)	
controlsscreenpal	equ	0

; Enable colored window over shield and boost meters as in vanilla.
; Set this to 0 if moving meter positions. Disables hud hide on boss clear/level end.
shieldboostcolorbox	equ	0

;; HUD Sprite positions

; Lives position ($YYXX)
livesPos1 equ $1110
livesPos2 equ $1118
livesPos3 equ $1120

; Shield text position ($YYXX)
ShieldTextPos1 equ $b718
ShieldTextPos2 equ $b720
ShieldTextPos3 equ $b728
ShieldTextPos4 equ $b730

; Nova Bomb Icon Position ($YYXX)
BombIconPos equ $b6e1

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