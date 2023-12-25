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
;*   File: PSTRATS.ASM                                                     *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr: PLAYER'S STRATEGIES.                                            *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   Date: 30/3/92                                                         *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;* Author:								                                   *
;*                                                                         *
;*		Giles Goddard.      				                               *
;*                                                                         *
;***************************************************************************

	incpublics	EXT\pstrats.ext

	strats_start


player_strategies

;*****************************************************************************

slspark_Istrat	
	s_start_strat
	s_init_colanim	x,#0 
	s_set_strat	x,slspark_strat
	s_end_strat
slspark_strat	
	s_start_strat
	s_add_colanim	x,#1,#16
	s_brl		lspark_cont


lspark_Istrat	
	s_start_strat
	s_init_colanim	x,#0 
	s_set_strat	x,lspark_strat
	s_end_strat
lspark_strat	
	s_start_strat
	s_add_colanim	x,#2,#16
lspark_cont
	s_add_playerZ	x
	s_add_vecs2pos	x
	s_dec_lifecnt	x
	s_end_strat


sgenspark_srou_l
	s_jsr			sgenspark_srou
	s_rtl
sgenspark_srou
	s_jmp_varAND		B,pshipflags2,#psf2_nospark,.badobj2
	s_make_obj		#line,.badobj2
	s_set_strat		y,lspark_Istrat
	s_set_alsflag		y,colldisable
	s_rots_flat		y
	s_copy_pos		y,x

	s_exg_objs		
	s_set_alvar2rnd.l	x,al_rotz
	s_set_lifecnt		x,#5
	s_set_speed		x,#15
	s_gen_flatvecs		x,al_rotz,al_vel
	s_exg_objs		

.badobj2
              	rts

;*****************************************************************************
brkpwingcol	
	ldy			pcboxobj_B
	s_copy_alvar2alvar.w	W,y,al_collobjptr,x,al_collobjptr
	s_set_alsflag		y,collide
	s_jmp_alvarZERO		W,x,al_collobjptr,.bodywallcol
	brl			no_pwingcol	

.bodywallcol
	s_docollAP		y,#framesperAP,#4
	brl			no_pwingcol	

	

pwingcol	
	s_jmp_alvarNE		B,x,al_collcount,#1,.nbcoll
	s_set_objtobealvar	y,x,al_collobjptr
	phx
	ldx			pcboxobj_B
	sty			al_collobjptr,x

	s_jmp_varAND		B,pshipflags2,#psf2_wireship,.halfcol
	s_docoll		x,#framesperAP,1
	s_brl			.donecol
.halfcol	s_docoll		x,#framesperAP,2
.donecol
	plx
.nbcoll

	s_jmp_varAND		B,pshipflags2,#psf2_wireship,.wirewcol
	s_docollAP		x,#framesperAP,#1
	s_brl		no_pwingcol
.wirewcol
	trigse		$14
no_pwingcol



	s_do_strat		x

	s_set_objtobealvar	y,x,al_sword1	 
	s_chk_objptr		y,.badobj
	s_copy_pos		y,x 		 
;----------------------------------------------------------
	jsr			sgenspark_srou
;	jsr			sgenspark_srou
;----------------------------------------------------------
.badobj	
	s_end_strat


;*****************************************************************************
pBody_Istrat
	s_start_strat
	s_setnoremove_behind	x
	s_set_alptrs		x,pBody_strat,pcolB_Istrat,pcolBexp_Istrat
	s_set_aldata		x,#playerB_HP,#playerB_AP
	s_set_vartobeobj	pcboxobj_B,x
	s_and_var		B,pshipflags,#~psf_bodycoll
	s_set_alsflag		x,colldisable
	s_end_strat
pBody_strat
	s_start_strat
	s_set_objtobeplayer	y
	s_copy_pos		x,y	
	s_copy_rots		x,y	
	s_add_Roffs2pos		B,x,x,x,#0,#0,#0,0,0,1
;	d_print_alvar		B,x,al_HP,2


;	s_jmp_alvarmore	W,x,al_worldy,minpmoveY,.nminy
;	s_or_var	B,pmovelimit,#pml_btop
;.nminy
;
;	s_jmp_alvarless	W,x,al_worldy,maxpmoveY,.nmaxy
;	s_or_var	B,pmovelimit,#pml_bbottom
;.nmaxy

	s_end_strat

;-----------------------------------------------------------------------------
pcolB_Istrat
	s_start_strat	


	s_set_objtobealvar.w	y,x,al_collobjptr
	s_jmp_varAND	B,pshipflags2,#psf2_wireship,.dsn
	s_jmp_objptrBAD		y,.b8snd
	s_jmp_alvarLESS.w	B,y,al_AP,#8,.b8snd
	TRIGSE			$04
	bra			.dsn
.b8snd
	TRIGSE			$19
.dsn

	s_chk_objptr		y,.bady
	s_jmp_alvarZERO.w	B,y,al_AP,nobcoll
.bady

	s_set_objtobeplayer	y
	s_set_alvar		B,y,al_sbyte1,#player_hitflashfrms	
	s_set_var		B,screenflashcnt,#screenflashbodyfrms
	s_set_var		B,screenflashtype,#screenflashbodytype
	s_set_collstrat		x,pcolB_strat
	s_set_endcollstrat 	x,pendcolB_Istrat
	s_copy_alvar2var	W,x,pcollobj_B,al_collobjptr
	s_or_var		B,pshipflags,#psf_bodycoll
pcolB_strat
	s_start_strat
	s_set_objtobeplayer	y

	s_jmp_varZERO		W,pcollobj_b,.nfl

	s_set_alvar		B,y,al_sbyte1,#player_hitflashfrms	


	s_jmp_varAND		B,pshipflags2,#psf2_wireship,.halfcol
	s_docoll		x,#framesperAP
	s_brl			.donecol
.halfcol	
	s_docoll		x,#framesperAP,1
.donecol
	s_jmp_alvarZERO	B,x,al_hp,.n8sndt
	s_jmp_alvarMORE		B,x,al_hp,#playerB_HP/4,.n4snd
 	s_jmp_alsflag		x,sflag1,.n4sndt
	s_set_alsflag		x,sflag1
	trigse			$1b
.n4snd	s_clr_alsflag		x,sflag1
.n4sndt
	s_jmp_alvarMORE		B,x,al_hp,#playerB_HP/8,.n8snd
 	s_jmp_alsflag		x,sflag2,.n8sndt
	s_set_alsflag		x,sflag2
	trigse			$1c
.n8snd 	s_clr_alsflag		x,sflag2
.n8sndt


.nfl
nobcoll
	s_jmpto_strat		

	
pendcolB_Istrat
	s_start_strat
	s_set_var		W,pcollobj_B,#0
	s_set_collstrat		x,pcolB_Istrat
	s_and_var		B,pshipflags,#~psf_bodycoll
	s_jmpto_strat		

pcolBexp_Istrat
	s_start_strat

	s_jmp_varAND	B,pshipflags,#psf_noctrl,.cantdie
	s_jmpNOT_varAND	B,pstratflags,#pstf_notdie,.candie
.cantdie
	s_set_alvar	B,x,al_HP,#1
	s_end_strat
.candie
	s_set_objtobeplayer	y
	s_kill_obj		y
	s_end_strat

;*****************************************************************************
pLWing_Istrat
	s_start_strat
	s_setnoremove_behind	x
	s_set_alptrs		x,pLWing_strat,pcolLW_Istrat,PLWbrk_Istrat
	s_set_aldata		x,#playerW_HP,#playerW_AP
	s_set_state		x,0
	s_set_vartobeobj	pcboxobj_LW,x
;	s_and_var		B,pshipflags,#~(psf_brkLwing!psf_Lwingcoll)
	s_set_alsflag		x,colldisable
	s_end_strat
pLWing_strat
	s_start_strat
	s_set_objtobeplayer	y
	s_copy_pos		x,y	
	s_copy_rots		x,y	
;	s_jmp_varAND	B,pshipflags3,#psf3_intunnel,.intun
	s_add_Roffs2pos		B,x,x,x,#-playerW_x,#playerW_y,#playerW_z,0,0,1
;	s_brl		.rotcont
;.intun
;	s_add_Roffs2pos		B,x,x,x,#-TplayerW_x,#playerW_y,#playerW_z,0,0,1
.rotcont

;	d_print_alvar		B,x,al_HP,1

	s_jmp_alvarmore	W,x,al_worldx,minpmoveX,.nminx
	a16
	lda		minpmoveX
	sec
	sbc		al_worldx,x
	sta		pwingdistwall
	a8
	s_or_var	B,pmovelimit,#pml_lwleft
.nminx

	s_jmp_alvarmore	W,x,al_worldy,minpWmoveY,.nminy
	s_or_var	B,pmovelimit,#pml_lwtop
.nminy

	s_jmp_alvarless	W,x,al_worldy,maxpWmoveY,.nmaxy
	s_or_var	B,pmovelimit,#pml_lwbottom
	s_jmpNOT_varAND	B,playerflymode,#pfm_water,.nmaxy
	jsl		makesplash_srou_l
.nmaxy
;	d_print_alvar		W,x,al_worldy,2
	s_end_strat
;-----------------------------------------------------------------------------
pcolLW_Istrat
	s_start_strat	
	
	

	s_set_var		B,screenflashcnt,#screenflashwingfrms
	s_set_var		B,screenflashtype,#screenflashwingtype


	s_set_objtobealvar.w	y,x,al_collobjptr
	s_jmp_varAND	B,pshipflags2,#psf2_wireship,.dsn
	s_jmp_objptrBAD		y,.b8snd
	s_jmp_alvarLESS.w	B,y,al_AP,#8,.b8snd
	TRIGSE			$04
	bra			.dsn
.b8snd
	TRIGSE			$07
.dsn



	s_chk_objptr		y,.bady
	s_jmp_alvarZERO.w	B,y,al_AP,nolwcoll
	
	s_set_objtobeplayer	y
	lda.w			al_rotz,y
	bpl			.nur
	s_add_var		B,plrotx+1,#-8
	bra			.bady
.nur
	s_add_var		B,plrotx+1,#8

	s_add_alvar		W,y,al_worldx,#10
	s_set_var		W,player_Zshake,#-deg11*256

.bady

	s_set_collstrat		x,pcolLW_strat
	s_copy_alvar2var	W,x,pcollobj_LW,al_collobjptr
	s_set_endcollstrat 	x,pendcolLW_Istrat
	s_or_var		B,pshipflags,#psf_Lwingcoll
	s_set_alvar		W,x,al_sword1,#0
	s_jmp_varAND		B,playerflymode,#pfm_water,.badobj
	s_make_obj		#spexplod,.badobj
	s_setnoremove_behind	y
	s_set_alsflag		y,colldisable
	s_rots_flat		y
	s_set_alvartobeobj	x,al_sword1,y
.badobj	

pcolLW_strat	
	s_start_strat
	s_test_var		B,pshipflags,#psf_brkLwing
	s_bne			brkpwingcol
	s_jmp			pwingcol

pendcolLW_Istrat
	s_start_strat
	s_set_var		W,pcollobj_LW,#0
	s_set_collstrat		x,pcolLW_Istrat
	s_set_objtobeplayer	y
	s_and_var		B,pshipflags,#~psf_Lwingcoll
	s_set_objtobealvar	y,x,al_sword1
	s_chk_objptr		y,.badobj
	s_set_alvar		W,x,al_sword1,#0
	s_remove_obj		y
.badobj	
nolwcoll
	s_jmp			pLWing_strat


;-----------------------------------------------------------------------------
PLWbrk_Istrat
	s_start_strat
	s_jmp_varAND	B,pshipflags3,#psf3_nocollisions,.ncoll

	TRIGSE			se_wingdestructleft
	s_set_alvar		B,x,al_HP,#-1
	s_set_alvar		B,x,al_AP,#0
	s_and_var		B,pshipflags,#~psf_Lwingcoll
	s_or_var		B,pshipflags,#psf_brkLwing
	ldy			pcboxobj_B
	s_set_alvar		B,y,al_collcount,#framesperAP
	s_jsl			makesmlexpobj_srou 
	s_set_alvar		W,y,al_vz,pviewvelz
.ncoll
	s_jmpto_strat		



