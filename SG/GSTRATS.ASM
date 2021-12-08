;***************************************************************************
;*                                                                         *
;*                              StarGlider                                 *
;*                              -----------                                *
;*                                                                         *
;*                           SuperNES version.                             *
;*                                                                         *
;*                                                                         *
;*                           Argonaut Software.      		      *	   
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   File: GSTRATS.ASM                                                     *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr: GILES' STRATEGY ROUTINES.                                       *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   Date: 12/2/92                                                         *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;* Author:								      *
;*                                                                         *
;*		Giles Goddard.      				      *	
;*                                                                         *
;***************************************************************************

	shorta
	longi

	INCPUBLICS	gstrats.ext


	




	strats_start

gstratsstart	
initgame_strats_l

	a16
;	stz	outdist
	stz	outvx
	stz	outvy
	stz	outvz
	stz	showtype
	stz	godnuke
	stz	hominglasershots
	lda	#0
	sta.l	m_bossmaxHP	; disable boss hit count meter
	a8
	stz	gameflags
	lda	#gf2_ingame
	sta	gameflags2
	stz	bossflags
	stz	stratflags
	lda	#1
	sta	shieldon


	lda	#40
	sta.l	m_boostanim

	a8i16
	stz	showtype


	phb
	lda	#$7e
	pha
	plb

	ifeq	0
	ldx	allst		;do all strategies
.stratlp	stz	aldead
	jsl	do_strat_l
	lda	aldead
	bne	.killal
	ldy	_next,x
.killed	tyx
	bne	.stratlp
	bra	.cont
.killal	ldy	_next,x
	jsl	removedeadal_l
	bra	.killed
.cont
	endc

	jsl	init_strats_l



;------------------------------------------------------------------------------

	s_make_obj	#nullshape,.badobj
	sty		dummyobj
	s_setnoremove_behind	y
	s_clr_alsflag		y,realobj
	s_set_alsflag		y,playerobj
	bra		.ok
.badobj
   	blink
.ok

;------------------------------------------------------------------------------

	s_set_objtobevar	x,playpt
	s_clr_alsflag		x,realobj
	s_set_alsflag		x,playerobj

	s_set_objtobevar	x,pcboxobj_B
	s_clr_alsflag		x,realobj
	s_set_alsflag		x,playerobj

	s_set_objtobevar	x,pcboxobj_LW
	s_clr_alsflag		x,realobj
	s_set_alsflag		x,playerobj

	s_set_objtobevar	x,pcboxobj_RW
	s_clr_alsflag		x,realobj
	s_set_alsflag		x,playerobj

;------------------------------------------------------------------------------
; make help ball weapon.
;	s_make_obj		#helpball,.bad1
;	s_set_strat		y,helpball_Istrat
;.bad1

;------------------------------------------------------------------------------
	plb
	
	rtl




;*****************************************************************************
def_playership		MACRO	; normal,no left,no right,both.
	dw	\1&WM
	dw	\2&WM
	dw	\3&WM
	dw	\4&WM
maxpships	=	maxpships+1
		ENDM

;-----------------------------------------------------------------------------
maxpships	=	0
player_shapes
	def_playership	myship_4,myship_r,myship_l,myship_b	
pwireshapes	def_playership	wired,my_r_w,my_l_w,my_b_w		; 1 
pnullshapes	def_playership	nullshape,nullshape,nullshape,nullshape	; 2
	def_playership	my_up,my_up,my_up,my_up			; 5
	def_playership	nullshape,nullshape,nullshape,nullshape	; 2
pblackshapes	def_playership	Bmyship_4,Bmyship_r,Bmyship_l,Bmyship_b
	def_playership	myzoom_4,myzoom_r,myzoom_l,myzoom_b
	def_playership	plane1,plane1,plane1,plane1
	def_playership	my_demoS,my_demoS,my_demoS,my_demoS
	def_playership	old_type2,old_type2,old_type2,old_type2
	def_playership	ryousan,ryousan,ryousan,ryousan
	def_playership	a_wing,a_wing,a_wing,a_wing
	def_playership	b_wing,b_wing,b_wing,b_wing
	def_playership	c_wing,c_wing,c_wing,c_wing
	def_playership	wolf,wolf,wolf,wolf	
	def_playership	wolf_1,wolf_1,wolf_1,wolf_1
	def_playership	c_robo,c_robo,c_robo,c_robo
	def_playership	petecube,petecube,petecube,petecube
	def_playership	androsscubee,androsscubee,androsscubee,androsscubee
	def_playership	boss_g_s,boss_g_s,boss_g_s,boss_g_s
	def_playership	ray_bluep,ray_bluep,ray_bluep,ray_bluep
	def_playership	ray_bredp,ray_bredp,ray_bredp,ray_bredp
	def_playership	ray_0p,ray_0p,ray_0p,ray_0p
	def_playership	wire_man,wire_man,wire_man,wire_man
	def_playership	cockpit2,cockpit2,cockpit2,cockpit2
	def_playership	f_fish,f_fish,f_fish,f_fish	
	def_playership	tadpole,tadpole,tadpole,tadpole	
	def_playership	whale1,whale1,whale1,whale1	
	def_playership	my_bird,my_bird,my_bird,my_bird		
	def_playership	shark1,shark1,shark1,shark1	
	def_playership	zaco_1,zaco_1,zaco_1,zaco_1
	def_playership	zaco_5,zaco_5,zaco_5,zaco_5	
	def_playership	zaco_6,zaco_6,zaco_6,zaco_6
	def_playership	zaco_8,zaco_8,zaco_8,zaco_8
	def_playership	zaco_a,zaco_a,zaco_a,zaco_a
	def_playership	zaco_b,zaco_b,zaco_b,zaco_b
	def_playership	heli,heli,heli,heli
	def_playership	ika,ika,ika,ika
	def_playership	f_dragon,f_dragon,f_dragon,f_dragon
	def_playership	air_1,air_1,air_1,air_1
	def_playership	car_10,car_10,car_10,car_10
	def_playership	phazer,phazer,phazer,phazer
	def_playership	boss_d_a,boss_d_a,boss_d_a,boss_d_a	
	def_playership	wired,my_r_w,my_l_w,my_b_w
	def_playership	Bmyship_4,Bmyship_r,Bmyship_l,Bmyship_b
	def_playership	myship2,myship2,myship2,myship2
	def_playership	dfx,dfx,dfx,dfx	
	def_playership	fcta,fcta,fcta,fcta	
	def_playership	sjpa,sjpa,sjpa,sjpa
	def_playership	djpa,djpa,djpa,djpa
	;*****************************************************************************
;--------------------------------------
; entry a8i16: A : player ship number
setYplayershape_l
	asl	a
	asl	a
	asl	a
	sta	smvar_byte1

	lda	pshipflags
	and	#psf_brkLwing!psf_brkRwing
	beq	.nps

	bit	#psf_brkLwing
	beq	.notlb	
	bit	#psf_brkRwing
	bne	.bps
	s_set_alvar2vartab	B,W,W,y,al_shape,smvar_byte1,player_shapes+2
	bra	.gps
.notlb
	s_set_alvar2vartab	B,W,W,y,al_shape,smvar_byte1,player_shapes+4
	bra	.gps
.bps
	s_set_alvar2vartab	B,W,W,y,al_shape,smvar_byte1,player_shapes+6
	bra	.gps
.nps
	s_set_alvar2vartab	B,W,W,y,al_shape,smvar_byte1,player_shapes
.gps
	rtl
	
;---------custom weapon fire code------------------
dofireplease_l
	jsr	dofireplease
	rtl

dofireplease
;	s_make_obj	#nullshape,.doneu
;	s_copy_pos	y,x
;	s_add_alvar	W,y,al_worldz,#1000
;	s_set_strat	y,path_istrat
;	s_set_path	y,dnintendo
;.doneu	
	lda	secretgodmode
	bne	.specialgod
	lda	newgameplus
	and	#1
	bne	.ngp
.specialgod
	lda	weaponnumber
	cmp	#99
	beq .slow
	cmp	#9
	beq	.gofast
	cmp	#3
	bpl	.slower
	bra	.gofast
.ngp
	s_set_var		B,firedelay,#3		;new game+ mode locked to 3
	s_set_var		B,svar_byte1,#4-1
	jmp			.reallynormal

.slow
	lda	firerate
	clc
	adc	#4		;gg99 set to 4 higher than rate
	sta	firedelay
	bra			.faster
.gofast
	lda	firerate			;load fire speed (default is 2)
	sta	firedelay			;store to delay
	bra			.faster
.slower
	lda	firerate			;load fire speed
	ina						;add one
	sta	firedelay			;store to delay
.faster	
	s_set_var		B,svar_byte1,#4-1
	s_jmp_varAND		B,pshipflags3,#psf3_beamball,.isdubl
	s_jmpNOT_varAND		B,pshipflags2,#psf2_doublaser,.ndubl
.isdubl	s_set_var		B,svar_byte1,#8-1
.ndubl

;	s_jmp_varmore		B,numplasers,svar_byte1,npfy

	s_set_alsflag		x,sflag3	; player fired laser

	lda	weaponnumber ;check weapon number
	cmp	#0
	lbeq	.normal
	cmp	#1
	lbeq	.1
	cmp	#2
	lbeq	.2
	cmp	#3
	lbeq	.3
	cmp	#4
	lbeq	.4
	cmp	#5
	lbeq	.5
	cmp	#6
	lbeq	.6
	cmp	#7
	lbeq	.7
	cmp	#8
	lbeq	.8
	cmp	#9
	lbeq	.9
	cmp	#10
	lbeq	.10
	cmp	#11
	lbeq	.11
	cmp	#12
	lbeq	.12
	cmp	#13
	lbeq	.13
	cmp	#14
	lbeq	.14
	cmp	#15
	lbeq	.15
	cmp	#16
	lbeq	.16
	cmp	#17
	lbeq	.17
	cmp	#18
	lbeq	.18
	cmp	#19
	lbeq	.19
	cmp	#20
	lbeq	.20
	cmp	#21
	lbeq	.21
	cmp	#22
	lbeq	.22
	cmp	#23
	lbeq	.23
	cmp	#24
	lbeq	.24
	cmp	#25
	lbeq	.25
	cmp	#26
	lbeq	.26
	cmp	#27
	lbeq	.27
	cmp	#28
	lbeq	.28
	cmp	#29
	lbeq	.29
	cmp	#98
	lbeq	.98
	cmp	#99
	lbeq	.99
.normal	


	s_jmp_varAND		B,pshipflags3,#psf3_beamball,beamb
	s_jmp_varAND		B,pshipflags2,#psf2_doublaser,dubfl
	lda	singdoub
	cmp	#1
	lbeq	dubfl
.reallynormal
	REPT	5
	s_weapon_pos		#0,#0,#80     ; Normal Weapon Shot
	s_weapon_rot		#0,#0
	s_fire_weapon		x,ELASER,npfy
	ENDR
	trigse			se_laser		
	jmp		npfy

.1
	jmp	dubfl
.2
	jmp	beamb
.3
	jmp	w3
.4
	jmp	w4
.5
	jmp	w5
.6
	jmp	w6
.7
	jmp	w7
.8
	jmp	w8
.9
	jmp	w9
.10
	jmp	w10
.11
	jmp	w11
.12
	jmp	w12
.13
	jmp	w13
.14
	jmp	w14
.15
	jmp	w15
.16
	jmp	w16
.17
	jmp	w17
.18
	jmp	w18
.19
	jmp	w19
.20
	jmp	w20
.21
	jmp	w21
.22
	jmp	w22
.23
	jmp	w23
.24
	jmp	w24
.25
	jmp	w25
.26
	jmp	w26
.27
	jmp	w27
.28
	jmp	w28
.29
	jmp	w29
.98
	jmp	w99
.99
	jmp	w99
	
w3 ; Cross Laser
	s_weapon_pos		#0,#0,#80     
	s_weapon_rot		#0,#0
	s_fire_weapon		x,ELASER,npfy	
	s_weapon_pos		#0>>weapon_scale,#(playerW_y-30)>>weapon_scale,#80
	s_weapon_rot		#0,#0
	s_fire_weapon		x,ELASER,npfy
	s_weapon_pos		#-playerW_x>>weapon_scale,#playerW_y>>weapon_scale,#80
	s_fire_weapon		x,ELASER,npfy
	s_weapon_pos		#0>>weapon_scale,#(playerW_y+10)>>weapon_scale,#80
	s_fire_weapon		x,ELASER,npfy
	s_weapon_pos		#playerW_x>>weapon_scale,#playerW_y>>weapon_scale,#80
	s_fire_weapon		x,ELASER,npfy
	trigse			$34
	jmp			npfy
;------------------------------------------------------------------	
w4 ;Quintouple Laser
	trigse			se_laser		
	s_weapon_pos		#-playerW_x>>weapon_scale,#playerW_y>>weapon_scale,#80
	s_weapon_rot		#0,#0
	s_fire_weapon		x,ELASER,npfy
	
	s_weapon_pos		#(-playerW_x-30)>>weapon_scale,#playerW_y>>weapon_scale,#80
	s_fire_weapon		x,ELASER,npfy
	s_weapon_pos		#playerW_x>>weapon_scale,#playerW_y>>weapon_scale,#80
	s_fire_weapon		x,ELASER,npfy
	
	s_weapon_pos		#(playerW_x+30)>>weapon_scale,#playerW_y>>weapon_scale,#80
	s_fire_weapon		x,ELASER,npfy
	s_weapon_pos		#0>>weapon_scale,#playerW_y>>weapon_scale,#80
	s_fire_weapon		x,ELASER,npfy
	trigse			$34
	jmp		npfy
;------------------------------------------------------------------
w5 ;Plasma
	lda	singdoub
	cmp	#0
	beq	.w50
	cmp	#1
	beq	.w51
.w50
	s_weapon_pos		#0,#0,#80     
	s_weapon_rot		#0,#0
	s_fire_weapon		x,HPLASMA2,npfy
	jmp		npfy
.w51
	s_weapon_pos		#-playerW_x>>weapon_scale,#playerW_y>>weapon_scale,#10
	s_weapon_rot		#0,#0
	s_fire_weapon		x,HPLASMA2,npfy
	
	s_weapon_pos		#playerW_x>>weapon_scale,#playerW_y>>weapon_scale,#10
	s_fire_weapon		x,HPLASMA2,npfy
	
	trigse			$36	
	jmp		npfy
;------------------------------------------------------------------
w6 ;Oval Beam
	lda	singdoub
	cmp	#0
	beq	.w60
	cmp	#1
	beq	.w61
.w60
	s_weapon_pos		#0,#0,#80     
	s_weapon_rot		#0,#0
	s_fire_weapon		x,RELOVALBEAM2,npfy
	jmp		npfy
.w61
	s_weapon_pos		#-playerW_x>>weapon_scale,#playerW_y>>weapon_scale,#10
	s_weapon_rot		#0,#0
	s_fire_weapon		x,RELOVALBEAM2,npfy
	
	s_weapon_pos		#playerW_x>>weapon_scale,#playerW_y>>weapon_scale,#10
	s_fire_weapon		x,RELOVALBEAM2,npfy
	
	trigse			$36
	jmp		npfy
;------------------------------------------------------------------
w7 ;Ring Laser
	lda	singdoub
	cmp	#0
	beq	.w70
	cmp	#1
	beq	.w71
.w70
	s_weapon_pos		#0,#0,#80     
	s_weapon_rot		#0,#0
	s_fire_weapon		x,RELRINGLASER2,npfy
	jmp		npfy
.w71
	s_weapon_pos		#(-playerW_x-5)>>weapon_scale,#playerW_y>>weapon_scale,#10
	s_weapon_rot		#0,#0
	s_fire_weapon		x,RELRINGLASER2,npfy
	
	s_weapon_pos		#(playerW_x+5)>>weapon_scale,#playerW_y>>weapon_scale,#10
	s_fire_weapon		x,RELRINGLASER2,npfy
	
	trigse			$36	
	jmp		npfy
;------------------------------------------------------------------
w8
	lda	singdoub
	cmp	#0
	beq	.w80
	cmp	#1
	beq	.w81
.w80
	s_weapon_pos		#0,#0,#80     
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	jmp		npfy
.w81
	s_weapon_pos		#-playerW_x>>weapon_scale,#playerW_y>>weapon_scale,#10
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	
	s_weapon_pos		#playerW_x>>weapon_scale,#playerW_y>>weapon_scale,#10
	jsl	fire_newweapon
	
	trigse			$36	
	jmp		npfy
;------------------------------------------------------------------
w9
	s_weapon_pos		#0,#0,#80     
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	trigse			$36	
	jmp		npfy
;------------------------------------------------------------------
w10	
	lda	singdoub
	cmp	#0
	beq	.w100
	cmp	#1
	beq	.w101
.w100
	s_weapon_pos		#0,#0,#80     
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	jmp		npfy
.w101
	s_weapon_pos		#(-playerW_x-5)>>weapon_scale,#playerW_y>>weapon_scale,#10
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	
	s_weapon_pos		#(playerW_x+5)>>weapon_scale,#playerW_y>>weapon_scale,#10
	jsl	fire_newweapon
	
	trigse			$36	
	jmp		npfy
;------------------------------------------------------------------
w11
	lda	singdoub
	cmp	#0
	beq	.w110
	cmp	#1
	beq	.w111
.w110
	s_weapon_pos		#0,#0,#80     
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	jmp		npfy
.w111
	s_weapon_pos		#(-playerW_x-100)>>weapon_scale,#playerW_y>>weapon_scale,#10
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	
	s_weapon_pos		#(playerW_x+100)>>weapon_scale,#playerW_y>>weapon_scale,#10
	jsl	fire_newweapon
	
	trigse			$36	
	jmp		npfy
;------------------------------------------------------------------
dubfl
	s_weapon_pos		#-playerW_x>>weapon_scale,#playerW_y>>weapon_scale,#80
	s_weapon_rot		#0,#0
	s_fire_weapon		x,ELASER,npfy
	
	s_weapon_pos		#playerW_x>>weapon_scale,#playerW_y>>weapon_scale,#80
	s_fire_weapon		x,ELASER,npfy
	
	trigse			$34
	jmp			npfy
;------------------------------------------------------------------
beamb
	s_weapon_pos		#-playerW_x>>weapon_scale,#playerW_y>>weapon_scale,#10
	s_weapon_rot		#0,#0
	s_fire_weapon		x,PLAYERBEAM,npfy
	
	s_weapon_pos		#playerW_x>>weapon_scale,#playerW_y>>weapon_scale,#10
	s_fire_weapon		x,PLAYERBEAM,npfy
	
	trigse			$36
	jmp			npfy
;------------------------------------------------------------------	
w12
	lda	singdoub
	cmp	#0
	beq	.w120
	cmp	#1
	beq	.w121
.w120
	s_weapon_pos		#0,#0,#80     
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	jmp		npfy
.w121
	s_weapon_pos		#(-playerW_x-100)>>weapon_scale,#playerW_y>>weapon_scale,#10
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	
	s_weapon_pos		#(playerW_x+100)>>weapon_scale,#playerW_y>>weapon_scale,#10
	jsl	fire_newweapon
	
	trigse			$36	
	jmp		npfy
;------------------------------------------------------------------
w13
	lda	singdoub
	cmp	#0
	beq	.w130
	cmp	#1
	beq	.w131
.w130
	s_weapon_pos		#0,#0,#80     
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	jmp		npfy
.w131
	s_weapon_pos		#-playerW_x>>weapon_scale,#playerW_y>>weapon_scale,#10
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	
	s_weapon_pos		#playerW_x>>weapon_scale,#playerW_y>>weapon_scale,#10
	jsl	fire_newweapon
	trigse			$36	
	jmp		npfy
	;------------------------------------------------------------------
w14
	lda	singdoub
	cmp	#0
	beq	.w140
	cmp	#1
	beq	.w141
.w140
	s_weapon_pos		#0,#0,#80
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	jmp		npfy
.w141
	s_weapon_pos		#-playerW_x>>weapon_scale,#playerW_y>>weapon_scale,#10
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	
	s_weapon_pos		#playerW_x>>weapon_scale,#playerW_y>>weapon_scale,#10
	jsl	fire_newweapon
	
	trigse			$36	
	jmp		npfy
;------------------------------------------------------------------
w15
	lda	singdoub
	cmp	#0
	beq	.w150
	cmp	#1
	beq	.w151
.w150
	s_weapon_pos		#0,#0,#80
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	jmp		npfy
.w151
	s_weapon_pos		#-playerW_x>>weapon_scale,#playerW_y>>weapon_scale,#10
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	
	s_weapon_pos		#playerW_x>>weapon_scale,#playerW_y>>weapon_scale,#10
	jsl	fire_newweapon
	
	trigse			$36	
	jmp		npfy
;------------------------------------------------------------------
w16	
	lda	singdoub
	cmp	#0
	beq	.w160
	cmp	#1
	beq	.w161
.w160
	s_weapon_pos		#0,#0,#80
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	jmp		npfy
.w161
	s_weapon_pos		#(-playerW_x-10)>>weapon_scale,#playerW_y>>weapon_scale,#10
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	
	s_weapon_pos		#(playerW_x+10)>>weapon_scale,#playerW_y>>weapon_scale,#10
	jsl	fire_newweapon
	
	trigse			$36	
	jmp		npfy
;------------------------------------------------------------------
w17
	lda	singdoub
	cmp	#0
	beq	.w170
	cmp	#1
	beq	.w171
.w170
	s_weapon_pos		#0,#0,#80
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	jmp		npfy
.w171
	s_weapon_pos		#-playerW_x>>weapon_scale,#playerW_y>>weapon_scale,#10
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	
	s_weapon_pos		#playerW_x>>weapon_scale,#playerW_y>>weapon_scale,#10
	jsl	fire_newweapon
	
	trigse			$36	
	jmp		npfy
;------------------------------------------------------------------	
w18
	lda	singdoub
	cmp	#0
	beq	.w180
	cmp	#1
	beq	.w181
.w180
	s_weapon_pos		#0,#0,#80
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	jmp		npfy
.w181
	s_weapon_pos		#-playerW_x>>weapon_scale,#playerW_y>>weapon_scale,#10
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	
	s_weapon_pos		#playerW_x>>weapon_scale,#playerW_y>>weapon_scale,#10
	jsl	fire_newweapon
	
	trigse			$36	
	jmp		npfy
;------------------------------------------------------------------
w19
	lda	singdoub
	cmp	#0
	beq	.w190
	cmp	#1
	beq	.w191
.w190
	s_weapon_pos		#0,#0,#80
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	jmp		npfy
.w191
	s_weapon_pos		#(-playerW_x-15)>>weapon_scale,#playerW_y>>weapon_scale,#10
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	
	s_weapon_pos		#(playerW_x+15)>>weapon_scale,#playerW_y>>weapon_scale,#10
	jsl	fire_newweapon
	
	trigse			$36	
	jmp		npfy
;------------------------------------------------------------------
w20
	lda	singdoub
	cmp	#0
	beq	.w200
	cmp	#1
	beq	.w201
.w200
	s_weapon_pos		#0,#0,#80
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	jmp		npfy
.w201
	s_weapon_pos		#(-playerW_x-10)>>weapon_scale,#playerW_y>>weapon_scale,#10
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	
	s_weapon_pos		#(playerW_x+10)>>weapon_scale,#playerW_y>>weapon_scale,#10
	jsl	fire_newweapon
	
	trigse			$36	
	jmp		npfy
;------------------------------------------------------------------
w21	
	lda	singdoub
	cmp	#0
	beq	.w210
	cmp	#1
	beq	.w211
.w210
	s_weapon_pos		#0,#0,#80
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	jmp		npfy
.w211
	s_weapon_pos		#(-playerW_x-10)>>weapon_scale,#playerW_y>>weapon_scale,#10
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	
	s_weapon_pos		#(playerW_x+10)>>weapon_scale,#playerW_y>>weapon_scale,#10
	jsl	fire_newweapon
	
	trigse			$36	
	jmp		npfy
;------------------------------------------------------------------
w22
	lda	singdoub
	cmp	#0
	beq	.w220
	cmp	#1
	beq	.w221
.w220
	s_weapon_pos		#0,#0,#80
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	jmp		npfy
.w221
	s_weapon_pos		#(-playerW_x-5)>>weapon_scale,#playerW_y>>weapon_scale,#10
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	
	s_weapon_pos		#(playerW_x+5)>>weapon_scale,#playerW_y>>weapon_scale,#10
	jsl	fire_newweapon
	
	trigse			$36	
	jmp		npfy
;------------------------------------------------------------------
w23
	lda	singdoub
	cmp	#0
	beq	.w230
	cmp	#1
	beq	.w231
.w230
	s_weapon_pos		#0,#0,#80
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	jmp		npfy
.w231
	s_weapon_pos		#(-playerW_x-5)>>weapon_scale,#playerW_y>>weapon_scale,#10
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	
	s_weapon_pos		#(playerW_x+5)>>weapon_scale,#playerW_y>>weapon_scale,#10
	jsl	fire_newweapon
	
	trigse			$36	
	jmp		npfy
;------------------------------------------------------------------
w24	
	lda	singdoub
	cmp	#0
	beq	.w240
	cmp	#1
	beq	.w241
.w240
	s_weapon_pos		#0,#0,#80
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	jmp		npfy
.w241
	s_weapon_pos		#(-playerW_x-5)>>weapon_scale,#playerW_y>>weapon_scale,#10
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	
	s_weapon_pos		#(playerW_x+5)>>weapon_scale,#playerW_y>>weapon_scale,#10
	jsl	fire_newweapon
	
	trigse			$36	
	jmp		npfy
