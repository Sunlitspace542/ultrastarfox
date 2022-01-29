map2_2

	map_setbarshape	solid

	mapwait	600

	cspecial	1500,0,Space_viewCY-1000,800,zaco_4,szaco0_istrat
	cspecial	1500,1000,Space_viewCY-500,800,zaco_4,szaco0_istrat
	pathobj	000,3000,3000,3000,nullshape,astemsg,10,10
	cspecial	5000,1000,Space_viewCY,800,zaco_4,szaco0_istrat
	pathobj	0000,-900,0000,0000,friendship_4,chase2_1,10,10
	pathcspecial	9000,-900,0000,0000,zaco_b,chase2_2,10,10

	pathcspecial	0000,2500,-2000,1800,zaco_8,egu6,10,10
	pathcspecial	12000,-2500,-2000,2100,zaco_8,egu6,10,10

; tunnel horiz
	pathobj	000,0000,-700,1000,nullshape,check,10,10
	pathcspecial	0000,2*Xlen,space_viewCY+(-1*Ylen),dist,walker_2,pyonta,10,10
	map_SBtype1	0,0,-1,0
	map_SBtype7	0,-5,0,0
	map_SBtype7	0,5,0,0
.solidbar1
	map_SBtype1	2,0,1,0
	map_SBtype1	0,0,-1,0
	maploop	.solidbar1,03

	map_SBtype7	0,-6,0,0
	map_SBtype7	0,6,0,0
	map_SBtype1	2,0,1,0
	map_SBtype1	0,0,-1,0
	map_SBtype1	2,0,1,0
	special	0000,0*Xlen,space_viewCY+(1*Ylen),dist,s_wark_0,spacebarwalker_Istrat
	map_SBtype1	4*2,0,1,0

	pathobj	0000,900,-60,0000,friendship_4,chase4_1,200,10
	pathcspecial	0000,900,-60,0000,zaco_b,chase4_2,200,10
	pathcspecial	1000,900,-60,0000,zaco_b,chase4_3,200,10
; simple
	pathcspecial	0000,2*Xlen,space_viewCY+(1*Ylen),dist,walker_2,pyonta,10,10
	map_SBtype1	4*2,0,1,0
	map_SBtype0	1*2,-3,0,0
	map_SBtype0	2*2,2,1,0
	map_SBtype0	1*2,-4,0,0
	map_SBtype0	2*2,4,1,0
	map_SBtype6	4*2,0,0,0
	mapobj	0000,100,-100,3000,nullshape,up1man_Istrat
	setalvar.w	sword2,item_0&WM
	mapwait	2000
	map_SBtype7	4*2,1,1,0
	map_SBtype5	1*2,-1,-1,0
	map_SBtype5	6*2,1,1,0

; tunnel vert
	map_SBtype0	0,-1,0,0
	map_SBtype0	0,6,0,0
	map_SBtype0	3,1,0,0
	map_SBtype0	0,-1,0,0
	map_SBtype0	0,-6,0,0
	map_SBtype0	3,1,0,0
	map_SBtype0	0,-1,0,0
	map_SBtype0	0,4,0,0
	map_SBtype0	3,1,0,0
	map_SBtype0	0,-1,0,0
	map_SBtype0	0,-4,0,0
.solidbar2
	map_SBtype0	3,1,0,0
	map_SBtype0	0,-1,0,0
	maploop	.solidbar2,02

	map_SBtype0	0,1,0,0
	map_SBtype0	0,-2,0,0
	map_SBtype0	0,2,0,0
	map_SBtype0	0,-3,0,0
	map_SBtype0	4,3,0,0

