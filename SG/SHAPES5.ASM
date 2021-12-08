	start_shapes

;--Shape file ----- C:\SHED\NSHAPES\bu_2.txt ----
	ifne	DO_HDR

bu_2
	ShapeHdr	bu_2_P,0,bu_2_F,0,0,0,0,bu_scale2,bu_2_col,10,70,20,73,id_0_c,0,0,0,0,<bu_2>
	elseif
bu_2_P
	Pointsb	10
	pb	10,-70,0	;0
	pb	-10,0,0	;1
	pb	10,0,20	;2
	pb	-10,-70,0	;3
	pb	-10,0,20	;4
	pb	10,0,0	;5
	pb	-5,-70,20	;6
	pb	-10,-70,15	;7
	pb	-10,-65,20	;8
	pb	10,-70,20	;9

	EndPoints
bu_2_F
	Vizis	5
	Viz	0,9,6,0,127,0	;0
	Viz	3,7,8,127,0,0	;1
	Viz	5,2,9,-127,0,0	;2
	Viz	4,8,6,0,0,127	;3
	Viz	8,7,6,73,73,73	;4

bu_2_f1	Faces
	Face5	20,0,0,127,0,0,9,6,7,3
	Face5	18,1,127,0,0,3,7,8,4,1
	Face4	14,2,-127,0,0,5,2,9,0
	Face5	16,3,0,0,127,4,8,6,9,2
	Face3	44,4,73,73,73,8,7,6
	Fend
	EndShape

	endc

;--Shape file ----- C:\SHED\NSHAPES\myzoom_4.txt ----
	ifne	DO_HDR

myzoom_4
	ShapeHdr	myzoom_4_P,0,myzoom_4_F,0,-80,0,0,4,0,36,14,80,80,id_P1_c,0,0,0,0,<myzoom_4>
	elseif
myzoom_4_P
	Pointsb	4
	pb	0,0,-2	;0
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
myzoom_4_F
	Vizis	20
	Viz	0,10,1,-33,-110,-55	;0
	Viz	1,11,0,33,-110,-55	;1
	Viz	10,11,1,0,0,-127	;2
	Viz	11,2,0,-38,38,-115	;3
	Viz	0,2,10,38,38,-115	;4
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
	BSPInit	myzoom_4_EBSP
	BSP	6,myzoom_4_f1,.bsp2
	BSP	14,myzoom_4_f3,.bsp4
	BSPE	myzoom_4_f5
.bsp4	BSPE	myzoom_4_f6
.bsp2	BSP	1,myzoom_4_f7,.bsp8
	BSPEND
.bsp8	BSP	12,myzoom_4_f9,.bsp10
	BSPE	myzoom_4_f11
.bsp10	BSPE	myzoom_4_f12

myzoom_4_f1	Faces
	Face3	16,6,-90,90,9,3,2,11
	FendQ
myzoom_4_f3	Faces
	Face3	7,14,-65,100,43,10,14,7
	FendQ
myzoom_4_f5	Faces
	Face3	0,10,0,123,-31,10,13,5
	Face3	44,11,0,-98,81,8,13,10
	Face3	0,16,72,-91,52,13,8,5
	Face3	1,17,-80,-94,-29,8,10,5
	FendQ
myzoom_4_f6	Faces
	Face3	20,7,90,90,9,10,2,3
	Face3	10,0,-33,-110,-55,0,10,1
	Face3	43,2,0,0,-127,10,11,1
	Face3	18,4,38,38,-115,0,2,10
	Face3	0,5,0,-127,3,3,11,10
	Face3	7,15,65,-100,-43,7,14,10
	FendQ
myzoom_4_f7	Faces
	Face3	10,1,33,-110,-55,1,11,0
	FendQ
myzoom_4_f9	Faces
	Face3	7,12,65,100,43,6,15,11
	FendQ
myzoom_4_f11	Faces
	Face3	44,8,0,-98,81,11,12,9
	Face3	1,9,-72,-91,52,4,9,12
	Face3	0,18,80,-94,-29,4,11,9
	Face3	0,19,0,123,-31,12,11,4
	FendQ
myzoom_4_f12	Faces
	Face3	14,3,-38,38,-115,11,2,0
	Face3	7,13,-65,-100,-43,11,15,6
	FendQ
myzoom_4_EBSP
	EndShape

	endc


;--Shape file ----- C:\SHED\SHAPES6\MYBASE_0.TXT ----
	ifne	DO_HDR

mybase_0
	ShapeHdr	mybase_0_P,0,mybase_0_F,0,0,0,0,mybase_scale+1,0,50,42,47,75,id_0_c,0,0,0,0,<mybase_0>
	elseif
mybase_0_P
	Pointsb	26
	pb	-5,-15,-47	;0
	pb	-2,-37,-47	;1
	pb	4,-15,-45	;2
	pb	-5,-15,-45	;3
	pb	1,-37,-45	;4
	pb	-2,-37,-45	;5
	pb	1,-15,-42	;6
	pb	-2,-15,-42	;7
	pb	29,0,-40	;8
	pb	-50,0,-40	;9
	pb	-50,-40,-40	;10
	pb	31,-42,-40	;11
	pb	-47,-42,-40	;12
	pb	-50,0,-37	;13
	pb	-29,-22,-37	;14
	pb	10,-27,-37	;15
	pb	-24,-27,-37	;16
	pb	-50,-40,-37	;17
	pb	42,-42,-37	;18
	pb	-47,-42,-37	;19
	pb	42,0,-35	;20
	pb	-47,0,-35	;21
	pb	42,-40,-35	;22
	pb	-47,-40,-35	;23
	pb	-21,-18,-27	;24
	pb	-21,-22,-27	;25
	PointsXb	23
	pb	-29,-40,-40	;26
	pb	-29,0,-37	;28
	pb	5,-22,-37	;30
	pb	29,-40,-37	;32
	pb	31,-42,-37	;34
	pb	31,0,-35	;36
	pb	31,-40,-35	;38
	pb	-5,-18,-27	;40
	pb	-5,-22,-27	;42
	pb	10,-27,-27	;44
	pb	16,-27,-27	;46
	pb	-11,-18,2	;48
	pb	-15,-18,2	;50
	pb	-11,-21,2	;52
	pb	-15,-21,2	;54
	pb	7,0,7	;56
	pb	19,0,7	;58
	pb	-10,-18,7	;60
	pb	-16,-18,7	;62
	pb	-10,-22,7	;64
	pb	16,-22,7	;66
	pb	10,-13,12	;68
	pb	16,-13,12	;70

	EndPoints
mybase_0_F
	Vizis	48
	Viz	3,5,7,89,12,89	;0
	Viz	6,4,2,-89,12,89	;1
	Viz	4,6,7,0,17,126	;2
	Viz	5,3,0,126,17,0	;3
	Viz	18,22,38,0,90,90	;4
	Viz	32,34,38,73,73,73	;5
	Viz	34,32,27,90,90,0	;6
	Viz	32,38,36,90,0,90	;7
	Viz	38,22,20,0,0,127	;8
	Viz	27,32,29,127,0,0	;9
	Viz	35,39,23,0,90,90	;11
	Viz	39,35,33,-73,73,73	;12
	Viz	23,39,37,0,0,127	;13
	Viz	28,37,39,-90,0,90	;14
	Viz	17,23,21,70,0,106	;15
	Viz	10,17,13,127,0,0	;16
	Viz	17,19,23,54,81,81	;17
	Viz	19,17,10,70,106,0	;18
	Viz	66,55,53,0,-125,25	;20
	Viz	49,53,55,0,0,127	;21
	Viz	66,63,51,125,0,25	;22
	Viz	50,54,52,0,0,127	;23
	Viz	64,60,48,125,0,25	;24
	Viz	64,52,54,0,-125,25	;25
	Viz	44,46,66,0,126,18	;26
	Viz	65,43,44,89,89,13	;27
	Viz	30,15,44,90,90,0	;28
	Viz	65,61,41,126,0,18	;29
	Viz	61,63,70,0,90,90	;30
	Viz	68,41,61,124,18,18	;31
	Viz	56,41,68,124,21,19	;32
	Viz	58,56,68,0,-46,119	;33
	Viz	56,57,40,0,112,59	;34
	Viz	30,43,41,127,0,0	;35
	Viz	31,30,41,0,118,47	;36
	Viz	42,40,60,-126,0,18	;37
	Viz	45,42,64,-89,89,13	;38
	Viz	57,69,40,-124,21,19	;39
	Viz	60,40,69,-124,18,18	;40
	Viz	64,67,47,0,126,18	;41
	Viz	69,71,62,0,90,90	;42
	Viz	67,25,47,89,89,13	;43
	Viz	71,24,62,124,18,18	;44
	Viz	59,24,71,124,21,19	;45
	Viz	71,69,57,0,-46,119	;46
	Viz	47,25,14,78,78,63	;47
	Viz	24,59,28,118,38,27	;48
	Viz	28,14,25,99,0,79	;49
;	BSPInit	mybase_0_EBSP
;	BSP	3,mybase_0_f1,.bsp2
;	BSP	30,mybase_0_f3,.bsp4
;	BSPE	mybase_0_f5
;.bsp4	BSPE	mybase_0_f6
;.bsp2	BSPE	mybase_0_f7

mybase_0_f1	Faces
	Face4	14,3,126,17,0,5,3,0,1
;	FendQ
;mybase_0_f3	Faces
;	FendQ
;mybase_0_f5	Faces
	Face2	21,-1,0,0,0,26,45
	Face2	21,-1,0,0,0,44,27
	Face4	20,4,0,90,90,18,22,38,34
	Face3	18,5,73,73,73,32,34,38
	Face4	14,6,90,90,0,34,32,27,11
	Face4	16,7,90,0,90,32,38,36,29
	Face4	12,9,127,0,0,27,32,29,8
	Face4	18,8,0,0,127,38,22,20,36
	Face4	14,20,125,0,25,66,63,51,55
	Face4	18,24,0,126,18,44,46,66,65
;	FendQ
;mybase_0_f6	Faces
	Face3	18,1,-89,12,89,6,4,2
	Face3	28,33,127,0,0,30,43,41
	Face4	12,18,0,-125,25,66,55,53,65
	Face4	10,19,0,0,127,49,53,55,51
	Face4	30,26,90,90,0,30,15,44,43
	Face4	18,34,0,118,47,31,30,41,40
	Face4	30,27,126,0,18,65,61,41,43
	Face4	18,28,0,90,90,61,63,70,68
;	FendQ
;mybase_0_f7	Faces
	Face4	18,12,0,0,127,23,39,37,21
	Face4	16,32,0,112,59,56,57,40,41
	Face4	16,13,-90,0,90,28,37,39,33
	Face4	20,10,0,90,90,35,39,23,19
	Face4	20,2,0,17,126,4,6,7,5
	Face3	18,0,89,12,89,3,5,7
	Face3	18,11,-73,73,73,39,35,33


	Face4	16,14,70,0,106,17,23,21,13
	Face4	10,21,0,0,127,50,54,52,48
	Face4	14,22,125,0,25,64,60,48,52
	Face4	12,23,0,-125,25,64,52,54,67
	Face3	34,36,-89,89,13,45,42,64
	Face4	18,39,0,126,18,64,67,47,45
	Face3	30,43,124,21,19,59,24,71
	Face4	30,45,78,78,63,47,25,14,16
	Face3	14,46,118,38,27,24,59,28
	Face4	12,47,99,0,79,28,14,25,24
	Face4	12,15,127,0,0,10,17,13,9
	Face3	18,16,54,81,81,17,19,23
	Face4	14,17,70,106,0,19,17,10,12
	Face3	34,38,-124,18,18,60,40,69
	Face4	18,40,0,90,90,69,71,62,60
	Face3	32,41,89,89,13,67,25,47
	Face3	32,42,124,18,18,71,24,62
	Face3	32,37,-124,21,19,57,69,40
	Face3	32,25,89,89,13,65,43,44
	Face3	32,29,124,18,18,68,41,61
	Face4	32,35,-126,0,18,42,40,60,64
	Face3	30,30,124,21,19,56,41,68
	Face4	14,31,0,-46,119,58,56,68,70
	Face4	102,31,0,-46,119,68,70,58,56
	Face4	14,44,0,-46,119,71,69,57,59
	Face4	102,44,0,-46,119,71,69,57,59
;	FendQ
	fend
mybase_0_EBSP
	EndShape

	endc


;--Shape file ----- C:\SHED\NSHAPES\MYBASE_1.TXT ----
	ifne	DO_HDR

MYBASE_1
	ShapeHdr	MYBASE_1_P,0,MYBASE_1_F,0,0,0,0,mybase_scale,0,43,44,55,83,id_0_c,0,0,0,0,<MYBASE_1>
	elseif
MYBASE_1_P
	Pointsb	4
	pb	-43,-36,-55	;0
	pb	-43,-44,-55	;1
	pb	-33,-36,15	;2
	pb	-33,-44,15	;3

	EndPoints
MYBASE_1_F
	Vizis	1
	Viz	3,2,0,126,0,18	;0

MYBASE_1_f1	Faces
	Face4	30,0,126,0,18,3,2,0,1
	Fend
	EndShape

	endc

;--Shape file ----- C:\SHED\NSHAPES\ship_s_1.txt ----
	ifne	DO_HDR

ship_s_1
	ShapeHdr	ship_s_1_P,0,ship_s_1_F,0,0,0,0,3,0,45,18,5,45,id_0_c,0,0,0,0,<ship_s_1>
	elseif
ship_s_1_P
	Pointsb	10
	pb	2,-12,-5	;0
	pb	5,-6,-5	;1
	pb	-18,18,-5	;2
	pb	-23,13,-5	;3
	pb	-6,-9,-5	;4
	pb	-8,-11,0	;5
	pb	4,11,0	;6
	pb	-12,11,0	;7
	pb	-45,0,0	;8
	pb	-28,-11,0	;9

	EndPoints
ship_s_1_F
	Vizis	2
	Viz	0,1,2,0,0,127	;0
	Viz	5,6,7,0,0,127	;1

ship_s_1_f1	Faces
	Face5	14,0,0,0,127,0,1,2,3,4
	Face5	16,1,0,0,127,5,6,7,8,9
	Fend
	EndShape

	endc

;--Shape file ----- C:\SHED\NSHAPES\ship_4.txt ----
	ifne	DO_HDR

ship_4
	ShapeHdr	ship_4_P,0,ship_4_F,0,0,0,0,1,0,40,40,60,64,id_0_c,0,0,ship_4_s,ship_4_s,<ship_4>
	elseif
ship_4_P
	Pointsb	7
	pb	-30,-10,-40	;0
	pb	-30,10,-40	;1
	pb	-40,20,-20	;2
	pb	10,-30,10	;3
	pb	-10,-40,-45	;4
	pb	10,-20,40	;5
	pb	-10,-35,-30	;6
	PointsXb	1
	pb	-10,30,10	;7
	Pointsb	5
	pb	10,0,60	;9
	pb	-40,20,0	;10
	pb	-10,30,-30	;11
	pb	10,-35,-30	;12
	pb	10,-40,-45	;13
	PointsXb	1
	pb	-10,-30,-30	;14
	Pointsb	20
	pb	-30,-10,20	;16
	pb	-10,-20,40	;17
	pb	-10,0,60	;18
	pb	-10,-30,10	;19
	pb	-40,-20,0	;20
	pb	-40,0,-20	;21
	pb	-40,0,-50	;22
	pb	-40,-20,-20	;23
	pb	-30,10,20	;24
	pb	30,-10,20	;25
	pb	40,-20,0	;26
	pb	40,20,0	;27
	pb	30,10,20	;28
	pb	40,0,-50	;29
	pb	40,0,-20	;30
	pb	30,-10,-40	;31
	pb	40,-20,-20	;32
	pb	30,10,-40	;33
	pb	40,20,-20	;34
	pb	10,30,-30	;35
	PointsXb	1
	pb	-10,-17,43	;36

	EndPoints
ship_4_F
	Vizis	39
	Viz	4,6,14,127,0,0	;0
	Viz	13,12,15,127,0,0	;1
	Viz	16,17,18,92,62,62	;2
	Viz	19,17,16,79,95,32	;3
	Viz	16,24,10,114,0,57	;4
	Viz	16,18,24,114,0,57	;5
	Viz	20,19,16,54,90,72	;6
	Viz	0,21,22,90,90,0	;7
	Viz	23,21,0,114,0,-57	;8
	Viz	0,14,23,54,90,-72	;9
	Viz	23,14,19,40,120,0	;10
	Viz	18,7,24,65,-93,56	;11
	Viz	24,7,10,54,-90,72	;12
	Viz	22,21,1,90,-90,0	;13
	Viz	1,21,2,114,0,-57	;14
	Viz	2,11,1,54,-90,-72	;15
	Viz	10,7,11,40,-120,0	;16
	Viz	37,36,17,0,90,90	;17
	Viz	17,19,3,0,120,40	;18
	Viz	19,14,15,0,127,0	;19
	Viz	9,8,7,0,-109,65	;20
	Viz	10,2,23,127,0,0	;21
	Viz	9,5,25,-92,62,62	;22
	Viz	25,5,3,-79,95,32	;23
	Viz	26,27,28,-114,0,57	;24
	Viz	28,9,25,-114,0,57	;25
	Viz	25,3,26,-54,90,72	;26
	Viz	29,30,31,-90,90,0	;27
	Viz	31,30,32,-114,0,-57	;28
	Viz	32,15,31,-54,90,-72	;29
	Viz	26,3,15,-40,120,0	;30
	Viz	28,8,9,-65,-93,56	;31
	Viz	27,8,28,-54,-90,72	;32
	Viz	33,30,29,-90,-90,0	;33
	Viz	34,30,33,-114,0,-57	;34
	Viz	33,35,34,-54,-90,-72	;35
	Viz	34,35,8,-40,-120,0	;36
	Viz	26,32,34,-127,0,0	;37
	Viz	9,18,36,0,90,90	;38
	BSPInit	ship_4_EBSP
	BSP	0,ship_4_f1,.bsp2
	BSP	1,ship_4_f3,.bsp4
	BSP	28,ship_4_f5,.bsp6
	BSPE	ship_4_f7
.bsp6	BSPE	ship_4_f8
.bsp4	BSPE	ship_4_f9
.bsp2	BSP	8,ship_4_f10,.bsp11
	BSPE	ship_4_f12
.bsp11	BSPE	ship_4_f13

ship_4_f1	Faces
	Face3	0,0,127,0,0,4,6,14
	FendQ
ship_4_f3	Faces
	Face3	0,1,127,0,0,13,12,15
	FendQ
ship_4_f5	Faces
	Face3	21,28,-114,0,-57,31,30,32
	FendQ
ship_4_f7	Faces
	Face3	20,23,-79,95,32,25,5,3
	Face3	18,26,-54,90,72,25,3,26
	Face3	16,31,-65,-93,56,28,8,9
	Face3	14,32,-54,-90,72,27,8,28
	Face3	13,35,-54,-90,-72,33,35,34
	Face3	18,22,-92,62,62,9,5,25
	Face4	21,24,-114,0,57,26,27,28,25
	Face3	23,25,-114,0,57,28,9,25
	Face3	18,29,-54,90,-72,32,15,31
	Face4	20,30,-40,120,0,26,3,15,32
	Face4	12,36,-40,-120,0,34,35,8,27
	Face4	10,37,-127,0,0,26,32,34,27
	FendQ
ship_4_f8	Faces
	Face3	21,34,-114,0,-57,34,30,33
	Face3	14,33,-90,-90,0,33,30,29
	Face3	16,27,-90,90,0,29,30,31
	FendQ
ship_4_f9	Faces
	Face4	44,17,0,90,90,37,36,17,5
	Face4	18,18,0,120,40,17,19,3,5
	Face4	16,19,0,127,0,19,14,15,3
	Face4	14,20,0,-109,65,9,8,7,18
	Face4	16,38,0,90,90,9,18,36,37
	FendQ
ship_4_f10	Faces
	Face3	21,8,114,0,-57,23,21,0
	FendQ
ship_4_f12	Faces
	Face3	20,3,79,95,32,19,17,16
	Face3	18,6,54,90,72,20,19,16
	Face3	16,11,65,-93,56,18,7,24
	Face3	14,12,54,-90,72,24,7,10
	Face3	13,15,54,-90,-72,2,11,1
	Face3	18,2,92,62,62,16,17,18
	Face4	21,4,114,0,57,16,24,10,20
	Face3	23,5,114,0,57,16,18,24
	Face3	18,9,54,90,-72,0,14,23
	Face4	20,10,40,120,0,23,14,19,20
	Face4	12,16,40,-120,0,10,7,11,2
	Face4	10,21,127,0,0,10,2,23,20
	FendQ
ship_4_f13	Faces
	Face3	21,14,114,0,-57,1,21,2
	Face3	14,13,90,-90,0,22,21,1
	Face3	16,7,90,90,0,0,21,22
	FendQ
ship_4_EBSP
	EndShape

	endc



;--Shape file ----- C:\SHED\NSHAPES\ship_4_s.txt ----
	ifne	DO_HDR

ship_4_s
	ShapeHdr	ship_4_s_P,0,ship_4_s_F,0,0,0,0,0,0,40,25,110,110,id_0_c,0,0,0,0,<ship_4_s>
	elseif
ship_4_s_P
	Pointsb	2
	pb	0,10,-30	;0
	pb	0,-10,-30	;1
	PointsXb	5
	pb	-40,25,30	;2
	pb	-40,-25,30	;4
	pb	-40,25,50	;6
	pb	-40,-25,50	;8
	pb	10,0,110	;10

	EndPoints
ship_4_s_F
	Vizis	10
	Viz	1,0,3,-106,0,-70	;0
	Viz	4,2,0,106,0,-70	;1
	Viz	8,4,5,0,127,0	;2
	Viz	10,11,8,0,117,49	;3
	Viz	7,6,11,0,-117,49	;4
	Viz	7,3,2,0,-127,0	;5
	Viz	10,9,7,-114,0,57	;6
	Viz	6,8,11,114,0,57	;7
	Viz	6,2,4,127,0,0	;8
	Viz	9,5,3,-127,0,0	;9

ship_4_s_f1	Faces
	Face4	21,0,-106,0,-70,1,0,3,5
	Face4	21,1,106,0,-70,4,2,0,1
	Face4	20,2,0,127,0,8,4,5,9
	Face4	18,3,0,117,49,10,11,8,9
	Face4	14,4,0,-117,49,7,6,11,10
	Face4	12,5,0,-127,0,7,3,2,6
	Face3	23,6,-114,0,57,10,9,7
	Face3	23,7,114,0,57,6,8,11
	Face4	10,8,127,0,0,6,2,4,8
	Face4	10,9,-127,0,0,9,5,3,7
	Fend
	EndShape

	endc

;--Shape file ----- C:\SHED\NSHAPES\warker_3.anm ----
	ifne	DO_HDR

Bwarker_3
	ShapeHdr	warker_3_P,0,warker_3_F,0,0,0,0,1,0,32,42,25,44,id_0_c,0,0,0,0,<Bwarker_3>
warker_3
	ShapeHdr	warker_3_P,0,warker_3_F,0,0,0,0,0,0,32,42,25,44,id_0_c,0,0,0,0,<warker_3>
	elseif
warker_3_P
	Frames	12
	jumptab	.A0A
	jumptab	.A1A
	jumptab	.A2A
	jumptab	.A3A
	jumptab	.A4A
	jumptab	.A5A
	jumptab	.A6A
	jumptab	.A7A
	jumptab	.A8A
	jumptab	.A9A
	jumptab	.A10A
	jumptab	.A11A
.A0A	Pointsb	9
	pb	-20,0,-2	;0
	pb	25,-28,-12	;1
	pb	-15,-23,-10	;2
	pb	15,-23,-10	;3
	pb	-5,-38,-10	;4
	pb	5,-38,-10	;5
	pb	-25,-28,-12	;6
	pb	0,-29,10	;7
	pb	20,0,-2	;8
	jump	.EB0
.A1A	Pointsb	9
	pb	-21,-9,5	;0
	pb	27,-28,-10	;1
	pb	-13,-27,-10	;2
	pb	17,-24,-10	;3
	pb	-2,-41,-10	;4
	pb	8,-40,-10	;5
	pb	-22,-33,-14	;6
	pb	3,-32,10	;7
	pb	20,0,-10	;8
	jump	.EB0
.A2A	Pointsb	9
	pb	-20,-17,11	;0
	pb	30,-26,-8	;1
	pb	-11,-28,-10	;2
	pb	19,-23,-10	;3
	pb	2,-41,-10	;4
	pb	12,-39,-10	;5
	pb	-19,-33,-15	;6
	pb	5,-31,10	;7
	pb	20,0,-18	;8
	jump	.EB0
.A3A	Pointsb	9
	pb	-18,-21,13	;0
	pb	30,-20,-6	;1
	pb	-9,-26,-10	;2
	pb	20,-19,-10	;3
	pb	4,-38,-10	;4
	pb	14,-36,-10	;5
	pb	-18,-32,-15	;6
	pb	7,-28,10	;7
	pb	20,0,-25	;8
	jump	.EB0
.A4A	Pointsb	9
	pb	-20,-17,11	;0
	pb	30,-26,-8	;1
	pb	-11,-28,-10	;2
	pb	19,-23,-10	;3
	pb	2,-41,-10	;4
	pb	12,-39,-10	;5
	pb	-19,-33,-15	;6
	pb	5,-31,10	;7
	pb	20,0,-18	;8
	jump	.EB0
.A5A	Pointsb	9
	pb	-22,-8,5	;0
	pb	27,-27,-10	;1
	pb	-13,-26,-10	;2
	pb	17,-23,-10	;3
	pb	-2,-40,-10	;4
	pb	8,-39,-10	;5
	pb	-23,-32,-14	;6
	pb	3,-31,10	;7
	pb	20,0,-10	;8
	jump	.EB0
.A6A	Pointsb	9
	pb	-20,0,-2	;0
	pb	25,-28,-12	;1
	pb	-15,-23,-10	;2
	pb	15,-23,-10	;3
	pb	-5,-38,-10	;4
	pb	5,-38,-10	;5
	pb	-25,-28,-12	;6
	pb	0,-29,10	;7
	pb	20,0,-2	;8
	jump	.EB0
.A7A	Pointsb	9
	pb	-20,0,-10	;0
	pb	22,-33,-14	;1
	pb	-17,-24,-10	;2
	pb	13,-27,-10	;3
	pb	-8,-40,-10	;4
	pb	2,-41,-10	;5
	pb	-27,-28,-10	;6
	pb	-3,-32,10	;7
	pb	21,-9,5	;8
	jump	.EB0
.A8A	Pointsb	9
	pb	-20,0,-18	;0
	pb	19,-33,-15	;1
	pb	-19,-23,-10	;2
	pb	11,-28,-10	;3
	pb	-12,-39,-10	;4
	pb	-2,-41,-10	;5
	pb	-30,-26,-8	;6
	pb	-5,-31,10	;7
	pb	20,-17,11	;8
	jump	.EB0
.A9A	Pointsb	9
	pb	-21,-2,-22	;0
	pb	16,-36,-15	;1
	pb	-21,-23,-10	;2
	pb	8,-30,-10	;3
	pb	-15,-40,-10	;4
	pb	-5,-42,-10	;5
	pb	-32,-25,-7	;6
	pb	-8,-32,10	;7
	pb	17,-25,13	;8
	jump	.EB0
