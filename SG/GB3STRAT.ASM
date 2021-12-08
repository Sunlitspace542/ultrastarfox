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
;*   File: GB3STRATS.ASM                                                     *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr: GILES' BOSS STRATEGY ROUTINES.                                       *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   Date: 16/7/92                                                         *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;* Author:								      *
;*                                                                         *
;*		Giles Goddard.      				      *	
;*                                                                         *
;***************************************************************************

	strats_start

	INCPUBLICS	GB3STRATS.EXT

;*****************************************************************************
; WASHING MACHINE MAP BOSS.	
; see washmap.

boss8_Istrat

	s_set_aldata	x,#boss8HP,#hardAP
	s_set_bossmaxHP	#boss8HP
	s_jmp_iflevel	1,.easy
	s_set_aldata	x,#boss8HP*2,#hardAP
	s_set_bossmaxHP	#boss8HP*2
.easy

	s_set_alptrs	x,boss8wait_strat,0,boss8die_Istrat
	s_make_childobj	#boss_8_1c,#1,boss8cov_Istrat,enemy2

	s_make_childobj	#boss_8_5,#2,nucleusbeamL_Istrat,enemy2
	s_set_alvar	W,y,al_worldy,#(-75<<boss8_scale)+nucleusheight
	s_set_alvar	W,y,al_worldz,#boss8_circ
               s_set_alvar	B,y,al_sbyte2,#deg45+deg22

	s_make_childobj	#boss_8_5,#3,nucleusbeamL_Istrat,enemy2
	s_set_alvar	W,y,al_worldy,#(-35<<boss8_scale)+nucleusheight
	s_set_alvar	W,y,al_worldz,#boss8_circ
               s_set_alvar	B,y,al_sbyte2,#deg180+deg22

	s_make_childobj	#boss_8_5,#4,nucleusbeamL_Istrat,enemy2
	s_set_alvar	W,y,al_worldy,#(-75<<boss8_scale)+nucleusheight
	s_set_alvar	W,y,al_worldz,#boss8_circ
            s_set_alvar	B,y,al_sbyte2,#-(deg45+deg22)


	s_set_colltype	x,enemy2
	s_set_colltype	x,enemyweap


	s_set_alvar	B,x,al_sbyte4,#150
	s_clr_alsflag	x,sflag1		; speed up
	s_clr_alsflag		x,sflag2	; switch wait on

	s_set_var	B,gsvar_byte1,#0
	
	s_init_anim	x,#0
	s_brl		boss8_cont	


;-------------------------------------------------------------------
boss8wait_init
	s_set_strat		x,boss8wait_strat
boss8wait_strat
	s_start_strat

	s_set_objtobechild	y,x,#2
	s_jmp_objptrbad	y,.cont1
	s_jmpNOT_alsflag	y,sflag1,.cont
.cont1	s_set_objtobechild	y,x,#3
	s_jmp_objptrbad	y,.cont2
	s_jmpNOT_alsflag	y,sflag1,.cont
.cont2	s_set_objtobechild	y,x,#4
	s_jmp_objptrbad	y,boss8a_init
	s_jmp_alsflag	y,sflag1,boss8a_init
.cont
	s_brl		boss8_cont	
		
;-------------------------------------------------------------------
boss8_init
	s_set_strat	x,boss8_strat
	s_set_alvar	B,x,al_sbyte2,#22
boss8_strat
	s_start_strat
boss8_cont	
;	s_add_playerZ	x

	s_set_alvar	W,x,al_worldz,#210<<boss8_scale
	s_add_alvar	W,x,al_worldz,player_posz

	s_decbne_alvar	B,x,al_sbyte4,.nchg
	s_set_alvar	B,x,al_sbyte4,#150
	s_not_alsflag	x,sflag1
.nchg
	s_jmp_notdelay	3,.donespeed

	s_jmp_alsflag	x,sflag1,.speeddown
	s_jmp_varEQ	B,gsvar_byte1,#5,.donespeed
	s_inc_var	B,gsvar_byte1
	s_brl		.donespeed
.speeddown
	s_jmp_varEQ	B,gsvar_byte1,#-5,.donespeed
	s_dec_var	B,gsvar_byte1
.donespeed


	s_add_bossHP	x,al_hp

	s_end_strat
;-------------------------------------------------------------------
boss8a_init	; open thing.
	s_set_strat	x,boss8a_strat
	s_set_collstrat	x,hitflash_Istrat
	s_set_alvar	B,x,al_sbyte2,#100
	s_init_anim	x,#0
	trigse		$73
boss8a_strat	
	s_start_strat
 
	s_set_alsflag	x,sflag4

	s_jmpNOT_alsflag	x,sflag5,.nanim
	s_add_anim	x,#1,#15,.nanim
.nanim


	s_jmp_onframe		25,31,.firepl
	s_jmpNOT_onframe	30,31,.nfire
.firepl	s_weapon_rot	#0,#deg180
	s_weapon_pos	#0,#0,#0
	s_fire_weapon	x,HPLASMA
	s_set_alvar	W,y,al_ptr,playpt
.nfire
	s_jmp_iflevel	1,boss8_cont
	s_beqdec_alvar	B,x,al_sbyte2,boss8b_init


	s_set_objtobechild	y,x,#2
	s_jmp_objptrbad		y,.bad1
	s_jmpNOT_alsflag	y,sflag1,boss8b_init
.bad1	s_set_objtobechild	y,x,#3
	s_jmp_objptrbad		y,.bad2
	s_jmpNOT_alsflag	y,sflag1,boss8b_init
.bad2	s_set_objtobechild	y,x,#4
	s_jmp_objptrbad		y,.bad3
	s_jmpNOT_alsflag	y,sflag1,boss8b_init
.bad3
	s_brl		boss8_cont	

;-------------------------------------------------------------------
boss8b_init	; close thing.
	s_set_collstrat	x,0
	s_set_strat	x,boss8b_strat
	s_set_alvar	B,x,al_sbyte2,#15

	s_set_objtobechild	y,x,#2
	s_jmp_objptrbad		y,.bad1
	s_clr_alsflag		y,sflag1
.bad1	s_set_objtobechild	y,x,#3
	s_jmp_objptrbad		y,.bad2
	s_clr_alsflag		y,sflag1
.bad2	s_set_objtobechild	y,x,#4
	s_jmp_objptrbad		y,.bad3
	s_clr_alsflag		y,sflag1
.bad3
.nb4

	trigse		$72

boss8b_strat
	s_start_strat

	s_clr_alsflag	x,sflag4
	s_jmp_alsflag	x,sflag5,.nanim
	s_init_anim	x,#0
.nanim


	s_beqdec_alvar	B,x,al_sbyte2,boss8wait_init

	s_brl		boss8_cont	

;--------------------------------------------------------------------------

boss8die_Istrat
	s_start_strat
	s_set_expstrat	x,boss8die_strat
	s_or_var	B,gameflags,#gf_bossdead
	s_set_alvar	B,x,al_sbyte2,#30
	s_playerctrl		off

;	s_set_objtobechild	y,x,#2	; kill switch
;	s_kill_obj		y

	s_or_var	B,gameflags,#gf_stagedone

	s_boss_dying	
	
boss8die_strat
	s_start_strat


	s_set_objtobeplayer	y
	s_achase_alvar.w	W,y,al_worldy,#nucleus_viewCY+20,3
	s_achase_alvar.w	W,y,al_worldx,#0,3

	s_jmp_notdelay	1,.nexp
	s_set_alsflag	x,hitflash
	jsl			makeMEDexpobj_srou
	s_jsl			addrnd2posy_srou
	s_set_alsflag		y,nopolyexp

	s_jmp_notdelay	2,.nsnd
	s_clr_alsflag		y,noexpsnd
.nsnd

	jsl			makeLexpobj_srou
	s_jsl			addrnd2posy_srou
	s_set_alsflag		y,nopolyexp

	s_jmp_notdelay	2,.nsnd1
	s_clr_alsflag		y,noexpsnd
.nsnd1

	s_jmp_notdelay	1,.nexp
	s_make_obj		#Shyper,.nexp
	s_set_alsflag		y,colldisable
	s_set_strat		y,straight_Istrat
	s_set_speed		y,#40
	s_copy_pos		y,x
	s_set_alvar		W,y,al_worldy,viewposy
	s_set_alvar		B,y,al_roty,#deg180
	s_set_alvar2rnd		y,al_rotz
.nexp

	s_decbne_alvar	B,x,al_sbyte2,boss8_cont

	s_make_obj	#nullshape,.badobj
	s_set_strat	y,boss8shrap_Istrat
.badobj	
	s_jmp		bigexplode_Istrat



;*****************************************************************************
boss8cov_Istrat
	s_start_strat
	s_set_alptrs	x,boss8cov_strat,0,explode_Istrat
	s_set_aldata	x,#hardHP,#10
	s_set_objtobemother	y,x
	s_copy_pos		x,y
	s_set_alvar		W,x,al_worldy,#nucleusheight
	s_set_colltype	x,enemyweap
	s_init_anim	x,#0

boss8cov_strat
	s_start_strat

	s_set_objtobemother	y,x
	s_jmp_alsflag		y,sflag4,.open
	s_cmp_anim	x,#0			; close thing.
	s_beq		.ndec		
	s_add_anim	x,#-1,#18
	s_bra		.dinc
.ndec
	s_set_alvar	W,x,al_shape,#BOSS_8_1c
	s_clr_alsflag	y,sflag5     		; closed
	s_bra		.dinc

.open
	s_set_alvar	W,x,al_shape,#BOSS_8_1
	s_cmp_anim	x,#17   		; open thing
	s_beq		.ninc
	s_add_anim	x,#1,#18
	s_bra		.dinc
.ninc
	s_set_alsflag	y,sflag5     		; fully open

.dinc


	s_add_alvar	B,x,al_roty,gsvar_byte1
	s_set_alvar	W,x,al_worldz,#210<<boss8_scale
	s_add_alvar	W,x,al_worldz,player_posz
;	s_add_playerZ	x
	s_end_strat



	ifeq	1

;*****************************************************************************
boss8switch_Istrat
	s_start_strat
	s_set_alptrs	x,boss8switch_strat,boss8switchcol_Istrat,explode_Istrat
	s_set_aldata	x,#hardHP,#10
	s_set_alvar	W,x,al_sword2,#boss8_circ
	s_setnoremove_behind	x
	s_set_alvar	W,x,al_worldy,#(-50<<boss8_scale)+nucleusheight
	s_set_alvar	B,x,al_sbyte2,#deg22
	s_set_colltype		x,enemyweap
boss8switch_strat
	s_start_strat

	s_jsl		nucleuswallrot_srou_l
	s_copy_alvar2alvar	B,x,al_roty,x,al_sbyte2
	s_end_strat


boss8switchcol_Istrat
	s_start_strat
	s_clr_alsflag	x,collide 
	s_set_objtobemother	y,x

	s_jmpNOT_alsflag	y,sflag3,.end	; not enabled

	s_set_alsflag	x,hitflash

	s_not_alsflag	x,sflag1
	s_jmp_alsflag	x,sflag1,.on
	s_set_alvar	W,x,al_shape,#s_0
	s_clr_alsflag	y,sflag2		; wait on
	s_brl		.end	
.on
	s_set_alvar	W,x,al_shape,#s_1
	s_set_alsflag	y,sflag2		; wait off
.done

.end	s_jmpto_strat	x

	endc


;*****************************************************************************
nucleusbeamL_Istrat
	s_start_strat
	s_set_alptrs		x,nucleusbeamL_strat,nucleusbeamcol_Istrat,explode_Istrat
	s_set_aldata		x,#hardHP,#nucleusBeamLAP
	s_set_alvar		W,x,al_sword2,#boss8_circ
	s_setnoremove_behind	x
	s_set_colltype		x,enemyweap
	s_set_alvar		B,x,al_sbyte3,#50	; delay
	s_set_alsflag	x,nohitaffect
	s_end_strat

nucleusbeamL_strat
	s_start_strat


	s_beqdec_alvar		B,x,al_sbyte4,.col
	s_set_alsflag		x,colldisable
	s_bra			.endcol
.col	s_clr_alsflag		x,colldisable
.endcol


	s_jmp_alvarNE		B,x,al_sbyte3,#2,.nsnd
	trigse			$71
.nsnd	s_decbne_alvar		B,x,al_sbyte3,.nfire
	s_set_alvar		B,x,al_sbyte3,#1

	s_clr_alsflag	x,nohitaffect

	s_jmp_varAND		B,gameflags,#gf_bossdead,explode_Istrat
	s_jmp_alsflag		x,sflag1,.nfire
	s_add_colanim		x,#1,#4

	s_jmp_notdelay		2,.fire
	s_make_obj		#sparklas,.nfire
	s_copy_alvar2alvar	B,y,al_sbyte2,x,al_sbyte2
	s_copy_alvar2alvar	W,y,al_sword2,x,al_sword2
	s_set_strat		y,nucleusbeam_Istrat
	s_copy_pos		y,x	
	s_copy_alvar2alvar	B,y,al_roty,x,al_roty
	bra			.fire

.nfire 	s_init_colanim		x,#4
.fire

	s_jsl	nucleuswallrot_srou_l	
	s_copy_alvar2alvar	B,x,al_roty,x,al_sbyte2
	s_add_alvar		B,x,al_roty,#deg180

	s_end_strat


nucleusbeamcol_Istrat
	s_start_strat
	s_clr_alsflag	x,collide
	s_set_alsflag	x,hitflash
	s_not_alsflag	x,sflag1
	s_jmp_alsflag	x,sflag1,.on
.off	trigse		$71			; OFF
	bra		.sc
.on	trigse		$70			; ON
.sc
	s_set_alvar	B,x,al_sbyte4,#10

	s_jmp_iflevel	1,explode_Istrat
	s_jmpto_strat
	


