; #############################
; ## Debugging Configuration ##
; #############################

;####################################################################################################################

; full strategy debugging - Press P2 R Button in-game to activate [0 = off 1 = on]
debuginfo			equ	0

; speed up mode? [0 = off 1 = on]
debuginfo2			equ	0

; 3D Stats (FPS, shapes drawn, etc.)
; Requires that debuginfo be enabled.
mario_stats3d		equ	0

; Run message test in training level
messagetest			equ	0

; Allows you to enable planet select cheat on the map
; before you have selected a level. Press X+Y on the same frame to activate.
planetcheaton 		equ 0

; Debug mode font to use
; [0 = vanilla, 1 = SFEX]
debugfont			equ	0

;; Cheats


; No collision for the player [0 = off 1 = on]
godmode			equ	0

; Infinite Braking	[0 = off 1 = on]
infbrake		equ	0

; Infinite Boosting	[0 = off 1 = on]
infboost		equ	0

; Infinite Bombs [0 = off 1 = on]
infbombs		equ 0

; "All-Range Mode" [0 = off 1 = on]
; Press P1 L and R to rotate player. Press select to unload objects.
allrange		equ	0

;####################################################################################################################

; Sanity checks (do not touch)

	IFEQ	debuginfo
	IFNE	mario_stats3d
	printf	"debuginfo must be enabled to use mario_stats3d!"
	fail
	ENDC
	ENDC