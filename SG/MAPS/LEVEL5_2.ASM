level5_2
	start_65816
	lda	playertwoactivated
	cmp	#0
	beq	.anop2
	lda	#40
	sta	playertwoready
.anop2
	end_65816

	initlevel	5_2,mscramwipe_circle

	mapwait	1000

	setrestart
	
	mapwait	3000
	
	special		0000,-200,-1300,2300,zaco_6,zacos_istrat
	cspecial	0000,0200,-1300,2300,zaco_6,zacos_istrat
	special		0000,-100,-1300,2300,zaco_b,zacos_istrat
	cspecial	0000,0100,-1300,2300,zaco_b,zacos_istrat
	cspecial	0000,0000,-1300,2300,HAPPYFACESHIP,zacos_istrat

	mapwait	2500

	pathspecial	0400,-700,0000,4000,s_tank_0,e_tank,10,10
	pathspecial	4000,0700,0000,4000,s_tank_0,e_tank,10,10
	

	special	1000,-120,0,4000,car_1,truck1_ISTRAT
	special	1000,120,0,4000,car_1,truck1_ISTRAT	
	
	cspecial	2000,00,200,4000,s_tank_0,aircar4_Istrat

	mapwait	2300
	
	pathcspecial	2000,0200,-500,900,zaco_1,e_shawer,10,10
	pathcspecial	0200,-200,-500,1200,zaco_1,e_shawer,10,10
	
	mapwait	1700
	
	cspecial	0200,-200,0,3000,bom_wing,bomwing_istrat
	
	cspecial	0200,200,0,3000,bom_wing,bomwing_istrat	

	mapwait	2500
	
	special		0000,-200,-1300,2300,djpa,zacos_istrat
	cspecial	0000,0200,-1300,2300,djpa,zacos_istrat
	special		0000,-400,-1300,2300,djpa,zacos_istrat
	cspecial	0000,0400,-1300,2300,djpa,zacos_istrat	
	cspecial	0000,0000,-1300,2300,HAPPYFACESHIP,zacos_istrat	

	mapwait	2500

	mapobj	1000,-500,0,500,car_0,aircar5_Istrat	;crash
	mapobj	1300,500,00,500,car_0,aircar2_Istrat	;crash
	mapobj	1300,000,0,500,car_0,aircar3_Istrat	;crash

	mapwait	2000
	
	mapobj	2300,-0300,-150,3000,ninja_1,zaco1L_istrat,10,10
	mapobj	0300,400,-170,3000,ninja_1,zaco1R_istrat,10,10
	mapobj	0300,100,-300,3000,ninja_1,zaco1R_istrat,10,10

	mapif		assaultcheck,.nofriends2spa
	pathobj	0000,-750,-400,0000,friendship_4,chase6_1,10,10

	pathcspecial	2500,-720,-400,0000,sjpa,chase6_2,10,10
.nofriends2spa

	mapwait	3000

	special	1000,-120,-30,4000,car_1,truck1_ISTRAT
	special	1000,120,-30,4000,car_1,truck1_ISTRAT	
	
	cspecial	0000,00,200,4000,s_tank_0,aircar4_Istrat

	mapwait	1800
;across_robot
	mapif	playertwocheck,.norob
	pathobj	0000,-350,0000,5000,robot_0,robot,6,4
;across_robot
	pathobj	0000,0350,0000,5000,robot_0,robot,6,4
