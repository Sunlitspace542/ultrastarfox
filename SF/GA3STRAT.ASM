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
;*   File: GA3STRATS.ASM                                                   *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr: GILES' ALIEN STRATEGIES.                                        *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   Date: 17/12/92                                                        *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;* Author:								                                   *
;*                                                                         *
;*		Giles Goddard.      				                               *	
;*                                                                         *
;***************************************************************************

	incpublics	EXT\ga3strats.ext


;****************************************************************************
spacepilon_Istrat
	s_start_strat
	s_make_childobj	#pilon,#1,spacepilonP_Istrat,enemyweap
	s_set_alvar	B,y,al_sbyte2,#85	deg45+deg180
	s_make_childobj	#pilon,#2,spacepilonP_Istrat,enemyweap	      
	s_set_alvar	B,y,al_sbyte2,#-85	-deg45+deg180
	s_make_childobj	#pilon,#3,spacepilonP_Istrat,enemyweap	      

	s_setnoremove_behind	x

	s_add_rnd2pos	x,255,255,255,2,2,1


	s_copy_alvar2alvar	W,x,al_vx,x,al_worldx
	s_copy_alvar2alvar	W,x,al_vy,x,al_worldy
	s_copy_alvar2alvar	W,x,al_vz,x,al_worldz

	s_set_alvar	W,x,al_worldx,player_posx          	
	s_set_alvar	W,x,al_worldy,player_posy          	
	s_set_alvar	W,x,al_worldz,player_posz
	s_add_alvar	W,x,al_worldz,#-500

	s_set_alptrs	x,spacepilon_strat,spacepiloncol_Istrat,spacepilonexp_Istrat

	s_set_alvar	B,x,al_sbyte2,#40
	
	s_set_aldata	x,#6,#0

	s_set_alvar	B,x,al_sbyte4,#150

	s_set_colltype	x,enemyweap

	trigse		$2c
spacepilon_strat
	s_start_strat	


;----------------------------------------
	s_jmp_ifnotstate	x,0,.nszoomin
	s_set_alsflag		x,colldisable
	s_achase_alvar2alvar	W,x,al_worldx,x,al_vx,4
	s_achase_alvar2alvar	W,x,al_worldy,x,al_vy,4
	s_achase_alvar2alvar	W,x,al_worldz,x,al_vz,4
	s_decbne_alvar		B,x,al_sbyte2,.nszoomin
	s_clr_alsflag		x,colldisable
	s_next_state		x
	s_set_alvar		B,x,al_sbyte2,#1
.nszoomin
;----------------------------------------
	s_jmp_ifnotstate	x,1,.nsshoot
	s_decbne_alvar		B,x,al_sbyte2,.nsshoot
	s_set_alvar		B,x,al_sbyte2,#1
	s_add_alvar		B,x,al_rotz,#8
	s_jmp_notdelay		5,.nsshoot
	s_weapon_pos		#0,#0,#0
	s_set_objtobeplayer	y
	s_weapon_rots2obj	y
	s_fire_weapon		x,HPLASMA
	s_set_alvar		W,y,al_ptr,playpt
.nsshoot

;----------------------------------------

	s_beqdec_alvar		B,x,al_sbyte4,.nrel
	s_add_playerZ		x
	s_add_alvar		W,x,al_vz,pviewvelz
	s_end_strat	

.nrel	
	s_setremove_behind	x
	s_set_objtobechild	y,x,#1
	s_setremove_behind	y
	s_set_objtobechild	y,x,#2
	s_setremove_behind	y
	s_set_objtobechild	y,x,#3
	s_setremove_behind	y
	s_end_strat	

;--------------------------------------------------------

spacepiloncol_Istrat
	s_start_strat
	trigse		$27
	s_set_childstate	#1,#1
	s_set_childstate	#2,#1
	s_set_childstate	#3,#1
	s_set_alvar		B,x,al_sbyte2,#10
	s_jsl			makeLexpobj_srou
	s_set_alsflag		y,noexpsnd
	s_jmp			coll_Istrat

spacepilonexp_Istrat
	s_start_strat
	s_set_objtobechild	y,x,#1
	s_remove_obj		y
	s_set_objtobechild	y,x,#2
	s_remove_obj		y
	s_set_objtobechild	y,x,#3
	s_remove_obj		y
	s_jmp			explode_Istrat


spacepilonP_Istrat
	s_start_strat
	s_set_strat	x,spacepilonP_strat
	s_setnoremove_behind	x
	s_set_alvar		B,x,al_sbyte3,#10
	s_set_aldata		x,#hardHP,#hardAP
	s_set_alvar	B,x,al_relposy,#-500/8
spacepilonP_strat
	s_start_strat


	s_set_objtobemother	y,x
	s_copy_alvar2alvar	B,x,al_rotz,y,al_rotz
	s_add_alvars		B,x,al_rotz,x,al_sbyte2

	s_copy_alvar2var	B,x,svar_byte1,al_relposy
	s_add_Roffs2pos		B,x,y,x,#0,svar_byte1,#0,0,0,1,3,3,3 

     
;-----------------------------------------------	
	s_jmp_ifnotstate	x,0,.nfirst
	s_achase_alvar		B,x,al_relposy,#-100/8,3
.nfirst

;-----------------------------------------------	
	s_jmp_ifnotstate	x,1,.nexp
	s_set_alsflag		y,colldisable
	s_add_alvar		B,x,al_relposy,#-80/8
	s_decbne_alvar		B,x,al_sbyte3,.nexp
	s_next_state		x
	s_set_alvar		B,x,al_sbyte3,#10
	trigse		$2c
.nexp

;-----------------------------------------------	
	s_jmp_ifnotstate	x,2,.nimp
	s_sub_alvar		B,x,al_relposy,#-80/8
	s_decbne_alvar		B,x,al_sbyte3,.nimp
	s_set_state		x,#0
	s_set_alvar		B,x,al_sbyte3,#10
	s_clr_alsflag		y,colldisable
.nimp

	s_end_strat



	printroulen	spacepilon_Istrat,<ga3strats>


