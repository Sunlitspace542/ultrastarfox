map2_3a

;2-3-1
	SETVAR.N	INFOG,1
	mapwait	2000
;-----------------------------------------------------------------------
	pathobj	0000,0400,-120,2500,r_but_2,pinita_b,10,10
	pathobj	0000,-400,-120,2500,r_but_2,pinita_b,10,10
	pathobj	2000,0000,-120,2500,r_but_2,pinita_a,10,10
	mapobj	0000,-600,0000,2000,bro_4,rockhard_istrat ;   L     |     L   ; 
	mapobj	0500,0600,0000,2000,bro_5,rockhard_istrat 	
	maphardrot	0000,-150,-75,2000,clisla_m,0,8,0
	pathobj	0500,0050,-75,2000,clisla_s,l_clisla,10,10
	mapobj	0000,-550,0000,2000,bro_0,rockhard_istrat ;  S      |    L    ;
	mapobj	1000,0350,0000,2000,bro_5,rockhard_istrat 
	mapobj	0500,-200,0000,2000,hou_5,houdai5f_istrat  ;       H           ; 

	mapobj	0000,-700,0000,2000,bro_0,rockhard_istrat ; S       |  L      ;
	mapobj	0000,0150,0000,2000,bro_5,rockhard_istrat 
	pathcspecial	1000,0150,0000,2600,walker_0,e_walk_1,10,10
	mapobj	0000,-600,0000,2000,bro_2,rockhard_istrat ;  M      |         ;
	mapobj	1000,0500,0000,2000,bro_1,rockhard_istrat ;         |     S   ;
	mapobj	0000,-400,0000,2000,bro_4,rockhard_istrat ;   L     |         ;
	mapobj	1000,0550,0000,2000,bro_1,rockhard_istrat ;         |      S  ;

	mapobj	0000,-650,0000,2000,bro_0,rockhard_istrat ; S       6       S ;
	mapobj	0000,0650,0000,2000,bro_1,rockhard_istrat 
	mapobj	0000,0000,0000,2000,bro_6,rockhard_istrat 
	mapobj	0000,-160,-190,2500,item_5,item5_Istrat
	setalvar	sbyte1,1
	mapwait	00200
	pathspecial	1000,0000,0000,2350,walker_0,e_walk_1,10,10;        W         ;
	maphardrot	0000,0000,-75,2000,clisla_m,0,-8,0
	pathobj	0000,-200,-75,2000,clisla_s,r_clisla,10,10
	mapobj	0000,-500,0000,2000,bro_2,rockhard_istrat ;   M     |     M   ;
	mapobj	1000,0500,0000,2000,bro_3,rockhard_istrat 
	mapobj	0000,-500,0000,2000,bro_4,rockhard_istrat ;   L     H     L   ;
	mapobj	0000,0500,0000,2000,bro_5,rockhard_istrat 
	mapobj	1000,0000,0000,2000,hou_5,houdai5f_istrat
	mapobj	0000,0250,0000,2000,bro_6,hard180yr_istrat ;S     6     6     S;
	mapobj	0500,-250,0000,2000,bro_6,hard180yr_istrat 
	pathobj	1500,0000,-120,2500,r_but_2,pinita_b,10,10
;2-3-2
	mapobj	0000,-300,0000,2000,bro_6,hard180yr_istrat
	pathspecial	1000,-300,0000,2500,walker_0,e_walk_1,10,10
	mapobj	0000,0600,0000,2000,bro_6,hard180yr_istrat
	pathspecial	1000,0600,0000,2500,walker_0,e_walk_1,10,10

	pathobj	0000,-750,-400,0000,friendship_4,chase6_1,10,10
	pathcspecial	0000,-720,-400,0000,zaco_a,chase6_2,10,10

;misstank
	cspecial	0000,-1000,0000,3000,m_tank,misstank_istrat
	setalvar	roty,-deg90
	addalvarptr.w	worldx,player_posx

