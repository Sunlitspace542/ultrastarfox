
;--------------------------------------------------------------------
;--------------------------------------------------------------------
;--------------------------------------------------------------------
;--------------------------------------------------------------------
;--------------------------------------------------------------------
;--------------------------------------------------------------------
;--------------------------------------------------------------------
;--------------------------------------------------------------------


	INCPUBLICS	colboxes.ext



;colbox	MACRO ; next,xoff,yoff,zoff,rot[x/y/z]|norot,xmax,ymax,zmax,flags to set,flags to clear[,scale]
; collision box for first cube


playerB_col		colbox	playerLW_col,0,0,playerB_z,norot,playerB_boxsize,playerB_boxsize,playerB_boxsize*2,HF1,0
playerLW_col	colbox	playerRW_col,-playerW_x,playerW_y,playerW_z,rotz,playerW_boxsize,playerW_boxsize,playerW_boxsize*2,HF2,0
playerRW_col	colbox	0,playerW_x,playerW_y,playerW_z,rotz,playerW_boxsize,playerW_boxsize,playerW_boxsize*2,HF3,0
;playerDEF_col	colbox	0,0,0,playerB_z,norot,30,30,30,HF4,0

TplayerB_col	colbox	playerLW_col,0,0,playerB_z,norot,playerB_boxsize,playerB_boxsize,playerB_boxsize,HF1,0
TplayerLW_col	colbox	playerRW_col,-TplayerW_x,playerW_y,playerW_z,rotz,playerW_boxsize,playerW_boxsize,playerW_boxsize,HF2,0
TplayerRW_col	colbox	0,TplayerW_x,playerW_y,playerW_z,rotz,playerW_boxsize,playerW_boxsize,playerW_boxsize,HF3,0





tunnel1_col1a

	colbox	tunnel1_col1,0,-65,0,norot,20,10,60,HF5,0,1
tunnel1_col1
	colbox	tunnel1_col2,-75,0,0,norot,30,90,60,HF1,0,1
tunnel1_col2
	colbox	tunnel1_col3,75,0,0,norot,30,90,60,HF2,0,1
tunnel1_col3
	colbox	tunnel1_col4,0,-75,0,norot,45,15,60,HF3,0,1
tunnel1_col4
	colframes	16
	colbox	tunnel1_col5,-23,0,-60,norot,23,60,10,HF4,0,1
	colbox	tunnel1_col5,-27,0,-60,norot,19,60,10,HF4,0,1
	colbox	tunnel1_col5,-31,0,-60,norot,15,60,10,HF4,0,1
	colbox	tunnel1_col5,-34,0,-60,norot,12,60,10,HF4,0,1
	colbox	tunnel1_col5,-38,0,-60,norot,08,60,10,HF4,0,1
	colbox	tunnel1_col5,-41,0,-60,norot,05,60,10,HF4,0,1
	colbox	tunnel1_col5,-43,0,-60,norot,03,60,10,HF4,0,1
	colbox	tunnel1_col5,-44,0,-60,norot,01,60,10,HF4,0,1
	colbox	tunnel1_col5,-44,0,-60,norot,01,60,10,HF4,0,1
	colbox	tunnel1_col5,-43,0,-60,norot,03,60,10,HF4,0,1
	colbox	tunnel1_col5,-41,0,-60,norot,05,60,10,HF4,0,1
	colbox	tunnel1_col5,-38,0,-60,norot,08,60,10,HF4,0,1
	colbox	tunnel1_col5,-34,0,-60,norot,12,60,10,HF4,0,1
	colbox	tunnel1_col5,-31,0,-60,norot,15,60,10,HF4,0,1
	colbox	tunnel1_col5,-27,0,-60,norot,19,60,10,HF4,0,1
	colbox	tunnel1_col5,-23,0,-60,norot,23,60,10,HF4,0,1

tunnel1_col5
	colframes	16
	colbox	0,-23,0,-60,norot,23,60,10,HF4,0,1
	colbox	0,-27,0,-60,norot,19,60,10,HF4,0,1
	colbox	0,-31,0,-60,norot,15,60,10,HF4,0,1
	colbox	0,-34,0,-60,norot,12,60,10,HF4,0,1
	colbox	0,-38,0,-60,norot,08,60,10,HF4,0,1
	colbox	0,-41,0,-60,norot,05,60,10,HF4,0,1
	colbox	0,-43,0,-60,norot,03,60,10,HF4,0,1
	colbox	0,-44,0,-60,norot,01,60,10,HF4,0,1
	colbox	0,-44,0,-60,norot,01,60,10,HF4,0,1
	colbox	0,-43,0,-60,norot,03,60,10,HF4,0,1
	colbox	0,-41,0,-60,norot,05,60,10,HF4,0,1
	colbox	0,-38,0,-60,norot,08,60,10,HF4,0,1
	colbox	0,-34,0,-60,norot,12,60,10,HF4,0,1
	colbox	0,-31,0,-60,norot,15,60,10,HF4,0,1
	colbox	0,-27,0,-60,norot,19,60,10,HF4,0,1
	colbox	0,-23,0,-60,norot,23,60,10,HF4,0,1

cube2_col1
	colbox	cube2_col2,-78,-10,0,rotz,10,10,10,HF1,0

cube2_col2
	colbox	0,78,-10,0,rotz,10,10,10,HF1,0


tunnel2_col1
	colbox	tunnel2_col2,-60,0,0,norot,10,70,80,HF1,0
tunnel2_col2
	colbox	tunnel2_col3,60,0,0,norot,10,70,80,HF1,0
tunnel2_col3
	colbox	0,0,-60,0,norot,70,10,80,HF1,0


tunnel3_col1
	colbox	tunnel3_col2,-stunnwidth,0,0,norot,10,stunnheight,80,HF1,0
tunnel3_col2
	colbox	tunnel3_col3,stunnwidth,0,0,norot,10,stunnheight,80,HF1,0
tunnel3_col3
	colbox	0,0,-stunnheight,0,norot,stunnwidth,10,80,HF1,0

pyramid_col1
	colbox	pyramid_col2,0,-20,0,norot,140,20,100,HF1,0
pyramid_col2
	colbox	pyramid_col3,0,-60,0,norot,80,20,80,HF1,0
pyramid_col3
	colbox	0,0,-120,0,norot,20,40,20,HF1,0