;------------------------------------------------------------------
w25	
	lda	singdoub
	cmp	#0
	beq	.w250
	cmp	#1
	beq	.w251
.w250
	s_weapon_pos		#0,#0,#80
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	jmp		npfy
.w251
	s_weapon_pos		#(-playerW_x-5)>>weapon_scale,#playerW_y>>weapon_scale,#10
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	
	s_weapon_pos		#(playerW_x+5)>>weapon_scale,#playerW_y>>weapon_scale,#10
	jsl	fire_newweapon
	
	trigse			$36	
	jmp		npfy
;------------------------------------------------------------------	
w26	
	lda	singdoub
	cmp	#0
	beq	.w260
	cmp	#1
	beq	.w261
.w260
	s_weapon_pos		#0,#0,#80
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	jmp		npfy
.w261
	s_weapon_pos		#(-playerW_x-5)>>weapon_scale,#playerW_y>>weapon_scale,#10
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	
	s_weapon_pos		#(playerW_x+5)>>weapon_scale,#playerW_y>>weapon_scale,#10
	jsl	fire_newweapon
	
	trigse			$36	
	jmp		npfy
;------------------------------------------------------------------		
w27
	lda	singdoub
	cmp	#0
	beq	.w270
	cmp	#1
	beq	.w271
.w270
	s_weapon_pos		#0,#0,#80
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	jmp		npfy
.w271
	s_weapon_pos		#(-playerW_x-5)>>weapon_scale,#playerW_y>>weapon_scale,#10
	s_weapon_rot		#0,#0
	jsl	fire_newweapon
	
	s_weapon_pos		#(playerW_x+5)>>weapon_scale,#playerW_y>>weapon_scale,#10
	jsl	fire_newweapon
	
	trigse			$36	
	jmp		npfy
;------------------------------------------------------------------
w28 ;super homing laser
	lda	hominglasershots
	cmp	#4	;every 4 shots do a homing laser
	bne	.inc
	s_weapon_rot		#0,#0
	s_fire_weapon		x,QELASER,npfy
	stz	hominglasershots
	bra	.conths
.inc
	inc	hominglasershots
.conths
	lda	singdoub
	cmp	#0
	beq	.w280
	cmp	#1
	beq	.w281
.w280
	s_weapon_pos		#0,#0,#80
	s_weapon_rot		#0,#0
	s_fire_weapon		x,ELASER,npfy
	jmp		npfy
.w281
	s_weapon_pos		#-playerW_x>>weapon_scale,#playerW_y>>weapon_scale,#80
	s_weapon_rot		#0,#0
	s_fire_weapon		x,ELASER,npfy
	
	s_weapon_pos		#playerW_x>>weapon_scale,#playerW_y>>weapon_scale,#80
	s_fire_weapon		x,ELASER,npfy
	
	trigse			$34
	jmp		npfy
;------------------------------------------------------------------
w29
	s_weapon_pos		#0,#0,#80     ; Normal Weapon Shot
	s_weapon_rot		#0,#deg3
	jsl	fire_shotgun
	s_weapon_pos		#0,#0,#80     ; Normal Weapon Shot
	s_weapon_rot		#0,#deg5
	jsl	fire_shotgun
	s_weapon_pos		#0,#0,#80     ; Normal Weapon Shot
	s_weapon_rot		#0,#0
	jsl	fire_shotgun
	s_weapon_pos		#0,#0,#80     ; Normal Weapon Shot
	s_weapon_rot		#0,#-deg3
	jsl	fire_shotgun
	s_weapon_pos		#0,#0,#80     ; Normal Weapon Shot
	s_weapon_rot		#0,#-deg5
	jsl	fire_shotgun
	trigse			se_laser		
	jmp		npfy
;------------------------------------------------------------------
w99	;God Gun

	lda	nogodgun
	lbne	beamb

	s_weapon_pos		#0,#0,#0     
	s_weapon_rot		#0,#0
	jsl	fire_godgun
	trigse			$36
	jmp		npfy

npfy
;	s_bra			.end
;------------------------------------------------------------------

.end
	rts

select_ship_l
;	jsr	select_ship
	jsl	setship
	rtl
select_ship
	phx
	phy
	a16
	and	#$00ff
	asl	a
	asl	a
	asl	a
	tax
 	
	lda.l	player_shapes,x
	sta.l	playershape
	lda.l	player_shapes+2,x
	sta.l	playershapeL
	lda.l	player_shapes+4,x
	sta.l	playershapeR
	lda.l	player_shapes+6,x
	sta.l	playershapeLR

	a8
	ply
	plx
	rts

playerstart_init_l
	a8
	stz	stopcounting
	s_set_alvar	W,x,alx_frame,#0
	stz			fastend
	lda	newgameplus
	bne	.onlytwo
	s_set_var	W,specwepcntone,#5
	s_set_var	W,specwepcnttootemp,#5
	bra	.donebomb
.onlytwo
	s_set_var	W,specwepcntone,#2
	s_set_var	W,specwepcnttootemp,#2
.donebomb
	stz	speccnttwo
	s_set_var	B,pshipflags,#0
	s_set_var	B,pshipflags2,#0
	s_set_var	B,pshipflags3,#0
	stz	teamshots
	stz	twoplayer
;	stz	playertwoready
	lda.l	m_playertwoactivated
	beq	.notwoplayer
	lda	livestwo
	beq	.notwoplayer
;	lda	#10
;	sta	playertwoready
	s_set_objtobeplayer	y
	s_clr_alsflag	y,invisible
	lda	ponedead
	beq	.notwoplayer
	s_set_alsflag	x,invisible
	s_set_alsflag	x,colldisable
	lda	lives
	beq	.notwoplayer
	bmi	.notwoplayer
	lda	#0
	sta.l	m_playeronedead
	stz	ponedead
	s_clr_alsflag	x,invisible
	s_clr_alsflag	x,colldisable
	
	
.notwoplayer	
	lda	#0
	sta.l	m_damagetwo		;reset player 2 health
	lda	scored
	and	#1
	cmp	#0
	beq	.skipthescore
	a16
	lda.l	playerscoretemp
	sta.l	playerscore
	a8
.skipthescore
	stz	debugalien
	stz	weaponnumberpone
	stz	weaponnumberptwo

	stz	weapptr
	stz	weapnextptr

	stz	helpshots
	stz	shieldup
	lda	superspeeddelay
	cmp	#ktest
	beq	.noimdone3pointer
	cmp	#ktest3
	beq	.noimdone3pointer
	cmp	#ktest4
	beq	.noimdone3pointer
	cmp	#ktest5
	beq	.noimdone3pointer
	a16
	lda	cockpitmode
	bne	.cockpit
	lda	curr_ship
	cmp	#19
	bmi	.maybe
	bra	.maybe25
.noimdone3pointer
	jmp	.noimdone3
.cockpit
	a8
	s_set_var    W,viewdist,#30
	s_set_var    W,outviewdist,#30
	s_set_var    W,outdist,#30
	bra	.noimdone3
.maybe25
	a8
	s_set_var    W,viewdist,#200
	s_set_var    W,outviewdist,#200
	s_set_var    W,outdist,#200
	bra	.noimdone3
.maybe
	a8
	s_set_var    W,viewdist,#120
	s_set_var    W,outviewdist,#120
	s_set_var    W,outdist,#120
.noimdone3

	lda	curr_ship
	beq	.nochange
	bra	.keepthesame
.nochange
	lda	#pshipnum_norm
	sta	curr_ship
.keepthesame
	jsl	select_ship_l
	jsl	setship
	rtl

;*****************************************************************************
;* select_nextship
;*
;*
;* entry: a8i16
;*
;*
;* exit: a8i16
;*


	shorta
	longi
	
select_nullship_l
	jsr	select_nullship
	rtl

	
select_nullship
	lda	#2
	sta	curr_ship
	jsr	select_ship
	rts
	
select_nextship_l
	jsr	select_nextship
	rtl
	
select_nextship
	lda	curr_ship
	beq	.firstjump
	inc	curr_ship
	lda	curr_ship
	cmp	#49					;THIS IS WHAT YOU NEED TO CHANGE TO ADD MORE SHIPS
	beq	.nmps
	bmi	.nmps
	stz	curr_ship
.nmps
	lda	curr_ship
	jsr	select_ship
	s_copy_var2var		B,shiptemp,curr_ship
	lda	shiptemp
	beq	.calc1
	dec	shiptemp
	dec	shiptemp
	dec	shiptemp		;decrease 6 times because it goes from ship 1-7
	dec	shiptemp
	dec	shiptemp
	dec	shiptemp
.calc1	
	;s_copy_var2alvar	W,x,al_shipnum,shiptemp
	bra	.endjumping
.firstjump
	lda	curr_ship
	ina
	ina
	ina
	ina		;increase 7 times to jump from ship 0 to ship 7
	ina
	ina
	ina
	sta	curr_ship
	jsr	select_ship
	s_copy_var2var		B,shiptemp,curr_ship
	lda	shiptemp
	beq	.calc2
	dec	shiptemp
	dec	shiptemp
	dec	shiptemp		;decrease 6 times because it goes from ship 1-7
	dec	shiptemp
	dec	shiptemp
	dec	shiptemp
.calc2
	;s_copy_var2alvar	W,x,al_shipnum,shiptemp
.endjumping
	jsl	checkview_l
	rts

select_prevship_l
	jsr	select_prevship
	rtl

	
select_prevship
	lda	curr_ship
	beq	.nmps3
	cmp	#7
	beq	.nmps2
	dec	curr_ship
	lda	curr_ship
	jsr	select_ship
	s_copy_var2var		B,shiptemp,curr_ship
	lda	shiptemp
	beq	.calc3
	dec	shiptemp
	dec	shiptemp
	dec	shiptemp		;decrease 6 times because it goes from ship 1-7
	dec	shiptemp
	dec	shiptemp
	dec	shiptemp
.calc3
	;s_copy_var2alvar	W,x,al_shipnum,shiptemp
	bra	.endofprev
.nmps2
	lda	#0				;set to 0 because it goes from ship 7 to ship 0
	sta	curr_ship
	jsr	select_ship
	s_copy_var2var		B,shiptemp,curr_ship
	lda	shiptemp
	cmp	#0
	beq	.calc4
	dec	shiptemp
	dec	shiptemp
	dec	shiptemp
	dec	shiptemp		;decrease 6 times because it goes from ship 1-7
	dec	shiptemp
	dec	shiptemp
.calc4
	;s_copy_var2alvar	W,x,al_shipnum,shiptemp
	bra	.endofprev
.nmps3
	lda	#49			;THIS IS WHAT YOU NEED TO CHANGE TO ADD MORE SHIPS
	sta	curr_ship
	jsr	select_ship
	s_copy_var2var		B,shiptemp,curr_ship
	lda	shiptemp
	cmp	#0
	beq	.calc5
	dec	shiptemp
	dec	shiptemp
	dec	shiptemp		;decrease 6 times because it goes from ship 1-7
	dec	shiptemp
	dec	shiptemp
	dec	shiptemp
.calc5
	;s_copy_var2alvar	W,x,al_shipnum,shiptemp
.endofprev
	jsl	checkview_l
	rts
;*****************************************************************************
playerspeedup_Istrat
	s_start_strat	
	s_set_objtobeplayer	y
	s_set_speed		y,#maxPspeed
	s_set_var		W,pviewvelz,#((maxPspeed-medPspeed)/2)+medPspeed
	s_set_alvar		B,y,al_sbyte2,#20
	s_remove_obj		x
	s_end_strat

;*****************************************************************************
playerspeedstop_Istrat
	s_start_strat	
	s_set_objtobeplayer	y
	s_set_var		B,player_tospeed,#0
	s_remove_obj		x
	s_end_strat

;*****************************************************************************
init_strats_l

	a8i16
;unused
	ifeq	1
	lda	ptworevivedelay
	cmp	#1
	beq	.reviveptwo
	bpl	.decptworevive
	bra	.continuestrats
.decptworevive
	dec	ptworevivedelay
	bra	.continuestrats
.reviveptwo
	stz	ptworevivedelay
	lda	#2
	sta	playertwoready
	endc
;end unused
;-------ELSA STUFF---------------------------------------------
.continuestrats
	lda	frozen
	lbeq	.continue2

;	stz	frozen
;	s_and_var		B,pshipflags3,#~psf3_nocollisions

.elsa
	s_set_objtobeplayer	y
	s_achase_alvar	B,y,al_rotz,#0,4
	
	s_jmp_keyup	x,.notx
	s_add_alvar	W,y,al_worldz,#45
;	jsl		viewmove_srou_l

.notx
	
	s_jmp_keyup	b,.notb
	s_sub_alvar	W,y,al_worldz,#45
;	jsl		viewmove_srou_l

.notb
	
	s_jmp_keyup	jleft,.notleft
	s_sub_alvar	W,y,al_worldx,#5
;	jsl		viewmove_srou_l

.notleft
	
	s_jmp_keyup	jright,.notright
	s_add_alvar	W,y,al_worldx,#5
;	jsl		viewmove_srou_l

.notright

	s_jmp_keyup	jup,.notup
	s_add_alvar	W,y,al_worldy,#5
;	jsl		viewmove_srou_l

.notup

	s_jmp_keyup	jdown,.notdown
	s_sub_alvar	W,y,al_worldy,#5
;	jsl		viewmove_srou_l

.notdown
;----------------------------------------------------
.continue2
	s_jmpNOT_varAND	B,pstratflags,#pstf_inseq,.ninseq
	stz		arrows
;	jsl	set_playeroutofcock_l

.ninseq

	s_copy_var2alvar	W,x,al_weaponnum,weaponnumberpone
	s_copy_var2var		B,shiptemp,curr_ship

	
	
	

;----------------------------------------------------
; hud flag.

.nhud

;----------------------------------------------------
; boss dying flash.
	s_jmpNOT_varAND		B,bossflags,#bf_dying,.nbdye
	s_jmp_notdelay		2,.nbfl
	jsl	bossflash_l
	s_brl			.ndalc
.nbfl	dealloc_window		dyingred
.ndalc
	s_jmpNOT_varAND		B,gameflags,#gf_bossdead,.nbdye
	s_and_var		B,bossflags,#~bf_dying
	dealloc_window		dyingred
.nbdye


;----------------------------------------------------
	ldx	internalPLAYPT
	ldy	dummyobj
	s_copy_pos	y,x


;----------------------------------------------------
	lda	#14
	sta.l	m_hudcolour		;turns hud on
;----------------------------------------------------	
	ifeq	1			;this code is stopping the wire ship from rotating colors
	ldx	playpt
	lda	curr_ship
	cmp	#1
	bne	.flash
	s_jmpNOT_varAND		B,pshipflags2,#psf2_wireship,.nwire
	lda	curr_ship
	cmp	#0
	bne	.nwire
	phx
	a16
	lda	al_colframe,x
	and	#3
	tax
	a8
	lda.l	wirehud_cols,x
	sta.l	m_hudcolour
	plx
	bra	.flash
.nwire
	s_jmpNOT_alsflag	x,hitflash,.nflash
.flash	
	s_add_colanim	x,#1,#4
	s_bra		.notwire
.nflash	
	s_init_colanim	x,#4
.notwire	
	endc

;----------------------------------------------------
; float vars.

	s_jmpNOT_varAND		B,playerflymode,#pfm_wobble,.nwob
	s_add_var		B,floatvar1,#4
	s_add_var		B,floatvar2,#8
.nwob


;----------------------------------------------------
	lda	enemy_firing
	bne	.noshutofffire
	lda	stratflags
	ora	#sf_nofiring
	sta	stratflags
.noshutofffire

;----------------------------------------------------

	lda	playerflymode
	sta.l	m_pfm

;--------------------------


;----------------------------------------------------

;----CUSTOM CODE - KANDOWONTU------------------------
	lda	bgm_music
	cmp	#7										;If the fanfare is playing, do this code
	bne	.restofcode
	s_jmp_keyup			start,.restofcode
	s_jmp_lastkeydown	start,.restofcode
	lda	#1
	sta	fastend									;skip fanfare set on
	jmp	.npst
	

.restofcode
	IFEQ	1			;disabled
;Custom Code from pstrats for drunk mode- kandowontu
	s_jmp_varAND    B,superspeeddelay,#ktest4,.a4
	s_jmp_varAND    B,superspeeddelay,#ktest3,.a4
	s_jmp_varAND    B,superspeeddelay,#ktest2,.a4
	s_jmp_varAND    B,superspeeddelay,#ktest,.a4
	s_jmpNOT_varAND    B,superspeeddelay,#ktest5,.a4
	s_jmp_varAND	B,gameflags2,#gftest4,.a1
	s_jmp_varMORE	W,outvy,#12000,.a2
	s_add_var	W,outvy,#250
	bra		.a4
.a2
	s_or_var		B,gameflags2,#gftest4
	bra		.a4
.a1
	s_jmp_varLESS	W,outvy,#-12000,.a3
	s_sub_var	W,outvy,#250
	bra .a4
.a3
	s_and_var		B,gameflags2,#~gftest4
	ENDC				;end disable
.a4
;end custom code from pstrats
	lda	newgameplus
	lbne	.godmode
.getout
;end level immedietly (L+R Press Select)
	s_jmp_varNE	B,stayblack,#-1,.noimdone2
	s_jmp_varAND	B,pshipflags,#psf_noctrl,.noimdone2
	s_jmp_varAND	B,pshipflags,#psf_nofire,.noimdone2
	s_jmp_varAND	B,pstratflags,#pstf_notdie,.noimdone2
	s_jmp_varAND	B,pstratflags,#pstf_inseq,.noimdone2
	s_jmp_keyup			left,.noimdone2
	s_jmp_keyup			right,.noimdone2
	s_jmp_keyup			select,.noimdone2
	s_jmp_lastkeydown	select,.noimdone2
	lda	#0
	sta.l	m_damagetwo
	sta	twoplayer
	sta	ponedead
	s_boss_dying
	s_and_var	B,superspeeddelay,#~ktest
	s_and_var	B,superspeeddelay,#~ktest2
	s_and_var	B,superspeeddelay,#~ktest3
	s_and_var	B,superspeeddelay,#~ktest4
	s_and_var	B,superspeeddelay,#~ktest5
	s_or_var	B,gameflags,#gf_bossdead
	s_or_var	B,gameflags,#gf_stagedone	
	lda	#1
	sta			levelfinished 
	jmp			.npst
.noimdone2
;---------------------------select next ship (L Press B)

.nodup

	ifeq	1									;;;;;ALL DISABLED
	s_jmp_keyup			left,.noimdone3			;BECAUSE ITS
	s_jmp_keyup			b,.noimdone3			;IN THE PAUSE
	s_jmp_keydown		y,.noimdone3			;MENU NOW
	a16
	lda	trig0
	bit	#pad_B
	a8
	lbeq	.noimdone3
	jsr	selectnextship
	jmp	.npst

.noimdone3 
;---------------------------select prev ship (L+Y, press B)
	s_jmp_keyup			left,.noimdone30
	s_jmp_keyup			y,.noimdone30
	s_jmp_keyup			b,.noimdone30
	a16
	lda	trig0
	bit	#pad_B
	a8
	lbeq	.noimdone30
	jsr	selectprevship
	jmp	.npst
	ENDC
	
.noimdone30
;--------------------------------------------
;------------------Level Secrets Code step 1 (R Press Y) (UNNEEDED - IS ON MENU)
	IFEQ	1
	s_jmp_varAND		B,gameflags2,#gftest2,.noimdone4
	s_jmp_keyup			right,.noimdone4
	s_jmp_keyup			y,.noimdone4
	s_jmp_lastkeydown	y,.noimdone4
	TRIGSE			$10
	s_or_var			B,gameflags2,#gftest2
	jmp			.npst	
.noimdone4
;step 2 (Left Press Start)
	s_jmpNOT_varAND		B,gameflags2,#gftest2,.noimdone5
	s_jmp_varAND		B,gameflags2,#gftest3,.noimdone5	
	s_jmp_keyup			left,.noimdone5
	s_jmp_keyup			start,.noimdone5
	s_jmp_lastkeydown	start,.noimdone5
	TRIGSE			$10
	s_or_var			B,gameflags2,#gftest3
	jmp			.npst	
.noimdone5
;step 3 (Right Press Y)
	s_jmpNOT_varAND		B,gameflags2,#gftest3,.noimdone6
	s_jmp_varAND		B,pweptemp,#gftest1,.noimdone6
	s_jmp_keyup			right,.noimdone6
	s_jmp_keyup			y,.noimdone6
	s_jmp_lastkeydown	y,.noimdone6
	TRIGSE			$10
	s_or_var			B,pweptemp,#gftest1
	lda	#1
	sta	levelfeatures
	jmp			.npst
.noimdone6
	ENDC
	
;180degree turn - disabled
;	s_jmp_keyup			left,.noimdone7
;	s_jmp_keyup			a,.noimdone7
;	s_jmp_lastkeydown	a,.noimdone7
;	s_set_objtobeplayer	y
;	s_set_strat		y,playerturn180_Istrat

;.noimdone7
;------------------------------
;----------------object loading/unloading

	s_jmp_varAND		B,superspeedcnt,#ee23,.aaa3 ;no toggle remove behind z view if in endurance run
	s_jmp_ifnotlevel	3,.aaa5
	s_jmp_varNE		B,stage,#6,.aaa4
	jmp		.aaa3 ;no toggle, final level
.aaa5	
	s_jmp_ifnotlevel	4,.aaa6
	s_jmp_varNE		B,stage,#4,.aaa4	
	bra		.aaa3 ;no toggle, final level
.aaa6
	s_jmp_varNE		B,stage,#5,.aaa4
	bra		.aaa3 ;no toggle, final level
.aaa4
	s_jmp_varAND	B,crosshairflag,#crosshairoff,.aaa3
	s_jmp_varMORE	W,outvy,#5000,.aaa2
	s_jmp_varLESS	W,outvy,#-5000,.aaa2
	s_jmp_varMORE	W,outvx,#5000,.aaa2
	s_jmp_varLESS	W,outvx,#-5000,.aaa2	
	s_and_var		B,gameflags,#~gf_nozremove ;if view is not isometric, and view is inside 5000/-5000, remove obj
	bra				.aaa3
.aaa2	
	s_or_var		B,gameflags,#gf_nozremove ;if view is not isometric, and view is inside 5000/-5000, no remove obj
.aaa3
;----------------------------------------------
;----------------------------------------------


	IFEQ	1				;DISABLED
;---single/double fire swap---;
	s_jmp_keyup			right,.godmode
	s_jmp_keyup			select,.godmode
	a16
	lda	trig0
	bit	#pad_select
	a8
	lbeq	.godmode
	lda	singdoub
	cmp	#0
	beq	.sd0
	cmp	#1
	beq	.sd1
.sd0
	lda	#1
	sta	singdoub
	jmp	.npst
.sd1
	lda	#0
	sta	singdoub
	jmp	.npst	
	ENDC
.godmode
;-------God Mode Code (R Press Up)
	IFEQ	1
	s_jmp_keydown	right,.resetcombo
	s_jmp_varAND	B,pweptemp,#gm1,.gm2 ;Skip if this code has been entered already
	s_jmp_keyup			left,.gm12
	s_jmp_keyup			jdown,.gm12
	s_jmp_lastkeydown	jdown,.gm12
	s_or_var		B,pweptemp,#gm1
;	TRIGSE			$14 (verification)
	jmp			.npst
.gm2 ;(R Press Up)
	s_jmp_keydown	right,.resetcombo
	s_jmpNOT_varAND	B,pweptemp,#gm1,.gm3 ;Check if previous code has been entered
	s_jmp_varAND	B,pweptemp,#gm2,.gm3 ;Skip if this code has been entered already
	s_jmp_keyup			left,.gm12
	s_jmp_keyup			jright,.gm12
	s_jmp_lastkeydown	jright,.gm12
	s_or_var		B,pweptemp,#gm2	
;	TRIGSE			$14 (verification)
	jmp			.npst
.gm3 ;(R Press Down)
	s_jmp_keydown	right,.resetcombo
	s_jmpNOT_varAND	B,pweptemp,#gm2,.gm4 ;Check if previous code has been entered
	s_jmp_varAND	B,pweptemp,#gm3,.gm4 ;Skip if this code has been entered already
	s_jmp_keyup			left,.gm12
	s_jmp_keyup			jdown,.gm12
	s_jmp_lastkeydown	jdown,.gm12
	s_or_var		B,pweptemp,#gm3	
;	TRIGSE			$14 (verification)
	jmp			.npst
.gm4 ;(R Press Down)
	s_jmp_keydown	right,.resetcombo
	s_jmpNOT_varAND	B,pweptemp,#gm3,.gm5 ;Check if previous code has been entered
	s_jmp_varAND	B,pweptemp,#gm4,.gm5 ;Skip if this code has been entered already
	s_jmp_keyup			left,.gm12
	s_jmp_keyup			jright,.gm12
	s_jmp_lastkeydown	jright,.gm12
	s_or_var		B,pweptemp,#gm4	
;	TRIGSE			$14 (verification)
	jmp			.npst