;*****************************************************************************
pRWing_Istrat
	s_start_strat
	s_setnoremove_behind	x
	s_set_alptrs		x,pRWing_strat,pcolRW_Istrat,PRWbrk_Istrat
	s_set_aldata		x,#playerW_HP,#playerW_AP			    
	s_set_vartobeobj	pcboxobj_RW,x
;	s_and_var		B,pshipflags,#~(psf_Rwingcoll!psf_brkRwing)
	s_set_alsflag		x,colldisable
	s_end_strat
pRWing_strat
	s_start_strat
	s_set_objtobeplayer	y
	s_copy_pos		x,y	
	s_copy_rots		x,y	

;	s_jmp_varAND	B,pshipflags3,#psf3_intunnel,.intun
	s_add_Roffs2pos		B,x,x,x,#playerW_x,#playerW_y,#playerW_z,0,0,1
;	s_brl		.rotcont
;.intun
;	s_add_Roffs2pos		B,x,x,x,#TplayerW_x,#playerW_y,#playerW_z,0,0,1
.rotcont
;	d_print_alvar		B,x,al_HP,3

	s_jmp_alvarless	W,x,al_worldx,maxpmoveX,.nmaxx
	a16
	lda		maxpmoveX
	sec
	sbc		al_worldx,x
	sta		pwingdistwall
	a8
	s_or_var	B,pmovelimit,#pml_rwright
.nmaxx

	s_jmp_alvarmore	W,x,al_worldy,minpWmoveY,.nminy
	s_or_var	B,pmovelimit,#pml_rwtop
.nminy

	s_jmp_alvarless	W,x,al_worldy,maxpWmoveY,.nmaxy
	s_or_var	B,pmovelimit,#pml_rwbottom
	s_jmpNOT_varAND		B,playerflymode,#pfm_water,.nmaxy
	jsl		makesplash_srou_l
.nmaxy
;	d_print_alvar		W,x,al_worldy,3
	s_end_strat


;-----------------------------------------------------------------------------
pcolRW_Istrat
	s_start_strat	


	s_set_var		B,screenflashcnt,#screenflashwingfrms
	s_set_var		B,screenflashtype,#screenflashwingtype


	s_set_objtobealvar.w	y,x,al_collobjptr
	s_jmp_varAND	B,pshipflags2,#psf2_wireship,.dsn
	s_jmp_objptrBAD		y,.b8snd
	s_jmp_alvarLESS.w	B,y,al_AP,#8,.b8snd
	TRIGSE			$04
	bra			.dsn
.b8snd
	TRIGSE			$08
.dsn

	s_chk_objptr		y,.bady
	s_jmp_alvarZERO.w		B,y,al_AP,norwcoll
	s_set_objtobeplayer	y
	lda.w			al_rotz,y
	bmi			.nur
	s_add_var		B,plrotx+1,#-8
	bra			.bady
.nur
	s_add_var		B,plrotx+1,#8

	s_add_alvar		W,y,al_worldx,#-10
	s_set_var		W,player_Zshake,#deg11*256


.bady
 
	s_set_collstrat		x,pcolRW_strat
	s_copy_alvar2var	W,x,pcollobj_RW,al_collobjptr
	s_set_endcollstrat 	x,pendcolRW_Istrat
	s_or_var		B,pshipflags,#psf_Rwingcoll
	s_set_alvar		W,x,al_sword1,#0
	s_jmp_varAND		B,playerflymode,#pfm_water,.badobj
	s_make_obj		#spexplod,.badobj
	s_setnoremove_behind	y
	s_set_alsflag		y,colldisable
	s_rots_flat		y
	s_set_alvartobeobj	x,al_sword1,y
.badobj	
	

pcolRW_strat	
	s_start_strat
	s_test_var		B,pshipflags,#psf_brkRwing
	s_bne			brkpwingcol
	s_jmp			pwingcol


pendcolRW_Istrat
	s_start_strat
	s_set_var		W,pcollobj_RW,#0
	s_set_collstrat		x,pcolRW_Istrat
	s_set_objtobeplayer	y
	s_and_var		B,pshipflags,#~psf_Rwingcoll
	s_set_objtobealvar	y,x,al_sword1
	s_chk_objptr		y,.badobj
	s_set_alvar		W,x,al_sword1,#0
	s_remove_obj		y
.badobj	
norwcoll
	s_jmp			pRWing_strat

;-----------------------------------------------------------------------------

PRWbrk_Istrat
	s_start_strat
	s_jmp_varAND	B,pshipflags3,#psf3_nocollisions,.ncoll

	TRIGSE		se_wingdestructright
	s_set_alvar		B,x,al_HP,#-1
	s_set_alvar		B,x,al_AP,#0
	s_and_var		B,pshipflags,#~psf_Rwingcoll
	s_or_var		B,pshipflags,#psf_brkRwing
	ldy			pcboxobj_B
	s_set_alvar		B,y,al_collcount,#framesperAP
	s_jsl			makesmlexpobj_srou
	s_set_alvar		W,y,al_vz,pviewvelz
.ncoll
	s_jmpto_strat		




;*****************************************************************************
player_Istrat
	s_start_strat
	s_jsr		playermove_init
	s_jsl		playercred_Istrat
	s_clr_alsflag	x,invisible
	s_clr_alsflag	x,colldisable
	stz	slowstars
	s_end_strat



;*****************************************************************************
set_playercred_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playercred_Istrat
	rtl

playercred_Istrat
	s_start_strat

	lda	#1
	sta	slowstars

	s_set_var		W,lastplayZ,#0
	s_set_var		W,viewposz,#0


	s_set_var		W,player_turnrot,#0

	s_AND_var		B,gameflags,#~gf_noZremove
	s_set_pos		x,#0,#0,#0
	s_set_var		W,outvx,#0
	s_set_var		W,outvy,#0
	s_set_var		W,outdist,#outviewdist		;+45
	s_set_var		W,viewdist,#outviewdist		;+45
	s_set_var		W,pviewposx,#0
	s_set_var		W,pviewposy,#0
	s_set_var		W,pviewposz,#0
	
	s_set_var		B,viewtype,#viewtype_norm

	s_playerctrl	off

	s_playerfly_mode	space
	s_AND_var		B,playerflymode,#~pfm_wobble

	s_set_alptrs	x,playercred_strat,0,0
	s_set_alsflag	x,invisible
	s_and_var		B,pshipflags3,#~psf3_enginesnd
	s_set_speed		x,#medpspeed
	s_set_var		W,pviewvelz,#medpspeed
	s_set_var		B,player_medspeed,#medpspeed
	s_set_var		B,player_tospeed,#medpspeed

	s_set_var		W,plrotz,#0
playercred_strat
	s_start_strat
	jsr		do_player_limitx
	jsr		viewmove_srou
	s_set_alsflag	x,colldisable
	s_set_var		W,outvz,#0
	s_set_var		W,plrotz,#0
	
	s_add_var		W,slowstars_viewposz,#medpspeed/4

	s_end_strat



playerstraight_strat
	s_start_strat
	stz			arrows
	s_set_var		B,viewtype,#viewtype_norm
	s_set_var		W,plrotx,#0
	s_set_var		W,plroty,#0
	s_set_var		W,plrotz,#0
	s_achase_var	W,outvx,#0,3
	s_achase_var	W,outvy,#0,3
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

	s_gen_3dvecs		x,al_roty,al_rotx,al_vel
	s_add_vecs2pos		x

	s_set_alvar	W,x,al_worldx,#0
	s_set_alvar	W,x,al_worldy,viewcy
	s_set_var	W,pviewposx,#0
	s_set_var	W,pviewposy,viewcy
          	s_add_var	W,pviewposz,pviewvelz
	s_end_strat

;*****************************************************************************
set_playerInSpace_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerInSpace_Istrat
	rtl

playerinspace_Istrat
	s_start_strat

	s_playerctrl	on

	s_playerfly_mode	space

	s_set_alptrs	x,playerinspace_strat,playercoll_Istrat,playerdead_Istrat


playerinspace_strat
	s_start_strat


	jsr		do_player_limitX


;----------------------------------------------------------------------
; view X pos = player X pos * 0.75
      	s_jmp_varNE	B,splayerflymode,#spfm_inside,.ninsidex
	s_copy_alvar2var	W,x,pviewposx,al_worldx
	bra	.donex
.ninsidex
	a16
	lda	al_worldx,x
	jsl	perc75A_l
	sta	pviewposx
	a8
.donex


; view Y pos = player Y pos * 0.62

      	s_jmp_varNE	B,splayerflymode,#spfm_inside,.ninsidey
	s_copy_alvar2var	W,x,pviewposy,al_worldy
	bra	.doney
.ninsidey
	a16
	lda	al_worldy,x
	sec
	sbc	#Space_ViewCY
	jsl	perc62A_l
	clc
	adc	#Space_ViewCY
	sta	pviewposy
	a8
.doney
;----------------------------------------------------------------------
	jsr		viewmove_srou





	s_end_strat



;*****************************************************************************
playeroncont_Istrat
	s_start_strat
	s_playerctrl		on
	s_playerfly_mode	cont
	s_set_alptrs		x,playeroncont_strat,playercoll_Istrat,playerdead_Istrat
	s_set_var		W,pviewvelz,#medpspeed
playeroncont_strat
	s_start_strat
	jsr			do_player_limitX
	s_copy_alvar2var	W,x,pviewposx,al_worldx
	s_copy_alvar2var	W,x,pviewposy,al_worldy
	jsr			viewmove_srou
	s_set_var		W,outvx,#0
	s_set_var		W,outvy,#0
	s_set_var		W,outdist,#200
	s_set_var		W,viewdist,#200
	s_set_alvar		W,x,al_shape,#my_demoS
	s_and_var		B,pshipflags3,#~psf3_enginesnd
	s_end_strat



;*****************************************************************************
set_playerOnPlanet_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerOnPlanet_Istrat


playeronplanet_Istrat
	s_start_strat

	s_playerctrl	on

	s_playerfly_mode	planet

	s_set_alptrs	x,playeronplanet_strat,playercoll_Istrat,playerdead_Istrat

	          	
playeronplanet_strat
	s_start_strat


	jsr		do_player_Yvel125

	a16

; view X pos = 87% player X 
;      	s_jmp_varAND	B,gameflags2,#gf2_viewclose,.dcx
	lda	al_worldx,x
	jsl	perc87A_l
	bra	.donex

.dcx	lda	al_worldx,x
	jsl	perc93A_l
.donex
	sta	pviewposx

; view Y pos = 75% player Y		; 62
	lda	al_worldy,x
	sec
	sbc	viewcy
	jsl	perc75A_l
	clc
	adc	viewcy
	sta	pviewposy
	a8



	jsr		viewmove_srou


	s_end_strat


	ifeq	1
;*****************************************************************************
set_playerOnfield_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerOnfield_Istrat
	rtl

playeronfield_Istrat

	s_start_strat

	s_playerctrl	on

	s_playerfly_mode	field

	s_set_alptrs	x,playeronfield_strat,playercoll_Istrat,playerdead_Istrat

playeronfield_strat
	s_start_strat


	jsr		do_player_limitX

	a16

; view X pos = 87% player X 
;      	s_jmp_varAND	B,gameflags2,#gf2_viewclose,.dcx
	lda	al_worldx,x
	jsl	perc87A_l
	bra	.donex

.dcx	lda	al_worldx,x
	jsl	perc93A_l
.donex
	sta	pviewposx

; view Y pos = fixed
	lda	viewCY
	sta	pviewposy
	a8



	jsr		viewmove_srou


	s_end_strat
	endc


;*****************************************************************************
set_playerUnderGnd_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerUnderGnd_Istrat
	rtl

playerundergnd_Istrat

	s_start_strat

	s_playerctrl	on

	s_playerfly_mode	undergnd

	s_set_alptrs	x,playerundergnd_strat,playercoll_Istrat,playerdead_Istrat

playerundergnd_strat
	s_start_strat


	jsr		do_playerYvelD2

	a16

; view X pos = 87% player X 
;      	s_jmp_varAND	B,gameflags2,#gf2_viewclose,.dcx
	lda	al_worldx,x
	jsl	perc87A_l
	bra	.donex

.dcx	lda	al_worldx,x
	jsl	perc93A_l