.A10A	Pointsb	9
	pb	-20,0,-18	;0
	pb	19,-33,-15	;1
	pb	-19,-23,-10	;2
	pb	11,-28,-10	;3
	pb	-12,-39,-10	;4
	pb	-2,-41,-10	;5
	pb	-30,-26,-8	;6
	pb	-5,-31,10	;7
	pb	20,-17,11	;8
	jump	.EB0
.A11A	Pointsb	9
	pb	-20,0,-10	;0
	pb	23,-32,-14	;1
	pb	-17,-23,-10	;2
	pb	13,-26,-10	;3
	pb	-8,-39,-10	;4
	pb	2,-40,-10	;5
	pb	-27,-27,-10	;6
	pb	-3,-31,10	;7
	pb	21,-8,5	;8
.EB0

	EndPoints
warker_3_F
	Vizis	6
	Viz	3,1,8,25,106,66	;0
	Viz	0,6,2,-10,-42,119	;2
	Viz	5,7,4,23,113,53	;4
	Viz	4,7,2,105,46,55	;5
	Viz	3,7,5,-82,82,53	;6
	Viz	3,2,7,-20,-121,34	;7
	BSPInit	warker_3_EBSP
	BSP	4,warker_3_f1,.bsp2
	BSPE	warker_3_f3
.bsp2	BSPE	warker_3_f4

warker_3_f1	Faces
	Face3	14,4,-82,82,53,3,7,5
	FendQ
warker_3_f3	Faces
	Face3	6,1,-10,-42,119,0,6,2
	Face3	20,3,105,46,55,4,7,2
	Face3	12,5,-20,-121,34,3,2,7
	Face2	25,-1,0,0,0,4,6
	FendQ
warker_3_f4	Faces
	Face3	6,0,25,106,66,3,1,8
	Face2	25,-1,0,0,0,1,5
	Face3	44,2,23,113,53,5,7,4
	FendQ
warker_3_EBSP
	EndShape

	endc

;--Shape file ----- C:\SHED\NSHAPES\bazooka.anm ----
	ifne	DO_HDR

bazooka
	ShapeHdr	bazooka_P,0,bazooka_F,0,0,0,0,2,0,40,25,31,51,id_0_c,0,0,0,0,<bazooka>
	elseif
bazooka_P
	Pointsb	5
	pb	30,-25,-25	;0
	pb	20,-5,-31	;1
	pb	-26,-5,-10	;2
	pb	-20,-5,-31	;3
	pb	40,-5,-31	;4
	Frames	4
	jumptab	.A0A
	jumptab	.A1A
	jumptab	.A2A
	jumptab	.A3A
.A0A	Pointsb	1
	pb	-34,5,29	;5
	jump	.EB0
.A1A	Pointsb	1
	pb	-34,5,29	;5
	jump	.EB0
.A2A	Pointsb	1
	pb	-34,0,9	;5
	jump	.EB0
.A3A	Pointsb	1
	pb	-34,4,24	;5
.EB0
	Pointsb	5
	pb	-30,-25,-25	;6
	pb	-40,-5,-31	;7
	pb	-5,-5,10	;8
	pb	0,-15,-10	;9
	pb	0,5,-10	;10
	Frames	4
	jumptab	.A0B
	jumptab	.A1B
	jumptab	.A2B
	jumptab	.A3B
.A0B	Pointsb	2
	pb	-26,5,29	;11
	pb	-30,-8,11	;12
	jump	.EB1
.A1B	Pointsb	2
	pb	-26,5,29	;11
	pb	-30,-8,11	;12
	jump	.EB1
.A2B	Pointsb	2
	pb	-26,0,9	;11
	pb	-30,-13,-8	;12
	jump	.EB1
.A3B	Pointsb	2
	pb	-26,4,24	;11
	pb	-30,-9,7	;12
.EB1
	Pointsb	3
	pb	-34,-5,-10	;13
	pb	5,-5,10	;14
	pb	26,-5,-10	;15
	Frames	4
	jumptab	.A0C
	jumptab	.A1C
	jumptab	.A2C
	jumptab	.A3C
.A0C	Pointsb	3
	pb	30,-8,11	;16
	pb	26,5,29	;17
	pb	34,5,29	;18
	jump	.EB2
.A1C	Pointsb	3
	pb	30,-13,-8	;16
	pb	26,0,9	;17
	pb	34,0,9	;18
	jump	.EB2
.A2C	Pointsb	3
	pb	30,-9,7	;16
	pb	26,4,24	;17
	pb	34,4,24	;18
	jump	.EB2
.A3C	Pointsb	3
	pb	30,-8,11	;16
	pb	26,5,29	;17
	pb	34,5,29	;18
.EB2
	Pointsb	1
	pb	34,-5,-10	;19
	PointsXb	1
	pb	30,-13,-8	;20

	EndPoints
bazooka_F
	Vizis	23
	Viz	3,6,7,0,36,-122	;127
	Viz	2,3,7,0,-127,0	;128
	Viz	7,6,21,113,47,33	;129
	Viz	2,21,6,-113,48,34	;130
	Viz	21,2,11,-114,54,14	;131
	Viz	12,5,13,114,54,14	;132
	Viz	2,13,5,0,-123,-32	;133
	Viz	12,11,5,0,103,74	;134
	Viz	4,0,1,0,36,-122	;135
	Viz	19,4,1,0,-127,0	;136
	Viz	19,20,0,-113,48,34	;137
	Viz	1,0,20,113,47,33	;138
	Viz	17,18,19,0,-123,-32	;139
	Viz	16,17,15,114,54,14	;140
	Viz	20,19,18,-114,54,14	;141
	Viz	18,17,16,0,103,74	;142
	Viz	10,15,9,0,0,-127	;143
	Viz	8,14,10,0,-114,57	;144
	Viz	8,9,14,0,114,57	;145
	Viz	10,14,15,-43,-111,45	;146
	Viz	15,14,9,-43,111,45	;147
	Viz	2,8,10,43,-111,45	;148
	Viz	9,8,2,43,111,45	;149
	BSPInit	bazooka_EBSP
	BSP	16,bazooka_f1,.bsp2
	BSP	20,bazooka_f3,.bsp4
	BSP	22,bazooka_f5,.bsp6
	BSPE	bazooka_f7
.bsp6	BSPE	bazooka_f8
.bsp4	BSPE	bazooka_f9
.bsp2	BSPE	bazooka_f10

bazooka_f1	Faces
	Face4	12,16,0,0,-127,10,15,9,2
	FendQ
bazooka_f3	Faces
	Face3	18,20,-43,111,45,15,14,9
	FendQ
bazooka_f5	Faces
	Face3	14,22,43,111,45,9,8,2
	FendQ
bazooka_f7	Faces
	Face3	21,17,0,-114,57,8,14,10
	Face3	25,19,-43,-111,45,10,14,15
	Face3	23,21,43,-111,45,2,8,10
	FendQ
bazooka_f8	Faces
	Face4	18,4,-114,54,14,21,2,11,12
	Face4	16,5,114,54,14,12,5,13,21
	Face4	12,6,0,-123,-32,2,13,5,11
	Face3	43,7,0,103,74,12,11,5
	FendQ
bazooka_f9	Faces
	Face4	18,13,114,54,14,16,17,15,20
	Face3	44,18,0,114,57,8,9,14
	Face4	12,12,0,-123,-32,17,18,19,15
	Face4	20,14,-114,54,14,20,19,18,16
	Face3	43,15,0,103,74,18,17,16
	FendQ
bazooka_f10	Faces
	Face4	25,3,-113,48,34,2,21,6,3
	Face4	25,11,113,47,33,1,0,20,15
	Face3	0,0,0,36,-122,3,6,7
	Face4	21,1,0,-127,0,2,3,7,13
	Face4	23,2,113,47,33,7,6,21,13
	Face3	0,8,0,36,-122,4,0,1
	Face4	21,9,0,-127,0,19,4,1,15
	Face4	27,10,-113,48,34,19,20,0,4
	FendQ
bazooka_EBSP
	EndShape

	endc


;--Shape file ----- C:\SHED\NSHAPES\BAZOOKA1.TXT ----
	ifne	DO_HDR

BAZOOKA1
	ShapeHdr	BAZOOKA1_P,0,BAZOOKA1_F,0,0,0,0,2,0,10,25,31,35,id_0_c,0,0,0,0,<BAZOOKA1>
	elseif
BAZOOKA1_P
	Pointsb	3
	pb	0,-25,-25	;0
	pb	0,-13,-8	;1
	pb	0,-8,11	;2
	PointsXb	3
	pb	10,-5,-31	;3
	pb	4,-5,-10	;5
	pb	-4,5,29	;7

	EndPoints
BAZOOKA1_F
	Vizis	8
	Viz	3,0,4,0,36,-122	;0
	Viz	5,3,4,0,-127,0	;1
	Viz	4,0,1,113,47,33	;2
	Viz	5,1,0,-113,48,34	;3
	Viz	1,5,8,-114,54,14	;4
	Viz	2,7,6,114,54,14	;5
	Viz	5,6,7,0,-123,-32	;6
	Viz	2,8,7,0,103,74	;7

BAZOOKA1_f1	Faces
	Face4	21,1,0,-127,0,5,3,4,6
	Face4	23,2,113,47,33,4,0,1,6
	Face4	25,3,-113,48,34,5,1,0,3
	Face4	18,4,-114,54,14,1,5,8,2
	Face4	16,5,114,54,14,2,7,6,1
	Face4	12,6,0,-123,-32,5,6,7,8
	Face3	0,0,0,36,-122,3,0,4
	Face3	43,7,0,103,74,2,8,7
	Fend
	EndShape

	endc

;--Shape file ----- C:\SHED\NSHAPES\bazooka2.txt ----
	ifne	DO_HDR

bazooka2
	ShapeHdr	bazooka2_P,0,bazooka2_F,0,0,0,0,2,0,26,15,10,28,id_0_c,0,0,0,0,<bazooka2>
	elseif
bazooka2_P
	Pointsb	2
	pb	0,5,-10	;0
	pb	0,-15,-10	;1
	PointsXb	2
	pb	-26,-5,-10	;2
	pb	-5,-5,10	;4

	EndPoints
bazooka2_F
	Vizis	7
	Viz	1,4,2,43,111,45	;143
	Viz	2,4,0,43,-111,45	;144
	Viz	3,5,1,-43,111,45	;145
	Viz	0,5,3,-43,-111,45	;146
	Viz	4,1,5,0,114,57	;147
	Viz	4,5,0,0,-114,57	;148
	Viz	0,3,1,0,0,-127	;149

bazooka2_f1	Faces
	Face3	14,0,43,111,45,1,4,2
	Face3	23,1,43,-111,45,2,4,0
	Face3	18,2,-43,111,45,3,5,1
	Face3	25,3,-43,-111,45,0,5,3
	Face3	44,4,0,114,57,4,1,5
	Face3	21,5,0,-114,57,4,5,0
	Face4	12,6,0,0,-127,0,3,1,2
	Fend
	EndShape

	endc

;--Shape file ----- C:\SHED\NSHAPES\uper_m.txt ----
	ifne	DO_HDR

uper_m
	ShapeHdr	uper_m_P,0,uper_m_F,0,0,0,0,1,0,26,32,45,46,id_0_c,0,0,0,0,<uper_m>
	elseif
uper_m_P
	Pointsb	7
	pb	0,-7,-45	;0
	pb	0,-12,-25	;1
	pb	0,-7,-15	;2
	pb	0,-32,-5	;3
	pb	0,-7,10	;4
	pb	0,-17,30	;5
	pb	0,-7,45	;6
	PointsXb	7
	pb	5,3,-45	;7
	pb	-10,8,-25	;9
	pb	-5,3,-15	;11
	pb	-26,21,-5	;13
	pb	5,3,10	;15
	pb	15,13,30	;17
	pb	5,3,45	;19

	EndPoints
uper_m_F
	Vizis	23
	Viz	5,4,15,-111,55,-28	;0
	Viz	18,16,4,111,55,-28	;1
	Viz	17,19,6,-109,54,36	;2
	Viz	5,6,20,109,54,36	;3
	Viz	18,20,19,0,-106,70	;4
	Viz	17,15,16,0,-114,-57	;5
	Viz	4,16,11,114,57,0	;6
	Viz	2,12,15,-114,57,0	;7
	Viz	12,11,16,0,-127,0	;8
	Viz	10,12,2,-111,55,28	;9
	Viz	1,2,11,111,55,28	;10
	Viz	1,0,7,-113,56,-14	;11
	Viz	9,8,0,113,56,-14	;12
	Viz	10,7,8,0,-123,-31	;13
	Viz	9,11,12,0,-114,57	;14
	Viz	8,7,0,0,0,-127	;15
	Viz	6,19,20,0,0,127	;16
	Viz	15,17,14,85,-95,-5	;17
	Viz	14,17,15,-85,95,5	;18
	Viz	4,5,3,-127,0,0	;19
	Viz	3,5,4,127,0,0	;20
	Viz	13,18,16,-85,-95,-5	;21
	Viz	16,18,13,85,95,5	;22

uper_m_f1	Faces
	Face4	16,0,-111,55,-28,5,4,15,17
	Face4	14,1,111,55,-28,18,16,4,5
	Face4	12,5,0,-114,-57,17,15,16,18
	Face4	16,6,114,57,0,4,16,11,2
	Face4	18,7,-114,57,0,2,12,15,4
	Face4	14,8,0,-127,0,12,11,16,15
	Face4	25,9,-111,55,28,10,12,2,1
	Face4	23,10,111,55,28,1,2,11,9
	Face4	16,11,-113,56,-14,1,0,7,10
	Face4	14,12,113,56,-14,9,8,0,1
	Face4	12,13,0,-123,-31,10,7,8,9
	Face4	21,14,0,-114,57,9,11,12,10
	Face3	6,17,85,-95,-5,15,17,14
	Face3	6,18,-85,95,5,14,17,15
	Face3	6,19,-127,0,0,4,5,3
	Face3	6,20,127,0,0,3,5,4
	Face3	6,21,-85,-95,-5,13,18,16
	Face3	6,22,85,95,5,16,18,13
	Face2	23,-1,0,0,0,10,14
	Face2	23,-1,0,0,0,13,9
	Face2	23,-1,0,0,0,3,1
	Face4	20,2,-109,54,36,17,19,6,5
	Face4	18,3,109,54,36,5,6,20,18
	Face4	16,4,0,-106,70,18,20,19,17
	Face3	43,15,0,0,-127,8,7,0
	Face3	43,16,0,0,127,6,19,20
	Fend
	EndShape

	endc
;--Shape file ----- C:\SHED\NSHAPES\warp.txt ----
	ifne	DO_HDR

warp
	ShapeHdr	warp_P,0,warp_F,0,0,0,0,1,0,30,17,45,54,id_0_c,0,0,0,0,<warp>
	elseif
warp_P
	Pointsb	15
	pb	10,0,0	;0
	pb	0,0,40	;1
	pb	-10,0,0	;2
	pb	-25,15,-45	;3
	pb	30,10,-10	;4
	pb	-20,15,45	;5
	pb	15,10,-40	;6
	pb	20,15,45	;7
	pb	0,0,-40	;8
	pb	0,-17,5	;9
	pb	0,0,30	;10
	pb	0,10,10	;11
	pb	-15,10,-40	;12
	pb	-30,10,-10	;13
	pb	25,15,-45	;14

	EndPoints
warp_F
	Vizis	16
	Viz	9,10,2,109,54,36	;0
	Viz	0,10,9,-109,54,36	;1
	Viz	2,10,11,102,-68,34	;2
	Viz	11,10,0,-102,-68,34	;3
	Viz	2,8,9,104,69,-26	;4
	Viz	9,8,0,-104,69,-26	;5
	Viz	11,0,2,0,-90,-90	;6
	Viz	2,0,8,0,-127,0	;7
	Viz	3,12,2,46,116,-23	;8
	Viz	13,2,12,-46,-116,23	;9
	Viz	5,13,2,64,107,21	;10
	Viz	2,13,5,-64,-107,-21	;11
	Viz	4,0,6,-46,116,-23	;12
	Viz	14,6,0,46,-116,23	;13
	Viz	0,4,7,-64,107,21	;14
	Viz	7,4,0,64,-107,-21	;15
	BSPInit	warp_EBSP
	BSP	2,warp_f1,.bsp2
	BSP	3,warp_f3,.bsp4
	BSPE	warp_f5
.bsp4	BSPE	warp_f6
.bsp2	BSPE	warp_f7

warp_f1	Faces
	Face3	0,2,102,-68,34,2,10,11
	FendQ
warp_f3	Faces
	Face3	0,3,-102,-68,34,11,10,0
	FendQ
warp_f5	Faces
	Face3	43,6,0,-90,-90,11,0,2
	Face3	0,0,109,54,36,9,10,2
	Face3	0,1,-109,54,36,0,10,9
	Face3	44,7,0,-127,0,2,0,8
	Face3	7,4,104,69,-26,2,8,9
	Face3	7,5,-104,69,-26,9,8,0
	FendQ
warp_f6	Faces
	Face4	0,13,46,-116,23,14,6,0,4
	Face3	3,15,64,-107,-21,7,4,0
	Face4	0,12,-46,116,-23,4,0,6,14
	Face3	3,14,-64,107,21,0,4,7
	FendQ
warp_f7	Faces
	Face4	0,9,-46,-116,23,13,2,12,3
	Face3	3,11,-64,-107,-21,2,13,5
	Face2	16,-1,0,0,0,10,1
	Face4	0,8,46,116,-23,3,12,2,13
	Face3	3,10,64,107,21,5,13,2
	FendQ
warp_EBSP
	EndShape

	endc
;--Shape file ----- C:\SHED\NSHAPES\warp_1.txt ----
	ifne	DO_HDR

warp_1
	ShapeHdr	warp_1_P,0,warp_1_F,0,0,0,0,1,0,30,17,45,54,id_0_c,0,0,0,0,<warp_1>
	elseif
warp_1_P
	Pointsb	5
	pb	0,0,-40	;0
	pb	0,-17,5	;1
	pb	0,10,10	;2
	pb	0,0,30	;3
	pb	0,0,40	;4
	PointsXb	5
	pb	-25,15,-45	;5
	pb	15,10,-40	;7
	pb	30,10,-10	;9
	pb	10,0,0	;11
	pb	-20,15,45	;13

	EndPoints
warp_1_F
	Vizis	1
	Viz	1,12,11,0,36,-122	;25

warp_1_f1	Faces
;	Face3	15,0,0,36,-122,1,12,11
	Face2	44,-1,109,54,36,11,3
	Face2	44,-1,-109,54,36,1,3
	Face2	44,-1,102,-68,34,3,12
	Face2	44,-1,-102,-68,34,3,2
	Face2	44,-1,0,-90,-90,12,2
	Face2	44,-1,-46,-116,23,12,13
	Face2	44,-1,64,107,21,13,10
	Face2	44,-1,46,-116,23,14,11
	Face2	44,-1,-64,107,21,9,14
	Face2	44,-1,0,0,0,3,4
	Face2	44,-1,0,0,0,2,11
	Face2	44,-1,104,69,-26,12,1
	Face2	44,-1,-104,69,-26,1,11
	Face2	44,-1,0,-127,0,11,0
	Face2	44,-1,46,116,-23,12,10
	Face2	44,-1,-64,-107,-21,12,8
	Face2	44,-1,-46,116,-23,9,11
	Face2	44,-1,64,-107,-21,7,11
	Face2	44,-1,0,0,0,11,12
	Face2	44,-1,0,0,0,0,12
	Face2	44,-1,0,0,0,0,1
	Face2	44,-1,0,0,0,5,10
	Face2	44,-1,0,0,0,5,8
	Face2	44,-1,0,0,0,9,6
	Face2	44,-1,0,0,0,7,6
	Fend
	EndShape

	endc
;--Shape file ----- C:\SHED\NSHAPES\warp_2.txt ----
	ifne	DO_HDR

warp_2
	ShapeHdr	warp_2_P,0,warp_2_F,0,0,0,0,1,0,30,17,45,54,id_0_c,0,0,0,0,<warp_2>
	elseif
warp_2_P
	Pointsb	5
	pb	10,0,0	;0
	pb	0,0,40	;1
	pb	-10,0,0	;2
	pb	-25,15,-45	;3
	pb	30,10,-10	;4
	PointsXb	1
	pb	-20,15,45	;5
	Pointsb	8
	pb	15,10,-40	;7
	pb	0,0,-40	;8
	pb	0,-17,5	;9
	pb	0,0,30	;10
	pb	0,10,10	;11
	pb	-15,10,-40	;12
	pb	-30,10,-10	;13
	pb	25,15,-45	;14

	EndPoints
warp_2_F
	Vizis	1
	Viz	0,11,2,0,90,90	;19

warp_2_f1	Faces
;	Face3	15,0,0,90,90,0,11,2
	Face2	44,-1,104,69,-26,0,8
	Face2	44,-1,0,-90,-90,5,13
	Face2	44,-1,0,-127,0,2,12
	Face2	44,-1,-46,-116,23,4,6
	Face2	44,-1,64,107,21,7,0
	Face2	44,-1,46,-116,23,8,2
	Face2	44,-1,-64,107,21,8,9
	Face2	44,-1,64,-107,-21,3,13
	Face2	44,-1,0,0,0,3,12
	Face2	44,-1,0,0,0,4,14
	Face2	44,-1,0,0,0,7,14
	Face2	44,-1,109,54,36,0,10
	Face2	44,-1,-109,54,36,9,10
	Face2	44,-1,102,-68,34,10,2
	Face2	44,-1,-102,-68,34,2,11
	Face2	44,-1,-104,69,-26,2,5
	Face2	44,-1,46,116,-23,6,0
	Face2	44,-1,-64,-107,-21,10,1
	Face2	44,-1,-46,116,-23,11,0
	Fend
	EndShape

	endc
;--Shape file ----- C:\SHED\NSHAPES\warp_3.txt ----
	ifne	DO_HDR

warp_3
	ShapeHdr	warp_3_P,0,warp_3_F,0,0,0,0,1,0,30,17,45,54,id_0_c,0,0,0,0,<warp_3>
	elseif
warp_3_P
	Pointsb	4
	pb	0,0,-40	;0
	pb	0,-17,5	;1
	pb	0,10,10	;2
	pb	0,0,30	;3
	PointsXb	4
	pb	-25,15,-45	;4
	pb	30,10,-10	;6
	pb	10,0,0	;8
	pb	-20,15,45	;10

	EndPoints
warp_3_F
	Vizis	1
	Viz	8,2,9,0,90,90	;9

warp_3_f1	Faces
;	Face3	15,0,0,90,90,8,2,9
	Face2	44,-1,102,-68,34,10,7
	Face2	44,-1,-102,-68,34,6,11
	Face2	44,-1,-104,69,-26,0,9
	Face2	44,-1,0,-90,-90,0,1
	Face2	44,-1,0,-127,0,4,7
	Face2	44,-1,46,116,-23,6,5
	Face2	44,-1,109,54,36,8,3
	Face2	44,-1,-109,54,36,1,3
	Face2	44,-1,104,69,-26,2,8
	Fend
	EndShape

	endc

;--Shape file ----- C:\SHED\NSHAPES\tank_2.txt ----
	ifne	DO_HDR

tank_2
	ShapeHdr	tank_2_P,0,tank_2_F,0,0,0,0,1,0,65,50,75,90,id_0_c,0,0,0,0,<tank_2>
	elseif
tank_2_P
	PointsXb	19
	pb	-30,-35,-75	;0
	pb	26,-45,-73	;2
	pb	26,-40,-68	;4
	pb	-10,-35,-65	;6
	pb	10,-45,-65	;8
	pb	10,-50,-65	;10
	pb	-65,0,-60	;12
	pb	-60,-10,-60	;14
	pb	10,-20,-60	;16
	pb	50,-20,-60	;18
	pb	-10,-40,-60	;20
	pb	-10,-20,-40	;22
	pb	10,0,0	;24
	pb	-65,0,20	;26
	pb	-60,-10,20	;28
	pb	10,-20,20	;30
	pb	50,-20,20	;32
	pb	10,0,60	;34
	pb	30,0,60	;36

	EndPoints
tank_2_F
	Vizis	24
	Viz	35,37,33,0,114,57	;0
	Viz	33,37,28,73,73,73	;1
	Viz	28,37,26,89,45,78	;2
	Viz	31,33,19,0,127,0	;3
	Viz	19,33,28,90,90,0	;4
	Viz	28,26,12,114,57,0	;5
	Viz	30,32,36,0,114,57	;6
	Viz	29,36,32,-73,73,73	;7
	Viz	27,36,29,-89,45,78	;8
	Viz	16,18,32,0,127,0	;9
	Viz	15,29,32,-90,90,0	;10
	Viz	15,13,27,-114,57,0	;11
	Viz	22,23,24,0,114,57	;12
	Viz	20,5,3,42,85,85	;13
	Viz	6,0,5,42,-85,85	;14
	Viz	0,3,5,115,38,38	;15
	Viz	8,2,4,-42,85,85	;16
	Viz	21,4,1,-42,-85,85	;17
	Viz	4,2,1,-115,38,38	;18
	Viz	20,22,17,127,0,0	;19
	Viz	22,9,8,0,90,90	;20
	Viz	7,16,23,-127,0,0	;21
	Viz	35,31,22,-127,0,0	;22
	Viz	24,23,30,127,0,0	;23
	BSPInit	tank_2_EBSP
	BSP	3,tank_2_f1,.bsp2
	BSPE	tank_2_f3
.bsp2	BSP	19,tank_2_f4,.bsp5
	BSPE	tank_2_f6
.bsp5	BSPE	tank_2_f7

tank_2_f1	Faces
	Face4	18,3,0,127,0,31,33,19,17
	FendQ
tank_2_f3	Faces
	Face4	16,22,-127,0,0,35,31,22,25
	Face4	12,23,127,0,0,24,23,30,34
	Face4	25,12,0,114,57,22,23,24,25
	Face4	20,0,0,114,57,35,37,33,31
	Face3	25,1,73,73,73,33,37,28
	Face3	23,2,89,45,78,28,37,26
	Face4	23,4,90,90,0,19,33,28,14
	Face4	21,5,114,57,0,28,26,12,14
	Face4	20,6,0,114,57,30,32,36,34
	Face3	27,7,-73,73,73,29,36,32
	Face3	25,8,-89,45,78,27,36,29
	Face4	25,10,-90,90,0,15,29,32,18
	Face4	23,11,-114,57,0,15,13,27,29
	FendQ
tank_2_f4	Faces
	Face4	21,19,127,0,0,20,22,17,6
	FendQ
tank_2_f6	Faces
	Face4	18,9,0,127,0,16,18,32,30
	Face4	25,21,-127,0,0,7,16,23,21
	Face4	20,16,-42,85,85,8,2,4,21
	Face4	16,17,-42,-85,85,21,4,1,7
	Face3	43,18,-115,38,38,4,2,1
	Face4	27,20,0,90,90,22,9,8,23
	Face2	44,-1,0,0,0,8,10
	FendQ
