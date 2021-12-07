pipescale	=	16



;-----------------------------------------------------------
	mapplayercantdie	
	mapplayermode	toCslow

	mapobjnomem	400,0,-60,4200,pipe_9_0,nocoll_Istrat
	mapobjnomem	400+400,0,-60,4200,pipe_9_0,nocoll_Istrat
	mapobjnomem	0,0,-60,4200,pipe_9,colonyexit_Istrat
	mapwait		4000

;pdist	=	((120/2)<<4)+20*pipescale
pdist	=	960+(20*pipescale)

	setbg	1_3da
	initbg

	mappipe	0,0,0,0,0
	mappipe	-11,40,-1,0,2
	mappipe	-40,70,-2,1,2
	mappipewait	
	mappipe	-69,100,-1,0,3
	mappipewait	
	mappipe	-80,140,0,1,0
	mappipewait	
	mappipe	-69,180,1,0,3
	mappipewait	
	mappipe	-40,210,2,0,2,nognd
	mappipewait	
	mappipe	-11,240,1,0,1,nognd
	mappipewait	
	mappipewait	
	mappipe	0,280,0,0,4,nognd
	mappipewait	
	mappipe	0,320,0,0,5,nognd
	mappipe	0,360,0,0,4,nognd
	mappipe	0,400,0,0,5,nognd
	mappipe	0,440,0,0,4,nognd
	mappipe	0,480,0,0,5,nognd
	mappipewait	
	mappipewait	
	mappipewait	
	mappipewait	

;	start_65816
;	a8
;	lda	pshipflags3
;	ora	#psf3_forcebrake
;	sta	pshipflags3
;	end_65816




