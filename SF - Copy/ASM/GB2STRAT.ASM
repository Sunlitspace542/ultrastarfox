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
;*   File: GB2STRATS.ASM                                                   *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr: GILES' BOSS STRATEGY ROUTINES.                                  *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   Date: 11/6/92                                                         *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;* Author:								                                   *
;*                                                                         *
;*		Giles Goddard.      				                               *
;*                                                                         *
;***************************************************************************
;***************************************************************************

	shorta
	longi

	strats_start

	incpublics	EXT\gb2strat.ext


;*****************************************************************************
;*****************************************************************************
;*****************************************************************************
;*****************************************************************************
; ship that forms and player turns.
bossF_Istrat		; 0000,0000,2000,2500,boss_f_3,bossf_Istrat
 	s_start_strat
	s_set_aldata	x,#hardHP,#hardAP
	s_set_alptrs	x,bossFC_strat,hitflash_Istrat,explode_Istrat

	s_make_childobj	#boss_F_1,#1,bossFA_Istrat,enemy2
	s_copy_pos	y,x
	s_add_alvar	W,y,al_worldx,#400

	s_set_colltype	x,enemy2

	s_set_strat	x,bossFC_strat
	s_set_state	x,#0
	s_init_anim	x,#0

	s_set_alsflag		x,nohitaffect

 
	s_set_bossmaxHP	#0
	
	s_set_alvar	B,x,al_sbyte2,#200
	s_set_altype	x,gnd
bossFC_strat	
	s_start_strat
	

	s_jmp_alvarNE	B,x,al_sbyte2,#200-60,.nmakefb
	s_make_childobj	#boss_F_2,#2,bossFB_Istrat,enemy2
	s_copy_pos	y,x
	s_sub_alvar	W,y,al_worldx,#400
.nmakeFB


		
	s_decbne_alvar			B,x,al_sbyte2,.nturn
	s_set_alvar			B,x,al_sbyte2,#1

	s_jmp_IFNOTstate		x,0,.nup
	s_set_alvar			W,x,al_vy,#-10
	s_jmp_lower			x,#space_viewcy+300,.nup
	s_next_state			x,#4
.nup
	s_jmp_IFNOTstate		x,1,.nturn
	s_add_alvar			W,x,al_vy,#1
	s_jmp_alvarNOTZERO		W,x,al_vy,.nturn
	s_next_state			x,#4
	s_set_alvar			B,x,al_sbyte3,#100
.nturn

	s_jmp_IFNOTstate		x,2,.ncent
	s_achase_alvar			B,x,al_roty,#0,4,.dsnd1
	s_brl				.nsnd1
.dsnd1	s_jmp_alsflag		x,sflag2,.nsnd1
	s_set_alsflag		x,sflag2
	trigse		$8e
.nsnd1
	s_set_alsflag			x,sflag1
 	s_beqdec_alvar			B,x,al_sbyte3,bossFC2start_init
	s_brl				.cont
.ncent

	s_add_alvars			B,x,al_roty,x,al_vy

	s_add_vecs2pos	x
.cont
	s_add_playerZ	x
	s_end_strat

;-----------------------------------------------------------------------------
bossFC2start_init
	s_clr_altype	x,gnd

	s_set_objtobechild	y,x,#1
	s_remove_child		y,x
	s_remove_obj		y
	s_set_objtobechild	y,x,#2
	s_remove_child		y,x
	s_remove_obj		y
	s_set_alvar		W,x,al_shape,#boss_f_4

	s_make_childobjpos	#boss_F_8,#1,#-20<<bossF_scale,#-10<<bossF_scale,#30<<bossF_scale,bossFtur1_Istrat,enemy2
	s_make_childobjpos	#boss_F_8,#2,#-20<<bossF_scale,#-10<<bossF_scale,#-10<<bossF_scale,bossFtur2_Istrat,enemy2
	s_make_childobjpos	#boss_F_9,#3,#20<<bossF_scale,#-10<<bossF_scale,#30<<bossF_scale,bossFtur3_Istrat,enemy2
	s_make_childobjpos	#boss_F_9,#4,#20<<bossF_scale,#-10<<bossF_scale,#-10<<bossF_scale,bossFtur4_Istrat,enemy2
	s_make_childobjpos	#boss_F_8,#5,#-20<<bossF_scale,#-10<<bossF_scale,#10<<bossF_scale,bossFtur5_Istrat,enemy2
	s_make_childobjpos	#boss_F_9,#6,#20<<bossF_scale,#-10<<bossF_scale,#10<<bossF_scale,bossFtur6_Istrat,enemy2

	s_set_alvar		B,x,al_sbyte2,#0
	
	s_set_altype		x,gnd
	s_set_colltype		x,enemyweap

	s_setnoremove_behind	x
	s_set_alvar		B,x,al_roty,#deg180
	s_brl			bossFC2b_init