tank_2_f7	Faces
	Face2	44,-1,0,0,0,11,9
	Face4	18,13,42,85,85,20,5,3,9
	Face4	14,14,42,-85,85,6,0,5,20
	Face3	43,15,115,38,38,0,3,5
	FendQ
tank_2_EBSP
	EndShape

	endc

;--Shape file ----- C:\SHED\NSHAPES\f_dragon.anm ----
	ifne	DO_HDR

f_dragon
	ShapeHdr	f_dragon_P,0,f_dragon_F,0,0,0,0,2,playerB_col,68,25,54,85,id_0_c,0,0,0,0,<f_dragon>
	elseif
f_dragon_P
	Pointsb	4
	pb	0,10,-40	;0
	pb	0,2,-30	;1
	pb	0,0,10	;2
	pb	0,-10,20	;3
	PointsXb	5
	pb	-5,7,-29	;4
	pb	-13,3,32	;6
	pb	-5,0,35	;8
	pb	-10,-3,35	;10
	pb	-7,3,38	;12
	Frames	8
	jumptab	.A0A
	jumptab	.A1A
	jumptab	.A2A
	jumptab	.A3A
	jumptab	.A4A
	jumptab	.A5A
	jumptab	.A6A
	jumptab	.A7A
.A0A	Pointsb	4
	pb	-33,18,3	;14
	pb	33,18,3	;15
	pb	-35,-39,27	;16
	pb	35,-39,27	;17
	PointsXb	4
	pb	-52,34,10	;18
	pb	-52,34,20	;20
	pb	-49,-51,45	;22
	pb	-45,-48,54	;24
	jump	.EB0
.A1A	Pointsb	4
	pb	-40,5,3	;14
	pb	40,5,3	;15
	pb	-43,-25,27	;16
	pb	43,-25,27	;17
	PointsXb	4
	pb	-64,14,10	;18
	pb	-64,14,20	;20
	pb	-60,-32,45	;22
	pb	-55,-30,54	;24
	jump	.EB0
.A2A	Pointsb	4
	pb	-43,-10,3	;14
	pb	43,-10,3	;15
	pb	-45,-10,27	;16
	pb	45,-10,27	;17
	PointsXb	4
	pb	-68,-10,10	;18
	pb	-68,-10,20	;20
	pb	-64,-10,45	;22
	pb	-59,-10,54	;24
	jump	.EB0
.A3A	Pointsb	4
	pb	-41,-24,3	;14
	pb	41,-25,3	;15
	pb	-42,6,27	;16
	pb	43,6,27	;17
	PointsXb	4
	pb	-64,-33,10	;18
	pb	-64,-33,20	;20
	pb	-60,12,45	;22
	pb	-55,10,54	;24
	jump	.EB0
.A4A	Pointsb	4
	pb	-33,-38,3	;14
	pb	33,-38,3	;15
	pb	-35,19,27	;16
	pb	35,19,27	;17
	PointsXb	4
	pb	-52,-54,10	;18
	pb	-52,-54,20	;20
	pb	-49,31,45	;22
	pb	-45,28,54	;24
	jump	.EB0
.A5A	Pointsb	4
	pb	-41,-24,3	;14
	pb	41,-25,3	;15
	pb	-42,6,27	;16
	pb	43,6,27	;17
	PointsXb	4
	pb	-64,-33,10	;18
	pb	-64,-33,20	;20
	pb	-60,12,45	;22
	pb	-55,10,54	;24
	jump	.EB0
.A6A	Pointsb	4
	pb	-43,-10,3	;14
	pb	43,-10,3	;15
	pb	-45,-10,27	;16
	pb	45,-10,27	;17
	PointsXb	4
	pb	-68,-10,10	;18
	pb	-68,-10,20	;20
	pb	-64,-10,45	;22
	pb	-59,-10,54	;24
	jump	.EB0
.A7A	Pointsb	4
	pb	-40,5,3	;14
	pb	40,5,3	;15
	pb	-43,-25,27	;16
	pb	43,-25,27	;17
	PointsXb	4
	pb	-64,14,10	;18
	pb	-64,14,20	;20
	pb	-60,-32,45	;22
	pb	-55,-30,54	;24
.EB0

	EndPoints
f_dragon_F
	Vizis	34
	Viz	19,15,21,82,-97,0	;0
	Viz	21,15,19,-82,97,0	;1
	Viz	15,21,3,-82,97,-0	;2
	Viz	3,21,15,82,-97,0	;3
	Viz	23,17,25,-80,-98,3	;4
	Viz	25,17,23,80,98,-3	;5
	Viz	17,25,3,81,98,-3	;6
	Viz	3,25,17,-81,-98,3	;7
	Viz	20,14,18,-82,-97,0	;8
	Viz	18,14,20,82,97,0	;9
	Viz	3,20,14,82,97,-0	;10
	Viz	14,20,3,-82,-97,0	;11
	Viz	24,16,22,80,-98,3	;12
	Viz	22,16,24,-80,98,-3	;13
	Viz	3,24,16,-81,98,-3	;14
	Viz	16,24,3,81,-98,3	;15
	Viz	7,13,11,-90,0,90	;16
	Viz	9,13,7,58,-97,-58	;17
	Viz	7,11,9,27,45,-116	;18
	Viz	11,13,9,42,70,98	;19
	Viz	10,12,6,90,0,90	;20
	Viz	6,12,8,-58,-97,-58	;21
	Viz	8,10,6,-27,45,-116	;22
	Viz	8,12,10,-42,70,98	;23
	Viz	0,4,5,0,-123,33	;24
	Viz	0,5,1,-85,74,-59	;25
	Viz	1,4,0,85,74,-59	;26
	Viz	5,4,2,0,-125,22	;27
	Viz	1,5,2,-90,89,-4	;28
	Viz	2,4,1,90,89,-4	;29
	Viz	8,9,2,0,-127,0	;30
	Viz	2,9,3,-122,24,-24	;31
	Viz	3,8,2,122,24,-24	;32
	Viz	3,9,8,0,106,70	;33
	BSPInit	f_dragon_EBSP
	BSP	0,f_dragon_f1,.bsp2
	BSPE	f_dragon_f3
.bsp2	BSP	8,f_dragon_f4,.bsp5
	BSPE	f_dragon_f6
.bsp5	BSP	19,f_dragon_f7,.bsp8
	BSP	31,f_dragon_f9,.bsp10
	BSPE	f_dragon_f11
.bsp10	BSP	32,f_dragon_f12,.bsp13
	BSPE	f_dragon_f14
.bsp13	BSPE	f_dragon_f15
.bsp8	BSP	18,f_dragon_f16,.bsp17
	BSPEND
.bsp17	BSPE	f_dragon_f18

f_dragon_f1	Faces
	Face3	6,0,82,-97,0,19,15,21
	FendQ
f_dragon_f3	Faces
	Face3	6,4,-80,-98,3,23,17,25
	Face3	6,5,80,98,-3,25,17,23
	Face3	0,6,81,98,-3,17,25,3
	Face3	0,7,-81,-98,3,3,25,17
	FendQ
f_dragon_f4	Faces
	Face3	6,8,-82,-97,0,20,14,18
	FendQ
f_dragon_f6	Faces
	Face3	6,12,80,-98,3,24,16,22
	Face3	6,13,-80,98,-3,22,16,24
	Face3	0,14,-81,98,-3,3,24,16
	Face3	0,15,81,-98,3,16,24,3
	FendQ
f_dragon_f7	Faces
	Face3	14,19,42,70,98,11,13,9
	FendQ
f_dragon_f9	Faces
	Face3	27,31,-122,24,-24,2,9,3
	FendQ
f_dragon_f11	Faces
	Face3	6,9,82,97,0,18,14,20
	Face3	0,10,82,97,-0,3,20,14
	Face3	0,11,-82,-97,0,14,20,3
	FendQ
f_dragon_f12	Faces
	Face3	23,32,122,24,-24,3,8,2
	FendQ
f_dragon_f14	Faces
	Face3	6,1,-82,97,0,21,15,19
	Face3	0,2,-82,97,-0,15,21,3
	Face3	0,3,82,-97,0,3,21,15
	FendQ
f_dragon_f15	Faces
	Face3	21,30,0,-127,0,8,9,2
	Face3	0,24,0,-123,33,0,4,5
	Face3	21,27,0,-125,22,5,4,2
	Face3	0,25,-85,74,-59,0,5,1
	Face3	0,26,85,74,-59,1,4,0
	Face3	25,28,-90,89,-4,1,5,2
	Face3	23,29,90,89,-4,2,4,1
	FendQ
f_dragon_f16	Faces
	Face3	18,18,27,45,-116,7,11,9
	FendQ
f_dragon_f18	Faces
	Face3	12,17,58,-97,-58,9,13,7
	Face3	14,21,-58,-97,-58,6,12,8
	Face3	16,22,-27,45,-116,8,10,6
	Face3	18,23,-42,70,98,8,12,10
	Face3	44,16,-90,0,90,7,13,11
	Face3	44,20,90,0,90,10,12,6
	Face3	25,33,0,106,70,3,9,8
	FendQ
f_dragon_EBSP
	EndShape

	endc



;--Shape file ----- C:\SHED\NSHAPES\f_dra_1.anm ----
	ifne	DO_HDR

f_dra_1
	ShapeHdr	f_dra_1_P,0,f_dra_1_F,0,0,0,0,0,0,36,23,35,46,id_0_c,0,0,0,0,<f_dra_1>
	elseif
f_dra_1_P
	Pointsb	1
	pb	0,0,15	;0
	PointsXb	1
	pb	3,5,20	;1
	Frames	8
	jumptab	.A0A
	jumptab	.A1A
	jumptab	.A2A
	jumptab	.A3A
	jumptab	.A4A
	jumptab	.A5A
	jumptab	.A6A
	jumptab	.A7A
.A0A	Pointsb	3
	pb	0,10,-35	;3
	pb	24,0,7	;4
	pb	-24,0,7	;5
	PointsXb	6
	pb	-33,0,11	;6
	pb	-36,0,15	;8
	pb	-25,0,20	;10
	pb	-6,8,25	;12
	pb	-30,0,30	;14
	pb	-30,0,35	;16
	jump	.EB0
.A1A	Pointsb	3
	pb	0,11,-35	;3
	pb	22,8,7	;4
	pb	-23,8,7	;5
	PointsXb	6
	pb	-31,11,11	;6
	pb	-34,12,15	;8
	pb	-23,-8,20	;10
	pb	-6,9,25	;12
	pb	-28,-10,30	;14
	pb	-28,-10,35	;16
	jump	.EB0
.A2A	Pointsb	3
	pb	0,12,-35	;3
	pb	18,15,7	;4
	pb	-18,15,7	;5
	PointsXb	6
	pb	-25,21,11	;6
	pb	-28,23,15	;8
	pb	-19,-16,20	;10
	pb	-6,8,25	;12
	pb	-23,-19,30	;14
	pb	-23,-19,35	;16
	jump	.EB0
.A3A	Pointsb	3
	pb	0,11,-35	;3
	pb	22,8,7	;4
	pb	-23,8,7	;5
	PointsXb	6
	pb	-31,11,11	;6
	pb	-34,12,15	;8
	pb	-23,-8,20	;10
	pb	-6,7,25	;12
	pb	-28,-10,30	;14
	pb	-28,-10,35	;16
	jump	.EB0
.A4A	Pointsb	3
	pb	0,10,-35	;3
	pb	24,0,7	;4
	pb	-24,0,7	;5
	PointsXb	6
	pb	-33,0,11	;6
	pb	-36,0,15	;8
	pb	-25,0,20	;10
	pb	-6,8,25	;12
	pb	-30,0,30	;14
	pb	-30,0,35	;16
	jump	.EB0
.A5A	Pointsb	3
	pb	0,9,-35	;3
	pb	22,-8,7	;4
	pb	-23,-8,7	;5
	PointsXb	6
	pb	-31,-11,11	;6
	pb	-34,-12,15	;8
	pb	-23,8,20	;10
	pb	-6,9,25	;12
	pb	-28,10,30	;14
	pb	-28,10,35	;16
	jump	.EB0
.A6A	Pointsb	3
	pb	0,8,-35	;3
	pb	18,-15,7	;4
	pb	-18,-15,7	;5
	PointsXb	6
	pb	-25,-21,11	;6
	pb	-28,-23,15	;8
	pb	-19,16,20	;10
	pb	-6,8,25	;12
	pb	-23,19,30	;14
	pb	-23,19,35	;16
	jump	.EB0
.A7A	Pointsb	3
	pb	0,9,-35	;3
	pb	22,-8,7	;4
	pb	-23,-8,7	;5
	PointsXb	6
	pb	-31,-11,11	;6
	pb	-34,-12,15	;8
	pb	-23,8,20	;10
	pb	-6,7,25	;12
	pb	-28,10,30	;14
	pb	-28,10,35	;16
.EB0

	EndPoints
f_dra_1_F
	Vizis	12
	Viz	3,1,0,-113,57,-10	;2
	Viz	0,2,3,113,57,-10	;3
	Viz	2,1,3,0,-127,9	;4
	Viz	0,1,2,0,90,90	;5
	Viz	11,15,17,-47,118,0	;6
	Viz	0,17,15,43,-120,0	;7
	Viz	4,7,9,40,120,0	;8
	Viz	0,9,7,-42,-120,-2	;9
	Viz	0,16,14,43,120,0	;10
	Viz	10,14,16,-47,-118,0	;11
	Viz	0,8,6,-42,120,2	;12
	Viz	5,6,8,47,-118,-6	;13
	BSPInit	f_dra_1_EBSP
	BSP	0,f_dra_1_f1,.bsp2
	BSP	8,f_dra_1_f3,.bsp4
	BSPE	f_dra_1_f5
.bsp4	BSPE	f_dra_1_f6
.bsp2	BSP	4,f_dra_1_f7,.bsp8
	BSPE	f_dra_1_f9
.bsp8	BSPE	f_dra_1_f10

f_dra_1_f1	Faces
	Face3	32,0,-113,57,-10,3,1,0
	FendQ
f_dra_1_f3	Faces
	Face4	3,8,43,120,0,0,16,14,10
	FendQ
f_dra_1_f5	Faces
	Face2	43,-1,0,0,0,2,12
	FendQ
f_dra_1_f6	Faces
	Face4	3,11,47,-118,-6,5,6,8,0
	Face4	3,10,-42,120,2,0,8,6,5
	Face4	3,9,-47,-118,0,10,14,16,0
	FendQ
f_dra_1_f7	Faces
	Face4	3,4,-47,118,0,11,15,17,0
	FendQ
f_dra_1_f9	Faces
	Face3	28,2,0,-127,9,2,1,3
	Face2	43,-1,0,0,0,13,1
	Face3	34,3,0,90,90,0,1,2
	Face3	30,1,113,57,-10,0,2,3
	FendQ
f_dra_1_f10	Faces
	Face4	3,7,-42,-120,-2,0,9,7,4
	Face4	3,6,40,120,0,4,7,9,0
	Face4	3,5,43,-120,0,0,17,15,11
	FendQ
f_dra_1_EBSP
	EndShape

	endc


spacebarcol	=	97

;-----------------------------------------------------------------------
	ifne	DO_HDR

len	=	Xspacebarlen/2
size	=	Xspacebarsize/2
Xwirespacebar		ShapeHdr	Xspacebar_P,0,wirespacebar_F,0,0,0,0,0,0,len,size,size,len,id_0_c,0,0,0,0,<Xwirespacebar>
Xsolidspacebar		ShapeHdr	Xspacebar_P,0,solidspacebar_F,0,0,0,0,0,0,len,size,size,len,id_0_c,0,0,0,0,<Xsolidspacebar>

XPwirespacebar		ShapeHdr	Xspacebar_P,0,wirespacebar_F,0,0,0,0,0,Xspacebar_col,len,len,len,len,id_0_c,0,0,0,0,<XPwirespacebar>
XPsolidspacebar	ShapeHdr	Xspacebar_P,0,solidspacebar_F,0,0,0,0,0,Xspacebar_col,len,len,len,len,id_0_c,0,0,0,0,<XPsolidspacebar>

XPwirespacebarRotY 	ShapeHdr	XspacebarRotY_P,0,wirespacebar_F,0,0,0,0,0,XspacebarRotY_col,len,len,len,len,id_0_c,0,0,0,0,<XPwirespacebarRotY>
XPsolidspacebarRotY	ShapeHdr	XspacebarRotY_P,0,solidspacebar_F,0,0,0,0,0,XspacebarRotY_col,len,len,len,len,id_0_c,0,0,0,0,<XPsolidspacebarRotY>


len	=	Yspacebarlen/2
size	=	Yspacebarsize/2
Ywirespacebar		ShapeHdr	Yspacebar_P,0,wirespacebar_F,0,0,0,0,0,0,size,len,size,len,id_0_c,0,0,0,0,<Ywirespacebar>
Ysolidspacebar		ShapeHdr	Yspacebar_P,0,solidspacebar_F,0,0,0,0,0,0,size,len,size,len,id_0_c,0,0,0,0,<Ysolidspacebar>

len	=	Zspacebarlen/2
size	=	Zspacebarsize/2
Zwirespacebar		ShapeHdr	Zspacebar_P,0,wirespacebar_F,0,0,0,0,0,0,size,size,len,len,id_0_c,0,0,0,0,<Zwirespacebar>
Zsolidspacebar		ShapeHdr	Zspacebar_P,0,solidspacebar_F,0,0,0,0,0,0,size,size,len,len,id_0_c,0,0,0,0,<Zsolidspacebar>



len	=	SXspacebarlen/2
size	=	SXspacebarsize/2
SXwirespacebar		ShapeHdr	SXspacebar_P,0,wirespacebar_F,0,0,0,0,0,0,len,size,size,len,id_0_c,0,0,0,0,<SXwirespacebar>
SXsolidspacebar	ShapeHdr	SXspacebar_P,0,solidspacebar_F,0,0,0,0,0,0,len,size,size,len,id_0_c,0,0,0,0,<SXsolidspacebar>

SXPwirespacebar	ShapeHdr	SXspacebar_P,0,wirespacebar_F,0,0,0,0,0,SXspacebar_col,len,len,len,len,id_0_c,0,0,0,0,<SXPwirespacebar>
SXPsolidspacebar	ShapeHdr	SXspacebar_P,0,solidspacebar_F,0,0,0,0,0,SXspacebar_col,len,len,len,len,id_0_c,0,0,0,0,<SXPsolidspacebar>

SXPwirespacebarRotY	ShapeHdr	SXspacebarRotY_P,0,wirespacebar_F,0,0,0,0,0,SXspacebarRotY_col,len,len,len,len,id_0_c,0,0,0,0,<SXPwirespacebarRotY>
SXPsolidspacebarRotY	ShapeHdr	SXspacebarRotY_P,0,solidspacebar_F,0,0,0,0,0,SXspacebarRotY_col,len,len,len,len,id_0_c,0,0,0,0,<SXPsolidspacebarRotY>

len	=	SYspacebarlen/2
size	=	SYspacebarsize/2
SYwirespacebar		ShapeHdr        SYspacebar_P,0,wirespacebar_F,0,0,0,0,0,0,size,len,size,len,id_0_c,0,0,0,0,<SYwirespacebar>
SYsolidspacebar	ShapeHdr	SYspacebar_P,0,solidspacebar_F,0,0,0,0,0,0,size,len,size,len,id_0_c,0,0,0,0,<SYsolidspacebar>

len	=	SZspacebarlen/2
size	=	SZspacebarsize/2
SZwirespacebar		ShapeHdr	SZspacebar_P,0,wirespacebar_F,0,0,0,0,0,0,size,size,len,len,id_0_c,0,0,0,0,<SZwirespacebar>
SZsolidspacebar	ShapeHdr	SZspacebar_P,0,solidspacebar_F,0,0,0,0,0,0,size,size,len,len,id_0_c,0,0,0,0,<SZsolidspacebar>


	elseif


Xspacebar_P
len	=	Xspacebarlen/2
size	=	Xspacebarsize/2
	Pointsxw	4
	pw	len,size,size		;0
	pw	len,size,-size		;2
	pw	len,-size,size		;4
	pw	len,-size,-size		;6
	EndPoints


XspacebarRotY_P
len	=	Xspacebarlen/2
size	=	Xspacebarsize/2
	Pointsw	8
	pw	0,size,size		;0
	pw	-len*2,size,size		;1
	pw	0,size,-size		;2
	pw	-len*2,size,-size		;3
	pw	0,-size,size		;4
	pw	-len*2,-size,size		;5
	pw	0,-size,-size		;6
	pw	-len*2,-size,-size		;7
	EndPoints


Yspacebar_P
len	=	Yspacebarlen/2
size	=	Yspacebarsize/2
	Pointsxw	4
	pw	size,len,size		;0
	pw	size,len,-size		;2
	pw	size,-len,size		;4
	pw	size,-len,-size		;6
	EndPoints


Zspacebar_P
len	=	Zspacebarlen/2
size	=	Zspacebarsize/2
	Pointsxw	4
	pw	size,size,len		;0
	pw	size,size,-len		;2
	pw	size,-size,len		;4
	pw	size,-size,-len		;6
	EndPoints






SXspacebar_P
len	=	SXspacebarlen/2
size	=	SXspacebarsize/2
	Pointsxw	4
	pw	len,size,size		;0
	pw	len,size,-size		;2
	pw	len,-size,size		;4
	pw	len,-size,-size		;6
	EndPoints



SXspacebarRotY_P
len	=	SXspacebarlen/2
size	=	SXspacebarsize/2
	Pointsw	8
	pw	0,size,size		;0
	pw	-len*2,size,size		;1
	pw	0,size,-size		;2
	pw	-len*2,size,-size		;3
	pw	0,-size,size		;4
	pw	-len*2,-size,size		;5
	pw	0,-size,-size		;6
	pw	-len*2,-size,-size		;7
	EndPoints


SYspacebar_P
len	=	SYspacebarlen/2
size	=	SYspacebarsize/2
	Pointsxw	4
	pw	size,len,size		;0
	pw	size,len,-size		;2
	pw	size,-len,size		;4
	pw	size,-len,-size		;6
	EndPoints


SZspacebar_P
len	=	SZspacebarlen/2
size	=	SZspacebarsize/2
	Pointsxw	4
	pw	size,size,len		;0
	pw	size,size,-len		;2
	pw	size,-size,len		;4
	pw	size,-size,-len		;6
	EndPoints

solidspacebar_F    	
	Vizis	6
	Viz	3,7,5,127,0,0	;0
	Viz	4,6,2,-127,0,0	;1
	Viz	6,7,3,0,127,0	;2
	Viz	5,4,0,0,-127,0	;3
	Viz	1,0,2,-0,0,127	;4
	Viz	4,5,7,0,0,-127	;5

	faces
	Face4	99,0,127,0,0,3,7,5,1	; right	; 12 - Dk grey
	Face4	99,1,-127,0,0,4,6,2,0	; left	; 12 - Dk grey
	Face4	97,2,0,127,0,6,7,3,2	; down	; 16 - Lt grey
	Face4	97,3,0,-127,0,5,4,0,1	; up	; 16 - Lt grey
	Face4	98,4,-0,0,127,1,0,2,3	; front ; 23 - red
	Face4	98,5,0,0,-127,4,5,7,6	; back	; 23 - red
	Fend
	EndShape

wirespacebar_F
	Vizis	1
	Viz	7,5,1,0,0,-127	;5

	faces
	Face2	spacebarcol,-1,0,0,0,2,3	
	Face2	spacebarcol,-1,0,0,0,1,0	
	Face2	spacebarcol,-1,0,0,0,6,7	
	Face2	spacebarcol,-1,0,0,0,5,4
	Face2	spacebarcol,-1,0,0,0,0,4
	Face2	spacebarcol,-1,0,0,0,2,6
	Face2	spacebarcol,-1,0,0,0,3,7
	Face2	spacebarcol,-1,0,0,0,1,5
	Face2	spacebarcol,-1,0,0,0,0,2
	Face2	spacebarcol,-1,0,0,0,6,4
	Face2	spacebarcol,-1,0,0,0,1,3
	Face2	spacebarcol,-1,0,0,0,7,5
	Fend
	EndShape

	endc
;-----------------------------------------------------------------------
;--Shape file ----- C:\SHED\NSHAPES\colony_0.txt ----
	ifne	DO_HDR

colony_0
	ShapeHdr	colony_0_P,0,colony_0_F,0,0,0,0,2+1,0,100/2,122/2,70/2,142/2,id_0_c,0,0,0,0,<colony_0>
	elseif
colony_0_P
	Pointsb	34
	pbd2	-48,90,19	;0
	pbd2	-30,-90,28	;1
	pbd2	-20,100,40	;2
	pbd2	30,100,40	;3
	pbd2	-70,100,40	;4
	pbd2	-76,100,40	;5
	pbd2	-70,90,40	;6
	pbd2	-70,50,40	;7
	pbd2	-76,50,40	;8
	pbd2	-55,-100,40	;9
	pbd2	55,-111,40	;10
	pbd2	60,-111,40	;11
	pbd2	80,80,45	;12
	pbd2	95,80,45	;13
	pbd2	80,70,45	;14
	pbd2	95,70,45	;15
	pbd2	95,40,45	;16
	pbd2	60,-100,45	;17
	pbd2	91,-100,45	;18
	pbd2	24,122,50	;19
	pbd2	24,120,50	;20
	pbd2	24,80,50	;21
	pbd2	8,-75,50	;22
	pbd2	10,-75,50	;23
	pbd2	52,-75,50	;24
	pbd2	-52,-90,50	;25
	pbd2	-52,-95,50	;26
	pbd2	52,-100,50	;27
	pbd2	10,94,60	;28
	pbd2	10,80,60	;29
	pbd2	20,-60,70	;30
	pbd2	-30,-60,70	;31
	pbd2	-30,-85,70	;32
	pbd2	20,-105,70	;33
	PointsXb	22
	pbd2	-23,15,0	;34
	pbd2	-23,-15,0	;36
	pbd2	23,60,20	;38
	pbd2	33,60,20	;40
	pbd2	60,60,20	;42
	pbd2	80,40,20	;44
	pbd2	-23,35,20	;46
	pbd2	-33,15,20	;48
	pbd2	-33,-15,20	;50
	pbd2	80,-20,20	;52
	pbd2	23,-25,20	;54
	pbd2	-23,-40,20	;56
	pbd2	33,-40,20	;58
	pbd2	60,-40,20	;60
	pbd2	60,80,40	;62
	pbd2	-100,40,40	;64
	pbd2	-100,-20,40	;66
	pbd2	-55,-60,40	;68
	pbd2	60,-60,40	;70
	pbd2	-52,-60,50	;72
	pbd2	-23,15,70	;74
	pbd2	-23,-15,70	;76

	EndPoints
