map1_5
	mapwait	3000

;formation		x,   y,   x2,y2, wait  	
;	szaco2_mapobj	0000,2000,0,0,0
;	mapwait	1000
;	szaco2_mapobj	-500,2000,-200,100,0
;	szaco2_mapobj	0500,2000,0200,100,0
;	mapwait	1000
;	szaco2_mapobj	-1500,01000,-200,-100,0
;	szaco2_mapobj	01500,01000,0200,-100,0
;	mapwait	7000

	pathcspecial	0000,0400,100,-100,bzaco_8,patret,10,10
	pathcspecial	0000,-400,100,-100,bzaco_8,patret,10,10
	pathcspecial	0000,0200,500,900,zaco_1,e_shawer,10,10
	pathcspecial	4500,-200,500,1200,zaco_1,e_shawer,10,10

	pathobj	0000,-900,000,000,friendship_4,chase2_1,10,10
	pathcspecial	5000,-900,000,000,zaco_b,chase2_2,10,10
	pathcspecial	0000,0000,0200,-100,bzaco_8,patret,10,10
	pathcspecial	0000,0400,-400,-100,bzaco_8,patret,10,10
	pathcspecial	5000,-400,-400,-100,bzaco_8,patret,10,10
;uper_missile
	mapmother	1200,0000,2000,3000,mother1,mother2_istrat,map_uperm
.uperloop
	cspecial	1200,0180,2000,3000,uper_m,uperm_Istrat
	cspecial	1200,-180,2000,3000,uper_m,uperm_Istrat
	maploop	.uperloop,02

	pathobj	0000,0000,-700,1000,nullshape,check,10,10
;	pathspecial	0000,-50,1000,800,zaco_1,e_shawerl,10,10
;	pathcspecial	7000,050,1000,700,zaco_1,e_shawerr,10,10

	pathcspecial	0000,0200,1000,700,zaco_1,e_shawerr,10,10
	pathspecial	1000,-200,1000,800,zaco_1,e_shawerl,10,10

	maprem	mother1
	cspecial	2800,-100,space_viewCY-100,4000,big_m,misspod_istrat
;windmill
	special	0000,-200,space_viewCY+1500,4000,round_0,windmill_istrat
	setalvar	vel,120
	setalvar	roty,134
	setalvar	rotx,230
	mapwait	3000
	setalvar	vel,0
	setalvar	rotx,0
	setalvar	roty,127
	mapwait	2000
	setalvar	vel,120
	setalvar	sword1,-2

	pathobj	0000,0000,-700,1000,nullshape,check,10,10
	cspecial	0000,0100,0000,1500,warp,warp_Istrat
	mapwait	2000
	special	0000,500,space_viewCY-300,1000,round_0,windmill_istrat
	setalvar	vel,127
	setalvar	roty,64
	setalvar	rotx,5
	mapwait	0300
	setalvar	roty,40
	mapwait	0200
	setalvar	roty,20
	mapwait	0200
	setalvar	roty,0
	mapwait	01400
	setalvar	roty,250
	mapwait	0100
	setalvar	roty,230
	mapwait	0100
	setalvar	roty,200
	mapwait	0100
	setalvar	roty,170
	mapwait	0100
	setalvar	roty,140
	mapwait	0100
	setalvar	vel,0
	setalvar	rotx,0
	mapwait	3000
	setalvar	vel,100
	setalvar	sword1,4

;big_missille
	pathobj	0000,0000,-700,1000,nullshape,check,10,10
	cspecial	2000,0000,space_viewcy,4000,big_m,misspod_istrat
	pathcspecial	0000,0000,-300,-100,bzaco_8,patret_ifal,10,10
	cspecial	2000,0100,space_viewCY-100,4000,big_m,misspod_istrat	
	cspecial	1000,-100,space_viewCY+100,4000,big_m,misspod_istrat
	cspecial	1000,-100,space_viewCY-100,4000,big_m,misspod_istrat
	cspecial	1000,0100,space_viewCY+100,4000,big_m,misspod_istrat
;warp
	pathcspecial	0000,0000,-300,-100,bzaco_8,patret_irab,10,10
	cspecial	3000,0000,-200,1500,warp,warp_Istrat
