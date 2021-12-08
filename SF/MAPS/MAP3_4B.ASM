map3_4b
	mapwait	2000
	szaco2_mapobj	0000,1800,0000,-0100,100
	szaco2_mapobj	0400,1800,0400,0100,0
	szaco2_mapobj	-400,1800,-400,0100,0
	mapwait	3000
;swinger
	pathcspecial	0400,-1000,-700,2000,shark,call_fol,4,4
	pathcspecial	1000,-1000,-700,2000,shark,call_fol,4,4
	cspecial	1500,0200,0000,4000,r_hou_0,shou0a_istrat
	special		1500,0000,-100,4000,s_hou_0,shou0_istrat
	cspecial	1000,-400,200,4000,r_hou_0,shou0a_istrat
	pathcspecial	1000,0000,-200,4000,zaco_0,itachi_b,2,4
;	special	0400,0000,space_viewCY+500,-100,swing,swing_Istrat
;	mapobj	0000,-200,space_viewCY+600,-100,swing,swing_Istrat
;	mapobj	6000,0200,space_viewCY+600,-100,swing,swing_Istrat

;friend
	pathobj	0000,-900,0000,0000,friendship_4,chase2_1,10,10
	pathobj	01000,-900,000,0000,zaco_b,chase2_2,10,10
	map_setbarshape	wire
	map_SBtype8	8,2,-1,0
	cspecial	1200,-100,-200,4000,r_hou_0,shou0a_istrat
	map_SBtypeB	6,-2,0,0
	map_SBtype8	4,-4,2,0
	map_SBtypea	4,2,3,0
	map_SBtypec	2,0,-3,0
	pathcspecial	1000,-300,-100,4000,zaco_0,itachi_a,2,4
	map_SBtype13	2,-5,-1,0
	skillfly_init
	skillfly_set	 0000,-10,3000,100
	setalvar	sbyte1,1
	map_SBtypeb	0,1,0,0
	map_SBtypeb	0,-1,0,0
	map_SBtypec	0,0,1,0
	map_SBtypec	0,0,-1,0

	pathcspecial	03000,-1000,-700,2000,shark,call_fol,10,10
	skillfly_bonus 0000,0,0,1500,item_5,item5_istrat
	setalvar	sbyte1,1

;map_SBtypeNO(0-19)		wait,x,y,z,init(0-7),speed

;big_missille

	mapobj	0500,-200,0,4000,pole_0,pole0_istrat
	mapobj	2000,0000,space_viewcy,4000,big_m,misspod_istrat
	map_SBtype7	1,5,1,0
	mapobj	0500,200,100,4000,pole_0,pole0_istrat
;	special	000,0200,0100,4000,r_hou_0,shou0a_istrat
	mapobj	2000,0200,space_viewCY-100,4000,big_m,misspod_istrat	
;	map_SBtype8	4,0,3,0
;	map_SBtype13	2,-2,-1,0
	mapobj	1000,-100,space_viewCY+200,4000,big_m,misspod_istrat
	map_SBtype6	1,4,-1,0
;colony
	mapobj	0000,-4*Xlen,space_viewCY+(0*Ylen),5000,colony3R,nocoll_Istrat
	mapobj	0200,4*Xlen,space_viewCY+(0*Ylen),5000,colony3L,nocoll_Istrat
	map_SBtype13	10,-3,0,0
	map_SBtype6	4,-4,-1,0
;;;;;	pathobj	000,0000,-700,1000,nullshape,check,10,10
;windmill
	special	0000,1800,space_viewCY-100,4000,round_0,windmill_istrat
	setalvar	roty,064	;deg90
	setalvar	vel,120
	mapwait	0400
	setalvar	roty,080	;deg90
	setalvar	vel,120
	mapwait	0400
	setalvar	roty,100	;deg90
	setalvar	vel,120
	mapwait	0400
	setalvar	roty,120
	setalvar	vel,100
	mapwait	0400
	setalvar	vel,0
	setalvar	roty,deg180
	mapwait	1500
	setalvar	vel,100
	setalvar	sword1,-2
	map_SBtype8	-4,2,0,0
	mapwait	0500
	map_SBtypeA	4,1,0,0
	mapwait	1000
	map_setbarshape	solid
