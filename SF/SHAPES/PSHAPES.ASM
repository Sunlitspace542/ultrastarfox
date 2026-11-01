
	start_shapes

	IFEQ	0

;--Shape file ----- C:\SHED\CUBE ----
	ifne	DO_HDR

petecube
	ShapeHdr	petecube_P,0,petecube_F,0,0,0,0,0,0,40,40,40,69,id_0_c,0,0,0,0,<cube>
	elseif
petecube_P
	datahdr
	PointsXb	4
	pb	40,40,-40	;0
	pb	40,-40,-40	;2
	pb	40,40,40	;4
	pb	40,-40,40	;6

	EndPoints
petecube_F
	Vizis	7
	Viz	4,6,2,-127,0,0	;0
	Viz	3,7,5,127,0,0	;1
	Viz	2,3,1,0,0,-127	;2
	Viz	5,7,6,0,0,127	;3
	Viz	2,6,7,0,127,0	;4
	Viz	0,1,5,0,-127,0	;5
	Viz	5,7,6,0,0,127	;7

petecube_f1	Faces
	Face4	6,4,0,127,0,2,6,7,3
	Face4	6,6,0,0,127,5,7,6,4
	Face4	6,0,-127,0,0,4,6,2,0
	Face4	6,1,127,0,0,3,7,5,1
	Face4	6,2,0,0,-127,2,3,1,0
	Face4	6,5,0,-127,0,0,1,5,4
	Face4	51,3,0,0,127,5,7,6,4
	Fend
	EndShape

	endc

	ENDC

	IFEQ	1

;--Shape file ----- Lcube.asm ----
	ifne	DO_HDR
Ncube	shapehdr	Ncube_P,0,petecube_F,0,0,0,0,boss8_scale,0,5,60,5,69,id_0_c,0,0,0,0,<cube>
	elseif

Ncube_P
	datahdr
	PointsXb	4
	pb	5,0,-5	;0
	pb	5,-100,-5	;2
	pb	5,0,5	;4
	pb	5,-100,5	;6
	EndPoints

	endc

	ENDC


;--Shape file ----- Lcube.asm ----
	ifne	DO_HDR
Lcube	shapehdr	Lcube_P,0,petecube_F,0,0,0,0,0,0,5,60,5,69,id_0_c,0,0,0,0,<cube>
	elseif
d	=	5	
c	=	60
h	=	5

Lcube_P
	datahdr
	PointsXb	4
	pb	d,c,-h	;0
	pb	d,-c,-h	;2
	pb	d,c,h	;4
	pb	d,-c,h	;6
	EndPoints

	endc


;--Shape file ----- Lcube.asm ----
	ifne	DO_HDR
gndLcube	shapehdr	gndLcube_P,0,petecube_F,0,0,0,0,0,0,5,60,5,69,id_0_c,0,0,0,0,<cube>
	elseif
d	=	5	
c	=	60
h	=	5

gndLcube_P
	datahdr
	PointsXb	4
	pb	d,c-60,-h	;0
	pb	d,-c-60,-h	;2
	pb	d,c-60,h	;4
	pb	d,-c-60,h	;6
	EndPoints

	endc

;--Shape file ----- myship_4 ---- Generated with FastFX
	ifne	DO_HDR

	IFEQ	HIPOLYARWING
myship_4 ; main player ship model
	ShapeHdr	myship_4_P,0,myship_4_F,0,0,0,0,0,playerB_col,36,14,80,80,id_0_c,0,0,0,0,<myship_4>
Bmyship_4 ; player ship model used during space armada end cutscene
	ShapeHdr	myship_4_P,0,myship_4_F,0,0,0,0,0,playerB_col,36,14,80,80,black_c,0,0,0,0,<myship_4>
Imyship_4 ; SCRAMBLE sequence ship model
	ShapeHdr	myship_4_P,0,myship_4_F,0,500,0,0,0,playerB_col,36,14,80,80,id_0_c,0,0,0,0,<myship_4>
friendship_4 ; Teammate ship model
	ShapeHdr	myship_4_P,0,myship_4_F,0,0,0,0,0,0,36,14,80,80,id_0_c,0,0,0,0,<myship_4>
nullplayer ; invisible ship model
	ShapeHdr	0,0,0,0,0,0,0,0,playerB_col,36,14,80,80,id_0_c,0,0,0,0,<myship_4>
