
	start_shapes


	IFEQ	CONTEST

;--Shape file ----- shapes\walker_l.txt ----
	ifne	DO_HDR

walker_l	shapehdr	WALKER_L_P,0,WALKER_L_F,0,0,0,0,2,walker_col3,50,94,30,93,id_0_c,0,0,0,0,<WALKER_L>
	elseif
walker_l_P
	datahdr
	Pointsb	18
	pb	0,-90,-25	;0
	pb	20,-80,-20	;1
	pb	41,-94,-17	;2
	pb	40,-30,-10	;3
	pb	-10,-50,-6	;4
	pb	50,-50,-6	;5
	pb	20,-55,0	;6
	pb	5,-70,0	;7
	pb	35,-70,0	;8
	pb	13,-85,0	;9
	pb	28,-85,0	;10
	pb	0,0,5	;11
	pb	20,-60,20	;12
	pb	10,-70,20	;13
	pb	30,-70,20	;14
	pb	15,-80,20	;15
	pb	25,-80,20	;16
	pb	20,-50,30	;17

	EndPoints
walker_l_F
	Vizis	20
	Viz	8,2,5,-86,39,85	;3
	Viz	1,8,2,-61,-74,-83	;4
	Viz	2,8,1,61,74,83	;5
	Viz	11,0,4,60,-35,-106	;6
	Viz	7,0,11,-122,-11,-33	;7
	Viz	4,0,7,97,54,62	;8
	Viz	7,11,4,61,12,111	;9
	Viz	0,7,1,31,-99,-73	;10
	Viz	1,7,0,-31,99,73	;11
	Viz	10,9,1,0,123,-31	;12
	Viz	8,10,1,-104,49,-54	;13
	Viz	6,8,1,-67,-67,-84	;14
	Viz	1,9,7,103,55,-50	;15
	Viz	1,7,6,67,-67,-84	;16
	Viz	16,10,8,-112,52,30	;17
	Viz	12,14,8,-88,-88,22	;18
	Viz	13,7,9,109,58,27	;19
	Viz	15,9,10,0,123,31	;20
	Viz	6,7,13,88,-88,22	;21
	Viz	16,14,12,0,0,127	;22

walker_l_f1	Faces
	Face3	14,4,-122,-11,-33,7,0,11
	Face3	20,0,-86,39,85,8,2,5
	Face3	23,1,-61,-74,-83,1,8,2
	Face3	23,2,61,74,83,2,8,1
	Face3	18,5,97,54,62,4,0,7
	Face3	16,6,61,12,111,7,11,4
	Face3	21,7,31,-99,-73,0,7,1
	Face3	25,8,-31,99,73,1,7,0
	Face3	23,9,0,123,-31,10,9,1
	Face3	25,10,-104,49,-54,8,10,1
	Face3	14,11,-67,-67,-84,6,8,1
	Face3	21,12,103,55,-50,1,9,7
	Face3	12,13,67,-67,-84,1,7,6
	Face4	27,14,-112,52,30,16,10,8,14
	Face4	16,15,-88,-88,22,12,14,8,6
	Face4	23,16,109,58,27,13,7,9,15
	Face4	14,18,88,-88,22,6,7,13,12
	Face5	44,19,0,0,127,16,14,12,13,15
	Face2	15,-1,0,0,0,3,5
	Face2	15,-1,0,0,0,3,8
	Face2	42,-1,0,0,0,6,17
	Face3	12,3,60,-35,-106,11,0,4
	Face4	25,17,0,123,31,15,9,10,16
	Fend
	EndShape

	endc
;--Shape file ----- shapes\walker_r.txt ----
	ifne	DO_HDR

walker_r
	shapehdr	walker_r_P,0,walker_r_F,0,0,0,0,2,walker_col3,50,94,33,113,id_0_c,0,0,0,0,<walker_r>
	elseif
walker_r_P
	datahdr
	Pointsb	17
	pb	1,-90,-25	;0
	pb	-20,-77,-17	;1
	pb	-40,-94,-14	;2
	pb	10,-50,-6	;3
	pb	-50,-50,-6	;4
	pb	-20,-52,3	;5
	pb	-5,-67,3	;6
	pb	-35,-67,3	;7
	pb	-12,-82,3	;8
	pb	-27,-82,3	;9
	pb	0,-1,20	;10
	pb	-20,-57,23	;11
	pb	-10,-67,23	;12
	pb	-30,-67,23	;13
	pb	-15,-77,23	;14
	pb	-25,-77,23	;15
	pb	-20,-47,33	;16

	EndPoints
walker_r_F
	Vizis	20
	Viz	3,10,6,-86,29,88	;1
	Viz	3,0,10,15,-57,-113	;2
	Viz	10,0,6,118,-20,-42	;3
	Viz	6,0,3,-97,52,63	;4
	Viz	1,6,0,-33,-98,-74	;5
	Viz	0,6,1,33,98,74	;6
	Viz	4,2,7,90,35,83	;7
	Viz	2,7,1,69,-66,-84	;8
	Viz	1,7,2,-69,66,84	;9
	Viz	8,9,1,0,123,-31	;10
	Viz	6,8,1,-104,49,-54	;11
	Viz	5,6,1,-67,-67,-84	;12
	Viz	1,9,7,103,55,-50	;13
	Viz	1,7,5,67,-67,-84	;14
	Viz	14,8,6,-112,52,30	;15
	Viz	11,12,6,-88,-88,22	;16
	Viz	13,7,9,109,58,27	;17
	Viz	15,9,8,0,123,31	;18
	Viz	5,7,13,88,-88,22	;19
	Viz	14,12,11,0,0,127	;20
	BSPInit	walker_r_EBSP
	BSP	2,walker_r_f1,.bsp2
	BSPEND
.bsp2	BSP	7,walker_r_f3,.bsp4
	BSP	11,walker_r_f5,.bsp6
	BSPE	walker_r_f7
.bsp6	BSP	4,walker_r_f8,.bsp9
	BSPEND
.bsp9	BSPE	walker_r_f10
.bsp4	BSPE	walker_r_f11

walker_r_f1	Faces
	Face3	14,2,118,-20,-42,10,0,6
	FendQ
walker_r_f3	Faces
	Face3	21,7,69,-66,-84,2,7,1
	FendQ
walker_r_f5	Faces
	Face3	14,11,-67,-67,-84,5,6,1
	FendQ
walker_r_f7	Faces
	Face4	16,15,-88,-88,22,11,12,6,5
	Face4	14,18,88,-88,22,5,7,13,11
	Face5	44,19,0,0,127,14,12,11,13,15
	Face2	42,-1,0,0,0,5,16
	Face3	23,9,0,123,-31,8,9,1
	Face4	27,14,-112,52,30,14,8,6,12
	Face4	23,16,109,58,27,13,7,9,15
	Face4	25,17,0,123,31,15,9,8,14
	FendQ
walker_r_f8	Faces
	Face3	23,4,-33,-98,-74,1,6,0
	FendQ
walker_r_f10	Faces
	Face3	25,10,-104,49,-54,6,8,1
	Face3	23,5,33,98,74,0,6,1
	Face3	18,0,-86,29,88,3,10,6
	Face3	16,1,15,-57,-113,3,0,10
	Face3	20,3,-97,52,63,6,0,3
	FendQ
walker_r_f11	Faces
	Face3	21,12,103,55,-50,1,9,7
	Face3	12,13,67,-67,-84,1,7,5
	Face3	25,8,-69,66,84,1,7,2
	Face3	18,6,90,35,83,4,2,7
	FendQ
walker_r_EBSP
	EndShape

	endc


	ENDC


;--Shape file ----- C:\SHED\SHAPES\WALKER_0.TXT ----
	ifne	DO_HDR

	IFNE	CONTEST
	public	walker_l
	public	walker_r
walker_l
walker_r

	ENDC
walker_0
	ShapeHdr	walker_0_P,0,walker_0_F,0,0,0,0,2,walker_col1,32,98,34,40,id_0_c,0,0,0,0,<walker_0>
	elseif

walker_0_P	datahdr
	Frames	18
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
.A0A	Pointsb	16
	pb	20,0,5	;0
	pb	-17,-90,-19	;1
	pb	0,-77,-20	;2
	pb	21,-90,-25	;3
	pb	30,-50,-6	;4
	pb	-1,-57,0	;5
	pb	15,-69,0	;6
	pb	-14,-74,0	;7
	pb	2,-86,0	;8
	pb	-32,-54,0	;9
	pb	-1,-62,20	;10
	pb	10,-70,20	;11
	pb	-9,-73,20	;12
	pb	1,-81,20	;13
	pb	-29,-5,10	;14
	pb	0,-50,30	;15
	jump	.EB0
.A1A	Pointsb	16
	pb	20,-1,-13	;0
	pb	-18,-85,-21	;1
	pb	0,-76,-20	;2
	pb	21,-95,-18	;3
	pb	30,-52,-10	;4
	pb	-1,-56,0	;5
	pb	15,-70,0	;6
	pb	-14,-73,0	;7
	pb	1,-86,0	;8
	pb	-32,-52,3	;9
	pb	0,-61,20	;10
	pb	10,-70,20	;11
	pb	-9,-72,20	;12
	pb	1,-81,20	;13
	pb	-26,-6,21	;14
	pb	0,-50,30	;15
	jump	.EB0
.A2A	Pointsb	16
	pb	16,-2,-24	;0
	pb	-19,-81,-22	;1
	pb	0,-75,-20	;2
	pb	22,-95,-13	;3
	pb	28,-51,-12	;4
	pb	-1,-55,0	;5
	pb	14,-68,0	;6
	pb	-14,-72,0	;7
	pb	1,-85,0	;8
	pb	-31,-51,5	;9
	pb	0,-60,20	;10
	pb	9,-68,20	;11
	pb	-9,-70,20	;12
	pb	0,-80,20	;13
	pb	-24,-6,27	;14
	pb	-1,-49,30	;15
	jump	.EB0
.A3A	Pointsb	16
	pb	14,-3,-30	;0
	pb	-19,-78,-22	;1
	pb	0,-73,-20	;2
	pb	23,-94,-10	;3
	pb	28,-51,-13	;4
	pb	-1,-53,0	;5
	pb	14,-67,0	;6
	pb	-13,-70,0	;7
	pb	1,-83,0	;8
	pb	-30,-49,6	;9
	pb	0,-58,20	;10
	pb	9,-67,20	;11
	pb	-9,-69,20	;12
	pb	0,-78,20	;13
	pb	-22,-6,30	;14
	pb	-1,-48,30	;15
	jump	.EB0
.A4A	Pointsb	16
	pb	15,-4,-33	;0
	pb	-20,-76,-22	;1
	pb	0,-73,-20	;2
	pb	22,-95,-8	;3
	pb	28,-51,-13	;4
	pb	-1,-53,0	;5
	pb	14,-67,0	;6
	pb	-14,-69,0	;7
	pb	1,-83,0	;8
	pb	-30,-48,6	;9
	pb	0,-58,20	;10
	pb	10,-68,20	;11
	pb	-9,-69,20	;12
	pb	0,-78,20	;13
	pb	-20,-5,31	;14
	pb	-1,-48,30	;15
	jump	.EB0
.A5A	Pointsb	16
	pb	20,-7,-34	;0
	pb	-20,-74,-21	;1
	pb	0,-74,-20	;2
	pb	21,-98,-7	;3
	pb	30,-55,-13	;4
	pb	0,-54,0	;5
	pb	14,-69,0	;6
	pb	-15,-68,0	;7
	pb	0,-84,0	;8
	pb	-28,-44,5	;9
	pb	0,-59,20	;10
	pb	9,-69,20	;11
	pb	-10,-68,20	;12
	pb	0,-79,20	;13
	pb	-16,-2,29	;14
	pb	1,-49,30	;15
	jump	.EB0
.A6A	Pointsb	16
	pb	20,-6,-32	;0
	pb	-20,-77,-20	;1
	pb	0,-75,-20	;2
	pb	21,-97,-7	;3
	pb	30,-54,-12	;4
	pb	0,-55,0	;5
	pb	15,-70,0	;6
	pb	-15,-70,0	;7
	pb	0,-85,0	;8
	pb	-30,-46,3	;9
	pb	0,-60,20	;10
	pb	10,-70,20	;11
	pb	-10,-70,20	;12
	pb	0,-80,20	;13
	pb	-20,-2,25	;14
	pb	0,-50,30	;15
	jump	.EB0
.A7A	Pointsb	16
	pb	22,-5,-28	;0
	pb	-19,-80,-19	;1
	pb	0,-75,-20	;2
	pb	20,-97,-8	;3
	pb	30,-54,-11	;4
	pb	0,-55,0	;5
	pb	14,-69,0	;6
	pb	-14,-71,0	;7
	pb	0,-85,0	;8
	pb	-30,-46,0	;9
	pb	0,-60,20	;10
	pb	10,-70,20	;11
	pb	-8,-70,20	;12
	pb	0,-80,20	;13
	pb	-22,-1,17	;14
	pb	0,-50,30	;15
	jump	.EB0
.A8A	Pointsb	16
	pb	24,-3,-21	;0
	pb	-19,-90,-25	;1
	pb	0,-76,-20	;2
	pb	19,-96,-10	;3
	pb	31,-54,-9	;4
	pb	1,-56,0	;5
	pb	14,-72,0	;6
	pb	-14,-70,0	;7
	pb	-1,-86,0	;8
	pb	-30,-50,-6	;9
	pb	0,-61,20	;10
	pb	9,-71,20	;11
	pb	-9,-70,20	;12
	pb	0,-81,20	;13
	pb	-21,0,5	;14
	pb	1,-51,30	;15
	jump	.EB0
.A9A	Pointsb	16
	pb	27,-3,-8	;0
	pb	-20,-95,-18	;1
	pb	0,-76,-20	;2
	pb	18,-94,-14	;3
	pb	31,-53,-5	;4
	pb	1,-56,0	;5
	pb	14,-73,0	;6
	pb	-15,-70,0	;7
	pb	-1,-86,0	;8
	pb	-30,-52,-10	;9
	pb	0,-61,20	;10
	pb	9,-72,20	;11
	pb	-10,-70,20	;12
	pb	-1,-81,20	;13
	pb	-20,-1,-13	;14
	pb	2,-51,30	;15
	jump	.EB0
.A10A	Pointsb	16
	pb	29,-5,10	;0
	pb	-21,-94,-13	;1
	pb	0,-74,-20	;2
	pb	18,-90,-19	;3
	pb	32,-54,0	;4
	pb	2,-55,0	;5
	pb	14,-74,0	;6
	pb	-13,-67,0	;7
	pb	-3,-84,0	;8
	pb	-28,-50,-12	;9
	pb	1,-60,20	;10
	pb	9,-72,20	;11
	pb	-9,-68,20	;12
	pb	-1,-79,20	;13
	pb	-15,-1,-24	;14
	pb	2,-52,30	;15
	jump	.EB0
.A11A	Pointsb	16
	pb	26,-5,21	;0
	pb	-22,-94,-10	;1
	pb	0,-74,-20	;2
	pb	19,-85,-21	;3
	pb	31,-52,3	;4
	pb	2,-54,0	;5
	pb	13,-71,0	;6
	pb	-14,-65,0	;7
	pb	-2,-84,0	;8
	pb	-28,-50,-13	;9
	pb	1,-59,20	;10
	pb	8,-71,20	;11
	pb	-9,-67,20	;12
	pb	-2,-79,20	;13
	pb	-13,-2,-30	;14
	pb	1,-51,30	;15
	jump	.EB0
.A12A	Pointsb	16
	pb	24,-6,27	;0
	pb	-23,-93,-8	;1
	pb	0,-73,-20	;2
	pb	19,-81,-22	;3
	pb	31,-51,5	;4
	pb	1,-54,0	;5
	pb	13,-70,0	;6
	pb	-14,-65,0	;7
	pb	-2,-83,0	;8
	pb	-27,-49,-13	;9
	pb	1,-59,20	;10
	pb	8,-70,20	;11
	pb	-9,-66,20	;12
	pb	-1,-78,20	;13
	pb	-12,-3,-33	;14
	pb	1,-51,30	;15
	jump	.EB0
.A13A	Pointsb	16
	pb	22,-6,30	;0
	pb	-20,-98,-7	;1
	pb	0,-75,-20	;2
	pb	20,-78,-22	;3
	pb	30,-49,6	;4
	pb	0,-55,0	;5
	pb	14,-71,0	;6
	pb	-15,-70,0	;7
	pb	0,-85,0	;8
	pb	-30,-55,-13	;9
	pb	0,-60,20	;10
	pb	9,-70,20	;11
	pb	-10,-70,20	;12
	pb	0,-80,20	;13
	pb	-20,-7,-34	;14
	pb	0,-50,30	;15
	jump	.EB0
.A14A	Pointsb	16
	pb	20,-5,31	;0
	pb	-20,-97,-7	;1
	pb	0,-75,-20	;2
	pb	21,-76,-22	;3
	pb	30,-48,6	;4
	pb	0,-55,0	;5
	pb	15,-70,0	;6
	pb	-15,-70,0	;7
	pb	0,-85,0	;8
	pb	-30,-54,-12	;9
	pb	0,-60,20	;10
	pb	10,-70,20	;11
	pb	-10,-70,20	;12
	pb	0,-80,20	;13
	pb	-20,-6,-32	;14
	pb	0,-50,30	;15
	jump	.EB0
.A15A	Pointsb	16
	pb	15,-1,29	;0
	pb	-19,-97,-8	;1
	pb	0,-74,-20	;2
	pb	21,-73,-21	;3
	pb	28,-43,5	;4
	pb	-1,-54,0	;5
	pb	14,-66,0	;6
	pb	-14,-71,0	;7
	pb	0,-83,0	;8
	pb	-30,-54,-11	;9
	pb	0,-59,20	;10
	pb	9,-68,20	;11
	pb	-9,-69,20	;12
	pb	0,-79,20	;13
	pb	-22,-5,-28	;14
	pb	-1,-49,30	;15
	jump	.EB0
.A16A	Pointsb	16
	pb	18,-1,25	;0
	pb	-18,-96,-10	;1
	pb	0,-75,-20	;2
	pb	21,-76,-20	;3
	pb	29,-45,3	;4
	pb	-1,-55,0	;5
	pb	14,-69,0	;6
	pb	-14,-72,0	;7
	pb	1,-85,0	;8
	pb	-31,-54,-9	;9
	pb	0,-60,20	;10
	pb	9,-69,20	;11
	pb	-9,-70,20	;12
	pb	0,-80,20	;13
	pb	-24,-3,-21	;14
	pb	0,-49,30	;15
	jump	.EB0
.A17A	Pointsb	16
	pb	21,0,17	;0
	pb	-17,-94,-14	;1
	pb	0,-76,-20	;2
	pb	20,-79,-19	;3
	pb	30,-45,0	;4
	pb	0,-56,0	;5
	pb	15,-69,0	;6
	pb	-14,-73,0	;7
	pb	0,-86,0	;8
	pb	-31,-53,-5	;9
	pb	0,-61,20	;10
	pb	10,-70,20	;11
	pb	-8,-72,20	;12
	pb	0,-81,20	;13
	pb	-27,-3,-8	;14
	pb	0,-50,30	;15
.EB0

	EndPoints
walker_0_F
	Vizis	17
	Viz	4,0,6,-48,-39,111	;1
	Viz	4,3,0,-73,8,-104	;2
	Viz	0,3,6,118,13,-46	;3
	Viz	6,3,4,-92,14,87	;4
	Viz	14,1,9,68,-55,-92	;5
	Viz	7,1,14,-116,-34,-40	;6
	Viz	9,1,7,84,80,52	;7
	Viz	7,14,9,29,51,113	;8
	Viz	6,8,2,-95,73,-41	;9
	Viz	5,6,2,-67,-78,-74	;10
	Viz	2,8,7,79,91,-41	;11
	Viz	2,7,5,85,-65,-69	;12
	Viz	13,8,6,-99,76,24	;13
	Viz	10,11,6,-83,-94,21	;14
	Viz	12,7,8,81,93,30	;15
	Viz	5,7,12,100,-76,17	;16
	Viz	13,11,10,0,0,127	;17
	BSPInit	walker_0_EBSP
	BSP	9,walker_0_f1,.bsp2
	BSP	11,walker_0_f3,.bsp4
	BSPE	walker_0_f5
.bsp4	BSPE	walker_0_f6
.bsp2	BSPE	walker_0_f7

walker_0_f1	Faces
	Face3	14,9,-67,-78,-74,5,6,2
	FendQ
walker_0_f3	Faces
	Face3	12,11,85,-65,-69,2,7,5
	FendQ
walker_0_f5	Faces
	Face4	16,13,-83,-94,21,10,11,6,5
	Face4	14,15,100,-76,17,5,7,12,10
	Face4	44,16,0,0,127,13,11,10,12
	Face2	42,-1,0,0,0,5,15
	Face3	25,8,-95,73,-41,6,8,2
	Face3	21,10,79,91,-41,2,8,7
	Face4	27,12,-99,76,24,13,8,6,11
	Face4	23,14,81,93,30,12,7,8,13
	FendQ
walker_0_f6	Faces
	Face3	12,4,68,-55,-92,14,1,9
	Face3	14,5,-116,-34,-40,7,1,14
	Face3	18,6,84,80,52,9,1,7
	Face3	16,7,29,51,113,7,14,9
	FendQ
walker_0_f7	Faces
	Face3	18,0,-48,-39,111,4,0,6
	Face3	16,1,-73,8,-104,4,3,0
	Face3	14,2,118,13,-46,0,3,6
	Face3	20,3,-92,14,87,6,3,4
	FendQ
walker_0_EBSP
	EndShape

	endc


	IFEQ	1

;--Shape file ----- C:\SHED\TUNNEL1S ----
	ifne	DO_HDR

tunnel1s
	shapehdr_s	tunnel1s_P,0,tunnel1s_F,0,0,-45,0,1,tunnel1_col1,105,45,60,102,id_0_c,0,0,0,0,<tunnel1s>
	elseif
tunnel1s_P
	datahdr
	PointsXb	5
	pb	-45,45,-60	;0
	pb	-105,45,-60	;2
	pb	-45,0,-60	;4
	pb	-105,-15,-60	;6
	pb	-45,-45,-60	;8
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
	pb	0,45,-60	;10
	pb	0,45,-60	;11
	pb	0,0,-60	;12
	pb	0,0,-60	;13
	jump	.EB0
.A1A	Pointsb	4
	pb	7,45,-60	;10
	pb	-7,45,-60	;11
	pb	-7,0,-60	;12
	pb	7,0,-60	;13
	jump	.EB0
.A2A	Pointsb	4
	pb	15,45,-60	;10
	pb	-15,45,-60	;11
	pb	-15,0,-60	;12
	pb	15,0,-60	;13
	jump	.EB0
.A3A	Pointsb	4
	pb	21,45,-60	;10
	pb	-21,45,-60	;11
	pb	-21,0,-60	;12
	pb	21,0,-60	;13
	jump	.EB0
.A4A	Pointsb	4
	pb	28,45,-60	;10
	pb	-28,45,-60	;11
	pb	-28,0,-60	;12
	pb	28,0,-60	;13
	jump	.EB0
.A5A	Pointsb	4
	pb	36,45,-60	;10
	pb	-34,45,-60	;11
	pb	-34,0,-60	;12
	pb	36,0,-60	;13
	jump	.EB0
.A6A	Pointsb	4
	pb	39,45,-60	;10
	pb	-39,45,-60	;11
	pb	-39,0,-60	;12
	pb	39,0,-60	;13
	jump	.EB0
.A7A	Pointsb	4
	pb	42,45,-60	;10
	pb	-42,45,-60	;11
	pb	-42,0,-60	;12
	pb	42,0,-60	;13
	jump	.EB0
.A8A	Pointsb	4
	pb	42,45,-60	;10
	pb	-42,45,-60	;11
	pb	-42,0,-60	;12
	pb	42,0,-60	;13
	jump	.EB0
.A9A	Pointsb	4
	pb	39,45,-60	;10
	pb	-39,45,-60	;11
	pb	-39,0,-60	;12
	pb	39,0,-60	;13
	jump	.EB0
.A10A	Pointsb	4
	pb	36,45,-60	;10
	pb	-34,45,-60	;11
	pb	-34,0,-60	;12
	pb	36,0,-60	;13
	jump	.EB0
.A11A	Pointsb	4
	pb	28,45,-60	;10
	pb	-28,45,-60	;11
	pb	-28,0,-60	;12
	pb	28,0,-60	;13
	jump	.EB0
.A12A	Pointsb	4
	pb	21,45,-60	;10
	pb	-21,45,-60	;11
	pb	-21,0,-60	;12
	pb	21,0,-60	;13
	jump	.EB0
.A13A	Pointsb	4
	pb	15,45,-60	;10
	pb	-15,45,-60	;11
	pb	-15,0,-60	;12
	pb	15,0,-60	;13
	jump	.EB0
.A14A	Pointsb	4
	pb	7,45,-60	;10
	pb	-7,45,-60	;11
	pb	-7,0,-60	;12
	pb	7,0,-60	;13
	jump	.EB0
.A15A	Pointsb	4
	pb	0,45,-60	;10
	pb	0,45,-60	;11
	pb	0,0,-60	;12
	pb	0,0,-60	;13
.EB0

	EndPoints
tunnel1s_F
	Vizis	5
	Viz	4,5,9,0,0,-127	;0
	Viz	9,1,3,0,0,-127	;1
	Viz	2,0,8,0,0,-127	;2
	Viz	13,10,1,0,0,-127	;3
	Viz	0,11,12,0,0,-127	;4

tunnel1s_f1	Faces
	Face4	4,0,0,0,-127,4,5,9,8
	Face4	4,1,0,0,-127,9,1,3,7
	Face4	4,2,0,0,-127,2,0,8,6
	Face4	2,3,0,0,-127,13,10,1,5
	Face4	2,4,0,0,-127,0,11,12,4
	Fend
	EndShape

	endc



;--Shape file ----- C:\SHED\TUNNEL1 ----
	ifne	DO_HDR

TUNNEL1
	shapehdr	TUNNEL1_P,0,TUNNEL1_F,0,0,-45,0,1,tunnel1_col1a,105,45,60,102,id_0_c,0,tunnel1s,tunnel1s,tunnel1s,<TUNNEL1>
	elseif
TUNNEL1_P
	datahdr
	PointsXb	12
	pb	-45,45,-60	;0
	pb	-105,45,-60	;2
	pb	-45,0,-60	;4
	pb	-20,-10,-60	;6
	pb	-105,-15,-60	;8
	pb	10,-30,-60	;10
	pb	-45,-45,-60	;12
	pb	-45,45,60	;14
	pb	-105,45,60	;16
	pb	-45,0,60	;18
	pb	-105,-15,60	;20
	pb	-45,-45,60	;22
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
	pb	0,45,-60	;24
	pb	0,45,-60	;25
	pb	0,0,-60	;26
	pb	0,0,-60	;27
	jump	.EB0
.A1A	Pointsb	4
	pb	7,45,-60	;24
	pb	-7,45,-60	;25
	pb	-7,0,-60	;26
	pb	7,0,-60	;27
	jump	.EB0
.A2A	Pointsb	4
	pb	15,45,-60	;24
	pb	-15,45,-60	;25
	pb	-15,0,-60	;26
	pb	15,0,-60	;27
	jump	.EB0
.A3A	Pointsb	4
	pb	21,45,-60	;24
	pb	-21,45,-60	;25
	pb	-21,0,-60	;26
	pb	21,0,-60	;27
	jump	.EB0
.A4A	Pointsb	4
	pb	28,45,-60	;24
	pb	-28,45,-60	;25
	pb	-28,0,-60	;26
	pb	28,0,-60	;27
	jump	.EB0
.A5A	Pointsb	4
	pb	36,45,-60	;24
	pb	-34,45,-60	;25
	pb	-34,0,-60	;26
	pb	36,0,-60	;27
	jump	.EB0
.A6A	Pointsb	4
	pb	39,45,-60	;24
	pb	-39,45,-60	;25
	pb	-39,0,-60	;26
	pb	39,0,-60	;27
	jump	.EB0
.A7A	Pointsb	4
	pb	42,45,-60	;24
	pb	-42,45,-60	;25
	pb	-42,0,-60	;26
	pb	42,0,-60	;27
	jump	.EB0
.A8A	Pointsb	4
	pb	42,45,-60	;24
	pb	-42,45,-60	;25
	pb	-42,0,-60	;26
	pb	42,0,-60	;27
	jump	.EB0
.A9A	Pointsb	4
	pb	39,45,-60	;24
	pb	-39,45,-60	;25
	pb	-39,0,-60	;26
	pb	39,0,-60	;27
	jump	.EB0
.A10A	Pointsb	4
	pb	36,45,-60	;24
	pb	-34,45,-60	;25
	pb	-34,0,-60	;26
	pb	36,0,-60	;27
	jump	.EB0
.A11A	Pointsb	4
	pb	28,45,-60	;24
	pb	-28,45,-60	;25
	pb	-28,0,-60	;26
	pb	28,0,-60	;27
	jump	.EB0
.A12A	Pointsb	4
	pb	21,45,-60	;24
	pb	-21,45,-60	;25
	pb	-21,0,-60	;26
	pb	21,0,-60	;27
	jump	.EB0
.A13A	Pointsb	4
	pb	15,45,-60	;24
	pb	-15,45,-60	;25
	pb	-15,0,-60	;26
	pb	15,0,-60	;27
	jump	.EB0
.A14A	Pointsb	4
	pb	7,45,-60	;24
	pb	-7,45,-60	;25
	pb	-7,0,-60	;26
	pb	7,0,-60	;27
	jump	.EB0
.A15A	Pointsb	4
	pb	0,45,-60	;24
	pb	0,45,-60	;25
	pb	0,0,-60	;26
	pb	0,0,-60	;27
.EB0

	EndPoints
TUNNEL1_F
	Vizis	17
	Viz	10,11,6,0,0,-127	;0
	Viz	0,25,26,0,0,-127	;1
	Viz	27,24,1,0,0,-127	;2
	Viz	2,0,12,0,0,-127	;3
	Viz	0,14,22,-127,0,0	;4
	Viz	20,16,2,127,0,0	;5
	Viz	22,14,16,0,0,127	;6
	Viz	12,22,20,57,114,0	;7
	Viz	13,1,3,0,0,-127	;8
	Viz	23,15,1,127,0,0	;9
	Viz	3,17,21,-127,0,0	;10
	Viz	17,15,23,0,0,127	;11
	Viz	21,23,13,-57,114,0	;12
	Viz	4,5,13,0,0,-127	;13
	Viz	23,19,18,0,0,127	;14
	Viz	19,5,4,0,-127,0	;15
	Viz	12,13,23,0,127,0	;16

TUNNEL1_f1	Faces
	Face4	6,4,-127,0,0,0,14,22,12
	Face4	6,9,127,0,0,23,15,1,13
	Face4	6,15,0,-127,0,19,5,4,18
	Face4	2,1,0,0,-127,0,25,26,4
	Face4	2,2,0,0,-127,27,24,1,5
	Face4	6,3,0,0,-127,2,0,12,8
	Face4	6,5,127,0,0,20,16,2,8
	Face4	6,6,0,0,127,22,14,16,20
	Face4	6,7,57,114,0,12,22,20,8
	Face4	6,8,0,0,-127,13,1,3,9
	Face4	6,10,-127,0,0,3,17,21,9
	Face4	6,11,0,0,127,17,15,23,21
	Face4	6,12,-57,114,0,21,23,13,9
	Face4	6,13,0,0,-127,4,5,13,12
	Face4	6,14,0,0,127,23,19,18,22
	Face4	6,16,0,127,0,12,13,23,22
	Fend
	EndShape

	endc

;--Shape file ----- shapes\tunnel2.txt ----
	ifne	DO_HDR

tunnel2
	shapehdr	tunnel2_P,0,tunnel2_F,0,0,0,0,0,tunnel2_col1,70,70,80,127,id_0_c,0,0,0,0,<tunnel2>
	elseif
tunnel2_P
	datahdr
	PointsXw	10
	pw	50,0,-80	;0
	pw	70,0,-80	;2
	pw	50,-50,-80	;4
	pw	50,-70,-80	;6
	pw	70,-70,-80	;8
	pw	50,0,80	;10
	pw	70,0,80	;12
	pw	50,-50,80	;14
	pw	50,-70,80	;16
	pw	70,-70,80	;18

	EndPoints
tunnel2_F
	Vizis	9
	Viz	2,8,6,0,0,-127	;0
	Viz	8,2,12,-127,0,0	;1
	Viz	6,16,10,127,0,0	;2
	Viz	7,9,3,0,0,-127	;3
	Viz	13,3,9,127,0,0	;4
	Viz	11,17,7,-127,0,0	;5
	Viz	8,18,19,0,127,0	;6
	Viz	15,14,4,0,-127,0	;7
	Viz	6,7,5,0,0,-127	;8

tunnel2_f1	Faces
	Face4	4,2,127,0,0,6,16,10,0
	Face4	4,5,-127,0,0,11,17,7,1
	Face4	3,7,0,-127,0,15,14,4,5
	Face4	3,0,0,0,-127,2,8,6,0
	Face4	3,1,-127,0,0,8,2,12,18
	Face4	3,3,0,0,-127,7,9,3,1
	Face4	3,4,127,0,0,13,3,9,19
	Face4	3,6,0,127,0,8,18,19,9
	Face4	3,8,0,0,-127,6,7,5,4
	Fend
	EndShape
	endc





	ifne	DO_HDR

tunnel3
	shapehdr	tunnel3_P,0,tunnel3_F,0,0,0,0,0,tunnel3_col1,stunnwidth,stunnheight,80,127,id_0_c,0,0,0,0,<tunnel3>
	elseif
tunnel3_P
	datahdr
	PointsXw	10
	pw	stunnwidth,0,-80	;0
	pw	stunnwidth+20,0,-80	;2
	pw	stunnwidth,-stunnheight,-80	;4
	pw	stunnwidth,-stunnheight-20,-80	;6
	pw	stunnwidth+20,-stunnheight-20,-80	;8
	pw	stunnwidth,0,80	;10
	pw	stunnwidth+20,0,80	;12
	pw	stunnwidth,-stunnheight,80	;14
	pw	stunnwidth,-stunnheight-20,80	;16
	pw	stunnwidth+20,-stunnheight-20,80	;18

	EndPoints
tunnel3_F
	Vizis	9
	Viz	2,8,6,0,0,-127	;0
	Viz	8,2,12,-127,0,0	;1
	Viz	6,16,10,127,0,0	;2
	Viz	7,9,3,0,0,-127	;3
	Viz	13,3,9,127,0,0	;4
	Viz	11,17,7,-127,0,0	;5
	Viz	8,18,19,0,127,0	;6
	Viz	15,14,4,0,-127,0	;7
	Viz	6,7,5,0,0,-127	;8

tunnel3_f1	Faces
	Face4	4,2,127,0,0,6,16,10,0
	Face4	4,5,-127,0,0,11,17,7,1
	Face4	3,7,0,-127,0,15,14,4,5
	Face4	3,0,0,0,-127,2,8,6,0
	Face4	3,1,-127,0,0,8,2,12,18
	Face4	3,3,0,0,-127,7,9,3,1
	Face4	3,4,127,0,0,13,3,9,19
	Face4	3,6,0,127,0,8,18,19,9
	Face4	3,8,0,0,-127,6,7,5,4
	Fend
	EndShape


	endc




;--Shape file ----- shapes\plane1.txt ----
	ifne	DO_HDR

plane1
	ShapeHdr	plane1_P,0,plane1_F,0,0,0,0,0,98,36,30,98,98,id_0_c,0,0,0,0,<plane1>
	elseif
plane1_P
	datahdr
	Pointsb	3
	pb	0,0,0	;0
	pb	0,-9,12	;1
	pb	0,0,98	;2
	PointsXb	3
	pb	36,0,-30	;3
	pb	-9,6,12	;5
	pb	-30,-30,60	;7

	EndPoints
plane1_F
	Vizis	13
	Viz	2,1,6,-109,65,7	;0
	Viz	1,2,5,109,65,7	;1
	Viz	6,5,2,0,-127,9	;2
	Viz	6,1,0,-102,61,-46	;3
	Viz	5,0,1,102,61,-46	;4
	Viz	5,6,0,0,-114,-57	;5
	Viz	5,1,0,-102,-61,46	;6
	Viz	6,0,1,102,-61,46	;7
	Viz	6,5,0,0,114,57	;8
	Viz	0,6,3,30,-118,-36	;11
	Viz	6,0,3,-30,118,36	;12
	Viz	4,5,0,-30,-118,-36	;13
	Viz	4,0,5,30,118,36	;14
	BSPInit	plane1_EBSP
	BSP	3,plane1_f1,.bsp2
	BSPE	plane1_f3
.bsp2	BSP	5,plane1_f4,.bsp5
	BSPE	plane1_f6
.bsp5	BSP	7,plane1_f7,.bsp8
	BSPE	plane1_f9
.bsp8	BSPE	plane1_f10

plane1_f1	Faces
	Face3	5,3,-102,61,-46,6,1,0
	FendQ
plane1_f3	Faces
	Face3	6,12,30,118,36,4,0,5
	Face3	5,1,109,65,7,1,2,5
	Face2	15,-1,0,0,0,7,5
	Face3	5,0,-109,65,7,2,1,6
	Face3	5,2,0,-127,9,6,5,2
	Face3	6,11,-30,-118,-36,4,5,0
	FendQ
plane1_f4	Faces
	Face3	5,5,0,-114,-57,5,6,0
	FendQ
plane1_f6	Faces
	Face2	15,-1,0,0,0,8,6
	FendQ
plane1_f7	Faces
	Face3	5,7,102,-61,46,6,0,1
	FendQ
plane1_f9	Faces
	Face3	6,9,30,-118,-36,0,6,3
	Face3	6,10,-30,118,36,6,0,3
	FendQ
plane1_f10	Faces
	Face3	5,8,0,114,57,6,5,0
	Face3	5,6,-102,-61,46,5,1,0
	Face3	5,4,102,61,-46,5,0,1
	FendQ
plane1_EBSP
	EndShape

	endc

	

;--Shape file ----- shapes\phazer.txt ----
	ifne	DO_HDR

phazer
	ShapeHdr	phazer_P,0,phazer_F,0,0,0,0,0,41,10,0,40,41,id_0_c,0,0,0,0,<phazer>
	elseif
phazer_P
	datahdr
	PointsXb	4
	pb	5,0,-40	;0
	pb	10,0,-40	;2
	pb	5,0,40	;4
	pb	10,0,40	;6

	EndPoints
phazer_F
	Vizis	6
	Viz	2,0,4,0,-127,0	;0
	Viz	6,4,0,0,127,0	;1
	Viz	0,1,5,0,-127,0	;2
	Viz	5,1,0,0,127,0	;3
	Viz	1,3,7,0,-127,0	;4
	Viz	1,5,7,0,127,0	;5

phazer_f1	Faces
	Face4	8,0,0,-127,0,2,0,4,6
	Face4	8,1,0,127,0,6,4,0,2
	Face4	7,2,0,-127,0,0,1,5,4
	Face4	7,3,0,127,0,5,1,0,4
	Face4	8,4,0,-127,0,1,3,7,5
	Face4	8,5,0,127,0,1,5,7,3
	Fend
	EndShape

	endc

	ENDC


;--Shape file ----- shapes\pillar2.txt ----
	ifne	DO_HDR

	IFNE	CONTEST
beeanim
	public	beeanim
	ENDC

pillar2
	shapehdr	pillar2_P,0,pillar2_F,0,0,0,0,2,pillar2_col1,8,79,10,83,id_0_c,0,0,0,0,<pillar2>
	elseif
pillar2_P
	datahdr
	PointsXb	2
	pb	7,0,-10	;0
	pb	-7,0,10	;2
	Frames	32
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
	jumptab	.A0A
	jumptab	.A0A
	jumptab	.A0A
	jumptab	.A0A
	jumptab	.A0A
	jumptab	.A0A
	jumptab	.A0A
	jumptab	.A0A
	jumptab	.A0A
	jumptab	.A0A
	jumptab	.A0A
	jumptab	.A0A
	jumptab	.A0A
	jumptab	.A0A
	jumptab	.A0A
	jumptab	.A0A
.A0A	PointsXb	2
	pb	7,-15,-10	;4
	pb	7,-15,10	;6
	jump	.EB0
.A1A	PointsXb	2
	pb	7,-25,-10	;4
	pb	7,-25,10	;6
	jump	.EB0
.A2A	PointsXb	2
	pb	7,-33,-10	;4
	pb	7,-33,10	;6
	jump	.EB0
.A3A	PointsXb	2
	pb	7,-38,-10	;4
	pb	7,-38,10	;6
	jump	.EB0
.A4A	PointsXb	2
	pb	7,-45,-10	;4
	pb	7,-45,10	;6
	jump	.EB0
.A5A	PointsXb	2
	pb	7,-52,-10	;4
	pb	7,-52,10	;6
	jump	.EB0
.A6A	PointsXb	2
	pb	7,-61,-10	;4
	pb	7,-61,10	;6
	jump	.EB0
.A7A	PointsXb	2
	pb	7,-70,-10	;4
	pb	7,-70,10	;6
	jump	.EB0
.A8A	PointsXb	2
	pb	7,-79,-10	;4
	pb	7,-79,10	;6
	jump	.EB0
.A9A	PointsXb	2
	pb	7,-75,-10	;4
	pb	7,-75,10	;6
	jump	.EB0
.A10A	PointsXb	2
	pb	7,-66,-10	;4
	pb	7,-66,10	;6
	jump	.EB0
.A11A	PointsXb	2
	pb	7,-54,-10	;4
	pb	7,-54,10	;6
	jump	.EB0
.A12A	PointsXb	2
	pb	7,-42,-10	;4
	pb	7,-42,10	;6
	jump	.EB0
.A13A	PointsXb	2
	pb	7,-33,-10	;4
	pb	7,-33,10	;6
	jump	.EB0
.A14A	PointsXb	2
	pb	7,-24,-10	;4
	pb	7,-24,10	;6
	jump	.EB0
.A15A	PointsXb	2
	pb	7,-8,-10	;4
	pb	7,-8,10	;6
.EB0

	EndPoints
pillar2_F
	Vizis	5
	Viz	7,5,4,0,127,0	;0
	Viz	3,6,4,-127,0,0	;1
	Viz	5,7,2,127,0,0	;2
	Viz	1,0,4,0,0,-127	;3
	Viz	2,7,6,0,0,127	;4

pillar2_f1	Faces
	Face4	1,0,0,127,0,7,5,4,6
	Face4	1,1,-127,0,0,3,6,4,0
	Face4	1,2,127,0,0,5,7,2,1
	Face4	1,3,0,0,-127,1,0,4,5
	Face4	1,4,0,0,127,2,7,6,3
	Fend
	EndShape

	endc


	IFEQ	1

;--Shape file ----- shapes\shadow1.txt ----
	ifne	DO_HDR

shadow1
shadow2
	shapehdr	shadow1_P,0,shadow1_F,0,0,0,0,4,0,0,0,0,0,black_c,0,0,0,0,<shadow1>
	elseif
shadow1_P
	datahdr
	PointsXw	2
	pw	90,0,-90	;0
	pw	90,0,90	;2

	EndPoints
shadow1_F
	Vizis	2
	Viz	3,2,0,0,-127,0	;0
	Viz	0,2,3,0,127,0	;1

shadow1_f1	Faces
	Face4	10,0,0,-127,0,3,2,0,1
	Face4	10,1,0,127,0,0,2,3,1
	Fend
	EndShape

	endc
;--Shape file ----- shapes\motherf2.txt ----
	ifne	DO_HDR

motherf
motherf2
	shapehdr	MOTHERF2_P,0,MOTHERF2_F,0,0,0,0,0,0,100,100,10,1212,id_0_c,0,0,0,0,<MOTHERF2>
	elseif
motherf2_P
	datahdr
	Pointsw	22
	pw	0,0,-200	;0
	pw	0,2,-124	;1
	pw	-60,2,-112	;2
	pw	68,2,-104	;3
	pw	172,2,-96	;4
	pw	-168,2,-92	;5
	pw	-100,2,-72	;6
	pw	108,2,-64	;7
	pw	-196,82,0	;8
	pw	-116,2,0	;9
	pw	124,2,0	;10
	pw	200,82,4	;11
	pw	108,2,64	;12
	pw	-100,2,68	;13
	pw	-164,2,92	;14
	pw	164,2,100	;15
	pw	-56,2,108	;16
	pw	68,2,108	;17
	pw	4,2,120	;18
	pw	92,82,164	;19
	pw	-92,82,168	;20
	pw	4,2,200	;21
	PointsXw	9
	pw	800,-240,-1104	;22
	pw	320,-160,-1040	;24
	pw	-440,-80,-440	;26
	pw	360,0,-360	;28
	pw	96,82,-172	;30
	pw	360,0,360	;32
	pw	440,-80,440	;34
	pw	320,-160,1040	;36
	pw	800,-240,1096	;38

	EndPoints
motherf2_F
	Vizis	29
	Viz	4,11,15,-118,47,5	;0
	Viz	15,19,21,-66,25,106	;1
	Viz	21,20,14,66,38,102	;2
	Viz	14,8,5,119,45,3	;3
	Viz	5,31,0,65,42,-101	;4
	Viz	0,30,4,-63,38,-103	;5
	Viz	5,2,31,-18,-80,97	;6
	Viz	2,0,31,-83,-79,55	;7
	Viz	0,3,30,83,-78,57	;8
	Viz	3,4,30,7,-84,95	;9
	Viz	4,10,11,86,-83,-43	;10
	Viz	10,15,11,89,-83,36	;11
	Viz	15,17,19,9,-74,-103	;12
	Viz	21,19,17,88,-69,-61	;13
	Viz	20,21,16,-84,-79,-55	;14
	Viz	16,14,20,-14,-80,-98	;15
	Viz	8,14,9,-84,-84,44	;16
	Viz	9,5,8,-83,-83,-47	;17
	Viz	12,10,7,0,-127,0	;18
	Viz	7,10,12,0,127,0	;19
	Viz	33,32,28,0,-127,0	;20
	Viz	28,32,33,0,127,0	;21
	Viz	27,28,32,-90,-90,0	;22
	Viz	35,34,32,0,-90,90	;23
	Viz	33,29,26,90,-90,0	;24
	Viz	28,27,26,0,-90,-90	;25
	Viz	35,37,36,0,-126,17	;26
	Viz	24,25,26,0,-126,-17	;27
	Viz	22,23,39,0,-127,0	;28
	BSPInit	motherf2_EBSP
	BSP	18,motherf2_f1,.bsp2
	BSPE	motherf2_f3
.bsp2	BSPE	motherf2_f4

motherf2_f1	Faces
	Face12	4,18,0,-127,0,12,10,7,3,1,2,6,9,13,16,18,17
	FendQ
motherf2_f3	Faces
	Face4	5,28,0,-127,0,22,23,39,38
	Face4	15,22,-90,-90,0,27,28,32,34
	Face4	15,23,0,-90,90,35,34,32,33
	Face4	15,24,90,-90,0,33,29,26,35
	Face4	15,25,0,-90,-90,28,27,26,29
	Face4	15,26,0,-126,17,35,37,36,34
	Face4	15,27,0,-126,-17,24,25,26,27
	FendQ
motherf2_f4	Faces
	Face4	10,20,0,-127,0,33,32,28,29
	Face3	4,0,-118,47,5,4,11,15
	Face3	4,1,-66,25,106,15,19,21
	Face3	4,2,66,38,102,21,20,14
	Face3	4,3,119,45,3,14,8,5
	Face3	4,4,65,42,-101,5,31,0
	Face3	4,5,-63,38,-103,0,30,4
	Face3	4,6,-18,-80,97,5,2,31
	Face3	4,7,-83,-79,55,2,0,31
	Face3	4,8,83,-78,57,0,3,30
	Face3	4,9,7,-84,95,3,4,30
	Face3	4,10,86,-83,-43,4,10,11
	Face3	4,11,89,-83,36,10,15,11
	Face3	4,12,9,-74,-103,15,17,19
	Face3	4,13,88,-69,-61,21,19,17
	Face3	4,14,-84,-79,-55,20,21,16
	Face3	4,15,-14,-80,-98,16,14,20
	Face3	4,16,-84,-84,44,8,14,9
	Face3	4,17,-83,-83,-47,9,5,8
	Face12	4,19,0,127,0,7,10,12,17,18,16,13,9,6,2,1,3
	Face4	10,21,0,127,0,28,32,33,29
	FendQ
motherf2_EBSP
	EndShape

	endc


	ENDC

	IFEQ	CONTEST


;--Shape file ----- shapes\beeanim.txt ----
	ifne	DO_HDR

beeanim
	shapehdr	BEEANIM_P,0,BEEANIM_F,0,0,0,0,0,0,30,48,59,76,id_5_c,0,0,0,0,<BEEANIM>
	elseif
beeanim_P
	datahdr
	Pointsb	6
	pb	0,0,0	;0
	pb	0,16,10	;1
	pb	0,-20,10	;2
	pb	0,35,30	;3
	pb	0,-5,30	;4
	pb	0,48,59	;5
	PointsXb	2
	pb	-12,20,-5	;6
	pb	-8,-10,15	;8
	Frames	3
	jumptab	.A0A
	jumptab	.A1A
	jumptab	.A2A
.A0A	PointsXb	3
	pb	-30,-20,-30	;10
	pb	-20,-10,-20	;12
	pb	-20,-30,-20	;14
	jump	.EB0
.A1A	PointsXb	3
	pb	-30,-7,-24	;10
	pb	-20,3,-17	;12
	pb	-20,-17,-17	;14
	jump	.EB0
.A2A	PointsXb	3
	pb	-30,3,-18	;10
	pb	-20,13,-13	;12
	pb	-20,-7,-13	;14
.EB0

	EndPoints
beeanim_F
	Vizis	16
	Viz	0,1,6,99,42,68	;0
	Viz	6,1,3,94,62,59	;1
	Viz	7,1,0,-99,42,68	;2
	Viz	3,1,7,-94,62,59	;3
	Viz	7,6,3,0,-117,-50	;4
	Viz	6,7,0,0,31,-123	;5
	Viz	0,2,8,95,38,-76	;7
	Viz	9,2,0,-95,38,-76	;8
	Viz	0,8,9,0,-106,70	;9
	Viz	4,8,2,67,86,65	;10
	Viz	2,9,4,-67,86,65	;11
	Viz	9,8,4,0,-120,-40	;12
	Viz	12,10,14,90,0,90	;13
	Viz	0,14,10,-90,0,-90	;14
	Viz	0,15,11,-90,0,90	;15
	Viz	13,11,15,90,0,-90	;16
	BSPInit	beeanim_EBSP
	BSP	1,beeanim_f1,.bsp2
	BSP	3,beeanim_f3,.bsp4
	BSPE	beeanim_f5
.bsp4	BSPE	beeanim_f6
.bsp2	BSP	7,beeanim_f7,.bsp8
	BSPE	beeanim_f9
.bsp8	BSPE	beeanim_f10

beeanim_f1	Faces
	Face3	6,1,94,62,59,6,1,3
	FendQ
beeanim_f3	Faces
	Face3	6,3,-94,62,59,3,1,7
	FendQ
beeanim_f5	Faces
	Face3	6,4,0,-117,-50,7,6,3
	Face3	0,5,0,31,-123,6,7,0
	FendQ
beeanim_f6	Faces
	Face3	0,2,-99,42,68,7,1,0
	Face4	6,14,-90,0,90,0,15,11,13
	Face4	6,15,90,0,-90,13,11,15,0
	FendQ
beeanim_f7	Faces
	Face3	0,7,-95,38,-76,9,2,0
	FendQ
beeanim_f9	Faces
	Face3	0,0,99,42,68,0,1,6
	Face3	2,11,0,-120,-40,9,8,4
	Face3	0,8,0,-106,70,0,8,9
	Face2	5,-1,0,0,0,3,5
	Face3	2,9,67,86,65,4,8,2
	Face3	2,10,-67,86,65,2,9,4
	FendQ
beeanim_f10	Faces
	Face3	0,6,95,38,-76,0,2,8
	Face4	6,12,90,0,90,12,10,14,0
	Face4	6,13,-90,0,-90,0,14,10,12
	FendQ
beeanim_EBSP
	EndShape

	endc


	ENDC

	IFEQ	1

;--Shape file ----- shapes\para_0_s.txt ----
	ifne	DO_HDR

para_0_s
	shapehdr_s	para_0_s_P,0,para_0_s_F,0,0,-40,0,0,0,20,68,20,68,id_5_c,0,0,0,0,<para_0_s>
	elseif
para_0_s_P
	datahdr
	Pointsb	2
	pb	0,66,-10	;0
	pb	0,46,-10	;1
	PointsXb	3
	pb	10,56,-10	;2
	pb	-20,19,0	;4
	pb	10,6,0	;6

	EndPoints
para_0_s_F
	Vizis	2
	Viz	6,5,4,0,0,127	;0
	Viz	1,2,0,0,0,127	;1

para_0_s_f1	Faces
	Face4	0,1,0,0,127,1,2,0,3
	Face2	15,-1,0,0,0,1,6
	Face2	15,-1,0,0,0,1,4
	Face4	0,0,0,0,127,6,5,4,7
	Fend
	EndShape

	endc

	ENDC

;--Shape file ----- shapes\para_0.txt ----
	ifne	DO_HDR

para_0
	shapehdr	para_0_P,0,para_0_F,0,0,-40,0,0,0,20,76,20,86,id_0_c,0,0,0,0,<para_0>
	elseif
para_0_P
	datahdr
	Pointsb	4
	pb	0,66,0	;0
	pb	0,46,0	;1
	pb	0,56,12	;2
	pb	0,74,20	;3
	PointsXb	6
	pb	10,19,-20	;4
	pb	5,6,-10	;6
	pb	-20,74,-9	;8
	pb	-10,56,-5	;10
	pb	-20,19,0	;12
	pb	10,6,0	;14

	EndPoints
para_0_F
	Vizis	9
	Viz	5,4,6,0,77,-101	;0
	Viz	4,13,14,-94,72,-47	;1
	Viz	15,12,5,94,72,-47	;2
	Viz	0,11,10,0,-57,-114	;8
	Viz	10,11,1,0,57,-114	;9
	Viz	11,2,1,-94,66,55	;10
	Viz	1,2,10,94,66,55	;11
	Viz	0,2,11,-94,-66,55	;12
	Viz	10,2,0,94,-66,55	;13
	BSPInit	para_0_EBSP
	BSP	3,para_0_f1,.bsp2
	BSP	5,para_0_f3,.bsp4
	BSPE	para_0_f5
.bsp4	BSP	7,para_0_f6,.bsp7
	BSPE	para_0_f8
.bsp7	BSPE	para_0_f9
.bsp2	BSPE	para_0_f10

para_0_f1	Faces
	Face3	6,3,0,-57,-114,0,11,10
	FendQ
para_0_f3	Faces
	Face3	0,5,-94,66,55,11,2,1
	FendQ
para_0_f5	Faces
	Face3	0,6,94,66,55,1,2,10
	Face3	6,8,94,-66,55,10,2,0
	FendQ
para_0_f6	Faces
	Face3	6,7,-94,-66,55,0,2,11
	FendQ
para_0_f8	Faces
	Face2	1,-1,0,0,0,1,4
	Face2	1,-1,0,0,0,1,12
	Face4	0,0,0,77,-101,5,4,6,7
	Face4	0,1,-94,72,-47,4,13,14,6
	Face4	0,2,94,72,-47,15,12,5,7
	FendQ
para_0_f9	Faces
	Face2	16,-1,0,0,0,3,2
	FendQ
para_0_f10	Faces
	Face2	16,-1,0,0,0,8,10
	Face2	16,-1,0,0,0,9,11
	Face3	0,4,0,57,-114,10,11,1
	FendQ
para_0_EBSP
	EndShape

	endc

;--Shape file ----- shapes\para_1_s.txt ----
	ifne	DO_HDR

para_1_s
	shapehdr_s	para_1_s_P,0,para_1_s_F,0,0,0,0,0,0,20,30,9,30,id_5_c,0,0,0,0,<para_1_s>
	elseif
para_1_s_P
	datahdr
	Pointsb	3
	pb	0,-8,0	;0
	pb	0,-28,0	;1
	pb	0,0,10	;2
	PointsXb	2
	pb	20,0,-10	;3
	pb	10,-18,0	;5

	EndPoints
para_1_s_F
	Vizis	1
	Viz	1,5,0,0,0,127	;0
	BSPInit	para_1_s_EBSP
	BSP	0,para_1_s_f1,.bsp2
	BSPE	para_1_s_f3
.bsp2	BSPE	para_1_s_f4

para_1_s_f1	Faces
	Face4	0,0,0,0,127,1,5,0,6
	FendQ
para_1_s_f3	Faces
	Face2	15,-1,0,0,0,3,5
	Face2	15,-1,0,0,0,6,4
	FendQ
para_1_s_f4	Faces
	Face2	15,-1,0,0,0,2,0
	FendQ
para_1_s_EBSP
	EndShape

	endc
;--Shape file ----- shapes\para_1.txt ----
	ifne	DO_HDR

para_1
	shapehdr	para_1_P,0,para_1_F,0,0,0,0,0,0,20,30,20,30,id_0_c,0,para_1_s,para_1_s,para_1_s,<para_1>
	elseif
para_1_P
	datahdr
	Pointsb	4
	pb	0,-8,0	;0
	pb	0,-28,0	;1
	pb	0,-18,12	;2
	pb	0,0,20	;3
	PointsXb	2
	pb	-20,0,-9	;4
	pb	-10,-18,-5	;6

	EndPoints
para_1_F
	Vizis	6
	Viz	0,7,6,0,-57,-114	;3
	Viz	6,7,1,0,57,-114	;4
	Viz	7,2,1,-94,66,55	;5
	Viz	1,2,6,94,66,55	;6
	Viz	0,2,7,-94,-66,55	;7
	Viz	6,2,0,94,-66,55	;8
	BSPInit	para_1_EBSP
	BSP	0,para_1_f1,.bsp2
	BSPE	para_1_f3
.bsp2	BSPE	para_1_f4

para_1_f1	Faces
	Face3	6,0,0,-57,-114,0,7,6
	FendQ
para_1_f3	Faces
	Face3	6,4,-94,-66,55,0,2,7
	Face3	6,5,94,-66,55,6,2,0
	Face2	16,-1,0,0,0,3,2
	Face3	0,1,0,57,-114,6,7,1
	Face3	0,2,-94,66,55,7,2,1
	Face3	0,3,94,66,55,1,2,6
	FendQ
para_1_f4	Faces
	Face2	16,-1,0,0,0,4,6
	Face2	16,-1,0,0,0,5,7
	FendQ
para_1_EBSP
	EndShape

	endc



;--Shape file ----- shapes\big_m.txt ----
	ifne	DO_HDR

small_m
	shapehdr	big_m_P,0,big_m_F,0,0,0,0,0,0,40/2,60/2,45/2,90/2,id_0_c,0,big_m,big_m,big_m,<big_m>
big_m
	shapehdr	big_m_P,0,big_m_F,0,0,0,0,1,0,40/2,60/2,45/2,90/2,id_0_c,0,big_m,big_m,big_m,<big_m>
	elseif
big_m_P
	datahdr
	Pointsb	1
	pbd2	0,0,45	;0
	PointsXb	8
	pbd2	-40,60,-45	;1
	pbd2	40,-60,-45	;3
	pbd2	20,40,-35	;5
	pbd2	40,0,-35	;7
	pbd2	-20,-40,-35	;9
	pbd2	15,30,-15	;11
	pbd2	-30,0,-15	;13
	pbd2	15,-30,-15	;15

	EndPoints
big_m_F
	Vizis	20
	Viz	13,16,0,104,52,52	;0
	Viz	12,13,0,104,-52,52	;1
	Viz	0,11,12,0,-114,57	;2
	Viz	16,15,0,0,114,57	;3
	Viz	0,15,14,-104,52,52	;4
	Viz	0,14,11,-104,-52,52	;5
	Viz	5,6,12,0,-114,57	;6
	Viz	12,6,8,104,-52,52	;7
	Viz	14,7,5,-104,-52,52	;8
	Viz	15,16,9,0,114,57	;9
	Viz	13,8,9,104,52,52	;10
	Viz	15,10,7,-104,52,52	;11
	Viz	3,15,10,81,94,27	;12
	Viz	10,15,3,-81,-94,-27	;13
	Viz	9,16,4,-81,94,27	;14
	Viz	4,16,9,81,-94,-27	;15
	Viz	5,11,2,81,-94,27	;16
	Viz	2,11,5,-81,94,-27	;17
	Viz	1,12,6,-81,-94,27	;18
	Viz	6,12,1,81,94,-27	;19
	BSPInit	big_m_EBSP
	BSP	0,big_m_f1,.bsp2
	BSP	1,big_m_f3,.bsp4
	BSP	2,big_m_f5,.bsp6
	BSP	13,big_m_f7,.bsp8
	BSPE	big_m_f9
.bsp8	BSPE	big_m_f10
.bsp6	BSPE	big_m_f11
.bsp4	BSPE	big_m_f12
.bsp2	BSPE	big_m_f13

big_m_f1	Faces
	Face3	20,0,104,52,52,13,16,0
	FendQ
big_m_f3	Faces
	Face3	18,1,104,-52,52,12,13,0
	FendQ
big_m_f5	Faces
	Face3	16,2,0,-114,57,0,11,12
	FendQ
big_m_f7	Faces
	Face3	21,13,-81,-94,-27,10,15,3
	FendQ
big_m_f9	Faces
	Face3	18,3,0,114,57,16,15,0
	Face4	25,9,0,114,57,15,16,9,10
	FendQ
big_m_f10	Faces
	Face3	16,4,-104,52,52,0,15,14
	Face4	23,11,-104,52,52,15,10,7,14
	Face3	14,5,-104,-52,52,0,14,11
	Face4	21,8,-104,-52,52,14,7,5,11
	Face3	27,12,81,94,27,3,15,10
	FendQ
big_m_f11	Faces
	Face4	23,6,0,-114,57,5,6,12,11
	Face3	27,16,81,-94,27,5,11,2
	Face3	21,17,-81,94,-27,2,11,5
	FendQ
big_m_f12	Faces
	Face4	25,7,104,-52,52,12,6,8,13
	Face3	21,19,81,94,-27,6,12,1
	Face3	27,18,-81,-94,27,1,12,6
	FendQ
big_m_f13	Faces
	Face4	27,10,104,52,52,13,8,9,16
	Face3	21,15,81,-94,-27,4,16,9
	Face3	27,14,-81,94,27,9,16,4
	FendQ
big_m_EBSP
	EndShape

	endc


;--Shape file ----- shapes\wall1_s1.txt ----
	ifne	DO_HDR

wall1_s1
	shapehdr_s	wall1_s1_P,0,wall1_s1_F,0,0,0,0,3,wall1_col1,10,40,2,45,normal_c,0,0,0,0,<wall1_s1>
	elseif
wall1_s1_P
	datahdr
	PointsXb	2
	pb	10,0,0	;0
	pb	10,-40,0	;2
	Frames	2
	jumptab	.A0A
	jumptab	.A1A
.A0A	Pointsb	3
	pb	8,-5,2	;4
	pb	-9,-20,2	;5
	pb	8,-35,2	;6
	jump	.EB0
.A1A	Pointsb	3
	pb	8,-20,2	;4
	pb	-9,-5,2	;5
	pb	-9,-35,2	;6
.EB0

	EndPoints
wall1_s1_F
	Vizis	2
	Viz	1,3,2,0,0,127	;0
	Viz	6,4,5,0,0,127	;1

wall1_s1_f1	Faces
	Face4	9,0,0,0,127,1,3,2,0
	Face3	16,1,0,0,127,6,4,5
	Fend
	EndShape

	endc

;--Shape file ----- C:\SHED\WALL1 ----
	ifne	DO_HDR

wall1
	shapehdr	WALL1_P,0,WALL1_F,0,0,0,0,3,wall1_col1,11,40,110,119,normal_c,0,0,0,wall1_s1,<WALL1>
wall2
	shapehdr	WALL1_P,0,WALL1_F,0,0,0,0,3,0,11,40,110,119,normal_c,0,0,0,wall1_s1,<WALL1>
WALL_l
	shapehdr	WALL1_P,0,WALL1_F,0,0,0,0,3,walll_col1,110,40,11,119,normal_c,0,0,0,0,<WALL1>
WALL_r
	shapehdr	WALL1_P,0,WALL1_F,0,0,0,0,3,wallr_col1,110,40,11,119,normal_c,0,0,0,0,<WALL1>
	elseif
wall1_P
	datahdr
	PointsXb	4
	pb	10,0,-110	;0
	pb	10,-40,-110	;2
	pb	10,0,0	;4
	pb	10,-40,0	;6
	Frames	2
	jumptab	.A0A
	jumptab	.A1A
.A0A	Pointsb	3
	pb	8,-5,2	;8
	pb	-9,-20,2	;9
	pb	8,-35,2	;10
	jump	.EB0
.A1A	Pointsb	3
	pb	8,-20,2	;8
	pb	-9,-5,2	;9
	pb	-9,-35,2	;10
.EB0

	EndPoints
wall1_F
	Vizis	7
	Viz	5,7,6,0,0,127	;0
	Viz	2,3,1,0,0,-127	;1
	Viz	2,6,7,0,127,0	;2
	Viz	3,7,5,127,0,0	;3
	Viz	4,6,2,-127,0,0	;4
	Viz	10,8,9,0,0,127	;5
	Viz	5,7,6,0,0,127	;6

wall1_f1	Faces
	Face4	9,1,0,0,-127,2,3,1,0
	Face4	9,2,0,127,0,2,6,7,3
	Face4	10,3,127,0,0,3,7,5,1
	Face4	17,3,127,0,0,3,7,5,1
	Face4	10,4,-127,0,0,4,6,2,0
	Face4	18,4,-127,0,0,4,6,2,0
	Face4	9,6,0,0,127,5,7,6,4
	Face3	16,5,0,0,127,10,8,9
	Fend
	EndShape

	endc



;--Shape file ----- shapes\round_0s.txt ----
	ifne	DO_HDR

round_0s
	shapehdr	round_0s_P,0,round_0s_F,0,0,0,0,0,0,60,60,10,66,id_0_c,0,0,0,0,<round_0s>
	elseif
round_0s_P
	datahdr
	Pointsb	6
	pb	0,50,-10	;0
	pb	0,-50,-10	;1
	pb	0,9,-2	;2
	pb	0,-9,-2	;3
	pb	0,30,0	;4
	pb	0,-30,0	;5
	PointsXb	7
	pb	10,60,-10	;6
	pb	-60,10,-10	;8
	pb	-50,0,-10	;10
	pb	-60,-10,-10	;12
	pb	10,-60,-10	;14
	pb	-30,0,-2	;16
	pb	-9,0,0	;18

	EndPoints
round_0s_F
	Vizis	6
	Viz	19,4,18,0,0,127	;0
	Viz	2,16,3,0,0,127	;1
	Viz	15,14,1,0,0,127	;3
	Viz	0,6,7,0,0,127	;5
	Viz	10,8,12,0,0,127	;7
	Viz	13,9,11,0,0,127	;9

round_0s_f1	Faces
	Face3	7,2,0,0,127,15,14,1
	Face3	7,3,0,0,127,0,6,7
	Face3	7,4,0,0,127,10,8,12
	Face3	7,5,0,0,127,13,9,11
	Face2	16,-1,0,0,0,5,1
	Face2	16,-1,0,0,0,0,4
	Face2	16,-1,0,0,0,10,16
	Face2	16,-1,0,0,0,17,11
	Face4	0,0,0,0,127,19,4,18,5
	Face4	7,1,0,0,127,2,16,3,17
	Fend
	EndShape

	endc

;--Shape file ----- shapes\expl_4.txt ----
	ifne	DO_HDR

expl_4
	shapehdr	expl_4_P,0,expl_4_F,0,0,0,0,0,0,27,20,35,45,id_0_c,0,0,0,0,<expl_4>
	elseif
expl_4_P
	datahdr
	Pointsb	4
	pb	14,15,-20	;0
	pb	-24,15,-6	;1
	pb	2,-15,6	;2
	pb	9,5,24	;3

	EndPoints
expl_4_F
	Vizis	4
	Viz	0,2,1,36,71,-99	;0
	Viz	3,0,1,-11,-123,29	;1
	Viz	3,1,2,87,43,82	;2
	Viz	2,0,3,-119,45,3	;3

expl_4_f1	Faces
	Face3	0,0,36,71,-99,0,2,1
	Face3	0,1,-11,-123,29,3,0,1
	Face3	0,2,87,43,82,3,1,2
	Face3	0,3,-119,45,3,2,0,3
	Fend
	EndShape

	endc



;--Shape file ----- shapes\ship_1_s.txt ----
	ifne	DO_HDR

ship_1_s
	ShapeHdr	ship_1_s_P,0,ship_1_s_F,0,0,0,0,0,0,30,41,0,41,id_0_c,0,0,0,0,<ship_1_s>
	elseif
ship_1_s_P
	datahdr
	PointsXb	5
	pb	-3,41,0	;0
	pb	10,20,0	;2
	pb	30,0,0	;4
	pb	10,-20,0	;6
	pb	3,-31,0	;8

	EndPoints
ship_1_s_F
	Vizis	2
	Viz	6,4,2,0,0,127	;0
	Viz	1,0,9,0,0,127	;1

ship_1_s_f1	Faces
	Face6	0,0,0,0,127,6,4,2,3,5,7
	Face4	0,1,0,0,127,1,0,9,8
	Fend
	EndShape

	endc

	IFEQ	1

;--Shape file ----- shapes\crab_0_s.txt ----
	ifne	DO_HDR

crab_0_s
	shapehdr_s	crab_0_s_P,0,crab_0_s_F,0,0,0,0,0,0,60/2,50/2,5/2,67/2,id_0_c,0,0,0,0,<crab_0_s>
	elseif
crab_0_s_P
	datahdr
	Pointsb	1
	pb	0,-10,5	;0
	PointsXb	5
	pb	60,0,0	;1
	pb	-16,-25,0	;3
	pb	-30,-25,0	;5
	pb	10,-40,0	;7
	pb	40,-50,0	;9

	EndPoints
crab_0_s_F
	Vizis	4
	Viz	1,7,9,0,0,127	;0
	Viz	5,8,7,0,0,127	;1
	Viz	0,3,4,0,40,120	;2
	Viz	10,8,2,0,0,127	;3

crab_0_s_f1	Faces
	Face3	0,0,0,0,127,1,7,9
	Face3	0,3,0,0,127,10,8,2
	Face3	23,2,0,40,120,0,3,4
	Face4	23,1,0,0,127,5,8,7,6
	Fend
	EndShape

	endc
	ENDC
;--Shape file ----- shapes\hou_l.txt ----
	ifne	DO_HDR

hou_l
	shapehdr	hou_l_P,0,hou_l_F,0,0,0,0,0,0,42,40,42,71,id_0_c,0,hou_l_s,hou_l_s,hou_l_s,<hou_l>
	elseif
hou_l_P
	datahdr
	Pointsb	8
	pb	20,-20,-20	;0
	pb	35,0,-7	;1
	pb	-7,-20,-7	;2
	pb	5,-35,-5	;3
	pb	-25,0,4	;4
	pb	7,-20,7	;5
	pb	-4,0,25	;6
	pb	-42,-40,42	;7

	EndPoints
hou_l_F
	Vizis	6
	Viz	3,5,7,-79,68,72	;0
	Viz	5,2,7,29,-120,29	;1
	Viz	0,5,3,-104,54,50	;2
	Viz	5,0,1,-83,88,40	;3
	Viz	1,6,5,-76,42,93	;4
	Viz	2,5,6,63,91,63	;5

hou_l_f1	Faces
	Face3	43,1,29,-120,29,5,2,7
	Face3	14,2,-104,54,50,0,5,3
	Face3	21,3,-83,88,40,5,0,1
	Face4	12,5,63,91,63,2,5,6,4
	Face3	18,0,-79,68,72,3,5,7
	Face3	23,4,-76,42,93,1,6,5
	Fend
	EndShape

	endc
;--Shape file ----- shapes\hou_l_s.txt ----
	ifne	DO_HDR

hou_l_s
	shapehdr_s	hou_l_s_P,0,hou_l_s_F,0,0,0,0,0,0,42,40,5,57,id_0_c,0,0,0,0,<hou_l_s>
	elseif
hou_l_s_P
	datahdr
	Pointsb	4
	pb	35,0,0	;0
	pb	5,-35,0	;1
	pb	-42,-40,0	;2
	pb	-25,0,5	;3

	EndPoints
hou_l_s_F
	Vizis	2
	Viz	2,1,0,0,0,127	;0
	Viz	1,0,3,-11,9,126	;1

hou_l_s_f1	Faces
	Face3	16,0,0,0,127,2,1,0
	Face3	23,1,-11,9,126,1,0,3
	Fend
	EndShape

	endc
;--Shape file ----- shapes\hou_r.txt ----
	ifne	DO_HDR

hou_r
	shapehdr	hou_r_P,0,hou_r_F,0,0,0,0,0,0,42,40,42,41,id_0_c,0,hou_r_s,hou_r_s,hou_r_s,<hou_r>
	elseif
hou_r_P
	datahdr
	Pointsb	8
	pb	-20,-20,-20	;0
	pb	-35,0,-7	;1
	pb	7,-20,-7	;2
	pb	-5,-35,-5	;3
	pb	25,0,4	;4
	pb	-7,-20,7	;5
	pb	4,0,25	;6
	pb	42,-40,42	;7

	EndPoints
hou_r_F
	Vizis	6
	Viz	7,5,3,79,68,72	;0
	Viz	7,2,5,-29,-120,29	;1
	Viz	3,5,0,104,54,50	;2
	Viz	1,0,5,83,88,40	;3
	Viz	5,6,1,76,42,93	;4
	Viz	4,6,5,-63,91,63	;5

hou_r_f1	Faces
	Face3	43,1,-29,-120,29,7,2,5
	Face3	16,2,104,54,50,3,5,0
	Face3	23,3,83,88,40,1,0,5
	Face3	25,4,76,42,93,5,6,1
	Face4	14,5,-63,91,63,4,6,5,2
	Face3	20,0,79,68,72,7,5,3
	Fend
	EndShape

	endc
;--Shape file ----- shapes\hou_r_s.txt ----
	ifne	DO_HDR

hou_r_s
	shapehdr_s	hou_r_s_P,0,hou_r_s_F,0,0,0,0,0,0,42,40,5,37,id_0_c,0,0,0,0,<hou_r_s>
	elseif
hou_r_s_P
	datahdr
	Pointsb	4
	pb	-35,0,0	;0
	pb	-5,-35,0	;1
	pb	42,-40,0	;2
	pb	25,0,5	;3

	EndPoints
hou_r_s_F
	Vizis	2
	Viz	0,1,2,0,0,127	;0
	Viz	3,0,1,11,9,126	;1

hou_r_s_f1	Faces
	Face3	16,0,0,0,127,0,1,2
	Face3	23,1,11,9,126,3,0,1
	Fend
	EndShape

	endc


	IFEQ	1



;--Shape file ----- shapes\swing.txt ----
	ifne	DO_HDR

swing
	shapehdr	SWING_P,0,SWING_F,0,0,0,0,0,0,90,30,110,114,id_0_c,0,0,0,0,<SWING>
	elseif
swing_P
	datahdr
	Pointsb	4
	pb	0,-30,-110	;0
	pb	0,10,0	;1
	pb	0,-20,30	;2
	pb	0,0,69	;3
	PointsXb	3
	pb	20,0,-90	;4
	pb	30,-11,-20	;6
	pb	20,0,40	;8
	Frames	6
	jumptab	.A0A
	jumptab	.A1A
	jumptab	.A2A
	jumptab	.A3A
	jumptab	.A4A
	jumptab	.A5A
.A0A	Pointsb	2
	pb	-89,0,-61	;10
	pb	90,0,-60	;11
	jump	.EB0
.A1A	Pointsb	2
	pb	-80,0,-70	;10
	pb	80,0,-70	;11
	jump	.EB0
.A2A	Pointsb	2
	pb	-70,0,-80	;10
	pb	71,0,-79	;11
	jump	.EB0
.A3A	Pointsb	2
	pb	-59,0,-85	;10
	pb	60,0,-85	;11
	jump	.EB0
.A4A	Pointsb	2
	pb	-50,0,-89	;10
	pb	51,0,-89	;11
	jump	.EB0
.A5A	Pointsb	2
	pb	-43,0,-92	;10
	pb	45,0,-92	;11
.EB0

	EndPoints
swing_F
	Vizis	20
	Viz	4,2,1,122,24,-24	;0
	Viz	1,2,5,-122,24,-24	;1
	Viz	0,2,1,127,0,0	;2
	Viz	1,2,0,-127,0,0	;3
	Viz	4,6,8,94,85,0	;4
	Viz	8,6,4,-94,-85,0	;5
	Viz	5,7,9,94,-85,0	;6
	Viz	9,7,5,-94,85,0	;7
	Viz	7,10,9,-41,-117,-28	;8
	Viz	9,10,7,41,117,28	;9
	Viz	11,6,8,40,-117,-28	;10
	Viz	8,6,11,-40,117,28	;11
	Viz	1,8,4,-57,-114,0	;12
	Viz	8,2,4,-90,90,0	;13
	Viz	9,1,5,57,-114,0	;14
	Viz	2,9,5,90,90,0	;15
	Viz	9,3,1,26,-123,18	;16
	Viz	1,3,8,-26,-123,18	;17
	Viz	2,3,9,70,94,48	;18
	Viz	2,8,3,-70,94,48	;19
	BSPInit	swing_EBSP
	BSP	2,swing_f1,.bsp2
	BSP	4,swing_f3,.bsp4
	BSPE	swing_f5
.bsp4	BSPE	swing_f6
.bsp2	BSP	1,swing_f7,.bsp8
	BSP	6,swing_f9,.bsp10
	BSPE	swing_f11
.bsp10	BSP	7,swing_f12,.bsp13
	BSPE	swing_f14
.bsp13	BSPE	swing_f15
.bsp8	BSPE	swing_f16

swing_f1	Faces
	Face3	5,2,127,0,0,0,2,1
	FendQ
swing_f3	Faces
	Face3	1,4,94,85,0,4,6,8
	FendQ
swing_f5	Faces
	Face3	5,10,40,-117,-28,11,6,8
	Face3	5,11,-40,117,28,8,6,11
	FendQ
swing_f6	Faces
	Face3	1,13,-90,90,0,8,2,4
	Face3	3,0,122,24,-24,4,2,1
	Face3	1,12,-57,-114,0,1,8,4
	Face3	5,17,-26,-123,18,1,3,8
	Face3	5,19,-70,94,48,2,8,3
	Face3	1,5,-94,-85,0,8,6,4
	FendQ
swing_f7	Faces
	Face3	3,1,-122,24,-24,1,2,5
	FendQ
swing_f9	Faces
	Face3	1,6,94,-85,0,5,7,9
	FendQ
swing_f11	Faces
	Face3	1,15,90,90,0,2,9,5
	Face3	5,16,26,-123,18,9,3,1
	Face3	5,18,70,94,48,2,3,9
	FendQ
swing_f12	Faces
	Face3	1,7,-94,85,0,9,7,5
	FendQ
swing_f14	Faces
	Face3	5,8,-41,-117,-28,7,10,9
	Face3	5,9,41,117,28,9,10,7
	FendQ
swing_f15	Faces
	Face3	1,14,57,-114,0,9,1,5
	FendQ
swing_f16	Faces
	Face3	5,3,-127,0,0,1,2,0
	FendQ
swing_EBSP
	EndShape

	endc


	ENDC

;--Shape file ----- C:\SHED\NSHAPES\d_head_0.txt ----
	ifne	DO_HDR

d_head_0
	ShapeHdr	d_head_0_P,0,d_head_0_F,0,0,0,0,1,0,20,20,40,49,id_0_c,0,0,0,0,<d_head_0>
	elseif
d_head_0_P
	Pointsb	3
	pb	0,-15,-30	;0
	pb	0,15,-10	;1
	pb	0,10,20	;2
	PointsXb	4
	pb	-15,0,-10	;3
	pb	5,-10,-10	;5
	pb	9,-2,-5	;7
	pb	20,-20,40	;9

	EndPoints
d_head_0_F
	Vizis	14
	Viz	5,2,6,0,106,70	;0
	Viz	5,4,7,-78,78,63	;1
	Viz	4,2,7,-79,75,65	;2
	Viz	1,2,4,-89,-89,15	;3
	Viz	3,2,1,89,-89,15	;4
	Viz	7,2,5,-76,79,65	;5
	Viz	8,3,6,78,78,63	;6
	Viz	8,2,3,79,75,65	;7
	Viz	6,2,8,76,79,65	;8
	Viz	0,4,5,-90,90,0	;9
	Viz	6,3,0,90,90,0	;12
	Viz	0,5,6,0,123,31	;13
	Viz	0,3,1,62,-62,-92	;14
	Viz	1,4,0,-62,-62,-92	;15
	BSPInit	d_head_0_EBSP
	BSP	9,d_head_0_f1,.bsp2
	BSPE	d_head_0_f3
.bsp2	BSPE	d_head_0_f4

d_head_0_f1	Faces
	Face3	23,9,-90,90,0,0,4,5
	FendQ
d_head_0_f3	Faces
	Face3	27,0,0,106,70,5,2,6
	Face3	44,6,78,78,63,8,3,6
	Face3	10,7,79,75,65,8,2,3
	Face3	21,8,76,79,65,6,2,8
	Face3	21,10,90,90,0,6,3,0
	Face3	25,11,0,123,31,0,5,6
	Face3	10,2,-79,75,65,4,2,7
	Face3	23,5,-76,79,65,7,2,5
	Face2	44,-1,0,114,57,10,6
	Face3	14,3,-89,-89,15,1,2,4
	Face3	12,4,89,-89,15,3,2,1
	Face3	14,12,62,-62,-92,0,3,1
	Face3	16,13,-62,-62,-92,1,4,0
	FendQ
d_head_0_f4	Faces
	Face3	44,1,-78,78,63,5,4,7
	Face2	44,-1,127,0,0,5,9
	FendQ
d_head_0_EBSP
	EndShape

	endc
;--Shape file ----- C:\SHED\NSHAPES\d_body_0.txt ----
	ifne	DO_HDR

d_body_0
	ShapeHdr	d_body_0_P,0,d_body_0_F,0,0,0,0,1,0,30,20,15,36,id_0_c,0,0,0,0,<d_body_0>
	elseif
d_body_0_P
	Pointsb	3
	pb	0,0,-15	;0
	pb	0,-8,0	;1
	pb	0,0,15	;2
	PointsXb	2
	pb	-30,20,0	;3
	pb	-10,9,0	;5

	EndPoints
d_body_0_F
	Vizis	6
	Viz	5,6,0,0,-109,-65	;0
	Viz	1,0,6,-106,62,-33	;1
	Viz	5,0,1,106,62,-33	;2
	Viz	2,6,5,0,-109,65	;3
	Viz	6,2,1,-106,62,33	;4
	Viz	1,2,5,106,62,33	;5
	BSPInit	d_body_0_EBSP
	BSP	1,d_body_0_f1,.bsp2
	BSPE	d_body_0_f3
.bsp2	BSPE	d_body_0_f4

d_body_0_f1	Faces
	Face3	25,1,-106,62,-33,1,0,6
	FendQ
d_body_0_f3	Faces
	Face3	12,0,0,-109,-65,5,6,0
	Face3	21,2,106,62,-33,5,0,1
	Face3	14,3,0,-109,65,2,6,5
	Face3	23,5,106,62,33,1,2,5
	Face2	43,-1,0,0,127,5,3
	Face3	27,4,-106,62,33,6,2,1
	FendQ
d_body_0_f4	Faces
	Face2	43,-1,0,0,127,4,6
	FendQ
d_body_0_EBSP
	EndShape

	endc

;--Shape file ----- shapes\d_head_s.txt ----
	ifne	DO_HDR

d_head_s
	shapehdr_s	d_head_s_P,0,d_head_s_F,0,0,0,0,2,0,15,10,4,14,id_0_c,0,0,0,0,<d_head_s>
	elseif
d_head_s_P
	datahdr
	Pointsb	3
	pb	0,10,-4	;0
	pb	0,5,0	;1
	pb	0,10,4	;2
	PointsXb	2
	pb	15,0,0	;3
	pb	10,-10,0	;5

	EndPoints
d_head_s_F
	Vizis	8
	Viz	5,3,1,0,0,127	;0
	Viz	1,4,6,0,0,127	;1
	Viz	5,1,6,0,0,127	;2
	Viz	0,4,3,0,-47,118	;3
	Viz	1,3,5,0,0,-127	;4
	Viz	6,4,1,0,0,-127	;5
	Viz	6,1,5,0,0,-127	;6
	Viz	3,4,2,0,-47,-118	;7
	BSPInit	d_head_s_EBSP
	BSP	0,d_head_s_f1,.bsp2
	BSPE	d_head_s_f3
.bsp2	BSPE	d_head_s_f4

d_head_s_f1	Faces
	Face3	46,0,0,0,127,5,3,1
	FendQ
d_head_s_f3	Faces
	Face3	0,3,0,-47,118,0,4,3
	FendQ
d_head_s_f4	Faces
	Face3	46,1,0,0,127,1,4,6
	Face3	0,2,0,0,127,5,1,6
	Face3	0,7,0,-47,-118,3,4,2
	Face3	46,4,0,0,-127,1,3,5
	Face3	46,5,0,0,-127,6,4,1
	Face3	0,6,0,0,-127,6,1,5
	FendQ
d_head_s_EBSP
	EndShape

	endc
;--Shape file ----- shapes\d_body_s.txt ----
	ifne	DO_HDR

d_body_s
	shapehdr_s	d_body_s_P,0,d_body_s_F,0,0,0,0,2,0,10,10,5,11,id_0_c,0,0,0,0,<d_body_s>
	elseif
d_body_s_P
	datahdr
	Pointsb	3
	pb	0,0,-5	;0
	pb	0,-10,0	;1
	pb	0,0,5	;2
	PointsXb	1
	pb	10,7,0	;3

	EndPoints
d_body_s_F
	Vizis	4
	Viz	1,3,4,0,0,127	;0
	Viz	2,3,4,0,-74,103	;1
	Viz	4,3,1,0,0,-127	;2
	Viz	4,3,0,0,-74,-103	;3

d_body_s_f1	Faces
	Face3	0,0,0,0,127,1,3,4
	Face3	0,2,0,0,-127,4,3,1
	Face3	23,1,0,-74,103,2,3,4
	Face3	23,3,0,-74,-103,4,3,0
	Fend
	EndShape

	endc
;--Shape file ----- shapes\cameleon.txt ----
	ifne	DO_HDR

cameleon
	shapehdr	cameleon_P,0,cameleon_F,0,0,0,0,0,0,80,40,20,80,id_0_c,0,0,0,0,<cameleon>
	elseif
cameleon_P
	datahdr
	Pointsb	2
	pb	0,40,-10	;0
	pb	0,-25,-10	;1
	PointsXb	11
	pb	-80,5,-10	;2
	pb	-80,-5,-10	;4
	pb	-30,25,0	;6
	pb	-10,10,0	;8
	pb	-60,10,0	;10
	pb	-10,-10,0	;12
	pb	-60,-10,0	;14
	pb	-30,-25,0	;16
	pb	30,3,20	;18
	pb	5,0,20	;20
	pb	30,-3,20	;22

	EndPoints
cameleon_F
	Vizis	22
	Viz	19,23,12,-90,0,90	;0
	Viz	16,12,23,-57,76,84	;1
	Viz	23,19,10,70,0,106	;2
	Viz	14,16,23,40,81,89	;3
	Viz	19,8,6,-57,-76,84	;4
	Viz	19,6,10,40,-81,89	;5
	Viz	2,4,14,57,0,114	;6
	Viz	9,13,22,90,0,90	;7
	Viz	22,13,17,57,76,84	;8
	Viz	15,11,18,-70,0,106	;9
	Viz	22,17,15,-40,81,89	;10
	Viz	7,9,18,57,-76,84	;11
	Viz	11,7,18,-40,-81,89	;12
	Viz	11,15,5,-57,0,114	;13
	Viz	13,9,20,-123,0,31	;14
	Viz	21,8,12,123,0,31	;15
	Viz	20,9,0,-104,-52,52	;16
	Viz	1,13,20,-70,87,61	;17
	Viz	21,12,1,70,87,61	;18
	Viz	20,21,1,0,98,81	;19
	Viz	0,8,21,104,-52,52	;20
	Viz	0,21,20,0,-76,102	;21
	BSPInit	cameleon_EBSP
	BSP	0,cameleon_f1,.bsp2
	BSPE	cameleon_f3
.bsp2	BSP	7,cameleon_f4,.bsp5
	BSPE	cameleon_f6
.bsp5	BSPE	cameleon_f7

cameleon_f1	Faces
	Face4	10,0,-90,0,90,19,23,12,8
	FendQ
cameleon_f3	Faces
	Face4	1,6,57,0,114,2,4,14,10
	Face4	44,2,70,0,106,23,19,10,14
	Face3	0,1,-57,76,84,16,12,23
	Face3	0,3,40,81,89,14,16,23
	Face3	0,4,-57,-76,84,19,8,6
	Face3	0,5,40,-81,89,19,6,10
	FendQ
cameleon_f4	Faces
	Face4	10,7,90,0,90,9,13,22,18
	FendQ
cameleon_f6	Faces
	Face4	1,13,-57,0,114,11,15,5,3
	Face4	44,9,-70,0,106,15,11,18,22
	Face3	0,8,57,76,84,22,13,17
	Face3	0,10,-40,81,89,22,17,15
	Face3	0,11,57,-76,84,7,9,18
	Face3	0,12,-40,-81,89,11,7,18
	FendQ
cameleon_f7	Faces
	Face3	7,14,-123,0,31,13,9,20
	Face3	7,15,123,0,31,21,8,12
	Face3	0,16,-104,-52,52,20,9,0
	Face3	0,17,-70,87,61,1,13,20
	Face3	0,18,70,87,61,21,12,1
	Face3	7,19,0,98,81,20,21,1
	Face3	0,20,104,-52,52,0,8,21
	Face3	43,21,0,-76,102,0,21,20
	FendQ
cameleon_EBSP
	EndShape

	endc
;--Shape file ----- shapes\sea_0.txt ----
	ifne	DO_HDR

sea_0
	shapehdr	sea_0_P,0,sea_0_F,0,0,0,0,0,0,35,47,30,56,id_0_c,0,0,sea_0_s,sea_0_s,<sea_0>
	elseif
sea_0_P
	datahdr
	Pointsb	4
	pb	0,33,-15	;0
	pb	0,-32,-10	;1
	pb	0,-12,15	;2
	pb	0,-2,25	;3
	PointsXb	6
	pb	35,23,-30	;4
	pb	15,3,-10	;6
	pb	25,-2,-10	;8
	pb	10,-22,-10	;10
	pb	20,-47,5	;12
	pb	5,-7,15	;14

	EndPoints
sea_0_F
	Vizis	14
	Viz	14,15,2,0,0,127	;0
	Viz	2,15,11,78,78,63	;1
	Viz	11,15,9,90,68,59	;2
	Viz	9,15,7,50,-100,60	;3
	Viz	14,3,15,0,114,57	;4
	Viz	15,3,0,114,-42,36	;5
	Viz	3,14,0,-114,-42,36	;6
	Viz	7,15,0,95,-58,61	;7
	Viz	1,10,14,-78,78,63	;8
	Viz	8,14,10,-90,68,59	;9
	Viz	6,14,8,-50,-100,60	;10
	Viz	0,14,6,-95,-58,61	;11
	Viz	5,9,7,34,-68,102	;14
	Viz	6,8,4,-34,-68,102	;15
	BSPInit	sea_0_EBSP
	BSP	2,sea_0_f1,.bsp2
	BSP	4,sea_0_f3,.bsp4
	BSPE	sea_0_f5
.bsp4	BSPE	sea_0_f6
.bsp2	BSPE	sea_0_f7

sea_0_f1	Faces
	Face3	34,2,90,68,59,11,15,9
	FendQ
sea_0_f3	Faces
	Face3	20,4,0,114,57,14,3,15
	FendQ
sea_0_f5	Faces
	Face3	32,3,50,-100,60,9,15,7
	Face3	16,6,-114,-42,36,3,14,0
	Face3	14,7,95,-58,61,7,15,0
	Face3	30,10,-50,-100,60,6,14,8
	Face3	12,11,-95,-58,61,0,14,6
	Face3	30,12,34,-68,102,5,9,7
	Face3	28,13,-34,-68,102,6,8,4
	Face3	18,5,114,-42,36,15,3,0
	Face3	32,9,-90,68,59,8,14,10
	FendQ
sea_0_f6	Faces
	Face4	18,8,-78,78,63,1,10,14,2
	Face2	43,-1,0,0,0,10,12
	Face3	43,0,0,0,127,14,15,2
	FendQ
sea_0_f7	Faces
	Face4	20,1,78,78,63,2,15,11,1
	Face2	43,-1,0,0,0,13,11
	FendQ
sea_0_EBSP
	EndShape

	endc
;--Shape file ----- shapes\sea_0_s.txt ----
	ifne	DO_HDR

sea_0_s
	shapehdr_s	sea_0_s_P,0,sea_0_s_F,0,0,0,0,0,0,35,33,20,42,id_0_c,0,0,0,0,<sea_0_s>
	elseif
sea_0_s_P
	datahdr
	Pointsb	2
	pb	0,33,0	;0
	pb	0,-32,0	;1
	PointsXb	3
	pb	35,23,-20	;2
	pb	15,3,0	;4
	pb	25,-2,0	;6

	EndPoints
sea_0_s_F
	Vizis	4
	Viz	1,6,4,0,0,127	;0
	Viz	5,4,0,0,0,127	;1
	Viz	4,6,2,-34,-68,102	;2
	Viz	3,7,5,34,-68,102	;3

sea_0_s_f1	Faces
	Face3	30,2,-34,-68,102,4,6,2
	Face3	30,3,34,-68,102,3,7,5
	Face5	0,0,0,0,127,1,6,4,5,7
	Face3	0,1,0,0,127,5,4,0
	Fend
	EndShape

	endc
;--Shape file ----- shapes\sea_0_0.txt ----
	ifne	DO_HDR

sea_0_0
	shapehdr	SEA_0_0_P,0,SEA_0_0_F,0,0,0,0,0,0,20/2,25/2,10/2,34,id_0_c,0,0,0,0,<SEA_0_0>
	elseif
sea_0_0_P
	datahdr
	Pointsb	2
	pb	0,-10,-10	;0
	pb	0,0,3	;1
	PointsXb	2
	pb	10,0,-10	;2
	pb	20,-25,5	;4

	EndPoints
sea_0_0_F
	Vizis	2
	Viz	3,0,1,79,79,61	;0
	Viz	1,0,2,-79,79,61	;3

sea_0_0_f1	Faces
	Face3	20,0,79,79,61,3,0,1
	Face3	18,1,-79,79,61,1,0,2
	Face2	43,-1,0,0,0,5,3
	Face2	43,-1,0,0,0,2,4
	Fend
	EndShape

	endc
;--Shape file ----- shapes\sea_0_1.txt ----
	ifne	DO_HDR

sea_0_1
	shapehdr	SEA_0_1_P,0,SEA_0_1_F,0,0,0,0,0,0,21/2,40/2,15/2,49,id_0_c,0,0,0,0,<SEA_0_1>
	elseif
sea_0_1_P
	datahdr
	Pointsb	2
	pb	0,-25,-10	;0
	pb	0,-5,15	;1
	PointsXb	4
	pb	-21,0,-10	;2
	pb	10,-15,-10	;4
	pb	20,-40,5	;6
	pb	5,0,15	;8

	EndPoints
sea_0_1_F
	Vizis	5
	Viz	8,9,1,0,0,127	;0
	Viz	1,9,5,78,78,63	;1
	Viz	5,9,2,91,67,58	;2
	Viz	0,4,8,-78,78,63	;3
	Viz	3,8,4,-91,67,58	;6
	BSPInit	sea_0_1_EBSP
	BSP	2,sea_0_1_f1,.bsp2
	BSPE	sea_0_1_f3
.bsp2	BSPE	sea_0_1_f4

sea_0_1_f1	Faces
	Face3	34,2,91,67,58,5,9,2
	FendQ
sea_0_1_f3	Faces
	Face4	18,3,-78,78,63,0,4,8,1
	Face3	32,4,-91,67,58,3,8,4
	Face2	43,-1,0,0,0,4,6
	Face3	43,0,0,0,127,8,9,1
	FendQ
sea_0_1_f4	Faces
	Face4	20,1,78,78,63,1,9,5,0
	Face2	43,-1,0,0,0,7,5
	FendQ
sea_0_1_EBSP
	EndShape

	endc
;--Shape file ----- shapes\saushad.txt ----
	ifne	DO_HDR

saushad
	shapehdr	saushad_P,0,saushad_F,0,0,0,0,0,0,30,20,30,36,black_c,0,0,0,0,<saushad>
	elseif
saushad_P
	datahdr
	Pointsb	2
	pb	0,20,-30	;0
	pb	0,20,30	;1
	PointsXb	3
	pb	20,20,-20	;2
	pb	-30,20,0	;4
	pb	20,20,20	;6

	EndPoints
saushad_F
	Vizis	1
	Viz	5,6,1,0,127,0	;0

saushad_f1	Faces
	Face8	15,0,0,127,0,5,6,1,7,4,3,0,2
	Fend
	EndShape

	endc

;--Shape file ----- shapes\eject.txt ----
	ifne	DO_HDR

eject
	shapehdr	eject_P,0,eject_F,0,0,0,0,0,0,12,126,12,127,id_0_c,0,0,0,0,<eject>
	elseif
eject_P
	datahdr
	Pointsb	12
	pb	0,20,0	;0
	pb	0,8,0	;1
	pb	-4,7,0	;2
	pb	6,7,0	;3
	pb	-6,4,0	;4
	pb	6,3,0	;5
	pb	6,-3,0	;6
	pb	-6,-4,0	;7
	pb	-4,-7,0	;8
	pb	6,-7,0	;9
	pb	0,-8,0	;10
	pb	0,-20,0	;11
	PointsXb	2
	pb	10,0,-4	;12
	pb	10,0,4	;14

	EndPoints
eject_F
	Vizis	8
	Viz	12,14,11,-114,57,0	;0
	Viz	11,15,13,114,57,0	;1
	Viz	0,14,12,-114,-57,0	;2
	Viz	13,15,0,114,-57,0	;3
	Viz	12,11,13,0,25,-125	;4
	Viz	15,11,14,0,25,125	;5
	Viz	13,0,12,0,-25,-125	;6
	Viz	14,0,15,0,-25,125	;7

eject_f1	Faces
	Face2	43,-1,0,0,0,6,11
	Face2	44,-1,0,0,0,11,7
	Face2	43,-1,0,0,0,7,9
	Face2	44,-1,0,0,0,8,6
	Face2	43,-1,0,0,0,10,8
	Face2	44,-1,0,0,0,9,10
	Face2	43,-1,0,0,0,2,1
	Face2	44,-1,0,0,0,1,3
	Face2	43,-1,0,0,0,3,4
	Face2	44,-1,0,0,0,5,2
	Face2	43,-1,0,0,0,0,5
	Face2	44,-1,0,0,0,4,0
	Face3	0,0,-114,57,0,12,14,11
	Face3	0,1,114,57,0,11,15,13
	Face3	0,2,-114,-57,0,0,14,12
	Face3	0,3,114,-57,0,13,15,0
	Face3	0,4,0,25,-125,12,11,13
	Face3	43,5,0,25,125,15,11,14
	Face3	44,6,0,-25,-125,13,0,12
	Face3	0,7,0,-25,125,14,0,15
	Fend
	EndShape

	endc
;--Shape file ----- shapes\bit_0.txt ----
	ifne	DO_HDR

bit_0
	shapehdr	bit_0_P,0,bit_0_F,0,0,0,0,0,0,10,50,40,64,id_0_c,0,0,0,0,<bit_0>
	elseif
bit_0_P
	datahdr
	Pointsb	8
	pb	0,50,-40	;0
	pb	0,-50,-40	;1
	pb	0,5,-20	;2
	pb	0,-5,-20	;3
	pb	0,20,-10	;4
	pb	0,-20,-10	;5
	pb	0,5,20	;6
	pb	0,-5,20	;7
	PointsXb	4
	pb	-10,30,-20	;8
	pb	10,-30,-20	;10
	pb	-10,15,-10	;12
	pb	10,-15,-10	;14

	EndPoints
bit_0_F
	Vizis	12
	Viz	14,7,15,0,120,40	;0
	Viz	12,6,13,0,-120,40	;1
	Viz	6,12,15,120,0,40	;2
	Viz	7,14,13,-120,0,40	;3
	Viz	15,3,14,0,90,-90	;4
	Viz	13,2,12,0,-90,-90	;5
	Viz	3,15,12,90,0,-90	;6
	Viz	2,13,14,-90,0,-90	;7
	Viz	10,1,11,0,-90,-90	;8
	Viz	5,11,1,0,90,90	;9
	Viz	4,8,0,0,90,-90	;10
	Viz	9,0,8,0,-90,90	;11
	BSPInit	bit_0_EBSP
	BSP	0,bit_0_f1,.bsp2
	BSPE	bit_0_f3
.bsp2	BSPE	bit_0_f4

bit_0_f1	Faces
	Face3	20,0,0,120,40,14,7,15
	FendQ
bit_0_f3	Faces
	Face3	16,1,0,-120,40,12,6,13
	Face3	6,5,0,-90,-90,13,2,12
	Face4	6,6,90,0,-90,3,15,12,2
	Face4	6,7,-90,0,-90,2,13,14,3
	Face4	43,10,0,90,-90,4,8,0,9
	Face4	6,11,0,-90,90,9,0,8,4
	Face4	14,2,120,0,40,6,12,15,7
	Face4	18,3,-120,0,40,7,14,13,6
	Face3	6,4,0,90,-90,15,3,14
	FendQ
bit_0_f4	Faces
	Face4	43,8,0,-90,-90,10,1,11,5
	Face4	6,9,0,90,90,5,11,1,10
	FendQ
bit_0_EBSP
	EndShape

	endc


	IFEQ	1
;--Shape file ----- shapes\torpedo.txt ----
	ifne	DO_HDR

torpedo
	shapehdr	torpedo_P,0,torpedo_F,0,0,0,0,0,0,40,35,40,43,id_0_c,0,0,0,0,<torpedo>
	elseif
torpedo_P
	datahdr
	Pointsb	6
	pb	0,15,-40	;0
	pb	0,-35,-20	;1
	pb	0,-5,-10	;2
	pb	0,15,15	;3
	pb	0,-15,20	;4
	pb	0,5,40	;5
	PointsXb	4
	pb	40,25,-16	;6
	pb	-25,20,15	;8
	pb	-15,5,15	;10
	pb	-5,-5,15	;12

	EndPoints
torpedo_F
	Vizis	20
	Viz	5,12,4,115,38,38	;0
	Viz	4,13,5,-115,38,38	;1
	Viz	10,12,5,83,83,50	;2
	Viz	5,13,11,-83,83,50	;3
	Viz	10,5,3,67,-100,40	;4
	Viz	3,5,11,-67,-100,40	;5
	Viz	2,4,12,107,64,-21	;6
	Viz	12,10,2,89,89,-18	;7
	Viz	0,10,3,70,-106,0	;8
	Viz	2,10,0,105,59,-39	;9
	Viz	13,4,2,-107,64,-21	;10
	Viz	2,11,13,-89,89,-18	;11
	Viz	3,11,0,-70,-106,0	;12
	Viz	0,11,2,-105,59,-39	;13
	Viz	2,4,1,-127,0,0	;14
	Viz	1,4,2,127,0,0	;15
	Viz	10,8,7,101,67,38	;16
	Viz	7,8,10,-101,-67,-38	;17
	Viz	6,9,11,-101,67,38	;18
	Viz	11,9,6,101,-67,-38	;19
	BSPInit	torpedo_EBSP
	BSP	4,torpedo_f1,.bsp2
	BSP	5,torpedo_f3,.bsp4
	BSP	14,torpedo_f5,.bsp6
	BSPE	torpedo_f7
.bsp6	BSP	15,torpedo_f8,.bsp9
	BSPE	torpedo_f10
.bsp9	BSPE	torpedo_f11
.bsp4	BSPE	torpedo_f12
.bsp2	BSPE	torpedo_f13

torpedo_f1	Faces
	Face3	0,4,67,-100,40,10,5,3
	FendQ
torpedo_f3	Faces
	Face3	0,5,-67,-100,40,3,5,11
	FendQ
torpedo_f5	Faces
	Face3	7,14,-127,0,0,2,4,1
	FendQ
torpedo_f7	Faces
	Face3	7,2,83,83,50,10,12,5
	Face3	7,7,89,89,-18,12,10,2
	Face3	0,8,70,-106,0,0,10,3
	Face3	7,9,105,59,-39,2,10,0
	FendQ
torpedo_f8	Faces
	Face3	7,15,127,0,0,1,4,2
	FendQ
torpedo_f10	Faces
	Face3	7,3,-83,83,50,5,13,11
	Face3	7,11,-89,89,-18,2,11,13
	Face3	0,12,-70,-106,0,3,11,0
	Face3	7,13,-105,59,-39,0,11,2
	FendQ
torpedo_f11	Faces
	Face3	0,0,115,38,38,5,12,4
	Face3	0,1,-115,38,38,4,13,5
	Face3	0,6,107,64,-21,2,4,12
	Face3	0,10,-107,64,-21,13,4,2
	FendQ
torpedo_f12	Faces
	Face3	7,18,-101,67,38,6,9,11
	Face3	0,19,101,-67,-38,11,9,6
	FendQ
torpedo_f13	Faces
	Face3	7,16,101,67,38,10,8,7
	Face3	0,17,-101,-67,-38,7,8,10
	FendQ
torpedo_EBSP
	EndShape

	endc

	ENDC


;--Shape file ----- SHAPES\KAMIKAZE.TXT ----
	ifne	DO_HDR

KAMIKAZE
	shapehdr	KAMIKAZE_P,0,KAMIKAZE_F,0,0,0,0,0,0,10,40,50,57,id_0_c,0,0,0,kami_s,<KAMIKAZE>
	elseif
KAMIKAZE_P
	datahdr
	Pointsb	8
	pb	0,10,50	;0
	pb	0,25,-20	;1
	pb	0,0,30	;2
	pb	0,-10,50	;3
	pb	0,-40,-40	;4
	pb	0,-25,-20	;5
	pb	10,-10,-10	;6
	pb	0,0,0	;7
	PointsXb	1
	pb	-10,10,-10	;8
	Pointsb	3
	pb	0,0,-40	;10
	pb	0,40,-40	;11
	pb	-10,-10,-10	;12

	EndPoints
KAMIKAZE_F
	Vizis	16
	Viz	0,8,9,0,127,0	;0
	Viz	9,8,7,0,-90,90	;1
	Viz	7,12,6,0,90,90	;2
	Viz	6,12,3,0,-127,0	;3
	Viz	8,0,1,99,-77,17	;4
	Viz	1,0,9,-99,-77,17	;5
	Viz	7,8,12,90,0,90	;6
	Viz	8,10,12,120,0,-40	;7
	Viz	6,9,7,-90,0,90	;8
	Viz	6,10,9,-120,0,-40	;9
	Viz	1,9,8,0,70,-106	;11
	Viz	8,9,10,0,-120,-40	;12
	Viz	5,3,12,99,77,17	;15
	Viz	6,3,5,-99,77,17	;16
	Viz	12,6,5,0,-70,-106	;17
	Viz	10,6,12,0,120,-40	;18
	BSPInit	KAMIKAZE_EBSP
	BSP	0,KAMIKAZE_f1,.bsp2
	BSPE	KAMIKAZE_f3
.bsp2	BSP	3,KAMIKAZE_f4,.bsp5
	BSPE	KAMIKAZE_f6
.bsp5	BSPE	KAMIKAZE_f7

KAMIKAZE_f1	Faces
	Face3	0,0,0,127,0,0,8,9
	FendQ
KAMIKAZE_f3	Faces
	Face3	30,4,99,-77,17,8,0,1
	Face3	32,5,-99,-77,17,1,0,9
	Face3	43,10,0,70,-106,1,9,8
	Face2	44,-1,0,0,0,1,11
	FendQ
KAMIKAZE_f4	Faces
	Face3	0,3,0,-127,0,6,12,3
	FendQ
KAMIKAZE_f6	Faces
	Face3	30,12,99,77,17,5,3,12
	Face3	32,13,-99,77,17,6,3,5
	Face3	43,14,0,-70,-106,12,6,5
	Face2	44,-1,0,0,0,4,5
	FendQ
KAMIKAZE_f7	Faces
	Face3	45,1,0,-90,90,9,8,7
	Face3	45,2,0,90,90,7,12,6
	Face3	0,6,90,0,90,7,8,12
	Face3	0,8,-90,0,90,6,9,7
	Face2	42,-1,-127,0,0,2,7
	Face3	0,7,120,0,-40,8,10,12
	Face3	0,9,-120,0,-40,6,10,9
	Face3	45,11,0,-120,-40,8,9,10
	Face3	45,15,0,120,-40,10,6,12
	FendQ
KAMIKAZE_EBSP
	EndShape

	endc

;--Shape file ----- SHAPES\KAMI_S.TXT ----
	ifne	DO_HDR

kami_s
	shapehdr	KAMI_S_P,0,KAMI_S_F,0,0,0,0,0,0,10,40,50,57,id_0_c,0,0,0,0,<KAMI_S>
	elseif
kami_s_P
	datahdr
	Pointsb	8
	pb	0,10,-10	;0
	pb	0,25,-20	;1
	pb	0,0,30	;2
	pb	0,-10,50	;3
	pb	0,-40,-40	;4
	pb	0,-25,-20	;5
	pb	10,-10,-10	;6
	pb	0,0,0	;7
	PointsXb	1
	pb	-10,10,-10	;8
	Pointsb	5
	pb	0,0,-40	;10
	pb	0,10,50	;11
	pb	-10,-10,-10	;12
	pb	0,-10,-10	;13
	pb	0,40,-40	;14

	EndPoints
kami_s_F
	Vizis	10
	Viz	6,9,8,0,0,127	;0
	Viz	9,6,12,0,0,-127	;1
	Viz	10,13,7,127,0,0	;2
	Viz	13,10,0,-127,0,0	;3
	Viz	0,11,1,127,0,0	;4
	Viz	1,11,0,-127,0,0	;5
	Viz	5,3,13,127,0,0	;9
	Viz	13,3,5,-127,0,0	;10
	Viz	5,6,12,0,70,106	;11
	Viz	12,6,5,0,-70,-106	;12
	BSPInit	kami_s_EBSP
	BSP	-1,kami_s_f1,.bsp2
	BSP	8,kami_s_f3,.bsp4
	BSPE	kami_s_f5
.bsp4	BSPE	kami_s_f6
.bsp2	BSPE	kami_s_f7

kami_s_f1	Faces
	Face2	44,-1,90,0,90,1,14
	FendQ
kami_s_f3	Faces
	Face3	30,8,0,70,106,5,6,12
	FendQ
kami_s_f5	Faces
	Face4	16,0,0,0,127,6,9,8,12
	Face4	16,1,0,0,-127,9,6,12,8
	Face4	16,2,127,0,0,10,13,7,0
	Face4	16,3,-127,0,0,13,10,0,7
	Face2	42,-1,120,0,-40,2,7
	FendQ
kami_s_f6	Faces
	Face3	45,9,0,-70,-106,12,6,5
	FendQ
kami_s_f7	Faces
	Face3	30,4,127,0,0,0,11,1
	Face3	30,5,-127,0,0,1,11,0
	Face2	44,-1,-90,0,90,4,5
	Face3	30,6,127,0,0,5,3,13
	Face3	30,7,-127,0,0,13,3,5
	FendQ
kami_s_EBSP
	EndShape

	endc



	ifeq	1
;--Shape file ----- shapes\boss_5_0.txt ----
	ifne	DO_HDR

boss_5_0
	shapehdr	BOSS_5_0_P,0,BOSS_5_0_F,0,200,0,0,boss5_scale,boss_5_0_col,45,45,20,51,id_0_c,0,0,0,0,<BOSS_5_0>
	elseif
boss_5_0_P
	datahdr
	Pointsb	8
	pb	7,8,-20	;0
	pb	-8,8,-20	;1
	pb	7,-7,-20	;2
	pb	-8,-7,-20	;3
	pb	2,3,-10	;4
	pb	-3,3,-10	;5
	pb	2,-2,-10	;6
	pb	-3,-2,-10	;7
	PointsXb	12
	pb	5,45,-20	;8
	pb	5,15,-20	;10
	pb	15,5,-20	;12
	pb	45,5,-20	;14
	pb	15,-5,-20	;16
	pb	45,-5,-20	;18
	pb	5,-15,-20	;20
	pb	-5,-45,-20	;22
	pb	2,30,-15	;24
	pb	-30,2,-15	;26
	pb	30,-2,-15	;28
	pb	-2,-30,-15	;30

	EndPoints
boss_5_0_F
	Vizis	29
	Viz	7,6,4,0,0,127	;0
	Viz	5,4,10,0,-81,98	;1
	Viz	4,6,16,-77,0,101	;2
	Viz	10,4,0,-104,-30,67	;3
	Viz	4,12,0,-37,-100,69	;4
	Viz	1,5,11,98,-42,70	;5
	Viz	1,13,5,42,-98,70	;6
	Viz	13,17,7,81,0,98	;7
	Viz	2,6,20,-105,26,66	;8
	Viz	2,16,6,-26,105,66	;9
	Viz	21,20,6,0,77,101	;10
	Viz	21,7,3,100,37,69	;11
	Viz	7,17,3,30,104,67	;12
	Viz	28,27,12,40,0,120	;13
	Viz	12,27,14,0,-109,65	;14
	Viz	18,28,16,0,109,65	;15
	Viz	18,14,27,-40,0,120	;16
	Viz	17,13,26,-40,0,120	;17
	Viz	15,26,13,0,-109,65	;18
	Viz	17,29,19,0,109,65	;19
	Viz	29,26,15,40,0,120	;20
	Viz	30,31,20,0,-40,120	;21
	Viz	11,10,24,0,40,120	;22
	Viz	25,24,8,0,-40,120	;23
	Viz	22,23,31,0,40,120	;24
	Viz	20,31,23,-109,0,65	;25
	Viz	22,30,21,109,0,65	;26
	Viz	8,24,10,-109,0,65	;27
	Viz	11,25,9,109,0,65	;28
	BSPInit	boss_5_0_EBSP
	BSP	1,boss_5_0_f1,.bsp2
	BSP	2,boss_5_0_f3,.bsp4
	BSP	7,boss_5_0_f5,.bsp6
	BSPE	boss_5_0_f7
.bsp6	BSPE	boss_5_0_f8
.bsp4	BSPE	boss_5_0_f9
.bsp2	BSPE	boss_5_0_f10

boss_5_0_f1	Faces
	Face4	28,1,0,-81,98,5,4,10,11
	FendQ
boss_5_0_f3	Faces
	Face4	30,2,-77,0,101,4,6,16,12
	FendQ
boss_5_0_f5	Faces
	Face4	32,7,81,0,98,13,17,7,5
	FendQ
boss_5_0_f7	Faces
	Face4	34,10,0,77,101,21,20,6,7
	Face4	0,21,0,-40,120,30,31,20,21
	Face3	14,8,-105,26,66,2,6,20
	Face3	18,11,100,37,69,21,7,3
	Face3	7,26,109,0,65,22,30,21
	Face4	10,24,0,40,120,22,23,31,30
	Face3	7,25,-109,0,65,20,31,23
	FendQ
boss_5_0_f8	Faces
	Face4	0,17,-40,0,120,17,13,26,29
	Face3	14,6,42,-98,70,1,13,5
	Face3	16,12,30,104,67,7,17,3
	Face3	7,18,0,-109,65,15,26,13
	Face3	7,19,0,109,65,17,29,19
	Face4	10,20,40,0,120,29,26,15,19
	FendQ
boss_5_0_f9	Faces
	Face4	0,13,40,0,120,28,27,12,16
	Face3	14,4,-37,-100,69,4,12,0
	Face3	16,9,-26,105,66,2,16,6
	Face3	7,14,0,-109,65,12,27,14
	Face3	7,15,0,109,65,18,28,16
	Face4	10,16,-40,0,120,18,14,27,28
	FendQ
boss_5_0_f10	Faces
	Face4	0,22,0,40,120,11,10,24,25
	Face3	7,28,109,0,65,11,25,9
	Face3	12,3,-104,-30,67,10,4,0
	Face3	16,5,98,-42,70,1,5,11
	Face4	43,0,0,0,127,7,6,4,5
	Face4	10,23,0,-40,120,25,24,8,9
	Face3	7,27,-109,0,65,8,24,10
	FendQ
boss_5_0_EBSP
	EndShape

	endc
;--Shape file ----- shapes\boss_5_1.txt ----
	ifne	DO_HDR

BOSS_5_1u	shapehdr	BOSS_5_1_P,0,BOSS_5_1_F,0,0,0,0,boss5_scale,boss_5_1u_col,35,20,20,24,id_0_c,0,0,0,0,<BOSS_5_1>
BOSS_5_1d	shapehdr	BOSS_5_1_P,0,BOSS_5_1_F,0,0,0,0,boss5_scale,boss_5_1d_col,35,20,20,24,id_0_c,0,0,0,0,<BOSS_5_1>
BOSS_5_1l	shapehdr	BOSS_5_1_P,0,BOSS_5_1_F,0,0,0,0,boss5_scale,boss_5_1l_col,35,20,20,24,id_0_c,0,0,0,0,<BOSS_5_1>
BOSS_5_1r	shapehdr	BOSS_5_1_P,0,BOSS_5_1_F,0,0,0,0,boss5_scale,boss_5_1r_col,35,20,20,24,id_0_c,0,0,0,0,<BOSS_5_1>
;	ShapeHdr	boss_5_1_P,0,boss_5_1_F,0,0,0,0,0,59,35,55,20,59,id_0_c,0,0,0,0,<boss_5_1>
	elseif
boss_5_1_P
	datahdr
	Pointsb	2
	pb	0,-55,10	;0
	pb	0,-50,20	;1
	PointsXb	5
	pb	5,-20,10	;2
	pb	35,-40,10	;4
	pb	30,-50,10	;6
	pb	10,-35,11	;8
	pb	5,-40,20	;10

	EndPoints
boss_5_1_F
	Vizis	10
	Viz	1,10,11,0,0,127	;0
	Viz	11,10,2,0,-57,114	;1
	Viz	2,10,8,-96,-37,74	;2
	Viz	8,10,4,-23,-103,70	;3
	Viz	4,10,1,-40,20,119	;4
	Viz	9,11,3,96,-37,74	;5
	Viz	5,11,9,23,-103,70	;6
	Viz	7,1,11,40,20,119	;7
	Viz	6,1,0,-19,112,56	;8
	Viz	0,1,7,19,112,56	;9

boss_5_1_f1	Faces
	Face3	21,2,-96,-37,74,2,10,8
	Face3	23,3,-23,-103,70,8,10,4
	Face3	25,5,96,-37,74,9,11,3
	Face3	23,6,23,-103,70,5,11,9
	Face4	18,0,0,0,127,1,10,11,1
	Face4	16,1,0,-57,114,11,10,2,3
	Face4	16,4,-40,20,119,4,10,1,6
	Face4	20,7,40,20,119,7,1,11,5
	Face3	25,8,-19,112,56,6,1,0
	Face3	27,9,19,112,56,0,1,7
	Fend
	EndShape

	endc
	endc

;--Shape file ----- SHAPES\TRUCK.TXT ----
	ifne	DO_HDR

TRUCK
	ShapeHdr	TRUCK_P,0,TRUCK_F,0,0,0,0,0,0,20,60,60,81,id_0_c,0,0,0,0,<TRUCK>
	elseif
TRUCK_P
	datahdr
	PointsXb	1
	pb	-20,-20,20	;0
	Pointsb	3
	pb	10,-10,-10	;2
	pb	-10,-10,10	;3
	pb	-10,-10,-10	;4
	PointsXb	2
	pb	20,-20,-20	;5
	pb	5,-40,0	;7
	Pointsb	7
	pb	-5,-50,-30	;9
	pb	10,-50,-10	;10
	pb	5,-50,-30	;11
	pb	10,-10,10	;12
	pb	-5,-50,60	;13
	pb	0,-55,60	;14
	pb	0,-60,-10	;15
	PointsXb	1
	pb	5,-40,-10	;16
	Pointsb	2
	pb	5,-50,60	;18
	pb	-10,-50,-10	;19

	EndPoints
TRUCK_F
	Vizis	19
	Viz	5,6,4,0,-90,-90	;0
	Viz	3,4,6,90,-90,0	;1
	Viz	12,3,0,0,-90,90	;2
	Viz	1,5,2,-90,-90,0	;3
	Viz	8,7,1,0,90,90	;4
	Viz	6,5,7,0,90,-90	;5
	Viz	7,5,1,-102,76,0	;6
	Viz	8,0,6,102,76,0	;7
	Viz	13,14,18,0,0,127	;8
	Viz	18,14,15,-90,90,6	;9
	Viz	19,15,14,90,90,6	;10
	Viz	18,10,16,-113,-57,8	;11
	Viz	17,19,13,113,-57,8	;12
	Viz	16,17,13,0,-126,18	;13
	Viz	10,15,11,-88,88,-22	;14
	Viz	9,15,19,88,88,-22	;15
	Viz	16,10,11,-111,-55,-28	;16
	Viz	9,19,17,111,-55,-28	;17
	Viz	11,9,17,0,-114,-57	;18
	BSPInit	TRUCK_EBSP
	BSP	13,TRUCK_f1,.bsp2
	BSPE	TRUCK_f3
.bsp2	BSP	6,TRUCK_f4,.bsp5
	BSP	7,TRUCK_f6,.bsp7
	BSPE	TRUCK_f8
.bsp7	BSPE	TRUCK_f9
.bsp5	BSPE	TRUCK_f10

TRUCK_f1	Faces
	Face4	25,13,0,-126,18,16,17,13,18
	FendQ
TRUCK_f3	Faces
	Face4	0,9,-90,90,6,18,14,15,10
	Face4	0,10,90,90,6,19,15,14,13
	Face3	0,14,-88,88,-22,10,15,11
	Face3	0,15,88,88,-22,9,15,19
	Face3	21,16,-111,-55,-28,16,10,11
	Face3	25,17,111,-55,-28,9,19,17
	Face4	10,18,0,-114,-57,11,9,17,16
	FendQ
TRUCK_f4	Faces
	Face3	0,6,-102,76,0,7,5,1
	FendQ
TRUCK_f6	Faces
	Face3	0,7,102,76,0,8,0,6
	FendQ
TRUCK_f8	Faces
	Face4	21,0,0,-90,-90,5,6,4,2
	Face4	23,1,90,-90,0,3,4,6,0
	Face4	24,2,0,-90,90,12,3,0,1
	Face4	23,3,-90,-90,0,1,5,2,12
	Face4	0,4,0,90,90,8,7,1,0
	Face4	0,5,0,90,-90,6,5,7,8
	FendQ
TRUCK_f9	Faces
	Face3	27,12,113,-57,8,17,19,13
	FendQ
TRUCK_f10	Faces
	Face3	43,8,0,0,127,13,14,18
	Face3	23,11,-113,-57,8,18,10,16
	FendQ
TRUCK_EBSP
	EndShape

	endc


;--Shape file ----- C:\SHED\SHAPES3\RAIL_0.TXT ----
	ifne	DO_HDR
rail_0
drail_0
	ShapeHdr	drail_0_P,0,drail_0_F,0,tsize,0,0,2,0,tsize/4,5,10,tsize/4,normal_c,0,drail_0s,drail_0s,drail_0s,<drail_0>
	elseif
drail_0_P
	datahdr
	PointsXb	4
	pb	tsize/4,0,-10	;0
	pb	-tsize/4,0,-5	;2
	pb	-tsize/4,0,5	;4
	pb	-tsize/4,0,10	;6

	EndPoints
drail_0_F
	Vizis	2
	Viz	0,3,2,0,127,0	;0
	Viz	5,7,6,0,127,0	;1

drail_0_f1	Faces
	Face4	9,0,0,127,0,0,3,2,1
	Face4	9,1,0,127,0,5,7,6,4
	Fend
	EndShape

	endc

;--Shape file ----- C:\SHED\SHAPES3\RAIL_4.TXT ----
	ifne	DO_HDR

rail_4
	ShapeHdr	drail_4_P,0,drail_4_F,0,0,0,0,2,0,10,5,10,11,id_0_c,0,0,0,0,<drail_4>
drail_4
	ShapeHdr	drail_4_P,0,drail_4_F,0,0,0,0,2,0,10,5,10,11,id_0_c,0,0,0,0,<drail_4>
	elseif
drail_4_P
	datahdr
	Pointsb	4
	pb	-6,0,-5	;0
	pb	-10,0,-5	;1
	pb	6,0,5	;2
	pb	-10,0,5	;3
	PointsXb	3
	pb	6,0,-10	;4
	pb	-10,0,-10	;6
	pb	-10,0,10	;8

	EndPoints
drail_4_F
	Vizis	3
	Viz	5,0,1,0,127,0	;0
	Viz	7,9,2,0,127,0	;1
	Viz	2,9,8,0,127,0	;2

drail_4_f1	Faces
	Face4	9,0,0,127,0,5,0,1,6
	Face4	9,1,0,127,0,7,9,2,4
	Face4	9,2,0,127,0,2,9,8,3
	Fend
	EndShape

	endc

;--Shape file ----- C:\SHED\SHAPES3\drail_0.txt ----
	ifne	DO_HDR

drail_0s
	ShapeHdr_s	drail_0s_P,0,drail_0s_F,0,0,0,2,0,52,51,0,9,52,normal_c,0,0,0,0,<drail_0s>
	elseif
drail_0s_P
	datahdr
	PointsXb	2
	pb	tsize,0,-9	;0
	pb	tsize,0,9	;2

	EndPoints
drail_0s_F

drail_0s_f1	Faces
	Face2	9,-1,0,0,0,2,3
	Face2	9,-1,0,0,0,0,1
	Fend
	EndShape

	endc


;--Shape file ----- SHAPES\MISS_1_1.TXT ----
	ifne	DO_HDR

MISS_1_1
	ShapeHdr	MISS_1_1_P,0,MISS_1_1_F,0,0,0,0,1,0,20,10,20,22,id_0_c,0,0,0,0,<MISS_1_1>
	elseif
MISS_1_1_P
	datahdr
	PointsXb	3
	pb	-10,0,20	;0
	pb	-20,0,0	;2
	pb	5,-10,-10	;4
	Pointsb	1
	pb	-10,-10,0	;6
	PointsXb	1
	pb	-5,-10,10	;7
	Pointsb	1
	pb	10,-10,0	;9
	PointsXb	1
	pb	10,0,-20	;10

	EndPoints
MISS_1_1_F
	Vizis	7
	Viz	6,5,4,0,127,0	;0
	Viz	5,11,10,0,90,-90	;1
	Viz	2,11,5,85,85,-42	;2
	Viz	10,3,9,-85,85,-42	;3
	Viz	0,7,8,0,90,90	;4
	Viz	0,2,6,85,85,42	;5
	Viz	3,1,8,-85,85,42	;6

MISS_1_1_f1	Faces
	Face6	23,0,0,127,0,6,5,4,9,8,7
	Face4	13,1,0,90,-90,5,11,10,4
	Face4	12,2,85,85,-42,2,11,5,6
	Face4	14,3,-85,85,-42,10,3,9,4
	Face4	14,4,0,90,90,0,7,8,1
	Face4	13,5,85,85,42,0,2,6,7
	Face4	15,6,-85,85,42,3,1,8,9
	Fend
	EndShape

	endc
;--Shape file ----- SHAPES\MISS_1_2.TXT ----
	ifne	DO_HDR

MISS_1_2
	ShapeHdr	MISS_1_2_P,0,MISS_1_2_F,0,0,0,0,1,0,10,11,58,58,id_0_c,0,0,0,0,<MISS_1_2>
	elseif
MISS_1_2_P
	datahdr
	PointsXb	1
	pb	5,-9,-1	;0
	Pointsb	1
	pb	0,2,58	;2
	PointsXb	2
	pb	-10,1,-2	;3
	pb	-5,11,-2	;5

	EndPoints
MISS_1_2_F
	Vizis	7
	Viz	2,1,0,0,125,23	;0
	Viz	1,2,3,113,55,20	;1
	Viz	4,2,0,-113,55,20	;2
	Viz	6,5,2,0,-126,19	;3
	Viz	3,2,5,112,-56,18	;4
	Viz	6,2,4,-112,-56,18	;5
	Viz	6,4,0,13,6,-126	;6

MISS_1_2_f1	Faces
	Face3	3,0,0,125,23,2,1,0
	Face3	2,1,113,55,20,1,2,3
	Face3	5,2,-113,55,20,4,2,0
	Face3	5,3,0,-126,19,6,5,2
	Face3	3,4,112,-56,18,3,2,5
	Face3	7,5,-112,-56,18,6,2,4
	Face6	24,6,13,6,-126,6,4,0,1,3,5
	Fend
	EndShape

	endc

;--Shape file ----- C:\SHED\NSHAPES\m_tank.txt ----
	ifne	DO_HDR

m_tank
	ShapeHdr	m_tank_P,0,m_tank_F,0,0,0,0,0,0,40,65,55,87,id_0_c,0,0,0,0,<m_tank>
	elseif
m_tank_P
	Pointsb	1
	pb	0,-5,50	;0
	PointsXb	8
	pb	-20,-65,-55	;1
	pb	-40,-5,-40	;3
	pb	20,-20,-40	;5
	pb	20,-40,-40	;7
	pb	30,-5,15	;9
	pb	10,-20,15	;11
	pb	10,-25,15	;13
	pb	10,-45,40	;15

	EndPoints
m_tank_F
	Vizis	11
	Viz	16,8,7,0,127,-8	;1
	Viz	13,14,8,0,123,33	;4
	Viz	14,13,11,0,0,127	;5
	Viz	6,8,14,125,0,23	;6
	Viz	11,13,7,-125,0,23	;7
	Viz	12,11,0,0,117,50	;8
	Viz	10,12,0,68,90,58	;9
	Viz	3,6,12,76,101,14	;10
	Viz	0,11,9,-68,90,58	;11
	Viz	9,11,5,-76,101,14	;12
	Viz	15,7,8,0,-127,8	;17
	BSPInit	m_tank_EBSP
	BSP	0,m_tank_f1,.bsp2
	BSP	1,m_tank_f3,.bsp4
	BSPE	m_tank_f5
.bsp4	BSPE	m_tank_f6
.bsp2	BSPE	m_tank_f7

m_tank_f1	Faces
	Face4	27,0,0,127,-8,16,8,7,15
	FendQ
m_tank_f3	Faces
	Face4	23,1,0,123,33,13,14,8,7
	FendQ
m_tank_f5	Faces
	Face4	12,3,125,0,23,6,8,14,12
	Face4	16,4,-125,0,23,11,13,7,5
	Face3	27,5,0,117,50,12,11,0
	Face4	21,7,76,101,14,3,6,12,10
	Face4	25,9,-76,101,14,9,11,5,4
	Face3	16,6,68,90,58,10,12,0
	Face3	20,8,-68,90,58,0,11,9
	FendQ
m_tank_f6	Faces
	Face4	44,2,0,0,127,14,13,11,12
	Face2	27,-1,-65,-100,-43,16,14
	Face2	27,-1,-44,97,69,13,15
	FendQ
m_tank_f7	Faces
	Face2	27,-1,-33,-110,-55,16,1
	Face2	27,-1,0,0,-127,2,15
	Face2	23,-1,-38,38,-115,1,2
	Face2	23,-1,44,-97,-69,1,8
	Face2	23,-1,100,40,-67,7,2
	Face4	21,10,0,-127,8,15,7,8,16
	FendQ
m_tank_EBSP
	EndShape

	endc


	IFEQ	1

;--Shape file ----- C:\SHED\ANIM\HIDER.ANM ----
	ifne	DO_HDR

HIDER
	ShapeHdr	HIDER_P,0,HIDER_F,0,0,0,0,0,0,40,105,40,108,id_0_c,0,0,0,0,<HIDER>
	elseif
HIDER_P
	datahdr
	Pointsb	2
	pb	20,-10,-15	;0
	pb	-20,-10,-14	;1
	PointsXb	7
	pb	-40,40,-40	;2
	pb	40,-40,-40	;4
	pb	30,-10,-26	;6
	pb	30,-20,-26	;8
	pb	10,-20,-10	;10
	pb	10,30,0	;12
	pb	10,20,10	;14
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
	jumptab	.A9A
	jumptab	.A8A
	jumptab	.A9A
	jumptab	.A10A
	jumptab	.A9A
.A0A	Pointsb	1
	pb	0,34,-15	;16
	PointsXb	1
	pb	20,40,-40	;17
	jump	.EB0
.A1A	Pointsb	1
	pb	0,47,-15	;16
	PointsXb	1
	pb	20,50,-19	;17
	jump	.EB0
.A2A	Pointsb	1
	pb	0,53,-5	;16
	PointsXb	1
	pb	20,61,-9	;17
	jump	.EB0
.A3A	Pointsb	1
	pb	0,62,0	;16
	PointsXb	1
	pb	20,73,0	;17
	jump	.EB0
.A4A	Pointsb	1
	pb	0,69,5	;16
	PointsXb	1
	pb	20,83,5	;17
	jump	.EB0
.A5A	Pointsb	1
	pb	0,75,8	;16
	PointsXb	1
	pb	20,93,11	;17
	jump	.EB0
.A6A	Pointsb	1
	pb	0,80,10	;16
	PointsXb	1
	pb	20,100,13	;17
	jump	.EB0
.A7A	Pointsb	1
	pb	0,84,10	;16
	PointsXb	1
	pb	20,105,14	;17
	jump	.EB0
.A8A	Pointsb	1
	pb	-20,71,10	;16
	PointsXb	1
	pb	20,105,14	;17
	jump	.EB0
.A9A	Pointsb	1
	pb	0,81,10	;16
	PointsXb	1
	pb	20,105,14	;17
	jump	.EB0
.A10A	Pointsb	1
	pb	20,70,10	;16
	PointsXb	1
	pb	20,105,14	;17
.EB0

	EndPoints
HIDER_F
	Vizis	17
	Viz	13,12,16,0,23,125	;0
	Viz	13,18,2,102,27,70	;1
	Viz	17,18,13,0,23,125	;2
	Viz	13,12,17,0,23,125	;3
	Viz	7,9,1,98,0,81	;4
	Viz	0,8,6,-94,0,85	;5
	Viz	10,4,3,-90,0,90	;6
	Viz	14,10,3,-111,28,55	;7
	Viz	11,5,4,0,106,70	;8
	Viz	11,15,2,111,28,55	;9
	Viz	2,5,11,90,0,90	;10
	Viz	3,17,12,-102,27,70	;11
	Viz	2,15,13,73,-73,73	;12
	Viz	3,12,14,-73,-73,73	;13
	Viz	15,14,12,0,-90,90	;14
	Viz	15,11,10,0,57,114	;15
	Viz	4,5,2,0,0,-127	;16

HIDER_f1	Faces
	Face3	22,11,-102,27,70,3,17,12
	Face3	22,1,102,27,70,13,18,2
	Face3	22,2,0,23,125,17,18,13
	Face3	22,3,0,23,125,13,12,17
	Face3	6,12,73,-73,73,2,15,13
	Face3	6,13,-73,-73,73,3,12,14
	Face3	6,6,-90,0,90,10,4,3
	Face3	4,7,-111,28,55,14,10,3
	Face3	4,9,111,28,55,11,15,2
	Face3	6,10,90,0,90,2,5,11
	Face4	6,14,0,-90,90,15,14,12,13
	Face4	6,8,0,106,70,11,5,4,10
	Face4	6,15,0,57,114,15,11,10,14
	Face4	48,16,0,0,-127,4,5,2,3
	Face3	5,4,98,0,81,7,9,1
	Face3	5,5,-94,0,85,0,8,6
	Face3	43,0,0,23,125,13,12,16
	Fend
	EndShape

	endc

	ENDC


;--Shape file ----- shapes\mine_0_s.txt ----
	ifne	DO_HDR

mine_0
	shapehdr	mine_0_s_P,0,mine_0_s_F,0,0,0,0,1,0,10,15,9,15,id_0_c,0,0,0,0,<mine_0_s>
mine_0_s
	shapehdr	mine_0_s_P,0,mine_0_s_F,0,0,0,0,1,0,10,15,9,15,id_0_c,0,0,0,0,<mine_0_s>
	elseif
mine_0_s_P
	datahdr
	Pointsb	2
	pb	0,15,-2	;0
	pb	0,-15,-2	;1
	PointsXb	1
	pb	-10,-2,-9	;2

	EndPoints
mine_0_s_F
	Vizis	4
	Viz	1,2,3,0,60,-112	;0
	Viz	3,2,0,0,-48,-117	;1
	Viz	3,2,1,0,-60,112	;2
	Viz	0,2,3,0,48,117	;3

mine_0_s_f1	Faces
	Face3	0,2,0,-60,112,3,2,1
	Face3	0,3,0,48,117,0,2,3
	Face3	0,0,0,60,-112,1,2,3
	Face3	0,1,0,-48,-117,3,2,0
	Face2	43,-1,0,0,0,3,2
	Fend
	EndShape

	endc

;--Shape file ----- C:\SHED\PILLAR3S ----
	ifne	DO_HDR

PILLAR3S
	shapehdr_s	pillar3s_P,0,pillar3s_F,0,0,0,0,2,0,12,120,12,120,id_0_c,0,0,0,0,<pillar3s>
	elseif
PILLAR3S_P
	datahdr
	Pointsb	5
	pb	6,-85,-6	;0
	pb	6,0,-6		;1
	pb	-6,-85,-6	;2
	pb	-6,0,-6		;3
	pb	0,-90,0	;4

	EndPoints
PILLAR3S_F
	Vizis	2
	Viz	0,2,3,0,0,-127	;0
	Viz	0,4,2,0,102,-76	;1

PILLAR3S_f1	Faces
	Face4	7,0,0,0,-127,0,2,3,1
	Face3	43,1,0,102,-76,0,4,2
	Fend
	EndShape

	endc
;--Shape file ----- C:\SHED\PILLAR3 ----
	ifne	DO_HDR

PILLAR3	shapehdr	PILLAR3_P,0,PILLAR3_F,0,0,0,0,2,pillar3_col1,120,120,12,120,id_0_c,0,pillar3s,pillar3s,pillar3s,<PILLAR3>
RPILLAR3	shapehdr	PILLAR3_P,0,PILLAR3_F,0,0,0,0,2,pillar3_col1,120,120,12,120,id_1_c,0,pillar3s,pillar3s,pillar3s,<PILLAR3>
pillar3_ns
	shapehdr	PILLAR3_P,0,PILLAR3_F,0,100,0,0,2,pillar3ns_col1,120,12,12,120,id_0_c,0,0,0,0,<PILLAR3>
	elseif
PILLAR3_P
	datahdr
	Pointsb	9
	pb	6,-85,-6	;0
	pb	6,-85,6	;1
	pb	6,0,6		;2
	pb	6,0,-6	;3
	pb	-6,-85,-6	;4
	pb	-6,-85,6	;5
	pb	-6,0,6	;6
	pb	-6,0,-6	;7
	pb	0,-90,0	;8

	EndPoints
PILLAR3_F
	Vizis	10
	Viz	2,1,0,-127,0,0	;0
	Viz	4,5,6,127,0,0	;1
	Viz	0,4,7,0,0,-127	;2
	Viz	6,5,1,0,0,127	;3
	Viz	0,1,5,0,127,0	;4
	Viz	3,7,6,0,-127,0	;5
	Viz	4,8,5,76,102,0	;6
	Viz	0,8,4,0,102,-76	;7
	Viz	1,8,0,-76,102,0	;8
	Viz	5,8,1,0,102,76	;9

PILLAR3_f1	Faces
	Face4	32,4,0,127,0,0,1,5,4	; 7
	Face4	28,0,-127,0,0,2,1,0,3	; 7
	Face4	28,1,127,0,0,4,5,6,7	; 7
	Face4	30,2,0,0,-127,0,4,7,3	; 7
	Face4	30,3,0,0,127,6,5,1,2	; 7
	Face4	32,5,0,-127,0,3,7,6,2	; 7 
	Face3	43,6,76,102,0,4,8,5
	Face3	43,7,0,102,-76,0,8,4
	Face3	43,8,-76,102,0,1,8,0
	Face3	43,9,0,102,76,5,8,1
	Fend
	EndShape

	endc



;--Shape file ----- C:\SHED\PILLAR3S ----
	ifne	DO_HDR

pillar4S
	shapehdr_s	pillar4s_P,0,pillar4s_F,0,0,0,0,2,0,12,120,12,120,id_0_c,0,0,0,0,<pillar4s>
	elseif
pillar4S_P
	datahdr
	Pointsb	5
	pb	6,-85,-6	;0
	pb	6,0,-6		;1
	pb	-6,-85,-6	;2
	pb	-6,0,-6		;3
	pb	0,-90,0	;4

	EndPoints
pillar4S_F
	Vizis	2
	Viz	0,2,3,0,0,-127	;0
	Viz	0,4,2,0,102,-76	;1

pillar4S_f1	Faces
	Face4	6,0,0,0,-127,0,2,3,1
	Face3	43,1,0,102,-76,0,4,2
	Fend
	EndShape

	endc
;--Shape file ----- C:\SHED\pillar4 ----
	ifne	DO_HDR

pillar4
	shapehdr	pillar4_P,0,pillar4_F,0,0,0,0,2,0,12,90,12,120,id_0_c,0,pillar4s,pillar4s,pillar4s,<pillar4>
	elseif
pillar4_P
	datahdr
	Pointsb	9
	pb	6,-85,-6	;0
	pb	6,-85,6	;1
	pb	6,0,6		;2
	pb	6,0,-6	;3
	pb	-6,-85,-6	;4
	pb	-6,-85,6	;5
	pb	-6,0,6	;6
	pb	-6,0,-6	;7
	pb	0,-90,0	;8

	EndPoints
pillar4_F
	Vizis	10
	Viz	2,1,0,-127,0,0	;0
	Viz	4,5,6,127,0,0	;1
	Viz	0,4,7,0,0,-127	;2
	Viz	6,5,1,0,0,127	;3
	Viz	0,1,5,0,127,0	;4
	Viz	3,7,6,0,-127,0	;5
	Viz	4,8,5,76,102,0	;6
	Viz	0,8,4,0,102,-76	;7
	Viz	1,8,0,-76,102,0	;8
	Viz	5,8,1,0,102,76	;9

pillar4_f1	Faces
	Face4	6,4,0,127,0,0,1,5,4
	Face4	6,0,-127,0,0,2,1,0,3
	Face4	6,1,127,0,0,4,5,6,7
	Face4	6,2,0,0,-127,0,4,7,3
	Face4	6,3,0,0,127,6,5,1,2
	Face4	6,5,0,-127,0,3,7,6,2
	Face3	43,6,76,102,0,4,8,5
	Face3	43,7,0,102,-76,0,8,4
	Face3	43,8,-76,102,0,1,8,0
	Face3	43,9,0,102,76,5,8,1
	Fend
	EndShape

	endc

;--Shape file ----- C:\SHED\SHAPES4\GATE_0.TXT ----
	ifne	DO_HDR

gate_0
	ShapeHdr	gate_0_P,0,gate_0_F,0,0,0,0,2,0,26,30,5,30,id_0_c,0,0,0,0,<gate_0>
	elseif
gate_0_P
	datahdr
	Pointsb	4
	pb	0,25,-5	;0
	pb	0,-25,-5	;1
	pb	0,30,0	;2
	pb	0,-30,0	;3
	PointsXb	10
	pb	22,13,-5	;4
	pb	22,-13,-5	;6
	pb	-5,20,0	;8
	pb	26,15,0	;10
	pb	15,14,0	;12
	pb	20,6,0	;14
	pb	20,-6,0	;16
	pb	15,-14,0	;18
	pb	26,-15,0	;20
	pb	5,-20,0	;22

	EndPoints
gate_0_F
	Vizis	24
	Viz	20,16,18,0,0,127	;0
	Viz	6,20,18,11,120,-39	;1
	Viz	6,18,16,73,-46,-93	;2
	Viz	16,20,6,-97,-64,-52	;3
	Viz	3,22,23,0,0,127	;4
	Viz	1,3,23,104,52,-52	;5
	Viz	1,23,22,0,-90,-90	;6
	Viz	22,3,1,-104,52,-52	;7
	Viz	19,17,21,0,0,127	;8
	Viz	19,21,7,-11,120,-39	;9
	Viz	17,19,7,-73,-46,-93	;10
	Viz	7,21,17,97,-64,-52	;11
	Viz	12,14,10,0,0,127	;12
	Viz	12,10,4,11,-120,-39	;13
	Viz	14,12,4,73,46,-93	;14
	Viz	4,10,14,-97,64,-52	;15
	Viz	8,9,2,0,0,127	;16
	Viz	8,2,0,104,-52,-52	;17
	Viz	9,8,0,0,90,-90	;18
	Viz	0,2,9,-104,-52,-52	;19
	Viz	11,15,13,0,0,127	;20
	Viz	5,11,13,-11,-120,-39	;21
	Viz	5,13,15,-73,46,-93	;22
	Viz	15,11,5,97,64,-52	;23

gate_0_f1	Faces
	Face3	52,2,73,-46,-93,6,18,16
	Face3	52,6,0,-90,-90,1,23,22
	Face3	52,10,-73,-46,-93,17,19,7
	Face3	52,14,73,46,-93,14,12,4
	Face3	52,18,0,90,-90,9,8,0
	Face3	52,22,-73,46,-93,5,13,15
	Face3	0,1,11,120,-39,6,20,18
	Face3	0,3,-97,-64,-52,16,20,6
	Face3	0,5,104,52,-52,1,3,23
	Face3	0,7,-104,52,-52,22,3,1
	Face3	0,9,-11,120,-39,19,21,7
	Face3	0,11,97,-64,-52,7,21,17
	Face3	0,13,11,-120,-39,12,10,4
	Face3	0,15,-97,64,-52,4,10,14
	Face3	0,17,104,-52,-52,8,2,0
	Face3	0,19,-104,-52,-52,0,2,9
	Face3	0,21,-11,-120,-39,5,11,13
	Face3	0,23,97,64,-52,15,11,5
	Face3	0,0,0,0,127,20,16,18
	Face3	0,4,0,0,127,3,22,23
	Face3	0,8,0,0,127,19,17,21
	Face3	0,12,0,0,127,12,14,10
	Face3	0,16,0,0,127,8,9,2
	Face3	0,20,0,0,127,11,15,13
	Fend
	EndShape

	endc

;--Shape file ----- C:\SHED\SHAPES4\GATE_1.TXT ----
	ifne	DO_HDR

gate_1
	ShapeHdr	gate_1_P,0,gate_1_F,0,0,0,0,2,0,30,35,5,42,id_0_c,0,0,0,0,<gate_1>
	elseif
gate_1_P
	datahdr
	Pointsb	2
	pb	0,-25,-5	;0
	pb	0,-30,0	;1
	PointsXb	13
	pb	25,30,-5	;2
	pb	25,10,-5	;4
	pb	22,-13,-5	;6
	pb	20,35,0	;8
	pb	30,30,0	;10
	pb	20,25,0	;12
	pb	20,15,0	;14
	pb	30,10,0	;16
	pb	20,5,0	;18
	pb	20,-6,0	;20
	pb	15,-14,0	;22
	pb	26,-15,0	;24
	pb	5,-20,0	;26

	EndPoints
gate_1_F
	Vizis	28
	Viz	24,20,22,0,0,127	;0
	Viz	6,24,22,11,120,-39	;1
	Viz	6,22,20,73,-46,-93	;2
	Viz	20,24,6,-97,-64,-52	;3
	Viz	16,14,18,0,0,127	;4
	Viz	4,16,18,-52,104,-52	;5
	Viz	4,18,14,90,0,-90	;6
	Viz	14,16,4,-52,-104,-52	;7
	Viz	1,26,27,0,0,127	;8
	Viz	0,1,27,104,52,-52	;9
	Viz	0,27,26,0,-90,-90	;10
	Viz	26,1,0,-104,52,-52	;11
	Viz	23,21,25,0,0,127	;12
	Viz	23,25,7,-11,120,-39	;13
	Viz	21,23,7,-73,-46,-93	;14
	Viz	7,25,21,97,-64,-52	;15
	Viz	19,15,17,0,0,127	;16
	Viz	19,17,5,52,104,-52	;17
	Viz	15,19,5,-90,0,-90	;18
	Viz	5,17,15,52,-104,-52	;19
	Viz	10,8,12,0,0,127	;20
	Viz	2,10,12,-52,104,-52	;21
	Viz	2,12,8,90,0,-90	;22
	Viz	8,10,2,-52,-104,-52	;23
	Viz	13,9,11,0,0,127	;24
	Viz	13,11,3,52,104,-52	;25
	Viz	9,13,3,-90,0,-90	;26
	Viz	3,11,9,52,-104,-52	;27
	BSPInit	gate_1_EBSP
	BSP	3,gate_1_f1,.bsp2
	BSP	9,gate_1_f3,.bsp4
	BSP	1,gate_1_f5,.bsp6
	BSPE	gate_1_f7
.bsp6	BSPE	gate_1_f8
.bsp4	BSPE	gate_1_f9
.bsp2	BSPE	gate_1_f10

gate_1_f1	Faces
	Face3	0,3,-97,-64,-52,20,24,6
	FendQ
gate_1_f3	Faces
	Face3	0,9,104,52,-52,0,1,27
	FendQ
gate_1_f5	Faces
	Face3	0,1,11,120,-39,6,24,22
	FendQ
gate_1_f7	Faces
	Face3	44,2,73,-46,-93,6,22,20
	Face3	0,25,52,104,-52,13,11,3
	Face3	44,26,-90,0,-90,9,13,3
	Face3	0,0,0,0,127,24,20,22
	Face3	0,24,0,0,127,13,9,11
	Face3	0,27,52,-104,-52,3,11,9
	FendQ
gate_1_f8	Faces
	Face3	0,8,0,0,127,1,26,27
	Face3	44,10,0,-90,-90,0,27,26
	Face3	0,11,-104,52,-52,26,1,0
	FendQ
gate_1_f9	Faces
	Face3	44,14,-73,-46,-93,21,23,7
	Face3	0,15,97,-64,-52,7,25,21
	Face3	0,17,52,104,-52,19,17,5
	Face3	44,18,-90,0,-90,15,19,5
	Face3	0,12,0,0,127,23,21,25
	Face3	0,13,-11,120,-39,23,25,7
	Face3	0,16,0,0,127,19,15,17
	Face3	0,19,52,-104,-52,5,17,15
	FendQ
gate_1_f10	Faces
	Face3	0,7,-52,-104,-52,14,16,4
	Face3	0,21,-52,104,-52,2,10,12
	Face3	0,4,0,0,127,16,14,18
	Face3	0,5,-52,104,-52,4,16,18
	Face3	44,6,90,0,-90,4,18,14
	Face3	0,20,0,0,127,10,8,12
	Face3	44,22,90,0,-90,2,12,8
	Face3	0,23,-52,-104,-52,8,10,2
	FendQ
gate_1_EBSP
	EndShape

	endc


;--Shape file ----- C:\SHED\ARM.TXT ----
	ifne	DO_HDR

arm
	ShapeHdr	arm_P,0,arm_F,0,0,0,0,1,arm_col1,80,80,80,25,id_0_c,0,0,0,0,<arm>
	elseif
arm_P
	PointsXb	4
	pb	-5,5,0	;0
	pb	5,-5,0	;2
	pb	-5,5,80	;4
	pb	5,-5,80	;6

	EndPoints
arm_F
	Vizis	6
	Viz	2,3,0,0,0,-127	;0
	Viz	4,7,6,0,0,127	;1
	Viz	2,6,7,0,127,0	;2
	Viz	4,5,1,0,-127,0	;3
	Viz	5,6,2,-127,0,0	;4
	Viz	0,3,7,127,0,0	;5

arm_f1	Faces
	Face4	1,0,0,0,-127,2,3,0,1
	Face4	1,1,0,0,127,4,7,6,5
	Face4	1,2,0,127,0,2,6,7,3
	Face4	1,3,0,-127,0,4,5,1,0
	Face4	1,4,-127,0,0,5,6,2,1
	Face4	1,5,127,0,0,0,3,7,4
	Fend
	EndShape

	endc



;--Shape file ----- C:\SHED\bulge.anm ----
	ifne	DO_HDR

bulge
	ShapeHdr	bulge_P,0,bulge_F,0,0,0,0,1,arm_col1,20,20,80,80,id_0_c,0,0,0,0,<bulge>
	elseif
bulge_P
	PointsXb	4
	pb	-5,5,0	;0
	pb	5,-5,0	;2
	pb	5,5,100	;4
	pb	-5,-5,100	;6
	Frames	4
	jumptab	.A0A
	jumptab	.A1A
	jumptab	.A2A
	jumptab	.A3A
.A0A	PointsXb	6
	pb	-5,5,1	;8
	pb	5,-5,1	;10
	pb	15,15,11	;12
	pb	15,-15,11	;14
	pb	-5,5,21	;16
	pb	-5,-5,21	;18
	jump	.EB0
.A1A	PointsXb	6
	pb	-5,5,20	;8
	pb	5,-5,20	;10
	pb	15,15,30	;12
	pb	15,-15,30	;14
	pb	-5,5,40	;16
	pb	-5,-5,40	;18
	jump	.EB0
.A2A	PointsXb	6
	pb	-5,5,40	;8
	pb	5,-5,40	;10
	pb	15,15,50	;12
	pb	15,-15,50	;14
	pb	-5,5,60	;16
	pb	-5,-5,60	;18
	jump	.EB0
.A3A	PointsXb	6
	pb	-5,5,60	;8
	pb	5,-5,60	;10
	pb	15,15,70	;12
	pb	15,-15,70	;14
	pb	-5,5,80	;16
	pb	-5,-5,80	;18
.EB0

	EndPoints
bulge_F
	Vizis	18
	Viz	5,4,17,0,-127,0	;0
	Viz	8,9,1,0,-127,0	;1
	Viz	15,18,16,90,0,90	;2
	Viz	13,16,17,0,-90,90	;3
	Viz	14,19,18,0,90,90	;4
	Viz	12,17,19,-90,0,90	;5
	Viz	12,9,8,0,-90,-90	;6
	Viz	15,11,10,0,90,-90	;7
	Viz	13,8,11,90,0,-90	;8
	Viz	14,10,9,-90,0,-90	;9
	Viz	4,7,19,-127,0,0	;10
	Viz	16,18,6,127,0,0	;11
	Viz	18,19,7,0,127,0	;12
	Viz	4,5,6,0,0,127	;13
	Viz	9,10,2,-127,0,0	;14
	Viz	0,3,11,127,0,0	;15
	Viz	3,2,10,0,127,0	;16
	Viz	2,3,0,0,0,-127	;17

bulge_f1	Faces
	Face4	1,0,0,-127,0,5,4,17,16
	Face4	1,1,0,-127,0,8,9,1,0
	Face4	0,2,90,0,90,15,18,16,13
	Face4	0,3,0,-90,90,13,16,17,12
	Face4	0,4,0,90,90,14,19,18,15
	Face4	0,5,-90,0,90,12,17,19,14
	Face4	0,6,0,-90,-90,12,9,8,13
	Face4	0,7,0,90,-90,15,11,10,14
	Face4	0,8,90,0,-90,13,8,11,15
	Face4	0,9,-90,0,-90,14,10,9,12
	Face4	1,10,-127,0,0,4,7,19,17
	Face4	1,11,127,0,0,16,18,6,5
	Face4	1,12,0,127,0,18,19,7,6
	Face4	1,14,-127,0,0,9,10,2,1
	Face4	1,15,127,0,0,0,3,11,8
	Face4	1,16,0,127,0,3,2,10,11
	Face4	1,13,0,0,127,4,5,6,7
	Face4	1,17,0,0,-127,2,3,0,1
	Fend
	EndShape

	endc




;--Shape file ----- C:\SHED\shapes5\BOSS_C.ANM ----
	ifne	DO_HDR

boss_c
flingboss
	ShapeHdr	boss_c_P,0,boss_c_F,0,0,0,0,2,0,54,26,40,69,id_0_c,0,0,0,0,<boss_c>
	elseif
boss_c_P
	datahdr
	Pointsb	4
	pb	0,0,-20	;0
	pb	0,-40,-10	;1
	pb	0,20,30	;2
	pb	0,0,40	;3
	PointsXb	9
	pb	10,40,-30	;4
	pb	25,0,-15	;6
	pb	-28,-5,-10	;8
	pb	-6,-10,-10	;10
	pb	-30,10,-5	;12
	pb	-10,20,0	;14
	pb	30,0,10	;16
	pb	8,-5,10	;18
	pb	-10,10,15	;20
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
.A0A	Pointsb	2
	pb	20,20,-20	;22
	pb	-20,20,-20	;23
	PointsXb	1
	pb	30,40,40	;24
	jump	.EB0
.A1A	Pointsb	2
	pb	20,17,-20	;22
	pb	-20,17,-20	;23
	PointsXb	1
	pb	30,47,36	;24
	jump	.EB0
.A2A	Pointsb	2
	pb	20,13,-19	;22
	pb	-20,13,-19	;23
	PointsXb	1
	pb	30,52,31	;24
	jump	.EB0
.A3A	Pointsb	2
	pb	20,10,-17	;22
	pb	-20,10,-17	;23
	PointsXb	1
	pb	30,57,25	;24
	jump	.EB0
.A4A	Pointsb	2
	pb	20,9,-16	;22
	pb	-20,9,-16	;23
	PointsXb	1
	pb	30,59,21	;24
	jump	.EB0
.A5A	Pointsb	2
	pb	18,7,-16	;22
	pb	-18,7,-16	;23
	PointsXb	1
	pb	36,55,21	;24
	jump	.EB0
.A6A	Pointsb	2
	pb	16,6,-16	;22
	pb	-16,6,-16	;23
	PointsXb	1
	pb	42,50,21	;24
	jump	.EB0
.A7A	Pointsb	2
	pb	11,5,-16	;22
	pb	-11,5,-16	;23
	PointsXb	1
	pb	50,37,21	;24
	jump	.EB0
.A8A	Pointsb	2
	pb	5,6,-16	;22
	pb	-6,6,-16	;23
	PointsXb	1
	pb	54,22,21	;24
	jump	.EB0
.A9A	Pointsb	2
	pb	8,5,-16	;22
	pb	-8,5,-16	;23
	PointsXb	1
	pb	53,30,21	;24
.EB0

	EndPoints
boss_c_F
	Vizis	32
	Viz	25,23,14,55,111,28	;0
	Viz	14,23,25,-55,-111,-28	;1
	Viz	15,22,24,-55,111,28	;2
	Viz	24,22,15,55,-111,-28	;3
	Viz	11,10,0,0,90,-90	;4
	Viz	19,18,1,0,-63,-110	;5
	Viz	18,19,10,0,123,31	;6
	Viz	14,15,0,0,-90,-90	;7
	Viz	15,14,5,0,106,-70	;8
	Viz	3,19,1,112,47,38	;9
	Viz	1,18,3,-112,47,38	;10
	Viz	3,20,19,118,28,36	;11
	Viz	18,21,3,-118,28,36	;12
	Viz	3,21,20,0,-118,47	;13
	Viz	4,5,2,0,-120,40	;14
	Viz	5,20,2,109,-54,36	;15
	Viz	2,21,4,-109,-54,36	;16
	Viz	20,21,2,0,106,70	;17
	Viz	19,20,17,9,41,120	;18
	Viz	19,17,8,27,121,27	;19
	Viz	20,14,12,62,-92,62	;20
	Viz	12,8,17,126,14,-9	;21
	Viz	12,7,8,111,-6,-61	;22
	Viz	12,14,0,19,-84,-93	;23
	Viz	0,10,8,19,83,-94	;24
	Viz	16,21,18,-9,41,120	;25
	Viz	11,9,16,-27,121,27	;26
	Viz	16,13,15,-62,-92,62	;27
	Viz	16,9,13,-126,14,-9	;28
	Viz	9,6,13,-111,-6,-61	;29
	Viz	6,0,15,-19,-84,-93	;30
	Viz	6,9,11,-19,83,-94	;31
	BSPInit	boss_c_EBSP
	BSP	6,boss_c_f1,.bsp2
	BSP	13,boss_c_f3,.bsp4
	BSPE	boss_c_f5
.bsp4	BSP	15,boss_c_f6,.bsp7
	BSPE	boss_c_f8
.bsp7	BSPE	boss_c_f9
.bsp2	BSP	19,boss_c_f10,.bsp11
	BSPE	boss_c_f12
.bsp11	BSPE	boss_c_f13

boss_c_f1	Faces
	Face4	14,6,0,123,31,18,19,10,11
	FendQ
boss_c_f3	Faces
	Face3	56,13,0,-118,47,3,21,20
	FendQ
boss_c_f5	Faces
	Face3	12,4,0,90,-90,11,10,0
	Face3	12,7,0,-90,-90,14,15,0
	Face3	18,18,9,41,120,19,20,17
	Face3	14,21,126,14,-9,12,8,17
	Face3	16,22,111,-6,-61,12,7,8
	Face4	56,23,19,-84,-93,12,14,0,7
	Face4	18,24,19,83,-94,0,10,8,7
	Face3	16,25,-9,41,120,16,21,18
	Face3	12,28,-126,14,-9,16,9,13
	Face3	14,29,-111,-6,-61,9,6,13
	Face4	56,30,-19,-84,-93,6,0,15,13
	Face4	16,31,-19,83,-94,6,9,11,0
	FendQ
boss_c_f6	Faces
	Face3	18,15,109,-54,36,5,20,2
	FendQ
boss_c_f8	Faces
	Face3	16,16,-109,-54,36,2,21,4
	Face3	27,2,-55,111,28,15,22,24
	Face3	21,3,55,-111,-28,24,22,15
	Face4	45,8,0,106,-70,15,14,5,4
	Face3	14,14,0,-120,40,4,5,2
	Face3	20,17,0,106,70,20,21,2
	Face4	14,27,-62,-92,62,16,13,15,21
	FendQ
boss_c_f9	Faces
	Face3	25,0,55,111,28,25,23,14
	Face4	16,20,62,-92,62,20,14,12,17
	Face3	21,1,-55,-111,-28,14,23,25
	FendQ
boss_c_f10	Faces
	Face4	20,19,27,121,27,19,17,8,10
	FendQ
boss_c_f12	Faces
	Face3	14,12,-118,28,36,18,21,3
	Face4	18,26,-27,121,27,11,9,16,18
	FendQ
boss_c_f13	Faces
	Face3	21,5,0,-63,-110,19,18,1
	Face3	27,9,112,47,38,3,19,1
	Face3	23,10,-112,47,38,1,18,3
	Face3	20,11,118,28,36,3,20,19
	FendQ
boss_c_EBSP
	EndShape

	endc







;--Shape file ----- C:\SHED\shapes5\BOSS_C_1.ANM ----
	ifne	DO_HDR
boss_c_1
grabber
	ShapeHdr	boss_c_1_P,0,boss_c_1_F,0,0,0,0,1,0,30,35,26,35,id_0_c,0,0,0,0,<boss_c_1>
	elseif
boss_c_1_P
	datahdr
	PointsXb	4
	pb	-3,7,0	;0
	pb	13,-10,0	;2
	pb	-1,0,20	;4
	pb	6,-8,20	;6
	Frames	32
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
	jumptab	.A19A
	jumptab	.A19A
	jumptab	.A19A
	jumptab	.A19A
	jumptab	.A19A
	jumptab	.A19A
	jumptab	.A19A
	jumptab	.A19A
	jumptab	.A19A
	jumptab	.A19A
	jumptab	.A19A
	jumptab	.A19A
.A0A	Pointsb	10
	pb	-59,28,0	;8
	pb	60,28,0	;9
	pb	-19,17,0	;10
	pb	20,17,0	;11
	pb	30,0,0	;12
	pb	-29,-1,0	;13
	pb	0,-70,0	;14
	pb	34,14,5	;15
	pb	-33,13,5	;16
	pb	0,-40,5	;17
	PointsXb	1
	pb	10,-30,0	;18
	jump	.EB0
.A1A	Pointsb	10
	pb	-58,28,10	;8
	pb	59,28,10	;9
	pb	-19,17,3	;10
	pb	20,17,3	;11
	pb	30,0,3	;12
	pb	-29,-1,3	;13
	pb	0,-69,10	;14
	pb	33,13,10	;15
	pb	-32,13,10	;16
	pb	0,-39,10	;17
	PointsXb	1
	pb	10,-30,3	;18
	jump	.EB0
.A2A	Pointsb	10
	pb	-55,26,20	;8
	pb	56,26,20	;9
	pb	-19,16,6	;10
	pb	19,17,7	;11
	pb	29,-1,7	;12
	pb	-29,-1,6	;13
	pb	0,-66,20	;14
	pb	30,12,15	;15
	pb	-30,11,15	;16
	pb	0,-36,15	;17
	PointsXb	1
	pb	10,-29,7	;18
	jump	.EB0
.A3A	Pointsb	10
	pb	-52,24,29	;8
	pb	53,24,30	;9
	pb	-17,15,9	;10
	pb	18,16,10	;11
	pb	28,-2,10	;12
	pb	-27,-2,9	;13
	pb	0,-62,30	;14
	pb	28,10,19	;15
	pb	-28,10,19	;16
	pb	0,-33,19	;17
	PointsXb	1
	pb	10,-27,10	;18
	jump	.EB0
.A4A	Pointsb	10
	pb	-47,21,38	;8
	pb	48,21,38	;9
	pb	-16,15,12	;10
	pb	16,15,13	;11
	pb	26,-3,13	;12
	pb	-26,-3,12	;13
	pb	0,-56,38	;14
	pb	25,9,23	;15
	pb	-24,8,22	;16
	pb	0,-30,23	;17
	PointsXb	1
	pb	10,-25,13	;18
	jump	.EB0
.A5A	Pointsb	10
	pb	-41,18,45	;8
	pb	41,17,46	;9
	pb	-13,13,15	;10
	pb	14,14,15	;11
	pb	24,-4,15	;12
	pb	-23,-4,15	;13
	pb	0,-48,46	;14
	pb	21,6,26	;15
	pb	-21,6,25	;16
	pb	0,-25,26	;17
	PointsXb	1
	pb	10,-23,15	;18
	jump	.EB0
.A6A	Pointsb	10
	pb	-30,12,52	;8
	pb	30,12,53	;9
	pb	-13,13,15	;10
	pb	14,14,15	;11
	pb	24,-4,15	;12
	pb	-23,-4,15	;13
	pb	0,-36,53	;14
	pb	18,4,26	;15
	pb	-17,4,25	;16
	pb	0,-21,26	;17
	PointsXb	1
	pb	10,-23,15	;18
	jump	.EB0
.A7A	Pointsb	10
	pb	-19,5,55	;8
	pb	18,5,55	;9
	pb	-13,13,15	;10
	pb	14,14,15	;11
	pb	24,-4,15	;12
	pb	-23,-4,15	;13
	pb	0,-22,55	;14
	pb	14,2,25	;15
	pb	-15,3,25	;16
	pb	0,-17,25	;17
	PointsXb	1
	pb	10,-23,15	;18
	jump	.EB0
.A8A	Pointsb	10
	pb	-7,-2,52	;8
	pb	7,-2,52	;9
	pb	-13,13,15	;10
	pb	14,14,15	;11
	pb	24,-4,15	;12
	pb	-23,-4,15	;13
	pb	0,-9,52	;14
	pb	11,1,22	;15
	pb	-12,1,23	;16
	pb	0,-14,22	;17
	PointsXb	1
	pb	10,-23,15	;18
	jump	.EB0
.A9A	Pointsb	10
	pb	1,-6,48	;8
	pb	-1,-6,47	;9
	pb	-13,13,15	;10
	pb	14,14,15	;11
	pb	24,-4,15	;12
	pb	-23,-4,15	;13
	pb	0,-2,49	;14
	pb	11,0,20	;15
	pb	-11,0,20	;16
	pb	0,-13,21	;17
	PointsXb	1
	pb	10,-23,15	;18
	jump	.EB0
.A10A	Pointsb	10
	pb	-1,-5,46	;8
	pb	1,-5,45	;9
	pb	-15,14,13	;10
	pb	16,15,12	;11
	pb	26,-3,12	;12
	pb	-25,-3,13	;13
	pb	0,-5,47	;14
	pb	12,1,17	;15
	pb	-12,1,18	;16
	pb	0,-16,19	;17
	PointsXb	1
	pb	10,-25,13	;18
	jump	.EB0
.A11A	Pointsb	10
	pb	-4,-4,43	;8
	pb	4,-4,41	;9
	pb	-17,15,10	;10
	pb	18,16,10	;11
	pb	28,-2,10	;12
	pb	-27,-2,10	;13
	pb	0,-6,44	;14
	pb	15,3,15	;15
	pb	-15,3,15	;16
	pb	0,-17,16	;17
	PointsXb	1
	pb	10,-27,10	;18
	jump	.EB0
.A12A	Pointsb	10
	pb	-5,-3,36	;8
	pb	5,-3,34	;9
	pb	-19,17,4	;10
	pb	20,17,3	;11
	pb	30,0,3	;12
	pb	-29,-1,4	;13
	pb	0,-8,37	;14
	pb	17,4,7	;15
	pb	-17,4,8	;16
	pb	0,-20,9	;17
	PointsXb	1
	pb	10,-30,3	;18
	jump	.EB0
.A13A	Pointsb	10
	pb	-5,-3,29	;8
	pb	5,-3,29	;9
	pb	-19,17,-3	;10
	pb	19,17,-4	;11
	pb	29,-1,-4	;12
	pb	-29,-1,-3	;13
	pb	0,-8,30	;14
	pb	17,4,1	;15
	pb	-17,4,2	;16
	pb	0,-19,3	;17
	PointsXb	1
	pb	10,-29,-4	;18
	jump	.EB0
.A14A	Pointsb	10
	pb	1,-6,48	;8
	pb	-1,-6,47	;9
	pb	-13,13,15	;10
	pb	14,14,15	;11
	pb	24,-4,15	;12
	pb	-23,-4,15	;13
	pb	0,-2,49	;14
	pb	11,0,20	;15
	pb	-11,0,20	;16
	pb	0,-13,21	;17
	PointsXb	1
	pb	10,-23,15	;18
	jump	.EB0
.A15A	Pointsb	10
	pb	-11,1,58	;8
	pb	11,1,57	;9
	pb	-8,10,18	;10
	pb	9,11,18	;11
	pb	19,-7,18	;12
	pb	-18,-7,18	;13
	pb	0,-16,58	;14
	pb	9,-1,28	;15
	pb	-9,-1,27	;16
	pb	0,-12,28	;17
	PointsXb	1
	pb	10,-17,18	;18
	jump	.EB0
.A16A	Pointsb	10
	pb	-43,19,42	;8
	pb	43,19,43	;9
	pb	-13,13,15	;10
	pb	14,14,15	;11
	pb	24,-4,15	;12
	pb	-23,-4,15	;13
	pb	0,-53,42	;14
	pb	22,7,26	;15
	pb	-21,6,25	;16
	pb	0,-27,26	;17
	PointsXb	1
	pb	10,-23,15	;18
	jump	.EB0
.A17A	Pointsb	10
	pb	-54,25,22	;8
	pb	53,24,24	;9
	pb	-15,14,13	;10
	pb	16,15,13	;11
	pb	26,-3,13	;12
	pb	-25,-3,13	;13
	pb	0,-64,20	;14
	pb	27,10,21	;15
	pb	-27,10,20	;16
	pb	0,-33,20	;17
	PointsXb	1
	pb	10,-25,13	;18
	jump	.EB0
.A18A	Pointsb	10
	pb	-57,27,3	;8
	pb	57,27,5	;9
	pb	-19,16,7	;10
	pb	19,16,7	;11
	pb	29,-1,7	;12
	pb	-29,-1,7	;13
	pb	0,-67,0	;14
	pb	32,13,12	;15
	pb	-31,12,11	;16
	pb	0,-38,11	;17
	PointsXb	1
	pb	10,-28,7	;18
	jump	.EB0
.A19A	Pointsb	10
	pb	-56,27,-11	;8
	pb	57,27,-9	;9
	pb	-19,17,0	;10
	pb	19,17,0	;11
	pb	29,-1,0	;12
	pb	-29,-1,0	;13
	pb	0,-67,-6	;14
	pb	33,13,4	;15
	pb	-33,13,3	;16
	pb	0,-39,5	;17
	PointsXb	1
	pb	10,-29,0	;18
.EB0

	EndPoints
boss_c_1_F
	Vizis	19
	Viz	3,7,4,105,-65,30	;0
	Viz	4,0,3,106,-62,32	;1
	Viz	10,8,16,-19,-67,106	;4
	Viz	16,8,13,50,52,105	;5
	Viz	16,13,10,-48,27,114	;6
	Viz	13,8,10,0,0,-127	;7
	Viz	18,14,19,0,0,-127	;12
	Viz	17,14,18,-70,17,105	;13
	Viz	15,9,11,20,-74,101	;14
	Viz	12,9,15,-48,51,106	;15
	Viz	11,12,15,47,28,115	;16
	Viz	19,14,17,70,17,105	;17
	Viz	18,19,17,0,-57,114	;18
	Viz	11,9,12,0,0,-127	;19
	Viz	7,6,5,0,0,127	;20
	Viz	2,1,5,-106,-62,32	;21
	Viz	5,6,2,-105,-65,30	;22
	Viz	1,0,4,0,-120,42	;23
	Viz	6,7,3,0,126,13	;24
	BSPInit	boss_c_1_EBSP
	BSP	0,boss_c_1_f1,.bsp2
	BSP	15,boss_c_1_f3,.bsp4
	BSPE	boss_c_1_f5
.bsp4	BSPE	boss_c_1_f6
.bsp2	BSP	4,boss_c_1_f7,.bsp8
	BSPE	boss_c_1_f9
.bsp8	BSP	17,boss_c_1_f10,.bsp11
	BSPE	boss_c_1_f12
.bsp11	BSPE	boss_c_1_f13

boss_c_1_f1	Faces
	Face3	16,0,105,-65,30,3,7,4
	FendQ
boss_c_1_f3	Faces
	Face3	18,15,-106,-62,32,2,1,5
	FendQ
boss_c_1_f5	Faces
	Face3	44,12,0,-57,114,18,19,17
	Face4	18,18,0,126,13,6,7,3,2
	Face3	20,7,-70,17,105,17,14,18
	Face3	18,11,70,17,105,19,14,17
	Face2	25,-1,0,0,0,18,2
	Face2	25,-1,0,0,0,19,3
	Face3	25,6,0,0,-127,18,14,19
	FendQ
boss_c_1_f6	Faces
	Face3	44,10,47,28,115,11,12,15
	Face3	20,16,-105,-65,30,5,6,2
	Face3	16,8,20,-74,101,15,9,11
	Face2	23,-1,0,0,0,12,2
	Face2	21,-1,0,0,0,11,1
	Face3	20,9,-48,51,106,12,9,15
	Face3	23,13,0,0,-127,11,9,12
	FendQ
boss_c_1_f7	Faces
	Face3	44,4,-48,27,114,16,13,10
	FendQ
boss_c_1_f9	Faces
	Face3	16,2,-19,-67,106,10,8,16
	Face3	18,3,50,52,105,16,8,13
	Face3	21,5,0,0,-127,13,8,10
	FendQ
boss_c_1_f10	Faces
	Face4	12,17,0,-120,42,1,0,4,5
	FendQ
boss_c_1_f12	Faces
	Face3	14,1,106,-62,32,4,0,3
	Face2	23,-1,0,0,0,3,13
	Face4	43,14,0,0,127,7,6,5,4
	FendQ
boss_c_1_f13	Faces
	Face2	21,-1,0,0,0,0,10
	FendQ
boss_c_1_EBSP
	EndShape

	endc

;--Shape file ----- C:\SHED\arm.txt ----
	ifne	DO_HDR

neck
	ShapeHdr	neck_P,0,neck_F,0,0,0,0,1,arm_col1,80,80,80,25,id_0_c,0,neck_s,neck_s,neck_s,<neck>
	elseif
neck_P
	datahdr
	Pointsb	2
	pb	0,-5,0	;0
	pb	0,-5,80	;1
	PointsXb	2
	pb	-5,5,0	;2
	pb	-5,5,80	;4

	EndPoints
neck_F
	Vizis	3
	Viz	5,1,0,-114,57,0	;0
	Viz	0,1,4,114,57,0	;1
	Viz	4,5,3,0,-127,0	;2

neck_f1	Faces
	Face4	7,0,-114,57,0,5,1,0,3
	Face4	7,1,114,57,0,0,1,4,2
	Face4	0,2,0,-127,0,4,5,3,2
	Fend
	EndShape

	endc


;--Shape file ----- C:\SHED\shapes5\BOSS_D_0.ANM ----
	ifne	DO_HDR

boss_d_0
	ShapeHdr	boss_d_0_P,0,boss_d_0_F,0,0,0,0,1,0,44,43,48,64,id_0_c,0,0,0,0,<boss_d_0>
	elseif
boss_d_0_P
	datahdr
	Pointsb	2
	pb	0,-25,-16	;0
	pb	0,20,14	;1
	PointsXb	4
	pb	-19,-5,17	;2
	pb	-12,5,24	;4
	pb	-12,-15,24	;6
	pb	-5,-5,31	;8
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
.A0A	Pointsb	6
	pb	42,-30,23	;10
	pb	18,-24,24	;11
	pb	-15,-25,27	;12
	pb	0,12,43	;13
	pb	-30,-35,44	;14
	pb	0,13,47	;15
	PointsXb	2
	pb	-19,0,31	;16
	pb	-19,-10,31	;18
	jump	.EB0
.A1A	Pointsb	6
	pb	39,-35,28	;10
	pb	16,-25,24	;11
	pb	-17,-24,26	;12
	pb	0,15,42	;13
	pb	-36,-31,41	;14
	pb	0,9,48	;15
	PointsXb	2
	pb	-19,0,31	;16
	pb	-19,-10,31	;18
	jump	.EB0
.A2A	Pointsb	6
	pb	33,-39,32	;10
	pb	14,-26,25	;11
	pb	-19,-23,26	;12
	pb	0,18,39	;13
	pb	-41,-26,37	;14
	pb	0,5,48	;15
	PointsXb	2
	pb	-19,0,31	;16
	pb	-19,-10,31	;18
	jump	.EB0
.A3A	Pointsb	6
	pb	28,-42,37	;10
	pb	12,-26,26	;11
	pb	-20,-22,25	;12
	pb	0,21,37	;13
	pb	-44,-19,32	;14
	pb	0,0,48	;15
	PointsXb	2
	pb	-19,0,31	;16
	pb	-19,-10,31	;18
	jump	.EB0
.A4A	Pointsb	6
	pb	20,-43,41	;10
	pb	10,-25,26	;11
	pb	-19,-23,24	;12
	pb	0,18,39	;13
	pb	-44,-25,28	;14
	pb	0,5,48	;15
	PointsXb	2
	pb	-19,0,31	;16
	pb	-19,-10,31	;18
	jump	.EB0
.A5A	Pointsb	6
	pb	22,-40,44	;10
	pb	11,-25,27	;11
	pb	-18,-24,24	;12
	pb	0,15,42	;13
	pb	-42,-30,23	;14
	pb	0,9,48	;15
	PointsXb	2
	pb	-19,0,31	;16
	pb	-19,-10,31	;18
	jump	.EB0
.A6A	Pointsb	6
	pb	33,-35,41	;10
	pb	15,-25,26	;11
	pb	-16,-25,24	;12
	pb	0,12,43	;13
	pb	-39,-35,28	;14
	pb	0,13,47	;15
	PointsXb	2
	pb	-20,-2,32	;16
	pb	-20,-8,32	;18
	jump	.EB0
.A7A	Pointsb	6
	pb	41,-26,37	;10
	pb	19,-23,26	;11
	pb	-14,-26,25	;12
	pb	0,12,43	;13
	pb	-33,-39,32	;14
	pb	0,13,47	;15
	PointsXb	2
	pb	-20,-4,32	;16
	pb	-20,-6,32	;18
	jump	.EB0
.A8A	Pointsb	6
	pb	44,-20,32	;10
	pb	20,-22,25	;11
	pb	-12,-26,26	;12
	pb	0,12,43	;13
	pb	-28,-42,37	;14
	pb	0,13,47	;15
	PointsXb	2
	pb	-20,-2,32	;16
	pb	-20,-8,32	;18
	jump	.EB0
.A9A	Pointsb	6
	pb	44,-25,28	;10
	pb	19,-23,24	;11
	pb	-13,-25,26	;12
	pb	0,12,43	;13
	pb	-29,-38,41	;14
	pb	0,13,47	;15
	PointsXb	2
	pb	-20,-4,32	;16
	pb	-20,-6,32	;18
.EB0

	EndPoints
boss_d_0_F
	Vizis	31
	Viz	7,11,10,-6,-4,127	;0
	Viz	10,11,7,6,4,-127	;1
	Viz	14,12,6,-96,4,83	;2
	Viz	6,12,14,96,-4,-83	;3
	Viz	0,1,3,-83,-53,-80	;4
	Viz	2,1,0,83,-53,-80	;5
	Viz	1,5,3,-101,-76,-7	;6
	Viz	2,4,1,101,-76,-7	;7
	Viz	3,7,0,-100,77,-11	;8
	Viz	0,6,2,100,77,-11	;9
	Viz	7,6,0,0,123,31	;10
	Viz	13,4,5,0,119,44	;11
	Viz	1,13,5,-89,-87,24	;12
	Viz	4,13,1,89,-87,24	;13
	Viz	7,9,8,0,73,104	;14
	Viz	15,5,4,0,-120,-42	;15
	Viz	15,9,5,-105,28,65	;16
	Viz	4,8,15,105,28,65	;17
	Viz	8,9,15,0,84,95	;18
	Viz	17,9,19,0,0,127	;19
	Viz	19,3,17,-127,0,0	;20
	Viz	3,5,17,-90,-84,-30	;21
	Viz	17,5,9,30,-84,90	;22
	Viz	19,7,3,-90,84,-30	;23
	Viz	9,7,19,30,84,90	;24
	Viz	18,8,16,0,0,127	;25
	Viz	16,2,18,127,0,0	;26
	Viz	16,4,2,90,-84,-30	;27
	Viz	8,4,16,-30,-84,90	;28
	Viz	2,6,18,90,84,-30	;29
	Viz	18,6,8,-30,84,90	;30
	BSPInit	boss_d_0_EBSP
	BSP	8,boss_d_0_f1,.bsp2
	BSP	9,boss_d_0_f3,.bsp4
	BSPE	boss_d_0_f5
.bsp4	BSPE	boss_d_0_f6
.bsp2	BSP	23,boss_d_0_f7,.bsp8
	BSPEND
.bsp8	BSPE	boss_d_0_f9

boss_d_0_f1	Faces
	Face3	18,8,-100,77,-11,3,7,0
	FendQ
boss_d_0_f3	Faces
	Face3	14,9,100,77,-11,0,6,2
	FendQ
boss_d_0_f5	Faces
	Face3	10,11,0,119,44,13,4,5
	Face3	10,15,0,-120,-42,15,5,4
	Face3	27,16,-105,28,65,15,9,5
	Face3	23,17,105,28,65,4,8,15
	Face3	25,18,0,84,95,8,9,15
	Face3	43,19,0,0,127,17,9,19
	Face3	16,21,-90,-84,-30,3,5,17
	Face3	14,22,30,-84,90,17,5,9
	Face3	16,24,30,84,90,9,7,19
	Face3	43,25,0,0,127,18,8,16
	Face3	12,27,90,-84,-30,16,4,2
	Face3	16,28,-30,-84,90,8,4,16
	Face3	20,30,-30,84,90,18,6,8
	Face3	30,4,-83,-53,-80,0,1,3
	Face3	28,5,83,-53,-80,2,1,0
	Face3	18,6,-101,-76,-7,1,5,3
	Face3	14,7,101,-76,-7,2,4,1
	Face3	16,10,0,123,31,7,6,0
	Face3	25,12,-89,-87,24,1,13,5
	Face3	21,13,89,-87,24,4,13,1
	Face4	18,14,0,73,104,7,9,8,6
	FendQ
boss_d_0_f6	Faces
	Face3	28,3,96,-4,-83,6,12,14
	Face3	16,29,90,84,-30,2,6,18
	Face3	43,26,127,0,0,16,2,18
	Face3	34,2,-96,4,83,14,12,6
	FendQ
boss_d_0_f7	Faces
	Face3	20,23,-90,84,-30,19,7,3
	FendQ
boss_d_0_f9	Faces
	Face3	30,0,-6,-4,127,7,11,10
	Face3	32,1,6,4,-127,10,11,7
	Face3	43,20,-127,0,0,19,3,17
	FendQ
boss_d_0_EBSP
	EndShape

	endc

;--Shape file ----- C:\SHED\SHAPES5\BOSS_D_1.ANM ----
	ifne	DO_HDR

boss_d_1
	ShapeHdr	boss_d_1_P,0,boss_d_1_F,0,0,0,0,2,0,40/2,74,38,75/2,id_0_c,0,0,0,0,<boss_d_1>
	elseif
boss_d_1_P
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
	jumptab	.A12A
	jumptab	.A12A
	jumptab	.A12A
.A0A	Pointsb	14
	pb	-35,0,-29	;0
	pb	35,0,-29	;1
	pb	0,-30,-27	;2
	pb	0,-50,-27	;3
	pb	23,-10,-9	;4
	pb	-23,-10,-9	;5
	pb	0,-60,-9	;6
	pb	0,-15,0	;7
	pb	8,0,6	;8
	pb	-8,0,6	;9
	pb	18,0,10	;10
	pb	-18,0,10	;11
	pb	0,-25,18	;12
	pb	0,-45,18	;13
	PointsXb	6
	pb	18,-35,-18	;14
	pb	18,-45,-18	;16
	pb	18,-50,-9	;18
	pb	18,-25,0	;20
	pb	-18,-30,9	;22
	pb	18,-40,9	;24
	jump	.EB0
.A1A	Pointsb	14
	pb	-38,-23,-35	;0
	pb	26,0,-22	;1
	pb	0,-40,-27	;2
	pb	0,-60,-27	;3
	pb	19,-18,-4	;4
	pb	-25,-24,-12	;5
	pb	0,-70,-9	;6
	pb	0,-25,0	;7
	pb	6,-15,15	;8
	pb	-12,-8,-2	;9
	pb	17,-15,18	;10
	pb	-22,-9,2	;11
	pb	0,-35,18	;12
	pb	0,-55,18	;13
	PointsXb	6
	pb	18,-45,-18	;14
	pb	18,-55,-18	;16
	pb	18,-60,-9	;18
	pb	18,-35,0	;20
	pb	-18,-40,9	;22
	pb	18,-50,9	;24
	jump	.EB0
.A2A	Pointsb	14
	pb	-40,-33,-37	;0
	pb	20,0,-14	;1
	pb	0,-44,-27	;2
	pb	0,-64,-27	;3
	pb	18,-21,2	;4
	pb	-27,-34,-15	;5
	pb	0,-74,-9	;6
	pb	0,-29,0	;7
	pb	8,-22,24	;8
	pb	-13,-17,-4	;9
	pb	19,-22,24	;10
	pb	-24,-18,0	;11
	pb	0,-39,18	;12
	pb	0,-59,18	;13
	PointsXb	6
	pb	18,-49,-18	;14
	pb	18,-59,-18	;16
	pb	18,-64,-9	;18
	pb	18,-39,0	;20
	pb	-18,-44,9	;22
	pb	18,-54,9	;24
	jump	.EB0
.A3A	Pointsb	14
	pb	-37,-14,-33	;0
	pb	26,0,-22	;1
	pb	0,-40,-27	;2
	pb	0,-60,-27	;3
	pb	19,-18,-4	;4
	pb	-25,-24,-12	;5
	pb	0,-70,-9	;6
	pb	0,-25,0	;7
	pb	6,-15,15	;8
	pb	-12,-8,-2	;9
	pb	17,-15,18	;10
	pb	-22,-9,2	;11
	pb	0,-35,18	;12
	pb	0,-55,18	;13
	PointsXb	6
	pb	18,-45,-18	;14
	pb	18,-55,-18	;16
	pb	18,-60,-9	;18
	pb	18,-35,0	;20
	pb	-18,-40,9	;22
	pb	18,-50,9	;24
	jump	.EB0
.A4A	Pointsb	14
	pb	-35,0,-29	;0
	pb	35,0,-29	;1
	pb	0,-30,-27	;2
	pb	0,-50,-27	;3
	pb	23,-10,-9	;4
	pb	-23,-10,-9	;5
	pb	0,-60,-9	;6
	pb	0,-15,0	;7
	pb	8,0,6	;8
	pb	-8,0,6	;9
	pb	18,0,10	;10
	pb	-18,0,10	;11
	pb	0,-25,18	;12
	pb	0,-45,18	;13
	PointsXb	6
	pb	18,-35,-18	;14
	pb	18,-45,-18	;16
	pb	18,-50,-9	;18
	pb	18,-25,0	;20
	pb	-18,-30,9	;22
	pb	18,-40,9	;24
	jump	.EB0
.A5A	Pointsb	14
	pb	-30,0,-20	;0
	pb	38,-23,-35	;1
	pb	0,-40,-27	;2
	pb	0,-60,-27	;3
	pb	25,-24,-12	;4
	pb	-20,-18,-3	;5
	pb	0,-70,-9	;6
	pb	0,-25,0	;7
	pb	12,-8,-2	;8
	pb	-4,-15,13	;9
	pb	22,-9,2	;10
	pb	-14,-15,17	;11
	pb	0,-35,18	;12
	pb	0,-55,18	;13
	PointsXb	6
	pb	18,-45,-18	;14
	pb	18,-55,-18	;16
	pb	18,-60,-9	;18
	pb	18,-35,0	;20
	pb	-18,-40,9	;22
	pb	18,-50,9	;24
	jump	.EB0
.A6A	Pointsb	14
	pb	-23,0,-13	;0
	pb	39,-37,-37	;1
	pb	0,-44,-27	;2
	pb	0,-64,-27	;3
	pb	26,-33,-15	;4
	pb	-17,-22,2	;5
	pb	0,-74,-9	;6
	pb	0,-29,0	;7
	pb	15,-15,-7	;8
	pb	-4,-22,20	;9
	pb	25,-17,-3	;10
	pb	-15,-22,23	;11
	pb	0,-39,18	;12
	pb	0,-59,18	;13
	PointsXb	6
	pb	18,-49,-18	;14
	pb	18,-59,-18	;16
	pb	18,-64,-9	;18
	pb	18,-39,0	;20
	pb	-18,-44,9	;22
	pb	18,-54,9	;24
	jump	.EB0
.A7A	Pointsb	14
	pb	-26,0,-22	;0
	pb	38,-23,-35	;1
	pb	0,-40,-27	;2
	pb	0,-60,-27	;3
	pb	25,-24,-12	;4
	pb	-20,-18,-4	;5
	pb	0,-70,-9	;6
	pb	0,-25,0	;7
	pb	12,-8,-2	;8
	pb	-6,-15,15	;9
	pb	22,-9,2	;10
	pb	-17,-15,18	;11
	pb	0,-35,18	;12
	pb	0,-55,18	;13
	PointsXb	6
	pb	18,-45,-18	;14
	pb	18,-55,-18	;16
	pb	18,-60,-9	;18
	pb	18,-35,0	;20
	pb	-18,-40,9	;22
	pb	18,-50,9	;24
	jump	.EB0
.A8A	Pointsb	14
	pb	-35,0,-29	;0
	pb	35,0,-29	;1
	pb	0,-25,-22	;2
	pb	0,-45,-22	;3
	pb	23,-10,-9	;4
	pb	-23,-10,-9	;5
	pb	0,-55,-4	;6
	pb	0,-10,5	;7
	pb	8,0,6	;8
	pb	-8,0,6	;9
	pb	18,0,10	;10
	pb	-18,0,10	;11
	pb	0,-20,23	;12
	pb	0,-40,23	;13
	PointsXb	6
	pb	18,-30,-13	;14
	pb	18,-40,-13	;16
	pb	18,-45,-4	;18
	pb	18,-20,5	;20
	pb	-18,-25,14	;22
	pb	18,-35,14	;24
	jump	.EB0
.A9A	Pointsb	14
	pb	-35,0,-29	;0
	pb	35,0,-29	;1
	pb	0,-20,-17	;2
	pb	0,-40,-17	;3
	pb	23,-10,-9	;4
	pb	-23,-10,-9	;5
	pb	0,-50,1	;6
	pb	0,-5,10	;7
	pb	8,0,6	;8
	pb	-8,0,6	;9
	pb	18,0,10	;10
	pb	-18,0,10	;11
	pb	0,-15,28	;12
	pb	0,-35,28	;13
	PointsXb	6
	pb	18,-25,-8	;14
	pb	18,-35,-8	;16
	pb	18,-40,1	;18
	pb	18,-15,10	;20
	pb	-18,-20,19	;22
	pb	18,-30,19	;24
	jump	.EB0
.A10A	Pointsb	14
	pb	-35,-19,-24	;0
	pb	35,-19,-24	;1
	pb	0,-32,-13	;2
	pb	0,-52,-13	;3
	pb	23,-18,-1	;4
	pb	-23,-18,-1	;5
	pb	0,-62,5	;6
	pb	0,-17,14	;7
	pb	8,-2,7	;8
	pb	-8,-2,7	;9
	pb	18,0,10	;10
	pb	-18,0,10	;11
	pb	0,-27,32	;12
	pb	0,-47,32	;13
	PointsXb	6
	pb	18,-37,-4	;14
	pb	18,-47,-4	;16
	pb	18,-52,5	;18
	pb	18,-27,14	;20
	pb	-18,-32,23	;22
	pb	18,-42,23	;24
	jump	.EB0
.A11A	Pointsb	14
	pb	-35,-34,-10	;0
	pb	35,-34,-10	;1
	pb	0,-26,0	;2
	pb	0,-46,0	;3
	pb	23,-21,9	;4
	pb	-23,-21,9	;5
	pb	0,-56,18	;6
	pb	0,-11,27	;7
	pb	8,-3,8	;8
	pb	-8,-3,8	;9
	pb	18,0,10	;10
	pb	-18,0,10	;11
	pb	0,-21,45	;12
	pb	0,-41,45	;13
	PointsXb	6
	pb	18,-31,9	;14
	pb	18,-41,9	;16
	pb	18,-46,18	;18
	pb	18,-21,27	;20
	pb	-18,-26,36	;22
	pb	18,-36,36	;24
	jump	.EB0
.A12A	Pointsb	14
	pb	-35,-39,10	;0
	pb	35,-39,10	;1
	pb	0,-15,8	;2
	pb	0,-35,8	;3
	pb	23,-19,20	;4
	pb	-23,-19,20	;5
	pb	0,-45,26	;6
	pb	0,0,35	;7
	pb	8,-4,10	;8
	pb	-8,-4,10	;9
	pb	18,0,10	;10
	pb	-18,0,10	;11
	pb	0,-10,53	;12
	pb	0,-30,53	;13
	PointsXb	6
	pb	18,-20,17	;14
	pb	18,-30,17	;16
	pb	18,-35,26	;18
	pb	18,-10,35	;20
	pb	-18,-15,44	;22
	pb	18,-25,44	;24
.EB0

	EndPoints
boss_d_1_F
	Vizis	26
	Viz	20,8,4,95,18,-83	;0
	Viz	10,8,20,44,44,111	;1
	Viz	4,8,1,97,33,-75	;2
	Viz	5,9,21,-95,18,-83	;3
	Viz	21,9,11,-44,44,111	;4
	Viz	0,9,5,-97,33,-75	;5
	Viz	13,6,18,-55,100,55	;6
	Viz	25,19,6,55,100,55	;7
	Viz	2,7,20,-55,-100,-55	;8
	Viz	14,16,3,-57,0,-114	;9
	Viz	23,20,7,-55,-100,55	;10
	Viz	12,13,24,-57,0,114	;11
	Viz	15,21,7,55,-100,-55	;12
	Viz	2,3,17,57,0,-114	;13
	Viz	16,18,6,-55,100,-55	;14
	Viz	3,6,19,55,100,-55	;15
	Viz	19,25,22,127,0,0	;16
	Viz	12,7,21,55,-100,55	;17
	Viz	22,25,13,57,0,114	;18
	Viz	16,14,20,-127,0,0	;19
	Viz	21,11,5,120,16,40	;20
	Viz	5,11,0,111,37,49	;21
	Viz	4,10,20,-120,16,40	;22
	Viz	1,10,4,-111,37,49	;23
	Viz	1,8,10,0,-127,0	;24
	Viz	11,9,0,0,-127,0	;25
	BSPInit	boss_d_1_EBSP
	BSP	2,boss_d_1_f1,.bsp2
	BSPEND
.bsp2	BSP	5,boss_d_1_f3,.bsp4
	BSPEND
.bsp4	BSPE	boss_d_1_f5

boss_d_1_f1	Faces
	Face3	14,2,97,33,-75,4,8,1
	FendQ
boss_d_1_f3	Faces
	Face3	16,5,-97,33,-75,0,9,5
	FendQ
boss_d_1_f5	Faces
	Face3	30,0,95,18,-83,20,8,4
	Face3	28,1,44,44,111,10,8,20
	Face3	32,3,-95,18,-83,5,9,21
	Face3	28,4,-44,44,111,21,9,11
	Face4	16,8,-55,-100,-55,2,7,20,14
	Face4	18,9,-57,0,-114,14,16,3,2
	Face4	14,10,-55,-100,55,23,20,7,12
	Face4	14,12,55,-100,-55,15,21,7,2
	Face4	16,13,57,0,-114,2,3,17,15
	Face6	29,16,127,0,0,19,25,22,21,15,17
	Face4	12,17,55,-100,55,12,7,21,22
	Face6	33,19,-127,0,0,16,14,20,23,24,18
	Face3	30,20,120,16,40,21,11,5
	Face3	12,21,111,37,49,5,11,0
	Face3	32,22,-120,16,40,4,10,20
	Face3	18,23,-111,37,49,1,10,4
	Face4	32,6,-55,100,55,13,6,18,24
	Face4	30,7,55,100,55,25,19,6,13
	Face4	30,11,-57,0,114,12,13,24,23
	Face4	34,14,-55,100,-55,16,18,6,3
	Face4	32,15,55,100,-55,3,6,19,17
	Face4	28,18,57,0,114,22,25,13,12
	Face3	12,24,0,-127,0,1,8,10
	Face3	12,25,0,-127,0,11,9,0
	FendQ
boss_d_1_EBSP
	EndShape

	endc






;--Shape file ----- C:\SHED\shapes5\BOSS_D_2.TXT ----
	ifne	DO_HDR

boss_d_2
	ShapeHdr	boss_d_2_P,0,boss_d_2_F,0,0,0,0,1,0,20,20,30,41,id_0_c,0,0,0,0,<boss_d_2>
	elseif
boss_d_2_P
	datahdr
	Pointsb	2
	pb	0,-10,0	;0
	pb	0,-20,30	;1
	PointsXb	2
	pb	-10,10,0	;2
	pb	-20,20,30	;4

	EndPoints
boss_d_2_F
	Vizis	4
	Viz	4,1,5,0,0,127	;0
	Viz	0,1,4,112,56,-19	;1
	Viz	3,5,1,-112,56,-19	;2
	Viz	4,5,3,0,-120,-40	;3

boss_d_2_f1	Faces
	Face3	43,0,0,0,127,4,1,5
	Face4	30,1,112,56,-19,0,1,4,2
	Face4	32,2,-112,56,-19,3,5,1,0
	Face4	16,3,0,-120,-40,4,5,3,2
	Fend
	EndShape

	endc



;--Shape file ----- C:\SHED\shapes5\BOSS_D_4.ANM ----
	ifne	DO_HDR

boss_d_4
	ShapeHdr	boss_d_4_P,0,boss_d_4_F,0,0,0,0,1,0,57/2,21/2,37/2,60/2,id_0_c,0,0,0,0,<boss_d_4>
	elseif
boss_d_4_P
	datahdr
	Pointsb	2
	pb	0,5,5	;0
	pb	0,0,25	;1
	PointsXb	1
	pb	-5,0,25	;2
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
.A0A	Pointsb	6
	pb	0,0,-35	;4
	pb	47,-10,-11	;5
	pb	-47,-10,-11	;6
	pb	0,-13,14	;7
	pb	0,-10,30	;8
	pb	0,5,36	;9
	PointsXb	3
	pb	-17,-17,-3	;10
	pb	-10,15,5	;12
	pb	-17,-12,11	;14
	jump	.EB0
.A1A	Pointsb	6
	pb	0,-1,-35	;4
	pb	53,-7,-12	;5
	pb	-53,-7,-12	;6
	pb	0,-14,15	;7
	pb	0,-10,31	;8
	pb	0,6,36	;9
	PointsXb	3
	pb	-22,-10,-5	;10
	pb	-10,15,6	;12
	pb	-22,-5,9	;14
	jump	.EB0
.A2A	Pointsb	6
	pb	0,-1,-35	;4
	pb	55,-9,-11	;5
	pb	-55,-9,-11	;6
	pb	0,-15,16	;7
	pb	0,-9,32	;8
	pb	0,7,35	;9
	PointsXb	3
	pb	-24,-7,-7	;10
	pb	-10,15,7	;12
	pb	-24,-2,7	;14
	jump	.EB0
.A3A	Pointsb	6
	pb	0,-2,-35	;4
	pb	56,-6,-12	;5
	pb	-57,-6,-12	;6
	pb	0,-15,18	;7
	pb	0,-8,32	;8
	pb	0,8,34	;9
	PointsXb	3
	pb	-25,-3,-8	;10
	pb	-10,15,5	;12
	pb	-25,2,6	;14
	jump	.EB0
.A4A	Pointsb	6
	pb	0,-3,-35	;4
	pb	54,4,-15	;5
	pb	-55,5,-15	;6
	pb	0,-15,16	;7
	pb	0,-9,32	;8
	pb	0,7,35	;9
	PointsXb	3
	pb	-24,11,-10	;10
	pb	-10,15,6	;12
	pb	-24,11,5	;14
	jump	.EB0
.A5A	Pointsb	6
	pb	0,-3,-34	;4
	pb	51,13,-17	;5
	pb	-52,14,-17	;6
	pb	0,-14,15	;7
	pb	0,-10,31	;8
	pb	0,6,36	;9
	PointsXb	3
	pb	-20,16,-12	;10
	pb	-10,15,7	;12
	pb	-20,19,3	;14
	jump	.EB0
.A6A	Pointsb	6
	pb	0,-3,-35	;4
	pb	53,19,-15	;5
	pb	-54,21,-15	;6
	pb	0,-13,14	;7
	pb	0,-10,30	;8
	pb	0,5,36	;9
	PointsXb	3
	pb	-24,11,-10	;10
	pb	-10,15,5	;12
	pb	-24,11,5	;14
	jump	.EB0
.A7A	Pointsb	6
	pb	0,-2,-35	;4
	pb	51,18,-13	;5
	pb	-52,21,-12	;6
	pb	0,-12,13	;7
	pb	0,-10,29	;8
	pb	0,4,36	;9
	PointsXb	3
	pb	-25,5,-10	;10
	pb	-10,15,6	;12
	pb	-25,2,4	;14
	jump	.EB0
.A8A	Pointsb	6
	pb	0,-1,-35	;4
	pb	47,20,-11	;5
	pb	-47,20,-11	;6
	pb	0,-11,12	;7
	pb	0,-11,28	;8
	pb	0,3,37	;9
	PointsXb	3
	pb	-22,0,-13	;10
	pb	-10,15,7	;12
	pb	-22,-5,1	;14
	jump	.EB0
.A9A	Pointsb	6
	pb	0,-1,-35	;4
	pb	42,10,-14	;5
	pb	-42,10,-14	;6
	pb	0,-12,13	;7
	pb	0,-10,29	;8
	pb	0,4,36	;9
	PointsXb	3
	pb	-17,-10,-13	;10
	pb	-10,15,6	;12
	pb	-17,-13,2	;14
.EB0

	EndPoints
boss_d_4_F
	Vizis	20
	Viz	11,15,5,38,-114,-41	;0
	Viz	5,15,11,-38,114,41	;1
	Viz	0,11,15,92,82,29	;2
	Viz	15,11,0,-92,-82,-29	;3
	Viz	6,14,10,-38,-114,-41	;4
	Viz	10,14,6,38,114,41	;5
	Viz	14,10,0,-92,82,29	;6
	Viz	0,10,14,92,-82,-29	;7
	Viz	12,13,4,0,-119,-45	;8
	Viz	1,13,12,0,-102,76	;9
	Viz	13,0,4,-89,89,11	;10
	Viz	4,0,12,89,89,11	;11
	Viz	1,0,13,-88,88,-22	;12
	Viz	12,0,1,88,88,-22	;13
	Viz	7,2,3,0,-82,-97	;14
	Viz	8,7,3,-115,53,10	;15
	Viz	2,7,8,115,53,10	;16
	Viz	3,2,9,0,-116,-53	;17
	Viz	3,9,8,-109,24,61	;18
	Viz	8,9,2,109,24,61	;19

boss_d_4_f1	Faces
	Face3	0,0,38,-114,-41,11,15,5
	Face3	0,4,-38,-114,-41,6,14,10
	Face3	14,14,0,-82,-97,7,2,3
	Face3	7,2,92,82,29,0,11,15
	Face3	0,3,-92,-82,-29,15,11,0
	Face3	7,6,-92,82,29,14,10,0
	Face3	0,7,92,-82,-29,0,10,14
	Face3	18,9,0,-102,76,1,13,12
	Face3	32,10,-89,89,11,13,0,4
	Face3	30,11,89,89,11,4,0,12
	Face3	34,12,-88,88,-22,1,0,13
	Face3	32,13,88,88,-22,12,0,1
	Face3	18,15,-115,53,10,8,7,3
	Face3	16,16,115,53,10,2,7,8
	Face3	21,17,0,-116,-53,3,2,9
	Face3	27,18,-109,24,61,3,9,8
	Face3	23,19,109,24,61,8,9,2
	Face3	7,1,-38,114,41,5,15,11
	Face3	7,5,38,114,41,10,14,6
	Face3	16,8,0,-119,-45,12,13,4
	Fend
	EndShape

	endc


;--Shape file ----- C:\SHED\shapes5\BOSS_D_5.TXT ----
	ifne	DO_HDR

boss_d_5
	ShapeHdr	boss_d_5_P,0,boss_d_5_F,0,0,0,0,1,0,15,20,15,21,id_0_c,0,0,0,0,<boss_d_5>
	elseif
boss_d_5_P
	datahdr
	Pointsb	3
	pb	0,10,-15	;0
	pb	0,-20,0	;1
	pb	0,10,15	;2
	PointsXb	5
	pb	-10,0,-10	;3
	pb	-5,20,-5	;5
	pb	-15,10,0	;7
	pb	-5,20,5	;9
	pb	10,0,10	;11

	EndPoints
boss_d_5_F
	Vizis	13
	Viz	1,3,0,0,57,-114	;0
	Viz	11,2,12,0,57,114	;1
	Viz	3,1,12,114,57,0	;2
	Viz	8,11,1,-114,57,0	;3
	Viz	0,3,7,85,-42,-85	;4
	Viz	6,8,4,-85,-42,-85	;5
	Viz	9,7,12,85,-42,85	;6
	Viz	2,11,8,-85,-42,85	;7
	Viz	0,5,6,0,-90,-90	;8
	Viz	10,9,2,0,-90,90	;9
	Viz	9,5,7,90,-90,0	;10
	Viz	8,6,10,-90,-90,0	;11
	Viz	9,10,6,0,-127,0	;12

boss_d_5_f1	Faces
	Face4	0,0,0,57,-114,1,3,0,4
	Face4	0,1,0,57,114,11,2,12,1
	Face4	0,2,114,57,0,3,1,12,7
	Face4	0,3,-114,57,0,8,11,1,4
	Face4	0,4,85,-42,-85,0,3,7,5
	Face4	0,5,-85,-42,-85,6,8,4,0
	Face4	0,6,85,-42,85,9,7,12,2
	Face4	0,7,-85,-42,85,2,11,8,10
	Face3	0,8,0,-90,-90,0,5,6
	Face3	0,9,0,-90,90,10,9,2
	Face3	0,10,90,-90,0,9,5,7
	Face3	0,11,-90,-90,0,8,6,10
	Face4	0,12,0,-127,0,9,10,6,5
	Fend
	EndShape

	endc
;--Shape file ----- C:\SHED\shapes5\BOSS_D_6.TXT ----
	ifne	DO_HDR

boss_d_6
	ShapeHdr	boss_d_6_P,0,boss_d_6_F,0,0,0,0,1,0,15,20,15,20,normal_c,0,0,0,0,<boss_d_6>
	elseif
boss_d_6_P
	datahdr
	Pointsb	3
	pb	0,10,-15	;0
	pb	0,-20,0	;1
	pb	0,10,15	;2
	PointsXb	3
	pb	-10,0,-10	;3
	pb	-15,10,0	;5
	pb	10,0,10	;7

	EndPoints
boss_d_6_F
	Vizis	8
	Viz	1,3,0,0,57,-114	;0
	Viz	7,2,8,0,57,114	;1
	Viz	3,1,8,114,57,0	;2
	Viz	6,7,1,-114,57,0	;3
	Viz	4,0,3,0,-57,114	;4
	Viz	1,8,2,0,-57,-114	;5
	Viz	5,8,1,-114,-57,0	;6
	Viz	4,1,7,114,-57,0	;7

boss_d_6_f1	Faces
	Face4	12,4,0,-57,114,4,0,3,1
	Face4	12,5,0,-57,-114,1,8,2,7
	Face4	12,6,-114,-57,0,5,8,1,3
	Face4	12,7,114,-57,0,4,1,7,6
	Face4	14,0,0,57,-114,1,3,0,4
	Face4	14,1,0,57,114,7,2,8,1
	Face4	14,2,114,57,0,3,1,8,5
	Face4	14,3,-114,57,0,6,7,1,4
	Fend
	EndShape

	endc


;--Shape file ----- C:\SHED\shapes5\BOSS_D_7.TXT ----
	ifne	DO_HDR

boss_d_7
	ShapeHdr	boss_d_7_P,0,boss_d_7_F,0,0,0,0,1,0,15,20,15,21,normal_c,0,0,0,0,<boss_d_7>
	elseif
boss_d_7_P
	datahdr
	Pointsb	2
	pb	0,10,-15	;0
	pb	0,10,15	;1
	PointsXb	5
	pb	-10,0,-10	;2
	pb	-5,20,-5	;4
	pb	-15,10,0	;6
	pb	-5,20,5	;8
	pb	-10,0,10	;10

	EndPoints
boss_d_7_F
	Vizis	18
	Viz	0,2,6,85,-42,-85	;0
	Viz	5,7,3,-85,-42,-85	;1
	Viz	8,6,10,85,-42,85	;2
	Viz	1,11,7,-85,-42,85	;3
	Viz	0,4,5,0,-90,-90	;4
	Viz	9,8,1,0,-90,90	;5
	Viz	8,4,6,90,-90,0	;6
	Viz	7,5,9,-90,-90,0	;7
	Viz	8,9,5,0,-127,0	;8
	Viz	4,6,2,-85,42,85	;9
	Viz	0,3,7,85,42,85	;10
	Viz	1,10,6,-85,42,-85	;11
	Viz	9,7,11,85,42,-85	;12
	Viz	5,4,0,0,90,90	;13
	Viz	1,8,9,0,90,-90	;14
	Viz	6,4,8,-90,90,0	;15
	Viz	9,5,7,90,90,0	;16
	Viz	4,5,9,0,127,0	;17

boss_d_7_f1	Faces
	Face4	12,9,-85,42,85,4,6,2,0
	Face4	12,10,85,42,85,0,3,7,5
	Face4	12,11,-85,42,-85,1,10,6,8
	Face4	12,12,85,42,-85,9,7,11,1
	Face3	12,13,0,90,90,5,4,0
	Face3	12,14,0,90,-90,1,8,9
	Face3	12,15,-90,90,0,6,4,8
	Face3	12,16,90,90,0,9,5,7
	Face4	12,17,0,127,0,4,5,9,8
	Face4	14,0,85,-42,-85,0,2,6,4
	Face4	14,1,-85,-42,-85,5,7,3,0
	Face4	14,2,85,-42,85,8,6,10,1
	Face4	14,3,-85,-42,85,1,11,7,9
	Face3	14,4,0,-90,-90,0,4,5
	Face3	14,5,0,-90,90,9,8,1
	Face3	14,6,90,-90,0,8,4,6
	Face3	14,7,-90,-90,0,7,5,9
	Face4	14,8,0,-127,0,8,9,5,4
	Fend
	EndShape

	endc



;--Shape file ----- C:\SHED\shapes5\BOSS_D_8.ANM ----
	ifne	DO_HDR

boss_d_8
	ShapeHdr	boss_d_8_P,0,boss_d_8_F,0,0,0,0,2,0,71,71,48,93,id_0_c,0,0,0,0,<boss_d_8>
	elseif
boss_d_8_P
	datahdr
	Frames	14
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
.A0A	Pointsb	7
	pb	-10,-50,-20	;0
	pb	-7,-51,-20	;1
	pb	-14,-42,-16	;2
	pb	-14,-30,-10	;3
	pb	-6,-29,-8	;4
	pb	-12,-20,-5	;5
	pb	0,-40,10	;6
	jump	.EB0
.A1A	Pointsb	7
	pb	-24,-50,-11	;0
	pb	-21,-51,-12	;1
	pb	-25,-42,-5	;2
	pb	-22,-30,0	;3
	pb	-14,-29,-3	;4
	pb	-18,-20,3	;5
	pb	0,-40,10	;6
	jump	.EB0
.A2A	Pointsb	7
	pb	-32,-53,3	;0
	pb	-22,-65,4	;1
	pb	-36,-46,7	;2
	pb	-36,-38,4	;3
	pb	-23,-40,5	;4
	pb	-34,-29,7	;5
	pb	0,-40,10	;6
	jump	.EB0
.A3A	Pointsb	7
	pb	-46,-53,-1	;0
	pb	-22,-65,4	;1
	pb	-48,-42,2	;2
	pb	-50,-25,2	;3
	pb	-23,-40,5	;4
	pb	-46,-10,8	;5
	pb	0,-40,10	;6
	jump	.EB0
.A4A	Pointsb	7
	pb	-59,-51,-9	;0
	pb	-22,-65,3	;1
	pb	-61,-36,-7	;2
	pb	-65,-11,-1	;3
	pb	-22,-43,16	;4
	pb	-55,6,11	;5
	pb	0,-40,10	;6
	jump	.EB0
.A5A	Pointsb	7
	pb	-58,-60,7	;0
	pb	-19,-68,13	;1
	pb	-63,-44,7	;2
	pb	-68,-19,10	;3
	pb	-19,-44,21	;4
	pb	-57,-1,19	;5
	pb	0,-40,9	;6
	jump	.EB0
.A6A	Pointsb	7
	pb	-56,-64,19	;0
	pb	-16,-69,15	;1
	pb	-61,-49,22	;2
	pb	-68,-24,25	;3
	pb	-16,-46,24	;4
	pb	-58,-5,30	;5
	pb	0,-40,9	;6
	jump	.EB0
.A7A	Pointsb	7
	pb	-52,-68,27	;0
	pb	-13,-70,19	;1
	pb	-57,-53,31	;2
	pb	-65,-28,37	;3
	pb	-13,-46,27	;4
	pb	-56,-8,40	;5
	pb	0,-40,9	;6
	jump	.EB0
.A8A	Pointsb	7
	pb	-55,-71,24	;0
	pb	-19,-68,8	;1
	pb	-61,-57,30	;2
	pb	-68,-35,41	;3
	pb	-19,-46,20	;4
	pb	-61,-15,46	;5
	pb	0,-40,9	;6
	jump	.EB0
.A9A	Pointsb	7
	pb	-58,-68,8	;0
	pb	-22,-60,-6	;1
	pb	-64,-58,18	;2
	pb	-71,-39,35	;3
	pb	-22,-44,13	;4
	pb	-64,-23,48	;5
	pb	0,-40,9	;6
	jump	.EB0
.A10A	Pointsb	7
	pb	-59,-60,-2	;0
	pb	-23,-50,-13	;1
	pb	-65,-52,11	;2
	pb	-71,-37,31	;3
	pb	-23,-37,9	;4
	pb	-64,-22,46	;5
	pb	0,-40,9	;6
	jump	.EB0
.A11A	Pointsb	7
	pb	-59,-48,-8	;0
	pb	-21,-43,-17	;1
	pb	-64,-39,4	;2
	pb	-70,-24,23	;3
	pb	-21,-31,5	;4
	pb	-62,-10,38	;5
	pb	0,-40,9	;6
	jump	.EB0
.A12A	Pointsb	7
	pb	-55,-33,-14	;0
	pb	-16,-32,-20	;1
	pb	-60,-25,-1	;2
	pb	-64,-12,21	;3
	pb	-16,-23,4	;4
	pb	-56,-2,39	;5
	pb	0,-40,9	;6
	jump	.EB0
.A13A	Pointsb	7
	pb	-56,-31,-23	;0
	pb	-21,-48,-16	;1
	pb	-59,-18,-15	;2
	pb	-60,2,0	;3
	pb	-21,-32,3	;4
	pb	-51,15,17	;5
	pb	0,-40,9	;6
.EB0

	EndPoints
boss_d_8_F
	Vizis	10
	Viz	5,1,4,32,58,108	;0
	Viz	4,1,5,-32,-58,-108	;1
	Viz	3,1,4,20,59,110	;2
	Viz	4,1,3,-20,-59,-110	;3
	Viz	1,2,4,-14,-60,-111	;4
	Viz	4,2,1,14,60,111	;5
	Viz	1,0,4,-20,-59,-111	;6
	Viz	4,0,1,20,59,111	;7
	Viz	6,1,4,-122,-12,-33	;8
	Viz	4,1,6,122,12,33	;9
	BSPInit	boss_d_8_EBSP
	BSP	9,boss_d_8_f1,.bsp2
	BSPEND
.bsp2	BSPE	boss_d_8_f3

boss_d_8_f1	Faces
	Face3	32,9,122,12,33,4,1,6
	FendQ
boss_d_8_f3	Faces
	Face3	14,0,32,58,108,5,1,4
	Face3	16,2,20,59,110,3,1,4
	Face3	18,5,14,60,111,4,2,1
	Face3	20,7,20,59,111,4,0,1
	Face3	14,1,-32,-58,-108,4,1,5
	Face3	16,3,-20,-59,-110,4,1,3
	Face3	18,4,-14,-60,-111,1,2,4
	Face3	20,6,-20,-59,-111,1,0,4
	Face3	32,8,-122,-12,-33,6,1,4
	FendQ
boss_d_8_EBSP
	EndShape

	endc

;--Shape file ----- C:\SHED\shapes5\BOSS_D_9.ANM ----
	ifne	DO_HDR

boss_d_9
	ShapeHdr	boss_d_9_P,0,boss_d_9_F,0,0,0,0,2,0,71,71,48,93,id_0_c,0,0,0,0,<boss_d_9>
	elseif
boss_d_9_P
	datahdr
	Frames	14
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
.A0A	Pointsb	7
	pb	10,-50,-20	;0
	pb	7,-51,-20	;1
	pb	14,-42,-16	;2
	pb	14,-30,-10	;3
	pb	6,-29,-8	;4
	pb	12,-20,-5	;5
	pb	0,-40,10	;6
	jump	.EB0
.A1A	Pointsb	7
	pb	24,-50,-11	;0
	pb	21,-51,-12	;1
	pb	25,-42,-5	;2
	pb	22,-30,0	;3
	pb	14,-29,-3	;4
	pb	18,-20,3	;5
	pb	0,-40,10	;6
	jump	.EB0
.A2A	Pointsb	7
	pb	32,-53,3	;0
	pb	22,-65,4	;1
	pb	36,-46,7	;2
	pb	36,-38,4	;3
	pb	23,-40,5	;4
	pb	34,-29,7	;5
	pb	0,-40,10	;6
	jump	.EB0
.A3A	Pointsb	7
	pb	46,-53,-1	;0
	pb	22,-65,4	;1
	pb	48,-42,2	;2
	pb	50,-25,2	;3
	pb	23,-40,5	;4
	pb	46,-10,8	;5
	pb	0,-40,10	;6
	jump	.EB0
.A4A	Pointsb	7
	pb	59,-51,-9	;0
	pb	22,-65,3	;1
	pb	61,-36,-7	;2
	pb	65,-11,-1	;3
	pb	22,-43,16	;4
	pb	55,6,11	;5
	pb	0,-40,10	;6
	jump	.EB0
.A5A	Pointsb	7
	pb	58,-60,7	;0
	pb	19,-68,13	;1
	pb	63,-44,7	;2
	pb	68,-19,10	;3
	pb	19,-44,21	;4
	pb	57,-1,19	;5
	pb	0,-40,9	;6
	jump	.EB0
.A6A	Pointsb	7
	pb	56,-64,19	;0
	pb	16,-69,15	;1
	pb	61,-49,22	;2
	pb	68,-24,25	;3
	pb	16,-46,24	;4
	pb	58,-5,30	;5
	pb	0,-40,9	;6
	jump	.EB0
.A7A	Pointsb	7
	pb	52,-68,27	;0
	pb	13,-70,19	;1
	pb	57,-53,31	;2
	pb	65,-28,37	;3
	pb	13,-46,27	;4
	pb	56,-8,40	;5
	pb	0,-40,9	;6
	jump	.EB0
.A8A	Pointsb	7
	pb	55,-71,24	;0
	pb	19,-68,8	;1
	pb	61,-57,30	;2
	pb	68,-35,41	;3
	pb	19,-46,20	;4
	pb	61,-15,46	;5
	pb	0,-40,9	;6
	jump	.EB0
.A9A	Pointsb	7
	pb	58,-68,8	;0
	pb	22,-60,-6	;1
	pb	64,-58,18	;2
	pb	71,-39,35	;3
	pb	22,-44,13	;4
	pb	64,-23,48	;5
	pb	0,-40,9	;6
	jump	.EB0
.A10A	Pointsb	7
	pb	59,-60,-2	;0
	pb	23,-50,-13	;1
	pb	65,-52,11	;2
	pb	71,-37,31	;3
	pb	23,-37,9	;4
	pb	64,-22,46	;5
	pb	0,-40,9	;6
	jump	.EB0
.A11A	Pointsb	7
	pb	59,-48,-8	;0
	pb	21,-43,-17	;1
	pb	64,-39,4	;2
	pb	70,-24,23	;3
	pb	21,-31,5	;4
	pb	62,-10,38	;5
	pb	0,-40,9	;6
	jump	.EB0
.A12A	Pointsb	7
	pb	55,-33,-14	;0
	pb	16,-32,-20	;1
	pb	60,-25,-1	;2
	pb	64,-12,21	;3
	pb	16,-23,4	;4
	pb	56,-2,39	;5
	pb	0,-40,9	;6
	jump	.EB0
.A13A	Pointsb	7
	pb	56,-31,-23	;0
	pb	21,-48,-16	;1
	pb	59,-18,-15	;2
	pb	60,2,0	;3
	pb	21,-32,3	;4
	pb	51,15,17	;5
	pb	0,-40,9	;6
.EB0

	EndPoints
boss_d_9_F
	Vizis	10
	Viz	4,1,5,-32,58,108	;0
	Viz	5,1,4,32,-58,-108	;1
	Viz	4,1,3,-20,59,110	;2
	Viz	3,1,4,20,-59,-110	;3
	Viz	4,2,1,14,-60,-111	;4
	Viz	1,2,4,-14,60,111	;5
	Viz	4,0,1,20,-59,-111	;6
	Viz	1,0,4,-20,59,111	;7
	Viz	4,1,6,122,-12,-33	;8
	Viz	6,1,4,-122,12,33	;9
	BSPInit	boss_d_9_EBSP
	BSP	9,boss_d_9_f1,.bsp2
	BSPEND
.bsp2	BSPE	boss_d_9_f3

boss_d_9_f1	Faces
	Face3	32,9,-122,12,33,6,1,4
	FendQ
boss_d_9_f3	Faces
	Face3	12,0,-32,58,108,4,1,5
	Face3	14,2,-20,59,110,4,1,3
	Face3	16,5,-14,60,111,1,2,4
	Face3	18,7,-20,59,111,1,0,4
	Face3	12,1,32,-58,-108,5,1,4
	Face3	14,3,20,-59,-110,3,1,4
	Face3	16,4,14,-60,-111,4,2,1
	Face3	18,6,20,-59,-111,4,0,1
	Face3	32,8,122,-12,-33,4,1,6
	FendQ
boss_d_9_EBSP
	EndShape

	endc


;--Shape file ----- C:\SHED\neck.txt ----
	ifne	DO_HDR

neck_s
	ShapeHdr_s	neck_s_P,0,neck_s_F,0,0,0,0,0,80,5,0,80,80,id_0_c,0,0,0,0,<neck_s>
	elseif
neck_s_P
	datahdr
	PointsXb	2
	pb	-5,0,0	;0
	pb	-5,0,80	;2

	EndPoints
neck_s_F
	Vizis	2
	Viz	0,2,3,0,-127,0	;0
	Viz	3,2,0,0,127,0	;1

neck_s_f1	Faces
	Face4	0,0,0,-127,0,0,2,3,1
	Face4	3,1,0,127,0,3,2,0,1
	Fend
	EndShape

	endc



;--Shape file ----- C:\SHED\SHAPES5\AIR_1.TXT ----
	ifne	DO_HDR

air_1
	ShapeHdr	air_1_P,0,air_1_F,0,0,0,0,0,air_col,15,42,110,50,id_0_c,0,0,0,0,<air_1>
	elseif
air_1_P
	Pointsb	5
	pb	0,-15,-25	;0
	pb	0,-28,-20	;1
	pb	0,-40,-7	;2
	pb	0,0,2	;3
	pb	0,-30,2	;4
	PointsXb	8
	pb	7,-5,-1	;5
	pb	-15,2,8	;7
	pb	-5,0,32	;9
	pb	-5,-30,32	;11
	pb	-10,-5,35	;13
	pb	-5,-13,40	;15
	pb	-10,-42,75	;17
	pb	10,-16,110	;19

	EndPoints
air_1_F
	Vizis	17
	Viz	5,0,6,0,-117,-49	;0
	Viz	1,0,5,-123,12,-31	;1
	Viz	6,0,1,123,12,-31	;2
	Viz	1,5,2,-124,21,-20	;3
	Viz	2,6,1,124,21,-20	;4
	Viz	2,5,6,0,21,125	;5
	Viz	15,16,19,0,127,-5	;6
	Viz	14,19,16,-104,72,-11	;7
	Viz	15,20,13,104,72,-11	;8
	Viz	13,14,16,0,67,-108	;9
	Viz	6,13,7,88,91,-7	;10
	Viz	7,13,6,-88,-91,7	;11
	Viz	8,14,5,-88,91,-7	;12
	Viz	5,14,8,88,-91,7	;13
	Viz	13,20,19,0,-126,18	;14
	Viz	9,3,4,125,0,-21	;17
	Viz	12,4,3,-125,0,-21	;18
	BSPInit	air_1_EBSP
	BSP	9,air_1_f1,.bsp2
	BSP	7,air_1_f3,.bsp4
	BSPE	air_1_f5
.bsp4	BSPE	air_1_f6
.bsp2	BSPE	air_1_f7

air_1_f1	Faces
	Face4	14,9,0,67,-108,13,14,16,15
	FendQ
air_1_f3	Faces
	Face3	21,7,-104,72,-11,14,19,16
	FendQ
air_1_f5	Faces
	Face3	23,8,104,72,-11,15,20,13
	Face4	16,6,0,127,-5,15,16,19,20
	Face2	43,-1,0,0,0,17,13
	Face4	12,14,0,-126,18,13,20,19,14
	FendQ
air_1_f6	Faces
	Face2	43,-1,0,0,0,14,18
	FendQ
air_1_f7	Faces
	Face3	21,5,0,21,125,2,5,6
	Face3	18,10,88,91,-7,6,13,7
	Face3	12,11,-88,-91,7,7,13,6
	Face3	16,12,-88,91,-7,8,14,5
	Face3	12,13,88,-91,7,5,14,8
	Face4	60,15,125,0,-21,4,11,9,3
	Face4	59,16,-125,0,-21,12,4,3,10
	Face3	44,0,0,-117,-49,5,0,6
	Face3	18,1,-123,12,-31,1,0,5
	Face3	20,2,123,12,-31,6,0,1
	Face3	25,3,-124,21,-20,1,5,2
	Face3	27,4,124,21,-20,2,6,1
	FendQ
air_1_EBSP
	EndShape

	endc


;--Shape file ----- shapes\missile.txt ----
	ifne	DO_HDR

Lmissile
	shapehdr	MISSILE_P,0,MISSILE_F,0,0,0,0,2,0,12,15,30,36,id_0_c,0,0,0,0,<MISSILE>
missile
	shapehdr	MISSILE_P,0,MISSILE_F,0,0,0,0,1,0,12,15,30,36,id_0_c,0,0,0,0,<MISSILE>
	elseif
missile_P
	datahdr
	Pointsb	4
	pb	0,0,-30	;0
	pb	0,-15,-30	;1
	pb	0,-5,-10	;2
	pb	0,0,30	;3
	PointsXb	2
	pb	12,15,-30	;4
	pb	6,5,-10	;6

	EndPoints
missile_F
	Vizis	12
	Viz	3,2,6,-109,65,8	;0
	Viz	7,2,3,109,65,8	;1
	Viz	3,6,7,0,-126,16	;2
	Viz	6,2,0,-108,65,-16	;3
	Viz	0,2,7,108,65,-16	;4
	Viz	7,6,0,0,-123,-31	;5
	Viz	1,0,2,-127,0,0	;6
	Viz	2,0,1,127,0,0	;7
	Viz	5,0,7,99,79,-10	;8
	Viz	7,0,5,-99,-79,10	;9
	Viz	6,0,4,-99,79,-10	;10
	Viz	4,0,6,99,-79,10	;11
	BSPInit	missile_EBSP
	BSP	3,missile_f1,.bsp2
	BSP	9,missile_f3,.bsp4
	BSPEND
.bsp4	BSPE	missile_f5
.bsp2	BSPE	missile_f6

missile_f1	Faces
	Face3	16-2,3,-108,65,-16,6,2,0
	FendQ
missile_f3	Faces
	Face3	23-2,9,-99,-79,10,7,0,5
	FendQ
missile_f5	Faces
	Face3	18-2,4,108,65,-16,0,2,7
	Face3	14-2,5,0,-123,-31,7,6,0
	Face3	16-2,2,0,-126,16,3,6,7
	Face3	18-2,0,-109,65,8,3,2,6
	Face3	20-2,1,109,65,8,7,2,3
	Face3	25-2,8,99,79,-10,5,0,7
	FendQ
missile_f6	Faces
	Face3	23-2,6,-127,0,0,1,0,2
	Face3	25-2,10,-99,79,-10,6,0,4
	Face3	27-2,7,127,0,0,2,0,1
	Face3	21-2,11,99,-79,10,4,0,6
	FendQ
missile_EBSP
	EndShape

	endc



;--Shape file ----- C:\SHED\SHAPES6\BIG_GATE.TXT ----
	ifne	DO_HDR

big_gate
	ShapeHdr	big_gate_P,0,big_gate_F,0,0,0,0,2,big_gate_col1,50,70,75,102,id_0_c,0,0,0,0,<big_gate>
	elseif
big_gate_P
	PointsXb	21
	pb	40,-47,-75	;0
	pb	-50,-47,-75	;2
	pb	-15,-60,-75	;4
	pb	-40,-37,-65	;6
	pb	-15,-50,-65	;8
	pb	-40,-57,-65	;10
	pb	-50,-57,-65	;12
	pb	-15,-70,-65	;14
	pb	-40,0,-62	;16
	pb	-50,0,-62	;18
	pb	-40,-22,-50	;20
	pb	-50,-22,-50	;22
	pb	-40,0,50	;24
	pb	-50,0,50	;26
	pb	-40,-22,50	;28
	pb	-50,-22,50	;30
	pb	-40,-37,50	;32
	pb	-15,-50,50	;34
	pb	40,-57,50	;36
	pb	-50,-57,50	;38
	pb	-15,-70,50	;40

	EndPoints
big_gate_F
	Vizis	28
	Viz	9,5,4,0,-90,-90	;0
	Viz	14,4,5,0,90,-90	;1
	Viz	7,0,5,44,-84,-84	;2
	Viz	15,5,0,-44,84,-84	;3
	Viz	8,4,1,-44,-84,-84	;4
	Viz	10,1,4,44,84,-84	;5
	Viz	9,8,34,0,-127,0	;6
	Viz	6,32,34,-59,-113,0	;7
	Viz	9,35,33,59,-113,0	;8
	Viz	41,40,14,0,127,0	;9
	Viz	11,36,41,-59,113,0	;10
	Viz	14,40,37,59,113,0	;11
	Viz	1,2,22,0,-90,-90	;12
	Viz	2,1,10,0,90,-90	;13
	Viz	12,10,37,0,127,0	;14
	Viz	18,16,20,0,61,-111	;15
	Viz	18,22,30,127,0,0	;16
	Viz	24,28,20,-127,0,0	;17
	Viz	2,12,38,127,0,0	;18
	Viz	20,28,32,-127,0,0	;19
	Viz	7,21,23,0,-90,-90	;20
	Viz	23,21,17,0,61,-111	;21
	Viz	17,21,29,127,0,0	;22
	Viz	7,33,29,127,0,0	;23
	Viz	27,31,23,-127,0,0	;24
	Viz	23,31,39,-127,0,0	;25
	Viz	13,11,0,0,90,-90	;26
	Viz	39,36,11,0,127,0	;27
	BSPInit	big_gate_EBSP
	BSP	17,big_gate_f1,.bsp2
	BSPE	big_gate_f3
.bsp2	BSP	19,big_gate_f4,.bsp5
	BSPEND
.bsp5	BSP	22,big_gate_f6,.bsp7
	BSPE	big_gate_f8
.bsp7	BSP	23,big_gate_f9,.bsp10
	BSPEND
.bsp10	BSPE	big_gate_f11

big_gate_f1	Faces
	Face4	20,17,-127,0,0,24,28,20,16
	FendQ
big_gate_f3	Faces
	Face4	12,16,127,0,0,18,22,30,26
	Face5	28,18,127,0,0,2,12,38,30,22
	FendQ
big_gate_f4	Faces
	Face4	32,19,-127,0,0,20,28,32,6
	FendQ
big_gate_f6	Faces
	Face4	12,22,127,0,0,17,21,29,25
	FendQ
big_gate_f8	Faces
	Face4	20,24,-127,0,0,27,31,23,19
	Face5	34,25,-127,0,0,23,31,39,13,3
	FendQ
big_gate_f9	Faces
	Face4	28,23,127,0,0,7,33,29,21
	FendQ
big_gate_f11	Faces
	Face4	16,0,0,-90,-90,9,5,4,8
	Face4	14,2,44,-84,-84,7,0,5,9
	Face4	18,4,-44,-84,-84,8,4,1,6
	Face4	14,6,0,-127,0,9,8,34,35
	Face4	16,7,-59,-113,0,6,32,34,8
	Face4	12,8,59,-113,0,9,35,33,7
	Face4	32,13,0,90,-90,2,1,10,12
	Face4	30,14,0,127,0,12,10,37,38
	Face4	18,15,0,61,-111,18,16,20,22
	Face4	18,21,0,61,-111,23,21,17,19
	Face4	32,26,0,90,-90,13,11,0,3
	Face4	30,27,0,127,0,39,36,11,13
	Face4	32,1,0,90,-90,14,4,5,15
	Face4	34,3,-44,84,-84,15,5,0,11
	Face4	30,5,44,84,-84,10,1,4,14
	Face4	30,9,0,127,0,41,40,14,15
	Face4	32,10,-59,113,0,11,36,41,15
	Face4	28,11,59,113,0,14,40,37,10
	Face5	30,12,0,-90,-90,1,2,22,20,6
	Face5	30,20,0,-90,-90,7,21,23,3,0
	FendQ
big_gate_EBSP
	EndShape

	endc


;--Shape file ----- C:\SHED\SHAPES6\BASE_1.ANM ----
	ifne	DO_HDR

base_1
	ShapeHdr	base_1_P,0,base_1_F,0,0,0,0,3,base_1_col1,40,80,45,92,id_0_c,0,0,0,0,<base_1>
	elseif
base_1_P
	PointsXb	19
	pb	-30,-45,-45	;0
	pb	-30,-55,-45	;2
	pb	-30,0,-35	;4
	pb	-30,-35,-35	;6
	pb	-40,-45,-35	;8
	pb	-40,-55,-35	;10
	pb	-30,-65,-35	;12
	pb	-30,-80,-35	;14
	pb	25,0,-25	;16
	pb	-40,0,-25	;18
	pb	-25,-35,-25	;20
	pb	-40,-35,-25	;22
	pb	-25,0,26	;24
	pb	-40,0,26	;26
	pb	-25,-35,26	;28
	pb	-40,-35,26	;30
	pb	-30,-55,26	;32
	pb	-40,-55,26	;34
	pb	-30,-65,26	;36
	Frames	8
	jumptab	.A7A
	jumptab	.A6A
	jumptab	.A5A
	jumptab	.A4A
	jumptab	.A3A
	jumptab	.A2A
	jumptab	.A1A
	jumptab	.A0A
.A0A	PointsXb	3
	pb	25,-5,-25	;38
	pb	25,0,-20	;40
	pb	-25,0,-15	;42
	jump	.EB0
.A1A	PointsXb	3
	pb	25,-10,-25	;38
	pb	25,-5,-20	;40
	pb	-25,-5,-15	;42
	jump	.EB0
.A2A	PointsXb	3
	pb	25,-15,-25	;38
	pb	25,-10,-20	;40
	pb	-25,-10,-15	;42
	jump	.EB0
.A3A	PointsXb	3
	pb	25,-20,-25	;38
	pb	25,-15,-20	;40
	pb	-25,-15,-15	;42
	jump	.EB0
.A4A	PointsXb	3
	pb	25,-25,-25	;38
	pb	25,-20,-20	;40
	pb	-25,-20,-15	;42
	jump	.EB0
.A5A	PointsXb	3
	pb	25,-30,-25	;38
	pb	25,-25,-20	;40
	pb	-25,-25,-15	;42
	jump	.EB0
.A6A	PointsXb	3
	pb	25,-35,-25	;38
	pb	25,-30,-20	;40
	pb	-25,-30,-15	;42
	jump	.EB0
.A7A	PointsXb	3
	pb	25,-35,-25	;38
	pb	25,-35,-20	;40
	pb	-25,-35,-15	;42
.EB0

	EndPoints
base_1_F
	Vizis	29
	Viz	6,4,17,-114,0,-57	;2
	Viz	21,16,5,114,0,-57	;3
	Viz	20,0,6,-104,-52,-52	;4
	Viz	7,1,21,104,-52,-52	;5
	Viz	20,21,1,0,-114,-57	;6
	Viz	2,3,33,0,127,0	;7
	Viz	3,13,37,127,0,0	;8
	Viz	32,36,12,-127,0,0	;9
	Viz	2,0,1,0,0,-127	;10
	Viz	37,13,11,-90,90,0	;11
	Viz	19,27,31,-127,0,0	;12
	Viz	11,9,23,-127,0,0	;13
	Viz	11,3,1,-90,0,-90	;14
	Viz	13,3,11,-73,73,-73	;15
	Viz	9,1,7,-73,-73,-73	;16
	Viz	5,19,23,-90,0,-90	;17
	Viz	34,10,12,90,90,0	;18
	Viz	22,30,26,127,0,0	;19
	Viz	34,30,22,127,0,0	;20
	Viz	8,0,2,90,0,-90	;21
	Viz	10,2,12,73,73,-73	;22
	Viz	22,6,0,73,-73,-73	;23
	Viz	6,22,18,90,0,-90	;24
	Viz	39,38,21,0,0,-127	;25
	Viz	41,40,38,0,-90,-90	;26
	Viz	40,41,42,0,-127,0	;27
	Viz	21,29,25,127,0,0	;28
	Viz	17,24,28,-127,0,0	;29
	Viz	28,29,21,0,-127,0	;30
	BSPInit	base_1_EBSP
	BSP	5,base_1_f1,.bsp2
	BSP	26,base_1_f3,.bsp4
	BSPE	base_1_f5
.bsp4	BSP	27,base_1_f6,.bsp7
	BSPE	base_1_f8
.bsp7	BSP	4,base_1_f9,.bsp10
	BSPE	base_1_f11
.bsp10	BSP	0,base_1_f12,.bsp13
	BSPEND
.bsp13	BSP	1,base_1_f14,.bsp15
	BSPEND
.bsp15	BSPE	base_1_f16
.bsp2	BSP	9,base_1_f17,.bsp18
	BSPE	base_1_f19
.bsp18	BSPE	base_1_f20

base_1_f1	Faces
	Face4	20,5,0,127,0,2,3,33,32
	FendQ
base_1_f3	Faces
	Face4	12,26,127,0,0,21,29,25,16
	FendQ
base_1_f5	Faces
	Face4	28,14,-73,-73,-73,9,1,7,23
	Face4	30,15,-90,0,-90,5,19,23,7
	Face4	18,10,-127,0,0,19,27,31,23
	Face5	20,11,-127,0,0,11,9,23,31,35
	FendQ
base_1_f6	Faces
	Face4	12,27,-127,0,0,17,24,28,20
	FendQ
base_1_f8	Faces
	Face4	28,21,73,-73,-73,22,6,0,8
	Face4	30,22,90,0,-90,6,22,18,4
	Face4	12,17,127,0,0,22,30,26,18
	Face5	14,18,127,0,0,34,30,22,8,10
	FendQ
base_1_f9	Faces
	Face4	16,4,0,-114,-57,20,21,1,0
	FendQ
base_1_f11	Faces
	Face4	14,28,0,-127,0,28,29,21,20
	FendQ
base_1_f12	Faces
	Face4	16,0,-114,0,-57,6,4,17,20
	FendQ
base_1_f14	Faces
	Face4	14,1,114,0,-57,21,16,5,7
	FendQ
base_1_f16	Faces
	Face3	18,2,-104,-52,-52,20,0,6
	Face3	12,3,104,-52,-52,7,1,21
	Face4	30,23,0,0,-127,39,38,21,20
	Face4	28,24,0,-90,-90,41,40,38,39
	Face4	43,25,0,-127,0,40,41,42,43
	FendQ
base_1_f17	Faces
	Face4	34,9,-90,90,0,37,13,11,35
	FendQ
base_1_f19	Faces
	Face4	30,7,-127,0,0,32,36,12,2
	Face4	30,16,90,90,0,34,10,12,36
	Face3	32,20,73,73,-73,10,2,12
	Face2	44,-1,0,0,0,12,14
	Face4	18,8,0,0,-127,2,0,1,3
	Face4	30,12,-90,0,-90,11,3,1,9
	Face4	30,19,90,0,-90,8,0,2,10
	FendQ
base_1_f20	Faces
	Face3	32,13,-73,73,-73,13,3,11
	Face4	30,6,127,0,0,3,13,37,33
	Face2	44,-1,0,0,0,15,13
	FendQ
base_1_EBSP
	EndShape

	endc




;--Shape file ----- C:\SHED\NSHAPES\open_l.anm ----
	ifne	DO_HDR

open_l
	ShapeHdr	open_l_P,0,open_l_F,0,0,0,0,0,0,45,60,20,78,id_0_c,0,0,0,0,<open_l>
	elseif
open_l_P
	Pointsb	4
	pb	-45,60,-20	;0
	pb	-45,50,-20	;1
	pb	-45,-50,-20	;2
	pb	-45,-60,-20	;3
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
.A0A	Pointsb	24
	pb	45,60,-20	;4
	pb	-5,50,-20	;5
	pb	45,50,-20	;6
	pb	-25,30,-20	;7
	pb	-25,-30,-20	;8
	pb	-5,-50,-20	;9
	pb	45,-50,-20	;10
	pb	45,-60,-20	;11
	pb	-5,40,-10	;12
	pb	20,40,-10	;13
	pb	25,40,-10	;14
	pb	45,40,-10	;15
	pb	-15,30,-10	;16
	pb	-15,1,-10	;17
	pb	-15,-1,-10	;18
	pb	-15,-30,-10	;19
	pb	-5,-40,-10	;20
	pb	20,-40,-10	;21
	pb	25,-40,-10	;22
	pb	45,-40,-10	;23
	pb	45,60,20	;24
	pb	45,40,20	;25
	pb	45,-40,20	;26
	pb	45,-60,20	;27
	jump	.EB0
.A1A	Pointsb	24
	pb	35,60,-20	;4
	pb	-15,50,-20	;5
	pb	35,50,-20	;6
	pb	-35,30,-20	;7
	pb	-35,-30,-20	;8
	pb	-15,-50,-20	;9
	pb	35,-50,-20	;10
	pb	35,-60,-20	;11
	pb	-15,40,-10	;12
	pb	10,40,-10	;13
	pb	15,40,-10	;14
	pb	35,40,-10	;15
	pb	-25,30,-10	;16
	pb	-25,1,-10	;17
	pb	-25,-1,-10	;18
	pb	-25,-30,-10	;19
	pb	-15,-40,-10	;20
	pb	10,-40,-10	;21
	pb	15,-40,-10	;22
	pb	35,-40,-10	;23
	pb	35,60,20	;24
	pb	35,40,20	;25
	pb	35,-40,20	;26
	pb	35,-60,20	;27
	jump	.EB0
.A2A	Pointsb	24
	pb	25,60,-20	;4
	pb	-25,50,-20	;5
	pb	25,50,-20	;6
	pb	-45,30,-20	;7
	pb	-45,-30,-20	;8
	pb	-25,-50,-20	;9
	pb	25,-50,-20	;10
	pb	25,-60,-20	;11
	pb	-25,40,-10	;12
	pb	0,40,-10	;13
	pb	5,40,-10	;14
	pb	25,40,-10	;15
	pb	-35,30,-10	;16
	pb	-35,1,-10	;17
	pb	-35,-1,-10	;18
	pb	-35,-30,-10	;19
	pb	-25,-40,-10	;20
	pb	0,-40,-10	;21
	pb	5,-40,-10	;22
	pb	25,-40,-10	;23
	pb	25,60,20	;24
	pb	25,40,20	;25
	pb	25,-40,20	;26
	pb	25,-60,20	;27
	jump	.EB0
.A3A	Pointsb	24
	pb	15,60,-20	;4
	pb	-35,50,-20	;5
	pb	15,50,-20	;6
	pb	-45,40,-20	;7
	pb	-45,-40,-20	;8
	pb	-35,-50,-20	;9
	pb	15,-50,-20	;10
	pb	15,-60,-20	;11
	pb	-35,40,-10	;12
	pb	-10,40,-10	;13
	pb	-5,40,-10	;14
	pb	15,40,-10	;15
	pb	-45,30,-10	;16
	pb	-45,1,-10	;17
	pb	-45,-1,-10	;18
	pb	-45,-30,-10	;19
	pb	-35,-40,-10	;20
	pb	-10,-40,-10	;21
	pb	-5,-40,-10	;22
	pb	15,-40,-10	;23
	pb	15,60,20	;24
	pb	15,40,20	;25
	pb	15,-40,20	;26
	pb	15,-60,20	;27
	jump	.EB0
.A4A	Pointsb	24
	pb	5,60,-20	;4
	pb	-45,50,-20	;5
	pb	5,50,-20	;6
	pb	-45,40,-20	;7
	pb	-45,-40,-20	;8
	pb	-45,-50,-20	;9
	pb	5,-50,-20	;10
	pb	5,-60,-20	;11
	pb	-45,40,-10	;12
	pb	-20,40,-10	;13
	pb	-15,40,-10	;14
	pb	5,40,-10	;15
	pb	-45,30,-10	;16
	pb	-45,11,-10	;17
	pb	-45,-11,-10	;18
	pb	-45,-30,-10	;19
	pb	-45,-40,-10	;20
	pb	-20,-40,-10	;21
	pb	-15,-40,-10	;22
	pb	5,-40,-10	;23
	pb	5,60,20	;24
	pb	5,40,20	;25
	pb	5,-40,20	;26
	pb	5,-60,20	;27
	jump	.EB0
.A5A	Pointsb	24
	pb	-5,60,-20	;4
	pb	-45,50,-20	;5
	pb	-5,50,-20	;6
	pb	-45,40,-20	;7
	pb	-45,-40,-20	;8
	pb	-45,-50,-20	;9
	pb	-5,-50,-20	;10
	pb	-5,-60,-20	;11
	pb	-45,40,-10	;12
	pb	-30,40,-10	;13
	pb	-25,40,-10	;14
	pb	-5,40,-10	;15
	pb	-45,30,-10	;16
	pb	-45,21,-10	;17
	pb	-45,-21,-10	;18
	pb	-45,-30,-10	;19
	pb	-45,-40,-10	;20
	pb	-30,-40,-10	;21
	pb	-25,-40,-10	;22
	pb	-5,-40,-10	;23
	pb	-5,60,20	;24
	pb	-5,40,20	;25
	pb	-5,-40,20	;26
	pb	-5,-60,20	;27
	jump	.EB0
.A6A	Pointsb	24
	pb	-15,60,-20	;4
	pb	-45,50,-20	;5
	pb	-15,50,-20	;6
	pb	-45,40,-20	;7
	pb	-45,-40,-20	;8
	pb	-45,-50,-20	;9
	pb	-15,-50,-20	;10
	pb	-15,-60,-20	;11
	pb	-45,40,-10	;12
	pb	-40,40,-10	;13
	pb	-35,40,-10	;14
	pb	-15,40,-10	;15
	pb	-45,30,-10	;16
	pb	-45,30,-10	;17
	pb	-45,-30,-10	;18
	pb	-45,-30,-10	;19
	pb	-45,-40,-10	;20
	pb	-40,-40,-10	;21
	pb	-35,-40,-10	;22
	pb	-15,-40,-10	;23
	pb	-15,60,20	;24
	pb	-15,40,20	;25
	pb	-15,-40,20	;26
	pb	-15,-60,20	;27
	jump	.EB0
.A7A	Pointsb	24
	pb	-25,60,-20	;4
	pb	-45,50,-20	;5
	pb	-25,50,-20	;6
	pb	-45,40,-20	;7
	pb	-45,-40,-20	;8
	pb	-45,-50,-20	;9
	pb	-25,-50,-20	;10
	pb	-25,-60,-20	;11
	pb	-45,40,-10	;12
	pb	-45,40,-10	;13
	pb	-45,40,-10	;14
	pb	-25,40,-10	;15
	pb	-45,30,-10	;16
	pb	-45,30,-10	;17
	pb	-45,-30,-10	;18
	pb	-45,-30,-10	;19
	pb	-45,-40,-10	;20
	pb	-45,-40,-10	;21
	pb	-45,-40,-10	;22
	pb	-25,-40,-10	;23
	pb	-25,60,20	;24
	pb	-25,40,20	;25
	pb	-25,-40,20	;26
	pb	-25,-60,20	;27
	jump	.EB0
.A8A	Pointsb	24
	pb	-35,60,-20	;4
	pb	-45,50,-20	;5
	pb	-35,50,-20	;6
	pb	-45,40,-20	;7
	pb	-45,-40,-20	;8
	pb	-45,-50,-20	;9
	pb	-35,-50,-20	;10
	pb	-35,-60,-20	;11
	pb	-45,40,-10	;12
	pb	-45,40,-10	;13
	pb	-45,40,-10	;14
	pb	-35,40,-10	;15
	pb	-45,30,-10	;16
	pb	-45,30,-10	;17
	pb	-45,-30,-10	;18
	pb	-45,-30,-10	;19
	pb	-45,-40,-10	;20
	pb	-45,-40,-10	;21
	pb	-45,-40,-10	;22
	pb	-35,-40,-10	;23
	pb	-35,60,20	;24
	pb	-35,40,20	;25
	pb	-35,-40,20	;26
	pb	-35,-60,20	;27
	jump	.EB0
.A9A	Pointsb	24
	pb	-45,60,-20	;4
	pb	-45,50,-20	;5
	pb	-45,50,-20	;6
	pb	-45,40,-20	;7
	pb	-45,-40,-20	;8
	pb	-45,-50,-20	;9
	pb	-45,-50,-20	;10
	pb	-45,-60,-20	;11
	pb	-45,40,-10	;12
	pb	-45,40,-10	;13
	pb	-45,40,-10	;14
	pb	-45,40,-10	;15
	pb	-45,30,-10	;16
	pb	-45,30,-10	;17
	pb	-45,-30,-10	;18
	pb	-45,-30,-10	;19
	pb	-45,-40,-10	;20
	pb	-45,-40,-10	;21
	pb	-45,-40,-10	;22
	pb	-45,-40,-10	;23
	pb	-45,60,20	;24
	pb	-45,40,20	;25
	pb	-45,-40,20	;26
	pb	-45,-60,20	;27
.EB0

	EndPoints
open_l_F
	Vizis	18
	Viz	17,16,12,0,0,-127	;0
	Viz	21,20,19,0,0,-127	;1
;	Viz	18,17,13,0,0,-127	;2
	Viz	13,21,18,0,0,-127	;2
	Viz	21,13,14,0,0,-127	;3
	Viz	23,15,25,-127,0,0	;4
	Viz	24,25,15,-127,0,0	;5
	Viz	11,10,23,-127,0,0	;6
	Viz	22,14,15,0,0,-127	;7
	Viz	8,7,16,-90,0,-90	;8
	Viz	16,7,5,-73,73,-73	;9
	Viz	15,12,5,0,90,-90	;10
	Viz	20,9,8,-73,-73,-73	;11
	Viz	10,9,20,0,-90,-90	;12
	Viz	1,5,7,0,0,-127	;13
	Viz	8,9,2,0,0,-127	;14
	Viz	1,7,8,0,0,-127	;15
	Viz	0,4,6,0,0,-127	;16
	Viz	2,10,11,0,0,-127	;17

open_l_f1	Faces
	Face4	10,0,0,0,-127,17,16,12,13
	Face4	10,1,0,0,-127,21,20,19,18
	Face4	10,3,0,0,-127,21,13,14,22
	Face4	18,7,0,0,-127,22,14,15,23
	Face4	16,8,-90,0,-90,8,7,16,19
	Face4	17,9,-73,73,-73,16,7,5,12
	Face4	20,10,0,90,-90,15,12,5,6
	Face4	15,11,-73,-73,-73,20,9,8,19
	Face4	14,12,0,-90,-90,10,9,20,23
	Face4	14,4,-127,0,0,23,15,25,26
	Face5	12,5,-127,0,0,24,25,15,6,4
	Face5	12,6,-127,0,0,11,10,23,26,27
	Face3	18,13,0,0,-127,1,5,7
	Face3	18,14,0,0,-127,8,9,2
	Face4	18,15,0,0,-127,1,7,8,2
	Face4	18,16,0,0,-127,0,4,6,1
	Face4	18,17,0,0,-127,2,10,11,3
	Face4	43,2,0,0,-127,17,13,21,18	;2 
	Fend
	EndShape

	endc


	IFEQ	1

;--Shape file ----- C:\SHED\SHAPES6\RUNNING.ANM ----
	ifne	DO_HDR

running
	ShapeHdr	running_P,0,running_F,0,0,0,0,0,0,25,68,38,81,id_0_c,0,0,0,0,<running>
	elseif
running_P
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
.A0A	Pointsb	22
	pb	25,-31,-28	;0
	pb	-20,-36,-20	;1
	pb	20,-36,-20	;2
	pb	-13,-42,-5	;3
	pb	13,-42,-5	;4
	pb	-16,-44,-5	;5
	pb	16,-44,-5	;6
	pb	8,-52,-5	;7
	pb	-8,-52,-5	;8
	pb	0,-57,-5	;9
	pb	8,-57,-5	;10
	pb	-8,-57,-5	;11
	pb	-6,-17,-4	;12
	pb	-11,-23,-3	;13
	pb	-6,-34,-1	;14
	pb	0,-37,0	;15
	pb	0,-29,1	;16
	pb	6,-34,1	;17
	pb	11,-23,3	;18
	pb	6,-17,4	;19
	pb	11,0,7	;20
	pb	-11,-6,9	;21
	PointsXb	2
	pb	-5,-63,-5	;22
	pb	3,-67,-5	;24
	jump	.EB0
.A1A	Pointsb	22
	pb	25,-37,-33	;0
	pb	-20,-32,-15	;1
	pb	20,-38,-24	;2
	pb	-13,-41,-1	;3
	pb	13,-41,-9	;4
	pb	-16,-43,-2	;5
	pb	16,-43,-8	;6
	pb	8,-51,-6	;7
	pb	-8,-51,-4	;8
	pb	0,-56,-5	;9
	pb	8,-56,-6	;10
	pb	-8,-56,-4	;11
	pb	-6,-17,-8	;12
	pb	-11,-23,-6	;13
	pb	-6,-33,-2	;14
	pb	0,-36,0	;15
	pb	0,-28,1	;16
	pb	6,-33,2	;17
	pb	11,-23,6	;18
	pb	6,-17,8	;19
	pb	11,0,14	;20
	pb	-11,0,-2	;21
	PointsXb	2
	pb	-5,-62,-5	;22
	pb	3,-66,-5	;24
	jump	.EB0
.A2A	Pointsb	22
	pb	25,-49,-37	;0
	pb	-20,-32,-9	;1
	pb	20,-46,-28	;2
	pb	-13,-41,2	;3
	pb	13,-41,-12	;4
	pb	-16,-43,1	;5
	pb	16,-43,-11	;6
	pb	8,-50,-7	;7
	pb	-8,-50,-3	;8
	pb	0,-55,-5	;9
	pb	8,-55,-7	;10
	pb	-8,-55,-3	;11
	pb	-6,-17,-11	;12
	pb	-11,-23,-8	;13
	pb	-6,-32,-3	;14
	pb	0,-35,0	;15
	pb	0,-27,1	;16
	pb	6,-32,3	;17
	pb	11,-23,8	;18
	pb	6,-17,11	;19
	pb	11,-2,20	;20
	pb	-11,0,-14	;21
	PointsXb	2
	pb	-5,-61,-5	;22
	pb	3,-65,-5	;24
	jump	.EB0
.A3A	Pointsb	22
	pb	25,-58,-37	;0
	pb	-20,-31,0	;1
	pb	20,-53,-28	;2
	pb	-13,-45,5	;3
	pb	13,-45,-15	;4
	pb	-16,-47,4	;5
	pb	16,-47,-14	;6
	pb	8,-53,-8	;7
	pb	-8,-53,-2	;8
	pb	0,-58,-5	;9
	pb	8,-58,-8	;10
	pb	-8,-58,-2	;11
	pb	-6,-22,-15	;12
	pb	-11,-27,-11	;13
	pb	-6,-35,-4	;14
	pb	0,-38,0	;15
	pb	0,-30,1	;16
	pb	6,-35,4	;17
	pb	11,-27,11	;18
	pb	6,-22,15	;19
	pb	11,-8,26	;20
	pb	-11,-8,-26	;21
	PointsXb	2
	pb	-5,-64,-5	;22
	pb	3,-68,-5	;24
	jump	.EB0
.A4A	Pointsb	22
	pb	25,-68,-36	;0
	pb	-20,-32,6	;1
	pb	20,-60,-29	;2
	pb	-13,-47,9	;3
	pb	13,-47,-19	;4
	pb	-16,-48,7	;5
	pb	16,-48,-17	;6
	pb	8,-53,-9	;7
	pb	-8,-53,-1	;8
	pb	0,-58,-5	;9
	pb	8,-58,-9	;10
	pb	-8,-58,-1	;11
	pb	-6,-20,-11	;12
	pb	-11,-26,-8	;13
	pb	-6,-35,-3	;14
	pb	0,-38,0	;15
	pb	0,-30,1	;16
	pb	6,-35,3	;17
	pb	11,-26,8	;18
	pb	6,-20,11	;19
	pb	11,-9,25	;20
	pb	-11,-5,-20	;21
	PointsXb	2
	pb	-5,-64,-5	;22
	pb	3,-68,-5	;24
	jump	.EB0
.A5A	Pointsb	22
	pb	25,-61,-38	;0
	pb	-20,-31,-2	;1
	pb	20,-56,-29	;2
	pb	-13,-45,5	;3
	pb	13,-45,-15	;4
	pb	-16,-47,4	;5
	pb	16,-47,-14	;6
	pb	8,-53,-8	;7
	pb	-8,-53,-2	;8
	pb	0,-58,-5	;9
	pb	8,-58,-8	;10
	pb	-8,-58,-2	;11
	pb	-6,-19,-8	;12
	pb	-11,-25,-6	;13
	pb	-6,-35,-2	;14
	pb	0,-38,0	;15
	pb	0,-30,1	;16
	pb	6,-35,2	;17
	pb	11,-25,6	;18
	pb	6,-19,8	;19
	pb	11,-10,23	;20
	pb	-11,-2,-14	;21
	PointsXb	2
	pb	-5,-64,-5	;22
	pb	3,-68,-5	;24
	jump	.EB0
.A6A	Pointsb	22
	pb	25,-52,-37	;0
	pb	-20,-31,-7	;1
	pb	20,-49,-28	;2
	pb	-13,-44,2	;3
	pb	13,-44,-12	;4
	pb	-16,-46,1	;5
	pb	16,-46,-11	;6
	pb	8,-53,-7	;7
	pb	-8,-53,-3	;8
	pb	0,-58,-5	;9
	pb	8,-58,-7	;10
	pb	-8,-58,-3	;11
	pb	-6,-18,-4	;12
	pb	-11,-24,-3	;13
	pb	-6,-35,-1	;14
	pb	0,-38,0	;15
	pb	0,-30,1	;16
	pb	6,-35,1	;17
	pb	11,-24,3	;18
	pb	6,-18,4	;19
	pb	11,-12,20	;20
	pb	-11,-1,-7	;21
	PointsXb	2
	pb	-5,-64,-5	;22
	pb	3,-68,-5	;24
	jump	.EB0
.A7A	Pointsb	22
	pb	25,-36,-32	;0
	pb	-20,-32,-11	;1
	pb	20,-39,-23	;2
	pb	-13,-43,-1	;3
	pb	13,-43,-9	;4
	pb	-16,-45,-2	;5
	pb	16,-45,-8	;6
	pb	8,-53,-6	;7
	pb	-8,-53,-4	;8
	pb	0,-58,-5	;9
	pb	8,-58,-6	;10
	pb	-8,-58,-4	;11
	pb	-6,-18,0	;12
	pb	-11,-24,0	;13
	pb	-6,-35,0	;14
	pb	0,-38,0	;15
	pb	0,-30,1	;16
	pb	6,-35,0	;17
	pb	11,-24,0	;18
	pb	6,-18,0	;19
	pb	11,-15,18	;20
	pb	-11,0,0	;21
	PointsXb	2
	pb	-5,-64,-5	;22
	pb	3,-68,-5	;24
	jump	.EB0
.A8A	Pointsb	22
	pb	25,-31,-28	;0
	pb	-20,-36,-20	;1
	pb	20,-36,-20	;2
	pb	-13,-42,-5	;3
	pb	13,-42,-5	;4
	pb	-16,-44,-5	;5
	pb	16,-44,-5	;6
	pb	8,-52,-5	;7
	pb	-8,-52,-5	;8
	pb	0,-57,-5	;9
	pb	8,-57,-5	;10
	pb	-8,-57,-5	;11
	pb	-6,-17,4	;12
	pb	-11,-23,3	;13
	pb	-6,-34,1	;14
	pb	0,-37,0	;15
	pb	0,-29,1	;16
	pb	6,-34,-1	;17
	pb	11,-23,-3	;18
	pb	6,-17,-4	;19
	pb	11,-6,9	;20
	pb	-11,0,7	;21
	PointsXb	2
	pb	-5,-63,-5	;22
	pb	3,-67,-5	;24
	jump	.EB0
.A9A	Pointsb	22
	pb	25,-26,-20	;0
	pb	-20,-37,-24	;1
	pb	20,-32,-13	;2
	pb	-13,-41,-9	;3
	pb	13,-41,-1	;4
	pb	-16,-43,-8	;5
	pb	16,-43,-2	;6
	pb	8,-51,-4	;7
	pb	-8,-51,-6	;8
	pb	0,-56,-5	;9
	pb	8,-56,-4	;10
	pb	-8,-56,-6	;11
	pb	-6,-17,8	;12
	pb	-11,-23,6	;13
	pb	-6,-33,2	;14
	pb	0,-36,0	;15
	pb	0,-28,1	;16
	pb	6,-33,-2	;17
	pb	11,-23,-6	;18
	pb	6,-17,-8	;19
	pb	11,0,-2	;20
	pb	-11,0,14	;21
	PointsXb	2
	pb	-5,-62,-5	;22
	pb	3,-66,-5	;24
	jump	.EB0
.A10A	Pointsb	22
	pb	25,-19,-11	;0
	pb	-20,-46,-27	;1
	pb	20,-28,-7	;2
	pb	-13,-41,-11	;3
	pb	13,-41,2	;4
	pb	-16,-43,-10	;5
	pb	16,-43,1	;6
	pb	8,-50,-3	;7
	pb	-8,-50,-6	;8
	pb	0,-55,-5	;9
	pb	8,-55,-3	;10
	pb	-8,-55,-6	;11
	pb	-6,-17,11	;12
	pb	-11,-23,8	;13
	pb	-6,-32,3	;14
	pb	0,-35,0	;15
	pb	0,-27,1	;16
	pb	6,-32,-3	;17
	pb	11,-23,-8	;18
	pb	6,-17,-11	;19
	pb	11,0,-14	;20
	pb	-11,-2,20	;21
	PointsXb	2
	pb	-5,-61,-5	;22
	pb	3,-65,-5	;24
	jump	.EB0
.A11A	Pointsb	22
	pb	25,-21,-5	;0
	pb	-20,-58,-27	;1
	pb	20,-30,-1	;2
	pb	-13,-45,-15	;3
	pb	13,-45,5	;4
	pb	-16,-47,-14	;5
	pb	16,-47,4	;6
	pb	8,-53,-2	;7
	pb	-8,-53,-8	;8
	pb	0,-58,-5	;9
	pb	8,-58,-2	;10
	pb	-8,-58,-8	;11
	pb	-6,-22,15	;12
	pb	-11,-27,11	;13
	pb	-6,-35,4	;14
	pb	0,-38,0	;15
	pb	0,-30,1	;16
	pb	6,-35,-4	;17
	pb	11,-27,-11	;18
	pb	6,-22,-15	;19
	pb	11,-8,-26	;20
	pb	-11,-8,26	;21
	PointsXb	2
	pb	-5,-64,-5	;22
	pb	3,-68,-5	;24
	jump	.EB0
.A12A	Pointsb	22
	pb	25,-22,3	;0
	pb	-20,-61,-28	;1
	pb	20,-32,4	;2
	pb	-13,-47,-19	;3
	pb	13,-47,9	;4
	pb	-16,-48,-17	;5
	pb	16,-48,7	;6
	pb	8,-53,-1	;7
	pb	-8,-53,-9	;8
	pb	0,-58,-5	;9
	pb	8,-58,-1	;10
	pb	-8,-58,-9	;11
	pb	-6,-20,11	;12
	pb	-11,-26,8	;13
	pb	-6,-35,3	;14
	pb	0,-38,0	;15
	pb	0,-30,1	;16
	pb	6,-35,-3	;17
	pb	11,-26,-8	;18
	pb	6,-20,-11	;19
	pb	11,-5,-20	;20
	pb	-11,-9,25	;21
	PointsXb	2
	pb	-5,-64,-5	;22
	pb	3,-68,-5	;24
	jump	.EB0
.A13A	Pointsb	22
	pb	25,-21,-5	;0
	pb	-20,-58,-27	;1
	pb	20,-31,-2	;2
	pb	-13,-45,-15	;3
	pb	13,-45,5	;4
	pb	-16,-47,-14	;5
	pb	16,-47,4	;6
	pb	8,-53,-2	;7
	pb	-8,-53,-8	;8
	pb	0,-58,-5	;9
	pb	8,-58,-2	;10
	pb	-8,-58,-8	;11
	pb	-6,-19,8	;12
	pb	-11,-25,6	;13
	pb	-6,-35,2	;14
	pb	0,-38,0	;15
	pb	0,-30,1	;16
	pb	6,-35,-2	;17
	pb	11,-25,-6	;18
	pb	6,-19,-8	;19
	pb	11,-2,-14	;20
	pb	-11,-10,23	;21
	PointsXb	2
	pb	-5,-64,-5	;22
	pb	3,-68,-5	;24
	jump	.EB0
.A14A	Pointsb	22
	pb	25,-22,-10	;0
	pb	-20,-49,-28	;1
	pb	20,-31,-6	;2
	pb	-13,-44,-12	;3
	pb	13,-44,2	;4
	pb	-16,-46,-11	;5
	pb	16,-46,1	;6
	pb	8,-53,-3	;7
	pb	-8,-53,-7	;8
	pb	0,-58,-5	;9
	pb	8,-58,-3	;10
	pb	-8,-58,-7	;11
	pb	-6,-18,4	;12
	pb	-11,-24,3	;13
	pb	-6,-35,1	;14
	pb	0,-38,0	;15
	pb	0,-30,1	;16
	pb	6,-35,-1	;17
	pb	11,-24,-3	;18
	pb	6,-18,-4	;19
	pb	11,-1,-7	;20
	pb	-11,-12,20	;21
	PointsXb	2
	pb	-5,-64,-5	;22
	pb	3,-68,-5	;24
	jump	.EB0
.A15A	Pointsb	22
	pb	25,-25,-17	;0
	pb	-20,-39,-24	;1
	pb	20,-32,-11	;2
	pb	-13,-43,-9	;3
	pb	13,-43,-1	;4
	pb	-16,-45,-8	;5
	pb	16,-45,-2	;6
	pb	8,-53,-4	;7
	pb	-8,-53,-6	;8
	pb	0,-58,-5	;9
	pb	8,-58,-4	;10
	pb	-8,-58,-6	;11
	pb	-6,-18,0	;12
	pb	-11,-24,0	;13
	pb	-6,-35,0	;14
	pb	0,-38,0	;15
	pb	0,-30,1	;16
	pb	6,-35,0	;17
	pb	11,-24,0	;18
	pb	6,-18,0	;19
	pb	11,0,0	;20
	pb	-11,-15,18	;21
	PointsXb	2
	pb	-5,-64,-5	;22
	pb	3,-68,-5	;24
.EB0

	EndPoints
running_F
	Vizis	28
	Viz	19,18,20,1,22,125	;0
	Viz	17,18,19,1,22,125	;1
	Viz	21,13,12,-83,56,79	;2
	Viz	12,13,14,1,-22,125	;3
	Viz	17,16,14,20,25,123	;4
	Viz	2,4,6,-61,-91,65	;5
	Viz	7,6,4,0,0,127	;6
	Viz	6,7,10,0,0,127	;7
	Viz	5,3,1,61,-91,65	;8
	Viz	3,5,8,0,0,127	;9
	Viz	11,8,5,0,0,127	;10
	Viz	15,8,7,0,40,120	;11
	Viz	10,7,8,0,0,127	;12
	Viz	25,24,23,0,0,127	;13
	Viz	20,18,19,-1,-22,-125	;15
	Viz	19,18,17,-1,-22,-125	;16
	Viz	12,13,21,83,-56,-79	;17
	Viz	14,13,12,-1,22,-125	;18
	Viz	9,14,16,-19,-26,-123	;19
	Viz	6,4,2,61,91,-65	;20
	Viz	4,6,7,0,0,-127	;21
	Viz	10,7,6,0,0,-127	;22
	Viz	1,3,5,-61,91,-65	;23
	Viz	8,5,3,0,0,-127	;24
	Viz	5,8,11,0,0,-127	;25
	Viz	7,8,15,0,-40,-120	;26
	Viz	11,8,7,0,0,-127	;27
	Viz	23,24,25,0,0,-127	;28
	BSPInit	running_EBSP
	BSP	3,running_f1,.bsp2
	BSP	6,running_f3,.bsp4
	BSPE	running_f5
.bsp4	BSP	11,running_f6,.bsp7
	BSPEND
.bsp7	BSPE	running_f8
.bsp2	BSP	17,running_f9,.bsp10
	BSPE	running_f11
.bsp10	BSPE	running_f12

running_f1	Faces
	Face3	14,3,1,-22,125,12,13,14
	FendQ
running_f3	Faces
	Face3	14,6,0,0,127,7,6,4
	FendQ
running_f5	Faces
	Face3	23,19,61,91,-65,6,4,2
	Face3	23,22,-61,91,-65,1,3,5
	Face2	44,-1,0,0,0,2,0
	Face3	21,5,-61,-91,65,2,4,6
	Face3	21,8,61,-91,65,5,3,1
	FendQ
running_f6	Faces
	Face3	12,11,0,40,120,15,8,7
	FendQ
running_f8	Faces
	Face3	14,7,0,0,127,6,7,10
	Face3	14,9,0,0,127,3,5,8
	Face3	14,10,0,0,127,11,8,5
	Face4	12,12,0,0,127,10,7,8,11
	Face5	21,13,0,0,127,25,24,23,9,22
	Face3	18,20,0,0,-127,4,6,7
	Face3	18,21,0,0,-127,10,7,6
	Face3	18,23,0,0,-127,8,5,3
	Face3	18,24,0,0,-127,5,8,11
	Face4	16,26,0,0,-127,11,8,7,10
	Face5	23,27,0,0,-127,23,24,25,22,9
	Face3	16,25,0,-40,-120,7,8,15
	FendQ
running_f9	Faces
	Face3	18,17,-1,22,-125,14,13,12
	FendQ
running_f11	Faces
	Face3	21,2,-83,56,79,21,13,12
	Face3	23,14,-1,-22,-125,20,18,19
	Face3	18,15,-1,-22,-125,19,18,17
	Face3	21,0,1,22,125,19,18,20
	Face3	14,1,1,22,125,17,18,19
	Face3	23,16,83,-56,-79,12,13,21
	FendQ
running_f12	Faces
	Face4	12,4,20,25,123,17,16,14,9
	Face4	16,18,-19,-26,-123,9,14,16,17
	FendQ
running_EBSP
	EndShape

	endc

	ENDC


;--Shape file ----- C:\SHED\NSHAPES\ship_s_0.txt ----
	ifne	DO_HDR

ship_s_0
	ShapeHdr	ship_s_0_P,0,ship_s_0_F,0,0,0,0,3,0,42,20,3,45,id_0_c,0,0,0,0,<ship_s_0>
	elseif
ship_s_0_P
	Pointsb	10
	pb	2,-15,-3	;0
	pb	-1,-16,-3	;1
	pb	-11,-14,-3	;2
	pb	-11,-14,0	;3
	pb	-19,14,-3	;4
	pb	-14,20,-3	;5
	pb	4,-9,-3	;6
	pb	6,2,0	;7
	pb	-42,-15,0	;8
	pb	-16,5,0	;9

	EndPoints
ship_s_0_F
	Vizis	2
	Viz	6,5,4,0,0,127	;0
	Viz	9,8,3,0,0,127	;1

ship_s_0_f1	Faces
	Face6	14,0,0,0,127,6,5,4,2,1,0
	Face4	16,1,0,0,127,9,8,3,7
	Fend
	EndShape

	endc

;--Shape file ----- C:\SHED\NSHAPES\op_0.txt ----
	ifne	DO_HDR

op_0
	ShapeHdr	op_0_P,0,op_0_F,0,0,0,0,3,0,15,15,60,64,id_0_c,0,0,0,0,<op_0>
	elseif
op_0_P
	PointsXb	10
	pb	-15,0,-60	;0
	pb	-15,-15,-60	;2
	pb	-15,0,-5	;4
	pb	-15,-15,-5	;6
	pb	-15,0,0	;8
	pb	-15,-15,0	;10
	pb	-15,0,55	;12
	pb	-15,-15,55	;14
	pb	-15,0,60	;16
	pb	-15,-15,60	;18

	EndPoints
op_0_F
	Vizis	1
	Viz	19,17,16,0,0,127	;24

op_0_f1	Faces
	Face2	16,-1,0,-127,0,8,10
	Face2	16,-1,0,0,0,11,9
	Face2	14,-1,127,0,0,8,9
	Face2	0,-1,90,-90,0,10,11
	Face2	16,-1,0,-127,0,4,6
	Face2	16,-1,127,0,0,7,5
	Face2	14,-1,90,-90,0,4,5
	Face2	0,-1,-127,0,0,6,7
	Face2	14,-1,0,0,0,8,0
	Face2	14,-1,-90,-90,0,1,9
	Face2	20,-1,73,73,-73,10,2
	Face2	20,-1,73,73,73,3,11
	Face2	16,-1,-90,0,-90,12,14
	Face2	16,-1,-90,0,90,15,13
	Face2	14,-1,0,90,-90,12,13
	Face2	0,-1,0,90,90,14,15
	Face2	14,-1,-127,0,0,16,8
	Face2	14,-1,-90,-90,0,9,17
	Face2	20,-1,73,73,-73,18,10
	Face2	20,-1,73,73,73,11,19
	Face2	16,-1,90,0,-90,16,18
	Face2	16,-1,90,0,90,19,17
	Face2	14,-1,-73,73,-73,16,17
	Face2	0,-1,-73,73,73,18,19
;	Face4	15,0,0,0,127,19,17,16,18
	Fend
	EndShape

	endc


;--Shape file ----- C:\SHED\NSHAPES\op_1.txt ----
	ifne	DO_HDR

op_1
	ShapeHdr	op_1_P,0,op_1_F,0,0,0,0,3,0,43,63,60,86,id_0_c,0,0,0,0,<op_1>
	elseif
op_1_P
	PointsXb	20
	pb	40,0,-60	;0
	pb	-40,-35,-60	;2
	pb	-15,-60,-60	;4
	pb	43,0,-57	;6
	pb	43,-35,-57	;8
	pb	15,-63,-57	;10
	pb	40,0,-54	;12
	pb	40,-35,-54	;14
	pb	-15,-60,-54	;16
	pb	-40,0,0	;18
	pb	-40,-35,0	;20
	pb	15,-60,0	;22
	pb	43,0,3	;24
	pb	43,-35,3	;26
	pb	15,-63,3	;28
	pb	-40,0,6	;30
	pb	-40,-35,6	;32
	pb	-15,-60,6	;34
	pb	-40,-35,60	;36
	pb	-15,-60,60	;38

	EndPoints
op_1_F
	Vizis	30
	Viz	23,34,35,0,-127,0	;0
	Viz	19,21,33,127,0,0	;2
	Viz	22,35,33,90,-90,0	;3
	Viz	4,16,17,0,-127,0	;4
	Viz	0,3,14,127,0,0	;5
	Viz	5,17,14,90,-90,0	;6
	Viz	13,15,2,-127,0,0	;7
	Viz	2,15,16,-90,-90,0	;9
	Viz	11,9,2,73,73,-73	;10
	Viz	16,15,9,73,73,73	;11
	Viz	7,1,2,90,0,-90	;12
	Viz	9,15,13,90,0,90	;13
	Viz	5,3,8,-73,73,-73	;14
	Viz	10,8,14,-73,73,73	;15
	Viz	8,3,0,-90,0,-90	;16
	Viz	6,12,14,-90,0,90	;17
	Viz	11,4,5,0,90,-90	;18
	Viz	10,17,16,0,90,90	;19
	Viz	30,32,20,-127,0,0	;20
	Viz	20,32,34,-90,-90,0	;21
	Viz	29,27,20,73,73,-73	;22
	Viz	34,32,27,73,73,73	;23
	Viz	25,18,20,90,0,-90	;24
	Viz	27,32,30,90,0,90	;25
	Viz	22,21,26,-73,73,-73	;26
	Viz	28,26,33,-73,73,73	;27
	Viz	26,21,19,-90,0,-90	;28
	Viz	24,31,33,-90,0,90	;29
	Viz	29,23,22,0,90,-90	;32
	Viz	28,35,34,0,90,90	;33
	BSPInit	op_1_EBSP
	BSP	0,op_1_f1,.bsp2
	BSPEND
.bsp2	BSP	1,op_1_f3,.bsp4
	BSPEND
.bsp4	BSP	2,op_1_f5,.bsp6
	BSPEND
.bsp6	BSP	3,op_1_f7,.bsp8
	BSPEND
.bsp8	BSP	4,op_1_f9,.bsp10
	BSPEND
.bsp10	BSP	5,op_1_f11,.bsp12
	BSPEND
.bsp12	BSP	6,op_1_f13,.bsp14
	BSPEND
.bsp14	BSP	7,op_1_f15,.bsp16
	BSPEND
.bsp16	BSP	18,op_1_f17,.bsp18
	BSPEND
.bsp18	BSP	19,op_1_f19,.bsp20
	BSPEND
.bsp20	BSPE	op_1_f21

op_1_f1	Faces
	Face4	32,0,0,-127,0,23,34,35,22
	FendQ
op_1_f3	Faces
	Face4	28,1,127,0,0,19,21,33,31
	FendQ
op_1_f5	Faces
	Face4	30,2,90,-90,0,22,35,33,21
	FendQ
op_1_f7	Faces
	Face4	32,3,0,-127,0,4,16,17,5
	FendQ
op_1_f9	Faces
	Face4	28,4,127,0,0,0,3,14,12
	FendQ
op_1_f11	Faces
	Face4	30,5,90,-90,0,5,17,14,3
	FendQ
op_1_f13	Faces
	Face4	32,6,-127,0,0,13,15,2,1
	FendQ
op_1_f15	Faces
	Face4	34,7,-90,-90,0,2,15,16,4
	FendQ
op_1_f17	Faces
	Face4	32,18,-127,0,0,30,32,20,18
	FendQ
op_1_f19	Faces
	Face4	34,19,-90,-90,0,20,32,34,23
	FendQ
op_1_f21	Faces
	Face4	32,9,73,73,73,16,15,9,11
	Face4	30,11,90,0,90,9,15,13,7
	Face4	32,13,-73,73,73,10,8,14,17
	Face4	30,15,-90,0,90,6,12,14,8
	Face4	34,17,0,90,90,10,17,16,11
	Face4	30,20,73,73,-73,29,27,20,23
	Face4	32,21,73,73,73,34,32,27,29
	Face4	28,22,90,0,-90,25,18,20,27
	Face4	30,23,90,0,90,27,32,30,25
	Face4	30,24,-73,73,-73,22,21,26,28
	Face4	32,25,-73,73,73,28,26,33,35
	Face4	28,26,-90,0,-90,26,21,19,24
	Face4	30,27,-90,0,90,24,31,33,26
	Face4	32,28,0,90,-90,29,23,22,28
	Face4	34,29,0,90,90,28,35,34,29
	Face2	30,-1,0,0,0,37,3
	Face2	30,-1,0,0,0,2,36
	Face2	34,-1,0,0,0,4,38
	Face2	34,-1,0,0,0,39,5
	Face4	30,8,73,73,-73,11,9,2,4
	Face4	28,10,90,0,-90,7,1,2,9
	Face4	30,12,-73,73,-73,5,3,8,10
	Face4	28,14,-90,0,-90,8,3,0,6
	Face4	32,16,0,90,-90,11,4,5,10
	FendQ
op_1_EBSP
	EndShape

	endc
;--Shape file ----- C:\SHED\NSHAPES\op_2.txt ----
	ifne	DO_HDR

op_2
	ShapeHdr	op_2_P,0,op_2_F,0,0,0,0,3,0,15,15,60,64,id_0_c,0,0,0,0,<op_2>
	elseif
op_2_P
	PointsXb	6
	pb	-15,0,-60	;0
	pb	-15,-15,-60	;2
	pb	-15,0,0	;4
	pb	-15,-15,0	;6
	pb	-15,0,60	;8
	pb	15,-15,60	;10

	EndPoints
op_2_F
	Vizis	8
	Viz	2,6,7,0,-127,0	;0
	Viz	1,5,4,0,127,0	;1
	Viz	0,4,6,-127,0,0	;2
	Viz	3,7,5,127,0,0	;3
	Viz	10,7,6,0,-127,0	;4
	Viz	8,4,5,0,127,0	;5
	Viz	11,6,4,-127,0,0	;6
	Viz	9,5,7,127,0,0	;7

op_2_f1	Faces
	Face4	28,0,0,-127,0,2,6,7,3
	Face4	32,1,0,127,0,1,5,4,0
	Face4	30,2,-127,0,0,0,4,6,2
	Face4	30,3,127,0,0,3,7,5,1
	Face4	12,4,0,-127,0,10,7,6,11
	Face4	16,5,0,127,0,8,4,5,9
	Face4	14,6,-127,0,0,11,6,4,8
	Face4	14,7,127,0,0,9,5,7,10
	Fend
	EndShape

	endc
	


;--Shape file ----- C:\SHED\SHAPES6\ROBOT_0.ANM ----
	ifne	DO_HDR

robot_0
	ShapeHdr	robot_0_P,0,robot_0_F,0,0,0,0,2,0,20,87,20,87,id_0_c,0,0,0,0,<robot_0>
	elseif
robot_0_P
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
.A0A	Pointsb	41
	pb	5,-9,-37	;0
	pb	-5,0,-36	;1
	pb	0,-59,-15	;2
	pb	0,-69,-15	;3
	pb	28,-9,-12	;4
	pb	23,-9,-11	;5
	pb	18,-9,-10	;6
	pb	-5,-5,-7	;7
	pb	-10,-5,-7	;8
	pb	5,-10,-6	;9
	pb	10,-10,-6	;10
	pb	29,-18,-6	;11
	pb	24,-18,-5	;12
	pb	0,-78,-5	;13
	pb	-5,-24,-3	;14
	pb	-10,-24,-3	;15
	pb	30,-48,-3	;16
	pb	25,-48,-2	;17
	pb	-30,-8,0	;18
	pb	-5,-44,0	;19
	pb	-10,-44,0	;20
	pb	5,-47,0	;21
	pb	10,-47,0	;22
	pb	0,-49,0	;23
	pb	0,-73,0	;24
	pb	0,-83,0	;25
	pb	-25,-8,1	;26
	pb	-30,-48,1	;27
	pb	-20,-8,2	;28
	pb	-25,-48,2	;29
	pb	5,-27,3	;30
	pb	10,-27,3	;31
	pb	-31,-18,4	;32
	pb	-26,-18,5	;33
	pb	0,-78,10	;34
	pb	-15,-1,13	;35
	pb	15,-8,14	;36
	pb	0,-59,15	;37
	pb	0,-69,15	;38
	pb	-5,0,23	;39
	pb	5,-9,23	;40
	PointsXb	5
	pb	-30,-73,-1	;41
	pb	20,-59,0	;43
	pb	-20,-69,0	;45
	pb	-25,-73,0	;47
	pb	-13,-78,0	;49
	jump	.EB0
.A1A	Pointsb	41
	pb	5,-9,-26	;0
	pb	-5,-3,-43	;1
	pb	0,-60,-15	;2
	pb	0,-70,-15	;3
	pb	27,-12,-17	;4
	pb	22,-12,-16	;5
	pb	17,-12,-15	;6
	pb	-5,-8,-14	;7
	pb	-10,-8,-14	;8
	pb	5,-9,4	;9
	pb	10,-9,4	;10
	pb	28,-21,-10	;11
	pb	23,-21,-9	;12
	pb	0,-80,-5	;13
	pb	-5,-26,-7	;14
	pb	-10,-26,-7	;15
	pb	29,-50,-5	;16
	pb	24,-50,-4	;17
	pb	-31,-10,5	;18
	pb	-5,-45,0	;19
	pb	-10,-45,0	;20
	pb	5,-47,0	;21
	pb	10,-47,0	;22
	pb	0,-50,0	;23
	pb	0,-75,0	;24
	pb	0,-85,0	;25
	pb	-26,-10,6	;26
	pb	-31,-50,3	;27
	pb	-21,-10,7	;28
	pb	-26,-50,4	;29
	pb	5,-28,7	;30
	pb	10,-28,7	;31
	pb	-31,-21,8	;32
	pb	-27,-21,9	;33
	pb	0,-80,10	;34
	pb	-15,-1,5	;35
	pb	15,-8,23	;36
	pb	0,-60,15	;37
	pb	0,-70,15	;38
	pb	-5,0,17	;39
	pb	5,-9,33	;40
	PointsXb	5
	pb	-30,-75,-1	;41
	pb	20,-60,0	;43
	pb	-20,-70,0	;45
	pb	-25,-75,0	;47
	pb	-13,-80,0	;49
	jump	.EB0
.A2A	Pointsb	41
	pb	5,-11,-16	;0
	pb	-5,-12,-50	;1
	pb	0,-62,-15	;2
	pb	0,-72,-15	;3
	pb	26,-17,-23	;4
	pb	21,-17,-22	;5
	pb	16,-17,-21	;6
	pb	-5,-12,-20	;7
	pb	-10,-12,-20	;8
	pb	5,-11,13	;9
	pb	10,-11,13	;10
	pb	28,-25,-15	;11
	pb	23,-25,-14	;12
	pb	0,-82,-5	;13
	pb	-5,-30,-10	;14
	pb	-10,-30,-10	;15
	pb	29,-54,-7	;16
	pb	24,-54,-6	;17
	pb	-32,-14,10	;18
	pb	-5,-47,0	;19
	pb	-10,-47,0	;20
	pb	5,-48,0	;21
	pb	10,-48,0	;22
	pb	0,-52,0	;23
	pb	0,-77,0	;24
	pb	0,-87,0	;25
	pb	-27,-14,11	;26
	pb	-31,-54,5	;27
	pb	-22,-14,12	;28
	pb	-26,-54,6	;29
	pb	5,-31,10	;30
	pb	10,-31,10	;31
	pb	-32,-25,12	;32
	pb	-27,-25,13	;33
	pb	0,-82,10	;34
	pb	-15,0,-5	;35
	pb	15,-10,33	;36
	pb	0,-62,15	;37
	pb	0,-72,15	;38
	pb	-5,0,7	;39
	pb	5,-11,43	;40
	PointsXb	5
	pb	-30,-78,-1	;41
	pb	20,-62,0	;43
	pb	-20,-72,0	;45
	pb	-25,-78,0	;47
	pb	-13,-82,0	;49
	jump	.EB0
.A3A	Pointsb	41
	pb	5,-7,-17	;0
	pb	-5,-10,-46	;1
	pb	0,-60,-15	;2
	pb	0,-70,-15	;3
	pb	27,-12,-17	;4
	pb	22,-12,-16	;5
	pb	17,-12,-15	;6
	pb	-5,-10,-17	;7
	pb	-10,-10,-17	;8
	pb	5,-8,14	;9
	pb	10,-8,14	;10
	pb	28,-21,-10	;11
	pb	23,-21,-9	;12
	pb	0,-80,-5	;13
	pb	-5,-27,-7	;14
	pb	-10,-27,-7	;15
	pb	29,-50,-5	;16
	pb	24,-50,-4	;17
	pb	-32,-10,13	;18
	pb	-5,-46,0	;19
	pb	-10,-46,0	;20
	pb	5,-45,0	;21
	pb	10,-45,0	;22
	pb	0,-50,0	;23
	pb	0,-75,0	;24
	pb	0,-85,0	;25
	pb	-27,-10,14	;26
	pb	-31,-50,3	;27
	pb	-22,-10,15	;28
	pb	-26,-50,4	;29
	pb	5,-26,7	;30
	pb	10,-26,7	;31
	pb	-32,-22,11	;32
	pb	-27,-22,12	;33
	pb	0,-80,10	;34
	pb	-15,-3,2	;35
	pb	15,-8,33	;36
	pb	0,-60,15	;37
	pb	0,-70,15	;38
	pb	-5,0,12	;39
	pb	5,-8,43	;40
	PointsXb	5
	pb	-30,-75,-1	;41
	pb	20,-60,0	;43
	pb	-20,-70,0	;45
	pb	-25,-75,0	;47
	pb	-13,-80,0	;49
	jump	.EB0
.A4A	Pointsb	41
	pb	5,-1,-23	;0
	pb	-5,0,-42	;1
	pb	0,-55,-15	;2
	pb	0,-65,-15	;3
	pb	28,-6,-12	;4
	pb	23,-6,-11	;5
	pb	18,-6,-10	;6
	pb	-5,-6,-13	;7
	pb	-10,-6,-13	;8
	pb	5,-1,7	;9
	pb	10,-1,7	;10
	pb	29,-15,-6	;11
	pb	24,-15,-5	;12
	pb	0,-75,-5	;13
	pb	-5,-22,-3	;14
	pb	-10,-22,-3	;15
	pb	30,-45,-3	;16
	pb	25,-45,-2	;17
	pb	-30,-5,0	;18
	pb	-5,-42,0	;19
	pb	-10,-42,0	;20
	pb	5,-40,0	;21
	pb	10,-40,0	;22
	pb	0,-45,0	;23
	pb	0,-70,0	;24
	pb	0,-80,0	;25
	pb	-25,-5,1	;26
	pb	-30,-45,1	;27
	pb	-20,-5,2	;28
	pb	-25,-45,2	;29
	pb	5,-20,3	;30
	pb	10,-20,3	;31
	pb	-31,-15,4	;32
	pb	-26,-15,5	;33
	pb	0,-75,10	;34
	pb	-15,-1,7	;35
	pb	15,-1,27	;36
	pb	0,-55,15	;37
	pb	0,-65,15	;38
	pb	-5,0,17	;39
	pb	5,-1,36	;40
	PointsXb	5
	pb	-30,-70,-1	;41
	pb	20,-55,0	;43
	pb	-20,-65,0	;45
	pb	-25,-70,0	;47
	pb	-13,-75,0	;49
	jump	.EB0
.A5A	Pointsb	41
	pb	5,0,-30	;0
	pb	-5,-8,-40	;1
	pb	0,-57,-15	;2
	pb	0,-67,-15	;3
	pb	29,-5,-6	;4
	pb	24,-5,-5	;5
	pb	19,-5,-4	;6
	pb	-5,-8,-10	;7
	pb	-10,-8,-10	;8
	pb	5,-2,0	;9
	pb	10,-2,0	;10
	pb	30,-15,-1	;11
	pb	25,-15,0	;12
	pb	0,-75,-5	;13
	pb	-5,-25,0	;14
	pb	-10,-25,0	;15
	pb	30,-45,-1	;16
	pb	25,-45,0	;17
	pb	-29,-5,-6	;18
	pb	-5,-45,0	;19
	pb	-10,-45,0	;20
	pb	5,-42,0	;21
	pb	10,-42,0	;22
	pb	0,-47,0	;23
	pb	0,-70,0	;24
	pb	0,-80,0	;25
	pb	-24,-5,-5	;26
	pb	-30,-45,-1	;27
	pb	-19,-5,-4	;28
	pb	-25,-45,0	;29
	pb	5,-22,0	;30
	pb	10,-22,0	;31
	pb	-30,-15,-1	;32
	pb	-25,-15,0	;33
	pb	0,-75,10	;34
	pb	-15,-8,10	;35
	pb	15,0,20	;36
	pb	0,-57,15	;37
	pb	0,-67,15	;38
	pb	-5,-8,20	;39
	pb	5,0,30	;40
	PointsXb	5
	pb	-30,-70,-1	;41
	pb	20,-57,0	;43
	pb	-20,-67,0	;45
	pb	-25,-70,0	;47
	pb	-13,-75,0	;49
	jump	.EB0
.A6A	Pointsb	41
	pb	5,0,-36	;0
	pb	-5,-8,-33	;1
	pb	0,-59,-15	;2
	pb	0,-69,-15	;3
	pb	30,-8,0	;4
	pb	25,-8,1	;5
	pb	20,-8,2	;6
	pb	-5,-9,-3	;7
	pb	-10,-9,-3	;8
	pb	5,-5,-7	;9
	pb	10,-5,-7	;10
	pb	31,-18,4	;11
	pb	26,-18,5	;12
	pb	0,-78,-5	;13
	pb	-5,-27,3	;14
	pb	-10,-27,3	;15
	pb	30,-48,1	;16
	pb	25,-48,2	;17
	pb	-28,-9,-12	;18
	pb	-5,-47,0	;19
	pb	-10,-47,0	;20
	pb	5,-44,0	;21
	pb	10,-44,0	;22
	pb	0,-49,0	;23
	pb	0,-73,0	;24
	pb	0,-83,0	;25
	pb	-23,-9,-11	;26
	pb	-30,-48,-3	;27
	pb	-18,-9,-10	;28
	pb	-25,-48,-2	;29
	pb	5,-24,-3	;30
	pb	10,-24,-3	;31
	pb	-29,-18,-6	;32
	pb	-24,-18,-5	;33
	pb	0,-78,10	;34
	pb	-15,-8,18	;35
	pb	15,-1,13	;36
	pb	0,-59,15	;37
	pb	0,-69,15	;38
	pb	-5,-9,27	;39
	pb	5,0,23	;40
	PointsXb	5
	pb	-30,-73,-1	;41
	pb	20,-59,0	;43
	pb	-20,-69,0	;45
	pb	-25,-73,0	;47
	pb	-13,-78,0	;49
	jump	.EB0
.A7A	Pointsb	41
	pb	5,-4,-43	;0
	pb	-5,-10,-26	;1
	pb	0,-61,-15	;2
	pb	0,-71,-15	;3
	pb	31,-11,5	;4
	pb	26,-11,6	;5
	pb	21,-11,7	;6
	pb	-5,-10,4	;7
	pb	-10,-10,4	;8
	pb	5,-9,-14	;9
	pb	10,-9,-14	;10
	pb	31,-22,8	;11
	pb	27,-22,9	;12
	pb	0,-81,-5	;13
	pb	-5,-29,7	;14
	pb	-10,-29,7	;15
	pb	31,-51,3	;16
	pb	26,-51,4	;17
	pb	-27,-13,-17	;18
	pb	-5,-48,0	;19
	pb	-10,-48,0	;20
	pb	5,-46,0	;21
	pb	10,-46,0	;22
	pb	0,-51,0	;23
	pb	0,-76,0	;24
	pb	0,-86,0	;25
	pb	-22,-13,-16	;26
	pb	-29,-51,-5	;27
	pb	-17,-13,-15	;28
	pb	-24,-51,-4	;29
	pb	5,-27,-7	;30
	pb	10,-27,-7	;31
	pb	-28,-22,-10	;32
	pb	-23,-22,-9	;33
	pb	0,-81,10	;34
	pb	-15,-9,23	;35
	pb	15,0,5	;36
	pb	0,-61,15	;37
	pb	0,-71,15	;38
	pb	-5,-10,33	;39
	pb	5,0,16	;40
	PointsXb	5
	pb	-30,-76,-1	;41
	pb	20,-61,0	;43
	pb	-20,-71,0	;45
	pb	-25,-76,0	;47
	pb	-13,-81,0	;49
	jump	.EB0
.A8A	Pointsb	41
	pb	5,-9,-50	;0
	pb	-5,-8,-16	;1
	pb	0,-59,-15	;2
	pb	0,-69,-15	;3
	pb	32,-11,11	;4
	pb	27,-11,12	;5
	pb	22,-11,13	;6
	pb	-5,-8,13	;7
	pb	-10,-8,13	;8
	pb	5,-9,-20	;9
	pb	10,-9,-20	;10
	pb	32,-22,13	;11
	pb	27,-22,14	;12
	pb	0,-79,-5	;13
	pb	-5,-28,10	;14
	pb	-10,-28,10	;15
	pb	31,-51,5	;16
	pb	26,-51,6	;17
	pb	-26,-14,-23	;18
	pb	-5,-45,0	;19
	pb	-10,-45,0	;20
	pb	5,-44,0	;21
	pb	10,-44,0	;22
	pb	0,-49,0	;23
	pb	0,-74,0	;24
	pb	0,-84,0	;25
	pb	-21,-14,-22	;26
	pb	-29,-51,-7	;27
	pb	-16,-14,-21	;28
	pb	-24,-51,-6	;29
	pb	5,-27,-10	;30
	pb	10,-27,-10	;31
	pb	-28,-22,-15	;32
	pb	-23,-22,-14	;33
	pb	0,-79,10	;34
	pb	-15,-8,33	;35
	pb	15,0,-3	;36
	pb	0,-59,15	;37
	pb	0,-69,15	;38
	pb	-5,-8,43	;39
	pb	5,0,8	;40
	PointsXb	5
	pb	-30,-75,-1	;41
	pb	20,-59,0	;43
	pb	-20,-69,0	;45
	pb	-25,-75,0	;47
	pb	-13,-79,0	;49
	jump	.EB0
.A9A	Pointsb	41
	pb	5,-7,-47	;0
	pb	-5,-10,-16	;1
	pb	0,-57,-15	;2
	pb	0,-67,-15	;3
	pb	31,-7,5	;4
	pb	26,-7,6	;5
	pb	21,-7,7	;6
	pb	-5,-5,14	;7
	pb	-10,-5,14	;8
	pb	5,-7,-17	;9
	pb	10,-7,-17	;10
	pb	31,-18,8	;11
	pb	27,-18,9	;12
	pb	0,-77,-5	;13
	pb	-5,-23,7	;14
	pb	-10,-23,7	;15
	pb	31,-47,3	;16
	pb	26,-47,4	;17
	pb	-26,-13,-24	;18
	pb	-5,-42,0	;19
	pb	-10,-42,0	;20
	pb	5,-43,0	;21
	pb	10,-43,0	;22
	pb	0,-47,0	;23
	pb	0,-72,0	;24
	pb	0,-82,0	;25
	pb	-21,-13,-24	;26
	pb	-29,-47,-6	;27
	pb	-16,-13,-23	;28
	pb	-24,-47,-5	;29
	pb	5,-24,-7	;30
	pb	10,-24,-7	;31
	pb	-27,-19,-16	;32
	pb	-22,-19,-15	;33
	pb	0,-77,10	;34
	pb	-15,-1,33	;35
	pb	15,-4,3	;36
	pb	0,-57,15	;37
	pb	0,-67,15	;38
	pb	-5,0,43	;39
	pb	5,-2,13	;40
	PointsXb	5
	pb	-30,-72,-1	;41
	pb	20,-57,0	;43
	pb	-20,-67,0	;45
	pb	-25,-72,0	;47
	pb	-13,-77,0	;49
	jump	.EB0
.A10A	Pointsb	41
	pb	5,-4,-42	;0
	pb	-5,0,-24	;1
	pb	0,-55,-15	;2
	pb	0,-65,-15	;3
	pb	30,-5,0	;4
	pb	25,-5,1	;5
	pb	20,-5,2	;6
	pb	-5,-1,7	;7
	pb	-10,-1,7	;8
	pb	5,-5,-13	;9
	pb	10,-5,-13	;10
	pb	31,-15,4	;11
	pb	26,-15,5	;12
	pb	0,-75,-5	;13
	pb	-5,-20,3	;14
	pb	-10,-20,3	;15
	pb	30,-45,1	;16
	pb	25,-45,2	;17
	pb	-28,-7,-13	;18
	pb	-5,-40,0	;19
	pb	-10,-40,0	;20
	pb	5,-41,0	;21
	pb	10,-41,0	;22
	pb	0,-45,0	;23
	pb	0,-70,0	;24
	pb	0,-80,0	;25
	pb	-23,-7,-12	;26
	pb	-30,-45,-3	;27
	pb	-18,-7,-11	;28
	pb	-25,-45,-2	;29
	pb	5,-21,-3	;30
	pb	10,-21,-3	;31
	pb	-29,-15,-6	;32
	pb	-24,-15,-5	;33
	pb	0,-75,10	;34
	pb	-15,-1,27	;35
	pb	15,0,7	;36
	pb	0,-55,15	;37
	pb	0,-65,15	;38
	pb	-5,-1,36	;39
	pb	5,1,17	;40
	PointsXb	5
	pb	-30,-70,-1	;41
	pb	20,-55,0	;43
	pb	-20,-65,0	;45
	pb	-25,-70,0	;47
	pb	-13,-75,0	;49
	jump	.EB0
.A11A	Pointsb	41
	pb	5,-8,-40	;0
	pb	-5,0,-30	;1
	pb	0,-57,-15	;2
	pb	0,-67,-15	;3
	pb	29,-5,-6	;4
	pb	24,-5,-5	;5
	pb	19,-5,-4	;6
	pb	-5,-2,0	;7
	pb	-10,-2,0	;8
	pb	5,-8,-10	;9
	pb	10,-8,-10	;10
	pb	30,-15,-1	;11
	pb	25,-15,0	;12
	pb	0,-75,-5	;13
	pb	-5,-22,0	;14
	pb	-10,-22,0	;15
	pb	30,-45,-1	;16
	pb	25,-45,0	;17
	pb	-29,-5,-6	;18
	pb	-5,-42,0	;19
	pb	-10,-42,0	;20
	pb	5,-45,0	;21
	pb	10,-45,0	;22
	pb	0,-47,0	;23
	pb	0,-70,0	;24
	pb	0,-80,0	;25
	pb	-24,-5,-5	;26
	pb	-30,-45,-1	;27
	pb	-19,-5,-4	;28
	pb	-25,-45,0	;29
	pb	5,-25,0	;30
	pb	10,-25,0	;31
	pb	-30,-15,-1	;32
	pb	-25,-15,0	;33
	pb	0,-75,10	;34
	pb	-15,0,20	;35
	pb	15,-8,10	;36
	pb	0,-57,15	;37
	pb	0,-67,15	;38
	pb	-5,0,30	;39
	pb	5,-8,20	;40
	PointsXb	5
	pb	-30,-70,-1	;41
	pb	20,-57,0	;43
	pb	-20,-67,0	;45
	pb	-25,-70,0	;47
	pb	-13,-75,0	;49
.EB0

	EndPoints
robot_0_F
	Vizis	38
	Viz	11,12,5,21,71,-103	;1
	Viz	4,5,12,-21,-71,103	;2
	Viz	18,26,33,-23,48,-115	;4
	Viz	32,33,26,23,-48,115	;5
	Viz	12,11,16,25,13,-124	;13
	Viz	17,16,11,-25,-13,124	;14
	Viz	17,16,42,25,10,-124	;15
	Viz	48,42,16,-25,-10,124	;16
	Viz	29,27,32,-25,-13,-124	;17
	Viz	33,32,27,25,13,124	;18
	Viz	47,41,27,-25,-10,-124	;20
	Viz	29,27,41,25,10,124	;21
	Viz	24,50,13,-33,-87,-87	;22
	Viz	13,50,25,-33,87,-87	;23
	Viz	34,50,24,-41,-107,54	;24
	Viz	25,50,34,-41,107,54	;25
	Viz	13,49,24,33,-87,-87	;26
	Viz	25,49,13,33,87,-87	;27
	Viz	43,2,23,-49,-98,-65	;28
	Viz	23,2,44,49,-98,-65	;29
	Viz	44,37,23,49,-98,65	;30
	Viz	23,37,43,-49,-98,65	;31
	Viz	46,43,37,-76,0,102	;32
	Viz	38,37,44,76,0,102	;33
	Viz	3,2,43,-76,0,-102	;34
	Viz	24,49,34,41,-107,54	;36
	Viz	34,49,25,41,107,54	;37
	Viz	14,15,8,0,26,-124	;38
	Viz	45,44,2,76,0,-102	;39
	Viz	7,8,15,0,-26,124	;40
	Viz	19,20,15,0,19,-126	;42
	Viz	14,15,20,0,-19,126	;43
	Viz	9,10,31,0,59,-112	;45
	Viz	30,31,10,0,-59,112	;46
	Viz	43,2,44,0,-127,0	;47
	Viz	30,31,22,0,-19,-126	;48
	Viz	21,22,31,0,19,126	;49
	Viz	46,38,45,0,127,0	;50
	BSPInit	robot_0_EBSP
	BSP	0,robot_0_f1,.bsp2
	BSPE	robot_0_f3
.bsp2	BSP	22,robot_0_f4,.bsp5
	BSP	23,robot_0_f6,.bsp7
	BSP	14,robot_0_f8,.bsp9
	BSPE	robot_0_f10
.bsp9	BSP	18,robot_0_f11,.bsp12
	BSP	25,robot_0_f13,.bsp14
	BSPE	robot_0_f15
.bsp14	BSPE	robot_0_f16
.bsp12	BSP	27,robot_0_f17,.bsp18
	BSPEND
.bsp18	BSP	29,robot_0_f19,.bsp20
	BSPE	robot_0_f21
.bsp20	BSP	30,robot_0_f22,.bsp23
	BSPEND
.bsp23	BSP	31,robot_0_f24,.bsp25
	BSPEND
.bsp25	BSPE	robot_0_f26
.bsp7	BSPE	robot_0_f27
.bsp5	BSP	4,robot_0_f28,.bsp29
	BSPEND
.bsp29	BSP	6,robot_0_f30,.bsp31
	BSPEND
.bsp31	BSPE	robot_0_f32

robot_0_f1	Faces
	Face4	18,0,21,71,-103,11,12,5,4
	FendQ
robot_0_f3	Faces
	Face2	16,-1,0,0,0,8,35
	Face2	18,-1,0,0,0,7,39
	Face2	18,-1,0,0,0,36,10
	Face2	16,-1,0,0,0,40,9
	FendQ
robot_0_f4	Faces
	Face4	20,22,-76,0,102,46,43,37,38
	FendQ
robot_0_f6	Faces
	Face4	16,23,76,0,102,38,37,44,45
	FendQ
robot_0_f8	Faces
	Face3	16,14,-41,-107,54,34,50,24
	FendQ
robot_0_f10	Faces
	Face3	23,17,33,87,-87,25,49,13
	Face3	25,26,41,107,54,34,49,25
	FendQ
robot_0_f11	Faces
	Face3	14,18,-49,-98,-65,43,2,23
	FendQ
robot_0_f13	Faces
	Face3	14,25,41,-107,54,24,49,34
	FendQ
robot_0_f15	Faces
	Face3	25,13,-33,87,-87,13,50,25
	Face3	27,15,-41,107,54,25,50,34
	FendQ
robot_0_f16	Faces
	Face4	18,37,0,127,0,46,38,45,3
	Face3	14,12,-33,-87,-87,24,50,13
	Face3	12,16,33,-87,-87,13,49,24
	Face2	44,-1,0,0,0,34,25
	Face4	14,28,76,0,-102,45,44,2,3
	Face4	0,34,0,-127,0,43,2,44,37
	FendQ
robot_0_f17	Faces
	Face4	12,27,0,26,-124,14,15,8,7
	FendQ
robot_0_f19	Faces
	Face4	14,29,0,-26,124,7,8,15,14
	FendQ
robot_0_f21	Faces
	Face3	12,19,49,-98,-65,23,2,44
	Face4	16,24,-76,0,-102,3,2,43,46
	Face2	12,-1,0,0,0,1,7
	Face2	12,-1,0,0,0,9,0
	FendQ
robot_0_f22	Faces
	Face4	14,30,0,19,-126,19,20,15,14
	FendQ
robot_0_f24	Faces
	Face4	16,31,0,-19,126,14,15,20,19
	FendQ
robot_0_f26	Faces
	Face4	12,32,0,59,-112,9,10,31,30
	Face4	14,35,0,-19,-126,30,31,22,21
	Face2	16,-1,0,0,0,12,6
	Face2	23,-1,0,0,0,19,23
	Face2	23,-1,0,0,0,23,21
	Face4	14,33,0,-59,112,30,31,10,9
	Face4	16,36,0,19,126,21,22,31,30
	FendQ
robot_0_f27	Faces
	Face4	18,2,-23,48,-115,18,26,33,32
	Face4	14,8,-25,-13,-124,29,27,32,33
	Face4	16,9,25,13,124,33,32,27,29
	Face4	16,10,-25,-10,-124,47,41,27,29
	Face4	18,11,25,10,124,29,27,41,47
	Face3	14,20,49,-98,65,44,37,23
	Face2	16,-1,0,0,0,28,33
	Face2	25,-1,0,0,0,47,45
	Face4	14,3,23,-48,115,32,33,26,18
	FendQ
robot_0_f28	Faces
	Face4	14,4,25,13,-124,12,11,16,17
	FendQ
robot_0_f30	Faces
	Face4	16,6,25,10,-124,17,16,42,48
	FendQ
robot_0_f32	Faces
	Face2	25,-1,0,0,0,46,48
	Face4	18,7,-25,-10,124,48,42,16,17
	Face3	16,21,-49,-98,65,23,37,43
	Face4	16,5,-25,-13,124,17,16,11,12
	Face4	14,1,-21,-71,103,4,5,12,11
	FendQ
robot_0_EBSP
	EndShape

	endc

 


;--Shape file ----- C:\SHED\NSHAPES\meteo_0.anm ----
	ifne	DO_HDR

meteo_0
	ShapeHdr	meteo_0_P,0,meteo_0_F,0,0,0,0,1,0,91,32,94,96,id_0_c,0,0,0,0,<meteo_0>
	elseif
meteo_0_P
	PointsXb	2
	pb	-32,32,0	;0
	pb	32,-32,0	;2
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
.A0A	Pointsb	20
	pb	0,0,-41	;4
	pb	0,0,-41	;5
	pb	0,0,-41	;6
	pb	0,0,-41	;7
	pb	0,0,-41	;8
	pb	0,0,-41	;9
	pb	0,0,-41	;10
	pb	0,0,-41	;11
	pb	0,0,-41	;12
	pb	0,0,-41	;13
	pb	0,0,-41	;14
	pb	0,0,-41	;15
	pb	0,0,-41	;16
	pb	0,0,-41	;17
	pb	0,0,-41	;18
	pb	0,0,-41	;19
	pb	0,0,-41	;20
	pb	0,0,-41	;21
	pb	0,0,-41	;22
	pb	0,0,-41	;23
	jump	.EB0
.A1A	Pointsb	20
	pb	37,0,-59	;4
	pb	67,0,-59	;5
	pb	47,10,-53	;6
	pb	56,10,-53	;7
	pb	56,-10,-53	;8
	pb	47,-10,-53	;9
	pb	47,15,-49	;10
	pb	56,15,-49	;11
	pb	47,-15,-49	;12
	pb	56,-15,-49	;13
	pb	35,0,-46	;14
	pb	68,0,-46	;15
	pb	56,5,-34	;16
	pb	47,5,-34	;17
	pb	47,-5,-34	;18
	pb	56,-5,-34	;19
	pb	47,5,-34	;20
	pb	56,5,-34	;21
	pb	56,-5,-34	;22
	pb	47,-5,-34	;23
	jump	.EB0
.A2A	Pointsb	20
	pb	50,0,-47	;4
	pb	80,0,-47	;5
	pb	60,10,-41	;6
	pb	69,10,-41	;7
	pb	69,-10,-41	;8
	pb	60,-10,-41	;9
	pb	60,15,-37	;10
	pb	69,15,-37	;11
	pb	60,-15,-37	;12
	pb	69,-15,-37	;13
	pb	48,0,-34	;14
	pb	81,0,-34	;15
	pb	69,5,-22	;16
	pb	60,5,-22	;17
	pb	60,-5,-22	;18
	pb	69,-5,-22	;19
	pb	60,5,-22	;20
	pb	69,5,-22	;21
	pb	69,-5,-22	;22
	pb	60,-5,-22	;23
	jump	.EB0
.A3A	Pointsb	20
	pb	60,0,-10	;4
	pb	90,0,-10	;5
	pb	70,10,-3	;6
	pb	80,10,-3	;7
	pb	80,-10,-3	;8
	pb	70,-10,-3	;9
	pb	70,15,0	;10
	pb	80,15,0	;11
	pb	70,-15,0	;12
	pb	80,-15,0	;13
	pb	59,0,4	;14
	pb	91,0,4	;15
	pb	80,5,15	;16
	pb	70,5,15	;17
	pb	70,-5,15	;18
	pb	80,-5,15	;19
	pb	70,5,15	;20
	pb	80,5,15	;21
	pb	80,-5,15	;22
	pb	70,-5,15	;23
	jump	.EB0
.A4A	Pointsb	20
	pb	50,0,28	;4
	pb	80,0,28	;5
	pb	60,10,35	;6
	pb	70,10,35	;7
	pb	70,-10,35	;8
	pb	60,-10,35	;9
	pb	60,15,38	;10
	pb	70,15,38	;11
	pb	60,-15,38	;12
	pb	70,-15,38	;13
	pb	49,0,41	;14
	pb	81,0,42	;15
	pb	70,5,52	;16
	pb	60,5,52	;17
	pb	60,-5,52	;18
	pb	70,-5,52	;19
	pb	60,5,52	;20
	pb	70,5,52	;21
	pb	70,-5,52	;22
	pb	60,-5,52	;23
	jump	.EB0
.A5A	Pointsb	20
	pb	22,0,55	;4
	pb	52,0,55	;5
	pb	32,10,61	;6
	pb	42,10,61	;7
	pb	42,-10,61	;8
	pb	32,-10,61	;9
	pb	32,15,65	;10
	pb	42,15,65	;11
	pb	32,-15,65	;12
	pb	42,-15,65	;13
	pb	21,0,68	;14
	pb	53,0,68	;15
	pb	42,5,80	;16
	pb	32,5,80	;17
	pb	32,-5,80	;18
	pb	42,-5,80	;19
	pb	32,5,80	;20
	pb	42,5,80	;21
	pb	42,-5,80	;22
	pb	32,-5,80	;23
	jump	.EB0
.A6A	Pointsb	20
	pb	-15,0,65	;4
	pb	15,0,65	;5
	pb	-5,10,73	;6
	pb	5,10,73	;7
	pb	5,-10,73	;8
	pb	-5,-10,73	;9
	pb	-5,15,76	;10
	pb	5,15,76	;11
	pb	-5,-15,76	;12
	pb	5,-15,76	;13
	pb	-19,0,79	;14
	pb	19,0,79	;15
	pb	5,5,90	;16
	pb	-5,5,90	;17
	pb	-5,-5,90	;18
	pb	5,-5,90	;19
	pb	-5,11,94	;20
	pb	5,11,94	;21
	pb	5,-11,94	;22
	pb	-5,-11,94	;23
	jump	.EB0
.A7A	Pointsb	20
	pb	-15,0,65	;4
	pb	15,0,65	;5
	pb	-5,10,73	;6
	pb	5,10,73	;7
	pb	5,-10,73	;8
	pb	-5,-10,73	;9
	pb	-5,15,76	;10
	pb	5,15,76	;11
	pb	-5,-15,76	;12
	pb	5,-15,76	;13
	pb	-21,0,78	;14
	pb	21,0,78	;15
	pb	5,5,90	;16
	pb	-5,5,90	;17
	pb	-5,-5,90	;18
	pb	5,-5,90	;19
	pb	-5,19,94	;20
	pb	5,19,94	;21
	pb	5,-19,94	;22
	pb	-5,-19,94	;23
	jump	.EB0
.A8A	Pointsb	20
	pb	-15,0,65	;4
	pb	15,0,65	;5
	pb	-5,10,73	;6
	pb	5,10,73	;7
	pb	5,-10,73	;8
	pb	-5,-10,73	;9
	pb	-5,15,76	;10
	pb	5,15,76	;11
	pb	-5,-15,76	;12
	pb	5,-15,76	;13
	pb	-25,0,75	;14
	pb	25,0,75	;15
	pb	5,5,90	;16
	pb	-5,5,90	;17
	pb	-5,-5,90	;18
	pb	5,-5,90	;19
	pb	-5,25,90	;20
	pb	5,25,90	;21
	pb	5,-25,90	;22
	pb	-5,-25,90	;23
	jump	.EB0
.A9A	Pointsb	20
	pb	-15,0,65	;4
	pb	15,0,65	;5
	pb	-5,10,73	;6
	pb	5,10,73	;7
	pb	5,-10,73	;8
	pb	-5,-10,73	;9
	pb	-5,15,76	;10
	pb	5,15,76	;11
	pb	-5,-15,75	;12
	pb	5,-15,75	;13
	pb	-25,0,75	;14
	pb	25,0,75	;15
	pb	5,5,90	;16
	pb	-5,5,90	;17
	pb	-5,-5,90	;18
	pb	5,-5,90	;19
	pb	-5,31,83	;20
	pb	5,31,83	;21
	pb	5,-31,83	;22
	pb	-5,-31,83	;23
.EB0

	EndPoints
meteo_0_F
	Vizis	20
	Viz	10,11,21,0,124,-28	;0
	Viz	20,21,11,0,-124,28	;1
	Viz	23,22,13,0,-124,-28	;2
	Viz	12,13,22,0,124,28	;3
	Viz	11,16,5,-112,-49,35	;6
	Viz	5,16,19,-118,0,47	;7
	Viz	5,19,13,-112,49,35	;8
	Viz	4,17,10,112,-49,35	;9
	Viz	18,17,4,118,0,47	;10
	Viz	12,18,4,112,49,35	;11
	Viz	16,17,18,0,0,127	;12
	Viz	16,11,7,127,0,0	;13
	Viz	6,10,17,-127,0,0	;14
	Viz	17,16,7,0,-122,36	;15
	Viz	11,10,6,0,65,109	;16
	Viz	8,9,12,0,-65,109	;17
	Viz	9,8,19,0,122,36	;18
	Viz	8,13,19,127,0,0	;19
	Viz	18,12,9,-127,0,0	;20
	Viz	1,0,3,0,0,127	;21
	BSPInit	meteo_0_EBSP
	BSP	5,meteo_0_f1,.bsp2
	BSP	8,meteo_0_f3,.bsp4
	BSP	13,meteo_0_f5,.bsp6
	BSP	15,meteo_0_f7,.bsp8
	BSPE	meteo_0_f9
.bsp8	BSPE	meteo_0_f10
.bsp6	BSPE	meteo_0_f11
.bsp4	BSPE	meteo_0_f12
.bsp2	BSP	11,meteo_0_f13,.bsp14
	BSPE	meteo_0_f15
.bsp14	BSPE	meteo_0_f16

meteo_0_f1	Faces
	Face3	25,5,-118,0,47,5,16,19
	FendQ
meteo_0_f3	Faces
	Face3	23,8,118,0,47,18,17,4
	FendQ
meteo_0_f5	Faces
	Face4	10,13,0,-122,36,17,16,7,6
	FendQ
meteo_0_f7	Faces
	Face4	44,15,0,-65,109,8,9,12,13
	FendQ
meteo_0_f9	Faces
	Face4	48,19,0,0,127,1,0,3,2
	FendQ
meteo_0_f10	Faces
	Face4	10,16,0,122,36,9,8,19,18
	Face4	21,2,0,-124,-28,23,22,13,12
	Face4	20,3,0,124,28,12,13,22,23
	FendQ
meteo_0_f11	Faces
	Face4	44,14,0,65,109,11,10,6,7
	Face4	25,0,0,124,-28,10,11,21,20
	Face4	14,1,0,-124,28,20,21,11,10
	FendQ
meteo_0_f12	Faces
	Face3	21,7,112,-49,35,4,17,10
	Face3	25,9,112,49,35,12,18,4
	Face2	43,-1,0,0,0,4,14
	Face3	12,12,-127,0,0,6,10,17
	Face3	12,18,-127,0,0,18,12,9
	FendQ
meteo_0_f13	Faces
	Face3	12,11,127,0,0,16,11,7
	FendQ
meteo_0_f15	Faces
	Face2	43,-1,0,0,0,15,5
	FendQ
meteo_0_f16	Faces
	Face3	12,17,127,0,0,8,13,19
	Face3	23,4,-112,-49,35,11,16,5
	Face3	27,6,-112,49,35,5,19,13
	Face4	18,10,0,0,127,16,17,18,19	
	FendQ
meteo_0_EBSP
	EndShape

	endc

	ifeq	1
;--Shape file ----- C:\SHED\NSHAPES\METEO_0.ANM ----
	ifne	DO_HDR

METEO_0
	ShapeHdr	METEO_0_P,0,METEO_0_F,0,0,0,0,1,0,91,32,89,93,id_0_c,0,0,0,0,<METEO_0>
	elseif
METEO_0_P
	PointsXb	2
	pb	-32,32,0	;0
	pb	32,-32,0	;2
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
.A0A	Pointsb	16
	pb	5,5,-36	;4
	pb	-5,5,-36	;5
	pb	-5,-5,-36	;6
	pb	5,-5,-36	;7
	pb	-16,0,-30	;8
	pb	16,0,-30	;9
	pb	-5,15,-26	;10
	pb	5,15,-26	;11
	pb	3,10,-26	;12
	pb	-3,10,-26	;13
	pb	-3,-10,-26	;14
	pb	3,-10,-26	;15
	pb	-5,-15,-26	;16
	pb	5,-15,-26	;17
	pb	-15,0,-16	;18
	pb	15,0,-16	;19
	jump	.EB0
.A1A	Pointsb	16
	pb	42,-5,-55	;4
	pb	33,-5,-55	;5
	pb	33,5,-55	;6
	pb	42,5,-55	;7
	pb	22,0,-61	;8
	pb	53,0,-60	;9
	pb	33,-15,-65	;10
	pb	42,-15,-64	;11
	pb	41,-10,-64	;12
	pb	34,-10,-65	;13
	pb	34,10,-65	;14
	pb	41,10,-64	;15
	pb	33,15,-65	;16
	pb	42,15,-64	;17
	pb	22,0,-75	;18
	pb	52,0,-75	;19
	jump	.EB0
.A2A	Pointsb	16
	pb	69,-5,-27	;4
	pb	60,-5,-28	;5
	pb	60,5,-28	;6
	pb	69,5,-27	;7
	pb	48,0,-34	;8
	pb	81,0,-34	;9
	pb	60,-15,-38	;10
	pb	69,-15,-37	;11
	pb	68,-10,-38	;12
	pb	61,-10,-37	;13
	pb	61,10,-37	;14
	pb	68,10,-38	;15
	pb	60,15,-38	;16
	pb	69,15,-37	;17
	pb	50,0,-47	;18
	pb	80,0,-47	;19
	jump	.EB0
.A3A	Pointsb	16
	pb	80,-5,10	;4
	pb	70,-5,10	;5
	pb	70,5,10	;6
	pb	80,5,10	;7
	pb	59,0,4	;8
	pb	91,0,4	;9
	pb	70,-15,0	;10
	pb	80,-15,0	;11
	pb	78,-10,0	;12
	pb	72,-10,0	;13
	pb	72,10,0	;14
	pb	78,10,0	;15
	pb	70,15,0	;16
	pb	80,15,0	;17
	pb	60,0,-10	;18
	pb	90,0,-10	;19
	jump	.EB0
.A4A	Pointsb	16
	pb	70,-5,47	;4
	pb	60,-5,47	;5
	pb	60,5,47	;6
	pb	70,5,47	;7
	pb	49,0,41	;8
	pb	81,0,42	;9
	pb	60,-15,37	;10
	pb	69,-15,38	;11
	pb	68,-10,38	;12
	pb	62,-10,37	;13
	pb	62,10,37	;14
	pb	68,10,38	;15
	pb	60,15,37	;16
	pb	69,15,38	;17
	pb	50,0,28	;18
	pb	80,0,28	;19
	jump	.EB0
.A5A	Pointsb	16
	pb	42,-5,75	;4
	pb	32,-5,74	;5
	pb	32,5,74	;6
	pb	42,5,75	;7
	pb	21,0,68	;8
	pb	53,0,68	;9
	pb	32,-15,64	;10
	pb	42,-15,64	;11
	pb	40,-10,64	;12
	pb	34,-10,65	;13
	pb	34,10,65	;14
	pb	40,10,64	;15
	pb	32,15,64	;16
	pb	42,15,64	;17
	pb	22,0,55	;18
	pb	52,0,55	;19
	jump	.EB0
.A6A	Pointsb	16
	pb	5,-11,89	;4
	pb	-5,-11,89	;5
	pb	-5,11,89	;6
	pb	5,11,89	;7
	pb	-19,0,79	;8
	pb	19,0,79	;9
	pb	-5,-15,75	;10
	pb	5,-15,75	;11
	pb	3,-10,75	;12
	pb	-3,-10,75	;13
	pb	-3,10,75	;14
	pb	3,10,75	;15
	pb	-5,15,75	;16
	pb	5,15,75	;17
	pb	-15,0,65	;18
	pb	15,0,65	;19
	jump	.EB0
.A7A	Pointsb	16
	pb	5,-19,89	;4
	pb	-5,-19,89	;5
	pb	-5,19,89	;6
	pb	5,19,89	;7
	pb	-21,0,78	;8
	pb	21,0,78	;9
	pb	-5,-15,75	;10
	pb	5,-15,75	;11
	pb	3,-10,75	;12
	pb	-3,-10,75	;13
	pb	-3,10,75	;14
	pb	3,10,75	;15
	pb	-5,15,75	;16
	pb	5,15,75	;17
	pb	-15,0,65	;18
	pb	15,0,65	;19
	jump	.EB0
.A8A	Pointsb	16
	pb	5,-25,85	;4
	pb	-5,-25,85	;5
	pb	-5,25,85	;6
	pb	5,25,85	;7
	pb	-25,0,75	;8
	pb	25,0,75	;9
	pb	-5,-15,75	;10
	pb	5,-15,75	;11
	pb	3,-10,75	;12
	pb	-3,-10,75	;13
	pb	-3,10,75	;14
	pb	3,10,75	;15
	pb	-5,15,75	;16
	pb	5,15,75	;17
	pb	-15,0,65	;18
	pb	15,0,65	;19
	jump	.EB0
.A9A	Pointsb	16
	pb	5,-25,-65	;4
	pb	-5,-25,-65	;5
	pb	-5,25,-65	;6
	pb	5,25,-65	;7
	pb	-25,0,-75	;8
	pb	25,0,-75	;9
	pb	-5,-15,-75	;10
	pb	5,-15,-75	;11
	pb	3,-10,-75	;12
	pb	-3,-10,-75	;13
	pb	-3,10,-75	;14
	pb	3,10,-75	;15
	pb	-5,15,-75	;16
	pb	5,15,-75	;17
	pb	-15,0,-85	;18
	pb	15,0,-85	;19
.EB0

	EndPoints
METEO_0_F
	Vizis	20
	Viz	1,0,3,0,0,127	;0
	Viz	16,17,7,0,-90,90	;1
	Viz	6,7,17,0,90,-90	;2
	Viz	5,4,11,0,90,90	;5
	Viz	10,11,4,0,-90,-90	;6
	Viz	17,7,19,-111,44,-44	;7
	Viz	19,7,4,-114,0,-57	;8
	Viz	19,4,11,-111,-44,-44	;9
	Viz	18,6,16,111,44,-44	;10
	Viz	5,6,18,114,0,-57	;11
	Viz	10,5,18,111,-44,-44	;12
	Viz	7,6,5,0,0,-127	;13
	Viz	7,17,15,111,44,-44	;14
	Viz	14,16,6,-111,44,-44	;15
	Viz	6,7,15,0,114,-57	;16
	Viz	17,16,14,0,0,-127	;17
	Viz	12,13,10,0,0,-127	;18
	Viz	13,12,4,0,-114,-57	;19
	Viz	12,11,4,111,-44,-44	;20
	Viz	5,10,13,-111,-44,-44	;21
	BSPInit	METEO_0_EBSP
	BSP	1,METEO_0_f1,.bsp2
	BSPEND
.bsp2	BSP	3,METEO_0_f3,.bsp4
	BSPEND
.bsp4	BSPE	METEO_0_f5

METEO_0_f1	Faces
	Face4	25,1,0,-90,90,16,17,7,6
	FendQ
METEO_0_f3	Faces
	Face4	21,3,0,90,90,5,4,11,10
	FendQ
METEO_0_f5	Faces
	Face4	48,0,0,0,127,1,0,3,2		
	Face3	23,5,-111,44,-44,17,7,19
	Face3	25,6,-114,0,-57,19,7,4
	Face3	27,7,-111,-44,-44,19,4,11
	Face3	21,8,111,44,-44,18,6,16
	Face3	23,9,114,0,-57,5,6,18
	Face3	25,10,111,-44,-44,10,5,18
	Face3	12,12,111,44,-44,7,17,15
	Face3	12,13,-111,44,-44,14,16,6
	Face4	10,14,0,114,-57,6,7,15,14
	Face4	10,17,0,-114,-57,13,12,4,5
	Face3	12,18,111,-44,-44,12,11,4
	Face3	12,19,-111,-44,-44,5,10,13
	Face2	43,-1,0,0,0,9,19
	Face2	43,-1,0,0,0,18,8
	Face4	14,2,0,90,-90,6,7,17,16
	Face4	20,4,0,-90,-90,10,11,4,5
	Face4	18,11,0,0,-127,7,6,5,4		
	Face4	44,15,0,0,-127,17,16,14,15
	Face4	44,16,0,0,-127,12,13,10,11
	FendQ
METEO_0_EBSP
	EndShape

	endc
	endc






;--Shape file ----- C:\SHED\SHAPES5\TUNNEL_7.TXT ----
	ifne	DO_HDR

tunnel_7
	ShapeHdr	tunnel_7_P,0,tunnel_7_F,0,0,0,0,0,0,15,5,15,21,id_0_c,0,0,0,0,<tunnel_7>
	elseif
tunnel_7_P
	PointsXb	6
	pb	8,0,-15	;0
	pb	-8,3,-7	;2
	pb	-8,4,-1	;4
	pb	-8,5,4	;6
	pb	-10,5,10	;8
	pb	15,0,15	;10

	EndPoints
tunnel_7_F
	Vizis	3
	Viz	1,8,9,0,-125,-25	;0
	Viz	1,11,8,99,-76,-23	;1
	Viz	0,9,10,-99,-76,-23	;3

tunnel_7_f1	Faces
	Face4	10,0,0,-125,-25,1,8,9,0
	Face2	16,-1,0,0,0,6,7
	Face2	16,-1,0,0,0,2,3
	Face2	16,-1,0,0,0,4,5
	Face3	16,1,99,-76,-23,1,11,8
	Face3	18,2,-99,-76,-23,0,9,10
	Fend
	EndShape

	endc




;--Shape file ----- C:\SHED\SHAPES6\BOSS_H_0.TXT ----
	ifne	DO_HDR

boss_h_0
	ShapeHdr	boss_h_0_P,0,boss_h_0_F,0,0,0,0,bossh_scale,0,48,20,48,51,id_0_c,0,0,0,0,<boss_h_0>
	elseif
boss_h_0_P
	Pointsb	3
	pb	0,0,-48	;0
	pb	0,-20,-24	;1
	pb	0,15,-12	;2
	PointsXb	6
	pb	48,0,-16	;3
	pb	24,-20,-8	;5
	pb	12,15,-4	;7
	pb	7,15,10	;9
	pb	14,-20,20	;11
	pb	-28,0,40	;13

	EndPoints
boss_h_0_F
	Vizis	13
	Viz	7,9,10,0,127,0	;0
	Viz	5,11,12,0,127,0	;1
	Viz	9,10,13,0,-114,57	;2
	Viz	9,14,3,-54,-113,19	;3
	Viz	7,3,0,-32,-114,-47	;4
	Viz	8,4,13,54,-113,19	;5
	Viz	2,0,4,32,-114,-47	;6
	Viz	6,12,13,85,90,30	;7
	Viz	0,1,6,50,90,-75	;8
	Viz	3,14,11,-85,90,30	;9
	Viz	3,5,1,-50,90,-75	;10
	Viz	14,13,12,0,90,90	;11
	Viz	2,8,10,0,-127,0	;12

boss_h_0_f1	Faces
	Face5	0,0,0,127,0,7,9,10,8,2
	Face5	44,12,0,-127,0,2,8,10,9,7
	Face5	0,1,0,127,0,5,11,12,6,1
	Face4	105,2,0,-114,57,9,10,13,14
	Face4	105,3,-54,-113,19,7,9,14,3
	Face4	105,4,-32,-114,-47,2,7,3,0
	Face4	105,6,32,-114,-47,8,2,0,4
	Face4	105,5,54,-113,19,10,8,4,13
	Face4	30,7,85,90,30,6,12,13,4
	Face4	28,8,50,90,-75,0,1,6,4
	Face4	34,9,-85,90,30,3,14,11,5
	Face4	32,10,-50,90,-75,3,5,1,0
	Face4	32,11,0,90,90,14,13,12,11
	Fend
	EndShape

	endc





;--Shape file ----- C:\SHED\SHAPES6\BOSS_H_1.ANM ----
	ifne	DO_HDR

boss_h_1
	ShapeHdr	boss_h_1_P,0,boss_h_1_F,0,0,0,0,bossh_scale+1,0,20,95,96,96,id_0_c,0,0,0,0,<boss_h_1>
boss_h_1a
	ShapeHdr	boss_h_1_P,0,boss_h_1_F,0,0,0,0,bossh_scale+1,0,70,16,95,96,id_0_c,0,0,0,0,<boss_h_1>
	elseif
boss_h_1_P
	Pointsb	1
	pb	0,0,0	;0
	Frames	15
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
.A0A	Pointsb	4
	pb	0,-4,-25	;1
	pb	0,95,-14	;2
	pb	0,36,-14	;3
	pb	0,9,-9	;4
	PointsXb	1
	pb	4,36,-14	;5
	jump	.EB0
.A1A	Pointsb	4
	pb	0,-10,-36	;1
	pb	0,87,-25	;2
	pb	0,29,-25	;3
	pb	0,5,-11	;4
	PointsXb	1
	pb	4,29,-25	;5
	jump	.EB0
.A2A	Pointsb	4
	pb	0,-21,-45	;1
	pb	0,78,-34	;2
	pb	0,19,-34	;3
	pb	0,1,-13	;4
	PointsXb	1
	pb	4,19,-34	;5
	jump	.EB0
.A3A	Pointsb	4
	pb	0,-34,-50	;1
	pb	0,64,-38	;2
	pb	0,6,-38	;3
	pb	0,-3,-12	;4
	PointsXb	1
	pb	4,6,-38	;5
	jump	.EB0
.A4A	Pointsb	4
	pb	0,-48,-48	;1
	pb	0,51,-37	;2
	pb	0,-8,-38	;3
	pb	0,-7,-10	;4
	PointsXb	1
	pb	4,-8,-38	;5
	jump	.EB0
.A5A	Pointsb	4
	pb	0,-60,-44	;1
	pb	0,39,-33	;2
	pb	0,-20,-33	;3
	pb	0,-10,-7	;4
	PointsXb	1
	pb	4,-20,-33	;5
	jump	.EB0
.A6A	Pointsb	4
	pb	0,-70,-35	;1
	pb	0,29,-24	;2
	pb	0,-30,-24	;3
	pb	0,-12,-3	;4
	PointsXb	1
	pb	4,-30,-24	;5
	jump	.EB0
.A7A	Pointsb	4
	pb	0,-61,-30	;1
	pb	0,35,-53	;2
	pb	0,-20,-33	;3
	pb	0,-10,-7	;4
	PointsXb	1
	pb	4,-20,-33	;5
	jump	.EB0
.A8A	Pointsb	4
	pb	0,-45,-20	;1
	pb	0,38,-75	;2
	pb	0,-8,-38	;3
	pb	0,-7,-10	;4
	PointsXb	1
	pb	4,-8,-38	;5
	jump	.EB0
.A9A	Pointsb	4
	pb	0,-24,-9	;1
	pb	0,35,-88	;2
	pb	0,6,-38	;3
	pb	0,-3,-12	;4
	PointsXb	1
	pb	4,6,-38	;5
	jump	.EB0
.A10A	Pointsb	4
	pb	0,-29,-15	;1
	pb	0,43,-82	;2
	pb	0,6,-38	;3
	pb	0,-3,-12	;4
	PointsXb	1
	pb	4,6,-38	;5
	jump	.EB0
.A11A	Pointsb	4
	pb	0,-24,-9	;1
	pb	0,35,-88	;2
	pb	0,6,-38	;3
	pb	0,-3,-12	;4
	PointsXb	1
	pb	4,6,-38	;5
	jump	.EB0
.A12A	Pointsb	4
	pb	0,-24,-7	;1
	pb	0,27,-91	;2
	pb	0,2,-38	;3
	pb	0,-4,-11	;4
	PointsXb	1
	pb	4,2,-38	;5
	jump	.EB0
.A13A	Pointsb	4
	pb	0,-19,-1	;1
	pb	0,9,-95	;2
	pb	0,-1,-38	;3
	pb	0,-5,-11	;4
	PointsXb	1
	pb	4,-1,-38	;5
	jump	.EB0
.A14A	Pointsb	4
	pb	0,-12,1	;1
	pb	0,-1,-96	;2
	pb	0,-1,-38	;3
	pb	0,-5,-11	;4
	PointsXb	1
	pb	4,-1,-38	;5
.EB0

	EndPoints
boss_h_1_F
	Vizis	6
	Viz	6,2,1,108,-7,-66	;1
	Viz	1,2,5,-108,-7,-66	;2
	Viz	5,2,6,0,0,127	;3
	Viz	5,6,1,0,34,122	;4
	Viz	3,4,0,127,0,0	;5
	Viz	0,4,3,-127,0,0	;6

boss_h_1_f1	Faces
	Face3	34,3,0,34,122,5,6,1
	Face3	32,2,0,0,127,5,2,6
	Face2	23,-1,0,0,0,4,1
	Face3	28,0,108,-7,-66,6,2,1
	Face3	30,1,-108,-7,-66,1,2,5
	Face3	0,4,127,0,0,3,4,0
	Face3	0,5,-127,0,0,0,4,3
	Fend
	EndShape

	endc



;--Shape file ----- C:\SHED\SHAPES6\BOSS_H_2.TXT ----
	ifne	DO_HDR

boss_h_2
	ShapeHdr	boss_h_2_P,0,boss_h_2_F,0,0,0,0,bossh_scale,0,30,60,10,64,id_0_c,0,0,0,0,<boss_h_2>
	elseif
boss_h_2_P
	Pointsb	3
	pb	0,-50,-10	;0
	pb	0,-60,0	;1
	pb	0,-50,10	;2
	PointsXb	10
	pb	-5,-25,-10	;3
	pb	-15,-50,-5	;5
	pb	30,-50,-3	;7
	pb	-10,-25,0	;9
	pb	-15,-45,0	;11
	pb	30,-47,0	;13
	pb	-5,-50,0	;15
	pb	30,-56,0	;17
	pb	-15,-60,0	;19
	pb	-5,-25,10	;21

	EndPoints
boss_h_2_F
	Vizis	22
	Viz	15,0,1,104,52,-52	;0
	Viz	1,0,16,-104,52,-52	;1
	Viz	1,2,15,104,52,52	;2
	Viz	16,2,1,-104,52,52	;3
	Viz	0,15,9,112,22,-56	;4
	Viz	4,10,16,-112,22,-56	;5
	Viz	21,9,15,112,22,56	;6
	Viz	22,21,2,0,0,127	;7
	Viz	0,3,4,0,0,-127	;8
	Viz	2,16,10,-112,22,56	;9
	Viz	15,19,5,-52,52,-104	;10
	Viz	5,11,15,-42,-85,-85	;11
	Viz	5,19,18,15,56,-113	;12
	Viz	14,11,5,12,-89,-89	;13
	Viz	14,8,18,127,0,0	;14
	Viz	11,14,18,0,0,127	;15
	Viz	6,20,16,52,52,-104	;16
	Viz	16,12,6,42,-85,-85	;17
	Viz	7,17,20,-15,56,-113	;18
	Viz	7,6,12,-12,-89,-89	;19
	Viz	17,7,13,-127,0,0	;20
	Viz	16,20,17,0,0,127	;21
	BSPInit	boss_h_2_EBSP
	BSP	0,boss_h_2_f1,.bsp2
	BSP	21,boss_h_2_f3,.bsp4
	BSPE	boss_h_2_f5
.bsp4	BSPE	boss_h_2_f6
.bsp2	BSPE	boss_h_2_f7

boss_h_2_f1	Faces
	Face3	32,0,104,52,-52,15,0,1
	FendQ
boss_h_2_f3	Faces
	Face5	12,21,0,0,127,16,20,17,13,12
	FendQ
boss_h_2_f5	Faces
	Face4	20,5,-112,22,-56,4,10,16,0
	Face3	12,8,0,0,-127,0,3,4
	FendQ
boss_h_2_f6	Faces
	Face3	32,3,-104,52,52,16,2,1
	Face4	16,9,-112,22,56,2,16,10,22
	Face3	18,16,52,52,-104,6,20,16
	Face3	14,17,42,-85,-85,16,12,6
	Face4	16,19,-12,-89,-89,7,6,12,13
	Face4	18,6,112,22,56,21,9,15,2
	Face3	12,7,0,0,127,22,21,2
	Face4	44,18,-15,56,-113,7,17,20,6
	Face3	18,20,-127,0,0,17,7,13
	FendQ
boss_h_2_f7	Faces
	Face3	30,2,104,52,52,1,2,15
	Face4	16,4,112,22,-56,0,15,9,3
	Face3	20,10,-52,52,-104,15,19,5
	Face3	16,11,-42,-85,-85,5,11,15
	Face4	14,13,12,-89,-89,14,11,5,8
	Face3	34,1,-104,52,-52,1,0,16
	Face4	44,12,15,56,-113,5,19,18,8
	Face3	12,14,127,0,0,14,8,18
	Face5	12,15,0,0,127,11,14,18,19,15
	FendQ
boss_h_2_EBSP
	EndShape

	endc



;--Shape file ----- C:\SHED\NSHAPES\big_bird.txt ----
	ifne	DO_HDR

big_bird
	ShapeHdr	big_bird_P,0,big_bird_F,0,0,0,0,1,0,18,29,86,88,id_0_c,0,0,0,0,<big_bird>
	elseif
big_bird_P
	Pointsb	8
	pb	0,15,-66	;0
	pb	0,-15,-2	;1
	pb	0,21,11	;2
	pb	0,-6,39	;3
	pb	0,-24,41	;4
	pb	0,-9,47	;5
	pb	0,-18,48	;6
	pb	0,-10,50	;7
	PointsXb	9
	pb	-5,17,-86	;8
	pb	9,19,-84	;10
	pb	-16,20,-79	;12
	pb	-18,-9,0	;14
	pb	-10,-19,22	;16
	pb	10,-20,30	;18
	pb	-4,-29,31	;20
	pb	-8,-12,33	;22
	pb	-4,-15,40	;24

	EndPoints
big_bird_F
	Vizis	42
	Viz	14,2,0,108,-67,-5	;0
	Viz	16,22,14,121,20,35	;1
	Viz	14,22,2,110,-52,38	;2
	Viz	1,14,0,42,109,-51	;3
	Viz	15,23,17,-121,20,35	;4
	Viz	2,23,15,-110,-52,38	;5
	Viz	20,16,14,114,53,18	;6
	Viz	15,17,21,-114,53,18	;7
	Viz	0,15,1,-42,109,-51	;8
	Viz	0,2,15,-108,-67,-5	;9
	Viz	4,6,24,112,45,39	;10
	Viz	7,24,6,115,13,53	;11
	Viz	25,6,4,-112,45,39	;12
	Viz	6,25,7,-115,13,53	;13
	Viz	24,7,25,0,-114,-57	;14
	Viz	24,25,5,0,96,83	;15
	Viz	3,24,5,114,-53,20	;16
	Viz	5,25,3,-114,-53,20	;17
	Viz	4,24,20,104,39,61	;18
	Viz	19,20,24,88,50,77	;19
	Viz	24,3,22,92,-49,73	;20
	Viz	19,24,22,110,-3,64	;21
	Viz	23,3,25,-92,-49,73	;22
	Viz	21,25,4,-104,39,61	;23
	Viz	4,20,21,0,114,57	;24
	Viz	2,22,3,92,-63,60	;25
	Viz	22,16,19,123,-29,4	;26
	Viz	3,23,2,-92,-63,60	;27
	Viz	16,20,19,105,71,-9	;28
	Viz	14,1,20,42,108,-51	;29
	Viz	25,21,18,-88,50,77	;30
	Viz	23,25,18,-110,-3,64	;31
	Viz	21,1,15,-42,108,-51	;32
	Viz	18,17,23,-123,-29,4	;33
	Viz	18,21,17,-105,71,-9	;34
	Viz	21,20,1,0,117,-50	;35
	Viz	10,13,0,-27,123,-14	;36
	Viz	0,13,10,27,-123,14	;37
	Viz	0,12,11,27,123,-14	;38
	Viz	11,12,0,-27,-123,14	;39
	Viz	8,9,0,0,126,-13	;40
	Viz	0,9,8,0,-126,13	;41
	BSPInit	big_bird_EBSP
	BSP	0,big_bird_f1,.bsp2
	BSP	8,big_bird_f3,.bsp4
	BSP	33,big_bird_f5,.bsp6
	BSPE	big_bird_f7
.bsp6	BSPE	big_bird_f8
.bsp4	BSPE	big_bird_f9
.bsp2	BSPE	big_bird_f10

big_bird_f1	Faces
	Face3	12,0,108,-67,-5,14,2,0
	FendQ
big_bird_f3	Faces
	Face3	30,8,-42,109,-51,0,15,1
	FendQ
big_bird_f5	Faces
	Face3	14,33,-123,-29,4,18,17,23
	FendQ
big_bird_f7	Faces
	Face3	10,14,0,-114,-57,24,7,25
	Face3	10,15,0,96,83,24,25,5
	Face3	21,16,114,-53,20,3,24,5
	Face3	23,17,-114,-53,20,5,25,3
	Face3	0,20,92,-49,73,24,3,22
	Face3	12,26,123,-29,4,22,16,19
	Face3	16,1,121,20,35,16,22,14
	Face3	18,6,114,53,18,20,16,14
	Face3	25,10,112,45,39,4,6,24
	Face3	23,11,115,13,53,7,24,6
	Face3	27,12,-112,45,39,25,6,4
	Face3	25,13,-115,13,53,6,25,7
	Face3	16,18,104,39,61,4,24,20
	Face3	43,19,88,50,77,19,20,24
	Face3	14,21,110,-3,64,19,24,22
	Face3	20,23,-104,39,61,21,25,4
	Face3	28,25,92,-63,60,2,22,3
	Face3	16,28,105,71,-9,16,20,19
	Face3	30,29,42,108,-51,14,1,20
	FendQ
big_bird_f8	Faces
	Face3	18,4,-121,20,35,15,23,17
	Face3	16,5,-110,-52,38,2,23,15
	Face3	14,9,-108,-67,-5,0,2,15
	Face3	14,22,-92,-49,73,23,3,25
	Face3	30,27,-92,-63,60,3,23,2
	Face3	43,30,-88,50,77,25,21,18
	Face3	16,31,-110,-3,64,23,25,18
	FendQ
big_bird_f9	Faces
	Face3	34,32,-42,108,-51,21,1,15
	Face3	27,36,-27,123,-14,10,13,0
	Face3	28,3,42,109,-51,1,14,0
	Face3	20,7,-114,53,18,15,17,21
	Face3	18,24,0,114,57,4,20,21
	Face3	18,34,-105,71,-9,18,21,17
	Face3	32,35,0,117,-50,21,20,1
	Face3	21,37,27,-123,14,0,13,10
	FendQ
big_bird_f10	Faces
	Face3	23,38,27,123,-14,0,12,11
	Face3	25,39,-27,-123,14,11,12,0
	Face3	25,40,0,126,-13,8,9,0
	Face3	23,41,0,-126,13,0,9,8
	Face3	14,2,110,-52,38,14,22,2
	FendQ
big_bird_EBSP
	EndShape

	endc

 ;--Shape file ----- C:\SHED\NSHAPES\t_bool_6.txt ----
	ifne	DO_HDR

t_bool_6
	ShapeHdr	t_bool_6_P,0,t_bool_6_F,0,0,0,0,0,0,12*125/100,12*125/100,50*125/100,13,id_0_c,0,0,0,0,<t_bool_6>
	elseif
tbpb	MACRO
	pb	\1*125/100,\2*125/100,\3*125/100
	ENDM
t_bool_6_P
	PointsXb	3
	tbpb	-6,12,0	;0
	tbpb	-12,0,0	;2
	tbpb	6,-12,0	;4

	EndPoints
t_bool_6_F
	Vizis	1
	Viz	4,5,2,0,0,-127	;0

t_bool_6_f1	Faces
	Face6	104,0,0,0,-127,4,5,2,0,1,3
	Fend
	EndShape

	endc



;--Shape file ----- C:\SHED\SHAPES4\DEMO_1.TXT ----
	ifne	DO_HDR

my_demoBS	ShapeHdr	my_demo_P,0,my_demo_F,0,0,0,0,0,0,70,28,100,125,black_c,0,0,0,0,<my_demo>
my_demoS	ShapeHdr	my_demo_P,0,my_demo_F,0,0,0,0,0,0,70,28,100,125,id_0_c,0,0,0,0,<my_demo>
my_demo	ShapeHdr	my_demo_P,0,my_demo_F,0,0,0,0,1,0,70,28,100,125,id_0_c,0,0,0,0,<my_demo>
	elseif
MY_DEMO_P
	Pointsb	4
	pbd2	0,-4,-40	;0
	pbd2	0,-2,-32	;1
	pbd2	0,20,16	;2
	pbd2	0,4,100	;3
	PointsXb	16
	pbd2	70,28,-100	;4
	pbd2	54,18,-60	;6
	pbd2	60,18,-60	;8
	pbd2	40,-22,-60	;10
	pbd2	-40,18,-40	;12
	pbd2	4,-14,-26	;14
	pbd2	-10,6,-22	;16
	pbd2	30,6,-22	;18
	pbd2	-24,10,-20	;20
	pbd2	20,8,-20	;22
	pbd2	40,8,-20	;24
	pbd2	-26,12,-14	;26
	pbd2	-36,12,-14	;28
	pbd2	30,-6,-14	;30
	pbd2	4,-4,10	;32
	pbd2	30,24,20	;34

	EndPoints
MY_DEMO_F
	Vizis	48
	Viz	23,35,31,-104,54,48	;0
	Viz	23,31,11,-104,73,3	;1
	Viz	10,30,22,104,73,3	;2
	Viz	30,34,22,104,54,48	;3
	Viz	27,22,24,0,106,70	;4
	Viz	29,24,22,0,-106,-70	;5
	Viz	28,25,23,0,106,70	;6
	Viz	26,23,25,0,-106,-70	;7
	Viz	10,22,18,-6,-103,-74	;8
	Viz	22,34,18,-13,-116,-50	;9
	Viz	4,24,22,0,123,-31	;10
	Viz	22,24,13,0,-114,57	;11
	Viz	24,4,13,-65,-98,49	;12
	Viz	4,22,13,70,-105,-17	;13
	Viz	23,25,5,0,123,-31	;14
	Viz	12,25,23,0,-114,57	;15
	Viz	19,35,23,13,-116,-50	;16
	Viz	12,23,5,-70,-105,-17	;17
	Viz	19,23,11,6,-103,-74	;18
	Viz	5,9,7,0,-123,31	;19
	Viz	6,8,4,0,-123,31	;20
	Viz	4,8,6,0,123,-31	;21
	Viz	7,9,5,0,123,-31	;22
	Viz	12,5,25,65,-98,49	;23
	Viz	21,3,22,-57,113,6	;24
	Viz	22,3,21,57,-113,-6	;25
	Viz	23,3,20,57,113,6	;26
	Viz	20,3,23,-57,-113,-6	;27
	Viz	23,16,1,-5,-102,-76	;28
	Viz	1,16,17,0,-99,-79	;29
	Viz	16,23,22,0,-90,-90	;30
	Viz	0,1,17,60,-109,-27	;31
	Viz	22,23,2,0,-120,-40	;32
	Viz	3,2,23,86,-92,17	;33
	Viz	22,2,3,-86,-92,17	;34
	Viz	32,22,3,-89,89,12	;35
	Viz	3,23,33,89,89,12	;36
	Viz	33,32,3,0,127,11	;37
	Viz	14,32,33,0,122,34	;38
	Viz	32,14,22,-98,77,22	;39
	Viz	15,33,23,98,77,22	;40
	Viz	14,0,22,-96,52,-65	;41
	Viz	23,0,15,96,52,-65	;42
	Viz	0,14,15,0,103,-74	;43
	Viz	18,34,10,-93,-79,-34	;44
	Viz	11,35,19,93,-79,-34	;45
	Viz	10,34,30,-112,45,40	;46
	Viz	31,35,11,112,45,40	;47
	BSPInit	MY_DEMO_EBSP
	BSP	0,MY_DEMO_f1,.bsp2
	BSP	6,MY_DEMO_f3,.bsp4
	BSPE	MY_DEMO_f5
.bsp4	BSPE	MY_DEMO_f6
.bsp2	BSP	2,MY_DEMO_f7,.bsp8
	BSP	4,MY_DEMO_f9,.bsp10
	BSPE	MY_DEMO_f11
.bsp10	BSPE	MY_DEMO_f12
.bsp8	BSP	33,MY_DEMO_f13,.bsp14
	BSP	35,MY_DEMO_f15,.bsp16
	BSPE	MY_DEMO_f17
.bsp16	BSPE	MY_DEMO_f18
.bsp14	BSPE	MY_DEMO_f19

MY_DEMO_f1	Faces
	Face3	32,0,-104,54,48,23,35,31
	FendQ
MY_DEMO_f3	Faces
	Face4	0,6,0,106,70,28,25,23,26
	FendQ
MY_DEMO_f5	Faces
	Face3	18,14,0,123,-31,23,25,5
	Face3	44,15,0,-114,57,12,25,23
	Face3	12,17,-70,-105,-17,12,23,5
	Face3	14,19,0,-123,31,5,9,7
	Face3	18,22,0,123,-31,7,9,5
	Face3	14,23,65,-98,49,12,5,25
	FendQ
MY_DEMO_f6	Faces
	Face3	32,45,93,-79,-34,11,35,19
	Face3	30,1,-104,73,3,23,31,11
	Face3	28,18,6,-103,-74,19,23,11
	Face3	34,47,112,45,40,31,35,11
	Face4	0,7,0,-106,-70,26,23,25,28
	FendQ
MY_DEMO_f7	Faces
	Face3	28,2,104,73,3,10,30,22
	FendQ
MY_DEMO_f9	Faces
	Face4	0,4,0,106,70,27,22,24,29
	FendQ
MY_DEMO_f11	Faces
	Face3	18,10,0,123,-31,4,24,22
	Face3	44,11,0,-114,57,22,24,13
	Face3	12,12,-65,-98,49,24,4,13
	Face3	14,13,70,-105,-17,4,22,13
	Face3	12,20,0,-123,31,6,8,4
	Face3	18,21,0,123,-31,4,8,6
	FendQ
MY_DEMO_f12	Faces
	Face3	34,44,-93,-79,-34,18,34,10
	Face3	32,9,-13,-116,-50,22,34,18
	Face4	0,5,0,-106,-70,29,24,22,27
	FendQ
MY_DEMO_f13	Faces
	Face3	14,33,86,-92,17,3,2,23
	FendQ
MY_DEMO_f15	Faces
	Face3	16,35,-89,89,12,32,22,3
	FendQ
MY_DEMO_f17	Faces
	Face4	10,30,0,-90,-90,16,23,22,17
	Face4	10,31,60,-109,-27,0,1,17,22
	Face3	18,40,98,77,22,15,33,23
	Face4	10,28,-5,-102,-76,23,16,1,0
	Face3	43,29,0,-99,-79,1,16,17
	Face3	11,32,0,-120,-40,22,23,2
	Face3	12,34,-86,-92,17,22,2,3
	Face3	16,42,96,52,-65,23,0,15
	FendQ
MY_DEMO_f18	Faces
	Face3	30,3,104,54,48,30,34,22
	Face3	18,24,-57,113,6,21,3,22
	Face3	11,25,57,-113,-6,22,3,21
	Face3	18,37,0,127,11,33,32,3
	Face4	32,38,0,122,34,14,32,33,15
	Face3	14,39,-98,77,22,32,14,22
	Face3	12,41,-96,52,-65,14,0,22
	Face3	14,43,0,103,-74,0,14,15
	Face3	32,46,-112,45,40,10,34,30
	Face3	30,8,-6,-103,-74,10,22,18
	FendQ
MY_DEMO_f19	Faces
	Face3	20,36,89,89,12,3,23,33
	Face3	18,26,57,113,6,23,3,20
	Face3	12,27,-57,-113,-6,20,3,23
	Face3	30,16,13,-116,-50,19,35,23
	FendQ
MY_DEMO_EBSP
	EndShape

	endc




;--Shape file ----- C:\SHED\SHAPES6\BOSS_H_3.ANM ----
	ifne	DO_HDR

boss_h_3
	ShapeHdr	boss_h_3_P,0,boss_h_3_F,0,0,0,0,bossh_scale,0,8,100,0,100,teleport_c,0,0,0,0,<boss_h_3>
	elseif
boss_h_3_P
	Frames	20
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
.A0A	PointsXb	2
	pb	-1,10,0	;0
	pb	1,0,0	;2
	jump	.EB0
.A1A	PointsXb	2
	pb	-1,20,0	;0
	pb	1,0,0	;2
	jump	.EB0
.A2A	PointsXb	2
	pb	-2,30,0	;0
	pb	2,0,0	;2
	jump	.EB0
.A3A	PointsXb	2
	pb	-3,40,0	;0
	pb	2,0,0	;2
	jump	.EB0
.A4A	PointsXb	2
	pb	-4,50,0	;0
	pb	2,0,0	;2
	jump	.EB0
.A5A	PointsXb	2
	pb	-5,60,0	;0
	pb	2,0,0	;2
	jump	.EB0
.A6A	PointsXb	2
	pb	-6,70,0	;0
	pb	2,0,0	;2
	jump	.EB0
.A7A	PointsXb	2
	pb	-6,80,0	;0
	pb	2,0,0	;2
	jump	.EB0
.A8A	PointsXb	2
	pb	-7,90,0	;0
	pb	2,0,0	;2
	jump	.EB0
.A9A	PointsXb	2
	pb	-8,100,0	;0
	pb	2,0,0	;2
	jump	.EB0
.A10A	PointsXb	2
	pb	-8,100,0	;0
	pb	2,10,0	;2
	jump	.EB0
.A11A	PointsXb	2
	pb	-8,100,0	;0
	pb	3,20,0	;2
	jump	.EB0
.A12A	PointsXb	2
	pb	-8,100,0	;0
	pb	3,30,0	;2
	jump	.EB0
.A13A	PointsXb	2
	pb	-8,100,0	;0
	pb	4,40,0	;2
	jump	.EB0
.A14A	PointsXb	2
	pb	-8,100,0	;0
	pb	5,50,0	;2
	jump	.EB0
.A15A	PointsXb	2
	pb	-8,100,0	;0
	pb	5,60,0	;2
	jump	.EB0
.A16A	PointsXb	2
	pb	-8,100,0	;0
	pb	6,70,0	;2
	jump	.EB0
.A17A	PointsXb	2
	pb	-8,100,0	;0
	pb	6,80,0	;2
	jump	.EB0
.A18A	PointsXb	2
	pb	-8,100,0	;0
	pb	7,90,0	;2
	jump	.EB0
.A19A	PointsXb	2
	pb	-8,100,0	;0
	pb	8,95,0	;2
.EB0

	EndPoints
boss_h_3_F
	Vizis	1
	Viz	2,3,0,0,0,-127	;0

boss_h_3_f1	Faces
	Face4	0,0,0,0,-127,2,3,0,1
	Fend
	EndShape

	endc



	IFEQ	CONTEST

;--Shape file ----- C:\SHED\SHAPES6\SLOT_0.TXT ----
	ifne	DO_HDR

slot_0
	ShapeHdr	slot_0_P,0,slot_0_F,0,0,0,0,slot_scale,0,45,100,35,108,id_0_c,0,0,0,0,<slot_0>
	elseif
slot_0_P
	PointsXb	29
	pb	-40,70,-30	;0
	pb	40,-60,-30	;2
	pb	-45,70,-25	;4
	pb	45,-15,-25	;6
	pb	-45,-55,-25	;8
	pb	-40,-15,0	;10
	pb	40,-60,0	;12
	pb	45,-15,5	;14
	pb	30,-30,5	;16
	pb	30,-50,5	;18
	pb	45,-55,5	;20
	pb	40,-20,10	;22
	pb	31,-29,10	;24
	pb	31,-51,10	;26
	pb	-40,-60,10	;28
	pb	-40,-70,10	;30
	pb	35,-75,10	;32
	pb	-35,-95,10	;34
	pb	40,-100,10	;36
	pb	-35,-25,15	;38
	pb	35,-55,15	;40
	pb	35,60,20	;42
	pb	45,-5,25	;44
	pb	-45,70,30	;46
	pb	-45,5,30	;48
	pb	40,-10,30	;50
	pb	-40,70,35	;52
	pb	-40,50,35	;54
	pb	40,0,35	;56

	EndPoints
slot_0_F
	Vizis	42
	Viz	11,10,13,0,0,127	;0
	Viz	42,43,54,0,-106,70	;1
	Viz	53,42,55,120,0,40	;2
	Viz	42,53,52,0,106,70	;3
	Viz	54,43,52,-120,0,40	;4
	Viz	26,24,16,125,0,25	;5
	Viz	19,17,25,-125,0,25	;6
	Viz	26,18,19,0,-125,25	;7
	Viz	25,17,16,0,125,25	;8
	Viz	40,41,28,0,90,90	;9
	Viz	26,27,41,0,-99,79	;10
	Viz	22,23,38,0,-90,90	;11
	Viz	39,38,25,0,99,79	;12
	Viz	38,41,27,-99,0,79	;13
	Viz	23,28,41,90,0,90	;14
	Viz	24,26,40,99,0,79	;15
	Viz	39,40,29,-90,0,90	;16
	Viz	50,51,23,0,114,57	;17
	Viz	51,50,56,0,57,114	;18
	Viz	55,54,57,0,0,127	;19
	Viz	23,51,45,102,68,34	;20
	Viz	57,52,46,90,0,90	;21
	Viz	48,45,51,102,34,68	;22
	Viz	21,28,23,90,0,90	;23
	Viz	8,3,28,90,90,0	;24
	Viz	4,0,3,90,0,-90	;25
	Viz	46,4,7,127,0,0	;26
	Viz	8,21,15,127,0,0	;27
	Viz	14,44,50,-102,68,34	;28
	Viz	49,47,53,-90,0,90	;29
	Viz	56,50,44,-102,34,68	;30
	Viz	14,22,29,-90,0,90	;31
	Viz	20,29,2,-90,90,0	;32
	Viz	9,2,1,-90,0,-90	;33
	Viz	49,44,14,-127,0,0	;34
	Viz	6,14,20,-127,0,0	;35
	Viz	2,29,28,0,127,0	;36
	Viz	3,0,1,0,0,-127	;37
	Viz	53,47,5,0,-127,0	;38
	Viz	30,31,36,0,0,-127	;41
	Viz	37,36,31,0,0,127	;42
	Viz	32,33,34,0,0,127	;43
	BSPInit	slot_0_EBSP
	BSP	9,slot_0_f1,.bsp2
	BSPE	slot_0_f3
.bsp2	BSPE	slot_0_f4

slot_0_f1	Faces
	Face4	18,9,0,90,90,40,41,28,29
	FendQ
slot_0_f3	Faces
	Face4	10,0,0,0,127,11,10,13,12
	Face4	10,1,0,-106,70,42,43,54,55
	Face3	12,2,120,0,40,53,42,55
	Face4	16,3,0,106,70,42,53,52,43
	Face3	18,4,-120,0,40,54,43,52
	Face4	43,5,125,0,25,26,24,16,18
	Face4	43,6,-125,0,25,19,17,25,27
	Face4	43,7,0,-125,25,26,18,19,27
	Face4	43,8,0,125,25,25,17,16,24
	Face4	16,11,0,-90,90,22,23,38,39
	Face4	18,12,0,99,79,39,38,25,24
	Face4	20,13,-99,0,79,38,41,27,25
	Face4	14,14,90,0,90,23,28,41,38
	Face4	14,15,99,0,79,24,26,40,39
	Face4	20,16,-90,0,90,39,40,29,22
	Face4	27,17,0,114,57,50,51,23,22
	Face4	25,18,0,57,114,51,50,56,57
	Face4	18,20,102,68,34,23,51,45,15
	Face4	16,23,90,0,90,21,28,23,15
	Face4	20,28,-102,68,34,14,44,50,22
	Face4	18,31,-90,0,90,14,22,29,20
	Face4	23,19,0,0,127,55,54,57,56
	Face4	14,21,90,0,90,57,52,46,48
	Face4	16,22,102,34,68,48,45,51,57
	Face4	18,24,90,90,0,8,3,28,21
	Face4	16,25,90,0,-90,4,0,3,8
	Face6	23,26,127,0,0,46,4,7,15,45,48
	Face4	25,27,127,0,0,8,21,15,7
	Face4	16,29,-90,0,90,49,47,53,56
	Face4	18,30,-102,34,68,56,50,44,49
	Face4	20,32,-90,90,0,20,29,2,9
	Face4	18,33,-90,0,-90,9,2,1,5
	Face6	25,34,-127,0,0,49,44,14,6,5,47
	Face4	27,35,-127,0,0,6,14,20,9
	Face4	27,36,0,127,0,2,29,28,3
	Face4	25,37,0,0,-127,3,0,1,2
	Face8	21,38,0,-127,0,53,47,5,1,0,4,46,52
	FendQ
slot_0_f4	Faces
	Face2	23,-1,0,0,0,28,30
	Face2	23,-1,0,0,0,31,29
	Face4	21,39,0,0,-127,30,31,36,37
	Face4	21,40,0,0,127,37,36,31,30
	Face4	106,41,0,0,127,32,33,34,35
	Face4	16,10,0,-99,79,26,27,41,40
	FendQ
slot_0_EBSP
	EndShape

	endc





;--Shape file ----- C:\SHED\SHAPES6\SLOT_1.TXT ----
	ifne	DO_HDR

slot_1
	ShapeHdr	slot_1_P,0,slot_1_F,0,0,0,0,slot_scale,0,25,57,8,60,id_0_c,0,0,0,0,<slot_1>
	elseif
slot_1_P
	Pointsb	32
	pb	0,3,-7	;0
	pb	-25,3,-7	;1
	pb	0,-2,-7	;2
	pb	-25,-2,-7	;3
	pb	-10,-52,-7	;4
	pb	-25,-52,-7	;5
	pb	0,8,-2	;6
	pb	-25,8,-2	;7
	pb	0,-7,-2	;8
	pb	-15,-7,-2	;9
	pb	-20,-7,-2	;10
	pb	-25,-7,-2	;11
	pb	-15,-47,-2	;12
	pb	-20,-47,-2	;13
	pb	-15,-57,-2	;14
	pb	-20,-57,-2	;15
	pb	0,8,3	;16
	pb	-25,8,3	;17
	pb	0,-7,3	;18
	pb	-15,-7,3	;19
	pb	-20,-7,3	;20
	pb	-25,-7,3	;21
	pb	-15,-47,3	;22
	pb	-20,-47,3	;23
	pb	-15,-57,3	;24
	pb	-20,-57,3	;25
	pb	0,3,8	;26
	pb	-25,3,8	;27
	pb	0,-2,8	;28
	pb	-25,-2,8	;29
	pb	-10,-52,8	;30
	pb	-25,-52,8	;31

	EndPoints
slot_1_F
	Vizis	23
	Viz	19,20,23,0,0,127	;0
	Viz	12,13,10,0,0,-127	;1
	Viz	19,22,12,-127,0,0	;2
	Viz	10,13,23,127,0,0	;3
	Viz	23,13,5,90,-90,0	;4
	Viz	30,4,12,-90,-90,0	;5
	Viz	22,23,31,0,-90,90	;6
	Viz	4,5,13,0,-90,-90	;7
	Viz	24,14,4,-90,90,0	;8
	Viz	30,31,25,0,90,90	;9
	Viz	14,15,5,0,90,-90	;10
	Viz	31,5,15,90,90,0	;11
	Viz	25,15,14,0,127,0	;12
	Viz	21,29,27,127,0,0	;13
	Viz	19,9,8,0,127,0	;14
	Viz	21,11,10,0,127,0	;15
	Viz	18,28,29,0,90,90	;16
	Viz	17,27,26,0,-90,90	;17
	Viz	28,26,27,0,0,127	;18
	Viz	11,3,2,0,90,-90	;19
	Viz	3,1,0,0,0,-127	;20
	Viz	6,0,1,0,-90,-90	;21
	Viz	16,6,7,0,-127,0	;22
	BSPInit	slot_1_EBSP
	BSP	14,slot_1_f1,.bsp2
	BSPE	slot_1_f3
.bsp2	BSP	15,slot_1_f4,.bsp5
	BSPEND
.bsp5	BSPE	slot_1_f6

slot_1_f1	Faces
	Face4	18,14,0,127,0,19,9,8,18
	FendQ
slot_1_f3	Faces
	Face8	18,13,127,0,0,21,29,27,17,7,1,3,11
	Face4	14,17,0,-90,90,17,27,26,16
	Face4	16,18,0,0,127,28,26,27,29
	Face4	16,20,0,0,-127,3,1,0,2
	Face4	14,21,0,-90,-90,6,0,1,7
	Face4	12,22,0,-127,0,16,6,7,17
	FendQ
slot_1_f4	Faces
	Face4	18,15,0,127,0,21,11,10,20
	FendQ
slot_1_f6	Faces
	Face4	18,0,0,0,127,19,20,23,22
	Face4	18,1,0,0,-127,12,13,10,9
	Face4	16,2,-127,0,0,19,22,12,9
	Face4	16,3,127,0,0,10,13,23,20
	Face4	12,4,90,-90,0,23,13,5,31
	Face4	12,5,-90,-90,0,30,4,12,22
	Face4	14,6,0,-90,90,22,23,31,30
	Face4	14,7,0,-90,-90,4,5,13,12
	Face4	20,16,0,90,90,18,28,29,21
	Face4	20,19,0,90,-90,11,3,2,8
	Face4	14,8,-90,90,0,24,14,4,30
	Face4	16,9,0,90,90,30,31,25,24
	Face4	16,10,0,90,-90,14,15,5,4
	Face4	14,11,90,90,0,31,5,15,25
	Face4	43,12,0,127,0,25,15,14,24
	FendQ
slot_1_EBSP
	EndShape

	endc


	ENDC






;--Shape file ----- C:\SHED\SHAPES6\TRAINING.TXT ----
	ifne	DO_HDR

	IFNE	CONTEST
	public	slot_1
	public	slot_0
slot_0
slot_1
	ENDC

training
	ShapeHdr	training_P,0,training_F,0,0,0,0,1,0,40,40,5,43,id_0_c,0,0,0,0,<training>
	elseif
training_P
	PointsXb	16
	pb	-13,34,-5	;0
	pb	-34,13,-5	;2
	pb	-34,-13,-5	;4
	pb	-13,-34,-5	;6
	pb	-17,40,0	;8
	pb	12,30,0	;10
	pb	-40,17,0	;12
	pb	30,12,0	;14
	pb	30,-12,0	;16
	pb	-40,-17,0	;18
	pb	12,-30,0	;20
	pb	-17,-40,0	;22
	pb	-13,34,5	;24
	pb	-34,13,5	;26
	pb	-34,-13,5	;28
	pb	-13,-34,5	;30

	EndPoints
training_F
	Vizis	32
	Viz	2,0,11,-73,73,-73	;0
	Viz	1,10,11,0,99,-79	;1
	Viz	14,10,1,73,73,-73	;2
	Viz	15,17,4,-99,0,-79	;3
	Viz	17,21,6,-73,-73,-73	;4
	Viz	3,5,16,99,0,-79	;5
	Viz	5,7,20,73,-73,-73	;6
	Viz	6,21,20,0,-99,-79	;7
	Viz	23,22,6,0,81,-98	;8
	Viz	18,4,6,52,52,-104	;9
	Viz	1,0,8,0,-81,-98	;10
	Viz	8,0,2,52,-52,-104	;11
	Viz	12,2,4,81,0,-98	;12
	Viz	23,7,5,-52,52,-104	;13
	Viz	19,5,3,-81,0,-98	;14
	Viz	13,3,1,-52,-52,-104	;15
	Viz	27,25,10,73,73,73	;16
	Viz	24,11,10,0,99,79	;17
	Viz	15,11,24,-73,73,73	;18
	Viz	14,16,29,99,0,79	;19
	Viz	16,20,31,73,-73,73	;20
	Viz	26,28,17,-99,0,79	;21
	Viz	28,30,21,-73,-73,73	;22
	Viz	31,20,21,0,-99,79	;23
	Viz	22,23,31,0,81,98	;24
	Viz	19,29,31,-52,52,104	;25
	Viz	24,25,9,0,-81,98	;26
	Viz	9,25,27,-52,-52,104	;27
	Viz	13,27,29,-81,0,98	;28
	Viz	22,30,28,52,52,104	;29
	Viz	18,28,26,81,0,98	;30
	Viz	12,26,24,52,-52,104	;31

training_f1	Faces
	Face4	18,0,-73,73,-73,2,0,11,15
	Face4	44,1,0,99,-79,1,10,11,0
	Face4	14,2,73,73,-73,14,10,1,3
	Face4	44,3,-99,0,-79,15,17,4,2
	Face4	14,4,-73,-73,-73,17,21,6,4
	Face4	44,5,99,0,-79,3,5,16,14
	Face4	12,6,73,-73,-73,5,7,20,16
	Face4	44,7,0,-99,-79,6,21,20,7
	Face4	18,16,73,73,73,27,25,10,14
	Face4	44,17,0,99,79,24,11,10,25
	Face4	14,18,-73,73,73,15,11,24,26
	Face4	44,19,99,0,79,14,16,29,27
	Face4	14,20,73,-73,73,16,20,31,29
	Face4	44,21,-99,0,79,26,28,17,15
	Face4	12,22,-73,-73,73,28,30,21,17
	Face4	44,23,0,-99,79,31,20,21,30
	Face4	18,8,0,81,-98,23,22,6,7
	Face4	16,9,52,52,-104,18,4,6,22
	Face4	14,10,0,-81,-98,1,0,8,9
	Face4	12,11,52,-52,-104,8,0,2,12
	Face4	14,12,81,0,-98,12,2,4,18
	Face4	20,13,-52,52,-104,23,7,5,19
	Face4	18,14,-81,0,-98,19,5,3,13
	Face4	16,15,-52,-52,-104,13,3,1,9
	Face4	18,24,0,81,98,22,23,31,30
	Face4	16,25,-52,52,104,19,29,31,23
	Face4	14,26,0,-81,98,24,25,9,8
	Face4	12,27,-52,-52,104,9,25,27,13
	Face4	14,28,-81,0,98,13,27,29,19
	Face4	20,29,52,52,104,22,30,28,18
	Face4	18,30,81,0,98,18,28,26,12
	Face4	16,31,52,-52,104,12,26,24,8
	Fend
	EndShape

	endc



;--Shape file ----- C:\SHED\NSHAPES\face_box.txt ----
	ifne	DO_HDR

face_box
	ShapeHdr	face_box_P,0,face_box_F,0,0,0,0,3,0,20,50,20,50,androssl3_c,0,0,0,0,<face_box>
	elseif
face_box_P
	Pointsb	2
	pb	0,35,0	;0
	pb	0,-35,0	;1
	PointsXb	4
	pb	-20,20,-20	;2
	pb	-20,-20,-20	;4
	pb	-20,20,20	;6
	pb	-20,-20,20	;8

	EndPoints
face_box_F
	Vizis	12
	Viz	4,8,6,127,0,0	;0
	Viz	3,7,9,-127,0,0	;1
	Viz	5,4,2,0,0,-127	;2
	Viz	7,6,8,0,0,127	;3
	Viz	1,4,5,0,70,-106	;4
	Viz	9,8,1,0,70,106	;5
	Viz	1,8,4,106,70,0	;6
	Viz	5,9,1,-106,70,0	;7
	Viz	3,2,0,0,-70,-106	;8
	Viz	0,6,7,0,-70,106	;9
	Viz	2,6,0,106,-70,0	;10
	Viz	0,7,3,-106,-70,0	;11

face_box_f1	Faces
	Face4	0,0,127,0,0,4,8,6,2
	Face4	0,1,-127,0,0,3,7,9,5
	Face4	0,2,0,0,-127,5,4,2,3
	Face4	0,3,0,0,127,7,6,8,9
	Face3	1,4,0,70,-106,1,4,5
	Face3	1,5,0,70,106,9,8,1
	Face3	1,6,106,70,0,1,8,4
	Face3	1,7,-106,70,0,5,9,1
	Face3	1,8,0,-70,-106,3,2,0
	Face3	1,9,0,-70,106,0,6,7
	Face3	1,10,106,-70,0,2,6,0
	Face3	1,11,-106,-70,0,0,7,3
	Fend
	EndShape

	endc




;--Shape file ----- C:\SHED\SHAPES6\TOW_1.TXT ----
	ifne	DO_HDR

tow_1
	ShapeHdr	tow_1_P,0,tow_1_F,0,0,0,0,1,0,32,25,32,36,id_0_c,0,0,0,0,<tow_1>
	elseif
tow_1_P
	Pointsb	3
	pb	10,-25,-20	;0
	pb	-20,-25,0	;1
	pb	10,-25,20	;2
	PointsXb	12
	pb	16,0,-32	;3
	pb	-16,-5,-32	;5
	pb	-10,-15,-20	;7
	pb	5,15,-10	;9
	pb	10,15,0	;11
	pb	32,0,0	;13
	pb	32,-5,0	;15
	pb	20,-15,0	;17
	pb	5,15,10	;19
	pb	10,-15,20	;21
	pb	-16,0,32	;23
	pb	16,-5,32	;25

	EndPoints
tow_1_F
	Vizis	20
	Viz	11,19,24,-69,-101,34	;0
	Viz	17,21,22,0,127,0	;1
	Viz	9,10,12,0,-127,0	;2
	Viz	19,20,23,0,-105,72	;3
	Viz	14,23,20,69,-101,34	;4
	Viz	3,4,10,0,-105,-72	;5
	Viz	12,10,4,69,-101,-34	;6
	Viz	13,3,9,-69,-101,-34	;7
	Viz	22,21,25,0,98,81	;8
	Viz	26,16,18,77,93,39	;9
	Viz	5,6,8,0,98,-81	;10
	Viz	7,18,16,77,93,-39	;11
	Viz	21,17,15,-77,93,39	;12
	Viz	6,15,17,-77,93,-39	;13
	Viz	24,23,26,0,0,127	;14
	Viz	24,25,15,-114,0,57	;15
	Viz	14,16,26,114,0,57	;16
	Viz	6,5,4,0,0,-127	;17
	Viz	13,15,6,-114,0,-57	;18
	Viz	4,5,16,114,0,-57	;19
	BSPInit	tow_1_EBSP
	BSP	8,tow_1_f1,.bsp2
	BSP	9,tow_1_f3,.bsp4
	BSPE	tow_1_f5
.bsp4	BSPE	tow_1_f6
.bsp2	BSPE	tow_1_f7

tow_1_f1	Faces
	Face4	18,8,0,98,81,22,21,25,26
	FendQ
tow_1_f3	Faces
	Face4	16,9,77,93,39,26,16,18,22
	FendQ
tow_1_f5	Faces
	Face6	0,1,0,127,0,17,21,22,18,7,8
	Face4	16,10,0,98,-81,5,6,8,7
	Face4	18,13,-77,93,-39,6,15,17,8
	Face2	44,-1,0,0,0,0,8
	Face4	27,0,-69,-101,34,11,19,24,13
	Face6	43,2,0,-127,0,9,10,12,20,19,11
	Face4	25,3,0,-105,72,19,20,23,24
	Face4	23,4,69,-101,34,14,23,20,12
	Face4	23,5,0,-105,-72,3,4,10,9
	Face4	21,6,69,-101,-34,12,10,4,14
	Face4	25,7,-69,-101,-34,13,3,9,11
	Face4	14,11,77,93,-39,7,18,16,5
	Face4	20,12,-77,93,39,21,17,15,25
	Face4	44,14,0,0,127,24,23,26,25
	Face4	10,15,-114,0,57,24,25,15,13
	Face4	10,16,114,0,57,14,16,26,23
	Face4	10,17,0,0,-127,6,5,4,3
	Face4	44,18,-114,0,-57,13,15,6,3
	Face4	44,19,114,0,-57,4,5,16,14
	FendQ
tow_1_f6	Faces
	Face2	44,-1,0,0,0,1,18
	FendQ
tow_1_f7	Faces
	Face2	44,-1,0,0,0,2,21
	FendQ
tow_1_EBSP
	EndShape

	endc





;------------------------------------------------------------------------------
; contest mode shapes



	IFNE	CONTEST

;--Shape file ----- C:\SHED\SHAPES\TARGET_0.TXT ----
	ifne	DO_HDR

target_0
	ShapeHdr	target_0_P,0,target_0_F,0,25,0,0,0,0,20,60,10,60,id_0_c,0,0,0,0,<target_0>
	elseif
target_0_P
	Pointsb	3
	pb	0,0,-10	;0
	pb	0,-8,0	;1
	pb	0,-60,0	;2
	PointsXb	1
	pb	20,0,0	;3

	EndPoints
target_0_F
	Vizis	2
	Viz	0,3,1,-38,95,-76	;0
	Viz	1,4,0,38,95,-76	;1

target_0_f1	Faces
	Face3	20,0,-38,95,-76,0,3,1
	Face3	14,1,38,95,-76,1,4,0
	Face2	16,-1,0,0,0,1,2
	Fend
	EndShape

	endc
;--Shape file ----- C:\SHED\SHAPES\TARGET_1.TXT ----
	ifne	DO_HDR

target_1
	ShapeHdr	target_1_P,0,target_1_F,0,0,0,0,0,0,17,20,10,20,id_0_c,0,0,0,0,<target_1>
	elseif
target_1_P
	Pointsb	6
	pb	0,6,-10	;0
	pb	0,-6,-10	;1
	pb	0,14,-7	;2
	pb	0,-14,-7	;3
	pb	0,20,0	;4
	pb	0,-20,0	;5
	PointsXb	6
	pb	-5,3,-10	;6
	pb	-5,-3,-10	;8
	pb	-12,7,-7	;10
	pb	-12,-7,-7	;12
	pb	17,10,0	;14
	pb	17,-10,0	;16

	EndPoints
target_1_F
	Vizis	8
	Viz	5,17,12,52,88,-75	;0
	Viz	12,10,2,0,0,-127	;1
	Viz	2,10,15,52,-89,-75	;2
	Viz	3,13,16,-52,89,-75	;3
	Viz	4,14,11,-52,-88,-75	;4
	Viz	10,12,17,103,0,-74	;5
	Viz	14,16,13,-103,0,-74	;6
	Viz	1,8,6,0,0,-127	;7

target_1_f1	Faces
	Face6	16,1,0,0,-127,12,10,2,11,13,3
	Face4	25,0,52,88,-75,5,17,12,3
	Face4	21,2,52,-89,-75,2,10,15,4
	Face4	27,3,-52,89,-75,3,13,16,5
	Face4	23,4,-52,-88,-75,4,14,11,2
	Face4	23,5,103,0,-74,10,12,17,15
	Face4	25,6,-103,0,-74,14,16,13,11
	Face6	21,7,0,0,-127,1,8,6,0,7,9
	Fend
	EndShape

	endc

;**************************************************************************
;*
;**************************************************************************
 ;--Shape file ----- C:\SHED\SHAPES\TARGET_2.ANM ----
	ifne	DO_HDR

target_2
	ShapeHdr	target_2_P,0,target_2_F,0,0,0,0,0,0,76,81,10,92,id_0_c,0,0,0,0,<target_2>
	elseif
target_2_P
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
	pb	-36,-46,-7	;0
	pb	39,-35,-7	;1
	pb	-36,-6,0	;2
	pb	19,0,0	;3
	pb	-51,-56,0	;4
	pb	56,-36,0	;5
	pb	-36,-46,7	;6
	pb	39,-35,7	;7
	PointsXb	9
	pb	3,-27,-10	;8
	pb	6,-33,-10	;10
	pb	-3,-39,-10	;12
	pb	-7,-19,-7	;14
	pb	14,-33,-7	;16
	pb	7,-47,-7	;18
	pb	-10,-13,0	;20
	pb	20,-33,0	;22
	pb	10,-53,0	;24
	jump	.EB0
.A1A	Pointsb	8
	pb	-33,-57,-7	;0
	pb	39,-37,-7	;1
	pb	-64,-31,0	;2
	pb	25,0,0	;3
	pb	-36,-75,0	;4
	pb	56,-41,0	;5
	pb	-33,-57,7	;6
	pb	39,-37,7	;7
	PointsXb	9
	pb	3,-34,-10	;8
	pb	6,-40,-10	;10
	pb	-3,-46,-10	;12
	pb	-7,-26,-7	;14
	pb	14,-40,-7	;16
	pb	7,-54,-7	;18
	pb	-10,-20,0	;20
	pb	20,-40,0	;22
	pb	10,-60,0	;24
	jump	.EB0
.A2A	Pointsb	8
	pb	-30,-63,-7	;0
	pb	39,-40,-7	;1
	pb	-68,-49,0	;2
	pb	39,0,0	;3
	pb	-27,-81,0	;4
	pb	54,-50,0	;5
	pb	-30,-63,7	;6
	pb	39,-40,7	;7
	PointsXb	9
	pb	3,-37,-10	;8
	pb	6,-43,-10	;10
	pb	-3,-49,-10	;12
	pb	-7,-29,-7	;14
	pb	14,-43,-7	;16
	pb	7,-57,-7	;18
	pb	-10,-23,0	;20
	pb	20,-43,0	;22
	pb	10,-63,0	;24
	jump	.EB0
.A3A	Pointsb	8
	pb	-27,-64,-7	;0
	pb	39,-40,-7	;1
	pb	-66,-64,0	;2
	pb	46,0,0	;3
	pb	-17,-79,0	;4
	pb	52,-53,0	;5
	pb	-27,-64,7	;6
	pb	39,-40,7	;7
	PointsXb	9
	pb	3,-36,-10	;8
	pb	6,-42,-10	;10
	pb	-3,-48,-10	;12
	pb	-7,-28,-7	;14
	pb	14,-42,-7	;16
	pb	7,-56,-7	;18
	pb	-10,-22,0	;20
	pb	20,-42,0	;22
	pb	10,-62,0	;24
	jump	.EB0
.A4A	Pointsb	8
	pb	-33,-53,-7	;0
	pb	39,-38,-7	;1
	pb	-73,-53,0	;2
	pb	53,0,0	;3
	pb	-24,-68,0	;4
	pb	50,-52,0	;5
	pb	-33,-53,7	;6
	pb	39,-38,7	;7
	PointsXb	9
	pb	3,-30,-10	;8
	pb	6,-36,-10	;10
	pb	-3,-42,-10	;12
	pb	-7,-22,-7	;14
	pb	14,-36,-7	;16
	pb	7,-50,-7	;18
	pb	-10,-16,0	;20
	pb	20,-36,0	;22
	pb	10,-56,0	;24
	jump	.EB0
.A5A	Pointsb	8
	pb	-38,-42,-7	;0
	pb	39,-35,-7	;1
	pb	-76,-36,0	;2
	pb	59,0,0	;3
	pb	-31,-59,0	;4
	pb	47,-51,0	;5
	pb	-38,-42,7	;6
	pb	39,-35,7	;7
	PointsXb	9
	pb	3,-27,-10	;8
	pb	6,-33,-10	;10
	pb	-3,-39,-10	;12
	pb	-7,-19,-7	;14
	pb	14,-33,-7	;16
	pb	7,-47,-7	;18
	pb	-10,-13,0	;20
	pb	20,-33,0	;22
	pb	10,-53,0	;24
	jump	.EB0
.A6A	Pointsb	8
	pb	-39,-34,-7	;0
	pb	39,-31,-7	;1
	pb	-74,-14,0	;2
	pb	65,0,0	;3
	pb	-38,-52,0	;4
	pb	44,-48,0	;5
	pb	-39,-34,7	;6
	pb	39,-31,7	;7
	PointsXb	9
	pb	3,-23,-10	;8
	pb	6,-29,-10	;10
	pb	-3,-35,-10	;12
	pb	-7,-15,-7	;14
	pb	14,-29,-7	;16
	pb	7,-43,-7	;18
	pb	-10,-9,0	;20
	pb	20,-29,0	;22
	pb	10,-49,0	;24
	jump	.EB0
.A7A	Pointsb	8
	pb	-39,-31,-7	;0
	pb	38,-37,-7	;1
	pb	-65,0,0	;2
	pb	73,-17,0	;3
	pb	-44,-48,0	;4
	pb	37,-55,0	;5
	pb	-39,-31,7	;6
	pb	38,-37,7	;7
	PointsXb	9
	pb	3,-25,-10	;8
	pb	6,-31,-10	;10
	pb	-3,-37,-10	;12
	pb	-7,-17,-7	;14
	pb	14,-31,-7	;16
	pb	7,-45,-7	;18
	pb	-10,-11,0	;20
	pb	20,-31,0	;22
	pb	10,-51,0	;24
	jump	.EB0
.A8A	Pointsb	8
	pb	-39,-40,-7	;0
	pb	37,-50,-7	;1
	pb	-39,0,0	;2
	pb	57,-15,0	;3
	pb	-54,-50,0	;4
	pb	45,-66,0	;5
	pb	-39,-40,7	;6
	pb	37,-50,7	;7
	PointsXb	9
	pb	3,-34,-10	;8
	pb	6,-40,-10	;10
	pb	-3,-46,-10	;12
	pb	-7,-26,-7	;14
	pb	14,-40,-7	;16
	pb	7,-54,-7	;18
	pb	-10,-20,0	;20
	pb	20,-40,0	;22
	pb	10,-60,0	;24
	jump	.EB0
.A9A	Pointsb	8
	pb	-39,-39,-7	;0
	pb	37,-49,-7	;1
	pb	-32,0,0	;2
	pb	44,-9,0	;3
	pb	-55,-46,0	;4
	pb	50,-61,0	;5
	pb	-39,-39,7	;6
	pb	37,-49,7	;7
	PointsXb	9
	pb	3,-33,-10	;8
	pb	6,-39,-10	;10
	pb	-3,-45,-10	;12
	pb	-7,-25,-7	;14
	pb	14,-39,-7	;16
	pb	7,-53,-7	;18
	pb	-10,-19,0	;20
	pb	20,-39,0	;22
	pb	10,-59,0	;24
	jump	.EB0
.A10A	Pointsb	8
	pb	-39,-35,-7	;0
	pb	38,-45,-7	;1
	pb	-19,0,0	;2
	pb	31,-5,0	;3
	pb	-57,-36,0	;4
	pb	54,-52,0	;5
	pb	-39,-35,7	;6
	pb	38,-45,7	;7
	PointsXb	9
	pb	3,-33,-10	;8
	pb	6,-39,-10	;10
	pb	-3,-45,-10	;12
	pb	-7,-25,-7	;14
	pb	14,-39,-7	;16
	pb	7,-53,-7	;18
	pb	-10,-19,0	;20
	pb	20,-39,0	;22
	pb	10,-59,0	;24
	jump	.EB0
.A11A	Pointsb	8
	pb	-39,-35,-7	;0
	pb	38,-36,-7	;1
	pb	-19,0,0	;2
	pb	18,-1,0	;3
	pb	-56,-36,0	;4
	pb	56,-37,0	;5
	pb	-39,-35,7	;6
	pb	38,-36,7	;7
	PointsXb	9
	pb	3,-24,-10	;8
	pb	6,-30,-10	;10
	pb	-3,-36,-10	;12
	pb	-7,-16,-7	;14
	pb	14,-30,-7	;16
	pb	7,-44,-7	;18
	pb	-10,-10,0	;20
	pb	20,-30,0	;22
	pb	10,-50,0	;24
.EB0

	EndPoints
target_2_F
	Vizis	14
	Viz	16,15,21,-90,-45,-77	;132
	Viz	16,18,19,0,0,-127	;133
	Viz	23,20,14,90,-45,-77	;134
	Viz	22,24,18,-90,45,-77	;135
	Viz	17,19,25,90,45,-77	;136
	Viz	20,21,15,0,-96,-83	;137
	Viz	19,18,24,0,96,-83	;138
	Viz	0,2,6,-127,0,0	;141
	Viz	4,2,0,63,-19,-108	;142
	Viz	0,6,4,-70,106,0	;143
	Viz	7,3,1,110,63,0	;146
	Viz	1,3,5,-47,-48,-108	;147
	Viz	5,7,1,7,127,0	;148
	Viz	13,12,11,0,0,-127	;149
	BSPInit	target_2_EBSP
	BSP	0,target_2_f1,.bsp2
	BSPE	target_2_f3
.bsp2	BSPE	target_2_f4

target_2_f1	Faces
	Face4	25,0,-90,-45,-77,16,15,21,22
	FendQ
target_2_f3	Faces
	Face4	21,2,90,-45,-77,23,20,14,17
	Face4	23,4,90,45,-77,17,19,25,23
	Face4	23,5,0,-96,-83,20,21,15,14
	Face3	14,7,-127,0,0,0,2,6
	Face3	20,9,-70,106,0,0,6,4
	Face2	18,-1,63,-19,-108,17,0
	Face2	14,-1,-127,0,0,23,4
	Face6	16,1,0,0,-127,16,18,19,17,14,15
	Face4	27,3,-90,45,-77,22,24,18,16
	Face4	25,6,0,96,-83,19,18,24,25
	Face3	18,8,63,-19,-108,4,2,0
	Face6	21,13,0,0,-127,13,12,11,9,8,10
	FendQ
target_2_f4	Faces
	Face3	14,10,110,63,0,7,3,1
	Face2	18,-1,0,-96,-83,1,16
	Face2	14,-1,90,45,-77,5,22
	Face3	20,12,7,127,0,5,7,1
	Face3	18,11,-47,-48,-108,1,3,5
	FendQ
target_2_EBSP
	EndShape

	endc
;************************************************************************
;*
;************************************************************************
;--Shape file ----- C:\SHED\SHAPES\TARGET_3.TXT ----
	ifne	DO_HDR

target_3
	ShapeHdr	target_3_P,0,target_3_F,0,0,0,0,0,0,43,50,20,54,id_0_c,0,0,0,0,<target_3>
	elseif
target_3_P
	Pointsb	7
	pb	0,6,-10	;0
	pb	0,-6,-10	;1
	pb	0,14,-7	;2
	pb	0,-14,-7	;3
	pb	0,20,0	;4
	pb	0,-40,10	;5
	pb	0,-50,20	;6
	PointsXb	10
	pb	-6,3,-10	;7
	pb	-6,-3,-10	;9
	pb	-14,7,-7	;11
	pb	-14,-7,-7	;13
	pb	-14,13,0	;15
	pb	-20,4,0	;17
	pb	-20,-10,0	;19
	pb	-6,-17,0	;21
	pb	-35,20,10	;23
	pb	-43,25,20	;25

	EndPoints
target_3_F
	Vizis	14
	Viz	19,13,3,45,90,-77	;0
	Viz	13,11,2,0,0,-127	;1
	Viz	11,13,19,96,0,-83	;2
	Viz	22,3,14,-45,90,-77	;3
	Viz	18,20,14,-96,0,-83	;4
	Viz	24,18,12,-88,28,-87	;5
	Viz	5,21,3,73,57,-87	;6
	Viz	3,22,5,-73,57,-87	;7
	Viz	11,17,23,88,28,-87	;8
	Viz	4,2,11,45,-90,-77	;9
	Viz	23,15,11,7,-96,-83	;10
	Viz	16,12,2,-45,-90,-77	;11
	Viz	12,16,24,-7,-96,-83	;12
	Viz	1,9,7,0,0,-127	;16
	BSPInit	target_3_EBSP
	BSP	1,target_3_f1,.bsp2
	BSP	6,target_3_f3,.bsp4
	BSP	10,target_3_f5,.bsp6
	BSPE	target_3_f7
.bsp6	BSP	12,target_3_f8,.bsp9
	BSPE	target_3_f10
.bsp9	BSPE	target_3_f11
.bsp4	BSPE	target_3_f12
.bsp2	BSPE	target_3_f13

target_3_f1	Faces
	Face6	16,1,0,0,-127,13,11,2,12,14,3
	FendQ
target_3_f3	Faces
	Face3	16,6,73,57,-87,5,21,3
	FendQ
target_3_f5	Faces
	Face3	12,10,7,-96,-83,23,15,11
	FendQ
target_3_f7	Faces
	Face4	25,4,-96,0,-83,18,20,14,12
	Face3	18,5,-88,28,-87,24,18,12
	Face2	43,-1,90,-45,-77,24,26
	Face4	27,3,-45,90,-77,22,3,14,20
	FendQ
target_3_f8	Faces
	Face3	12,12,-7,-96,-83,12,16,24
	FendQ
target_3_f10	Faces
	Face3	16,8,88,28,-87,11,17,23
	Face2	43,-1,-90,45,-77,25,23
	FendQ
target_3_f11	Faces
	Face4	21,9,45,-90,-77,4,2,11,15
	Face4	23,11,-45,-90,-77,16,12,2,4
	FendQ
target_3_f12	Faces
	Face4	25,0,45,90,-77,19,13,3,21
	Face2	43,-1,90,45,-77,5,6
	Face4	23,2,96,0,-83,11,13,19,17
	Face3	20,7,-73,57,-87,3,22,5
	FendQ
target_3_f13	Faces
	Face6	21,13,0,0,-127,1,9,7,0,8,10
	FendQ
target_3_EBSP
	EndShape

	endc

 ;--Shape file ----- C:\SHED\SHAPES\PILON_1.TXT ----
	ifne	DO_HDR

pilon_1
	ShapeHdr	pilon_1_P,0,pilon_1_F,0,0,0,0,0,0,15,30,15,30,id_0_c,0,0,0,0,<pilon_1>
	elseif
pilon_1_P
	Pointsb	6
	pb	0,5,-15	;0
	pb	0,-5,-15	;1
	pb	0,30,0	;2
	pb	0,-30,0	;3
	pb	0,5,15	;4
	pb	0,-5,15	;5
	PointsXb	2
	pb	15,5,0	;6
	pb	-15,-5,0	;8

	EndPoints
pilon_1_F
	Vizis	12
	Viz	8,1,3,83,50,-83	;0
	Viz	3,5,8,83,50,83	;1
	Viz	3,1,9,-83,50,-83	;2
	Viz	9,5,3,-83,50,83	;3
	Viz	6,0,2,-83,-50,-83	;4
	Viz	2,4,6,-83,-50,83	;5
	Viz	2,0,7,83,-50,-83	;6
	Viz	7,4,2,83,-50,83	;7
	Viz	8,7,0,90,0,-90	;8
	Viz	1,0,6,-90,0,-90	;9
	Viz	5,4,7,90,0,90	;10
	Viz	9,6,4,-90,0,90	;11

pilon_1_f1	Faces
	Face3	14,0,83,50,-83,8,1,3
	Face3	18,1,83,50,83,3,5,8
	Face3	18,2,-83,50,-83,3,1,9
	Face3	20,3,-83,50,83,9,5,3
	Face3	14,4,-83,-50,-83,6,0,2
	Face3	18,5,-83,-50,83,2,4,6
	Face3	12,6,83,-50,-83,2,0,7
	Face3	14,7,83,-50,83,7,4,2
	Face4	44,8,90,0,-90,8,7,0,1
	Face4	44,9,-90,0,-90,1,0,6,9
	Face4	44,10,90,0,90,5,4,7,8
	Face4	44,11,-90,0,90,9,6,4,5
	Fend
	EndShape

	endc


	ENDC

	end_shapes









