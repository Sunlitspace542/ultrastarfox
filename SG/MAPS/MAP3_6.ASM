map3_6
	mapwait	1000
	start_65816
	lda	bgmspeed
	beq	.nochangext
	cmp	#1
	beq	.slowxt
	cmp	#2
	beq	.fastxt
.slowxt
	startbgm	$f4
	bra	.nochangext
.fastxt
	startbgm	$f5
.nochangext
	end_65816
	mapwait	1000
;	mapgoto	.cont2	;skip to boss
;big_missille
;	cspecial	2000,0000,space_viewcy,4000,big_m,misspod_istrat
;	cspecial	2000,0100,space_viewCY-100,4000,big_m,misspod_istrat	
;	cspecial	3000,-100,space_viewCY+100,4000,big_m,misspod_istrat
;	cspecial	2000,-100,space_viewCY-100,4000,big_m,misspod_istrat
;	cspecial	2000,0100,space_viewCY+100,4000,big_m,misspod_istrat
	
;zacos
	mapmother	6000,0000,1035+space_viewcy,1800,mother1,mother2_istrat,map_mine2

	pathcspecial	2000,1000,-700,2000,shark,call_fol,10,10
	pathcspecial	2000,-1000,-700,2000,shark,call_fol,10,10
	pathcspecial	2000,1000,-700,2000,shark,call_fol,10,10
	pathcspecial	2000,-1000,-700,2000,shark,call_fol,10,10
	pathcspecial	04000,-700,100,-100,bzaco_8,patret_ifal,10,10
	maprem	mother1
;
	mapwait	2000

; M formation
	szaco2_mapobj	0,2000,0,0,100

	szaco2_mapobj	-500,1000,-300,100,0
	szaco2_mapobj	500,1000,300,100,100

	szaco2_mapobj	-1000,1000,-400,-100,0
	szaco2_mapobj	1000,1000,400,-100,100

	mapwait	2000
	mapmother	9000,0000,1035+space_viewcy,1800,mother1,mother2_istrat,map_mine2
;friend
	mapif		assaultcheck,.nofriends1
	pathobj	0000,0000,0400,0000,friendship_4,chase3_1,200,10

	pathobj	02000,0000,400,0000,zaco_b,chase3_2,10,10
.nofriends1
	mapobj	2000,200,-200,2000,spacepilon,spacepilon_istrat

	cspecial	1200,0000,2000,3000,uper_m,uperm_Istrat
	cspecial	1200,0100,2000,3000,uper_m,uperm_Istrat
	cspecial	1200,-100,2000,3000,uper_m,uperm_Istrat
	maprem	mother1

	mapif	chkeasteregg1,.finn
	pathobj	5000,0000,0000,3000,paper_1,paper_1b,10,10
	pathobj	5000,0300,-100,3000,paper_1,paper_1b,10,10
	pathobj	6000,-200,100,3000,paper_1,paper_1b,10,10
	pathobj	6000,0200,-100,4000,paper_1,paper_1b,10,10
	pathobj	10000,0100,-400,1500,paper_1,paper_1,10,10
	mapobj	8000,0000,0000,4000,pole_0,pole0_istrat

	pathobj	5000,-200,0200,3000,paper_1,paper_1b,10,10
	pathobj	5000,0100,-100,3000,paper_1,paper_1b,10,10
	pathobj	5000,-200,400,1500,paper_1,paper_1,10,10
	pathobj	6000,-400,150,3000,paper_3,paper_3,10,10
	mapobj	6000,000,-200,4000,pole_0,pole0_istrat
	mapobj	6000,-100,100,4000,pole_0,pole0_istrat
	pathobj	6000,0400,0000,3000,paper_1,paper_1b,10,10
	pathobj	6000,0000,-400,1500,paper_1,paper_1,10,10
	pathobj	8000,0200,200,2000,paper_3,paper_3,10,10
	pathobj	1000,0000,0100,3000,paper_1,paper_1b,10,10
	pathobj	1000,-300,200,3000,paper_1,paper_1b,10,10
	pathobj	5000,-100,-400,1000,paper_1,paper_1,10,10
	pathobj	4000,0000,-400,1500,paper_1,paper_1,10,10

	pathobj	2000,-300,0000,3000,paper_1,paper_1b,10,10
	pathobj	2000,-300,100,3000,paper_1,paper_1b,10,10

	pathobj	05000,-200,200,4000,paper_3,paper_3,10,10
	pathobj	03000,000,200,4000,paper_3,paper_3,10,10
	pathobj	10000,200,200,4000,paper_3,paper_3,10,10
	pathobj	5000,0300,100,3000,paper_1,paper_1b,10,10
	pathobj	6000,-200,100,3000,paper_1,paper_1b,10,10
	pathobj	10000,0200,100,4000,paper_1,paper_1b,10,10

.finn


;mothers
	mapmother	05000,0000,2000,3000,mother1,mother2_istrat,map_uperm
	maprem	mother1
;windmill
	special	0,0,0,4000,round_0,windmill_istrat
	setalvar	roty,deg180
	setalvar	sword1,1

	mapmother	6000,0000,1035+space_viewcy,1800,mother1,mother2_istrat,map_mine2
	maprem	mother1
	cspecial	3000,0000,space_viewCY,4000,asteroid1,misspod_istrat	