myzoom_4 ; ship model used for enter cockpit animation
	ShapeHdr	myship_4Z_P,0,myship_4_F,0,-80,0,0,4,0,36,14,80,80,id_0_c,0,0,0,0,<myship_4>
	ENDC	;HIPOLYARWING
	elseif
myship_4_P
	PointsXb	6
	pb	-10,4,0	;0
	pb	20,4,0	;2
	pb	-18,9,-6	;4
	pb	-14,10,20	;6
	pb	20,-11,-20	;8
	pb	36,14,-40	;10
	Pointsb	4
	pb	0,1,0	;12
	pb	0,-6,0	;13
	pb	0,0,-10	;14
	pb	0,2,80	;15

	EndPoints
myship_4Z_P
	PointsXb	6
	pb	-10,4,0	;0
	pb	20,4,0	;2
	pb	-18,9,-6	;4
	pb	-14,10,20	;6
	pb	20,-11,-20	;8
	pb	36,14,-40	;10
	Pointsb	4
	pb	0,1,0	;12
	pb	0,-6,0	;13
	pb	0,0,-2	;14
	pb	0,2,80	;15

	EndPoints
myship_4_F
	Vizis	20
	Viz	3,4,11	;0
	Viz	10,5,2	;1
	Viz	10,1,5	;2
	Viz	4,0,11	;3
	Viz	0,13,15	;4
	Viz	15,13,1	;5
	Viz	15,1,0	;6
	Viz	2,1,10	;7
	Viz	0,3,11	;8
	Viz	4,3,0	;9
	Viz	1,2,5	;10
	Viz	9,6,0	;11
	Viz	0,6,9	;12
	Viz	1,7,8	;13
	Viz	8,7,1	;14
	Viz	12,1,14	;15
	Viz	14,0,12	;16
	Viz	14,13,0	;17
	Viz	1,13,14	;18
	Viz	0,1,12	;19
	BSPInit	myship_4_EBSP
	BSP	4,myship_4_f1,.bsp2
	BSP	5,myship_4_f3,.bsp4
	BSPE	myship_4_f5
.bsp4
	BSPE	myship_4_f6
.bsp2
	BSPE	myship_4_f7

myship_4_f1	Faces
	Face3	20,4,90,90,9,0,13,15
	FendQ
myship_4_f3	Faces
	Face3	16,5,-90,90,9,15,13,1
	FendQ
myship_4_f5	Faces
	Face3	43,19,0,0,-127,0,1,12
	Face3	10,15,36,-121,-12,12,1,14
	Face3	10,16,-36,-121,-12,14,0,12
	Face3	0,6,0,-127,3,15,1,0
	Face3	18,17,83,83,-50,14,13,0
	Face3	14,18,-83,83,-50,1,13,14
	FendQ
myship_4_f6	Faces
	Face3	7,13,-65,-100,-43,1,7,8
	Face3	1,1,-72,-91,52,10,5,2
	Face3	0,7,0,123,-31,2,1,10
	Face3	44,10,0,-98,81,1,2,5
	Face3	0,2,80,-94,-29,10,1,5
	Face3	7,14,65,100,43,8,7,1
	FendQ
myship_4_f7	Faces
	Face3	7,11,65,-100,-43,9,6,0
	Face3	0,0,72,-91,52,3,4,11
	Face3	0,8,0,123,-31,0,3,11
	Face3	44,9,0,-98,81,4,3,0
	Face3	1,3,-80,-94,-29,4,0,11
	Face3	7,12,-65,100,43,0,6,9
	FendQ
myship_4_EBSP
	EndShape

	endc

;--Shape file ----- myship_l ---- Generated with FastFX
	ifne	DO_HDR

myship_l
	ShapeHdr	myship_l_P,0,myship_l_F,0,0,0,0,0,playerB_col,36,14,80,80,id_0_c,0,0,0,0,<myship_l>
Bmyship_l
	ShapeHdr	myship_l_P,0,myship_l_F,0,0,0,0,0,playerB_col,36,14,80,80,black_c,0,0,0,0,<myship_l>
myzoom_l
	ShapeHdr	myship_lZ_P,0,myship_l_F,0,-80,0,0,4,0,36,14,80,80,id_0_c,0,0,0,0,<myship_l>
	elseif
