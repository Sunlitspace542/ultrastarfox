mothermap1
	motherrnd	800,512,0,2048,petecube,hard_istrat
	mothergoto	0,mothermap1

mothermap2
	motherrnd	0250,512,0,512,bouncyball,cubefall_istrat
	motherloop	0,mothermap2,10
	motherwait	250
.mloop
	motherrnd	0250,512,0,512,asteroid3,cubefall_istrat
	motherrnd	0250,512,0,512,asteroid4,cubefall_istrat
	motherloop	0,.mloop,5
	motherwait	250
	mothergoto	0,mothermap2


mothermap3
	motherobj	1200,0,160,0,para_0,para_istrat
	motherloop	0,mothermap3,8
	motherwait	2000
	motherend	0,mothermap3

asterdist	=	150
mothermap4
	motherrnd	asterdist,1024,1024,0000,asteroid1,meteor_istrat
	mothergoto	0,mothermap4

mothermap5
	motherrnd	500,128,128,0000,bouncyball,meteor_istrat
.wait
	mothercnt	100,iris

	motherjump	0,NE,.wait

	mothergoto	mothermap5

map_ast
	motherrnd	0200,1024,1024,0000,asteroid1,meteor_istrat
	motherrnd	0200,1024,1024,0000,asteroid1,meteor_istrat
	motherrnd	0200,1024,1024,0000,asteroid1,meteor_istrat

	motherrnd	0200,1024,1024,0000,asteroid1,meteor_istrat
	motherrnd	0200,1024,1024,0000,asteroid1,meteor_istrat
	motherrnd	0200,1024,1024,0000,asteroid1,meteor_istrat
.here
	motherrnd	0200,1024,1024,0000,asteroid3,meteor_istrat
	motherrnd	0200,1024,1024,0000,asteroid1,meteor_istrat
	motherrnd	0200,1024,1024,0000,asteroid1,meteor_istrat
	motherrnd	0200,1024,1024,0000,asteroid1,meteor_istrat

	motherrnd	0200,1024,1024,0000,asteroid1,meteor_istrat
	motherrnd	0200,1024,1024,0000,asteroid1,meteor_istrat
	motherrnd	0200,1024,1024,0000,asteroid1,meteor_istrat

	motherrnd	0200,1024,1024,0000,asteroid1,meteor_istrat
	motherrnd	0200,1024,1024,0000,asteroid1,meteor_istrat
	motherrnd	0200,1024,1024,0000,asteroid1,meteor_istrat

	mothergoto	0,.here



map_mines	motherrnd	0150,512,512,256,mine_0,mine0_istrat
	mothergoto	map_mines

map_pillars
	motherobj	0100,-500,0000,0000,pillar2,pillar2_istrat
	motherobj	0100,-250,0000,0000,pillar2,pillar2_istrat
	motherobj	0100,0000,0000,0000,pillar2,pillar2_istrat
	motherobj	0100,0250,0000,0000,pillar2,pillar2_istrat
	motherobj	0100,0500,0000,0000,pillar2,pillar2_istrat
	motherobj	0100,0250,0000,0000,pillar2,pillar2_istrat
	motherobj	0100,0000,0000,0000,pillar2,pillar2_istrat
	motherobj	0100,-250,0000,0000,pillar2,pillar2_istrat
	mothergoto	map_pillars

map_mountains
	mothergoto	map_mountains

map_flypillars
	motherobj	0600,-300,-150*2,-4100,rpillar3,flypillar_istrat
	mothergoto	map_flypillars


map_plasmas
	motherrnd	0500,256,256,0000,largeplasma,largeplasma_istrat
	motherrnd	0800,256,256,0000,largeplasma,largeplasma_istrat
	motherrnd	0600,256,256,0000,largeplasma,largeplasma_istrat
	mothergoto	map_plasmas

map_lines
	motherrnd	5,256,256,0000,line3,speedlines_istrat
	motherrnd	2,256,256,0000,line3,speedlines_istrat
	motherrnd	5,256,256,0000,line3,speedlines_istrat
	motherrnd	2,256,256,0000,line3,speedlines_istrat
	mothergoto	map_lines

