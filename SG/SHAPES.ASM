
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
	shapehdr	WALL1_P,0,WALL1_F,0,0,0,0,3,0,11,40,110,119,normal_c,0,0,0,wall1_s1,<WALL2>
WALL_l
	shapehdr	WALL1_P,0,WALL1_F,0,0,0,0,3,walll_col1,110,40,11,119,normal_c,0,0,0,0,<WALLL>
WALL_r
	shapehdr	WALL1_P,0,WALL1_F,0,0,0,0,3,wallr_col1,110,40,11,119,normal_c,0,0,0,0,<WALLR>
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

	IFEQ	1
;--Shape file ----- shapes\floor1_s.txt ----
	ifne	DO_HDR

floor2_s
	shapehdr_s	floor1_s_P,0,floor1_s_F,0,0,0,0,1,0,100,29,10,59,id_5_c,0,0,0,0,<floor2_s>
floor1_s
	shapehdr_s	floor1_s_P,0,floor2_s_F,0,0,0,0,1,0,100,29,10,59,id_5_c,0,0,0,0,<floor1_s>
	elseif
floor1_s_P
	datahdr
	PointsXb	3
	pby2	100,0,-10	;0
	pby2	-100,-19,-10	;2
	pby2	90,-29,0	;4

	EndPoints
floor1_s_F
	Vizis	2
	Viz	3,4,5,0,90,-90	;0
	Viz	2,1,0,0,0,-127	;1

floor1_s_f1	Faces
	Face4	12,0,0,90,-90,3,4,5,2
	Face4	6,1,0,0,-127,2,1,0,3
	Fend
	EndShape

floor2_s_F
	Vizis	2
	Viz	3,4,5,0,90,-90	;0
	Viz	2,1,0,0,0,-127	;1

floor2_s_f1	Faces
	Face4	12,0,0,90,-90,3,4,5,2
	Face4	15,1,0,0,-127,2,1,0,3
	Fend
	EndShape

	endc
	ifeq	1
;--Shape file ----- shapes\floor2.txt ----
	ifne	DO_HDR

floor2
	shapehdr	floor1_P,0,floor1_F,0,0,0,0,1,floor2_col1,100,100*2,10,97,id_5_c,0,floor2_s,floor2_s,floor2_s,<floor2>
	elseif
floor2_P
	datahdr
	PointsXb	4
	pby2	60,0,-10	;0
	pby2	100,0,-10	;2
	pby2	60,0,10	;4
	pby2	-100,0,10	;6
	Frames	8
	jumptab	.A7A
	jumptab	.A6A
	jumptab	.A5A
	jumptab	.A4A
	jumptab	.A3A
	jumptab	.A2A
	jumptab	.A1A
	jumptab	.A0A
.A0A	PointsXb	5
	pby2	60,-35,-10	;8
	pby2	-100,-56,-10	;10
	pby2	90,-66,0	;12
	pby2	60,-35,10	;14
	pby2	100,-56,10	;16
	jump	.EB0
.A1A	PointsXb	5
	pby2	60,-30,-10	;8
	pby2	-100,-51,-10	;10
	pby2	90,-61,0	;12
	pby2	60,-30,10	;14
	pby2	100,-51,10	;16
	jump	.EB0
.A2A	PointsXb	5
	pby2	60,-26,-10	;8
	pby2	-100,-47,-10	;10
	pby2	90,-57,0	;12
	pby2	60,-26,10	;14
	pby2	100,-47,10	;16
	jump	.EB0
.A3A	PointsXb	5
	pby2	60,-20,-10	;8
	pby2	-100,-41,-10	;10
	pby2	90,-51,0	;12
	pby2	60,-20,10	;14
	pby2	100,-41,10	;16
	jump	.EB0
.A4A	PointsXb	5
	pby2	60,-16,-10	;8
	pby2	-100,-37,-10	;10
	pby2	90,-47,0	;12
	pby2	60,-16,10	;14
	pby2	100,-37,10	;16
	jump	.EB0
.A5A	PointsXb	5
	pby2	60,-10,-10	;8
	pby2	-100,-31,-10	;10
	pby2	90,-41,0	;12
	pby2	60,-10,10	;14
	pby2	100,-31,10	;16
	jump	.EB0