.donex
	sta	pviewposx

; view Y pos = fixed
	lda	viewCY
	sta	pviewposy
	a8



	jsr		viewmove_srou


	s_end_strat



;*****************************************************************************
set_playerOnWater_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerOnWater_Istrat
	rtl

playeronwater_Istrat

	s_start_strat


	s_playerctrl	on

	s_playerfly_mode	water

	s_set_alptrs	x,playeronwater_strat,playercoll_Istrat,playerdead_Istrat


playeronwater_strat
	s_start_strat



	ifeq	1

	jsr		do_player_limitX

	a16

	lda	al_vy,x
	adiv2
	sta	al_vy,x
	

; view X pos = player X pos * 0.5
	lda	al_worldx,x
	asra
	sta	pviewposx

; view Y pos = fixed
	lda	#planet_ViewCY
	sta	pviewposy
	a8

	jsr		viewmove_srou
	endc


	jsr		do_player_Yvel125

	a16

; view X pos = 87% player X 
;      	s_jmp_varAND	B,gameflags2,#gf2_viewclose,.dcx
	lda	al_worldx,x
	jsl	perc87A_l
	bra	.donex

.dcx	lda	al_worldx,x
	jsl	perc93A_l
.donex
	sta	pviewposx

; view Y pos = 75% player Y		; 62
	lda	al_worldy,x
	sec
	sbc	viewcy
	jsl	perc75A_l
	clc
	adc	viewcy
	sta	pviewposy
	a8



	jsr		viewmove_srou



	

	s_end_strat


;*****************************************************************************
set_playerOnBridge_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerOnBridge_Istrat
	rtl

playeronBridge_Istrat

	s_start_strat


	s_playerctrl	on

	s_playerfly_mode	Bridge

	s_set_alptrs	x,playeronBridge_strat,playercoll_Istrat,playerdead_Istrat

playeronBridge_strat
	s_start_strat


	jsr		do_player_bridge

	a16

	lda	al_vy,x
	adiv2
	sta	al_vy,x
	

; view X pos = player X pos * 0.5
	lda	al_worldx,x
	jsl	perc62A_l
	sta	pviewposx

; view Y pos = fixed
	lda	ViewCY
	sta	pviewposy
	a8

	jsr		viewmove_srou

	s_end_strat




;*****************************************************************************
playerintunnel_strat
	s_start_strat

	s_achase_var	W,outvx,#0,2
	s_achase_var	W,outvy,#0,2


	jsr		do_playerYvelD2

	a16

;-------------------------------------
; scroll
; view X pos = player X pos * 0.87
	lda	al_worldx,x
	asra
	sta	tpx
	asra
	sta	tpy
	asra
	clc
	adc	tpx
	clc
	adc	tpy
	sta	pviewposx





; view Y pos = fixed
	lda	viewCY
	sta	pviewposy
	a8

;----------------------------------------------------------------------
	jsr		viewmove_srou


	s_end_strat


;*****************************************************************************
set_playerInStunnel_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerInStunnel_Istrat
	rtl

playerinStunnel_Istrat

	s_start_strat

	s_playerctrl	on

	s_playerfly_mode	stunnel

	s_jmp			playerintunnel_Istrat


;*****************************************************************************
set_playerInMtunnel_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerInMtunnel_Istrat
	rtl

playerinMtunnel_Istrat
	s_start_strat
	s_playerctrl	on

	s_playerfly_mode	Mtunnel

	s_jmp			playerintunnel_Istrat

;*****************************************************************************
set_playerInLtunnel_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerInLtunnel_Istrat
	rtl

playerinLtunnel_Istrat
	s_start_strat

	s_playerctrl	on
	s_playerfly_mode	Ltunnel

playerintunnel_Istrat
	s_set_alptrs	x,playerintunnel_strat,playercoll_Istrat,playerdead_Istrat
	s_jmpto_strat	


;*****************************************************************************
set_playerInSTexit_l
	a8i16
	s_playerfly_mode	STexit
	s_set_objtobeplayer	x
	s_set_strat		x,playerinTexit_strat
	s_or_var		B,pshipflags,#psf_noyctrl
	rtl


;*****************************************************************************
set_playerInMTexit_l
	a8i16
	s_playerfly_mode	MTexit
	s_set_objtobeplayer	x
	s_set_strat		x,playerinTexit_strat
	s_or_var		B,pshipflags,#psf_noyctrl
	rtl

;*****************************************************************************
set_playerInLTexit_l
	a8i16
	s_playerfly_mode	LTexit
	s_set_objtobeplayer	x
playerInLTexit_Istrat
	s_set_strat		x,playerinTexit_strat
	s_or_var		B,pshipflags,#psf_noyctrl
	rtl

playerinTexit_strat
	s_start_strat				    	
	s_achase_alvar		W,x,al_worldy,viewcy,2
	s_jmp			playerintunnel_strat


;*****************************************************************************
set_playerInColony_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerInColony_Istrat
	rtl



playerincolony_Istrat
	s_start_strat


	s_playerctrl	on

	s_playerfly_mode	colony

	s_set_alptrs	x,playerincolony_strat,playercoll_Istrat,playerdead_Istrat

playerincolony_strat
	s_start_strat


	jsr		do_playerYvel_colony


	a16

;-------------------------------------
; scroll
; view X pos = player X pos * ?
	lda	al_worldx,x
	jsl	perc62A_l
	sta	pviewposx


;-------------------------------------
; no scroll
;	LDA		#MINVIEWDIST+100
;	STA		OUTDIST
;
;	lda	al_vx,x
;	adiv2
;	adiv2
;	adiv2
;	adiv2
;	sta	al_vx,x
;-------------------------------------



; view Y pos = fixed
	lda	#Stunnel_ViewCY
	sta	pviewposy
	a8

	jsr		viewmove_srou


	s_end_strat

;*****************************************************************************
set_playerInNucleus_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerInNucleus_Istrat
	rtl

playerinnucleus_Istrat
	s_start_strat

	s_playerctrl	on


	s_playerfly_mode	nucleus

	s_set_alvar	W,x,al_worldy,#nucleus_ViewCY
	    
	s_set_alptrs	x,playerinnucleus_strat,playercoll_Istrat,playerdead_Istrat


playerinnucleus_strat
	s_start_strat

	    	
	a16
	lda		player_posx
	asra
	asra
	asra
	asra
	asra
	asra
	asra
	a8
	clc
	adc		player_Ztilt
	sta		player_Ztilt


	jsr		do_playerYvelD2


	a16



; view X pos = player X pos * 0.87
	lda	al_worldx,x
	jsl	perc93A_l
	clc
	adc	viewposXoff
	sta	pviewposx



; view Y pos = fixed
	lda	#nucleus_ViewCY
	clc
	adc	viewposYoff
	sta	pviewposy
	a8

	jsr		viewmove_srou
	

	s_end_strat








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
set_playerturn180_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerturn180_Istrat
	rtl
	

playerturn180_Istrat
	s_start_strat

	s_set_strat		x,playerturn180_strat
	s_set_var		B,psvar_byte1,#64+10

playerturn180_strat
	s_start_strat	
	
	s_copy_alvar2var	W,x,pviewvelz,al_vz


	s_add_var		B,player_Ztilt,#deg45/15
	s_add_var		W,plrotz,#Zrotspeed
	
	s_dec_var		B,psvar_byte1
	s_jmp_varMORE		B,psvar_byte1,#63,playerturn180_cont
	s_add_var		W,player_turnrot,#2*256
	s_jmp_varNOTZERO	B,psvar_byte1,playerturn180_cont

	s_set_strat		x,playerinspace_strat
	s_not_var		B,pshipflags2,#psf2_turn180

playerturn180_cont
      
	s_jmp			playerinspace_strat


;*****************************************************************************
set_playerintocock_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerintocock_Istrat
	rtl
playerintocock_Istrat
	s_start_strat
	s_playerctrl		off
	s_or_var		B,pstratflags,#pstf_novdistC
	s_set_strat		x,playerintocock_strat

	jsr			makeallmedpspeed
playerintocock_strat
	s_start_strat

	rept	2
	s_achase_alvar		W,x,al_worldx,#0,1
	s_achase_alvar		W,x,al_worldy,#space_viewcy,1
	s_achase_var		B,player_Ztilt,#0,1
	s_achase_var		W,plrotz,#0,1
	s_achase_var		W,outdist,#0,1,playerintocock2_init
	endr


	s_jmp			playerinspace_strat

playerintocock2_init
	s_set_strat		x,playerintocock2_strat

	s_set_var		W,outdist,#0
	s_set_var		W,outvx,#0
	s_set_var		W,outvy,#0
	s_set_var		W,outvz,#0

	s_set_alvar		W,x,al_worldz,pviewposz
	s_add_alvar		W,x,al_worldz,#inviewdist

	jsr			dupplayer
	s_ldajsl		B,#pshipnum_zoom,setYplayershape_l
	s_set_strat		y,cockdumpl_Istrat
	s_set_var		B,psvar_byte1,#20

	a16
	lda			al_worldz,x
	sec
	sbc			pviewposz
	asl	a
	asl	a
	asl	a
	asl	a
	clc
	adc			pviewposz
	sta.w			al_worldz,y
	a8

playerintocock2_strat
	s_start_strat
	s_decbne_var		B,psvar_byte1,playerstraight_strat

	s_playerfly_mode	bigspace,nomacro

	s_set_var		B,splayerflymode,#spfm_inside
	s_clr_alsflag		x,colldisable
	s_set_strat		x,playerinspace_strat
	s_playerctrl		on
	s_and_var		B,pstratflags,#~pstf_novdistC
	s_set_var		B,splayerflymode,#spfm_inside
	s_set_alvar		B,x,al_sbyte2,#10
	s_jmp			playerinspace_strat



cockdumpl_Istrat
	s_start_strat	
	s_set_aldata	x,#hardhp,#0
	s_set_alsflag	x,colldisable
	s_set_strat	x,cockdumpl_strat
	s_clr_alsflag	x,sflag1
	s_set_lifecnt	x,#8
	s_zero_rots	x
cockdumpl_strat
	s_start_strat
	s_dec_lifecnt	x
	s_add_playerZ	x
	s_add_alvar	W,x,al_worldz,#-160		; -83


	s_jmp_alsflag		x,sflag1,.badobj
	s_set_objtobeplayer	y
	s_jmp_objinfront	y,x,.docock
	s_jmp_Zdistmore		x,y,#50,.badobj
.docock
	s_make_obj		#cockpit,.badobj
	s_set_alsflag		x,sflag1
	phx
	s_set_objtobeplayer	x
	s_copy_pos		y,x
;	s_add_alvar		W,y,al_worldz,#65
	s_set_strat		y,cockpit_Istrat
;	s_set_alvar		B,y,al_roty,#deg180
	plx
.badobj
	s_end_strat
	

cockpit_Istrat
	s_start_strat	
	s_set_aldata	x,#hardhp,#0
	s_set_alsflag	x,colldisable
	s_set_strat	x,cockpit_strat
cockpit_strat
	s_start_strat
	s_dec_lifecnt	x
	s_add_playerZ	x
	s_add_alvar	W,x,al_worldz,#-10
	s_end_strat




;*****************************************************************************
set_playeroutofcock_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playeroutofcock_Istrat
	rtl
playeroutofcock_Istrat
	s_start_strat
	s_playerctrl		off
	s_and_var		B,pstratflags,#~pstf_novdistC
	s_set_strat		x,playeroutofcock_strat

	s_set_var		W,viewdist,#outviewdist
	s_set_var		W,outdist,#outviewdist
	s_set_var		W,outvx,#0
	s_set_var		W,outvy,#0
	s_set_var		W,outvz,#0

	s_set_var		B,psvar_byte1,#23	; 22

	jsr			makeallmedpspeed

playeroutofcock_strat
	s_start_strat

	rept	2
	s_achase_alvar		W,x,al_worldx,#0,1
	s_achase_alvar		W,x,al_worldy,#space_viewcy,1
	s_achase_var		B,player_Ztilt,#0,1
	s_achase_var		W,plrotz,#0,1
	endr

	s_jmp_varNE		B,psvar_byte1,#19,.badobj1
	s_make_obj		#cockpit,.badobj
	s_copy_pos		y,x
	s_sub_alvar		W,y,al_worldz,#65+40
	s_set_strat		y,cockpitout_Istrat
