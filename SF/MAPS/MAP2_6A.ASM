; 2-6: Venom 2 Highway Part A
map2_6a
;dash_car
;put on brake_car


	mapobj	0800,-100,-060,1800,bou_1b,HARD180yr_ISTRAT
	cspecial	0000,10,-040,3000,car_1,truck1_ISTRAT
	mapobj	0800,-100,-060,2600,WALL_4,HARD180yr_ISTRAT
	mapobj	0000,-200,-060,4000,WALL_4,HARD180yr_ISTRAT
	mapobj	0800,-100,-060,3200,WALL_4,HARD180yr_ISTRAT
	special	0000,-200,-040,3000,car_1,truck1_ISTRAT
	mapobj	0800,-100,-060,4000,bou_1b,HARD180yr_ISTRAT
	mapobj	0800,-100,-060,4000,WALL_4,HARD180yr_ISTRAT

	skillfly_init
	skillfly_set -150,-60,4000
	mapobj	0000,-200,-060,4000,WALL_4,HARD180yr_ISTRAT
	mapobj	0800,-100,-060,4000,WALL_4,HARD180yr_ISTRAT

	mapobj	0000,0080,-060,4000,bou_1b,HARD180yr_ISTRAT
	cspecial	1600,20,-100,3500,car_0,aircar4_Istrat	;go away
	mapobj	0800,-100,-060,4000,bou_1b,HARD180yr_ISTRAT
	mapobj	0800,-100,-060,4000,WALL_4,HARD180yr_ISTRAT
	mapobj	0000,0080,-060,4000,bou_1b,HARD180yr_ISTRAT
	cspecial	1600,-020,-40,3500,car_0,aircar4_Istrat	;go away

	skillfly_set -150,-60,4000
	mapobj	0000,-200,-060,4000,WALL_4,HARD180yr_ISTRAT
	mapobj	0800,-100,-060,4000,WALL_4,HARD180yr_ISTRAT
	mapobj	0000,0080,-060,4000,bou_1b,HARD180yr_ISTRAT
	cspecial	1600,-1000,60,3500,car_0,aircar4_Istrat	;go away
	mapobj	0000,0080,-060,4000,bou_1b,HARD180yr_ISTRAT
	cspecial	0000,-1000,60,2000,car_0,aircar1_Istrat	;dash
	mapobj	0800,-100,-060,4000,wall_4,HARD180yr_ISTRAT
	skillfly_set -150,-60,4000
	mapobj	0000,-200,-060,4000,WALL_4,HARD180yr_ISTRAT
	mapobj	0800,-100,-060,4000,WALL_4,HARD180yr_ISTRAT
	mapobj	0000,0080,-060,4000,bou_1b,HARD180yr_ISTRAT

	cspecial	1800,-1000,60,3500,car_0,aircar4_Istrat	;go away
;narrow
	mapobj	0800,-090,-060,4000,WALL_4,HARD180yr_ISTRAT
	cspecial	0000,-800,060,1000,car_0,aircar1_Istrat	;dash
	mapobj	0800,-080,-060,4000,WALL_4,HARD180yr_ISTRAT
	mapobj	0800,-070,-060,4000,WALL_4,HARD180yr_ISTRAT
	skillfly_bonus 0000,0060,-50,1500,item_7,item7_istrat
	mapobj	0800,-060,-060,4000,WALL_4,HARD180yr_ISTRAT
	mapobj	0800,-050,-060,4000,WALL_4,HARD180yr_ISTRAT
	mapobj	0800,-040,-060,4000,WALL_4,HARD180yr_ISTRAT
	mapobj	0800,0060,-060,4000,WALL_4,HARD180yr_ISTRAT
	mapobj	0800,-060,-060,4000,WALL_4,HARD180yr_ISTRAT
	mapobj	1200,0060,-060,4000,WALL_4,HARD180yr_ISTRAT

	cspecial	1600,-1000,60,3000,car_0,aircar4_Istrat	;go away
	mapobj	0800,-060,-060,4000,WALL_4,HARD180yr_ISTRAT

	cspecial	1600,0000,-60,3500,car_0,aircar4_Istrat	;go away
	mapobj	0800,0060,-060,4000,WALL_4,HARD180yr_ISTRAT
	mapobj	1000,-060,-060,4000,WALL_4,HARD180yr_ISTRAT
