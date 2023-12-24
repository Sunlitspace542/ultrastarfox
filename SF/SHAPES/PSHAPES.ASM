
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


;--Shape file ----- C:\SHED\SHAPES5\MYSHIP_4.TXT ----
	ifne	DO_HDR

nullplayer
	ShapeHdr	0,0,0,0,0,0,0,0,playerB_col,36,14,80,80,id_0_c,0,0,0,0,<myship_4>
Bmyship_4	ShapeHdr	myship_4_P,0,myship_4_F,0,0,0,0,0,playerB_col,36,14,80,80,black_c,0,0,0,0,<myship_4>
	IFEQ	hipolyarwing ; SCRAMBLE sequence ship model
Imyship_4	ShapeHdr	myship_4_P,0,myship_4_F,0,500,0,0,0,playerB_col,36,14,80,80,id_0_c,0,0,0,0,<myship_4>
	ENDC
myship_4	ShapeHdr	myship_4_P,0,myship_4_F,0,0,0,0,0,playerB_col,36,14,80,80,id_0_c,0,0,0,0,<myship_4>
	IFEQ	hipolyarwing ; Teammate ship model
friendship_4	ShapeHdr	myship_4_P,0,myship_4_F,0,0,0,0,0,0,36,14,80,80,id_0_c,0,0,0,0,<myship_4>
	ENDC
	elseif
myship_4_P
	Pointsb	4
	pb	0,0,-10	;0
	pb	0,1,0	;1
	pb	0,-6,0	;2
	pb	0,2,80	;3
	PointsXb	6
	pb	36,14,-40	;4
	pb	20,-11,-20	;6
	pb	-18,9,-6	;8
	pb	-10,4,0	;10
	pb	20,4,0	;12
	pb	-14,10,20	;14

	EndPoints
myship_4_F
	Vizis	20
	Viz	0,10,1,-36,-121,-12	;0
	Viz	1,11,0,36,-121,-12	;1
	Viz	10,11,1,0,0,-127	;2
	Viz	11,2,0,-83,83,-50	;3
	Viz	0,2,10,83,83,-50	;4
	Viz	3,11,10,0,-127,3	;5
	Viz	3,2,11,-90,90,9	;6
	Viz	10,2,3,90,90,9	;7
	Viz	11,12,9,0,-98,81	;8
	Viz	4,9,12,-72,-91,52	;9
	Viz	10,13,5,0,123,-31	;10
	Viz	8,13,10,0,-98,81	;11
	Viz	6,15,11,65,100,43	;12
	Viz	11,15,6,-65,-100,-43	;13
	Viz	10,14,7,-65,100,43	;14
	Viz	7,14,10,65,-100,-43	;15
	Viz	13,8,5,72,-91,52	;16
	Viz	8,10,5,-80,-94,-29	;17
	Viz	4,11,9,80,-94,-29	;18
	Viz	12,11,4,0,123,-31	;19
	BSPInit	myship_4_EBSP
	BSP	6,myship_4_f1,.bsp2
	BSP	14,myship_4_f3,.bsp4
	BSPE	myship_4_f5
.bsp4	BSPE	myship_4_f6
.bsp2	BSP	1,myship_4_f7,.bsp8
	BSPE	myship_4_f9
.bsp8	BSPE	myship_4_f10

myship_4_f1	Faces
	Face3	16,6,-90,90,9,3,2,11
	FendQ
myship_4_f3	Faces
	Face3	7,14,-65,100,43,10,14,7
	FendQ
myship_4_f5	Faces
	Face3	0,10,0,123,-31,10,13,5
	Face3	44,11,0,-98,81,8,13,10
	Face3	0,16,72,-91,52,13,8,5
	Face3	1,17,-80,-94,-29,8,10,5
	FendQ
myship_4_f6	Faces
	Face3	20,7,90,90,9,10,2,3
	Face3	10,0,-36,-121,-12,0,10,1
	Face3	43,2,0,0,-127,10,11,1
	Face3	18,4,83,83,-50,0,2,10
	Face3	0,5,0,-127,3,3,11,10
	Face3	7,15,65,-100,-43,7,14,10
	FendQ