;	s_set_alvar		B,y,al_roty,#deg180
.badobj


	s_make_obj		#nullshape,.badobj1
	s_ldajsl		B,#pshipnum_zoom,setYplayershape_l
	s_copy_pos		y,x
	s_sub_alvar		W,y,al_worldz,#611
	s_set_strat		y,cockshipout_Istrat
.badobj1

	s_jmpNOT_varAND		B,pshipflags2,#psf2_playerHP0,.ndying
	s_add_var		B,player_Zstratadd,#4
.ndying


	s_decbne_var		B,psvar_byte1,playerstraight_strat

	s_playerfly_mode	space,nomacro

;	lda			#pshipnum_norm		
;	s_jsl			select_ship_l
 	s_clr_alsflag		x,invisible
	
	
	s_jmp_varAND		B,pshipflags2,#psf2_playerHP0,playerdead_Istrat

	s_set_strat		x,playerinspace_strat
	s_JMP_varAND		B,pstratflags,#pstf_inseq,.npcon
	s_playerctrl		on
.npcon
	s_set_var		W,viewdist,#outviewdist
	s_set_var		B,splayerflymode,#spfm_norm
	s_clr_alsflag		x,hitflash
	s_jmp			playerinspace_strat



cockshipout_Istrat
	s_start_strat	
	s_set_aldata	x,#hardhp,#0
	s_set_alsflag	x,colldisable
	s_set_strat	x,cockshipout_strat
	s_setnoremove_behind	x
	s_set_lifecnt	x,#19
	s_set_alvar	W,x,al_sword1,#60
cockshipout_strat
	s_start_strat


	s_jmpNOT_varAND		B,pshipflags2,#psf2_playerHP0,.ndying
	s_set_alvar		B,x,al_rotz,player_Zstratadd
.ndying


	s_jmpNOT_varAND		B,pshipflags2,#psf2_playerHP0,.npf
	s_jmp_NOTdelay		1,.npf
	s_set_alsflag		x,hitflash
.npf

	s_set_alvar	W,x,al_worldx,player_posx
	s_set_alvar	W,x,al_worldy,player_posy

	s_dec_lifecnt	x
	s_add_playerZ	x
	s_add_alvars	W,x,al_worldz,x,al_sword1
;	s_jmp_alvarEQ	W,x,al_sword1,#176,.nadd	; 156
	s_add_alvar	W,x,al_sword1,#10
.nadd	s_end_strat

cockpitout_Istrat
	s_start_strat	
	s_set_aldata	x,#hardhp,#0
	s_set_alsflag	x,colldisable
	s_set_strat	x,cockpitout_strat
	s_setnoremove_behind	x
	s_set_lifecnt	x,#8
cockpitout_strat
	s_start_strat

	s_jmpNOT_varAND		B,pshipflags2,#psf2_playerHP0,.ndying
	s_set_alvar		B,x,al_rotz,player_Zstratadd
.ndying

	s_set_alvar	W,x,al_worldx,player_posx
	s_set_alvar	W,x,al_worldy,player_posy
	s_dec_lifecnt	x
	s_add_playerZ	x
	s_add_alvar	W,x,al_worldz,#20
	s_end_strat


;*****************************************************************************
playernull_Istrat
	s_start_strat
	s_set_var		W,pviewvelz,#medpspeed
	s_add_alvar		W,x,al_worldz,pviewvelZ
	s_add_var		W,pviewposz,pviewvelZ
	s_end_strat




;*****************************************************************************

viewmove_srou

	ifeq	0
	lda	#%00000100
	sta	playersndflag

	s_jmp_alvarZERO	B,x,al_sbyte2,.nbb
	s_jmpNOT_varAND		B,pshipflags2,#psf2_boosting,.nboost
	lda	#%00001000
	sta	playersndflag
	bra	.nbb
.nboost
	s_jmpNOT_varAND		B,pshipflags2,#psf2_braking,.nbb
	lda	#%00001100
	sta	playersndflag
.nbb
	endc

	s_jmp_varAND	B,pstratflags,#pstf_noviewmove,.end


; view distance
	s_jmp_varAND	B,pstratflags,#pstf_novdistC,.novc
	s_achase_var	W,outdist,viewdist,3
.novc


	s_add_var		W,pviewposz,pviewvelz
	s_Fchase_var2alvar	W,x,pviewvelz,al_vz,1


	a16
	lda	pviewposz
	sec
	sbc	player_posz
	range	-200,50
	clc
	adc	player_posz
	sta	pviewposz


.endviewpos
	a8

	s_jmp_alvarmore		B,x,al_sbyte2,#10,.normspd
	s_set_var		B,player_tospeed,player_medspeed
	s_achase_var		W,pviewposz,player_posz,3

.normspd
	s_speedto		x,player_tospeed,2

.nvchase
;---------------------------------------------
; MM hack
	s_jmp_varNE		B,splayerflymode,#spfm_inside,.nvin
	s_copy_alvar2var	W,x,pviewposx,al_worldx
	s_copy_alvar2var	W,x,pviewposy,al_worldy
	s_copy_alvar2var	W,x,pviewposz,al_worldz
.nvin
;---------------------------------------------

.end
	s_copy_var2var		W,bgsscrollZ,viewposz


	s_rts



;*****************************************************************************
Xrotspeed		equ	2*256
Zrotspeed		equ	2*256
playermove_init_l
	jsr	playermove_init
	rtl
playermove_init
	a8
	lda	#1
	sta.l	m_particlesON
	sta.l	m_particlesON+1
	lda	#viewtype_norm
	sta	viewtype
	stx	viewpt
	stx	playpt
	stx	viewtoobj
	stx	internalPLAYPT

	s_set_var		W,viewdist,#outviewdist
	s_set_var		W,outdist,#outviewdist

	s_setnoremove_behind	x

	s_set_aldata	x,#-1,#8
	s_set_alsflag	x,shadow
	s_set_var	W,plrotx,#0
	s_set_var	W,plroty,#0
	s_set_var	W,plrotz,#0
	s_set_var	B,slimecount,#0
	
	s_set_var	B,pstratflags,#0

	s_set_var		W,player_turnrot,#0
	s_set_var		B,player_ztilt,#0
	s_set_var		W,player_zshake,#0
	s_set_var		B,player_zstratadd,#0
	s_set_var		B,player_rollZvel,#0
	s_set_var		B,player_rollZoff,#0

	s_set_var		B,pnumhits,#0
	s_set_var		B,numplasers,#0

	s_set_var		B,specialdelay,#1

	s_set_var		W,pviewposz,#0
	s_set_var		B,playerdieYrotspeed,#128

	s_set_var		W,pviewvelz,#medpspeed
	s_set_var		B,player_tospeed,#medpspeed
	s_set_var		B,player_medspeed,#medpspeed
	s_set_var		W,playervelZ,#medpspeed

	s_set_var		B,boostZoff,#-30

	s_set_var		B,nomaxbg2Yscroll,#0

	stz	fadetored

	jsr	setcurrpshape
	
	s_and_var		B,pshipflags3,#~(psf3_intunnel!psf3_forcebrake!psf3_nocollisions)
	s_or_var		B,pshipflags3,#psf3_enginesnd

;	s_or_var		B,pshipflags3,#psf3_beamball
	rts

playerstart_init_l
	a8
	s_set_var	W,specwepcnt,#defaultNukeCount ; Number of Nova Bombs to start with
	s_set_var	B,pshipflags,#0
	s_set_var	B,pshipflags2,#0
	s_set_var	B,pshipflags3,#0
	stz	shieldup
	lda	#pshipnum_norm
	sta	curr_ship
	jsl	select_ship_l
	rtl


makeallmedpspeed
	s_set_speed		x,#medpspeed
	s_set_var		W,pviewvelz,#medpspeed
	s_set_var		B,player_medspeed,#medpspeed
	s_set_var		B,player_tospeed,#medpspeed
	s_set_var		W,playervelZ,#medpspeed
	rts

;********************************************************************************************
playermove_srou

;-------------------------------------------------------------------
; wire ship (Shield Power-up) num hits check.
	s_jmpNOT_varAND		B,pshipflags2,#psf2_wireship,.notwire
	s_jmp_varlesseq		B,pnumhits,#3-1,.iswire
	
	s_beqdec_var		B,wireendflash,.backtonorm
	s_jmp_varAND		B,wireendflash,#3,.wire
	stz			shieldup
	lda			#pshipnum_norm
	sta			curr_ship
	jsl			select_ship_l
	brl			.notwire    
.wire	lda		#1
	sta		shieldup
	lda			#pshipnum_wire
	sta			curr_ship
	jsl			select_ship_l
	brl			.notwire    
.backtonorm
	stz			shieldup
	lda			#pshipnum_norm
	sta			curr_ship
	jsl			select_ship_l
	s_and_var		B,pshipflags2,#~psf2_wireship
.iswire    
	s_set_var		B,wireendflash,#50
.notwire    

;-------------------------------------------------------------------




;	s_jmpNOT_varAND		B,pshipflags2,#psf2_turn180,.nturn180
;	s_set_var		W,player_turnrot,#deg180*256
;	s_brl			.t180cont
;.nturn180
;	s_set_var		W,player_turnrot,#0
;.t180cont


	s_beqdec_alvar		B,x,al_sbyte1,.nhfl
	s_set_var2rnd		viewshakeX,#15
	s_sub_var		B,viewshakeX,#7
	s_set_var2rnd		viewshakeY,#15
	s_sub_var		B,viewshakeY,#7
	s_set_var2rnd		viewshakeZ,#15
	s_sub_var		B,viewshakeZ,#7
	s_jmp_notdelay		1,.done
	s_set_alsflag		x,hitflash
	s_set_alsflag		x,nohitaffect
	s_bra			.done

.nhfl
	s_clr_alsflag		x,nohitaffect

	stz			viewshakeX
	stz			viewshakeY
	stz			viewshakeZ
.done

	

;-----------------------------------------------------------------------

	s_set_var		W,svar_word1,maxpmoveY
	s_varsub_alvar		W,x,svar_word1,al_vy

	s_jmp_higher	x,svar_word1,.ngnd
	s_jmp_alvarEQ	W,x,al_worldy,svar_word1,.ngnd
	s_or_var	B,pmovelimit,#pml_Bbottom
.ngnd


;-----------------------------------------------------------------------



	  
	lda		pmovelimit
	and		pmovelimitAND
	sta		pmovelimit


	jsr		setcurrpshape


	lda		al_vel,x
	sta		player_speed
	sexam		player_speed+1


;-----------------------------------------------------------------------
	s_test_var		B,pmovelimit,#pml_Bbottom
	s_beq			.nfup
	s_jmp_alvarmi		W,x,al_vy,.nfup
	s_jmp_alvarmore		B,x,al_vel,player_medspeed,.fast
	s_jmp_keydown		jdown,.nfd
	s_set_var		W,plrotx,#0
.nfd	s_set_alvar		W,x,al_worldy,maxpmoveY
	s_bra			.nfup
.fast
	s_set_alvar		W,x,al_worldy,maxpmoveY

	IFNE	mouseon
	lda	mousemode
	beq	.normalwingbounce
	a16
	lda			plrotx
	sec
	sbc	#40
	sta			plrotx		
	a8
	bra	.donewingbounce
	
.normalwingbounce
	ENDC
	a16
	lda			plrotx
	nega
	asra
	sta			plrotx		
	a8
.donewingbounce
	s_or_var		B,pmovelimit,#pml_lwbottom!pml_rwbottom

	s_set_var		B,player_noctrlcnt,#4

;	s_set_objtobevar	y,pcboxobj_B
;	s_set_alsflag		y,collide
;	lda.w			al_HP,y
;	sec
;	sbc			#1
;	sta.w			al_HP,y


.nfup

	s_and_var		B,arrows,#~(sprar_up!sprar_down)
	s_test_var		B,pmovelimitAND,#pml_Bbottom
	s_bne			.nfpbottom
	s_jmp_alvarless		W,x,al_worldy,maxpmoveY,.nfpbottom
	s_set_alvar		W,x,al_worldy,maxpmoveY
	s_or_var		B,arrows,#sprar_down