;ring
	skillfly_init
	skillfly_set 0000,0000,4000,100
	mapobj	0000,-150,0,4000,mine_0,mine0_istrat
	mapobj	0000,150,0,4000,mine_0,mine0_istrat
	mapobj	0000,-100,100,4000,mine_0,mine0_istrat
	mapobj	0000,-100,-100,4000,mine_0,mine0_istrat
	mapobj	0000,100,100,4000,mine_0,mine0_istrat
	mapobj	0000,100,-100,4000,mine_0,mine0_istrat
	mapobj	0000,00,150,4000,mine_0,mine0_istrat
	mapobj	4000,00,-150,4000,mine_0,mine0_istrat
	skillfly_bonus 0000,000,0000,1500,item_5,item5_istrat
	setalvar	sbyte1,1
	skillfly_set 0000,0000,1500
	mapwait	1500
	skillfly_bonus 0000,000,0000,1500,item_5,item5_istrat
	setalvar	sbyte1,1
	mapwait	1000
;bazooka
;	cspecial	5000,-100,1000,3500,bazooka,bazookaL_Istrat
	cspecial	5000,0000,1000,3500,bazooka,bazookaR_Istrat
;item
	cspecial	1000,-400,space_viewCY,3000,w_l,winglazerman_istrat

	mapmother	2000,0000,2000,3000,mother1,mother2_istrat,map_uperm
;	cspecial	1200,0100,2000,3000,uper_m,uperm_Istrat
;	cspecial	1200,-100,2000,3000,uper_m,uperm_Istrat

	pathobj	0000,0000,0500,0000,friendship_4,chase3_1,10,10
	pathcspecial	6000,0000,500,0000,zaco_b,chase3_2,10,10

	cspecial	1200,0000,2000,3000,uper_m,uperm_Istrat
	cspecial	1200,0100,2000,3000,uper_m,uperm_Istrat
	cspecial	1200,-100,2000,3000,uper_m,uperm_Istrat

	maprem	mother1
;gate
	mapobj	0500,100,space_viewCY+100,3000,gate_0,gate_istrat

	pathobj	2500,3000,3000,3000,nullshape,e_gate,10,10
	mapwait	1000

	cspecial	3000,0000,0000,1500,warp,warp_Istrat
	cspecial	0000,0000,2000,3000,uper_m,uperm_Istrat
	special	2000,0000,-200,1500,warp,warp_Istrat
	cspecial	0000,0000,2000,3000,uper_m,uperm_Istrat
	cspecial	1000,0000,0000,1500,warp,warp_Istrat
	cspecial	1300,-100,2000,3000,uper_m,uperm_Istrat
	cspecial	1300,0100,2000,3000,uper_m,uperm_Istrat
;	maprem	mother1
	cspecial	1300,0200,2000,3000,uper_m,uperm_Istrat
	cspecial	1300,-300,2000,3000,uper_m,uperm_Istrat
	cspecial	1300,0300,2000,3000,uper_m,uperm_Istrat
;	cspecial	1000,0100,space_viewCY-100,4000,big_m,misspod_istrat	
;	cspecial	1300,-200,2000,3000,uper_m,uperm_Istrat
;	cspecial	1000,-100,space_viewCY+100,4000,big_m,misspod_istrat

	pathobj	0000,1200,0200,0600,friendship_4,chase1_1,10,10
	pathcspecial	1000,1200,0200,0600,zaco_b,chase1_2,10,10
	cspecial	1300,0100,2000,3000,uper_m,uperm_Istrat
	cspecial	1300,-200,2000,3000,uper_m,uperm_Istrat
	cspecial	1300,0200,2000,3000,uper_m,uperm_Istrat
	mapmother	2500,0000,2000,3000,mother1,mother2_istrat,map_uperm
;supply_bird
		pathobj	5000,-350,-400,0,my_bird,my_bird,10,10

	maprem	mother1
;	cspecial	1000,-100,1000,3500,bazooka,bazookaL_Istrat
;	pathcspecial	2000,0400,-100,-100,bzaco_8,patret,10,10
;	pathcspecial	2000,-400,-100,-100,bzaco_8,patret,10,10
	cspecial	1000,0000,1000,3500,bazooka,bazookaL_Istrat
	pathcspecial	1500,0400,-100,-100,bzaco_8,patret,10,10
	pathcspecial	3000,-400,-100,-100,bzaco_8,patret,10,10

	fadeoutbgm
;72 specials
;chase 3 times

;---------------
; entity boss
	setbgm	5
	mapobj	0000,0000,1000,3500,boss_b_1,bossb_Istrat
	mapwaitboss
	markboss	boss15
	
	mapwait	3000

;	mapwait	4000
;	setvar.N	dospacesc,1
;.fff	mapwait	20000
;	mapwait	20000
;	mapwait	20000
;	mapwait	20000
;	mapgoto	.fff

	maprts