;;;;;	mapHARDRot	wait,   x,   y,   z, shape, x,y,z(+or- speed)
	pathobj	0700,0300,-200,2000,clisla_s,mini_cli,10,10
	pathobj	0700,-200,-045,2000,clisla_s,mini_cli,10,10
	pathobj	0700,0100,-030,2000,clisla_s,mini_cli,10,10
	pathobj	0000,0250,-120,2500,r_but_2,pinita_b,10,10
	pathobj	0700,-400,-100,2000,clisla_s,mini_cli,10,10

	cspecial	0000,1000,0000,3000,m_tank,misstank_istrat
	setalvar	roty,deg90
	addalvarptr.w	worldx,player_posx

	pathobj	0700,-300,-200,2000,clisla_s,mini_cli,10,10
	pathobj	0700,400,-100,2000,clisla_s,mini_cli,10,10
	pathobj	0700,-100,-030,2000,clisla_s,mini_cli,10,10
	pathobj	0700,200,-045,2000,clisla_s,mini_cli,10,10

	cspecial	0000,-1000,0000,3000,m_tank,misstank_istrat
	setalvar	roty,-deg90
	addalvarptr.w	worldx,player_posx

	pathobj	0000,0100,-120,2500,r_but_2,pinita_b,10,10
.fogagain
	pathobj	0700,-300,-200,2000,clisla_s,mini_cli,10,10
	pathobj	0700,400,-100,2000,clisla_s,mini_cli,10,10
	pathobj	0700,-100,-030,2000,clisla_s,mini_cli,10,10
	pathobj	3000,200,-045,2000,clisla_s,mini_cli,10,10
	pathobj	1000,0000,-170,3000,walk_4_0,e_kani_0,10,10

	pathobj	0700,-300,-200,3000,clisla_s,mini_cli,10,10
	pathobj	0700,400,-100,3000,clisla_s,mini_cli,10,10
	pathobj	0700,-100,-030,3000,clisla_s,mini_cli,10,10
	pathobj	1000,200,-045,3000,clisla_s,mini_cli,10,10
;base
	mapobj	0000,0350,0000,3000,hou_5,houdai5f_istrat
	mapobj	1400,-350,0000,3000,hou_5,houdai5f_istrat
	mapobj	0000,0000,-50,4200,item_7,item7_Istrat
	setalvar	sbyte1,1
	mapobj	0500,0000,0000,4000,base_0,base1_istrat

	pathspecial	0000,0500,0000,4400,s_tank_0,e_tank,10,10
	mapobj	0000,0500,0000,4000,base_0,base1_istrat
;	skillfly_init
;	skillfly_set 0500,-100,4030,180
	pathobj	0000,0500,-100,4030,core_1_1,tenki_on,10,10
	pathobj	0500,0500,0000,4030,rader_1,tenki_dm,10,10

	pathspecial	0000,-500,0000,4400,s_tank_0,e_tank,10,10
	pathobj	0000,0000,-120,4000,r_but_2,pinita_b,10,10
	mapobj	3500,-500,0000,4000,base_0,base1_istrat
	eguchi2fly_goto .fogout
	mapwait	500
	mapgoto	.fogagain
.fogout