;colony
	mapobj	0000,-4*Xlen,space_viewCY+(0*Ylen),5000,colony3R,nocoll_Istrat
	mapobj	0200,4*Xlen,space_viewCY+(0*Ylen),5000,colony3L,nocoll_Istrat

	map_setbarshape	wire

	pathobj	000,0000,-700,1000,nullshape,check,10,10
;rotation_bar
	map_SBtype18	4,0,0,0,0,0
	map_SBtype18	4,0,0,0,0,-4
	map_SBtype18	4,0,0,0,0,0
	map_SBtype18	4,0,0,0,0,4
;colony
	mapobj	0000,-4*Xlen,space_viewCY+(0*Ylen),5000,colony3R,nocoll_Istrat
	mapobj	0200,4*Xlen,space_viewCY+(0*Ylen),5000,colony3L,nocoll_Istrat

	map_setbarshape	solid
	map_SBtype0	0,5,0,0
	map_SBtype0	0,-5,0,0
	map_SBtype0	0,4,0,0
	map_SBtype0	0,-4,0,0
	map_SBtype0	0,3,0,0
	map_SBtype0	0,-3,0,0
	map_SBtype0	0,2,0,0
	map_SBtype0	1,-2,0,0
	map_setbarshape	wire

	map_SBtype18	4,0,0,0,0,0
	map_SBtype18	4,0,0,0,0,-4
	map_SBtype18	4,0,0,0,0,0
	map_SBtype18	4,0,0,0,0,4
	map_setbarshape	solid
	map_SBtype0	0,5,0,0
	map_SBtype0	0,-5,0,0
	map_SBtype0	0,4,0,0
	map_SBtype0	0,-4,0,0
	map_SBtype0	0,3,0,0
	map_SBtype0	0,-3,0,0
	map_SBtype0	0,2,0,0
	map_SBtype0	1,-2,0,0
	map_setbarshape	wire
	map_SBtype18	4,0,0,0,2,0
	map_SBtypeOBJ	0,2,0,0,item_7,item7_Istrat
	setalvar	sbyte1,1
	map_SBtype18	4,0,0,0,2,-4
	map_SBtype18	4,0,0,0,2,0
	map_SBtype18	4,0,0,0,2,4
	map_setbarshape	solid
;colony
	mapobj	0000,-4*Xlen,space_viewCY+(0*Ylen),5000,colony3R,nocoll_Istrat
	mapobj	0000,4*Xlen,space_viewCY+(0*Ylen),5000,colony3L,nocoll_Istrat

	map_SBtype0	0,5,0,0
	map_SBtype0	0,-5,0,0
	map_SBtype0	0,4,0,0
	map_SBtype0	0,-4,0,0
	map_SBtype0	0,3,0,0
	map_SBtype0	0,-3,0,0
	map_SBtype0	0,2,0,0
	map_SBtype0	1,-2,0,0
	map_setbarshape	wire
	map_SBtype18	4,0,0,0,2,0
	map_SBtype18	4,0,0,0,2,-4
	map_SBtype18	4,0,0,0,2,0
	special	00,100,-300,4000,r_hou_0,shou0a_istrat
	map_SBtype18	4,0,0,0,2,4
	map_SBtype18	4,0,0,0,2,0
	map_SBtype10	4,0,0,0
	map_setbarshape	solid
	map_SBtype0	0,5,0,0
	map_SBtype0	0,-5,0,0
	map_SBtype0	0,4,0,0
	map_SBtype0	0,-4,0,0
	map_SBtype0	0,3,0,0
	map_SBtype0	0,-3,0,0
	map_SBtype0	0,2,0,0
	map_SBtype0	8,-2,0,0
	map_SBtype12	8,-2,0,0
;gate
	map_SBtypeOBJ	8,1,-1,1,gate_0,gate3_Istrat
	pathobj	1000,3000,3000,1000,nullshape,e_gate,10,10
	
	map_SBtype11	1,0,-1,1
	special	0000,2*Xlen,space_viewCY+(1*Ylen),dist+(0*Zlen),s_wark_0,spacebarwalker_Istrat
	mapwait	2000
