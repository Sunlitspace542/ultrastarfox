; ############################
; ## Graphics Configuration ##
; ############################

;####################################################################################################################

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

; Enable colored window over shield and boost meters like vanilla
; Set this to 0 if moving meter positions. Also disables hud hide on boss clear/level end.
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

;####################################################################################################################