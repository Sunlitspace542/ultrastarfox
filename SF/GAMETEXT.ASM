; WARNING: Confusing spaghetti code ahead

    IFNE    GERMAN
pausetxt    TXT    14,<PAUSE>        ;german pause
    ENDC
    IFNE    FRENCH
pausetxt    TXT    14,<PAUSED>        ;french pause
    ENDC
    IFNE    JANGLISH
pausetxt    TXT    14,<PAUSED>        ;japanese pause
    ENDC
    IFEQ    GERMAN
    IFEQ    FRENCH
    IFEQ    JANGLISH
pausetxt    TXT    14,<PAUSED>        ;english pause
    ENDC
    ENDC
    ENDC

	IFNE	GERMAN
totalscoretxt	TXT	14,<GESAMTPUNKTZAHL>
	ENDC

	IFNE	FRENCH
totalscoretxt	TXT	14,<SCORE TOTAL>
	ENDC

	IFEQ	GERMAN
	IFEQ	FRENCH
totalscoretxt	TXT	14,<TOTAL SCORE>
	ENDC
	ENDC

	IFEQ	GERMAN
scoretxt	TXT	14,<SCORE>
	ELSEIF
scoretxt	TXT	14,<PUNKTE>
	ENDC

	IFEQ	FRENCH
slashtxt	TXT	14,</>
percenttxt	TXT	14,<PERCENTAGE>
	ELSEIF
slashtxt	TXT	14,</>
percenttxt	TXT	14,<POURCENTAGE>
	ENDC

	IFEQ	GERMAN
	IFEQ	CONTEST
bonustxt	TXT	14,<BONUS 1 CREDIT>
	ELSEIF
bonustxt	TXT	14,<PERFECT BONUS 1OOOOO>
	ENDC
	ELSEIF
bonustxt	TXT	14,<BONUS 1 VERSUCH>
	ENDC

	IFEQ	FRENCH
percenttxt2	TXT	14,<%>
perfecttxt	TXT	14,<PERFECT//>
	ELSEIF
percenttxt2	TXT	14,<%>
perfecttxt	TXT	14,<PARFAIT//>
	ENDC

	IFNE	GERMAN
teamtxt	TXT	14,<TEAM POWER>
	ENDC
	
	IFNE	FRENCH
teamtxt	TXT	14,<BOUCLIER DE TEAMATE>
	ENDC

	IFEQ	GERMAN
	IFEQ	FRENCH
teamtxt	TXT	14,<SHIELD OF TEAMMATES>
	ENDC
	ENDC

	IFNE	GERMAN	; if german = 1
frogtxt		TXT	14,<SLIPPY>
bunnytxt	TXT	14,<PEPPY>
cocktxt		TXT	14,<FALCO>
deadtxt		TXT	14,<. . . . . .>
stagetxt	TXT	14,<STAGE>
cesmintxt	TXT	2,<m>
cessectxt	TXT	2,<s>
scoretxt2	TXT	2,<punkte>			; SSFW/SWC leftover, added to get text chunk of ROM to match
shldbonus	TXT	2,<SCHILD BONUS>	; SSFW/SWC leftover, added to get text chunk of ROM to match
bombbonus	TXT	2,<BOMBE BONUS>		; SSFW/SWC leftover, added to get text chunk of ROM to match
	ENDC

	IFNE	FRENCH	; if french = 1
frogtxt		TXT	14,<SLIPPY>
bunnytxt	TXT	14,<PEPPY>
cocktxt		TXT	14,<FALCO>
deadtxt		TXT	14,<ES MORT>
stagetxt	TXT	14,<STAGE>
cesmintxt	TXT	2,<m>
cessectxt	TXT	2,<s>
scoretxt2	TXT	2,<score>			; SSFW/SWC leftover, added to get text chunk of ROM to match
shldbonus	TXT	2,<SHIELD BONUS>	; SSFW/SWC leftover, added to get text chunk of ROM to match
bombbonus	TXT	2,<BOMB BONUS>		; SSFW/SWC leftover, added to get text chunk of ROM to match
	ENDC

	IFEQ	GERMAN	; german = 0
	IFEQ	FRENCH	; french = 0
frogtxt		TXT	14,<SLIPPY>
bunnytxt	TXT	14,<PEPPY>
cocktxt		TXT	14,<FALCO>
deadtxt		TXT	14,<IS DOWN>
stagetxt	TXT	14,<STAGE>
cesmintxt	TXT	2,<m>
cessectxt	TXT	2,<s>
scoretxt2	TXT	2,<score>			; SSFW/SWC leftover, added to get text chunk of ROM to match
shldbonus	TXT	2,<SHIELD BONUS>	; SSFW/SWC leftover, added to get text chunk of ROM to match
bombbonus	TXT	2,<BOMB BONUS>		; SSFW/SWC leftover, added to get text chunk of ROM to match
	ENDC
	ENDC

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

	IFNE	german			;if german = 1 and french = 1
	IFNE	french
	printf	"You cannot have german and french on at the same time"
	fail
	endc
	endc
	
	IFNE	german			;if german = 1
	include	german.inc
	ENDC

	IFNE	french			;if french = 1
	include	french.inc
	ENDC

	IFEQ	german
	IFEQ	french
	include	gamemsgs.inc
	endc
	endc
	

	; TODO: get french working (FRENCH.INC)

	fclose	!

messages	include	msgs.txt




