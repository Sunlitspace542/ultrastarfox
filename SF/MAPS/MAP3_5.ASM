; 3-5 Macbeth
map3_5

high	=	-600
;--------------------------------------------------------------------------
;	mapwait	0100
				;start
	mapobj	0000,-600,0000,0800,RO_4,rockhard_ISTRAT    ; L      R  ;
	mapobj	0000,0600,0000,0800,RO_5,rockhard_istrat    ;           ;

	mapobj	0000,-500,0000,1800,RO_4,rockhard_ISTRAT    ; L      R  ;
	mapobj	0000,0500,0000,1800,RO_5,rockhard_istrat    ;           ;
	mapobj	0000,-400,0000,2800,RO_4,rockhard_ISTRAT    ; L      R  ;
	mapobj	0000,0400,0000,2800,RO_5,rockhard_istrat    ;           ;

	mapobj	0000,-400,0000,3800,RO_4,rockhard_ISTRAT    ;  L    R   ;
	mapobj	0000,0550,0000,3800,RO_1,rockhard_ISTRAT    ;           ;
	mapobj	0000,-400,0000,4800,RO_0,rockhard_ISTRAT    ;  L    R   ;
	mapobj	0000,0400,0000,4800,RO_5,rockhard_ISTRAT    ;           ;
	mapobj	0000,-900,0000,5800,RO_2,rockhard_ISTRAT    ;L     R    ;
;tumble_robot
	mapobj	0000,-150,-100,5000,item_5,item5_Istrat
	setalvar	sbyte1,1
	mapobj	3000,0100,0000,5800,RO_5,rockhard_ISTRAT    ;           ;
;
	mapobj	0000,-1000,0000,3800,RO_0,rockhard_ISTRAT   ;L    R     ;
	mapobj	1000,-100,0000,3800,RO_5,rockhard_ISTRAT    ;           ;
	pathcspecial	0000,-100,0000,3350,walker_0,e_walk_1,10,10 ;     W     ;
	mapobj	0000,-800,0000,3800,RO_4,rockhard_ISTRAT    ;L          ; 
	mapobj	2000,-500,0000,4800,RO_4,rockhard_ISTRAT    ;  L    R   ;
	mapobj	0000,0500,0000,2800,RO_1,rockhard_ISTRAT    ;     h     ;
	mapobj	0000,-200,0000,3800,RO_4,rockhard_ISTRAT    ;   L    R  ;
	cspecial	0000,0200,0000,3300,hou_5,houdai5f_ISTRAT   ;           ;
	mapobj	1000,0600,0000,3800,RO_1,rockhard_ISTRAT    ;       R   ;
	pathobj	0500,0600,0000,3350,walker_0,e_walk_1,10,10 ;       W   ;
	mapobj	0000,0450,-600,4000,RO_6,hard180yr_ISTRAT   ;      C    ;
	setalvar	rotz,deg180
	mapwait	0500
	mapobj	0000,0000,0000,2800,RO_4,rockhard_ISTRAT    ; L    R    ;
	mapobj	1000,0800,0000,2800,RO_1,rockhard_ISTRAT    ;           ;
;
	mapobj	0000,0100,0000,2800,RO_0,rockhard_ISTRAT    ;L    R     ;
	pathcspecial	0000,0100,0000,3350,walker_0,e_walk_1,10,10 ;     W     ;
	mapobj	0000,1000,0000,2800,RO_5,rockhard_ISTRAT    ;           ;
	mapobj	0000,0800,0000,3800,RO_5,rockhard_ISTRAT    ; L         ;
	mapobj	2500,0500,0000,4800,RO_5,rockhard_ISTRAT    ;  L        ;
	mapobj	0000,-500,0000,2300,RO_0,rockhard_ISTRAT    ;       R   ;
	mapobj	0000,0000,0000,3100,RO_6,hard180yr_ISTRAT   ;     C     ;
	mapobj	0000,-800,0000,3300,RO_0,rockhard_ISTRAT    ; L      R  ;
	mapobj	0000,0800,0000,3300,RO_1,rockhard_ISTRAT    ;           ;
	mapobj	0000,-600,0000,4100,RO_2,rockhard_ISTRAT    ;  L   R    ;
	skillfly_init
	skillfly_set -280,-50,3000,100
	mapobj	0500,0600,0000,4100,RO_3,rockhard_ISTRAT    ;           ;
	mapobj	0000,0100,-600,4000,RO_6,hard180yr_ISTRAT   ;     C     ;
	setalvar	rotz,deg180
