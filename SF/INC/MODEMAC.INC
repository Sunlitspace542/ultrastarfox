; Implementation of MODE directive from Randy Linden's XAsm assembler
; Example:
; mode	<EAX!> - 65816, ai16, longa, longi
; e/E - 6502/65816 mode
; a/A - 8/16 bit A
; x/X - 8/16 bit X/Y
;  !  - Assemble code as specified
mode	MACRO	[mode]

	STRING	mode[4]

	defs	mode,"\1"

iteration = 0

asmshorta = 0
asmlonga = 0
asmshorti = 0
asmlongi = 0

	REPT	4

	IFS	mode,iteration,'e' ; 6502 mode
	sec
	xce
	ENDC

	IFS	mode,iteration,'E' ; 65816 mode
	clc
	xce
	ENDC

	IFS	mode,iteration,'a' ; 8-bit A
asmshorta = 1
	ENDC

	IFS	mode,iteration,'A' ; 16-bit A
asmlonga = 1
	ENDC

	IFS	mode,iteration,'x' ; 8-bit XY
asmshorti = 1
	ENDC

	IFS	mode,iteration,'X' ; 16-bit XY
asmlongi = 1
	ENDC

	IFS	mode,iteration,'!' ; Tell assembler to assemble code as specified

	IFNE	asmshorta
	shorta
	ENDC

	IFNE	asmlonga
	longa
	ENDC

	IFNE	asmshorti
	shorti
	ENDC

	IFNE	asmlongi
	longi
	ENDC

	ENDC

iteration = iteration+1

	ENDR

	;bringing it all together
	;check for combos

	IFEQ	(asmshorta+asmshorti)-2
;	ai8
	sep	#p_a+p_x
	MEXIT
	ENDC

	IFEQ	(asmlonga+asmlongi)-2
;	ai16
	rep	#p_a+p_x
	MEXIT
	ENDC

	IFEQ	(asmshorta+asmlongi)-2
;	a8i16
	sep	#p_a
	rep	#p_x
	MEXIT
	ENDC

	IFEQ	(asmlonga+asmshorti)-2
;	a16i8
	sep	#p_x
	rep	#p_a
	MEXIT
	ENDC

	;check for singles

	IFNE	asmshorta
	IFEQ	asmshorti
;	a8
	sep	#p_a
	MEXIT
	ENDC
	ENDC

	IFEQ	asmshorta
	IFNE	asmshorti
;	i8
	sep	#p_x
	MEXIT
	ENDC
	ENDC

	IFNE	asmlonga
	IFEQ	asmlongi
;	a16
	rep	#p_a
	MEXIT
	ENDC
	ENDC

	IFEQ	asmlonga
	IFNE	asmlongi
;	i16
	rep	#p_x
	MEXIT
	ENDC
	ENDC

	ENDM