;friend
	pathobj	0000,0000,0400,0000,friendship_4,chase3_1,200,10
	pathobj	0000,0000,400,0000,zaco_b,chase3_2,10,10

;;;;;;	pathobj	000,0000,-700,1000,nullshape,check,10,10
;colony
	mapobj	0000,-4*Xlen,space_viewCY+(0*Ylen),5000,colony3R,nocoll_Istrat
	mapobj	0000,4*Xlen,space_viewCY+(0*Ylen),5000,colony3L,nocoll_Istrat

	pathcspecial	00,400,-150,5000,zaco_0,itachi_a,2,4
.sbbar1
	map_SBtype8	0,-1,0,0
	map_SBtype8	4,1,0,0
	maploop	.sbbar1,06
;	map_setbarshape	wire
;.sbbar2
;	map_SBtype8	0,-1,0,0
;	map_SBtype8	4,1,0,0
;	maploop	.sbbar2,02
;	map_setbarshape	solid
;.sbbar3
;	map_SBtype8	0,-1,0,0
;	map_SBtype8	4,1,0,0
;	maploop	.sbbar3,02
;colony
	mapobj	0000,-4*Xlen,space_viewCY+(0*Ylen),5000,colony3R,nocoll_Istrat
	mapobj	0000,4*Xlen,space_viewCY+(0*Ylen),5000,colony3L,nocoll_Istrat

;	map_setbarshape	wire
	pathcspecial	00,-300,-100,4000,zaco_0,itachi_a,2,4
.sbbar4
	map_SBtype8	0,-1,1,0
	map_SBtype8	4,1,1,0
	maploop	.sbbar4,02
	cspecial	0000,1*Xlen,space_viewCY+(1*Ylen),dist+(0*Zlen),Bwarker_3,spacebarwalker_Istrat
;	map_setbarshape	solid
.sbbar5
	map_SBtype8	0,-1,1,0
	map_SBtype8	4,1,1,0
	maploop	.sbbar5,02
	cspecial	00,0300,0200,4000,r_hou_0,shou0a_istrat
	map_setbarshape	wire
.sbbar6
	map_SBtype8	0,-1,0,0
	map_SBtype8	4,1,0,0
	maploop	.sbbar6,02
;;;;;	pathobj	000,0000,-700,1000,nullshape,check,10,10
;colony
	mapobj	0000,-4*Xlen,space_viewCY+(0*Ylen),5000,colony3R,nocoll_Istrat
	mapobj	0000,4*Xlen,space_viewCY+(0*Ylen),5000,colony3L,nocoll_Istrat

	map_setbarshape	solid

	cspecial	0000,0,space_viewCY+(1*Ylen),dist+(0*Zlen),Bwarker_3,spacebarwalker_Istrat
.sbbar7
	map_SBtype8	0,0,1,0
	map_SBtype8	4,0,-1,0
	maploop	.sbbar7,04
;	map_setbarshape	wire
;.sbbar8
;	map_SBtype8	0,0,1,0
;	map_SBtype8	4,0,-1,0
;	maploop	.sbbar8,02
;	map_setbarshape	solid
	cspecial	0000,0,space_viewCY+(1*Ylen),dist+(0*Zlen),Bwarker_3,spacebarwalker_Istrat

.sbbar9
	map_SBtype8	0,0,1,0
	map_SBtype8	4,0,-1,0
;	maploop	.sbbar9,04
;	map_setbarshape	wire
;.sbbara
;	map_SBtype8	0,0,1,0
;	map_SBtype8	4,0,-1,0
;	maploop	.sbbara,02
;;;;;	pathobj	000,0000,-700,1000,nullshape,check,10,10
;	map_setbarshape	solid
	special	0000,0,space_viewCY+(1*Ylen),dist+(0*Zlen),s_wark_0,spacebarwalker_Istrat

;colony
	mapobj	0000,-4*Xlen,space_viewCY+(0*Ylen),5000,colony3R,nocoll_Istrat
	mapobj	0000,4*Xlen,space_viewCY+(0*Ylen),5000,colony3L,nocoll_Istrat

