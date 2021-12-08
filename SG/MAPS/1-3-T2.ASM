;1-3-T2
;CRANE
;	mapobj		2500,0060,-050,2000,crane_0,crane0_Istrat
	start_65816
	lda	#1
	sta	nogodgun
	end_65816
	mapwait	0500
	maplrdoor	1200,3500
	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
	mapobj		1000,0000,-020,4000,WALL_0,HARD180yr_ISTRAT
	mapobj	0000,090,0,4000,tunnel_0,botright1_istrat
	mapobj	0000,-90,0,4000,tunnel_0,botleft1_istrat
	mapobj		1000,0000,-100,4000,WALL_0,HARD180yr_ISTRAT
	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
	mapobj		0200,0000,-020,4000,WALL_0,HARD180yr_ISTRAT
	mapobj		0200,0000,-020,4000,WALL_0,HARD180yr_ISTRAT
	mapobj		0200,0000,-020,4000,WALL_0,HARD180yr_ISTRAT
	mapobj		0200,0000,-020,4000,WALL_0,HARD180yr_ISTRAT
	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
	mapobj		0800,0000,-020,4000,WALL_0,HARD180yr_ISTRAT

	mapobj	0000,090,0,4000,tunnel_0,botright1_istrat
	mapobj	0000,-90,0,4000,tunnel_0,botleft1_istrat
	mapobj		0200,0000,-100,4000,WALL_0,HARD180yr_ISTRAT
	mapobj		0200,0000,-100,4000,WALL_0,HARD180yr_ISTRAT
	mapobj		0200,0000,-100,4000,WALL_0,HARD180yr_ISTRAT
	mapobj		0200,0000,-100,4000,WALL_0,HARD180yr_ISTRAT
	mapobj		0200,0000,-100,4000,WALL_0,HARD180yr_ISTRAT
	mapobj		0200,0000,-100,4000,WALL_0,HARD180yr_ISTRAT
	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
	mapobj	0000,090,0,4000,tunnel_0,botright1_istrat
	mapobj	0050,-90,0,4000,tunnel_0,botleft1_istrat
	mapobj		0200,0000,-40,4000,bou_0,twall0_Istrat
	mapobj		0200,0000,-100,4000,WALL_0,HARD180yr_ISTRAT
	mapobj		0400,0000,-100,4000,WALL_0,HARD180yr_ISTRAT
	pathobj		0600,0000,0000,-100,nullshape,kastmsg2,10,10
.tunneld	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
	mapobj	0000,090,0,4000,tunnel_0,botright1_istrat
	mapobj	0700,-90,0,4000,tunnel_0,botleft1_istrat
	maploop	.tunneld,03
;
	maplrdoor	0600,4000
	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
	mapobj	0000,090,0,4000,tunnel_0,botright1_istrat
	mapobj	0600,-90,0,4000,tunnel_0,botleft1_istrat
	maplrdoor	0200,4000
	mapobj		0000,-060,-40,4000,item_5,item5_istrat
	setalvar	sbyte1,1
	mapwait		1000
	maplrdoor	0600,4000
	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
	mapobj	0000,090,0,4000,tunnel_0,botright1_istrat
	mapobj	0600,-90,0,4000,tunnel_0,botleft1_istrat
	maplrdoor	0600,4000
;
	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
	mapobj	0000,090,0,4000,tunnel_0,botright1_istrat
	mapobj	0600,-90,0,4000,tunnel_0,botleft1_istrat
WALKER_3
	mapobj		0000,0000,0000,3000,warker_3,warker3_Istrat
	mapobj		0000,0060,0000,3300,warker_3,warker3_Istrat
	special		0000,-60,0000,3600,s_wark_0,warker3_Istrat
	mapwait		0500
.tunnel7	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
	mapobj	0000,090,0,4000,tunnel_0,botright1_istrat
	mapobj	0700,-90,0,4000,tunnel_0,botleft1_istrat
	maploop	.tunnel7,07

	mapobj	0000,0000,-60,4200,iris,iris_ISTRAT
.tunnel8;	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
;	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
;	mapobj	0000,090,0,4000,tunnel_0,botright1_istrat
;	mapobj	0700,-90,0,4000,tunnel_0,botleft1_istrat
	mapobj	0000,0070,-060,4800,bou_1,HARD180yr_ISTRAT
	mapobj	0700,-070,-060,4800,bou_1,HARD180yr_ISTRAT
	maploop	.tunnel8,03

	mapobj	0000,0000,0000,4700,core_1_0,core0_Istrat
	mapobj	1000,0000,0000,4700,CORE_1_1,CORE1_ISTRAT
	mapobj	0000,0070,-060,4200,bou_1,HARD180yr_ISTRAT
	mapobj	0500,-070,-060,4200,bou_1,HARD180yr_ISTRAT

;	mapobj	0000,090,-120,4000,tunnel_0,topright1_istrat
;	mapobj	0000,-90,-120,4000,tunnel_0,topleft1_istrat
;	mapobj	0000,090,0,4000,tunnel_0,botright1_istrat
;	mapobj	0800,-90,0,4000,tunnel_0,botleft1_istrat