;truck
	mapobj	0000,-300,-060,4000,bou_1b,HARD180yr_ISTRAT
	cspecial	1500,-1000,60,3000,car_0,aircar4_Istrat	;go away
	mapobj	0000,-300,-060,4000,bou_1b,HARD180yr_ISTRAT
	special	1500,-1000,60,3000,car_0,aircar4_Istrat	;go away
	mapobj	0000,-300,-060,4000,bou_1b,HARD180yr_ISTRAT
	cspecial	1000,0,-040,3000,car_1,truck1_ISTRAT
	mapobj	1000,-300,-060,4000,bou_1b,HARD180yr_ISTRAT
	mapobj	0000,-300,-060,4000,bou_1b,HARD180yr_ISTRAT
	cspecial	1000,0000,-040,3000,car_1,truck2_ISTRAT
	mapobj	1000,-300,-060,4000,bou_1b,HARD180yr_ISTRAT
	mapobj	0000,-300,-060,4000,bou_1b,HARD180yr_ISTRAT
	cspecial	1000,50,-040,3000,car_1,truck1_ISTRAT
	mapobj	0000,-300,-060,4000,bou_1b,HARD180yr_ISTRAT
	special	1000,-120,-040,3000,car_1,truck1_ISTRAT
	mapobj	1000,-300,-060,4000,bou_1b,HARD180yr_ISTRAT
	cspecial	1000,20,-040,3000,car_1,truck1_ISTRAT
	mapobj	0000,-300,-060,4000,bou_1b,HARD180yr_ISTRAT
	cspecial	1000,-050,-040,3000,car_1,truck2_ISTRAT
	mapobj	1000,-300,-060,4000,bou_1b,HARD180yr_ISTRAT
	mapobj	1000,-300,-060,4000,bou_1b,HARD180yr_ISTRAT
	mapobj	1000,-300,-060,4000,bou_1b,HARD180yr_ISTRAT

;gutter
	cspecial	0000,-200,-040,4000,car_1,truck1_ISTRAT
	mapobj	0000,0000,-110,4000,r_bu_2,hard180yr_ISTRAT
	mapobj	0200,-100,-060,4000,WALL_4,HARD180yr_ISTRAT
	mapobj	0400,-100,-060,4000,WALL_4,HARD180yr_ISTRAT
	mapobj	0000,0080,-40,4000,item_5,item5_istrat
	setalvar	sbyte1,1
	mapobj	0000,0000,-110,4000,r_bu_2,hard180yr_ISTRAT
	mapobj	0200,-100,-060,4000,WALL_4,HARD180yr_ISTRAT
	mapobj	0400,-100,-060,4000,WALL_4,HARD180yr_ISTRAT
	mapobj	0000,-300,-060,4000,bou_1b,HARD180yr_ISTRAT
	mapobj	0000,-300,-060,4200,bou_1b,HARD180yr_ISTRAT
	mapobj	0000,-200,-110,4000,r_bu_2,hard180yr_ISTRAT
	mapobj	0000,0000,-110,4000,r_bu_2,hard180yr_ISTRAT
	mapobj	0200,-100,-060,4000,WALL_4,HARD180yr_ISTRAT
	mapobj	0400,-100,-060,4000,WALL_4,HARD180yr_ISTRAT
	cspecial	0000,-200,-040,4000,car_1,truck1_ISTRAT
	pathobj	0000,0000,-110,4000,r_bu_2,itadosun,10,8	
	mapobj	0200,-100,-060,4000,wall_4,HARD180yr_ISTRAT
	mapobj	0400,-100,-060,4000,WALL_4,HARD180yr_ISTRAT
	mapobj	0000,0000,-110,4000,r_bu_2,hard180yr_ISTRAT
	mapobj	0200,-100,-060,4000,WALL_4,HARD180yr_ISTRAT
	skillfly_set -180,-60,4000
	mapobj	0400,-100,-060,4000,wall_4,HARD180yr_ISTRAT
	mapobj	0000,0000,-060,4000,gate_0,gate_ISTRAT
	pathobj	2000,3000,0000,1000,nullshape,e_gate,10,10