;exit_of_rocks
	pathspecial	0000,250,0000,3000,s_tank_0,e_tank,10,10
	mapobj	0000,-1200,00,5000,RO_6,hard180yr_ISTRAT
	mapobj	1000,1200,00,5000,RO_6,hard180yr_ISTRAT
	pathspecial	0000,-100,0000,3000,s_tank_0,e_tank,10,10
	mapobj	0000,-1200,00,5000,RO_6,hard180yr_ISTRAT
	mapobj	0000,1500,00,5000,RO_6,hard180yr_ISTRAT 
;friend
	pathobj	0000,-750,-400,0000,friendship_4,chase6_1,10,10
	pathobj	1500,-750,-400,0000,zaco_a,chase6_2,10,10
	skillfly_bonus 0000,0000,-120,1300,item_5,item5_istrat
	setalvar	sbyte1,1
	mapobj	0000,0700,-600,4000,RO_6,hard180yr_ISTRAT
	setalvar	rotz,deg180
	mapobj	0000,-1200,-600,5000,RO_6,hard180yr_ISTRAT
	setalvar	rotz,deg180
	mapwait	1000
	mapobj	0000,0600,-600,5000,RO_6,hard180yr_ISTRAT
	setalvar	rotz,deg180
;across_robot
	mapobj	1000,-1200,00,5000,RO_6,hard180yr_ISTRAT
	mapobj	1000,-400,0000,5000,RO_6,hard180yr_ISTRAT
	mapobj	0000,-700,-600,5000,RO_6,hard180yr_ISTRAT
	setalvar	rotz,deg180
	pathobj	0000,-400,0000,4500,walker_0,e_walk_1,6,4
	mapobj	2000,0900,0000,5000,RO_6,hard180yr_ISTRAT
;ceiling_town
;bu_2	
	mapobj	0000,-1200,-600,5000,RO_6,hard180yr_ISTRAT
	setalvar	rotz,deg180
	mapobj	2000,0500,0000,5000,RO_6,hard180yr_ISTRAT
	cspecial	1000,-300,0000,3300,hou_5,houdai5f_ISTRAT
	pathcspecial	1000,0000,-600,3300,hou_5,saka_hou,10,10
	cspecial	2000,200,0000,3300,hou_5,houdai5f_ISTRAT
	tstart	0,1,east
	teast
	teast
	tsouth
	tsouth
	tsouth
	tsouth
	tanothertruck
	tsouth
	teast
	tsouth
	tsouth
	tsouth
	teast
	teast
	mapobj	0000,-700,-600,4000,bu_2,hard180yr_ISTRAT   ;
	setalvar	rotz,deg180
	mapobj	0000,0700,-600,4000,bu_2,hard180yr_ISTRAT   ;
	setalvar	rotz,deg180
	mapwait	1000

	mapobj	0000,-500,0000,4000,bu_2,hard180yr_ISTRAT   ;
	mapobj	1000,0500,0000,4000,bu_2,hard180yr_ISTRAT   ;
	mapobj	0000,-700,-600,4000,bu_2,hard180yr_ISTRAT   ;
	setalvar	rotz,deg180
	mapobj	0000,0700,-600,4000,bu_2,hard180yr_ISTRAT   ;
	setalvar	rotz,deg180
	mapobj	0000,000,-600,3000,miss_1_1,nocoll_Istrat
	setvarobj	mapvar1
	setalvar	rotx,127
	mapobj	0000,000,-580,3000,miss_1_2,woods_Istrat
	setalvarptr.w	ptr,mapvar1
	setalvar	rotx,deg90
	pathspecial	0000,-150,0000,3000,s_tank_0,e_tank,10,10
	pathspecial	2000,150,0000,3000,s_tank_0,e_tank,10,10
	mapobj	0000,-400,-600,4000,bu_0,hard180yr_ISTRAT
	setalvar	rotz,deg180
	mapobj	0000,0400,-600,4000,bu_0,hard180yr_ISTRAT
	setalvar	rotz,deg180
	pathspecial	1000,150,0000,3000,s_tank_0,e_tank,10,10
	mapobj	0000,-800,0000,4500,bu_3,hard180yr_ISTRAT
	mapobj	2000,800,0000,4500,bu_3,hard180yr_ISTRAT
