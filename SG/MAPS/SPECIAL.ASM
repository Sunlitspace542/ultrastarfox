specialmap


;	mapmother	8000,0000,0500,2000,mother1,mother1_istrat,map_mine2
;	mapwait	2000
;
;
;	maprem		mother1
;
;	map_setbarshape	solid
;
;
;	map_SBtype1		0,0,-2,0	   ;S
;	map_SBtypeb		0,-2,-1,0
;	map_SBtype1		0,0,0,0
;	map_SBtypeb		0,2,1,0
;	map_SBtype1		20,0,2,0
;
;	map_SBtype4		20,0,-1,0	   ;T
;
;	map_SBtype1		0,0,0,0
;	map_SBtype0		0,2,1,0,3,0
;	map_SBtype0		0,-2,1,0,5,0
;	map_SBtype18	0,1,-2,0,3,0   ;A
;	map_SBtype18	20,-1,-2,0,5,0
;
;	map_SBtype19	0,2,1,0,7,0   ;R
;	map_SBtypeb		0,2,-1,0
;	map_SBtype1		0,0,0,0
;	map_SBtype1		0,0,-2,0
;	map_SBtype0		40,-2,0,0
;
;	map_SBtype1		0,0,-2,0  ;F
;	map_SBtypec		0,-1,0,0
;	map_SBtype0		20,-2,0,0
;	map_SBtype0		0,-2,0,0  ;O
;	map_SBtype0		0,2,0,0
;	map_SBtype1		0,0,-2,0
;	map_SBtype1		20,0,2,0
;;			w,x,y,z,init(0-7),speed
;	map_SBtype18	0,0,0,0,1,0   ;X
;	map_SBtype18	0,0,0,0,3,0
;
;	mapwait	4000
;------------------------------------------
	mapwait	1000
	start_65816
	lda	bgmspeed
	beq	.nochange3
	cmp	#1
	beq	.slow3
	cmp	#2
	beq	.fast3
.slow3
	startbgm	$f4
	bra	.nochange3
.fast3
	startbgm	$f5
.nochange3
	end_65816
	mapwait	4000

	pathobj	5000,0000,0000,3000,paper_1,paper_1b,10,10
	pathobj	5000,0300,-100,3000,paper_1,paper_1b,10,10
	pathobj	6000,-200,100,3000,paper_1,paper_1b,10,10
	pathobj	6000,0200,-100,4000,paper_1,paper_1b,10,10
	pathobj	10000,0100,-400,1500,paper_1,paper_1,10,10
	mapobj	8000,0000,0000,4000,pole_0,pole0_istrat

	pathobj	5000,-200,0200,3000,paper_1,paper_1b,10,10
	pathobj	5000,0100,-100,3000,paper_1,paper_1b,10,10
	pathobj	5000,-200,400,1500,paper_1,paper_1,10,10
	pathobj	6000,-400,150,3000,paper_3,paper_3,10,10
	mapobj	6000,000,-200,4000,pole_0,pole0_istrat
	mapobj	6000,-100,100,4000,pole_0,pole0_istrat
	pathobj	6000,0400,0000,3000,paper_1,paper_1b,10,10
	pathobj	6000,0000,-400,1500,paper_1,paper_1,10,10
	pathobj	8000,0200,200,2000,paper_3,paper_3,10,10
	pathobj	1000,0000,0100,3000,paper_1,paper_1b,10,10
	pathobj	1000,-300,200,3000,paper_1,paper_1b,10,10
	pathobj	5000,-100,-400,1000,paper_1,paper_1,10,10
	pathobj	4000,0000,-400,1500,paper_1,paper_1,10,10

	pathobj	2000,-300,0000,3000,paper_1,paper_1b,10,10
	pathobj	2000,-300,100,3000,paper_1,paper_1b,10,10

	pathobj	05000,-200,200,4000,paper_3,paper_3,10,10
	pathobj	03000,000,200,4000,paper_3,paper_3,10,10
	pathobj	10000,200,200,4000,paper_3,paper_3,10,10
	pathobj	5000,0300,100,3000,paper_1,paper_1b,10,10
	pathobj	6000,-200,100,3000,paper_1,paper_1b,10,10
	pathobj	10000,0200,100,4000,paper_1,paper_1b,10,10
;------------------------------------------

	fadeoutbgm
	setbgm	5

	pathobj	0000,3000,0000,4200,slot_0,slotmachine,10,10
	mapwaitboss 7

endofspecialmap

	start_65816
	a8
	lda	pshipflags
	and	#~psf_nofire
	sta	pshipflags

	lda		pstratflags
	and		#~pstf_notdie
	sta		pstratflags
	end_65816

	mapwait	2000

	setvar.w hposjmp,rotate_hof


;	mapjsr	cutcreds

;	mapwait	6000

.ll2	;mapobj	000,972,-969,1000,font_t2,theend_t_istrat
;	mapobj	000,-1120,1377,1000,font_h2,theend_h_istrat
;	mapobj	000,-1019,-1530,1000,font_e2,theend_e_istrat
;	mapobj	000,1070,-1326,1000,font_e3,theend_e2_istrat
;	mapobj	000,1550+29,1323+54,1000,font_n2,theend_n_istrat
;	mapobj	000,-1050+129,1428,1000,font_d2,theend_d_istrat
;.ll	mapif	theenddead,.cont
;	mapgoto	.ll
;.cont
	mapwait	2500
	maprts
	mapcode_jsl	clearmap_l
	setvar.b	numendok,0
	mapwait	1000
	mapgoto	.ll2
	maprts

