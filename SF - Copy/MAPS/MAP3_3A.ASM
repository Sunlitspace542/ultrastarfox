map3_3a

	mapwait	2500

	pathobj	1000,0000,0000,2500,nullshape,e_flower,10,8
	pathobj	1000,-200,0000,2500,nullshape,e_flower,10,8
	pathobj	1000,0200,0000,2500,nullshape,e_flower,10,8

	mapobj	1000,-200,0000,2500,stalk,tree1_istrat
	mapobj	1000,0200,0000,2500,stalk,tree1_istrat
	mapobj	1000,0000,0000,2500,stalk,tree1_istrat

	mapobj	0400,-300,0000,4000,flower_2,hard180yr_Istrat
	mapobj	0900,100,0000,4000,flower_1,hard180yr_Istrat
	mapobj	1000,-800,0000,4000,flower_1,hard180yr_Istrat
	pathcspecial	0800,0300,-150,2000,beeanim,e_bee,10,10
	pathcspecial	0400,-400,-170,2000,beeanim,e_bee,10,10
	mapobj	1400,-1000,0000,4000,flower_1,hard180yr_Istrat
	mapobj	2400,-800,0000,4000,flower_1,hard180yr_Istrat
	pathobj	0000,-750,-400,0000,friendship_4,chase6_1,10,10
	pathcspecial	0000,-720,-400,0000,zaco_a,chase6_2,10,10
	pathobj	3000,0400,-40,4000,stalk,tomset,10,10
	mapobj	2000,100,0000,4000,flower_2,hard180yr_Istrat
	pathobj	2000,-300,-40,4000,stalk,tomset,10,10
	pathcspecial	0600,100,-120,2000,beeanim,e_bee,10,10
	pathcspecial	1400,-100,-120,2000,beeanim,e_bee,10,10
	mapobj	0500,200,0000,4000,flower_2,hard180yr_Istrat
	mapobj	0500,-200,0000,4000,flower_2,hard180yr_Istrat
	mapobj	0500,-900,0000,4000,flower_2,hard180yr_Istrat
	mapobj	1000,0900,0000,4000,flower_2,hard180yr_Istrat
	pathobj	3000,0000,-1000,4000,nullshape,tomhaha,10,10
	mapobj	1000,400,0000,4000,flower_1,hard180yr_Istrat
	mapobj	1000,-500,0000,4000,flower_1,hard180yr_Istrat
	mapobj	1000,100,0000,4000,flower_2,hard180yr_Istrat
	mapobj	2000,-200,0000,4000,flower_2,hard180yr_Istrat

	mapobj	0300,0300,0000,1500,stalk,tree1_istrat
	mapobj	0000,0000,0000,1500,stalk,tree1_istrat
	cspecial	0000,000,0000,4000,bom_wing,bomwing_Istrat
	pathspecial	0500,-400,0000,3100,bom_wing,ponpon,10,10
	pathcspecial	400,100,-120,2000,beeanim,e_bee,10,10
	pathcspecial	400,-100,-100,2000,beeanim,e_bee,10,10
	pathspecial	1000,400,0000,3100,bom_wing,ponpon,10,10
	pathcspecial	400,100,-120,2000,beeanim,e_bee,10,10
	mapobj	3500,0200,0000,1500,stalk,tree1_istrat
	mapobj	0900,-200,0000,1300,stalk,tree1_istrat
	mapobj	0900,0000,0000,1300,stalk,tree1_istrat
	mapobj	0900,0200,0000,1300,stalk,tree1_istrat
	mapobj	1200,-300,0000,1300,stalk,tree1_istrat
	mapobj	0500,0300,0000,1800,stalk,tree2_istrat
	mapobj	2500,0000,0000,1800,stalk,tree2_istrat

	mapobj	1000,0000,-100,2000,gate_0,gate_Istrat

	pathobj	0000,3000,3000,3000,nullshape,e_gate,10,10


.pdead2	mapwait	1000
	mapgotoifplayerdead	.pdead2
	mapfadetosea
	mapwait	0600
	mapplayermode	onwater
	mapwait	1000

	pathcspecial	1000,0200,000,4000,f_fish,e_flyfish,10,10
	pathcspecial	5000,0000,000,4000,f_fish,e_flyfish,10,10
	pathcspecial	1000,0-200,000,4000,f_fish,e_flyfish,10,10

	mapobj	0500,0000,0000,2000,nullshape,torpedo_Istrat	
	mapobj	0500,0-300,0000,2000,nullshape,torpedo_Istrat	
	mapobj	2000,0300,0000,2000,nullshape,torpedo_Istrat	

	pathcspecial	1000,1000,-100,0000,boss_d_4,kamome,10,10
	mapobj	0000,0000,0000,2000,nullshape,torpedo_Istrat	
	pathcspecial	1000,-1000,-100,0000,boss_d_4,kamome,10,10
	mapobj	0000,0-300,0000,2000,nullshape,torpedo_Istrat	
	pathcspecial	2000,1000,-100,0000,boss_d_4,kamome,10,10
	mapobj	2000,0300,0000,2000,nullshape,torpedo_Istrat	