.norob	

	mapwait	1800
	pathcspecial	1200,0200,-500,900,zaco_1,e_shawer,10,10
	pathcspecial	0200,-200,-500,1200,zaco_1,e_shawer,10,10

	mapwait	1500

	mapobj	0500,500,-300,3000,w_l,winglazerman_Istrat
	
	pathcspecial	2000,0400,-500,900,zaco_1,e_shawer,10,10
	pathcspecial	0200,-400,-500,1200,zaco_1,e_shawer,10,10

	mapwait	1500

	mapobj	1000,-500,0,500,car_0,aircar5_Istrat	;crash
	special	1000,20,0,3500,car_0,aircar4_Istrat	;go away
	mapobj	1000,700,0,200,car_0,aircar2_Istrat	;ring
	special	2000,-700,0,1000,car_0,aircar1_Istrat	;dash
	mapobj	2000,500,0,500,car_0,aircar5_Istrat	;crash
	
	mapwait	3500
	
	special		0000,-200,-1300,2300,zaco_a,zacos_istrat
	cspecial	0000,0200,-1300,2300,zaco_a,zacos_istrat
	cspecial	0000,0000,-1300,2300,happyfaceship,zacos_istrat
	special		0000,-400,-1300,2300,zaco_a,zacos_istrat
	cspecial	0000,0400,-1300,2300,zaco_a,zacos_istrat
	
	mapwait	2700

	
	mapobj	2300,-0300,-150,3000,ninja_1,zaco1L_istrat,10,10
	mapobj	0300,400,-170,3000,ninja_1,zaco1R_istrat,10,10
	mapobj	0300,100,-300,3000,ninja_1,zaco1R_istrat,10,10	
	
;gate -----------------------------------------------
	mapwait	3500

	mapobj	0800,0150,-100,4000,gate_0,gate_ISTRAT
	pathobj	2400,3000,3000,1000,nullshape,e_gate,10,10

	mapwait	300
	
;part 2	------------------------------------------------------

	mapwait	2000
	
;	mapif	playertwocheck,.norob
	pathobj	0000,-450,0000,5000,robot_0,robot,6,4
;across_robot
	pathobj	0000,0000,-200,5000,robosf2,robot,6,4

	pathobj	0000,0450,0000,5000,robot_0,robot,6,4
;.norob	

	mapwait	3000

	pathobj	0000,-350,-200,5000,robosf2,robot,6,4
;across_robot
	pathobj	0000,0000,0000,5000,robot_0,robot,6,4

	pathobj	0000,350,-200,5000,robosf2,robot,6,4

	mapwait	3000

;	pathobj	0000,-500,0000,5000,robot_0,robot,6,4
;across_robot
	pathobj	0000,-150,-200,5000,robosf2,robot,6,4

	pathobj	0000,0150,-200,5000,robosf2,robot,6,4

	mapwait	3000
	
	cspecial	1000,-400,0000,4000,hou_5,houdai5f_istrat
	cspecial	3500,-400,0000,4000,hou_5,houdai5f_istrat
	
	mapif		assaultcheck,.nofriends1uio
	pathobj	0000,-750,-400,0000,friendship_4,chase6_1,10,10

	pathcspecial	2500,-720,-400,0000,HAPPYFACESHIP,chase6_2,10,10
.nofriends1uio

	mapwait	2000
	
	mapwait	1500
	pathcspecial	1200,0200,-500,900,zaco_1,e_shawer,10,10
	pathcspecial	0200,-200,-500,1200,zaco_1,e_shawer,10,10
	
	mapwait	2000

	pathcspecial	1000,-50,0000,2050,walker_0,e_walk_1,10,10	

	mapwait	2500

	cspecial	1000,0600,0000,000,walker_0,walking_istrat	
	
	mapwait	2500
	
	mapobj	2300,-0600,-150,3000,fcta,zaco1L_istrat,10,10
	mapobj	2300,-0300,-150,3000,fcta,zaco1L_istrat,10,10
	mapobj	0300,400,-170,3000,fcta,zaco1R_istrat,10,10
	mapobj	0300,100,-200,3000,fcta,zaco1R_istrat,10,10	

	mapwait	2500
	
	mapobj	2300,600,-150,3000,ninja_1,zaco1L_istrat,10,10
	mapobj	2300,300,-150,3000,ninja_1,zaco1L_istrat,10,10
	mapobj	0300,000,-170,3000,ninja_1,zaco1R_istrat,10,10
	mapobj	0300,-300,-200,3000,ninja_1,zaco1R_istrat,10,10	
	
	mapwait	2500
	mapwait	2500
	
	mapjsr	cl_ground
	mapend	


;.norob	
	mapwait	1000
	mapwait	1000
.loo	mapwait	1000	;loop
	mapgoto	.loo


	mapend