.walls
	mapobj	1000,-300,-060,4000,bou_1b,HARD180yr_ISTRAT
	maploop .walls,04
	cspecial	0000,0,-10,4000,car_0,aircar4_Istrat	;brake
	skillfly_bonus 0000,0000,-50,1000,item_5,item5_istrat
	mapobj	1000,-300,-060,4000,bou_1b,HARD180yr_ISTRAT
	mapobj	0000,-300,-060,4000,bou_1b,HARD180yr_ISTRAT
	cspecial	1000,0,-10,4000,car_0,aircar4_Istrat
	cspecial	1500,-1000,60,4000,car_0,aircar4_Istrat	;go away
;crash_car
;ring_car
	mapobj	0000,-300,-060,4000,bou_1b,HARD180yr_ISTRAT
	cspecial	1000,-1000,-90,200,car_0,aircar3_Istrat	;zigzag
	mapobj	1000,-300,-060,4000,bou_1b,HARD180yr_ISTRAT
	mapobj	1000,-300,-060,4000,bou_1b,HARD180yr_ISTRAT
	cspecial	1000,-1000,-90,200,car_0,aircar2_Istrat	;ring
	mapobj	1000,-300,-060,4000,bou_1b,HARD180yr_ISTRAT
	mapobj	0000,-300,-060,4000,bou_1b,HARD180yr_ISTRAT
	mapobj	1000,-500,-90,500,car_0,aircar5_Istrat	;crash
	mapobj	1000,-300,-060,4000,bou_1b,HARD180yr_ISTRAT
.walls2
	mapobj	0000,-300,-060,4000,bou_1b,HARD180yr_ISTRAT
	cspecial	1000,-1000,-90,200,car_0,aircar2_Istrat	;ring
	mapobj	1000,-300,-060,4000,bou_1b,HARD180yr_ISTRAT
	maploop	.walls2,02
	cspecial	0000,-1000,60,1400,car_0,aircar1_Istrat	;dash
	mapobj	0000,-300,-060,4000,bou_1b,HARD180yr_ISTRAT
	mapobj	1000,-500,-90,500,car_0,aircar5_Istrat	;crash
	mapobj	1000,-300,-060,4000,bou_1b,HARD180yr_ISTRAT
	mapobj	0000,-300,-060,4000,bou_1b,HARD180yr_ISTRAT
	mapobj	1000,-500,-90,500,car_0,aircar5_Istrat	;crash
	special	1000,20,-100,3500,car_0,aircar4_Istrat	;go away
	mapobj	1000,-1000,-90,200,car_0,aircar2_Istrat	;ring
	special	1000,-1000,60,1000,car_0,aircar1_Istrat	;dash
	mapobj	5000,-500,-90,500,car_0,aircar5_Istrat	;crash
	mapobj	0000,0080,-060,4000,WALL_4,HARD180yr_ISTRAT
	mapobj	0000,-040,-060,4000,WALL_4,HARD180yr_ISTRAT
	mapobj	0000,-160,-060,4000,WALL_4,HARD180yr_ISTRAT
	mapobj	0000,-280,-060,4000,WALL_4,HARD180yr_ISTRAT

	
	incmap	trucker
	setbgm	$f1
	mapwait	medpspeed*15*2
	setbgm	$12
	markboss	boss26
	start_65816
	IFEQ	shieldboostcolorbox
	lda	#1
	sta.l	m_meters
	ENDC
	end_65816
	maprts