map_roadlines
	motherobj	200,0,0,0,line_0,roadline_istrat
	motherobj	200,0,0,0,line_0,roadline_istrat
	motherobj	200,0,0,0,line_0,roadline_istrat
	motherobj	100,0,0,0,line_0,roadline_istrat
	motherobj	100,0,0,0,line_1,roadline_istrat
	mothergoto	map_roadlines

truckmines_map
	motherrnd	000,64,64,64,mine_0,mine0_istrat
	motherrnd	000,64,64,64,mine_0,mine0_istrat
	motherrnd	000,64,64,64,mine_0,mine0_istrat
	motherrnd	000,64,64,64,mine_0,mine0_istrat
	
	motherend



largetunnelbits
	motherobj	0000,120,-120,0,tunnel_0,topright1_istrat
	motherobj	0000,-120,-120,0,tunnel_0,topleft1_istrat
	motherobj	0000,120,0,0,tunnel_0,botright1_istrat
	motherobj	0000,-120,0,0,tunnel_0,botleft1_istrat
	motherwait	600
	motherobj	0000,120,-120,0,tunnel_0,topright1_istrat
	motherobj	0000,-120,-120,0,tunnel_0,topleft1_istrat
	motherobj	0000,120,0,0,tunnel_0,botright1_istrat
	motherobj	0000,-120,0,0,tunnel_0,botleft1_istrat
	motherwait	600
	motherobj	0000,-120,0000,0000,tunnel_4,leftwall_istrat
	motherobj	0000,120,0000,0000,tunnel_4,rightwall_istrat
	motherobj	0000,0,-120,0000,tunnel_7,duct_istrat
	mothergoto	600,largetunnelbits

tunnellines
	motherobj	800,0,0,0,line_0,nocoll_istrat
	mothergoto	tunnellines

mother_0
	motherrnd	asterdist,2048,2048,0000,asteroid1,meteor_istrat
	motherrnd	asterdist,1024,1024,0000,asteroid1,meteor_istrat
	motherrnd	asterdist,2048,2048,0000,asteroid1,meteor_istrat
	mothergoto	0,mother_0

asterdist	=	500
mother_1
	motherrnd	asterdist,1024,1024,0000,asteroid1,slowmeteor_istrat
	motherrnd	asterdist,1024,1024,0000,asteroid1,break_meteor_istrat
	motherrnd	asterdist,1024,1024,0000,asteroid1,slowmeteor_istrat
	motherrnd	asterdist,1024,1024,0000,asteroid1,slowmeteor_istrat
	mothergoto	0,mother_1

mother_2
	motherrnd	asterdist,1024,1024,0000,asteroid1,hard_istrat
	motherrnd	asterdist,1024,1024,0000,asteroid1,hard_istrat
	motherrnd	800,1024,1024,0000,asteroid1,break_meteor_istrat
	motherrnd	asterdist,1024,1024,0000,asteroid1,hard_istrat
	motherrnd	asterdist,1024,1024,0000,asteroid1,hard_istrat
	motherrnd	800,1024,1024,0000,asteroid1,break_meteor_istrat

	mothergoto	0,mother_2

asterdist	=	100
mother_3

	IFEQ	CONTEST
	motherrnd	asterdist,2048,2048,0000,asteroid1,slowmeteor_istrat
	motherrnd	asterdist,1024,1024,0000,asteroid1,break_meteor_istrat
	motherrnd	asterdist,2048,2048,0000,asteroid1,slowmeteor_istrat
	motherrnd	asterdist,2048,2048,0000,asteroid1,slowmeteor_istrat
	ELSEIF
	motherrnd	asterdist,2048,2048,0000,asteroid1,slowmeteor_istrat
	motherrnd	asterdist,1024,1024,0000,asteroid1,slowmeteor_istrat
	motherrnd	asterdist,2048,2048,0000,asteroid1,slowmeteor_istrat
	motherrnd	asterdist,2048,2048,0000,asteroid1,slowmeteor_istrat
	ENDC
	mothergoto	0,mother_3


