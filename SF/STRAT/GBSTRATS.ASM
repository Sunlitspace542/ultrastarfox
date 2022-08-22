;***************************************************************************
;*                                                                         *
;*                               Star Fox                                  *
;*                              -----------                                *
;*                                                                         *
;*                           SuperNES version.                             *
;*                                                                         *
;*                                                                         *
;*                           Argonaut Software.      		               *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   File: GBSTRATS.ASM                                                    *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr: GILES' BOSS STRATEGY ROUTINES.                                  *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   Date: 12/2/92                                                         *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;* Author:								                                   *
;*                                                                         *
;*		Giles Goddard.      				                               *
;*                                                                         *
;***************************************************************************
				 
	strats_start

	incpublics	EXT\gbstrats.ext


;*****************************************************************************
dobossrot_srou
	s_set_objtobechild	y,x,svar_byte4
	s_chk_objptr		y,.nr
	s_add_roffs2pos		B,y,x,x,svar_byte1,svar_byte2,svar_byte3,0,1,1,1,1,1
	inc			svar_byte5
.nr
	s_rts

;*****************************************************************************
dobossrotX4_srou
	s_set_objtobechild	y,x,svar_byte4
	s_chk_objptr		y,.nr
	s_add_roffs2pos		B,y,x,x,svar_byte1,svar_byte2,svar_byte3,0,1,1,2,2,2
	inc			svar_byte5
.nr	s_rts


;*****************************************************************************

addyrot2z_srou
	lda			al_roty,x
	bmi			.nyr
	eor			#255
.nyr

	a16
	sexa
	clc
	adc			#64
	asra
	asra
	asra
	asra
	clc
	adc			al_worldz,x
	sta			al_worldz,x
	a8
              	s_rts


;*****************************************************************************
;*****************************************************************************
;*****************************************************************************
; BARRICADER - SPINNING BRA SPACE BOSS WITH NIPPLES.
;	mapobj	0000,0000,space_viewCY+1000,1500,boss_1_2,boss1_Istrat


boss1exp_Istrat
	s_start_strat
	s_add_alvar		B,x,al_rotz,#deg90/32
	s_end_strat

boss1_Istrat
	s_start_strat
	s_set_strat	x,boss1exp_Istrat
	s_push_stratptr	x
	s_set_alptrs	x,boss1up_strat,hitflash_Istrat,bossexplode_Istrat

	s_set_aldata	x,#boss1HP/2,#10
	s_set_bossmaxHP	#boss1HP/2
	s_jmp_iflevel	1,.easy
	s_set_aldata	x,#boss1HP,#10
	s_set_bossmaxHP	#boss1HP
.easy

	s_set_alvar	B,x,al_roty,#deg180
	s_set_colltype	x,enemy1
	s_set_altype	x,gnd
	s_init_colanim	x,#4

	s_set_alsflag	x,relexplode

	trigse		$82
boss1makechild
	
	s_make_childobj	#boss_1_0,#1,boss1cov_Istrat,enemy1

	s_make_childobj	#boss_1_1,#2,boss1turretL_Istrat,enemy1
	s_make_childobj	#boss_1_1,#3,boss1turretL_Istrat,enemy1
	s_make_childobj	#boss_1_1,#4,boss1turretL_Istrat,enemy1
	s_make_childobj	#boss_1_1,#5,boss1turretL_Istrat,enemy1

	s_make_childobj	#boss_1_1,#6,boss1turretR_Istrat,enemy1
	s_make_childobj	#boss_1_1,#7,boss1turretR_Istrat,enemy1
	s_make_childobj	#boss_1_1,#8,boss1turretR_Istrat,enemy1
	s_make_childobj	#boss_1_1,#9,boss1turretR_Istrat,enemy1

	s_set_alsflag		x,colldisable
	s_jsr			boss1rots_srou
	s_set_state		x,0
	s_set_alvar		B,x,al_sbyte3,#1
	s_end_strat


;------------------------------------------------------
boss1up_strat
	s_start_strat

	s_jmp_higher		x,#space_viewCY,boss1normal_init
	s_add_alvar		W,x,al_worldy,#-10
	s_jmp			boss1_end

;------------------------------------------------------
boss1normal_init
	s_set_strat		x,boss1normal_strat
	s_set_alvar		B,x,al_sbyte2,#30
	s_set_alsflag		x,sflag2
boss1normal_strat
	s_start_strat
	s_decbne_alvar		B,x,al_sbyte2,boss1_end

;------------------------------------------------------
boss1in_init
	s_set_strat		x,boss1in_strat
	s_set_alsflag		x,sflag2
boss1in_strat
	s_start_strat
	s_set_objtobeplayer	y
	s_add_alvar		W,x,al_worldz,#-15
	s_jmp_Zdistmore		x,y,#1000,boss1_end

;------------------------------------------------------
boss1out_init
	s_set_strat		x,boss1out_strat
boss1out_strat
	s_start_strat
	s_set_objtobeplayer	y
	s_add_alvar		W,x,al_worldz,#15
	s_jmp_Zdistless		x,y,#1500,boss1_end
	s_set_alsflag		x,sflag2
	s_beqdec_alvar		B,x,al_sbyte3,boss1inclose_init
	s_jmp			boss1normal_init

;------------------------------------------------------
boss1inclose_init
	s_set_alvar		B,x,al_sbyte3,#2
	s_set_strat		x,boss1inclose_strat
	s_clr_alsflag		x,sflag2
