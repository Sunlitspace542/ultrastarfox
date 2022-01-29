map2_5
	mapwait		600
	pathspecial	0000,2700,2000,1500,s_zaco_0,egu6,10,10
	pathcspecial	0000,2500,2000,1800,zaco_8,egu6,10,10
	pathcspecial	3000,2900,2000,2100,zaco_8,egu6,10,10

	pathspecial	0000,-2700,2000,1500,s_zaco_0,egu6_ifal,10,10
	pathcspecial	0000,-2500,2000,1800,zaco_8,egu6_irab,10,10
	pathcspecial	9000,-2900,2000,2100,zaco_8,egu6_ifro,10,10

	pathcspecial	0400,-300,2200,2800,bzaco_8,egu5,10,10
	pathspecial	0400,0000,2200,2500,s_zaco_0,egu5,10,10
	pathcspecial	7000,0300,2200,3100,bzaco_8,egu5,10,10

	pathobj	0000,-900,0000,0000,friendship_4,chase2_1,10,10
	pathcspecial	8000,-900,0000,0000,zaco_b,chase2_2,10,10

	pathobj	0000,0000,-700,1000,nullshape,check,10,10
	pathobj	0700,-200,2000,2600,boss_e_4,minicas2,10,10
	pathobj	0700,200,2000,2600,boss_e_4,minicas2,10,10
	pathobj	0700,000,2000,2600,boss_e_4,minicas2,10,10
	pathobj	0700,100,2000,2600,boss_e_4,minicas2,10,10
	pathobj	2500,-100,2000,2600,boss_e_4,minicas2,10,10

	mapmother	1000,0000,2000,3000,mother1,mother2_istrat,map_uperm
	cspecial	1000,0000,2000,3000,uper_m,uperm_Istrat
	cspecial	1000,0100,2000,3000,uper_m,uperm_Istrat
	cspecial	1000,-100,2000,3000,uper_m,uperm_Istrat
	cspecial	1000,0200,2000,3000,uper_m,uperm_Istrat
	cspecial	1000,-200,2000,3000,uper_m,uperm_Istrat
	maprem	mother1

	pathspecial	0400,-2700,2200,1500,s_zaco_0,egu6,10,10
	pathspecial	0400,2700,2200,1500,s_zaco_0,egu6,10,10

	pathcspecial	0400,-2500,2200,1800,zaco_8,egu6,10,10
	pathcspecial	0400,2500,2200,1800,zaco_8,egu6,10,10

	pathcspecial	0400,-2900,2200,2100,zaco_8,egu6_irab,10,10
	pathcspecial	6000,2900,2200,2100,zaco_8,egu6_ifal,10,10

	pathobj	0000,0000,-700,1000,nullshape,check,10,10
	pathobj	0800,-200,2000,2600,boss_e_4,minicas2,10,10
	pathobj	0800,200,2000,2600,boss_e_4,minicas2,10,10
	pathobj	0800,000,2000,2600,boss_e_4,minicas2,10,10