bossFC2_init
	s_set_alvar		B,x,al_rotz,#-deg90
bossFC2b_init
	s_set_strat		x,bossFC2_strat
	s_clr_alsflag		x,sflag1
	s_clr_alsflag		x,sflag2
bossFC2_strat
	s_start_strat

	s_achase_alvar		B,x,al_roty,#deg180,5,.snd
	s_brl			.nsnd
.snd
	s_jmp_alsflag		x,sflag2,.nsnd
	s_set_alsflag		x,sflag2
	trigse		$58
.nsnd

	s_jmp_notdelay		1,.nzn
	s_achase_alvar		B,x,al_rotz,#0,6
	s_jmp_alvarEQ		B,x,al_rotx,#deg5,.nzn
	s_add_alvar		B,x,al_rotx,#1
	
.nzn




	s_set_objtobeplayer	y
	s_jmp_objinfront	x,y,.nturn
	s_jmp_Zdistmore		x,y,#4000,bossFC3_init
	s_jmp_Zdistless		x,y,#2000,.nturn
	s_jmp_alsflag		x,sflag1,.nturn
	s_set_alsflag		x,sflag1
	s_set_alvar			B,x,al_rotx,#0
	s_jmp_varAND		B,pshipflags2,#psf2_playerHP0,.npturn
	s_set_strat		y,playerturn180_Istrat
.npturn	s_set_alvar			W,x,al_worldy,#space_viewCY-500
.nturn


bossFC2_cont
	s_jmp_alvarEQ		B,x,al_sbyte2,#6,bossFCdie_init
	s_jmp_alvarLESS		B,x,al_sbyte2,#3,.nshootb

	s_jsr			bossFCsmoke_srou

	s_set_objtobeplayer	y
	s_jmp_Zdistless		x,y,#600,.nshootb
	s_jmpnot_onframe	10,31,.nfire1
	s_weapon_pos		#(-20>>weapon_scale)<<bossF_scale,#(-20>>weapon_scale)<<bossF_scale,#0
	s_brl			.fire
.nfire1
	s_jmpnot_onframe	5,31,.nshootb
	s_weapon_pos		#(20<<bossF_scale)>>weapon_scale,#(-20<<bossF_scale)>>weapon_scale,#0
.fire
	s_weapon_rot		#0,#0
	s_fire_weapon		x,Hplasma
	s_set_alvar		W,y,al_ptr,playpt
.nshootb


bossFC2_cont2

	s_speedto		x,#50,1
bossFC2_cont3
	s_gen_3dvecs		x,al_roty,al_rotx,al_vel
	s_set_alvar		W,x,al_vx,#0
	s_add_vecs2pos		x
	s_add_playerZ		x
	s_end_strat
	
bossFCsmoke_srou
	s_jmp_notdelay		3,.nsmoke
	trigse			$23
	jsl			makesmoke_srou_l
	s_add_Roffs2pos		B,y,x,x,#0,#-20,#0,0,1,1,bossF_scale,bossF_scale,bossF_scale
	s_set_alvar		W,y,al_shape,#Lsmoke
.nsmoke
	rts

;-----------------------------------------------------------------------------
bossFC3_init
	s_set_strat		x,bossFC3_strat
	s_clr_alsflag		x,sflag1
	s_clr_alsflag		x,sflag2
	s_set_alvar		B,x,al_rotz,#-deg90

bossFC3_strat
	s_start_strat


	s_achase_alvar		B,x,al_roty,#0,5,.snd
	s_brl			.nsnd