;seadragon
	pathobj	0000,0000,-400,-150,friendship_4,chase7_1,10,10
	pathcspecial	4000,0000,-400,-150,zaco_a,chase7_2,10,10
	pathcspecial	1000,-1000,-100,0000,boss_d_4,kamome,10,10
	pathcspecial	1000,1000,-100,0000,boss_d_4,kamome,10,10
	pathcspecial	2000,-1000,-100,0000,boss_d_4,kamome,10,10
	nessie	6000,-400,0000,5000,deg180,40
	mapobj	0000,0100,-50,4700,item_6,item6_Istrat
	setalvar	sbyte1,1
	nessie	3000,-400,0000,5000,deg45,40
	mapmother	4000,0000,0000,3000,mother1,mother2_istrat,mother_snakes
	mapobj	3000,0300,0000,4000,snake_1,seadragon2_Istrat	
	mapobj	2500,-400,0000,4000,snake_1,seadragon2_Istrat	
	nessie	3000,-200,0000,5000,deg22,10
	maprem	mother1
	mapobj	3000,0150,0000,4000,snake_1,seadragon2_Istrat		
	mapobj	2500,0000,-140,4000,nullshape,up1man_Istrat
	mapobj	2000,0000,0000,4000,snake_1,seadragon2_Istrat		
	nessie	2000,-200,0000,5000,deg45,60
	pathcspecial	1500,-1000,-100,0000,boss_d_4,kamome,10,10
	pathcspecial	1500,1000,-100,0000,boss_d_4,kamome,10,10
	pathobj	0000,-750,-400,0000,friendship_4,chase6_1,10,10
	pathcspecial	0000,-720,-400,0000,zaco_a,chase6_2,10,10
	pathcspecial	2500,-1000,-100,0000,boss_d_4,kamome,10,10

	pathcspecial	1000,0200,000,4000,f_fish,e_flyfish,10,10
	pathcspecial	1000,0000,000,4000,f_fish,e_flyfish,10,10
	pathcspecial	3000,-200,000,4000,f_fish,e_flyfish,10,10
	mapobj	1000,0000,0000,2000,nullshape,torpedo_Istrat	
	mapobj	1000,0-300,0000,2000,nullshape,torpedo_Istrat	
	mapobj	4000,0300,0000,2000,nullshape,torpedo_Istrat	

	mapobj	1000,0200,-200,2000,gate_0,gate_Istrat
	pathobj	0000,3000,-100,1000,nullshape,e_gate,10,10

.pdead	mapwait	1000
	mapgotoifplayerdead	.pdead
	mapfadetoground
	mapwait	0500
	mapplayermode	onplanet
	mapwait	4000

	mapobj	0500,0150,0000,1500,stalk,tree1_istrat
	pathspecial	0000,-300,0000,3100,bom_wing,ponpon,10,10
	mapobj	0500,0300,0000,1500,stalk,tree1_istrat
	mapobj	0500,-300,0000,1500,stalk,tree1_istrat
	pathspecial	0000,0300,0000,3100,bom_wing,ponpon,10,10
;skillfly
	skillfly_init
	skillfly_set -300,-50,2300
	roottree	0800,-300,0000,2400,-deg45,30
	mapobj	0500,0100,0000,2500,stalk,tree2_istrat
	mapobj	0500,-200,0000,1800,stalk,tree2_istrat
	pathspecial	0000,0200,0000,3100,bom_wing,ponpon,10,10
	mapobj	0500,0000,0000,2500,stalk,tree2_istrat
	skillfly_bonus 0000,-250,-80,1500,item_5,item5_istrat
	setalvar	sbyte1,1
	mapobj	0500,0350,0000,1800,stalk,tree2_istrat
	pathspecial	0000,-300,0000,3100,bom_wing,ponpon,10,10
	mapobj	0500,-150,0000,1800,stalk,tree1_istrat
	mapobj	0500,0300,0000,1800,stalk,tree2_istrat
	roottree	1500,-200,0000,2400,deg11,40
	mapobj	0500,0300,0000,1800,stalk,tree2_istrat
	roottree	1500,0000,0000,2400,deg22,10
	mapobj	0500,-100,0000,1800,stalk,tree2_istrat
	mapobj	0000,0200,-50,2200,item_7,item7_Istrat
	setalvar	sbyte1,1
	roottree	1500,0200,0000,2400,-deg45,30
	pathspecial	0000,0000,0000,3100,bom_wing,ponpon,10,10
	mapobj	0500,-100,0000,1800,stalk,tree2_istrat
	roottree	1500,-200,0000,3000,deg11,10
	mapobj	0500,0300,0000,1800,stalk,tree2_istrat
	roottree	1500,-200,0000,3000,deg11,10
	mapobj	0500,0100,0000,1500,stalk,tree1_istrat
	mapobj	0500,-100,0000,2200,stalk,tree2_istrat
	roottree	0000,0000,0000,3000,deg11,10
	roottree	1500,0200,0000,3000,deg11,40
	mapobj	0500,-200,0000,1800,stalk,tree2_istrat
	mapobj	3500,0300,0000,1800,stalk,tree2_istrat

	pathobj	0000,3000,3000,3000,nullshape,dragonmsg,10,10

;32 specials
;chase 3 times

	fadeoutbgm
	setbgm	bgm_boss1
	mapobj	0000,-100,0000,4000,boss_d_1,chicken_istrat
	setalvar	roty,deg180
	mapwaitboss
	markboss	boss33

	mapwait	1000

	maprts