colony_0_F
	Vizis	35
	Viz	74,76,36,-127,0,0	;0
	Viz	35,37,77,127,0,0	;1
	Viz	77,37,36,0,-127,0	;2
	Viz	74,34,35,0,127,0	;3
	Viz	37,35,34,0,0,127	;4
	Viz	36,37,54,0,114,-57	;5
	Viz	36,50,48,114,0,-57	;6
	Viz	36,55,50,85,85,-42	;7
	Viz	35,49,51,-114,0,-57	;8
	Viz	51,54,37,-85,85,-42	;9
	Viz	46,47,35,0,-90,-90	;10
	Viz	48,46,34,104,-52,-52	;11
	Viz	35,47,49,-104,-52,-52	;12
	Viz	57,54,51,0,0,-127	;13
	Viz	58,40,42,0,0,-127	;14
	Viz	40,49,47,0,0,-127	;15
	Viz	59,50,55,0,0,-127	;16
	Viz	39,46,48,0,0,-127	;17
	Viz	61,53,45,0,0,-127	;18
	Viz	47,46,39,0,0,-127	;19
	Viz	57,56,55,0,0,-127	;20
	Viz	71,61,60,0,90,-90	;21
	Viz	66,53,61,73,73,-73	;22
	Viz	64,45,53,90,0,-90	;23
	Viz	62,42,43,0,-90,-90	;24
	Viz	63,43,45,73,-73,-73	;25
	Viz	70,60,52,-73,73,-73	;26
	Viz	67,52,44,-90,0,-90	;27
	Viz	65,44,42,-73,-73,-73	;28
	Viz	71,68,9,0,0,-127	;29
	Viz	72,26,9,-122,0,-36	;30
	Viz	11,10,69,0,0,-127	;31
	Viz	69,10,27,122,0,-36	;32
	Viz	4,7,8,0,0,-127	;39
	Viz	12,13,15,0,0,-127	;45
	BSPInit	colony_0_EBSP
	BSP	28,colony_0_f1,.bsp2
	BSPE	colony_0_f3
.bsp2	BSPE	colony_0_f4

colony_0_f1	Faces
	Face4	16,28,-73,-73,-73,65,44,42,62
	FendQ
colony_0_f3	Faces
	Face4	10,4,0,0,127,37,35,34,36
	Face4	32,0,-127,0,0,74,76,36,34
	Face4	28,1,127,0,0,35,37,77,75
	Face4	30,2,0,-127,0,77,37,36,76
	Face4	34,3,0,127,0,74,34,35,75
	Face4	18,5,0,114,-57,36,37,54,55
	Face4	14,6,114,0,-57,36,50,48,34
	Face3	16,7,85,85,-42,36,55,50
	Face4	18,8,-114,0,-57,35,49,51,37
	Face3	20,9,-85,85,-42,51,54,37
	Face4	14,10,0,-90,-90,46,47,35,34
	Face3	12,11,104,-52,-52,48,46,34
	Face3	16,12,-104,-52,-52,35,47,49
	Face4	10,13,0,0,-127,57,54,51,58
	Face6	21,14,0,0,-127,58,40,42,44,52,60
	Face4	10,15,0,0,-127,40,49,47,38
	Face4	10,16,0,0,-127,59,50,55,56
	Face4	10,17,0,0,-127,39,46,48,41
	Face6	21,18,0,0,-127,61,53,45,43,41,59
	Face4	16,19,0,0,-127,47,46,39,38
	Face4	16,20,0,0,-127,57,56,55,54
	Face4	18,21,0,90,-90,71,61,60,70
	Face4	16,22,73,73,-73,66,53,61,71
	Face4	14,24,0,-90,-90,62,42,43,63
	Face4	12,25,73,-73,-73,63,43,45,64
	Face4	20,26,-73,73,-73,70,60,52,67
	Face3	18,29,0,0,-127,71,68,9
	Face4	20,30,-122,0,-36,72,26,9,68
	Face4	18,31,0,0,-127,11,10,69,70
	Face4	12,32,122,0,-36,69,10,27,73
	Face4	12,33,0,0,-127,4,7,8,5
	Face2	18,-1,0,0,0,25,1
	Face2	16,-1,0,0,0,24,23
	Face2	14,-1,0,0,0,30,33
	Face2	12,-1,0,0,0,32,31
	Face2	18,-1,0,0,0,17,18
	Face2	12,-1,0,0,0,21,20
	Face2	14,-1,0,0,0,6,0
	Face2	14,-1,0,0,0,3,2
	Face2	43,-1,0,0,0,23,22
	Face2	12,-1,0,0,0,28,29
	Face4	14,23,90,0,-90,64,45,53,66
	Face4	18,27,-90,0,-90,67,52,44,65
	FendQ
colony_0_f4	Faces
	Face4	12,34,0,0,-127,12,13,15,14
	Face2	44,-1,0,0,0,20,19
	Face2	12,-1,0,0,0,15,16
	FendQ
colony_0_EBSP
	EndShape

	endc

;--Shape file ----- C:\SHED\NSHAPES\colony_1.txt ----
	ifne	DO_HDR

colony_1
	ShapeHdr	colony_1_P,0,colony_1_F,0,0,0,0,2+1,0,110/2,35/2,70/2,133/2,id_0_c,0,0,0,0,<colony_1>
	elseif
colony_1_P
	Pointsb	28
	pbd2	0,5,50	;0
	pbd2	20,5,50	;1
	pbd2	70,5,50	;2
	pbd2	90,5,50	;3
	pbd2	0,-5,50	;4
	pbd2	20,-5,50	;5
	pbd2	70,-5,50	;6
	pbd2	90,-5,50	;7
	pbd2	40,35,60	;8
	pbd2	50,35,60	;9
	pbd2	30,25,60	;10
	pbd2	60,25,60	;11
	pbd2	0,15,60	;12
	pbd2	30,15,60	;13
	pbd2	60,15,60	;14
	pbd2	80,15,60	;15
	pbd2	0,-15,60	;16
	pbd2	30,-15,60	;17
	pbd2	60,-15,60	;18
	pbd2	80,-15,60	;19
	pbd2	30,-25,60	;20
	pbd2	60,-25,60	;21
	pbd2	40,-35,60	;22
	pbd2	50,-35,60	;23
	pbd2	0,25,70	;24
	pbd2	110,25,70	;25
	pbd2	0,-25,70	;26
	pbd2	110,-25,70	;27

	EndPoints
colony_1_F
	Vizis	8
	Viz	21,23,22,0,0,-127	;2
	Viz	17,5,1,-90,0,-90	;3
	Viz	14,2,6,90,0,-90	;4
	Viz	1,0,12,0,-90,-90	;5
	Viz	17,16,4,0,90,-90	;6
	Viz	3,2,14,0,-90,-90	;7
	Viz	0,3,7,0,0,-127	;8
	Viz	19,18,6,0,90,-90	;9
	BSPInit	colony_1_EBSP
	BSP	0,colony_1_f1,.bsp2
	BSPE	colony_1_f3
.bsp2	BSPE	colony_1_f4

colony_1_f1	Faces
	Face8	45,0,0,0,-127,21,23,22,20,10,8,9,11
	FendQ
colony_1_f3	Faces
	Face2	44,-1,-127,0,0,26,27
	Face2	44,-1,127,0,0,25,24
	FendQ
colony_1_f4	Faces
	Face4	44,1,-90,0,-90,17,5,1,13
	Face4	44,2,90,0,-90,14,2,6,18
	Face4	21,3,0,-90,-90,1,0,12,13
	Face4	25,4,0,90,-90,17,16,4,5
	Face4	21,5,0,-90,-90,3,2,14,15
	Face4	23,6,0,0,-127,0,3,7,4
	Face4	25,7,0,90,-90,19,18,6,7
	FendQ
colony_1_EBSP
	EndShape

	endc

;--Shape file ----- C:\SHED\NSHAPES\colony_3.txt ----
	ifne	DO_HDR

colony3L
	ShapeHdr	colony3L_P,0,colony3L_F,0,0,0,0,3+1,0,10/2,50/2,20/2,125/2,id_0_c,0,0,0,0,<colony3L>
	elseif
colony3L_P
	Pointsb	25
	pbd2	45,-60,-100	;0
	pbd2	35,-40,-70	;1
	pbd2	45,-40,-70	;2
	pbd2	35,-60,-70	;3
	pbd2	45,-60,-70	;4
	pbd2	25,80,-10	;5
	pbd2	25,50,-10	;6
	pbd2	50,50,-10	;7
	pbd2	25,-35,-10	;8
	pbd2	50,-35,-10	;9
	pbd2	25,-65,-10	;10
	pbd2	50,-65,-10	;11
	pbd2	-25,-40,-5	;12
	pbd2	-25,-60,-5	;13
	pbd2	30,-85,-5	;14
	pbd2	45,-85,-5	;15
	pbd2	-25,-40,65	;16
	pbd2	-50,-40,65	;17
	pbd2	-25,-60,65	;18
	pbd2	30,-85,65	;19
	pbd2	25,50,70	;20
	pbd2	50,50,70	;21
	pbd2	25,-35,70	;22
	pbd2	25,-65,70	;23
	pbd2	85,-35,75	;24

	EndPoints
colony3L_F
	Vizis	11
	Viz	13,18,16,127,0,0	;0
	Viz	8,12,16,13,-126,0	;1
	Viz	10,13,12,13,0,-126	;2
	Viz	10,14,19,123,31,0	;3
	Viz	11,15,14,0,31,-123	;4
	Viz	4,3,1,0,0,-127	;5
	Viz	8,1,3,125,0,-21	;7
	Viz	9,2,1,0,-127,-11	;8
	Viz	8,6,7,0,0,-127	;10
	Viz	22,20,6,127,0,0	;11
	Viz	7,6,20,0,-127,0	;12
	BSPInit	colony3L_EBSP
	BSP	0,colony3L_f1,.bsp2
	BSP	1,colony3L_f3,.bsp4
	BSP	2,colony3L_f5,.bsp6
	BSPE	colony3L_f7
.bsp6	BSP	5,colony3L_f8,.bsp9
	BSPE	colony3L_f10
.bsp9	BSPE	colony3L_f11
.bsp4	BSP	10,colony3L_f12,.bsp13
	BSPE	colony3L_f14
.bsp13	BSPE	colony3L_f15
.bsp2	BSPE	colony3L_f16

colony3L_f1	Faces
	Face4	23,0,127,0,0,13,18,16,12
	FendQ
colony3L_f3	Faces
	Face4	21,1,13,-126,0,8,12,16,22
	FendQ
colony3L_f5	Faces
	Face4	25,2,13,0,-126,10,13,12,8
	FendQ
colony3L_f7	Faces
	Face4	14,3,123,31,0,10,14,19,23
	FendQ
colony3L_f8	Faces
	Face4	20,5,0,0,-127,4,3,1,2
	FendQ
colony3L_f10	Faces
	Face4	18,4,0,31,-123,11,15,14,10
	Face4	14,6,125,0,-21,8,1,3,10
	FendQ
colony3L_f11	Faces
	Face2	43,-1,0,0,0,4,0
	FendQ
colony3L_f12	Faces
	Face4	0,10,0,-127,0,7,6,20,21
	FendQ
colony3L_f14	Faces
	Face4	12,7,0,-127,-11,9,2,1,8
	Face4	18,8,0,0,-127,8,6,7,9
	Face4	14,9,127,0,0,22,20,6,8
	FendQ
colony3L_f15	Faces
	Face2	43,-1,0,0,0,6,5
	FendQ
colony3L_f16	Faces
	Face2	21,-1,0,0,0,16,17
	FendQ
colony3L_EBSP
	EndShape

	endc
;--Shape file ----- C:\SHED\NSHAPES\colony_3.txt ----
	ifne	DO_HDR

colony3R
	ShapeHdr	colony3R_P,0,colony3R_F,0,0,0,0,3+1,0,85/2,85/2,100/2,125/2,id_0_c,0,0,0,0,<colony3R>
	elseif
colony3R_P
	Pointsb	25
	pbd2	-45,-60,-100	;0
	pbd2	-35,-40,-70	;1
	pbd2	-45,-40,-70	;2
	pbd2	-35,-60,-70	;3
	pbd2	-45,-60,-70	;4
	pbd2	-25,80,-10	;5
	pbd2	-25,50,-10	;6
	pbd2	-50,50,-10	;7
	pbd2	-25,-35,-10	;8
	pbd2	-50,-35,-10	;9
	pbd2	-25,-65,-10	;10
	pbd2	-50,-65,-10	;11
	pbd2	25,-40,-5	;12
	pbd2	25,-60,-5	;13
	pbd2	-30,-85,-5	;14
	pbd2	-45,-85,-5	;15
	pbd2	25,-40,65	;16
	pbd2	50,-40,65	;17
	pbd2	25,-60,65	;18
	pbd2	-30,-85,65	;19
	pbd2	-25,50,70	;20
	pbd2	-50,50,70	;21
	pbd2	-25,-35,70	;22
	pbd2	-25,-65,70	;23
	pbd2	-85,-35,75	;24

	EndPoints
colony3R_F
	Vizis	11
	Viz	16,18,13,-127,0,0	;0
	Viz	16,12,8,-13,-126,0	;1
	Viz	12,13,10,-13,0,-126	;2
	Viz	19,14,10,-123,31,0	;3
	Viz	14,15,11,0,31,-123	;4
	Viz	1,3,4,0,0,-127	;5
	Viz	3,1,8,-125,0,-21	;7
	Viz	1,2,9,0,-127,-11	;8
	Viz	7,6,8,0,0,-127	;10
	Viz	6,20,22,-127,0,0	;11
	Viz	20,6,7,0,-127,0	;12
	BSPInit	colony3R_EBSP
	BSP	0,colony3R_f1,.bsp2
	BSP	1,colony3R_f3,.bsp4
	BSP	2,colony3R_f5,.bsp6
	BSPE	colony3R_f7
.bsp6	BSPE	colony3R_f8
.bsp4	BSPNULL	9,colony3R_f9
	BSP	7,colony3R_f10,.bsp11
	BSPE	colony3R_f12
.bsp11	BSPE	colony3R_f13
.bsp2	BSPE	colony3R_f14

colony3R_f1	Faces
	Face4	23,0,-127,0,0,16,18,13,12
	FendQ
colony3R_f3	Faces
	Face4	21,1,-13,-126,0,16,12,8,22
	FendQ
colony3R_f5	Faces
	Face4	25,2,-13,0,-126,12,13,10,8
	FendQ
colony3R_f7	Faces
	Face4	14,3,-123,31,0,19,14,10,23
	FendQ
colony3R_f8	Faces
	Face4	18,4,0,31,-123,14,15,11,10
	Face4	20,5,0,0,-127,1,3,4,2
	Face4	14,6,-125,0,-21,3,1,8,10
	FendQ
colony3R_f9	Faces
	Face4	14,9,-127,0,0,6,20,22,8
	FendQ
colony3R_f10	Faces
	Face4	12,7,0,-127,-11,1,2,9,8
	FendQ
colony3R_f12	Faces
	Face2	21,-1,0,0,0,16,17
	FendQ
colony3R_f13	Faces
	Face4	18,8,0,0,-127,7,6,8,9
	Face4	0,10,0,-127,0,20,6,7,21
	FendQ
colony3R_f14	Faces
	Face2	43,-1,0,0,0,6,5
	Face2	43,-1,0,0,0,4,0
	FendQ
colony3R_EBSP
	EndShape

	endc

;--Shape file ----- C:\SHED\NSHAPES\s_hou_0.txt ----
	ifne	DO_HDR

r_hou_0	ShapeHdr	s_hou_0_P,0,s_hou_0_F,0,0,0,0,1,0,24,29,25,32,id_2_c,0,0,0,0,<r_hou_0>
s_hou_0	ShapeHdr	s_hou_0_P,0,s_hou_0_F,0,0,0,0,1,0,24,29,25,32,id_0_c,0,0,0,0,<s_hou_0>
b_hou_0	ShapeHdr	s_hou_0_P,0,s_hou_0_F,0,0,0,0,1,0,24,29,25,32,id_3_c,0,0,0,0,<b_hou_0>
	elseif
s_hou_0_P
	Pointsb	4
	pb	0,16,-18	;0
	pb	0,29,-9	;1
	pb	0,-16,0	;2
	pb	0,-14,16	;3
	PointsXb	6
	pb	14,4,-16	;4
	pb	14,-12,-7	;6
	pb	24,4,2	;8
	pb	10,29,9	;10
	pb	20,16,18	;12
	pb	10,2,25	;14

	EndPoints
s_hou_0_F
	Vizis	16
	Viz	2,12,14,-105,71,9	;0
	Viz	1,10,12,-105,-40,-58	;1
	Viz	4,8,6,-107,33,-59	;2
	Viz	0,13,11,105,-40,-58	;3
	Viz	10,11,13,0,-72,104	;4
	Viz	11,10,1,0,-127,0	;5
	Viz	3,15,13,105,71,9	;6
	Viz	12,13,15,0,-57,114	;7
	Viz	3,14,15,0,62,111	;8
	Viz	8,4,0,-81,-87,-45	;9
	Viz	6,8,12,-61,81,76	;10
	Viz	2,0,4,36,60,-106	;11
	Viz	7,9,5,107,33,-59	;12
	Viz	2,13,9,61,81,76	;13
	Viz	7,5,0,-36,60,-106	;14
	Viz	13,0,5,81,-87,-45	;15

s_hou_0_f1	Faces
	Face4	18,0,-105,71,9,2,12,14,3
	Face4	16,1,-105,-40,-58,1,10,12,0
	Face4	14,3,105,-40,-58,0,13,11,1
	Face4	20,6,105,71,9,3,15,13,2
	Face4	14,9,-81,-87,-45,8,4,0,12
	Face4	16,10,-61,81,76,6,8,12,2
	Face4	12,11,36,60,-106,2,0,4,6
	Face4	18,13,61,81,76,2,13,9,7
	Face4	16,14,-36,60,-106,7,5,0,2
	Face4	14,15,81,-87,-45,13,0,5,9
	Face3	43,2,-107,33,-59,4,8,6
	Face4	18,4,0,-72,104,10,11,13,12
	Face3	43,5,0,-127,0,11,10,1
	Face4	16,7,0,-57,114,12,13,15,14
	Face3	43,8,0,62,111,3,14,15
	Face3	43,12,107,33,-59,7,9,5
	Fend
	EndShape

	endc


;--Shape file ----- C:\SHED\NSHAPES\colony_2.anm ----
	ifne	DO_HDR

colony_2
	ShapeHdr	colony_2_P,0,colony_2_F,0,0,0,0,1,0,46,30,20,55,id_0_c,0,0,0,0,<colony_2>
	elseif
colony_2_P
	PointsXb	6
	pb	46,10,-20	;0
	pb	46,-10,-20	;2
	pb	46,20,-10	;4
	pb	46,-20,-10	;6
	pb	46,30,-5	;8
	pb	46,-30,-5	;10
	Frames	10
	jumptab	.A0A
	jumptab	.A1A
	jumptab	.A2A
	jumptab	.A3A
	jumptab	.A4A
	jumptab	.A5A
	jumptab	.A6A
	jumptab	.A7A
	jumptab	.A8A
	jumptab	.A9A
.A0A	PointsXb	14
	pb	10,10,-20	;12
	pb	-15,10,-20	;14
	pb	10,-10,-20	;16
	pb	-15,-10,-20	;18
	pb	0,20,-10	;20
	pb	10,20,-10	;22
	pb	0,10,-10	;24
	pb	0,-10,-10	;26
	pb	0,-20,-10	;28
	pb	10,-20,-10	;30
	pb	0,30,-5	;32
	pb	0,-30,-5	;34
	pb	0,30,0	;36
	pb	0,-30,0	;38
	jump	.EB0
.A1A	PointsXb	14
	pb	15,10,-20	;12
	pb	-20,10,-20	;14
	pb	15,-10,-20	;16
	pb	-20,-10,-20	;18
	pb	5,20,-10	;20
	pb	15,20,-10	;22
	pb	5,10,-10	;24
	pb	5,-10,-10	;26
	pb	5,-20,-10	;28
	pb	15,-20,-10	;30
	pb	5,30,-5	;32
	pb	5,-30,-5	;34
	pb	5,30,0	;36
	pb	5,-30,0	;38
	jump	.EB0
.A2A	PointsXb	14
	pb	20,10,-20	;12
	pb	-25,10,-20	;14
	pb	20,-10,-20	;16
	pb	-25,-10,-20	;18
	pb	10,20,-10	;20
	pb	20,20,-10	;22
	pb	10,10,-10	;24
	pb	10,-10,-10	;26
	pb	10,-20,-10	;28
	pb	20,-20,-10	;30
	pb	10,30,-5	;32
	pb	10,-30,-5	;34
	pb	10,30,0	;36
	pb	10,-30,0	;38
	jump	.EB0
.A3A	PointsXb	14
	pb	25,10,-20	;12
	pb	-30,10,-20	;14
	pb	25,-10,-20	;16
	pb	-30,-10,-20	;18
	pb	15,20,-10	;20
	pb	25,20,-10	;22
	pb	15,10,-10	;24
	pb	15,-10,-10	;26
	pb	15,-20,-10	;28
	pb	25,-20,-10	;30
	pb	15,30,-5	;32
	pb	15,-30,-5	;34
	pb	15,30,0	;36
	pb	15,-30,0	;38
	jump	.EB0
.A4A	PointsXb	14
	pb	30,10,-20	;12
	pb	-35,10,-20	;14
	pb	30,-10,-20	;16
	pb	-35,-10,-20	;18
	pb	20,20,-10	;20
	pb	30,20,-10	;22
	pb	20,10,-10	;24
	pb	20,-10,-10	;26
	pb	20,-20,-10	;28
	pb	30,-20,-10	;30
	pb	20,30,-5	;32
	pb	20,-30,-5	;34
	pb	20,30,0	;36
	pb	20,-30,0	;38
	jump	.EB0
.A5A	PointsXb	14
	pb	35,10,-20	;12
	pb	-40,10,-20	;14
	pb	35,-10,-20	;16
	pb	-40,-10,-20	;18
	pb	25,20,-10	;20
	pb	35,20,-10	;22
	pb	25,10,-10	;24
	pb	25,-10,-10	;26
	pb	25,-20,-10	;28
	pb	35,-20,-10	;30
	pb	25,30,-5	;32
	pb	25,-30,-5	;34
	pb	25,30,0	;36
	pb	25,-30,0	;38
	jump	.EB0
.A6A	PointsXb	14
	pb	40,10,-20	;12
	pb	-45,10,-20	;14
	pb	40,-10,-20	;16
	pb	-45,-10,-20	;18
	pb	30,20,-10	;20
	pb	40,20,-10	;22
	pb	30,10,-10	;24
	pb	30,-10,-10	;26
	pb	30,-20,-10	;28
	pb	40,-20,-10	;30
	pb	30,30,-5	;32
	pb	30,-30,-5	;34
	pb	30,30,0	;36
	pb	30,-30,0	;38
	jump	.EB0
.A7A	PointsXb	14
	pb	45,10,-20	;12
	pb	-46,10,-20	;14
	pb	45,-10,-20	;16
	pb	-46,-10,-20	;18
	pb	35,20,-10	;20
	pb	45,20,-10	;22
	pb	35,10,-10	;24
	pb	35,-10,-10	;26
	pb	35,-20,-10	;28
	pb	45,-20,-10	;30
	pb	35,30,-5	;32
	pb	35,-30,-5	;34
	pb	35,30,0	;36
	pb	35,-30,0	;38
	jump	.EB0
.A8A	PointsXb	14
	pb	46,10,-20	;12
	pb	-46,10,-20	;14
	pb	46,-10,-20	;16
	pb	-46,-10,-20	;18
	pb	40,20,-10	;20
	pb	46,20,-10	;22
	pb	40,10,-10	;24
	pb	40,-10,-10	;26
	pb	40,-20,-10	;28
	pb	46,-20,-10	;30
	pb	40,30,-5	;32
	pb	40,-30,-5	;34
	pb	40,30,0	;36
	pb	40,-30,0	;38
	jump	.EB0
.A9A	PointsXb	14
	pb	46,10,-20	;12
	pb	-46,10,-20	;14
	pb	46,-10,-20	;16
	pb	-46,-10,-20	;18
	pb	45,20,-10	;20
	pb	46,20,-10	;22
	pb	45,10,-10	;24
	pb	45,-10,-10	;26
	pb	45,-20,-10	;28
	pb	46,-20,-10	;30
	pb	45,30,-5	;32
	pb	45,-30,-5	;34
	pb	45,30,0	;36
	pb	45,-30,0	;38
.EB0

	EndPoints
colony_2_F
	Vizis	24
	Viz	21,25,23,0,0,-127	;0
	Viz	5,9,33,0,-57,-114	;1
	Viz	31,27,29,0,0,-127	;2
	Viz	29,35,11,0,57,-114	;3
	Viz	5,23,13,0,-90,-90	;4
	Viz	3,17,31,0,90,-90	;5
	Viz	18,14,13,0,0,-127	;6
	Viz	25,13,23,-73,-73,-73	;7
	Viz	31,17,27,-73,73,-73	;8
	Viz	27,17,13,-90,0,-90	;9
	Viz	14,18,3,0,0,-127	;10
	Viz	22,24,20,0,0,-127	;11
	Viz	20,32,8,0,-57,-114	;12
	Viz	28,26,30,0,0,-127	;13
	Viz	6,10,34,0,57,-114	;14
	Viz	0,12,22,0,-90,-90	;15
	Viz	6,30,16,0,90,-90	;16
	Viz	16,12,15,0,0,-127	;17
	Viz	22,12,24,73,-73,-73	;18
	Viz	26,16,30,73,73,-73	;19
	Viz	24,12,16,90,0,-90	;20
	Viz	0,2,19,0,0,-127	;21
	Viz	36,32,20,127,0,0	;22
	Viz	39,35,29,-127,0,0	;23
	BSPInit	colony_2_EBSP
	BSP	0,colony_2_f1,.bsp2
	BSPE	colony_2_f3
.bsp2	BSP	9,colony_2_f4,.bsp5
	BSPE	colony_2_f6
.bsp5	BSP	20,colony_2_f7,.bsp8
	BSPE	colony_2_f9
.bsp8	BSPE	colony_2_f10

colony_2_f1	Faces
	Face3	23,0,0,0,-127,21,25,23
	FendQ
colony_2_f3	Faces
	Face6	21,22,127,0,0,36,32,20,28,34,38
	Face6	27,23,-127,0,0,39,35,29,21,33,37
	Face4	21,1,0,-57,-114,5,9,33,21
	Face4	25,3,0,57,-114,29,35,11,7
	Face4	21,12,0,-57,-114,20,32,8,4
	Face4	25,14,0,57,-114,6,10,34,28
	FendQ
colony_2_f4	Faces
	Face4	18,9,-90,0,-90,27,17,13,25
	FendQ
colony_2_f6	Faces
	Face4	14,4,0,-90,-90,5,23,13,1
	Face4	18,5,0,90,-90,3,17,31,7
	Face4	16,10,0,0,-127,14,18,3,1
	FendQ
colony_2_f7	Faces
	Face4	14,20,90,0,-90,24,12,16,26
	FendQ
colony_2_f9	Faces
	Face4	14,15,0,-90,-90,0,12,22,4
	Face4	18,16,0,90,-90,6,30,16,2
	Face4	16,21,0,0,-127,0,2,19,15
	FendQ
colony_2_f10	Faces
	Face3	23,2,0,0,-127,31,27,29
	Face3	23,11,0,0,-127,22,24,20
	Face3	23,13,0,0,-127,28,26,30
	Face3	16,7,-73,-73,-73,25,13,23
	Face3	20,8,-73,73,-73,31,17,27
	Face3	12,18,73,-73,-73,22,12,24
	Face3	16,19,73,73,-73,26,16,30
	Face4	44,6,0,0,-127,18,14,13,17
	Face4	44,17,0,0,-127,16,12,15,19
	FendQ
