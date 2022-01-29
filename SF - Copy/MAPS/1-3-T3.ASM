;1-3-T3
	mapwait	0500
	mapDNUPdoor	1400,3500
	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
;
	mapobj		0200,0000,-010,4000,WALL_5,HARD180yr_ISTRAT
	mapobj		0200,0000,-020,4000,WALL_0,HARD180yr_ISTRAT
	mapobj		0200,0000,-030,4000,WALL_0,HARD180yr_ISTRAT
	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
	mapobj		0600,0000,-040,4000,WALL_0,HARD180yr_ISTRAT
	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
	mapobj	0000,090,0,4000,tunnel_0,botright1_istrat
	mapobj	0600,-90,0,4000,tunnel_0,botleft1_istrat

	mapobj	0000,090,0,4000,tunnel_0,botright1_istrat
	mapobj	0000,-90,0,4000,tunnel_0,botleft1_istrat
	mapobj		0200,0000,-110,4000,WALL_5,HARD180yr_ISTRAT
	mapobj		0200,0000,-100,4000,WALL_0,HARD180yr_ISTRAT
	mapobj		0200,0000,-090,4000,WALL_0,HARD180yr_ISTRAT
	mapobj	0000,090,0,4000,tunnel_0,botright1_istrat
	mapobj	0000,-90,0,4000,tunnel_0,botleft1_istrat
	mapobj		0600,0000,-080,4000,WALL_0,HARD180yr_ISTRAT

	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
	mapobj	0000,090,0,4000,tunnel_0,botright1_istrat
	mapobj	0600,-90,0,4000,tunnel_0,botleft1_istrat
	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
	mapobj		0800,0000,-020,4000,WALL_0,HARD180yr_ISTRAT
	mapobj	0000,090,0,4000,tunnel_0,botright1_istrat
	mapobj	0000,-90,0,4000,tunnel_0,botleft1_istrat
	mapobj		0500,0000,-100,4000,WALL_0,HARD180yr_ISTRAT
.tunnela	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
	mapobj	0000,090,0,4000,tunnel_0,botright1_istrat
	mapobj	0700,-90,0,4000,tunnel_0,botleft1_istrat
	maploop	.tunnela,02
	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
	mapobj		0800,0000,-020,4000,WALL_0,HARD180yr_ISTRAT
	mapobj	0000,090,0,4000,tunnel_0,botright1_istrat
	mapobj	0000,-90,0,4000,tunnel_0,botleft1_istrat
	mapobj		0800,0000,-100,4000,WALL_0,HARD180yr_ISTRAT
	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
	mapobj		0500,0000,-020,4000,WALL_0,HARD180yr_ISTRAT
.tunnelb	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
	mapobj	0000,090,0,4000,tunnel_0,botright1_istrat
	mapobj	0700,-90,0,4000,tunnel_0,botleft1_istrat
	maploop	.tunnelb,02
	mapobj		0000,0000,-020,4000,WALL_0,HARD180yr_ISTRAT
	mapobj		0300,0000,-100,4000,WALL_0,HARD180yr_ISTRAT
.tunnelc	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
	mapobj	0000,090,0,4000,tunnel_0,botright1_istrat
	mapobj	0700,-90,0,4000,tunnel_0,botleft1_istrat
	maploop	.tunnelc,02
;
;skillfly
	skillfly_init
	skillfly_set 0000,-140,4050
	setalvar	sbyte1,1
	mapUPDNdoor	2000,4000	;from bottom to top
	skillfly_set 0000,0020,4050
	mapDNUPdoor	2000,4000
	skillfly_set 0000,-140,4050
	mapUPDNdoor	0700,4000
	mapobj		1300,0000,-020,4000,WALL_0,HARD180yr_ISTRAT
	mapDNUPdoor	0100,4000
;WALKER_3
	special		0500,0000,0000,4000,s_wark_0,warker3_Istrat
	cspecial		0500,0060,0000,4000,warker_3,warker3_Istrat
	cspecial		0500,-60,0000,4000,warker_3,warker3_Istrat
	special		0400,0000,0000,4000,s_wark_0,warker3_Istrat
	skillfly_bonus 0000,0,-100,1400,item_5,item5_istrat
	setalvar	sbyte1,1

.tunnel9	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
	mapobj	0000,090,0,4000,tunnel_0,botright1_istrat
	mapobj	0700,-90,0,4000,tunnel_0,botleft1_istrat
	maploop	.tunnel9,7
	mapLRdoor	0800,4000
	mapLRdoor	0800,4000
	mapLRdoor	0400,4000














































			     
