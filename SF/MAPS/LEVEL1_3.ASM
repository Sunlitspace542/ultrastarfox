
level1_3
	initlevel	1_3i,whitefadeout,0
	mapjsr		cl_warpout

	IFNE		CONTEST

	INCMAP		event

	ELSEIF
	ENDC
	

;-----------------------------------------------------------------------------
; SPACE 

	mapjsr	map1_3a	


;-----------------------------------------------------------------------------
; SHIP1

	mapgoto	.start1
.again1
	setbg	1_3a
	maptexitwait	-100
	initbg
.start1

	mapjsr	map1_3a1	; ship1
	setbg	1_3b
	initbg
	mapjsr	map1_3b1	; tunnel
	mapif	chkstratdone1,.oks1
   	mapgoto	.again1
.oks1

;	setrestart

;-----------------------------------------------------------------------------
; SHIP2

.again2
	setbg	1_3a
	maptexitwait	-100
	initbg
.start2
	mapjsr	map1_3a2	; ship2
	setbg	1_3b
	initbg
	mapjsr	map1_3b2	; tunnel
	mapif	chkstratdone1,.oks2
   	mapgoto	.again2
.oks2

;--------------------------------------------------------
; big ship
.bigship
	setbg	1_3c
	maptexitwait	-100
	initbg

	mapjsr	map1_3c			; big ship

.washroom
	mapobj	0000,0070,-060,4000,bou_1,HARD180yr_ISTRAT
	mapobj	1000,-070,-060,4000,bou_1,HARD180yr_ISTRAT
	mapobj	0000,0070,-060,4000,bou_1,HARD180yr_ISTRAT
	mapobj	1000,-070,-060,4000,bou_1,HARD180yr_ISTRAT
	mapobj	0000,0070,-060,4000,bou_1,HARD180yr_ISTRAT
	mapobj	1000,-070,-060,4000,bou_1,HARD180yr_ISTRAT
	mapobj	0000,0070,-060,4000,bou_1,HARD180yr_ISTRAT
	mapobj	1000,-070,-060,4000,bou_1,HARD180yr_ISTRAT
	incmap	washent

	mapjsr	map1_3d			; washing machine room

.fin

	mapjsr	cl_ship1_3

	mapend	




