; format is:
; textname	txt colour(1-15), <TEXT>

	IFNE	GERMAN
pausetxt	txt	14,<PAUSE>		;german pause
scoretxt	txt	14,<PUNKTE>
totalscoretxt	txt	14,<GESAMTPUNKTZAHL>		;german total score
slashtxt	txt	14,</>
percenttxt	txt	14,<PERCENTAGE>
bonustxt	txt	14,<BONUS 1 VERSUCH>
teamtxt	txt	14,<TEAM POWER>
percenttxt2	txt	14,<%>
perfecttxt	txt	14,<PERFECT//>
slippytxt	txt	14,<SLIPPY>
peppytxt	txt	14,<PEPPY>
falcotxt	txt	14,<FALCO>
deadtxt	txt	14,<. . . . . .>
stagetxt	txt	14,<STAGE>
	ENDC

	IFNE	FRENCH
pausetxt	txt	14,<PAUSED>		;french pause
scoretxt	txt	14,<SCORE>
totalscoretxt	txt	14,<SCORE TOTAL>		;french total score
slashtxt	txt	14,</>
percenttxt	txt	14,<POURCENTAGE>
bonustxt	txt	14,<BONUS 1 CREDIT>
teamtxt	txt	14,<BOUCLIER DE TEAMATE>
percenttxt2	txt	14,<%>
perfecttxt	txt	14,<PARFAIT//>
slippytxt	txt	14,<SLIPPY>
peppytxt	txt	14,<PEPPY>
falcotxt	txt	14,<FALCO>
deadtxt		txt	14,<ES MORT>
stagetxt	txt	14,<STAGE>
	ENDC

	IFNE	JAPANESE
pausetxt	txt	14,<PAUSED>		;japanese pause
scoretxt	txt	14,<SCORE>		;japanese score
totalscoretxt	txt	14,<TOTAL SCORE>		;japanese total score
slashtxt	txt	14,</>
percenttxt	txt	14,<PERCENTAGE>
bonustxt	txt	14,<BONUS 1 CREDIT>
teamtxt	txt	14,<SHIELD OF TEAMMATES>
percenttxt2	txt	14,<%>
perfecttxt	txt	14,<PERFECT//>
slippytxt	txt	14,<SLIPPY>
peppytxt	txt	14,<PEPPY>
falcotxt	txt	14,<FALCO>
deadtxt	txt	14,<IS DOWN>
stagetxt	txt	14,<STAGE>
	ENDC
	
	IFNE	SPANISH			
pausetxt	txt	14,<PAUSED>		;spanish pause
scoretxt	txt	14,<SCORE>		;spanish score
totalscoretxt	txt	14,<TOTAL SCORE>		;spanish total score
slashtxt	txt	14,</>
percenttxt	txt	14,<PERCENTAGE>
bonustxt	txt	14,<BONUS 1 CREDIT>
teamtxt	txt	14,<SHIELD OF TEAMMATES>
percenttxt2	txt	14,<%>
perfecttxt	txt	14,<PERFECT//>
slippytxt	txt	14,<SLIPPY>
peppytxt	txt	14,<PEPPY>
falcotxt	txt	14,<FALCO>
deadtxt	txt	14,<IS DOWN>
stagetxt	txt	14,<STAGE>
	ENDC

	IFEQ	SPANISH
	IFEQ	GERMAN
	IFEQ	FRENCH
	IFEQ	JAPANESE
pausetxt	txt	14,<PAUSED>		;english pause
scoretxt	txt	14,<SCORE>
totalscoretxt	txt	14,<TOTAL SCORE>		;english total score
slashtxt	txt	14,</>
percenttxt	txt	14,<PERCENTAGE>
bonustxt	txt	14,<BONUS 1 CREDIT>
teamtxt	txt	14,<SHIELD OF TEAMMATES>
percenttxt2	txt	14,<%>
perfecttxt	txt	14,<PERFECT//>
slippytxt	txt	14,<SLIPPY>
peppytxt	txt	14,<PEPPY>
falcotxt	txt	14,<FALCO>
deadtxt	txt	14,<IS DOWN>
stagetxt	txt	14,<STAGE>
	ENDC
	ENDC
	ENDC
	ENDC

;-------------------------------------------------------------------

helpsnd	=	0
downsnd	=	1
othersnd	=	2

msgcolour_red = 3
msgcolour_yellow = 4
msgcolour_blue = 8
msgcolour_white = 14

message	MACRO	[colour,person,text,sound]

	printf	"%tDW%t",*&WM,"%t; (",msgnum,") {text} ** %n"
	DB	friend_{person}

	IFEQ	NARG-3
	db	othersnd
	ELSEIF
	DB	{sound}snd
	ENDC

	txt	msgcolour_{colour},<{text}>
msgnum	=	msgnum+1
	ENDM

;-------------------------------------------------------------------

msgnum	=	1

	fopen	msgs.txt

	IFNE	german			;if german = 1
	include	MSG\german.inc		;use german message file
	ENDC

	IFNE	french			;if french = 1
	include	MSG\french.inc		;use french message file
	ENDC

	IFNE	spanish			;if spanish = 1
	include	MSG\spanish.inc		;use spanish message file
	ENDC

	IFNE	JAPANESE
	include	MSG\JAPANESE.inc	;use japanese message file
	ENDC

	IFEQ	GERMAN
	IFEQ	FRENCH
	IFEQ	SPANISH
	IFEQ	JAPANESE
	include	MSG\ENGLISH.inc	;use english message file
	ENDC
	ENDC
	ENDC
	ENDC

	fclose	!

messages	include	msgs.txt




