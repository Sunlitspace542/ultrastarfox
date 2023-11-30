
;---------------------------------------------------------------------
; listing mode equates

MAKE_SHAPE_REPORT	=	0	; generate shapes report (slow)
MAKE_STRAT_REPORT	=	0	; generate strategy macro report (f. slow)
TIMINGS		=	0	; generate timings report (fast)

;---------------------------------------------------------------------
; assemble equates

;---------------------------------------------------------------------
; display mode equates

PROGRESS_INDICATOR	=	0	; switch on progress indicator (fast)
ANSI		=	1	; ansi colour codes? (no time)
TITLE_BAR		=	0	; colourful title bar (fast) (ansi only)
TITLEBANKINFO	=	0	; info while assembling (only if ansi/progress/titlebar on)
RAMLEFT		=	1	; displays information on ram space

;-----------------------------------------------------------------------

	IFEQ	ANSI
TITLE_BAR	=	0
	ENDC


	IFND	filelist
	IFD	makefile
filelist	=	1
	fopen	+files.log
	printf	"%n--------------------------------------------%n"
	fclose
	ELSEIF
filelist	=	0
	ENDC
	ENDC


	INCLUDE	ASM\ifcold.asm

	include	INC\macros.inc


totaltime	=	0
	gettime	starttime


	include	vars.inc

	include	INC\sfxregs.inc
	include	INC\msuregs.inc
	include	INC\soundequ.inc
	include	INC\structs.inc
	include	INC\alcs.inc



;---------------------------------------------------------
; sarcastic set up
;	send	$7d

;	fabcard	$290
	suppress expr

	ANSI_ON
	
	run	"initial_memory = %k"


	defend	"%00      %ie Error(s), %iw Warning(s). (%36",totaltime/100,".",totaltime-((totaltime/100)*100),"s%00)%n"
	deferror	"%00%31%01** %q%f%q (%l) %d: %e %u**%00 %n%s"
;	deferror	"%d%e%q%f%q%n	extern	%u%n"

;	fopen	status.doc
;	printf	"-------------------------------- STARGLIDER -----------------------------------%n"
;	fclose
;	printf	"%01-------------------------------- STARGLIDER -----------------------------------%00%n"


;---------------------------------------------------------

	IFD	makefile
	fileslog	<$(STDFILES)>
	ENDC