.gm5 ;(R Press Left)
	s_jmp_keydown	right,.resetcombo
	s_jmpNOT_varAND	B,pweptemp,#gm4,.gm6 ;Check if previous code has been entered
	s_jmp_varAND	B,pweptemp,#gm5,.gm6 ;Skip if this code has been entered already
	s_jmp_keyup			left,.gm12
	s_jmp_keyup			jleft,.gm12
	s_jmp_lastkeydown	jleft,.gm12
	s_or_var		B,pweptemp,#gm5	
;	TRIGSE			$14 (verification)
	jmp			.npst
.gm6 ;(R Press Right)
	s_jmp_keydown	right,.resetcombo
	s_jmpNOT_varAND	B,pweptemp,#gm5,.gm7 ;Check if previous code has been entered
	s_jmp_varAND	B,pweptemp,#gm6,.gm7 ;Skip if this code has been entered already
	s_jmp_keyup			left,.gm12
	s_jmp_keyup			jup,.gm12
	s_jmp_lastkeydown	jup,.gm12
	s_or_var		B,pweptemp,#gm6	
;	TRIGSE			$14 (verification)
	jmp			.npst
.gm7 ;(R Press Left)
	s_jmp_keydown	right,.resetcombo
	s_jmpNOT_varAND	B,pweptemp,#gm6,.gm8 ;Check if previous code has been entered
	s_jmp_varAND	B,pweptemp,#gm7,.gm8 ;Skip if this code has been entered already
	s_jmp_keyup			left,.gm12
	s_jmp_keyup			jleft,.gm12
	s_jmp_lastkeydown	jleft,.gm12
	s_or_var		B,pweptemp,#gm7	
;	TRIGSE			$14 (verification)
	jmp			.npst
.gm8 ;(R Press Right)
	s_jmp_keydown	right,.resetcombo
	s_jmpNOT_varAND	B,pweptemp,#gm7,.gm9 ;Check if previous code has been entered
	s_jmp_varAND	B,strat_valid,#gm8,.gm9 ;Skip if this code has been entered already
	s_jmp_keyup			left,.gm12
	s_jmp_keyup			jup,.gm12
	s_jmp_lastkeydown	jup,.gm12
	s_or_var		B,strat_valid,#gm8
;	TRIGSE			$14 (verification)
	jmp			.npst
.gm9 ;(R Press B)
	s_jmp_keydown	right,.resetcombo
	s_jmpNOT_varAND	B,strat_valid,#gm8,.gm10 ;Check if previous code has been entered
	s_jmp_varAND	B,strat_valid,#gm9,.gm10 ;Skip if this code has been entered already
	s_jmp_keyup			left,.gm12
	s_jmp_keyup			b,.gm12
	s_jmp_lastkeydown	b,.gm12
	s_or_var		B,strat_valid,#gm9
;	TRIGSE			$14 (verification)
	jmp			.npst
.gm10 ;(R Press A)
	s_jmp_keydown	right,.resetcombo
	s_jmpNOT_varAND	B,strat_valid,#gm9,.gm11 ;Check if previous code has been entered
	s_jmp_varAND	B,strat_valid,#gm10,.gm11 ;Skip if this code has been entered already
	s_jmp_keyup			left,.gm12
	s_jmp_keyup			a,.gm12
	s_jmp_lastkeydown	a,.gm12
	s_or_var		B,strat_valid,#gm10
;	TRIGSE			$14 (verification)
	jmp			.npst
.gm11 ;(R Press Start)
	s_jmp_keydown	right,.resetcombo
	
	s_jmpNOT_varAND	B,strat_valid,#gm10,.gm12 ;Check if previous code has been entered
	s_jmp_varAND	B,strat_valid,#gm11,.gm12 ;Skip if this code has been entered already
	s_jmp_keyup			left,.gm12
	s_jmp_keyup			start,.gm12
	s_jmp_lastkeydown	start,.gm12
	s_or_var		B,strat_valid,#gm11
	lda	#1
	sta	godmode
	sta	secretgodmode
	TRIGSE			$14 ;Successful! Verification sounds
	TRIGSE			$15
	TRIGSE			$16
.gm12	
	lda	secretgodmode
	bne	.secretgodmode
	lda	newgameplus
	bne	.noimdone10
	lda	godmode								;check if godmode variable was set but code wasn't entered
	beq	.nobackupset						;this turns it on when set in the menu
	bra	.secretgodmode
.resetcombo
	s_and_var		B,strat_valid,#~(gm10!gm9!gm8) ;reset flags
	s_and_var		B,pweptemp,#~(gm1!gm2!gm3!gm4!gm5!gm6!gm7) ;reset flags
	bra	.noimdone20
.secretgodmode
	s_or_var		B,strat_valid,#gm11
;	lda	#0
;	sta.l	m_meters			;disabled, but this turned off the life bars when god mode was on
	ENDC
	
	
.nobackupset
;-------------CHECK FOR FREEZE MODE----
	lda	frozen
	bne	.gm13final		;if set to 1, jump to no collisions
;-------------------------------------
	lda	godmode
	bne	.gm13final ;check if all codes have been entered for god mode
	bra 	.noimdone10 ;if not, no touchie.
.gm13final
;	TRIGSE			$14    ;uncomment to verify when active with repeating sound
	s_or_var		B,pshipflags3,#psf3_nocollisions ;Set the god mode on

.noimdone10


;turn god mode off	- now enabled!
	IFEQ	0
;	s_jmp_varAND	B,strat_valid,#gm11,.turnmeoff ;Only allow code to shut off god mode if its active
;	bra	.noimdone20 ;otherwise, disreguard
;.turnmeoff ;(Turn off god mode with L+R press Start)
	lda	godmode
	beq	.noimdone20
	s_jmp_keyup			right,.noimdone20
	s_jmp_keyup			left,.noimdone20
	s_jmp_keyup			start,.noimdone20
	s_jmp_lastkeydown	start,.noimdone20
	stz	secretgodmode
	stz	godmode
	s_and_var		B,strat_valid,#~(gm11!gm10!gm9!gm8) ;reset flags
	s_and_var		B,pweptemp,#~(gm1!gm2!gm3!gm4!gm5!gm6!gm7) ;reset flags	
	s_and_var		B,pshipflags3,#~psf3_nocollisions
	jmp			.npst
	ENDC
.noimdone20

;------------------------------------------
;Endurance Run			(UNNEEDED - IS ON MENU)
	IFEQ	1
	s_jmp_ifnotlevel	1,.not1 ;only for level 1
	bra	.good
.not1
	s_jmp_ifnotlevel	4,.noimdone13 ;also only for level 4
.good
	s_jmp_varNE		B,stage,#0,.noimdone13 ;if its not on the first stage forget about it
;Step 1 (R Press Start)
	s_jmp_varAND		B,superspeedcnt,#ee21,.noimdone11	;skip if this code has been entered
	s_jmp_keyup			right,.noimdone11
	s_jmp_keyup			start,.noimdone11
	s_jmp_lastkeydown	start,.noimdone11
	TRIGSE			$10
	s_or_var			B,superspeedcnt,#ee21
	jmp			.npst
.noimdone11
;Step 2 (R Press L)
	s_jmpNOT_varAND		B,superspeedcnt,#ee21,.noimdone12	;skip if the last code was not entered yet
	s_jmp_varAND		B,superspeedcnt,#ee22,.noimdone12	;skip if this code has been entered
	s_jmp_keyup			right,.noimdone12
	s_jmp_keyup			left,.noimdone12
	s_jmp_lastkeydown	left,.noimdone12
	TRIGSE			$10
	s_or_var			B,superspeedcnt,#ee22
	jmp			.npst	
.noimdone12
;Step 3 (L Press Y)
	s_jmpNOT_varAND		B,superspeedcnt,#ee22,.noimdone13	;skip if the last code was not entered yet
	s_jmp_varAND		B,superspeedcnt,#ee23,.noimdone13	;skip if this code has been entered
	s_jmp_keyup			left,.noimdone13
	s_jmp_keyup			y,.noimdone13
	s_jmp_lastkeydown	y,.noimdone13
	TRIGSE			$10
	s_or_var			B,superspeedcnt,#ee23	;boom, endurance mode activated
	lda	#1
	sta	endurance
	jmp			.npst	
.noimdone13
	ENDC					;DONE (UNNEEDED - IS ON MENU)

;--------------------------
;Camera control
.camerastuff
    ;rotate camera x+
	lda.l		m_playertwoactivated
	cmp	#1
	lbeq	.noright
	lda	newgameplus
	and	#1
	lbne	.noright
	
;Reset view (L+R Press RightJoy)----------------------
	s_jmp_keyup        left,.nonothing
	s_jmp_keyup        right,.nonothing
	s_jmp_keyup        jright,.nonothing
	s_jmp_lastkeydown	jright,.nonothing	
.reallyresetview
	s_and_var		B,gameflags,#~gf_nozremove
    s_set_var        W,player_turnrot,#0
	jsl				playerstraight_strat
	stz		frozen
	s_or_var		B,pshipflags3,#psf3_nocollisions
	lda	#0
	sta	nolockview
	s_set_var	W,outvx,#0
	s_set_var	W,outvy,#0
	s_set_var	W,outvz,#0
	;s_set_var    W,viewdist,#120
	;s_set_var    W,outviewdist,#120	
.nonothing
;------------------------camera control--------------
	lda.l		m_playertwoactivated
	cmp	#1
	lbeq	.resetview
	lda	stage
	cmp	#99
	lbeq	.resetview
	s_jmp_keyup        Jdown2,.noa2
	s_add_var        W,outvx,#2*256
	lda	#1
	sta	nolockview
.noa2
    ;rotate camera x-
    s_jmp_keyup        Jup2,.nob2
	s_sub_var        W,outvx,#2*256
	lda	#1
	sta	nolockview
.nob2
    ;rotate camera y+
    s_jmp_keyup        Jleft2,.nol2
    s_add_var        W,outvy,#2*256
	lda	#1
	sta	nolockview
.nol2
    ;rotate camera y-
    s_jmp_keyup        Jright2,.nork
    s_sub_var        W,outvy,#2*256
	lda	#1
	sta	nolockview
.nork
    ;rotate camera z+
    s_jmp_keyup        b2,.nork2
    s_add_var        W,outvz,#2*256
	lda	#1
	sta	nolockview
.nork2
    ;rotate camera z-
    s_jmp_keyup        a2,.nor2
    s_sub_var        W,outvz,#2*256
	lda	#1
	sta	nolockview
.nor2
    ;zoom out
    s_jmp_keyup        x2,.nox2
	lda	#1
	sta	nolockview
	a16
	lda	outdist
	cmp #4000
    bpl    .nox2
	a8
    s_add_var        W,viewdist,#200
    s_add_var        W,outdist,#200
.nox2
    ;zoom in
	a8
    s_jmp_keyup        y2,.noy2
	lda	#1
	sta	nolockview
	a16
	lda	outdist
	cmp	#200
	bmi	.noy2
	a8
    s_sub_var        W,viewdist,#200
    s_sub_var        W,outdist,#200
.noy2    
	a8
;"All-range" mode
    ;rotate ship direction left  (P2 L)
    s_jmp_keyup        left2,.noleft
	s_or_var		B,gameflags,#gf_nozremove	
    s_add_var        W,player_turnrot,#4*256
.noleft
    ;rotate ship direction left (P2 R)
    s_jmp_keyup        right2,.noright
	s_or_var		B,gameflags,#gf_nozremove	
    s_sub_var        W,player_turnrot,#4*256
.noright
;-----------------------------

	lda	whichroute			;skip all of this code if in boss test mode
	cmp	#9
	lbeq	.npst
	
;-----------------------------
;Turn Crosshair/debug information off/on
	s_jmp_keyup        b,.resetview
	s_jmp_keyup        x,.resetview
	s_jmp_lastkeydown	x,.resetview
	lda	debugalien
	beq	.0	;if debug off, go to .0
	cmp	#1	;if debug on, go to .1
	beq	.1
	cmp	#2	;if extended debug on, go to .2
	beq	.2
.0
	lda	nocrosshairpls
	beq	.nocrosshair	;if crosshair not disabled, disable that first
	stz	nocrosshairpls	;re-enable crosshair
	lda	playertwoactivated
	bne	.resetview
	lda	#1
	sta	debugalien	;enable debug
	bra	.resetview
.nocrosshair
	lda	#1
	sta	nocrosshairpls	;special variable to disable crosshair
	bra	.resetview
.1
	lda	#2
	sta	debugalien	;turn extended debug on
	bra	.resetview
.2
	stz	debugalien
	
;	bra	.resetview

.resetview
	lda	newgameplus
	and	#1
	lbne	.noch2
;-----------------------------------------
	s_jmp_varNE	B,stayblack,#-1,.noimdone
	s_jmp_varAND	B,pshipflags,#psf_noctrl,.noimdone
	s_jmp_varAND	B,pshipflags,#psf_nofire,.noimdone
	s_jmp_varAND	B,pstratflags,#pstf_notdie,.noimdone
	s_jmp_varAND	B,pstratflags,#pstf_inseq,.noimdone
;Spawn Helperball (L press X)
	s_jmp_keyup			left,.noimdone
	s_jmp_keyup			x,.noimdone
	s_jmp_lastkeydown	x,.noimdone
	lda	helpshots
	cmp	#2
	bpl	.noimdone
	s_make_obj		#helpball,.noimdone
	s_set_strat		y,helpball_Istrat
	inc	helpshots
	TRIGSE			$10
	jmp			.npst
.noimdone
;-----------------------
;Weapon Select (R press X) Next Weapon
	IFEQ	1				;DISABLEDdDDDdDDdDDasdf
	s_jmp_keyup			right,.noch
	s_jmp_keyup			x,.noch	
	s_jmp_keydown		y,.noch
	s_jmp_lastkeydown	x,.noch
	jsr	nextweapon

.noch	
;--------------------------------------------------------------------------------------
;--------------------------------------------------------------------------------------
;--------------------------------------------------------------------------------------
;Weapon Select Previous (R+Y press X) Last Weapon
	s_jmp_keyup			right,.nochh
	s_jmp_keyup			y,.nochh
	s_jmp_keyup			x,.nochh
	s_jmp_lastkeydown	x,.nochh
	jsr	prevweapon
	ENDC
.nochh
;Weapon Select PLAYER TWO (R2 press X2)
	s_jmp_keyup			right2,.noch2
	s_jmp_keyup			x2,.noch2	
	s_jmp_keydown		y2,.noch2
	s_jmp_lastkeydown	x2,.noch2
	lda	weaponnumberptwo
	cmp	#28
	beq	.goto982
	cmp	#99
	beq	.weapreset2
	inc	weaponnumberptwo
	bra	.noch2
.goto982
	lda	#98
	sta	weaponnumberptwo
	bra	.noch2
.weapreset2
	lda	#0
	sta	weaponnumberpone
	bra	.noch2
.noch2	


	s_copy_var2alvar	W,x,al_weaponnum,weaponnumberpone

	
;------end custom code---------------------------------------------------
;----------------------------------------------------
; plane toggle.
	
;	s_jmp_keyup		select,.nps
;	s_jmp_lastkeydown	select,.nps
;    	jsr			select_nextship
;.nps







;--------------------------COCKPIT MODE VIEW ROTATION CODE==========
.cockcheck
	lda	cockpitmode
	beq	.nochase

	lda	curr_ship
	cmp	#24
	beq	.allset
	lda	#24
	jsr	select_ship
	s_copy_var2var		B,shiptemp,curr_ship
	lda	shiptemp
	dec	shiptemp
	dec	shiptemp
	dec	shiptemp		;decrease 6 times because it goes from ship 1-7
	dec	shiptemp
	dec	shiptemp
	dec	shiptemp
	sta	shiptemp
	s_set_var    W,viewdist,#30
	s_set_var    W,outviewdist,#30
	s_set_var    W,outdist,#30
.allset
	s_copy_alvar2var    B,x,svar_byte2,al_rotz		;copy the rotation to svar_byte2
	a8												;Change to 8 bit accumulator
	lda	svar_byte2									;Load svar_byte2 into accumulator

	nega											;make it the negative value of what it is
	sta	svar_byte2									;store it back

    s_copy_var2var        B,outvz+1,svar_byte2		;make the world rotate (in the negative/opposite direction)
	s_set_alvar			B,x,al_rotz,#0				;set your rotation to 0

		
	
.nochase

; view toggle.
;	s_jmp_varNE	W,viewdist,outdist,.npst
	lda	frozen
	bne	.itsfrozensokeepgoing
	
	s_jmp_varNE	B,stayblack,#-1,.npst
	s_jmp_varAND	B,pshipflags,#psf_noctrl,.npst
	s_jmp_varAND	B,pstratflags,#pstf_notdie,.npst
	s_jmp_varAND	B,pstratflags,#pstf_inseq,.npst
.itsfrozensokeepgoing
;----Spawn Helper Ship----
	lda	newgameplus
	and	#1
	lbne	.twoplayerstart
	s_jmp_keyup			x,.finishedthanks
	a16
	lda	trig0
	bit	#pad_select
	a8
	lbeq	.finishedthanks
	lda	twoplayer
	cmp	#1
	lbeq	.npst

	lda	teamon
	cmp	#1
	lbeq	.endstuff
	s_find_obj		y,x,#peppy1,.none1
	jmp	.npst
.none1
	s_find_obj		y,x,#slippy1,.none2
	jmp	.npst
.none2
	s_find_obj		y,x,#falco1,.none3
	jmp	.npst
.none3
	lda	#1
	sta	teamon
.pickagain
	s_jmp_random	.falco,33
	s_jmp_random	.slippy,33
	s_jmp_random	.peppy,33
	bra	.pickagain
.falco
	s_make_obj		#falco1,.npst
	s_set_strat		y,friendforever_Istrat	
	jmp		.npst
.slippy
	s_make_obj		#slippy1,.npst
	s_set_strat		y,friendforever_Istrat	
	jmp		.npst
.peppy
	s_make_obj		#peppy1,.npst
	s_set_strat		y,friendforever_Istrat	
	jmp		.npst

.endstuff
	lda	#0
	sta	teamon
	jmp	.npst
.finishedthanks

;----Spawn Eraser Ship----
	IFEQ	1
	s_jmp_keyup			y,.finishedthanks2
	a16
	lda	trig0
	bit	#pad_select
	a8
	lbeq	.finishedthanks2
	lda	twoplayer
	cmp	#1
	lbeq	.npst

;	lda	eraseron
;	cmp	#1
;	lbeq	.endstuff2
	s_set_find		0
	s_find_obj		y,x,#peppy1,.none12
	jmp	.npst
.none12
	s_find_obj		y,x,#slippy1,.none22
	jmp	.npst
.none22
	s_find_obj		y,x,#falco1,.none32
	jmp	.npst
.none32
	lda	#1
	sta	eraseron
.pickagain2
	s_jmp_random	.falco2,33
	s_jmp_random	.slippy2,33
	s_jmp_random	.peppy2,33
	s_set_find		0
	bra	.pickagain2
.falco2
	s_make_obj		#falco1,.npst
	s_set_strat		y,frienderaser_Istrat	
	s_copy_var2var	W,xval,minpmoveX
	s_copy_var2var	W,yval,maxpmoveY-100
	jmp		.npst
.slippy2
	s_make_obj		#slippy1,.npst
	s_set_strat		y,frienderaser_Istrat	
	s_copy_var2var	W,xval,maxpmoveX
	s_copy_var2var	W,yval,minpmoveY+100
	jmp		.npst
.peppy2
	s_make_obj		#peppy1,.npst
	s_set_strat		y,frienderaser_Istrat	
	s_copy_var2var	W,xval,maxpmoveX
	s_copy_var2var	W,yval,maxpmoveY-100

	jmp		.npst

.endstuff2
	lda	#0
	sta	eraseron
	jmp	.npst
.finishedthanks2
	ENDC
;----general command to keep the math processor up to date with player two status - may not be needed
;;	lda	playertwoactivated
;	beq	.twoplayernotactive
;	lda	#1
;	sta.l	m_playertwoactivated

.twoplayernotactive
;-----------------test kill 1 player------------
;-----------------test kill 1 player------------

	s_jmp_keyup	left,.twoplayerstart
	s_jmp_keyup	A,.twoplayerstart
	s_jmp_keyup	start,.twoplayerstart
	s_jmp_lastkeydown	start,.twoplayerstart
	s_set_alvar	B,x,al_hp,#0


;----------------------2P MODE-------------------------------TEST---------------------------------------
.twoplayerstart
	lda	livestwo
	cmp	#0
	lbeq	.finishedthanks1
	lda	playertwoready
	cmp	#1
	lbeq	.donedelay
	cmp	#1
	lbpl	.dodec

	jmp	.finishedthanks1



.dodec
	lda	#1
	sta	playertwoready
	s_set_var        W,outvy,#0
	s_set_var        W,outvx,#0
	s_set_var        W,player_turnrot,#0
	jmp	.finishedthanks1
.donedelay

	s_set_var        W,outvy,#0
	s_set_var        W,outvx,#0
	s_set_var        W,player_turnrot,#0
	jsl	activatesecondplayer_l
.finishedthanks1

;----------------END 2P MODE-------------------------------------------
	s_jmp_varNE	B,stayblack,#-1,.npst2
	s_jmp_varAND	B,pshipflags,#psf_noctrl,.npst2
	s_jmp_varAND	B,pshipflags,#psf_nofire,.npst2
	s_jmp_varAND	B,pstratflags,#pstf_notdie,.npst2
	s_jmp_varAND	B,pstratflags,#pstf_inseq,.npst2
	s_set_objtobeplayer	x
	s_jmp_alvarNOTZERO	B,x,al_sbyte2,.npst2
	lda	lives
	beq	.itsok
	bmi	.itsok
	lda	livestwo
	beq	.itsok
	lda	playertwoactivated
	cmp	#1
	beq	.npst
.itsok


.npst

;--------------------------LEFT ISO MODE VIEW TOGGLE==========
	lda	cockpitmode
	lbne	.cockstart

	s_jmp_varAND	B,superspeeddelay,#ktest,.nocock
	s_jmp_varNE	B,stayblack,#-1,.npst2
	s_jmp_varAND	B,pshipflags,#psf_noctrl,.npst2
	s_jmp_varAND	B,pshipflags,#psf_nofire,.npst2
	s_jmp_varAND	B,pstratflags,#pstf_notdie,.npst2
	s_jmp_varAND	B,pstratflags,#pstf_inseq,.npst2	
	lda	newgameplus
	and	#1
	lbne	.nocock
	lda	playertwoactivated
	lbne	.npst3
	
	s_jmp_keyup			jleft,.righty
	s_jmp_keyup			select,.righty	
	a16
	lda	trig0
	bit	#pad_select
	a8
	lbeq	.righty
	s_set_var    W,viewdist,#3000
	s_set_var    W,outviewdist,#3000
	s_set_var    W,outdist,#3000
	s_set_var	W,outvx,#-deg45*256
	s_set_var	W,outvy,#deg45*256
	s_or_var	B,crosshairflag,#crosshairoff
	s_and_var	B,gameflags,#~gf_nozremove	
	s_and_var	B,superspeeddelay,#~ktest
	s_and_var	B,superspeeddelay,#~ktest2
	s_and_var	B,superspeeddelay,#~ktest3
	s_or_var	B,superspeeddelay,#ktest4
	s_and_var	B,superspeeddelay,#~ktest5
	stz			crosshairon
	stz			cockpitmode
	lda		#1
	sta	isoviewmode
	jmp	.npst2




;--------------------------RIGHT ISO MODE VIEW TOGGLE==========
.righty


	s_jmp_keyup			jright,.upy
	s_jmp_keyup			select,.upy	
	a16
	lda	trig0
	bit	#pad_select
	a8
	lbeq	.upy
	s_set_var    W,viewdist,#3000
	s_set_var    W,outviewdist,#3000
	s_set_var    W,outdist,#3000
	s_set_var	W,outvx,#-deg45*256
	s_set_var	W,outvy,#-deg45*256
	s_or_var	B,crosshairflag,#crosshairoff
	s_and_var	B,gameflags,#~gf_nozremove	
	s_and_var	B,superspeeddelay,#~ktest
	s_and_var	B,superspeeddelay,#~ktest2
	s_or_var	B,superspeeddelay,#ktest3
	s_and_var	B,superspeeddelay,#~ktest4
	s_and_var	B,superspeeddelay,#~ktest5
	stz			crosshairon
	stz			cockpitmode
	lda		#1
	sta	isoviewmode
	jmp	.npst2
	
.upy

;--------------------------Top Down MODE VIEW TOGGLE==========

	s_jmp_keyup			jup,.cockstart
	s_jmp_keyup			select,.cockstart	
	a16
	lda	trig0
	bit	#pad_select
	a8
	lbeq	.cockstart
	s_set_var    W,viewdist,#2000
	s_set_var    W,outviewdist,#2000
	s_set_var    W,outdist,#2000
	s_set_var	W,outvx,#-deg22*256
	s_set_var	W,outvy,#0
	s_or_var	B,crosshairflag,#crosshairoff
	s_and_var	B,gameflags,#~gf_nozremove	
	s_and_var	B,superspeeddelay,#~ktest
	s_and_var	B,superspeeddelay,#~ktest2
	s_and_var	B,superspeeddelay,#~ktest3
	s_and_var	B,superspeeddelay,#~ktest4
	s_or_var	B,superspeeddelay,#ktest5
	stz			crosshairon
	stz			cockpitmode
	lda		#1
	sta	isoviewmode
	jmp	.npst2
	