myship_4_f7	Faces
	Face3	10,1,36,-121,-12,1,11,0
	FendQ
myship_4_f9	Faces
	Face3	7,12,65,100,43,6,15,11
	Face3	7,13,-65,-100,-43,11,15,6
	FendQ
myship_4_f10	Faces
	Face3	14,3,-83,83,-50,11,2,0
	Face3	0,18,80,-94,-29,4,11,9
	Face3	0,19,0,123,-31,12,11,4
	Face3	44,8,0,-98,81,11,12,9
	Face3	1,9,-72,-91,52,4,9,12
	FendQ
myship_4_EBSP
	EndShape

	endc




;--Shape file ----- C:\SHED\NSHAPES\myship_l.txt ----
	ifne	DO_HDR

Bmyship_l	ShapeHdr	myship_l_P,0,myship_l_F,0,0,0,0,0,playerB_col,36,14,80,80,black_c,0,0,0,0,<myship_l>
myship_l	ShapeHdr	myship_l_P,0,myship_l_F,0,0,0,0,0,playerB_col,36,14,80,80,id_0_c,0,0,0,0,<myship_l>
	elseif
myship_l_P
	Pointsb	6
	pb	-36,14,-40	;0
	pb	25,10,-20	;1
	pb	0,0,-10	;2
	pb	0,1,0	;3
	pb	0,-6,0	;4
	pb	0,2,80	;5
	PointsXb	5
	pb	20,-11,-20	;6
	pb	-18,9,-6	;8
	pb	-10,4,0	;10
	pb	20,4,0	;12
	pb	-14,10,20	;14

	EndPoints
myship_l_F
	Vizis	20
	Viz	2,10,3,-36,-121,-12	;0
	Viz	3,11,2,36,-121,-12	;1
	Viz	10,11,3,0,0,-127	;2
	Viz	11,4,2,-83,83,-50	;3
	Viz	2,4,10,83,83,-50	;4
	Viz	5,11,10,0,-127,3	;5
	Viz	5,4,11,-90,90,9	;6
	Viz	10,4,5,90,90,9	;7
	Viz	11,12,9,0,-98,81	;8
	Viz	1,9,12,-80,-87,46	;9
	Viz	10,13,0,0,123,-31	;10
	Viz	8,13,10,0,-98,81	;11
	Viz	6,15,11,65,100,43	;12
	Viz	11,15,6,-65,-100,-43	;13
	Viz	10,14,7,-65,100,43	;14
	Viz	7,14,10,65,-100,-43	;15
	Viz	13,8,0,72,-91,52	;16
	Viz	8,10,0,-80,-94,-29	;17
	Viz	1,11,9,82,-90,-35	;18
	Viz	12,11,1,0,122,-36	;19
	BSPInit	myship_l_EBSP
	BSP	6,myship_l_f1,.bsp2
	BSP	14,myship_l_f3,.bsp4
	BSPE	myship_l_f5
.bsp4	BSPE	myship_l_f6
.bsp2	BSP	12,myship_l_f7,.bsp8
	BSPE	myship_l_f9
.bsp8	BSPE	myship_l_f10

myship_l_f1	Faces
	Face3	16,6,-90,90,9,5,4,11
	FendQ
myship_l_f3	Faces
	Face3	7,14,-65,100,43,10,14,7
	FendQ
myship_l_f5	Faces
	Face3	0,10,0,123,-31,10,13,0
	Face3	44,11,0,-98,81,8,13,10
	Face3	0,16,72,-91,52,13,8,0
	Face3	1,17,-80,-94,-29,8,10,0
	FendQ
myship_l_f6	Faces
	Face3	20,7,90,90,9,10,4,5
	Face3	10,0,-36,-121,-12,2,10,3
	Face3	43,2,0,0,-127,10,11,3
	Face3	18,4,83,83,-50,2,4,10
	Face3	0,5,0,-127,3,5,11,10
	Face3	7,15,65,-100,-43,7,14,10
	FendQ
myship_l_f7	Faces
	Face3	7,12,65,100,43,6,15,11
	FendQ