colony_2_EBSP
	EndShape

	endc


;--Shape file ----- C:\SHED\NSHAPES\walker_2.anm ----
	ifne	DO_HDR

walker_2
	ShapeHdr	walker_2_P,0,walker_2_F,0,0,0,0,0,0,30,87,47,88,id_0_c,0,0,0,0,<walker_2>
	elseif
walker_2_P
	Frames	12
	jumptab	.A0A
	jumptab	.A1A
	jumptab	.A2A
	jumptab	.A3A
	jumptab	.A4A
	jumptab	.A5A
	jumptab	.A6A
	jumptab	.A7A
	jumptab	.A8A
	jumptab	.A9A
	jumptab	.A10A
	jumptab	.A11A
.A0A	Pointsb	8
	pb	20,0,-41	;0
	pb	20,-25,-21	;1
	pb	-20,0,-9	;2
	pb	-20,-30,2	;3
	pb	10,-30,9	;4
	pb	30,-30,9	;5
	pb	-10,-44,29	;6
	pb	-30,-44,29	;7
	PointsXb	10
	pb	15,-45,-20	;8
	pb	25,-45,-20	;10
	pb	10,-60,-20	;12
	pb	10,-70,-20	;14
	pb	-10,-40,0	;16
	pb	-10,-65,0	;18
	pb	-30,-65,0	;20
	pb	-10,-82,2	;22
	pb	-10,-40,10	;24
	pb	10,-70,10	;26
	jump	.EB0
.A1A	Pointsb	8
	pb	20,0,-47	;0
	pb	20,-25,-27	;1
	pb	-20,0,2	;2
	pb	-20,-32,8	;3
	pb	10,-30,3	;4
	pb	30,-30,3	;5
	pb	-10,-50,32	;6
	pb	-30,-50,32	;7
	PointsXb	10
	pb	15,-54,-25	;8
	pb	25,-54,-25	;10
	pb	10,-61,-20	;12
	pb	10,-71,-20	;14
	pb	-10,-41,0	;16
	pb	-10,-66,0	;18
	pb	-30,-66,0	;20
	pb	-10,-83,3	;22
	pb	-10,-41,10	;24
	pb	10,-71,10	;26
	jump	.EB0
.A2A	Pointsb	8
	pb	20,-16,-45	;0
	pb	20,-37,-21	;1
	pb	-20,0,0	;2
	pb	-20,-31,5	;3
	pb	10,-37,9	;4
	pb	30,-37,9	;5
	pb	-10,-51,29	;6
	pb	-30,-51,29	;7
	PointsXb	10
	pb	15,-52,-20	;8
	pb	25,-52,-20	;10
	pb	10,-67,-20	;12
	pb	10,-77,-20	;14
	pb	-10,-47,0	;16
	pb	-10,-72,0	;18
	pb	-30,-72,0	;20
	pb	-10,-87,0	;22
	pb	-10,-47,10	;24
	pb	10,-77,10	;26
	jump	.EB0
.A3A	Pointsb	8
	pb	20,-27,-42	;0
	pb	20,-43,-15	;1
	pb	-20,0,-12	;2
	pb	-20,-30,-2	;3
	pb	10,-38,15	;4
	pb	30,-38,15	;5
	pb	-10,-45,25	;6
	pb	-30,-45,25	;7
	PointsXb	10
	pb	15,-51,-20	;8
	pb	25,-51,-20	;10
	pb	10,-66,-20	;12
	pb	10,-76,-20	;14
	pb	-10,-46,0	;16
	pb	-10,-71,0	;18
	pb	-30,-71,0	;20
	pb	-10,-84,-2	;22
	pb	-10,-46,10	;24
	pb	10,-76,10	;26
	jump	.EB0
.A4A	Pointsb	8
	pb	20,-17,-34	;0
	pb	20,-38,-10	;1
	pb	-20,0,-24	;2
	pb	-20,-28,-9	;3
	pb	10,-38,20	;4
	pb	30,-38,20	;5
	pb	-10,-38,20	;6
	pb	-30,-38,20	;7
	PointsXb	10
	pb	15,-48,-20	;8
	pb	25,-48,-20	;10
	pb	10,-63,-20	;12
	pb	10,-73,-20	;14
	pb	-10,-43,0	;16
	pb	-10,-68,0	;18
	pb	-30,-68,0	;20
	pb	-10,-80,-2	;22
	pb	-10,-43,10	;24
	pb	10,-73,10	;26
	jump	.EB0
.A5A	Pointsb	8
	pb	20,0,-30	;0
	pb	20,-25,-10	;1
	pb	-20,0,-30	;2
	pb	-20,-25,-10	;3
	pb	10,-30,20	;4
	pb	30,-30,20	;5
	pb	-10,-30,20	;6
	pb	-30,-30,20	;7
	PointsXb	10
	pb	15,-37,-16	;8
	pb	25,-37,-16	;10
	pb	10,-52,-20	;12
	pb	10,-62,-20	;14
	pb	-10,-32,0	;16
	pb	-10,-60,0	;18
	pb	-30,-60,0	;20
	pb	-10,-72,0	;22
	pb	-10,-32,10	;24
	pb	10,-62,10	;26
	jump	.EB0
.A6A	Pointsb	8
	pb	20,0,-9	;0
	pb	20,-30,2	;1
	pb	-20,0,-41	;2
	pb	-20,-25,-21	;3
	pb	10,-44,29	;4
	pb	30,-44,29	;5
	pb	-10,-30,9	;6
	pb	-30,-30,9	;7
	PointsXb	10
	pb	15,-45,-20	;8
	pb	25,-45,-20	;10
	pb	10,-60,-20	;12
	pb	10,-70,-20	;14
	pb	-10,-40,0	;16
	pb	-10,-65,0	;18
	pb	-30,-65,0	;20
	pb	-10,-82,2	;22
	pb	-10,-40,10	;24
	pb	10,-70,10	;26
	jump	.EB0
.A7A	Pointsb	8
	pb	20,0,2	;0
	pb	20,-32,8	;1
	pb	-20,0,-47	;2
	pb	-20,-25,-27	;3
	pb	10,-50,32	;4
	pb	30,-50,32	;5
	pb	-10,-30,3	;6
	pb	-30,-30,3	;7
	PointsXb	10
	pb	15,-50,-23	;8
	pb	25,-50,-23	;10
	pb	10,-61,-20	;12
	pb	10,-71,-20	;14
	pb	-10,-41,0	;16
	pb	-10,-66,0	;18
	pb	-30,-66,0	;20
	pb	-10,-83,3	;22
	pb	-10,-41,10	;24
	pb	10,-71,10	;26
	jump	.EB0
.A8A	Pointsb	8
	pb	20,0,0	;0
	pb	20,-31,5	;1
	pb	-20,-16,-45	;2
	pb	-20,-37,-21	;3
	pb	10,-51,29	;4
	pb	30,-51,29	;5
	pb	-10,-37,9	;6
	pb	-30,-37,9	;7
	PointsXb	10
	pb	15,-52,-20	;8
	pb	25,-52,-20	;10
	pb	10,-67,-20	;12
	pb	10,-77,-20	;14
	pb	-10,-47,0	;16
	pb	-10,-72,0	;18
	pb	-30,-72,0	;20
	pb	-10,-87,0	;22
	pb	-10,-47,10	;24
	pb	10,-77,10	;26
	jump	.EB0
.A9A	Pointsb	8
	pb	20,0,-12	;0
	pb	20,-30,-2	;1
	pb	-20,-27,-42	;2
	pb	-20,-43,-15	;3
	pb	10,-45,25	;4
	pb	30,-45,25	;5
	pb	-10,-38,15	;6
	pb	-30,-38,15	;7
	PointsXb	10
	pb	15,-51,-20	;8
	pb	25,-51,-20	;10
	pb	10,-66,-20	;12
	pb	10,-76,-20	;14
	pb	-10,-46,0	;16
	pb	-10,-71,0	;18
	pb	-30,-71,0	;20
	pb	-10,-83,-2	;22
	pb	-10,-46,10	;24
	pb	10,-76,10	;26
	jump	.EB0
.A10A	Pointsb	8
	pb	20,0,-24	;0
	pb	20,-28,-9	;1
	pb	-20,-17,-34	;2
	pb	-20,-38,-10	;3
	pb	10,-38,20	;4
	pb	30,-38,20	;5
	pb	-10,-38,20	;6
	pb	-30,-38,20	;7
	PointsXb	10
	pb	15,-48,-20	;8
	pb	25,-48,-20	;10
	pb	10,-63,-20	;12
	pb	10,-73,-20	;14
	pb	-10,-43,0	;16
	pb	-10,-68,0	;18
	pb	-30,-68,0	;20
	pb	-10,-80,-3	;22
	pb	-10,-43,10	;24
	pb	10,-73,10	;26
	jump	.EB0
.A11A	Pointsb	8
	pb	20,0,-30	;0
	pb	20,-25,-10	;1
	pb	-20,0,-30	;2
	pb	-20,-25,-10	;3
	pb	10,-30,20	;4
	pb	30,-30,20	;5
	pb	-10,-30,20	;6
	pb	-30,-30,20	;7
	PointsXb	10
	pb	15,-35,-12	;8
	pb	25,-35,-12	;10
	pb	10,-55,-20	;12
	pb	10,-65,-20	;14
	pb	-10,-35,0	;16
	pb	-10,-60,0	;18
	pb	-30,-60,0	;20
	pb	-10,-75,0	;22
	pb	-10,-35,10	;24
	pb	10,-65,10	;26
.EB0

	EndPoints
walker_2_F
	Vizis	19
	Viz	0,4,5,0,-109,65	;0
	Viz	4,0,1,114,35,-44	;1
	Viz	1,0,5,-114,35,-44	;2
	Viz	5,4,1,0,125,-21	;3
	Viz	3,2,6,-114,19,-52	;4
	Viz	7,2,3,114,19,-52	;5
	Viz	3,6,7,0,113,-58	;6
	Viz	7,6,2,0,-83,96	;7
	Viz	19,21,10,0,-90,90	;12
	Viz	8,10,21,0,90,-90	;13
	Viz	9,11,20,0,-90,90	;14
	Viz	18,20,11,0,90,-90	;15
	Viz	25,24,27,0,0,127	;18
	Viz	26,27,15,0,127,0	;19
	Viz	14,12,17,-127,0,0	;20
	Viz	27,24,16,127,0,0	;21
	Viz	24,25,17,0,-127,0	;22
	Viz	13,16,17,0,-90,-90	;23
	Viz	12,14,15,0,0,-127	;24
	BSPInit	walker_2_EBSP
	BSP	0,walker_2_f1,.bsp2
	BSP	13,walker_2_f3,.bsp4
	BSP	14,walker_2_f5,.bsp6
	BSPE	walker_2_f7
.bsp6	BSPE	walker_2_f8
.bsp4	BSPE	walker_2_f9
.bsp2	BSPE	walker_2_f10

walker_2_f1	Faces
	Face3	12,0,0,-109,65,0,4,5
	FendQ
walker_2_f3	Faces
	Face4	20,13,0,127,0,26,27,15,14
	FendQ
walker_2_f5	Faces
	Face5	18,14,-127,0,0,14,12,17,25,26
	FendQ
walker_2_f7	Faces
	Face5	12,15,127,0,0,27,24,16,13,15
	Face4	14,10,0,-90,90,9,11,20,18
	Face4	20,11,0,90,-90,18,20,11,9
	Face4	16,12,0,0,127,25,24,27,26
	Face4	16,17,0,-90,-90,13,16,17,12
	Face2	25,-1,0,0,0,6,18
	Face2	25,-1,0,0,0,7,20
	Face4	14,16,0,-127,0,24,25,17,16
	Face4	44,18,0,0,-127,12,14,15,13
	FendQ
walker_2_f8	Faces
	Face4	14,8,0,-90,90,19,21,10,8
	Face2	23,-1,0,0,0,4,19
	Face2	27,-1,0,0,0,5,21
	Face4	20,9,0,90,-90,8,10,21,19
	FendQ
walker_2_f9	Faces
	Face2	44,-1,0,0,0,26,23
	Face2	43,-1,0,0,0,22,27
	FendQ
walker_2_f10	Faces
	Face3	14,1,114,35,-44,4,0,1
	Face3	18,4,-114,19,-52,3,2,6
	Face3	16,3,0,125,-21,5,4,1
	Face3	16,6,0,113,-58,3,6,7
	Face3	20,2,-114,35,-44,1,0,5
	Face3	12,5,114,19,-52,7,2,3
	Face3	14,7,0,-83,96,7,6,2
	FendQ
walker_2_EBSP
	EndShape

	endc


;--Shape file ----- C:\SHED\NSHAPES\volcano.txt ----
	ifne	DO_HDR

Svolcano
	ShapeHdr	volcano_P,0,volcano_F,0,-10,0,0,1,0,30,50,50,56,id_0_c,0,0,0,0,<Svolcano>
volcano
	ShapeHdr	volcano_P,0,volcano_F,0,-10,0,0,2,0,30,50,50,56,id_0_c,0,0,0,0,<volcano>
	elseif
volcano_P
	PointsXb	6
	pb	-50,0,0	;0
	pb	29,-20,0	;2
	pb	20,-50,0	;4
	pb	-10,-50,20	;6
	pb	14,-20,30	;8
	pb	-25,0,50	;10

	EndPoints
volcano_F
	Vizis	6
	Viz	7,4,2,-110,33,55	;0
	Viz	1,11,8,-83,87,41	;1
	Viz	8,9,6,0,40,120	;2
	Viz	9,8,11,0,90,90	;3
	Viz	9,3,5,110,33,55	;4
	Viz	3,9,10,83,87,41	;5

volcano_f1	Faces
	Face4	27,0,-110,33,55,7,4,2,8
	Face4	25,1,-83,87,41,1,11,8,2
	Face4	25,2,0,40,120,8,9,6,7
	Face4	23,3,0,90,90,9,8,11,10
	Face4	23,4,110,33,55,9,3,5,6
	Face4	21,5,83,87,41,3,9,10,0
	Fend
	EndShape

	endc


;--Shape file ----- C:\SHED\NSHAPES\b_holl.txt ----
	ifne	DO_HDR

b_holl
	ShapeHdr	b_holl_P,0,b_holl_F,0,0,0,0,3,0,20,20,0,20,id_0_c,0,0,0,0,<b_holl>
	elseif
b_holl_P
	Pointsb	2
	pb	0,20,0	;0
	pb	0,-20,0	;1
	PointsXb	3
	pb	14,14,0	;2
	pb	20,0,0	;4
	pb	14,-14,0	;6

	EndPoints
b_holl_F
	Vizis	1
	Viz	1,7,5,0,0,-127	;0

b_holl_f1	Faces
	Face8	10,0,0,0,-127,1,7,5,3,0,2,4,6
	Fend
	EndShape

	endc

			;--Shape file ----- C:\SHED\NSHAPES\c_miss.txt ----
	ifne	DO_HDR

c_miss
	ShapeHdr	c_miss_P,0,c_miss_F,0,0,0,0,1,0,43,50,55,60,id_0_c,0,0,0,0,<c_miss>
	elseif
c_miss_P
	Pointsb	6
	pb	0,0,-55	;0
	pb	0,-50,-5	;1
	pb	0,17,35	;2
	pb	0,-30,35	;3
	pb	0,40,45	;4
	pb	0,0,55	;5
	PointsXb	7
	pb	-43,25,-5	;6
	pb	10,12,25	;8
	pb	15,3,25	;10
	pb	-5,-15,25	;12
	pb	-26,15,35	;14
	pb	-15,-8,35	;16
	pb	-35,-20,45	;18

	EndPoints
c_miss_F
	Vizis	30
	Viz	10,7,15,-87,91,14	;0
	Viz	15,7,8,33,-122,16	;1
	Viz	5,10,15,-78,96,29	;2
	Viz	15,8,5,42,-115,32	;3
	Viz	7,10,8,72,40,-97	;4
	Viz	14,6,11,87,91,14	;5
	Viz	9,6,14,-33,-122,16	;6
	Viz	14,11,5,78,96,29	;7
	Viz	5,9,14,-42,-115,32	;8
	Viz	9,11,6,-72,40,-97	;9
	Viz	12,1,3,122,31,15	;10
	Viz	3,1,13,-122,31,15	;11
	Viz	5,12,3,122,20,30	;12
	Viz	3,13,5,-122,20,30	;13
	Viz	1,12,13,0,-83,-96	;14
	Viz	5,16,12,19,111,59	;15
	Viz	11,16,5,102,-51,56	;16
	Viz	13,17,5,-19,111,59	;17
	Viz	5,17,10,-102,-51,56	;18
	Viz	5,2,9,91,-67,57	;19
	Viz	8,2,5,-91,-67,57	;20
	Viz	0,16,11,123,20,-22	;21
	Viz	0,12,16,86,91,-22	;22
	Viz	10,17,0,-123,20,-22	;23
	Viz	17,13,0,-86,91,-22	;24
	Viz	0,9,2,37,-119,-23	;25
	Viz	2,8,0,-37,-119,-23	;26
	Viz	0,13,12,0,125,-23	;27
	Viz	0,11,9,109,-61,-23	;28
	Viz	8,10,0,-109,-61,-23	;29
	BSPInit	c_miss_EBSP
	BSP	16,c_miss_f1,.bsp2
	BSP	17,c_miss_f3,.bsp4
	BSPE	c_miss_f5
.bsp4	BSP	11,c_miss_f6,.bsp7
	BSPE	c_miss_f8
.bsp7	BSPE	c_miss_f9
.bsp2	BSP	5,c_miss_f10,.bsp11
	BSPE	c_miss_f12
.bsp11	BSPE	c_miss_f13

c_miss_f1	Faces
	Face3	30,16,102,-51,56,11,16,5
	FendQ
c_miss_f3	Faces
	Face3	34,17,-19,111,59,13,17,5
	FendQ
c_miss_f5	Faces
	Face3	32,18,-102,-51,56,5,17,10
	Face3	30,20,-91,-67,57,8,2,5
	Face3	43,0,-87,91,14,10,7,15
	Face3	43,1,33,-122,16,15,7,8
	Face3	16,2,-78,96,29,5,10,15
	Face3	20,3,42,-115,32,15,8,5
	Face3	43,4,72,40,-97,7,10,8
	Face3	16,23,-123,20,-22,10,17,0
	Face3	14,26,-37,-119,-23,2,8,0
	Face3	10,29,-109,-61,-23,8,10,0
	Face3	14,21,123,20,-22,0,16,11
	Face3	16,22,86,91,-22,0,12,16
	Face3	20,24,-86,91,-22,17,13,0
	Face3	12,25,37,-119,-23,0,9,2
	Face3	10,27,0,125,-23,0,13,12
	Face3	10,28,109,-61,-23,0,11,9
	FendQ
c_miss_f6	Faces
	Face3	43,11,-122,31,15,3,1,13
	FendQ
c_miss_f8	Faces
	Face3	32,15,19,111,59,5,16,12
	Face3	16,12,122,20,30,5,12,3
	Face3	43,14,0,-83,-96,1,12,13
	FendQ
c_miss_f9	Faces
	Face3	20,13,-122,20,30,3,13,5
	Face2	44,-1,0,0,0,19,17
	Face3	43,10,122,31,15,12,1,3
	FendQ
c_miss_f10	Faces
	Face3	43,5,87,91,14,14,6,11
	FendQ
c_miss_f12	Faces
	Face3	20,8,-42,-115,32,5,9,14
	Face3	28,19,91,-67,57,5,2,9
	Face3	43,6,-33,-122,16,9,6,14
	Face2	44,-1,0,0,0,4,2
	Face3	43,9,-72,40,-97,9,11,6
	FendQ
c_miss_f13	Faces
	Face3	16,7,78,96,29,14,11,5
	Face2	44,-1,0,0,0,16,18
	FendQ
c_miss_EBSP
	EndShape

	endc


;--Shape file ----- C:\SHED\NSHAPES\shieldr.txt ----
	ifne	DO_HDR

shieldr
	ShapeHdr	shieldr_P,0,shieldr_F,0,0,0,0,0,0,15,40,15,80,id_0_c,0,0,0,0,<shieldr>
	elseif
shieldr_P
	PointsXb	8
	pb	15,5,-10	;0
	pb	15,-5,-10	;2
	pb	-5,15,2	;4
	pb	-5,-15,5	;6
	pb	5,5,10	;8
	pb	-5,-5,10	;10
	pb	5,40,15	;12
	pb	-5,-40,15	;14

	EndPoints
shieldr_F
	Vizis	18
	Viz	8,9,10,0,0,127	;0
	Viz	6,7,11,0,57,114	;1
	Viz	6,10,3,111,28,55	;2
	Viz	1,9,4,107,-43,53	;3
	Viz	9,8,5,0,-79,99	;4
	Viz	3,10,9,114,0,57	;5
	Viz	2,11,7,-111,28,55	;6
	Viz	0,8,11,-114,0,57	;7
	Viz	5,8,0,-107,-43,53	;8
	Viz	14,15,7,0,-47,118	;9
	Viz	14,6,3,91,-33,82	;10
	Viz	2,7,15,-91,-33,82	;11
	Viz	4,5,12,0,59,113	;12
	Viz	12,5,0,-66,50,96	;13
	Viz	1,4,13,66,50,96	;14
	Viz	3,2,15,0,74,-103	;15
	Viz	13,12,0,0,-74,-103	;16
	Viz	1,0,2,0,0,-127	;17

shieldr_f1	Faces
	Face4	43,0,0,0,127,8,9,10,11
	Face4	10,1,0,57,114,6,7,11,10
	Face3	25,2,111,28,55,6,10,3
	Face3	21,3,107,-43,53,1,9,4
	Face4	10,4,0,-79,99,9,8,5,4
	Face3	27,6,-111,28,55,2,11,7
	Face3	23,8,-107,-43,53,5,8,0
	Face4	7,9,0,-47,118,14,15,7,6
	Face3	14,10,91,-33,82,14,6,3
	Face3	18,11,-91,-33,82,2,7,15
	Face4	7,12,0,59,113,4,5,12,13
	Face3	20,13,-66,50,96,12,5,0
	Face3	16,14,66,50,96,1,4,13
	Face4	23,5,114,0,57,3,10,9,1
	Face4	25,7,-114,0,57,0,8,11,2
	Face4	20,15,0,74,-103,3,2,15,14
	Face4	16,16,0,-74,-103,13,12,0,1
	Face4	18,17,0,0,-127,1,0,2,3
	Fend
	EndShape

	endc


;--Shape file ----- C:\SHED\NSHAPES\zaco_b.txt ----
	ifne	DO_HDR

zaco_b
	ShapeHdr	zaco_b_P,0,zaco_b_F,0,0,0,0,0,playerB_col,70,53,49,86,id_0_c,0,0,0,0,<zaco_b>
	elseif
zaco_b_P
	Pointsb	4
	pb	0,-30,-10	;0
	pb	0,-5,15	;1
	pb	0,11,17	;2
	pb	0,53,25	;3
	PointsXb	6
	pb	-70,-6,-49	;4
	pb	-40,0,-14	;6
	pb	30,14,0	;8
	pb	7,0,0	;10
	pb	25,0,0	;12
	pb	-40,49,8	;14

	EndPoints
zaco_b_F
	Vizis	24
	Viz	10,11,1,0,-120,40	;0
	Viz	1,11,0,114,40,40	;1
	Viz	11,2,3,115,10,54	;2
	Viz	3,0,11,-42,-47,-110	;3
	Viz	10,2,11,0,107,69	;4
	Viz	0,10,1,-114,40,40	;5
	Viz	3,2,10,-115,10,54	;6
	Viz	10,0,3,42,-47,-110	;7
	Viz	14,9,11,20,33,121	;8
	Viz	11,9,14,-20,-33,-121	;9
	Viz	11,6,4,14,122,33	;10
	Viz	4,6,11,-14,-122,-33	;11
	Viz	13,11,9,0,0,127	;12
	Viz	9,6,13,84,30,90	;13
	Viz	13,6,11,0,127,0	;14
	Viz	6,9,11,-42,-69,-98	;15
	Viz	8,10,12,0,0,127	;16
	Viz	12,7,8,-84,30,90	;17
	Viz	10,7,12,0,127,0	;18
	Viz	10,8,7,42,-69,-98	;19
	Viz	10,8,15,-20,33,121	;20
	Viz	15,8,10,20,-33,-121	;21
	Viz	5,7,10,-14,122,33	;22
	Viz	10,7,5,14,-122,-33	;23
	BSPInit	zaco_b_EBSP
	BSP	1,zaco_b_f1,.bsp2
	BSP	5,zaco_b_f3,.bsp4
	BSPE	zaco_b_f5
.bsp4	BSP	16,zaco_b_f6,.bsp7
	BSP	23,zaco_b_f8,.bsp9
	BSPEND
.bsp9	BSPE	zaco_b_f10
.bsp7	BSPE	zaco_b_f11
.bsp2	BSP	9,zaco_b_f12,.bsp13
	BSPEND
.bsp13	BSP	11,zaco_b_f14,.bsp15
	BSPEND
.bsp15	BSPE	zaco_b_f16

zaco_b_f1	Faces
	Face3	16,1,114,40,40,1,11,0
	FendQ
zaco_b_f3	Faces
	Face3	20,5,-114,40,40,0,10,1
	FendQ
zaco_b_f5	Faces
	Face3	44,0,0,-120,40,10,11,1
	Face3	12,3,-42,-47,-110,3,0,11
	Face3	27,4,0,107,69,10,2,11
	Face3	14,7,42,-47,-110,10,0,3
	Face3	23,2,115,10,54,11,2,3
	Face3	25,6,-115,10,54,3,2,10
	FendQ
zaco_b_f6	Faces
	Face3	20,16,0,0,127,8,10,12
	FendQ
zaco_b_f8	Faces
	Face3	43,23,14,-122,-33,10,7,5
	FendQ
zaco_b_f10	Faces
	Face3	16,18,0,127,0,10,7,12
	Face3	45,19,42,-69,-98,10,8,7
	Face3	18,17,-84,30,90,12,7,8
	Face3	23,22,-14,122,33,5,7,10
	FendQ
zaco_b_f11	Faces
	Face3	27,20,-20,33,121,10,8,15
	Face3	43,21,20,-33,-121,15,8,10
	FendQ
zaco_b_f12	Faces
	Face3	43,9,-20,-33,-121,11,9,14
	FendQ
zaco_b_f14	Faces
	Face3	43,11,-14,-122,-33,4,6,11
	FendQ
zaco_b_f16	Faces
	Face3	18,12,0,0,127,13,11,9
	Face3	16,14,0,127,0,13,6,11
	Face3	45,15,-42,-69,-98,6,9,11
	Face3	14,13,84,30,90,9,6,13
	Face3	25,8,20,33,121,14,9,11
	Face3	21,10,14,122,33,11,6,4
	FendQ
zaco_b_EBSP
	EndShape

	endc

;--Shape file ----- C:\SHED\NSHAPES\zaco_a.txt ----
	ifne	DO_HDR