myship_l_P
	PointsXb	5
	pb	-10,4,0	;0
	pb	20,4,0	;2
	pb	-18,9,-6	;4
	pb	-14,10,20	;6
	pb	20,-11,-20	;8
	Pointsb	6
	pb	0,1,0	;10
	pb	0,-6,0	;11
	pb	0,0,-10	;12
	pb	25,10,-20	;13
	pb	-36,14,-40	;14
	pb	0,2,80	;15

	EndPoints
myship_lZ_P
	PointsXb	5
	pb	-10,4,0	;0
	pb	20,4,0	;2
	pb	-18,9,-6	;4
	pb	-14,10,20	;6
	pb	20,-11,-20	;8
	Pointsb	6
	pb	0,1,0	;10
	pb	0,-6,0	;11
	pb	0,0,-2	;12
	pb	25,10,-20	;13
	pb	-36,14,-40	;14
	pb	0,2,80	;15

	EndPoints
myship_l_F
	Vizis	20
	Viz	3,4,14	;0
	Viz	4,0,14	;1
	Viz	0,11,15	;2
	Viz	15,11,1	;3
	Viz	15,1,0	;4
	Viz	0,3,14	;5
	Viz	13,5,2	;6
	Viz	13,1,5	;7
	Viz	2,1,13	;8
	Viz	4,3,0	;9
	Viz	1,2,5	;10
	Viz	9,6,0	;11
	Viz	0,6,9	;12
	Viz	1,7,8	;13
	Viz	8,7,1	;14
	Viz	10,1,12	;15
	Viz	12,0,10	;16
	Viz	12,11,0	;17
	Viz	1,11,12	;18
	Viz	0,1,10	;19
	BSPInit	myship_l_EBSP
	BSP	2,myship_l_f1,.bsp2
	BSP	3,myship_l_f3,.bsp4
	BSPE	myship_l_f5
.bsp4
	BSPE	myship_l_f6
.bsp2
	BSPE	myship_l_f7

myship_l_f1	Faces
	Face3	20,2,90,90,9,0,11,15
	FendQ
myship_l_f3	Faces
	Face3	16,3,-90,90,9,15,11,1
	FendQ
myship_l_f5	Faces
	Face3	43,19,0,0,-127,0,1,10
	Face3	10,15,36,-121,-12,10,1,12
	Face3	10,16,-36,-121,-12,12,0,10
	Face3	0,4,0,-127,3,15,1,0
	Face3	18,17,83,83,-50,12,11,0
	Face3	14,18,-83,83,-50,1,11,12
	FendQ
myship_l_f6	Faces
	Face3	7,13,-65,-100,-43,1,7,8
	Face3	6,6,-80,-87,46,13,5,2
	Face3	6,8,0,122,-36,2,1,13
	Face3	10,10,0,-98,81,1,2,5
	Face3	6,7,82,-90,-35,13,1,5
	Face3	7,14,65,100,43,8,7,1
	FendQ
myship_l_f7	Faces
	Face3	7,11,65,-100,-43,9,6,0
	Face3	0,0,72,-91,52,3,4,14
	Face3	0,5,0,123,-31,0,3,14
	Face3	44,9,0,-98,81,4,3,0
	Face3	1,1,-80,-94,-29,4,0,14
	Face3	7,12,-65,100,43,0,6,9
	FendQ
myship_l_EBSP
	EndShape

	endc

;--Shape file ----- myship_r ---- Generated with FastFX
	ifne	DO_HDR

myship_r
	ShapeHdr	myship_r_P,0,myship_r_F,0,0,0,0,0,playerB_col,36,14,80,80,id_0_c,0,0,0,0,<myship_r>
Bmyship_r
	ShapeHdr	myship_r_P,0,myship_r_F,0,0,0,0,0,playerB_col,36,14,80,80,black_c,0,0,0,0,<myship_r>
myzoom_r
	ShapeHdr	myship_rZ_P,0,myship_r_F,0,-80,0,0,4,0,36,14,80,80,id_0_c,0,0,0,0,<myship_r>
	elseif