;item or gate
;
;	map_setbarshape	solid
;	map_SBtype11	1,1,-1,0
;	map_setbarshape	wire
;	map_SBtype14	0,-1,-1,0
;skillfly
	skillfly_init
	skillfly_set 0000,space_viewCY,6000,100
	mapobj	0000,0000,space_viewCY,6000,item_5,item5_istrat
	setalvar	sbyte1,1
	special		000,-180,-250,6000,r_hou_0,shou0a_istrat
	pathcspecial	000,0180,-250,6000,b_hou_0,damyscr,2,4
	cspecial	000,0300,0000,6000,r_hou_0,shou0a_istrat
	special		000,0180,0250,6000,r_hou_0,shou0a_istrat
	pathcspecial	000,-180,0250,6000,b_hou_0,damyscr,2,4
	cspecial	6000,-300,0000,6000,r_hou_0,shou0a_istrat
	skillfly_bonus 0000,0000,space_viewCY,1500,item_6,item6_istrat
	setalvar	sbyte1,1
	skillfly_set 0000,space_viewCY,1500,100
	mapwait	1500
	skillfly_bonus 0000,0000,space_viewCY,1500,item_7,item7_istrat
	setalvar	sbyte1,1
;	map_SBtype6	0,-3,7,0
;	map_SBtype13	0,3,1,0
;			w,x,y,z,init(0-7),speed
;	map_SBtype18	0,0,0,0,1,2   ;X
;	map_SBtype18	0,0,0,0,3,-2

	mapwait	1000
;friend
	mapif		assaultcheck,.nofriends2
	pathobj	0000,-900,0000,0000,friendship_4,chase2_1,10,10

	pathobj	02000,-900,000,0000,zaco_b,chase2_2,10,10
.nofriends2
	mapobj	0000,-280,space_viewCY,3000,gate_0,gate_istrat
	pathobj	2000,3000,0,1000,nullshape,e_gate,10,10
	mapwait	1000
	start_65816
	lda	bgmspeed
	beq	.nochangextw
	cmp	#1
	beq	.slowxtw
	cmp	#2
	beq	.fastxtw
.slowxtw
	startbgm	$f4
	bra	.nochangextw
.fastxtw
	startbgm	$f5
.nochangextw
	end_65816

;warp
	mapmother	02000,0000,2000,3000,mother1,mother2_istrat,map_uperm
	cspecial	2000,0000,0000,1500,warp,warp_Istrat
	special	2000,0000,0000,1500,warp,warp_Istrat
	cspecial	4000,0000,0000,1500,warp,warp_Istrat
	maprem	mother1
;bazooka
	cspecial	1000,-100,1000,3500,bazooka,bazookaL_Istrat
	cspecial	1200,0000,2000,3000,uper_m,uperm_Istrat
	cspecial	1200,0100,2000,3000,uper_m,uperm_Istrat
	cspecial	3000,0100,1000,3500,bazooka,bazookaR_Istrat
	skillfly_init
	skillfly_set 0000,space_viewCY,4000,100
	pathcspecial	000,0000,0000,4000,b_hou_0,damyscr,2,4
	mapmother	4000,0000,1035+space_viewcy,1500,mother1,mother2_istrat,map_mine2
	skillfly_bonus 4000,0000,space_viewCY,1500,item_5,item5_istrat
;supply_bird
	pathobj	4000,-400,-300,0,my_bird,my_bird,10,10
	maprem	mother1

	mapmother	3000,0000,2000,3000,mother1,mother2_istrat,map_uperm
	cspecial	3000,0100,space_viewCY-100,3000,big_m,misspod_istrat	
	cspecial	2000,-100,space_viewCY+100,3000,big_m,misspod_istrat

	cspecial	4000,-200,1000,3500,bazooka,bazookaL_Istrat

	pathspecial	0200,0100,100,3000,shieldr,e_shieldr,10,10
	pathcspecial	0200,0000,000,3000,shieldr,e_shieldr,10,10
	pathcspecial	5000,-100,100,3000,shieldr,e_shieldr,10,10
	mapobj	10000,200,-200,2000,spacepilon,spacepilon_istrat
	maprem	mother1
	mapwait	4500
;-------------------------------------------------------------------
.boss

	mapwait	1


	start_65816
	a8
	lda	pshipflags
	and	#psf_noctrl
	bne	.twait
	switch	.tcont
.twait	switch	.boss
	end_65816

.tcont

; king joh boss
 
.owait	mapwait	5
	start_65816
	a8
	lda		pshipflags2
	and		#psf2_playerHP0
	beq		.ocont
	switch	.owait
.ocont
;	lda		splayerflymode
;	cmp		#spfm_inside
;	beq		.doout
;	switch		.cont2
.doout	lda		#spfm_tonorm
;	sta		splayerflymode
;	jsl		changeviewmode_l
	end_65816
;	setvar.b	splayerflymodeopt,spfmo_AB
	mapwait		2000
.cont2

	fadeoutbgm
	setbgm	5

	start_65816
	lda	playertwoactivated
	beq	.donewithp2
	jsl	doascene
	a16
	lda	#400
	sta	viewdist
	sta	outviewdist
	sta	outdist
	a8
.donewithp2
	end_65816
	mapobj	0000,0000,2000,2500,boss_f_3,bossf_Istrat
	mapwaitboss
	mapif	chkeasteregg2,.hello
;	checkcockpit
	mapwait	1000

	mapobj	2000,0000,-100,5000,gate_0,gate_ISTRAT
	pathobj	4000,3000,3000,1000,nullshape,e_gate,10,10
	setrestart	

	mapwait	1000
	start_65816
	lda	bgmspeed
	beq	.nochangextqq
	cmp	#1
	beq	.slowxtqq
	cmp	#2
	beq	.fastxtqq
.slowxtqq
	startbgm	$f4
	bra	.nochangextqq
.fastxtqq
	startbgm	$f5
.nochangextqq
	end_65816
.hello
	markboss	boss36
	maprts
;-------------------------------------------------------------------