myship_l_f9	Faces
	Face3	10,8,0,-98,81,11,12,9
	Face3	6,9,-80,-87,46,1,9,12
	Face3	6,18,82,-90,-35,1,11,9
	Face3	6,19,0,122,-36,12,11,1
	FendQ
myship_l_f10	Faces
	Face3	14,3,-83,83,-50,11,4,2
	Face3	10,1,36,-121,-12,3,11,2
	Face3	7,13,-65,-100,-43,11,15,6
	FendQ
myship_l_EBSP
	EndShape

	endc

;--Shape file ----- C:\SHED\NSHAPES\myship_r.txt ----
	ifne	DO_HDR

Bmyship_r	ShapeHdr	myship_r_P,0,myship_r_F,0,0,0,0,0,playerB_col,36,14,80,80,black_c,0,0,0,0,<myship_r>
myship_r	ShapeHdr	myship_r_P,0,myship_r_F,0,0,0,0,0,playerB_col,36,14,80,80,id_0_c,0,0,0,0,<myship_r>
	elseif
myship_r_P
	Pointsb	6
	pb	36,14,-40	;0
	pb	-25,10,-20	;1
	pb	0,0,-10	;2
	pb	0,1,0	;3
	pb	0,-6,0	;4
	pb	0,2,80	;5
	PointsXb	5
	pb	20,-11,-20	;6
	pb	-18,9,-6	;8
	pb	-10,4,0	;10
	pb	20,4,0	;12
	pb	-14,10,20	;14

	EndPoints
myship_r_F
	Vizis	20
	Viz	2,10,3,-36,-121,-12	;0
	Viz	3,11,2,36,-121,-12	;1
	Viz	10,11,3,0,0,-127	;2
	Viz	11,4,2,-83,83,-50	;3
	Viz	2,4,10,83,83,-50	;4
	Viz	5,11,10,0,-127,3	;5
	Viz	5,4,11,-90,90,9	;6
	Viz	10,4,5,90,90,9	;7
	Viz	11,12,9,0,-98,81	;8
	Viz	0,9,12,-72,-91,52	;9
	Viz	10,13,1,0,122,-36	;10
	Viz	8,13,10,0,-98,81	;11
	Viz	6,15,11,65,100,43	;12
	Viz	11,15,6,-65,-100,-43	;13
	Viz	10,14,7,-65,100,43	;14
	Viz	7,14,10,65,-100,-43	;15
	Viz	13,8,1,80,-87,46	;16
	Viz	8,10,1,-82,-90,-35	;17
	Viz	0,11,9,80,-94,-29	;18
	Viz	12,11,0,0,123,-31	;19
	BSPInit	myship_r_EBSP
	BSP	6,myship_r_f1,.bsp2
	BSP	14,myship_r_f3,.bsp4
	BSPE	myship_r_f5
.bsp4	BSPE	myship_r_f6
.bsp2	BSP	1,myship_r_f7,.bsp8
	BSPE	myship_r_f9
.bsp8	BSPE	myship_r_f10

myship_r_f1	Faces
	Face3	16,6,-90,90,9,5,4,11
	FendQ
myship_r_f3	Faces
	Face3	7,14,-65,100,43,10,14,7
	FendQ
myship_r_f5	Faces
	Face3	6,10,0,122,-36,10,13,1
	Face3	10,11,0,-98,81,8,13,10
	Face3	6,16,80,-87,46,13,8,1
	Face3	6,17,-82,-90,-35,8,10,1
	FendQ
myship_r_f6	Faces
	Face3	20,7,90,90,9,10,4,5
	Face3	10,0,-36,-121,-12,2,10,3
	Face3	43,2,0,0,-127,10,11,3
	Face3	18,4,83,83,-50,2,4,10
	Face3	0,5,0,-127,3,5,11,10
	Face3	7,15,65,-100,-43,7,14,10
	FendQ
myship_r_f7	Faces
	Face3	10,1,36,-121,-12,3,11,2
	FendQ
myship_r_f9	Faces
	Face3	7,12,65,100,43,6,15,11
	Face3	7,13,-65,-100,-43,11,15,6
	FendQ
