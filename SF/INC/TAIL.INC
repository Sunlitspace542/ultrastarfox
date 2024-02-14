	IFNE	RAMLEFT

Zero_Page_free	=	$100-zmempt
Work_RAM_free	=	$2000-wmempt
Extended_RAM_free	=	$7f0000-xmempt
Mario_RAM_free	=	($700000+bitmap1)-mmempt
ZMario_RAM_free	=	$700200-zmmempt
Extended_Alblks_free	=	al_size-alx_sizeof
Allcols_Lines_free	=	maxcolscru-__totpallines
	run	"Assembler_RAM_free	=	%k"

	header	<------------------------------- MEMORY USAGE ---------------------------------->
	report	<Zero Page Free>,Zero_Page_free,$100
	report	<Work RAM Free>,Work_RAM_free,($2000-$300)
	report	<Extended RAM Free>,Extended_RAM_free,($7f0000-$7e2000)
	IFNE	zmmempt-$700000
	report	<ZMARIO RAM Free>,ZMario_RAM_free,($200)
	ENDC
	IFNE	mmempt-$700200
	report	<MARIO RAM Free>,Mario_RAM_free,(bitmap1-$200)
	ENDC

	report	<Ext. Alblks Free>,Extended_Alblks_free,alx_sizeof

	report	<ALLCOLS Lines Free>,Allcols_Lines_free,maxcolscru

; Bank 2 X Routines
	IFND	noxroutinesreport
	IFD	xroutinesreport
XRoutines_free	=	xlen-xoffset
	report	<X Routines Free>,XRoutines_free,xlen
	ENDC	;xroutinesreport
	ENDC	;noxroutinesreport

	IFD	_SASM
	report	<SASM RAM Free>,Assembler_RAM_free,initial_assembler_memory
	ENDC

	IFD	_ARGSFX
	report	<ARGSFX RAM Free>,Assembler_RAM_free,initial_assembler_memory
	ENDC

	printf	"%n"
	header	<-------------------------------------------------------------------------------%n>

; Checks for space remaining

	; Memory full (warning)

	IFEQ	Zero_Page_free
	printf	"%01%31Warning: Zero Page full!%n%00"
	ENDC

	IFEQ	Work_RAM_free
	printf	"%01%31Warning: Work RAM full!%n%00"
	ENDC

	IFEQ	Extended_RAM_free
	printf	"%01%31Warning: Extended RAM full!%n%00"
	ENDC

	IFEQ	ZMario_RAM_free
	printf	"%01%31Warning: ZMARIO RAM full!%n%00"
	ENDC

	IFEQ	Mario_RAM_free
	printf	"%01%31Warning: MARIO RAM full!%n%00"
	ENDC

	IFEQ	Allcols_Lines_free
	printf	"%01%31Warning: ALLCOLS full!%n%00"
	ENDC

	; Memory exceeded (fail)
	IFLT	Zero_Page_free
	printf	"%01%31Error: Zero page space exceeded!%n%00"
	fail
	ENDC

	IFLT	Work_RAM_free
	printf	"%01%31Error: Work RAM space exceeded!%n%00"
	fail
	ENDC

	IFLT	Extended_RAM_free
	printf	"%01%31Error: Extended RAM space exceeded!%n%00"
	fail
	ENDC

	IFLT	ZMario_RAM_free
	printf	"%01%31Error: ZMARIO RAM space exceeded!%n%00"
	fail
	ENDC

	IFLT	Mario_RAM_free
	printf	"%01%31Error: MARIO RAM space exceeded!%n%00"
	fail
	ENDC

	IFLT	Allcols_Lines_free
	printf	"%01%31Error: ALLCOLS space exceeded! Try increasing maxcolscru.%n%00"
	fail
	ENDC


	ENDC

	gettime	endtime
totaltime	=	endtime-starttime