.A6A	PointsXb	5
	pby2	60,-6,-10	;8
	pby2	-100,-27,-10	;10
	pby2	90,-37,0	;12
	pby2	60,-6,10	;14
	pby2	100,-27,10	;16
	jump	.EB0
.A7A	PointsXb	5
	pby2	60,0,-10	;8
	pby2	-100,-21,-10	;10
	pby2	90,-31,0	;12
	pby2	60,0,10	;14
	pby2	100,-21,10	;16
.EB0

	EndPoints
floor2_F
	Vizis	15
	Viz	15,14,8,0,-127,0	;0
	Viz	5,15,9,-127,0,0	;1
	Viz	6,17,15,0,0,127	;2
	Viz	4,14,16,0,0,127	;3
	Viz	16,14,15,0,0,127	;4
	Viz	9,10,3,0,0,-127	;5
	Viz	2,11,8,0,0,-127	;6
	Viz	9,8,11,0,0,-127	;7
	Viz	8,14,4,127,0,0	;8
	Viz	7,16,11,-127,0,0	;9
	Viz	3,10,17,127,0,0	;10
	Viz	11,12,13,0,90,-90	;11
	Viz	13,12,16,0,90,90	;12
	Viz	16,12,11,-90,90,0	;13
	Viz	10,13,17,90,90,0	;14

floor2_f1	Faces
	Face4	15,0,0,-127,0,15,14,8,9
	Face4	15,1,-127,0,0,15,9,1,5
	Face4	15,8,127,0,0,8,14,4,0
	Face4	15,2,0,0,127,6,17,15,5
	Face4	15,3,0,0,127,4,14,16,7
	Face4	15,4,0,0,127,16,14,15,17
	Face4	15,5,0,0,-127,9,10,3,1
	Face4	15,6,0,0,-127,11,8,0,2
	Face4	15,7,0,0,-127,9,8,11,10
	Face4	6,9,-127,0,0,7,16,11,2
	Face4	6,10,127,0,0,3,10,17,6
	Face4	12,11,0,90,-90,11,12,13,10
	Face4	12,12,0,90,90,13,12,16,17
	Face3	12,13,-90,90,0,16,12,11
	Face3	12,14,90,90,0,10,13,17
	Fend
	EndShape

	endc
;--Shape file ----- shapes\floor1.txt ----
	ifne	DO_HDR

floor1
	shapehdr	floor2_P,0,floor2_F,0,0,0,0,1,floor1_col1,100,100*2,10,101,id_5_c,0,floor1_s,floor1_s,floor1_s,<floor1>
	elseif
floor1_P
	datahdr
	PointsXb	2
	pby2	100,0,-10	;0
	pby2	-100,0,10	;2
	Frames	8
	jumptab	.A0A
;	jumptab	.A1A
	jumptab	.A2A
;	jumptab	.A3A
	jumptab	.A4A
;	jumptab	.A5A
	jumptab	.A6A
;	jumptab	.A7A
	jumptab	.A8A
;	jumptab	.A9A
	jumptab	.A10A
;	jumptab	.A11A
	jumptab	.A12A
;	jumptab	.A13A
	jumptab	.A14A
;	jumptab	.A15A
.A0A	PointsXb	3
	pby2	-100,-19,-10	;4
	pby2	90,-29,0	;6
	pby2	100,-19,10	;8
	jump	.EB0
.A1A	PointsXb	3
	pby2	-100,-21,-10	;4
	pby2	90,-31,0	;6
	pby2	100,-21,10	;8
	jump	.EB0
.A2A	PointsXb	3
	pby2	-100,-23,-10	;4
	pby2	90,-33,0	;6
	pby2	100,-23,10	;8
	jump	.EB0
.A3A	PointsXb	3
	pby2	-100,-25,-10	;4
	pby2	90,-35,0	;6
	pby2	100,-25,10	;8
	jump	.EB0
.A4A	PointsXb	3
	pby2	-100,-27,-10	;4
	pby2	90,-37,0	;6
	pby2	100,-27,10	;8
	jump	.EB0
