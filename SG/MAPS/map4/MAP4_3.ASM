map4_3
	
	mapobj	0000,-600,0000,0800,RO_4,rockhard_ISTRAT    ; L      R  ;
	mapobj	0000,0600,0000,0800,RO_5,rockhard_istrat    ;           ;

	mapobj	0000,-500,0000,1800,RO_4,rockhard_ISTRAT    ; L      R  ;
	mapobj	0000,0500,0000,1800,RO_5,rockhard_istrat    ;           ;
	mapobj	0000,-400,0000,2800,RO_4,rockhard_ISTRAT    ; L      R  ;
	mapobj	0000,0400,0000,2800,RO_5,rockhard_istrat    ;           ;

	mapobj	0000,-400,0000,3800,RO_4,rockhard_ISTRAT    ;  L    R   ;
	mapobj	0000,0550,0000,3800,RO_1,rockhard_ISTRAT    ;           ;
	mapobj	0000,-400,0000,4800,RO_0,rockhard_ISTRAT    ;  L    R   ;
	mapobj	0000,0400,0000,4800,RO_5,rockhard_ISTRAT    ;           ;
	mapobj	0000,-900,0000,5800,RO_2,rockhard_ISTRAT    ;L     R    ;
	mapwait	3000
	fadeoutbgm
	setbgm	5
	mapobj	0000,0000,1000,3500,boss_b_1,bossb_Istrat
	mapwaitboss
	markboss	boss35
	mapwait	1000
	setbg	3_3a
	initbg
	setrestart
	mapwait 2500
;gate
	mapobj	2000,0000,-100,5000,gate_0,gate_ISTRAT
	pathobj	4000,3000,3000,1000,nullshape,e_gate,10,10
	mapobj	5000,0000,-100,5000,item_7,item7_ISTRAT
       	mapobj	0000,0000,-100,4000,item_5,item5_istrat
		mapobj	0000,0000,-100,4000,item_5,item5_istrat
		mapobj	0000,0000,-100,4000,item_5,item5_istrat
       	mapobj	0000,-1000,0000,5000,rpillar3,flypillars_ISTRAT
       	mapobj	0000,1200,0000,6000,rpillar3,flypillars_ISTRAT
       	mapobj	0000,-900,0000,6000,rpillar3,flypillars_ISTRAT
;flying_pillars
	mapobj	0000,0000,0000,3000,rpillar3,flypillars_ISTRAT
       	mapobj	0000,0200,0000,3000,rpillar3,flypillars_ISTRAT
       	mapobj	0400,-200,0000,3000,rpillar3,flypillars_ISTRAT
       	mapobj	0000,0500,0000,3000,rpillar3,flypillars_ISTRAT
       	mapobj	0400,-500,0000,3000,rpillar3,flypillars_ISTRAT
       	mapobj	0000,0350,0000,3000,rpillar3,flypillars_ISTRAT
       	mapobj	0400,-350,0000,3000,rpillar3,flypillars_ISTRAT
       	mapobj	0000,0150,0000,3000,rpillar3,flypillars_ISTRAT
       	mapobj	0400,-150,0000,3000,rpillar3,flypillars_ISTRAT
       	mapobj	0000,0400,0000,3000,rpillar3,flypillars_ISTRAT
       	mapobj	2000,-400,0000,3000,rpillar3,flypillars_ISTRAT
	fadeoutbgm
	setbgm	5
	mapwait	1000
; boss B robot test
	mapobj	0000,0000,-1000,4000,boss_b_1,bossBrob_Istrat
	mapwaitboss
	markboss	boss16
	mapwait	1000
	pathobj	0000,-400,-300,0,my_bird,my_bird,10,10
	mapwait	4000
	setrestart
	setbg	3_3a
	initbg
	mapwait	3000
	mapfadetosea
.fun1
	mapwait	0600
	mapplayermode	onwater
	mapwait	1000
;gate
	mapobj	2000,0000,-100,5000,gate_0,gate_ISTRAT
       	mapobj	0000,0000,-100,4000,item_5,item5_istrat
	mapobj	0000,0000,-100,4000,item_5,item5_istrat
	pathobj	4000,3000,3000,1000,nullshape,e_gate,10,10
	mapobj	5000,0000,-100,5000,item_7,item7_ISTRAT
	mapwait	4000
	setbgm	bgm_boss1
	mapobj	0000,0000,-80,2000,marioh,flingboss_istrat
	mapwaitboss
	markboss	boss24
	setrestart
	mapif	chkeasteregg2,.nochange
	mapwait	1000
;	checkcockpit
	mapwait	1000
	start_65816
	a16
	lda	#300
	sta	plrotx
	a8
	end_65816
	mapwait	500
	mapjsr	level4_4
.nochange
	maprts

