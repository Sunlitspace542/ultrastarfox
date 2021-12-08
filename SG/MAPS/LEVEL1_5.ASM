level1_5
	mapif	chkeasteregg1,.finn
	initlevel	hole,mstarwipe_circle
;	initlevel	space_credits,mstarwipe_circle
	mapgoto	.nofinn
.finn
	initlevel	1_5,mstarwipe_circle	
.nofinn
	mapwait		100
	setvar		dospacesc,1
	setvar.W	bg2Yscroll,172

	mapjsr	map1_5

;	mapwait	4000
;	setvar.W	bg2Yscroll,172+60

	mapjsr	cl_dive

	mapend__not	level1_6