.sbbarb
	map_SBtype8	0,0,1,0
	map_SBtype8	4,0,-1,0
	maploop	.sbbarb,04

;	map_setbarshape	wire
;.sbbarc
;	map_SBtype8	0,0,1,0
;	map_SBtype8	4,0,-1,0
;	maploop	.sbbarc,02
;
;	map_setbarshape	solid
	map_SBtype8	0,0,1,0
	map_SBtype8	8,0,-1,0
;skillfly
	skillfly_init
	skillfly_set -280,00,3000,150
	mapobj	0000,-280,00,3000,r_hou_0,shou0a_istrat
	setalvar	sbyte1,1

	map_SBtype12	8,-5,0,0
	map_spacebarwait	5
	special	000,-150,-100,4500,s_hou_0,shou0_istrat
	skillfly_set 200,0,3500,150
	mapobj	0000,200,00,3500,r_hou_0,shou0a_istrat
	setalvar	sbyte1,1
	map_SBtype12	8,0,0,5	       ;	8,-5,0,0

	mapwait		3000
	skillfly_bonus 0000,-50,0,2000,gate_0,gate3_istrat
	map_SBtype14	4,0,0,0
;	map_setbarshape	wire
;	mapobj	0500,-200,-100,4000,pole_0,pole0_istrat
	map_SBtypea	2,-2,1,5	       ;	8,-5,0,0
	map_SBtype8	2,4,0,5	       ;	8,-5,0,0
	map_SBtypec	2,2,-1,5	       ;	8,-5,0,0
	map_SBtypeb	2,-1,0,5	       ;	8,-5,0,0
;	mapobj	0500,00,0,4000,pole_0,pole0_istrat


	cspecial	1000,0200,0200,4000,r_hou_0,shou0a_istrat
;;;;;	pathobj	000,00,-700,3000,nullshape,check,10,10
;wire&solid
	map_SBtype1	1,0,1,0
	special	0000,-2*Xlen,space_viewCY+(1*Ylen),dist+(0*Zlen),s_wark_0,spacebarwalker_Istrat
	cspecial	0000,2*Xlen,space_viewCY+(1*Ylen),dist+(0*Zlen),Bwarker_3,spacebarwalker_Istrat

;	map_setbarshape	solid

	map_SBtype3	0,4,-1,1
	map_SBtype10	0,-4,1,1
	map_SBtype5	0,2,1,1
	map_SBtype5	0,-2,1,1

	map_SBtype1	2,-2,-1,4
	map_setbarshape	wire

	map_SBtype19	0,1,0,0,7,0
	map_SBtype19	8,-3,0,0,7,0

	cspecial	0200,000,000,4000,r_hou_0,shou0a_istrat
	map_setbarshape	solid
	map_SBtypeB	0,-2,0,0
	map_SBtypeB	0,2,0,0
	map_setbarshape	wire
	map_SBtype1	0,0,-1,0
	map_SBtype1	2,0,1,0
	map_setbarshape	solid
	map_SBtype5	0,2,1,1
	map_SBtype5	8,-2,-1,1

	mapobj	1000,(1)*Xlen,space_viewCY+(0*Ylen),dist+(2*Zlen),item_6,item6_Istrat

	map_SBtypeB	0,-2,0,0
	map_SBtypeB	0,2,0,0
	map_setbarshape	wire
	map_SBtype1	0,0,-1,0
	map_SBtype1	2,0,1,0
	map_setbarshape	solid
	map_SBtype5	0,2,1,1
	map_SBtype5	8,-2,-1,1

	map_SBtypeB	0,-2,1,0
	map_SBtypeB	0,2,1,0
	map_SBtype18	0,4,0,0,0,4
	map_SBtype18	0,4,0,0,0,-4
	map_SBtype18	0,-4,0,0,0,4
	map_SBtype18	0,-4,0,0,0,-4
	map_setbarshape	wire
	map_SBtype1	0,0,0,0
	map_SBtype1	2,0,2,0
	map_setbarshape	solid
	map_SBtype5	0,2,2,1
	map_SBtype5	8,-2,0,1

	special	000,0200,-100,4000,s_hou_0,shou0_istrat
	map_SBtypeB	0,-1,0,0
	map_SBtypeB	0,3,0,0
	map_setbarshape	wire
	map_SBtype1	0,1,-1,0
	map_SBtype1	2,1,1,0
	map_setbarshape	solid
	map_SBtype5	0,3,1,1
	map_SBtype5	8,-1,-1,1

	map_SBtypec	0,0,-2,0
	map_SBtypec	0,0,2,0
	map_SBtype18	0,4,0,0,0,4
	map_SBtype18	0,4,0,0,0,-4
	map_SBtype18	0,-4,0,0,0,4
	map_SBtype18	0,-4,0,0,0,-4
	map_setbarshape	wire
	map_SBtype0	0,1,0,0
	map_SBtype0	4,-1,0,0
	map_setbarshape	solid
	map_SBtypeB	0,-2,0,0
	map_SBtypeB	0,2,0,0
	map_setbarshape	wire
	map_SBtype1	0,0,-1,0
	map_SBtype1	6,0,1,0
	map_setbarshape	solid
	map_SBtypec	0,2,-2,0
	map_SBtypec	0,2,2,0
	map_setbarshape	wire
	map_SBtype0	0,3,0,0
	map_SBtype0	0,1,0,0
	pathobj	000,0000,-700,1000,nullshape,check,10,10
