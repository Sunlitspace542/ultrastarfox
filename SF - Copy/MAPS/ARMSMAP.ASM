armsmap
; arm test
	mapobj	0000,0000,-80,2000,flingboss,flingboss_istrat
	maprts
	IFEQ	1
.armsrace	mapwait	200
	mapgoto	.armsrace
.cont
	setbg	1_3b
	waitsetbg
	initbg
	mapmother	0000,0000,-100,1000,mother1,mother1_istrat,map_lines
	mapobj		0000,0000,-100,2000,largeplasma,largeplasma_istrat
	mapobj		0000,-100,-100,3000,largeplasma,largeplasma_istrat
	mapobj		0500,0100,-150,4000,largeplasma,largeplasma_istrat
	mapmother	0000,0000,-100,4000,mother1,mother1_istrat,map_plasmas

	mapwait	10000
	maprem	mother1
	maprem	mother1

	mapjsr	ltunnelexit
	setbg	1_5
	initbg
	mapobj	8000,0000,0000,tlen,flingboss,deadflingboss_istrat
	maprts
	ENDC

