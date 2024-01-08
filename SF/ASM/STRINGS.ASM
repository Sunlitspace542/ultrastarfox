strats_start
;***************************************************************************
;*                                                                         *
;*                           UltraStarFox                                  *
;*                           ------------                                  *
;*_________________________________________________________________________*
;*                                                                         *
;*   File: STRINGS.ASM                                                     *
;*_________________________________________________________________________*
;*                                                                         *
;*   Descr: Strings to print with kandoprint macro                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   Date: 8/1/24                                                          *
;*_________________________________________________________________________*
;*                                                                         *
;*   Author(s):                                                            *
;*   Kando, Sunlit                                                         *
;*                                                                         *
;***************************************************************************
	INCPUBLICS	EXT\strings.ext

; Define your strings to be printed with the kandoprint macro here.
;! Make sure to define them as global labels in STRINGS.EXT.

	IFNE	cestimeron

cestimetext
	db	" TIME "
	dw	0

cesmintext
	db	"M"
	dw	0

cessectext
	db	"S"
	dw	0

ceszerotxt
	db	"0"
	dw	0
	ENDC

	strats_end