myship_r_P
	PointsXb	5
	pb	-10,4,0	;0
	pb	20,4,0	;2
	pb	-18,9,-6	;4
	pb	-14,10,20	;6
	pb	20,-11,-20	;8
	Pointsb	6
	pb	0,1,0	;10
	pb	0,-6,0	;11
	pb	0,0,-10	;12
	pb	-25,10,-20	;13
	pb	36,14,-40	;14
	pb	0,2,80	;15

	EndPoints
myship_rZ_P
	PointsXb	5
	pb	-10,4,0	;0
	pb	20,4,0	;2
	pb	-18,9,-6	;4
	pb	-14,10,20	;6
	pb	20,-11,-20	;8
	Pointsb	6
	pb	0,1,0	;10
	pb	0,-6,0	;11
	pb	0,0,-2	;12
	pb	-25,10,-20	;13
	pb	36,14,-40	;14
	pb	0,2,80	;15

	EndPoints
myship_r_F
	Vizis	20
	Viz	14,5,2	;0
	Viz	14,1,5	;1
	Viz	0,11,15	;2
	Viz	15,11,1	;3
	Viz	15,1,0	;4
	Viz	2,1,14	;5
	Viz	3,4,13	;6
	Viz	4,0,13	;7
	Viz	0,3,13	;8
	Viz	4,3,0	;9
	Viz	1,2,5	;10
	Viz	9,6,0	;11
	Viz	0,6,9	;12
	Viz	1,7,8	;13
	Viz	8,7,1	;14
	Viz	10,1,12	;15
	Viz	12,0,10	;16
	Viz	12,11,0	;17
	Viz	1,11,12	;18
	Viz	0,1,10	;19
	BSPInit	myship_r_EBSP
	BSP	2,myship_r_f1,.bsp2
	BSP	3,myship_r_f3,.bsp4
	BSPE	myship_r_f5
.bsp4
	BSPE	myship_r_f6
.bsp2
	BSPE	myship_r_f7

myship_r_f1	Faces
	Face3	20,2,90,90,9,0,11,15
	FendQ
myship_r_f3	Faces
	Face3	16,3,-90,90,9,15,11,1
	FendQ
myship_r_f5	Faces
	Face3	43,19,0,0,-127,0,1,10
	Face3	10,15,36,-121,-12,10,1,12
	Face3	10,16,-36,-121,-12,12,0,10
	Face3	0,4,0,-127,3,15,1,0
	Face3	18,17,83,83,-50,12,11,0
	Face3	14,18,-83,83,-50,1,11,12
	FendQ
myship_r_f6	Faces
	Face3	7,13,-65,-100,-43,1,7,8
	Face3	1,0,-72,-91,52,14,5,2
	Face3	0,5,0,123,-31,2,1,14
	Face3	44,10,0,-98,81,1,2,5
	Face3	0,1,80,-94,-29,14,1,5
	Face3	7,14,65,100,43,8,7,1
	FendQ
myship_r_f7	Faces
	Face3	7,11,65,-100,-43,9,6,0
	Face3	6,6,80,-87,46,3,4,13
	Face3	6,8,0,122,-36,0,3,13
	Face3	10,9,0,-98,81,4,3,0
	Face3	6,7,-82,-90,-35,4,0,13
	Face3	7,12,-65,100,43,0,6,9
	FendQ
myship_r_EBSP
	EndShape

	endc

;--Shape file ----- myship_b ---- Generated with FastFX
	ifne	DO_HDR

myship_b
	ShapeHdr	myship_b_P,0,myship_b_F,0,0,0,0,0,playerB_col,25,11,80,80,id_0_c,0,0,0,0,<myship_b>
Bmyship_b
	ShapeHdr	myship_b_P,0,myship_b_F,0,0,0,0,0,playerB_col,25,11,80,80,black_c,0,0,0,0,<myship_b>
myzoom_b
	ShapeHdr	myship_bZ_P,0,myship_b_F,0,-80,0,0,4,0,25,11,80,80,id_0_c,0,0,0,0,<myship_b>
	elseif
myship_b_P
	PointsXb	6
	pb	-10,4,0	;0
	pb	20,4,0	;2
	pb	-18,9,-6	;4
	pb	-14,10,20	;6
	pb	20,-11,-20	;8
	pb	25,10,-20	;10
	Pointsb	4
	pb	0,1,0	;12
	pb	0,-6,0	;13
	pb	0,0,-10	;14
	pb	0,2,80	;15

	EndPoints
