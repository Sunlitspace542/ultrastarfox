level5_4
	start_65816
	lda	playertwoactivated
	cmp	#0
	beq	.anop2
	lda	#40
	sta	playertwoready
.anop2
	end_65816

	initlevel	5_4,mscramwipe_circle

	setrestart
	
	mapwait	2000

	mapobj	0000,0400,0000,4000,mantis,hardplasma180_Istrat

	mapwait	2500
	
	pathobj	0000,-200,-0030,4000,cricket,cricket,8,10
	
	mapwait	2500

	mapobj	0000,-300,-100,4500,tree,hardrandom_Istrat
	mapobj	0000,-100,-100,4500,tree,hardrandom_Istrat
	skillfly_init
	skillfly_set	-200,-100,4000,180
	mapwait	1000
	
	mapobj	0000,-500,0000,4000,crab,hardplasma180_Istrat	
	mapobj	0000,500,0000,4000,crab,hardplasma180_Istrat	
	
	mapwait	2500
	
	pathobj	500,0000,-1000,4000,nullshape,bigfly,8,10

	mapwait	5500

	mapobj	1000,-500,0000,4000,minispider,hardplasma180_Istrat	
	mapobj	1000,0000,0000,4000,minispider,hardplasma180_Istrat	
	mapobj	1000,500,0000,4000,minispider,hardplasma180_Istrat	

	mapwait	2000
	mapobj	0000,0500,-100,3500,tree,hardrandom_Istrat
	mapobj	0000,0300,-100,3500,tree,hardrandom_Istrat
	skillfly_set 400,-100,3000,180	
	mapwait	4500
	
	special		0000,-300,-1300,2300,longface,zacos_istrat
	cspecial	0000,0300,-1300,2300,longface,zacos_istrat
	special		0000,-600,-1300,2300,longface,zacos_istrat
	cspecial	0000,0600,-1300,2300,longface,zacos_istrat	
	cspecial	0000,0000,-1300,2300,longface,zacos_istrat	

	mapwait	2500
	
	mapobj	0000,0000,0000,4000,mantis,hardplasma180_Istrat	

	mapwait	1500
;	skillfly_init
	mapobj	0000,0100,-100,3500,tree,hardrandom_Istrat
	mapobj	0000,-0100,-100,3500,tree,hardrandom_Istrat
	skillfly_set 000,-100,3000,180
	mapwait	3000
	
	mapobj	0000,0400,0000,4000,mantis,hardplasma180_Istrat		
	mapobj	0000,-400,0000,4000,mantis,hardplasma180_Istrat		
	skillfly_bonus 0000,000,-100,3500,item_7,item7_istrat	
	mapwait	2500
	
	cspecial	000,0300,-0250,6000,TEKIKAN,shou0a_istrat
	special		000,-0300,-0250,6000,TEKIKAN,shou0a_istrat
	mapwait	500
	pathobj	0000,200,-0030,4000,cricket,cricket,8,10	
	
	mapwait	1000

	pathobj	3500,0000,-1000,4000,nullshape,bigfly2,8,10

	mapwait	2500
	
	cspecial	1000,0300,-0250,6000,TEKIKAN,shou0a_istrat
	special		000,-0300,-0250,6000,TEKIKAN,shou0a_istrat
	mapobj	0000,500,0000,4000,minispider,hardplasma180_Istrat	
	mapobj	0200,-400,-100,3500,tree,hardrandom_Istrat
	
	mapwait	2500
	
	pathcspecial	0000,0400,-200,-100,ninja_1,patret,8,10
	pathcspecial	0000,-400,-200,-100,ninja_1,patret,8,10
	pathobj	2500,0000,-1000,4000,nullshape,bigfly2,8,10
	
	mapwait	3000
	
	mapobj	0000,0300,-100,3500,tree,hardrandom_Istrat	
	pathcspecial	0000,0400,-300,-100,TEKIKAN,patret,8,10
	pathcspecial	0000,-400,-300,-100,TEKIKAN,patret,8,10
	
	mapwait	2500
	
	pathobj	3000,0000,-1000,4000,nullshape,tomhaha,8,10
	
	mapwait	1000
	
	pathobj	0000,-200,-0030,4000,cricket,cricket,8,10
	
