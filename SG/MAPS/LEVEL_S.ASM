
level_special
	initlevel	special,0
	mapwait		100
	setvar		dospacesc,2
	setvar.W	bg2Yscroll,-64
	mapjsr		specialmap
	mapjsr	cl_warp
	mapend	4