zaco_a
	ShapeHdr	zaco_a_P,0,zaco_a_F,0,0,0,0,1,playerB_col,36,37,30,58,id_0_c,0,0,0,0,<zaco_a>
	elseif
zaco_a_P
	Pointsb	2
	pb	0,-20,10	;0
	pb	0,16,15	;1
	PointsXb	10
	pb	-20,20,-30	;2
	pb	-36,-37,-26	;4
	pb	-16,5,-19	;6
	pb	-28,-4,-18	;8
	pb	-30,-11,-6	;10
	pb	34,-20,-4	;12
	pb	-13,-25,-3	;14
	pb	25,-18,-1	;16
	pb	-10,0,0	;18
	pb	5,-5,5	;20

	EndPoints
zaco_a_F
	Vizis	27
	Viz	10,13,17,46,-45,109	;0
	Viz	18,17,14,-11,16,125	;1
	Viz	17,13,4,4,100,78	;2
	Viz	14,17,4,37,88,83	;3
	Viz	4,13,10,116,-46,-25	;4
	Viz	4,10,8,123,-31,-3	;5
	Viz	8,10,18,67,-98,46	;6
	Viz	18,14,4,-90,0,-90	;7
	Viz	19,16,12,-45,-31,115	;8
	Viz	15,16,19,11,16,125	;9
	Viz	5,12,16,-4,100,78	;10
	Viz	5,16,15,-37,88,83	;11
	Viz	11,12,5,-116,-46,-25	;12
	Viz	9,11,5,-123,-31,-3	;13
	Viz	19,11,9,-67,-98,46	;14
	Viz	9,5,15,90,0,-90	;15
	Viz	18,19,20,0,90,-90	;16
	Viz	0,21,20,0,40,-120	;17
	Viz	1,21,0,103,10,73	;18
	Viz	1,18,21,97,16,81	;19
	Viz	0,20,1,-103,10,73	;20
	Viz	20,19,1,-97,16,81	;21
	Viz	19,18,1,0,-87,-93	;22
	Viz	6,2,18,-121,-5,-37	;23
	Viz	18,2,6,121,5,37	;24
	Viz	19,3,7,121,-5,-37	;25
	Viz	7,3,19,-121,5,37	;26
	BSPInit	zaco_a_EBSP
	BSP	18,zaco_a_f1,.bsp2
	BSP	9,zaco_a_f3,.bsp4
	BSP	14,zaco_a_f5,.bsp6
	BSP	15,zaco_a_f7,.bsp8
	BSPE	zaco_a_f9
.bsp8	BSPE	zaco_a_f10
.bsp6	BSPE	zaco_a_f11
.bsp4	BSPE	zaco_a_f12
.bsp2	BSP	1,zaco_a_f13,.bsp14
	BSPE	zaco_a_f15
.bsp14	BSPE	zaco_a_f16

zaco_a_f1	Faces
	Face3	16,18,103,10,73,1,21,0
	FendQ
zaco_a_f3	Faces
	Face3	20,9,11,16,125,15,16,19
	FendQ
zaco_a_f5	Faces
	Face3	16,14,-67,-98,46,19,11,9
	FendQ
zaco_a_f7	Faces
	Face4	43,15,90,0,-90,9,5,15,19
	FendQ
zaco_a_f9	Faces
	Face3	14,12,-116,-46,-25,11,12,5
	Face3	18,10,-4,100,78,5,12,16
	Face3	30,13,-123,-31,-3,9,11,5
	FendQ
zaco_a_f10	Faces
	Face3	0,23,-121,-5,-37,6,2,18
	Face3	0,24,121,5,37,18,2,6
	Face3	34,11,-37,88,83,5,16,15
	FendQ
zaco_a_f11	Faces
	Face3	0,25,121,-5,-37,19,3,7
	Face3	0,26,-121,5,37,7,3,19
	FendQ
zaco_a_f12	Faces
	Face4	30,16,0,90,-90,18,19,20,21
	Face4	43,8,-45,-31,115,19,16,12,11
	Face3	0,17,0,40,-120,0,21,20
	Face3	32,21,-97,16,81,20,19,1
	Face3	28,22,0,-87,-93,19,18,1
	FendQ
zaco_a_f13	Faces
	Face3	18,1,-11,16,125,18,17,14
	FendQ
zaco_a_f15	Faces
	Face3	16,2,4,100,78,17,13,4
	Face3	12,4,116,-46,-25,4,13,10
	Face3	32,3,37,88,83,14,17,4
	Face3	28,5,123,-31,-3,4,10,8
	Face3	14,6,67,-98,46,8,10,18
	Face4	43,7,-90,0,-90,18,14,4,8
	FendQ
zaco_a_f16	Faces
	Face4	43,0,46,-45,109,10,13,17,18
	Face3	30,19,97,16,81,1,18,21
	Face3	20,20,-103,10,73,0,20,1
	FendQ
zaco_a_EBSP
	EndShape

	endc
;--Shape file ----- C:\SHED\NSHAPES\ray_0.anm ----
	ifne	DO_HDR

ray_0
	ShapeHdr	ray_0_P,0,ray_0_F,0,0,0,0,0,0,50,25,120,120,id_0_c,0,0,0,0,<ray_0>
ray_blue
	ShapeHdr	ray_0_P,0,ray_0_F,0,0,0,0,0,0,50,25,120,120,id_1_c,0,0,0,0,<ray_blue>
ray_0p
	ShapeHdr	ray_0_P,0,ray_0_F,0,0,0,0,0,playerb_col,50,25,120,120,id_0_c,0,0,0,0,<ray_0>
ray_bluep
	ShapeHdr	ray_0_P,0,ray_0_F,0,0,0,0,0,playerb_col,50,25,120,120,id_1_c,0,0,0,0,<ray_blue>
	elseif
ray_0_P
	Pointsb	4
	pb	0,0,-20	;0
	pb	0,5,0	;1
	pb	0,-5,25	;2
	pb	0,0,40	;3
	PointsXb	1
	pb	-10,0,20	;4
	Frames	12
	jumptab	.A0A
	jumptab	.A1A
	jumptab	.A2A
	jumptab	.A3A
	jumptab	.A4A
	jumptab	.A5A
	jumptab	.A6A
	jumptab	.A7A
	jumptab	.A8A
	jumptab	.A9A
	jumptab	.A10A
	jumptab	.A11A
.A0A	Pointsb	6
	pb	0,0,-120	;6
	pb	0,-5,-40	;7
	pb	-25,0,-30	;8
	pb	25,0,-30	;9
	pb	-32,0,20	;10
	pb	32,0,20	;11
	PointsXb	2
	pb	-5,0,-40	;12
	pb	-43,25,-10	;14
	jump	.EB0
.A1A	Pointsb	6
	pb	0,1,-120	;6
	pb	0,-7,-39	;7
	pb	-25,4,-30	;8
	pb	25,4,-30	;9
	pb	-32,-6,20	;10
	pb	31,-6,20	;11
	PointsXb	2
	pb	-5,-2,-40	;12
	pb	-47,17,-10	;14
	jump	.EB0
.A2A	Pointsb	6
	pb	0,2,-120	;6
	pb	0,-8,-39	;7
	pb	-23,8,-30	;8
	pb	23,8,-30	;9
	pb	-30,-11,20	;10
	pb	30,-11,20	;11
	PointsXb	2
	pb	-5,-3,-40	;12
	pb	-49,9,-10	;14
	jump	.EB0
.A3A	Pointsb	6
	pb	0,3,-119	;6
	pb	0,-10,-38	;7
	pb	-22,12,-30	;8
	pb	22,12,-30	;9
	pb	-28,-16,20	;10
	pb	28,-16,20	;11
	PointsXb	2
	pb	-5,-5,-39	;12
	pb	-50,0,-10	;14
	jump	.EB0
.A4A	Pointsb	6
	pb	0,2,-120	;6
	pb	0,-8,-39	;7
	pb	-23,8,-30	;8
	pb	23,8,-30	;9
	pb	-30,-11,20	;10
	pb	30,-11,20	;11
	PointsXb	2
	pb	-5,-3,-40	;12
	pb	-49,-9,-10	;14
	jump	.EB0
.A5A	Pointsb	6
	pb	0,1,-120	;6
	pb	0,-7,-39	;7
	pb	-25,4,-30	;8
	pb	25,4,-30	;9
	pb	-32,-6,20	;10
	pb	31,-6,20	;11
	PointsXb	2
	pb	-5,-2,-40	;12
	pb	-47,-17,-10	;14
	jump	.EB0
.A6A	Pointsb	6
	pb	0,0,-120	;6
	pb	0,-5,-40	;7
	pb	-25,0,-30	;8
	pb	25,0,-30	;9
	pb	-32,0,20	;10
	pb	32,0,20	;11
	PointsXb	2
	pb	-5,0,-40	;12
	pb	-43,-25,-10	;14
	jump	.EB0
.A7A	Pointsb	6
	pb	0,-1,-120	;6
	pb	0,-3,-40	;7
	pb	-25,-4,-30	;8
	pb	25,-4,-30	;9
	pb	-32,5,20	;10
	pb	31,5,20	;11
	PointsXb	2
	pb	-5,2,-40	;12
	pb	-47,-17,-10	;14
	jump	.EB0
.A8A	Pointsb	6
	pb	0,-2,-120	;6
	pb	0,-1,-41	;7
	pb	-23,-8,-30	;8
	pb	23,-8,-30	;9
	pb	-30,11,20	;10
	pb	30,11,20	;11
	PointsXb	2
	pb	-5,3,-40	;12
	pb	-49,-9,-10	;14
	jump	.EB0
.A9A	Pointsb	6
	pb	0,-3,-119	;6
	pb	0,0,-41	;7
	pb	-22,-12,-30	;8
	pb	22,-13,-30	;9
	pb	-28,16,20	;10
	pb	28,16,20	;11
	PointsXb	2
	pb	-5,5,-39	;12
	pb	-50,0,-10	;14
	jump	.EB0
.A10A	Pointsb	6
	pb	0,-2,-120	;6
	pb	0,-1,-41	;7
	pb	-23,-8,-30	;8
	pb	23,-8,-30	;9
	pb	-30,11,20	;10
	pb	30,11,20	;11
	PointsXb	2
	pb	-5,3,-40	;12
	pb	-49,9,-10	;14
	jump	.EB0
.A11A	Pointsb	6
	pb	0,-1,-120	;6
	pb	0,-3,-40	;7
	pb	-25,-4,-30	;8
	pb	25,-4,-30	;9
	pb	-32,5,20	;10
	pb	31,5,20	;11
	PointsXb	2
	pb	-5,2,-40	;12
	pb	-47,17,-10	;14
.EB0

	EndPoints
ray_0_F
	Vizis	30
	Viz	1,5,0,-88,-88,-22	;0
	Viz	0,4,1,88,-88,-22	;1
	Viz	6,12,13,0,-126,-13	;2
	Viz	6,13,7,-89,90,3	;3
	Viz	7,12,6,89,90,3	;4
	Viz	13,12,0,0,-123,32	;5
	Viz	7,13,0,-90,90,0	;6
	Viz	0,12,7,90,90,0	;7
	Viz	9,15,5,-28,118,37	;8
	Viz	5,15,9,28,-118,-37	;9
	Viz	0,5,9,-59,-111,-15	;10
	Viz	9,5,0,59,111,15	;11
	Viz	15,11,5,-63,71,84	;12
	Viz	5,11,15,63,-71,-84	;13
	Viz	11,3,5,-80,90,40	;14
	Viz	5,3,11,80,-90,-40	;15
	Viz	4,14,8,26,119,35	;16
	Viz	8,14,4,-26,-119,-35	;17
	Viz	8,4,0,56,-113,-14	;18
	Viz	0,4,8,-56,113,14	;19
	Viz	4,10,14,63,71,84	;20
	Viz	14,10,4,-63,-71,-84	;21
	Viz	4,3,10,80,90,40	;22
	Viz	10,3,4,-80,-90,-40	;23
	Viz	3,5,1,-31,-122,15	;24
	Viz	0,5,2,-51,115,-13	;25
	Viz	2,4,0,51,115,-13	;26
	Viz	1,4,3,31,-122,15	;27
	Viz	2,5,3,-68,102,34	;28
	Viz	3,4,2,68,102,34	;29
	BSPInit	ray_0_EBSP
	BSP	3,ray_0_f1,.bsp2
	BSP	20,ray_0_f3,.bsp4
	BSPE	ray_0_f5
.bsp4	BSPE	ray_0_f6
.bsp2	BSP	1,ray_0_f7,.bsp8
	BSP	9,ray_0_f9,.bsp10
	BSPEND
.bsp10	BSP	14,ray_0_f11,.bsp12
	BSPE	ray_0_f13
.bsp12	BSP	15,ray_0_f14,.bsp15
	BSPEND
.bsp15	BSPE	ray_0_f16
.bsp8	BSP	0,ray_0_f17,.bsp18
	BSPE	ray_0_f19
.bsp18	BSPE	ray_0_f20

ray_0_f1	Faces
	Face3	25,3,-89,90,3,6,13,7
	FendQ
ray_0_f3	Faces
	Face3	25,20,63,71,84,4,10,14
	FendQ
ray_0_f5	Faces
	Face3	27,16,26,119,35,4,14,8
	Face3	21,17,-26,-119,-35,8,14,4
	FendQ
ray_0_f6	Faces
	Face3	27,22,80,90,40,4,3,10
	Face3	21,23,-80,-90,-40,10,3,4
	Face3	21,21,-63,-71,-84,14,10,4
	FendQ
ray_0_f7	Faces
	Face3	21,1,88,-88,-22,0,4,1
	FendQ
ray_0_f9	Faces
	Face3	21,9,28,-118,-37,5,15,9
	FendQ
ray_0_f11	Faces
	Face3	27,14,-80,90,40,11,3,5
	FendQ
ray_0_f13	Faces
	Face3	25,25,-51,115,-13,0,5,2
	Face3	25,11,59,111,15,9,5,0
	Face3	21,10,-59,-111,-15,0,5,9
	FendQ
ray_0_f14	Faces
	Face3	21,15,80,-90,-40,5,3,11
	FendQ
ray_0_f16	Faces
	Face3	27,28,-68,102,34,2,5,3
	Face3	25,12,-63,71,84,15,11,5
	Face3	21,13,63,-71,-84,5,11,15
	Face3	25,24,-31,-122,15,3,5,1
	Face3	27,8,-28,118,37,9,15,5
	Face3	25,29,68,102,34,3,4,2
	FendQ
ray_0_f17	Faces
	Face3	23,0,-88,-88,-22,1,5,0
	FendQ
ray_0_f19	Faces
	Face3	25,19,-56,113,14,0,4,8
	Face3	23,26,51,115,-13,2,4,0
	Face3	21,18,56,-113,-14,8,4,0
	Face3	23,27,31,-122,15,1,4,3
	FendQ
ray_0_f20	Faces
	Face3	21,2,0,-126,-13,6,12,13
	Face3	23,4,89,90,3,7,12,6
	Face3	21,5,0,-123,32,13,12,0
	Face3	27,6,-90,90,0,7,13,0
	Face3	25,7,90,90,0,0,12,7
	FendQ
ray_0_EBSP
	EndShape

	endc


;--Shape file ----- C:\SHED\NSHAPES\ray_1.anm ----
	ifne	DO_HDR

ray_1	ShapeHdr	ray_1_P,0,ray_1_F,0,0,0,0,0,0,110,23,102,111,id_0_c,0,0,0,0,<ray_1>
ray_bred	ShapeHdr	ray_1_P,0,ray_1_F,0,0,0,0,0,0,110,23,102,111,id_1_c,0,0,0,0,<ray_bred>
ray_bredp	ShapeHdr	ray_1_P,0,ray_1_F,0,0,0,0,0,playerB_col,110,23,102,111,id_1_c,0,0,0,0,<ray_bred>
	elseif
ray_1_P
	Pointsb	6
	pb	0,0,-102	;0
	pb	0,0,-50	;1
	pb	0,-5,-10	;2
	pb	0,0,30	;3
	pb	0,3,60	;4
	pb	0,-7,60	;5
	PointsXb	5
	pb	-5,0,-10	;6
	pb	-10,0,60	;8
	pb	3,0,88	;10
	pb	7,-1,95	;12
	pb	-7,0,102	;14
	Frames	16
	jumptab	.A0A
	jumptab	.A1A
	jumptab	.A2A
	jumptab	.A3A
	jumptab	.A4A
	jumptab	.A5A
	jumptab	.A6A
	jumptab	.A7A
	jumptab	.A8A
	jumptab	.A9A
	jumptab	.A10A
	jumptab	.A11A
	jumptab	.A12A
	jumptab	.A13A
	jumptab	.A14A
	jumptab	.A15A
.A0A	Pointsb	4
	pb	-10,-1,-2	;16
	pb	10,-1,-2	;17
	pb	79,8,27	;18
	pb	-79,8,28	;19
	PointsXb	4
	pb	107,-23,-10	;20
	pb	-60,-3,8	;22
	pb	49,8,50	;24
	pb	20,0,70	;26
	jump	.EB0
.A1A	Pointsb	4
	pb	-10,0,-2	;16
	pb	10,0,-2	;17
	pb	79,12,27	;18
	pb	-79,12,28	;19
	PointsXb	4
	pb	108,-17,-10	;20
	pb	-60,0,8	;22
	pb	50,5,50	;24
	pb	20,-2,70	;26
	jump	.EB0
.A2A	Pointsb	4
	pb	-10,1,-2	;16
	pb	10,1,-2	;17
	pb	78,17,27	;18
	pb	-78,17,28	;19
	PointsXb	4
	pb	109,-11,-10	;20
	pb	-60,3,8	;22
	pb	50,3,50	;24
	pb	20,-3,70	;26
	jump	.EB0
.A3A	Pointsb	4
	pb	-10,2,-2	;16
	pb	10,2,-2	;17
	pb	79,12,27	;18
	pb	-79,12,28	;19
	PointsXb	4
	pb	110,-6,-10	;20
	pb	-60,6,8	;22
	pb	50,0,50	;24
	pb	19,-5,70	;26
	jump	.EB0
.A4A	Pointsb	4
	pb	-10,3,-2	;16
	pb	9,3,-2	;17
	pb	79,8,27	;18
	pb	-79,8,28	;19
	PointsXb	4
	pb	110,0,-10	;20
	pb	-59,9,8	;22
	pb	50,-3,50	;24
	pb	19,-7,70	;26
	jump	.EB0
.A5A	Pointsb	4
	pb	-9,3,-2	;16
	pb	9,3,-2	;17
	pb	80,4,27	;18
	pb	-80,4,28	;19
	PointsXb	4
	pb	110,6,-10	;20
	pb	-59,12,8	;22
	pb	50,-5,50	;24
	pb	19,-5,70	;26
	jump	.EB0
.A6A	Pointsb	4
	pb	-10,3,-2	;16
	pb	9,3,-2	;17
	pb	80,0,27	;18
	pb	-80,0,28	;19
	PointsXb	4
	pb	109,11,-10	;20
	pb	-59,9,8	;22
	pb	49,-8,50	;24
	pb	20,-3,70	;26
	jump	.EB0
.A7A	Pointsb	4
	pb	-10,2,-2	;16
	pb	10,2,-2	;17
	pb	80,-4,27	;18
	pb	-80,-4,28	;19
	PointsXb	4
	pb	108,17,-10	;20
	pb	-60,6,8	;22
	pb	49,-10,50	;24
	pb	20,-2,70	;26
	jump	.EB0
.A8A	Pointsb	4
	pb	-10,1,-2	;16
	pb	10,1,-2	;17
	pb	79,-8,27	;18
	pb	-79,-8,28	;19
	PointsXb	4
	pb	107,23,-10	;20
	pb	-60,3,8	;22
	pb	49,-8,50	;24
	pb	20,0,70	;26
	jump	.EB0
.A9A	Pointsb	4
	pb	-10,0,-2	;16
	pb	10,0,-2	;17
	pb	79,-13,27	;18
	pb	-79,-13,28	;19
	PointsXb	4
	pb	108,17,-10	;20
	pb	-60,0,8	;22
	pb	50,-5,50	;24
	pb	20,2,70	;26
	jump	.EB0
.A10A	Pointsb	4
	pb	-10,-1,-2	;16
	pb	10,-1,-2	;17
	pb	78,-17,27	;18
	pb	-78,-17,28	;19
	PointsXb	4
	pb	109,11,-10	;20
	pb	-60,-3,8	;22
	pb	50,-3,50	;24
	pb	20,3,70	;26
	jump	.EB0
.A11A	Pointsb	4
	pb	-10,-2,-2	;16
	pb	10,-2,-2	;17
	pb	79,-13,27	;18
	pb	-79,-13,28	;19
	PointsXb	4
	pb	110,6,-10	;20
	pb	-60,-6,8	;22
	pb	50,0,50	;24
	pb	19,5,70	;26
	jump	.EB0
.A12A	Pointsb	4
	pb	-10,-3,-2	;16
	pb	10,-3,-2	;17
	pb	79,-8,27	;18
	pb	-79,-8,28	;19
	PointsXb	4
	pb	110,0,-10	;20
	pb	-59,-9,8	;22
	pb	50,3,50	;24
	pb	19,7,70	;26
	jump	.EB0
.A13A	Pointsb	4
	pb	-9,-3,-2	;16
	pb	10,-3,-2	;17
	pb	80,-4,27	;18
	pb	-80,-4,28	;19
	PointsXb	4
	pb	110,-6,-10	;20
	pb	-59,-12,8	;22
	pb	50,5,50	;24
	pb	19,5,70	;26
	jump	.EB0
.A14A	Pointsb	4
	pb	-10,-3,-2	;16
	pb	10,-3,-2	;17
	pb	80,0,27	;18
	pb	-80,0,28	;19
	PointsXb	4
	pb	109,-11,-10	;20
	pb	-59,-9,8	;22
	pb	49,8,50	;24
	pb	20,3,70	;26
	jump	.EB0
.A15A	Pointsb	4
	pb	-10,-2,-2	;16
	pb	10,-2,-2	;17
	pb	80,4,27	;18
	pb	-80,4,28	;19
	PointsXb	4
	pb	108,-17,-10	;20
	pb	-60,-6,8	;22
	pb	49,10,50	;24
	pb	20,2,70	;26
.EB0

	EndPoints
ray_1_F
	Vizis	48
	Viz	6,7,1,0,-127,0	;1
	Viz	2,1,7,-89,89,-11	;2
	Viz	6,1,2,89,89,-11	;3
	Viz	3,7,6,0,-127,0	;4
	Viz	7,3,2,-89,89,11	;5
	Viz	2,3,6,89,89,11	;6
	Viz	8,25,3,24,125,-8	;7
	Viz	3,25,8,-24,-125,8	;8
	Viz	22,19,21,-16,103,72	;9
	Viz	21,19,22,16,-103,-72	;10
	Viz	25,22,19,-28,-118,-38	;11
	Viz	19,22,25,28,118,38	;12
	Viz	22,3,25,6,122,34	;13
	Viz	25,3,22,-6,-122,-34	;14
	Viz	3,22,16,-6,127,2	;15
	Viz	16,22,3,6,-127,-2	;16
	Viz	8,27,25,20,124,-20	;17
	Viz	25,27,8,-20,-124,20	;18
	Viz	27,8,11,0,127,0	;19
	Viz	11,8,27,0,-127,0	;20
	Viz	20,18,23,15,102,74	;21
	Viz	23,18,20,-15,-102,-74	;22
	Viz	18,23,24,29,-117,-38	;23
	Viz	24,23,18,-29,117,38	;24
	Viz	24,3,23,-6,122,34	;25
	Viz	23,3,24,6,-122,-34	;26
	Viz	3,24,9,-24,125,-8	;27
	Viz	9,24,3,24,-125,8	;28
	Viz	24,26,9,-20,124,-20	;29
	Viz	9,26,24,20,-124,20	;30
	Viz	10,9,26,0,127,0	;31
	Viz	26,9,10,0,-127,0	;32
	Viz	11,13,14,56,-113,-16	;33
	Viz	14,13,11,-56,113,16	;34
	Viz	15,12,10,-56,-113,-16	;35
	Viz	10,12,15,56,113,16	;36
	Viz	9,3,4,-36,-121,-12	;37
	Viz	4,3,8,36,-121,-12	;38
	Viz	17,23,3,6,127,2	;39
	Viz	4,10,9,-36,-121,9	;40
	Viz	8,11,4,36,-121,9	;41
	Viz	4,11,10,0,-126,14	;42
	Viz	5,3,9,-72,102,-24	;43
	Viz	8,3,5,72,102,-24	;44
	Viz	3,23,17,-6,-127,-2	;45
	Viz	9,10,5,-72,103,18	;46
	Viz	5,11,8,72,103,18	;47
	Viz	10,11,5,0,123,31	;48
	BSPInit	ray_1_EBSP
	BSP	4,ray_1_f1,.bsp2
	BSP	8,ray_1_f3,.bsp4
	BSPE	ray_1_f5
.bsp4	BSP	10,ray_1_f6,.bsp7
	BSPE	ray_1_f8
.bsp7	BSP	11,ray_1_f9,.bsp10
	BSPE	ray_1_f11
.bsp10	BSPE	ray_1_f12
.bsp2	BSP	5,ray_1_f13,.bsp14
	BSP	22,ray_1_f15,.bsp16
	BSPE	ray_1_f17
.bsp16	BSP	23,ray_1_f18,.bsp19
	BSPE	ray_1_f20
.bsp19	BSPE	ray_1_f21
.bsp14	BSP	18,ray_1_f22,.bsp23
	BSPEND
.bsp23	BSP	30,ray_1_f24,.bsp25
	BSPEND
.bsp25	BSP	32,ray_1_f26,.bsp27
	BSPEND
.bsp27	BSP	34,ray_1_f28,.bsp29
	BSPEND
.bsp29	BSPE	ray_1_f30

ray_1_f1	Faces
	Face3	25,4,-89,89,11,7,3,2
	FendQ
ray_1_f3	Faces
	Face3	28,8,-16,103,72,22,19,21
	FendQ
ray_1_f5	Faces
	Face2	23,-1,0,0,0,1,0
	FendQ
ray_1_f6	Faces
	Face3	12,10,-28,-118,-38,25,22,19
	FendQ
ray_1_f8	Faces
	Face3	12,9,16,-103,-72,21,19,22
	FendQ
ray_1_f9	Faces
	Face3	28,11,28,118,38,19,22,25
	FendQ
ray_1_f11	Faces
	Face3	28,14,-6,127,2,3,22,16
	Face3	12,15,6,-127,-2,16,22,3
	FendQ
ray_1_f12	Faces
	Face3	28,6,24,125,-8,8,25,3
	Face3	28,12,6,122,34,22,3,25
	Face3	30,16,20,124,-20,8,27,25
	Face3	12,7,-24,-125,8,3,25,8
	Face3	12,13,-6,-122,-34,25,3,22
	Face3	14,17,-20,-124,20,25,27,8
	FendQ
ray_1_f13	Faces
	Face3	27,5,89,89,11,2,3,6
	FendQ
ray_1_f15	Faces
	Face3	12,22,29,-117,-38,18,23,24
	FendQ
ray_1_f17	Faces
	Face3	28,20,15,102,74,20,18,23
	Face3	12,21,-15,-102,-74,23,18,20
	FendQ