myship_bZ_P
	PointsXb	6
	pb	-10,4,0	;0
	pb	20,4,0	;2
	pb	-18,9,-6	;4
	pb	-14,10,20	;6
	pb	20,-11,-20	;8
	pb	25,10,-20	;10
	Pointsb	4
	pb	0,1,0	;12
	pb	0,-6,0	;13
	pb	0,0,-2	;14
	pb	0,2,80	;15

	EndPoints
myship_b_F
	Vizis	20
	Viz	0,13,15	;0
	Viz	15,13,1	;1
	Viz	15,1,0	;2
	Viz	3,4,11	;3
	Viz	10,5,2	;4
	Viz	10,1,5	;5
	Viz	4,0,11	;6
	Viz	2,1,10	;7
	Viz	0,3,11	;8
	Viz	4,3,0	;9
	Viz	1,2,5	;10
	Viz	9,6,0	;11
	Viz	0,6,9	;12
	Viz	1,7,8	;13
	Viz	8,7,1	;14
	Viz	12,1,14	;15
	Viz	14,0,12	;16
	Viz	14,13,0	;17
	Viz	1,13,14	;18
	Viz	0,1,12	;19
	BSPInit	myship_b_EBSP
	BSP	0,myship_b_f1,.bsp2
	BSP	1,myship_b_f3,.bsp4
	BSPE	myship_b_f5
.bsp4
	BSPE	myship_b_f6
.bsp2
	BSPE	myship_b_f7

myship_b_f1	Faces
	Face3	20,0,90,90,9,0,13,15
	FendQ
myship_b_f3	Faces
	Face3	16,1,-90,90,9,15,13,1
	FendQ
myship_b_f5	Faces
	Face3	43,19,0,0,-127,0,1,12
	Face3	10,15,36,-121,-12,12,1,14
	Face3	10,16,-36,-121,-12,14,0,12
	Face3	0,2,0,-127,3,15,1,0
	Face3	18,17,83,83,-50,14,13,0
	Face3	14,18,-83,83,-50,1,13,14
	FendQ
myship_b_f6	Faces
	Face3	7,13,-65,-100,-43,1,7,8
	Face3	6,4,-80,-87,46,10,5,2
	Face3	6,7,0,122,-36,2,1,10
	Face3	10,10,0,-98,81,1,2,5
	Face3	6,5,82,-90,-35,10,1,5
	Face3	7,14,65,100,43,8,7,1
	FendQ
myship_b_f7	Faces
	Face3	7,11,65,-100,-43,9,6,0
	Face3	6,3,80,-87,46,3,4,11
	Face3	6,8,0,122,-36,0,3,11
	Face3	10,9,0,-98,81,4,3,0
	Face3	6,6,-82,-90,-35,4,0,11
	Face3	7,12,-65,100,43,0,6,9
	FendQ
myship_b_EBSP
	EndShape

	endc


	IFEQ	1

;--Shape file ----- C:\SHED\SHAPES5\BOSS_D_A.ANM ----
	ifne	DO_HDR

boss_d_a
	ShapeHdr	boss_d_a_P,0,boss_d_a_F,0,0,0,0,1,0,25,33,40,44,id_0_c,0,0,0,0,<boss_d_a>
	elseif
boss_d_a_P
	datahdr
	Frames	8
	jumptab	.A0A
	jumptab	.A1A
	jumptab	.A2A
	jumptab	.A3A
	jumptab	.A4A
	jumptab	.A5A
	jumptab	.A6A
	jumptab	.A7A
.A0A	Pointsb	19
	pb	0,-15,-30	;0
	pb	-10,0,-25	;1
	pb	10,-2,-18	;2
	pb	-25,-20,-10	;3
	pb	0,-22,-10	;4
	pb	25,-24,-6	;5
	pb	0,-32,-2	;6
	pb	0,-22,5	;7
	pb	25,-20,10	;8
	pb	-23,-20,12	;9
	pb	0,-15,15	;10
	pb	11,-15,20	;11
	pb	-11,-15,20	;12
	pb	10,0,25	;13
	pb	5,-10,26	;14
	pb	-5,-10,26	;15
	pb	5,-20,26	;16
	pb	-5,-20,26	;17
	pb	-10,0,28	;18
	PointsXb	2
	pb	-15,-15,0	;19
	pb	-5,-22,0	;21
	jump	.EB0