.snd
	s_jmp_alsflag		x,sflag2,.nsnd
	s_set_alsflag		x,sflag2
	trigse		$58
.nsnd


	s_jmp_notdelay		1,.nzn
	s_achase_alvar		B,x,al_rotz,#0,6
	s_jmp_alvarEQ		B,x,al_rotx,#deg5,.nzn
	s_add_alvar			B,x,al_rotx,#1
.nzn

	s_set_objtobeplayer	y
	s_jmp_objinfront	y,x,.nturn
	s_jmp_Zdistmore		x,y,#4000,bossFC2_init
	s_jmp_Zdistless		x,y,#2000,.nturn
	s_jmp_alsflag		x,sflag1,.nturn
	s_set_alsflag		x,sflag1
	s_set_alvar			B,x,al_rotx,#0
	s_set_strat		y,playerturn180_Istrat
	s_set_alvar			W,x,al_worldy,#space_viewcy-500
.nturn

	s_brl			bossFC2_cont
	


;-----------------------------------------------------------------------------
bossFCdie_init
	s_set_strat		x,bossFCdie_strat
bossFCdie_strat
	s_start_strat

	s_jmp_notdelay		1,.nzn
	s_achase_alvar		B,x,al_rotz,#0,6
.nzn

	s_jmp_notdelay		1,.nexp
	s_jsl		    	makeMEDexpobj_srou
	s_jsl			addrnd2posy_srou
.nexp

	s_set_objtobeplayer	y
	s_jmp_Zdistless		x,y,#1000,bossFCdie2_init
	jsr			bossFCsmoke_srou
	s_brl			bossFC2_cont2
	
bossFCdie2_init
	s_set_objtobeplayer	y
	s_set_strat		y,playerturn180_Istrat
	s_set_strat		x,bossFCdie2_strat
	s_set_alvar		B,x,al_rotx,#0
	s_playerfire		off
	s_clr_alsflag		x,sflag2
bossFCdie2_strat
	s_start_strat

	s_jmp_notdelay		1,.nzn
	s_achase_alvar		B,x,al_rotz,#0,6
.nzn


;	s_jmp_notdelay		1,.nexp
	s_jsl		    	makeLexpobj_srou
	s_set_alsflag		y,nopolyexp
;	s_jsl			addrnd2posy_srou
	s_add_rnd2pos		y,255,255,255,1,0,0
;.nexp
	s_set_objtobeplayer	y
	s_jmp_Zdistless		x,y,#4000,.ndown

	s_jmp_notdelay		1,.nexp
	s_jsl		    	makeFOLexpobj_srou
	s_set_alsflag		y,nopolyexp
	s_jsl			addrnd2posy_srou
.nexp

	s_jmp_alsflag		x,sflag2,.nsnd
	s_set_alsflag		x,sflag2
	startbgm		$f0
	trigse			$96
.nsnd
	s_add_alvar		B,x,al_rotz,#4
	s_jmp_alvarEQ		B,x,al_rotx,#deg90,.nrotx
	s_speedto		x,#60,1
	s_add_alvar		B,x,al_rotx,#1
	s_bra			.nexpsnd
.nrotx

	s_copy_alvar2var	W,x,lastplayz,al_worldz
	s_set_var		W,lastzchange,#0
	s_set_var		W,mapcnt,#0

	s_jmpNOT_varAND	B,pshipflags2,#psf2_turn180,.nturn
	s_and_var		B,pshipflags2,#~psf2_turn180
	s_set_objtobeplayer	y
	s_set_strat		y,playerbossFdie_strat
.nturn
	s_or_var		B,gameflags,#gf_bossdead

	s_remove_obj	x
	s_end_strat

.nfin
	bra		.nexpsnd
.ndown
	s_jmp_notdelay		2,.nexpsnd
	trigse			$21
.nexpsnd

	jsr			bossFCsmoke_srou
	s_brl			bossFC2_cont3


playerbossFdie_strat
	s_start_strat
	s_neg_alvar		B,x,al_vz
	s_neg_var		W,pviewvelz
	s_sub_var		W,pviewposz,#medpspeed*2
	s_neg_alvar		W,x,al_worldx
	s_set_var		W,player_turnrot,#0
	s_set_strat	x,playerinspace_strat
	s_jmpto_strat	



