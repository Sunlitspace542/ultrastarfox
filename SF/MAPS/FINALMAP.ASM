; final base entrance, boss,exit and end demo.

	incmap	dm_lb1

final_tunnel
	mapwait	2000
	setvar.w	currentbg,bg_2_6c-bglists
	setrestart	finalmap_restart
finalmap_cont
	mapplayeroutdist
	mapwait	2000
;----------------
	pathobj	0000,0000,0000,4000,nullshape,mes_andross1,10,10
.finalt
	mapobj	0000,0120,-120,4000,tunnel_0,topright1_istrat
	mapobj	0000,-120,-120,4000,tunnel_0,topleft1_istrat
	mapobj	0000,0120,0,4000,tunnel_0,botright1_istrat
	mapobj	0600,-120,0,4000,tunnel_0,botleft1_istrat
	maploop .finalt,4

	mapobj	0000,-090,-060,4000,WALL_2,HARD180yr_ISTRAT
	mapobj	0500,0090,-060,4000,WALL_2,HARD180yr_ISTRAT
	mapobj		0000,0000,-60,4000,gate_0,gate3_istrat
	setalvar	sbyte1,1
	mapwait	1000
	mapdpilarL	0,-20,4000
	mapdpilarR	800,-20,4000

	mapdpilarL	0,-100,4000
	mapdpilarR	800,-100,4000


	mapobj		0000,000,-60,4000,item_5,item5_istrat
	setalvar	sbyte1,1
	mapobj	0000,-090,-060,4000,WALL_2,HARD180yr_ISTRAT
	mapobj	1000,0090,-060,4000,WALL_2,HARD180yr_ISTRAT
	mapdpilarL	0,-100,4000
	mapdpilarR	800,-100,4000

	mapdpilarL	0,-20,4000
	mapdpilarR	800,-20,4000
;----------------------------------------------------
;level3
	mapgotoifnotlevel	3,.nl3p1
	mapdpilarR	600,-60,4000
	mapdpilarl	000,-100,4000
	mapdpilarl	600,-20,4000
	mapdpilarR	200,-20,4000
	mapdpilarR	200,-40,4000
	mapdpilarR	600,-60,4000
	mapdpilarl	200,-100,4000
	mapdpilarl	200,-80,4000
	mapdpilarl	600,-60,4000
	mapdpilarr	000,-100,4000
	mapdpilarr	600,-20,4000
.nl3p1
;----------------------------------------------------
.level2t
	mapgotoifnotlevel	2,.nl2p1
	mapdpilarL	0,-100,4000
	mapdpilarR	100,-100,4000
	mapdpilarL	0,-80,4000
	mapdpilarR	800,-80,4000

	mapdpilarL	0,-20,4000
	mapdpilarR	100,-20,4000
	mapdpilarL	0,-40,4000
	mapdpilarR	800,-40,4000

	maploop	.level2t,02
.nl2p1
;----------------------------------------------------
;all_levelt
	mapdpilarL	0,-100,4000
	mapdpilarR	0,-100,4000

	mapdpilarL	0,-20,4000
	mapdpilarR	1500,-20,4000
;---------------------------------------------------
.level3t
	mapgotoifnotlevel	3,.nl3p2
	mapobj	0000,100,-060,4000,bou_1,HARD180yr_ISTRAT
	maphalfdL	1500,4000
	mapobj	0000,-100,-060,4000,bou_1,HARD180yr_ISTRAT
	maphalfdR	1500,4000
	maploop .level3t,02
	mapwait	500
.nl3p2
;---------------------------------------------------
.level1t
	mapgotoifnotlevel	1,.nl1p1
	mapobj	0000,110,-060,4000,WALL_4,HARD180yr_ISTRAT
	maphalfdL	1500,4000
	mapobj	0000,-110,-060,4000,WALL_4,HARD180yr_ISTRAT
	maphalfdR	1500,4000
	maploop .level1t,02
	mapwait	500
.nl1p1
;---------------------------------------------------
;all_levelt
	mapobj		0000,0060,-60,4000,item_7,item7_istrat
	setalvar	sbyte1,1
	mapobj	0000,110,-060,4000,WALL_4,HARD180yr_ISTRAT
	maphalfdL	2000,4000
	mapobj	0000,-110,-060,4000,WALL_4,HARD180yr_ISTRAT
	maphalfdR	1000,4000


;----------------



	mapwait	2000
	pathobj	0000,0000,0000,3000,nullshape,mes_andross2,10,10
	mapjsr	Ltunnelexit

;	mapwait	200
	mapwait	100
	setbg	1_6c
	initbg
	maptexitwait	-200
	mapplayermode	inspace
	setbgm	$13
	mapwait	2000
	mapobj	1000,0,Space_viewCY,-200,face_b,monolith_istrat
	mapwaitboss	nosound
	markboss	bossfinal
	mapwait	5000
finalmap_end 
	incmap	dm_end


.wait1
	mapwait	1000
	mapgoto	.wait1

finalmap_restart
	mapwait	1000
	setbgm	$12
	mapgoto	finalmap_cont