;*****************************************************************************
nucleusbeam_Istrat
	s_start_strat
	s_set_alptrs	x,nucleusbeam_strat,0,0
	s_set_aldata	x,#hardHP,#hardAP
	s_set_colltype		x,laser
	s_set_colltype		x,enemyweap
	s_set_colltype		x,enemy2
	s_setnoremove_behind	x

nucleusbeam_strat
	s_start_strat
	s_jsl			nucleuswallrot2_srou_l	
	s_copy_alvar2alvar	B,x,al_roty,x,al_sbyte2
	s_add_alvar		B,x,al_roty,#deg180
	
	s_sub_alvar		W,x,al_sword2,#50
	s_jmp_alvarless		W,x,al_sword2,#100<<boss8_scale,remove_Istrat
	s_end_strat



;*****************************************************************************
boss8shrap_Istrat
	s_set_alptrs	x,boss8shrap_strat,0,0
	s_set_aldata	x,#hardHP,#hardAP
	s_set_alsflag	x,colldisable
	s_setnoremove_behind	x

	s_set_alvar		B,x,al_sbyte1,#50
boss8shrap_strat
	s_start_strat

	s_set_alvar	W,x,al_worldx,pviewposx
	s_set_alvar	W,x,al_worldy,pviewposy
	s_set_alvar	W,x,al_worldz,pviewposz
	s_add_alvar	W,x,al_worldz,#1000


	s_beqdec_alvar		B,x,al_sbyte1,.folexp
	s_brl			.nfolexp
.folexp
	jsl			makeFOLexpobj_srou
	s_sub_alvar			W,y,al_worldz,#1000
	s_set_alsflag		y,nopolyexp
	s_add_rnd2pos		y,127,127,0


;	jsl			makeFOLexpobj_srou
;	s_set_alsflag		y,nopolyexp
;	s_add_rnd2pos		y,255,255,255,1,1,1
;	jsl			makeFOLexpobj_srou
;	s_set_alsflag		y,nopolyexp
;	s_add_rnd2pos		y,255,255,255,2,2,2
;	s_brl			.nexp
.nfolexp

	s_jmp_notdelay	3,.nshrap
	s_make_obj	#shrap1,.nshrap
	s_set_strat	y,shrapfall_Istrat
.nshrap

	s_jmp_notdelay	1,.nexp
	jsl			makeLexpobj_srou
	s_jsl			addrnd2posxyz2_srou
.nexp



	jsl	random_l
	and	#7
	sta	bg2Xscroll

	jsl	random_l
	and	#3
	clc
	adc	#248
	sta	bg2Yscroll

	s_end_strat


;	printroulen	boss8_Istrat,<Washing machine room>




	
;*****************************************************************************
; TANK BOSS
;	mapobj	0000,0000,0000,375<<bossa_scale,boss_A_2,bossA_Istrat
;	mapobj	0000,5000,0000,375<<bossa_scale,boss_A_2,bossA_Istrat

bossA_Istrat
	s_start_strat
	s_set_aldata	x,#hardHP,#hardAP
	s_set_alptrs	x,bossA_strat,0,bossAexp_Istrat

	s_set_bossmaxHP	#(bossAturrHP*3)+(bossAcupHP*3)


	s_make_childobj	#boss_A_1,#1,bossAturretL_Istrat,enemy2
	s_make_childobj	#boss_A_1,#2,bossAturretM_Istrat,enemy2
	s_make_childobj	#boss_A_1,#3,bossAturretR_Istrat,enemy2

	s_make_childobj	#boss_A_6,#4,bossAcupperL_Istrat,enemy2
	s_make_childobj	#boss_A_6,#5,bossAcupperM_Istrat,enemy2
	s_make_childobj	#boss_A_6,#6,bossAcupperR_Istrat,enemy2


	s_set_colltype	x,enemy2
	s_set_colltype	x,enemyweap

	s_set_alvar	B,x,al_roty,#deg11
;	s_set_alvar	B,x,al_roty,#deg180
	s_set_alvar	W,x,al_vx,#-20

	s_set_alsflag	x,shadow


	trigse		$83
	s_end_strat
;--------------------------------------------------------------------------
bossA_strat
	s_start_strat

	s_jmp_alvarMORE	W,x,al_worldx,#210,.nstop
	s_jmp_alvarZERO	W,x,al_vx,.nstop
	s_inc_alvar	W,x,al_vx
.nstop


	s_jmp_alvarEQ	B,x,al_roty,#deg180,.bossAup_init
	s_jmp_notdelay	1,.ndec
	s_inc_alvar	B,x,al_roty
.ndec

	s_brl		.bossAcont
	

;--------------------------------------------------------------------------
.bossAup_init
	s_set_strat	x,.bossAup_strat
	s_set_alvar	B,x,al_sbyte2,#30
	s_jmp_alsflag		x,sflag3,.nsnd
	trigse		$73
.nsnd
.bossAup_strat
	s_start_strat

	s_beqdec_alvar		B,x,al_sbyte2,.bossAattack_init

	s_set_childstate	#4,#bossAcupUP_state
	s_set_childstate	#5,#bossAcupUP_state
	s_set_childstate	#6,#bossAcupUP_state

	s_brl		.bossAcont


;--------------------------------------------------------------------------
.bossAcover_init
	s_set_strat	x,.bossAcover_strat
	s_set_alvar	B,x,al_sbyte2,#50	; cover time
	s_jmp_alsflag		x,sflag3,.nsnd
	trigse		$72
.nsnd2
.bossAcover_strat
	s_start_strat

	s_beqdec_alvar	B,x,al_sbyte2,.bossAattack_init
					    	
	s_jmp_alvarLESS		B,x,al_sbyte2,#20,.up
	s_set_childstate	#4,#bossAcupDOWN_state
	s_set_childstate	#5,#bossAcupDOWN_state
	s_set_childstate	#6,#bossAcupDOWN_state
	s_brl		.bossAcont
.up
	s_jmp_alvarNE	B,x,al_sbyte2,#19,.nsnd1
	s_jmp_alsflag		x,sflag3,.nsnd
	trigse		$73
.nsnd3
.nsnd1
	s_set_childstate	#4,#bossAcupUP_state
	s_set_childstate	#5,#bossAcupUP_state
	s_set_childstate	#6,#bossAcupUP_state
	s_brl		.bossAcont

;--------------------------------------------------------------------------
.bossAattack_init
	s_set_strat	x,.bossAattack_strat
	s_set_alsflag	x,sflag2		; cup strat finished.
	s_set_alvar	B,x,al_sbyte2,#3	; loop count.
.bossAattack_strat

	s_jmpNOT_alsflag	x,sflag2,.nfin	; finished strat? >no
	s_clr_alsflag		x,sflag2
	s_beqdec_alvar		B,x,al_sbyte2,.bossAcover_init
	lda			#4
.dornd	pha
.rndagain	s_set_var2rnd		svar_byte1,#3
	s_jmp_varEQ		B,svar_byte1,#3,.rndagain
	s_add_var		B,svar_byte1,#4

	s_set_childstate	#4,#bossAcupUP_state
	s_set_childstate	#5,#bossAcupUP_state
	s_set_childstate	#6,#bossAcupUP_state

	s_set_objtobechild	y,x,svar_byte1
	pla
	dec			a
	lbeq			.allcupgone



	lda		#4
.chkcup
	pha
	s_jmp_objptrok		y,.cupok
	s_inc_var		B,svar_byte1
	s_jmp_varlessEQ		B,svar_byte1,#6,.nmaxcupnum
	s_set_var		B,svar_byte1,#4
.nmaxcupnum	s_set_objtobechild	y,x,svar_byte1
	pla
	dec	a
	lbeq	.allcupgone
	s_brl		.chkcup		

.cupok

	pla
	
	phy
	s_set_var		B,svar_byte1,#0
	s_jmp_childalive	#4,.a1
	s_inc_var		B,svar_byte1
.a1
	s_jmp_childalive	#5,.a2
	s_inc_var		B,svar_byte1
.a2
	s_jmp_childalive	#6,.a3
	s_inc_var		B,svar_byte1
.a3
	ply

	s_jmp_varEQ		B,svar_byte1,#2,.lastd
	s_set_state		y,#bossAcupIROTATE_state
	s_brl		.allcupgone
.lastd
	s_set_state		y,#bossAcupGO_state
.allcupgone
.nfin

	

	s_jmp_alvarNE		B,x,al_sbyte3,#3,.nturretsthere
	s_count_childs		x,svar_byte1
	s_jmp_varNE		B,svar_byte1,#3,.ntchg
	s_kill_obj		x
	s_brl			.ntchg
.nturretsthere


	s_jmp_alvarNE		B,x,al_sbyte3,#2,.tchg
.firemissiles
	a8
	lda	stopcounting
	and	#15
	cmp	#9
	lbeq	.donefire
	s_weapon_pos		#0,#(-25<<bossA_scale)>>weapon_scale,#0

	s_jmpNOT_onframe	20,63,.nf1
	s_weapon_rot		#0,#-deg22
	s_fire_weapon		x,STBHMISSILE1
	s_brl			.donefire
.nf1
	s_jmpNOT_onframe	25,63,.nf2
	s_weapon_rot		#0,#0
	s_fire_weapon		x,STBHMISSILE1
	s_brl			.donefire
.nf2
	s_jmpNOT_onframe	30,63,.nf3
	s_weapon_rot		#0,#deg22
	s_fire_weapon		x,STBHMISSILE1
	s_brl			.donefire
.nf3
	s_brl			.ntchg

.donefire
	s_set_alvar		B,y,al_sbyte1,#deg180
	s_set_alvar		B,y,al_sbyte2,#deg22
	s_set_alvar		W,y,al_ptr,playpt
	s_brl			.ntchg


.tchg
	s_jmp_notdelay		5,.ntchg

.again	
	s_copy_alvar2var	B,x,svar_byte1,al_sword2
	s_add_alvar		B,x,al_sword2,#3
	s_cmp_alvar		B,x,al_sword2,#9
	s_bne			.nmax
	s_set_alvar		B,x,al_sword2,#0
.nmax

	s_set_objtobechild	y,x,#1
	s_jmp_objptrbad		y,.bad1
	s_set_alvar2vartab.w	B,B,B,y,al_sbyte3,svar_byte1,bossATY_tab
.bad1
	s_set_objtobechild	y,x,#2
	s_jmp_objptrbad		y,.bad2
	s_set_alvar2vartab.w	B,B,B,y,al_sbyte3,svar_byte1,bossATY_tab+1
.bad2
	s_set_objtobechild	y,x,#3
	s_jmp_objptrbad		y,.bad3
	s_set_alvar2vartab.w	B,B,B,y,al_sbyte3,svar_byte1,bossATY_tab+2

.bad3
.ntchg

.bossAcont

	s_keeprelto_player	x

	s_clr_alsflag		x,sflag3
	s_jmp_childalive	#4,.oka
	s_jmp_childalive	#5,.oka
	s_jmp_childalive	#6,.oka
	s_set_alsflag		x,sflag3
.oka


	s_add_vecs2pos	x
 	s_add_playerZ	x
;	d_print_alvar	B,x,al_sbyte3,1
	s_end_strat


bossATY_tab
	db	0,0,deg180
	db	0,deg180,0
	db	deg180,0,0
	





;-----------------------------------------------------------------------
bossAexp_Istrat
	s_start_strat
	s_boss_dying	
	s_set_alvar		B,x,al_sbyte2,#30
	s_set_expstrat		x,bossAexp_strat
bossAexp_strat
	s_start_strat

	s_beqdec_alvar		B,x,al_sbyte2,bossAexp2_init

	s_jmp_notdelay		1,.nexp
	s_jsl			makeLexpobj_srou
	jsl			random_l
	a16
	sexa
	REPT			bossA_scale
	asl	a
	ENDR	
	clc
	adc.w			al_worldx,y
	sta.w			al_worldx,y

	a8
	jsl			random_l
	a16
	and			#31		
	REPT			bossA_scale
	asl	a
	ENDR	
	nega
	clc
	adc.w			al_worldy,y
	sta.w			al_worldy,y

	a8
.nexp
	s_add_playerZ		x
	
	s_end_strat


bossAexp2_init
	s_set_alvar		W,x,al_shape,#boss_a_3&WM
	s_set_expstrat		x,MbossAexp_Istrat


	s_make_obj		#boss_a_4,.badobj1
	s_copy_pos		y,x
	s_set_strat		y,RbossAexp_Istrat
.badobj1
	s_make_obj		#boss_a_5,.badobj2
	s_copy_pos		y,x
	s_set_strat		y,LbossAexp_Istrat
.badobj2
	s_add_playerZ		x
	s_end_strat	




LbossAexp_Istrat
	s_set_vecs		x,#-10,#0,#20
	s_set_strat		x,LbossAexp_strat
	s_set_alvar		B,x,al_sbyte2,#60
	s_set_alvar		B,x,al_roty,#deg180
LbossAexp_strat
	s_start_strat
	s_add_vecs2pos		x
	s_add_playerZ		x
	s_beqdec_alvar		B,x,al_sbyte2,bigexplode_Istrat
	s_add_alvar		B,x,al_roty,#1
	s_end_strat	

MbossAexp_Istrat
	s_set_vecs		x,#0,#-10,#0
	s_set_expstrat		x,MbossAexp_strat
MbossAexp_strat
	s_start_strat
	s_add_vecs2pos		x
	s_add_playerZ		x
	s_jmp_lower		x,#15<<bossA_scale,bossbigoutexplode_Istrat
	s_add_alvar		W,x,al_vy,#1
	s_end_strat	


RbossAexp_Istrat
	s_set_vecs		x,#10,#0,#20
	s_set_strat		x,RbossAexp_strat
	s_set_alvar		B,x,al_sbyte2,#65
	s_set_alvar		B,x,al_roty,#deg180
