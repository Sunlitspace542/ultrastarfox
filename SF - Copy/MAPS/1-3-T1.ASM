;1-3-T1
;WALL

	mapwait	0500
	mapobj	0000,090,-120,3000,tunnel_0,topright1_istrat
	mapobj	0000,-90,-120,3000,tunnel_0,topleft1_istrat
	mapobj	0000,0000,-020,3000,WALL_0,HARD180yr_ISTRAT
	mapobj	0000,090,0,4000,tunnel_0,botright1_istrat
	mapobj	0000,-90,0,4000,tunnel_0,botleft1_istrat
	mapobj	0500,0000,-100,4000,WALL_0,HARD180yr_ISTRAT
.tunnel2	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
	mapobj	0000,090,0,4000,tunnel_0,botright1_istrat
	mapobj	0700,-90,0,4000,tunnel_0,botleft1_istrat
	maploop	.tunnel2,02
	mapobj	0000,0060,-060,4000,wall_2,HARD180yr_ISTRAT
	mapobj	0700,-060,-060,4000,wall_2,HARD180yr_ISTRAT
.tunnel3	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
	mapobj	0000,090,0,4000,tunnel_0,botright1_istrat
	mapobj	0700,-90,0,4000,tunnel_0,botleft1_istrat
	maploop	.tunnel3,02
	mapobj	000,0,-80,5000,item_6,item6_istrat
	setalvar	sbyte1,1
	mapobj	0500,0000,0000,4000,leng_0,leng0_ISTRAT
.tunnel4	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
	mapobj	0000,090,0,4000,tunnel_0,botright1_istrat
	mapobj	0700,-90,0,4000,tunnel_0,botleft1_istrat
	maploop	.tunnel4,02
	mapobj	0300,0000,0000,4000,leng_0,leng0_ISTRAT
.tunnel5	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
	mapobj	0000,090,0,4000,tunnel_0,botright1_istrat
	mapobj	0700,-90,0,4000,tunnel_0,botleft1_istrat
	maploop	.tunnel5,03
	mapobj	0000,0000,-60,4200,iris,iris_ISTRAT
.tunnel6
	mapobj	0000,0070,-060,4800,bou_1,HARD180yr_ISTRAT
	mapobj	0700,-070,-060,4800,bou_1,HARD180yr_ISTRAT
	maploop	.tunnel6,03

	mapobj	0000,0000,0000,4700,core_1_0,core0_Istrat
	mapobj	1000,0000,0000,4700,CORE_1_1,CORE1_ISTRAT
	mapobj	0000,0070,-060,4200,bou_1,HARD180yr_ISTRAT
	mapobj	0500,-070,-060,4200,bou_1,HARD180yr_ISTRAT
