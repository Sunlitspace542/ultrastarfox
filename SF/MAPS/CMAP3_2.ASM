; SPACE
map3_2

	mapwait		3300
; M formation
	szaco2_mapobj	0,2000,0,0,100
	szaco2_mapobj	-500,2000,-300,100,0
	szaco2_mapobj	500,2000,300,100,100
	pathobj	000,3000,3000,3000,nullshape,astemsg,10,10
	szaco2_mapobj	-1000,2000,-500,-100,0
	szaco2_mapobj	1000,2000,500,-100,100
	mapwait		2000
	mapmother	4000,0000,0,4000,mother1,mother1_istrat,mother_1
	maprem		mother1
	cspecial	2000,-400,space_viewCY,3000,w_l,winglazerman_istrat
	special	0000,-200,Space_viewCY+100,800,cameleon,cameleon_istrat
	cspecial	1500,0200,Space_viewCY-100,800,cameleon,cameleon_istrat
;meteo&launcher
	mapmother	2000,0000,0,4000,mother1,mother1_istrat,map_shou0
	pathcspecial	2000,-200,000,4000,zaco_0,itachi_a,2,4
	pathcspecial	2000,200,-100,4000,zaco_0,itachi_b,2,4
	maprem		mother1
;windmil(round_1)
	special	0000,-1500,space_viewCY,4000,round_0,windmill_istrat
	setalvar	roty,160
	setalvar	vel,120
	mapwait	1200
	setalvar	roty,140
	setalvar	vel,100
	mapwait	1200
	setalvar	vel,0
	setalvar	roty,127
	mapwait	1500
	setalvar	vel,120
	setalvar	sword1,-2
;mini_worm
	special	0000,200,Space_viewCY+100,2300,d_head_0,wormhead_Istrat
	setvarobj	mapvar1
	mapwait	150
	
	REPT	5
	cspecial	0000,200,Space_viewCY+100,2300,d_body_0,worm_Istrat
	setalvarptr.w	sword1,mapvar1
	setvarobj	mapvar1
	mapwait	150
	ENDR
	map_setbarshape	solid
	pathcspecial	1000,200,-100,4000,zaco_0,itachi_a,2,4

;friend
	pathobj	00000,00,400,000,friendship_4,chase3_1,200,10
	pathcspecial	01000,00,400,000,zaco_b,chase3_2,10,10
;colony
	mapobj	0000,-4*Xlen,space_viewCY+(0*Ylen),5000,colony3R,nocoll_Istrat
	mapobj	1000,4*Xlen,space_viewCY+(0*Ylen),5000,colony3L,nocoll_Istrat

	mapobj	0000,0000,00,5000,nullshape,up1man_Istrat
	setalvar	sbyte1,1
	pathcspecial	2000,200,-200,4000,zaco_0,itachi_b,2,4

	pathcspecial	2000,000,-100,4000,zaco_0,itachi_a,2,4
	mapobj	3000,000,200,2000,spacepilon,spacepilon_istrat

	pathcspecial	400,0200,-100,4000,b_hou_0,screw,10,10

	mapmother	3000,0000,0,4000,mother1,mother1_istrat,mother_5
	maprem		mother1
;hider
	mapmother	4000,0000,0,4000,mother1,mother1_istrat,map_meteo0
	maprem		mother1

	mapmother	1500,0000,0,4000,mother1,mother1_istrat,mother_5
	pathcspecial	1000,000,-100,4000,zaco_0,itachi_a,2,4
	pathcspecial	1000,-200,000,4000,zaco_0,itachi_b,2,4
	maprem	mother1
;supply_bird
	pathobj	6000,-380,-300,0,my_bird,my_bird,10,10
	pathobj	0000,3000,3000,3000,nullshape,amebmsg2,10,10


.boss
	
;---------------
; propeller boss
	fadeoutbgm
	setbgm	bgm_boss1
	incmap	webmonster
	mapwaitboss
	markboss	boss32

	mapwait	1800

	maprts