RbossAexp_strat
	s_start_strat
	s_add_vecs2pos		x
	s_add_playerZ		x
	s_beqdec_alvar		B,x,al_sbyte2,bigexplode_Istrat
	s_add_alvar		B,x,al_roty,#-1
	s_end_strat	



;-----------------------------------------------------------------------
bossAcupCOVER_state	equ	0
bossAcupUP_state	equ	1
bossAcupGO_state	equ	2
bossAcupRETURN_state	equ	3
bossAcupDOWN_state	equ	4
bossAcupIROTATE_state	equ	5
bossAcupROTATE_state	equ	6


bossAcupperL_Istrat
	s_start_strat
	s_set_alvar		B,x,al_sbyte2,#1
	s_brl			bossAcupper_Icont
bossAcupperM_Istrat
	s_start_strat
	s_set_alvar		B,x,al_sbyte2,#2
	s_brl			bossAcupper_Icont
bossAcupperR_Istrat
	s_start_strat
	s_set_alvar		B,x,al_sbyte2,#3

bossAcupper_Icont
	s_set_alsflag	x,invisible
	s_init_anim		x,#0

	s_set_colltype	x,enemyweap
	s_setnoremove_behind	x
	s_set_alvar		B,x,al_rotx,#-deg90
	s_set_alvar		B,x,al_roty,#deg180


	s_set_alptrs		x,.bossAcupper_strat,hitflash_Istrat,bossAcupexplode_Istrat
	s_set_aldata		x,#bossAcupHP,#bossAap
	s_set_alsflag		x,nohitaffect
	s_set_alsflag		x,shadow

	s_jsr			bossacupinitpos_srou	

	s_end_strat
.bossAcupper_strat	
	s_start_strat

	s_clr_alsflag	x,invisible


;------------------------------
	s_jmp_IFNOTstate	x,bossAcupCOVER_state,.ncover
	s_jsr			bossacupinitpos_srou	
.ncover

;------------------------------
	s_jmp_IFNOTstate	x,bossAcupUP_state,.nup
	s_set_speed		x,#0
	jsr			bossacupopen_srou
	jsr			bossAcupUP_srou
	s_add_alvar		B,x,al_rotz,#20
	s_achase_alvar		B,x,al_rotx,#-deg90,3
	jsr			getbossacupchild_srou
	s_clr_alsflag		y,nohitaffect	

.nup

;------------------------------
	s_jmp_IFNOTstate	x,bossAcupIROTATE_state,.nIrot
	s_set_state		x,#bossAcupROTATE_state
	s_set_alvar		B,x,al_sword2,#40
	s_clr_alsflag		x,nohitaffect
.nIrot
;------------------------------
	s_jmp_IFNOTstate	x,bossAcupROTATE_state,.nrot
	jsr			bossAcupUPlow_srou
	s_achase_alvar		B,x,al_rotx,#0,3
	s_add_alvar		B,x,al_rotz,#28
	s_decbne_alvar	B,x,al_sword2,.nrot
	s_set_objtobemother	y,x
	s_set_alsflag		y,sflag2	; stratdone
	s_set_state		x,#bossAcupUP_state
	s_set_alsflag		x,nohitaffect
.nrot


;------------------------------
	s_jmp_IFNOTstate	x,bossAcupGO_state,.ngo
	s_jmpNOT_alsflag	x,nohitaffect,.nsnd
	trigse		$66
.nsnd	s_clr_alsflag		x,nohitaffect
	s_speedto		x,#45,1
	s_set_objtobeplayer	y
	s_jmp_Zdistless		x,y,#1000,.nch
	s_obj2obj_3dangle	x,y,al_sbyte3,al_sbyte4,3	
.nch	s_achase_alvar		B,x,al_rotx,#0,2
	s_add_alvar		B,x,al_rotz,#28
	s_jmp_objinfront	x,y,.ngo
	s_jmp_Zdistless		x,y,#200,.ngo
	s_set_alvar		W,x,al_worldy,#-100<<bossA_scale
	s_set_state		x,#bossAcupRETURN_state
	s_set_alvar		B,x,al_sword2,#30
.ngo


;------------------------------
	s_jmp_IFNOTstate	x,bossAcupRETURN_state,.nreturn
	s_set_alsflag		x,nohitaffect
	s_set_speed		x,#0
	jsr			bossAcupUP_srou
	s_add_alvar		B,x,al_rotz,#20
	s_achase_alvar		B,x,al_rotx,#-deg90,3

	s_decbne_alvar		B,x,al_sword2,.nreturn
	s_set_objtobemother	y,x
	s_set_alsflag		y,sflag2	; stratdone
	s_set_state		x,#bossAcupUP_state
.nreturn

;------------------------------
	s_jmp_IFNOTstate	x,bossAcupDOWN_state,.ndown
	jsr			bossacupclose_srou
	jsr			bossAcupDOWN_srou
	s_achase_alvar		B,x,al_rotz,#0,3
	s_achase_alvar		B,x,al_rotx,#-deg90,3
.ndown



;------------------------------

	s_add_bossHP	x,al_hp

	s_gen_3dvecs		x,al_sbyte3,al_sbyte4,al_speed
	s_add_vecs2pos		x
	s_add_playerZ		x
	s_end_strat

;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
bossAcupexplode_Istrat
	s_start_strat
	s_set_objtobemother	y,x
	s_set_alsflag		y,sflag2		; strat done
	s_jmp			explode_Istrat	


;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

;-----------------------------------------------------------------------
bossacupfire_srou
	s_set_objtobeplayer	y
      	s_weapon_rots2obj	y
	s_weapon_pos		#0,#(-15<<bossA_scale)>>weapon_scale,#(-10<<bossA_scale)>>weapon_scale
	s_fire_weapon		x,RELSLOWELASERHOME
	rts


;-----------------------------------------------------------------------
bossacupfireMISS_srou
	s_jmp_alsflag		x,sflag3,.nfire
	s_jmp_lower		x,#-(45+45)<<bossA_scale,.nfire
	s_set_alsflag		x,sflag3
	s_weapon_pos		#0,#0,#0
	s_fire_weapon		x,STBHMISSILE1,.nfire
      	s_set_alvar		B,y,al_roty,#deg180
      	s_set_alvar		B,y,al_rotx,#0
	s_set_alvar		B,y,al_sbyte1,#deg180
	s_set_alvar		B,y,al_sbyte2,#deg90
	s_set_alvar		W,y,al_ptr,playpt
.nfire	

	rts

;-----------------------------------------------------------------------
bossAcupUP_srou
	jsr		 	getbossacupchild_srou
       	s_copy_alvar2var.w	W,y,svar_word1,al_worldx
       	s_copy_alvar2var.w	W,y,svar_word2,al_worldy
       	s_copy_alvar2var.w	W,y,svar_word3,al_worldz
	s_achase_alvar		W,x,al_worldx,svar_word1,2
	s_add_var		W,svar_word2,#-110<<bossA_scale
	s_achase_alvar		W,x,al_worldy,svar_word2,3
	s_achase_alvar		W,x,al_worldz,svar_word3,2
	rts

;-----------------------------------------------------------------------
bossAcupUPlow_srou
	jsr		 	getbossacupchild_srou
       	s_copy_alvar2var.w	W,y,svar_word1,al_worldx
       	s_copy_alvar2var.w	W,y,svar_word2,al_worldy
       	s_copy_alvar2var.w	W,y,svar_word3,al_worldz
	s_achase_alvar		W,x,al_worldx,svar_word1,2
	s_add_var		W,svar_word2,#-70<<bossA_scale
	s_achase_alvar		W,x,al_worldy,svar_word2,3
	s_achase_alvar		W,x,al_worldz,svar_word3,2
	rts



;-----------------------------------------------------------------------
bossAcupDOWN_srou
	jsr		 	getbossacupchild_srou
       	s_copy_alvar2var.w	W,y,svar_word1,al_worldx
       	s_copy_alvar2var.w	W,y,svar_word2,al_worldy
       	s_copy_alvar2var.w	W,y,svar_word3,al_worldz
	s_achase_alvar		W,x,al_worldx,svar_word1,2
	s_add_var		W,svar_word2,#-15<<bossA_scale
	s_achase_alvar		W,x,al_worldy,svar_word2,3
	s_achase_alvar		W,x,al_worldz,svar_word3,2

	s_add_var		W,svar_word2,#-5<<bossA_scale
	s_jmp_higher		x,svar_word2,.ndown
	jsr			getbossacupchild_srou
	s_set_alsflag		y,nohitaffect	
	s_set_alvar		B,y,al_hp,#bossAturrHP
	s_jmpNOT_alsflag	y,invisible,.ndown
	s_clr_alsflag		y,invisible
	s_set_objtobemother	y,x
	s_dec_alvar		B,y,al_sbyte3

.ndown
	rts

;-----------------------------------------------------------------------
bossacupopen_srou
	s_cmp_anim		x,#6
	s_beq			.nanim
	s_jmp_notdelay		1,.nanim
	s_add_anim		x,#1,#7
.nanim
	s_rts


;-----------------------------------------------------------------------
bossacupclose_srou
	s_cmp_anim		x,#0
	s_beq			.nanim
	s_jmp_notdelay		1,.nanim
	s_add_anim		x,#-1,#7
	s_bra			.nanim
.nanim
	s_rts


;-----------------------------------------------------------------------
bossacupinitpos_srou	
	s_set_objtobemother	y,x
	s_copy_alvar2alvar	B,x,al_rotz,y,al_roty
	jsr			getbossacupchild_srou
	s_copy_pos		x,y
	s_add_alvar		W,x,al_worldy,#-15<<bossA_scale
	s_add_alvar		W,x,al_worldz,#-2<<bossA_scale
	s_rts	


;-----------------------------------------------------------------------
getbossacupchild_srou
	s_set_objtobemother	y,x
	s_copy_alvar2var	B,x,svar_byte1,al_sbyte2
	phx
	tyx
	s_set_objtobechild	y,x,svar_byte1
	plx
	rts


;-----------------------------------------------------------------------

bossAturretL_Istrat
	s_start_strat
	s_set_strat	x,bossAturretL_strat
	s_brl		bossAturret_Icont
bossAturretL_strat
	s_start_strat
	s_set_var	B,svar_byte1,#-85
	s_set_var	B,svar_byte2,#-50
	s_brl		bossAturret_cont


bossAturretM_Istrat
	s_start_strat
	s_set_strat	x,bossAturretM_strat
	s_set_alvar	B,x,al_sbyte3,#deg180
	s_brl		bossAturret_Icont
bossAturretM_strat
	s_start_strat
	s_set_var	B,svar_byte1,#0
	s_set_var	B,svar_byte2,#-40
	s_brl		bossAturret_cont


bossAturretR_Istrat
	s_start_strat
	s_set_strat	x,bossAturretR_strat

bossAturret_Icont
	s_set_collstrat	x,hitflash_Istrat
	s_set_expstrat	x,bossAturretexp_Istrat
	s_set_aldata	x,#bossAturrHP,#bossAap
	s_set_alvar	B,x,al_sbyte3,#0
	s_set_alvar	B,x,al_sbyte2,#60
	s_set_alsflag	x,colldisable
	s_set_alsflag	x,nohitaffect
	s_set_colltype	x,enemyweap
	s_jmpto_strat	x

bossAturretR_strat
	s_start_strat
	s_set_var	B,svar_byte1,#85
	s_set_var	B,svar_byte2,#-50


bossAturret_cont
	s_set_objtobemother	y,x

	s_jmp_alsflag		x,invisible,.dfire
	s_add_bossHP	x,al_hp
	s_jmp_alsflag		x,nohitaffect,.dfire

	s_jmpnot_objpointnegZ	x,.nfire
	s_set_alsflag		x,colldisable

	s_set_var		B,svar_byte3,#-deg11
	s_jmp_onframe		15,31,.fire
	s_set_var		B,svar_byte3,#deg11
	s_jmpNOT_onframe	30,31,.dfire
.fire
	s_weapon_rot		#0,svar_byte3
	s_weapon_pos		#0,#(-10<<bossA_scale)>>weapon_scale,#0
	phy
	s_fire_weapon		x,HPLASMA
	s_set_alvar		W,y,al_ptr,playpt
	ply
	bra			.dfire
.nfire
	s_clr_alsflag		x,colldisable

.dfire


	s_achase_alvar2alvar	B,x,al_roty,x,al_sbyte3,3

	s_jmp_alvarNE.w		B,y,al_sbyte3,#2,.nturn
	s_decbne_alvar		B,x,al_sbyte2,.nturn
	s_not_alsflag		x,sflag1
	s_jmpNOT_alsflag	x,sflag1,.turn1
	s_set_alvar		B,x,al_sbyte3,#deg180
	s_set_alvar		B,x,al_sbyte2,#60
	s_bra			.nturn
.turn1	
	s_set_alvar		B,x,al_sbyte3,#0
	s_set_alvar		B,x,al_sbyte2,#20
.nturn


	s_add_roffs2pos		B,x,y,y,svar_byte1,svar_byte2,#0,0,1,0,bossA_scale,bossA_scale,bossA_scale
	s_end_strat


bossAturretexp_Istrat
	s_start_strat
	s_set_alsflag		x,invisible
	s_jsl			makeLexpobj_srou
	s_clr_alsflag		y,noexpsnd
	s_set_alvar		B,x,al_hp,#hardHP
	s_set_alsflag		x,colldisable
	s_set_objtobemother	y,x
	s_inc_alvar		B,y,al_sbyte3


	s_end_strat


	;printroulen	bossa_Istrat,<Tank>







;*****************************************************************************


;-------------------------------------------------------------


	;printroulen	bossB_Istrat,<Entity boss>



;*****************************************************************************
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************