boss1inclose_strat
	s_start_strat
	s_set_objtobeplayer	y
	s_add_alvar		W,x,al_worldz,#-25
	s_jmp_Zdistmore		x,y,#300,boss1_end.nofire
	s_jmp			boss1out_init

;------------------------------------------------------
boss1back_init
	s_set_strat		x,boss1back_strat
boss1back_strat
	s_start_strat
	s_weapon_pos		#0,#0,#0
	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#1500,.nzi
	s_add_alvar		W,x,al_worldz,#15
	s_jmp			boss1_end
.nzi
	s_set_objtobechild	y,x,#1	
	s_chk_objptr		y,.covgone
	s_set_strat		y,boss1covdie_strat
	s_remove_child		y,x
	s_clr_alsflag		x,colldisable
	trigse		$85
.covgone

	s_add_colanim		x,#1,#4

	s_add_alvar		B,x,al_rotz,#deg90/32

;	s_jmp_onframe		20,31,.firehp
;	s_jmpNOT_onframe	30,31,.nofire1
	s_jmp_notdelay		6,.nofire1
.firehp
	s_weapon_rndrot		15,15
	s_fire_weapon		x,HPLASMA
	s_set_alvar.w		W,y,al_ptr,playpt

.nofire1	
	s_jmp_NOTdelay		6,.nofire,#15
	s_weapon_rot		#deg45-deg11,#0
	s_fire_weapon		x,HMISSILE1
	s_set_alvar.w		W,y,al_ptr,playpt

	s_jmp_iflevel	1,.nofire
	s_weapon_rot		#-(deg45-deg11),#0
	s_fire_weapon		x,HMISSILE1
	s_set_alvar.w		W,y,al_ptr,playpt

.nofire	s_brl			boss1_fin
	

;------------------------------------------------------

boss1_end

	s_jmp_childalive	#2,.leftTalive
	s_jmp_childalive	#3,.leftTalive
	s_jmp_childalive	#4,.leftTalive
	s_jmp_childalive	#5,.leftTalive
	s_brl			.fire
.leftTalive

	s_jmp_childalive	#6,.nofire
	s_jmp_childalive	#7,.nofire
	s_jmp_childalive	#8,.nofire
	s_jmp_childalive	#9,.nofire

.fire
	s_jmp_iflevel	1,.nofire
	s_jmp_NOTdelay		6,.nofire,#15
	s_set_objtobeplayer	y
	s_weapon_rots2obj	y
	s_weapon_pos		#(-96<<2)>>weapon_scale,#0,#0
	s_fire_weapon		x,HMISSILE1
	s_set_colltype		y,enemy1
	s_set_alvar.w		W,y,al_ptr,playpt

	s_weapon_pos		#(96<<2)>>weapon_scale,#0,#0
	s_fire_weapon		x,HMISSILE1
	s_set_colltype		y,enemy1
	s_set_alvar.w		W,y,al_ptr,playpt

.nofire	local


	s_jmpNOT_alsflag	x,sflag1,.nzr
	s_add_alvar		B,x,al_rotz,#deg90/32
.nzr
	s_jsr			boss1rots_srou
	lda			svar_byte5
	bne			.nallg
	s_set_strat		x,boss1back_strat
.nallg	
boss1_fin	s_add_playerZ	x

	s_add_bossHP	x,al_hp
	s_end_strat




;-----------------------------------------------------------------------------
boss1rots_srou
	s_set_objtobechild	y,x,#1	
	s_copy_alvar2var.w	B,y,svar_byte1,al_sbyte4
	s_add_roffs2pos		B,y,x,x,svar_byte1,#0,#0,0,1,1,1,1,1
	s_add_alvar		W,y,al_worldz,#-300
.nr1
	stz			svar_byte5

;------------------------------------------------------
	s_set_var		B,svar_byte4,#2
	s_set_3vars		B,svar_byte1,svar_byte2,svar_byte3,#(180-70)/2,#0,#90/2
	s_jsr			dobossrot_srou
	s_set_var		B,svar_byte4,#3
	s_set_3vars		B,svar_byte1,svar_byte2,svar_byte3,#(180+70)/2,#0,#90/2
	s_jsr			dobossrot_srou
	s_set_var		B,svar_byte4,#4
	s_set_3vars		B,svar_byte1,svar_byte2,svar_byte3,#180/2,#-50/2,#90/2
	s_jsr			dobossrot_srou
	s_set_var		B,svar_byte4,#5
	s_set_3vars		B,svar_byte1,svar_byte2,svar_byte3,#180/2,#50/2,#90/2
	s_jsr			dobossrot_srou
	s_set_var		B,svar_byte4,#6
	s_set_3vars		B,svar_byte1,svar_byte2,svar_byte3,#(-180-70)/2,#0,#90/2
	s_jsr			dobossrot_srou
	s_set_var		B,svar_byte4,#7
	s_set_3vars		B,svar_byte1,svar_byte2,svar_byte3,#(-180+70)/2,#0,#90/2
	s_jsr			dobossrot_srou
	s_set_var		B,svar_byte4,#8
	s_set_3vars		B,svar_byte1,svar_byte2,svar_byte3,#-180/2,#-50/2,#90/2
	s_jsr			dobossrot_srou
	s_set_var		B,svar_byte4,#9
	s_set_3vars		B,svar_byte1,svar_byte2,svar_byte3,#-180/2,#50/2,#90/2
	s_jsr			dobossrot_srou
;------------------------------------------------------
	s_rts






