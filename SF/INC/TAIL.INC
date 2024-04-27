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

	chkmemoryfull	Zero_Page_free,<Zero Page>,<>
	chkmemoryfull	Work_RAM_free,<Work RAM>,<>
	chkmemoryfull	Extended_RAM_free,<Extended RAM>,<>
	chkmemoryfull	ZMario_RAM_free,<ZMARIO RAM>,<>
	chkmemoryfull	Mario_RAM_free,<MARIO RAM>,<>
	chkmemoryfull	Allcols_Lines_free,<ALLCOLS>,<Try increasing maxcolscru.>

	; Memory exceeded (fail)

	chkmemoryexceeded	Zero_Page_free,<Zero Page>,<>
	chkmemoryexceeded	Work_RAM_free,<Work RAM>,<>
	chkmemoryexceeded	Extended_RAM_free,<Extended RAM>,<>
	chkmemoryexceeded	ZMario_RAM_free,<ZMARIO RAM>,<>
	chkmemoryexceeded	Mario_RAM_free,<MARIO RAM>,<>
	chkmemoryexceeded	Allcols_Lines_free,<ALLCOLS>,<Try increasing maxcolscru.>

	ENDC	;ramleft

	gettime	endtime
totaltime	=	endtime-starttime