;--------------------------COCKPIT MODE VIEW TOGGLE==========
.cockstart
	lda	cockpitmode
	lbne	.nocock
	
	s_jmp_keyup			jdown,.nocock
	s_jmp_keyup			select,.nocock	
	a16
	lda	trig0
	bit	#pad_select
	a8
	lbeq	.nocock
	
	a16
	s_set_var    W,viewdist,#30
	s_set_var    W,outviewdist,#30
	s_set_var    W,outdist,#30
	s_set_var	W,outvx,#0
	s_set_var	W,outvy,#0
	s_and_var	B,crosshairflag,#~crosshairoff
	s_and_var		B,gameflags,#~gf_nozremove	
	s_and_var    B,superspeeddelay,#~ktest
	s_and_var	B,superspeeddelay,#~ktest2
	s_and_var    B,superspeeddelay,#~ktest3
	s_and_var    B,superspeeddelay,#~ktest4
	s_and_var	B,superspeeddelay,#~ktest5
	stz	isoviewmode
	lda	#1
	sta	cockpitmode
	lda	#255
	sta	crosshairon
	jsl	set_playeroutofcock_l
	jmp	.npst2

.nocock
	s_jmp_keyup		select,.npst3
;	s_jmp_lastkeydown		select,.npst
	a16
	lda	trig0
	bit	#pad_select
	a8
	lbeq	.npst3
;	lda	tunneltime
;	lbne	.npst3
	trigse	$65

	lda	splayerflymode
	inc	a
	cmp	splayerflymodeopt
	bmi	.ok
	lda	#0
.ok
	sta	splayerflymode

	ldx		playpt
	jsl		playerstraight_strat	
	jsl		changeviewmode_l
.npst3
;-------------------------------------------------
	lda	playertwocpuactivated
	cmp	#1
	lbmi	.nop2cpuassault
	s_jmp_alvarmore		W,x,al_worldx,#290,.expand2
	s_jmp_alvarmore.w		W,y,al_worldx,#290,.expand2
	s_jmp_alvarless		W,x,al_worldx,#-290,.expand2
	s_jmp_alvarless.w		W,y,al_worldx,#-290,.expand2

	s_jmp_alvarmore		W,x,al_worldx,#150,.expand
	s_jmp_alvarmore.w		W,y,al_worldx,#150,.expand
	s_jmp_alvarless		W,x,al_worldx,#-150,.expand
	s_jmp_alvarless.w		W,y,al_worldx,#-150,.expand

	s_jmp_alvarmore		W,x,al_worldy,#-60,.expand
	s_jmp_alvarmore.w		W,y,al_worldy,#-60,.expand
	s_jmp_alvarless		W,x,al_worldy,#-250,.expand
	s_jmp_alvarless.w		W,y,al_worldy,#-250,.expand	
	s_Achase_var    W,viewdist,#250,3
	s_Achase_var    W,outviewdist,#250,3
	s_Achase_var    W,outdist,#250,3
	jmp	.doneexpand

	
.expand
	s_Achase_var    W,viewdist,#600,3
	s_Achase_var    W,outviewdist,#600,3
	s_Achase_var    W,outdist,#600,3
	jmp	.doneexpand

.expand2
	s_Achase_var    W,viewdist,#1100,3
	s_Achase_var    W,outviewdist,#1100,3
	s_Achase_var    W,outdist,#1100,3
.doneexpand
.nop2cpuassault
.npst2

	a16
	ldx	internalplaypt
	lda	al_worldx,x
	sta	player_posx
	lda	al_worldy,x
	sta	player_posy
	lda	al_worldz,x
	sta	player_posz
	a8

	s_copy_alvar2var	W,x,playervelZ,al_vz


; END


;----------------------------------------------------
; player dying.
	s_test_var		B,gameflags,#GF_PLAYERDYING
	s_beq			.ndead

;------------------------------
	ifeq	0

	lda	livestwo
	beq	.nop2
	bra	.contin
.nop2
	lda	lives
	cmp	#0
	beq	.goon
.contin
	cmp	#1
	lbeq	.ndead1
	bra	.goon
.ndead1
	lda	ponedead
	cmp	#1
	beq	.goon
	s_set_alvar		W,x,al_hp,#0
	lda	#0
	sta.l	m_damage
	jmp	.ndead

	endc
;----------------------------------	
.goon
	s_Achase_var		W,outvx,#0,3
	s_Achase_var		W,plrotz,#0,2
	s_jmpNOT_varAND		B,playerflymode,#pfm_dieYrot,.nfo
;	s_sub_var		W,outvy,playerdieYrotspeed
	s_jmp_ifnotlevel	2,.nlevel222
	s_jmp_varNE		B,stage,#1,.nlevel222
	s_sub_var		W,outvy,#128/3
	bra	.nfo
.nlevel222
	s_sub_var		W,outvy,#128
	;	s_jmp_varLESS		W,outvy,#(-(deg90-deg11-deg11))*256,.n
.nfo 	
	s_test_var		B,gameflags,#GF_PLAYERDEAD
	s_bne			.isdead

	s_Achase_var		W,outdist,#500,4
	jmp			.ndead

.isdead
	s_beqdec_var		B,timeuntilfade,.fadeit
	s_jmp			.notfin
.fadeit

	fadedown

	lda	fade
	lbne	.notfin

	stz	fadetored

	stz	circleanim
	stz	circleanim+1

	lda	gameflags2
	and	#~gf2_ingame
	sta	gameflags2

	jsl	clearmap_l

	lda	lives
	cmp	#1
	lbpl	.notdeadyet



	a8
	lda.l	m_playertwoactivated	;check 2p mode active
	beq	.gameover	
	lda	livestwo
	beq	.gameover	;if its = 0 normal gameover
	bra	.notdeadyet	;p2 not dead
	
.gameover	
	lda	#le_gameover
	
	sta	levelfinished
;-------------------------------------------------------------------------

	bra	.notfin
.notdeadyet
	lda	bgflags
	ora	#bgf_restart
	sta	bgflags
;;	jsl	restart_l
.notfin

.ndead


;----------------------------------------------------

	lda	screenflashcnt
	beq	.disableflash

	s_jmp_varEQ	B,screenflashtype,#screenflashbodytype,.body
	lda	screenflashcnt
	cmp	#screenflashwingfrms
	bne	.nturq2
	jsl	flashturq2_l	
.nturq2
	dec	screenflashcnt
	bra	.nsflash	

;--------------------------------------------------------
.body
	lda	screenflashcnt
	cmp	#screenflashbodyfrms
	bne	.nturq
	jsl	flashturq_l	
	bra	.end
.nturq
	cmp	#2
	bne	.end
	jsl	flashred_l
.end
	dec	screenflashcnt
	bra	.nsflash
.disableflash
	dealloc_window	hitflash
.nsflash

	
;----------------------------------------------------
; View float

	s_jmpNOT_varAND		B,playerflymode,#pfm_wobble,.nwob2

	s_jmpNOT_varAND		B,pshipflags,#psf_brkLwing!psf_brkRwing,.nbrkwing
	s_set_var2vartab	W,W,W,viewfloatY,viewfloatptr,viewfloattab
	s_brl			.vcont
.nbrkwing	s_set_var2vartab	W,W,W,viewfloatY,viewfloatptr,viewfloattab,-1
.vcont

	s_add_var		W,viewfloatptr,#2
	s_jmp_varNE		W,viewfloatptr,#viewfloattab_len,.vptrok
	s_set_var		W,viewfloatptr,#0
.vptrok
.nwob2

;----------------------------------------------------

	s_set_objtobevar	x,pcboxobj_B
	s_copy_alvar2var	B,x,ponehp,al_hp
	s_copy_alvar2var	W,x,ponex,al_worldx
	s_copy_alvar2var	W,x,poney,al_worldy
	s_copy_alvar2var	W,x,ponex+1,al_worldx+1
	s_copy_alvar2var	W,x,poney+1,al_worldy+1


	jsl	random_l

	rtl
	






;*****************************************************************************
hardenemy1_Istrat
	s_start_strat	
	s_set_colltype		x,enemy1
hard_Istrat
	s_start_strat
	s_hardvars		x
	s_set_strat		x,0
	s_end_strat

;*****************************************************************************
hard180YRNZR_Istrat
	s_start_strat
	s_setnoremove_behind	x
	s_jmp			hard180YR_Istrat
;*****************************************************************************
hard180YR_Istrat
	s_start_strat
	s_set_colltype	x,enemy1
	s_set_alvar		B,x,al_roty,#deg180
	s_hardvars		x
	s_set_strat		x,0
	s_end_strat

hard0_Istrat
	s_start_strat
	s_set_colltype	x,enemy1
	s_hardvars		x
	s_set_strat		x,0
	s_end_strat

hardrandom_Istrat
	s_start_strat
	s_set_colltype	x,enemy1
	s_hardvars	x
	s_set_alvar2rnd	x,al_roty
	s_set_strat		x,0
	s_end_strat

hardrandomslow_Istrat
	s_start_strat
	s_set_colltype	x,enemy1
	s_hardvars	x
	s_set_alvar2rnd	x,al_roty
	s_set_strat		x,hardrandomslow_strat
	
hardrandomslow_strat
	s_start_strat
	s_jmp_notdelay	3,.noflash
	s_add_colanim		x,#1,#4
.noflash
	s_end_strat


;*****************************************************************************
rockhard_Istrat
	s_start_strat
	s_set_colltype	x,enemy1
	s_set_alvar		B,x,al_roty,#deg180
	s_set_aldata		x,#hardHP,#rockhardAP
	s_set_strat		x,0
	s_end_strat


;*****************************************************************************
hardrot_Istrat
	s_start_strat
	s_set_colltype	x,enemy1
	s_hardvars		x
	s_set_strat		x,hardrot_strat
hardrot_strat
	s_start_strat
	s_add_alvars		B,x,al_rotx,x,al_sbyte1
	s_add_alvars		B,x,al_roty,x,al_sbyte2
	s_add_alvars		B,x,al_rotz,x,al_sbyte3
	s_end_strat



;*****************************************************************************
stayrelhard180yr_Istrat
	s_hardvars		x
	s_set_alvar		B,x,al_roty,#deg180
	s_set_strat		x,stayrelhard180YR_strat
stayrelhard180YR_strat
	s_start_strat
	s_add_playerZ	x			
	s_end_strat


stayrel_Istrat
stayrel_strat
	s_start_strat	
	s_add_playerZ	x
	s_set_alsflag	x,colldisable
	s_end_strat
	
;*****************************************************************************
staydist_Istrat
	s_start_strat	
	s_copy_alvar2alvar	W,x,al_worldz,x,al_sword1
	s_add_alvar		W,x,al_worldz,pviewposz
	s_set_alsflag	x,colldisable
	s_end_strat


;*****************************************************************************
boost_Istrat	s_start_strat
	s_set_lifecnt	x,#10
	s_set_alsflag	x,colldisable
	s_set_strat	x,boost_strat
	s_copy_alvar2var	B,x,svar_byte1,al_sbyte1
	s_sprite_obj	x,#0,svar_byte1
	s_clr_alsflag	x,invisible
	s_setnoremove_behind	x
boost_strat
	s_start_strat
	s_dec_alvar		B,x,al_tx
	s_set_objtobevar	y,boostobj
	s_jmp_objptrbad		y,remove_Istrat
	s_add_Roffs2pos		B,x,y,y,#0,#0,boostZoff,1,1,0
	s_dec_lifecnt		x
	s_end_strat

	
boostl_Istrat	s_start_strat
	s_set_lifecnt	x,#10
	s_set_alsflag	x,colldisable
	s_set_strat	x,boostl_strat
	s_copy_alvar2var	B,x,svar_byte1,al_sbyte1
	s_sprite_obj	x,#0,svar_byte1
	s_clr_alsflag	x,invisible
	s_setnoremove_behind	x
boostl_strat
	s_start_strat
	s_dec_alvar		B,x,al_tx
	s_set_objtobevar	y,boostobj
	s_jmp_objptrbad		y,remove_Istrat
	s_add_Roffs2pos		B,x,y,y,#25,#0,boostZoff,1,1,1
	s_dec_lifecnt		x
	s_end_strat

boostr_Istrat	s_start_strat
	s_set_lifecnt	x,#10
	s_set_alsflag	x,colldisable
	s_set_strat	x,boostr_strat
	s_copy_alvar2var	B,x,svar_byte1,al_sbyte1
	s_sprite_obj	x,#0,svar_byte1
	s_clr_alsflag	x,invisible
	s_setnoremove_behind	x
boostr_strat
	s_start_strat
	s_dec_alvar		B,x,al_tx
	s_set_objtobevar	y,boostobj
	s_jmp_objptrbad		y,remove_Istrat
	s_add_Roffs2pos		B,x,y,y,#-25,#0,boostZoff,1,1,1
	s_dec_lifecnt		x
	s_end_strat
;*****************************************************************************
nocollanim0_Istrat
	s_init_anim		x,#0
nocoll_Istrat
	s_start_strat
	s_set_alsflag		x,colldisable
	s_set_strat		x,0
	s_end_strat

;*****************************************************************************
collide_Istrat
	s_start_strat
	s_docoll		x,#framesperAP
	s_jmp_alvarNOTzero	B,x,al_hp,.ncolexp
 	s_jmpto_expstrat	x
.ncolexp
	s_end_strat
;--------------------------------------------------------------------------------
godguncollide_Istrat
	s_start_strat
	s_set_objtobealvar	y,x,al_collobjptr
	lda	bossmode
	lbne	.skip
	s_cmp_alvar			W,y,al_shape,#sface_b
	lbeq				.skip
	s_cmp_alvar			W,y,al_shape,#sface2_b
	lbeq				.skip
	s_cmp_alvar			W,y,al_shape,#luigih
	lbeq				.skip
	s_cmp_alvar			W,y,al_shape,#andross
	lbeq				.skip
	s_cmp_alvar			W,y,al_shape,#androsscube
	lbeq				.skip
	s_cmp_alvar			W,y,al_shape,#fireface_b
	lbeq				.skip
	s_cmp_alvar			W,y,al_shape,#fireface1_b
	lbeq				.skip
	s_cmp_alvar			W,y,al_shape,#face_0
	lbeq				.skip

	s_cmp_alvar			W,y,al_shape,#face_0_1
	lbeq				.skip
	s_cmp_alvar			W,y,al_shape,#face_1
	lbeq				.skip
	s_cmp_alvar			W,y,al_shape,#face_box
	lbeq				.skip

	s_cmp_alvar			W,y,al_shape,#myship_4
	lbeq				.skip
	s_cmp_alvar			W,y,al_shape,#ship_3
	lbeq				.skip
	s_cmp_alvar			W,y,al_shape,#boss_F_1
	lbeq				.skip
	s_cmp_alvar			W,y,al_shape,#boss_F_2
	lbeq				.skip
	s_cmp_alvar			W,y,al_shape,#boss_F_3
	lbeq				.skip
	s_cmp_alvar			W,y,al_shape,#boss_F_4
	lbeq				.skip
	s_jmp_alsflag		y,colldisable,.solidhit
	s_jmp_alsflag		y,nohitaffect,.solidhit
	s_jmp_alvarEQ.w		B,y,al_hp,#hardHP,.solidhit	
	s_jmp_colltype	y,friend,.skip
	s_jmp_colltype	y,laser,.skip

	bra	.nsolidhit

.solidhit
	lda	bossmode
	bne	.nsolidhit
	lda	weaponnumber
	cmp	#98
	beq	.nsolidhit
	s_set_expstrat	y,explode_istrat
	s_remove_obj		y
	bra	.skip
.nsolidhit
	s_set_expstrat	y,explode_istrat
	s_kill_obj		y
.skip
 	s_end_strat
;*****************************************************************************
pelasercollide_Istrat
	s_start_strat
	s_set_objtobealvar	y,x,al_collobjptr
	s_jmp_alsflag		y,nohitaffect,.solidhit
	s_jmp_alvarEQ.w		B,y,al_hp,#hardHP,.solidhit	
	s_jmp_colltype		y,enemyweap,.skipscore
	s_jmp_colltype		y,friend,.skipscore
	s_cmp_alvar			W,y,al_shape,#friendship_4
	lbeq					.solidhit
	s_cmp_alvar			W,y,al_shape,#slippy1
	lbeq					.solidhit
	s_cmp_alvar			W,y,al_shape,#falco1
	lbeq					.solidhit
	s_cmp_alvar			W,y,al_shape,#peppy1
	lbeq					.solidhit
	s_cmp_alvar			W,y,al_shape,#playertwo1
	lbeq					.solidhit
	s_cmp_alvar			W,y,al_shape,#smoke
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#missile
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#c_miss
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#boss_A_1
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#gate_2
	lbeq					.skipscore
	lda	bgm_music
	cmp	#5
	bne	.skipbgm
	s_cmp_alvar			W,y,al_shape,#f_fish
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#big_m
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#boss_d_4
	lbeq					.skipscore	
	s_cmp_alvar			W,y,al_shape,#zaco_6
	lbeq					.skipscore
.skipbgm
	s_cmp_alvar			W,y,al_shape,#RADER_0
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#RADER_1
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#TOW_0
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#grabber
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#grabber2
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#ray_bred
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#ray_1
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#bulge
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#boss_f_b
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#sface2_b
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#fireface1_b
	lbeq					.skipscore	
	s_cmp_alvar			W,y,al_shape,#fireface_b
	lbeq					.skipscore	
	s_cmp_alvar			W,y,al_shape,#sface_b
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#face_0
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#face_0_1
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#face_1
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#boss_h_1
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#boss_h_1a
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#boss_g_0
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#boss_g_s
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#boss_e_4
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#air_1
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#hou_4
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#boss_8_5
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#s_0
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#s_1
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#egg
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#neck
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#arm
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#boss_d_0
	lbeq					.skipscore	
	s_cmp_alvar			W,y,al_shape,#boss_d_2
	lbeq					.skipscore	
	s_cmp_alvar			W,y,al_shape,#boss_d_6
	lbeq					.skipscore	
	s_cmp_alvar			W,y,al_shape,#boss_d_7
	lbeq					.skipscore	
	s_cmp_alvar			W,y,al_shape,#robot_0
	lbeq					.skipscore	
	s_jmp_iflevel	2,.level2
	bra	.notlevel2
.level2
	s_cmp_alvar			W,y,al_shape,#sea_0_0
	beq					.skipscore
	s_cmp_alvar			W,y,al_shape,#sea_0_1
	beq					.skipscore
	s_cmp_alvar			W,y,al_shape,#sea_0
	beq					.skipscore
.notlevel2

	s_score	#2
.skipscore
	lda.w	al_collstratptr,y
	ora.w	al_collstratptr+1,y
	ora.w	al_collstratptr+2,y
	bne	.nsolidhit

.solidhit	jsl			hitwallsound_l
.nsolidhit
	s_kill_obj		x
 	s_jmpto_expstrat	x

	
weapcollide_Istrat
	s_start_strat
	s_set_objtobealvar	y,x,al_collobjptr
	s_jmp_alvarNOTZERO.w	B,y,al_AP,.nzap
	s_docollAP		x,#framesperAP,#1
	s_brl			.dcol
.nzap
	s_jmpNOT_alcollflag	y,weapon,kill_Istrat
	s_docoll		x,#framesperAP
.dcol
	s_jmp_alvarNOTzero	B,x,al_hp,.ncolexp
 	s_jmpto_expstrat	x
.ncolexp
 	s_jmpto_strat	x


;*****************************************************************************

RebElaserCol_Istrat
	s_start_strat
	s_clr_alsflag		x,collide

	s_set_objtobealvar	y,x,al_collobjptr
	s_jmp_alvarNE.w		W,y,al_shape,#elaser2,.end
	phx
	tyx
	s_push_alvar		B,x,al_roty
	s_push_alvar		B,x,al_rotx
	s_push_alvar		B,x,al_speed
	s_push_alvar		W,x,al_immuneptr
	s_set_alvar		B,x,al_speed,#0
	s_add_alvar		B,x,al_roty,#deg180
	s_neg_alvar		B,x,al_rotx
	s_weapon_pos		#0,#0,#0
	s_weapon_rot		#0,#0
	s_fire_weapon		x,RebElaser
	s_pull_alvar		W,x,al_immuneptr
	s_pull_alvar		B,x,al_speed
	s_pull_alvar		B,x,al_rotx
	s_pull_alvar		B,x,al_roty
	plx
.end
    	s_jmpto_strat		x


DefElaserCol_Istrat
	s_start_strat
	s_clr_alsflag		x,collide

	s_set_objtobealvar	y,x,al_collobjptr
	s_jmp_alvarNE.w		W,y,al_shape,#elaser2,.end
	phx
	tyx
	s_push_alvar		B,x,al_roty
	s_push_alvar		B,x,al_rotx
	s_push_alvar		B,x,al_speed
	s_push_alvar		W,x,al_immuneptr
	s_set_alvar		B,x,al_speed,#0
	s_add_alvar		B,x,al_roty,#deg90
	s_set_alvar2rnd	x,al_rotx
;	s_neg_alvar		B,x,al_rotx
	s_weapon_pos		#0,#0,#0
	s_weapon_rot		#0,#0
	s_fire_weapon		x,RebElaser
	s_pull_alvar		W,x,al_immuneptr
	s_pull_alvar		B,x,al_speed
	s_pull_alvar		B,x,al_rotx
	s_pull_alvar		B,x,al_roty
	plx
.end
    	s_jmpto_strat		x
		


hitflashBOSSd_Istrat
	s_start_strat	
	s_jmp_alsflag		x,nohitaffect,.ndam
	trigse		$80
	s_set_objtobealvar	y,x,al_collobjptr
	phx	
	tyx
	jsl		makeMEDexpobj_srou
	s_set_alsflag	y,nopolyexp
	plx
	s_brl			hitflash_Istrat
.ndam	
	trigse		$24
	s_brl			hitflash_Istrat

hitflashMexp_Istrat
	s_start_strat	
	s_set_objtobealvar	y,x,al_collobjptr
	phx	
	tyx
	s_jsl		    	makeMEDexpobj_srou
	plx
	trigse		$24
	s_brl			hitflash_Istrat
hitflashSexp_Istrat
	s_start_strat	
	s_set_objtobealvar	y,x,al_collobjptr
	phx	
	tyx
	s_jsl		    	makeSMLexpobj_srou
	plx
	trigse		$24
	s_brl			hitflash_Istrat

hitflashLexp_Istrat
	s_start_strat	
	s_set_objtobealvar	y,x,al_collobjptr
	phx	
	tyx
	s_jsl		    	makeLexpobj_srou
	plx
	trigse		$24


coll_Istrat
	s_start_strat
	s_clr_alsflag		x,collide
	s_jmp_alsflag		x,nohitaffect,hitflash_Istrat.nocol
	s_docoll		x,#framesperAP
	s_jmp			hitflash_Istrat.Icont



hitflash_Istrat
	s_start_strat
	s_clr_alsflag		x,collide
	s_jmp_alsflag		x,nohitaffect,.nocol

	s_docoll		x,#framesperAP
	s_set_alsflag		x,hitflash

.Icont	local

	phy
	ldy	playpt
	jsl	xzdiffs_l
	a16
	lda	rangexz
	cmp	#1000
	bcc	.near
	cmp	#2000
	bcc	.mid
.far	a8
	trigse		se_damageenemyfar
	s_jmp		.end
.mid	a8
	trigse		se_damageenemymid
	s_jmp		.end
.near	a8
	trigse		se_damageenemynear
.end	ply

.nocol	local
	s_jmpto_strat		


;*****************************************************************************
misscol_Istrat
	s_start_strat
	s_set_objtobealvar	y,x,al_collobjptr
	
	A16
	LDA.W	AL_SHAPE,Y
	CMP	AL_SHAPE,X
	A8
	RLBEQ	nomcol
	 
	s_docoll		x,#framesperAP

	s_jmp_altype		y,MISSILE,.dohitf
	s_KILL_OBJ		x
	s_end_strat
.dohitf
	s_set_alsflag		x,hitflash
	s_set_collstrat		x,mchitflash_strat
	s_jmpto_strat		

mchitflash_strat
	s_start_strat
	s_docoll		x,#framesperAP
	s_clr_alsflag		x,hitflash
	s_clr_alsflag		x,collide
	s_set_collstrat		x,misscol_Istrat
nomcol	s_jmpto_strat		







;*****************************************************************************
hover_Istrat
	s_start_strat
	s_add_playerz	x
	s_add_alvar	B,x,al_roty,#4
	s_end_strat

	
;*****************************************************************************
move_strat
	s_start_strat
	s_add_vecs2pos		x
	s_damagesmoke		x,#walkerHP-1,3,#0,#-100,#0,0
	s_end_strat





;*****************************************************************************
faceplayer_strat	
	s_start_strat

	s_set_objtobeplayer	y
	s_obj2obj_angle		x,y,al_roty,2

	s_end_strat



;-----------------------------------------------------------------------------
;puff_strat
;	s_start_strat
;
;	s_rots_flat	x
;	
;	s_set_vecs	x,#1,#-3,0
;	
;	s_add_vecs2pos	x
;	
;	s_dec_lifecnt	x
;	
;	s_end_strat	


;-----------------------------------------------------------------------------


;-----------------------------------------------------------------------------
null_strat
	s_start_strat
	s_end_strat	




;*****************************************************************************
fadetonorm_l	
	a8
	stz		circleanim
	stz		circleanim+1
	jsl		fadewhite2norm_l
	rtl


