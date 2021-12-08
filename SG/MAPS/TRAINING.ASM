trainingmap	initlevel	training,mstarwipe_circle
	setvar.n	prttraining,1			;no messages
;-------------------------------------------------------------------------------
		mapwait	2000
	start_65816
	lda	bgmspeed
	beq	.nochange333
	cmp	#1
	beq	.slow333
	cmp	#2
	beq	.fast333
.slow333
	startbgm	$f4
	bra	.nochange333
.fast333
	startbgm	$f5
.nochange333
	end_65816
;		mapwait	1000
;*************************      MSG TEST   *****************************
;	mapwait	3000
;
;freddytest	=	1
;	REPT	87
;
;;	start_65816
;;	lda	#-1
;;	sta	friends_meter
;;	end_65816
;;
;	run	"%tmapmsg%t",freddytest
;	mapwait	1000
;freddytest	=	freddytest+1
;
;	ENDR
;
;	mapwait	1000
;	mapmsg	117
;	mapwait	1000
;	mapmsg	118
;	mapwait	1000
;	mapmsg	119
;	mapwait	1000
;	mapmsg	120
;	mapwait	1000
;	mapmsg	121
;	mapwait	1000
;	mapmsg	122
;	mapwait	1000
;	mapmsg	123
;	mapwait	1000
;	mapmsg	124
;	mapwait	1000
;	mapmsg	125
;	mapwait	1000
;	mapmsg	126
;	mapwait	1000
;	mapmsg	127
;	mapwait	1000
;	mapmsg	128
;	mapwait	1000
;	mapmsg	129
;	mapwait	1000
;	mapmsg	130
;	mapwait	1000
;	mapmsg	131
;	mapwait	1000
;	mapmsg	132
;	mapwait	1000
;	mapmsg	133
;	mapwait	1000
;	mapmsg	134
;	mapwait	1000
;	mapmsg	135
;	mapwait	1000
;	mapmsg	136
;	mapwait	1000
;	mapmsg	137
;	mapwait	1000
;	mapmsg	138
;	mapwait	1000
;	mapmsg	139
;	mapwait	1000
;	mapmsg	140
;	mapwait	1000
;	mapmsg	141
;	mapwait	1000
;	mapmsg	142
;	mapwait	1000
;;.et0
;	mapwait	4000
;;	mapgoto	.et0
;***********************************************************************
	pathobj	0000,0000,0000,3000,zaco_5,trn_ck,10,10
	mapobj	0000,1200,0500,5000,big_meteor,big_meteor_istrat
	mapobj	2000,-1200,-500,5000,big_meteor,big_meteor_istrat
;------
;	mapobj	0000,000,0000,3000,item_6,item6_istrat
;------
	mapobj	0000,1200,0250,5000,big_meteor,big_meteor_istrat
	mapobj	2000,-1200,-350,5000,big_meteor,big_meteor_istrat
	mapobj	0000,1200,0400,5000,big_meteor,big_meteor_istrat
	mapobj	2000,-1200,-200,5000,big_meteor,big_meteor_istrat
	mapobj	0000,1000,0000,5000,asteroid2,break_meteort_istrat
	mapobj	2000,-1000,0000,5000,asteroid2,break_meteort_istrat
.et
;	skillfly_init
;	skillfly_set 0000,-100,5000,70
	pathobj	0000,0000,-100,5000,training,trn_ring,10,10          ; 1st ring
	mapobj	0000,1200,0000,5000,asteroid2,break_meteort_istrat
	mapobj	2000,-1200,0000,5000,asteroid2,break_meteort_istrat
	mapobj	0000,000,0000,3000,item_7,item7_istrat
;	skillfly_set 0200,-150,5000,70
	pathobj	0000,0200,-150,5000,training,trn_ring2,10,10         ; 2nd ring
	mapobj	0000,1200,0000,5000,big_meteor,big_meteor_istrat
	mapobj	2000,-1200,0000,5000,big_meteor,big_meteor_istrat