.nfpbottom


	s_jmp_alvarmore		W,x,al_worldy,minpmoveY,.nfptop
	s_set_alvar		W,x,al_worldy,minpmoveY
	s_or_var		B,arrows,#sprar_up
.nfptop

;------------------------------------------------------------------------


	s_test_var		B,gameflags,#gf_viewrot	
	s_beq			.noviewrot

	s_test_var		B,pshipflags,#psf_noctrl!psf_noYctrl
	s_bne			.zerovrot


;	s_test_var		B,pmovelimitAND,#pml_Bbottom
;	s_bne			.nvxmax
;	s_jmp_alvarless		W,x,al_worldy,maxpmoveY,.nvxmax
	s_jmp_keyup		jup,.nvxmax
	s_add_var		W,outvx,#-256*1
.nvxmax
;	s_jmp_alvarmore		W,x,al_worldy,minpmoveY,.nvxmin
	s_jmp_keyup		jdown,.nvxmin
	s_sub_var		W,outvx,#-256*1
.nvxmin

	s_set_var		W,svar_word1,minPmoveX
	s_add_var		W,svar_word1,#300
	s_set_var		W,svar_word2,maxPmoveX
	s_sub_var		W,svar_word2,#300
	
	s_jmp_alvarmore	W,x,al_worldX,svar_word1,.nvymin
	s_jmp_keyup		jleft,.nvymin
	s_sub_var		W,outvy,#200*1
.nvymin
	s_jmp_alvarless	W,x,al_worldX,svar_word2,.nvymax
	s_jmp_keyup		jright,.nvymax
	s_add_var		W,outvy,#200*1
.nvymax
.zerovrot

	s_achase_var		W,outvx,#0,3
	s_achase_var		W,outvy,#0,3
.noviewrot

;.noviewrot



;------------------------------------------------------------------------
; wing hitting walls or ground.

	s_test_var		B,pmovelimit,#pml_lwtop!pml_rwtop
	s_beq			.nwt
	s_add_var		W,plrotx,#256*3
.nwt

	s_test_var		B,pmovelimit,#pml_lwbottom!pml_rwbottom
	s_beq			.nwb


	IFNE	MOUSEON
	lda	mousemode
	beq	.normalbounce
	a16
	lda			plrotx
	nega
	sec
	sbc			#40		; 256*10 = push wing up 
	sta			plrotx		; so not hit gnd again.	
	a8
	bra	.donebounce
	ENDC

.normalbounce
	a16
	lda			plrotx
	nega
	sec
	sbc			#256*10		; 256*10 = push wing up 
	sta			plrotx		; so not hit gnd again.	
	a8


.donebounce
	s_set_var		B,player_noctrlcnt,#4
.nwb



	s_set_objtobevar	y,pcboxobj_LW
	s_test_var		B,pmovelimit,#pml_lwtop
	s_bne			.lwc
	s_test_var		B,pmovelimit,#pml_lwbottom
	s_beq			.nlwc
.lwc
	s_set_alsflag		y,collide
.nlwc


	s_set_objtobevar	y,pcboxobj_RW
	s_test_var		B,pmovelimit,#pml_rwtop
	s_bne			.rwc
	s_test_var		B,pmovelimit,#pml_rwbottom
	s_beq			.nrwc
.rwc
	s_set_alsflag		y,collide
.nrwc


	s_test_var		B,pmovelimit,#pml_lwleft
	s_beq			.dplt
	s_add_alvar		W,x,al_worldx,pwingdistwall
	s_set_objtobevar	y,pcboxobj_LW
	s_set_alsflag		y,collide
	s_brl			.dprt
.dplt
	s_test_var		B,pmovelimit,#pml_rwright
	s_beq			.dprt
	s_add_alvar		W,x,al_worldx,pwingdistwall
	s_set_objtobevar	y,pcboxobj_RW
	s_set_alsflag		y,collide
.dprt




;--------------------------------------
; wing hit object.

	IFNE		player_collmove
	s_test_var		B,pshipflags,#psf_Rwingcoll
	lbeq			.nrp
	s_set_var		W,player_Zshake,#2*256
	s_Achase_var		W,plrotz,#deg45*256,4
	s_Achase_var		B,player_Ztilt,#deg45/2,1
.nrp


	lda			pshipflags
	and			#psf_Lwingcoll
	lbeq			.nlp
	s_set_var		W,player_Zshake,#-2*256
	s_Achase_var		W,plrotz,#-deg45*256,4
	s_Achase_var		B,player_Ztilt,#-deg45/2,1
.nlp
	ENDC


;--------------------------------------
; boost decrement
	s_jmp_alvarZERO		B,x,al_Sbyte2,.dtsi
	s_decbne_alvar		B,x,al_sbyte2,.dtsi
	s_and_var		B,pshipflags2,#~(psf2_boosting!psf2_braking)
.dtsi

	s_jmpNOT_varAND		B,pshipflags2,#psf2_forceboost,.nfboost
	s_and_var		B,pshipflags2,#~psf2_forceboost
	s_brl			.boost
.nfboost

	s_jmpNOT_varAND		B,pshipflags3,#psf3_forcebrake,.nfbrake
	s_and_var		B,pshipflags3,#~psf3_forcebrake
	s_brl			.brake
.nfbrake

;--------------------------------------

	s_jmp_varNE	B,stayblack,#-1,.no_pctrl
	s_jmp_varNOTZERO	B,doingwipe,.no_pctrl
	s_test_var		B,pshipflags,#psf_noctrl
	s_bne			.no_pctrl

	lda			player_noctrlcnt
	beq			.ctrl
	dec			player_noctrlcnt
	brl			.no_pctrl
.ctrl


;--------------------------------------
; speed.

	s_jmp_alvarNOTZERO		B,x,al_sbyte2,.npsd

	lda.l			m_boostanim
	cmp			#40
	lbcc			.npsd

	IFNE	MOUSEON
	lda	mousemode
	lbeq	.nomouse4
	lda	boostorbrake
	lbne	.nomouse4
	s_jmp_alvareq	B,x,al_sbyte5,#70,.noswapper2
	lda	mouse_sw1
	cmp	#3
	beq	.mousebooststuff
	bra	.nomouse3
.mousebooststuff
	s_jmp_alvareq	B,x,al_sbyte6,#1,.boostitup			;if sbyte 6 is 1, don't process any of this, time is up

	s_jmp_alvareq	B,x,al_sbyte5,#0,.setit				;if sbyte 5 is 0, set it to the timer value
	s_sub_alvar		B,x,al_sbyte5,#1					;otherwise, subtract 1
	s_jmp_alvareq	B,x,al_sbyte5,#1,.noswapper			;if sbyte 5 is 1, jump to .noswapper

	lda	mouse_swt1							
	cmp	#3
	beq	.swaptobrake									;if mouse trigger is 3, go to .swaptobrake
	bra	.boostitup										;otherwise, boost it like normal
	
.noswapper
	s_set_alvar		B,x,al_sbyte6,#1					;no more opportunity until this is reset
	s_set_alvar		B,x,al_sbyte5,#50
	bra	.boostitup										;continue boosting

.noswapper2
	s_set_alvar		B,x,al_sbyte6,#0					;reset sbyte5/6
	s_set_alvar		B,x,al_sbyte5,#0
	bra	.nomouse4
	
.swaptobrake											;when ready to swap, go here
	turnonoff	boostorbrake
	s_set_alvar		B,x,al_sbyte5,#60					;frame timer for brake
	s_set_alvar		B,x,al_sbyte6,#0
	bra	.nomouse4
.setit
	s_set_alvar		B,x,al_sbyte5,#10					;frame timer
	s_set_alvar		B,x,al_sbyte6,#0
	bra	.boostitup
	
.nomouse3
	s_jmp_alvareq	B,x,al_sbyte5,#0,.nomouse4
	s_jmp_alvareq	B,x,al_sbyte5,#50,.noswapper2
	s_sub_alvar		B,x,al_sbyte5,#1

.nomouse4
	ENDC

	s_jmp_keyup		x,.npsi
;	s_jmp_keydown		b,.npsi
.boostitup
	s_jmp_varAND		B,pshipflags2,#psf2_boosting,.boost
	trigse			$32
.boost

	s_or_var		B,pshipflags2,#psf2_boosting


	lda			#1
	IFEQ	INFBOOST
	sta.l			m_boostcnt
	ENDC

	s_set_vartobeobj	boostobj,x
	s_set_speed		x,#maxpspeed
	s_set_var		B,player_tospeed,#maxpspeed
	IFEQ	INFBOOST
	s_set_alvar		B,x,al_sbyte2,#20
	ENDC
      	s_jmp_varEQ		B,splayerflymode,#spfm_inside,.nboostspr
	boost_sprite
.nboostspr
	trigse			$32

	s_jmp			.npsd
.npsi
;--------------------------------------------------------
	IFNE	MOUSEON
	lda	mousemode
	lbeq	.nomousebrake
	lda	boostorbrake
	lbeq	.nomousebrake
	s_jmp_alvareq	B,x,al_sbyte5,#60,.noswapper21
	lda	mouse_sw1
	cmp	#3
	beq	.mousebrakestuff
	bra	.nomousebrake2
	
.mousebrakestuff
	s_jmp_alvareq	B,x,al_sbyte6,#1,.brake			;if sbyte 6 is 1, don't process any of this, time is up

	s_jmp_alvareq	B,x,al_sbyte5,#0,.setit1				;if sbyte 5 is 0, set it to the timer value
	s_sub_alvar		B,x,al_sbyte5,#1					;otherwise, subtract 1
	s_jmp_alvareq	B,x,al_sbyte5,#1,.noswapper1			;if sbyte 5 is 1, jump to .noswapper

	lda	mouse_swt1							
	cmp	#3
	beq	.swaptobrake1								;if mouse trigger is 3, go to .swaptobrake
	bra	.brake										;otherwise, boost it like normal
	
.noswapper1
	s_set_alvar		B,x,al_sbyte6,#1					;no more opportunity until this is reset
	s_set_alvar		B,x,al_sbyte5,#50
	bra	.brake										;continue boosting

.noswapper21
	s_set_alvar		B,x,al_sbyte6,#0					;reset sbyte5/6
	s_set_alvar		B,x,al_sbyte5,#0
	bra	.brake
	
.swaptobrake1											;when ready to swap, go here
	turnonoff	boostorbrake
	s_set_alvar		B,x,al_sbyte5,#70
	s_set_alvar		B,x,al_sbyte6,#1
	bra	.brake
.setit1
	s_set_alvar		B,x,al_sbyte5,#10
	s_set_alvar		B,x,al_sbyte6,#0
	bra	.brake
	
.nomousebrake2
	s_jmp_alvareq	B,x,al_sbyte5,#0,.nomousebrake
	s_jmp_alvareq	B,x,al_sbyte5,#50,.noswapper21
	s_sub_alvar		B,x,al_sbyte5,#1


.nomousebrake
	ENDC
	s_jmp_keyup		b,.notbraking


.brake
	IFNE	INFBRAKE
    s_or_var	B,pshipflags2,#psf2_braking
    trigse	$33
    lda	#1
    s_set_vartobeobj	boostobj,x
    s_set_speed	x,#minpspeed
    s_set_var	B,player_tospeed,#minpspeed

.npsd

	ENDC

	IFEQ	INFBRAKE
	s_or_var	B,pshipflags2,#psf2_braking
	trigse	$33
	lda	#1
	sta.l	m_boostcnt
	s_set_var	B,player_tospeed,#minpspeed
	s_set_alvar	B,x,al_sbyte2,#30

.npsd

	s_test_var		B,pshipflags,#psf_noctrl
	s_bne			.no_pctrl
	ENDC
.notbraking

;----------------------------------------------------
; movement left/right.



	stz	tpa
	stz	tpa+1

	s_jmp_anyJLRkeyup	.nlrm
	lda	player_Ztilt
	asra
	asra
	asra
;	asra
	a16
	sexa
	sta	tpa

.nlrm
	a16
	lda	plrotz
	asra
	asra
	asra
	asra
	asra
	asra
	asra	;*
	adiv2
	clc
	adc	tpa
	nega
	sta	svar_word1
	a8

	s_jmpNOT_varAND	B,pshipflags2,#psf2_turn180,.nzadd180
	s_sub_alvar	W,x,al_worldx,svar_word1
	s_brl		.noxmove
