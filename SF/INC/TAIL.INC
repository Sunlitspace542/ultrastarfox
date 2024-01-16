	IFNE	RAMLEFT

Zero_Page_free	=	$100-zmempt
Work_RAM_free	=	$2000-wmempt
Extended_RAM_free	=	$7f0000-xmempt
Mario_RAM_free	=	($700000+bitmap1)-mmempt
ZMario_RAM_free	=	$700200-zmmempt

	header	<------------------------------- MEMORY USAGE ---------------------------------->
	report	<Zero Page Free>,Zero_Page_free,$100
	report	<Work RAM Free>,Work_RAM_free,($2000-$300)
	report	<Extended RAM Free>,Extended_RAM_free,($7f0000-$7e2000)
	IFNE	zmmempt-$700000
	report	<ZMario RAM Free>,ZMario_RAM_free,($200)
	ENDC
	IFNE	mmempt-$700200
	report	<Mario RAM Free>,Mario_RAM_free,(bitmap1-$200)
	ENDC
	;! the current SASM heap size can differ from what is initially printed, this may help with diagnosing assembly issues
	IFD	_SASM
	printf	"      SASM RAM Free        = %kk"
	ENDC

	IFD	_ARGSFX
	printf	"      ARGSFX RAM Free      = %kk"
	ENDC

	printf	"%n"
	header	<-------------------------------------------------------------------------------%n>

	ENDC

	gettime	endtime
totaltime	=	endtime-starttime

