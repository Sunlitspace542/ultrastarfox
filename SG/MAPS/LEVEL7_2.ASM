level7_2
	start_65816
	lda	playertwoactivated
	cmp	#0
	beq	.anop2
	lda	#40
	sta	playertwoready
.anop2
	end_65816

	initlevel	7_2,mscramwipe_circle

	setrestart
;first half	
	mapwait	1700
	
	cspecial	1600,-1000,60,3500,SCORPION,scorpion4_Istrat	;go away
	mapobj	0000,0080,0,4000,palmtree,HARDrandom_ISTRAT
	cspecial	0000,-1000,60,2000,SCORPION,scorpion1_Istrat	;dash

	mapwait	2000
	
	mapobj	0000,0280,0,4000,totem_2,HARDplasma180_ISTRAT
	mapobj	0000,-0280,0,4000,totem_2,HARDplasma180_ISTRAT

	mapwait	2000
	
	mapobj	0000,0150,0,4000,palmtree,HARDrandom_ISTRAT
	mapobj	0000,-0150,0,4000,palmtree,HARDrandom_ISTRAT
	
	mapwait	2000
	
	cspecial	0000,1000,0000,3000,scorpion,misstank_istrat
	setalvar	roty,deg90
	addalvarptr.w	worldx,player_posx
	cspecial	0000,-1000,0000,3000,scorpion,misstank_istrat
	setalvar	roty,-deg90
	addalvarptr.w	worldx,player_posx
	
	mapwait	2000
	
	pathcspecial	0000,0400,-200,-100,guard_0,patret,8,10
	pathcspecial	0000,-400,-200,-100,guard_0,patret,8,10
	
	mapwait	2000
	
	mapobj	0000,0000,0000,4000,mantis,hardplasma180_Istrat	
	mapobj	0000,0480,0,4000,totem_2,HARDplasma180_ISTRAT
	mapobj	0000,-0480,0,4000,totem_2,HARDplasma180_ISTRAT

	mapwait	2000

	mapobj	0000,0250,0,4000,palmtree,HARDrandom_ISTRAT
	mapobj	0000,-0250,0,4000,palmtree,HARDrandom_ISTRAT
	mapobj	0000,0000,0,4000,palmtree,HARDrandom_ISTRAT

	mapwait	2000
	
	cspecial	000,0300,-0250,6000,happyfaceship,shou0a_istrat
	special		000,-0300,-0250,6000,happyfaceship,shou0a_istrat
	special		000,000,-0250,6000,happyfaceship,shou0a_istrat
	
	mapwait	2000

	mapobj	0000,0450,0,4000,palmtree,HARDrandom_ISTRAT
	mapobj	0000,-0450,0,4000,palmtree,HARDrandom_ISTRAT	

	pathobj	1000,-200,-170,4500,walk_4_0,e_kani_0,10,10
	pathobj	0400,-300,-200,2000,clisla_s,mini_cli,10,10
	pathobj	0400,400,-100,2000,clisla_s,mini_cli,10,10

	mapwait	2000
	
	mapobj	0000,0450,0,4000,palmtree,HARDrandom_ISTRAT
	mapobj	0000,-0450,0,4000,palmtree,HARDrandom_ISTRAT	

	mapwait	2000
	
	cspecial	0000,1000,0000,3000,scorpion,misstank_istrat
	setalvar	roty,deg90
	addalvarptr.w	worldx,player_posx
	cspecial	0000,-1000,0000,3000,scorpion,misstank_istrat
	setalvar	roty,-deg90
	addalvarptr.w	worldx,player_posx
	
	mapwait	2000

	mapobj	0000,0350,0,4000,palmtree,HARDrandom_ISTRAT
	mapobj	0000,-0150,0,4000,palmtree,HARDrandom_ISTRAT
	mapobj	0000,-0280,0,4000,totem_2,HARDplasma180_ISTRAT

	pathcspecial	0000,0400,-200,-100,guard_0,patret,8,10
	pathcspecial	0000,-400,-200,-100,guard_0,patret,8,10
	mapobj	0500,000,-300,3000,w_l,winglazerman_Istrat				;I'm chargin mah lazers!

	mapwait	2500

	mapobj	0000,000,0,5000,palmtree,HARDrandom_ISTRAT
	mapobj	0000,0280,0,4000,totem_2,HARDplasma180_ISTRAT

	pathcspecial	0000,0200,-200,-100,guard_0,patret,8,10
	pathcspecial	0000,-200,-200,-100,guard_0,patret,8,10
	
	mapwait	1500
	
	mapobj	0000,0000,0000,4000,mantis,hardplasma180_Istrat

	mapwait	1500

	pathobj	1000,200,-170,4500,walk_4_0,e_kani_0,10,10
	
	mapwait	2000
	
	mapobj	0000,0250,0,4000,palmtree,HARDrandom_ISTRAT
	mapobj	0000,-0250,0,4000,palmtree,HARDrandom_ISTRAT
	mapobj	0000,0000,0,4000,palmtree,HARDrandom_ISTRAT

	mapwait	1300
	
	cspecial	000,0300,-0250,6000,happyfaceship,shou0a_istrat
	special		000,-0300,-0250,6000,happyfaceship,shou0a_istrat
	special		000,000,-0250,6000,happyfaceship,shou0a_istrat
	
	mapwait	1500
	
	mapobj	0000,0280,0,4000,totem_2,HARDplasma180_ISTRAT
	mapobj	0000,-0280,0,4000,totem_2,HARDplasma180_ISTRAT