.A5A	PointsXb	3
	pby2	-100,-29,-10	;4
	pby2	90,-39,0	;6
	pby2	100,-29,10	;8
	jump	.EB0
.A6A	PointsXb	3
	pby2	-100,-31,-10	;4
	pby2	90,-41,0	;6
	pby2	100,-31,10	;8
	jump	.EB0
.A7A	PointsXb	3
	pby2	-100,-33,-10	;4
	pby2	90,-43,0	;6
	pby2	100,-33,10	;8
	jump	.EB0
.A8A	PointsXb	3
	pby2	-100,-35,-10	;4
	pby2	90,-45,0	;6
	pby2	100,-35,10	;8
	jump	.EB0
.A9A	PointsXb	3
	pby2	-100,-37,-10	;4
	pby2	90,-47,0	;6
	pby2	100,-37,10	;8
	jump	.EB0
.A10A	PointsXb	3
	pby2	-100,-39,-10	;4
	pby2	90,-49,0	;6
	pby2	100,-39,10	;8
	jump	.EB0
.A11A	PointsXb	3
	pby2	-100,-42,-10	;4
	pby2	90,-52,0	;6
	pby2	100,-42,10	;8
	jump	.EB0
.A12A	PointsXb	3
	pby2	-100,-44,-10	;4
	pby2	90,-54,0	;6
	pby2	100,-44,10	;8
	jump	.EB0
.A13A	PointsXb	3
	pby2	-100,-46,-10	;4
	pby2	90,-56,0	;6
	pby2	100,-46,10	;8
	jump	.EB0
.A14A	PointsXb	3
	pby2	-100,-48,-10	;4
	pby2	90,-58,0	;6
	pby2	100,-48,10	;8
	jump	.EB0
.A15A	PointsXb	3
	pby2	-100,-52,-10	;4
	pby2	90,-62,0	;6
	pby2	100,-52,10	;8
.EB0

	EndPoints
floor1_F
	Vizis	8
	Viz	4,7,9,90,90,0	;0
	Viz	8,6,5,-90,90,0	;1
	Viz	7,6,8,0,90,90	;2
	Viz	5,6,7,0,90,-90	;3
	Viz	1,4,9,127,0,0	;4
	Viz	3,8,5,-127,0,0	;5
	Viz	2,9,8,0,0,127	;6
	Viz	4,1,0,0,0,-127	;7

floor1_f1	Faces
	Face3	12,0,90,90,0,4,7,9
	Face3	12,1,-90,90,0,8,6,5
	Face4	12,2,0,90,90,7,6,8,9
	Face4	12,3,0,90,-90,5,6,7,4
	Face4	6,4,127,0,0,1,4,9,2
	Face4	6,5,-127,0,0,3,8,5,0
	Face4	6,6,0,0,127,2,9,8,3
	Face4	6,7,0,0,-127,4,1,0,5
	Fend
	EndShape

	endc
	endc

;--Shape file ----- shapes\beambox.txt ----
	ifne	DO_HDR

beambox
	shapehdr	BEAMBOX_P,0,BEAMBOX_F,0,0,0,0,0,beambox_col1,100,98,30,97,id_0_c,0,0,0,0,<BEAMBOX>
	elseif
beambox_P
	datahdr
	Pointsb	8
	pb	69,0,-5	;0
	pb	-70,0,-5	;1
	pb	59,-61,-5	;2
	pb	-60,-61,-5	;3
	pb	69,0,5	;4
	pb	-70,0,5	;5
	pb	59,-61,5	;6
	pb	-60,-61,5	;7
	PointsXb	7
	pb	100,0,-5	;8
	pb	100,-51,-5	;10
	pb	100,0,5	;12
	pb	80,-10,5	;14
	pb	90,-20,5	;16
	pb	70,-50,5	;18
	pb	100,-51,5	;20
	Frames	4
	jumptab	.A0A
	jumptab	.A1A
	jumptab	.A2A
	jumptab	.A3A
.A0A	Pointsb	8
	pb	36,-12,-10	;22
	pb	-22,-25,-10	;23
	pb	7,-85,-10	;24
	pb	-43,-17,0	;25
	pb	-12,-78,0	;26
	pb	21,-73,10	;27
	pb	-30,-74,10	;28
	pb	40,-80,10	;29
	jump	.EB0