pillar2_col1
	colframes	32
	colbox	0,0,0,0,norot,8,10,15,HF1,0,1	; 0
	colbox	0,0,0,0,norot,8,10,25,HF1,0,1	; 1
	colbox	0,0,0,0,norot,8,10,33,HF1,0,1	; 2
	colbox	0,0,0,0,norot,8,10,38,HF1,0,1	; 3
	colbox	0,0,0,0,norot,8,10,45,HF1,0,1	; 4
	colbox	0,0,0,0,norot,8,10,52,HF1,0,1	; 5
	colbox	0,0,0,0,norot,8,10,61,HF1,0,1	; 6
	colbox	0,0,0,0,norot,8,10,70,HF1,0,1	; 7
	colbox	0,0,0,0,norot,8,10,79,HF1,0,1	; 8
	colbox	0,0,0,0,norot,8,10,75,HF1,0,1	; 9
	colbox	0,0,0,0,norot,8,10,66,HF1,0,1	; 10
	colbox	0,0,0,0,norot,8,10,54,HF1,0,1	; 11
	colbox	0,0,0,0,norot,8,10,42,HF1,0,1	; 12
	colbox	0,0,0,0,norot,8,10,33,HF1,0,1	; 13
	colbox	0,0,0,0,norot,8,10,24,HF1,0,1	; 14
	colbox	0,0,0,0,norot,8,10,08,HF1,0,1	; 15
	colbox	0,0,0,0,norot,8,10,08,HF1,0,1	; 16
	colbox	0,0,0,0,norot,8,10,08,HF1,0,1	; 17
	colbox	0,0,0,0,norot,8,10,08,HF1,0,1	; 18
	colbox	0,0,0,0,norot,8,10,08,HF1,0,1	; 19
	colbox	0,0,0,0,norot,8,10,08,HF1,0,1	; 20
	colbox	0,0,0,0,norot,8,10,08,HF1,0,1	; 21
	colbox	0,0,0,0,norot,8,10,08,HF1,0,1	; 22
	colbox	0,0,0,0,norot,8,10,08,HF1,0,1	; 23
	colbox	0,0,0,0,norot,8,10,08,HF1,0,1	; 24
	colbox	0,0,0,0,norot,8,10,08,HF1,0,1	; 25
	colbox	0,0,0,0,norot,8,10,08,HF1,0,1	; 26
	colbox	0,0,0,0,norot,8,10,08,HF1,0,1	; 27
	colbox	0,0,0,0,norot,8,10,08,HF1,0,1	; 28
	colbox	0,0,0,0,norot,8,10,08,HF1,0,1	; 29
	colbox	0,0,0,0,norot,8,10,08,HF1,0,1	; 30
	colbox	0,0,0,0,norot,8,10,08,HF1,0,1	; 31

;--------------------------------------------------------------
;--------------------------------------------------------------
;--------------------------------------------------------------
;--------------------------------------------------------------
;--------------------------------------------------------------
pillar3_col1	colbox	pillar3_col2,0,-10,0,norot,6,5,6,HF2,0,2
pillar3_col2	colbox	pillar3_col3,0,-20,0,rotz,6,5,6,HF1,0,2
pillar3_col3	colbox	pillar3_col4,0,-30,0,rotz,6,5,6,HF1,0,2
pillar3_col4	colbox	pillar3_col5,0,-40,0,rotz,6,5,6,HF1,0,2
pillar3_col5	colbox	pillar3_col6,0,-50,0,rotz,6,5,6,HF1,0,2
pillar3_col6	colbox	pillar3_col7,0,-60,0,rotz,6,5,6,HF1,0,2
pillar3_col7	colbox	pillar3_col8,0,-70,0,rotz,6,5,6,HF1,0,2
pillar3_col8	colbox	0,0,-80,0,rotz,6,5,6,HF1,0,2

pillar3ns_col1	colbox	pillar3ns_col2,0,0,10,norot,6,5,6,HF2,0,2
pillar3ns_col2	colbox	pillar3ns_col3,0,0,20,roty,6,5,6,HF1,0,2
pillar3ns_col3	colbox	pillar3ns_col4,0,0,30,roty,6,5,6,HF1,0,2
pillar3ns_col4	colbox	pillar3ns_col5,0,0,40,roty,6,5,6,HF1,0,2
pillar3ns_col5	colbox	pillar3ns_col6,0,0,50,roty,6,5,6,HF1,0,2
pillar3ns_col6	colbox	pillar3ns_col7,0,0,60,roty,6,5,6,HF1,0,2
pillar3ns_col7	colbox	pillar3ns_col8,0,0,70,roty,6,5,6,HF1,0,2
pillar3ns_col8	colbox	0,0,0,80,roty,6,5,6,HF1,0,2



floor1_col1
	colframes	8
	colbox	0,0,0,0,norot,100,31*2,15,HF1,0,1	; first frame has no hole
	colbox	floor1_col2,-80,0,0,norot,20,37*2,15,HF1,0,1
	colbox	floor1_col2,-80,0,0,norot,20,41*2,15,HF1,0,1
	colbox	floor1_col2,-80,0,0,norot,20,47*2,15,HF1,0,1
	colbox	floor1_col2,-80,0,0,norot,20,51*2,15,HF1,0,1
	colbox	floor1_col2,-80,0,0,norot,20,57*2,15,HF1,0,1
	colbox	floor1_col2,-80,0,0,norot,20,61*2,15,HF1,0,1
	colbox	floor1_col2,-80,0,0,norot,20,66*2,15,HF1,0,1

floor1_col2
	colframes	8
	colbox	floor1_col3,80,0,0,norot,20,31*2,15,HF1,0,1
	colbox	floor1_col3,80,0,0,norot,20,37*2,15,HF1,0,1
	colbox	floor1_col3,80,0,0,norot,20,41*2,15,HF1,0,1
	colbox	floor1_col3,80,0,0,norot,20,47*2,15,HF1,0,1
	colbox	floor1_col3,80,0,0,norot,20,51*2,15,HF1,0,1
	colbox	floor1_col3,80,0,0,norot,20,57*2,15,HF1,0,1
	colbox	floor1_col3,80,0,0,norot,20,61*2,15,HF1,0,1
	colbox	floor1_col3,80,0,0,norot,20,66*2,15,HF1,0,1

floor1_col3
	colframes	8
	colbox	0,0,-15*2,0,norot,100,15*2,15,HF1,0,1
	colbox	0,0,-20*2,0,norot,100,15*2,15,HF1,0,1
	colbox	0,0,-25*2,0,norot,100,15*2,15,HF1,0,1
	colbox	0,0,-30*2,0,norot,100,15*2,15,HF1,0,1
	colbox	0,0,-35*2,0,norot,100,15*2,15,HF1,0,1
	colbox	0,0,-40*2,0,norot,100,15*2,15,HF1,0,1
	colbox	0,0,-45*2,0,norot,100,15*2,15,HF1,0,1
	colbox	0,0,-50*2,0,norot,100,15*2,15,HF1,0,1





floor2_col1
	colframes	8
	colbox	0,0,0,0,norot,100,31*2,15,HF1,0,1
	colbox	0,0,0,0,norot,100,37*2,15,HF1,0,1
	colbox	0,0,0,0,norot,100,41*2,15,HF1,0,1
	colbox	0,0,0,0,norot,100,47*2,15,HF1,0,1
	colbox	0,0,0,0,norot,100,51*2,15,HF1,0,1
	colbox	0,0,0,0,norot,100,57*2,15,HF1,0,1
	colbox	0,0,0,0,norot,100,61*2,15,HF1,0,1
	colbox	0,0,0,0,norot,100,66*2,15,HF1,0,1


walker_col1
	colbox	walker_col2,-20,0,0,roty,4,94,4,HF1,0,2
walker_col2	colbox	walker_col3,20,0,0,roty,4,94,4,HF2,0,2
walker_col3	colbox	0,0,-80,0,rotz,15,15,15,HF3,0,2

wall1_col1
	colbox	0,0,0,10,norot,10,40,10,HF1,0,3

walll_col1
	colbox	0,-55,0,0,norot,55,40,5,HF2,0,3

wallr_col1
	colbox	0,55,0,0,norot,55,40,5,HF2,0,3


