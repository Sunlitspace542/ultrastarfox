; ###############################
; ## Accessories Configuration ##
; ###############################

;####################################################################################################################

; Enable SNES mouse on controller port 2.
; If using this, setting "crosshairalwayson" to 1 is recommended.
; Controls:
; Left click - fire
; Right click - fomb
; Left+right click - boost/brake (see below)
; Double clicking left+right within 9 frames will toggle between boost and brake.
; [0 = off, 1 = on]
mouseon	equ	0

; Instead of the ship constantly chasing the mouse position,
; the ship only moves when the mouse moves.
; Can be used for analog controls via the SNES mouse.
; mouseon must be set to 1.
; Make sure to unbind D-Pad U/D/L/R in your emulator.
; Up and down on the mouse may need to be manually inverted dependent on preference.
; [0 = off, 1 = on]
analogstick	equ	0

; Enable rumble support on controller port 1.
; [0 = off, 1 = on]
rumble	equ	0

; Enable NTT Data Pad support.
; [0 = off, 1 = on port 1, 2 = on port 2]
nttpad	equ	0

;####################################################################################################################

; Sanity checks (do not touch)

	IFNE	mouseon
	IFNE	RUMBLE
	printf	"Mouse cannot be used with rumble!"
	fail
	ENDC
	ENDC

	IFNE	mouseon
	IFEQ	nttpad-2
	printf	"Mouse and NTT Pad cannot both be on port 2!"
	fail
	ENDC
	ENDC

	IFEQ	mouseon
	IFNE	analogstick
	printf	"mouseon must be enabled to use analogstick!"
	fail
	ENDC
	ENDC