level3_6
	initlevel	3_6,mstarwipe_circle

	mapjsr	map3_6

;----------------------------------------------------
;	start_65816
;
;	lda		pshipflags
;	and		#psf2_turn180
;	bne		.turn
;	switch		.nturn
;.turn
;	end_65816
;	mapplayermode	turn180
;
;.nturn
;
;
;----------------------------------------------------

	
;	mapwait	2000
	
	mapjsr	cl_dive
	mapend__not	level3_7