;*****************************************************************************
boss1turretL_Istrat
	s_start_strat
	s_set_alptrs	x,boss1turretL_strat,boss1turcol_Istrat,explode_Istrat
	s_jmp		boss1turret_init
boss1turretR_Istrat
	s_start_strat
	s_set_alptrs	x,boss1turretR_strat,boss1turcol_Istrat,explode_Istrat

boss1turret_init
	s_set_aldata	x,#boss1turretHP,#boss1turretAP
	s_set_alvar	B,x,al_roty,#deg180
	s_set_colltype	x,enemy1
	s_set_colltype	x,enemyweap
	s_init_colanim		x,#4
	s_set_alsflag		x,nohitaffect
	s_add_bossmaxHP	x,al_hp
	s_end_strat

boss1turretL_strat
	s_start_strat
	s_set_objtobemother	y,x
	s_jmp_alsflag		y,sflag3,boss1turret_nfire
	s_jmp			boss1turretfire_end

boss1turretR_strat
	s_start_strat
	s_set_objtobemother	y,x
	s_jmpNOT_alsflag	y,sflag3,boss1turret_nfire


boss1turretfire_end
	s_jmpNOT_alsflag	y,sflag2,boss1turret_nfire
	s_jmp_alsflag		y,sflag1,boss1turret_nfire

	s_add_colanim		x,#1,#4
	s_clr_alsflag		x,nohitaffect

	phx
	phy
	tyx
	s_set_objtobechild	y,x,#1	
	s_chk_objptr		y,.fire
	s_jmp_alvarLESS.w	B,y,al_sbyte3,#20,.fire
	ply
	plx
	s_brl			boss1turret_end
.fire
	ply
	plx

	phy
	s_weapon_pos		#0,#0,#40>>weapon_scale
	s_jmpNOT_varAND		B,bossflags,#bf_flag1,.normd
	s_jmp_IFdelay	 	4,.home,al1pt
.normd		       
	s_jmp_IFdelay   	5,.norm,al1pt
	s_brl			.endfire
.home
	s_AND_var		B,bossflags,#~bf_flag1
	s_set_objtobeplayer	y
	s_weapon_rots2obj	y
	s_fire_weapon		x,RELSLOWELASER
	s_brl			.endfire
.norm
	s_weapon_rot		#0,#0
	s_fire_weapon		x,RELSLOWELASER

.endfire
	ply
	s_brl			boss1turret_end
boss1turret_nfire
	s_init_colanim		x,#4
	s_set_alsflag	x,nohitaffect

boss1turret_end
	s_copy_alvar2alvar     	B,x,al_rotz,y,al_rotz
	s_add_playerZ	x
	s_add_bossHP	x,al_hp
	s_end_strat


boss1turcol_Istrat
	s_start_strat
	s_jmp_alsflag	x,nohitaffect,defelasercol_Istrat
	s_jmp		hitflash_Istrat

;*****************************************************************************
boss1cov_Istrat
	s_start_strat
	s_set_alptrs	x,boss1cov_strat,defelasercol_Istrat,0
	s_set_aldata	x,#HARDHP,#boss2covAP
	s_set_alvar	B,x,al_roty,#deg180
	s_set_alvar	B,x,al_sbyte2,#33
	s_set_alvar	B,x,al_sbyte3,#10
	s_set_alvar	B,x,al_sbyte4,#((32*4)/2)-12
	s_set_colltype	x,enemy1
	s_end_strat
boss1cov_strat
	s_start_strat

	s_or_var		B,bossflags,#bf_flag1

	s_set_objtobemother	y,x
	s_copy_rots		x,y

	s_clr_alsflag		y,sflag1

	s_decbne_alvar		B,x,al_sbyte2,.ncd
	s_set_alvar		B,x,al_sbyte2,#1
	s_decbne_alvar		B,x,al_sbyte3,.endcov

	trigse		$2f
	s_set_alvar		B,x,al_sbyte2,#32

	s_set_alvar		B,x,al_sbyte3,#30
	s_jmp_ifnotlevel	1,.hard
	s_set_alvar		B,x,al_sbyte3,#50	; easy 
.hard

	s_NOT_alsflag		y,sflag3
.ncd
	s_set_alsflag		y,sflag1
	s_jmp_alsflag		y,sflag3,.sl
	s_add_alvar		B,x,al_sbyte4,#-4
	s_jmp			.endcov
.sl
	s_add_alvar		B,x,al_sbyte4,#4
.endcov


	s_add_playerZ	x
	s_end_strat


boss1covdie_strat
           	s_start_strat
	s_set_objtobeplayer	y
	s_jmp_objinfront	x,y,.nrem
	s_jmp_Zdistmore		x,y,#1000,remove_Istrat
.nrem	s_add_alvar		W,x,al_worldz,#-20
	s_end_strat

	IFNE	prntrouln_on
	printroulen	boss1_Istrat,<Spinning barricader>
	ENDC









;*****************************************************************************
;*****************************************************************************
;*****************************************************************************
; SPINNING TOP
;	mapobj	0000,0000,0<<boss2_scale,1100,boss_2_2,boss2_Istrat


boss2_Istrat
	s_start_strat