.A1A	Pointsb	8
	pb	28,-96,-10	;22
	pb	-34,-75,-10	;23
	pb	-5,-65,-10	;24
	pb	-44,-73,0	;25
	pb	-20,-60,0	;26
	pb	5,-53,10	;27
	pb	-43,-26,10	;28
	pb	35,-33,10	;29
	jump	.EB0
.A2A	Pointsb	8
	pb	29,-65,-10	;22
	pb	-31,-33,-10	;23
	pb	3,-98,-10	;24
	pb	-31,-47,0	;25
	pb	-12,-24,0	;26
	pb	5,-37,10	;27
	pb	-21,-63,10	;28
	pb	37,-49,10	;29
	jump	.EB0
.A3A	Pointsb	8
	pb	29,-35,-10	;22
	pb	-22,-85,-10	;23
	pb	12,-45,-10	;24
	pb	-40,-22,0	;25
	pb	1,-86,0	;26
	pb	7,-61,10	;27
	pb	-8,-20,10	;28
	pb	39,-73,10	;29
.EB0

	EndPoints
beambox_F
	Vizis	12
	Viz	6,20,12,0,0,127	;0
	Viz	21,7,5,0,0,127	;1
	Viz	8,10,2,0,0,-127	;2
	Viz	1,3,11,0,0,-127	;3
	Viz	12,20,10,-127,0,0	;4
	Viz	2,6,4,125,-21,0	;5
	Viz	5,7,3,-125,-21,0	;6
	Viz	11,21,13,127,0,0	;7
	Viz	2,10,20,-30,123,0	;8
	Viz	11,3,7,31,123,0	;9
	Viz	15,17,19,0,0,127	;21
	Viz	18,16,14,0,0,127	;22

beambox_f1	Faces
	Face4	5,5,125,-21,0,2,6,4,0
	Face4	5,6,-125,-21,0,5,7,3,1
	Face4	2,0,0,0,127,6,20,12,4
	Face4	2,1,0,0,127,21,7,5,13
	Face4	2,2,0,0,-127,8,10,2,0
	Face4	2,3,0,0,-127,1,3,11,9
	Face4	5,8,-30,123,0,2,10,20,6
	Face4	5,9,31,123,0,11,3,7,21
	Face3	15,10,0,0,127,15,17,19
	Face3	15,11,0,0,127,18,16,14
	Face2	15,-1,0,0,0,2,26
	Face2	15,-1,0,0,0,26,25
	Face2	15,-1,0,0,0,25,3
	Face2	15,-1,0,0,0,6,29
	Face2	15,-1,0,0,0,29,24
	Face2	15,-1,0,0,0,24,28
	Face2	15,-1,0,0,0,28,7
	Face2	15,-1,0,0,0,6,22
	Face2	15,-1,0,0,0,22,27
	Face2	15,-1,0,0,0,27,23
	Face2	15,-1,0,0,0,23,7
	Face4	5,4,-127,0,0,12,20,10,8
	Face4	5,7,127,0,0,11,21,13,9
	Fend
	EndShape

	endc
;--Shape file ----- shapes\beambox2.txt ----
	ifne	DO_HDR

beambox2
	shapehdr	BEAMBOX2_P,0,BEAMBOX2_F,0,0,0,0,0,beambox_col2,100,61,30,88,id_0_c,0,0,0,0,<BEAMBOX2>
	elseif
beambox2_P
	datahdr
	Pointsb	8
	pb	69,0,-5	;0
	pb	-70,0,-5	;1
	pb	59,-61,-5	;2
	pb	-60,-61,-5	;3
	pb	69,0,5	;4
	pb	-70,0,5	;5
	pb	59,-61,5	;6
	pb	-60,-61,5	;7
	PointsXb	4
	pb	100,0,-5	;8
	pb	100,-51,-5	;10
	pb	100,0,5	;12
	pb	100,-51,5	;14
	Frames	4
	jumptab	.A0A
	jumptab	.A1A
	jumptab	.A2A
	jumptab	.A3A
