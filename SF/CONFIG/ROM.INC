; #######################
; ## ROM Configuration ##
; #######################

;####################################################################################################################

; Cartridge Configuration

; MSU1 support [0 = off 1 = on]
msu					equ 0

; enable/disable FastROM [1 = on, 0=off]
FASTROM				equ 1

; SuperFX 21MHZ Fast mode [0 = off 1 = on]
fast		equ 1

; Region

; Japanese ROM Header [0 = off, 1 = on]	(DO NOT USE IF PAL = 1)
japan				equ 0

; PAL/NTSC [0 = NTSC, 1 = PAL] (DO NOT USE IF JAPAN = 1)
pal					equ	0


; Language Options

;!! Only ONE may be on at a time.

; Japanese/English [0 = English, 1 = Japanese]
JAPANESE	equ	0

; German language version [0 = off 1 = on]
german		equ	0

; French language version [0 = off 1 = on] (TEXT ONLY, NO DIACRITICS OR GFX)
french		equ	0

; Spanish language version [0 = off 1 = on] (TEXT ONLY, NO DIACRITICS OR GFX)
spanish		equ	0


;  ROM name

; internal rom name, [0 = STAR FOX, 1 = STAR WING, 2 = Custom Name]
internalname	equ	0

; field for a custom name. the internal ROM name must be 20 CHARACTERS long. No more, no less.
docustomname	MACRO
;       "                     "  line name up with these quotes
	db	"ULTRASTARFOX         "
	ENDM


; Credits name

; Changes the game name that shows up in the credits [0 = STAR FOX, 1 = STARWING, 2 = Custom Name]
; distance to camera may need to be manually adjusted in MAPS\CREDITS.ASM
credzname	equ	0

; field for custom credits name
docredzname	MACRO
	mariomsg	<ULTRASTARFOX>
	ENDM

;####################################################################################################################