;	set_sound1	x,#4

	s_make_childobj	#boss_2_1,#1,boss2top_Istrat,enemy1

	s_make_childobj	#boss_2_5,#2,boss2petal_Istrat,enemy1
	s_set_alvar	B,y,al_sbyte2,#0
	s_make_childobj	#boss_2_5,#3,boss2petal_Istrat,enemy1
	s_set_alvar	B,y,al_sbyte2,#deg90
	s_make_childobj	#boss_2_5,#4,boss2petal_Istrat,enemy1
	s_set_alvar	B,y,al_sbyte2,#deg180
	s_make_childobj	#boss_2_5,#5,boss2petal_Istrat,enemy1
	s_set_alvar	B,y,al_sbyte2,#deg180+deg90

	ifeq	0
	s_make_childobj	#boss_2_0,#7,boss2turret_Istrat,enemy1
	s_set_alvar	B,y,al_sbyte2,#deg45
	s_make_childobj	#boss_2_0,#9,boss2turret_Istrat,enemy1
	s_set_alvar	B,y,al_sbyte2,#deg45+deg90
	s_make_childobj	#boss_2_0,#11,boss2turret_Istrat,enemy1
	s_set_alvar	B,y,al_sbyte2,#deg180+deg45
	s_make_childobj	#boss_2_0,#13,boss2turret_Istrat,enemy1
	s_set_alvar	B,y,al_sbyte2,#deg180+deg90+deg45
	endc


	s_set_alptrs	x,boss2_strat,0,boss2exp_Istrat
	s_set_aldata	x,#hardHP,#10
	s_set_colltype	x,enemy1
	s_set_colltype	x,enemyweap

	s_set_lifecnt	x,#50

	s_set_bossmaxHP		#0

	s_set_alsflag	x,colldisable		; 30/9/92
	s_set_alsflag	x,shadow

	trigse		$95
	s_end_strat


;-----------------------------------------------------------------------------
boss2_strat
	s_start_strat

	s_count_childs		x,svar_byte5

;---------------------------------------------------------------
	s_jmp_ifnotstate	x,0,.ns0

	s_jmp_varMORE		B,svar_byte5,#5+2,.nso
	s_set_alsflag		x,sflag4
	s_add_alvar		B,x,al_roty,#2
	s_jmp_alsflag		x,sflag1,.nsnd1
	trigse		$71
.nsnd1 	s_set_alsflag		x,sflag1
	s_set_alvar		B,x,al_sbyte3,#2
	s_jmp_varNE		B,svar_byte5,#5+1,.nso
	s_add_alvar		B,x,al_roty,#2
.nso

	s_jmp_varEQ		B,svar_byte5,#5,nextstate
	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#1100,.smoke
	s_keeprelto_player	x
	s_add_playerZ		x
	s_brl			.end
.smoke
	jsl		makesmoke_srou_l
	s_set_alvar		W,y,al_shape,#L2smoke
	s_jsl			addrnd2posy_srou
	s_add_alvar		W,y,al_worldz,#-100
	s_add_alvar		W,y,al_worldy,#-35<<boss2_scale

	jsl		makesmoke_srou_l
	s_set_alvar		W,y,al_shape,#L2smoke
	s_jsl			addrnd2posy_srou
	s_add_alvar		W,y,al_worldz,#-100
	s_add_alvar		W,y,al_worldy,#-20<<boss2_scale

	s_brl			.end
.ns0

;---------------------------------------------------------------
	s_jmp_ifnotstate	x,1,.ns1
	trigse			$85
	s_clr_alsflag		x,sflag4
	s_set_vecs		x,#0,#-80,#0
	s_set_alvar		W,x,al_sword2,#0
	s_next_state		x

	s_set_alvar	W,x,al_ptr,#0
	s_make_obj	#nullshape,.badobj
	s_set_strat	y,particlefiredown_Istrat
	s_copy_pos	y,x
	s_set_alvartobeobj	x,al_ptr,y
.badobj

.ns1


;---------------------------------------------------------------
	s_jmp_ifnotstate	x,2,.ns2

	s_set_objtobealvar	y,x,al_ptr
	s_jmp_objptrbad		y,.nptr
	s_copy_pos	y,x
.nptr

	s_jmp_lower		x,#-1000,.low
	s_set_alvar		B,x,al_rotz,#deg180
	s_set_alvar		W,x,al_sword2,#-60<<boss2_scale
	s_achase_alvar		W,x,al_worldx,player_posX,4
	s_set_var		W,svar_word1,player_posz
	s_add_var		W,svar_word1,#200
	s_achase_alvar		W,x,al_worldz,svar_word1,5
.low
	s_add_playerZ		x
	s_add_vecs2pos 		x
	s_copy_alvar2var	W,x,svar_word1,al_sword2
	s_falldown_Yvec		x,2,#2,svar_word1,.fin
	s_jmp_higher		x,svar_word1,.nsnd2
	trigse			$8e
.nsnd2	s_brl			.ns2
.fin
	s_set_objtobealvar	y,x,al_ptr
	s_jmp_objptrbad		y,.nptr2
	s_remove_obj		y
.nptr2
	s_next_state	x
.ns2


;---------------------------------------------------------------
	s_jmp_ifnotstate	x,3,.ns3
	s_add_playerZ		x
	s_achase_alvar		W,x,al_worldx,#0,3
	s_add_alvar		W,x,al_worldz,#30
	s_set_objtobeplayer	y
	s_set_alvar		B,x,al_sbyte4,#25
	s_jmp_Zdistmore		x,y,#1100,nextstate

.ns3
;---------------------------------------------------------------
	s_jmp_ifnotstate	x,4,.ns4

	s_add_playerZ		x


	s_decbne_alvar		B,x,al_sbyte4,.nres
	s_set_alvar		B,x,al_sbyte4,#100