;*****************************************************************************
chkstagedone
	php
	a8
	s_test_var		B,gameflags,#gf_stagedone
	bne			stagedone
	plp
	clc
	rtl

stagedone
	s_and_var		B,gameflags,#~gf_stagedone
;	s_and_var	B,pshipflags3,#~ktest
;	s_and_var	B,pshipflags3,#~ktest2
;	s_and_var	B,pshipflags3,#~ktest3
;	s_and_var	B,pstratflags,#~ktest4	
;	s_and_var	B,pstratflags,#~ktest5		
	plp
	sec
	rtl

chkstratdone1
	php
	a8
	s_test_var		B,gameflags,#gf_stratdone1
	bne			stratdone1
	plp
	clc
	rtl
stratdone1
	s_and_var		B,gameflags,#~gf_stratdone1
	plp
	sec
	rtl
	
shipdifferent
	php
	a8
	lda	curr_ship
	cmp #0
	bne	.yesitchanged
	plp
	sec
	rtl
.yesitchanged
	plp
	clc
	rtl

chkeasteregg1
	php
	a8
	lda	levelfeatures
	and	#1
	bne	.knock
	plp
	sec
	rtl
.knock
	plp
	clc
	rtl

chkeasteregg2
	php
	a8
	lda	endurance
	bne	.knock2
	plp
	sec
	rtl
.knock2
	plp
	clc
	rtl

scrambleskip
	php
	a8
	lda	skipscramble
	and	#1
	bne	.knock2
	plp
	sec
	rtl
.knock2
	plp
	clc
	rtl	

checkfirstperson
	php								;Push processor Status (?)			;---;			|
	phb								;Push data bank register (?)		;---;			|
	a8i16							;8 bit accumulator, 16 bit index	;---;			|
																		;---;
	lda	#$7e						;Load $7E bank						;---;	
	plb								;Pull data bank register			;---;
	a8
	s_jmpNOT_varAND	B,superspeeddelay,#ktest,.nin
	stz	superspeeddelay
	jsl	changeviewmode_l
.nin
	plb
	rtl
playertwocheck
	php
	a8
	lda	playertwoactivated
	and	#1
	beq	.knock2
	plp
	sec
	rtl
.knock2
	plp
	clc
	rtl		


assaultcheck
	php
	a8
	lda	playertwocpuactivated
	and	#3
	cmp	#3
	bne	.knock2
	plp
	sec
	rtl
.knock2
	plp
	clc
	rtl		

chkfastend
	php
	a8
	lda	fastend
	cmp	#1
	beq	.knock2
	plp
	sec
	rtl
.knock2
	plp
	clc
	rtl
	
chkstratdone2
	php
	a8
	s_test_var		B,gameflags,#gf_stratdone2
	bne			stratdone2
	plp
	clc
	rtl
stratdone2
;	s_and_var		B,gameflags,#~gf_stratdone2
	plp
	sec
	rtl
	
chkbossdead
	php
	a8
	s_test_var		B,gameflags,#gf_bossdead
	bne			bossdead
	plp
	clc
	rtl
bossdead	
	s_and_var		B,gameflags,#~gf_bossdead
;	s_and_var	B,pshipflags3,#~ktest
;	s_and_var	B,pshipflags3,#~ktest2
;	s_and_var	B,pshipflags3,#~ktest3
;	s_and_var	B,pstratflags,#~ktest4	
;	s_and_var	B,pstratflags,#~ktest5	
	s_set_bossmaxHP		#0
	plp
	sec
	rtl


chkobjsinmap
	php
	a16
	lda	mapvar1
	jsl	find_shape_l
	cpx	#0
	beq	.no
	plp
	sec	
	rtl		; yes

.no	plp
	clc
	rtl		; no


playerstraight_strat
	s_start_strat
	stz			arrows
	s_set_var		B,viewtype,#viewtype_norm
	s_set_var		W,plrotx,#0
	s_set_var		W,plroty,#0
	s_set_var		W,plrotz,#0
;	s_achase_var	W,outvx,#0,3
;	s_achase_var	W,outvy,#0,3
	s_set_var		W,outvz,#0
	s_set_alvar		B,x,al_rotx,#0
	s_set_alvar		B,x,al_roty,#0
	s_set_alvar		B,x,al_rotz,#0
	s_set_var		B,viewshakeX,#0
	s_set_var		B,viewshakeY,#0
	s_set_var		B,viewshakeZ,#0
	s_set_var		W,viewfloatX,#0
	s_set_var		W,viewfloatY,#0
	s_set_var		W,pviewposZoff,#0

	s_set_var	W,pviewvelz,#medpspeed
	s_set_speed		x,#medpspeed

	s_gen_3dvecs		x,al_roty,al_rotx,al_speed
	s_add_vecs2pos		x

	s_set_alvar	W,x,al_worldx,#0
	s_set_alvar	W,x,al_worldy,viewcy
	s_set_var	W,pviewposx,#0
	s_set_var	W,pviewposy,viewcy
          	s_add_var	W,pviewposz,pviewvelz
	s_end_strat
;*****************************************************************************
	shorta
makeSsplash_srou_l
	lda	stopcounting
	cmp	#9
	bne	.noskip
	s_rtl
.noskip
	s_make_obj		#Ssplash,splbadobj
	s_brl			domakespl
makesplash_srou_l
	lda	stopcounting
	cmp	#9
	bne	.noskip
	s_rtl
.noskip
	s_make_obj		#splash,splbadobj
domakespl	
	s_clr_alsflag		y,realobj
	s_rots_flat		y
	s_copy_pos		y,x
	s_set_strat		y,splash_Istrat
	s_add_alvar		W,y,al_worldz,#-5
;	phx
;	ldx	al_shape,y
;	lda.l	sh_ymax,x
;	lsr	a
;	lsr	a
;	a16
;	sexa
;	clc
;	sta.w	al_worldy,y
;	a8
;	plx
	s_sprite_obj		y,#0
splbadobj
	s_rtl

splash_Istrat
	s_start_strat
	s_set_alsflag		x,colldisable
	s_init_colanim		x,#0
	s_set_strat		x,splash_strat            
	s_add_playerZ		x
	s_end_strat
splash_strat
	s_start_strat
	s_add_playerZ		x
	s_add_colanim		x,#1,#7,.die
	s_end_strat
.die
	s_remove_obj		x
	s_end_strat



;*****************************************************************************
childremove_Istrat
	s_start_strat
	s_set_objtobemother	y,x
	s_remove_child		x,y
	s_remove_obj		x
	s_end_strat




kill_istrat
kill_strat
	s_start_strat
	s_kill_obj		x
	s_end_strat

remove_istrat
remove_strat
	s_start_strat
	s_remove_obj		x
	s_end_strat


delayremoverel_Istrat	
	s_start_strat
	s_set_alsflag		x,relexplode
	s_brl			delayrem_Icont
delayremove_Istrat	
	s_start_strat
	s_clr_alsflag		x,relexplode
delayrem_Icont
	s_hardvars		x
	s_set_alptrs		x,delayremove_strat,0,0
	s_set_alsflag		x,colldisable
delayremove_strat
	s_start_strat
	s_dec_lifecnt		x
	s_jmpNOT_alsflag	x,relexplode,.nrel
	s_add_playerZ		x
.nrel	s_end_strat




;*****************************************************************************
rotsflatstay_Istrat
	s_start_strat
	s_rots_flat	x
	s_set_alsflag	x,colldisable
	s_set_alptrs	x,0,0,0
	s_end_strat

sparky_Istrat
	s_start_strat
	s_set_alvar  	B,x,al_sbyte1,#2
	s_set_alvar	W,x,al_shape,#pexplod
	s_set_alsflag	x,colldisable
	s_set_strat	x,sparky_strat
	s_set_EXPstrat	x,sparky_strat
	s_set_COLLstrat	x,sparky_strat
	s_rots_flat	x
	s_end_strat
sparky_strat
	s_start_strat
	s_decbne_alvar	B,x,al_sbyte1,endsparky_strat
	s_remove_obj	x
endsparky_strat
	s_end_strat


;*****************************************************************************
;*****************************************************************************
fire_Istrat	s_start_strat
	s_set_alvar	B,x,al_sbyte2,#9
	s_set_strat		x,fire_strat
	s_end_strat

fire_strat	s_start_strat
	s_rots_flat	x

	s_decbne_alvar		B,x,al_sbyte2,.nfs
	s_copy_alvar2alvar	B,x,al_sbyte2,x,al_sbyte1
.makesmoke
	s_jsl		makesmoke_srou_l
	s_bra		.end
.nfs
	s_cmp_alvar	B,x,al_sbyte2,#8
	s_beq		.makesmoke
	s_cmp_alvar	B,x,al_sbyte2,#16
	s_beq		.makesmoke
.end
	s_end_strat


;-----------------------------------------------------------------------------
makefire_srou_l
	s_make_obj		#fire,.nfobj
	s_copy_var2alvar	B,y,al_sbyte1,smvar_byte1
	s_set_strat		y,fire_Istrat
	s_clr_alsflag		y,realobj
	s_set_alsflag		y,colldisable
	s_rots_flat		y
	s_copy_pos		y,x
	s_set_altype		y,zremove
	A16
	TYA
	STA.L			ALX_FIREOBJPTR,X
	A8
	s_set_alflag		x,onfire
.nfobj	s_rtl
;-----------------------------------------------------------------------------
makesmoke_srou_l
	ldy	#0
	s_make_obj	#smoke,.end
	s_clr_alsflag		y,realobj
	s_rots_flat	y
	s_copy_pos	y,x
	s_set_strat	y,smokeP_Istrat
	s_set_altype	y,zremove
	s_set_alsflag	y,colldisable
.end	s_rtl


;-----------------------------------------------------------------------------
puff_Istrat
	s_start_strat
	s_set_alptrs	x,puff_strat,0,0
	s_set_alsflag	x,colldisable
	s_init_colanim	x,#0
	s_sprite_obj	x,#0
puff_strat
	s_start_strat
	s_rots_flat	x
	s_add_colanim	x,#1,#9
	s_cmp_colanim	x,#8
	s_bne		.nrem
	s_remove_obj	x
.nrem
	s_add_playerZ	x
	s_end_strat

;-----------------------------------------------------------------------------
smokeP_istrat
	s_start_strat
	s_sprite_obj	x,#0
	s_set_alptrs	x,smokeP_strat,0,0
	s_set_alvar	B,x,al_sbyte1,#20
	s_set_alvar	W,x,al_sword1,#6
	s_init_colanim	x,#0
smokeP_strat
	s_start_strat
	s_rots_flat	x
;	s_jmp_notdelay	1,.noanim
	s_add_colanim	x,#1,#8
	s_cmp_colanim	x,#0
	s_beq		.kill
.noanim	s_sub_alvar	W,x,al_worldx,#1
	s_sub_alvars	W,x,al_worldy,x,al_sword1
	s_decbne_alvar	B,x,al_sbyte1,.end
	s_set_alvar	B,x,al_sbyte1,#20
	s_dec_alvar	W,x,al_sword1
;	s_cmp_alvar	W,x,al_sword1,#0
	s_bne		.end
.kill
	s_remove_obj	x
.end
	s_add_vecs2pos	x
	s_end_strat



;*****************************************************************************
missboundchkrem
missboundchkexp
	lda			missboundflags
	bit			#mb_right
	beq			.nml
	s_jmp_alvarmore		W,x,al_worldx,maxMmoveX,.killobj
.nml
	lda			missboundflags
	bit			#mb_left
	beq			.nmr
	s_jmp_alvarless		W,x,al_worldx,minMmoveX,.killobj
.nmr
	lda			missboundflags
	bit			#mb_top!mb_Rtop!mb_Ltop
	beq			.nmt
	s_jmp_alvarmore		W,x,al_worldy,minPmoveY,.nmt

	lda			missboundflags
	bit			#mb_Rtop
	beq			.nrt
	s_set_objtobeplayer	y
	s_jmp_alvarmore.w	W,y,al_worldx,missbTOPRIGHT,.nmt
.nrt
	lda			missboundflags
	bit			#mb_Ltop
	beq			.killobj
	s_set_objtobeplayer	y
	s_jmp_alvarmore.w	W,y,al_worldx,missbTOPLEFT,.killobj
.nmt
	lda			missboundflags
	bit			#mb_bottom!mb_Lbottom
	beq			.nmb
	s_jmp_alvarless		W,x,al_worldy,maxMmoveY,.nmb
	lda			missboundflags
	bit			#mb_Lbottom
	beq			.killobj
	s_set_objtobeplayer	y
	s_jmp_alvarmore.w	W,y,al_worldx,missbBOTLEFT,.killobj

.nmb
	s_end_strat
.killobj
	s_kill_obj	x	
	s_end_strat

.remobj	s_remove_obj	x
	s_end_strat



;*****************************************************************************
miss_end
	s_jmp_varAND		B,gameflags,#gf_bossdead,kill_Istrat
	s_jmp_varAND		B,bossflags,#bf_dying,kill_Istrat
	s_jmp_NOTalsflag	x,sflag1,missboundchkexp
	s_end_strat

;*****************************************************************************
laser_Istrat	  			; relative to player speed.
	s_start_strat
	s_set_strat		x,laser_strat
	s_copy_alvar2alvar	B,x,al_rotx,x,al_sbyte1
	s_copy_alvar2alvar	B,x,al_roty,x,al_sbyte2
	s_gen_3dvecs		x,al_roty,al_rotx,al_speed
	s_addgen_3dvecs		x,al_roty,al_rotx,al_sbyte3
laser_strat
	s_start_strat
	s_add_playerZ		x
	s_add_vecs2pos		x
	s_decbne_lifecnt	x,.lnd
	s_remove_obj		x
	s_end_strat
.lnd
	s_add_alvar		B,x,al_rotz,#20
	s_brl			miss_end

;*****************************************************************************
makeengine_srou_l
	s_make_obj	#boostshape,.bad

	phx
	phy
	a16
	ldy		al_shape,x
	tyx
	lda.l		sh_Zmax,x
	nega
	sta		svar_word2
	lda.l		sh_Ymax,x
	sec
	sbc		#24
	sta		svar_word1
	ply
	plx
	a8
	
	s_sprite_obj		y,#0,svar_word1
	s_set_alvar		B,y,al_relposz,svar_word2

	A16
	TYA	
	STA.L			ALX_FIREOBJPTR,X
	A8

	s_set_alsflag		y,colldisable
	jsl			updateengine_srou_l
	s_set_alsflag		y,invisible
	s_set_alflag		x,onfire
	
.bad	rtl

;*****************************************************************************
updateengine_srou_l
	s_set_objtobealvar	y,x,al_fireobjptr
	s_jmp_objptrbad		y,.bad
	s_clr_alsflag		y,invisible
	s_copy_alvar2var	B,y,svar_byte1,al_relposZ
	s_add_Roffs2pos		B,y,x,x,#0,#0,svar_byte1,1,1,0
.bad	rtl


;*****************************************************************************
hmissile1_Istrat 			; relative to player speed.
	s_start_strat
	s_set_strat		x,hmissile1_strat
	set_sound2		x,#2
	s_set_alsflag		x,shadow
;	s_set_colltype		x,Zenemy
	s_set_colltype		x,enemyweap
;	s_set_alvar		B,x,al_sbyte1,#10
	s_gen_3dvecs		x,al_roty,al_rotx,al_speed
	s_addgen_3dvecs		x,al_roty,al_rotx,al_sbyte3
	jsl			makeengine_srou_l
	s_end_strat
hmissile1_strat			
	s_start_strat

	s_jmpNOT_alsflag	x,sflag3,.nanim
	s_cmp_anim		x,#15
	s_beq			.nanim
	s_add_anim		x,#1,#16
.nanim



	s_add_alvar		B,x,al_rotz,#10

;	s_decbne_alvar		B,x,al_sbyte1,.cont
;	s_set_alvar		B,x,al_sbyte1,#1


	s_set_objtobealvar	y,x,al_ptr
	s_jmp_alsflag		x,sflag2,.cont

	s_jmp_distless		x,y,#300,.nac
	
	s_chk_objptr		y,.nhs
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,3
.nhs
	s_gen_3dvecs		x,al_roty,al_rotx,al_speed
	s_addgen_3dvecs		x,al_roty,al_rotx,al_sbyte3
	s_bra			.cont
.nac				      	
	s_set_alsflag		x,sflag2
.cont
	s_add_playerZ		x
	s_add_vecs2pos		x
	s_dec_lifecnt		x
	jsl			updateengine_srou_l
	s_remove_offscn		x
	s_brl			miss_end



;*****************************************************************************
hmissile2_Istrat 			; move straight for short time then quick turn relative to player speed.
	s_start_strat
	s_set_strat		x,hmissile2_strat
	set_sound2		x,#2
	s_set_alsflag		x,shadow
	s_set_colltype		x,Zenemy
	s_set_alvar		B,x,al_sbyte1,#25
	s_gen_3dvecs		x,al_roty,al_rotx,al_speed
	s_addgen_3dvecs		x,al_roty,al_rotx,al_sbyte3
	jsl			makeengine_srou_l

	s_end_strat
hmissile2_strat			
	s_start_strat

	s_add_alvar		B,x,al_rotz,#10

	s_decbne_alvar		B,x,al_sbyte1,.cont
	s_set_alvar		B,x,al_sbyte1,#1

	s_set_objtobealvar	y,x,al_ptr
	s_jmp_alsflag		x,sflag2,.cont

	s_jmp_distless		x,y,#300,.nac
	
	s_chk_objptr		y,.nhs
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,1
.nhs
	s_gen_3dvecs		x,al_roty,al_rotx,al_speed
	s_addgen_3dvecs		x,al_roty,al_rotx,al_sbyte3
	s_bra			.cont
.nac				      	
	s_set_alsflag		x,sflag2
.cont
	s_add_playerZ		x
	s_add_vecs2pos		x
	s_dec_lifecnt		x
	jsl			updateengine_srou_l
	s_remove_offscn		x
	s_brl			miss_end


vortex2_Istrat 			; move straight for short time then quick turn relative to player speed.
	s_start_strat
	s_set_strat		x,vortex2_strat
	set_sound2		x,#2
	s_set_alsflag		x,shadow
	s_set_colltype		x,Zenemy
	s_set_alvar		B,x,al_sbyte1,#25
	s_gen_3dvecs		x,al_roty,al_rotx,al_speed
	s_addgen_3dvecs		x,al_roty,al_rotx,al_sbyte3
	jsl			makeengine_srou_l

	s_end_strat
vortex2_strat			
	s_start_strat

	s_add_alvar		B,x,al_rotz,#10

	s_decbne_alvar		B,x,al_sbyte1,.cont
	s_set_alvar		B,x,al_sbyte1,#1

	s_set_objtobealvar	y,x,al_ptr
	s_jmp_alsflag		x,sflag2,.cont

	s_jmp_distless		x,y,#300,.nac
	
	s_chk_objptr		y,.nhs
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,1
.nhs
	s_gen_3dvecs		x,al_roty,al_rotx,al_speed
	s_addgen_3dvecs		x,al_roty,al_rotx,al_sbyte3
	s_bra			.cont
.nac				      	
	s_set_alsflag		x,sflag2
.cont
	s_add_playerZ		x
	s_add_vecs2pos		x
	s_dec_lifecnt		x
	s_achase_alvar	W,x,al_worldx,player_posx,3
	s_achase_alvar	W,x,al_worldy,player_posy,3
	jsl			updateengine_srou_l
	s_remove_offscn		x
	s_brl			miss_end



;*****************************************************************************
hmissile3_Istrat 			; kamikaze Zaco9 shoot elaser hmissile.
	s_start_strat
	s_set_strat		x,hmissile3_strat
	set_sound2		x,#2
	s_set_alsflag		x,shadow
	s_set_colltype		x,Zenemy
	s_gen_3dvecs		x,al_roty,al_rotx,al_speed
	s_addgen_3dvecs		x,al_roty,al_rotx,al_sbyte3
	jsl			makeengine_srou_l
	s_end_strat
hmissile3_strat
	s_start_strat

	s_set_objtobealvar	y,x,al_ptr

	s_jmp_alsflag		x,sflag2,.cont

	s_jmp_outZdistrng	x,y,#1000,#2000,.nfire
	s_jmp_notdelay		3,.nfire
	phy
	s_weapon_pos		#(-10<<1>weapon_scale,#(15<<1)>>weapon_scale,#0
	s_weapon_rot		#0,#deg5
	s_fire_weapon		x,RELSLOWELASER
	s_weapon_pos		#(10<<1>weapon_scale,#(15<<1)>>weapon_scale,#0
	s_weapon_rot		#0,#-deg5
	s_fire_weapon		x,RELSLOWELASER
	ply
.nfire


	s_jmp_Zdistless		x,y,#500,.nac
	s_jmp_outZdistrng	x,y,#500,#2000,.cont
	
	s_chk_objptr		y,.nhs
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,0
.nhs
	s_gen_3dvecs		x,al_roty,al_rotx,al_speed
	s_addgen_3dvecs		x,al_roty,al_rotx,al_sbyte3
	s_bra			.cont
.nac				      	
	s_set_alsflag		x,sflag2
.cont
	s_add_playerZ		x
	s_add_vecs2pos		x
	jsl			updateengine_srou_l
	s_dec_lifecnt		x
	s_remove_offscn		x
	s_brl			miss_end


;*****************************************************************************
chickhmissile1_Istrat 			; relative to player speed.
	s_start_strat
	s_set_strat		x,chickhmissile1_strat
	set_sound2		x,#2
	s_set_alsflag		x,shadow
	s_set_colltype		x,Zenemy
	s_set_alvar		B,x,al_rotz,#deg180
	s_end_strat
chickhmissile1_strat
	s_start_strat


;	s_add_alvar		B,x,al_rotz,#20

;	s_set_objtobealvar	y,x,al_ptr
	s_set_objtobeplayer	y 
	
	s_achase_alvar		W,x,al_worldx,player_posx,3
	s_achase_alvar		W,x,al_worldy,player_posy,3

	s_jmp_alsflag		x,sflag2,.near
	s_jmp_distmore		x,y,#400,.far
	s_jmp_anyJkeydown	.far
	s_set_alsflag		x,sflag2
.near				       
	s_set_alsflag		x,colldisable
	s_dec_lifecnt		x

	s_jmp_lower		y,viewcy,.up
	s_add_alvar		B,x,al_rotx,#2
	s_brl			.nhs
.up
	s_sub_alvar		B,x,al_rotx,#2
	s_brl			.nhs

.far
	s_chk_objptr		y,.nhs
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,0
.nhs
	s_gen_3dvecs		x,al_roty,al_rotx,al_speed
;	s_addgen_3dvecs		x,al_roty,al_rotx,al_sbyte3

.cont
	s_add_playerZ		x
	s_add_vecs2pos		x
	s_remove_offscn		x
	s_brl			miss_end


;*****************************************************************************
STBhmissile1_Istrat 			; relative to player speed.
				; set al_sbyte1,2 to init. vector angles.
				; set al_roty,rotx to init. obj rotation angles.
				; al_roty,rotx chase to sbyte1,2.
	s_start_strat
	s_set_strat		x,STBhmissile1_strat
	set_sound2		x,#2
	s_set_alsflag		x,shadow
	s_set_colltype		x,Zenemy
	s_set_speed		x,#10
	s_set_alvar		B,x,al_sbyte3,#20
	jsl			makeengine_srou_l
STBhmissile1_strat
	s_start_strat

	s_speedto		x,#60,2
	s_jmp_alvarNE		B,x,al_speed,#60,.nzr
.nzr	s_add_alvar		B,x,al_rotz,#10


	s_set_objtobealvar	y,x,al_ptr

;	s_jmp_XYdistmore	x,y,#500,remove_Istrat

	s_jmp_alsflag		x,sflag2,.cont

	s_jmp_distless		x,y,#600,.nac
	
	s_chk_objptr		y,.nhs
	s_decbne_alvar		B,x,al_sbyte3,.nhs
	s_set_alvar		B,x,al_sbyte3,#1
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,4
.nhs
	s_achase_alvar2alvar	B,x,al_sbyte1,x,al_roty,3
	s_achase_alvar2alvar	B,x,al_sbyte2,x,al_rotx,3

	s_gen_3dvecs		x,al_sbyte1,al_sbyte2,al_speed
	s_bra			.cont
.nac				      	
	s_set_alsflag		x,sflag2
.cont

	s_add_playerZ		x
	s_add_vecs2pos		x
	s_dec_lifecnt		x
	jsl			updateengine_srou_l
	s_remove_offscn		x
	s_brl			miss_end



;*****************************************************************************
Qhmissile1_Istrat 			; relative to player speed.
	s_start_strat
	s_set_strat		x,Qhmissile1_strat
	set_sound2		x,#2
	s_set_alsflag		x,shadow
	jsl			makeengine_srou_l
Qhmissile1_strat
	s_start_strat

	s_add_alvar		B,x,al_rotz,#10

	s_set_objtobealvar	y,x,al_ptr

	s_chk_objptr		y,.nhs
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,0
.nhs
	s_gen_3dvecs		x,al_roty,al_rotx,al_speed

	s_add_playerZ		x
	s_add_vecs2pos		x
	s_dec_lifecnt		x
	jsl			updateengine_srou_l
	s_remove_offscn		x
	s_brl			miss_end

	
