; ########################
; ## Game Configuration ##
; ########################

;####################################################################################################################

; ####################
; # Gameplay Options #
; ####################

; for player health values and other object equates, see INC\STRATEQU.INC.

; Restore Laser Upgrade enemy code to spawn helperball items instead of laser upgrades	[0 = off 1 = on]
wnglzrman_helpball	equ	0

; Crosshair in third person view [0 = off 1 = on]
crosshairalwayson	equ	0

; Number of lives the player starts with (stock = 3)
; Note that the game displays the number of lives as 1 less than it actually is.
numlives	equ	3

;###################
;# Random Vertices #
;###################

; randomize the vertices slightly
randverts1	equ	0

; decimal value of the binary AND value of the max number you want to add to each point
; Recommended values: 1, 3, 7, 15, 31, 63 (representing 00000001,00000011,00000111,00001111,00011111,00111111)
randvertandbit	equ	15

; randomize the vertices a lot, Both will not activate at once
randverts2	equ	0		

;####################################################################################################################