.nres
	s_jmp_alvarMORE		B,x,al_sbyte4,#25,.nfire
	s_jmp_notdelay		1,.stop
	s_weapon_pos		#0,#(-60<<boss2_scale)>>weapon_scale,#0
	s_set_objtobeplayer	y
	s_weapon_rndrots2obj	y,7,7
	s_fire_weapon		x,RELFASTELASER
	s_brl			.stop
.nfire
	s_add_vecs2pos		x
	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#500,.nminz
	s_sub_alvars		W,x,al_worldz,x,al_vz
.nminz

.stop

	s_add_alvar		B,x,al_roty,#2
	s_set_alsflag		x,sflag1
	s_set_alvar		B,x,al_sbyte3,#4
	s_add_alvar		B,x,al_roty,#2

	s_jmp_alsflag		x,sflag3,.nsnd3
	trigse		$71
.nsnd3
	s_set_alsflag		x,sflag3
	s_clr_alsflag		x,colldisable	; 30/9/92
	s_set_alvar2alvartab	B,B,W,x,al_vx,x,al_sbyte2,sintab,-3
	s_set_alvar2alvartab	B,B,W,x,al_vz,x,al_sbyte2,costab,-1
	s_add_alvar		B,x,al_sbyte2,#4

	s_set_objtobechild	y,x,#1
	s_jmp_objptrok		y,.ns4
	s_next_state		x
	s_set_vecs		x,#0,#10,#30
.ns4
;------------------------------------------------------------------ 
	s_jmp_ifnotstate	x,5,.ns5
	s_jmp_ifplayeralive	.dodie
	s_falldown_Yvec		x,1,#1,#-30<<boss2_scale
	s_add_playerZ		x
	s_brl			.ns5
.dodie
	s_boss_dying
	s_falldown_Yvec		x,1,#1,#-30<<boss2_scale,kill_Istrat
	s_jsl			makeLexpobj_srou
	s_set_alsflag		y,nopolyexp
	s_jsl			addrnd2posy_srou
	s_add_alvar		W,y,al_worldy,#15<<boss2_scale
	s_set_alvar		W,y,al_vy,#-20
	s_set_lifecnt		y,#1
	s_add_playerZ		x
	s_add_vecs2pos		x
	s_jmp_NOTdelay		1,.nf
	s_set_alsflag		x,hitflash
.nf

.ns5


	
.end
	s_add_alvar		B,x,al_roty,#2
	s_end_strat

boss2exp_Istrat
	s_start_strat
	s_set_vecs		x,#0,#15<<boss2_scale,#0
	s_jmp			bossbigoutexplodeoff_Istrat

;*****************************************************************************
boss2top_Istrat
	s_start_strat
	s_set_alptrs	x,boss2top_strat,boss2topcol_Istrat,boss2topexp_Istrat
	s_set_aldata	x,#boss2topHP,#boss2topAP
	s_add_bossmaxHP	#boss2topHP
	s_set_colltype	x,enemyweap
	s_set_alsflag		x,colldisable
boss2top_strat
	s_start_strat

	s_set_objtobemother	y,x
	s_copy_pos		x,y
	s_copy_rots		x,y

	s_jmpNOT_alsflag	y,sflag3,.nocol
	s_clr_alsflag		x,colldisable
.nocol


	s_jmp_alvarmore		B,x,al_HP,#16,.npfly	; 16
	s_set_alsflag		y,sflag2
	s_weapon_pos		#0,#((-30-20)*(1<<boss2_scale))>>weapon_scale,#0
	s_jmp_notdelay		3,.npfly
	s_set_objtobeplayer	y
	s_weapon_rots2obj	y
	s_fire_weapon		x,RELSLOWELASERHOME

.npfly	

	s_jmpNOT_alsflag	y,sflag4,.nfire
	s_jmp_NOTdelay		5,.nfire

	s_weapon_rot		#0,#-deg22
	s_jmp_random		.nother
	s_weapon_rot		#0,#deg22
.nother

	s_push_alvar		B,x,al_roty
	s_set_alvar		B,x,al_roty,#0

	s_weapon_pos		#0,#((-30)*(1<<boss2_scale))>>weapon_scale,#0
	s_fire_weapon		x,BOSSHMISSILE2
	s_set_alvar		W,y,al_ptr,playpt
	s_pull_alvar		B,x,al_roty
.nfire


	s_add_bossHP		x,al_hp
	s_end_strat




boss2topcol_Istrat
	s_start_strat
	s_jsl			makeMEDexpobj_srou
	s_add_alvar		W,y,al_worldy,#(60)<<boss2_scale
	s_set_alvar		W,y,al_vy,#-20
	s_jmp			hitflash_Istrat

boss2topexp_Istrat
	s_start_strat
	s_add_alvar		W,x,al_worldy,#(60)<<boss2_scale
	s_jmp			explode_Istrat



;*****************************************************************************
boss2turret_Istrat
	s_start_strat
	s_set_alptrs	x,boss2turret_strat,hitflash_Istrat,boss2turretexp_Istrat
	s_set_aldata	x,#boss2turretHP,#boss2turretAP
	s_add_bossmaxHP	#boss2turretHP
	s_set_colltype	x,enemyweap
	s_set_alsflag	x,shadow
boss2turret_strat
	s_start_strat

	s_set_objtobemother	y,x
	s_copy_pos		x,y
	s_copy_rots		x,y
	s_add_alvars		B,x,al_roty,x,al_sbyte2
	s_jsr		addyrot2z_srou



	s_jmp_alvarne		B,x,al_roty,#deg180,.nfire