.nzadd180
	s_add_alvar	W,x,al_worldx,svar_word1

.noxmove


	
;----------------------------------------------------
	s_set_var		W,svar_word1,maxPmoveY
	s_sub_var		W,svar_word1,#30


	s_test_var		B,pmovelimit,#pml_lwleft
	s_bne			.eplrc
	s_jmp_keyup		jleft,.eplrc

	s_test_var		B,pmovelimitAND,#pml_Bbottom
	beq			.dztl
	s_jmp_lower		x,svar_word1,.nztl
.dztl	s_add_var		B,player_Ztilt,#deg45/15
.nztl
	s_add_var		W,plrotz,#Zrotspeed
	IFEQ	mouseon
	s_add_var		W,plroty,#Zrotspeed
	ENDC
	
	IFNE	mouseon
	a8
	lda	mousemode
	bne	.mouseleftleft
	s_add_var		W,plroty,#Zrotspeed
	bra	.eplrc
.mouseleftleft
	s_sub_alvar		W,x,al_worldx,#16
	ENDC
;right
.eplrc
	s_test_var		B,pmovelimit,#pml_rwright
	s_bne			.eprrc
	s_jmp_keyup		jright,.eprrc

	s_test_var		B,pmovelimitAND,#pml_Bbottom
	beq			.dztr
	s_jmp_lower		x,svar_word1,.nztr
.dztr	s_sub_var		B,player_Ztilt,#deg45/15
.nztr
	s_sub_var		W,plrotz,#Zrotspeed
	IFEQ	mouseon
	s_sub_var		W,plroty,#Zrotspeed
	ENDC

	IFNE	mouseon
	lda	mousemode
	bne	.mouserightright
	s_sub_var		W,plroty,#Zrotspeed
	bra	.eprrc
.mouserightright
	s_add_alvar		W,x,al_worldx,#16
	ENDC
.eprrc
	IFNE	mouseon
	lda	mousemode
	lbeq	.nomouse5
	lda	mouse_x1
	lbeq	.nomouse5
	and	#%10000000
	lbeq	.rightmouse
	bra		.leftmouse

.leftmouse
	s_test_var		B,pmovelimitAND,#pml_Bbottom
	beq			.dztl2
	s_jmp_lower		x,svar_word1,.nztl2
.dztl2	s_add_var		B,player_Ztilt,#deg45/15
.nztl2
	s_add_var		W,plrotz,#Zrotspeed
	lda.w			al_roty,x
	cmp				#(deg11*(2))
	lbpl	.nomouse5
	lda	mouse_x1
	cmp	#$84
	bmi	.slower3
	cmp	#$88
	bmi	.norm3
	bra	.faster3

.slower3
	s_add_var		W,plroty,#(Zrotspeed/4)*3
	jmp	.nomouse5

.faster3
	s_add_var		W,plroty,#(Zrotspeed*3)/2
	jmp	.nomouse5

.norm3
	s_add_var		W,plroty,#Zrotspeed
	jmp	.nomouse5


.rightmouse									;if mouse, jumps here
	s_sub_var		W,plrotz,#Zrotspeed
	lda.w			al_roty,x
	cmp				#(-deg11*(2))
	lbmi	.nomouse5
	lda	mouse_x1
	cmp	#4
	bmi	.slower4
	cmp	#8
	bmi	.norm4
	bra	.faster4

.slower4
	s_sub_var		W,plroty,#(Zrotspeed/4)*3
	bra	.nomouse5

.norm4
	s_sub_var		W,plroty,#Zrotspeed
	bra	.nomouse5

.faster4
	s_sub_var		W,plroty,#(Zrotspeed*3)/2
	bra	.nomouse5


.nomouse5
	ENDC

;-----------------------------------------------------------------------


	s_test_var		B,pshipflags,#psf_noYctrl
	s_bne			.no_yctrl

	s_jmp_keyup		jup,.nhu
	IFEQ	mouseon
	s_add_var		W,plrotx,#Xrotspeed
	ENDC

	IFNE	mouseon
	lda	mousemode
	bne	.mouseupup
	s_add_var		W,plrotx,#Xrotspeed
	bra	.nhu
.mouseupup
	s_add_alvar		W,x,al_worldy,#20
	ENDC
.nhu
	s_jmp_keyup		jdown,.nhd
;	s_jmp_alvarlesseq	W,x,al_worldy,minpmoveY,.nhd
	IFEQ	mouseon
	s_sub_var		W,plrotx,#Xrotspeed
	ENDC
	IFNE	mouseon
	lda	mousemode
	bne	.mousedowndown
	s_sub_var		W,plrotx,#Xrotspeed
	bra	.nhd
.mousedowndown
	s_sub_alvar		W,x,al_worldy,#20
	ENDC
.nhd
	IFNE	mouseon
	lda	mousemode
	lbeq	.no_yctrl
	lda	mouse_y1		;loading mouse_y1
	lbeq	.no_yctrl
	and	#%10000000
	beq	.ypos			;if its less than 0, its going down?
	bra	.yneg			;if its greater than 0, its going up (can add speeds later)

.ypos			;down, sorry for label
.oneptfiveup
	lda.w	al_rotx,x
	cmp	#(deg11*(3/2))+5
	lbpl	.noyinc
	lda	mouse_y1
	cmp	#4
	bmi	.slower1
	cmp	#8
	bpl	.faster1
	bra	.norm1

.slower1
	s_add_var		W,plrotx,#(Xrotspeed/4)*3
	bra	.noyinc

.faster1
	s_add_var		W,plrotx,#(Xrotspeed*3)/2
	bra	.noyinc

.norm1
	s_add_var		W,plrotx,#Xrotspeed
	bra	.noyinc

	
.yneg					;up, sorry for label
.oneptfivedown
	lda.w	al_rotx,x

	cmp	#(-deg11*(3/2))
	bmi	.noyinc
	lda	mouse_y1
	cmp	#$84
	bmi	.slower2
	cmp	#$88
	bpl	.faster2
	bra	.norm2

.slower2
	s_sub_var		W,plrotx,#(Xrotspeed/4)*3
	bra	.noyinc

.faster2
	s_sub_var		W,plrotx,#(Xrotspeed*3)/2
	bra	.noyinc

.norm2
	s_sub_var		W,plrotx,#Xrotspeed
	bra	.noyinc
.noyinc
	ENDC
.no_yctrl

.nhjr


	IFNE			debuginfo2
	s_jmp_keyup		b,.nsupersLRkey
	s_jmp_keydown		x,.noLRkeys
.nsupersLRkey
	ENDC

; Peppy's favorite part

	s_jmp_varNOTZERO	B,player_rollZvel,.nroll

	s_beqdec_var		B,player_rolldelay,.lragain
	s_jmp_anyLRkeyup	.nroll
	s_jmp_anyLRkeydown	.nroll,last
	s_set_var		B,player_rollZvel,#-32	
	s_set_var		B,player_rollZoff,#0
	s_jmp_keyup		left,.isright
	s_set_var		B,player_rollZvel,#32	
	s_set_var		B,player_rollZoff,#0
.isright
.lragain
	s_jmp_anyLRkeyup	.nroll
	IFNE	_60fps
	s_set_var		B,player_rolldelay,#10 ; increase input window for barrel rolling in 60fps
	ELSEIF
	s_set_var		B,player_rolldelay,#3 ; change #3 to another number to change how responsive barrel rolls are (ex. #5)
	ENDC
.nroll


	s_and_var		B,keyflags,#~kf_LRkeydown
	s_jmp_keyup		left,.nlk
	s_or_var		B,keyflags,#kf_LRkeydown
	s_jmp_lastkeydown	left,.nrk2
	s_or_var		B,keyflags,#kf_Lkeydown
	s_brl			.nrk2
.nlk
	s_jmp_keyup		right,.nrk2
	s_and_var		B,keyflags,#~kf_Lkeydown
.nrk2

	s_jmp_keyup		right,.nrk
	s_or_var		B,keyflags,#kf_LRkeydown
	s_jmp_lastkeydown	right,.nlk2
	s_and_var		B,keyflags,#~kf_Lkeydown
	s_brl			.nlk2	 
.nrk
	s_jmp_keyup		left,.nlk2
	s_or_var		B,keyflags,#kf_Lkeydown
.nlk2







	s_jmpNOT_varAND		B,keyflags,#kf_LRkeydown,.nhtr
	s_jmpNOT_varAND		B,keyflags,#kf_Lkeydown,.nhtl
	s_add_var		B,player_Ztilt,#deg45/3
	s_cmp_var		B,player_Ztilt,#deg90
	s_bmi			.nhptc
	s_set_var		B,player_Ztilt,#deg90
	s_jmp			.nhptc
.nhtl
	s_jmp_keyup		right,.nhtr
.drt	s_sub_var		B,player_Ztilt,#deg45/3
	s_cmp_var		B,player_Ztilt,#-deg90
	s_bpl			.nhptc
	s_set_var		B,player_Ztilt,#-deg90
	s_jmp			.nhptc
.nhtr

.noLRkeys

.no_pctrl


	s_Achase_var		B,player_Ztilt,#0,3
;	d_print_var		B,player_Ztilt,1

.nhptc

;-----------------------------------------------------------------------

	IFNE	mouseon
	lda	mousemode
	bne	.nochase1
	ENDC
	s_Achase_var		W,plroty,#0,3

.nochase1

;--------------------------------------
; super speed.
	IFNE	debuginfo2
	s_jmp_keyup		b,.nsp
	s_jmp_keyup		x,.nsp
	s_set_alsflag		x,colldisable
	bra			.dsp
.nsp	s_clr_alsflag		x,colldisable
.dsp

	elseif

	s_clr_alsflag		x,colldisable

	endc




;-------------------------------------------------------------------
; Z rotation chase.
	IFEQ	player_quickstop
	s_Achase_var	W,plrotz,#0,4
	ELSEIF
	s_Achase_var	W,plrotz,#0,1
	ENDC
;-------------------------------------------------------------------

	IFNE	mouseon
	lda	mousemode
	bne	.nochase2
	ENDC
	s_Achase_var	W,plrotx,#0,3
.nochase2	

	STZ			pmovelimit


				 
	s_limit_alvar		B,x,al_vel,minPspeed,maxPspeed

	s_limit_var		W,plrotz,-$600,$600
	s_copy_var2alvar	B,x,al_rotx,plrotx+1
	s_copy_var2alvar	B,x,al_roty,plroty+1
	s_add_alvar		B,x,al_roty,player_turnrot+1
	s_copy_var2alvar	B,x,al_rotz,plrotz+1
	s_add_alvar		B,x,al_rotz,player_ztilt
	s_add_alvar		B,x,al_rotz,player_zshake+1
	s_add_alvar		B,x,al_rotz,player_zstratadd


	s_jmp_varNOTZERO	B,player_rollZvel,.zroll
        	s_achase_var		B,player_rollZoff,#0,3
	s_brl			.zrcont
.zroll
	s_add_vars		B,player_rollZoff,player_rollZvel

	s_jmp_varpl		B,player_rollZvel,.zrispl
	s_add_var		B,player_rollZvel,#2
	s_bra			.zrcont
.zrispl       	s_sub_var		B,player_rollZvel,#2
.zrcont
	s_add_alvar		B,x,al_rotz,player_rollZoff

	
;----------------------------------------------------
; Zrot float	

	s_jmpNOT_varAND		B,playerflymode,#pfm_wobble,.nwob
	s_jmpNOT_varAND		B,pshipflags,#psf_brkLwing!psf_brkRwing,.nbrkwingzr
	s_set_var2vartab	B,B,B,player_Zrotfloat,player_Zrotfloatptr,pZrotfloattab
	s_brl			.vcont
.nbrkwingzr 	s_set_var2vartab	B,B,B,player_Zrotfloat,player_Zrotfloatptr,pZrotfloattab,-1
.vcont
	s_add_alvar		B,x,al_rotz,player_Zrotfloat
	s_add_var		B,player_Zrotfloatptr,#1
	s_jmp_varNE		B,player_Zrotfloatptr,#pZrotfloattab_len,.pfzptrok
	s_set_var		B,player_Zrotfloatptr,#0
