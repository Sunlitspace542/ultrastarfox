level7_3
	start_65816
	lda	playertwoactivated
	cmp	#0
	beq	.anop2
	lda	#40
	sta	playertwoready
.anop2
	end_65816

	initlevel	7_3,mscramwipe_circle

	setrestart
	
	mapwait	1800
	
	mapobj	0000,0200,-100,3000,bluepinetree,hardrandom_Istrat
	mapobj	0000,-100,-100,3500,bluepinetree,hardrandom_Istrat
	mapobj	0000,0500,-100,4500,bluepinetree,hardrandom_Istrat
	mapobj	0000,-300,-100,5500,bluepinetree,hardrandom_Istrat
	mapobj	0000,000,-100,6500,bluepinetree,hardrandom_Istrat
	mapobj	0000,-500,-100,7500,bluepinetree,hardrandom_Istrat

	mapwait	1000
	
	mapobj	2000,200,000,5000,log,bouncinglog_istrat
	mapobj	2000,-200,000,5000,log,bouncinglog_istrat

	mapwait	1000
	
	mapobj	2000,000,000,5000,biglog,log_istrat
	
	mapwait	3000
	
	mapobj	0000,100,-100,6500,bluepinetree,hardrandom_Istrat
	mapobj	0000,-0200,-100,3000,bluepinetree,hardrandom_Istrat
	mapobj	0000,-0500,-100,4500,bluepinetree,hardrandom_Istrat
	mapobj	0000,300,-100,3500,bluepinetree,hardrandom_Istrat
	mapobj	0000,000,-100,5500,bluepinetree,hardrandom_Istrat
	mapobj	0000,500,-100,7500,bluepinetree,hardrandom_Istrat

	mapwait	1500
	
	mapobj	0000,0280,0,4000,lock_man,HARDplasma180_ISTRAT
	mapobj	0000,-0280,0,4000,lock_man,HARDplasma180_ISTRAT
	
	mapwait	2000

	pathspecial	1000,0000,0000,5350,walker_0,e_walk_1,10,10;	
	pathobj	0500,0050,-75,4000,clisla_s,l_clisla,10,10
	pathobj	0700,0300,-200,2000,clisla_s,mini_cli,10,10
	pathobj	0700,-200,-045,2000,clisla_s,mini_cli,10,10
	pathobj	0700,0100,-030,2000,clisla_s,mini_cli,10,10

	mapwait	2500
	
	mapobj	2000,200,000,5000,ballz,bouncinglog_istrat
	mapobj	2000,-200,000,5000,ballz,bouncinglog_istrat	
	cspecial	1000,-0300,-500,6000,taigun,shou0a_istrat
	special		1000,0120,-0250,6000,taigun,shou0a_istrat

	mapwait	1000

	pathcspecial	0000,200,-120,2000,EISEI_0,e_bee,10,10
	pathcspecial	0000,-200,-120,2000,EISEI_0,e_bee,10,10	
	mapobj	1000,-300,000,5000,ballz,bouncinglog_istrat
	mapobj	000,0,000,5000,ballz,bouncinglog_istrat
	mapobj	1000,200,000,3000,ballz,bouncinglog_istrat
	mapobj	0000,-50,000,3000,ballz,bouncinglog_istrat
	mapobj	1000,-200,000,5000,ballz,bouncinglog_istrat
	mapobj	000,0,000,5000,ballz,bouncinglog_istrat

	cspecial	1000,0000,-250,3000,w_l,winglazerman_istrat
	
	mapobj	1000,200,000,3000,ballz,bouncinglog_istrat
	mapobj	000,-100,000,3000,ballz,bouncinglog_istrat
	mapobj	1000,50,000,5000,ballz,bouncinglog_istrat
	mapobj	000,-250,000,5000,ballz,bouncinglog_istrat
	mapobj	1000,30,000,3000,ballz,bouncinglog_istrat
	mapobj	000,-300,000,3000,ballz,bouncinglog_istrat
	mapobj	1000,300,000,5000,ballz,bouncinglog_istrat
	mapobj	000,0,000,5000,ballz,bouncinglog_istrat

	mapwait	1500
	
	pathcspecial	0000,0200,-500,1900,DRAGON_HEAD,e_dragon,10,10
	pathcspecial	0000,-200,-500,2200,DRAGON_HEAD,e_dragon,10,10
	
	mapobj	0000,100,-100,6500,bluepinetree,hardrandom_Istrat
	mapobj	0000,-0200,-100,3000,bluepinetree,hardrandom_Istrat
	mapobj	0000,-0500,-100,4500,bluepinetree,hardrandom_Istrat
	mapobj	0000,300,-100,3500,bluepinetree,hardrandom_Istrat
	
	mapwait	3000

	mapobj	0000,-180,0,5000,pilar2,hardrandom_istrat	
	mapobj	0000,00,0,5000,pilar2,hardrandom_istrat

	mapwait	3000

	mapobj	0000,0280,0,4000,lock_man,HARDplasma180_ISTRAT
	mapobj	0000,-0280,0,4000,lock_man,HARDplasma180_ISTRAT

	mapwait	1500
	
	mapobj	0000,00,0,6000,pilar2,hardrandom_istrat
	mapobj	0000,180,0,6000,pilar2,hardrandom_istrat
	mapobj	0000,360,0,6000,pilar2,hardrandom_istrat	
	mapobj	0000,540,0,6000,pilar2,hardrandom_istrat	

	mapwait	1000

	mapobj	200,-200,0000,4000,hou_5,houdai5f_istrat
	mapobj	200,200,0000,4000,hou_5,houdai5f_istrat

	mapwait	1000
	
	mapobj	0000,100,-100,6500,bluepinetree,hardrandom_Istrat
	mapobj	0000,-0200,-100,3000,bluepinetree,hardrandom_Istrat
	mapobj	0000,-0500,-100,4500,bluepinetree,hardrandom_Istrat
	mapobj	0000,300,-100,3500,bluepinetree,hardrandom_Istrat

	mapwait	2000
	
	mapobj	1000,-200,-120,5000,bigballz,log_istrat

	mapwait	1000

	cspecial	0200,-200,-30,4000,bom_wing,bomwing_istrat

	mapwait	1000

	mapobj	1000,200,-120,5000,bigballz,log_istrat

	mapwait	1000
	
	cspecial	0200,200,-30,4000,bom_wing,bomwing_istrat

	mapobj	1300,600,-200,3000,taigun,zaco1L_istrat,10,10
	mapobj	1300,300,-200,3000,taigun,zaco1L_istrat,10,10
	mapobj	0300,000,-200,3000,taigun,zaco1R_istrat,10,10
	mapobj	0300,-300,-200,3000,taigun,zaco1R_istrat,10,10	
	mapobj	0600,200,-200,3000,taigun,zaco1L_istrat,10,10
	mapobj	0600,-200,-200,3000,taigun,zaco1R_istrat,10,10	
	
	mapwait	2500
	
	pathcspecial	0000,0200,-500,1900,DRAGON_HEAD,e_dragon,10,10
	pathcspecial	0000,-200,-500,2200,DRAGON_HEAD,e_dragon,10,10

	mapobj	0000,0200,-100,3000,bluepinetree,hardrandom_Istrat
	mapobj	0000,-100,-100,3500,bluepinetree,hardrandom_Istrat
	mapobj	0000,0500,-100,4500,bluepinetree,hardrandom_Istrat
	mapobj	0000,-300,-100,5500,bluepinetree,hardrandom_Istrat
	mapobj	0000,000,-100,6500,bluepinetree,hardrandom_Istrat
	mapobj	0000,-500,-100,7500,bluepinetree,hardrandom_Istrat	
	mapobj	2000,000,000,5000,biglog,log_istrat

	mapwait	2500
	
	mapobj	0000,0280,0,4000,lock_man,HARDplasma180_ISTRAT
	mapobj	0000,-0280,0,4000,lock_man,HARDplasma180_ISTRAT

	mapwait	2000
	
	mapobj	0000,0,0,4000,lock_man,HARDplasma180_ISTRAT	

	mapwait	1500
	
	pathobj	1000,200,-200,700,taigun,kamome,10,8
	pathobj	1000,-200,-100,700,taigun,kamome,10,8
	pathobj	1000,200,-200,700,taigun,kamome,10,8
	
	mapobj	0000,-0200,-100,3000,bluepinetree,hardrandom_Istrat
	mapobj	0000,-0500,-100,4500,bluepinetree,hardrandom_Istrat
	mapobj	0000,300,-100,3500,bluepinetree,hardrandom_Istrat
	mapobj	0000,000,-100,5500,bluepinetree,hardrandom_Istrat

	mapobj	0000,-360,0,5000,pilar2,hardrandom_istrat	
	mapobj	0000,180,0,5000,pilar2,hardrandom_istrat
	
	mapwait	2500
	
	pathobj	1000,0000,-170,5000,walk_4_0,e_kani_0,10,10
	pathobj	0500,0050,-75,2000,clisla_s,l_clisla,10,10
	pathobj	0700,0300,-200,2000,clisla_s,mini_cli,10,10
	pathobj	0700,-200,-045,2000,clisla_s,mini_cli,10,10
	pathobj	0700,0100,-030,2000,clisla_s,mini_cli,10,10
	pathspecial	0000,-500,0000,4400,s_tank_0,e_tank,10,10
		
	mapwait	2000