.dfire
	s_weapon_pos		#0,#(-26*8)>>weapon_scale,#(36*8)>>weapon_scale
	s_weapon_rot		#0,#0
	s_fire_weapon		x,HPLASMA
	s_set_alsflag		y,sflag1
	s_set_alvar		W,y,al_ptr,playpt
.nfire
	s_add_bossHP		x,al_hp

	s_end_strat

boss2turretexp_Istrat
	s_start_strat
	s_jsl			makeLexpobj_srou
	s_add_roffs2pos		B,y,x,x,#0,#5-30,#35,0,1,0,boss2_scale,boss2_scale,boss2_scale
	s_jmp			remove_Istrat

;*****************************************************************************
boss2petal_Istrat
	s_start_strat
	s_set_alptrs	x,boss2petal_strat,0,boss2petalexp_Istrat
	s_set_aldata	x,#hardHP,#boss2petalAP
	s_set_state	x,#0
	s_set_alvar	B,x,al_sbyte3,#0
	s_or_alvar	B,x,al_collflags,#colltype_enemyweap
	s_set_colltype	x,enemyweap
	s_set_alsflag	x,shadow
boss2petal_strat
	s_start_strat

	s_set_objtobemother	y,x


	s_jmpNOT_alsflag	y,sflag2,.ntopd
	s_jmp_NOTdelay		0,.ntopd,al1pt
	s_kill_obj		x
	s_set_alsflag		x,sflag2
	s_jmp			.endpetal
.ntopd
	s_copy_alvar2var.w	B,y,svar_byte1,al_sbyte3


	s_jmpNOT_alsflag	y,sflag1,.boss2petal_close
.boss2petal_open
	s_jmp_NOTdelay		2,.boss2petal_end
	s_jmp_alvareq		B,x,al_sbyte3,svar_byte1,.boss2petal_end
	s_add_alvar		B,x,al_sbyte3,#2
	s_jmp_alvarne		B,x,al_sbyte3,#4,.boss2petal_chg
	s_jmp			.boss2petal_chg
.boss2petal_close
	s_jmp_NOTdelay		2,.boss2petal_end
	s_jmp_alvareq		B,x,al_sbyte3,#0,.boss2petal_end
	s_sub_alvar		B,x,al_sbyte3,#2

.boss2petal_chg
	s_set_alvar2alvartab	B,W,W,x,al_shape,x,al_sbyte3,boss2petal_tab
.boss2petal_end

	s_copy_pos		x,y
	s_copy_rots		x,y
	s_add_alvars		B,x,al_roty,x,al_sbyte2
	s_jsr			addyrot2z_srou


	s_jmp_NOTalsflag	y,sflag3,.nballg
	s_jmp_alsflag		x,sflag1,.nballg
	s_set_alsflag		x,colldisable
	s_set_alsflag		x,sflag1
	s_make_obj		#rockbeam,.nballg
	s_set_strat		y,boss2plasma_Istrat
	s_set_alvartobeobj	y,al_sword1,x
.nballg



.endpetal
	s_end_strat


boss2petalexp_Istrat
	s_start_strat
;	trigse			se_destructbossfar
	s_set_expstrat		x,boss2petalexp_strat
	s_set_lifecnt		x,#50
	s_end_strat
boss2petalexp_strat
	s_start_strat
	s_add_alvar		B,x,al_rotx,#-4
	s_dec_lifecnt		x
	s_end_strat






boss2petal_tab
	dw	boss_2_5
	dw	boss_2_4
	dw	boss_2_3


;*****************************************************************************
boss2plasma_Istrat
	s_start_strat
	s_set_strat		x,boss2plasma_strat	
	s_set_aldata		x,#hardHP,#8
	s_set_colltype		x,enemy1
	s_set_colltype		x,enemyweap
	s_set_objtobealvar	y,x,al_sword1
	s_copy_alvar2alvar	B,x,al_sbyte1,y,al_roty
	s_set_alvar		B,x,al_roty,#deg180
 	s_sprite_obj		x,#0
	s_copy_alvar2alvar	W,x,al_sword2,y,al_worldy
	s_setnoremove_behind	x
boss2plasma_strat
	s_start_strat

	ifeq	0
	s_set_objtobealvar	y,x,al_sword1
	s_jmp_alsflag		y,sflag2,remove_Istrat
	s_copy_alvar2var	B,x,svar_byte2,al_sbyte2

	s_copy_alvar2alvar	B,x,al_roty,x,al_sbyte1
	s_add_Roffs2pos		B,x,y,x,#0,#0,svar_byte2,0,1,0,2,0,4

	s_set_alvar		B,x,al_roty,#deg180
	s_jmp_alvarMORE		B,x,al_sbyte2,#30,.ns1
	s_add_alvar		B,x,al_sbyte1,#4 	; rotation
.ns1
	s_jmp_alvarMORE		B,x,al_sbyte2,#60,.ns2
	s_add_alvar		B,x,al_sbyte1,#3 	; rotation
.ns2
	s_jmp_alvarMORE		B,x,al_sbyte2,#90,.ns3
	s_add_alvar		B,x,al_sbyte1,#2 	; rotation
.ns3
	s_add_alvar		B,x,al_sbyte1,#1 	; rotation

	s_add_alvar		B,x,al_sbyte2,#1	; distance
	s_jmp_alvarless		B,x,al_sbyte2,#120,.nms
	s_set_alvar		B,x,al_sbyte2,#0	; reset dist.
.nms

	s_copy_alvar2alvar	W,x,al_worldy,x,al_sword2

	s_achase_alvar		W,x,al_sword2,player_posy,2
	endc

	s_end_strat