;first half done?
	
;gate
	mapwait	2500

	mapobj	0800,0150,-100,4000,gate_0,gate_ISTRAT
	pathobj	2400,3000,3000,1000,nullshape,e_gate,8,10

	mapwait	1300	
	
;second half
	
	pathobj	3500,0000,-1000,4000,nullshape,bigfly2,6,2

	mapwait	3500
	
	
	cspecial	000,0300,-0250,6000,TEKIKAN,shou0a_istrat
	special		000,-0300,-0250,6000,TEKIKAN,shou0a_istrat
	special		000,000,-0250,6000,TEKIKAN,shou0a_istrat
	mapobj	0500,-400,0000,5000,crab,hardplasma180_Istrat	

	mapwait	2500
	
	mapobj	0000,100,0000,6000,minispider,hardplasma180_Istrat	
	pathcspecial	2000,000,-230,4000,ninja_1,itachi_a,2,4
	pathcspecial	2000,-200,-200,4000,ninja_1,itachi_b,2,4
	pathcspecial	2000,200,-150,4000,ninja_1,itachi_a,2,4	
	
	mapwait	2500
	mapobj	0000,-0300,-100,5500,tree,hardrandom_Istrat	
	pathcspecial	2000,-200,-230,4000,ninja_1,itachi_a,2,4
	pathcspecial	2000,000,-200,4000,ninja_1,itachi_b,2,4
	pathcspecial	2000,200,-150,4000,ninja_1,itachi_a,2,4

	mapwait	2500
	
		mapobj	0000,0300,-100,5500,tree,hardrandom_Istrat
	mapobj	0000,-500,0000,4000,crab,hardplasma180_Istrat	
	mapobj	0000,500,0000,4000,crab,hardplasma180_Istrat
	mapobj	0000,0000,0000,4000,minispider,hardplasma180_Istrat	
	
	mapwait	2500

	pathobj	500,0000,-1000,4000,nullshape,bigfly,6,2

	mapwait	2500
	
	pathcspecial	0000,0400,-200,-100,ninja_1,patret,8,10
	pathcspecial	0000,-400,-200,-100,ninja_1,patret,8,10
	mapobj	0000,0200,-100,5500,tree,hardrandom_Istrat
	
	mapwait	2500
	mapobj	0000,-300,0000,5000,minispider,hardplasma180_Istrat		
	pathcspecial	0000,0200,-200,-100,ninja_1,patret,8,10
	pathcspecial	0000,-200,-200,-100,ninja_1,patret,8,10
	
	mapwait	1000

	mapobj	0000,0400,0000,4000,mantis,hardplasma180_Istrat	
	
	mapwait	2000
	
	mapobj	0000,0300,-100,5500,tree,hardrandom_Istrat
	mapobj	0000,-300,-100,5500,tree,hardrandom_Istrat	
	mapobj	0000,-0400,0000,4000,mantis,hardplasma180_Istrat	
	
	mapwait	2000
	
	cspecial	000,0300,-0250,6000,TEKIKAN,shou0a_istrat
	special		000,-0300,-0250,6000,TEKIKAN,shou0a_istrat
	special		000,000,-0250,6000,TEKIKAN,shou0a_istrat
	mapobj	0500,-400,0000,5000,crab,hardplasma180_Istrat	
	
	mapwait	3000
	
	pathcspecial	2000,000,-230,4000,ninja_1,itachi_a,2,4
	pathcspecial	2000,-200,-200,4000,ninja_1,itachi_a,2,4
	pathcspecial	2000,200,-200,4000,ninja_1,itachi_b,2,4
	mapobj	0000,0000,0000,4000,minispider,hardplasma180_Istrat		
	
;.loo	mapwait	1000
;	mapgoto	.loo

	mapwait	5000

	mapobj	1000,0000,-130,1500,dodora_2,dodonew_istrat
	mapwaitboss
	mapwait	500
	start_65816
	jsl	clearmap_l
	end_65816
	
	mapwait	3000


	mapjsr	cl_ground

	mapend