beambox_col1	colbox	beambox_col2,0,-30,0,rotz,65,40,40,HF2,0
beambox_col2	colbox	beambox_col3,080,-20,0,rotz,20,25,50,HF1,0
beambox_col3	colbox	0,-80,-20,0,rotz,20,25,50,HF1,0

swingwal_col1
	colbox	swingwal_col1a,0,-30,0,rotx,40,10,30,HF3,0,1
swingwal_col1a
	colbox	swingwal_col1b,0,-10,0,rotx,40,10,30,HF3,0,1
swingwal_col1b
	colbox	swingwal_col1c,0,10,0,rotx,40,10,30,HF3,0,1
swingwal_col1c
	colbox	swingwal_col2,0,30,0,rotx,40,10,30,HF3,0,1



swingwal_col2
	colbox	swingwal_col3,0,-30,0,rotx,240,30,30,HF1,0
swingwal_col3
	colbox	swingwal_col4,0,30,0,rotx,240,30,30,HF2,0
swingwal_col4
	colbox	0,0,0,0,norot,240,30,30,HF3,0


; colbox	MACRO ; next,xoff,yoff,zoff,rotz,xmax,ymax,zmax,flags to set,flags to clear

r0bs	equ	10
r0bbs	equ	15
round0_col1
	colbox	round0_col2,0,0,0,norot,r0bbs,r0bbs,r0bbs,HF1,0
round0_col2
	colbox	round0_col3,0,-55,55,rotz,r0bs,r0bs,r0bs,HF2,0
round0_col3
	colbox	round0_col4,55,0,55,rotz,r0bs,r0bs,r0bs,HF3,0
round0_col4
	colbox	round0_col5,0,55,55,rotz,r0bs,r0bs,r0bs,HF4,0
round0_col5
	colbox	0,-55,0,55,rotz,r0bs,r0bs,r0bs,HF5,0


boss_1_0_col
	colbox	0,0,0,200,roty,40,60,20,HF1,0

boss_2_0_col	colbox	0,0,-21,35,roty,6,5,10,HF1,0,boss2_scale
boss_2_1_col	colbox	0,0,-15-20,0,rotZ,5,15,10,HF1,0,boss2_scale

ship_1_col	colbox	ship_1_col1,0,0+30,60-11,roty,20,15,50,HF1,0,5
ship_1_col1	colbox	0,0,-35+30,-11,norot,10,10,20,HF2,0,5

ship_2_col	colbox	0,0,0,80,roty,20,15,40,HF1,0,2
ship_3_col	colbox	0,0,0,0,roty,45,35,100,HF1,0,1

boss_5_0_col		colbox	boss_5_0_col1,-37,0,0,norot,7,4,10,HF1,0,boss5_scale
boss_5_0_col1	colbox	boss_5_0_col2,37,0,0,norot,7,4,10,HF2,0,boss5_scale
boss_5_0_col2	colbox	boss_5_0_col3,0,-37,0,norot,4,7,10,HF3,0,boss5_scale
boss_5_0_col3	colbox	0,0,37,0,norot,4,7,10,HF4,0,boss5_scale

boss_5_1u_col	colbox	boss_5_1u_col1,0,12,-20,norot,5,7,20,HF1,0,boss5_scale
boss_5_1u_col1	colbox	0,0,-7,-20,norot,35,5,20,HF1,0,boss5_scale

boss_5_1d_col	colbox	boss_5_1d_col1,0,-12,-20,norot,5,7,20,HF1,0,boss5_scale
boss_5_1d_col1	colbox	0,0,7,-20,norot,35,5,20,HF1,0,boss5_scale

boss_5_1l_col	colbox	boss_5_1l_col1,12,0,-20,norot,7,5,20,HF1,0,boss5_scale
boss_5_1l_col1	colbox	0,-7,0,-20,norot,5,35,20,HF1,0,boss5_scale

boss_5_1r_col	colbox	boss_5_1r_col1,-12,0,-20,norot,7,5,20,HF1,0,boss5_scale
boss_5_1r_col1	colbox	0,7,0,-20,norot,5,35,20,HF1,0,boss5_scale



boss_7_0_col	colbox	0,10-20,0,-20,roty,10,20,20,HF1,0,boss7_scale
boss_7_1_col	colbox	boss_7_1_col1,0,-10,-30,roty,10,10,10,HF1,0,boss7_scale
boss_7_1_col1	colbox	0,0,5,7,roty,5,5,10,HF2,0,boss7_scale
boss_7_2_col	colbox	0,-5+20,0,-20,roty,5,20,20,HF1,0,boss7_scale


boss_7_3_col	colframes	16
	colbox	0,50-30,0,0,roty,15,15,45,HF1,0,boss7_scale
	colbox	0,50-30,0,0,roty,15,15,45,HF1,0,boss7_scale
	colbox	0,50-30,0,0,roty,15,15,45,HF1,0,boss7_scale
	colbox	0,50-30,0,0,roty,15,15,45,HF1,0,boss7_scale
	colbox	0,50-30,0,0,roty,15,15,45,HF1,0,boss7_scale
	colbox	0,50-30,0,0,roty,15,15,45,HF1,0,boss7_scale
	colbox	0,50-30,0,0,roty,15,15,45,HF1,0,boss7_scale

	colbox	0,50-30,0,-20,roty,15,15,20,HF2,0,boss7_scale
	colbox	0,50-30,0,-20,roty,15,15,20,HF2,0,boss7_scale
	colbox	0,50-30,0,-20,roty,15,15,20,HF2,0,boss7_scale
	colbox	0,50-30,0,-20,roty,15,15,20,HF2,0,boss7_scale
	colbox	0,50-30,0,-20,roty,15,15,20,HF2,0,boss7_scale
	colbox	0,50-30,0,-20,roty,15,15,20,HF2,0,boss7_scale
	colbox	0,50-30,0,-20,roty,15,15,20,HF2,0,boss7_scale
	colbox	0,50-30,0,-20,roty,15,15,20,HF2,0,boss7_scale
	colbox	0,50-30,0,-20,roty,15,15,20,HF2,0,boss7_scale


boss_7_4_col	colframes    16
	colbox	0,50-30,0,0,roty,15,15,45,HF1,0,boss7_scale
	colbox	0,50-30,0,0,roty,15,15,45,HF1,0,boss7_scale
	colbox	0,50-30,0,0,roty,15,15,45,HF1,0,boss7_scale
	colbox	0,50-30,0,0,roty,15,15,45,HF1,0,boss7_scale
	colbox	0,50-30,0,0,roty,15,15,45,HF1,0,boss7_scale
	colbox	0,50-30,0,0,roty,15,15,45,HF1,0,boss7_scale
	colbox	0,50-30,0,0,roty,15,15,45,HF1,0,boss7_scale
		     
	colbox	0,50-30,0,-20,roty,15,15,20,HF2,0,boss7_scale
	colbox	0,50-30,0,-20,roty,15,15,20,HF2,0,boss7_scale
	colbox	0,50-30,0,-20,roty,15,15,20,HF2,0,boss7_scale
	colbox	0,50-30,0,-20,roty,15,15,20,HF2,0,boss7_scale
	colbox	0,50-30,0,-20,roty,15,15,20,HF2,0,boss7_scale
	colbox	0,50-30,0,-20,roty,15,15,20,HF2,0,boss7_scale
	colbox	0,50-30,0,-20,roty,15,15,20,HF2,0,boss7_scale
	colbox	0,50-30,0,-20,roty,15,15,20,HF2,0,boss7_scale
	colbox	0,50-30,0,-20,roty,15,15,20,HF2,0,boss7_scale




