;3-4-T

	mapwait		01000

	map_setbarshape	wire
	map_Zspacebar	-1,0,0	
	map_Zspacebar	1,0,0	
	mapwait		0800

	map_SYspacebar	1,0,0	
	map_SYspacebar	-1,0,0	
	mapwait		500
	map_SYspacebar	1,0,0	
	map_SYspacebar	-1,0,0	
	mapwait		500
	map_SYspacebar	0,0,0	
	mapwait		500
	map_SYspacebar	1,0,0	
	map_SYspacebar	-1,0,0	
	mapwait		500
	map_SYspacebar	1,0,0	
	map_SYspacebar	-1,0,0	
	mapwait		500
	map_SYspacebar	1,0,0	
	map_SYspacebar	-1,0,0	
	mapwait		1000
	map_SXspacebar	0,0,1	
	special		1000,0060,0000,3500,s_wark_0,warker3_Istrat
.tunnel0	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
	mapobj	0000,090,0,4000,tunnel_0,botright1_istrat
	mapobj	1000,-90,0,4000,tunnel_0,botleft1_istrat
	maploop	.tunnel0,03
	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
	mapobj	0000,090,0,4000,tunnel_0,botright1_istrat
	mapobj	0400,-90,0,4000,tunnel_0,botleft1_istrat

	mapUPDNdoor	1500,4000
	mapobj		1000,0000,-100,5000,WALL_0,HARD180yr_ISTRAT
	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
	mapobj	0000,090,0,4000,tunnel_0,botright1_istrat
	mapobj	1000,-90,0,4000,tunnel_0,botleft1_istrat
	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
	mapobj	0000,090,0,4000,tunnel_0,botright1_istrat
	mapobj	1000,-90,0,4000,tunnel_0,botleft1_istrat
	mapobj		0000,0060,-60,4000,WALL_2,HARD180yr_ISTRAT
	mapobj		1000,-060,-60,4000,WALL_2,HARD180yr_ISTRAT
	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
	mapobj	0000,090,0,4000,tunnel_0,botright1_istrat
	mapobj	1000,-90,0,4000,tunnel_0,botleft1_istrat

	maplrdoor	0000,4000
	special		0300,0000,0000,4300,s_wark_0,warker3_Istrat
	mapobj		0300,-70,0000,4050,warker_3,warker3_Istrat
	special		1000,0070,0000,4550,s_wark_0,warker3_Istrat
.tunnel1	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
	mapobj	0000,090,0,4000,tunnel_0,botright1_istrat
	mapobj	1000,-90,0,4000,tunnel_0,botleft1_istrat
	maploop	.tunnel1,05
	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
	mapobj	0000,090,0,4000,tunnel_0,botright1_istrat
	mapobj	0000,-90,0,4000,tunnel_0,botleft1_istrat
	mapobj		1000,0000,-60,4100,bou_0,twall0_Istrat
	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
	mapobj	0000,090,0,4000,tunnel_0,botright1_istrat
	mapobj	0200,-90,0,4000,tunnel_0,botleft1_istrat

	maplrdoor	0400,4000
	maplrdoor	0400,4000
	maplrdoor	0500,4000
	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
	mapobj	0000,090,0,4000,tunnel_0,botright1_istrat
	mapobj	0500,-90,0,4000,tunnel_0,botleft1_istrat



















