;-
	SETVAR.N	FADEPAL,33
	setvar	palfrom,0
	setvar	palto,0
	setvar	pallen,32
	SETVAR.N	INFOG,0
	MAPCODE_JSL	BG_1_4B_1
	start_65816

	a8
	lda	#1
	sta	dotsflag
	stz	dotsflag+1

	lda	#0
	sta.l	m_planetstars
	sta.l	m_planetstars+1

	end_65816
	pathspecial		0000,-2100,-200,3500,zaco_a,egu4,10,10
	pathcspecial	4000,-2300,-100,2500,zaco_5,egu4,10,10

	pathcspecial	0000,-150,0000,5000,heli,e_heli,10,10
	pathcspecial	4200,0150,0000,5800,heli,e_heli,10,10

	pathobj	0000,0000,-400,-150,friendship_4,chase7_1,10,10
	pathcspecial	1600,0000,-400,-150,zaco_a,chase7_2,10,10
	pathobj	0000,0260,-120,3000,r_but_2,pinita_b,10,10
	pathobj	3400,-260,-120,3000,r_but_2,pinita_b,10,10
	pathobj	0500,0200,-120,3000,r_but_2,pinita_b,10,10
	mapobj	0000,-200,-150,3200,item_5,item5_Istrat
	setalvar	sbyte1,1
	pathobj	2100,-200,-120,3000,r_but_2,pinita_a,10,10

	maphardrot	0000,0300,-075,4000,clisla_m,0,-8,0
	pathobj	3000,0500,-075,4000,clisla_s,l_clisla,10,10
	pathobj	1500,0200,-170,4500,walk_4_0,e_kani_0,10,10
	maphardrot	0000,-300,-075,4000,clisla_m,0,-8,0
	pathobj	4000,-500,-075,4000,clisla_s,r_clisla,10,10
	pathobj	1000,-200,-170,4500,walk_4_0,e_kani_0,10,10
	pathobj	0400,-300,-200,2000,clisla_s,mini_cli,10,10
	pathobj	0400,400,-100,2000,clisla_s,mini_cli,10,10


	pathobj	0400,-100,-030,2000,clisla_s,mini_cli,10,10
	pathobj	0400,200,-045,2000,clisla_s,mini_cli,10,10

	mapobj	1000,-600,0000,5000,clisla_l,hard180yr_istrat
	skillfly_init
	skillfly_set 0000,-150,3000
	pathobj	1000,0000,-120,3000,r_but_2,pinita_a,10,10
	pathobj	1000,0260,-120,3000,r_but_2,pinita_b,10,10
	skillfly_set -300,-120,3000
	pathobj	1500,-300,-120,3000,r_but_2,pinita_b,10,10
	pathobj	1500,0100,-120,3000,r_but_2,pinita_a,10,10
	skillfly_bonus 0000,0100,-120,1700,gate_0,gate3_istrat
	cspecial	0000,1000,0000,3000,m_tank,misstank_istrat
	setalvar	roty,deg90
	addalvarptr.w	worldx,player_posx
	cspecial	0000,-1000,0000,3000,m_tank,misstank_istrat
	setalvar	roty,-deg90
	addalvarptr.w	worldx,player_posx

	mapwait	2500

	special	0400,0550,0000,4000,s_tank_0,tank3_istrat
	pathcspecial	0400,0000,0000,4000,tank_1,e_tank,10,10
	special	6000,-550,0000,4000,s_tank_0,tank3_istrat
	pathobj	0000,-750,-400,0000,friendship_4,chase6_1,10,10
	pathcspecial	4000,-720,-400,0000,zaco_a,chase6_2,10,10
	cspecial	0500,300,0000,4000,hou_5,houdai5f_istrat
	cspecial	4500,-300,0000,4000,hou_5,houdai5f_istrat


	pathobj	18000,0000,-170,5000,nullshape,kanihaha,10,10

	mapwait	10000
;27 specials
;chase 3 times

bigbasez	=	10000
kichi2_pos	=	bigbasez+kichi0_door
	mapobj	0000,0000,0000,kichi2_pos,k_door,kdoor_istrat
kichi2_pos	=	kichi2_pos+kichi2_len/2
	mapobj	0000,0000,0000,kichi2_pos,kichi_3,kichi2_istrat
kichi2_pos	=	kichi2_pos+kichi2_len
	mapobj	0000,0000,0000,kichi2_pos,kichi_3,kichi2_istrat
kichi2_pos	=	kichi2_pos+kichi2_len
	mapobj	0000,0000,0000,kichi2_pos,kichi_3,kichi2_istrat
kichi2_pos	=	kichi2_pos+kichi2_len/2
	mapobj	0000,0000,0000,kichi2_pos,k_door,kdoor2_istrat
	mapobj	kichi2_pos-kichi2_len-kichi2_len/2-medpspeed*20,0000,0000,bigbasez,kichi_0,massivebase_istrat
	setbgm	$f1	; fade out music
	mapwait	medpspeed*20
	maprts





