level6_3					;LABEL OF LEVEL
	start_65816				;Use 65c816 code, not map code
	lda	playertwoactivated	;
	cmp	#0					;
	beq	.anop2				;	stuff for 2 player mode
	lda	#40					;
	sta	playertwoready		;
.anop2						;
	end_65816				;Don't use 65c816 anymore, go back to map code

	initlevel	6_3,mscramwipe_circle		;init the level using 6_3 data from bgs.asm

	mapwait	1000							;wait 1000 units

	setrestart								;set a restart point if the player dies
	
	mapwait	200								;wait 200 units

;part 1


	cspecial	0000,0200,Space_viewCY,800,cameleon,cameleon_istrat
	special	2000,-200,Space_viewCY,800,cameleon,cameleon_istrat

	mapwait	300

	cspecial	0000,0075,Space_viewCY,800,cameleon,cameleon_istrat
	special	2000,-0075,Space_viewCY,800,cameleon,cameleon_istrat
	
	mapwait	300

;worm
	special	0000,-128,Space_viewCY+128,2000,d_head_0,wormhead_Istrat
	setvarobj	mapvar1
	mapwait	150	
	REPT	15
	cspecial	0000,-128,Space_viewCY+128,2000,d_body_0,worm_Istrat
	setalvarptr.w	sword1,mapvar1
	setvarobj	mapvar1
	mapwait	150
	ENDR
	mapobj	0000,-128,Space_viewCY+128,2000,d_body_0,worm_Istrat
	setalvarptr.w	sword1,mapvar1
	setvarobj	mapvar1

	mapwait	500


	pathobj	0000,0000,-700,1000,nullshape,check,10,10
	cspecial	0000,0100,0000,1500,warp,warp_Istrat
;	mapwait	2000
;	special	0000,500,space_viewCY-300,1000,round_0,windmill_istrat
;	setalvar	speed,127
;	setalvar	roty,64
;	setalvar	rotx,5
;	mapwait	0300
;	setalvar	roty,40				;lagfest
;	mapwait	0200
;	setalvar	roty,20
;	mapwait	0200
;	setalvar	roty,0
;	mapwait	01400
;	setalvar	roty,250
;	mapwait	0100
;	setalvar	roty,230
;	mapwait	0100
;	setalvar	roty,200
;	mapwait	0100
;	setalvar	roty,170
;	mapwait	0100
;	setalvar	roty,140
;	mapwait	0100
;	setalvar	speed,0
;	setalvar	rotx,0
;	mapwait	3000
;	setalvar	speed,100
;	setalvar	sword1,4

	cspecial	2000,0100,space_viewCY-100,4000,big_m,misspod_istrat	
	cspecial	1000,-100,space_viewCY+100,4000,big_m,misspod_istrat
	cspecial	1000,-200,space_viewCY-100,4000,big_m,misspod_istrat
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
	skillfly_bonus 0000,000,0000,1500,item_6,item6_istrat
	setalvar	sbyte1,1
	skillfly_set 0000,0000,1500
	mapwait	1500

	map_SBtype0	0,-1,0,0
	map_SBtype0	0,6,0,0
	map_SBtype0	3,1,0,0
	map_SBtype0	0,-1,0,0
	map_SBtype0	0,-4,0,0
	map_SBtype0	3,1,0,0
	cspecial	1000,0000,space_viewcy-200,2000,zaco_7,szaco5_Istrat	; fly out of ship2
	cspecial	2000,400,space_viewcy+200,2000,zaco_7,szaco5_Istrat	; fly out of ship2
	cspecial	3000,-400,space_viewcy+200,2000,zaco_7,szaco5_Istrat	; fly out of ship2
	map_SBtype0	2,-1,0,0
	map_SBtype0	2,4,0,0
;	map_SBtype0	2,-3,0,0
	map_SBtype0	1,-1,0,0
;	map_SBtype0	0,-4,0,0
	
	setalvar	sbyte1,1

	map_SBtype11	4*2,3,0,0
	map_SBtypeC		0*2,-1,0,0
	map_SBtypeB		1*2,-1,0,0
	map_SBtypeB		1*2,1,-1,0