;*****************************************************************************
boss2spark_Istrat	
	s_start_strat
	s_set_alptrs		x,boss2spark_strat,0,0
	s_set_alsflag		x,colldisable
boss2spark_strat	
	s_start_strat

	s_jmp_NOTdelay		3,.ni
	s_inc_alvar		B,x,al_sbyte1
.ni	
	
	s_jsr			boss2spark_srou	
	s_copy_alvar2alvar.w	B,y,al_count,x,al_sbyte1


	s_jmp_alvarless		B,x,al_sbyte1,#10,.nshoot
	s_jmp_notdelay		1,.nshoot
	s_weapon_pos		#0,#0,#0
	s_set_var2rnd		svar_byte1,#15
	s_sub_var		B,svar_byte1,#7
	s_set_var2rnd		svar_byte2,#15
	s_sub_var		B,svar_byte2,#7
	s_set_objtobeplayer	y
	s_weapon_rots2obj	y,svar_byte1,svar_byte2
	s_fire_weapon		x,RELSLOWELASER
	s_set_alsflag		y,sflag1
.nshoot
	s_jmp_alvarNE		B,x,al_sbyte1,#20,.nreset
	s_set_alvar		B,x,al_sbyte1,#0
.nreset


	s_set_objtobealvar	y,x,al_sword1
	s_jmp_alsflag		y,sflag6,remove_Istrat
	s_copy_pos		x,y
	s_end_strat


;*****************************************************************************

;-----------------------------------------------------------------------------
boss2rots_srou
	stz			svar_byte5

;------------------------------------------------------
	s_set_var		B,svar_byte4,#2
	s_set_3vars		B,svar_byte1,svar_byte2,svar_byte3,#(180-70)/2,#0,#90/2
	s_jsr			doboss2rot_srou
	s_set_var		B,svar_byte4,#3
	s_set_3vars		B,svar_byte1,svar_byte2,svar_byte3,#(180+70)/2,#0,#90/2
	s_jsr			doboss2rot_srou
	s_set_var		B,svar_byte4,#4
	s_set_3vars		B,svar_byte1,svar_byte2,svar_byte3,#180/2,#-50/2,#90/2
	s_jsr			doboss2rot_srou
	s_set_var		B,svar_byte4,#5
	s_set_3vars		B,svar_byte1,svar_byte2,svar_byte3,#180/2,#50/2,#90/2
	s_jsr			doboss2rot_srou

;------------------------------------------------------
	s_rts

;*****************************************************************************
doboss2rot_srou
	s_set_objtobechild	y,x,svar_byte4
	s_chk_objptr		y,.nr
	s_add_roffs2pos		B,y,x,x,svar_byte1,svar_byte2,svar_byte3,0,1,1,3,3,3
	inc			svar_byte5
	s_copy_alvar2alvar	B,y,al_roty,x,al_roty
	s_add_alvar		B,y,al_roty,svar_byte6
.nr	s_rts






;*****************************************************************************
boss2spark_srou
	rts
	s_make_obj		#line2,.badobj
	s_set_strat		y,slspark_Istrat
	s_set_alsflag		y,colldisable
	s_rots_flat		y
	s_copy_pos		y,x

	s_exg_objs		
	s_set_alvar2rnd.l	x,al_rotz
	s_set_speed		x,#20
	s_gen_flatvecs		x,al_rotz,al_vel
	s_exg_objs		
.badobj
	s_rts

	IFNE	prntrouln_on
	printroulen	boss2_Istrat,<Spinning top>
	ENDC

	ifeq	1
;*****************************************************************************
; bar launcher
boss5_Istrat
	s_start_strat
	s_set_alptrs		x,boss5_strat,boss5col_Istrat,bossexplode_Istrat
	s_set_aldata		x,#hardHP,#0
	s_set_alvar		B,x,al_roty,#deg180
	s_set_colltype		x,enemy1


	s_set_alvar		B,x,al_sbyte1,#boss5launchHP
	s_set_alvar		B,x,al_sbyte2,#boss5launchHP
	s_set_alvar		B,x,al_sbyte3,#boss5launchHP
	s_set_alvar		B,x,al_sbyte4,#boss5launchHP
 
	s_make_childobjpos	#boss_5_1l,#0,#-37<<boss5_scale,#0,#0,boss5bar_Istrat,enemy1
	s_set_alvar		B,y,al_rotz,#-deg90

	s_make_childobjpos	#boss_5_1r,#1,#37<<boss5_scale,#0,#0,boss5bar_Istrat,enemy1
	s_set_alvar		B,y,al_rotz,#deg90
	
	s_make_childobjpos	#boss_5_1u,#2,#0,#-37<<boss5_scale,#0,boss5bar_Istrat,enemy1
	
	s_make_childobjpos	#boss_5_1d,#3,#0,#37<<boss5_scale,#0,boss5bar_Istrat,enemy1
	s_set_alvar		B,y,al_rotz,#deg180
	s_end_strat

	
boss5_strat
	s_start_strat

	
;-------------------------------------------------------------
; smoke
	s_jmp_alvarNOTzero	B,x,al_sbyte1,.ns1	; L
	s_jmp_NOTdelay		3,.ns1
	s_jsl			makesmoke_srou_l
	s_add_Roffs2pos.w	B,y,x,x,#-37,#0,#0,0,0,0,boss5_scale,boss5_scale,boss5_scale
