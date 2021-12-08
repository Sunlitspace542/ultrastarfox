map1_1b


	INCMAP	<c1-1>
	fileslog	maps\1-1.asm
	IFEQ	1
	mapgoto	.boss

;	mapgoto	.z1t	

.faw	
	mapobj	0425,0200,-100,-200,zaco_5,fzaco_Istrat
	mapobj  0425,0200,-100,-200,zaco_6,fzaco_Istrat
	mapobj	2000,0200,-100,-200,zaco_5,fzaco_Istrat

	mapobj	0000,0100,-100,-200,myship_4,friend0_Istrat


;	mapwait	16000
;	mapgoto	.faw

	


	tstart	4,0,south
	tsouth
	tsouth
	tsouth
	tsouth
	twest
	twest
	tnorth
	tnorth
	tnorth
	tnorth
	tnorth
	tanothertruck
	tnorth
	twest
	tnorth
	tnorth
	tnorth
	teast
	teast
	tsouth
	tsouth
	tsouth
	tsouth
	teast
	tright

	mapwait	11*tsize*4



; houdai test
;.here4
;	mapobj	0000,-300,0000,2000,houdai_0,houdai_Istrat
;	mapobj	0000,300,0000,2400,houdai_0,houdai_Istrat
;	mapwait	3000
;	maploop	.here3,2
;	mapgoto .here4


;-------------------------------------------------------
; missile tank test
.here3
;	mapgoto	.missthislot
	mapobj	0000,-1000,0000,2000,m_tank,misstank_Istrat
	setalvar	roty,-deg90
	addalvarptr.w	worldx,player_posx
	mapobj	0000,1000,0000,2000,m_tank,misstank_Istrat
	setalvar	roty,deg90
	addalvarptr.w	worldx,player_posx
	mapwait	5000
	maploop	.here3,2

	mapobj	4000,0000,-150,4000,gate_0,gate_istrat

;-------------------------------------------------------
; woods missile test

.here1
	mapobj	0000,-200,0000,3000,miss_1_1,nocoll_Istrat
	setvarobj	mapvar1
	mapobj	0000,-200,-10,3000,miss_1_2,woods_Istrat
	setalvarptr.w	ptr,mapvar1
	setalvar	rotx,-deg90
	mapwait	1000

	mapobj	0000,00,0000,3000,miss_1_1,nocoll_Istrat
	setvarobj	mapvar1
	mapobj	0000,00,-10,3000,miss_1_2,woods_Istrat
	setalvarptr.w	ptr,mapvar1
	setalvar	rotx,-deg90

	mapwait	1000
	mapobj	0000,200,0000,3000,miss_1_1,nocoll_Istrat
	setvarobj	mapvar1
	mapobj	0000,200,-10,3000,miss_1_2,woods_Istrat
	setalvarptr.w	ptr,mapvar1
	setalvar	rotx,-deg90
	mapwait	1000
	maploop	.here1,3


;-------------------------------------------------------
; cameleon2 test
;
;	mapobj	0000,0000,0000,1000,cameleon,cameleon2_Istrat
;.here1	mapwait	2000
;	mapgoto	.here1

;-------------------------------------------------------
; evader test
;.here1	
;	mapobj	8000,0,-600,2000,mosra_1,evader_Istrat
;	mapwait	2000
;	mapgoto	.here1



;-------------------------------------------------------
	mapwait	4000

.here2
	ttruck	9,0,deg90
	thoriz	9,0
	thoriz	7,0
	thoriz	5,0
	tcorner	4,0,deg180,1

	tvert	4,1
	tcorner	4,2,deg0,0
	thoriz	3,2
	thoriz	1,2
	tcorner	0,2,deg180,1

	tvert	0,3
	tcorner	0,4,deg90,1
	thoriz	1,4
	tcorner	2,4,deg270,0
	tvert	2,5
	tvert	2,7
	tvert	2,9
	tcorner	2,10,deg90,1
	thoriz	3,10
	tcorner	4,10,deg0,1
	tvert	4,9
	tcorner	4,8,deg180,0
	thoriz	5,8
	thoriz	7,8
	thoriz	9,8

	mapwait	11*tsize*4

;-------------------------------------------------------

	mapobj	10000,0000,0000,4000,wire_man,wireman_Istrat
	mapobj	10000,0000,0000,4000,bom_wing,bomwing_Istrat

	mapobj	0000,0000,-100,4000,nullshape,up1man_Istrat
	setalvar.w	sword2,item_0&WM
	mapwait	10000


;----------------------------------------------------------------------
; zaco 1 test
.z1t	

	mapobj	0000,-500,-200,-200,zaco_5,zaco1L_istrat
	mapwait	1000

	mapobj	0000,500,-200,-200,zaco_5,zaco1R_istrat

	mapobj	2000,-400,0000,3000,houdai_0,houdai_Istrat
	mapobj	2000,400,0000,3000,houdai_0,houdai_Istrat
	mapobj	2000,-400,0000,3000,houdai_0,houdai_Istrat
	mapobj	2000,400,0000,3000,houdai_0,houdai_Istrat
	mapgoto	.z1t

;-------------------------------------------------------
; houdai test
.here4
	mapobj	0000,-300,0000,2000,houdai_0,houdai_Istrat
	mapobj	0000,300,0000,2400,houdai_0,houdai_Istrat
	mapwait	3000
	maploop	.here4,2