;gate
	mapobj	0400,0150,-100,4000,gate_0,gate_ISTRAT
	pathobj	2400,3000,3000,1000,nullshape,e_gate,10,10

	mapwait	2000
;part 2

	mapobj	0000,-540,0,5000,pilar2,hardrandom_istrat
;	mapobj	0000,-360,0,5000,pilar2,hardrandom_istrat	
	mapobj	0000,-180,0,5000,pilar2,hardrandom_istrat	
	mapobj	0000,00,0,5000,pilar2,hardrandom_istrat
	mapobj	0000,180,0,5000,pilar2,hardrandom_istrat
;	mapobj	0000,360,0,5000,pilar3,hardrandom_istrat
	mapobj	0000,540,0,5000,pilar2,hardrandom_istrat


	mapwait	2500
	
	mapobj	0000,-540,0,5000,pilar2,hardrandom_istrat
	mapobj	0000,-360,0,5000,pilar2,hardrandom_istrat	
	mapobj	0000,-180,0,5000,pilar2,hardrandom_istrat	
;	mapobj	0000,00,0,5000,pilar2,hardrandom_istrat
	mapobj	0000,180,0,5000,pilar2,hardrandom_istrat
	mapobj	0000,360,0,5000,pilar2,hardrandom_istrat
	mapobj	0000,540,0,5000,pilar2,hardrandom_istrat

	mapwait	2000

	mapobj	1300,300,-300,3000,guard_0,zaco1L_istrat,10,10
	mapobj	1300,300,-100,3000,guard_0,zaco1L_istrat,10,10
	mapobj	0300,000,-300,3000,guard_0,zaco1R_istrat,10,10
	mapobj	0300,000,-100,3000,guard_0,zaco1R_istrat,10,10	
	mapobj	0600,-300,-300,3000,guard_0,zaco1L_istrat,10,10
	mapobj	0600,-300,-100,3000,guard_0,zaco1R_istrat,10,10	
	
	mapobj	1000,300,000,5000,smallballz,bouncinglog_istrat
	mapobj	000,50,000,5000,smallballz,bouncinglog_istrat
	mapobj	000,-150,000,5000,smallballz,bouncinglog_istrat
	mapobj	1000,-300,000,3000,smallballz,bouncinglog_istrat
	mapobj	0000,-50,000,3000,smallballz,bouncinglog_istrat
	mapobj	0000,250,000,3000,smallballz,bouncinglog_istrat
	mapobj	1000,0,000,5000,smallballz,bouncinglog_istrat
	mapobj	000,100,000,5000,smallballz,bouncinglog_istrat	
	mapobj	000,-300,000,5000,smallballz,bouncinglog_istrat	

	pathcspecial	0000,200,-120,2000,EISEI_0,e_bee,10,10
	pathcspecial	0000,-200,-120,2000,EISEI_0,e_bee,10,10	
	pathcspecial	0000,400,-120,2000,EISEI_0,e_bee,10,10
	pathcspecial	0000,-400,-120,2000,EISEI_0,e_bee,10,10	

	mapwait	1500
	
	mapobj	1000,-500,000,3000,smallballz,bouncinglog_istrat
	mapobj	000,400,000,3000,smallballz,bouncinglog_istrat
	mapobj	000,0,000,3000,smallballz,bouncinglog_istrat
	mapobj	1000,150,000,5000,smallballz,bouncinglog_istrat
	mapobj	000,350,000,5000,smallballz,bouncinglog_istrat
	mapobj	000,-50,000,5000,smallballz,bouncinglog_istrat
	mapobj	1000,130,000,3000,smallballz,bouncinglog_istrat
	mapobj	000,-130,000,3000,smallballz,bouncinglog_istrat
	mapobj	000,-330,000,3000,smallballz,bouncinglog_istrat
	mapobj	1000,300,000,5000,smallballz,bouncinglog_istrat
	mapobj	000,0,000,5000,smallballz,bouncinglog_istrat	
	mapobj	000,-300,000,5000,smallballz,bouncinglog_istrat	

	pathcspecial	0000,200,-120,2000,EISEI_0,e_bee,10,10
	pathcspecial	0000,-200,-120,2000,EISEI_0,e_bee,10,10	

	mapwait	2000

	mapobj	2000,00,000,5000,log,bouncinglog_istrat
	mapobj	5000,200,000,3000,log,bouncinglog_istrat
	mapobj	2000,-200,000,5000,log,bouncinglog_istrat

	mapwait	1000
	
	mapobj	2000,000,000,5000,biglog,log_istrat
	
	mapwait	3000
	
;end part 2
;boss

;end
	mapwait	2000
	mapwait	2000
	mapjsr	cl_ground
	mapend