Qlaser_Istrat 			; relative to player speed.
	s_start_strat
	s_set_strat		x,Qlaser_strat
	set_sound2		x,#2
	s_set_alsflag		x,shadow
	jsl			makeengine_srou_l
Qlaser_strat
	s_start_strat

	s_add_alvar		B,x,al_rotz,#10

	s_set_objtobealvar	y,x,al_ptr

	s_chk_objptr		y,.nhs2
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,3
.nhs2
	s_gen_3dvecs		x,al_roty,al_rotx,al_speed

	s_add_playerZ		x
	s_add_vecs2pos		x
	s_dec_lifecnt		x
	jsl			updateengine_srou_l
	s_remove_offscn		x
	s_brl			miss_end
;*****************************************************************************
homingflat_Istrat 			; relative to player speed.
				; keep init. angle but home to object.

	s_start_strat
	s_set_strat		x,homingflat_strat
	s_copy_alvar2alvar	B,x,al_sbyte1,x,al_roty
	s_copy_alvar2alvar	B,x,al_sbyte2,x,al_rotx
	s_set_alvar		B,x,al_rotx,#0
	s_set_alvar		B,x,al_roty,#deg180
	set_sound2		x,#6
homingflat_strat
	s_start_strat

	s_remove_offscn		x
	
	s_rots_flat		x

	s_set_objtobealvar	y,x,al_ptr
	s_chk_objptr		y,.nhs
	s_jmp_Zdistless		x,y,#500,.nhs
	s_obj2obj_3dangle	x,y,al_sbyte1,al_sbyte2,4
.nhs
	s_gen_3dvecs		x,al_sbyte1,al_sbyte2,al_speed
	s_addgen_3dvecs		x,al_sbyte1,al_sbyte2,al_sbyte3
	s_add_playerZ		x
	s_add_vecs2pos		x
	s_dec_lifecnt		x
	s_brl			miss_end
;*****************************************************************************
Yhoming_Istrat 			; Y rotation only relative to player speed.
	s_start_strat
	s_set_strat		x,Yhoming_strat
	set_sound2		x,#6

	s_set_var2rnd		svar_byte1,#7
	s_init_anim		x,svar_byte1
Yhoming_strat
	s_start_strat

	s_add_anim		x,#1,#8
	
	s_set_objtobealvar	y,x,al_ptr
	s_obj2obj_angle		x,y,al_roty,0
.nhs
	s_gen_3dvecs		x,al_roty,al_rotx,al_speed
	s_add_playerZ		x
	s_add_vecs2pos		x
	s_dec_lifecnt		x
	s_brl			miss_end
;*****************************************************************************
relflatmiss_Istrat 			; relative to player speed.
	s_start_strat
	s_set_strat		x,relflatmiss_strat
	s_copy_alvar2alvar	B,x,al_sbyte1,x,al_roty
	s_copy_alvar2alvar	B,x,al_sbyte2,x,al_rotx
	s_gen_3dvecs		x,al_sbyte1,al_sbyte2,al_speed
	set_sound2		x,#6
relflatmiss_strat
	s_start_strat
;	s_rots_flat		x
	s_add_playerZ		x
	s_add_vecs2pos		x
	s_dec_lifecnt		x,1
;	s_remove_offscn		x
	s_brl			miss_end

;*****************************************************************************
flatmiss_Istrat 			
	s_start_strat
	s_set_strat		x,flatmiss_strat
	s_copy_alvar2alvar	B,x,al_sbyte1,x,al_roty
	s_copy_alvar2alvar	B,x,al_sbyte2,x,al_rotx
	s_gen_3dvecs		x,al_sbyte1,al_sbyte2,al_speed
	set_sound2		x,#6
flatmiss_strat
	s_start_strat
	s_rots_flat		x
	s_add_vecs2pos		x
	s_dec_lifecnt		x,1
;	s_remove_offscn		x
	s_brl			miss_end



;*****************************************************************************
missile1_Istrat 			; relative to player speed.
	s_start_strat
	s_set_strat		x,missile1_strat
	set_sound2		x,#2
	s_set_colltype		x,enemyweap
	s_set_alsflag		x,shadow
	jsl			makeengine_srou_l
missile1_strat
	s_start_strat
	s_dec_lifecnt		x
	s_add_alvar		B,x,al_rotz,#10

	s_jmp_alsflag		x,sflag1,.strm
	s_Achase_alvar2alvar	B,x,al_roty,x,al_sbyte2,2
	s_Achase_alvar2alvar	B,x,al_rotx,x,al_sbyte1,2
	s_gen_3dvecs		x,al_roty,al_rotx,al_speed
	s_addgen_3dvecs		x,al_roty,al_rotx,al_sbyte3
.strm
	s_add_playerZ		x
	s_add_vecs2pos		x
	jsl			updateengine_srou_l
	s_brl			miss_end



;*****************************************************************************
missile2_Istrat
	s_start_strat
	s_copy_alvar2alvar	B,x,al_rotx,x,al_sbyte1
	s_copy_alvar2alvar	B,x,al_roty,x,al_sbyte2
	s_set_strat		x,missile2a_strat
	s_setremove_behind	x
	set_sound2		x,#2
	s_set_alsflag		x,shadow
	s_set_colltype		x,enemyweap
	jsl			makeengine_srou_l
	s_end_strat

missile2a_strat
	s_start_strat

	s_jmp_alsflag		x,sflag2,.nspi
	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#600,.nspi
	s_speedto		x,#100,5
.nspi

	
	s_gen_3dvecs		x,al_roty,al_rotx,al_speed
	s_add_playerz		x
	s_add_vecs2pos		x

	s_dec_lifecnt		x
	s_achase_2alvars	B,x,al_rotx,#0,2,al_roty,#deg180,2
	s_add_alvar		B,x,al_rotz,#10

	jsl			updateengine_srou_l
	s_brl			miss_end


;*****************************************************************************
relelaser_Istrat 			; relative to player speed.
	s_start_strat
	s_set_strat		x,relelaser_strat
	s_copy_alvar2alvar	B,x,al_rotx,x,al_sbyte1
	s_copy_alvar2alvar	B,x,al_roty,x,al_sbyte2

	s_gen_3dvecs		x,al_roty,al_rotx,al_speed,1   ; laser spd.
	s_addgen_3dvecs		x,al_roty,al_rotx,al_sbyte3  ; mother obj speed

	s_init_anim		x,#0
	s_end_strat
relelaser_strat
	s_start_strat

	s_cmp_anim		x,#4
	s_beq			.nai
	s_add_anim		x,#2,#8
.nai
	s_add_playerZ		x
	s_add_vecs2pos		x

	s_decbne_lifecnt	x,.lnd
	s_remove_obj		x
	s_end_strat
.lnd
	s_brl			miss_end

;*****************************************************************************
relelaserhome_Istrat 			; relative to player speed.
	s_start_strat
	s_set_strat		x,relelaserhome_strat
	s_copy_alvar2alvar	B,x,al_rotx,x,al_sbyte1
	s_copy_alvar2alvar	B,x,al_roty,x,al_sbyte2

	s_gen_3dvecs		x,al_roty,al_rotx,al_speed,1   ; laser spd.

	s_init_anim		x,#0
	s_end_strat
relelaserhome_strat
	s_start_strat

	s_cmp_anim		x,#4
	s_beq			.nai
	s_add_anim		x,#2,#8
.nai
	s_jmp_alsflag		x,sflag2,.nhs
	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#800,.nmin
	s_set_alsflag		x,sflag2
.nmin
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,1
	s_gen_3dvecs		x,al_roty,al_rotx,al_speed,1   ; laser speed
.nhs

	s_add_playerZ		x
	s_add_vecs2pos		x

	s_decbne_lifecnt	x,.lnd
	s_remove_obj		x
	s_end_strat
.lnd
	s_brl			miss_end


;*****************************************************************************
vortex1_Istrat 			; relative to player speed.
	s_start_strat
	s_set_strat		x,vortex1_strat
	s_copy_alvar2alvar	B,x,al_rotx,x,al_sbyte1
	s_copy_alvar2alvar	B,x,al_roty,x,al_sbyte2

;	s_gen_3dvecs		x,al_roty,al_rotx,al_speed,1   ; laser spd.
	s_gen_3dvecs		x,al_roty,al_rotx,al_speed

	s_init_anim		x,#0
	s_end_strat
vortex1_strat
	s_start_strat

	s_cmp_anim		x,#4
	s_beq			.nai
	s_add_anim		x,#2,#8
.nai
	s_jmp_alsflag		x,sflag2,.nhs
	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#100,.nmin
	s_set_alsflag		x,sflag2
.nmin
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,1
;	s_gen_3dvecs		x,al_roty,al_rotx,al_speed,1   ; laser speed
	s_gen_3dvecs		x,al_roty,al_rotx,al_speed
.nhs

	s_add_playerZ		x
	s_add_vecs2pos		x

	s_achase_alvar	W,x,al_worldx,player_posx,3
	s_achase_alvar	W,x,al_worldy,player_posy,3
	
	s_decbne_lifecnt	x,.lnd
	s_remove_obj		x
	s_end_strat
.lnd
	s_brl			miss_end


;*****************************************************************************
skullshot_Istrat 			; relative to player speed.
	s_start_strat
	s_set_strat		x,skullshot_strat
	s_copy_alvar2alvar	B,x,al_rotx,x,al_sbyte1
	s_copy_alvar2alvar	B,x,al_roty,x,al_sbyte2

;	s_gen_3dvecs		x,al_roty,al_rotx,al_speed,1   ; laser spd.
	s_gen_3dvecs		x,al_roty,al_rotx,al_speed

	s_init_anim		x,#0
	s_end_strat
skullshot_strat
	s_start_strat

	s_cmp_anim		x,#4
	s_beq			.nai
	s_add_anim		x,#2,#8
.nai
	s_jmp_alsflag		x,sflag2,.nhs
	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#100,.nmin
	s_set_alsflag		x,sflag2
.nmin
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,1
;	s_gen_3dvecs		x,al_roty,al_rotx,al_speed,1   ; laser speed
	s_gen_3dvecs		x,al_roty,al_rotx,al_speed
.nhs

	s_add_playerZ		x
	s_add_vecs2pos		x

	s_achase_alvar	W,x,al_worldx,player_posx,4
	s_achase_alvar	W,x,al_worldy,player_posy,4
	
	s_decbne_lifecnt	x,.lnd
	s_remove_obj		x
	s_end_strat
.lnd
	s_brl			miss_end


;*****************************************************************************
multiorb_Istrat 			; relative to player speed.
	s_start_strat
	s_set_strat		x,multiorb_strat
	s_gen_3dvecs		x,al_roty,al_rotx,al_speed,1   ; laser spd.
	s_set_alvar		B,x,al_sbyte1,#0
	s_set_alvar		B,x,al_sbyte2,#0
	s_init_anim		x,#0
	s_end_strat
multiorb_strat
	s_start_strat

	s_cmp_anim		x,#4
	s_beq			.nai
	s_add_anim		x,#2,#8
.nai
	s_gen_3dvecs		x,al_roty,al_rotx,al_speed,1   ; laser speed
	s_add_playerZ		x
	s_add_vecs2pos		x

	s_jmp_alvarEQ	B,x,al_sbyte1,#1,.goleft				;if sbyte1 = 1, we are going left
.goright
	s_jmp_alvareq	B,x,al_sbyte2,#10,.starttogoleft			;how many times do we add right movements?
	s_sub_alvar		W,x,al_worldx,#10						;subtract 10 units to the right
	s_add_alvar		B,x,al_sbyte2,#1						;add 1 to the movement counter
	bra	.donemovement
.goleft	
	s_jmp_alvareq	B,x,al_sbyte2,#10,.starttogoright		;how many times do we add left movements?
	s_add_alvar		W,x,al_worldx,#10						;add 10 units to the left
	s_add_alvar		B,x,al_sbyte2,#1						;add 1 to the movement counter
	bra	.donemovement
.starttogoright
	s_set_alvar	B,x,al_sbyte2,#0							;set movement counter to 0
	s_set_alvar	B,x,al_sbyte1,#0							;set movement direction to right
	s_sub_alvar	W,x,al_worldx,#10							;subtract 10 units to the right
	s_add_alvar		B,x,al_sbyte2,#1						;add 1 to the counter
	bra	.donemovement
.starttogoleft
	s_set_alvar	B,x,al_sbyte2,#0							;set movement counter to 0
	s_set_alvar	B,x,al_sbyte1,#1							;set movement direction to left
	s_add_alvar	W,x,al_worldx,#10							;add 10 units to the left
	s_add_alvar		B,x,al_sbyte2,#1						;add 1 to the counter
.donemovement
	s_decbne_lifecnt	x,.lnd								;decrease lifecount every frame until its 0, then remove the object
	s_remove_obj		x
	s_end_strat
.lnd
	s_brl			miss_end



;*****************************************************************************
elaser_Istrat 			
	s_start_strat
	s_set_strat		x,elaser_strat
	s_copy_alvar2alvar	B,x,al_rotx,x,al_sbyte1
	s_copy_alvar2alvar	B,x,al_roty,x,al_sbyte2

	s_gen_3dvecs		x,al_roty,al_rotx,al_speed,1   ; laser spd.
;	s_addgen_3dvecs		x,al_roty,al_rotx,al_sbyte3  ; mother obj speed

	s_init_anim		x,#0
	s_end_strat
elaser_strat
	s_start_strat
 
	s_cmp_anim		x,#4
	s_beq			.nai
	s_add_anim		x,#2,#8
.nai
	s_add_vecs2pos		x

	s_decbne_lifecnt	x,.lnd
	s_remove_obj		x
	s_end_strat
.lnd
	s_brl			miss_end

;*****************************************************************************
elaser2die_Istrat
	s_start_strat

	s_set_alvar		W,x,al_ptr,#0
	s_make_obj		#lfdie,.badobj
	s_clr_alsflag		y,realobj
	s_set_alvartobeobj	x,al_ptr,y
	s_copy_pos		y,x
	s_set_strat		y,rotsflatstay_Istrat
	s_set_alsflag		y,colldisable
.badobj
	s_set_expstrat		x,elaser2die_strat

elaser2die_strat
	s_start_strat

 

	s_jmpNOT_alsflag	x,relexplode,.nrel
	s_jmp_varAND		B,gameflags,#gf_playerdying,.nrel
	s_add_playerZ		x
.nrel

	s_cmp_anim		x,#8
	s_beq			.eea
	s_add_anim		x,#2,#9
	s_end_strat
.eea
	s_set_objtobealvar	y,x,al_ptr
	s_chk_objptr		y,.nrs
	s_remove_obj		y
.nrs	
	s_remove_obj		x
	s_end_strat


;*****************************************************************************

Pbeam_Istrat 			
	s_start_strat
	s_set_strat		x,Pbeam_strat
	s_copy_alvar2alvar	B,x,al_rotx,x,al_sbyte1
	s_copy_alvar2alvar	B,x,al_roty,x,al_sbyte2

	s_gen_3dvecs		x,al_roty,al_rotx,al_speed,2   ; laser spd.
	s_addgen_3dvecs		x,al_roty,al_rotx,al_sbyte3  ; mother obj speed

	s_init_anim		x,#4
	s_jmp_varAND		B,pstratflags,#pstf_firstframeLcol,.ffr
	s_set_alsflag		x,colldisable
.ffr	s_end_strat

Pbeam_strat
	s_start_strat
	s_set_alvar		B,x,al_rotx,#0
	s_set_alvar		B,x,al_roty,#0
	s_add_alvar		B,x,al_rotz,#24
	s_brl			pelaser_strat
	

;*****************************************************************************
Pelaser_Istrat 			
	s_start_strat
	s_set_strat		x,Pelaser_strat
	s_copy_alvar2alvar	B,x,al_rotx,x,al_sbyte1
	s_copy_alvar2alvar	B,x,al_roty,x,al_sbyte2

	s_gen_3dvecs		x,al_roty,al_rotx,al_speed,2   ; laser spd.
	s_addgen_3dvecs		x,al_roty,al_rotx,al_sbyte3  ; mother obj speed
	s_init_anim		x,#4
	s_jmp_varAND		B,pstratflags,#pstf_firstframeLcol,.ffr
	s_set_alsflag		x,colldisable
.ffr	s_end_strat
Pelaser_strat
	s_start_strat

	s_remove_ifplayerdead	x
	s_clr_alsflag		x,colldisable
	
	s_add_vecs2pos		x

	s_decbne_lifecnt	x,.lnd
	s_remove_obj		x
;	dec			numplasers
	s_end_strat
.lnd
	s_brl			miss_end

pelaser2die_Istrat
	s_start_strat
	s_setnoremove_behind	x
;	dec			numplasers
	s_jmp			elaser2die_Istrat


playerbeamdie_Istrat
	s_start_strat
;	dec			numplasers
	s_set_expstrat		x,remove_Istrat
	s_end_strat



;*****************************************************************************
nuke_Istrat 			; relative to player speed.
	s_start_strat
	s_set_alptrs		x,nuke_strat,weapcollide_Istrat,nukeexp_Istrat
	s_gen_3dvecs		x,al_roty,al_rotx,al_speed,1   ; nuke spd.
	s_addgen_3dvecs		x,al_roty,al_rotx,al_sbyte3  ; mother obj speed

	s_set_alvar		B,x,al_rotx,#0
	s_set_alvar		B,x,al_roty,#deg180
	set_sound2		x,#6
	s_end_strat
nuke_strat
	s_start_strat
	s_remove_ifplayerdead	x
	s_jmp_varAND		B,pshipflags,#psf_nofire,removenuke_Istrat


	s_add_vecs2pos		x
	s_dec_lifecnt		x,1


	s_jmpNOT_varAND		B,playerflymode,#pfm_diefall,.notdead
	s_add_alvar		W,x,al_vy,#2
.notdead


	lda	godmode
	bne	.nexp
	s_jmp_keyup		a,.nexp
	s_jmp_lastkeydown	a,.nexp
	s_kill_obj		x
.nexp

	s_jmp_NOTalsflag	x,sflag1,missboundchkexp
	s_end_strat

	
	
nuke2_Istrat 			; relative to player speed.
	s_start_strat
	s_set_alptrs		x,nuke2_strat,weapcollide_Istrat,nukeexp2_Istrat
	s_gen_3dvecs		x,al_roty,al_rotx,al_speed,1   ; nuke spd.
	s_addgen_3dvecs		x,al_roty,al_rotx,al_sbyte3  ; mother obj speed

	s_set_alvar		B,x,al_rotx,#0
	s_set_alvar		B,x,al_roty,#deg180
	set_sound2		x,#6
	s_end_strat
nuke2_strat
	s_start_strat
	s_add_vecs2pos		x
	s_dec_lifecnt		x,1
	s_add_alvar		W,x,al_vy,#2
;	s_jmp_NOTalsflag	x,sflag1,missboundchkexp
	s_end_strat


removenuke_Istrat
	s_start_strat
;	s_inc_var	W,specwepcnt
	s_set_var	B,specialdelay,#1
	s_jmp		remove_Istrat


nukeexp_Istrat
	s_start_strat
	s_set_alvar		W,x,al_sword1,#nukeRATE
	s_set_expstrat		x,nukeexp_strat
	s_set_alvar		W,x,al_shape,#nullshape
	s_jsl			makeMEDexpobj_srou
	s_set_vartobeobj	circleobj,x
	big_circle_exp
	trigse			$30
	set_sound2		x,#0
	s_end_strat
nukeexp_strat
	s_start_strat

	a16
	lda	nogodgun
	beq	.skipgodturnoff
	stz	godnuke
.skipgodturnoff
	lda	godnuke
	cmp	#1
	beq	.donuke
	lda	al_sword1,x
	cmp	#nukeMAXRADIUS
	a8
	bmi	.donuke	
	s_remove_obj	x
	s_end_strat
.donuke
	s_add_playerZ		x


;	s_jmp_varAND	B,pshipflags2,#psf2_playerHP0,.nonuke

	s_set_find		0
	a16
	lda			al_sword1,x
	sta			svar_word2
	sec
	sbc			#nukeRATE
	sta			svar_word1
	a8
	
.here	
	lda	godnuke
	cmp	#1
	lbeq	.altfind	;god nuke alternate find code
	s_find_radiusobj	y,x,#0,svar_word1,svar_word2,.donefind

	s_cmp_alvar			W,y,al_shape,#nuke
	beq					.here
	s_cmp_alvar			W,y,al_shape,#peppy1
	beq					.here
	s_cmp_alvar			W,y,al_shape,#playertwo1
	beq					.here
	s_cmp_alvar			W,y,al_shape,#falco1
	beq					.here
	s_cmp_alvar			W,y,al_shape,#slippy1
	lbeq					.here

	s_jmp_alsflag		y,nohitaffect,.here
	s_jmp_alsflag		y,colldisable,.here
	s_jmpNOT_alflag		y,frontpl,.here
	
	bra	.nukeit
.altfind
	s_find_obj		y,x,#0,.donefind	;find all the things!
	s_cmp_alvar			W,y,al_shape,#nuke
	beq					.altfind
	s_cmp_alvar			W,y,al_shape,#playertwo1
	beq					.altfind
	s_cmp_alvar			W,y,al_shape,#peppy1
	beq					.altfind
	s_cmp_alvar			W,y,al_shape,#falco1
	beq					.altfind
	s_cmp_alvar			W,y,al_shape,#slippy1
	beq					.altfind
	s_cmp_alvar			W,y,al_shape,#andross
	beq					.altfind
	s_cmp_alvar			W,y,al_shape,#androsscube
	beq					.altfind

.nukeit
	lda	godnuke
	cmp	#1
	beq	.godshit
	lda.w			al_hp,y
	lbmi			.here	;go back to normal find
	bra	.nogodshit
.godshit
	lda.w			al_hp,y
	lbmi			.altfind	;go back to the alternate find
.nogodshit
	lda.w			al_hp,y
	sec
	sbc			#8
.ngpbomb
	lda.w			al_hp,y
	sec
	sbc			#6
.donebombstuff
	bpl			.nneg
	lda			#0
.nneg
	sta.w			al_hp,y
	s_set_alsflag	y,hitflash
	s_set_altype		y,nuked
	lda	godnuke
	beq	.noremove	;Don't autokill object if not a god nuke
	s_cmp_alvar			W,y,al_shape,#boss_2_0
	beq					.noremove
	s_cmp_alvar			W,y,al_shape,#boss_2_1
	beq					.noremove
	s_cmp_alvar			W,y,al_shape,#boss_2_2	;skip autokilling macbeth boss to avoid softlock
	beq					.noremove
	s_cmp_alvar			W,y,al_shape,#boss_2_3
	beq					.noremove
	s_cmp_alvar			W,y,al_shape,#boss_2_4
	beq					.noremove
	s_cmp_alvar			W,y,al_shape,#boss_2_5
	beq					.noremove
	s_cmp_alvar			W,y,al_shape,#androsscube
	beq					.noremove
	s_cmp_alvar			W,y,al_shape,#andross
	beq					.noremove
	lda	madtrucker
	lbne	.noremove

	s_kill_obj	y	;die by the hand of god!

.noremove
	lda	godnuke
	cmp	#1
	beq	.godshit2	;god nuke alternate find
	jmp			.here	;normal nuke continue
.godshit2
	jmp	.altfind	;god nuke alternate find continue
.donefind
	lda	#0
	sta	godnuke
	s_add_alvar		W,x,al_sword1,#nukeRATE

.nonuke
	s_end_strat


;---------------------------------
nukeexp2_Istrat
	s_start_strat
	s_set_alvar		W,x,al_sword1,#nukeRATE
	s_set_expstrat		x,nukeexp2_strat
	s_set_alvar		W,x,al_shape,#nullshape
	s_jsl			makeMEDexpobj_srou
	s_set_vartobeobj	circleobj,x
	big_circle_exptwo
	trigse			$30
	set_sound2		x,#0
	s_end_strat
nukeexp2_strat
	s_start_strat
	a16
	lda	al_sword2,x
	cmp	#nukeMAXRADIUS
	a8
	bmi	.donuke	
	s_remove_obj	x
	s_end_strat
.donuke
;	s_add_playerZ		x


	a16
	lda			al_sword2,x
	sta			svar_word3
	sec
	sbc			#nukeRATE
	sta			svar_word2
	a8
	s_set_find		0
.heree	
	s_find_radiusobj	y,x,#0,svar_word2,svar_word3,.donefind
	s_jmp_alsflag		y,nohitaffect,.heree
	s_jmp_alsflag		y,colldisable,.heree
	s_jmpNOT_alflag		y,frontpl,.heree
	s_cmp_alvar			W,y,al_shape,#nuke
	beq					.heree
	s_cmp_alvar			W,y,al_shape,#peppy1
	beq					.heree
	s_cmp_alvar			W,y,al_shape,#playertwo1
	beq					.heree
	s_cmp_alvar			W,y,al_shape,#falco1
	beq					.heree
	s_cmp_alvar			W,y,al_shape,#slippy1
	beq				.heree
	s_cmp_alvar			W,y,al_shape,#myship_4
	lbeq				.heree

	lda.w			al_hp,y
	lbmi			.heree	;go back to find
	sec
	sbc			#nukeAP
	bpl			.nneg
	lda			#0
.nneg
	sta.w			al_hp,y
	s_set_alsflag	y,hitflash
	s_set_altype		y,nuked

	jmp			.heree

.donefind
	s_add_alvar		W,x,al_sword2,#nukeRATE
	
.nonuke
	s_end_strat