; tunnel twist
	pathobj	000,0000,-700,1000,nullshape,check,10,10
	map_SBtype15	0,0,0,0,0,4
	map_SBtype10	5,-5,0,0
	map_SBtype15	5,0,0,0,0,4
	map_SBtype15	5,1,0,0,0,4
	map_SBtype15	5,2,0,0,0,4
	map_SBtype15	5,1,0,0,0,4
	map_SBtype15	5,0,0,0,0,4
	mapobj		0000,50,space_viewCY+50,dist+(0*Zlen),item_5,item5_Istrat
	setalvar	sbyte1,1
	map_SBtype15	5,0,0,0,0,4
	map_SBtype15	5,-1,0,0,0,4
	map_SBtype15	0,-2,0,0,0,4
	map_SBtype10	5,5,0,0
	map_SBtype15	5,-1,0,0,0,4
	map_SBtype15	5,0,0,0,0,4

	mapobj	0000,-4*Xlen,space_viewCY+(0*Ylen),dist+(0*Zlen),colony3R,nocoll_Istrat
	mapobj	2000,4*Xlen,space_viewCY+(0*Ylen),dist+(0*Zlen),colony3L,nocoll_Istrat

	cspecial	0000,-500,-300,4000,w_l,winglazerman_Istrat
	special	0000,0300,Space_viewCY,800,cameleon,cameleon_istrat
	cspecial	1000,-300,Space_viewCY,800,cameleon,cameleon_istrat
	cspecial	0000,0000,Space_viewCY+250,800,cameleon,cameleon_istrat
	cspecial	2000,0000,Space_viewCY-250,800,cameleon,cameleon_istrat

	pathcspecial	0000,2500,-2000,1800,zaco_8,egu6_ifal,10,10
	pathcspecial	6000,-2500,-2000,2400,zaco_8,egu6_irab,10,10

	cspecial	0000,0250,Space_viewCY+250,800,cameleon,cameleon_istrat
	cspecial	1000,-250,Space_viewCY-250,800,cameleon,cameleon_istrat
	cspecial	0000,-250,Space_viewCY+250,800,cameleon,cameleon_istrat
	special	4000,0250,Space_viewCY-250,800,cameleon,cameleon_istrat

	map_SBtype8	1*2,-2,0,0
	map_SBtype8	1*2,1,0,0
	map_SBtypeA	1*2,-2,0,0
	map_SBtypeD	6*2,2,0,0

	mapobj	0000,(5-5)*Xlen,space_viewCY+(0*Ylen),dist,item_5,item5_Istrat
	setalvar	sbyte1,1

	special	0000,-2*Xlen,space_viewCY+(1*Ylen),dist+(0*Zlen),s_wark_0,spacebarwalker_Istrat
	cspecial	0000,2*Xlen,space_viewCY+(1*Ylen),dist+(0*Zlen),Bwarker_3,spacebarwalker_Istrat
	map_SBtypeE	2*2,4,1,0
	map_SBtypeC	6*2,3,0,0
	map_SBtype3	3*2,0,0,0
	map_SBtype6	3*2,0,0,0

	mapobj	0000,(1)*Xlen,space_viewCY+(0*Ylen),dist+(2*Zlen),item_6,item6_Istrat

	special	0000,0350,Space_viewCY,800,cameleon,cameleon_istrat
	cspecial	3000,-350,Space_viewCY,800,cameleon,cameleon_istrat

	setalvar	sbyte1,1

	map_SBtype11	4*2,0,0,0
	map_SBtypeC		0*2,-1,0,0
	map_SBtypeB		1*2,-1,0,0
	map_SBtypeB		1*2,1,-1,0
	map_SBtype8		1*2,-1,0,0
	
	cspecial	0000,-2*Xlen,space_viewCY+(1*Ylen),dist+(4*Zlen),Bwarker_3,spacebarwalker_Istrat
	special	0000,0*Xlen,space_viewCY+(1*Ylen),dist+(6*Zlen),s_wark_0,spacebarwalker_Istrat
	cspecial	0000,3*Xlen,space_viewCY+(1*Ylen),dist+(7*Zlen),Bwarker_3,spacebarwalker_Istrat
	map_SBtypeF	15*2,0,1,0

	mapobj	0000,0000,-60,2800,gate_0,gate_istrat

	mapwait	1000
	mapwait	3000

	map_SBtype10	8*2,0,0,0

	mapobj	0000,-4*Xlen,space_viewCY+(0*Ylen),dist+(0*Zlen),colony3R,nocoll_Istrat
	mapobj	2000,4*Xlen,space_viewCY+(0*Ylen),dist+(0*Zlen),colony3L,nocoll_Istrat

	pathobj	0000,0000,0400,0000,friendship_4,chase3_1,200,10
	pathcspecial	3000,0000,0400,0000,zaco_b,chase3_2,10,10

	pathcspecial	0200,0000,-450,4000,shieldr,e_shieldr,10,10
	pathcspecial	0200,0000,-200,4000,shieldr,e_shieldr,10,10
	pathcspecial	0200,0000,50,4000,shieldr,e_shieldr,10,10
	pathspecial	15000,0000,300,4000,shieldr,e_shieldr,10,10

	map_SBtype7		3*2,-3,1,0
	map_SBtype7		3*2,3,-1,0
	map_SBtype14	5*2,0,0,0
	map_SBtype10	2*2,4,0,0
	map_SBtype10	4*2,-4,0,0
	map_SBtype6		4*2,0,0,0
	map_SBtype7		4*2,-3,0,0
	map_SBtype7		4*2,3,0,0
	map_SBtype7		4*2,0,0,0
	map_SBtype10	4*2,0,0,0
	map_SBtype5		1*2,-2,0,0
	map_SBtype1		3*2,0,0,0


; horiz and vert moving.
speed	=	30

	pathobj	000,0000,-700,1000,nullshape,check,10,10
	map_SBtype17	6,0,10,0,-speed,0
	map_SBtype16	6,-10,-1,0,speed,0
	map_SBtype17	6,-1,-10,0,speed,0
	map_SBtype16	6,10,1,0,-speed,0