.A0A	Pointsb	4
	pb	80,-10,5	;16
	pb	-80,-10,5	;17
	pb	70,-50,5	;18
	pb	-70,-50,5	;19
	PointsXb	1
	pb	90,-20,5	;20
	jump	.EB0
.A1A	Pointsb	4
	pb	80,-10,5	;16
	pb	-80,-10,5	;17
	pb	70,-50,5	;18
	pb	-70,-50,5	;19
	PointsXb	1
	pb	90,-20,5	;20
	jump	.EB0
.A2A	Pointsb	4
	pb	80,-10,5	;16
	pb	-80,-10,5	;17
	pb	70,-50,5	;18
	pb	-70,-50,5	;19
	PointsXb	1
	pb	90,-20,5	;20
	jump	.EB0
.A3A	Pointsb	4
	pb	70,-20,5	;16
	pb	-71,-20,5	;17
	pb	90,-40,5	;18
	pb	-90,-41,5	;19
	PointsXb	1
	pb	80,-10,5	;20
.EB0

	EndPoints
beambox2_F
	Vizis	12
	Viz	6,14,12,0,0,127	;0
	Viz	15,7,5,0,0,127	;1
	Viz	8,10,2,0,0,-127	;2
	Viz	1,3,11,0,0,-127	;3
	Viz	12,14,10,-127,0,0	;4
	Viz	2,6,4,125,-21,0	;5
	Viz	5,7,3,-125,-21,0	;6
	Viz	11,15,13,127,0,0	;7
	Viz	2,10,14,-30,123,0	;8
	Viz	11,3,7,31,123,0	;9
	Viz	17,21,19,0,0,127	;10
	Viz	18,20,16,0,0,127	;11

beambox2_f1	Faces
	Face4	5,5,125,-21,0,2,6,4,0
	Face4	5,6,-125,-21,0,5,7,3,1
	Face4	2,0,0,0,127,6,14,12,4
	Face4	2,1,0,0,127,15,7,5,13
	Face4	2,2,0,0,-127,8,10,2,0
	Face4	2,3,0,0,-127,1,3,11,9
	Face4	5,4,-127,0,0,12,14,10,8
	Face4	5,7,127,0,0,11,15,13,9
	Face4	5,8,-30,123,0,2,10,14,6
	Face4	5,9,31,123,0,11,3,7,15
	Face3	15,10,0,0,127,17,21,19
	Face3	15,11,0,0,127,18,20,16
	Fend
	EndShape

	endc


	ENDC


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

BOSS_5_1u	shapehdr	BOSS_5_1_P,0,BOSS_5_1_F,0,0,0,0,boss5_scale,boss_5_1u_col,35,20,20,24,id_0_c,0,0,0,0,<BOSS_5_1u>
BOSS_5_1d	shapehdr	BOSS_5_1_P,0,BOSS_5_1_F,0,0,0,0,boss5_scale,boss_5_1d_col,35,20,20,24,id_0_c,0,0,0,0,<BOSS_5_1d>
BOSS_5_1l	shapehdr	BOSS_5_1_P,0,BOSS_5_1_F,0,0,0,0,boss5_scale,boss_5_1l_col,35,20,20,24,id_0_c,0,0,0,0,<BOSS_5_1l>
BOSS_5_1r	shapehdr	BOSS_5_1_P,0,BOSS_5_1_F,0,0,0,0,boss5_scale,boss_5_1r_col,35,20,20,24,id_0_c,0,0,0,0,<BOSS_5_1r>
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
	ShapeHdr	drail_4_P,0,drail_4_F,0,0,0,0,2,0,10,5,10,11,id_0_c,0,0,0,0,<rail_4>
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
	shapehdr	MISSILE_P,0,MISSILE_F,0,0,0,0,2,0,12,15,30,36,id_0_c,0,0,0,0,<LMISSILE>
missile	shapehdr	MISSILE_P,0,MISSILE_F,0,0,0,0,1,0,12,15,30,36,id_0_c,0,0,0,0,<MISSILE>
vortex2	shapehdr	MISSILE_P,0,MISSILE_F,0,0,0,0,1,0,12,15,30,36,vortex2_c,0,0,0,0,<vortex2>
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
	

	end_shapes