;boss_7_3_col	colbox	boss_7_3_col1,-20+15,-20,0,roty,15,15,20,HF1,0,boss7_scale
;boss_7_3_col1	colbox	0,-17+30,-16+15,40,roty,7,6,3,HF2,0,boss7_scale

;boss_7_4_col	colbox	boss_7_4_col1,20-25,20-35,0,roty,15,15,20,HF1,0,boss7_scale
;boss_7_4_col1	colbox	0,-17+30,16-25,40,roty,7,6,3,HF2,0,boss7_scale

boss_8_1_col	colbox	boss_8_1_col1,0,-15,0,norot,30,20,20,HF1,0,boss8_scale
boss_8_1_col1	colbox	0,0,-85,0,norot,30,20,20,HF1,0,boss8_scale

boss_f_col	colbox	boss_f_col1,0,-20,-25,roty,20,10,15,HF1,0,bossF_scale
boss_f_col1	colbox	0,0,0,0,norot,60,10,60,HF1,0,bossF_scale

evader_col		colbox	evader_col1,0,0,0,norot,300,300,300,HF1,0
evader_col1		colbox	0,0,0,0,norot,70,60,45,HF2,0

bu_8_col		colbox	0,0,-20,20,roty,20,20,20,HF1,0,bu_scale
bu_0_col		colbox	0,0,-20,20,roty,20,20,20,HF1,0,bu_scale2
bu_1_col		colbox	0,0,-50,20,roty,20,50,20,HF1,0,bu_scale
bu_2_col		colbox	0,0,-35,10,roty,10,35,10,HF1,0,bu_scale2
bu_3_col		colbox	0,0,-50,40,roty,20,50,40,HF1,0,bu_scale

bu_4_col		colbox	bu_4_col1,30,-50,-30,roty,20,50,20,HF1,0,bu_scale
bu_4_col1		colbox	bu_4_col2,30,-22,30,roty,20,22,20,HF1,0,bu_scale
bu_4_col2		colbox	bu_4_col3,-30,-22,-30,roty,20,22,20,HF1,0,bu_scale
bu_4_col3		colbox	0,-30,-22,30,roty,20,22,20,HF1,0,bu_scale

bu_5_col		colbox	bu_5_col1,30,-50,0,roty,20,50,45,HF1,0,bu_scale
bu_5_col1		colbox	bu_5_col2,-30,-22,-30,roty,20,22,20,HF1,0,bu_scale
bu_5_col2		colbox	0,-30,-22,30,roty,20,22,20,HF1,0,bu_scale

bu_6_col		colbox	bu_6_col1,30,-50,-30,roty,20,50,20,HF1,0,bu_scale
bu_6_col1		colbox	bu_6_col2,30,-50,30,roty,20,50,20,HF1,0,bu_scale
bu_6_col2		colbox	bu_6_col3,-30,-50,-30,roty,20,50,20,HF1,0,bu_scale
bu_6_col3		colbox	0,-30,-50,30,roty,20,50,20,HF1,0,bu_scale

;bu_7_col		colbox	0,0,-40,0,norot,20,40,40,HF1,0,bu_scale

sparklas_col		colbox	sparklas_col2,0,0,0,norot,7,14,100,HF1,0,3
sparklas_col2		colbox	0,0,0,80,roty,7,14,5,HF2,0,3

core1_0_col		colbox	core1_0_col2,0,-8,0,norot,30,8,20,HF1,0,1
core1_0_col2		colbox	0,0,-52,0,norot,20,8,20,HF1,0,1
core1_1_col		colbox	0,0,-30,0,norot,13,13,20,HF1,0,1


scii	=	14
sci	=	0

iris_col1
	colframes	8
	REPT	8

iris_boxh	=	(iris_h-sci)/2
iris_boxy	=	iris_boxh+sci-iris_h
iris_boxz	=	50

sci	=	sci+scii

	colbox	iris_1_col2,0,iris_boxy,0,norot,iris_w,iris_boxh,iris_boxz,HF1,0
	ENDR

sci	=	0

iris_1_col2
	colframes	8
	REPT	8

iris_boxh	=	(iris_h-sci)/2
iris_boxy	=	iris_boxh+sci-iris_h
sci	=	sci+scii

	colbox	iris_1_col3,0,-iris_boxy,0,norot,iris_w,iris_boxh,iris_boxz,HF1,0

	ENDR

sci	=	0

iris_1_col3
	colframes	8
	REPT	8

iris_boxw	=	(iris_w-sci)/2
iris_boxx	=	iris_boxw+sci

sci	=	sci+scii

	colbox	iris_1_col4,iris_boxx,-iris_h,0,norot,iris_boxw,iris_h,iris_boxz,HF1,0

	ENDR

sci	=	0

iris_1_col4
	colframes	8
	REPT	8

iris_boxw	=	(iris_w-sci)/2
iris_boxx	=	iris_boxw+sci

sci	=	sci+scii

	colbox	0,-iris_boxx,-iris_h,0,norot,iris_boxw,iris_h,iris_boxz,HF1,0
	ENDR



arm_col1	colbox	arm_col2,0,0,10,rotx,5,5,10,HF1,0,1
arm_col2	colbox	arm_col3,0,0,30,rotx,5,5,10,HF1,0,1
arm_col3	colbox	arm_col4,0,0,50,rotx,5,5,10,HF1,0,1
arm_col4	colbox	0,0,0,70,rotx,5,5,10,HF1,0,1

air_col	colbox	0,0,-8,50,norot,15,8,80,HF1,0




trucker_col

trucker_cols	colbox	trucker_col1,0,6,0,norot,30,20,20,HF2,0
trucker_col1	colbox	trucker_col2,0,12,95,norot,58,52,85,HF1,0
trucker_col2	colbox	trucker_col3,-50,12,-55,norot,8,52,65,HF1,0
trucker_col3	colbox	trucker_col4,50,12,-55,norot,8,52,65,HF1,0
trucker_col4	colbox	trucker_col5,0,-34,-55,norot,58,6,65,HF1,0
trucker_col5	colbox	0,0,44,-55,norot,58,20,65,HF1,0


	IFEQ	1
	dw	0,0,0,0,0,0,0
	db	0,0,0

	dw	0,0,0,0,0,0,0
	db	0,0,0

	dw	0,0,0,0,0,0,0
	db	0,0,0

	dw	0,0,0,0,0,0,0
	db	0,0,0

	dw	0,0,0,0,0,0,0
	db	0,0,0

	dw	0,0,0,0,0,0,0
	db	0,0,0

	dw	0,0,0,0,0,0,0
	db	0,0,0

	dw	0,0,0,0,0,0,0
	db	0,0,0

	colbox	0,0,12,40,norot,40,58,40,HF1,0
	colbox	0,0,12,40,norot,40,58,40,HF1,0
	colbox	0,0,12,40,norot,40,58,40,HF1,0
	colbox	0,0,12,40,norot,40,58,40,HF1,0
	colbox	0,0,25,20,norot,40,5,10,HF1,0
	colbox	0,0,25,20,norot,40,5,10,HF1,0
	colbox	0,0,25,20,norot,40,5,10,HF1,0
	colbox	0,0,25,20,norot,40,5,10,HF1,0
	ENDC