;--------------------------------------------------------------------------

	;printroulen	bossBrob_Istrat,<Entity boss II - The Revenge>



;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

;*****************************************************************************
;*****************************************************************************
; DOUBLE LAUNCHER AND HATCH.
;	mapobj	0000,0000,-70<<boss7_scale,-200,boss_7_1,boss7_Istrat

     
boss7_Istrat
	s_start_strat
;	set_sound1	x,#4
	s_set_alptrs	x,boss7a_strat,0,boss7exp_Istrat

	s_jmp_varAND	B,superspeedcnt,#ee23,.hard
	s_jmp_ifnotlevel	4,.nhard1
	bra		.hard
.nhard1
	s_jmp_ifnotlevel	3,.nhard
.hard	
	s_set_aldata	x,#boss7HP*2,#20
	s_set_bossmaxHP	#boss7HP*2
	s_brl		.hpcont
.nhard
	s_set_aldata	x,#boss7HP,#20
	s_set_bossmaxHP	#boss7HP
.hpcont

	s_set_colltype	x,enemy1
	s_setnoremove_behind	x
	s_set_alsflag	x,shadow

	s_make_childobj	#boss_7_0,#1,boss7hatch_Istrat,enemy1	      
	s_nodepthcue	y
	s_make_childobj	#boss_7_2,#2,boss7shield_Istrat,enemy1
	s_nodepthcue	y
	s_make_childobj	#boss_7_3,#3,boss7launcherT_Istrat,enemy1
	s_nodepthcue	y
	s_make_childobj	#boss_7_4,#4,boss7launcherB_Istrat,enemy1
	s_nodepthcue	y

	s_set_speed	x,#20

	s_nodepthcue	x

	trigse		$5b
	s_set_alsflag	x,nohitaffect
 
	s_end_strat

boss7a_strat
	s_start_strat
	

	s_set_objtobeplayer	y
	s_jmp_Zdistless		x,y,#170<<boss7_scale,.close	; 170
	s_jmp_notdelay		2,.nstop
	s_speedto		x,#0,1
.nstop
	s_jmp_alvarEQ		B,x,al_roty,#deg180,.donerot
	s_add_colanim	x,#1,#4
	s_inc_alvar		B,x,al_roty
	s_jmp_alvarNE	B,x,al_roty,#deg90,.donerot
	s_set_alvar		W,x,al_shape,#boss_7_1o
.donerot
	s_jmp_lower		x,#-40<<boss7_scale,boss7b_init
	s_add_alvar		W,x,al_worldy,#2
.close

boss7_cont
	s_keeprelto_player	x

	s_gen_3dvecs	x,al_sbyte2,al_rotx,al_speed
	s_add_vecs2pos	x


;-----------------------------------
; parts check.
	s_set_objtobechild	y,x,#3
	cpy			#0
	bne			.nshdead
	s_set_objtobechild	y,x,#4
	cpy			#0
	bne			.nshdead
	s_set_objtobechild	y,x,#2
	s_chk_objptr		y,.nshdead
	s_kill_obj		y
.nshdead


	s_count_childs		x,svar_byte1
	s_jmp_varZERO		B,svar_byte1,boss7alldead_init


;-----------------------------------

boss7_cont2
	s_add_playerZ	x
	s_add_bossHP	x,al_hp
	s_end_strat

boss7_alldeadcont
	s_gen_3dvecs		x,al_roty,al_rotx,al_speed
	s_add_vecs2pos		x
	s_add_colanim	x,#1,#4
	s_brl		boss7_cont2



;-----------------------------------------------------------------------------
boss7coll_Istrat	
;	s_start_strat
;	
;	s_jmp_alvarmore		B,x,al_hp,#boss7HP/3,hitflash_Istrat
;
;	phx
;	s_set_objtobealvar	y,x,al_collobjptr
;	tyx
;	jsl			makeLexpobj_srou
;	plx
;
	s_jmp			hitflash_Istrat
;-----------------------------------------------------------------------------
boss7exp_Istrat	
	s_set_expstrat		x,boss7exp_strat
	s_set_vecs		x,#0,#-30,#20
	s_set_alvar		B,x,al_sbyte2,#2
	s_set_alvar		B,x,al_sbyte3,#0
	s_boss_dying		
boss7exp_strat	
	s_start_strat
	
	s_jmp_notdelay		1,.nexp
	jsl			makeLexpobj_srou
	s_set_alsflag		y,nopolyexp
	s_jsl			addrnd2posy_srou
.nexp

	
	s_add_alvars		B,x,al_roty,x,al_sbyte3
	s_jmp_alvarMORE		B,x,al_sbyte3,#8,.nradd
	s_jmp_NOTdelay		3,.nradd
	s_inc_alvar		B,x,al_sbyte3
.nradd

	s_jmp_lower		x,#0,boss7reallydead
	s_add_alvar	W,x,al_vy,#1
	s_add_vecs2pos	x
	s_add_playerZ	x
	s_end_strat


	
	s_add_playerZ		x
	s_end_strat

boss7reallydead
	s_jmp	bossbigoutexplode_Istrat



;-----------------------------------------------------------------------------
boss7alldead_init
	s_set_strat		x,boss7alldead_strat
	s_set_collstrat		x,boss7coll_Istrat
	s_set_alvar		W,x,al_shape,#boss_7_1
	trigse			$58
	s_clr_alsflag	x,nohitaffect
boss7alldead_strat
	s_start_strat

	s_achase_alvar		B,x,al_rotz,#0,3

	s_achase_alvar		W,x,al_worldx,player_posx,4


	s_set_objtobeplayer	y
	s_jmp_Zdistless		x,y,#600,boss7alldeada_init
	s_obj2obj_angle		x,y,al_roty,2
	s_speedto		x,#30,1

	s_jmp_lower		x,#-40<<bossB_scale,.ndown
	s_add_alvar		W,x,al_worldy,#10
.ndown
	s_jmp_onframe		25,31,.firepl
	s_jmpNOT_onframe	30,31,.notfire
.firepl	s_weapon_pos		#0,#0,#(40<<boss7_scale)>>weapon_scale
	s_weapon_rot		#0,#0
	s_fire_weapon		x,HPLASMA
	s_set_alvar.w		W,y,al_ptr,playpt
.notfire

	s_brl			boss7_alldeadcont


;-----------------------------------------------------------------------------
boss7alldeada_init
	s_set_strat	x,boss7alldeada_strat
	s_set_alvar	B,x,al_sbyte2,#(deg180+deg22)/4
	s_not_alsflag	x,sflag1
boss7alldeada_strat
	s_start_strat
	
	s_jmp_alsflag		x,sflag1,.sub
	s_add_alvar		B,x,al_rotz,#1
	s_add_alvar		B,x,al_roty,#4
	s_brl			.cont
.sub	s_sub_alvar		B,x,al_rotz,#1
	s_sub_alvar		B,x,al_roty,#4
.cont

	s_beqdec_alvar		B,x,al_sbyte2,boss7alldeadc_init

	s_brl			boss7_alldeadcont


boss7alldeadc_init
	s_set_strat	x,boss7alldeadc_strat
	s_set_alvar	B,x,al_sbyte2,#50
boss7alldeadc_strat
	s_start_strat
	s_speedto		x,#50,1
	s_achase_alvar		B,x,al_rotz,#0,3
	s_beqdec_alvar		B,x,al_sbyte2,boss7alldeadb_init
	s_brl			boss7_alldeadcont


boss7alldeadb_init
	s_set_strat	x,boss7alldeadb_strat
	s_set_alvar	B,x,al_sbyte2,#(deg180+deg22)/4
boss7alldeadb_strat
	s_start_strat
	s_speedto		x,#30,1

	s_jmp_alsflag		x,sflag1,.add
	s_sub_alvar		B,x,al_rotz,#1
	s_sub_alvar		B,x,al_roty,#4
	s_brl			.cont
.add	s_add_alvar		B,x,al_rotz,#1
	s_add_alvar		B,x,al_roty,#4
.cont
	s_beqdec_alvar		B,x,al_sbyte2,boss7alldead_init

	s_brl			boss7_alldeadcont






;-----------------------------------------------------------------------------
boss7b_init	; hatch fire

	s_set_objtobechild	y,x,#1
	s_chk_objptr		y,boss7c2_init	

	s_set_strat		x,boss7b_strat
	s_set_alsflag		x,sflag1
	s_clr_alsflag		x,sflag2
	s_set_alvar		B,x,al_sbyte4,#30

boss7b_strat	
	s_start_strat
	s_achase_alvar		B,x,al_roty,#deg180-deg22,4,.donerot
	s_brl			boss7_cont
.donerot
	s_beqdec_alvar		B,x,al_sbyte4,boss7d_init
	s_brl			boss7_cont

;-----------------------------------------------------------------------------
boss7b2_init	; hide hatch

	s_set_strat		x,boss7b2_strat
	s_clr_alsflag		x,sflag1
	s_set_alvar		B,x,al_sbyte4,#50
boss7b2_strat
	s_start_strat
	s_achase_alvar		B,x,al_roty,#deg180-deg45,4,.donerot
	s_brl			boss7_cont
.donerot
	s_beqdec_alvar		B,x,al_sbyte4,boss7b_init
	s_brl			boss7_cont


;-----------------------------------------------------------------------------
boss7c_init	; launcher fire

	s_set_objtobechild	y,x,#2		; shield gone ?
	s_chk_objptr		y,boss7e_init	; yes


	s_set_strat		x,boss7c_strat
	s_clr_alsflag		x,sflag1
	s_set_alsflag		x,sflag2
	s_set_alvar		B,x,al_sbyte4,#50
boss7c_strat
	s_start_strat
	s_achase_alvar		B,x,al_roty,#deg180+deg22,4,.donerot
	s_brl			boss7launch_cont
.donerot
	s_beqdec_alvar		B,x,al_sbyte4,boss7e_init
	s_brl			boss7launch_cont

;-----------------------------------------------------------------------------
boss7c2_init	; hide launchers

	s_set_strat		x,boss7c2_strat
	s_clr_alsflag		x,sflag2
	s_set_alvar		B,x,al_sbyte4,#15
boss7c2_strat
	s_start_strat
	s_achase_alvar		B,x,al_roty,#deg180+deg45+deg22,4,.donerot
	s_brl			boss7launch_cont
.donerot
	s_beqdec_alvar		B,x,al_sbyte4,boss7c_init
	s_brl			boss7launch_cont


boss7launch_cont

	s_set_objtobechild	y,x,#1		; hatch gone
	cpy			#0
	rlbne			boss7_cont	; no

	s_set_objtobechild	y,x,#4		; bottom launcher gone ?
	cpy			#0
	rlbne			boss7_cont	; no

	s_jmp_lower		x,#-30<<boss7_scale,boss7_cont
	s_add_alvar		W,x,al_worldy,#2

	s_brl			boss7_cont

;-----------------------------------------------------------------------------
boss7d_init	; loop 1

	s_set_strat		x,boss7d_strat
	s_clr_alsflag		x,sflag1
	s_clr_alsflag		x,sflag2
	s_set_alvar		B,x,al_sbyte3,#0
boss7d_strat
	s_start_strat
 
	s_set_var2alvartab	B,B,W,svar_word1,x,al_sbyte3,sintab,-3
	s_set_var2alvartab	B,B,W,svar_word2,x,al_sbyte3,costab,-1

	s_sub_alvar		W,x,al_worldy,svar_word1
	s_sub_alvar		W,x,al_worldz,svar_word2

	s_achase_alvar		B,x,al_roty,#deg180,4
	s_add_alvar		B,x,al_sbyte3,#4
	s_jmp_alvarNE		B,x,al_sbyte3,#192,boss7_cont
	s_brl			boss7c_init
 

;-----------------------------------------------------------------------------
boss7e_init	; loop 2

	s_set_objtobechild	y,x,#1
	s_chk_objptr		y,boss7c2_init

	s_set_strat		x,boss7e_strat
	s_clr_alsflag		x,sflag1
	s_clr_alsflag		x,sflag2
	s_set_alvar		B,x,al_sbyte3,#192
boss7e_strat
	s_start_strat
 
	s_set_var2alvartab	B,B,W,svar_word1,x,al_sbyte3,sintab,-3
	s_set_var2alvartab	B,B,W,svar_word2,x,al_sbyte3,costab,-1

	s_sub_alvar		W,x,al_worldy,svar_word1
	s_sub_alvar		W,x,al_worldz,svar_word2

	s_achase_alvar		B,x,al_roty,#deg180,4
	s_add_alvar		B,x,al_sbyte3,#4
	s_jmp_alvarNE		B,x,al_sbyte3,#0,boss7_cont
	s_brl			boss7b_init

;-----------------------------------------------------------------------------
boss7hatch_Istrat
	s_start_strat
	s_set_alptrs	x,boss7hatch_strat,boss7hatchcol_Istrat,boss7hatchexp_Istrat
	s_jmp_ifnotlevel	4,.nhard12
	bra		.hard12

.nhard12
	s_jmp_ifnotlevel	3,.nhard
.hard12
	s_set_aldata	x,#boss7hatchHP*2,#10
	s_add_bossmaxHP	#boss7hatchHP*2
	s_brl		.hpcont
.nhard	s_set_aldata	x,#boss7hatchHP,#10
	s_add_bossmaxHP	#boss7hatchHP
.hpcont

	s_set_colltype	x,enemy1
	s_setnoremove_behind	x
	s_set_alsflag	x,shadow
	s_init_colanim	x,#0
	s_init_anim	x,#0
	s_set_alsflag	x,invisible

	s_end_strat

boss7hatch_strat
	s_start_strat
	s_clr_alsflag	x,invisible
	s_set_objtobemother	y,x

	s_set_alsflag	x,nohitaffect

	s_jmp_NOTalsflag	y,sflag1,.nflash

	s_clr_alsflag	x,nohitaffect

	s_cmp_anim	x,#0
	s_bne		.nos
	trigse		$5a