;	map_SBtype8		1*2,-1,0,0
	
	cspecial	0000,-2*Xlen,space_viewCY+(1*Ylen),dist+(4*Zlen),Bwarker_3,spacebarwalker_Istrat
	special	0000,0*Xlen,space_viewCY+(1*Ylen),dist+(6*Zlen),s_wark_0,spacebarwalker_Istrat
	cspecial	0000,3*Xlen,space_viewCY+(1*Ylen),dist+(7*Zlen),Bwarker_3,spacebarwalker_Istrat
	map_SBtypeF	15*2,0,1,0
	
	mapobj	0500,0300,Space_viewCY-200,3000,big_meteor,slowmeteor_Istrat
	mapobj	0500,-100,-200,3500,big_meteor,slowmeteor_Istrat	
	mapobj	0500,-600,Space_viewCY,35000,big_meteor,slowmeteor_Istrat
	mapobj	0500,0600,0100,3000,big_meteor,slowmeteor_Istrat
	mapobj	0500,-400,Space_viewCY+400,3000,big_meteor,slowmeteor_Istrat
	mapif		assaultcheck,.nofriends2ya
	pathobj	0000,0000,0400,0000,friendship_4,chase3_1,200,10

	pathobj	0000,0000,400,0000,boss_e_4,chase3_2,10,10
.nofriends2ya
	mapobj	0200,200,-200,2000,spacepilon,spacepilon_istrat
	mapobj	0500,-700,Space_viewCY+300,4000,big_meteor,slowmeteor_Istrat
	mapobj	0500,0300,Space_viewCY-200,4000,big_meteor,slowmeteor_Istrat
;	mapobj	0500,-100,-200,4000,big_meteor,slowmeteor_Istrat
	mapobj	1000,000,Space_viewCY,4000,big_meteor,slowmeteor_Istrat	

	cspecial	6000,0000,1500,2000,wire_man,wireman_Istrat
	pathobj	1000,0000,0000,3000,paper_1,paper_1b,10,10
	pathobj	1100,0300,-100,3000,paper_1,paper_1b,10,10
	pathobj	300,1500,Space_viewCY,3200,ika,ika_2,10,10
	pathobj	1200,-200,100,3000,paper_1,paper_1b,10,10
	pathobj	1300,0200,-100,4000,paper_1,paper_1b,10,10
	pathobj	1400,0100,-400,1500,paper_1,paper_1,10,10


	setalvar	sbyte1,1
	special		000,-180,-250,6000,r_hou_0,shou0a_istrat
	pathcspecial	000,0180,-250,6000,b_hou_0,damyscr,2,4
	cspecial	000,0300,0000,6000,r_hou_0,shou0a_istrat
	special		000,0180,0250,6000,r_hou_0,shou0a_istrat
	pathcspecial	000,-180,0250,6000,b_hou_0,damyscr,2,4
	cspecial	1000,-300,0000,6000,r_hou_0,shou0a_istrat
	pathobj	1000,-1500,900,2800,ika,e_ika,10,10
	pathobj	1000,1500,900,3200,ika,ika_2,10,10

	
	mapobj	0600,-400,Space_viewCY-100,4000,big_meteor,slowmeteor_Istrat
	mapobj	0600,0200,0100,4000,big_meteor,slowmeteor_Istrat
	mapobj	0600,-150,Space_viewCY+200,4000,big_meteor,slowmeteor_Istrat
	mapobj	0600,-650,0100,4000,big_meteor,slowmeteor_Istrat
	mapobj	0600,0100,Space_viewCY-200,4000,big_meteor,slowmeteor_Istrat
	mapobj	0600,-100,200,4000,big_meteor,slowmeteor_Istrat	
	mapobj	0600,600,Space_viewCY,4000,big_meteor,slowmeteor_Istrat
	mapobj	0600,0200,0100,4000,big_meteor,slowmeteor_Istrat
	pathspecial	0200,0100,100,3000,shieldr,e_shieldr,10,10
	pathcspecial	0200,0000,000,3000,shieldr,e_shieldr,10,10
	pathcspecial	5000,-100,100,3000,shieldr,e_shieldr,10,10
	mapobj	0600,200,-200,2000,spacepilon,spacepilon_istrat
	mapobj	600,-100,0100,4000,big_meteor,slowmeteor_Istrat
	mapobj	600,0300,Space_viewCY-200,4000,big_meteor,slowmeteor_Istrat
	mapobj	600,-400,-350,4000,big_meteor,slowmeteor_Istrat
	mapobj	600,-350,Space_viewCY,4000,big_meteor,slowmeteor_Istrat
	mapobj	650,0200,0100,4000,big_meteor,slowmeteor_Istrat
	mapobj	600,-100,-200,4000,big_meteor,slowmeteor_Istrat