.pfzptrok
.nwob


;----------------------------------------------------


;---------------------------------------------------------------
; MM HACK
      	s_jmp_varNE	B,splayerflymode,#spfm_inside,.ninsidevz
	a16
	lda	player_Ztilt
	sexa
	clc
	adc	player_Zshake
	sta	outvz	
	a8
.ninsidevz

;---------------------------------------------------------------


	s_test_var		B,pshipflags,#psf_Lwingcoll!psf_Rwingcoll
	s_bne			.npsc
	a16
	lda			player_zshake
	nega
	clc
	adc			player_zshakeV
	sta			player_zshakeV
	
	clc
	adc			player_zshake
	sta			player_zshake


	lda			player_zshake
	asra
	asra
	nega
	clc
	adc			player_Zshake
	sta			player_Zshake	


	a8



.npsc

; ## ALL-RANGE MODE ##
	IFNE	ALLRANGE
	; This was likely originally used to test rotating the player around,
	; as seen in the Great Commander I boss.
	; Here, we use it for funsies. :)
	; -SunlitSpace542
	s_jmp_keyup		left,.nleft
	s_add_var		W,player_turnrot,#2*256
.nleft
	s_jmp_keyup		right,.nright
	s_sub_var		W,player_turnrot,#2*256
.nright
	ENDC
; ####################



;----------------------------------------------------
; HUD rotation

	lda	al_rotz,x
	sta	hudrot

;----------------------------------------------------



	rts					 



;******************************************************************************
playerlimitx_srou
	s_and_var		B,arrows,#~(sprar_right!sprar_left)
	s_jmp_alvarmore	W,x,al_worldX,minpmoveX,.nminX
	s_set_alvar	W,x,al_worldX,minpmoveX
	s_or_var		B,arrows,#sprar_left
.nminX
	s_jmp_alvarless	W,x,al_worldX,maxpmoveX,.nmaxX
	s_set_alvar	W,x,al_worldX,maxpmoveX
	s_or_var		B,arrows,#sprar_right
.nmaxX
	rts





;******************************************************************************
playerfire_srou

	s_jmpNOT_varAND		B,pshipflags,#psf_brkLwing!psf_brkRwing,.nbrkw
	s_and_var		B,pshipflags2,#~psf2_doublaser
	s_and_var		B,pshipflags3,#~psf3_beamball
.nbrkw

;---------------------------------------------
; MM hack
	s_jmp_varNE	B,splayerflymode,#spfm_inside,.nin1
	s_copy_alvar2var	W,x,svar_word1,al_worldx
	s_copy_alvar2var	W,x,svar_word2,al_worldy
  	s_copy_alvar2var	W,x,svar_word3,al_worldz

	s_copy_var2alvar	W,x,al_worldx,pviewposx
	s_copy_var2alvar	W,x,al_worldy,pviewposy
	s_add_alvar		W,x,al_worldy,#inviewLaserYoff
	s_copy_var2alvar	W,x,al_worldz,pviewposz
	s_jmpNOT_varAND		B,pshipflags3,#psf3_beamball,.nin1
	s_add_alvar		W,x,al_worldz,#200
.nin1


;---------------------------------------------



	s_clr_alsflag		x,sflag3	; player fired laser

	s_test_var		B,pshipflags,#psf_nofire
	s_bne			.npfy
	s_jmp_varNE		B,stayblack,#-1,.npfy
	s_jmp_varNOTZERO	B,doingwipe,.npfy


;------------------------------------------------------------

	s_decbne_var		B,specialdelay,.npfa
	s_set_var		B,specialdelay,#1

	IFNE	mouseon
	lda	mousemode
	beq	.nomouse4
	lda	mouse_sw1
	cmp	#2
	beq	.bombtime
	
.nomouse4
	ENDC
	
	s_jmp_keyup		a,.npfa
	s_jmp_lastkeydown	a,.npfa
.bombtime
	IFEQ	INFBOMBS
	s_set_var		B,specialdelay,#specialdelayfrms
	s_beqdec_var		W,specwepcnt,.npfa
	ENDC

	trigse			$31

	s_weapon_pos		#0,#0,#80>>weapon_scale
	s_weapon_rot		#0,#0
	s_fire_weapon		x,NUKE,.npfa
	s_set_alvar		B,y,al_sbyte4,#2

.npfa

;------------------------------------------------------------

	IFNE	mouseon
	lda	mousemode
	beq	.nomouse3
	lda	mouse_sw1
	cmp	#1
	beq	.firetime
	
.nomouse3
	ENDC
	s_jmp_keyup		y,.resetfirecnt

.firetime
	s_decbne_var		B,firedelay,.npfy
	s_set_var		B,firedelay,#player_firespeed

	s_beqdec_var		B,firecnt,.npfy

;------------------------------------------------------------

	s_set_var		B,svar_byte1,#4-1
	s_jmp_varAND		B,pshipflags3,#psf3_beamball,.isdubl
	s_jmpNOT_varAND		B,pshipflags2,#psf2_doublaser,.ndubl
.isdubl	s_set_var		B,svar_byte1,#8-1
.ndubl

	s_jmp_varmore		B,numplasers,svar_byte1,.npfy

	s_set_alsflag		x,sflag3	; player fired laser

	s_jmp_varAND		B,pshipflags3,#psf3_beamball,.beamb
	s_jmp_varAND		B,pshipflags2,#psf2_doublaser,.dubfl

	s_weapon_pos		#0,#0,#80     
	s_weapon_rot		#0,#0
	s_fire_weapon		x,ELASER,.npfy
	trigse	se_laser
	inc			numplasers
	s_brl			.npfy

.dubfl
	s_weapon_pos		#-playerW_x>>weapon_scale,#playerW_y>>weapon_scale,#80
	s_weapon_rot		#0,#0
	s_fire_weapon		x,ELASER,.npfy
	inc			numplasers
	s_weapon_pos		#playerW_x>>weapon_scale,#playerW_y>>weapon_scale,#80
	s_fire_weapon		x,ELASER,.npfy
	inc			numplasers
	trigse			$34
	s_brl			.npfy
.beamb

	s_weapon_pos		#-playerW_x>>weapon_scale,#playerW_y>>weapon_scale,#10
	s_weapon_rot		#0,#0
	s_fire_weapon		x,PLAYERBEAM,.npfy
	inc			numplasers
	s_weapon_pos		#playerW_x>>weapon_scale,#playerW_y>>weapon_scale,#10
	s_fire_weapon		x,PLAYERBEAM,.npfy
	inc			numplasers
	trigse			$36
.npfy
	s_bra			.noresetfc


.resetfirecnt
	s_set_var		B,firecnt,#3
	s_set_var		B,firedelay,#1

.noresetfc

;------------------------------------------------------------








;---------------------------------------------
; MM hack
	s_jmp_varNE	B,splayerflymode,#spfm_inside,.nin2

	s_copy_var2alvar	W,x,al_worldx,svar_word1
	s_copy_var2alvar	W,x,al_worldy,svar_word2
	s_copy_var2alvar	W,x,al_worldz,svar_word3
.nin2

;---------------------------------------------

	rts


;*****************************************************************************
playerdead_Istrat
	s_start_strat

;------------------------------------
; remove arrow warnings.
	stz	arrows

;------------------------------------

	lda	fadetored
	bne	.out
	lda	#1
	sta	fadetored
	jsl		fadered_l
.out

	ldy	dummyobj		; make playpt invalid.
	sty	playpt

	jsr		setcurrpshape

	s_set_objtobevar	y,pcboxobj_B
	s_set_endcollstrat	y,0
	s_set_alptrs		y,0,0,0
	s_set_alsflag		y,colldisable
	s_setnoremove_behind	y
	s_set_objtobevar	y,pcboxobj_LW
	s_set_endcollstrat	y,0
	s_set_alptrs		y,0,0,0
	s_set_alsflag		y,colldisable
	s_setnoremove_behind	y
	s_set_objtobevar	y,pcboxobj_RW
	s_set_endcollstrat	y,0
	s_set_alptrs		y,0,0,0
	s_set_alsflag		y,colldisable
	s_setnoremove_behind	y

	s_set_aldata		x,#10,#0
	s_set_colltype		x,enemyweap


	s_jmp_varNE		B,splayerflymode,#spfm_inside,.norm
	startbgm		$11
	s_and_var		B,gameflags2,#~gf2_ingame
	trigse			se_playerdown
	s_or_var		B,gameflags2,#gf2_ingame
	s_or_var		B,pshipflags2,#psf2_playerHP0
	s_set_alsflag		x,colldisable
	s_set_var		B,splayerflymode,#spfm_tonorm
	s_set_strat		x,playeroutofcock_Istrat
	s_end_strat
     	
.norm


;------------------------------------
; remove sparks from wings.
	phx
	s_set_objtobevar	x,pcboxobj_LW
	s_jmp_objptrbad		x,.nleft
	s_set_objtobealvar	y,x,al_sword1
	s_jmp_objptrbad		y,.nleft
	s_set_alvar		W,x,al_sword1,#0
	s_remove_obj		y
.nleft

	s_set_objtobevar	x,pcboxobj_RW
	s_jmp_objptrbad		x,.nright
	s_set_objtobealvar	y,x,al_sword1
	s_jmp_objptrbad		y,.nright
	s_set_alvar		W,x,al_sword1,#0
	s_remove_obj		y
.nright
	plx

;------------------------------------

	s_or_var		B,gameflags,#GF_PLAYERDYING

;---------------------------------------------------------
; hard wire for stage 2_2
	s_jmp_ifnotlevel	2,.nlevel22
	s_jmp_varNE		B,stage,#1,.nlevel22
	s_set_var		B,playerdieYrotspeed,#128/3
;	s_and_var		B,playerflymode,#~pfm_dieYrot
.nlevel22
;---------------------------------------------------------



	s_clr_alsflag		x,colldisable
	s_set_alptrs		x,playerdead_strat,phitflash_Istrat,pexplode_Istrat
	s_set_alvar		B,x,al_sbyte1,#0
	
	s_jmp_varAND	B,pshipflags2,#psf2_playerHP0,.nsnd
	s_or_var		B,pshipflags2,#psf2_playerHP0
	s_and_var		B,gameflags2,#~gf2_ingame
	trigse			se_playerdown
	s_or_var		B,gameflags2,#gf2_ingame
	startbgm		$11
.nsnd

;	startbgm			$f0
	s_clr_alsflag		x,sflag1	; hit gnd sound.
	s_playerctrl		off

;	s_end_strat
	
playerdead_strat
	s_start_strat
	

	s_copy_var2var		W,bgsscrollZ,viewposz

;	d_print_alvar		B,x,al_HP,1

	s_add_alvar		B,x,al_sbyte1,#1
	s_cmp_alvar		B,x,al_sbyte1,#10*6
	s_beq			pexplode_Istrat
	s_cmp_alvar		B,x,al_sbyte1,#15
	s_bpl			.npf
	s_jmp_NOTdelay		1,.npf
	s_set_alsflag		x,hitflash
	s_jmp			.bd
.npf
	
	s_jmpNOT_varAND		B,playerflymode,#pfm_dieYrot,.bd
	s_jmp_onfire		x,.bd
	s_jmp_notdelay		2,.bd 			
	s_jsl			makesmoke_srou_l
.bd

	



;	lda			#1	
;	sta			showtype	
	
	s_jmpNOT_varAND		B,playerflymode,#pfm_diefall,.nxi
 
	s_jmpNOT_varAND		B,playerflymode,#pfm_water,.npspl
	s_jmp_higher		x,#-20,.npspl
	jsl			makesplash_srou_l
	s_set_alvar		W,y,al_worldy,#20
.npspl


	s_jmp_lower		x,#0,.nyi
	s_clr_alsflag		x,sflag1
	s_jmp_NOTdelay		1,.dsx
	s_Achase_var		W,plrotx,#5000,4
	bra			.dsx	
.nxi
	s_set_var		W,plrotx,#0
.dsx
	s_add_var		B,player_Zstratadd,#4
	s_jmp			.npzz
.nyi
	s_set_var		W,plrotx,#-2000
	s_set_alvar		W,x,al_worldy,#0
	s_jmp_alsflag		x,sflag1,.npzz
	s_set_alsflag		x,sflag1