.nos

	s_cmp_anim	x,#8
	s_beq		.maxf
	s_add_anim	x,#1,#9
	s_brl		.nfire
.maxf

	s_add_colanim	x,#1,#4

	s_jmp_NOTdelay		5,.nfire
	a8
	lda	stopcounting
	and	#15
	cmp	#9
	beq	.nfire
	s_jsr			boss7hatchfire_srou
	s_sub_alvar		B,y,al_roty,#7
	s_jsr			boss7hatchfire_srou
	s_add_alvar		B,y,al_roty,#14+7
	s_set_objtobemother	y,x
.nfire
	s_brl		.donef
.nflash
	s_init_colanim	x,#4


	s_cmp_anim	x,#8
	s_bne		.ncs
	trigse		$59
.ncs

	s_cmp_anim	x,#0
	s_beq		.minf
	s_add_anim	x,#-1,#9
.minf

.donef
	s_copy_rots		x,y
	s_add_roffs2pos		B,x,y,x,#-20,#0,#0,0,1,0,boss7_scale,boss7_scale,boss7_scale
	s_add_bossHP	x,al_hp
	s_end_strat


boss7hatchfire_srou
	s_make_obj		#zaco_6,.badobj
	s_copy_pos		y,x
	s_copy_rots		y,x
	s_add_roffs2pos		B,y,y,y,#-10,#7,#0,0,1,0,boss7_scale,boss7_scale,boss7_scale
	s_add_alvar		B,y,al_rotx,#3
	s_set_strat		y,zaco2_Istrat
.badobj	s_rts


boss7hatchcol_Istrat
	s_start_strat
	s_set_objtobemother	y,x
	s_jmp_alsflag		y,sflag1,hitflash_Istrat
	s_jmpto_strat		x       

				
boss7hatchexp_Istrat
	s_start_strat
	s_set_alvar		W,x,al_sword2,#-20<<boss7_scale
	s_set_alvar		B,x,al_sbyte2,#deg90	; right
	s_set_alvar		B,x,al_sbyte4,#1
	s_brl			boss7fall

;-----------------------------------------------------------------------------
boss7launcherT_Istrat
	s_start_strat
	s_set_alptrs	x,boss7launcherT_strat,boss7launchercol_Istrat,boss7launcherTexp_Istrat
	s_brl		boss7launcher_Icont
boss7launcherB_Istrat
	s_start_strat
	s_set_alptrs	x,boss7launcherB_strat,boss7launchercol_Istrat,boss7launcherBexp_Istrat

boss7launcher_Icont
	s_set_alsflag	x,invisible
	s_jmp_ifnotlevel	4,.nhard1
	bra		.hard
.nhard1	
	s_jmp_ifnotlevel	3,.nhard
.hard
	s_set_aldata	x,#boss7launcherHP*2,#10
	s_add_bossmaxHP	#boss7launcherHP*2
	s_brl		.hpcont
.nhard	s_set_aldata	x,#boss7launcherHP,#10
	s_add_bossmaxHP	#boss7launcherHP
.hpcont

	s_set_colltype	x,enemy1
	s_setnoremove_behind	x
	s_set_alsflag	x,shadow
	s_init_colanim	x,#0
	s_init_anim	x,#0
	s_end_strat

boss7launcherT_strat
	s_start_strat
	s_set_var	W,svar_word1,#-15		; Y pos
	s_brl		boss7launcher_cont
boss7launcherB_strat
	s_start_strat
	s_set_var	W,svar_word1,#25	; Y pos


boss7launcher_cont
	s_clr_alsflag	x,invisible
	s_set_objtobemother	y,x

	s_set_alsflag	x,nohitaffect

	s_jmp_NOTalsflag	y,sflag2,.nflash
	s_add_colanim	x,#1,#4

	s_clr_alsflag	x,nohitaffect

	s_cmp_anim	x,#0
	s_bne		.nos
	trigse		$5a
.nos

	s_cmp_anim	x,#9
	s_beq		.maxf
	s_add_anim	x,#1,#10
	s_brl		.nfire
.maxf

	s_jmp_NOTdelay		5,.nfire,al1pt
	a8
	lda	stopcounting
	and	#15
	cmp	#9
	beq	.nfire
	s_weapon_pos		#(17<<boss7_scale)>>weapon_scale,#(-5<<boss7_scale)>>weapon_scale,#0
	s_weapon_rot		#0,#0
	phy
	s_fire_weapon		x,HMISSILE1
	s_set_alvar.w		W,y,al_ptr,playpt
	ply
.nfire

	s_brl		.donef
.nflash
	s_init_colanim	x,#4


	s_cmp_anim	x,#9
	s_bne		.ncs
	trigse		$59
.ncs

	s_cmp_anim	x,#0
	s_beq		.minf
	s_add_anim	x,#-1,#10
.minf

.donef


	s_copy_rots		x,y
	s_add_roffs2pos		B,x,y,x,#30,svar_word1,#0,0,1,0,boss7_scale,boss7_scale,boss7_scale
	s_add_bossHP	x,al_hp
	s_end_strat



boss7launchercol_Istrat
	s_start_strat
	s_set_objtobemother	y,x
	s_jmp_NOTalsflag	y,sflag2,.nocoll
	
	s_jmpNOT_alvarAND	B,x,al_hitflags,#HF2,.nocoll
	s_set_alvar		B,x,al_hitflags,#0
	s_jmp			hitflash_Istrat	
.nocoll
	s_set_alvar		B,x,al_hitflags,#0
	s_jmpto_strat		x       
	


boss7launcherTexp_Istrat
	s_start_strat
	s_set_alvar		W,x,al_sword2,#-20<<boss7_scale
	s_set_alvar		B,x,al_sbyte4,#-1
	s_brl			boss7launcherexp_Icont

boss7launcherBexp_Istrat
	s_start_strat
	s_set_alvar		W,x,al_sword2,#-20<<boss7_scale
	s_set_alvar		B,x,al_sbyte4,#0

boss7launcherexp_Icont
	s_set_alvar		B,x,al_sbyte2,#-deg90	; left
	s_brl			boss7fall


;-----------------------------------------------------------------------------
boss7shield_Istrat
	s_start_strat
	s_set_alptrs	x,boss7shield_strat,0,boss7shieldexp_Istrat
	s_set_aldata	x,#hardHP,#10
	s_set_colltype	x,enemy1
	s_setnoremove_behind	x
	s_set_alsflag	x,shadow
	s_set_alsflag	x,invisible
	s_end_strat

boss7shield_strat
	s_start_strat
	s_clr_alsflag	x,invisible
	s_set_objtobemother	y,x
	s_copy_rots		x,y
	s_add_roffs2pos		B,x,y,x,#20,#0,#0,0,1,0,boss7_scale,boss7_scale,boss7_scale
	s_end_strat

boss7shieldexp_Istrat
	s_start_strat		
	s_set_alvar		B,x,al_sbyte2,#10
	s_set_expstrat		x,boss7shieldexp_strat
boss7shieldexp_strat
	s_start_strat
	s_decbne_alvar		B,x,al_sbyte2,boss7shield_strat	
	s_set_alvar		W,x,al_sword2,#-20<<boss7_scale
	s_set_alvar		B,x,al_sbyte2,#-deg90	; left
	s_set_alvar		B,x,al_sbyte4,#-1
	s_brl			boss7fall

;-----------------------------------------------------------------------------
boss7fall
	s_start_strat
	s_set_alsflag	x,colldisable
	s_set_speed	x,#10
	s_add_alvars	B,x,al_sbyte2,x,al_roty
	s_set_alvar	B,x,al_sbyte3,#-deg11
	s_gen_3dvecs	x,al_sbyte2,al_sbyte3,al_speed
	s_set_expstrat	x,boss7fall_strat
	s_clr_alsflag	x,sflag1
	jsl			makeLexpobj_srou
	s_set_alvar	B,x,al_sbyte2,#2

	s_set_objtobemother	y,x
	s_remove_child		x,y

	trigse		$21
	s_end_strat


boss7fall_strat
	s_start_strat
	s_add_alvars		B,x,al_rotz,x,al_sbyte4
	s_copy_alvar2var	W,x,svar_word1,al_sword2
	s_jmp_higher		x,svar_word1,.nbounce

	trigse		$4c
	s_decbeq_alvar		B,x,al_sbyte2,bigexplode_Istrat
	a16
	lda			al_vy,x
	nega
	sta			al_vy,x
	a8
.nbounce
	s_add_alvar	W,x,al_vy,#1
	s_add_vecs2pos	x
	s_add_playerZ	x
	s_add_alvar		W,x,al_worldz,#-30
	s_end_strat



	;printroulen	boss7_Istrat,<2 launchers and hatch>

	strats_end


;*****************************************************************************
;*****************************************************************************
;*****************************************************************************

monolithpart	MACRO
	lda	newgameplus
	bne	.luigi\@
	s_make_obj		#sface2_b,.bad\@
	bra	.doneshape\@
.luigi\@
	s_make_obj		#luigihs,.bad\@	
.doneshape\@
	s_set_strat		y,monolithpart_Istrat
	s_copy_pos		y,x
	s_add_alvar		W,y,al_worldx,#((60<<1)*\1)
	s_add_alvar		W,y,al_worldy,#((100<<1)*\2)
	s_set_alvar		B,y,al_sbyte1,#dcnt
	s_set_alvar		W,y,al_vz,svar_word1
	s_set_alvar		B,y,al_sword2,#\3
dcnt	=	dcnt+3
.bad\@
	ENDM


mpartoutI_state	=	0
mpartoutE_state	=	1
mchgfaceI_state	=	2
mchgface_state		=	3
minitfire_state	=	4
mfire1_state		=	5
msuckI_state		=	6
msuck_state		=	7
msuckstop_state	=	8
mgag1_state		=	9
mgag2_state		=	10
mgag3_state		=	11
mgag4_state		=	12
mblowI_state		=	13
mblow_state		=	14
mIexp1_state		=	15
mexp1_state		=	16
mcore1wait_state	=	17
mimp1_state		=	18

mlion1_state		=	19
mlion2_state		=	20
mlion3_state		=	21

monolith_Istrat
	s_start_strat
	s_set_alptrs	x,monolith_strat,monolithcol_Istrat,monolithexp_Istrat
	s_set_aldata	x,#hardHP,#40
	s_set_alvar	B,x,al_sbyte1,#50
	s_set_colltype		x,enemy1
	s_setnoremove_behind	x
	s_set_alsflag		x,nohitaffect
	s_set_alsflag		x,colldisable
	s_set_state		x,#mpartoutI_state

	s_set_alvar		B,x,al_sbyte1,#18	; left ere
	s_set_alvar		B,x,al_sbyte2,#18	; right ere
	s_jmp_varAND		B,superspeedcnt,#ee23,.nl1
	s_jmp_ifnotlevel	1,.nl1
	s_set_alvar		B,x,al_sbyte1,#16	; left ere
	s_set_alvar		B,x,al_sbyte2,#16	; right ere
.nl1


;	s_set_var		B,whichroute,#3-1

monolith_strat
	s_start_strat

;-------------------------------------------------------------------
	s_jmp_IFNOTstate	x,mpartoutI_state,.npartoutI
	s_set_var	B,bossflags,#0
	s_set_var		W,svar_word1,#200
	s_jsr			monolithpart_srou
	s_set_alsflag		x,invisible
	s_next_state		x
.npartoutI
;-------------------------------------------------------------------
	s_jmp_IFNOTstate	x,mpartoutE_state,.npartoutE
	s_jmpNOT_varAND		B,bossflags,#BF_flag1,.npartoutE
	s_clr_alsflag		x,invisible
	s_set_alvar		W,x,al_worldz,psvar_word1
	s_OR_var		B,bossflags,#BF_flag2
;	s_next_state		x
	s_set_state		x,#mchgfaceI_state
.npartoutE
;-------------------------------------------------------------------
	s_jmp_IFNOTstate	x,mchgfaceI_state,.nchgfaceI
	s_add_alvar		W,x,al_worldz,#-20<<4
	s_add_alvar		W,x,al_worldy,#15<<4
	s_set_alvar		W,x,al_shape,#face_0
	s_init_anim		x,#0
	s_init_COLanim		x,#0
	s_next_state		x
.nchgfaceI
;-------------------------------------------------------------------
	s_jmp_IFNOTstate	x,mchgface_state,.nchgface

	s_cmp_COLanim		x,#9
	s_beq			.maxcol
	s_add_COLanim		x,#1,#10
.maxcol

	s_add_anim		x,#1,#21
	s_cmp_anim		x,#10
	s_bne			.nchgface
	s_next_state		x

	lda	newgameplus
	beq	.noluigi
	s_make_obj		#luigihs,.bad1
	bra	.donelui
.noluigi
	s_make_obj		#androsscube,.bad1
.donelui
	s_copy_pos		y,x
;	s_add_alvar		W,y,al_roty,#deg180
;	s_add_alvar		W,y,al_rotx,#deg180
	s_set_strat		y,mcore1_Istrat
	s_add_alvar		W,y,al_worldy,#-15<<4
	s_set_alvartobeobj	x,al_ptr,y
	s_set_alsflag		y,invisible
	s_set_alsflag		y,colldisable
.bad1
	s_jmp_varAND		B,superspeedcnt,#andr,.lionplease
	bra	.nolion
.lionplease
	s_set_state		x,#mlion1_state
	jmp	.lionst
.nolion
	s_brl			.end
.nchgface


;-------------------------------------------------------------------
	s_jmp_IFNOTstate	x,minitfire_state,.ninitfire
	s_clr_alflag		x,exp
	s_clr_alsflag		x,colldisable
	s_set_alvar		B,x,al_sbyte4,#100
	s_next_state		x
	s_clr_alsflag		x,sflag1