;-----------------------------------------------------------------------------

bossFtur1_Istrat
	s_set_strat		x,bossFtur1_strat
	s_set_alvar		B,x,al_sbyte3,#25
	s_set_aldata		x,#bossFlauncher2HP,#bossFlauncherAP
	s_set_expstrat		x,bossfexp1_Istrat
	s_set_alvar		B,x,al_sbyte2,#30
	s_brl			bossFtur_Icont
bossFtur2_Istrat
	s_set_strat		x,bossFtur2_strat
	s_set_alvar		B,x,al_sbyte3,#25
	s_set_aldata		x,#bossFlauncherHP,#bossFlauncherAP
	s_set_expstrat		x,bossfexp1_Istrat
	s_set_alvar		B,x,al_sbyte2,#60
	s_brl			bossFtur_Icont
bossFtur3_Istrat
	s_set_strat		x,bossFtur3_strat
	s_set_alvar		B,x,al_sbyte3,#50
	s_set_aldata		x,#bossFlauncher2HP,#bossFlauncherAP
	s_set_expstrat		x,bossfexp2_Istrat
	s_set_alvar		B,x,al_sbyte2,#90
	s_brl			bossFtur_Icont
bossFtur4_Istrat
	s_set_strat		x,bossFtur4_strat
	s_set_alvar		B,x,al_sbyte3,#50
	s_set_aldata		x,#bossFlauncherHP,#bossFlauncherAP
	s_set_expstrat		x,bossfexp2_Istrat
	s_set_alvar		B,x,al_sbyte2,#120
	s_brl			bossFtur_Icont
bossFtur5_Istrat
	s_set_strat		x,bossFtur5_strat
	s_set_alvar		B,x,al_sbyte3,#25
	s_set_aldata		x,#bossFlauncherHP,#bossFlauncherAP
	s_set_expstrat		x,bossfexp1_Istrat
	s_set_alvar		B,x,al_sbyte2,#150
	s_brl			bossFtur_Icont
bossFtur6_Istrat
	s_set_strat		x,bossFtur6_strat
	s_set_alvar		B,x,al_sbyte3,#50
	s_set_aldata		x,#bossFlauncherHP,#bossFlauncherAP
	s_set_expstrat		x,bossfexp2_Istrat
	s_set_alvar		B,x,al_sbyte2,#180
bossFtur_Icont
	s_init_anim		x,#0
	s_setnoremove_behind	x
	s_set_colltype		x,enemyweap
	s_set_collstrat		x,hitflash_Istrat
	s_add_bossmaxHP		x,al_hp
	s_jmpto_strat		
bossFtur1_strat
	s_start_strat
	s_set_objtobemother	y,x
	s_add_Roffs2pos		B,x,y,y,#-20,#-10,#30,1,1,1,bossF_scale,bossF_scale,bossF_scale
	s_brl			bossFtur_cont
bossFtur2_strat
	s_start_strat
	s_set_objtobemother	y,x
	s_add_Roffs2pos		B,x,y,y,#-20,#-10,#-10,1,1,1,bossF_scale,bossF_scale,bossF_scale
	s_brl			bossFtur_cont
bossFtur3_strat
	s_start_strat
	s_set_objtobemother	y,x
	s_add_Roffs2pos		B,x,y,y,#20,#-10,#30,1,1,1,bossF_scale,bossF_scale,bossF_scale
	s_brl			bossFtur_cont
bossFtur4_strat
	s_start_strat
	s_set_objtobemother	y,x
	s_add_Roffs2pos		B,x,y,y,#20,#-10,#-10,1,1,1,bossF_scale,bossF_scale,bossF_scale
	s_brl			bossFtur_cont
bossFtur5_strat
	s_start_strat
	s_set_objtobemother	y,x
	s_add_Roffs2pos		B,x,y,y,#-20,#-10,#10,1,1,1,bossF_scale,bossF_scale,bossF_scale
	s_brl			bossFtur_cont
bossFtur6_strat
	s_start_strat
	s_set_objtobemother	y,x
	s_add_Roffs2pos		B,x,y,y,#20,#-10,#10,1,1,1,bossF_scale,bossF_scale,bossF_scale