myship_r_f10	Faces
	Face3	14,3,-83,83,-50,11,4,2
	Face3	0,18,80,-94,-29,0,11,9
	Face3	0,19,0,123,-31,12,11,0
	Face3	44,8,0,-98,81,11,12,9
	Face3	1,9,-72,-91,52,0,9,12
	FendQ
myship_r_EBSP
	EndShape

	endc

;--Shape file ----- C:\SHED\NSHAPES\myship_b.txt ----
	ifne	DO_HDR

Bmyship_b	ShapeHdr	myship_b_P,0,myship_b_F,0,0,0,0,0,playerB_col,20,14,80,80,black_c,0,0,0,0,<myship_b>
myship_b	ShapeHdr	myship_b_P,0,myship_b_F,0,0,0,0,0,playerB_col,20,14,80,80,id_0_c,0,0,0,0,<myship_b>
	elseif
myship_b_P
	Pointsb	4
	pb	0,0,-10	;0
	pb	0,1,0	;1
	pb	0,-6,0	;2
	pb	0,2,80	;3
	PointsXb	6
	pb	25,10,-20	;4
	pb	20,-11,-20	;6
	pb	-18,9,-6	;8
	pb	-10,4,0	;10
	pb	20,4,0	;12
	pb	-14,10,20	;14

	EndPoints
myship_b_F
	Vizis	20
	Viz	0,10,1,-36,-121,-12	;0
	Viz	1,11,0,36,-121,-12	;1
	Viz	10,11,1,0,0,-127	;2
	Viz	11,2,0,-83,83,-50	;3
	Viz	0,2,10,83,83,-50	;4
	Viz	3,11,10,0,-127,3	;5
	Viz	3,2,11,-90,90,9	;6
	Viz	10,2,3,90,90,9	;7
	Viz	11,12,9,0,-98,81	;8
	Viz	4,9,12,-80,-87,46	;9
	Viz	10,13,5,0,122,-36	;10
	Viz	8,13,10,0,-98,81	;11
	Viz	6,15,11,65,100,43	;12
	Viz	11,15,6,-65,-100,-43	;13
	Viz	10,14,7,-65,100,43	;14
	Viz	7,14,10,65,-100,-43	;15
	Viz	13,8,5,80,-87,46	;16
	Viz	8,10,5,-82,-90,-35	;17
	Viz	4,11,9,82,-90,-35	;18
	Viz	12,11,4,0,122,-36	;19
	BSPInit	myship_b_EBSP
	BSP	6,myship_b_f1,.bsp2
	BSP	14,myship_b_f3,.bsp4
	BSPE	myship_b_f5
.bsp4	BSPE	myship_b_f6
.bsp2	BSP	12,myship_b_f7,.bsp8
	BSPE	myship_b_f9
.bsp8	BSPE	myship_b_f10

myship_b_f1	Faces
	Face3	16,6,-90,90,9,3,2,11
	FendQ
myship_b_f3	Faces
	Face3	7,14,-65,100,43,10,14,7
	FendQ
myship_b_f5	Faces
	Face3	6,10,0,122,-36,10,13,5
	Face3	10,11,0,-98,81,8,13,10
	Face3	6,16,80,-87,46,13,8,5
	Face3	6,17,-82,-90,-35,8,10,5
	FendQ
myship_b_f6	Faces
	Face3	20,7,90,90,9,10,2,3
	Face3	10,0,-36,-121,-12,0,10,1
	Face3	43,2,0,0,-127,10,11,1
	Face3	18,4,83,83,-50,0,2,10
	Face3	0,5,0,-127,3,3,11,10
	Face3	7,15,65,-100,-43,7,14,10
	FendQ
myship_b_f7	Faces
	Face3	7,12,65,100,43,6,15,11
	FendQ
myship_b_f9	Faces
	Face3	10,8,0,-98,81,11,12,9
	Face3	6,9,-80,-87,46,4,9,12
	Face3	6,18,82,-90,-35,4,11,9
	Face3	6,19,0,122,-36,12,11,4
	FendQ
myship_b_f10	Faces
	Face3	14,3,-83,83,-50,11,2,0
	Face3	10,1,36,-121,-12,1,11,0
	Face3	7,13,-65,-100,-43,11,15,6
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
