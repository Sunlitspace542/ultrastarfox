; #############################
; ## Debugging Configuration ##
; #############################

;####################################################################################################################

; full strategy debugging - Press P2 R Button in-game to activate
; [0 = off, 1 = on]
debuginfo			equ	0

; speed up mode?
; [0 = off, 1 = on]
debuginfo2			equ	0

; 3D Stats (FPS, shapes drawn, etc.)
; Requires that debuginfo be enabled.
; [0 = off, 1 = on]
mario_stats3d		equ	0

; Run message test in training level
; [0 = off, 1 = on]
messagetest			equ	0

; total number of messages to run through (must match the number in the message file)
totalmsgs			equ	142

; Allows you to enable planet select cheat on the map
; before you have selected a level. Press X to activate.
planetcheaton 		equ 1

; Debug mode font to use
; 2BPP 8x8 tiles (2BPP GB in YY-CHR)
; [0 = vanilla, 1 = SFEX, 2 = Star Glider/SNESGlider]
debugfont			equ	0

; print "printroulen" lines during assembly
; [0 = off, 1 = on]
prntrouln_on		equ 0

; Redirect training mode button in controls select to a different map
; [0 = off, 1 = on]
trainingmapredirect	equ	0

; If above equate set to 1, specify map to redirect to here
; See EXT\MAPLIST.EXT for valid labels
	IFD	_ARGSFX
	STRING	trainingredirectmap[64]="creditsmap"
	ENDC

;; Cheats


; No collision for the player
; [0 = off, 1 = on]
godmode			equ	0

; Infinite Braking
; [0 = off 1 = on]
infbrake		equ	0

; Infinite Boosting
; [0 = off 1 = on]
infboost		equ	0

; Infinite Bombs
; [0 = off, 1 = on]
infbombs		equ 0

; "All-Range Mode"
; Press P1 L and R to rotate player. Press select to unload objects.
; [0 = off, 1 = on]
allrange		equ	0

;####################################################################################################################