.A1A	Pointsb	19
	pb	0,-16,-30	;0
	pb	-10,-2,-28	;1
	pb	10,-1,-3	;2
	pb	-25,-19,-11	;3
	pb	0,-23,-10	;4
	pb	25,-26,-4	;5
	pb	0,-33,-2	;6
	pb	0,-23,5	;7
	pb	23,-24,10	;8
	pb	-25,-24,8	;9
	pb	0,-16,15	;10
	pb	9,-13,21	;11
	pb	-11,-20,16	;12
	pb	11,-18,35	;13
	pb	3,-15,28	;14
	pb	-10,-11,20	;15
	pb	8,-22,23	;16
	pb	-8,-19,25	;17
	pb	-10,0,15	;18
	PointsXb	2
	pb	-15,-16,0	;19
	pb	-5,-23,0	;21
	jump	.EB0
.A2A	Pointsb	19
	pb	0,-16,-30	;0
	pb	-10,-3,-35	;1
	pb	10,0,-15	;2
	pb	-23,-17,-13	;3
	pb	0,-23,-10	;4
	pb	25,-24,-8	;5
	pb	0,-33,-2	;6
	pb	0,-23,5	;7
	pb	21,-21,13	;8
	pb	-25,-26,4	;9
	pb	0,-16,15	;10
	pb	6,-12,24	;11
	pb	-10,-22,14	;12
	pb	10,-15,40	;13
	pb	3,-20,28	;14
	pb	-12,-14,12	;15
	pb	10,-20,21	;16
	pb	-11,-16,22	;17
	pb	-10,-1,3	;18
	PointsXb	2
	pb	-15,-16,0	;19
	pb	-5,-23,0	;21
	jump	.EB0
.A3A	Pointsb	19
	pb	0,-16,-30	;0
	pb	-10,-9,-39	;1
	pb	10,-1,-25	;2
	pb	-21,-19,-14	;3
	pb	0,-23,-10	;4
	pb	25,-21,-10	;5
	pb	0,-33,-2	;6
	pb	0,-23,5	;7
	pb	23,-16,13	;8
	pb	-25,-24,8	;9
	pb	0,-16,15	;10
	pb	4,-14,26	;11
	pb	-8,-21,22	;12
	pb	10,-1,34	;13
	pb	6,-23,25	;14
	pb	-13,-18,15	;15
	pb	11,-16,20	;16
	pb	-9,-11,22	;17
	pb	-10,0,15	;18
	PointsXb	2
	pb	-15,-16,0	;19
	pb	-5,-23,0	;21
	jump	.EB0
.A4A	Pointsb	19
	pb	0,-15,-30	;0
	pb	-11,-12,-35	;1
	pb	10,-1,-29	;2
	pb	-23,-22,-11	;3
	pb	0,-22,-10	;4
	pb	25,-18,-11	;5
	pb	0,-32,-2	;6
	pb	0,-22,5	;7
	pb	25,-20,10	;8
	pb	-25,-20,10	;9
	pb	0,-15,15	;10
	pb	4,-17,27	;11
	pb	-5,-15,26	;12
	pb	10,0,25	;13
	pb	9,-22,21	;14
	pb	-11,-20,20	;15
	pb	9,-12,21	;16
	pb	-11,-10,20	;17
	pb	-10,0,25	;18
	PointsXb	2
	pb	-15,-15,0	;19
	pb	-5,-22,0	;21
	jump	.EB0
.A5A	Pointsb	19
	pb	0,-15,-30	;0
	pb	-10,-3,-23	;1
	pb	10,-2,-35	;2
	pb	-25,-23,-8	;3
	pb	0,-22,-10	;4
	pb	23,-16,-13	;5
	pb	0,-32,-2	;6
	pb	0,-22,5	;7
	pb	25,-23,8	;8
	pb	-23,-23,10	;9
	pb	0,-15,15	;10
	pb	8,-20,24	;11
	pb	-6,-10,24	;12
	pb	10,1,15	;13
	pb	12,-18,15	;14
	pb	-7,-20,24	;15
	pb	9,-11,21	;16
	pb	-12,-13,19	;17
	pb	-11,-17,35	;18
	PointsXb	2
	pb	-15,-15,0	;19
	pb	-5,-22,0	;21
	jump	.EB0
