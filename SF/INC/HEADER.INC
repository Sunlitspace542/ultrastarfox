
	include	INC\bdays.inc

;---------------------------------------------------------------------
; listing mode equates

MAKE_SHAPE_REPORT	=	0	; generate shapes report (slow)
MAKE_STRAT_REPORT	=	0	; generate strategy macro report (f. slow)
TIMINGS		=	0	; generate timings report (fast)

;---------------------------------------------------------------------
; display mode equates

PROGRESS_INDICATOR	=	0	; switch on progress indicator (fast)
ANSI		=	1	; ansi colour codes? (no time)
TITLE_BAR		=	0	; colourful title bar (fast) (ansi only)
TITLEBANKINFO	=	0	; info while assembling (only if ansi/progress/titlebar on)
RAMLEFT		=	1	; displays information on ram space

;-----------------------------------------------------------------------

; Turn ANSI colour codes off if assembler output is being written to a log file
	IFD	NOANSI
ANSI		=	0
	ENDC

	IFEQ	ANSI
TITLE_BAR	=	0
	ENDC

	include	INC\ifcold.inc

; Macros
	include	INC\macros.inc

; reset timer
totaltime	=	0
	gettime	starttime

; Constants
	include	INC\vars.inc

; System defines
	include	INC\sfcregs.inc	; SNES registers
	include INC\mregs.inc	; MARIO chip registers
	IFNE	msu
	include	INC\msuregs.inc	; MSU-1 registers
	include	INC\msutrks.inc	; MSU-1 tracklist
	ENDC

; Sound effect IDs
	include	INC\soundequ.inc

; Data structures
	include	INC\structs.inc

; Memory allocations
	include	INC\alcs.inc



;---------------------------------------------------------
; sarcastic set up

	suppress expr

	ANSI_ON
	
; get and define initial assembler ram
	run	"initial_assembler_memory = %k"

; define message to print when assembly of a file completes
	defend	"%00      %ie Error(s), %iw Warning(s). (%36",totaltime/100,".",totaltime-((totaltime/100)*100),"s%00)%n"
; define generic error message
	deferror	"%00%31%01** %q%f%q (%l) %d: %e %u**%00 %n%s"


;---------------------------------------------------------