;skillfly
	skillfly_init
	skillfly_set	 0000,-50,4000,100
	pathcspecial	0000,0180,0100,4000,boss_e_4,damyscr,10,10
	setalvar	sbyte1,1
	pathcspecial	0000,-180,0100,4000,boss_e_4,damyscr,10,10
	setalvar	sbyte1,1
	pathcspecial	0000,0000,-200,4000,boss_e_4,damyscr,10,10
	setalvar	sbyte1,1
	pathobj	0800,100,2000,2600,boss_e_4,minicas2,10,10
	pathobj	0800,-100,2000,2600,boss_e_4,minicas2,10,10
	pathobj	0800,-200,2000,2600,boss_e_4,minicas2,10,10
	pathobj	0800,200,2000,2600,boss_e_4,minicas2,10,10
	pathobj	0800,000,2000,2600,boss_e_4,minicas2,10,10
	skillfly_bonus 0000,0000,-50,2000,item_7,item7_istrat
	setalvar	sbyte1,1
	pathobj	0800,100,2000,2600,boss_e_4,minicas2,10,10
	mapobj	0000,-100,-100,3500,item_5,item5_Istrat
	setalvar	sbyte1,1
	pathobj	0800,-100,2000,2600,boss_e_4,minicas2,10,10

	mapobj	0000,0000,0000,4000,gate_0,gate_istrat

	pathobj	0300,3000,0,1000,nullshape,e_gate,10,10
	mapwait	1600

	pathobj	0000,0000,-700,1000,nullshape,check,10,10
	pathobj	0700,-200,2000,2600,boss_e_4,minicas2,10,10
	pathobj	0700,200,2000,2600,boss_e_4,minicas2,10,10
	pathobj	0000,1200,0200,0600,friendship_4,chase1_1,10,10
	pathcspecial	0000,1200,0200,0600,zaco_b,chase1_2,10,10
	pathobj	0700,000,2000,2600,boss_e_4,minicas2,10,10
	pathobj	0700,100,2000,2600,boss_e_4,minicas2,10,10
	pathobj	4000,-100,2000,2600,boss_e_4,minicas2,10,10

	pathcspecial	0000,800,1300,2000,zaco_4,egu3,10,10
	pathcspecial	1000,-800,1300,2300,zaco_4,egu3,10,10

	cspecial	0500,000,Space_viewCY-500,800,zaco_4,szaco0_istrat

	pathcspecial	0000,200,1900,2000,zaco_4,egu3,10,10
	pathcspecial	4000,-200,1900,2300,zaco_4,egu3,10,10

	pathcspecial	0300,-300,2200,2000,bzaco_8,egu5,10,10
	pathspecial	0300,0000,2200,1700,s_zaco_0,egu5,10,10
	pathcspecial	8000,0300,2200,2300,bzaco_8,egu5,10,10

	mapmother	1000,0000,2000,3000,mother1,mother2_istrat,map_uperm
	cspecial	1000,0100,2000,3000,uper_m,uperm_Istrat
	cspecial	1000,-100,2000,3000,uper_m,uperm_Istrat
	cspecial	1000,0200,2000,3000,uper_m,uperm_Istrat
	cspecial	1000,-200,2000,3000,uper_m,uperm_Istrat

	pathobj	0000,0000,0400,0000,friendship_4,chase3_1,10,10
	pathcspecial	10000,0000,400,0000,zaco_b,chase3_2,10,10

	cspecial	1000,-150,1000,3500,bazooka,bazookaL_Istrat
	cspecial	1000,0100,2000,3000,uper_m,uperm_Istrat
	cspecial	1000,-100,2000,3000,uper_m,uperm_Istrat
	cspecial	1000,0200,2000,3000,uper_m,uperm_Istrat
	cspecial	1000,-200,2000,3000,uper_m,uperm_Istrat
	maprem	mother1
	cspecial	5500,0150,1000,3500,bazooka,bazookaR_Istrat

	pathspecial	0000,-2000,2000,2000,s_zaco_0,egu6,10,10
	pathspecial	0000,2000,2000,2300,s_zaco_0,egu6,10,10
	pathcspecial	0000,-2000,-2000,2600,zaco_8,egu6,10,10
	pathcspecial	9000,2000,-2000,2900,zaco_8,egu6_ifal,10,10

	cspecial	6000,0000,1500,2000,wire_man,wireman_Istrat
	cspecial	4000,-150,1000,3500,bazooka,bazookaL_Istrat
	cspecial	4000,0150,1000,3500,bazooka,bazookaR_Istrat

;skillfly
	skillfly_init
	skillfly_set	 0000,-100,2500,120
	pathcspecial	1000,0000,-100,2500,boss_e_4,minicas0,10,10
	pathcspecial	1000,-500,-200,2500,boss_e_4,minicas0,10,10
	pathcspecial	0300,-300,2200,2800,bzaco_8,egu5,10,10
	pathspecial	0300,0000,2200,2500,s_zaco_0,egu5,10,10
	skillfly_bonus 0000,0000,-100,2000,item_5,item5_istrat
	setalvar	sbyte1,1
	pathcspecial	0300,0300,2200,3100,bzaco_8,egu5,10,10
	pathcspecial	1000,-200,0050,2500,boss_e_4,minicas0,10,10
	pathcspecial	0800,0500,0000,2500,boss_e_4,minicas0,10,10
	pathcspecial	0800,-300,-150,2500,boss_e_4,minicas0,10,10
	pathcspecial	0800,0100,-200,2500,boss_e_4,minicas0,10,10
	pathcspecial	0300,-300,2200,2800,bzaco_8,egu5,10,10
	pathspecial	0300,0000,2200,2500,s_zaco_0,egu5,10,10
	pathcspecial	0300,0300,2200,3100,bzaco_8,egu5,10,10
	pathcspecial	0600,-200,0050,2500,boss_e_4,minicas0,10,10
	pathobj	0000,-250,-350,0,my_bird,my_bird,10,10
	pathcspecial	0600,0000,-150,2500,boss_e_4,minicas0,10,10
	pathcspecial	0600,0500,-130,2500,boss_e_4,minicas0,10,10
	pathcspecial	0400,-500,-200,2500,boss_e_4,minicas0,10,10
	pathcspecial	3400,0200,-100,2500,boss_e_4,minicas0,10,10

	pathobj	0000,3000,3000,3000,nullshape,kastmsg,10,10


;65 specials
;chase 3 times

	fadeoutbgm
	setbgm	5
	incmap	castanet
	mapwaitboss
	markboss	boss25

	mapwait	2400

	maprts


