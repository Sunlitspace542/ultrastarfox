specialmap
	mapwait	5000

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
	sta.l m_meters
	lda	pshipflags
	and	#~psf_nofire
	sta	pshipflags

	lda		pstratflags
	and		#~pstf_notdie
	sta		pstratflags
	end_65816

	mapwait	2000

	setvar.w hposjmp,rotate_hof


	mapjsr	cutcreds

	mapwait	6000

.ll2	mapobj	000,972,-969,1000,font_t2,theend_t_istrat
	mapobj	000,-1120,1377,1000,font_h2,theend_h_istrat
	mapobj	000,-1019,-1530,1000,font_e2,theend_e_istrat
	mapobj	000,1070,-1326,1000,font_e3,theend_e2_istrat
	mapobj	000,1550+29,1323+54,1000,font_n2,theend_n_istrat
	mapobj	000,-1050+129,1428,1000,font_d2,theend_d_istrat
.ll	mapif	theenddead,.cont
	mapgoto	.ll
.cont
	mapwait	2500
	mapcode_jsl	clearmap_l
	start_65816
	stz		numplasers
	end_65816
	setvar.b	numendok,0
	mapwait	1000
	mapgoto	.ll2
	maprts