;--
	map_SBtype17	0,5,-10,0,speed,0
	map_SBtype17	0,-5,-10,0,speed,0
	map_SBtype17	3,0,10,0,-speed,0
	map_SBtype16	0,-20,-2,0,speed,0
	map_SBtype16	0,-10,-1,0,speed,0
	map_SBtype16	3,0,0,0,speed,0
	map_SBtype17	0,4,10,0,-speed,0
	map_SBtype17	0,-6,10,0,-speed,0
	map_SBtype17	3,-1,-10,0,speed,0
	map_SBtype16	0,20,0,0,-speed,0
	map_SBtype16	0,10,1,0,-speed,0
	map_SBtype16	3,0,2,0,-speed,0

	map_SBtype17	0,6,-10,0,speed,0
	map_SBtype17	0,-4,-10,0,speed,0
	map_SBtype17	3,1,10,0,-speed,0
	map_SBtype16	0,-20,-1,0,speed,0
	map_SBtype16	0,-10,0,0,speed,0
	map_SBtype16	3,0,0,1,speed,0
	map_SBtype17	0,3,10,0,-speed,0
	map_SBtype17	0,-7,10,0,-speed,0
	map_SBtype17	3,-2,-10,0,speed,0
	map_SBtype16	0,20,0,0,-speed,0
	map_SBtype16	0,10,-1,0,-speed,0
	map_SBtype16	3,0,-2,0,-speed,0

	map_SBtype17	0,7,10,0,speed,0
	map_SBtype17	0,-3,10,0,speed,0
	map_SBtype17	3,2,10,0,-speed,0
	map_SBtype16	0,-20,-1,0,speed,0
	map_SBtype16	0,-10,0,0,speed,0
	map_SBtype16	3,0,1,0,speed,0
	map_SBtype17	0,5,10,0,-speed,0
	map_SBtype17	0,-5,10,0,-speed,0
	map_SBtype17	3,0,-10,0,speed,0
	map_SBtype16	0,20,2,0,-speed,0
	map_SBtype16	0,10,1,0,-speed,0
	map_SBtype16	3,0,0,0,-speed,0

;--
	map_SBtype17	1,0,10,0,-speed,0
	map_SBtype16	1,-10,-1,0,speed,0
	map_SBtype17	1,-1,-10,0,speed,0
	map_SBtype16	1,10,1,0,-speed,0
	map_SBtype17	1,1,10,0,-speed,0
	map_SBtype16	1,-10,0,0,speed,0
	map_SBtype17	1,-2,-10,0,speed,0
	map_SBtype16	1,10,-1,0,-speed,0
	map_SBtype17	1,2,10,0,-speed,0
	map_SBtype16	1,-10,0,0,speed,0
	map_SBtype17	1,0,-10,0,speed,0
	map_SBtype16	3000,10,1,0,-speed,0

	pathobj	0000,1200,0200,0600,friendship_4,chase1_1,200,10
	pathcspecial	1000,1200,0200,0600,zaco_b,chase1_2,10,10
	mapobj	4000,000,0000,2000,spacepilon,spacepilon_istrat

	pathspecial	0200,0000,-200,3000,shieldr,e_shieldr,10,10
	pathspecial	0200,0000,200,3000,shieldr,e_shieldr,10,10
	pathcspecial	0200,0200,0,3000,shieldr,e_shieldr,10,10
	pathobj	0000,-250,-350,0,my_bird,my_bird,10,10
	pathcspecial	12000,-200,0,3000,shieldr,e_shieldr,10,10


;37 specials
;chase 3 times
	fadeoutbgm
	setbgm	bgm_boss1

; barricader
	mapobj	0000,0000,Space_viewCY+1000,1500,boss_1_2,boss1_Istrat
	mapwaitboss
	markboss	boss22

	mapwait	2000

	maprts


	ifeq	1
; twisty thing.
	map_spacebarIC	0,0,20,0,2
	map_spacebarX	0,-4,-20,0
	map_spacebarwait	2
	map_spacebarX	0,-3,-20,0
	map_spacebarwait	2
	map_spacebarX	0,-2,-20,0
	map_spacebarwait	2
	map_spacebarX	0,-1,-20,0
	map_spacebarwait	2
	map_spacebarX	0,0,-20,0
	map_spacebarwait	2
	map_spacebarX	0,1,-20,0
	map_spacebarwait	2
	map_spacebarX	0,2,-20,0
	map_spacebarwait	2
	map_spacebarX	0,3,-20,0
	map_spacebarwait	2
	map_spacebarX	0,4,-20,0
	map_spacebarwait	4




	map_spacebarIC	0,0,20,2,-2
	map_spacebarX	0,-4,-20,0
	map_spacebarwait	2
	map_spacebarX	0,-3,-20,0
	map_spacebarwait	2
	map_spacebarX	0,-2,-20,0
	map_spacebarwait	2
	map_spacebarX	0,-1,-20,0
	map_spacebarwait	2
	map_spacebarX	0,0,-20,0
	map_spacebarwait	2
	map_spacebarX	0,1,-20,0
	map_spacebarwait	2
	map_spacebarX	0,2,-20,0
	map_spacebarwait	2
	map_spacebarX	0,3,-20,0
	map_spacebarwait	2
	map_spacebarX	0,4,-20,0
	map_spacebarwait	4
	endc