ray_1_f18	Faces
	Face3	28,23,-29,117,38,24,23,18
	FendQ
ray_1_f20	Faces
	Face3	28,38,6,127,2,17,23,3
	Face3	12,44,-6,-127,-2,3,23,17
	FendQ
ray_1_f21	Faces
	Face3	28,24,-6,122,34,24,3,23
	Face3	28,26,-24,125,-8,3,24,9
	Face3	30,28,-20,124,-20,24,26,9
	Face3	12,25,6,-122,-34,23,3,24
	Face3	12,27,24,-125,8,9,24,3
	Face3	14,29,20,-124,20,9,26,24
	FendQ
ray_1_f22	Faces
	Face3	30,18,0,127,0,27,8,11
	FendQ
ray_1_f24	Faces
	Face3	30,30,0,127,0,10,9,26
	FendQ
ray_1_f26	Faces
	Face3	44,32,56,-113,-16,11,13,14
	FendQ
ray_1_f28	Faces
	Face3	44,34,-56,-113,-16,15,12,10
	FendQ
ray_1_f30	Faces
	Face3	44,33,-56,113,16,14,13,11
	Face3	44,35,56,113,16,10,12,15
	Face3	14,36,-36,-121,-12,9,3,4
	Face3	14,37,36,-121,-12,4,3,8
	Face3	21,42,-72,102,-24,5,3,9
	Face3	23,43,72,102,-24,8,3,5
	Face3	25,45,-72,103,18,9,10,5
	Face3	25,46,72,103,18,5,11,8
	Face3	14,39,-36,-121,9,4,10,9
	Face3	14,40,36,-121,9,8,11,4
	Face3	16,41,0,-126,14,4,11,10
	Face3	27,47,0,123,31,10,11,5
	Face3	14,0,0,-127,0,6,7,1
	Face3	23,1,-89,89,-11,2,1,7
	Face3	25,2,89,89,-11,6,1,2
	Face3	12,3,0,-127,0,3,7,6
	Face3	14,19,0,-127,0,11,8,27
	Face3	14,31,0,-127,0,26,9,10
	FendQ
ray_1_EBSP
	EndShape

	endc


;--Shape file ----- C:\SHED\NSHAPES\clisla_l.txt ----
	ifne	DO_HDR

clisla_l
	ShapeHdr	clisla_l_P,0,clisla_l_F,0,0,0,0,2,0,47,51,15,71,id_0_c,0,0,0,0,<clisla_l>
	elseif
clisla_l_P
	Pointsb	9
	pb	-38,0,-15	;0
	pb	46,0,-15	;1
	pb	-47,-9,-15	;2
	pb	-5,-51,-15	;3
	pb	-47,-51,-15	;4
	pb	-17,0,15	;5
	pb	25,0,15	;6
	pb	-37,-19,15	;7
	pb	-15,-41,15	;8

	EndPoints
clisla_l_F
	Vizis	6
	Viz	6,5,7,0,0,127	;0
	Viz	6,8,3,-82,80,54	;1
	Viz	0,2,7,81,-81,54	;2
	Viz	4,7,2,120,0,40	;3
	Viz	3,8,4,0,120,40	;4
	Viz	4,8,7,64,64,89	;5

clisla_l_f1	Faces
	Face4	30,0,0,0,127,6,5,7,8
	Face4	32,1,-82,80,54,6,8,3,1
	Face4	28,2,81,-81,54,0,2,7,5
	Face3	30,3,120,0,40,4,7,2
	Face3	34,4,0,120,40,3,8,4
	Face3	32,5,64,64,89,4,8,7
	Fend
	EndShape

	endc

;--Shape file ----- C:\SHED\NSHAPES\CLISLA_M.TXT ----
	ifne	DO_HDR

CLISLA_M
	ShapeHdr	CLISLA_M_P,0,CLISLA_M_F,0,0,0,0,0,0,30,75,30,78,id_0_c,0,0,0,0,<CLISLA_M>
	elseif
CLISLA_M_P
	Pointsb	1
	pb	0,-75,0	;0
	PointsXb	6
	pb	15,-30,-30	;1
	pb	-10,75,-20	;3
	pb	20,75,0	;5
	pb	30,-30,0	;7
	pb	10,75,20	;9
	pb	-15,-30,30	;11

	EndPoints
CLISLA_M_F
	Vizis	12
	Viz	9,10,11,0,-12,126	;0
	Viz	9,12,7,-113,-11,57	;1
	Viz	6,8,11,113,-11,57	;2
	Viz	0,11,8,98,65,49	;3
	Viz	7,12,0,-98,65,49	;4
	Viz	0,12,11,0,70,106	;5
	Viz	1,2,3,0,-12,-126	;6
	Viz	5,7,1,-113,-11,-57	;7
	Viz	3,2,8,113,-11,-57	;8
	Viz	8,2,0,98,65,-49	;9
	Viz	0,1,7,-98,65,-49	;10
	Viz	2,1,0,0,70,-106	;11

CLISLA_M_f1	Faces
	Face4	28,0,0,-12,126,9,10,11,12
	Face4	30,1,-113,-11,57,9,12,7,5
	Face4	30,2,113,-11,57,6,8,11,10
	Face3	32,3,98,65,49,0,11,8
	Face3	28,4,-98,65,49,7,12,0
	Face3	30,5,0,70,106,0,12,11
	Face4	30,6,0,-12,-126,1,2,3,4
	Face4	28,7,-113,-11,-57,5,7,1,4
	Face4	32,8,113,-11,-57,3,2,8,6
	Face3	34,9,98,65,-49,8,2,0
	Face3	30,10,-98,65,-49,0,1,7
	Face3	32,11,0,70,-106,2,1,0
	Fend
	EndShape

	endc

;--Shape file ----- C:\SHED\NSHAPES\clisla_s.txt ----
	ifne	DO_HDR

clisla_s
	ShapeHdr	clisla_s_P,0,clisla_s_F,0,0,0,0,0,0,25,40,20,40,id_0_c,0,0,0,0,<clisla_s>
	elseif
clisla_s_P
	Pointsb	8
	pb	-10,0,-20	;0
	pb	10,-5,-20	;1
	pb	5,40,0	;2
	pb	25,0,0	;3
	pb	-25,-5,0	;4
	pb	-5,-40,0	;5
	pb	-10,0,20	;6
	pb	10,-5,20	;7

	EndPoints
clisla_s_F
	Vizis	12
	Viz	7,6,5,14,58,112	;0
	Viz	7,5,3,-93,69,52	;1
	Viz	4,5,6,87,50,78	;2
	Viz	2,6,7,-13,-53,115	;3
	Viz	3,2,7,-89,-45,78	;4
	Viz	6,2,4,95,-63,55	;5
	Viz	5,0,1,14,58,-112	;6
	Viz	3,5,1,-93,69,-52	;7
	Viz	0,5,4,87,50,-78	;8
	Viz	1,0,2,-13,-53,-115	;9
	Viz	1,2,3,-89,-45,-78	;10
	Viz	4,2,0,95,-63,-55	;11

clisla_s_f1	Faces
	Face3	32,0,14,58,112,7,6,5
	Face3	34,1,-93,69,52,7,5,3
	Face3	30,2,87,50,78,4,5,6
	Face3	30,3,-13,-53,115,2,6,7
	Face3	32,4,-89,-45,78,3,2,7
	Face3	28,5,95,-63,55,6,2,4
	Face3	30,6,14,58,-112,5,0,1
	Face3	32,7,-93,69,-52,3,5,1
	Face3	28,8,87,50,-78,0,5,4
	Face3	28,9,-13,-53,-115,1,0,2
	Face3	30,10,-89,-45,-78,1,2,3
	Face3	30,11,95,-63,-55,4,2,0
	Fend
	EndShape

	endc


;--Shape file ----- C:\SHED\NSHAPES\car_0.txt ----
	ifne	DO_HDR

car_0	ShapeHdr	car_0_P,0,car_0_F,0,0,0,0,1,0,30,12,50,58,id_0_c,0,0,0,0,<car_0>
car_10    ShapeHdr    car_0_P,0,car_0_F,0,0,0,0,0,playerB_col,30,12,50,58,id_0_c,0,0,0,0,<car_10>
	elseif
car_0_P
	Pointsb	3
	pb	0,-6,-50	;0
	pb	0,3,50	;1
	pb	0,0,50	;2
	PointsXb	14
	pb	12,6,-50	;3
	pb	24,6,-50	;5
	pb	12,0,-50	;7
	pb	-24,0,-50	;9
	pb	-30,3,-44	;11
	pb	12,10,-38	;13
	pb	24,10,-38	;15
	pb	-30,5,-38	;17
	pb	-30,0,-38	;19
	pb	-12,-6,-38	;21
	pb	-24,-6,-38	;23
	pb	6,-12,-38	;25
	pb	30,3,50	;27
	pb	24,0,50	;29

	EndPoints
car_0_F
	Vizis	34
	Viz	1,3,4,0,-127,4	;0
	Viz	1,27,15,0,-127,10	;1
	Viz	13,3,1,120,-40,-13	;2
	Viz	1,4,14,-120,-40,-13	;3
	Viz	14,16,28,0,-127,10	;4
	Viz	25,26,0,0,114,-57	;5
	Viz	0,26,21,73,73,-73	;6
	Viz	22,25,0,-73,73,-73	;7
	Viz	22,0,7,-52,104,-52	;8
	Viz	8,0,21,52,104,-52	;9
	Viz	22,7,10,0,114,-57	;10
	Viz	24,10,12,-85,85,-42	;11
	Viz	18,12,5,-79,-95,-32	;12
	Viz	15,5,3,0,-120,-40	;13
	Viz	10,7,3,0,0,-127	;14
	Viz	5,12,10,-90,0,-90	;15
	Viz	12,18,27,-127,0,0	;16
	Viz	23,9,8,0,114,-57	;17
	Viz	19,11,9,85,85,-42	;18
	Viz	6,4,8,0,0,-127	;19
	Viz	9,11,6,90,0,-90	;20
	Viz	16,6,11,79,-95,-32	;21
	Viz	14,4,6,0,-120,-40	;22
	Viz	19,28,17,127,0,0	;23
	Viz	8,4,3,0,0,-127	;24
	Viz	21,26,2,89,89,18	;25
	Viz	2,25,22,-89,89,18	;26
	Viz	20,27,29,-57,114,4	;27
	Viz	23,30,28,57,113,8	;28
	Viz	26,25,2,0,126,17	;29
	Viz	23,21,2,0,127,9	;30
	Viz	29,2,22,0,127,9	;31
	Viz	27,18,15,-81,-98,2	;32
	Viz	16,17,28,81,-98,2	;33
	BSPInit	car_0_EBSP
	BSP	30,car_0_f1,.bsp2
	BSPE	car_0_f3
.bsp2	BSP	6,car_0_f4,.bsp5
	BSP	31,car_0_f6,.bsp7
	BSPEND
.bsp7	BSPE	car_0_f8
.bsp5	BSPE	car_0_f9

car_0_f1	Faces
	Face4	16,30,0,127,9,23,21,2,30
	FendQ
car_0_f3	Faces
	Face3	44,2,120,-40,-13,13,3,1
	Face3	44,3,-120,-40,-13,1,4,14
	Face3	45,0,0,-127,4,1,3,4
	Face4	18,10,0,114,-57,22,7,10,24
	Face4	18,17,0,114,-57,23,9,8,21
	Face4	18,27,-57,114,4,20,27,29,24
	Face4	12,1,0,-127,10,1,27,15,13
	Face4	12,4,0,-127,10,14,16,28,1
	Face4	20,11,-85,85,-42,24,10,12,20
	Face4	16,12,-79,-95,-32,18,12,5,15
	Face4	14,13,0,-120,-40,15,5,3,13
	Face4	101,14,0,0,-127,10,7,3,5		; 101
	Face3	10,15,-90,0,-90,5,12,10
	Face4	23,16,-127,0,0,12,18,27,20
	Face4	16,18,85,85,-42,19,11,9,23
	Face4	101,19,0,0,-127,6,4,8,9			; 101
	Face3	10,20,90,0,-90,9,11,6
	Face4	12,21,79,-95,-32,16,6,11,17
	Face4	14,22,0,-120,-40,14,4,6,16
	Face4	21,23,127,0,0,19,28,17,11
	Face5	10,24,0,0,-127,8,4,3,7,0
	Face4	14,28,57,113,8,23,30,28,19
	Face3	14,32,-81,-98,2,27,18,15
	Face3	11,33,81,-98,2,16,17,28
	FendQ
car_0_f4	Faces
	Face3	30,6,73,73,-73,0,26,21
	FendQ
car_0_f6	Faces
	Face4	16,31,0,127,9,29,2,22,24
	FendQ
car_0_f8	Faces
	Face3	34,7,-73,73,-73,22,25,0
	Face3	28,25,89,89,18,21,26,2
	Face3	32,26,-89,89,18,2,25,22
	Face3	30,29,0,126,17,26,25,2
	Face3	20,8,-52,104,-52,22,0,7
	FendQ
car_0_f9	Faces
	Face3	32,5,0,114,-57,25,26,0
	Face3	16,9,52,104,-52,8,0,21
	FendQ
car_0_EBSP
	EndShape

	endc
;--Shape file ----- C:\SHED\NSHAPES\CAR_1.TXT ----
	ifne	DO_HDR

CAR_1
	ShapeHdr	CAR_1_P,0,CAR_1_F,0,0,0,0,1,0,30,25,50,57,id_0_c,0,0,0,0,<CAR_1>
	elseif
CAR_1_P
	PointsXb	17
	pb	10,20,-50	;0
	pb	-20,20,-50	;2
	pb	-30,20,5	;4
	pb	-10,10,5	;6
	pb	-20,10,5	;8
	pb	-10,-20,5	;10
	pb	10,-25,5	;12
	pb	15,5,10	;14
	pb	-15,-15,10	;16
	pb	15,-15,20	;18
	pb	10,-20,25	;20
	pb	15,5,40	;22
	pb	15,-5,40	;24
	pb	-10,10,45	;26
	pb	10,-10,45	;28
	pb	-10,20,50	;30
	pb	-20,20,50	;32

	EndPoints
CAR_1_F
	Vizis	27
	Viz	25,19,21,102,68,34	;0
	Viz	25,29,26,90,0,90	;1
	Viz	6,15,23,90,-90,0	;2
	Viz	15,6,10,90,0,-90	;3
	Viz	16,10,21,90,90,0	;4
	Viz	25,23,15,127,0,0	;5
	Viz	28,20,18,-102,68,34	;6
	Viz	22,27,28,-90,0,90	;7
	Viz	27,22,14,-90,-90,0	;8
	Viz	17,11,7,-90,0,-90	;9
	Viz	18,20,11,-90,90,0	;10
	Viz	18,17,14,-127,0,0	;11
	Viz	7,11,10,0,0,-127	;12
	Viz	26,27,7,0,-127,0	;13
	Viz	10,11,20,0,127,0	;14
	Viz	6,8,2,0,125,-23	;15
	Viz	2,8,4,89,89,-16	;16
	Viz	30,32,8,0,124,28	;17
	Viz	4,8,32,89,89,20	;18
	Viz	6,1,30,-127,0,0	;19
	Viz	4,32,30,0,-127,0	;20
	Viz	0,3,9,0,125,-23	;21
	Viz	5,9,3,-89,89,-16	;22
	Viz	7,9,33,0,124,28	;23
	Viz	33,9,5,-89,89,20	;24
	Viz	3,0,31,0,-127,0	;25
	Viz	31,0,7,127,0,0	;26
	BSPInit	CAR_1_EBSP
	BSP	2,CAR_1_f1,.bsp2
	BSP	4,CAR_1_f3,.bsp4
	BSP	8,CAR_1_f5,.bsp6
	BSPE	CAR_1_f7
.bsp6	BSPE	CAR_1_f8
.bsp4	BSPE	CAR_1_f9
.bsp2	BSPE	CAR_1_f10

CAR_1_f1	Faces
	Face4	14,2,90,-90,0,6,15,23,26
	FendQ
CAR_1_f3	Faces
	Face4	14,4,90,90,0,16,10,21,19
	FendQ
CAR_1_f5	Faces
	Face4	16,8,-90,-90,0,27,22,14,7
	FendQ
CAR_1_f7	Faces
	Face4	18,10,-90,90,0,18,20,11,17
	Face4	16,14,0,127,0,10,11,20,21
	Face2	43,-1,0,0,0,12,11
	Face4	20,9,-90,0,-90,17,11,7,14
	Face4	18,12,0,0,-127,7,11,10,6
	Face4	28,0,102,68,34,25,19,21,29
	Face4	12,1,90,0,90,25,29,26,23
	Face4	16,3,90,0,-90,15,6,10,16
	Face5	30,5,127,0,0,25,23,15,16,19
	Face4	32,6,-102,68,34,28,20,18,24
	Face4	14,7,-90,0,90,22,27,28,24
	Face5	34,11,-127,0,0,18,17,14,22,24
	Face4	12,13,0,-127,0,26,27,7,6
	FendQ
CAR_1_f8	Faces
	Face4	18,21,0,125,-23,0,3,9,7
	Face3	25,22,-89,89,-16,5,9,3
	Face4	16,23,0,124,28,7,9,33,31
	Face3	23,24,-89,89,20,33,9,5
	Face5	43,25,0,-127,0,3,0,31,33,5
	Face3	12,26,127,0,0,31,0,7
	FendQ
CAR_1_f9	Faces
	Face2	43,-1,0,0,0,10,13
	FendQ
CAR_1_f10	Faces
	Face4	18,15,0,125,-23,6,8,2,1
	Face3	23,16,89,89,-16,2,8,4
	Face4	16,17,0,124,28,30,32,8,6
	Face3	21,18,89,89,20,4,8,32
	Face3	12,19,-127,0,0,6,1,30
	Face5	43,20,0,-127,0,4,32,30,1,2
	FendQ
CAR_1_EBSP
	EndShape

	endc



;--Shape file ----- C:\SHED\NSHAPES\mine_2.txt ----
	ifne	DO_HDR

mine_2
	ShapeHdr	mine_2_P,0,mine_2_F,0,0,0,0,1,0,30,40,30,40,id_0_c,0,0,0,0,<mine_2>
	elseif
mine_2_P
	Pointsb	8
	pb	0,-14,-30	;0
	pb	0,-14,-20	;1
	pb	0,0,-6	;2
	pb	0,40,0	;3
	pb	0,-34,0	;4
	pb	0,0,6	;5
	pb	0,-14,20	;6
	pb	0,-14,30	;7
	PointsXb	3
	pb	-6,0,0	;8
	pb	-20,-14,0	;10
	pb	-30,-14,0	;12

	EndPoints
mine_2_F
	Vizis	12
	Viz	1,10,8,73,-73,-73	;0
	Viz	2,9,11,-73,-73,-73	;1
	Viz	3,2,8,89,-13,-89	;2
	Viz	9,2,3,-89,-13,-89	;3
	Viz	10,1,4,73,73,-73	;4
	Viz	4,6,10,73,73,73	;5
	Viz	4,1,11,-73,73,-73	;6
	Viz	11,6,4,-73,73,73	;7
	Viz	5,8,10,73,-73,73	;8
	Viz	6,11,9,-73,-73,73	;9
	Viz	8,5,3,89,-13,89	;10
	Viz	3,5,9,-89,-13,89	;11
	BSPInit	mine_2_EBSP
	BSP	4,mine_2_f1,.bsp2
	BSP	5,mine_2_f3,.bsp4
	BSP	6,mine_2_f5,.bsp6
	BSPE	mine_2_f7
.bsp6	BSPE	mine_2_f8
.bsp4	BSPE	mine_2_f9
.bsp2	BSPE	mine_2_f10

mine_2_f1	Faces
	Face3	14,4,73,73,-73,10,1,4
	FendQ
mine_2_f3	Faces
	Face3	16,5,73,73,73,4,6,10
	FendQ
mine_2_f5	Faces
	Face3	16,6,-73,73,-73,4,1,11
	FendQ
mine_2_f7	Faces
	Face4	21,0,73,-73,-73,1,10,8,2
	Face4	23,1,-73,-73,-73,2,9,11,1
	Face3	12,2,89,-13,-89,3,2,8
	Face3	14,3,-89,-13,-89,9,2,3
	Face4	23,8,73,-73,73,5,8,10,6
	Face4	25,9,-73,-73,73,6,11,9,5
	Face3	14,10,89,-13,89,8,5,3
	Face3	16,11,-89,-13,89,3,5,9
	Face3	18,7,-73,73,73,11,6,4
	FendQ
mine_2_f8	Faces
	Face2	43,-1,0,0,0,13,11
	FendQ
mine_2_f9	Faces
	Face2	43,-1,0,0,0,7,6
	FendQ
mine_2_f10	Faces
	Face2	43,-1,0,0,0,1,0
	Face2	43,-1,0,0,0,10,12
	FendQ
mine_2_EBSP
	EndShape

	endc


;--Shape file ----- C:\SHED\SHAPES\round_0.txt ----
	ifne	DO_HDR

round0p
	ShapeHdr	round0p_P,0,round0p_F,0,0,0,0,2,0,10,30,55,59,id_0_c,0,0,0,0,<round0p>
	elseif
round0p_P
	Pointsb	4
	pb	0,20,-55	;0
	pb	0,20,-35	;1
	pb	0,0,-15	;2
	pb	0,-30,15	;3
	PointsXb	3
	pb	-5,25,-50	;4
	pb	10,30,-35	;6
	pb	-7,-23,-5	;8

	EndPoints
round0p_F
	Vizis	8
	Viz	3,2,8,101,-54,54	;0
	Viz	9,2,3,-101,-54,54	;1
	Viz	0,4,5,0,-90,-90	;3
	Viz	6,7,1,0,0,127	;4
	Viz	5,4,7,0,-120,-40	;5
	Viz	1,7,4,90,90,0	;6
	Viz	0,5,6,-90,90,0	;7
	Viz	9,8,2,0,51,-116	;8

round0p_f1	Faces
	Face3	32,3,0,0,127,6,7,1
	Face4	30,5,90,90,0,1,7,4,0
	Face4	32,6,-90,90,0,0,5,6,1
	Face3	18,7,0,51,-116,9,8,2
	Face3	16,0,101,-54,54,3,2,8
	Face3	18,1,-101,-54,54,9,2,3
	Face2	16,-1,0,0,0,1,2
	Face3	42,2,0,-90,-90,0,4,5
	Face4	28,4,0,-120,-40,5,4,7,6
	Fend
	EndShape

	endc
;--Shape file ----- C:\SHED\NSHAPES\gate_2.txt ----
	ifne	DO_HDR

gate_2
	ShapeHdr	gate_2_P,0,gate_2_F,0,0,0,0,1,0,26,30,7,30,id_0_c,0,0,0,0,<gate_2>
	elseif
gate_2_P
	Pointsb	4
	pb	0,-25,-7	;0
	pb	0,25,-2	;1
	pb	0,-30,-2	;2
	pb	0,30,3	;3
	PointsXb	10
	pb	-22,13,-7	;4
	pb	-26,15,-2	;6
	pb	-15,14,-2	;8
	pb	-20,6,-2	;10
	pb	22,-13,-2	;12
	pb	5,-20,-2	;14
	pb	-5,20,3	;16
	pb	20,-6,3	;18
	pb	15,-14,3	;20
	pb	26,-15,3	;22

	EndPoints
gate_2_F
	Vizis	18
	Viz	12,22,20,11,120,-39	;0
	Viz	12,20,18,73,-46,-93	;1
	Viz	18,22,12,-97,-64,-52	;2
	Viz	0,2,15,104,52,-52	;3
	Viz	0,15,14,0,-90,-90	;4
	Viz	14,2,0,-104,52,-52	;5
	Viz	21,23,13,-11,120,-39	;6
	Viz	19,21,13,-73,-46,-93	;7
	Viz	13,23,19,97,-64,-52	;8
	Viz	9,7,5,11,-120,-39	;9
	Viz	11,9,5,73,46,-93	;10
	Viz	5,7,11,-97,64,-52	;11
	Viz	16,3,1,104,-52,-52	;12
	Viz	17,16,1,0,90,-90	;13
	Viz	1,3,17,-104,-52,-52	;14
	Viz	4,6,8,-11,-120,-39	;15
	Viz	4,8,10,-73,46,-93	;16
	Viz	10,6,4,97,64,-52	;17

gate_2_f1	Faces
	Face3	52,1,73,-46,-93,12,20,18
	Face3	52,4,0,-90,-90,0,15,14
	Face3	52,7,-73,-46,-93,19,21,13
	Face3	52,10,73,46,-93,11,9,5
	Face3	52,13,0,90,-90,17,16,1
	Face3	52,16,-73,46,-93,4,8,10
	Face3	52,0,11,120,-39,12,22,20
	Face3	52,2,-97,-64,-52,18,22,12
	Face3	52,3,104,52,-52,0,2,15
	Face3	52,5,-104,52,-52,14,2,0
	Face3	52,6,-11,120,-39,21,23,13
	Face3	52,8,97,-64,-52,13,23,19
	Face3	52,9,11,-120,-39,9,7,5
	Face3	52,11,-97,64,-52,5,7,11
	Face3	52,12,104,-52,-52,16,3,1
	Face3	52,14,-104,-52,-52,1,3,17
	Face3	52,15,-11,-120,-39,4,6,8
	Face3	52,17,97,64,-52,10,6,4
	Fend
	EndShape

	endc

;--Shape file ----- C:\SHED\NSHAPES\s_fish.anm ----
	ifne	DO_HDR

s_fish
	ShapeHdr	s_fish_P,0,s_fish_F,0,0,0,0,0,0,10,15,41,45,id_0_c,0,0,0,0,<s_fish>
	elseif
s_fish_P
	Pointsb	1
	pb	0,-5,20	;0
	PointsXb	1
	pb	-5,5,0	;1
	Frames	8
	jumptab	.A0A
	jumptab	.A1A
	jumptab	.A2A
	jumptab	.A3A
	jumptab	.A4A
	jumptab	.A5A
	jumptab	.A6A
	jumptab	.A7A
.A0A	Pointsb	3
	pb	-3,5,-40	;3
	pb	-3,-15,-40	;4
	pb	0,-5,-30	;5
	jump	.EB0
.A1A	Pointsb	3
	pb	0,5,-40	;3
	pb	0,-15,-40	;4
	pb	3,-5,-30	;5
	jump	.EB0
.A2A	Pointsb	3
	pb	3,5,-41	;3
	pb	3,-15,-41	;4
	pb	5,-5,-30	;5
	jump	.EB0
.A3A	Pointsb	3
	pb	5,5,-40	;3
	pb	5,-15,-40	;4
	pb	3,-5,-30	;5
	jump	.EB0
.A4A	Pointsb	3
	pb	3,5,-40	;3
	pb	3,-15,-40	;4
	pb	0,-5,-30	;5
	jump	.EB0
.A5A	Pointsb	3
	pb	-3,5,-40	;3
	pb	-3,-15,-40	;4
	pb	-3,-5,-30	;5
	jump	.EB0
.A6A	Pointsb	3
	pb	-9,5,-41	;3
	pb	-9,-15,-41	;4
	pb	-5,-5,-30	;5
	jump	.EB0