;	mapwait	1000
	mapobj	0600,200,space_viewcy,2000,spacepilon,spacepilon_istrat
	mapobj	0600,-200,space_viewcy-250,2000,spacepilon,spacepilon_istrat
	mapobj	0600,000,space_viewcy+250,3000,spacepilon,spacepilon_istrat

	mapobj	0500,0180,100,4000,big_meteor,slowmeteor_Istrat
	mapobj	0500,-480,-400,4000,big_meteor,slowmeteor_Istrat
	mapobj	0500,0000,-200,4000,big_meteor,slowmeteor_Istrat

	mapwait	300

	special	0000,-128,Space_viewCY+128,2000,d_head_0,wormhead_Istrat
	setvarobj	mapvar1
	mapwait	150
	
	REPT	5
	cspecial	0000,-128,Space_viewCY+128,2000,d_body_0,worm_Istrat
	setalvarptr.w	sword1,mapvar1
	setvarobj	mapvar1
	mapwait	150
	ENDR

	mapobj	0500,500,300,3000,w_l,winglazerman_Istrat
	
	mapwait	1500
	

	mapobj	0600,0180,100,4000,big_meteor,slowmeteor_Istrat
	mapobj	0600,-580,100,4000,big_meteor,slowmeteor_Istrat
	mapobj	0600,0000,-300,4000,big_meteor,slowmeteor_Istrat
	mapobj	0600,0700,Space_viewCY+200,4000,big_meteor,slowmeteor_Istrat
	pathobj	0700,000,2000,2600,boss_e_4,minicas2,10,10
;	pathobj	0700,100,2000,2600,boss_e_4,minicas2,10,10
;	pathobj	1000,-100,2000,2600,boss_e_4,minicas2,10,10

	mapwait	2000

;gate
	mapobj	0400,0150,-100,4000,gate_0,gate_ISTRAT
	pathobj	2400,3000,3000,1000,nullshape,e_gate,10,10

	mapwait	2000
;part 2

	mapwait	1000
	
	map_setbarshape	wire
	map_SBtype18	3,2,0,0,2,0
	map_SBtype18	3,2,0,0,2,-4
	map_SBtype18	3,2,0,0,2,0
;	special	00,100,-300,4000,r_hou_0,shou0a_istrat
	map_SBtype18	3,4,0,0,2,4
	map_SBtype18	3,4,0,0,2,0
	map_SBtype10	3,4,0,0
;	map_setbarshape	solid
;	map_SBtype0	2,6,0,0
;	map_SBtype0	2,-6,0,0
;	map_SBtype0	2,4,0,0
;	map_SBtype0	3,-4,0,0
;	map_SBtype0	3,2,0,0
;	map_SBtype0	3,-2,0,0
;	map_SBtype0	2,2,0,0
;	map_SBtype0	6,-2,0,0
;	map_SBtype12	8,-2,0,0
	MAPWAIT	2500

	mapplayermode	inspacenomove
	
	mapwait	1500
;DRIVE-BY SHOOTING
	mapobj	000,-2200,-200,4000,boxxie,boxxiedriveby_istrat
	mapwait	2500
;EXPLODE
	mapobj	000,000,Space_viewCY,4000,nullshape,fakeexp_istrat
	mapobj	400,300,Space_viewCY,4000,nullshape,fakeexp_istrat
	mapobj	800,-300,Space_viewCY,4000,nullshape,fakeexp_istrat
	mapobj	1200,000,Space_viewCY,4000,nullshape,fakeexp_istrat
	mapwait	1965		;sync bg change with white flash taking over screen
;CHANGE BG
	SETVAR.N	FADEPAL,32
	setvar	palfrom,0
	setvar	palto,0
	setvar	pallen,32
	SETVAR.N	INFOG,0
	MAPCODE_JSL	BG_6_32_1	