;gate
	map_SBtypeOBJ	0,2,0,0,gate_0,gate_Istrat
	pathobj	1500,3000,0000,1000,nullshape,e_gate,10,10
	map_setbarshape	solid
	map_SBtypeB	0,-2,0,0
	map_SBtypeB	0,2,0,0
	map_SBtype18	0,4,0,0,0,4
	map_SBtype18	0,4,0,0,0,-4
	map_SBtype18	0,-4,0,0,0,4
	map_SBtype18	0,-4,0,0,0,-4
	map_setbarshape	wire
	map_SBtype1	0,0,-1,0
	map_SBtype1	8,0,1,0

	map_SBtypea	2,-2,1,5
;	map_SBtype4	2,00,01,5
;	map_SBtype7	2,01,-2,5
;---------------------------------------------------------------------------


; horiz and vert moving.
speed	=	30
	map_SBtype17	6,0,12,0,-speed,-4
	map_SBtype16	6,-12,-1,0,speed,3
	map_SBtype17	6,0,10,0,-speed,-4
	map_SBtype16	6,-10,-1,0,speed,3
	map_SBtype17	6,-1,-10,0,speed,-3
	map_SBtype16	6,10,1,0,-speed,4

	map_SBtype17	2,0,12,0,-speed,-4
	map_SBtype16	2,-12,-1,0,speed,3
	map_SBtype17	2,0,10,0,-speed,-6
	map_SBtype16	2,-10,-1,0,speed,5
	map_SBtype17	2,-1,-10,0,speed,-4
	map_SBtype16	2,10,1,0,-speed,3
	map_SBtype17	2,1,10,0,-speed,-2
	map_SBtype16	2,-10,0,0,speed,7
	map_SBtype17	2,-2,-10,0,speed,-6
	map_SBtype17	2,1,12,0,-speed,-2
	map_SBtype16	2,-12,0,0,speed,7
	map_SBtype16	2,10,-1,0,-speed,4
	map_SBtype17	2,2,10,0,-speed,-5
	map_SBtype16	2,-10,0,0,speed,3
	map_SBtype17	2,0,-10,0,speed,-3
	map_SBtype16	4,10,1,0,-speed,2
	map_SBtypeb	0,1,0,0
	map_SBtypeb	4,-4,0,0
	map_SBtype8	8,5,0,0
	mapobj	0800,000,0,2500,pole_0,pole0_istrat
	mapobj	0800,400,100,2500,pole_0,pole0_istrat
	mapobj	0800,-400,-100,2500,pole_0,pole0_istrat