;*****************************************************************************
spread_Istrat
	s_start_strat
	s_set_strat		x,spread_strat
	s_set_alvar		B,x,al_sbyte3,#10
	s_set_colltype		x,friend
	s_set_colltype		x,enemyweap
	s_gen_3dvecs		x,al_roty,al_rotx,al_speed

spread_strat
	s_start_strat
	s_beqdec_alvar		B,x,al_sbyte3,spreadA_init

	s_add_alvar		B,x,al_rotz,#8
	s_add_vecs2pos		x
	s_dec_lifecnt		x
	s_add_playerZ		x
	s_brl			miss_end


spreadA_init
	s_set_find		0
.find	s_find_obj		y,x,#0,.nfind

	s_jmp_alcollflag	y,weapon,.find
	s_jmp_alsflag		y,colldisable,.find
	s_jmp_alvarEQ.w		B,y,al_HP,#hardHP,.find

;	s_jmp_alsflag		y,lockon,.find
;	s_set_alsflag		y,lockon

	sty			svar_word1
	s_weapon_pos		#0,#0,#0
	s_weapon_rot		#0,#0
	s_fire_weapon		x,QHMISSILE1
	s_set_alvar		W,y,al_ptr,svar_word1

	s_bra			.find
.nfind
	s_jmp			explode_Istrat

	

;*****************************************************************************
numhelpshots	equ	3

helpball_Istrat
	s_start_strat
	s_sprite_obj	x,#0
	s_set_alptrs	x,helpball_strat,0,0
	s_set_alsflag	x,colldisable
	s_set_alvar	B,x,al_sbyte3,#120
helpball_strat
	s_start_strat
	s_set_objtobeplayer	y
	s_rots_flat		x
	s_jmp_alvarLESS		B,x,al_sbyte2,#numhelpshots,.ok
	s_add_alvar		B,x,al_sbyte3,#3
	s_jmp_alvarLESS		B,x,al_sbyte3,#120,.ok
	dec	helpshots
	s_remove_obj		x
.ok
	s_copy_alvar2var	B,x,svar_byte1,al_sbyte3
	s_add_Roffs2pos		B,x,y,x,#0,svar_byte1,#60,0,0,1
	s_add_alvar		B,x,al_rotz,#12


	s_set_find		0
.next	s_find_radiusobj		y,x,#0,#300,#4000,.nfound
	s_jmpNOT_alflag		y,inviewpl,.next
	s_jmp_alsflag		y,nohitaffect,.next
	s_jmp_alsflag		y,colldisable,.next
	s_jmp_colltype		y,friend,.next
	s_jmp_alsflag		y,lockon,.next
	s_jmp_alvarEQ.w		B,y,al_hp,#hardHP,.next
	s_cmp_alvar			W,y,al_shape,#friendship_4
	lbeq					.next
	s_cmp_alvar			W,y,al_shape,#slippy1
	lbeq					.next
	s_cmp_alvar			W,y,al_shape,#falco1
	lbeq					.next
	s_cmp_alvar			W,y,al_shape,#peppy1
	lbeq					.next
	s_cmp_alvar			W,y,al_shape,#playertwo1
	lbeq					.next
	s_jmp_outXYdistrng	x,y,#0,#1000,.next

	s_jmp_alvarEQ		B,x,al_sbyte1,#3,.nfound

	s_set_alsflag		y,lockon
	s_set_vartobeobj	svar_word1,y
	s_make_obj		#shelpball,.bad
	s_set_strat		y,helpballhome_Istrat
	s_copy_pos		y,x
	s_set_alvar		W,y,al_ptr,svar_word1
	s_set_alvartobeobj	y,al_sword1,x
	s_inc_alvar		B,x,al_sbyte1
	s_inc_alvar		B,x,al_sbyte2
.bad
	s_brl			.next	

.nfound

	s_end_strat


helpballhome_Istrat
	s_start_strat
	s_set_alptrs		x,helpballhome_strat,helpballHcoll_Istrat,helpballHrem_Istrat
	s_set_aldata		x,#1,#20
	s_set_speed		x,#40
	s_set_lifecnt		x,#70
	s_set_colltype		x,laser
	s_set_colltype		x,friend
	s_setnoremove_behind	x
	s_sprite_obj	x,#0
helpballhome_strat
	s_start_strat
	s_rots_flat		x
	s_set_objtobealvar	y,x,al_ptr
	s_jmp_objptrbad		y,helpballHrem_Istrat
	s_obj2obj_3dangle	x,y,al_sbyte1,al_sbyte2,0
	s_gen_3dvecs		x,al_sbyte1,al_sbyte2,al_speed	
	s_add_vecs2pos		x
	s_add_playerZ		x
	s_dec_lifecnt		x,1
	s_end_strat

helpballHcoll_Istrat
	s_set_objtobealvar	y,x,al_ptr
	a16
	lda		al_collobjptr,x
	sta		svar_word1
	cpy		svar_word1
	a8
	lbeq		coll_Istrat
.ncol 	
	s_clr_alsflag		x,collide
	s_jmpto_strat	
	

helpballHrem_Istrat
	s_set_objtobealvar	y,x,al_ptr
	s_jmp_objptrbad		y,.nclr
	s_clr_alsflag		y,lockon
.nclr
	s_set_objtobealvar	y,x,al_sword1
	s_dec_alvar		B,y,al_sbyte1
	s_jmp			remove_Istrat


fire_newweapon
	lda	weaponnumber
	cmp	#8
	lbeq	.8
	cmp	#9
	lbeq	.9
	cmp	#10
	lbeq	.10
	cmp	#11
	lbeq	.11
	cmp	#12
	lbeq	.12
	cmp	#13
	lbeq	.13
	cmp	#14
	lbeq	.14
	cmp	#15
	lbeq	.15
	cmp	#16
	lbeq	.16
	cmp	#17
	lbeq	.17
	cmp	#18
	lbeq	.18
	cmp	#19
	lbeq	.19
	cmp	#20
	lbeq	.20
	cmp	#21
	lbeq	.21
	cmp	#22
	lbeq	.22
	cmp	#23
	lbeq	.23
	cmp	#24
	lbeq	.24
	cmp	#25
	lbeq	.25
	cmp	#26
	lbeq	.26
	cmp	#27
	lbeq	.27

.8	;Fireball
	s_make_obj		#fireball,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#9
	s_set_speed		y,#30
	s_set_lifecnt		y,#35
	jmp	.cont
.9	;Flamethrower
	s_make_obj		#bonfireball,.badobj
	s_sprite_obj		y,#1
	s_set_aldata		y,#1,#8
	s_set_speed		y,#15
	s_set_lifecnt		y,#35
	jmp	.cont
.10	;Black Hole
	s_make_obj		#fireball,.badobj
	s_sprite_obj		y,#1
	s_set_aldata		y,#1,#8
	s_set_speed		y,#20
	s_set_lifecnt		y,#35
	jmp	.cont
.11	;Electric Shock
	s_make_obj		#fire,.badobj
	s_sprite_obj		y,#2
	s_set_aldata		y,#1,#8
	s_set_speed		y,#50
	s_set_lifecnt		y,#40
	jmp	.cont
.12	;Black Space Debris
	s_make_obj		#fire,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#10
	s_set_speed		y,#50
	s_set_lifecnt		y,#40
	jmp	.cont
.13	;IronBall
	s_make_obj		#ironball2,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#9
	s_set_speed		y,#25
	s_set_lifecnt		y,#35
	jmp	.cont
.14	;Smiley Asteroid
	s_make_obj		#asteroidb,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#10
	s_set_speed		y,#20
	s_set_lifecnt		y,#35
	jmp	.cont
.15	;Amoeba
	s_make_obj		#amoeba1,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#11
	s_set_speed		y,#30
	s_set_lifecnt		y,#35
	jmp	.cont
.16	;Escapee
	s_make_obj		#escapee,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#15
	s_set_speed		y,#20
	s_set_lifecnt		y,#35
	jmp	.cont
.17	;Firebreath
	s_make_obj		#firebreath,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#13
	s_set_speed		y,#30
	s_set_lifecnt		y,#35
	jmp	.cont
.18	;Missile
	s_make_obj		#missile,.badobj
;	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#14
	s_set_speed		y,#15
	s_set_lifecnt		y,#35
	jmp	.cont
.19	;Chicken Missile
	s_make_obj		#c_miss,.badobj
;	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#12
	s_set_speed		y,#35
	s_set_lifecnt		y,#30
	jmp	.cont
.20	;Water Gun
	s_make_obj		#splash,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#13
	s_set_speed		y,#30
	s_set_lifecnt		y,#30
	jmp	.cont
.21	;Smoke Gun
	s_make_obj		#smoke,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#10
	s_set_speed		y,#30
	s_set_lifecnt		y,#30
	jmp	.cont
.22	;Spikey Ball
	s_make_obj		#grabber3,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#12
	s_set_speed		y,#40
	s_set_lifecnt		y,#30
	jmp	.cont
.23	;Egg Shooter
	s_make_obj		#egg,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#13
	s_set_speed		y,#35
	s_set_lifecnt		y,#30
	jmp	.cont
.24	;Arwing Shooter
	s_make_obj		#myship_4,.badobj
;	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#12
	s_set_speed		y,#35
	s_set_lifecnt		y,#30
	jmp	.cont
.25	;Andross Cube Shooter
	s_make_obj		#androsscubee,.badobj
;	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#12
	s_set_speed		y,#35
	s_set_lifecnt		y,#30
	jmp	.cont
.26	;Nano Wasps
	s_make_obj		#shyper,.badobj
;	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#12
	s_set_speed		y,#35
	s_set_lifecnt		y,#30
	jmp	.cont
.27	;Nucleus Beam
	s_make_obj		#sparklas,.badobj
;	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#11
	s_set_speed		y,#15
	s_set_lifecnt		y,#40
	jmp	.cont
.cont
	s_set_alptrs		y,Pelaser_Istrat,pelasercollide_Istrat,pelaser2die_Istrat
	s_set_colltype		y,laser
	s_set_colltype		y,friend
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
;	jsl			enemybattrysound_l
.badobj	rtl



;*****************************************************************************
fire_nuke	; player's special weapon
	s_make_obj		#nuke,.badobj
	s_sprite_obj		y,#0
	lda	newgameplus
	and	#1
	bne	.ng
	s_set_aldata		y,#2,#8
	bra	.done
.ng
	s_set_aldata		y,#2,#4
	stz	godnuke
.done
	s_set_alptrs		y,nuke_Istrat,0,0
	s_set_speed		y,#50
	s_set_lifecnt		y,#28
	s_set_colltype		y,laser
	s_set_colltype		y,friend
	jsr			gen_weapon
.badobj	rtl

fire_nuke2	; player's special weapon
	s_make_obj		#nuke,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#2,#8
	s_set_alptrs		y,nuke2_Istrat,0,0
	s_set_speed		y,#50
	s_set_lifecnt		y,#28
	s_set_colltype		y,laser
	s_set_colltype		y,friend
	jsr			gen_weapon
.badobj	rtl
;*****************************************************************************
fire_GodGun	; destroys lots of shit.
	s_make_obj		#elaserfire,.badobj
	s_set_aldata		y,#50,#50
	s_set_alptrs		y,Pelaser_Istrat,godguncollide_Istrat,pelaser2die_Istrat
	s_set_speed		y,#66
	s_set_lifecnt		y,#10
	s_set_colltype		y,laser
	s_set_colltype		y,friend
	jsr			gen_weapon
.badobj	rtl
;*****************************************************************************
fire_Elaser	; player's laser.
	lda	rainbowlaser
	beq	.nojump
	jmp	fire_rainbowelaser
.nojump
	s_make_obj		#elaser2,.badobj
	lda	newgameplus
	and	#1
	bne	.ng
	s_set_aldata		y,#1,#elaserAP
	bra	.done
.ng
	s_set_aldata		y,#1,#1	
.done
	s_set_alptrs		y,Pelaser_Istrat,pelasercollide_Istrat,pelaser2die_Istrat
	s_set_speed		y,#66
	s_set_lifecnt		y,#10
	s_set_colltype		y,laser
	s_set_colltype		y,friend
	jsr			gen_weapon
.badobj	rtl

fire_shotgun	; player's shotgun.
	s_make_obj		#elaseryellow,.badobj
	lda	newgameplus
	and	#1
	bne	.ng
	s_set_aldata		y,#1,#elaserAP
	bra	.done
.ng
	s_set_aldata		y,#1,#1	
.done
	s_set_alptrs		y,Pelaser_Istrat,pelasercollide_Istrat,pelaser2die_Istrat
	s_set_speed		y,#66
	s_set_lifecnt		y,#10
	s_set_colltype		y,laser
	s_set_colltype		y,friend
	jsr			gen_weapon
.badobj	rtl

;*****************************************************************************
fire_RainbowElaser	; player's laser.
.redo
	jsl	random_l
	cmp	#10
	bmi	.redo
	cmp	#20
	bmi	.2
	cmp	#30
	bmi	.3
	cmp	#40
	bmi	.4
	cmp	#50
	bmi	.5
	cmp	#60
	lbmi	.6
	cmp	#70
	lbmi	.7
	cmp	#80
	lbmi	.8
	bpl	.redo
;.1	
;	s_make_obj		#elaserwhite,.badobj
;	jmp	.doneobj
.2	
	s_make_obj		#elaserblack,.badobj
	jmp	.doneobj
.3	
	s_make_obj		#elaserred,.badobj
	bra	.doneobj
.4	
	s_make_obj		#elaserblue,.badobj
	bra	.doneobj
.5	
	s_make_obj		#elasergreen,.badobj
	bra	.doneobj
.6	
	s_make_obj		#elaserred2,.badobj
	bra	.doneobj
.7	
	s_make_obj		#elaservblue,.badobj
	bra	.doneobj
.8	
	s_make_obj		#elaseryellow,.badobj
	bra	.doneobj


	
.doneobj
	lda	newgameplus
	and	#1
	bne	.ng
	s_set_aldata		y,#1,#elaserAP
	bra	.done
.ng
	s_set_aldata		y,#1,#1	
.done
	s_set_alptrs		y,Pelaser_Istrat,pelasercollide_Istrat,pelaser2die_Istrat
	s_set_speed		y,#66
	s_set_lifecnt		y,#10
	s_set_colltype		y,laser
	s_set_colltype		y,friend
	jsr			gen_weapon
.badobj	rtl
;*****************************************************************************
fire_QElaser
	s_make_obj		#ELASER2,.badobj
	s_set_aldata		y,#1,#elaserAP
	s_set_alptrs		y,qelaser2_istrat,pelasercollide_Istrat,pelaser2die_Istrat
	s_set_speed		y,#120
	s_set_lifecnt		y,#10
	s_set_colltype		y,laser
	s_set_colltype		y,friend

	jsr			gen_weapon
.badobj	rtl
;*****************************************************************************
qelaser2_Istrat
	s_start_strat
	s_set_strat		x,qelaser2_strat
	s_set_alvar		B,x,al_sbyte3,#3
	s_set_colltype		x,laser
	s_set_colltype		x,friend
	s_gen_3dvecs		x,al_roty,al_rotx,al_speed

qelaser2_strat
	s_start_strat
	s_beqdec_alvar		B,x,al_sbyte3,qelaser2A_init

	s_add_alvar		B,x,al_rotz,#8
	s_add_vecs2pos		x
	s_dec_lifecnt		x
	s_add_playerZ		x
	s_brl			miss_end


qelaser2A_init
	s_set_find		0
.find	
	s_find_obj		y,x,#0,.nfind

	s_jmp_alcollflag	y,colltype5,.find
	s_jmp_colltype		y,friend,.find
	s_jmp_colltype		y,laser,.find
	s_jmp_alsflag		y,colldisable,.find
	s_jmp_alvarEQ.w		B,y,al_HP,#hardHP,.find
	s_cmp_alvar			W,y,al_shape,#friendship_4
	lbeq					.find
	s_cmp_alvar			W,y,al_shape,#slippy1
	lbeq					.find
	s_cmp_alvar			W,y,al_shape,#falco1
	lbeq					.find
	s_cmp_alvar			W,y,al_shape,#peppy1
	lbeq					.find
	s_cmp_alvar			W,y,al_shape,#playertwo1
	lbeq					.find
;	s_jmp_alsflag		y,lockon,.find
;	s_set_alsflag		y,lockon

	sty			svar_word1
;	s_weapon_pos		#0,#0,#0
;	s_weapon_rot		#0,#0
	s_fire_weapon		x,qlaser
	s_set_alvar		W,y,al_ptr,svar_word1

;	s_bra			.find
.nfind
	s_decbne_lifecnt	x,.lnd
	bra	.nfind
.lnd
	s_jmp			pelaser2die_Istrat
	rtl
;*****************************************************************************
fire_qlaser	; player's laser.
;	s_make_obj		#t_bool_6,.badobj
	s_make_obj		#elaser2,.badobj
;	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#elaserAP
	s_set_alptrs		y,qlaser_Istrat,pelasercollide_Istrat,pelaser2die_Istrat
	s_set_speed		y,#120
	s_set_lifecnt		y,#10
	s_set_colltype		y,laser
	s_set_colltype		y,friend
	jsr			gen_weapon
.badobj	rtl
;*****************************************************************************
fire_playerbeam	; player's laser.
;	s_make_obj		#t_bool_6,.badobj
	s_make_obj		#playerbeam,.badobj
	s_sprite_obj		y,#0
	lda	newgameplus
	and	#1
	bne	.ng
	s_set_aldata		y,#1,#playerbeamAP
	bra	.done
.ng
	s_set_aldata		y,#1,#2	
.done
	s_set_alptrs		y,pbeam_Istrat,pelasercollide_Istrat,playerbeamdie_Istrat
	s_set_speed		y,#66		40
	s_set_lifecnt		y,#10		18
	s_set_colltype		y,laser
	s_set_colltype		y,friend
	jsr			gen_weapon
.badobj	rtl

;*****************************************************************************
fire_orb
	s_make_obj		#orb,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#8
	s_set_alptrs		y,skullshot_Istrat,weapcollide_Istrat,remove_Istrat
	s_set_speed		y,#50
	s_set_lifecnt		y,#50
	s_set_colltype		y,laser
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
;	s_setnoremove_behind	y
	jsr			gen_weapon
	jsl			enemybattrysound_l
.badobj	rtl

;*****************************************************************************
fire_orb2
	s_make_obj		#orb,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#18
	s_set_alptrs		y,vortex1_Istrat,weapcollide_Istrat,remove_Istrat
	s_set_speed		y,#17
	s_set_lifecnt		y,#40
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
;	s_setnoremove_behind	y
	jsr			gen_weapon
	jsl			enemybattrysound_l
.badobj	rtl

;*****************************************************************************
fire_bolt
	s_make_obj		#bolt,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#25
	s_set_alptrs		y,vortex1_Istrat,weapcollide_Istrat,remove_Istrat
	s_set_speed		y,#17
	s_set_lifecnt		y,#40
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
;	s_setnoremove_behind	y
	jsr			gen_weapon
;	jsl			enemybattrysound_l
	trigse	102
.badobj	rtl


;*****************************************************************************
fire_RebElaser		; rebound player's laser
	s_make_obj		#elaser2,.badobj
	s_set_aldata		y,#1,#enemylaserAP
	s_set_alptrs		y,relelaser_Istrat,weapcollide_Istrat,elaser2die_Istrat
	s_set_speed		y,#60
	s_set_lifecnt		y,#40
	s_set_colltype		y,enemyweap
	s_set_colltype		y,laser
	s_set_colltype		y,enemy1
	s_set_colltype		y,enemy2
	s_add_var		W,svar_weapZ,#80>>weapon_scale
	jsr			gen_weapon
	jsl			hitwallsound_l
.badobj	rtl



;*****************************************************************************
fire_relbeamball			; relative to player speed.
fire_plasma				; relative to player speed.
	s_make_obj		#bouncyball,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#plasmaAP
	s_set_alptrs		y,relflatmiss_Istrat,weapcollide_Istrat,remove_Istrat
	s_set_speed		y,#80
	s_set_lifecnt		y,#30+70
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
	jsl			enemybattrysound_l
.badobj	rtl

fire_skullshot				; relative to player speed.
	s_make_obj		#skullshot,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#8
	s_set_alptrs		y,skullshot_istrat,weapcollide_Istrat,remove_Istrat
	s_set_speed		y,#30
	s_set_lifecnt		y,#80
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
	jsl			ringlasersound_l
.badobj	rtl

fire_multiorb				; relative to player speed.
	s_make_obj		#multiorb,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#8
	s_set_alptrs		y,multiorb_istrat,weapcollide_Istrat,remove_Istrat
	s_set_speed		y,#10
	s_set_lifecnt		y,#90
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
	jsl			ringlasersound_l
.badobj	rtl


;*****************************************************************************
fire_beamball
	s_make_obj		#bouncyball,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#8
	s_set_alptrs		y,flatmiss_Istrat,weapcollide_Istrat,remove_Istrat
	s_set_speed		y,#70
	s_set_lifecnt		y,#30+70
	s_set_colltype		y,laser
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
	jsl			enemybattrysound_l
.badobj	rtl


;*****************************************************************************
fire_relovalbeam			; relative to player speed.
	s_make_obj		#ovalbeam,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#8
	s_set_alptrs		y,relflatmiss_Istrat,weapcollide_Istrat,remove_Istrat
	s_set_speed		y,#70
	s_set_lifecnt		y,#30+70
	s_set_colltype		y,laser
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
	jsl			enemybattrysound_l
.badobj	rtl

fire_relovalbeam2			; relative to player speed.
	s_make_obj		#ovalbeam,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#8
	s_set_alptrs		y,Pelaser_Istrat,pelasercollide_Istrat,pelaser2die_Istrat
	s_set_speed		y,#80
	s_set_lifecnt		y,#35
	s_set_colltype		y,laser
	s_set_colltype		y,friend
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
	jsl			enemybattrysound_l
.badobj	rtl
;*****************************************************************************
fire_relringlaser				; relative to player speed.
	s_make_obj		#ringlaser,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#6
	s_set_alptrs		y,relflatmiss_Istrat,weapcollide_Istrat,remove_Istrat
	s_set_speed		y,#70
	s_set_lifecnt		y,#30+70
	s_set_colltype		y,laser
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
	jsl			enemybattrysound_l
.badobj	rtl

fire_relringlaser2				; relative to player speed.
	s_make_obj		#ringlaser,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#7
	s_set_alptrs		y,Pelaser_Istrat,pelasercollide_Istrat,pelaser2die_Istrat
	s_set_speed		y,#80
	s_set_lifecnt		y,#35
	s_set_colltype		y,laser
	s_set_colltype		y,friend
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
	jsl			enemybattrysound_l
.badobj	rtl
;*****************************************************************************
fire_ovalbeam			
	s_make_obj		#ovalbeam,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#8
	s_set_alptrs		y,flatmiss_Istrat,weapcollide_Istrat,remove_Istrat
	s_set_speed		y,#70
	s_set_lifecnt		y,#30+70
	s_set_colltype		y,laser
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
	jsl			enemybattrysound_l
.badobj	rtl


;*****************************************************************************
fire_ringlaser				
	s_make_obj		#ringlaser,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#6
	s_set_alptrs		y,flatmiss_Istrat,weapcollide_Istrat,remove_Istrat
	s_set_speed		y,#70
	s_set_lifecnt		y,#30+70
	s_set_colltype		y,laser
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
	jsl			ringlasersound_l
.badobj	rtl


;*****************************************************************************
fire_shortplasma		; relative to player speed.
	s_make_obj		#bouncyball,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#plasmaAP
	s_set_alptrs		y,relflatmiss_Istrat,weapcollide_Istrat,remove_Istrat
	s_set_speed		y,#80
	s_set_lifecnt		y,#30
	s_set_colltype		y,laser
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
	jsl			enemybattrysound_l
.badobj	rtl

;*****************************************************************************
fire_Hplasma				; relative to player speed.
	s_make_obj		#bouncyball,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#HplasmaAP
	s_set_alptrs		y,homingflat_Istrat,weapcollide_Istrat,remove_Istrat
	s_set_speed		y,#60
	s_set_lifecnt		y,#50
	s_set_colltype		y,laser
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
	jsl			enemybattrysound_l
.badobj	rtl

fire_Hplasma2				; relative to player speed.
	s_make_obj		#bouncyball,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#HplasmaAP
	s_set_alptrs		y,Pelaser_Istrat,pelasercollide_Istrat,pelaser2die_Istrat
	s_set_speed		y,#80
	s_set_lifecnt		y,#35
	s_set_colltype		y,laser
	s_set_colltype		y,friend
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
	jsl			enemybattrysound_l
.badobj	rtl
;*****************************************************************************
fire_YHplasma				; relative to player speed.
	s_make_obj		#sparklas,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#8
	s_set_alptrs		y,Yhoming_Istrat,weapcollide_Istrat,remove_Istrat
	s_set_speed		y,#100
	s_set_lifecnt		y,#50
	s_set_colltype		y,laser
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	s_setnoremove_behind	y
	jsr			gen_weapon
	jsl			enemybattrysound_l
.badobj	rtl

;*****************************************************************************
fire_relslowElaser 			; relative to player speed.
	s_make_obj		#elaser2a,.badobj
	s_set_aldata		y,#1,#enemylaserAP
	s_set_alptrs		y,relelaser_Istrat,weapcollide_Istrat,elaser2die_Istrat
	jsr			doelaserspeed
	s_set_lifecnt		y,#40
	s_set_colltype		y,enemyweap
	s_set_colltype		y,laser
	s_set_alsflag		y,relexplode
	s_add_var		W,svar_weapZ,#elaserfireZoff>>weapon_scale
	jsr			gen_weapon
	jsl			lasersound_l