asterdist	=	250
mother_5

	motherrnd	asterdist,2048,2048,0000,asteroid1,slowmeteor_istrat
	motherrnd	asterdist,1024,1024,0000,asteroid1,slowmeteor_istrat
	motherrnd	asterdist,1024,1024,0000,asteroid2,searchmeteor_istrat

	motherrnd	asterdist,1024,1024,0000,asteroid1,slowmeteor_istrat
	motherrnd	asterdist,2048,2048,0000,asteroid1,slowmeteor_istrat
	motherrnd	asterdist,1024,1024,0000,asteroid1,break_meteor_istrat
	motherrnd	asterdist,1024,1024,0000,asteroid1,slowmeteor_istrat

	motherrnd	asterdist,1024,1024,0000,asteroid1,slowmeteor_istrat
	mothergoto	0,mother_5

asterdist	=	250
testmother

	motherrnd	asterdist,256,2048,0000,asteroid1,meteor_istrat
	mothergoto	0,testmother

asterdist	=	250
map_amoebas
	motherrnd	asterdist,1024,1024,0000,amoeba2,amoeba_istrat
	mothergoto	map_amoebas


map_uperm	
	motherrnd	1500,1024,0000,0000,uper_m,uperm_Istrat
	mothergoto	map_uperm




map_shou0
	IFEQ		CONTEST
	motherrnd	250,1024,2048,0000,asteroid1,meteor_istrat
	motherrnd	250,1024,2048,0000,asteroid1,meteor_istrat
	motherrnd	250,1024,1024,0000,r_hou_0,shou0a_istrat
	motherrnd	250,1024,2048,0000,asteroid1,meteor_istrat
	motherrnd	250,1024,2048,0000,asteroid1,meteor_istrat
	motherrnd	250,1024,1024,0000,r_hou_0,shou0a_istrat
	motherrnd	250,1024,2048,0000,asteroid1,meteor_istrat
	motherrnd	250,1024,2048,0000,asteroid1,meteor_istrat
	motherrnd	250,1024,1024,0000,s_hou_0,shou0_istrat
	ELSEIF
	motherrnd	250,1024,2048,0000,asteroid1,meteor_istrat
	motherrnd	250,1024,2048,0000,asteroid1,meteor_istrat
	motherrnd	250,1024,2048,0000,asteroid1,meteor_istrat
	motherrnd	250,1024,2048,0000,asteroid1,meteor_istrat
	motherrnd	250,1024,2048,0000,asteroid1,meteor_istrat
	motherrnd	250,1024,2048,0000,asteroid1,meteor_istrat
	ENDC
	mothergoto	map_shou0


map_meteo0
	motherrnd	250,1024,2048,0000,asteroid1,meteor_istrat
	motherrnd	250,1024,512,0000,meteo_0,meteo0_Istrat
	motherrnd	250,1024,2048,0000,asteroid1,meteor_istrat
	motherrnd	asterdist,1024,1024,0000,asteroid1,break_meteor_istrat
	motherrnd	250,1024,2048,0000,asteroid1,meteor_istrat
	mothergoto	map_meteo0


snakedist	=	500
mother_snakes
	motherrnd	snakedist,1024,0,256,nullshape,seadragon_istrat
	mothergoto	mother_snakes

map_mine2
	motherrnd	1500,1024,0000,000,uper_m,uperm_Istrat
	motherrnd	1500,1024,256,000,mine_2,mine2_istrat
	mothergoto	map_mine2


map_bhole
	motherrnd	800,1024,1024,4000,nullshape,damyscr_istrat
	mothergoto	map_bhole



mother_CLasteroids
	motherrnd	200,1024,1024,0000,clasteroid,clasteroid_Istrat
	mothergoto	mother_CLasteroids

mother_clbuildings
	motherobj	1000,-800,0000,4000,BU_5,HARD180YR_ISTRAT
	motherobj	1000,01200,0000,4000,BU_6,HARD180YR_ISTRAT
	motherobj	1000,-1200,0000,4000,BU_4,HARD180YR_ISTRAT
	motherobj	1000,01000,0000,4000,BU_2,HARD180YR_ISTRAT
	mothergoto		mother_clbuildings	