boss_B_col		colbox	boss_B_col1,0,0,0,roty,20,15,20,HF1,0,bossB_scale
boss_B_col1		colbox	boss_B_col2,-40,50,20,roty,10,20,30,HF2,0,bossB_scale
boss_B_col2		colbox	0,40,50,20,roty,10,20,30,HF3,0,bossB_scale







barrier_col	colbox	barrier_col2,0,0,0,norot,30,30,40,HF1,0
barrier_col2	colbox	0,0,-70,0,norot,25,50,25,HF2,0


cast3_col	colbox	cast1_col2,0,30,-10,norot,10,10,10,HF2,0,2
cast2_col	colbox	cast1_col2,-30,0,-10,norot,10,10,10,HF2,0,2
cast1_col	colbox	cast1_col2,30,0,-10,rotz,10,10,10,HF2,0,2
cast1_col2	colbox	0,0,0,0,norot,40,40,55,HF1,0,2





boss00_col	colbox	boss00_col2,0,0,0,norot,15,15,15,HF1,0,boss00_scale	; c
boss00_col2	colframes	16
	colbox	boss00_col3,0,-65,-10,rotz,10,10,10,HF1,0,boss00_scale	; a
	colbox	boss00_col3,0,-60,-20,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col3,0,-55,-30,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col3,0,-45,-35,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col3,0,-40,-40,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col3,0,-32,-50,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col3,0,-25,-50,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col3,0,-20,-60,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col3,0,-10,-60,rotz,10,10,10,HF1,0,boss00_scale
boss00_col3	colframes	16
	colbox	boss00_col4,0,-35,-10,rotz,10,10,10,HF1,0,boss00_scale	; b
	colbox	boss00_col4,0,-32,-11,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col4,0,-30,-15,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col4,0,-25,-17,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col4,0,-22,-15,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col4,0,-20,-20,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col4,0,-20,-20,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col4,0,-18,-30,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col4,0,-10,-30,rotz,10,10,10,HF1,0,boss00_scale
boss00_col4	colframes	16
	colbox	boss00_col5,-30,17,-10,rotz,10,10,10,HF1,0,boss00_scale	; d
	colbox	boss00_col5,-28,16,-11,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col5,-26,15,-15,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col5,-22,12,-17,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col5,-19,11,-15,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col5,-17,10,-20,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col5,-17,10,-20,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col5,-17,10,-30,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col5,-08,06,-30,rotz,10,10,10,HF1,0,boss00_scale
boss00_col5	colframes	16
	colbox	boss00_col6,-56,32,-10,rotz,10,10,10,HF1,0,boss00_scale	; e
	colbox	boss00_col6,-52,30,-20,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col6,-47,27,-30,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col6,-39,22,-35,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col6,-35,20,-40,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col6,-28,16,-50,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col6,-22,12,-50,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col6,-16,09,-60,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col6,-09,05,-60,rotz,10,10,10,HF1,0,boss00_scale

boss00_col6	colframes	16
	colbox	boss00_col7,30,17,-10,rotz,10,10,10,HF1,0,boss00_scale	; f
	colbox	boss00_col7,28,16,-11,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col7,26,15,-15,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col7,22,12,-17,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col7,19,11,-15,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col7,17,10,-20,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col7,17,10,-20,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col7,17,10,-30,rotz,10,10,10,HF1,0,boss00_scale
	colbox	boss00_col7,08,06,-30,rotz,10,10,10,HF1,0,boss00_scale

boss00_col7	colframes	16
	colbox	0,56,32,-10,rotz,10,10,10,HF1,0,boss00_scale	; f
	colbox	0,52,30,-20,rotz,10,10,10,HF1,0,boss00_scale
	colbox	0,47,27,-30,rotz,10,10,10,HF1,0,boss00_scale
	colbox	0,39,22,-35,rotz,10,10,10,HF1,0,boss00_scale
	colbox	0,35,20,-40,rotz,10,10,10,HF1,0,boss00_scale
	colbox	0,28,16,-50,rotz,10,10,10,HF1,0,boss00_scale
	colbox	0,22,12,-50,rotz,10,10,10,HF1,0,boss00_scale
	colbox	0,16,09,-60,rotz,10,10,10,HF1,0,boss00_scale
	colbox	0,09,05,-60,rotz,10,10,10,HF1,0,boss00_scale





sfloor1_col1
	colframes	8
	colbox	0,0,0,0,norot,90,31*2*2,15,HF1,0,0	; first frame has no hole
	colbox	sfloor1_col2,-72,0,0,norot,18,37*2,15,HF1,0,0
	colbox	sfloor1_col2,-72,0,0,norot,18,41*2,15,HF1,0,0
	colbox	sfloor1_col2,-72,0,0,norot,18,47*2,15,HF1,0,0
	colbox	sfloor1_col2,-72,0,0,norot,18,51*2,15,HF1,0,0
	colbox	sfloor1_col2,-72,0,0,norot,18,57*2,15,HF1,0,0
	colbox	sfloor1_col2,-72,0,0,norot,18,61*2,15,HF1,0,0
	colbox	sfloor1_col2,-72,0,0,norot,18,66*2,15,HF1,0,0
					   
sfloor1_col2
	colframes	8
	colbox	sfloor1_col3,72,0,0,norot,18,31*2,15,HF1,0,0
	colbox	sfloor1_col3,72,0,0,norot,18,37*2,15,HF1,0,0
	colbox	sfloor1_col3,72,0,0,norot,18,41*2,15,HF1,0,0
	colbox	sfloor1_col3,72,0,0,norot,18,47*2,15,HF1,0,0
	colbox	sfloor1_col3,72,0,0,norot,18,51*2,15,HF1,0,0
	colbox	sfloor1_col3,72,0,0,norot,18,57*2,15,HF1,0,0
	colbox	sfloor1_col3,72,0,0,norot,18,61*2,15,HF1,0,0
	colbox	sfloor1_col3,72,0,0,norot,18,66*2,15,HF1,0,0
						 
sfloor1_col3
	colframes	8
	colbox	0,0,-15*2,0,norot,90,15*2,15,HF1,0,0
	colbox	0,0,-20*2,0,norot,90,15*2,15,HF1,0,0
	colbox	0,0,-25*2,0,norot,90,15*2,15,HF1,0,0
	colbox	0,0,-30*2,0,norot,90,15*2,15,HF1,0,0
	colbox	0,0,-35*2,0,norot,90,15*2,15,HF1,0,0
	colbox	0,0,-40*2,0,norot,90,15*2,15,HF1,0,0
	colbox	0,0,-45*2,0,norot,90,15*2,15,HF1,0,0
	colbox	0,0,-50*2,0,norot,90,15*2,15,HF1,0,0