;	jsr			laserflash
.badobj	rtl
;*****************************************************************************
fire_relslowElaserHome 			; relative to player speed.
	s_make_obj		#elaser2a,.badobj
	s_set_aldata		y,#1,#enemylaserAP
	s_set_alptrs		y,relelaserhome_Istrat,weapcollide_Istrat,elaser2die_Istrat
	jsr			doelaserspeed
	s_set_lifecnt		y,#40
	s_set_colltype		y,enemyweap
	s_set_colltype		y,laser
	s_set_alsflag		y,relexplode
	s_add_var		W,svar_weapZ,#80>>weapon_scale
	jsr			gen_weapon
	jsl			lasersound_l
;	jsr			laserflash
.badobj	rtl
;*****************************************************************************
fire_tame
	s_make_obj		#tame,badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#8
	s_set_speed		y,#30
	jmp	tamestuff
	
fire_vortex1 			; relative to player speed.
	s_make_obj		#vortex1,badobj
	s_set_aldata		y,#1,#6
	s_set_speed		y,#60
tamestuff
	s_set_alptrs		y,vortex1_Istrat,weapcollide_Istrat,elaser2die_Istrat
;	jsr			doelaserspeed
	s_set_lifecnt		y,#40
	s_set_colltype		y,enemyweap
	s_set_colltype		y,laser
	s_set_alsflag		y,relexplode
	s_add_var		W,svar_weapZ,#80>>weapon_scale
	jsr			gen_weapon
	jsl			enemybattrysound_l
badobj	rtl

;*****************************************************************************
fire_relfastElaser 			; relative to player speed.
	s_make_obj		#elaser2a,.badobj
	s_set_aldata		y,#1,#enemylaserAP
	s_set_alptrs		y,relelaser_Istrat,weapcollide_Istrat,elaser2die_Istrat
	s_set_speed		y,#90
	s_set_lifecnt		y,#40
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	s_set_colltype		y,laser
	s_add_var		W,svar_weapZ,#80>>weapon_scale
	jsr			gen_weapon
	jsl			lasersound_l
;	jsr			laserflash
.badobj	rtl
;*****************************************************************************
fire_slowElaser 			
	s_make_obj		#elaser2a,.badobj
	s_set_aldata		y,#1,#enemylaserAP
	s_set_alptrs		y,elaser_Istrat,weapcollide_Istrat,elaser2die_Istrat
	s_set_speed		y,#60
	s_set_lifecnt		y,#40
	s_set_colltype		y,enemyweap
	s_set_colltype		y,laser
	s_add_var		W,svar_weapZ,#80>>weapon_scale
	jsr			gen_weapon
	jsl			lasersound_l
;	jsr			laserflash
.badobj	rtl


;*****************************************************************************
fire_FakeFarHmissile1				; relative to player

;	s_make_obj		#amissile,.badobj
	s_make_obj		#missile,.badobj
	s_set_aldata		y,#hmissile1HP,#hmissile1AP
	s_set_alptrs		y,hmissile1_Istrat,weapcollide_Istrat,stopexplode2_Istrat
	s_copy_alvar2alvar	W,y,al_ptr,x,al_ptr
	s_set_speed		y,#60
	s_set_lifecnt		y,#100
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	s_set_alsflag		y,sflag3
	s_init_anim	y,#0
	jsr			gen_weapon
	jsl			missilesound_l
.badobj	rtl

;*****************************************************************************
fire_Hmissile1				; relative to player
	s_make_obj		#missile,.badobj
	s_set_aldata		y,#hmissile1HP,#hmissile1AP
	s_set_alptrs		y,hmissile1_Istrat,weapcollide_Istrat,stopexplode2_Istrat
	s_copy_alvar2alvar	W,y,al_ptr,x,al_ptr
	s_set_speed		y,#60
	s_set_lifecnt		y,#100
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
	jsl			missilesound_l
	phx
	phy
	tyx
	s_make_obj		#smoke,.badobj1
	s_copy_pos		y,x
	s_clr_alsflag		y,realobj
	s_set_strat		y,puff_Istrat
.badobj1	
	ply
	plx

.badobj	rtl
;*****************************************************************************
fire_vortex2				; relative to player
	s_make_obj		#vortex2,.badobj
	s_set_aldata		y,#hmissile1HP,#hmissile1AP
	s_set_alptrs		y,vortex2_Istrat,weapcollide_Istrat,stopexplode2_Istrat
	s_copy_alvar2alvar	W,y,al_ptr,x,al_ptr
	s_set_speed		y,#40
	s_set_lifecnt		y,#100
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
	jsl			missilesound_l

.badobj	rtl


;*****************************************************************************
fire_Hmissile2				; move for short time then quick turn relative to player
	s_make_obj		#missile,.badobj
	s_set_aldata		y,#hmissile1HP,#hmissile1AP
	s_set_alptrs		y,hmissile2_Istrat,weapcollide_Istrat,stopexplode2_Istrat
	s_copy_alvar2alvar	W,y,al_ptr,x,al_ptr
	s_set_speed		y,#60
	s_set_lifecnt		y,#100
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
	jsl			missilesound_l
.badobj	rtl

;*****************************************************************************
fire_bossHmissile1				; relative to player
	jsl	fire_hmissile1
	s_jmp_objptrbad		y,.bad
	s_set_expstrat	y,explodegate2_Istrat
.bad	s_rtl


;*****************************************************************************
fire_bossHmissile2				; relative to player
	jsl	fire_hmissile2
	s_jmp_objptrbad		y,.bad
	s_set_expstrat	y,explodegate2_Istrat
.bad	s_rtl
	
;*****************************************************************************
fire_kamiHmissile1				; relative to player
	s_make_obj		#zaco_9,.badobj
	s_set_aldata		y,#kamihmissile1HP,#kamihmissile1AP
	s_set_alptrs		y,hmissile3_Istrat,weapcollide_Istrat,explode2_Istrat
	s_copy_alvar2alvar	W,y,al_ptr,x,al_ptr
	s_set_speed		y,#40
	s_set_lifecnt		y,#100
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
	jsl			missilesound_l
.badobj	rtl

;*****************************************************************************
fire_chickHmissile1				; relative to player
	s_make_obj		#c_miss,.badobj
	s_set_aldata		y,#hardHP,#hmissile1AP*5
	s_set_alptrs		y,chickhmissile1_Istrat,weapcollide_Istrat,explode2_Istrat
	s_copy_alvar2alvar	W,y,al_ptr,x,al_ptr
	s_set_speed		y,#30
	s_set_lifecnt		y,#30
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
	jsl			missilesound_l
.badobj	rtl

;*****************************************************************************
fire_STBHmissile1				; relative to player
	s_make_obj		#missile,.badobj
	s_set_aldata		y,#hmissile1HP,#hmissile1AP
	s_set_alptrs		y,stbhmissile1_Istrat,weapcollide_Istrat,stopexplode2_Istrat
	s_copy_alvar2alvar	W,y,al_ptr,x,al_ptr
	s_set_lifecnt		y,#100
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	s_set_colltype		y,enemy2
	jsr			gen_weapon
	jsl			missilesound_l
.badobj	rtl

;*****************************************************************************
fire_QHmissile1				; relative to player
	s_make_obj		#missile,.badobj
	s_set_aldata		y,#1,#50
	s_set_alptrs		y,Qhmissile1_Istrat,weapcollide_Istrat,stopexplode2_Istrat
	s_copy_alvar2alvar	W,y,al_ptr,x,al_ptr
	s_set_speed		y,#60
	s_set_lifecnt		y,#100
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
	jsl			missilesound_l
.badobj	rtl



;*****************************************************************************
fire_missile2				
	s_make_obj		#missile,.badobj
	s_set_aldata		y,#missile2HP,#missile2AP
	s_set_alptrs		y,missile2_Istrat,weapcollide_Istrat,stopexplode2_Istrat
	s_copy_alvar2alvar	W,y,al_ptr,x,al_ptr
	s_set_speed		y,#30
	s_set_lifecnt		y,#100
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
	jsl			missilesound_l
.badobj	rtl

;*****************************************************************************
fire_missile1				
	s_make_obj		#missile,.badobj
	s_set_aldata		y,#missile2HP,#missile2AP
	s_set_alptrs		y,missile1_Istrat,weapcollide_Istrat,stopexplode2_Istrat
	s_copy_alvar2alvar	W,y,al_ptr,x,al_ptr
	s_set_speed		y,#30
	s_set_lifecnt		y,#100
	s_set_colltype		y,enemyweap
	jsr			gen_weapon
	jsl			missilesound_l
.badobj	rtl



;*****************************************************************************
fire_spread
	s_make_obj		#missile,.badobj
	s_set_aldata		y,#missile2HP,#missile2AP
	s_set_alptrs		y,spread_Istrat,weapcollide_Istrat,explode2_Istrat
	s_set_speed		y,#40
	s_set_lifecnt		y,#50
	jsr			gen_weapon
.badobj	rtl


;*****************************************************************************
doelaserspeed

	s_set_speed		y,#48
	s_jmp_iflevel	1,.slow
	s_set_speed		y,#60
.slow	rts


;*****************************************************************************
gen_weapon
;	s_set_alvar		B,y,al_type,#ATMISSILE
	s_set_alcollflag	y,WEAPON
	s_copy_rots		y,x
	s_set_alvar.w		B,y,al_rotz,#0

	s_add_Roffs2pos.w	B,y,x,x,svar_weapx,svar_weapy,svar_weapz,1,1,1,weapon_scale,weapon_scale,weapon_scale


	phx	
	
	ldx	svar_weapobj
	beq	.nrotobj
	a16
	lda	al_worldx,x
	sta	x2
	lda	al_worldy,x
	sta	y2
	lda	al_worldz,x
	sta	z2
	a8
	exg_xy
	jsl	Xanglexabs_l  
	clc
	adc	svar_weapRx
	sta	al_rotx,x
	jsl	Yanglexabs_l  
	nega
	clc
	adc	svar_weapRy
	sta	al_roty,x
	exg_xy
        	bra	.donerot
.nrotobj
	s_add_alvar		B,y,al_rotx,svar_weapRx
	s_add_alvar		B,y,al_roty,svar_weapRy
.donerot

	plx


	s_copy_alvar2alvar	B,y,al_sbyte1,y,al_rotx
	s_copy_alvar2alvar	B,y,al_sbyte2,y,al_roty


	s_copy_alvar2alvar	B,y,al_sbyte3,x,al_speed		; copy speed

	s_make_immune		


	rts




;*****************************************************************************
laserflash
	ifeq	1
	phx
	tyx
	
	s_set_objtobeplayer	y
	s_set_var		W,swvar_word1,#Sflash_0
	s_jmp_Zdistless		x,y,#bigSflashDist,.flashsize
	s_set_var		W,swvar_word1,#Mflash_0
	s_jmp_Zdistless		x,y,#bigMflashDist,.flashsize
	s_set_var		W,swvar_word1,#Lflash_0
.flashsize

	s_make_obj	swvar_word1,.badobj
	s_copy_pos	y,x
	s_set_alvar	B,y,al_roty,#deg180
	s_set_strat	y,flash_Istrat
.badobj	txy
	plx
	rts

flash_Istrat
	s_start_strat
	s_sprite_obj	x,#0
	s_set_alsflag	x,colldisable
	s_init_COLanim	x,#0
	s_set_strat	x,flash_strat
	s_add_playerZ	x
	s_end_strat	
flash_strat
	s_start_strat
	s_add_playerZ	x
	s_cmp_COLanim	x,#2
	s_beq		remove_Istrat
	s_add_COLanim	x,#1,#4
	endc
	s_end_strat

	




;*****************************************************************************

float256_srou_l
	jsr			flout_srou
	s_set_var2vartab	B,B,W,tpx,x1,sintab,-1
	s_set_var2vartab	B,B,W,tpy,x2,sintab,-1
	jmp			float_cont

float128_srou_l
	jsr			flout_srou
	s_set_var2vartab	B,B,W,tpx,x1,sintab,-2
	s_set_var2vartab	B,B,W,tpy,x2,sintab,-2
	jmp			float_cont

float64_srou_l
	jsr			flout_srou
	s_set_var2vartab	B,B,W,tpx,x1,sintab,-3
	s_set_var2vartab	B,B,W,tpy,x2,sintab,-3
	jmp			float_cont

float32_srou_l
	jsr			flout_srou
	s_set_var2vartab	B,B,W,tpx,x1,sintab,-4
	s_set_var2vartab	B,B,W,tpy,x2,sintab,-4


float_cont
	s_add_alvar		W,x,al_worldx,tpx
	s_add_alvar		W,x,al_worldy,tpy
	s_rtl
flout_srou
	lda			floatvar1
	stx			x1
	clc
	adc			x1
	sta			x1

	lda			floatvar2
	stx			x2
	clc
	adc			x2
	sta			x2

	rts

	


;*****************************************************************************
Xflytopos_l
	a16
	lda			svar_word3
	sec
	sbc			al_worldx,x
	a8
	bmi			.dec
	inc			al_sbyte3,x	
	bra			.end
.dec
	dec			al_sbyte3,x	
.end

	s_limit_alvar		B,x,al_sbyte3,-10,10

	s_add_alvars		B,x,al_rotz,x,al_sbyte3
	s_limit_alvar		B,x,al_rotz,-deg45,deg45

	lda			al_sbyte3,x
	a16
	sexa
	clc
	adc			al_worldx,x
	sta			al_worldx,x
	a8

	s_achase_alvar		W,x,al_worldx,svar_word3,7

.stop
	rtl

;*****************************************************************************
yppos	equ	20

	IFEQ	1
;---------------------------------------
printaw1_l
	phy
	phx
	php
	sta	tpa
	a8
	sprint	0,yppos-1
	lda	tpa+1
	jsl	printb_l
	sprint	2,yppos-1
	lda	tpa
	jsl	printb_l
	plp
	plx
	ply
	rtl
;---------------------------------------
printaw2_l
	phy
	phx
	php
	sta	tpa
	a8
	sprint	5,yppos-1
	lda	tpa+1
	jsl	printb_l
	sprint	7,yppos-1
	lda	tpa
	jsl	printb_l
	plp
	plx
	ply
	rtl
;---------------------------------------
printaw3_l
	phy
	phx
	php
	sta	tpa
	a8
	sprint	10,yppos-1
	lda	tpa+1
	jsl	printb_l
	sprint	12,yppos-1
	lda	tpa
	jsl	printb_l
	plp
	plx
	ply
	rtl
;---------------------------------------
printab1_l
	phy
	phx
	php
	sprint	0,yppos
	lda	tpa
	jsl	printb_l
	plp
	plx
	ply
	rtl
;---------------------------------------
printab2_l
	phy
	phx
	php
	sprint	3,yppos
	lda	tpa
	jsl	printb_l
	plp
	plx
	ply
	rtl

;---------------------------------------
printab3_l
	phy
	phx
	php
	sprint	6,yppos
	lda	tpa
	jsl	printb_l
	plp
	plx
	ply
	rtl

;---------------------------------------
printab4_l
	phy
	phx
	php
	sprint	9,yppos
	lda	tpa
	jsl	printb_l
	plp
	plx
	ply
	rtl

;---------------------------------------
printab5_l
	phy
	phx
	php
	sprint	12,yppos
	lda	tpa
	jsl	printb_l
	plp
	plx
	ply
	rtl
	ENDC

;-------------------------------------------------------------------------------
changeviewmode_l

;this code checks for and turns off cockpit mode or isometric view and goes back to normal view
	lda	cockpitmode
	beq	.checkisoview
	bra	.turnoffcock
.checkisoview
	lda	isoviewmode
	beq	.turnoffcock
	bne	.turnoffisoview
	jmp	.nocockpit

.turnoffcock
	stz	cockpitmode	;turn off cockpit mode
	s_jmpNOT_varAND    B,superspeeddelay,#ktest,.nocockpit
;	stz	curr_ship
	stz	shiptemp
.turnoffisoview
	stz	isoviewmode
	jsl	set_playeroutofcock_l
	s_set_var    W,viewdist,#120
	s_set_var    W,outviewdist,#120
	s_set_var    W,outdist,#120	
	s_set_var	W,outvx,#0
	s_set_var	W,outvy,#0
	s_and_var	B,superspeeddelay,#~ktest
	s_and_var	B,superspeeddelay,#~ktest2
	s_and_var	B,superspeeddelay,#~ktest3
	s_and_var	B,superspeeddelay,#~ktest4
	s_and_var	B,superspeeddelay,#~ktest5
	s_and_var	B,crosshairflag,#~crosshairoff
	lda	#255
	sta	crosshairon
	lda	#0
	sta	hudrot+1	; ON
	jsl	checkview_l
	jmp	.ntoinside
;-----now that thats done, here's the rest to go into cockpit mode

.nocockpit				;go into cockpit mode
	s_jmp_varAND    B,superspeeddelay,#ktest,.ntoinside
.changein
	lda	frozen
	lbne	.ntoinside
	s_and_var		B,gameflags,#~gf_nozremove	
	s_set_var	W,outvx,#0
	s_set_var	W,outvy,#0
	s_set_var	B,splayerflymode,#spfm_inside
	lda	#-1
	sta	hudrot+1	; ON
	s_and_var	B,crosshairflag,#~crosshairoff
	s_or_var	B,superspeeddelay,#ktest
	s_and_var	B,superspeeddelay,#~ktest2
	lda	#255
	sta	crosshairon
	s_set_alsflag	x,invisible
	jsl	set_playerintocock_l
	stz	isoviewmode
	jmp		.ntoinside
	
;.nnorm
;	a16
;	lda	curr_ship
;	cmp	#19
;	bmi	.less2
;	s_set_var    W,viewdist,#200
;	s_set_var    W,outviewdist,#200
;	s_set_var    W,outdist,#200
;	bra	.more2
;.less2
;	s_set_var    W,viewdist,#120
;	s_set_var    W,outviewdist,#120
;	s_set_var    W,outdist,#120
;.more2
;	s_set_var	W,outvx,#0
;	s_set_var	W,outvy,#0
;	s_set_var	B,splayerflymode,#spfm_norm
;	lda	#0
;	sta	hudrot+1
;	s_and_var	B,crosshairflag,#~crosshairoff
;	s_and_var		B,gameflags,#~gf_nozremove	
;	s_and_var    B,superspeeddelay,#~ktest
;	s_or_var	B,superspeeddelay,#ktest2
;	lda	#255
;	sta	crosshairon
;	lda	frozen
;	lbne	.ntoinside
;	jsl	set_playeroutofcock_l
;	jmp		.ntoinside

	
;.nnorm4
;	s_set_var	W,viewdist,#300
;	s_set_var	W,outviewdist,#300
;	s_set_var	W,outdist,#300
;	s_set_var	W,outvx,#0
;	s_set_var	W,outvy,#0
;	s_or_var	B,crosshairflag,#crosshairoff
;	s_and_var	B,gameflags,#~gf_nozremove	
;	stz			crosshairon
;	s_and_var	B,superspeeddelay,#~ktest
;	s_and_var	B,superspeeddelay,#~ktest2
;	s_or_var	B,superspeeddelay,#ktest5
;	stz	isoviewmode
;	jmp		.ntoinside
	
;.nnorm5
;	lda	frozen
;	lbne	.nnorm
;	a16
;	lda	cockpitmode
;	bne	.cockpit25
;	lda	curr_ship
;
;	cmp	#19
;	bmi	.less3

;	s_set_var    W,viewdist,#200
;	s_set_var    W,outviewdist,#200
;	s_set_var    W,outdist,#200
;	bra	.more3
;.cockpit25
;	s_set_var    W,viewdist,#30
;	s_set_var    W,outviewdist,#30
;	s_set_var    W,outdist,#30
;	bra	.more3

.less3
;	s_set_var    W,viewdist,#120
;	s_set_var    W,outviewdist,#120
;	s_set_var    W,outdist,#120
.more3
;	s_set_var	W,outvx,#0
;	s_set_var	W,outvy,#0
;	s_and_var	B,crosshairflag,#~crosshairoff
;	s_and_var		B,gameflags,#~gf_nozremove	
;	s_and_var    B,superspeeddelay,#~ktest
;	s_and_var	B,superspeeddelay,#~ktest2
;	s_and_var    B,superspeeddelay,#~ktest3
;	s_and_var    B,superspeeddelay,#~ktest4
;	s_and_var	B,superspeeddelay,#~ktest5
;	stz	isoviewmode
;	lda	#1
;;	sta	cockpitmode
;	lda	#255
;	sta	crosshairon
;	jsl	set_playeroutofcock_l
.ntoinside
	rtl

;-------------------------------------------------------------------------------



;*****************************************************************************
viewfloattab
	dw	0

	dw	1
	dw	2
	dw	3
	dw	4,4
	dw	5,5
	dw	6,6,6
	dw	5,5
	dw	4,4
	dw	3
	dw	2
	dw	1

	dw	0

	dw	-1
	dw	-2
	dw	-3
	dw	-4,-4
	dw	-5,-5
	dw	-6,-6,-6
	dw	-5,-5
	dw	-4,-4
	dw	-3
	dw	-2
	dw	-1

viewfloattab_len	equ	*-viewfloattab



;*****************************************************************************
calcteamdamage_l

	a8
	lda	specialobjtotal
	clc
	adc	spectot
	sta	spectot
	lda	specials_dead
	clc
	adc	spectotdead
	sta	spectotdead
	s_and_var	B,superspeeddelay,#~ktest
	s_and_var	B,superspeeddelay,#~ktest2
	s_and_var	B,superspeeddelay,#~ktest3
	s_and_var	B,superspeeddelay,#~ktest4	
	s_and_var	B,superspeeddelay,#~ktest5	
	a8
	lda	specialobjtotal
	sec
	sbc	specials_dead
	beq	.plok
	asl	a
	sta	tpa
	lda	planetdead
	clc
	adc	tpa
	cmp	#100
	bcc	.plok2
	lda	#100
.plok2	sta	planetdead
.plok
	rtl

	strats_end


;*****************************************************************************
calcbgscroll_l
	phy
	php
	i8
	

	a16
	lda		outvx
	asra
	asra
	asra
	asra
	asra
	asra
	sta	tpa
	asra
	clc
	adc	tpa
	nega

	ldy	nomaxbg2Yscroll
	bne	.nmin

	cmp	#232
	bmi	.nmax
	lda	#232
.nmax

	cmp	#-56
	bpl	.nmin
	lda	#-56
.nmin

	clc
	adc		bg2Yscroll
	and		#511
	sta		bg2scroll
	stz		lastrot

	lda		outvy
	sec
	sbc		player_turnrot
	asra	
	asra	
	asra	
	asra	
	asra
	clc
	adc		bg2Xscroll
	sta.l		m_scrollxoff
	a8

	plp
	ply
	rtl

;---------------------------------------------------
; hud wireframe animation colours

wirehud_cols
	db	8,7,6,5

;---------------------------------------------------

;***************************************************************************
gameoverinit_l

	a8i16
	phx
	lda	#waitmap>>16
	sta	mapbank
	ldx	#waitmap&7fffh
	stx	mapptr
	plx

	jsl	initgame_l
	jsl	playerstart_init_l
	jsl	set_playercred_l

	lda	#0
	sta.l	m_particlesON
	sta.l	m_particlesON+1

	lda	gameflags
	and	#~gf_playerdying
	sta	gameflags

	ldx	playpt
	a8i16
	s_make_obj		#gamesh,.nob
	s_set_strat		y,path_istrat
	s_set_path		y,gameover
	s_set_aldata	y,#255,#0
	s_copy_pos		y,x
	s_set_alvar		W,y,al_worldx,#-270
	s_add_alvar		W,y,al_worldy,#120
	s_add_alvar		W,y,al_worldz,#3400	;800
.nob
	s_make_obj		#oversh,.nober
	s_set_strat		y,path_istrat
	s_set_path		y,gameover
	s_set_aldata	y,#255,#0
	s_copy_pos		y,x
	s_set_alvar		W,y,al_worldx,#270
	s_add_alvar		W,y,al_worldy,#120
	s_add_alvar		W,y,al_worldz,#3400	;800
.nober

	a16
	ldx	#0
.lp	stz	pal0palette,x
	inx
	inx
	cpx	#32*7
	bne	.lp

	txy
	ldx	#0
.lp2	lda.l	gameoverpal,x
	sta.w	pal0palette,y
	iny
	iny
	inx
	inx
	cpx	#32
	bne	.lp2

	lda	#-1
	sta	dotsflag

	lda	#0
	sta.l	m_meters

endgameoverinit
	rtl


	
	
dostrats_l
 	incw	gameframe
	incw	frametemp
	phb
	lda	#$7e
	pha
	plb
	jsl	init_strats_l		;init coll player move, etc.
;	jsl	update_objects_l
;	ldx	allst			;do all strategies
;stratlp	stz	aldead
;	jsl	do_strat_l
;	lda	aldead
;	bne	.killal
;	ldy	_next,x
;.killed	tyx
;	bne	stratlp
;	bra	.cont
;.killal	ldy	_next,x
 ;	jsl	removedeadal_l
	;bra	.killed
.cont	plb
	rtl

	
;-----------------------------------------------------------------



