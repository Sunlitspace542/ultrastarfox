; TRAINING: Training Mode
trainingmap	initlevel	training,mstarwipe_circle
	setvar.n	prttraining,1
;-------------------------------------------------------------------------------
		mapwait	2000
	
	IFNE	messagetest
;*************************      MSG TEST   *****************************
	mapwait	3000

	start_65816
	lda	#-1
	sta	friends_meter
	end_65816

trnmapmsgcnt = 1

.trnmsgtest

	mapwait	1000

; loops through every single message in the message file

	REPT totalmsgs+1 ; number of total messages in the message file
	mapwait	1000
	mapmsg	trnmapmsgcnt
trnmapmsgcnt = trnmapmsgcnt+1
	ENDR

	mapgoto	.trnmsgtest

	ELSEIF
;***********************************************************************
	pathobj	0000,0000,0000,3000,zaco_5,trn_ck,10,10
	mapobj	0000,1200,0000,5000,BU_8,HARD180YR_ISTRAT
	mapobj	2000,-1200,0000,5000,BU_1,HARD180YR_ISTRAT
;------
	mapobj	0000,000,0500,5000,pilon,groundpilon_ISTRAT
;------
	mapobj	0000,1200,0000,5000,BU_0,HARD180YR_ISTRAT
	mapobj	2000,-1200,0000,5000,BU_2,HARD180YR_ISTRAT
	mapobj	0000,1200,0000,5000,BU_1,HARD180YR_ISTRAT
	mapobj	2000,-1200,0000,5000,BU_1,HARD180YR_ISTRAT
	mapobj	0000,1000,0000,5000,TOWER_2,TOWER0_ISTRAT
	mapobj	2000,-1000,0000,5000,TOWER_2,TOWER0_ISTRAT
.et
;	skillfly_init
;	skillfly_set 0000,-100,5000,70
	pathobj	0000,0000,-100,5000,training,trn_ring,10,10
	mapobj	0000,1200,0000,5000,BU_8,HARD180YR_ISTRAT
	mapobj	2000,-1200,0000,5000,BU_1,HARD180YR_ISTRAT
;	skillfly_set 0200,-150,5000,70
	pathobj	0000,0200,-150,5000,training,trn_ring2,10,10
	mapobj	0000,1200,0000,5000,BU_0,HARD180YR_ISTRAT
	mapobj	2000,-1200,0000,5000,BU_2,HARD180YR_ISTRAT
;	skillfly_set 0000,-200,5000,70
	pathobj	0000,0000,-200,5000,training,trn_ring,10,10
	mapobj	0000,1200,0000,5000,BU_1,HARD180YR_ISTRAT
	mapobj	2000,-1200,0000,5000,BU_1,HARD180YR_ISTRAT
;	skillfly_set -200,-150,5000,70
	pathobj	0000,-200,-150,5000,training,trn_ring2,10,10
	mapobj	0000,1000,0000,5000,TOWER_2,TOWER0_ISTRAT
	mapobj	2000,-1000,0000,5000,TOWER_2,TOWER0_ISTRAT

;	skillfly_set 0000,-100,5000,70
	pathobj	0000,0000,-100,5000,training,trn_ring,10,10
	mapobj	0000,1200,0000,5000,pillar3,HARD180YR_ISTRAT
	mapobj	2000,-1200,0000,5000,pillar3,HARD180YR_ISTRAT
;	skillfly_set 200,-200,5000,70
	pathobj	0000,0200,-200,5000,training,trn_ring2,10,10
	mapobj	0000,1200,0000,5000,robot_0,HARD180YR_ISTRAT
	mapobj	1200,-1200,0000,5000,robot_0,HARD180YR_ISTRAT
;	skillfly_set -330,-100,5000,70
	pathobj	0000,-330,-100,5000,training,trn_ring,10,10
	mapobj	0000,1200,0000,5000,BU_7,HARD180YR_ISTRAT
	mapobj	2000,-1200,0000,5000,BU_7,HARD180YR_ISTRAT
;	skillfly_set 00,-100,5000,70
	pathobj	1000,000,-100,5000,training,trn_ring2,10,10
	mapobj	0800,0000,0000,5000,BU_7,HARD180YR_ISTRAT
;	skillfly_set 00,-100,5000,70
	pathobj	1000,0000,-100,5000,training,trn_ring,10,10
;	skillfly_set 0100,-100,5000,70
	pathobj	1000,0100,-100,5000,training,trn_ring2,10,10
;	skillfly_set -200,-300,5000,70
	pathobj	0800,-200,-300,5000,training,trn_ring,10,10
;	skillfly_set -100,-100,5000,70
	pathobj	0800,-100,-100,5000,training,trn_ring2,10,10
;	skillfly_set 0000,-300,5000,70
	pathobj	0800,0000,-300,5000,training,trn_ring,10,10
;	skillfly_set 0000,-100,5000,70
	pathobj	2000,0000,-100,5000,training,trn_ring2,10,10
	mapobj	0300,0000,0000,5000,base_1,base_1_ISTRAT
;	skillfly_set 0000,-100,5000,70
	pathobj	8000,0000,-100,5000,training,trn_ring,10,10
	eguchifly_goto .et

	pathobj	0000,0000,-570,-100,friendship_4,hentai_fal,10,10
	pathobj	0000,100,-470,-100,friendship_4,hentai_fro,10,10
	pathobj	1000,-100,-470,-100,friendship_4,hentai_rab,10,10

	mapmsg	123
.etlop
	mapobj	0000,1200,0000,5000,BU_8,HARD180YR_ISTRAT
	mapobj	4200,-1200,0000,5000,BU_1,HARD180YR_ISTRAT
	mapobj	0000,1200,0000,5000,BU_7,HARD180YR_ISTRAT
	mapobj	4200,-1200,0000,5000,BU_7,HARD180YR_ISTRAT

	maploop	.etlop,4
	mapobj	0000,-200,-70,5000,pilon,groundpilon_ISTRAT
	mapobj	0000,0000,-70,5000,pilon,groundpilon_ISTRAT
	mapobj	6000,0200,-70,5000,pilon,groundpilon_ISTRAT
	mapobj	0000,0000,-70,5000,pilon,groundpilon_ISTRAT
	mapobj	0000,0000,-140,5000,pilon,groundpilon_ISTRAT
	mapobj	8000,0000,-210,5000,pilon,groundpilon_ISTRAT

	mapgoto	.et
	ENDC