spillar2_col1
	colframes	32
	colbox	0,0,0,0,norot,8,10,10,HF1,0,1	; 0
	colbox	0,0,0,0,norot,8,10,20,HF1,0,1	; 1
	colbox	0,0,0,0,norot,8,10,30,HF1,0,1	; 2
	colbox	0,0,0,0,norot,8,10,40,HF1,0,1	; 3
	colbox	0,0,0,0,norot,8,10,50,HF1,0,1	; 4
	colbox	0,0,0,0,norot,8,10,60,HF1,0,1	; 5
	colbox	0,0,0,0,norot,8,10,70,HF1,0,1	; 6
	colbox	0,0,0,0,norot,8,10,80,HF1,0,1	; 7
	colbox	0,0,0,0,norot,8,10,90,HF1,0,1	; 8
	colbox	0,0,0,0,norot,8,10,100,HF1,0,1	; 9
	colbox	0,0,0,0,norot,8,10,110,HF1,0,1	; 10
	colbox	0,0,0,0,norot,8,10,120,HF1,0,1	; 11
	colbox	0,0,0,0,norot,8,10,120,HF1,0,1	; 12
	colbox	0,0,0,0,norot,8,10,120,HF1,0,1	; 13
	colbox	0,0,0,0,norot,8,10,120,HF1,0,1	; 14
	colbox	0,0,0,0,norot,8,10,08,HF1,0,1	; 15
	colbox	0,0,0,0,norot,8,10,08,HF1,0,1	; 16
	colbox	0,0,0,0,norot,8,10,08,HF1,0,1	; 17
	colbox	0,0,0,0,norot,8,10,08,HF1,0,1	; 18
	colbox	0,0,0,0,norot,8,10,08,HF1,0,1	; 19
	colbox	0,0,0,0,norot,8,10,08,HF1,0,1	; 20
	colbox	0,0,0,0,norot,8,10,08,HF1,0,1	; 21
	colbox	0,0,0,0,norot,8,10,08,HF1,0,1	; 22
	colbox	0,0,0,0,norot,8,10,08,HF1,0,1	; 23
	colbox	0,0,0,0,norot,8,10,08,HF1,0,1	; 24
	colbox	0,0,0,0,norot,8,10,08,HF1,0,1	; 25
	colbox	0,0,0,0,norot,8,10,08,HF1,0,1	; 26
	colbox	0,0,0,0,norot,8,10,08,HF1,0,1	; 27
	colbox	0,0,0,0,norot,8,10,08,HF1,0,1	; 28
	colbox	0,0,0,0,norot,8,10,08,HF1,0,1	; 29
	colbox	0,0,0,0,norot,8,10,08,HF1,0,1	; 30
	colbox	0,0,0,0,norot,8,10,08,HF1,0,1	; 31



flap_col	colframes 16
	colbox	0,0,12,40,norot,40,58,40,HF1,0
	colbox	0,0,12,40,norot,40,58,40,HF1,0
	colbox	0,0,12,40,norot,40,58,40,HF1,0
	colbox	0,0,12,40,norot,40,58,40,HF1,0
	colbox	0,0,12,40,norot,40,58,40,HF1,0
	colbox	0,0,12,40,norot,40,58,40,HF1,0
	colbox	0,0,12,40,norot,40,58,40,HF1,0
	colbox	0,0,12,40,norot,40,58,40,HF1,0
	colbox	0,0,12,40,norot,40,58,40,HF1,0
	colbox	0,0,12,40,norot,40,58,40,HF1,0
	colbox	0,0,12,40,norot,40,58,40,HF1,0
	colbox	0,0,12,40,norot,40,58,40,HF1,0
	colbox	0,0,25,20,norot,40,5,10,HF1,0
	colbox	0,0,25,20,norot,40,5,10,HF1,0
	colbox	0,0,25,20,norot,40,5,10,HF1,0
	colbox	0,0,25,20,norot,40,5,10,HF1,0


bossf3_col	colbox	bossf3_col2,0,-5,40,roty,10,10,15,HF1,0,bossf_scale
bossf3_col2	colbox	0,0,0,0,norot,50,15,50,HF2,0,bossf_scale

leng_0_col	colbox	leng_0_col1,-37,-27,-15,norot,7,27,15,HF1,0,1
leng_0_col1	colbox	leng_0_col2,0,-50,-15,norot,20,10,15,HF1,0,1
leng_0_col2	colbox	0,37,-27,-15,norot,7,27,15,HF1,0,1


leng_1_col	
	colframes 16
	colbox	0,0,0,0,norot,20,6,20,HF1,0,0
	colbox	0,0,0,0,norot,20,10,20,HF1,0,0
	colbox	0,0,0,0,norot,20,20,20,HF1,0,0
	colbox	0,0,0,0,norot,20,30,20,HF1,0,0
	colbox	0,0,0,0,norot,20,40,20,HF1,0,0
	colbox	0,0,0,0,norot,20,50,20,HF1,0,0
	colbox	0,0,0,0,norot,20,60,20,HF1,0,0
	colbox	0,0,0,0,norot,20,70,20,HF1,0,0
	colbox	0,0,0,0,norot,20,80,20,HF1,0,0
	colbox	0,0,0,0,norot,20,90,20,HF1,0,0
	colbox	0,0,0,0,norot,20,100,20,HF1,0,0
	colbox	0,0,0,0,norot,20,110,20,HF1,0,0
	colbox	0,0,0,0,norot,20,120,20,HF1,0,0
	colbox	0,0,0,0,norot,20,120,20,HF1,0,0
	colbox	0,0,0,0,norot,20,120,20,HF1,0,0
	colbox	0,0,0,0,norot,20,120,20,HF1,0,0




; next,xoff,yoff,zoff,rot[x/y/z]|norot,xmax,ymax,zmax,flags to set,flags to clear[,scale]
base_0_col1	colbox	base_0_col2,-50,-30,-50,norot,10,40,50,HF1,0,2	; left
base_0_col2	colbox	base_0_col3,50,-30,-50,norot,10,40,50,HF1,0,2	; right
base_0_col3	colbox	base_0_col4,0,-70,-50,norot,60,10,50,HF1,0,2	; top
base_0_col4	
	colframes	16
	colbox	base_0_colr1,20,-25,-90,norot,20,75,20,HF1,0,2	; Ldoor
	colbox	base_0_colr2,22,-30,-90,norot,17,75,20,HF1,0,2	; Ldoor
	colbox	base_0_colr3,25,-35,-90,norot,15,75,20,HF1,0,2	; Ldoor
	colbox	base_0_colr4,27,-40,-90,norot,12,75,20,HF1,0,2	; Ldoor
	colbox	base_0_colr5,30,-45,-90,norot,10,75,20,HF1,0,2	; Ldoor
	colbox	base_0_colr6,32,-50,-90,norot,8,75,20,HF1,0,2	; Ldoor
	colbox	base_0_colr7,35,-55,-90,norot,5,75,20,HF1,0,2	; Ldoor
	colbox	base_0_colr8,37,-60,-90,norot,2,75,20,HF1,0,2	; Ldoor
	colbox	base_0_colr9,40,-65,-90,norot,0,75,20,0,0,2	; Ldoor
		

