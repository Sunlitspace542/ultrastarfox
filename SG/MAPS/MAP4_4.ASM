map4_4
	mapobj	1000,0000,0000,1000,nullshape,kandobase_istrat
	mapwait	5000
	incmap	WASHENT
;	initlevel	2_6a,nofadenostage,mstarwipe_circle
	setfadedown	quick
	mapwaitfade
	setbg	2_6a
	initbg
	setfadeup	quick
	setrestart
	mapwait	2000
	mapobj	0000,-500,0000,2000,bro_2,rockhard_istrat ;   M     |     M   ;
	mapobj	1000,0500,0000,2000,bro_3,rockhard_istrat 
	mapobj	0000,-500,0000,2000,bro_4,rockhard_istrat ;   L     H     L   ;
	mapobj	0000,0500,0000,2000,bro_5,rockhard_istrat 
	mapobj	0500,-250,0000,2000,bro_6,hard180yr_istrat 	
	mapwait	3000

	incmap	trucker
	markboss	boss26
	mapwait	3000
	fadeoutbgm
	setbgm	6
;gate
	incmap	washent
	setfadedown	quick
	mapwaitfade
	setbg	3_5
	initbg
	setfadeup	quick
	setrestart
	mapwait	1000
	mapobj	5000,0000,-100,5000,item_7,item7_ISTRAT
	mapobj	2000,0000,-100,5000,gate_0,gate_ISTRAT
	mapobj	2000,0000,-100,5000,item_5,item5_ISTRAT
	pathobj	4000,3000,3000,1000,nullshape,e_gate,10,10
	mapwait	4000
	setbgm	bgm_boss1
	mapobj	0000,-100,-500,0000,boss_f_4,airship_istrat
	mapwaitboss
	markboss	boss37
	setbg	3_5
	initbg
	setrestart
	pathobj	0000,-400,-300,0,my_bird,my_bird,10,10
	mapwait	4000
;gate
	mapobj	2000,0000,-100,5000,gate_0,gate_ISTRAT
	pathobj	4000,3000,3000,1000,nullshape,e_gate,10,10
	mapwait	2000
	setbgm	5
	mapobj	0000,0000,0<<boss2_scale,4000,boss_2_2,boss2_Istrat
	mapwaitboss
	markboss	boss15
	setbg	3_6
	initbg
	setrestart
	mapplayermode	inspace

	mapwait	3000
;gate
	mapobj	2000,0000,-100,5000,gate_0,gate_ISTRAT
	pathobj	4000,3000,3000,1000,nullshape,e_gate,10,10
	mapwait	2000
	fadeoutbgm
	setbgm	5
	incmap	castanet
	mapwaitboss
	markboss	boss25

	setbg	3_6
	initbg
	setrestart
	pathobj	0000,-400,-300,0,my_bird,my_bird,10,10
	mapwait	4000
;gate
	mapobj	5000,0000,-100,5000,item_7,item7_ISTRAT
	mapobj	7000,0000,-100,5000,item_5,item5_ISTRAT
	mapobj	0000,0000,-100,5000,item_5,item5_ISTRAT
	mapobj	2000,0000,-100,5000,gate_0,gate_ISTRAT
	pathobj	4000,3000,3000,1000,nullshape,e_gate,10,10
	mapwait	2000
	start_65816
	jsl	clearmap_l
	lda	playertwoactivated
	beq	.donewithp2
	jsl	doascene
	a16
	lda	#400
	sta	viewdist
	sta	outviewdist			;the fix is still here...
	sta	outdist
	a8
.donewithp2
	end_65816
	setbgm	bgm_boss1
	mapobj	0000,0000,2000,2500,boss_f_3,bossf_Istrat
	mapwaitboss
	markboss	boss36
	mapif	chkeasteregg2,.nochange
	mapwait	1000
	mapjsr	level4_5
.nochange
	maprts

