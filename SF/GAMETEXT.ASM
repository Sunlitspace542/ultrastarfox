	IFNE	GERMAN
pausetxt	TXT	14,<PAUSED>		;german pause
scoretxt	TXT	14,<PUNKTE>
totalscoretxt	TXT	14,<GESAMTPUNKTZAHL SCORE>		;german total score
slashtxt	TXT	14,</>
percenttxt	TXT	14,<PERCENTAGE>
bonustxt	TXT	14,<BONUS 1 VERSUCH>
teamtxt	TXT	14,<TEAM POWER>

	ENDC
	IFNE	FRENCH
pausetxt	TXT	14,<PAUSE>		;french pause
scoretxt	TXT	14,<SCORE>
totalscoretxt	TXT	14,<TOTAL SCORE>		;french total score
slashtxt	TXT	14,</>
percenttxt	TXT	14,<PERCENTAGE>
bonustxt	TXT	14,<BONUS 1 CREDIT>
teamtxt	TXT	14,<SHIELD OF TEAMMATES>

	ENDC
	IFNE	JANGLISH
pausetxt	TXT	14,<PAUSE>		;japanese pause
scoretxt	TXT	14,<SCORE>		;japanese score
totalscoretxt	TXT	14,<TOTAL SCORE>		;japanese total score
slashtxt	TXT	14,</>
percenttxt	TXT	14,<PERCENTAGE>
bonustxt	TXT	14,<BONUS 1 CREDIT>
teamtxt	TXT	14,<SHIELD OF TEAMMATES>

	ENDC
	IFEQ	GERMAN
	IFEQ	FRENCH
	IFEQ	JANGLISH
pausetxt	TXT	14,<PAUSE>		;english pause
scoretxt	TXT	14,<SCORE>
totalscoretxt	TXT	14,<TOTAL SCORE>		;english total score
slashtxt	TXT	14,</>
percenttxt	TXT	14,<PERCENTAGE>
bonustxt	TXT	14,<BONUS 1 CREDIT>
teamtxt	TXT	14,<SHIELD OF TEAMMATES>

	ENDC
	ENDC
	ENDC


percenttxt2	TXT	14,<%>
perfecttxt	TXT	14,<PERFECT//>
frogtxt	TXT	14,<SLIPPY>
bunnytxt	TXT	14,<PEPPY>
cocktxt	TXT	14,<FALCO>
deadtxt	TXT	14,<IS DOWN>
stagetxt	TXT	14,<STAGE>
cesmintxt	TXT	2,<m>
cessectxt	TXT	2,<s>
scoretxt2	TXT	2,<score>

;-------------------------------------------------------------------

helpsnd	=	0
downsnd	=	1
othersnd	=	2

message	MACRO	[person,english,japanese,sound]
	printf	"%tDW%t",*&WM,"%t; (",msgnum,") {english} ** {japanese}%n"
	DB	friend_{person}

	IFEQ	NARG-3
	db	othersnd
	ELSEIF
	DB	{sound}snd
	ENDC

	TXT	14,<{english}>,<{japanese}>
msgnum	=	msgnum+1
	ENDM

;-------------------------------------------------------------------

msgnum	=	1

	fopen	msgs.txt

	IFEQ	german
	include	gamemsgs.inc
	ELSEIF
	include	german.inc
	ENDC

	fclose	!

messages	include	msgs.txt




