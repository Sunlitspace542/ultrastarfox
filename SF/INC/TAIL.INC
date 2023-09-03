	IFEQ	day-7
	IFEQ	month-12
	printf	"%nHappy birthday UltraStarFox!%n"
	ENDC
	ENDC

	IFEQ	day-26
	IFEQ	month-8
	printf	"%nHappy birthday Kando!%n"
	ENDC
	ENDC

	IFEQ	day-5
	IFEQ	month-4
	printf	"%nHappy birthday Sunlit!%n"
	ENDC
	ENDC

	IFEQ	day-22
	IFEQ	month-9
	printf	"%nHappy birthday Monika!%n"
	ENDC
	ENDC

	IFNE	RAMLEFT

Zero_Page_free	=	$100-zmempt
Work_RAM_free	=	$2000-wmempt
Extended_RAM_free	=	$7f0000-xmempt
Mario_RAM_free	=	($700000+bitmap1)-mmempt
ZMario_RAM_free	=	$700200-zmmempt

	header	<------------------------------- MEMORY USAGE ---------------------------------->
	report	<Zero Page Free>,Zero_Page_free,$100
	report	<Work Ram Free>,Work_RAM_free,($2000-$300)
	report	<Extended Ram Free>,Extended_RAM_free,($7f0000-$7e2000)
	IFNE	zmmempt-$700000
	report	<ZMario Ram Free>,ZMario_RAM_free,($200)
	ENDC
	IFNE	mmempt-$700200
	report	<Mario Ram Free>,Mario_RAM_free,(bitmap1-$200)
	ENDC
	printf	"%n"
	header	<-------------------------------------------------------------------------------%n>

	ENDC


	gettime	endtime
totaltime	=	endtime-starttime

	FOPEN	lastasm.tmp
	time	currenttime
	printf	(currenttime>>24)&255,":",(currenttime>>16&255),"%n"
	FCLOSE	!