;
	mapobj	0000,000,-600,3000,miss_1_1,nocoll_Istrat
	setvarobj	mapvar1
	setalvar	rotx,127
	mapobj	0000,000,-580,3000,miss_1_2,woods_Istrat
	setalvarptr.w	ptr,mapvar1
	setalvar	rotx,deg90
	mapobj	0000,1200,-600,5000,RO_6,hard180yr_ISTRAT
	setalvar	rotz,deg180
	pathcspecial	0000,00,-600,3000,tank_1,e_tank,10,10
	setalvar	rotz,deg180
.ceiltown	mapobj	0000,-400,-600,4000,bu_0,hard180yr_ISTRAT
	setalvar	rotz,deg180
	mapobj	0000,0400,-600,4000,bu_0,hard180yr_ISTRAT
	setalvar	rotz,deg180
	mapobj	0000,-800,0000,4500,bu_3,hard180yr_ISTRAT
	mapobj	1000,800,0000,4500,bu_3,hard180yr_ISTRAT
	mapobj	1000,000,0000,4000,bu_8,hard180yr_ISTRAT
	maploop	.ceiltown,03
;fall_walker
	mapobj	0000,-400,-600,4000,bu_0,hard180yr_ISTRAT
	setalvar	rotz,deg180
	mapobj	0000,0400,-600,4000,bu_0,hard180yr_ISTRAT
	setalvar	rotz,deg180
	mapobj	1000,-1200,00,5000,RO_6,hard180yr_ISTRAT
	cspecial	0000,0200,0000,3300,hou_5,houdai5f_ISTRAT
	mapobj	1000,1500,00,5000,RO_6,hard180yr_ISTRAT 
	mapobj	0000,-600,00,5000,bu_8,hard180yr_ISTRAT   
	mapobj	1000,600,00,5000,bu_8,hard180yr_ISTRAT   
	pathcspecial	0000,0000,0000,5400,walker_0,e_walk_1,10,10 
;twin_lazer
	mapobj	2000,00,00,5000,bu_0,hard180yr_ISTRAT   
	mapobj	0000,000,-120,3800,item_7,item7_Istrat
	setalvar	sbyte1,1
	mapobj	0000,-400,-600,4000,bu_0,hard180yr_ISTRAT
	setalvar	rotz,deg180
	mapobj	0000,0400,-600,4000,bu_0,hard180yr_ISTRAT
	setalvar	rotz,deg180
	pathcspecial	0000,0000,0000,5400,walker_0,e_walk_1,10,10 
	mapobj	3000,00,00,5000,bu_0,hard180yr_ISTRAT   ;
	mapobj	0000,1200,-600,7000,RO_6,hard180yr_ISTRAT
	setalvar	rotz,deg180
	mapobj	0000,-1200,-600,8000,RO_6,hard180yr_ISTRAT
	setalvar	rotz,deg180