.ninitfire

;-------------------------------------------------------------------
	s_jmp_IFNOTstate	x,mfire1_state,.nfire1
	s_keeprelto_player	x

	s_add_anim		x,#1,#21
	s_cmp_anim		x,#20
	s_bne			.nmaxfr
	s_init_anim		x,#11
.nmaxfr				 

	s_beqdec_alvar		B,x,al_sbyte4,nextstate

	s_set_alvar		B,x,al_sbyte3,#30
	s_jmp_alvarNOTZERO	B,x,al_sbyte1,.nexp
	s_jmp_alvarNOTZERO	B,x,al_sbyte2,.nexp
	s_set_state		x,#mIexp1_state
.nexp

	ifeq	0
	s_jmpNOT_onframe	15,31,.nfire1a
	s_jmp_alvarZERO		B,x,al_sbyte1,.nfire1a
	s_make_obj		#fireface1_b,.nfire1a
	s_copy_pos		y,x
	s_add_alvar		W,y,al_worldx,#-20<<4
	s_add_alvar		W,y,al_worldy,#-30<<4
	s_set_strat		y,mfire1_Istrat
.nfire1a
	s_jmp_alvarZERO		B,x,al_sbyte2,.nfire1
	s_jmpNOT_onframe	20,31,.nfire1
	s_make_obj		#fireface1_b,.nfire1
	s_copy_pos		y,x
	s_add_alvar		W,y,al_worldx,#20<<4
	s_add_alvar		W,y,al_worldy,#-30<<4
	s_set_strat		y,mfire1_Istrat
	endc
.nfire1

;-------------------------------------------------------------------
	s_jmp_IFNOTstate	x,msuckI_state,.nsuckI
	trigse			$9f
	s_set_alvar		B,x,al_sbyte4,#60	; wait time
	s_set_alvar		W,x,al_shape,#face_0_1
	s_init_anim		x,#0
	s_set_alsflag		x,sflag1
	s_next_state		x
.nsuckI


;-------------------------------------------------------------------
	s_jmp_IFNOTstate	x,msuck_state,.nsuck
	s_cmp_anim		x,#4
	s_beq			.ismax
	s_add_anim		x,#1,#18
	s_brl			.nsuck
.ismax	
	
	lda	#2
.mksb	pha
	s_make_obj		#Shyper,.badhyper
	s_set_alvar		W,y,al_worldx,player_posx
	s_set_alvar		W,y,al_worldy,player_posy
	s_set_alvar2rnd		y,al_rotz
	s_add_rnd2pos		y,255,255,255,2,2,2
	s_set_alvar		W,y,al_worldz,viewposz
	s_add_alvar		W,y,al_worldz,#200
	s_set_strat		y,suckbits_Istrat

	s_add_alvar		W,x,al_worldy,#(10<<4)+180+space_viewCY
	s_obj2obj_3dangle.w	y,x,al_roty,al_rotx,0
	s_sub_alvar		W,x,al_worldy,#(10<<4)+180+space_viewCY

.badhyper
	pla
	dec	a
	lbne	.mksb

	s_jmp_alvarLESS		B,x,al_sbyte4,#15,.nsuckcube
	s_jmp_notdelay		2,.nsuckcube
	lda	newgameplus
	beq	.normalplease
	s_make_obj		#luigihs,.nsuckcube
	bra	.made
.normalplease
	s_make_obj		#fireface_b,.nsuckcube
.made
	s_set_alvar		W,y,al_worldx,player_posx
	s_set_alvar		W,y,al_worldy,player_posy
	s_add_rnd2pos		y,255,255,255,2,2,2
	s_set_alvar		W,y,al_worldz,viewposz
	s_add_alvar		W,y,al_worldz,#200
	s_add_alvar		W,y,al_worldy,#-1000
	s_set_strat		y,suckcube_Istrat
.nsuckcube


	s_set_find		0
.loopfindlasers
	s_find_obj		y,x,#0,.nmorelasers
	s_jmpNOT_colltype	y,laser,.loopfindlasers
	s_jmpNOT_colltype	y,friend,.loopfindlasers
	jsr			suckobjfast_srou
	s_set_alsflag		y,colldisable
	s_brl			.loopfindlasers	
.nmorelasers

	s_set_objtobeplayer	y
	jsr			suckobj_srou

      	s_decbne_alvar		B,x,al_sbyte4,.nsuck
	s_next_state		x
	s_set_alvar		B,x,al_Sbyte4,#20
.nsuck


;-------------------------------------------------------------------
	s_jmp_IFNOTstate	x,msuckstop_state,.nsuckstop

	s_add_alvar		W,x,al_worldz,#2000/20

	s_decbne_alvar		B,x,al_sbyte4,.nendsuckstop
	s_set_alvar		W,x,al_sword1,#0
	s_jmp			nextstate
.nendsuckstop
	s_cmp_anim		x,#9
	s_beq			.nsuckstop
	s_add_anim		x,#1,#18
.nsuckstop


;-------------------------------------------------------------------
	s_jmp_IFNOTstate	x,mgag1_state,.ngag1
	s_add_alvars		B,x,al_rotx,x,al_sword1
	s_dec_alvar		B,x,al_sword1
	s_jmp_alvarEQ		B,x,al_sword1,#-3,nextstate
.ngag1

;-------------------------------------------------------------------
	s_jmp_IFNOTstate	x,mgag2_state,.ngag2
	s_add_alvars		B,x,al_rotx,x,al_sword1
	s_inc_alvar		B,x,al_sword1
	s_jmp_alvarEQ		B,x,al_sword1,#3,nextstate
.ngag2

;-------------------------------------------------------------------
	s_jmp_IFNOTstate	x,mgag3_state,.ngag3
	s_add_alvars		B,x,al_rotx,x,al_sword1
	s_dec_alvar		B,x,al_sword1
	s_jmp_alvarEQ		B,x,al_sword1,#-3,nextstate
.ngag3

;-------------------------------------------------------------------
	s_jmp_IFNOTstate	x,mgag4_state,.ngag4
	s_add_alvars		B,x,al_rotx,x,al_sword1
	s_inc_alvar		B,x,al_sword1
	s_jmp_alvarEQ		B,x,al_sword1,#10,nextstate
.ngag4


;-------------------------------------------------------------------
	s_jmp_IFNOTstate	x,mblowI_state,.nblowI
	
	s_sub_alvar		B,x,al_rotx,#2

	s_add_anim		x,#1,#18
	s_cmp_anim		x,#13
	s_bne			.nblowI

	s_set_alvar		B,x,al_sbyte4,#50
	s_next_state		x
	trigse			$99

.nblowI

;-------------------------------------------------------------------
	s_jmp_IFNOTstate	x,mblow_state,.nblow

	s_achase_alvar		B,x,al_rotx,#0,1

	s_set_alvar2rnd		x,al_roty,#7
	s_sub_alvar		B,x,al_roty,#3

	lda	newgameplus
	bne	.luigispit
	s_make_obj		#fireface_b,.badblowcube
	bra	.donespit
.luigispit
	s_make_obj		#luigihs,.badblowcube		;What andross spits out
.donespit
	s_copy_pos		y,x
	s_add_alvar		W,y,al_worldy,#(10<<4)
	s_set_strat		y,blowcube_Istrat		
.badblowcube

      	s_decbne_alvar		B,x,al_sbyte4,.nblow
	s_set_state		x,#minitfire_state
	s_set_alvar		B,x,al_roty,#0
	s_set_alvar		W,x,al_shape,#face_0
.nblow


;-------------------------------------------------------------------
	s_jmp_IFNOTstate	x,mIexp1_state,.nIexp1
	s_jsl			makeLexpobj_srou
	s_set_alsflag		y,nopolyexp
	s_add_alvar		W,y,al_worldy,#-15<<4
	s_jsl			addrnd2posxyz2_srou
	s_jsl			makeLexpobj_srou
	s_set_alsflag		y,nopolyexp
	s_add_alvar		W,y,al_worldy,#-15<<4
	s_jsl			addrnd2posxyz2_srou
	s_decbne_alvar		B,x,al_sbyte3,.nIexp1
	s_jsl			makeFOLexpobj_srou
	s_add_alvar		W,y,al_worldy,#-15<<4
	s_jsl			makeFOLexpobj_srou
	s_add_alvar		W,y,al_worldy,#-15<<4
	s_jsl			addrnd2posy_srou
	s_set_lifecnt		y,#2
	s_jsl			makeFOLexpobj_srou
	s_add_alvar		W,y,al_worldy,#-15<<4
	s_jsl			addrnd2posy_srou
	s_set_lifecnt		y,#4
	s_jsl			makeFOLexpobj_srou
	s_add_alvar		W,y,al_worldy,#-15<<4
	s_jsl			addrnd2posy_srou
	s_set_lifecnt		y,#6


	trigse			$a0

	s_set_objtobealvar	y,x,al_ptr
	s_clr_alsflag		y,invisible
	s_clr_alsflag		y,colldisable
	s_copy_pos		y,x
	s_add_alvar		W,y,al_worldy,#-15<<4
	s_set_state		y,#0

	s_next_state		x
.nIexp1

;-------------------------------------------------------------------
	s_jmp_IFNOTstate	x,mexp1_state,.nexp1
	s_set_alsflag		x,colldisable
	s_set_alflag		x,exp
	s_add_alvar		B,x,al_count,#2
	s_set_alvar		W,x,al_sword1,#60 ;wait time for cube to go back into andross, was 130
	s_jmp_alvarEQ		B,x,al_count,#60,nextstate
.nexp1
;-------------------------------------------------------------------
	s_jmp_IFNOTstate	x,mcore1wait_state,.ncore1wait

	s_set_objtobealvar	y,x,al_ptr
	s_jmp_objptrbad		y,kill_Istrat
	s_jmp_varAND		B,gameflags,#gf_bossdead,kill_Istrat
	s_set_alsflag		x,invisible
	lda	newgameplus
	bne	.ncore1wait
	s_beqdec_alvar		W,x,al_sword1,nextstate		
.ncore1wait
;-------------------------------------------------------------------
	s_jmp_IFNOTstate	x,mimp1_state,.nimp1

	s_set_objtobealvar	y,x,al_ptr
	s_jmp_objptrbad		y,kill_Istrat
	s_set_state		y,#6
	s_clr_alsflag		x,invisible
	s_sub_alvar		B,x,al_count,#2
	s_jmp_alvarNE		B,x,al_count,#0,.nimp1
	s_set_alsflag		y,invisible
	s_set_alsflag		y,colldisable
;	s_or_var	B,crosshairflag,#crosshairoff
	trigse			$87

	s_jmp_iflevel		3,.lionst
	s_jmp_varAND		B,superspeedcnt,#andr,.lionst
	s_jmp_varAND		B,superspeedcnt,#ee23,.lionst
	s_set_state		x,#minitfire_state
	s_set_alvar		B,x,al_sbyte1,#8
	s_set_alvar		B,x,al_sbyte2,#8
	s_brl			.nimp1
.lionst

	s_clr_alflag		x,exp

	s_set_alvar		B,x,al_sbyte1,#10
	s_set_alvar		B,x,al_sbyte2,#10

	s_set_state		x,#mlion3_state
	s_jmp_alvarEQ		W,x,al_shape,#face_1,.nsecondf1
	s_set_state		x,#mlion1_state
	s_set_alvar		B,x,al_sbyte1,#20
	s_set_alvar		B,x,al_sbyte2,#20

.nsecondf1

.nimp1
;-------------------------------------------------------------------
	s_jmp_IFNOTstate	x,mlion1_state,.nlion1
	s_cmp_COLanim		x,#0
	s_beq			.minlion1c
	s_add_COLanim		x,#-1,#10
.minlion1c
	s_add_anim		x,#-1,#21
	s_cmp_anim		x,#0
	s_bne			.nlion1
	s_next_state		x
	s_brl			.end
.nlion1

;-------------------------------------------------------------------
	s_jmp_IFNOTstate	x,mlion2_state,.nlion2
	s_set_alvar		W,x,al_shape,#face_1
	s_cmp_COLanim		x,#9
	s_beq			.minlion2c
	s_add_COLanim		x,#1,#10
.minlion2c
	s_add_anim		x,#1,#21
	s_cmp_anim		x,#10
	s_bne			.nlion2
	s_next_state		x
	s_brl			.end
.nlion2


;-------------------------------------------------------------------
	s_jmp_IFNOTstate	x,mlion3_state,.nlion3
	s_keeprelto_player	x

	ifeq	0
	s_jmpNOT_onframe	15,31,.nfirel3a
	s_jmp_alvarZERO		B,x,al_sbyte1,.nfirel3a
	s_set_objtobeplayer	y
	s_weapon_pos		#(-15<<4)>>weapon_scale,#(-15<<4)>>weapon_scale,#0
	s_weapon_rots2obj	y
	s_fire_weapon		x,HPLASMA
	s_set_alvar		W,y,al_ptr,playpt
.nfirel3a
	s_jmp_alvarZERO		B,x,al_sbyte2,.nfirel3
	s_jmpNOT_onframe	20,31,.nfirel3
	s_set_objtobeplayer	y
	s_weapon_pos		#(15<<4)>>weapon_scale,#(-15<<4)>>weapon_scale,#0
	s_weapon_rots2obj	y
	s_fire_weapon		x,HPLASMA
	s_set_alvar		W,y,al_ptr,playpt
	endc
.nfirel3

	s_jmp_notdelay		1,.nl3ff
	s_make_obj		#fireface_b,.nl3ff
	s_copy_pos		y,x
	s_add_alvar		W,y,al_worldy,#10<<4 
	s_set_strat		y,blowcube_Istrat		