base_0_colr1	colbox	0,-20,-25,-90,norot,20,75,20,HF1,HF1,2	; Rdoor
base_0_colr2	colbox	0,-22,-30,-90,norot,17,75,20,HF1,0,2	; Rdoor
base_0_colr3	colbox	0,-25,-35,-90,norot,15,75,20,HF1,0,2	; Rdoor
base_0_colr4	colbox	0,-27,-40,-90,norot,12,75,20,HF1,0,2	; Rdoor
base_0_colr5	colbox	0,-30,-45,-90,norot,10,75,20,HF1,0,2	; Rdoor
base_0_colr6	colbox	0,-32,-50,-90,norot,8,75,20,HF1,0,2	; Rdoor
base_0_colr7	colbox	0,-35,-55,-90,norot,5,75,20,HF1,0,2	; Rdoor
base_0_colr8	colbox	0,-37,-60,-90,norot,2,75,20,HF1,0,2	; Rdoor
base_0_colr9	colbox	0,-40,-65,-90,norot,0,75,20,0,0,2	; Rdoor
		  



crane_0_col	colbox	crane_0_col1,-15,-22,0,norot,5,20,20,HF1,0,0   	; bottom L
crane_0_col1	colbox	crane_0_col2,15,-22,0,norot,5,20,20,HF1,0,0   	; bottom R
crane_0_col2	colbox	0,0,-57,0,norot,20,20,20,HF2,0,0	; top 

walk_4_0col	colbox	0,0,-10,0,rotY,30,10,10,HF1,0,2
walk_4_lcol	colbox	0,34,18,0,rotY,5,18,10,HF1,0,2
walk_4_rcol	colbox	0,-34,18,0,rotY,5,18,10,HF1,0,2


;-----------------------------------------------------------------------------------
cscale	=	2
len	=	(Xspacebarlen/2)>>cscale
size	=	Xspacebarsize>>cscale
Xspacebar_col	colbox	Xspacebar_col1,((len-size)-(0*(size*2))),0,0,rotZ,size,size,size,HF1,0,cscale
Xspacebar_col1	colbox	Xspacebar_col2,((len-size)-(1*(size*2))),0,0,rotZ,size,size,size,HF1,0,cscale
Xspacebar_col2	colbox	Xspacebar_col3,((len-size)-(2*(size*2))),0,0,rotZ,size,size,size,HF1,0,cscale
Xspacebar_col3	colbox	Xspacebar_col4,((len-size)-(3*(size*2))),0,0,rotZ,size,size,size,HF1,0,cscale
Xspacebar_col4	colbox	Xspacebar_col5,((len-size)-(4*(size*2))),0,0,rotZ,size,size,size,HF1,0,cscale
Xspacebar_col5	colbox	Xspacebar_col6,((len-size)-(5*(size*2))),0,0,rotZ,size,size,size,HF1,0,cscale
Xspacebar_col6	colbox	Xspacebar_col7,((len-size)-(6*(size*2))),0,0,rotZ,size,size,size,HF1,0,cscale
Xspacebar_col7	colbox	Xspacebar_col8,((len-size)-(7*(size*2))),0,0,rotZ,size,size,size,HF1,0,cscale
Xspacebar_col8	colbox	Xspacebar_col9,((len-size)-(8*(size*2))),0,0,rotZ,size,size,size,HF1,0,cscale
Xspacebar_col9	colbox	0,((len-size)-(9*(size*2))),0,0,rotZ,size,size,size,HF1,0,cscale-1



cscale	=	2
len	=	(SXspacebarlen/2)>>cscale
size	=	SXspacebarsize>>cscale
SXspacebar_col	colbox	SXspacebar_col1,((len-size)-(0*(size*2))),0,0,rotZ,size,size,size,HF1,0,cscale
SXspacebar_col1	colbox	SXspacebar_col2,((len-size)-(1*(size*2))),0,0,rotZ,size,size,size,HF1,0,cscale
SXspacebar_col2	colbox	SXspacebar_col3,((len-size)-(2*(size*2))),0,0,rotZ,size,size,size,HF1,0,cscale
SXspacebar_col3	colbox	SXspacebar_col4,((len-size)-(3*(size*2))),0,0,rotZ,size,size,size,HF1,0,cscale
SXspacebar_col4	colbox	SXspacebar_col5,((len-size)-(4*(size*2))),0,0,rotZ,size,size,size,HF1,0,cscale
SXspacebar_col5	colbox	SXspacebar_col6,((len-size)-(5*(size*2))),0,0,rotZ,size,size,size,HF1,0,cscale
SXspacebar_col6	colbox	SXspacebar_col7,((len-size)-(6*(size*2))),0,0,rotZ,size,size,size,HF1,0,cscale
SXspacebar_col7	colbox	SXspacebar_col8,((len-size)-(7*(size*2))),0,0,rotZ,size,size,size,HF1,0,cscale
SXspacebar_col8	colbox	SXspacebar_col9,((len-size)-(8*(size*2))),0,0,rotZ,size,size,size,HF1,0,cscale
SXspacebar_col9	colbox	0,((len-size)-(9*(size*2))),0,0,rotZ,size,size,size,HF1,0,cscale-1


;-----------------------------------------------------------------------------------
cscale	=	2
len	=	(Xspacebarlen/2)>>cscale
size	=	Xspacebarsize>>cscale
XspacebarRotY_col	colbox	XspacebarRotY_col1,((len-size)-(0*(size*2)))-len,0,0,rotY,size,size,size,HF1,0,cscale
XspacebarRotY_col1	colbox	XspacebarRotY_col2,((len-size)-(1*(size*2)))-len,0,0,rotY,size,size,size,HF1,0,cscale
XspacebarRotY_col2	colbox	XspacebarRotY_col3,((len-size)-(2*(size*2)))-len,0,0,rotY,size,size,size,HF1,0,cscale
XspacebarRotY_col3	colbox	XspacebarRotY_col4,((len-size)-(3*(size*2)))-len,0,0,rotY,size,size,size,HF1,0,cscale
XspacebarRotY_col4	colbox	XspacebarRotY_col5,((len-size)-(4*(size*2)))-len,0,0,rotY,size,size,size,HF1,0,cscale
XspacebarRotY_col5	colbox	XspacebarRotY_col6,((len-size)-(5*(size*2)))-len,0,0,rotY,size,size,size,HF1,0,cscale
XspacebarRotY_col6	colbox	XspacebarRotY_col7,((len-size)-(6*(size*2)))-len,0,0,rotY,size,size,size,HF1,0,cscale
XspacebarRotY_col7	colbox	XspacebarRotY_col8,((len-size)-(7*(size*2)))-len,0,0,rotY,size,size,size,HF1,0,cscale
XspacebarRotY_col8	colbox	XspacebarRotY_col9,((len-size)-(8*(size*2)))-len,0,0,rotY,size,size,size,HF1,0,cscale
XspacebarRotY_col9	colbox	0,((len-size)-(9*(size*2)))-len,0,0,rotY,size,size,size,HF1,0,cscale-1



