event
.event1
	pathobj	02000,0000,0000,5000,training,BringS,20,1
	pathobj	02000,-100,0000,5000,training,RringS,20,1
	pathobj	02000,0100,0000,5000,training,BringS,20,1
	pathobj	00000,-200,0000,4000,pilon_1,bell_0,20,10
	pathobj	02000,-300,-100,5000,training,RringS,20,1
	pathobj	02000,0000,0100,5000,training,BringS,20,1
	pathobj	02000,200,-100,5000,training,RringS,20,1
;colony
	mapobj	0000,-4*Xlen,space_viewCY+(0*Ylen),5000,colony3R,nocoll_Istrat
	mapobj	0000,4*Xlen,space_viewCY+(0*Ylen),5000,colony3L,nocoll_Istrat


	pathobj	02000,-1000,-100,5000,training,RringR,20,1
	pathobj	02000,0000,0100,5000,training,BringS,20,1
	pathobj	02000,-300,0000,5000,training,RringS,20,1
	pathobj	02000,01500,-100,5000,training,BringL,20,1
	pathobj	00000,200,0000,4000,pilon_1,bell_0,20,10
	pathobj	02000,1500,-100,5000,training,RringR,20,1
	pathobj	02000,0000,0000,5000,training,BringS,20,1
	pathobj	02000,0100,-1000,5000,training,RringU,20,1
	pathobj	02000,-200,0100,5000,training,BringS,20,1
	pathobj	02000,0300,0000,5000,training,RringS,20,1
	pathobj	02000,-100,1000,5000,training,BringD,20,1
	pathobj	00000,0000,0000,4000,pilon_1,bell_0,20,10
	pathobj	02000,-1500,-100,5000,training,RringR,20,1
	map_SBtype18	4,0,0,0,0,4
	mapwait	2000						
	pathobj	00000,-100,0200,4000,target_3,mato_3,6,2
	pathobj	02000,-200,0000,5000,training,RringS,20,1
	pathobj	00000,0300,-100,4000,target_3,mato_3,6,2
	pathobj	02000,1500,0000,5000,training,BringL,20,1
	pathobj	00500,-200,0000,4000,target_3,mato_3,6,2
	pathobj	00500,-100,0000,4000,target_3,mato_3,6,2
	pathobj	02000,0000,-1000,5000,training,RringU,20,1
	pathobj	02000,0300,-200,5000,training,BringS,20,1
;colony
	mapobj	0000,-4*Xlen,space_viewCY+(0*Ylen),5000,colony3R,nocoll_Istrat
	mapobj	0000,4*Xlen,space_viewCY+(0*Ylen),5000,colony3L,nocoll_Istrat

	pathobj	02000,-200,0100,5000,training,RringS,20,1

	pathobj	00200,-100,0000,4000,target_3,mato_3,6,2
	pathobj	00200,0300,0000,4000,target_3,mato_3,6,2
	pathobj	00200,0100,-200,4000,target_3,mato_3,6,2
	pathobj	00200,-200,0200,4000,target_3,mato_3,6,2
	pathobj	00200,0000,-100,4000,target_3,mato_3,6,2
	pathobj	01000,0100,-100,5000,training,BringS,20,1
	pathobj	00000,-100,0000,4000,target_3,mato_3,6,2
	pathobj	01500,-1500,-100,5000,training,RringR,20,1
	pathobj	01500,1500,100,5000,training,BringL,20,1
	pathobj	01500,-1500,0100,5000,training,RringR,20,1
	pathobj	01500,01500,0000,5000,training,BringL,20,1
	pathobj	00000,-200,0000,4000,target_3,mato_3,6,2
	pathobj	00000,0200,0000,4000,target_3,mato_3,6,2
	pathobj	00000,0000,-200,4000,target_3,mato_3,6,2
	pathobj	02000,0000,0200,4000,target_3,mato_3,6,2
	map_setbarshape	solid
	special	0000,0*Xlen,space_viewCY+(1*Ylen),dist,s_wark_0,spacebarwalker_Istrat
	map_SBtype1	4*2,0,1,0
	mapwait	3000
	mapgoto	.event1