.nl3ff


	s_add_anim		x,#1,#21
	s_cmp_anim		x,#20
	s_bne			.nmaxfrl3
	s_init_anim		x,#11
.nmaxfrl3

	s_clr_alsflag		x,colldisable
	s_clr_alsflag		x,sflag1

	s_set_alvar		B,x,al_sbyte3,#30
	s_jmp_alvarNOTZERO	B,x,al_sbyte1,.nexpl3
	s_jmp_alvarNOTZERO	B,x,al_sbyte2,.nexpl3
	s_set_state		x,#mIexp1_state
.nexpl3

.nlion3






;-------------------------------------------------------------------
.end
	s_jmp_ifstate		x,mpartoutI_state,.nflash
	s_jmp_ifstate		x,mpartoutE_state,.nflash
	s_jmp_ifstate		x,mchgfaceI_state,.nflash
	s_jmp_ifstate		x,mchgface_state,.nflash
	s_jmp_ifstate		x,mlion1_state,.nflash
	s_jmp_ifstate		x,mlion2_state,.nflash


	s_jmp_alvarNOTZERO	B,x,al_sbyte1,.nleftdead
	s_jmp_alsflag		x,sflag1,.leftdeadred
	s_jmp_alvarZERO		B,x,al_sbyte2,.botheyesdead
	s_add_COLanim		x,#1,#21
	s_cmp_COLanim		x,#14
	s_bmi			.nflash
	s_init_COLanim		x,#12
	s_brl			.nflash
.leftdeadred
	s_init_COLanim		x,#17
           	s_brl			.nflash
.nleftdead

	s_jmp_alvarNOTZERO	B,x,al_sbyte2,.neitherdead
	s_jmp_alsflag		x,sflag1,.rightdeadred
	s_add_COLanim		x,#1,#21
	s_cmp_COLanim		x,#16
	s_bmi			.nflash
	s_init_COLanim		x,#14
	s_brl			.nflash
.rightdeadred
	s_init_COLanim		x,#18
           	s_brl			.nflash
.neitherdead
	s_jmp_alsflag		x,sflag1,.redeyes

	s_add_COLanim		x,#1,#21
	s_cmp_COLanim		x,#12
	s_bmi			.nflash
	s_init_COLanim		x,#10
	s_brl			.nflash

.botheyesdead
	s_init_COLanim		x,#16
	s_brl			.nflash

.redeyes
	s_init_COLanim		x,#19

.nflash

	s_add_vecs2pos		x
	s_add_playerZ		x
	s_end_strat



suckobj_srou
	s_achase_alvar		W,y,al_worldx,#0,4
	s_achase_alvar		W,y,al_worldy,#(10<<4)+180+space_viewCY,4
	s_achase_alvar2alvar	W,y,al_worldz,x,al_worldz,5
	rts


suckobjfast_srou
	s_zero_vecs.w		y
	s_achase_alvar		W,y,al_worldx,#0,4
	s_achase_alvar		W,y,al_worldy,#(10<<4)+180+space_viewCY,4
	s_add_alvar		W,y,al_worldz,#50
	s_add_playerZ		y
;	s_achase_alvar2alvar	W,y,al_worldz,x,al_worldz,5
	rts

;*****************************************************************************
suckcube_Istrat
	s_start_strat
	s_set_lifecnt		x,#20
	s_setnoremove_behind	x
	s_set_strat		x,suckcube_strat
	s_set_alsflag		x,colldisable
suckcube_strat
	s_start_strat
	s_add_alvar		B,x,al_rotx,#12
	s_brl			suckbits_cont



suckbits_Istrat
	s_start_strat
	s_set_lifecnt		x,#6
	s_setnoremove_behind	x
	s_set_strat		x,suckbits_strat
	s_set_alsflag		x,colldisable
suckbits_strat
	s_start_strat
suckbits_cont
	s_add_alvar		W,x,al_worldz,#60
	s_achase_alvar		W,x,al_worldx,#0,2
	s_achase_alvar		W,x,al_worldy,#(10<<4)+180+space_viewCY,2
	s_add_playerZ		x
	s_dec_lifecnt		x
	s_end_strat

blowcube_Istrat		
	s_start_strat
	s_set_strat		x,blowcube_strat
	s_set_aldata		x,#hardHP,#4
	s_set_objtobeplayer	y
	s_set_var2rnd		svar_byte1,#15
	s_sub_var		B,svar_byte1,#7
	s_set_var2rnd		svar_byte2,#15
	s_sub_var		B,svar_byte2,#7
	s_obj2obj_3DangleOFF 	x,y,al_roty,svar_byte1,al_rotx,svar_byte2,0
	s_set_speed		x,#80
	s_gen_3dvecs		x,al_roty,al_rotx,al_speed
	
	s_set_alvar2rnd		x,al_roty
	s_set_alvar2rnd		x,al_rotx
	
	s_set_colltype		x,enemyweap
blowcube_strat
	s_start_strat
	s_add_alvar		B,x,al_roty,#4	
	s_add_alvar		B,x,al_rotx,#8	
	s_add_vecs2pos		x
	s_add_playerZ		x
	s_end_strat

fire_bonfire_l
	jsr	fire_bonfire
	rtl

fire_bonfire
	s_make_obj	#fireball,.ng
	s_copy_pos	y,x
	s_set_alvar	W,y,al_worldy,#0
	s_set_strat	y,bonfire_istrat
	s_set_alvar	B,y,al_sbyte1,#0
	s_set_colltype	y,ENEMY1
	s_set_colltype	y,ENEMY2
	s_set_colltype	y,ENEMYWEAP	
	trigse		$99
	phx
	tyx
	s_set_objtobeplayer	y
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,0
	plx
.ng
	rts
	
bonfire_istrat
	s_start_strat
	s_set_alptrs	x,.strat,hitflash_istrat,explode_istrat
	s_set_alsflag	x,nohitaffect
	s_set_aldata	x,#hardHP,#hardAP
	s_set_coltab	x,#bonfire_c
	s_sprite_obj	x,#0
	s_set_alvar	B,x,al_speed,#120
	s_gen_3dvecs	x,al_roty,al_rotx,al_speed
.strat	s_start_strat
	s_make_obj	#fireball,.ng
	s_copy_pos	y,x
	s_set_strat	y,.dummdumm_strat
	s_set_alsflag	y,colldisable
.ng
	s_add_vecs2pos	x
	s_cmp_alvar	B,x,al_sbyte1,#10
	beq		.rem
	s_inc_alvar	B,x,al_sbyte1
	s_add_playerz	x
	s_end_strat
.rem	s_remove_obj	x
	s_end_strat

.dummdumm_strat
	s_start_strat
	s_set_colltype	x,ENEMY1
	s_set_colltype	x,ENEMY2
	s_set_colltype	x,ENEMYWEAP
	s_set_coltab	x,#bonfire_c
	s_sprite_obj	x,#1
	s_cmp_alvar	B,x,al_sbyte1,#10
	beq		.rem
	s_inc_alvar	B,x,al_sbyte1
	s_add_playerz	x
	s_end_strat
.rem	s_remove_obj	x
	s_end_strat
	
;*****************************************************************************
mcore1_Istrat
	s_start_strat
	s_set_alptrs	x,mcore1_strat,mcore1col_Istrat,mcore1exp_Istrat
	s_set_colltype	x,ENEMY1
	s_set_colltype	x,ENEMY2
	s_set_colltype	x,ENEMYWEAP
	s_jmp_varAND	B,superspeedcnt,#ee23,.jmptwice
	s_jmp_ifnotlevel	1,.nlhp1
	s_set_aldata	x,#30,#40
.nlhp1
	s_jmp_ifnotlevel	2,.nlhp2
	s_set_aldata	x,#50,#40
.nlhp2
	s_jmp_ifnotlevel	3,.nlhp3
	s_set_aldata	x,#100,#40
.nlhp3
	s_jmp_varAND		B,superspeedcnt,#andr,.jmptwice
	s_set_aldata	x,#30,#40
	bra				.nlhp4
.jmptwice
	s_set_aldata	x,#120,#40
.nlhp4

	s_jmp_varAND	B,superspeedcnt,#ee23,.jmpforme
	s_jmp_iflevel		1,.is11
	s_jmp_iflevel		4,.dostuff
	bra			.jmpforme
.dostuff
	s_jmp_varAND		B,superspeedcnt,#andr,.jmpforme
	bra			.is11
.jmpforme
	lda	newgameplus
	bne	.doluigithx
	s_set_alvar		W,x,al_shape,#face_box
	s_init_colanim		x,#0
	bra	.is11
.doluigithx
	s_set_alvar		W,x,al_shape,#luigihs	
.is11
	lda	newgameplus
	beq	.normrot
	s_set_alvar		B,x,al_roty,#-deg90
	bra	.donerot
.normrot
	s_set_alvar		B,x,al_rotx,#deg180
	s_set_alvar		B,x,al_roty,#-deg45
	s_set_alvar		B,x,al_rotz,#0
.donerot
	s_clr_alsflag		x,nohitaffect
	s_set_alsflag	x,relexplode
mcore1_strat
	s_start_strat
	s_jmp_varAND	B,superspeedcnt,#ee23,.jmpthird
	s_jmp_iflevel		1,.is11
	s_jmp_iflevel		4,.dostuff2
	bra			.jmpthird
.dostuff2
	s_jmp_varAND		B,superspeedcnt,#andr,.jmpthird
	bra					.is11
.jmpthird
	s_init_colanim		x,#0
	s_jmp_alvarMORE		B,x,al_hp,#60,.is11
	s_init_colanim		x,#1
	s_jmp_alvarMORE		B,x,al_hp,#30,.is11
	s_init_colanim		x,#2
.is11

	s_jmp_alsflag	x,invisible,.nowt

	s_set_objtobeplayer	y

;-----------------------------------------------
	s_jmp_ifnotstate	x,0,.nswait1

	lda	newgameplus
	bne	.waitlonger
	s_set_alvar	B,x,al_sbyte1,#20
	bra	.donewaiting
.waitlonger
	s_set_alvar	B,x,al_sbyte1,#40
.donewaiting
	s_next_state		x
.nswait1

;-----------------------------------------------
	s_jmp_ifnotstate	x,1,.nswait2
;	lda	newgameplus
;	beq	.nobonfire
;	jsr		fire_bonfire
;.nobonfire
	s_beqdec_alvar	B,x,al_sbyte1,nextstate
.nswait2


;-----------------------------------------------
	s_jmp_ifnotstate	x,2,.nszoomup1
;	lda	newgameplus
;	beq	.nozero
;	s_set_state		x,#0
;	jmp	.nszoomup1
;.nozero
	s_set_alsflag		x,nohitaffect
;	s_add_alvar		B,x,al_roty,#2
;	s_add_alvar		B,x,al_rotx,#4
	s_add_alvar		B,x,al_sbyte2,#8
	s_set_alvar2alvartab	B,B,W,x,al_vx,x,al_sbyte2,sintab,-1
	s_set_alvar2alvartab	B,B,W,x,al_vy,x,al_sbyte2,costab,-1
	lda	newgameplus
	beq	.nobonfire2
	jsr		fire_bonfire
.nobonfire2
	s_jmp_Zdistless		x,y,#1500,nextstate
	jsr		mcoreZrot_srou
	s_jmp_alvarEQ	W,x,al_vz,#-80,.nszoomup1
	s_add_alvar	W,x,al_vz,#-10
.nszoomup1
;-----------------------------------------------
	s_jmp_ifnotstate	x,3,.nszoomaway1
;	s_add_alvar		B,x,al_roty,#2
;	s_add_alvar		B,x,al_rotx,#4
	s_add_alvar		B,x,al_sbyte2,#8
	s_set_alvar2alvartab	B,B,W,x,al_vx,x,al_sbyte2,sintab,-1
	s_set_alvar2alvartab	B,B,W,x,al_vy,x,al_sbyte2,costab,-1
	lda	newgameplus
	beq	.nobonfire3
	jsr		fire_bonfire
.nobonfire3
	s_jmp_Zdistmore		x,y,#6000,setstate2
	jsr		mcoreZrot_srou
	s_jmp_alvarEQ	W,x,al_vz,#100,.nszoomaway1
	s_add_alvar	W,x,al_vz,#10
	s_achase_alvar	W,x,al_worldx,#0,3
	s_achase_alvar	W,x,al_worldy,#space_viewcy,3
	s_jmp_alvarZERO		W,x,al_vz,setstate4
.nszoomaway1

;-----------------------------------------------
	s_jmp_ifnotstate	x,4,.nsflipI

	s_clr_alsflag		x,nohitaffect
	s_set_alvar			B,x,al_sbyte1,#deg180/4
	lda	newgameplus
	bne	.nl3t
	s_jmp_varAND		B,superspeedcnt,#ee23,.jmpfourth
	s_jmp_ifnotlevel	4,.nl3t1
	s_jmp_varAND		B,superspeedcnt,#andr,.jmpfourth
	bra	.nl3t
.nl3t1
	s_jmp_ifnotlevel	3,.nl3t
.jmpfourth
	s_set_alvar		B,x,al_sbyte1,#deg180/2
.nl3t	s_zero_vecs		x
	lda	newgameplus
	beq	.nobonfire4
	jsr		fire_bonfire
.nobonfire4
	s_next_state		x
.nsflipI
;-----------------------------------------------
	s_jmp_ifnotstate	x,5,.nsflip

	s_beqdec_alvar		B,x,al_sbyte1,setstate2
	lda	newgameplus
	bne	.nl3f
	s_jmp_varAND	B,superspeedcnt,#ee23,.jmpfifth
	s_jmp_ifnotlevel	4,.nl3f1
	s_jmp_varAND		B,superspeedcnt,#andr,.jmpfifth
	bra	.nl3f
.nl3f1
	s_jmp_ifnotlevel	3,.nl3f