bossFtur_cont	
	s_jmp_objptrbad		y,remove_Istrat

	s_copy_rots		x,y

	s_jmp_alvarEQ		B,x,al_hp,#hardHP,.dead

	s_add_bossHP		x,al_hp

	s_decbne_alvar		B,x,al_sbyte2,.nchg
	s_not_alsflag		x,sflag1
	s_set_alvar		B,x,al_sbyte2,#40	; open time
	s_jmp_alsflag		x,sflag1,.opentime	
	s_set_alvar		B,x,al_sbyte2,#70	; closed time
.opentime	
.nchg
	s_jmp_alsflag		x,sflag1,.open
.close	
	s_set_alsflag		x,nohitaffect
	s_jmp_notdelay		1,.nanim
	s_cmp_anim		x,#0
	s_beq			.nanim
	s_add_anim		x,#-1,#4
	s_brl			.nanim

.open	s_clr_alsflag		x,nohitaffect
	s_jmp_notdelay		1,.nanimo
	s_cmp_anim		x,#3
	s_beq			.nanimo
	s_add_anim		x,#1,#4
.nanimo
	s_decbne_alvar		B,x,al_sbyte3,.nfin
	s_set_alvar		B,x,al_sbyte3,#50
.nfin
	s_jmp_alvarMORE		B,x,al_sbyte3,#20,.nfire
	s_jmp_alvarMORE		B,x,al_sbyte2,#15,.nfire
	s_set_objtobeplayer	y
	s_jmp_Zdistless		x,y,#1500,.nfire
	s_jmp_notdelay		3,.nfire
	s_weapon_pos		#0,#0,#0
	s_weapon_rots2obj	y
	s_fire_weapon		x,RELSLOWELASER		
.nfire
.nanim

.dead
	s_end_strat

bossfexp1_Istrat
	s_start_strat
	s_set_alvar	W,x,al_shape,#boss_f_8a
	s_brl		bossFexp_Icont
bossfexp2_Istrat
	s_start_strat
	s_set_alvar	W,x,al_shape,#boss_f_9a
bossfexp_Icont
	s_set_objtobemother	y,x
	s_inc_alvar		B,y,al_sbyte2
	s_jsl		makeMEDexpobj_srou
	s_set_alvar	B,x,al_hp,#hardHP
	s_set_alsflag	x,colldisable
	s_jmpto_strat	

;-----------------------------------------------------------------------------
bossFA_Istrat	
	s_start_strat
	s_set_strat	x,bossFA_strat
	s_set_alvar	B,x,al_rotx,#-deg90
	s_set_speed	x,#50
	s_set_state	x,#0
	s_init_anim	x,#0
bossFA_strat
	s_start_strat
		
	s_set_objtobemother		y,x
	s_jmp_notalsflag		y,sflag1,.ncomb
	s_copy_alvar2var		W,y,svar_word1,al_worldz
	s_add_var			W,svar_word1,#10<<bossF_scale
	s_copy_alvar2var		W,y,svar_word2,al_worldy
	s_add_var			W,svar_word2,#-22<<bossF_scale
	s_achase_alvar			W,x,al_worldz,svar_word1,4
	s_achase_alvar2alvar		W,x,al_worldx,y,al_worldx,4
	s_achase_alvar			W,x,al_worldy,svar_word2,4
	s_achase_alvar			B,x,al_roty,#deg180,3
	s_achase_alvar			B,x,al_rotz,#0,3
	s_brl				.cont
.ncomb


	s_jmp_IFNOTstate		x,0,.nup
	s_jmp_lower			x,#space_viewcy+800,.nup
	s_next_state			x,#4
.nup
	s_jmp_IFNOTstate		x,1,.nturn
	s_achase_alvar			B,x,al_rotx,#0,4
	s_add_alvar			B,x,al_roty,#4
	s_add_alvar			B,x,al_rotz,#2
