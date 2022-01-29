map2_4

;--------------------------------------------------------------------
	mapwait	600

	pathobj	0000,0180,-300,-200,whale,e_whale,10,10

	map_sfish	2800,0000,-100,1000,10

	pathobj	1000,0000,-150,3000,ray_0,e_ray_0,10,10
	pathobj	1000,150,0000,3000,ray_0,e_ray_0,10,10
	pathobj	1000,-150,0000,3000,ray_0,e_ray_0,10,10

	pathobj	300,1500,900,3200,ika,ika_2,10,10
	pathobj	5000,1800,1100,2800,ika,e_ika,10,10

	pathcspecial	0200,0100,-300,00,zaco_7,egu1,4,10
	pathcspecial	0200,0300,-600,00,zaco_7,egu1,4,10
	pathcspecial	6000,0500,-900,00,zaco_7,egu1,4,10

	pathobj	1000,-1500,900,2800,ika,e_ika,10,10
	pathobj	1000,1500,900,3200,ika,ika_2,10,10
	pathobj	0000,-900,0000,0000,friendship_4,chase2_1,10,10
	pathcspecial	4000,-900,0000,0000,zaco_b,chase2_2,10,10

	pathcspecial	0500,300,-1400,2000,zaco_b,egu3,10,10
	pathcspecial	12000,-300,-1400,2000,zaco_b,egu3,10,10
	
.amoebas1	mapmother	200,0000,0000,4000,mother1,mother2_istrat,map_amoebas
	maprem	mother1   

	mapwait	1000
	maploop	.amoebas1,03
	pathobj	0000,3000,3000,3000,nullshape,amebmsg,10,10

	mapmother	200,0000,0000,4000,mother1,mother2_istrat,map_amoebas
	maprem	mother1   

	mapobj	0000,100,-100,4500,nullshape,up1man_Istrat
	setalvar.w	sword2,item_0&WM
	mapwait	1000

	mapmother	200,0000,0000,4000,mother1,mother2_istrat,map_amoebas
	maprem	mother1   

	mapwait	1000

	mapmother	8000,0000,0000,4000,mother1,mother2_istrat,map_amoebas
	pathcspecial	0300,0300,-300,0000,zaco_7,egu1_ifro,4,10
	pathcspecial	0300,0500,-600,0000,zaco_7,egu1_irab,4,10
	pathcspecial	4000,0700,-900,0000,zaco_7,egu1_ifal,4,10
	maprem	mother1   

	mapwait	5000

	cspecial	4000,-700,-300,3000,w_l,winglazerman_Istrat
	pathobj	0000,0000,0000,3000,nullshape,braymsg,10,10
	pathobj	6700,0000,-250,0000,ray_1,e_ray_1,10,10
	pathobj	0000,000,-600,000,friendship_4,chase5_1,10,10
	pathcspecial	0000,1500,100,1300,zaco_b,chase5_2,10,10
	pathcspecial	5000,000,-600,000,zaco_b,chase5_3,10,10

	pathobj	5000,0000,250,0000,ray_1,e_ray_1,10,10
	pathspecial	0500,0000,-1400,2000,s_zaco_0,egu3,10,10
	pathcspecial	0500,-300,1400,2000,zaco_b,egu3,10,10
	pathcspecial	8000,0300,1400,2000,zaco_b,egu3,10,10

	pathobj	0000,1200,0200,0600,friendship_4,chase1_1,10,10
	pathcspecial	3000,1200,0200,0600,zaco_b,chase1_2,10,10

	mapobj	0000,0000,0000,4000,gate_0,gate_istrat
	pathobj	1000,3000,0,1000,nullshape,e_gate,10,10

	mapwait	1000

	pathcspecial	0200,0000,0200,-100,bzaco_8,patret,10,10
	pathcspecial	0200,0800,0-200,-100,bzaco_8,patret,10,10
	pathcspecial	0200,-800,0-200,-100,bzaco_8,patret,10,10
	map_sfish	800,0000,-100,1000,8

	pathobj	5000,-1500,1100,2800,ika,ika_2,10,10

	pathobj	0000,-100,-250,0000,ray_1,e_ray_1,10,10

	pathobj	500,-150,-120,3000,ray_0,e_ray_0,10,10
	pathobj	2000,-200,0000,3000,ray_0,e_ray_0,10,10
	pathobj	500,0050,-150,3000,ray_0,e_ray_0,10,10
	pathobj	500,0050,150,3000,ray_0,e_ray_0,10,10

;	pathobj	0000,200,-250,0000,ray_1,e_ray_1,10,10
	pathobj	3000,-200,250,0000,ray_1,e_ray_1,10,10

	pathobj	500,-150,-120,3000,ray_0,e_ray_0,10,10
	pathobj	500,2100,1000,3000,ika,ika_2,10,10
	pathobj	500,-200,0000,3000,ray_0,e_ray_0,10,10
	map_sfish	000,0000,-100,1000,4
	pathobj	5000,0080,-200,3000,ray_0,e_ray_0,10,10
	pathcspecial	0000,-600,-600,000,zaco_7,egu1,10,10
	pathspecial	0000,300,1400,2000,s_zaco_0,egu3,10,10
	pathspecial	5000,-300,-1400,2000,s_zaco_0,egu3,10,10

	pathobj	0000,0000,0400,0000,friendship_4,chase3_1,10,10
	pathcspecial	13000,000,0400,0000,zaco_b,chase3_2,10,10


	pathobj	0000,0000,0000,3000,nullshape,rem_whale,10,10

	pathobj	0000,3000,3000,3000,nullshape,handmsg,10,10


;22 specials
;chase 3 times

	fadeoutbgm
	setbgm	5

	mapjsr	armsmap
	mapwaitboss

	markboss	boss24

	mapwait	2000

	maprts




