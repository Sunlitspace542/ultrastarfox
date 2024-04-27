; ############################
; ## Language Configuration ##
; ############################

;####################################################################################################################

;!! Only ONE may be on at a time.

; Japanese/English [0 = English, 1 = Japanese]
JAPANESE	equ	0

; German language version [0 = off, 1 = on]
german		equ	0

; French language version [0 = off, 1 = on] (TEXT ONLY, NO DIACRITICS OR GFX)
french		equ	0

; Spanish language version [0 = off, 1 = on] (TEXT ONLY, NO DIACRITICS OR GFX)
spanish		equ	0

;####################################################################################################################

; Sanity checks (do not touch)

chklanguageselection	MACRO	[lang1,lang2]
	IFNE	{lang1}
	IFNE	{lang2}
	printf	"%01%31Error: You cannot have {lang1} and {lang2} on at the same time!%n%00"
	fail
	ENDC
	ENDC
	ENDM

	chklanguageselection	german,french
	chklanguageselection	german,spanish
	chklanguageselection	spanish,french