.ns1	
	s_jmp_alvarNOTzero	B,x,al_sbyte2,.ns2	; R
	s_jmp_NOTdelay		3,.ns2,#2
	s_jsl			makesmoke_srou_l
	s_add_Roffs2pos.w	B,y,x,x,#37,#0,#0,0,0,0,boss5_scale,boss5_scale,boss5_scale
.ns2

	

	s_jmp_alvarNOTzero	B,x,al_sbyte3,.ns3	; U
	s_jmp_NOTdelay		3,.ns3,#4
	s_jsl			makesmoke_srou_l
	s_add_Roffs2pos.w	B,y,x,x,#0,#-37,#0,0,0,0,boss5_scale,boss5_scale,boss5_scale
.ns3

	s_jmp_alvarNOTzero	B,x,al_sbyte4,.ns4	; D
	s_jmp_NOTdelay		3,.ns4,#6
	s_jsl			makesmoke_srou_l
	s_add_Roffs2pos.w	B,y,x,x,#0,#37,#0,0,0,0,boss5_scale,boss5_scale,boss5_scale
.ns4

;-------------------------------------------------------------


	s_count_childs		x,svar_byte1
	s_jmp_varNOTZERO	B,svar_byte1,.ndead
	s_kill_obj		x
.ndead




	s_copy_alvar2var	B,x,svar_byte1,al_sword2
	s_set_objtobechild	y,x,svar_byte1
	s_chk_objptr		y,.badobj1
	s_jmp_alsflag		y,sflag1,.nse
.badobj1
	s_inc_var		B,svar_byte1
	s_and_var		B,svar_byte1,#3
	s_copy_var2alvar	B,x,al_sword2,svar_byte1
	s_set_objtobechild	y,x,svar_byte1
	s_chk_objptr		y,.nse
	s_set_strat		y,boss5barO_Istrat
.nse


;-------------------------------------------------------------



	s_add_playerZ		x
	s_end_strat
	


boss5col_Istrat
	s_start_strat

	s_jmpNOT_alvarAND	B,x,al_hitflags,#HF1,.nhf1	; L
	s_beqdec_alvar		B,x,al_sbyte1,.noexp
.nhf1
	s_jmpNOT_alvarAND	B,x,al_hitflags,#HF2,.nhf2	; R
	s_beqdec_alvar		B,x,al_sbyte2,.noexp
.nhf2
	s_jmpNOT_alvarAND	B,x,al_hitflags,#HF3,.nhf3	; U
	s_beqdec_alvar		B,x,al_sbyte3,.noexp
.nhf3
	s_jmpNOT_alvarAND	B,x,al_hitflags,#HF4,.nhf4	; D
	s_beqdec_alvar		B,x,al_sbyte4,.noexp
.nhf4
	s_set_alvar		B,x,al_hitflags,#0

	phx
	s_set_objtobealvar	y,x,al_collobjptr
	tyx
	s_jsl			makeMEDexpobj_srou
	plx

	s_jmp			hitflash_Istrat

.noexp
	s_set_alvar		B,x,al_hitflags,#0
	s_jmpto_strat		x


;*****************************************************************************
boss5bar_Istrat
	s_start_strat
	s_set_alptrs		x,boss5bar_strat,0,0
	s_set_aldata		x,#hardHP,#boss5barAP
	s_set_alvar		B,x,al_roty,#deg180
	s_set_colltype		x,enemy1
	s_end_strat
boss5bar_init

	s_clr_alsflag		x,sflag1
	s_set_objtobemother	y,x

	s_jmp_alvarNE		B,x,al_sbyte1,#0,.n1
	s_jmp_alvarZERO.w	B,y,al_sbyte1,boss5barS_init
.n1
	s_jmp_alvarNE		B,x,al_sbyte1,#1,.n2
	s_jmp_alvarZERO.w	B,y,al_sbyte2,boss5barS_init
.n2
	s_jmp_alvarNE		B,x,al_sbyte1,#2,.n3
	s_jmp_alvarZERO.w	B,y,al_sbyte3,boss5barS_init
.n3
	s_jmp_alvarNE		B,x,al_sbyte1,#3,.n4
	s_jmp_alvarZERO.w	B,y,al_sbyte4,boss5barS_init
.n4


	s_set_strat		x,boss5bar_strat
boss5bar_strat
	s_start_strat
boss5bar_cont

	s_add_playerZ	x
	s_end_strat


boss5barO_Istrat
	s_start_strat
	s_set_strat		x,boss5barO_strat
	s_set_alsflag		x,sflag1
boss5barO_strat
	s_start_strat
	s_set_objtobeplayer	y	
	s_jmp_objinfront	y,x,boss5barI_init
	s_add_alvar		W,x,al_worldz,#-50
	s_brl			boss5bar_cont

boss5barI_init
	s_set_strat		x,boss5barI_strat
boss5barI_strat
	s_start_strat
	s_set_objtobemother	y,x	
	s_jmp_Zdistless		x,y,#50,boss5bar_init
	s_add_alvar		W,x,al_worldz,#50
	s_brl			boss5bar_cont

boss5barS_init
	s_set_strat		x,boss5barS_strat
	s_set_objtobemother	y,x
	s_remove_child		x,y
boss5barS_strat
	s_start_strat
	s_add_alvar		W,x,al_worldz,#-20
	s_add_alvar		B,x,al_rotz,#4
	s_add_alvar		B,x,al_rotx,#1
	s_end_strat


	IFNE	prntrouln_on
	printroulen	boss5_Istrat,<Bar launcher>
	ENDC

	strats_end

 	endc
	