.here
	mapobj	0000,0000,-400,4000,kamikaze,kami_Istrat

	mapobj	0000,-200,0,3900,jump_1,jump1_Istrat
	mapobj	2000,-200,-40,4000,jump_0,jump0_Istrat

	mapobj	0000,200,0,3900,jump_1,jump1_Istrat
	mapobj	2000,200,-40,4000,jump_0,jump0_Istrat


	mapobj	0000,-200,0,3900,jump_1,jump1_Istrat
	mapobj	2000,-200,-40,4000,jump_0,jump0_Istrat

	mapobj	0000,200,0,3900,jump_1,jump1_Istrat
	mapobj	2000,200,-40,4000,jump_0,jump0_Istrat


	maploop	 .here,2


	mapobj	8000,-500,-300,4000,w_l,winglazerman_Istrat
	mapobj	8000,-500,-500,2000,rip_man,ripman_Istrat


	mapobj	2500,600,-100,-100,starbull,starbull_Istrat
	mapspecial
	mapobj	2500,-600,-100,-100,starbull,starbull_Istrat
	mapspecial
	mapobj	2500,600,-100,-100,starbull,starbull_Istrat
	mapspecial

.turrets
	mapobj	0000,-100,0000,4000,houdai_0,turret1_istrat
	mapobj	0500,0100,0000,4000,houdai_0,turret1_istrat
	mapobj	0500,0000,0000,4000,houdai_0,turret1_istrat
	mapobj	0000,-250,0000,4000,houdai_0,turret1_istrat
	mapobj	0500,0250,0000,4000,houdai_0,turret1_istrat
	mapobj	0500,0000,0000,4000,houdai_0,turret1_istrat
	maploop	.turrets,4

	mapmother	0000,0000,0000,4000,mother1,mother1_istrat,map_pillars

.turrets2	
	mapobj	0100,0100,0000,4000,houdai_0,turret1_istrat
	mapobj	0400,-100,0000,4000,houdai_0,turret1_istrat

	mapobj	1000,0000,0000,4000,houdai_0,turret1_istrat
	maploop	.turrets2,8

	mapwait	100
	mapobj	3000,0300,0000,4000,build_0,hard_istrat
	mapobj	4000,-300,0000,4000,build_0,hard_istrat

	maprem	mother1

	mapmother	0000,0000,0000,4000,mother1,mother1_istrat,map_mountains

	mapwait	3000
	mapobj	1000,-100,-200,-100,starbull,starbull_Istrat
	mapobj	3000,100,-100,-100,starbull,starbull_Istrat

	mapobj	0500,-100,0000,4000,houdai_0,turret1_istrat
	mapobj	1000,0000,0000,4000,tunnel1,tunnel_Istrat
	mapobj	1000,-100,0000,4000,tunnel2,hard_istrat
	mapobj	1000,0100,0000,4000,tunnel2,hard_istrat
	mapobj	0000,0000,0000,4000,tunnel3,hard_istrat
	mapobj	1200,0000,0000,4000,tunnel2,hard_istrat

.moreturrets
	mapobj	0300,-100,0000,4000,houdai_0,turret1_istrat
	mapobj	0300,0100,0000,4000,houdai_0,turret1_istrat
	maploop	.moreturrets,3

	mapobj	2000,0000,-150,4000,gate_0,gate_istrat

	mapobj	2000,-100,-200,-100,starbull,starbull_Istrat
	mapobj	4000,-100,-200,-100,starbull,starbull_Istrat

.missthislot

; sprout test
.hereagain
	mapobj	0000,0200,0000,4000,sprout,sprout2_istrat
	sprout_data	0,0,0,8,1
	mapwait	1000
	mapobj	0000,-100,0000,4000,sprout,sprout2_istrat
	sprout_data	0,0,0,8,1
	maprem	mother1

	mapwait	1000
	mapobj	0000,0250,0000,4000,sprout,sprout2_istrat
	sprout_data	0,0,0,8,1
	mapwait	1000
	mapobj	0000,-250,0000,4000,sprout,sprout2_istrat
	sprout_data	0,0,0,8,1
	mapwait	1500
	mapobj	0000,0100,0000,4000,sprout,sprout2_istrat
	sprout_data	0,-5,13,2,40
	mapwait	0000
	mapobj	0000,-100,0000,4000,sprout,sprout2_istrat
	sprout_data	0,5,-13,2,40
	mapwait	4000


	mapobj	2500,-300,0000,4000,sprout,sprout_istrat
	mapobj	2500,0200,0000,4000,sprout,sprout_istrat
	mapobj	2500,-100,0000,4000,sprout,sprout_istrat

	mapobj	2500,-300,0000,4000,sprout,sprout_istrat
	mapobj	2500,0200,0000,4000,sprout,sprout_istrat
	mapobj	2500,-100,0000,4000,sprout,sprout_istrat

	ENDC

.boss
	fadeoutbgm
	setbgm	bgm_boss1

; boss B robot test
;	mapobj	0000,0000,-1000,4000,boss_b_1,bossBrob_Istrat


; boss A test
;	mapobj	0000,3000,0000,375<<bossa_scale,boss_A_2,bossA_Istrat

; boss 2 test
;	mapobj	0000,0000,0<<boss2_scale,1100,boss_2_2,boss2_Istrat


; boss 7 test
	mapobj	0000,0000,-70<<boss7_scale,-200,boss_7_1,boss7_Istrat
	mapwaitboss
	markboss	boss11

	maprts