;	skillfly_set 0000,-200,5000,70
	mapobj	0000,000,0000,3000,item_4,item4_istrat
	pathobj	0000,0000,-200,5000,training,trn_ring,10,10          ; 3rd ring
	mapobj	0000,1200,0000,5000,big_meteor,big_meteor_istrat
	mapobj	2000,-1200,0000,5000,big_meteor,big_meteor_istrat
;	skillfly_set -200,-150,5000,70
	pathobj	0000,-200,-150,5000,training,trn_ring2,10,10         ; 4th ring
	mapobj	0000,1000,0000,5000,asteroid2,break_meteort_istrat
	mapobj	2000,-1000,0000,5000,asteroid2,break_meteort_istrat
;	skillfly_set 0000,-100,5000,70
	pathobj	0000,0000,-100,5000,training,trn_ring,10,10          ; 5th ring
	mapobj	0000,1200,0000,5000,big_meteor,big_meteor_istrat
	mapobj	2000,-1200,-200,5000,big_meteor,big_meteor_istrat
;	skillfly_set 200,-200,5000,70
	pathobj	0000,0200,-100,5000,training,trn_ring2,10,10         ; 6th ring
	mapobj	0000,1200,0000,5000,asteroid1,break_meteort_istrat
	mapobj	1200,-1200,0000,5000,big_meteor,big_meteor_istrat
;	skillfly_set -330,-100,5000,70
	pathobj	0000,-130,-100,5000,training,trn_ring,10,10          ; 7th ring
	mapobj	0000,1200,0000,5000,big_meteor,big_meteor_istrat
	mapobj	2000,-1200,0000,5000,big_meteor,big_meteor_istrat
;	skillfly_set 00,-100,5000,70
	pathobj	1000,000,-100,5000,training,trn_ring2,10,10          ; 8th ring
	mapobj	0800,0000,-100,5000,item_5,item5_istrat
;	skillfly_set 00,-100,5000,70
	pathobj	1000,0000,-100,5000,training,trn_ring,10,10          ; 9th ring
;	skillfly_set 0100,-100,5000,70
	pathobj	1000,0100,-100,5000,training,trn_ring2,10,10         ; 10th ring
;	skillfly_set -200,-300,5000,70
	pathobj	0800,-150,-150,5000,training,trn_ring,10,10          ; 11th ring
;	skillfly_set -100,-100,5000,70
	pathobj	0800,-100,-100,5000,training,trn_ring2,10,10         ; 12th ring
;	skillfly_set 0000,-300,5000,70
	pathobj	0800,0000,-150,5000,training,trn_ring,10,10          ; 13th ring
;	skillfly_set 0100,0000,5000,70
	pathobj	2000,0100,0000,5000,training,trn_ring2,10,10         ; 14th ring
	mapobj	0300,-200,0000,5000,big_meteor,break_meteort_istrat
;	skillfly_set 0000,-100,5000,70
	pathobj	8000,0000,-100,5000,training,trn_ring,10,10          ; 15th ring
	eguchifly_goto .et

;	pathobj	0000,0000,-570,-100,friendship_4,hentai_fal,10,10
;	pathobj	0000,100,-470,-100,friendship_4,hentai_fro,10,10
;	pathobj	1000,-100,-470,-100,friendship_4,hentai_rab,10,10

;	mapmsg	123
.etlop
	mapobj	0000,1200,0050,5000,big_meteor,big_meteor_istrat
	mapobj	4200,-1200,-100,5000,big_meteor,big_meteor_istrat
	mapobj	0000,1200,0100,5000,asteroid2,break_meteort_istrat
	mapobj	4200,-1200,-150,5000,asteroid2,break_meteort_istrat

	maploop	.etlop,4
	mapobj	0000,-200,-70,5000,pilon,groundpilon_ISTRAT
	mapobj	0000,0000,-70,5000,pilon,groundpilon_ISTRAT
	mapobj	6000,0200,-70,5000,pilon,groundpilon_ISTRAT
	mapobj	0000,0000,-70,5000,pilon,groundpilon_ISTRAT
	mapobj	0000,0000,-140,5000,pilon,groundpilon_ISTRAT
	mapobj	8000,0000,-210,5000,pilon,groundpilon_ISTRAT

	mapgoto	.et