.nturn


	s_jmpNOT_objpointnegz	x,.nfire
	s_jmp_NOtdelay	2,.nfire

	s_set_objtobeplayer	y
	s_weapon_rots2obj	y
	s_weapon_pos		#(-20<<bossF_scale)>>weapon_scale,#(-20<<bossF_scale)>>weapon_scale,#0
	s_fire_weapon		x,RELSLOWELASER
	s_set_objtobeplayer	y
	s_weapon_rots2obj	y
	s_weapon_pos		#(20<<bossF_scale)>>weapon_scale,#(-20<<bossF_scale)>>weapon_scale,#0
	s_fire_weapon		x,RELSLOWELASER
.nfire



	s_gen_3dvecs	x,al_roty,al_rotx,al_vel
	s_scale_alvar	W,x,al_vz,1
	s_add_vecs2pos	x
.cont
	s_add_playerZ	x
	s_end_strat

;-----------------------------------------------------------------------------
bossFB_Istrat	
	s_start_strat
	s_set_strat	x,bossFB_strat
	s_set_alvar	B,x,al_rotx,#-deg90
	s_set_speed	x,#30
	s_set_state	x,#0
	s_init_anim	x,#0
bossFB_strat			  
	s_start_strat
		
	
	s_set_objtobemother		y,x
	s_jmp_notalsflag		y,sflag1,.ncomb
	s_copy_alvar2var		W,y,svar_word1,al_worldz
	s_add_var			W,svar_word1,#-40<<bossF_scale
	s_achase_alvar			W,x,al_worldz,svar_word1,4
	s_achase_alvar2alvar		W,x,al_worldx,y,al_worldx,4
	s_achase_alvar2alvar		W,x,al_worldy,y,al_worldy,4
	s_achase_alvar			B,x,al_roty,#deg180,3
	s_achase_alvar			B,x,al_rotz,#0,3
	s_brl				.cont
.ncomb


	s_jmp_IFNOTstate		x,0,.nup
	s_jmp_lower			x,#space_viewcy+600,.nup
	s_next_state			x,#4
.nup
	s_jmp_IFNOTstate		x,1,.nturn
	s_achase_alvar			B,x,al_rotx,#0,4
	s_sub_alvar			B,x,al_roty,#2
	s_sub_alvar			B,x,al_rotz,#1
.nturn


	s_set_objtobeplayer	y

	s_jmp_Zdistmore		x,y,#3000,.nsnd
	s_jmp_alsflag		x,sflag2,.dsnd
	trigse		$58
	s_set_alsflag		x,sflag2
	s_brl			.dsnd
.nsnd
	s_clr_alsflag		x,sflag2
.dsnd         



	s_jmp_Zdistmore		x,y,#1400,.nmine
	s_jmp_NOtdelay	2,.nmine
	s_make_obj	#mine_0,.nmine
	s_set_strat	y,mine0_istrat
	s_copy_pos	y,x
.nmine

	s_gen_3dvecs	x,al_roty,al_rotx,al_vel
	s_scale_alvar	W,x,al_vz,1
	s_add_vecs2pos	x

.cont
	s_add_playerZ	x
      	s_end_strat

	printroulen	bossF_Istrat,<Boss F strategy>

;**********************************************************************************************************************
shrapfall_Istrat
	s_start_strat
	s_set_strat	x,shrapfall_strat
	s_set_alvar	W,x,al_worldy,pviewposy
	s_add_alvar	W,x,al_worldy,#-500
	s_set_alsflag	x,colldisable	
	s_set_lifecnt	x,#26


	s_set_var2rnd	svar_word1
	stz		svar_word1+1
	a16
	lda		svar_word1
;	asl	a
	sec
	sbc		#128
	clc		
	adc		pviewposx
	sta		al_worldx,x
	a8

	s_set_var2rnd	svar_word1
	stz		svar_word1+1
	a16
	lda		svar_word1
	asl	a
	sta		al_sword1,x
	a8


	s_set_alvar2rnd	x,al_roty

shrapfall_strat
	s_start_strat
	s_set_alvar	W,x,al_worldz,pviewposz
	s_add_alvar	W,x,al_worldz,#300
	s_add_alvars	W,x,al_worldz,x,al_sword1
	s_add_alvar	W,x,al_worldy,#35
	s_dec_lifecnt	x
	
	s_end_strat
	

;--------------------------------------------------------













