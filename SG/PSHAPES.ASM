
	start_shapes

	IFEQ	0

;--Shape file ----- C:\SHED\CUBE ----
	ifne	DO_HDR

petecube
	ShapeHdr	petecube_P,0,petecube_F,0,0,0,0,0,playerB_col,36,14,80,80,id_0_c,0,0,0,0,<petecube>
	elseif
petecube_P
	datahdr
	PointsXb	4
	pb	15,15,-15	;0
	pb	15,-15,-15	;2
	pb	15,15,15	;4
	pb	15,-15,15	;6

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


;--Shape file ----- C:\SHED\SHAPES5\MYSHIP_4.TXT ----
	ifne	DO_HDR

nullplayer
	ShapeHdr	0,0,0,0,0,0,0,0,playerB_col,36,14,80,80,id_0_c,0,0,0,0,<NULLPLAYER>
Bmyship_4	ShapeHdr	myship_4_P,0,myship_4_F,0,0,0,0,0,playerB_col,36,14,80,80,black_c,0,0,0,0,<SHADOW>
Imyship_4	ShapeHdr	myship_4_P,0,myship_4_F,0,500,0,0,0,playerB_col,36,14,80,80,id_P1_c,0,0,0,0,<INVISIBLE>
myship_4	ShapeHdr	myship_4_P,0,myship_4_F,0,0,0,0,0,playerB_col,36,14,80,80,id_P1_c,0,0,0,0,<ARWING>
friendship_4	ShapeHdr	myship_4_P,0,myship_4_F,0,0,0,0,0,playerF_col,36,14,80,80,id_0_c,0,0,0,0,<FRIEND>
slippy1	ShapeHdr	myship_4_P,0,myship_4_F,0,0,0,0,0,playerF_col,36,14,80,80,id_4_c,0,0,0,0,<SLIPPY>
falco1	ShapeHdr	myship_4_P,0,myship_4_F,0,0,0,0,0,playerF_col,36,14,80,80,id_7_c,0,0,0,0,<FALCO>
peppy1	ShapeHdr	myship_4_P,0,myship_4_F,0,0,0,0,0,playerF_col,36,14,80,80,id_6_C,0,0,0,0,<PEPPY>
playertwo1	ShapeHdr	myship_4_P,0,myship_4_F,0,0,0,0,0,playerF_col,36,14,80,80,id_P2_C,0,0,0,0,<PTWO>
my_up	ShapeHdr	myship_4_P,0,myship_4_F,0,100,0,0,5,0,0,0,100,0,id_0_c,0,0,0,0,<my_up>
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
myship_l	ShapeHdr	myship_l_P,0,myship_l_F,0,0,0,0,0,playerB_col,36,14,80,80,id_P1_c,0,0,0,0,<myship_l>
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
myship_r	ShapeHdr	myship_r_P,0,myship_r_F,0,0,0,0,0,playerB_col,36,14,80,80,id_P1_c,0,0,0,0,<myship_r>
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
myship_b	ShapeHdr	myship_b_P,0,myship_b_F,0,0,0,0,0,playerB_col,20,14,80,80,id_P1_c,0,0,0,0,<myship_b>
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


	end_shapes