;first half done

;gate
	mapwait	3500

	mapobj	0800,0150,-100,4000,gate_0,gate_ISTRAT
	pathobj	2400,3000,3000,1000,nullshape,e_gate,8,10

	mapwait	1300	
	
;second half	
	
	mapwait	500
	mapobj	0000,0270,0,4000,palmtree,HARDrandom_ISTRAT	
	mapobj		0900,-150,-300,1000,guard_0,zaco1L_istrat,10,10
	mapobj		0500,150,-300,1000,guard_0,zaco1R_istrat,10,10
	mapobj	0500,-0270,0,4000,palmtree,HARDrandom_ISTRAT	
	mapobj	0500,300,-200,1500,guard_0,zaco1R_istrat,10,10
	mapobj	0500,-300,-200,1000,guard_0,zaco1L_istrat,10,10
	mapobj	0500,00,0,1000,guard_0,zaco1L_istrat,10,10
	mapobj	0500,0120,0,4000,palmtree,HARDrandom_ISTRAT	
	
	
	mapwait	2000
	
	mapobj	0000,-0310,0,4000,palmtree,HARDrandom_ISTRAT
	special	1000,-550,0000,4000,scorpion,tank3_istrat	
	mapobj	0000,0270,0,4000,palmtree,HARDrandom_ISTRAT
	special	1000,550,0000,4000,scorpion,tank3_istrat	
	
	mapwait	1200
	
	pathcspecial	03000,-1000,-700,2000,guard_0,call_fol,10,10	

	mapobj	0000,0140,0,4000,palmtree,HARDrandom_ISTRAT
	mapobj	0500,-0140,0,4000,palmtree,HARDrandom_ISTRAT
	mapobj	0800,0260,0,4000,palmtree,HARDrandom_ISTRAT

	
	mapwait	2000
	

	mapobj	0000,0000,0000,4000,BIGFROG,hardplasma180tough_Istrat
	
	mapwait	2200

	mapobj	0000,0140,0,4000,palmtree,HARDrandom_ISTRAT
	pathobj	1000,200,-200,700,flyingbug,kamome,10,8
	pathobj	1000,-200,-100,700,flyingbug,kamome,10,8
	pathobj	1000,200,-200,700,flyingbug,kamome,10,8
	
	mapwait	2500

	mapobj	0000,0250,0,4000,palmtree,HARDrandom_ISTRAT
	mapobj	0000,-0250,0,4000,palmtree,HARDrandom_ISTRAT
	mapobj	0000,0000,0,4000,palmtree,HARDrandom_ISTRAT

	mapwait	2000
	
	mapobj	0000,0280,0,4000,lock_man,HARDplasma180_ISTRAT
	mapobj	0000,-0280,0,4000,lock_man,HARDplasma180_ISTRAT

	mapwait	1500
	
	mapobj	0000,0,0,4000,lock_man,HARDplasma180_ISTRAT	
	
	mapwait	2100

	mapobj	0000,0180,0,4000,palmtree,HARDrandom_ISTRAT
	mapobj	0000,0280,0,4000,palmtree,HARDrandom_ISTRAT
	mapobj	0000,0380,0,4000,palmtree,HARDrandom_ISTRAT

	mapobj	0000,0000,0000,4000,scorpionbig,hardplasma180tough_Istrat		

	mapobj	0000,-0180,0,4000,palmtree,HARDrandom_ISTRAT
	mapobj	0000,-0280,0,4000,palmtree,HARDrandom_ISTRAT
	mapobj	0000,-0380,0,4000,palmtree,HARDrandom_ISTRAT
	
	mapwait	2100
	
	cspecial	1600,-1000,60,3500,SCORPION,scorpion4_Istrat	;go away
	mapobj	0000,0080,0,4000,palmtree,HARDrandom_ISTRAT
	cspecial	0000,-1000,60,2000,SCORPION,scorpion1_Istrat	;dash

	mapwait	2000
	
	pathobj	1000,00,-170,4500,walk_4_0,e_kani_0,10,10
	mapobj	0000,0140,0,4000,palmtree,HARDrandom_ISTRAT
	pathobj	1000,200,-200,700,flyingbug,kamome,10,8
	pathobj	1000,-200,-100,700,flyingbug,kamome,10,8
	pathobj	1000,200,-200,700,flyingbug,kamome,10,8

	mapwait	2100
	
	pathcspecial	2000,0400,-500,900,quadcrab,e_shawer,10,10

	mapwait	1500
	
	mapobj	0000,0280,0,4000,lock_man,HARDplasma180_ISTRAT
	mapobj	0000,-0280,0,4000,lock_man,HARDplasma180_ISTRAT

	mapwait	1500

	mapobj	0000,0100,0000,4000,BIGFROG,hardplasma180tough_Istrat
	
	mapwait	2000
	
	mapobj	0000,-0250,0000,4000,BIGFROG,hardplasma180tough_Istrat

	mapwait	2500
;part 2 done

	mapwait	3000
	mapwait	2000
	mapjsr	cl_ground

.loo	mapwait	1000
	mapgoto	.loo
	
	


	mapend