;	mapwait	1500
;friend
	pathobj	0000,1200,0200,0600,friendship_4,chase1_1,200,10
	pathobj	1000,1200,200,0600,zaco_b,chase1_2,10,10
	mapobj	1000,200,100,3000,pole_0,pole0_istrat
	mapobj	1000,-200,-200,3000,pole_0,pole0_istrat
	map_SBtype16	4,-12,-1,0,speed,5
	map_SBtype17	2,-1,-12,0,speed,-4
	map_SBtype16	2,10,1,0,-speed,3
	map_SBtype17	4,0,-12,0,speed,-3
	map_SBtype16	4,12,-1,0,-speed,4
	map_SBtype17	4,0,12,0,-speed,-6
	map_SBtype16	4,-10,0,0,speed,7
	special	1500,-200,-100,4000,s_hou_0,shou0_istrat
	cspecial	1500,0200,0120,4000,r_hou_0,shou0a_istrat

	special	0000,0000,-100,800,cameleon,cameleon_istrat
	cspecial	0000,-100,0100,800,cameleon,cameleon_istrat
	special	1000,100,0100,800,cameleon,cameleon_istrat
	mapobj	0000,000,0,3000,pole_0,pole0_istrat
;;;;	pathobj	000,0000,-700,1000,nullshape,check,10,10

;---------------------------------------------------------------------------

;big_iron_flame
	map_XPspacebar	1000,0,0,3000,0,6
	map_XPspacebar	1000,-200,0,3000,2,-6
	map_XPspacebar	1000,200,0,3000,4,6


	map_spacebarC	0,0,3000,1,3
	map_spacebarC	0,0,3000,3,3

	map_spacebarZ	-1,-1,4,0
	map_spacebarZ	1,-1,4,0
	map_spacebarZ	-1,1,4,0
	map_spacebarZ	1,1,4,0


	mapwait		1000


	map_spacebarC	-1,0,3000,4,3
	map_spacebarX	-1,-1,0,2

	mapwait		1000

	map_spacebarC	1,0,3000,2,-4
	map_spacebarX	2,-1,0,4

	mapwait		1000

	map_spacebarC	0,-2,3000,4,5
	map_spacebarX	0,-3,0,2

	mapwait		1000

	map_spacebarC	0,1,3000,2,-2
	map_spacebarX	0,1,0,4

	mapwait		1000

; large bit	
	map_Zspacebar	-2,-2,0	
	map_Zspacebar	2,-2,0
	map_Zspacebar	-2,2,0	
	map_Zspacebar	2,2,0
	
	map_spacebarwait	2

	map_Xspacebar	0,-2,0	
	map_Xspacebar	0,2,0	
	map_Yspacebar	-2,0,0	
	map_Yspacebar	2,0,0	

	map_spacebarwait	2

	map_Zspacebar	-2,-2,0
	map_Zspacebar	2,-2,0	
	map_Zspacebar	-2,2,0	
	map_Zspacebar	2,2,0	
	map_SBtype18	0,4,0,0,0,4
	map_SBtype18	0,4,0,0,0,-4
	map_SBtype18	0,-4,0,0,0,4
	map_SBtype18	0,-4,0,0,0,-4


	setbgm	$f1
	mapwait	medpspeed*7
	setbgm	5

	mapobj	0000,0000,space_viewCY,4000,colony_0,colony0_Istrat
	setvarobj	mapvar1
	mapobj	0000,100<<2,space_viewCY,4000,colony_1,colony1_Istrat

	mapobj	0000,0000,space_viewCY,4000,colony_2,colony2_Istrat
	setalvarptr.w	ptr,mapvar1

	mapwait	1000
	mapobj	000,000,space_viewcy,5000,item_5,item5_istrat
	setalvar	sbyte1,1

	map_SBtype18	0,4,0,0,0,4
	map_SBtype18	0,4,0,0,0,-4
	map_SBtype18	0,-4,0,0,0,4
	map_SBtype18	0,-4,0,0,0,-4
.wait
	mapwait	16
	mapif	chkstratdone1,.end
	mapgoto	.wait
.end

	setbg	1_3b
	initbg

	incmap	3-4-t

	mapjsr	Mtunnelexit
	setbgm	$f1	; fade out music


	maprts