.volcs0	mapobj	500,-300,high,3000,Svolcano,firepillar_Istrat
	pathobj	0500,0000,-50,3200,bom_wing,ponpon,2,8
	mapobj	500,-200,high,3000,Svolcano,firepillar_Istrat
	mapobj	500,0200,high,3000,Svolcano,firepillar_Istrat
	maploop	.volcs0,02
	mapobj	2000,0800,0000,5000,RO_6,hard180yr_ISTRAT
	mapobj	0000,1000,-600,5000,RO_6,hard180yr_ISTRAT
	setalvar	rotz,deg180
	mapwait	3000
;big_volcano
	mapobj	0000,-080,-50,4200,item_6,item6_Istrat
	setalvar	sbyte1,1
	mapobj	3000,-300,0,4000,volcano,volcano_Istrat


	mapobj	0000,-200,0000,3000,miss_1_1,nocoll_Istrat
	setvarobj	mapvar1
	mapobj	0000,-200,-20,3000,miss_1_2,woods_Istrat
	setalvarptr.w	ptr,mapvar1
	setalvar	rotx,-deg90
	mapwait	1000
	mapobj	0000,0000,0000,3000,miss_1_1,nocoll_Istrat
	setvarobj	mapvar1
	mapobj	0000,0000,-20,3000,miss_1_2,woods_Istrat
	setalvarptr.w	ptr,mapvar1
	setalvar	rotx,-deg90
	pathcspecial	2000,-300,-600,3300,hou_5,saka_hou,10,10
	mapobj	1000,0700,0000,5000,RO_6,hard180yr_ISTRAT   ;

.volcs2	mapobj	500,-400,high,3000,Svolcano,firepillar_Istrat
	pathobj	0200,0200,-50,3200,bom_wing,ponpon,2,8
	mapobj	200,0000,high,3000,Svolcano,firepillar_Istrat
	mapobj	400,1200,0000,5000,RO_6,hard180yr_ISTRAT   ;
	mapobj	500,-200,high,3000,Svolcano,firepillar_Istrat
	mapobj	200,-1000,0000,5000,RO_6,hard180yr_ISTRAT   ;
	mapobj	500,0400,high,3000,Svolcano,firepillar_Istrat
	maploop	.volcs2,02
	mapobj	000,400,0000,5000,RO_6,hard180yr_ISTRAT   ;
	mapobj	000,-400,0000,5000,RO_6,hard180yr_ISTRAT   ;
	mapwait	1000
;gate
	mapobj	0000,0000,-150,4000,gate_0,gate_ISTRAT	
	pathobj	1000,3000,0000,1000,nullshape,e_gate,10,10
	mapwait	2000
	mapobj	0000,0800,-600,5000,RO_6,hard180yr_ISTRAT   ;
	setalvar	rotz,deg180
.woodmiss	mapobj	0000,-200,0000,3000,miss_1_1,nocoll_Istrat
	setvarobj	mapvar1
	mapobj	0000,-200,-20,3000,miss_1_2,woods_Istrat
	setalvarptr.w	ptr,mapvar1
	setalvar	rotx,-deg90
	mapobj	0000,200,0000,3000,miss_1_1,nocoll_Istrat
	setvarobj	mapvar1
	mapobj	0000,200,-20,3000,miss_1_2,woods_Istrat
	setalvarptr.w	ptr,mapvar1
	setalvar	rotx,-deg90
	mapwait	0800
	mapobj	0000,000,-600,3500,miss_1_1,nocoll_Istrat
	setvarobj	mapvar1
	setalvar	rotx,127
	mapobj	0000,000,-580,3500,miss_1_2,woods_Istrat
	setalvarptr.w	ptr,mapvar1
	setalvar	rotx,deg90
	mapwait	0800
	maploop	.woodmiss,04
	mapobj	1000,700,0000,5000,RO_6,hard180yr_ISTRAT   ;