;RESUME
	mapwait	500
	mapplayermode	inspace	
	mapwait	1000
	pathcspecial	0200,0100,300,00,zaco_7,egu1,4,10
	pathcspecial	0200,0300,600,00,zaco_7,egu1,4,10
	pathcspecial	0800,0500,-300,00,zaco_7,egu1,4,10
	mapwait	1500
	pathspecial	0200,0000,-200,3000,shieldr,e_shieldr,10,10
	pathspecial	0200,0000,200,3000,shieldr,e_shieldr,10,10
	pathcspecial	0200,0200,0,3000,shieldr,e_shieldr,10,10
	pathobj	0000,-250,Space_viewcy,0,my_bird,my_bird,10,10
	pathcspecial	12000,-200,0,3000,shieldr,e_shieldr,10,10

	special	1000,0000,-100,800,cameleon,cameleon_istrat
	cspecial	1000,-100,0100,800,cameleon,cameleon_istrat
	special	1000,100,0100,800,cameleon,cameleon_istrat

	mapwait	300

	mapif		assaultcheck,.nofriends44444
	pathobj	0000,1200,0200,0600,friendship_4,chase4_1,200,10

	pathcspecial	1000,1200,0200,0600,cameleon,chase4_2,10,10
.nofriends44444
	mapobj	4000,000,0000,2000,spacepilon,spacepilon_istrat

	cspecial	1000,0000,-100,3000,w_l,winglazerman_istrat
	pathobj	300,500,Space_viewCY,3200,ika,ika_2,10,10
	pathobj	5000,-500,Space_viewCY,2800,ika,e_ika,10,10
	pathobj	300,000,Space_viewCY,3200,ika,ika_2,10,10
	pathcspecial	0200,0100,-300,00,zaco_7,egu1,4,10
	pathcspecial	0200,0300,-600,00,zaco_7,egu1,4,10
	pathcspecial	0800,0500,-900,00,zaco_7,egu1,4,10

	mapobj	000,-400,-100,4000,blueasteroid,break_othermeteor_istrat
	mapobj	000,250,0100,4200,aasteroid,break_othermeteor_istrat
	mapobj	300,100,-100,4400,asteroid2,break_meteor_istrat
	mapobj	000,-350,0100,4600,aasteroid,break_othermeteor_istrat
	mapobj	000,-120,-100,4800,aasteroid,break_othermeteor_istrat
	mapobj	800,240,0100,5000,blueasteroid,break_othermeteor_istrat
	mapobj	000,-400,-100,5200,blueasteroid,break_othermeteor_istrat
	mapobj	300,250,0100,5400,blueasteroid,break_othermeteor_istrat
	mapobj	000,100,-100,5600,asteroid2,break_meteor_istrat
	mapobj	000,-350,0100,5800,aasteroid,break_othermeteor_istrat
	
	pathobj	1000,0000,Space_viewCY-30,3000,ray_0,e_ray_0,10,10
	pathobj	1000,150,Space_viewCY+30,3000,ray_0,e_ray_0,10,10
	pathobj	1000,-150,Space_viewCY-30,3000,ray_0,e_ray_0,10,10

	special	0000,-128,Space_viewCY+128,2000,d_head_0,wormhead_Istrat
	setvarobj	mapvar1
	mapwait	150
	
	REPT	5
	cspecial	0000,-128,Space_viewCY+128,2000,d_body_0,worm_Istrat
	setalvarptr.w	sword1,mapvar1
	setvarobj	mapvar1
	mapwait	150
	ENDR


	mapwait	800
	
	
	mapobj	000,-400,-100,4000,blueasteroid,break_othermeteor_istrat
;	mapobj	000,250,0100,4200,asteroid2,break_othermeteor_istrat
	mapobj	100,100,-100,4400,blueasteroid,break_othermeteor_istrat
	mapobj	100,-350,0100,4600,aasteroid,break_othermeteor_istrat
	mapobj	100,-120,-100,4800,aasteroid,break_othermeteor_istrat
	mapobj	100,240,0100,5000,aasteroid,break_meteor_istrat