cscale	=	2
len	=	(SXspacebarlen/2)>>cscale
size	=	SXspacebarsize>>cscale
SXspacebarRotY_col	colbox	SXspacebarRotY_col1,((len-size)-(0*(size*2)))-len,0,0,rotY,size,size,size,HF1,0,cscale
SXspacebarRotY_col1	colbox	SXspacebarRotY_col2,((len-size)-(1*(size*2)))-len,0,0,rotY,size,size,size,HF1,0,cscale
SXspacebarRotY_col2	colbox	SXspacebarRotY_col3,((len-size)-(2*(size*2)))-len,0,0,rotY,size,size,size,HF1,0,cscale
SXspacebarRotY_col3	colbox	SXspacebarRotY_col4,((len-size)-(3*(size*2)))-len,0,0,rotY,size,size,size,HF1,0,cscale
SXspacebarRotY_col4	colbox	SXspacebarRotY_col5,((len-size)-(4*(size*2)))-len,0,0,rotY,size,size,size,HF1,0,cscale
SXspacebarRotY_col5	colbox	SXspacebarRotY_col6,((len-size)-(5*(size*2)))-len,0,0,rotY,size,size,size,HF1,0,cscale
SXspacebarRotY_col6	colbox	SXspacebarRotY_col7,((len-size)-(6*(size*2)))-len,0,0,rotY,size,size,size,HF1,0,cscale
SXspacebarRotY_col7	colbox	SXspacebarRotY_col8,((len-size)-(7*(size*2)))-len,0,0,rotY,size,size,size,HF1,0,cscale
SXspacebarRotY_col8	colbox	SXspacebarRotY_col9,((len-size)-(8*(size*2)))-len,0,0,rotY,size,size,size,HF1,0,cscale
SXspacebarRotY_col9	colbox	0,((len-size)-(9*(size*2)))-len,0,0,rotY,size,size,size,HF1,0,cscale-1



face_0col	colbox	face_0colL,0,0,15,norot,30,50,10,HF1,0,4
face_0colL	colbox	face_0colR,-20,-30,0,norot,10,10,10,HF2,0,4
face_0colR	colbox	0,20,-30,0,norot,10,10,10,HF3,0,4

face_1col	colbox	face_1colL,0,0,15,norot,30,50,10,HF1,0,4
face_1colL	colbox	face_1colR,-15,-15,0,norot,10,10,10,HF2,0,4
face_1colR	colbox	0,15,-15,0,norot,10,10,10,HF3,0,4


arch_0_col	colbox	arch_0_col1,-25,-15,0,norot,5,15,5,HF1,0,2
arch_0_col1	colbox	arch_0_col2,25,-15,0,norot,5,15,5,HF1,0,2
arch_0_col2	colbox	0,0,-35,0,norot,15,5,5,HF1,0,2


;--------------------------------------------------------------------
;--------------------------------------------------------------------
;--------------------------------------------------------------------
;--------------------------------------------------------------------

base_1_col1	colbox	base_1_col2,-32,-20,5,norot,7,20,30,HF1,0,3
base_1_col2	colbox	base_1_col3,32,-20,5,norot,7,20,30,HF1,0,3
base_1_col3	colbox	base_1_col4,0,-47,5,norot,40,7,30,HF1,0,3
base_1_col4	colframes	8
b1c_y	=	-40
	REPT	8
b1c_hgt	=	-((-40-b1c_y)/2)
b1c_pos	=	-35+b1c_hgt
	colbox	0,0,b1c_pos,-30,norot,25,b1c_hgt,05,HF1,0,3
b1c_y	=	b1c_y+(40/7)
	ENDR

;--------------------------------------------------------------------
;--------------------------------------------------------------------

big_gate_col1
	colbox	big_gate_col2,-45,-25,0,norot,5,25,55,HF1,0,2
big_gate_col2
	colbox	big_gate_col3,45,-25,0,norot,5,25,55,HF1,0,2
big_gate_col3
	colbox	0,0,-55,0,norot,50,5,55,HF1,0,2

;--------------------------------------------------------------------


up_door_col	colframes	10
	colbox	0,0,0,0,rotZ,45,30,40,HF1,0,1
	colbox	0,0,0,0,rotZ,45,30,40,HF1,0,1
	colbox	0,0,-5,0,rotZ,45,30,40,HF1,0,1
	colbox	0,0,-10,0,rotZ,45,30,40,HF1,0,1
	colbox	0,0,-15,0,rotZ,45,30,40,HF1,0,1
	colbox	0,0,-20,0,rotZ,45,30,40,HF1,0,1
	colbox	0,0,-25,0,rotZ,45,30,40,HF1,0,1
	colbox	0,0,-30,0,rotZ,45,30,40,HF1,0,1
	colbox	0,0,-35,0,rotZ,45,30,40,HF1,0,1
	colbox	0,0,-40,0,rotZ,45,30,40,HF1,0,1


;--------------------------------------------------------------------
dpilar_col	colframes	10
	colbox	0,-45,0,0,rotZ,15,20,20,HF1,0,0
	colbox	0,-45,0,0,rotZ,25,20,20,HF1,0,0
	colbox	0,-45,0,0,rotZ,35,20,20,HF1,0,0
	colbox	0,-45,0,0,rotZ,45,20,20,HF1,0,0
	colbox	0,-45,0,0,rotZ,55,20,20,HF1,0,0
	colbox	0,-45,0,0,rotZ,65,20,20,HF1,0,0
	colbox	0,-45,0,0,rotZ,75,20,20,HF1,0,0
	colbox	0,-45,0,0,rotZ,85,20,20,HF1,0,0
	colbox	0,-45,0,0,rotZ,95,20,20,HF1,0,0
	colbox	0,-45,0,0,rotZ,105,20,20,HF1,0,0

;--------------------------------------------------------------------
halfd_col	colframes	10
	colbox	0,-20,0,0,rotZ,5,30,10,HF1,0,1
	colbox	0,-20,0,0,rotZ,10,30,10,HF1,0,1
	colbox	0,-20,0,0,rotZ,15,30,10,HF1,0,1
	colbox	0,-20,0,0,rotZ,20,30,10,HF1,0,1
	colbox	0,-20,0,0,rotZ,25,30,10,HF1,0,1
	colbox	0,-20,0,0,rotZ,30,30,10,HF1,0,1
	colbox	0,-20,0,0,rotZ,35,30,10,HF1,0,1
	colbox	0,-20,0,0,rotZ,40,30,10,HF1,0,1
	colbox	0,-20,0,0,rotZ,45,30,10,HF1,0,1
	colbox	0,-20,0,0,rotZ,50,30,10,HF1,0,1


pole_0_col	colbox	pole_0_col1,0,-50,0,rotZ,5,5,5,HF3,0,2
pole_0_col1	colbox	pole_0_col2,0,-40,0,rotZ,5,5,5,HF3,0,2
pole_0_col2	colbox	pole_0_col3,0,-30,0,rotZ,5,5,5,HF3,0,2
pole_0_col3	colbox	pole_0_col4,0,-20,0,rotZ,5,5,5,HF1,0,2
pole_0_col4	colbox	pole_0_col5,0,-10,0,rotZ,5,5,5,HF1,0,2
pole_0_col5	colbox	pole_0_col6,0,010,0,rotZ,5,5,5,HF1,0,2
pole_0_col6	colbox	pole_0_col7,0,020,0,rotZ,5,5,5,HF1,0,2
pole_0_col7	colbox	pole_0_col8,0,030,0,rotZ,5,5,5,HF2,0,2
pole_0_col8	colbox	pole_0_col9,0,040,0,rotZ,5,5,5,HF2,0,2
pole_0_col9	colbox	0,0,050,0,rotZ,5,5,5,HF2,0,2



;--------------------------------------------------------------------
;--------------------------------------------------------------------
;--------------------------------------------------------------------
;--------------------------------------------------------------------
;--------------------------------------------------------------------
;--------------------------------------------------------------------
;--------------------------------------------------------------------
;--------------------------------------------------------------------









