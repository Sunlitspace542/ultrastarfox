; ################################
; ## UltraStarFox Configuration ##
; ################################

; This is the master configuration file. to configure various aspects of the game, go to the following files:

; Config file includes
;#############################################
	include	CONFIG\GAME.INC		; Game
	include CONFIG\GRAPHICS.INC ; Graphics
	include CONFIG\ROM.INC		; ROM
	include	CONFIG\DEBUG.INC	; Debugging
	include CONFIG\XCESSORY.INC	; Accessories
;#############################################

; DO NOT touch these settings:
;####################################################################################################################
cesdemo				equ	0	; 0 = off, 1 = CES Demo (timed) 2 = Untimed CES Demo w/ planet cheat
cestime				equ	5	; CES/SSFW timer countdown (in minutes)
;####################################################################################################################