;	mapobj	000,-400,-100,5200,asteroid2,break_othermeteor_istrat
	mapobj	100,250,0100,5400,asteroid2,break_meteor_istrat
	mapobj	100,100,-100,5600,blueasteroid,break_othermeteor_istrat
	mapobj	100,-350,0100,5800,asteroid1,break_othermeteor_istrat
;	mapobj	000,-120,-100,6000,asteroid2,break_othermeteor_istrat
	mapobj	100,240,0100,6200,blueasteroid,break_othermeteor_istrat
	mapobj	100,-400,-100,6400,aasteroid,break_othermeteor_istrat
;	mapobj	000,250,0100,6600,asteroid2,break_othermeteor_istrat
	mapobj	100,100,-100,6800,asteroid2,break_meteor_istrat
;	mapobj	100,-350,0100,7000,asteroid2,break_othermeteor_istrat
	mapobj	100,-120,-100,7200,blueasteroid,break_othermeteor_istrat
	mapobj	100,240,0100,7400,blueasteroid,break_othermeteor_istrat

	mapwait	700
	
	mapif		assaultcheck,.nofriends2fkufromkando
	pathobj	0000,1000,-600,2000,friendship_4,chase5_1,10,10

	pathcspecial	0000,1500,100,4300,shark,chase5_2,10,10
	pathcspecial	5000,000,-600,3000,shark,chase5_3,10,10
.nofriends2fkufromkando
;suicidal barrage
;	pathcspecial	0300,-300,Space_viewCY,2800,bzaco_8,egu5,10,10
;	pathspecial	0300,0000,Space_viewCY,2500,s_zaco_0,egu5,10,10
	pathcspecial	0300,0300,Space_viewCY,3100,bzaco_8,egu5,10,10
	pathcspecial	300,100,Space_viewCY,4000,shark,call_fol,10,10
	pathcspecial	300,-100,Space_viewCY,4000,shark,call_fol,10,10
;	pathcspecial	0300,000,Space_viewCY,2800,bzaco_8,egu5,10,10
	pathspecial	0900,0000,Space_viewCY-200,4500,s_zaco_0,egu5,10,10
	pathcspecial	0900,0000,Space_viewCY+200,3100,bzaco_8,egu5,10,10

	mapwait	1500
	
	mapobj	000,-400,-100,4000,blueasteroid,break_othermeteor_istrat
	mapobj	000,250,0100,4200,aasteroid,break_othermeteor_istrat
	mapobj	000,100,-100,4400,asteroid2,break_meteor_istrat
	mapobj	000,-350,0100,4600,aasteroid,break_othermeteor_istrat
	mapobj	000,-120,-100,4800,aasteroid,break_othermeteor_istrat
	mapobj	400,240,0100,5000,blueasteroid,break_othermeteor_istrat
	mapobj	400,-400,-100,5200,blueasteroid,break_othermeteor_istrat
	mapobj	400,250,0100,5400,blueasteroid,break_othermeteor_istrat
	mapobj	400,100,-100,5600,asteroid2,break_meteor_istrat
	mapobj	400,-350,0100,5800,aasteroid,break_othermeteor_istrat
	
	mapwait	500
	
	pathcspecial	300,100,Space_viewCY,4000,shark,call_fol,10,10
	pathcspecial	400,-100,Space_viewCY,4000,shark,call_fol,10,10
;	pathcspecial	300,-200,Space_viewCY+200,4000,shark,call_fol,10,10
;	pathcspecial	400,300,Space_viewCY-200,4000,shark,call_fol,10,10
	mapobj	000,250,0100,5400,blueasteroid,break_othermeteor_istrat
	mapobj	000,100,-100,5600,asteroid2,break_meteor_istrat
	mapobj	000,-350,0100,5800,aasteroid,break_othermeteor_istrat	
	
;end part 2, boss here
	mapwait	5000
	mapwait	5000

;end part 2
	mapwait	200
	
	fadeoutbgm

	setbgm	5
	mapobj	0000,0000,0000,3500,boxxie,newboss1_istrat
	mapwaitboss

	mapwait	500
	start_65816
	jsl	clearmap_l
	end_65816

	mapwait	2000
	
	mapjsr	cl_warp

	mapend									;end map