;friend
	pathobj	0000,-750,-400,0000,friendship_4,chase6_1,10,10
	pathobj	0400,-750,-400,0000,zaco_a,chase6_2,10,10
	pathcspecial	0000,150,-600,3000,tank_1,e_tank,10,10
	setalvar	rotz,deg180
	pathcspecial	0000,-150,-600,3000,tank_1,e_tank,10,10
	setalvar	rotz,deg180
	mapobj	1000,-800,0000,5000,RO_6,hard180yr_ISTRAT   ;
	mapobj	2000,0000,0000,5000,RO_6,hard180yr_ISTRAT   ;
	mapobj	1000,-800,0000,5000,RO_6,hard180yr_ISTRAT   ;
	mapobj	0000,600,-600,5000,RO_6,hard180yr_ISTRAT   ;
	setalvar	rotz,deg180
	cspecial	1000,0000,0000,3300,hou_5,houdai5f_ISTRAT   ;           ;
	mapobj	1000,-900,0000,5000,RO_6,hard180yr_ISTRAT   ;
;fire_balls
	
	mapobj	2000,0800,0000,5000,RO_6,hard180yr_ISTRAT   ;
	pathcspecial	1000,-300,-600,3300,hou_5,saka_hou,10,10
	pathcspecial	1000,-100,-600,3300,hou_5,saka_hou,10,10
	mapobj	0000,-800,-600,5000,RO_6,hard180yr_ISTRAT   ;
	setalvar	rotz,deg180
	mapobj	0000,0700,0000,5000,RO_6,hard180yr_ISTRAT   ;
	cspecial	1000,0000,0000,3300,hou_5,houdai5f_ISTRAT
	cspecial	1000,-200,0000,3300,hou_5,houdai5f_ISTRAT 
	cspecial	1000,0200,0000,3300,hou_5,houdai5f_ISTRAT 
	pathcspecial	1000,-300,-600,3300,hou_5,saka_hou,10,10
	pathcspecial	1000,0300,-600,3300,hou_5,saka_hou,10,10
	cspecial	1000,-400,0000,3300,hou_5,houdai5f_ISTRAT
	cspecial	1000,0400,0000,3300,hou_5,houdai5f_ISTRAT
	cspecial	1000,0000,0000,3300,hou_5,houdai5f_ISTRAT
	cspecial	1000,-500,0000,3300,hou_5,houdai5f_ISTRAT
	cspecial	1000,0500,0000,3300,hou_5,houdai5f_ISTRAT
	mapobj	2000,000,0,4000,volcano,volcano_Istrat

	pathcspecial	1000,0000,-600,3300,hou_5,saka_hou,10,10
	pathcspecial	0000,-400,-600,3300,hou_5,saka_hou,10,10
	pathcspecial	1000,0400,-600,3300,hou_5,saka_hou,10,10
	pathcspecial	0000,-200,-600,3300,hou_5,saka_hou,10,10
	pathcspecial	0000,0200,-600,3300,hou_5,saka_hou,10,10
	pathcspecial	0000,000,-600,3000,tank_1,e_tank,10,10
	setalvar	rotz,deg180
	mapobj	0400,-500,0000,5000,RO_6,hard180yr_ISTRAT   ;
	mapobj	0800,0500,0000,5000,RO_6,hard180yr_ISTRAT   ;
	mapobj	0000,-300,-600,5000,RO_6,hard180yr_ISTRAT   ;
	setalvar	rotz,deg180
	mapobj	2000,0200,0000,5000,RO_6,hard180yr_ISTRAT   ;
	mapobj	0000,-800,-600,5000,RO_6,hard180yr_ISTRAT   ;
	setalvar	rotz,deg180


; boss 2 test
	fadeoutbgm
	setbgm	5
	mapobj	0000,0000,0<<boss2_scale,4000,boss_2_2,boss2_Istrat
	mapwaitboss
	mapobj	0000,1000,0000,5000,RO_6,hard180yr_ISTRAT   ;
	mapobj	0000,-1000,0000,8000,RO_6,hard180yr_ISTRAT   ;
	markboss	boss35
	mapwait	0500+15*medpspeed
	maprts