.jmpfifth
	s_add_alvar		W,x,al_worldz,#-10
	s_achase_alvar		B,x,al_rotx,#deg180,3
	s_achase_alvar		B,x,al_roty,#-deg45,3
	s_achase_alvar		B,x,al_rotz,#0,3
;	lda	newgameplus
;	beq	.nobonfire5
;	jsr		fire_bonfire
;.nobonfire5
	lda.l	alx_tx,x
	inc	a
	inc	a
	sta.l	alx_tx,x
	bra			.nsflip
.nl3f
	s_add_alvar		B,x,al_rotx,#4
.nsflip

;-----------------------------------------------
	s_jmp_ifnotstate	x,6,.nscent
	s_achase_alvar		B,x,al_rotx,#deg180,3
	s_achase_alvar		B,x,al_roty,#-deg45,3
	s_achase_alvar		B,x,al_rotz,#0,3
	s_set_alsflag		x,nohitaffect
	s_achase_alvar		W,x,al_worldx,#0,3
	s_achase_alvar		W,x,al_worldy,viewCY,3
	s_set_var		W,svar_word1,player_posz
	s_add_var		W,svar_word1,#2500
	s_achase_alvar		W,x,al_worldz,svar_word1,3
	s_zero_vecs		x
	lda	newgameplus
	beq	.nobonfire6
	jsr		fire_bonfire
.nobonfire6

.nscent

;-----------------------------------------------
	


	s_add_vecs2pos	x
.nowt
	s_add_playerZ	x

;	s_set_objtobealvar	y,x,al_sword1
;	s_jmp_objptrbad		y,.bad
;	s_copy_pos		y,x
;	s_add_alvar		W,y,al_worldz,#50
;	s_sub_alvar		B,y,al_rotz,#12
;	s_copy_alvar2alvar	B,y,al_rotx,x,al_rotx
;.bad

;	s_add_bossHP	x,al_hp
	s_end_strat


mcore1col_Istrat
	s_start_strat
	lda	newgameplus
	bne	.skipdeflect
	s_jmp_ifnotstate	x,5,defelasercol_Istrat
.skipdeflect
	s_jmp			hitflash_Istrat
mcore1exp_Istrat
	s_start_strat
	startbgm		$f0
	trigse			$a1
	s_set_expstrat		x,mcore1exp_strat
mcore1exp_strat
	s_start_strat

	lda	#1
	sta	androssdead
	stz	freezestrats
	lda	finalandross
	bne	.p2off
	bra	.nop2off
.p2off
	lda	#0
	sta	hudrot+1
	lda	playertwoactivated
	beq	.nop2off
	jsl	doascene
	stz	twoplayer
.nop2off
	s_set_objtobeplayer	y
	s_add_alvar		W,x,al_worldz,#60
	s_add_alvar		B,x,al_rotz,#12
	s_add_alvar		B,x,al_rotx,#8
	s_add_alvar		B,x,al_rotx,#4
	s_add_playerZ		x
	s_jmp_Zdistless		x,y,#3000,.nexp
	s_jsl			makeFOLexpobj_srou

	s_set_var		W,svar_word1,#0
	lda	#6	
.cexl	pha
	lda	newgameplus
	beq	.noluigihead
	s_make_obj		#luigihs,.bad1
	bra	.doneluigihead
.noluigihead
	s_make_obj		#andross,.bad1
.doneluigihead
	s_copy_pos		y,x
;	s_add_alvar		W,y,al_roty,#deg45
	s_set_strat		y,blowcube_Istrat		
	s_set_alsflag		y,colldisable
;	s_add_alvar		W,y,al_worldz,svar_word1
	s_add_var		W,svar_word1,#100
.bad1	pla
	dec	a
	bne	.cexl

	s_jmp	qbossexplode_Istrat

.nexp
	s_end_strat


;----------------------------
mcoreZrot_srou
	lda	al_vz,x
	asra
	asra
	asra
	clc
	adc	al_rotz,x
	sta	al_rotz,x
	rts

;*****************************************************************************
; eye smoke
;doeyesmoke_srou
;	s_set_var		B,svar_byte1,#2
;	s_jmp_alvarNOTZERO	B,x,al_sbyte1,.nlsmoke
;	s_dec_var		B,svar_byte1
;	s_make_smoke		1,.nlsmoke
;	s_set_alvar		W,y,al_shape,#Lsmoke
;	s_add_alvar		W,y,al_worldx,#-20<<4
;	s_add_alvar		W,y,al_worldy,#-30<<4
;	s_add_alvar		W,y,al_worldz,#25<<4
;.nlsmoke
;	s_jmp_alvarNOTZERO	B,x,al_sbyte2,.nrsmoke
;	s_dec_var		B,svar_byte1
;	s_make_smoke		1,.nrsmoke
;	s_set_alvar		W,y,al_shape,#Lsmoke
;	s_add_alvar		W,y,al_worldx,#20<<4
;	s_add_alvar		W,y,al_worldy,#-30<<4
;	s_add_alvar		W,y,al_worldz,#25<<4
;.nrsmoke
;	rts

;*****************************************************************************
monolithcol_Istrat
	s_start_strat
	s_jmp_alsflag		x,sflag1,.ncoll
	s_jmpNOT_alvarAND	B,x,al_hitflags,#HF1,.nreb
	s_set_alvar		B,x,al_hitflags,#0
	s_jmp			rebelasercol_Istrat
.nreb
	s_jmp_alvarZERO		B,x,al_sbyte1,.nleft
	s_jmpNOT_alvarAND	B,x,al_hitflags,#HF2,.nleft
	s_set_alsflag		x,hitflash
	s_decbne_alvar		B,x,al_sbyte1,.nleft	
	jsr			makelefteyeexp_srou
.nleft
	s_jmp_alvarZERO		B,x,al_sbyte2,.nright
	s_jmpNOT_alvarAND	B,x,al_hitflags,#HF3,.nright
	s_set_alsflag		x,hitflash
	s_decbne_alvar		B,x,al_sbyte2,.nright	
	jsr			makerighteyeexp_srou
.nright
	trigse			$88
.ncoll	s_set_alvar		B,x,al_hitflags,#0
	s_clr_alsflag		x,collide
	s_jmpto_strat		

monolithexp_Istrat
	s_start_strat
	s_jmp			remove_Istrat



makelefteyeexp_srou
	lda	#15
.loop	pha
	s_jsl			makeLexpobj_srou
	s_set_alsflag		y,relexplode
	s_set_alsflag		y,nopolyexp
	s_add_rnd2pos		y,255,255,0
	s_add_alvar		W,y,al_worldz,#-20
	s_jmp_alvarNE		W,x,al_shape,#face_0,.neye0
	s_add_alvar		W,y,al_worldx,#-20<<4
	s_add_alvar		W,y,al_worldy,#-30<<4
	bra			.deyep
.neye0
	s_add_alvar		W,y,al_worldx,#-15<<4
	s_add_alvar		W,y,al_worldy,#-15<<4
.deyep
	s_set_var2rnd		svar_byte1,#15
	s_set_lifecnt		y,svar_byte1
	pla
	dec	a
	lbne	.loop
     	rts


makerighteyeexp_srou
	lda	#15
.loop	pha
	s_jsl			makeLexpobj_srou
	s_set_alsflag		y,relexplode
	s_set_alsflag		y,nopolyexp
	s_add_rnd2pos		y,255,255,0
	s_add_alvar		W,y,al_worldz,#-20
	s_jmp_alvarNE		W,x,al_shape,#face_0,.neye0
	s_add_alvar		W,y,al_worldx,#20<<4
	s_add_alvar		W,y,al_worldy,#-30<<4
      	bra			.deyep
.neye0	s_add_alvar		W,y,al_worldx,#15<<4
	s_add_alvar		W,y,al_worldy,#-15<<4
.deyep
	s_set_var2rnd		svar_byte1,#15
	s_set_lifecnt		y,svar_byte1
	pla
	dec	a
	lbne	.loop
     	rts


;-----------------------------------------------------------------------------------
monolithpart_srou
dcnt	=	1
	monolithpart		-3,-3,1		; 1
	monolithpart		1,-1,4		; 2
	monolithpart		-3,-1,2		; 3
	monolithpart		3,3,7		; 4
	monolithpart		-1,1,4		; 5
	monolithpart		-3,3,4		; 6
	monolithpart		1,3,6		; 7
	monolithpart		1,1,5		; 8
	monolithpart		1,-3,3		; 9
	monolithpart		3,-1,5		; 10
	monolithpart		-3,1,3		; 11
	monolithpart		3,-3,4		; 12
	monolithpart		3,1,6		; 13
	monolithpart		-1,-1,3		; 14
	monolithpart		-1,3,5		; 15
	monolithpart		-1,-3,2		; 16
	s_set_strat		y,monolithpartL_Istrat
	rts
;-----------------------------------------------------------------------------------
mfire1HP	equ	2
mfire1AP	equ	8

mfire1a_Istrat
	s_start_strat
	s_set_aldata	x,#hardHP,#mfire1AP
	s_set_alptrs	x,mfire1_strat,0,0
	s_brl		mfire1_Icont
mfire1_Istrat
	s_start_strat
	s_set_aldata	x,#mfire1HP,#mfire1AP
	s_set_alptrs	x,mfire1_strat,hitflash_Istrat,mfire1exp_Istrat
mfire1_Icont
	s_set_speed	x,#80
	s_set_colltype	x,enemy1
	s_set_objtobeplayer	y
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,0
	s_add_alvars		B,x,al_roty,x,al_sbyte1
	s_gen_3dvecs		x,al_roty,al_rotx,al_speed
	s_set_alvar		B,x,al_sbyte1,#deg180
	s_set_alsflag		x,relexplode
	a8
	lda	stopcounting
	and	#15
	cmp	#9
	beq	mfire1_strat
	set_sound2		x,#$d
	s_set_alvar2rnd		x,al_rotx
mfire1_strat
	s_start_strat
	s_add_alvar		B,x,al_rotx,#12
	s_add_vecs2pos		x
	s_add_playerZ		x
	s_end_strat


mfire1exp_Istrat
	s_start_strat
	s_set_objtobeplayer	y
	s_jmp_objinfront	y,x,explode2_Istrat
	s_make_obj	#fireface_b,.bad1
	s_copy_pos	y,x
	s_set_strat	y,mfire1a_Istrat
	s_set_alvar	B,y,al_sbyte1,#deg5
.bad1
	s_make_obj	#fireface_b,.bad2
	s_copy_pos	y,x
	s_set_strat	y,mfire1a_Istrat
	s_set_alvar	B,y,al_sbyte1,#-deg5
.bad2
	s_jmp		explode2_Istrat
	


;-----------------------------------------------------------------------------------
		 
monolithpartL_Istrat
	s_start_strat	
	s_set_alsflag		x,sflag1
	s_set_alvar		B,x,al_sbyte2,#10
monolithpart_Istrat
	s_start_strat	
	s_set_alptrs		x,monolithpart_strat,hitflash_Istrat,0
	s_set_aldata		x,#hardHP,#hardAP
	s_set_colltype		x,enemy1
	s_set_alsflag		x,colldisable
	s_setnoremove_behind	x


	s_set_var2rnd		svar_byte1,#3

	s_jmp_varNE		B,svar_byte1,#1,.r1
	s_set_alvar		B,x,al_sbyte3,#deg180/15
	s_set_alvar		B,x,al_sbyte4,#deg180/15
	s_brl			.cont
.r1	s_jmp_varNE		B,svar_byte1,#2,.r2
	s_set_alvar		B,x,al_sbyte3,#-deg180/15
	s_set_alvar		B,x,al_sbyte4,#deg180/15
	s_brl			.cont
.r2	s_jmp_varNE		B,svar_byte1,#3,.r3
	s_set_alvar		B,x,al_sbyte3,#deg180/15
	s_set_alvar		B,x,al_sbyte4,#-deg180/15
	s_brl			.cont
.r3	s_set_alvar		B,x,al_sbyte3,#-deg180/15
	s_set_alvar		B,x,al_sbyte4,#-deg180/15

.cont

	s_set_alvar		B,x,al_sword1,#15

	s_init_colanim	x,#0
monolithpart_strat
	s_start_strat


	s_jmp_varAND		B,bossflags,#BF_flag2,remove_Istrat
	s_decbne_alvar		B,x,al_sbyte1,.end
	s_set_alvar		B,x,al_sbyte1,#1
	s_set_objtobeplayer	y

	s_jmp_alvarNE		B,x,al_sword1,#1,.nsnd
	trigse			$86
.nsnd	s_beqdec_alvar		B,x,al_sword1,.nzoom
	s_add_alvars		W,x,al_worldz,x,al_vz
	s_add_alvars		B,x,al_rotx,x,al_sbyte3
	s_add_alvars		B,x,al_roty,x,al_sbyte4
	s_brl			.end
.nzoom
	s_set_alvar		W,x,al_shape,#sface_b
	s_set_alvar		B,x,al_roty,#0
	s_set_alvar		B,x,al_rotx,#0
	s_jmpNOT_alsflag	x,sflag1,.end
	s_OR_var		B,bossflags,#BF_flag3
	s_jmp_alvarNE	B,x,al_sbyte2,#10,.nfsnd
	trigse			$87
.nfsnd	s_decbne_alvar		B,x,al_sbyte2,.end
	s_OR_var		B,bossflags,#BF_flag1
	s_copy_alvar2var	W,x,psvar_word1,al_worldz
.end	


	s_jmpNOT_varAND		B,bossflags,#BF_flag3,.nflash
	s_decbne_alvar		B,x,al_sword2,.nflash
	s_set_alsflag		x,hitflash
.nflash

				    
	s_add_playerZ		x
	s_end_strat






















;*****************************************************************************
	strats_end










