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
; If no mouse is plugged in, game reverts to standard joypad controls.
; [0 = off, 1 = on]
mouseon	equ	0

; Instead of the ship constantly chasing the mouse position,
; the ship only moves when the mouse moves, similar to analog controls.
; To use for analog controls via SNES mouse:
;    1. mouseon must be set to 1.
;    2. Unbind D-Pad U/D/L/R in your emulator.
;    3. Bind up/down/left/right on the mouse to your controller's
;       analog stick using Joy2Key, ReWASD, or suchlike.
;    4. Up and down on the mouse may need to be inverted and
;       sensitivity adjusted depending on preference.
; [0 = off, 1 = on]
analogstick	equ	1

; Set mouse speed (does not affect Hyperkin mouse)
; 0=slow, 1=medium, 2=fast
mouse_speed	equ	1

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
