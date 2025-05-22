; ########################
; ## Game Configuration ##
; ########################

;####################################################################################################################

; Gameplay Options

; for player health values and other object equates, see INC\STRATEQU.INC.

; Restore Laser Upgrade enemy code to spawn helperball items instead of laser upgrades
; [0 = off, 1 = on]
wnglzrman_helpball	equ	0

; Crosshair in third person view [0 = off, 1 = on]
crosshairalwayson	equ	0

; Skip intro cutscene
; [0 = off, 1 = on]
nointroseq	equ	0

; Disable SCRAMBLE sequence in 1-1/2-1/3-1
; [0 = off, 1 = on]
noscrambleseq	equ	0

; Enable mapmsg in the intro
; [0 = off, 1 = on]
friendmessagesinintro	equ	0

; Number of lives the player starts with (stock = 3)
; Note that the game displays the number of lives as 1 less than it actually is.
; Cannot be set to zero as that breaks some game logic.
numlives	equ	3

; Input window for barrel rolls (in frames). (stock = 3)
barrelrolldelay	equ	3

; Enables a timer. when the defined time runs out, the game returns to the controls screen.
; [0 = off, 1 = on]
cestimeron			equ	0

; Timer countdown (in minutes)
; highest possible is 99
cestime				equ	15

; On-screen location of timer
timerx = 20 ; Column (from left of screen) 0 - 28
timery = 2 ; Row (from top of screen) 0 - 24

; Random Number Generation Behavior

; 0 = RNG reset at map screen (vanilla)
; 1 = RNG set at boot and never reset
; 2 = 789 xorshift RNG, seed set at boot and never reset (Saves 2 bytes of zeropage)
rngmode	equ	0

; Random Teammate Selection Behavior

; 0 = 50/50 Peppy/Slippy 40/60 Falco/Peppy 40/60 Falco/Slippy
; 1 = Completely random
randomselectmode	equ	0

; Chance of teammate selection for randomselectmode 1
teammateselectchance	equ	3

; Random Vertices

; randomize the vertices slightly
; [0 = off, 1 = on]
randverts1	equ	0

; decimal value of the binary AND value of the max number you want to add to each point
; Recommended values: 1, 3, 7, 15, 31, 63 (representing 00000001,00000011,00000111,00001111,00011111,00111111)
randvertandbit	equ	15

; randomize the vertices a lot, Both will not activate at once
; [0 = off, 1 = on]
randverts2	equ	0		

;####################################################################################################################

; Sanity checks (do not touch)

	IFEQ	numlives
	printf	"numlives cannot be zero!"
	error+
	ENDC