.A7A	Pointsb	3
	pb	-10,5,-38	;3
	pb	-10,-15,-38	;4
	pb	-3,-5,-30	;5
.EB0

	EndPoints
s_fish_F
	Vizis	6
	Viz	5,4,3,-122,0,-36	;0
	Viz	3,4,5,122,0,36	;1
	Viz	2,5,1,0,-120,-40	;2
	Viz	1,0,2,0,-114,57	;3
	Viz	2,0,5,-114,57,0	;4
	Viz	5,0,1,114,57,0	;5

s_fish_f1	Faces
	Face3	32,1,122,0,36,3,4,5
	Face3	30,5,114,57,0,5,0,1
	Face3	14,2,0,-120,-40,2,5,1
	Face3	34,0,-122,0,-36,5,4,3
	Face3	12,3,0,-114,57,1,0,2
	Face3	32,4,-114,57,0,2,0,5
	Fend
	EndShape

	endc


;--Shape file ----- C:\SHED\NSHAPES\ika.anm ----
	ifne	DO_HDR

ika
	ShapeHdr	ika_P,0,ika_F,0,0,0,0,0,playerB_col,46,61,100,100,id_0_c,0,0,0,0,<ika>
	elseif
ika_P
	Pointsb	5
	pb	0,10,0	;0
	pb	0,-10,0	;1
	pb	0,20,20	;2
	pb	0,-20,20	;3
	pb	0,0,100	;4
	PointsXb	3
	pb	-10,0,0	;5
	pb	-20,0,20	;7
	pb	-10,0,49	;9
	Frames	23
	jumptab	.A0A
	jumptab	.A1A
	jumptab	.A2A
	jumptab	.A3A
	jumptab	.A4A
	jumptab	.A5A
	jumptab	.A6A
	jumptab	.A7A
	jumptab	.A8A
	jumptab	.A9A
	jumptab	.A10A
	jumptab	.A11A
	jumptab	.A12A
	jumptab	.A13A
	jumptab	.A14A
	jumptab	.A15A
	jumptab	.A16A
	jumptab	.A17A
	jumptab	.A18A
	jumptab	.A19A
	jumptab	.A20A
	jumptab	.A21A
	jumptab	.A22A
.A0A	Pointsb	5
	pb	-10,0,-80	;11
	pb	10,0,-80	;12
	pb	0,-10,-80	;13
	pb	-15,0,70	;14
	pb	15,0,70	;15
	PointsXb	4
	pb	-6,4,-40	;16
	pb	-14,-4,-40	;18
	pb	-5,-10,-40	;20
	pb	-23,8,40	;22
	jump	.EB0
.A1A	Pointsb	5
	pb	-10,0,-79	;11
	pb	10,0,-79	;12
	pb	0,-10,-79	;13
	pb	-15,-3,70	;14
	pb	15,-3,70	;15
	PointsXb	4
	pb	-11,8,-39	;16
	pb	-18,1,-39	;18
	pb	-5,-17,-39	;20
	pb	-25,4,40	;22
	jump	.EB0
.A2A	Pointsb	5
	pb	-10,0,-74	;11
	pb	10,0,-74	;12
	pb	0,-10,-74	;13
	pb	-14,-5,70	;14
	pb	14,-5,70	;15
	PointsXb	4
	pb	-16,13,-37	;16
	pb	-23,6,-37	;18
	pb	-5,-24,-37	;20
	pb	-25,0,40	;22
	jump	.EB0
.A3A	Pointsb	5
	pb	-11,1,-69	;11
	pb	11,1,-69	;12
	pb	0,-11,-69	;13
	pb	-13,-7,70	;14
	pb	13,-8,70	;15
	PointsXb	4
	pb	-21,18,-35	;16
	pb	-28,11,-35	;18
	pb	-5,-30,-35	;20
	pb	-25,-4,40	;22
	jump	.EB0
.A4A	Pointsb	5
	pb	-11,1,-61	;11
	pb	11,1,-61	;12
	pb	0,-11,-61	;13
	pb	-14,-5,70	;14
	pb	14,-5,70	;15
	PointsXb	4
	pb	-25,22,-31	;16
	pb	-32,15,-31	;18
	pb	-5,-36,-31	;20
	pb	-23,-8,40	;22
	jump	.EB0
.A5A	Pointsb	5
	pb	-11,1,-51	;11
	pb	11,1,-51	;12
	pb	0,-11,-51	;13
	pb	-15,-3,70	;14
	pb	15,-3,70	;15
	PointsXb	4
	pb	-28,25,-26	;16
	pb	-35,18,-26	;18
	pb	-5,-41,-26	;20
	pb	-23,-11,40	;22
	jump	.EB0
.A6A	Pointsb	5
	pb	-11,1,-39	;11
	pb	11,1,-39	;12
	pb	0,-11,-39	;13
	pb	-15,0,70	;14
	pb	15,0,70	;15
	PointsXb	4
	pb	-31,28,-20	;16
	pb	-38,21,-20	;18
	pb	-5,-45,-20	;20
	pb	-23,-8,40	;22
	jump	.EB0
.A7A	Pointsb	5
	pb	-16,6,-39	;11
	pb	15,5,-40	;12
	pb	0,-18,-39	;13
	pb	-15,3,70	;14
	pb	15,3,70	;15
	PointsXb	4
	pb	-33,30,-14	;16
	pb	-40,23,-14	;18
	pb	-5,-48,-14	;20
	pb	-25,-4,40	;22
	jump	.EB0
.A8A	Pointsb	5
	pb	-19,9,-38	;11
	pb	19,9,-38	;12
	pb	0,-23,-38	;13
	pb	-14,5,70	;14
	pb	14,5,70	;15
	PointsXb	4
	pb	-34,31,-7	;16
	pb	-41,24,-7	;18
	pb	-5,-49,-7	;20
	pb	-25,0,40	;22
	jump	.EB0
.A9A	Pointsb	5
	pb	-24,14,-35	;11
	pb	24,14,-35	;12
	pb	0,-30,-35	;13
	pb	-13,7,70	;14
	pb	13,7,70	;15
	PointsXb	4
	pb	-35,32,0	;16
	pb	-42,25,0	;18
	pb	-5,-50,0	;20
	pb	-25,4,40	;22
	jump	.EB0
.A10A	Pointsb	5
	pb	-28,18,-45	;11
	pb	28,18,-45	;12
	pb	0,-35,-45	;13
	pb	-14,5,70	;14
	pb	14,5,70	;15
	PointsXb	4
	pb	-34,31,-7	;16
	pb	-41,24,-7	;18
	pb	-5,-49,-7	;20
	pb	-23,8,40	;22
	jump	.EB0
.A11A	Pointsb	5
	pb	-33,23,-53	;11
	pb	32,22,-54	;12
	pb	0,-42,-53	;13
	pb	-15,3,70	;14
	pb	15,3,70	;15
	PointsXb	4
	pb	-33,30,-14	;16
	pb	-40,23,-14	;18
	pb	-5,-48,-14	;20
	pb	-23,11,40	;22
	jump	.EB0
.A12A	Pointsb	5
	pb	-35,25,-59	;11
	pb	35,25,-59	;12
	pb	0,-45,-59	;13
	pb	-15,0,70	;14
	pb	15,0,70	;15
	PointsXb	4
	pb	-31,28,-20	;16
	pb	-38,21,-20	;18
	pb	-5,-45,-20	;20
	pb	-23,8,40	;22
	jump	.EB0
.A13A	Pointsb	5
	pb	-37,27,-64	;11
	pb	37,27,-64	;12
	pb	0,-48,-64	;13
	pb	-15,-3,70	;14
	pb	15,-3,70	;15
	PointsXb	4
	pb	-28,25,-26	;16
	pb	-35,18,-26	;18
	pb	-5,-41,-26	;20
	pb	-25,4,40	;22
	jump	.EB0
.A14A	Pointsb	5
	pb	-46,36,-61	;11
	pb	46,36,-61	;12
	pb	0,-61,-61	;13
	pb	-14,-5,70	;14
	pb	14,-5,70	;15
	PointsXb	4
	pb	-25,22,-31	;16
	pb	-32,15,-31	;18
	pb	-5,-36,-31	;20
	pb	-25,0,40	;22
	jump	.EB0
.A15A	Pointsb	5
	pb	-45,35,-60	;11
	pb	45,35,-60	;12
	pb	0,-60,-60	;13
	pb	-13,-7,70	;14
	pb	13,-8,70	;15
	PointsXb	4
	pb	-21,18,-35	;16
	pb	-28,11,-35	;18
	pb	-5,-30,-35	;20
	pb	-25,-4,40	;22
	jump	.EB0
.A16A	Pointsb	5
	pb	-44,34,-58	;11
	pb	44,34,-58	;12
	pb	0,-58,-58	;13
	pb	-14,-5,70	;14
	pb	14,-5,70	;15
	PointsXb	4
	pb	-16,13,-37	;16
	pb	-23,6,-37	;18
	pb	-5,-24,-37	;20
	pb	-23,-8,40	;22
	jump	.EB0
.A17A	Pointsb	5
	pb	-42,32,-53	;11
	pb	42,32,-53	;12
	pb	0,-55,-53	;13
	pb	-15,-3,70	;14
	pb	15,-3,70	;15
	PointsXb	4
	pb	-11,8,-39	;16
	pb	-18,1,-39	;18
	pb	-5,-17,-39	;20
	pb	-23,-11,40	;22
	jump	.EB0
.A18A	Pointsb	5
	pb	-32,22,-66	;11
	pb	32,22,-66	;12
	pb	0,-41,-66	;13
	pb	-15,0,70	;14
	pb	15,0,70	;15
	PointsXb	4
	pb	-6,4,-40	;16
	pb	-14,-4,-40	;18
	pb	-5,-10,-40	;20
	pb	-23,-8,40	;22
	jump	.EB0
.A19A	Pointsb	5
	pb	-24,14,-75	;11
	pb	24,14,-75	;12
	pb	0,-30,-75	;13
	pb	-15,3,70	;14
	pb	15,3,70	;15
	PointsXb	4
	pb	-6,4,-40	;16
	pb	-14,-4,-40	;18
	pb	-5,-10,-40	;20
	pb	-25,-4,40	;22
	jump	.EB0
.A20A	Pointsb	5
	pb	-20,10,-77	;11
	pb	20,10,-77	;12
	pb	0,-24,-77	;13
	pb	-14,5,70	;14
	pb	14,5,70	;15
	PointsXb	4
	pb	-6,4,-40	;16
	pb	-14,-4,-40	;18
	pb	-5,-10,-40	;20
	pb	-25,0,40	;22
	jump	.EB0
.A21A	Pointsb	5
	pb	-15,5,-79	;11
	pb	15,5,-79	;12
	pb	0,-17,-79	;13
	pb	-13,7,70	;14
	pb	13,7,70	;15
	PointsXb	4
	pb	-6,4,-40	;16
	pb	-14,-4,-40	;18
	pb	-5,-10,-40	;20
	pb	-25,4,40	;22
	jump	.EB0
.A22A	Pointsb	5
	pb	-10,0,-80	;11
	pb	10,0,-80	;12
	pb	0,-10,-80	;13
	pb	-15,3,70	;14
	pb	15,3,70	;15
	PointsXb	4
	pb	-6,4,-40	;16
	pb	-14,-4,-40	;18
	pb	-5,-10,-40	;20
	pb	-23,11,40	;22
.EB0

	EndPoints
ika_F
	Vizis	33
	Viz	8,10,23,78,-97,-27	;0
	Viz	23,10,8,-78,97,27	;1
	Viz	10,15,23,59,-112,14	;2
	Viz	23,15,10,-59,112,-14	;3
	Viz	4,10,15,0,127,0	;4
	Viz	15,10,4,0,-127,0	;5
	Viz	22,9,7,-78,-97,-27	;6
	Viz	7,9,22,78,97,27	;7
	Viz	22,14,9,-59,-112,14	;8
	Viz	9,14,22,59,112,-14	;9
	Viz	14,9,4,0,127,0	;10
	Viz	4,9,14,0,-127,0	;11
	Viz	17,19,12,-90,-90,0	;12
	Viz	12,19,17,90,90,0	;13
	Viz	6,19,17,-90,-90,0	;14
	Viz	17,19,6,90,90,0	;15
	Viz	11,18,16,90,-90,0	;16
	Viz	16,18,11,-90,90,0	;17
	Viz	16,18,5,90,-90,0	;18
	Viz	5,18,16,-90,90,0	;19
	Viz	13,20,21,0,-127,0	;20
	Viz	21,20,13,0,127,0	;21
	Viz	21,20,1,0,-127,0	;22
	Viz	1,20,21,0,127,0	;23
	Viz	1,5,0,0,0,-127	;24
	Viz	8,2,4,-88,-88,22	;25
	Viz	2,8,6,-85,-85,-42	;26
	Viz	4,2,7,88,-88,22	;27
	Viz	0,5,7,85,-85,-42	;28
	Viz	4,3,8,-88,88,22	;29
	Viz	1,6,8,-85,85,-42	;30
	Viz	7,3,4,88,88,22	;31
	Viz	3,7,5,85,85,-42	;32
	BSPInit	ika_EBSP
	BSP	0,ika_f1,.bsp2
	BSPEND
.bsp2	BSP	1,ika_f3,.bsp4
	BSP	6,ika_f5,.bsp6
	BSPEND
.bsp6	BSP	7,ika_f7,.bsp8
	BSP	24,ika_f9,.bsp10
	BSPE	ika_f11
.bsp10	BSPE	ika_f12
.bsp8	BSP	10,ika_f13,.bsp14
	BSPEND
.bsp14	BSP	11,ika_f15,.bsp16
	BSPE	ika_f17
.bsp16	BSPE	ika_f18
.bsp4	BSP	4,ika_f19,.bsp20
	BSPEND
.bsp20	BSP	5,ika_f21,.bsp22
	BSPE	ika_f23
.bsp22	BSPE	ika_f24

ika_f1	Faces
	Face3	44,0,78,-97,-27,8,10,23
	FendQ
ika_f3	Faces
	Face3	18,1,-78,97,27,23,10,8
	FendQ
ika_f5	Faces
	Face3	44,6,-78,-97,-27,22,9,7
	FendQ
ika_f7	Faces
	Face3	16,7,78,97,27,7,9,22
	FendQ
ika_f9	Faces
	Face4	45,24,0,0,-127,1,5,0,6
	FendQ
ika_f11	Faces
	Face3	16,25,-88,-88,22,8,2,4
	Face4	14,26,-85,-85,-42,2,8,6,0
	Face3	14,27,88,-88,22,4,2,7
	Face4	12,28,85,-85,-42,0,5,7,2
	FendQ
ika_f12	Faces
	Face3	44,13,90,90,0,12,19,17
	Face3	44,15,90,90,0,17,19,6
	Face3	44,17,-90,90,0,16,18,11
	Face3	44,19,-90,90,0,5,18,16
	Face3	44,20,0,-127,0,13,20,21
	Face3	44,22,0,-127,0,21,20,1
	Face3	14,12,-90,-90,0,17,19,12
	Face3	14,14,-90,-90,0,6,19,17
	Face3	12,16,90,-90,0,11,18,16
	Face3	12,18,90,-90,0,16,18,5
	Face3	18,21,0,127,0,21,20,13
	Face3	18,23,0,127,0,1,20,21
	FendQ
ika_f13	Faces
	Face3	16,10,0,127,0,14,9,4
	FendQ
ika_f15	Faces
	Face3	44,11,0,-127,0,4,9,14
	FendQ
ika_f17	Faces
	Face3	16,31,88,88,22,7,3,4
	Face4	14,32,85,85,-42,3,7,5,1
	FendQ
ika_f18	Faces
	Face3	44,8,-59,-112,14,22,14,9
	Face3	16,9,59,112,-14,9,14,22
	FendQ
ika_f19	Faces
	Face3	18,4,0,127,0,4,10,15
	FendQ
ika_f21	Faces
	Face3	44,5,0,-127,0,15,10,4
	FendQ
ika_f23	Faces
	Face3	20,29,-88,88,22,4,3,8
	Face4	18,30,-85,85,-42,1,6,8,3
	FendQ
ika_f24	Faces
	Face3	44,2,59,-112,14,10,15,23
	Face3	18,3,-59,112,-14,23,15,10
	FendQ
ika_EBSP
	EndShape

	endc




;--Shape file ----- C:\SHED\SHAPES5\LINE_2.TXT ----
	ifne	DO_HDR

line_2
	ShapeHdr	line_2_P,0,line_2_F,0,0,0,0,0,0,54,0,89,100,id_0_c,0,0,0,0,<line_2>
	elseif
line_2_P
	datahdr
	Pointsb	7
	pb	46,0,-89	;0
	pb	54,0,-84	;1
	pb	-22,0,-1	;2
	pb	-12,0,10	;3
	pb	-3,0,15	;4
	pb	12,0,19	;5
	pb	-50,0,86	;6

	EndPoints
line_2_F
	Vizis	2
	Viz	6,2,5,0,127,0	;0
	Viz	3,0,1,0,127,0	;1

line_2_f1	Faces
	Face3	18,0,0,127,0,6,2,5
	Face4	18,1,0,127,0,3,0,1,4
	Fend
	EndShape

	endc


 ;--Shape file ----- C:\SHED\NSHAPES\pipe_8.anm ----
	ifne	DO_HDR

pipe_8
	ShapeHdr	pipe_8_P,0,pipe_8_F,0,0,0,0,3,0,130/8,120/8,615/8,640/8,id_0_c,0,0,0,0,<pipe_8>
	elseif
pipe8pb	MACRO
	pb	\1/8,\2/8,\3/8
	ENDM
pipe_8_P
	PointsXb	6
	pipe8pb	-130,60,-600	;0
	pipe8pb	130,-60,-600	;2
	pipe8pb	130,60,200	;4
	pipe8pb	130,-60,200	;6
	pipe8pb	130,120,600	;8
	pipe8pb	130,-120,600	;10
	Frames	10
	jumptab	.A0A
	jumptab	.A1A
	jumptab	.A2A
	jumptab	.A3A
	jumptab	.A4A
	jumptab	.A5A
	jumptab	.A6A
	jumptab	.A7A
	jumptab	.A8A
	jumptab	.A9A
.A0A	PointsXb	10
	pipe8pb	0,120,600	;12
	pipe8pb	0,50,600	;14
	pipe8pb	30,20,600	;16
	pipe8pb	130,20,600	;18
	pipe8pb	30,-20,600	;20
	pipe8pb	130,-20,600	;22
	pipe8pb	0,-50,600	;24
	pipe8pb	0,-120,600	;26
	pipe8pb	0,120,615	;28
	pipe8pb	0,-120,615	;30
	jump	.EB0
.A1A	PointsXb	10
	pipe8pb	10,120,600	;12
	pipe8pb	10,50,600	;14
	pipe8pb	40,20,600	;16
	pipe8pb	130,20,600	;18
	pipe8pb	40,-20,600	;20
	pipe8pb	130,-20,600	;22
	pipe8pb	10,-50,600	;24
	pipe8pb	10,-120,600	;26
	pipe8pb	10,120,615	;28
	pipe8pb	10,-120,615	;30
	jump	.EB0
.A2A	PointsXb	10
	pipe8pb	20,120,600	;12
	pipe8pb	20,50,600	;14
	pipe8pb	50,20,600	;16
	pipe8pb	130,20,600	;18
	pipe8pb	50,-20,600	;20
	pipe8pb	130,-20,600	;22
	pipe8pb	20,-50,600	;24
	pipe8pb	20,-120,600	;26
	pipe8pb	20,120,615	;28
	pipe8pb	20,-120,615	;30
	jump	.EB0
.A3A	PointsXb	10
	pipe8pb	30,120,600	;12
	pipe8pb	30,50,600	;14
	pipe8pb	60,20,600	;16
	pipe8pb	130,20,600	;18
	pipe8pb	60,-20,600	;20
	pipe8pb	130,-20,600	;22
	pipe8pb	30,-50,600	;24
	pipe8pb	30,-120,600	;26
	pipe8pb	30,120,615	;28
	pipe8pb	30,-120,615	;30
	jump	.EB0
.A4A	PointsXb	10
	pipe8pb	50,120,600	;12
	pipe8pb	50,50,600	;14
	pipe8pb	80,20,600	;16
	pipe8pb	130,20,600	;18
	pipe8pb	80,-20,600	;20
	pipe8pb	130,-20,600	;22
	pipe8pb	50,-50,600	;24
	pipe8pb	50,-120,600	;26
	pipe8pb	50,120,615	;28
	pipe8pb	50,-120,615	;30
	jump	.EB0
.A5A	PointsXb	10
	pipe8pb	70,120,600	;12
	pipe8pb	70,50,600	;14
	pipe8pb	100,20,600	;16
	pipe8pb	130,20,600	;18
	pipe8pb	100,-20,600	;20
	pipe8pb	130,-20,600	;22
	pipe8pb	70,-50,600	;24
	pipe8pb	70,-120,600	;26
	pipe8pb	70,120,615	;28
	pipe8pb	70,-120,615	;30
	jump	.EB0
.A6A	PointsXb	10
	pipe8pb	90,120,600	;12
	pipe8pb	90,50,600	;14
	pipe8pb	120,20,600	;16
	pipe8pb	130,20,600	;18
	pipe8pb	120,-20,600	;20
	pipe8pb	130,-20,600	;22
	pipe8pb	90,-50,600	;24
	pipe8pb	90,-120,600	;26
	pipe8pb	90,120,615	;28
	pipe8pb	90,-120,615	;30
	jump	.EB0
.A7A	PointsXb	10
	pipe8pb	110,120,600	;12
	pipe8pb	110,50,600	;14
	pipe8pb	130,30,600	;16
	pipe8pb	130,30,600	;18
	pipe8pb	130,-30,600	;20
	pipe8pb	130,-30,600	;22
	pipe8pb	110,-50,600	;24
	pipe8pb	110,-120,600	;26
	pipe8pb	110,120,615	;28
	pipe8pb	110,-120,615	;30
	jump	.EB0
.A8A	PointsXb	10
	pipe8pb	120,120,600	;12
	pipe8pb	120,50,600	;14
	pipe8pb	130,40,600	;16
	pipe8pb	130,40,600	;18
	pipe8pb	130,-40,600	;20
	pipe8pb	130,-40,600	;22
	pipe8pb	120,-50,600	;24
	pipe8pb	120,-120,600	;26
	pipe8pb	120,120,615	;28
	pipe8pb	120,-120,615	;30
	jump	.EB0
.A9A	PointsXb	10
	pipe8pb	130,120,600	;12
	pipe8pb	130,50,600	;14
	pipe8pb	130,30,600	;16
	pipe8pb	130,30,600	;18
	pipe8pb	130,-30,600	;20
	pipe8pb	130,-30,600	;22
	pipe8pb	130,-50,600	;24
	pipe8pb	130,-120,600	;26
	pipe8pb	130,120,615	;28
	pipe8pb	130,-120,615	;30
.EB0

	EndPoints
pipe_8_F
	Vizis	18
	Viz	27,13,29,-127,0,0	;0
	Viz	17,15,25,0,0,-127	;1
	Viz	23,19,17,0,0,-127	;2
	Viz	23,21,25,0,0,-127	;3
	Viz	9,13,15,0,0,-127	;4
	Viz	30,28,12,127,0,0	;5
	Viz	20,24,14,0,0,-127	;6
	Viz	20,16,18,0,0,-127	;7
	Viz	18,16,14,0,0,-127	;8
	Viz	10,26,24,0,0,-127	;9
	Viz	5,4,8,0,126,19	;10
	Viz	0,1,4,0,127,0	;11
	Viz	11,10,6,0,-126,19	;12
	Viz	9,11,7,-127,0,0	;13
	Viz	4,6,10,127,0,0	;14
	Viz	7,6,2,0,-127,0	;15
	Viz	5,7,3,-127,0,0	;16
	Viz	1,2,6,127,0,0	;17
	BSPInit	pipe_8_EBSP
	BSP	3,pipe_8_f1,.bsp2
	BSPEND
.bsp2	BSP	4,pipe_8_f3,.bsp4
	BSPEND
.bsp4	BSP	8,pipe_8_f5,.bsp6
	BSPEND
.bsp6	BSP	9,pipe_8_f7,.bsp8
	BSPEND
.bsp8	BSP	1,pipe_8_f9,.bsp10
	BSPEND
.bsp10	BSP	2,pipe_8_f11,.bsp12
	BSPEND
.bsp12	BSP	6,pipe_8_f13,.bsp14
	BSPEND
.bsp14	BSP	7,pipe_8_f15,.bsp16
	BSPEND
.bsp16	BSPE	pipe_8_f17

pipe_8_f1	Faces
	Face5	32,3,0,0,-127,23,21,25,27,11
	FendQ
pipe_8_f3	Faces
	Face5	32,4,0,0,-127,9,13,15,17,19
	FendQ
pipe_8_f5	Faces
	Face5	30,8,0,0,-127,18,16,14,12,8
	FendQ
pipe_8_f7	Faces
	Face5	30,9,0,0,-127,10,26,24,20,22
	FendQ
pipe_8_f9	Faces
	Face4	18,1,0,0,-127,17,15,25,21
	FendQ
pipe_8_f11	Faces
	Face4	18,2,0,0,-127,23,19,17,21
	FendQ
pipe_8_f13	Faces
	Face4	16,6,0,0,-127,20,24,14,16
	FendQ
pipe_8_f15	Faces
	Face4	16,7,0,0,-127,20,16,18,22
	FendQ
pipe_8_f17	Faces
	Face4	14,13,-127,0,0,9,11,7,5
	Face4	14,14,127,0,0,4,6,10,8
	Face4	14,16,-127,0,0,5,7,3,0
	Face4	14,17,127,0,0,1,2,6,4
	Face4	20,0,-127,0,0,27,13,29,31
	Face4	12,5,127,0,0,30,28,12,26
	Face4	16,10,0,126,19,5,4,8,9
	Face4	16,11,0,127,0,0,1,4,5
	Face4	12,12,0,-126,19,11,10,6,7
	Face4	12,15,0,-127,0,7,6,2,3
	FendQ
pipe_8_EBSP
	EndShape

	endc


;--Shape file ----- C:\SHED\NSHAPES\pipe_8_0.txt ----
	ifne	DO_HDR

pipe_8_0
	ShapeHdr	pipe_8_0_P,0,pipe_8_0_F,0,0,0,0,3,0,130,60,250,288,id_0_c,0,0,0,0,<pipe_8_0>
	elseif
pipe_8_0_P
	PointsXb	4
	pipe8pb	-130,60,-250	;0
	pipe8pb	130,-60,-250	;2
	pipe8pb	130,60,250	;4
	pipe8pb	130,-60,250	;6

	EndPoints
pipe_8_0_F
	Vizis	4
	Viz	1,2,6,127,0,0	;0
	Viz	5,7,3,-127,0,0	;1
	Viz	7,6,2,0,-127,0	;2
	Viz	0,1,4,0,127,0	;3

pipe_8_0_f1	Faces
	Face4	23,0,127,0,0,1,2,6,4
	Face4	23,1,-127,0,0,5,7,3,0
	Face4	21,2,0,-127,0,7,6,2,3
	Face4	25,3,0,127,0,0,1,4,5
	Fend
	EndShape

	endc