;	trigse			se_destructbossfar	
	jsl			sgenspark_srou_l
	jsl			sgenspark_srou_l
	jsl			sgenspark_srou_l
	jsl			sgenspark_srou_l
.npzz



	s_jmp_NOTdelay		2,.npdc
	s_Fchase_var		W,player_speed,#0,1
.npdc


	s_copy_var2alvar	B,x,al_rotx,plrotx+1
	s_copy_var2alvar	B,x,al_roty,plroty+1
	s_copy_var2alvar	B,x,al_rotz,plrotz+1
	s_copy_var2alvar	B,x,al_vel,player_speed
	s_add_alvar		B,x,al_rotz,player_zstratadd


	s_gen_3dvecs		x,al_roty,al_rotx,al_vel
	
	s_jmpNOT_varAND		B,playerflymode,#pfm_dieYrot,.nvyc
	s_achase_var2alvar	W,x,pviewposY,al_worldy,3
.nvyc

	s_set_alvar		W,x,al_vx,#0 
	s_add_vecs2pos		x
	s_copy_alvar2var	W,x,pviewposz,al_worldz
	move_shadow		
	s_end_strat


phitflash_Istrat
	s_start_strat
;	s_add_rnd2var		plroty+1,#7
;	s_sub_var		B,plroty+1,#4
	s_jmp			hitflash_Istrat

pexplode_Istrat
	s_start_strat
	s_make_obj		#nullshape,.ebadobj
	s_clr_alsflag		y,realobj
	s_set_alsflag		y,playerobj
		sty	viewpt
	sty	playpt
	sty	viewtoobj
	sty	internalPLAYPT
	s_copy_pos		y,x
	s_copy_vecs		y,x
	s_add_vecs2pos		y
	s_set_strat		y,0
	s_set_vartobeobj	circleobj,y
	a16
	lda		#redfillscreen_circle
	sta		circleanim
	a8

;	jsl		dyingredoff_l

.ebadobj
	s_zero_vecs		x
	s_set_alptrs		x,explode_Istrat,explode_Istrat,explode_Istrat
	s_kill_obj		x
	remove_shadow		
	s_make_obj		#nullshape,.badobj1
	s_copy_pos		y,x
	s_set_strat		y,BIGParticleexplode_Istrat
.badobj1
	s_and_var		B,gameflags2,#~gf2_ingame
	trigse			3
	s_or_var		B,gameflags2,#gf2_ingame
	s_or_var		B,gameflags,#GF_PLAYERDEAD

	IFEQ	CONTEST
	s_dec_var		B,lives
	bne			.settime
	lda	#1
	sta	gameover
	s_set_var		B,timeuntilfade,#20
	s_bra			.end
.settime
	ENDC

	s_set_var	B,timeuntilfade,#20
.end
	s_end_strat



;*****************************************************************************
playercoll_Istrat
	s_start_strat

	s_jmp_varAND	B,pshipflags3,#psf3_nocollisions,.ncoll
	
	s_inc_var		B,pnumhits 

	s_jmpNOT_varAND		B,pshipflags2,#psf2_wireship,.normcoll
	TRIGSE			$14
	s_set_objtobealvar	y,x,al_collobjptr
	s_jmp_alvarNE.w		B,y,al_hp,#hardHP,.ncoll
.normcoll

	s_jmp_alsflag		x,nohitaffect,.ncoll
	
;-----------------------------------------
; laser deflection.
	s_jmp_varZERO		B,player_rollZvel,.nlaser
	s_set_objtobealvar	y,x,al_collobjptr
	s_jmpNOT_colltype	y,laser,.nlaser
	s_jmp_alvarEQ.w		B,y,al_hp,#HARDHP,.nlaser
	phx
	tyx
	s_set_alvar2rnd		x,al_rotx,#63
	s_sub_alvar		B,x,al_rotx,#31
	s_set_speed		x,#60
	s_set_alvar2rnd		x,al_roty,#31
	s_jmp_random		.left
	s_sub_alvar		B,x,al_roty,#deg90-40
	s_brl			.contdef
.left	s_add_alvar		B,x,al_roty,#deg90-40
.contdef      
	s_gen_3dvecs		x,al_roty,al_rotx,al_vel
	s_add_vecs2pos		x
	s_add_vecs2pos		x
	s_add_vecs2pos		x
	s_add_vecs2pos		x
	s_clr_alsflag		x,collide
	s_set_alsflag		x,colldisable
	s_set_strat			x,relflatmiss_strat
	s_set_lifecnt		x,#30
	trigse			$14
	plx
	s_jmp			.ncoll
.nlaser
;-----------------------------------------
 
	s_jmpNOT_alvarAND	B,x,al_hitflags,#HF1,.nBcol
	ldy			pcboxobj_B
	s_set_alsflag		y,collide
	s_set_alsflag		y,hitflash
	s_copy_alvar2alvar.w	W,y,al_collobjptr,x,al_collobjptr
.nBcol	

	s_jmpNOT_alvarAND	B,x,al_hitflags,#HF2,.nLWcol
	ldy			pcboxobj_LW
	s_set_alsflag		y,collide
	s_set_alsflag		y,hitflash
	s_copy_alvar2alvar.w	W,y,al_collobjptr,x,al_collobjptr
.nLWcol	

	s_jmpNOT_alvarAND	B,x,al_hitflags,#HF3,.nRWcol
	ldy			pcboxobj_RW
	s_set_alsflag		y,collide
	s_set_alsflag		y,hitflash
	s_copy_alvar2alvar.w	W,y,al_collobjptr,x,al_collobjptr
.nRWcol	


.ncoll
	
	s_set_alvar		B,x,al_hitflags,#0
	s_clr_alsflag		x,collide

	s_jmpto_strat


;*****************************************************************************
do_player_limitX
	jsr		playermove_srou
	s_gen_3dvecs	x,al_roty,al_rotx,al_vel
	jsr		framescalevecs
    	s_add_vecs2pos	x
	jsr		playerlimitX_srou
	jsr		playerfire_srou
	jsr		checkarrows_srou
	rts


do_player_Yvel125
	jsr		playermove_srou
	s_gen_3dvecs	x,al_roty,al_rotx,al_vel
	a16
	lda	al_vy,x
	sta	tpa
	asra
	asra
	sta	x1
	asra
	clc	
	adc	x1
	clc
	adc	tpa
	sta	al_vy,x
	a8
	jsr		framescalevecs
    	s_add_vecs2pos	x
	jsr		playerlimitX_srou
	jsr		playerfire_srou
	jsr		checkarrows_srou
	rts

do_player
	jsr		playermove_srou
	s_gen_3dvecs	x,al_roty,al_rotx,al_vel
	jsr		framescalevecs
	s_add_vecs2pos	x
	jsr		playerfire_srou
	jsr		checkarrows_srou
	rts

do_playerYvelD2
	jsr		playermove_srou
	s_gen_3dvecs	x,al_roty,al_rotx,al_vel

	a16

	lda	al_vx,x
	jsl	perc62A_l
	sta	al_vx,x


	lda	al_vy,x
	adiv2
	sta	al_vy,x
	a8
	jsr		framescalevecs
	s_add_vecs2pos	x
	jsr		playerlimitX_srou
	jsr		playerfire_srou
	jsr		checkarrows_srou
	rts

do_playerYvel_colony
	jsr		playermove_srou
	s_gen_3dvecs	x,al_roty,al_rotx,al_vel
	a16

	lda	al_vx,x
	jsl	perc62A_l
	sta	al_vx,x


	lda	al_vy,x
	adiv2
	sta	al_vy,x
	a8
	jsr		framescalevecs
	s_add_vecs2pos	x

	jsr	playerlimitx_srou

;	s_jmp_alvarmore	W,x,al_worldX,minpmoveX,.nminX
;	s_set_alvar	W,x,al_worldX,minpmoveX
;.nminX

	jsr		playerfire_srou
	jsr		checkarrows_srou
	rts



do_player_bridge
	jsr		playermove_srou
	s_gen_3dvecs	x,al_roty,al_rotx,al_vel


	a16
	lda	al_vx,x
	jsl	perc62A_l
	sta	al_vx,x

	lda	al_vy,x
	adiv2
	sta	al_vy,x
	a8


	jsr		framescalevecs
    	s_add_vecs2pos	x
	jsr		playerlimitX_srou
	jsr		playerfire_srou
	jsr		checkarrows_srou
	rts


;*****************************************************************************
checkarrows_srou
	a8
	s_jmp_varAND	B,pstratflags,#pstf_inseq,.noarrows

	s_jmp_keyup		jdown,.topoff
	s_jmpNOT_varAND	B,pmovelimitAND,#pml_Btop,.topok
.topoff	s_AND_var		B,arrows,#~sprar_up
.topok
	s_jmp_keyup		jup,.botoff
	s_jmpNOT_varAND	B,pmovelimitAND,#pml_Bbottom,.botok
.botoff	s_AND_var		B,arrows,#~sprar_down
.botok
	s_jmp_keyup		jleft,.leftoff
	s_jmpNOT_varAND	B,pmovelimitAND,#pml_lwleft,.leftok
.leftoff	s_AND_var		B,arrows,#~sprar_left
.leftok
	s_jmp_keyup		jright,.rightoff
	s_jmpNOT_varAND	B,pmovelimitAND,#pml_rwright,.rightok
.rightoff	s_AND_var		B,arrows,#~sprar_right
.rightok


	rts


.noarrows	stz	arrows
	rts



;*****************************************************************************
dupplayer_l
	jsr	dupplayer
	rtl
dupplayer
	s_make_obj		#nullshape,.badobj
	s_copy_alvar2alvar	W,y,al_shape,x,al_shape
	s_copy_pos		y,x
	s_copy_rots		y,x
	s_set_alsflag		y,colldisable
	s_set_alsflag		y,shadow
	s_set_alsflag		x,invisible
.badobj
	rts


;*****************************************************************************
framescalevecs
	phb
	IFNE	FASTROM
	lda	#$80
	pha
	plb
	ELSEIF
	lda	#0
	pha
	plb
	ENDC

	lda	al_vx,x
	sta	x1+1
	stz	x1	
	lda	al_vy,x
	sta	y1+1
	stz	y1	

	
	lda	framerate
	sta	tpx

	phx
	i8

	mulslog168 x1,tpx
	lda m4
	sta	x1
	lda m5
	sta	x1+1
	mulslog168 y1,tpx
	lda m4
	sta	y1
	lda m5
	sta	y1+1

	ai16
	plx

	
	lda	x1
	adiv2			; 1 for mult.
	adiv2
	adiv2
	sta	al_vx,x
	lda	y1
	adiv2			; 1 for mult
	adiv2
	adiv2
	sta	al_vy,x
	
	a8
	plb
	rts


;*****************************************************************************
setcurrpshape

;--------------------------------------
; use current shape etc..
	a8
	lda	pshipflags
	a16
	and	#psf_brkLwing!psf_brkRwing
	beq	.nps

	bit	#psf_brkLwing
	beq	.notlb	
	bit	#psf_brkRwing
	bne	.bps
	lda	#1
	sta.l	m_hudflags
	lda.l	playershapeL
	sta	al_shape,x
	bra	.gps
.notlb
	lda	#2
	sta.l	m_hudflags
	lda.l	playershapeR
	sta	al_shape,x
	bra	.gps
.bps
	lda	#3
	sta.l	m_hudflags
	lda.l	playershapeLR
	sta	al_shape,x
	bra	.gps
.nps
	lda	#0
	sta.l	m_hudflags
	lda.l	playershape
	sta	al_shape,x
.gps
	a8

      	s_jmp_varNE	B,splayerflymode,#spfm_inside,.nnull
	s_set_alvar	W,x,al_shape,#nullPlayer&WM
.nnull
	rts




;*****************************************************************************
pZrotfloattab

	db	0

	db	1
	db	2
	db	3
	db	4,4
	db	5,5,5
	db	4,4
	db	3
	db	2
	db	1

	db	0

	db	-1
	db	-2
	db	-3
	db	-4,-4
	db	-5,-5,-5
	db	-4,-4
	db	-3
	db	-2
	db	-1

pZrotfloattab_len	equ	*-pZrotfloattab

	
;*****************************************************************************
;	?*-player_strategies




 

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