.A6A	Pointsb	19
	pb	0,-15,-30	;0
	pb	-10,0,-3	;1
	pb	10,-8,-39	;2
	pb	-25,-25,-4	;3
	pb	0,-22,-10	;4
	pb	21,-18,-14	;5
	pb	0,-32,-2	;6
	pb	0,-22,5	;7
	pb	25,-25,4	;8
	pb	-23,-20,12	;9
	pb	0,-15,15	;10
	pb	11,-21,16	;11
	pb	-8,-9,21	;12
	pb	10,0,3	;13
	pb	11,-13,11	;14
	pb	-4,-15,27	;15
	pb	10,-13,21	;16
	pb	-11,-17,20	;17
	pb	-10,-14,37	;18
	PointsXb	2
	pb	-15,-15,0	;19
	pb	-5,-22,0	;21
	jump	.EB0
.A7A	Pointsb	19
	pb	0,-15,-30	;0
	pb	-10,1,-15	;1
	pb	11,-12,-35	;2
	pb	-25,-23,-8	;3
	pb	0,-22,-10	;4
	pb	23,-22,-11	;5
	pb	0,-32,-2	;6
	pb	0,-22,5	;7
	pb	25,-23,8	;8
	pb	-19,-16,15	;9
	pb	0,-15,15	;10
	pb	11,-19,17	;11
	pb	-10,-11,20	;12
	pb	10,1,15	;13
	pb	10,-10,19	;14
	pb	-4,-12,27	;15
	pb	8,-17,25	;16
	pb	-8,-20,23	;17
	pb	-10,-2,40	;18
	PointsXb	2
	pb	-15,-15,0	;19
	pb	-5,-22,0	;21
.EB0

	EndPoints
boss_d_a_F
	Vizis	17
	Viz	22,7,6,-80,56,80	;0
	Viz	4,22,6,-107,43,-53	;1
	Viz	6,7,21,80,56,80	;2
	Viz	10,14,11,-28,-107,-62	;3
	Viz	11,16,10,-28,107,-62	;4
	Viz	10,16,14,116,0,53	;5
	Viz	16,11,14,-90,0,90	;6
	Viz	12,15,10,28,-107,-62	;7
	Viz	10,17,12,28,107,-62	;8
	Viz	15,17,10,-116,0,53	;9
	Viz	15,12,17,90,0,90	;10
	Viz	20,22,4,-70,100,-35	;19
	Viz	10,7,22,-63,90,63	;20
	Viz	0,4,21,70,100,-35	;21
	Viz	19,21,7,63,90,63	;22
	Viz	10,20,0,0,-127,0	;23
	Viz	6,21,4,107,43,-53	;24

boss_d_a_f1	Faces
	Face3	43,0,-80,56,80,22,7,6
	Face3	43,1,-107,43,-53,4,22,6
	Face3	43,2,80,56,80,6,7,21
	Face3	12,3,-28,-107,-62,10,14,11
	Face3	20,4,-28,107,-62,11,16,10
	Face3	14,5,116,0,53,10,16,14
	Face3	43,6,-90,0,90,16,11,14
	Face3	14,7,28,-107,-62,12,15,10
	Face3	16,8,28,107,-62,10,17,12
	Face3	18,9,-116,0,53,15,17,10
	Face3	43,10,90,0,90,15,12,17
	Face4	25,11,-70,100,-35,20,22,4,0
	Face4	16,12,-63,90,63,10,7,22,20
	Face4	23,13,70,100,-35,0,4,21,19
	Face4	12,14,63,90,63,19,21,7,10
	Face4	21,15,0,-127,0,10,20,0,19
	Face3	43,16,107,43,-53,6,21,4
	Face2	25,-1,0,0,0,8,13
	Face2	18,-1,0,0,0,8,20
	Face2	21,-1,0,0,0,2,5
	Face2	16,-1,0,0,0,20,5
	Face2	27,-1,0,0,0,18,9
	Face2	18,-1,0,0,0,19,9
	Face2	23,-1,0,0,0,3,1
	Face2	16,-1,0,0,0,3,19
	Fend
	EndShape

	endc

	ENDC


	end_shapes




