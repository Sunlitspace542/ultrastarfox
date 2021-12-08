	zalc	irqtoggle,1

;	alc	tunnelscroll,1
	alc	planetdma,1
	alc	tempchildnum,1
	alc	singlestep,1
	alc	sprouthead,2
	alc	sproutbody,2
	alc	sprouttail,2
	alc	sproutiHP,1
	alc	sproutstrat,3
	alc	blinkcol,2
	alc	mapbank,1
	alc	maprestartbank,1
	alc	maprestartbanktemp,1
	alc	newmap,3
	alc	friends_sound,1
	alc	friends_meter,1
	alc	exitintro,1
	alc	currentlevel,1
	xalc	playerscore,2
	xalc	playerscoretemp,2
	xalc	maprestartjsrptr,2
	xalc	maprestartnumjsr,2
	xalc	maprestartjsrstk,3*15
	xalc	maprestartaddrs,2*4
	xalc	maprestartloops,2*4
	xalc	maprestartnumloops,2

heapsize	equ	20*k
	xalc	xheap,heapsize
heap	equ	xheap&WM

	xalc	xfmtemp1,2
	xalc	xfmtemp2,2
	xalc	xfmtemp3,2
	xalc	xfreespare,2

fmtemp1	equ	xfmtemp1&WM
fmtemp2	equ	xfmtemp2&WM
fmtemp3	equ	xfmtemp3&WM
freespare	equ	xfreespare&WM

	xalc	xstackdata,4

stackdata	equ	xstackdata&WM

	xalc	xpathptr,2

pathptr	equ	xpathptr&WM

	xalc	xpifnot,1
	xalc	oncewipe,1

	xalc	numbuff,8

pifnot	=	xpifnot&WM

	xalc	gbyte1,1
	xalc	gbyte2,1
	xalc	gbyte3,1
	xalc	gword1,1
	xalc	gword2,1
	xalc	gword3,1

	xalc	skillfly,1
	xalc	pepperfade,1
	xalc	pepperchars,1
	xalc	peppermsg,1
	xalc	bosshhitcount,1


	xalc	slot1_hold,1
	xalc	slot2_hold,1
	xalc	slot3_hold,1

	xalc	slot1_spin,1
	xalc	slot2_spin,1
	xalc	slot3_spin,1

	xalc	slot1_pos,1
	xalc	slot2_pos,1
	xalc	slot3_pos,1

	xalc	androssposs,1

	xalc	becomeobj,2
	xalc	becomepath,2
	xalc	becomelastobj,2
	xalc	nebula_on,2
	xalc	lastselected,1
	xalc	cesminute,1
	xalc	cessecond,1
	xalc	cessecond10,1
	xalc	cestimer,1
	xalc	cestimer2,1





