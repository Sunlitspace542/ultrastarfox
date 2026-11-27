;***************************************************************************
;*                                                                         *
;*                           UltraStarFox                                  *
;*                           ------------                                  *
;*_________________________________________________________________________*
;*                                                                         *
;*   File: STRINGS.ASM                                                     *
;*_________________________________________________________________________*
;*                                                                         *
;*   Descr: Strings to print with printstring macro                        *
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

; Define your strings to be printed with the printstring macro here.
;! Make sure to define them as global labels in STRINGS.EXT.

	IFNE	cestimeron

	definestring	cestimetext,< TIME >

	definestring	cesmintext,<M>

	definestring	cessectext,<S>

	definestring	ceszerotxt,<0>
	ENDC