
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
;*   Date: My birthday/92                                                         *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;* Author:								      *
;*                                                                         *
;*		Giles Goddard.      				      *	
;*                                                                         *
;***************************************************************************
;fuzzy wuzzy wuz a bear, bear was fuzzy wuzzy, fuzzy wuzzy lost is hair so he
;wasn't fuzzy wuz he? . <- <- Dick 'ed. 1992 

	incpublics	pstrats.ext


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
	s_gen_flatvecs		x,al_rotz,al_speed
	s_exg_objs		

.badobj2
              	rts

;*****************************************************************************
brkpwingcol	
	ldy			pcboxobj_B
	s_copy_alvar2alvar.w	W,y,al_collobjptr,x,al_collobjptr
	s_set_alsflag		y,collide
	s_jmp_alvarZERO		W,x,al_collobjptr,.bodywallcol
	jmp			no_pwingcol	

.bodywallcol
	s_docollAP		y,#framesperAP,#4
	jmp			no_pwingcol	

	

pwingcol	
	s_jmp_varAND	B,pshipflags3,#psf3_nocollisions,no_pwingcol
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

	s_jmp_alvarmore	W,x,al_worldy,minpmoveY,.nminy
	s_or_var	B,pmovelimit,#pml_btop
.nminy

	s_jmp_alvarless	W,x,al_worldy,maxpmoveY,.nmaxy
	s_or_var	B,pmovelimit,#pml_bbottom
.nmaxy

	s_end_strat

;-----------------------------------------------------------------------------
pcolB_Istrat
	s_start_strat	
	s_jmp_varAND	B,pshipflags3,#psf3_nocollisions,.dsn

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
	s_jmp_varAND	B,pshipflags3,#psf3_nocollisions,nobcoll
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
	s_jmp_varAND	B,pshipflags3,#psf3_nocollisions,.cantdie	
	s_set_var		W,pcollobj_B,#0
	s_set_collstrat		x,pcolB_Istrat
	s_and_var		B,pshipflags,#~psf_bodycoll
.cantdie
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
	s_jmp_varAND	B,pshipflags3,#psf3_nocollisions,.dsn	
	

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
	s_jmp_varAND	B,pshipflags3,#psf3_nocollisions,.dsn

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
	s_jmp_varAND	B,pshipflags3,#psf3_nocollisions,.donee	
	TRIGSE		se_wingdestructright
	s_set_alvar		B,x,al_HP,#-1
	s_set_alvar		B,x,al_AP,#0
	s_and_var		B,pshipflags,#~psf_Rwingcoll
	s_or_var		B,pshipflags,#psf_brkRwing
	ldy			pcboxobj_B
	s_set_alvar		B,y,al_collcount,#framesperAP
	s_jsl			makesmlexpobj_srou
	s_set_alvar		W,y,al_vz,pviewvelz
.donee
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




;*****************************************************************************
set_playerInTraining_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerInTraining_Istrat
	rtl
	
playerintraining_Istrat
	s_start_strat
	lda	#6
	sta	curstrat
	s_playerctrl	on
	jsl	checkview_l
	s_playerfly_mode	training

	s_set_alptrs	x,playerintraining_strat,playercoll_Istrat,playerdead_Istrat

playerintraining_strat
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
;	jsl	perc75A_l
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
	sbc	#Training_ViewCY
;	jsl	perc62A_l
	clc
	adc	#Training_ViewCY
	sta	pviewposy
	a8
.doney

	jsr		viewmove_srou

	jsl		setship



	s_end_strat
;----------------------------------------------------------------------
set_playerInSpaceNoMove_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerInSpaceNoMove_Istrat
	rtl

	
playerinspacenomove_Istrat
	s_start_strat



	s_playerfly_mode	bigspace
	s_playerctrl	off
	
	s_set_alptrs	x,playerinspace_strat,playercoll_Istrat,playerdead_Istrat
	
	
	
playerinspacenomove_strat
	s_start_strat
	jsr		viewmove_srou
	s_end_strat
;----------------------------------------------------------------------
set_playerInSpace_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerInSpace_Istrat
	rtl

	
playerinspace_Istrat
	s_start_strat

	s_playerctrl	on


	s_playerfly_mode	bigspace
	
	s_set_alptrs	x,playerinspace_strat,playercoll_Istrat,playerdead_Istrat


playerinspace_strat
	s_start_strat
	lda	#7
	sta	curstrat
	jsr		do_player_limitX


;----------------------------------------------------------------------




;----------------------------------------------------------------------

; view X pos = player X pos * 0.75
      	s_jmp_varNE	B,splayerflymode,#spfm_inside,.ninsidex
	s_copy_alvar2var	W,x,pviewposx,al_worldx
	bra	.donex
.ninsidex
	a16
	lda	al_worldx,x
;	jsl	perc75A_l
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
;	jsl	perc62A_l
	clc
	adc	#Space_ViewCY
	sta	pviewposy
	a8
.doney
;----------------------------------------------------------------------
	jsr		viewmove_srou

	jsl		setship

	jsl	checkview_l

	s_end_strat


;----------------------------------------------------------------------
set_playerInSpaceNoVC_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerInSpaceNoVC_Istrat
	rtl

	
playerinspaceNoVC_Istrat
	s_start_strat

	s_playerctrl2	on


	s_playerfly_mode	bigspace

	s_set_alptrs	x,playerinspaceNoVC_strat,playercoll_Istrat,playerdead_Istrat


playerinspaceNoVC_strat
	s_start_strat
	lda	#8
	sta	curstrat
	jsr		do_player_limitX


;----------------------------------------------------------------------




;----------------------------------------------------------------------

; view X pos = player X pos * 0.75
      	s_jmp_varNE	B,splayerflymode,#spfm_inside,.ninsidex
	s_copy_alvar2var	W,x,pviewposx,al_worldx
	bra	.donex
.ninsidex
	a16
	lda	al_worldx,x
;	jsl	perc75A_l
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
;	jsl	perc62A_l
	clc
	adc	#Space_ViewCY
	sta	pviewposy
	a8
.doney
;----------------------------------------------------------------------
	jsr		viewmove_srou

	jsl		setship
	jsl	checkview_l


	s_end_strat
;*****************************************************************************
playeroncont_Istrat
	s_start_strat
	lda	#0
	sta	hudrot+1
	stz	superspeeddelay
	s_playerctrl2		on
	s_playerfly_mode	cont
;	lda	playertwoactivated
;	bne	.skipscene
;	jsl	doascene
;.skipscene
;	jsl	checkview_l
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
;-----

	s_and_var		B,pshipflags3,#~psf3_enginesnd
	jsl		setship
	s_end_strat



;*****************************************************************************
set_playerOnPlanet_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerOnPlanet_Istrat


playeronplanet_Istrat
	s_start_strat

	s_playerctrl2	on
	lda	#9
	sta	curstrat

	s_playerfly_mode	planet
	
	jsl	checkview_l
	
	s_set_alptrs	x,playeronplanet_strat,playercoll_Istrat,playerdead_Istrat

	          	
playeronplanet_strat
	s_start_strat

	jsr		do_player_Yvel125

	a16

; view X pos = 87% player X 
      	s_jmp_varAND	B,gameflags2,#gf2_viewclose,.dcx
	lda	al_worldx,x
;	jsl	perc87A_l
	bra	.donex

.dcx	lda	al_worldx,x
;	jsl	perc93A_l
.donex
	sta	pviewposx

; view Y pos = 75% player Y		; 62
	lda	al_worldy,x
	sec
	sbc	viewcy
;	jsl	perc75A_l
	clc
	adc	viewcy
	sta	pviewposy
	a8

	jsr		viewmove_srou
	s_jmp_varAND		W,superspeeddelay,#ktest3,.start1
	s_jmp_varAND		W,superspeeddelay,#ktest4,.start2
	s_jmp_varAND		W,superspeeddelay,#ktest5,.start3
	jmp	.aaa3
.start1	
	s_set_var    W,viewdist,#3000
	s_set_var    W,outviewdist,#3000
	s_set_var    W,outdist,#3000
	s_set_var	W,outvx,#-deg45*256
	s_set_var	W,outvy,#-deg45*256
	stz	crosshairon
	jmp	.aaa3
.start2
	s_set_var	W,viewdist,#3000
	s_set_var	W,outviewdist,#3000
	s_set_var	W,outdist,#3000
	s_set_var	W,outvx,#-deg45*256
	s_set_var	W,outvy,#deg45*256
	stz	crosshairon
	jmp	.aaa3
.start3
	s_set_var	W,viewdist,#2000
	s_set_var	W,outviewdist,#2000
	s_set_var	W,outdist,#2000
	s_set_var	W,outvx,#-deg22*256
	s_set_var	W,outvy,#0
	stz	crosshairon
.aaa3	

	s_end_strat
	
	
set_playerOnPlanet2_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerOnPlanet2_Istrat


playeronplanet2_Istrat
	s_start_strat
	lda	#10
	sta	curstrat

	s_playerctrl	on
	jsl	checkview_l
	s_playerfly_mode	planet

	s_set_alptrs	x,playeronplanet2_strat,playercoll_Istrat,playerdead_Istrat

	          	
playeronplanet2_strat
	s_start_strat

	jsr		do_player_Yvel125

	a16

; view X pos = 87% player X 
      	s_jmp_varAND	B,gameflags2,#gf2_viewclose,.dcx
	lda	al_worldx,x
;	jsl	perc87A_l
	bra	.donex

.dcx	lda	al_worldx,x
;	jsl	perc93A_l
.donex
	sta	pviewposx

; view Y pos = 75% player Y		; 62
	lda	al_worldy,x
	sec
	sbc	viewcy
;	jsl	perc75A_l
	clc
	adc	viewcy
	sta	pviewposy
	a8

	jsr		viewmove_srou
	s_jmp_varAND		W,superspeeddelay,#ktest3,.start1
	s_jmp_varAND		W,superspeeddelay,#ktest4,.start2
	s_jmp_varAND		W,superspeeddelay,#ktest5,.start3
	jmp	.aaa3
.start1	
	s_set_var    W,viewdist,#3000
	s_set_var    W,outviewdist,#3000
	s_set_var    W,outdist,#3000
	s_set_var	W,outvx,#-deg45*256
	s_set_var	W,outvy,#-deg45*256
	stz	crosshairon
	jmp	.aaa3
.start2
	s_set_var	W,viewdist,#3000
	s_set_var	W,outviewdist,#3000
	s_set_var	W,outdist,#3000
	s_set_var	W,outvx,#-deg45*256
	s_set_var	W,outvy,#deg45*256
	stz	crosshairon
	jmp	.aaa3
.start3
	s_set_var	W,viewdist,#2000
	s_set_var	W,outviewdist,#2000
	s_set_var	W,outdist,#2000
	s_set_var	W,outvx,#-deg22*256
	s_set_var	W,outvy,#0
	stz	crosshairon
.aaa3	

	s_end_strat

Playerone_freeze_strat
	s_start_strat

	s_playerctrl	off
	s_set_alptrs	x,0,0,0	;freeze, scumbag!

	s_end_strat
	
Playerone_resume_Istrat
	s_start_strat

	s_playerctrl2	on

	s_set_alptrs	x,playerone_resume_strat,playercoll_Istrat,playerdead_Istrat

	          	
playerone_resume_strat
	s_start_strat

	jsr		do_player

	a16

      	s_jmp_varAND	B,gameflags2,#gf2_viewclose,.dcx
	lda	al_worldx,x
	bra	.donex

.dcx	lda	al_worldx,x
.donex
	sta	pviewposx

	lda	al_worldy,x
	sec
	sbc	viewcy
	clc
	adc	viewcy
	sta	pviewposy
	a8
	jsr		viewmove_srou	;start the camera rolling again
	s_end_strat
;*****************************************************************************
set_playerUnderGnd_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerUnderGnd_Istrat
	rtl

playerundergnd_Istrat

	s_start_strat
	lda	#11
	sta	curstrat

	s_playerctrl	on
	jsl	checkview_l
	s_playerfly_mode	undergnd

	s_set_alptrs	x,playerundergnd_strat,playercoll_Istrat,playerdead_Istrat

playerundergnd_strat
	s_start_strat


	jsr		do_playerYvelD2

	a16

; view X pos = 87% player X 
;      	s_jmp_varAND	B,gameflags2,#gf2_viewclose,.dcx
	lda	al_worldx,x
;	jsl	perc87A_l
	bra	.donex

.dcx	lda	al_worldx,x
;	jsl	perc93A_l
.donex
	sta	pviewposx

; view Y pos = fixed
	lda	viewCY
	sta	pviewposy
	a8
	jsr		viewmove_srou

	s_jmp_varAND		W,superspeeddelay,#ktest3,.start1
	s_jmp_varAND		W,superspeeddelay,#ktest4,.start2
	s_jmp_varAND		W,superspeeddelay,#ktest5,.start3
	jmp	.aaa3
.start1	
	s_set_var    W,viewdist,#3000
	s_set_var    W,outviewdist,#3000
	s_set_var    W,outdist,#3000
	s_set_var	W,outvx,#-deg45*256
	s_set_var	W,outvy,#-deg45*256
	jmp	.aaa3
.start2
	s_set_var	W,viewdist,#3000
	s_set_var	W,outviewdist,#3000
	s_set_var	W,outdist,#3000
	s_set_var	W,outvx,#-deg45*256
	s_set_var	W,outvy,#deg45*256
	jmp	.aaa3
.start3
	s_set_var	W,viewdist,#2000
	s_set_var	W,outviewdist,#2000
	s_set_var	W,outdist,#2000
	s_set_var	W,outvx,#-deg22*256
	s_set_var	W,outvy,#0
.aaa3	
	s_end_strat

;-----------------------------
set_playerUnderGnd2_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerUnderGnd2_Istrat
	rtl

playerundergnd2_Istrat

	s_start_strat
	lda	#12
	sta	curstrat

	s_playerctrl	on
	jsl	checkview_l
	s_playerfly_mode	undergnd

	s_set_alptrs	x,playerundergnd2_strat,playercoll_Istrat,playerdead_Istrat

playerundergnd2_strat
	s_start_strat


	jsr		do_playerYvelD2

	a16

; view X pos = 87% player X 
;      	s_jmp_varAND	B,gameflags2,#gf2_viewclose,.dcx
	lda	al_worldx,x
;	jsl	perc87A_l
	bra	.donex

.dcx	lda	al_worldx,x
;	jsl	perc93A_l
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
	lda	#13
	sta	curstrat


	s_playerctrl	on
	jsl	checkview_l
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
;	jsl	perc87A_l
	bra	.donex

.dcx	lda	al_worldx,x
;	jsl	perc93A_l
.donex
	sta	pviewposx

; view Y pos = 75% player Y		; 62
	lda	al_worldy,x
	sec
	sbc	viewcy
;	jsl	perc75A_l
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
	lda	#14
	sta	curstrat


	s_playerctrl2	on

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
;	jsl	perc62A_l
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

	lda	#1
	sta	curstrat
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
	s_jmp_varAND	W,superspeeddelay,#ktest3,.endingstrat2
	s_jmp_varAND	W,superspeeddelay,#ktest4,.endingstrat2
	s_jmp_varAND	W,superspeeddelay,#ktest5,.endingstrat2
	s_end_strat
.endingstrat2
	s_jmp_varAND		W,superspeeddelay,#ktest3,.start1
	s_jmp_varAND		W,superspeeddelay,#ktest4,.start2
	s_jmp_varAND		W,superspeeddelay,#ktest5,.start3
	jmp	.aaa3
.start1	
	s_set_var    W,viewdist,#3000
	s_set_var    W,outviewdist,#3000
	s_set_var    W,outdist,#3000
	s_set_var	W,outvx,#-deg45*256
	s_set_var	W,outvy,#-deg45*256
	jmp	.aaa3
.start2
	s_set_var	W,viewdist,#3000
	s_set_var	W,outviewdist,#3000
	s_set_var	W,outdist,#3000
	s_set_var	W,outvx,#-deg45*256
	s_set_var	W,outvy,#deg45*256
	jmp	.aaa3
.start3
	s_set_var	W,viewdist,#2000
	s_set_var	W,outviewdist,#2000
	s_set_var	W,outdist,#2000
	s_set_var	W,outvx,#-deg22*256
	s_set_var	W,outvy,#0
.aaa3
	s_end_strat
;--------------
;*****************************************************************************
set_playerInStunnel_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerInStunnel_Istrat
	rtl

playerinStunnel_Istrat

	s_start_strat

	lda	#2
	sta	curstrat
	s_playerctrl2	on

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
	lda	#3
	sta	curstrat
	s_playerctrl2	on

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
	lda	#4
	sta	curstrat
	s_playerctrl2	on
	s_playerfly_mode	Ltunnel

playerintunnel_Istrat
	s_set_alptrs	x,playerintunnel_strat,playercoll_Istrat,playerdead_Istrat
	s_playerctrl2	on
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
	lda	superspeeddelay
	cmp	#ktest
	bne	.nin
	lda		splayerflymode
	cmp		#spfm_inside
	bne		.nin
	lda		#spfm_tonorm
	sta		splayerflymode
	lda	#0
	sta	hudrot+1	; OFF
	jsl	changeviewmode_l
.nin
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
	
	lda	#5
	sta	curstrat
	s_playerctrl2	on
	jsl	checkview_l
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
;	jsl	perc62A_l
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

	s_playerctrl2	on
	lda	#15
	sta	curstrat

	jsl	checkview_l
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
;	jsl	perc93A_l
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
;	s_playerctrl		off
	s_or_var		B,pstratflags,#pstf_novdistC
	s_set_strat		x,playerintocock_strat

	jsr			makeallmedpspeed
playerintocock_strat
	s_start_strat


	s_achase_alvar		W,x,al_worldx,#0,1
	s_achase_alvar		W,x,al_worldy,#space_viewcy,1
	s_achase_var		B,player_Ztilt,#0,1
	s_achase_var		W,plrotz,#0,1
	s_achase_var		W,outdist,#0,1,playerintocock2_init


	lda	curstrat&WM
	cmp	#1
	beq	.1
	cmp	#2
	beq	.2
	cmp	#3
	beq	.3
	cmp	#4
	beq	.4
	cmp	#5
	beq	.5
	cmp	#6
	beq	.6
	cmp	#7
	beq	.7
	cmp	#8
	beq	.8
	cmp	#9
	beq	.9
	cmp	#10
	beq	.10
	cmp	#11
	beq	.11
	cmp	#12
	beq	.12
	cmp	#13
	beq	.13
	cmp	#14
	beq	.14
	cmp	#15
	beq	.15
.1
	s_jmp			playerintunnel_Istrat
	bra	.done
.2
	s_jmp			playerinStunnel_Istrat
	bra	.done
.3
	s_jmp			playerinMtunnel_Istrat
	bra	.done
.4
	s_jmp			playerinLtunnel_Istrat
	bra	.done
.5
	s_jmp			playerincolony_Istrat
	bra	.done
.6
	s_jmp			playerintraining_Istrat
	bra	.done
.7
	s_jmp			playerinspace_Istrat
	bra	.done
.8
	s_jmp			playerinspacenovc_Istrat
	bra	.done
.9
	s_jmp			playeronplanet_Istrat
	bra	.done
.10
	s_jmp			playeronplanet2_Istrat
	bra	.done
.11
	s_jmp			playerundergnd_Istrat
	bra	.done
.12
	s_jmp			playerundergnd2_Istrat
	bra	.done
.13
	s_jmp			playeronwater_Istrat
	bra	.done
.14
	s_jmp			playeronwater_Istrat
	bra	.done
.15
	s_jmp			playerinnucleus_Istrat
.done


playerintocock2_init
	s_set_strat		x,playerintocock2_strat

	s_set_var		W,outdist,#0
	s_set_var		W,outvx,#0
	s_set_var		W,outvy,#0
	s_set_var		W,outvz,#0

	s_set_alvar		W,x,al_worldz,pviewposz
	s_add_alvar		W,x,al_worldz,#inviewdist

	jsr			dupplayer
	lda	curr_ship
	bne	.firstjump
	s_ldajsl		B,#pshipnum_zoom,setYplayershape_l
	bra	.firstjump1
.firstjump
;	s_ldajsl		B,#curr_ship,setYplayershape_l
	CHG_MODE	B
	a16
	lda	curr_ship
	a8
	jsl	setYplayershape_l
	CHG_MODEBACK	B
.firstjump1
	s_set_strat		y,cockdumpl_Istrat
	lda	curr_ship
	bne	.shorter
	s_set_var		B,psvar_byte1,#20
	bra	.donewlife
.shorter
	s_set_var		B,psvar_byte1,#10
.donewlife
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

;	s_playerfly_mode	bigspace,nomacro

	s_set_var		B,splayerflymode,#spfm_inside
	s_clr_alsflag		x,colldisable

	lda	curstrat&WM
	cmp	#1
	beq	.1
	cmp	#2
	beq	.2
	cmp	#3
	beq	.3
	cmp	#4
	beq	.4
	cmp	#5
	beq	.5
	cmp	#6
	beq	.6
	cmp	#7
	beq	.7
	cmp	#8
	beq	.8
	cmp	#9
	beq	.9
	cmp	#10
	beq	.10
	cmp	#11
	beq	.11
	cmp	#12
	beq	.12
	cmp	#13
	beq	.13
	cmp	#14
	beq	.14
	cmp	#15
	beq	.15
.1
	s_jmp			playerintunnel_Istrat
	bra	.done
.2
	s_jmp			playerinStunnel_Istrat
	bra	.done
.3
	s_jmp			playerinMtunnel_Istrat
	bra	.done
.4
	s_jmp			playerinLtunnel_Istrat
	bra	.done
.5
	s_jmp			playerincolony_Istrat
	bra	.done
.6
	s_jmp			playerintraining_Istrat
	bra	.done
.7
	s_jmp			playerinspace_Istrat
	bra	.done
.8
	s_jmp			playerinspacenovc_Istrat
	bra	.done
.9
	s_jmp			playeronplanet_Istrat
	bra	.done
.10
	s_jmp			playeronplanet2_Istrat
	bra	.done
.11
	s_jmp			playerundergnd_Istrat
	bra	.done
.12
	s_jmp			playerundergnd2_Istrat
	bra	.done
.13
	s_jmp			playeronwater_Istrat
	bra	.done
.14
	s_jmp			playeronwater_Istrat
	bra	.done
.15
	s_jmp			playerinnucleus_Istrat
.done

	s_playerctrl		on
	s_and_var		B,pstratflags,#~pstf_novdistC
	s_set_var		B,splayerflymode,#spfm_inside
	s_set_alvar		B,x,al_sbyte2,#10
	lda	curstrat&WM
	cmp	#1
	beq	.1x
	cmp	#2
	beq	.2x
	cmp	#3
	beq	.3x
	cmp	#4
	beq	.4x
	cmp	#5
	beq	.5x
	cmp	#6
	beq	.6x
	cmp	#7
	beq	.7x
	cmp	#8
	beq	.8x
	cmp	#9
	beq	.9x
	cmp	#10
	beq	.10x
	cmp	#11
	beq	.11x
	cmp	#12
	beq	.12x
	cmp	#13
	beq	.13x
	cmp	#14
	beq	.14x
	cmp	#15
	beq	.15x
.1x
	s_jmp			playerintunnel_Istrat
	bra	.donex
.2x
	s_jmp			playerinStunnel_Istrat
	bra	.donex
.3x
	s_jmp			playerinMtunnel_Istrat
	bra	.donex
.4x
	s_jmp			playerinLtunnel_Istrat
	bra	.donex
.5x
	s_jmp			playerincolony_Istrat
	bra	.donex
.6x
	s_jmp			playerintraining_Istrat
	bra	.donex
.7x
	s_jmp			playerinspace_Istrat
	bra	.donex
.8x
	s_jmp			playerinspacenovc_Istrat
	bra	.donex
.9x
	s_jmp			playeronplanet_Istrat
	bra	.donex
.10x
	s_jmp			playeronplanet2_Istrat
	bra	.donex
.11x
	s_jmp			playerundergnd_Istrat
	bra	.donex
.12x
	s_jmp			playerundergnd2_Istrat
	bra	.donex
.13x
	s_jmp			playeronwater_Istrat
	bra	.donex
.14x
	s_jmp			playeronwater_Istrat
	bra	.donex
.15x
	s_jmp			playerinnucleus_Istrat
.donex




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

;	s_set_var		W,viewdist,#outviewdist
;	s_set_var		W,outdist,#outviewdist
;	s_set_var		W,outvx,#0
;	s_set_var		W,outvy,#0
;	s_set_var		W,outvz,#0

	lda	curr_ship
	beq	.norm
	s_set_var		B,psvar_byte1,#12	; 22	
	bra	.done
.norm
	s_set_var		B,psvar_byte1,#23	; 22
.done
	jsr			makeallmedpspeed

playeroutofcock_strat
	s_start_strat

	rept	2
	s_achase_alvar		W,x,al_worldx,#0,1
	s_achase_alvar		W,x,al_worldy,#space_viewcy,1
	s_achase_var		B,player_Ztilt,#0,1
	s_achase_var		W,plrotz,#0,1
	endr
	lda	curr_ship
	bne	.doitslower
	s_jmp_varNE		B,psvar_byte1,#19,.badobj1
	bra	.donedoingit
.doitslower

	s_jmp_varNE		B,psvar_byte1,#8,.badobj1
.donedoingit

	lda	curr_ship
	bne	.nulls
	s_make_obj		#cockpit,.badobj
	bra	.doneobjj
.nulls
	s_make_obj		#nullshape,.badobj
.doneobjj
	s_copy_pos		y,x
	s_sub_alvar		W,y,al_worldz,#65+40
	s_set_strat		y,cockpitout_Istrat
;	s_set_alvar		B,y,al_roty,#deg180
.badobj
	s_make_obj		#nullshape,.badobj1
	lda	curr_ship
	bne	.secondjump
	s_ldajsl		B,#pshipnum_zoom,setYplayershape_l
	bra	.secondjump1
.secondjump
;	s_ldajsl		B,#curr_ship,setYplayershape_l
	CHG_MODE	B
	a16
	lda	curr_ship
	a8
	jsl	setYplayershape_l
	CHG_MODEBACK	B
.secondjump1
	s_copy_pos		y,x
	s_sub_alvar		W,y,al_worldz,#611
	s_set_strat		y,cockshipout_Istrat
.badobj1

	s_jmpNOT_varAND		B,pshipflags2,#psf2_playerHP0,.ndying
	s_add_var		B,player_Zstratadd,#4
.ndying

	s_decbne_var		B,psvar_byte1,playerstraight_strat

	s_clr_alsflag	x,invisible
;	s_playerfly_mode	space,nomacro

;	lda			#pshipnum_norm		
;	s_jsl			select_ship_l

	
	
	s_jmp_varAND		B,pshipflags2,#psf2_playerHP0,playerdead_Istrat

	lda	curstrat&WM
	cmp	#1
	beq	.1
	cmp	#2
	beq	.2
	cmp	#3
	beq	.3
	cmp	#4
	beq	.4
	cmp	#5
	beq	.5
	cmp	#6
	beq	.6
	cmp	#7
	beq	.7
	cmp	#8
	beq	.8
	cmp	#9
	beq	.9
	cmp	#10
	beq	.10
	cmp	#11
	beq	.11
	cmp	#12
	beq	.12
	cmp	#13
	beq	.13
	cmp	#14
	beq	.14
	cmp	#15
	beq	.15
.1
	s_jmp			playerintunnel_Istrat
	bra	.done
.2
	s_jmp			playerinStunnel_Istrat
	bra	.done
.3
	s_jmp			playerinMtunnel_Istrat
	bra	.done
.4
	s_jmp			playerinLtunnel_Istrat
	bra	.done
.5
	s_jmp			playerincolony_Istrat
	bra	.done
.6
	s_jmp			playerintraining_Istrat
	bra	.done
.7
	s_jmp			playerinspace_Istrat
	bra	.done
.8
	s_jmp			playerinspacenovc_Istrat
	bra	.done
.9
	s_jmp			playeronplanet_Istrat
	bra	.done
.10
	s_jmp			playeronplanet2_Istrat
	bra	.done
.11
	s_jmp			playerundergnd_Istrat
	bra	.done
.12
	s_jmp			playerundergnd2_Istrat
	bra	.done
.13
	s_jmp			playeronwater_Istrat
	bra	.done
.14
	s_jmp			playeronwater_Istrat
	bra	.done
.15
	s_jmp			playerinnucleus_Istrat
.done

	s_JMP_varAND		B,pstratflags,#pstf_inseq,.npcon
	s_playerctrl		on
.npcon
;	s_set_var		W,viewdist,#outviewdist
	s_set_var		B,splayerflymode,#spfm_norm
	s_clr_alsflag		x,hitflash
	lda	curstrat&WM
	cmp	#1
	beq	.1x
	cmp	#2
	beq	.2x
	cmp	#3
	beq	.3x
	cmp	#4
	beq	.4x
	cmp	#5
	beq	.5x
	cmp	#6
	beq	.6x
	cmp	#7
	beq	.7x
	cmp	#8
	beq	.8x
	cmp	#9
	beq	.9x
	cmp	#10
	beq	.10x
	cmp	#11
	beq	.11x
	cmp	#12
	beq	.12x
	cmp	#13
	beq	.13x
	cmp	#14
	beq	.14x
	cmp	#15
	beq	.15x
.1x
	s_jmp			playerintunnel_Istrat
	bra	.donex
.2x
	s_jmp			playerinStunnel_Istrat
	bra	.donex
.3x
	s_jmp			playerinMtunnel_Istrat
	bra	.donex
.4x
	s_jmp			playerinLtunnel_Istrat
	bra	.donex
.5x
	s_jmp			playerincolony_Istrat
	bra	.donex
.6x
	s_jmp			playerintraining_Istrat
	bra	.donex
.7x
	s_jmp			playerinspace_Istrat
	bra	.donex
.8x
	s_jmp			playerinspacenovc_Istrat
	bra	.donex
.9x
	s_jmp			playeronplanet_Istrat
	bra	.donex
.10x
	s_jmp			playeronplanet2_Istrat
	bra	.donex
.11x
	s_jmp			playerundergnd_Istrat
	bra	.donex
.12x
	s_jmp			playerundergnd2_Istrat
	bra	.donex
.13x
	s_jmp			playeronwater_Istrat
	bra	.donex
.14x
	s_jmp			playeronwater_Istrat
	bra	.donex
.15x
	s_jmp			playerinnucleus_Istrat
.donex



cockshipout_Istrat
	s_start_strat	
	s_set_aldata	x,#hardhp,#0
	s_set_alsflag	x,colldisable
	s_set_strat	x,cockshipout_strat
	s_setnoremove_behind	x
	lda	curr_ship
	bne	.lowerlife
	s_set_lifecnt	x,#19
	bra	.donelife
.lowerlife
	s_set_lifecnt	x,#10
.donelife
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

viewmove_srou_l
	jsr	viewmove_srou
	rtl

viewmove_srou

	ifeq	0
	lda	#%00000100
	sta	playersndflag
	lda	stopcounting
	and	#15
	cmp	#1
	beq	.noframe
	s_inc_alvar	W,x,alx_frame
.noframe
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
	lda	frozen
	bne	.noresume
	s_set_var		B,player_tospeed,player_medspeed
.noresume
	s_achase_var		W,pviewposz,player_posz,3

.normspd
	lda	frozen
	bne	.noresume2
	s_speedto		x,player_tospeed,2
.noresume2
.nvchase
;---------------------------------------------
; MM hack
	s_jmp_varNE		B,splayerflymode,#spfm_inside,.nvin
;	s_copy_alvar2var	W,x,pviewposx,al_worldx
;	s_copy_alvar2var	W,x,pviewposy,al_worldy
;	s_copy_alvar2var	W,x,pviewposz,al_worldz				;makes things move when in first person
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

;	a16
;	lda	curr_ship
;	cmp	#12
;	beq	.wolf1
;	cmp	#27
;	beq	.wolf1
;	cmp	#14
;	bmi	.maybe21
;	a8
;	s_set_var    W,viewdist,#240
;	s_set_var    W,outviewdist,#240
;	s_set_var    W,outdist,#240
;	bra	.noimdonee31
;.wolf1
;	a8
;	s_set_var    W,viewdist,#300
;	s_set_var    W,outviewdist,#300
;	s_set_var    W,outdist,#300
;	bra	.noimdonee31
;.maybe21
;	a8
;	s_set_var    W,viewdist,#120
;	s_set_var    W,outviewdist,#120
;	s_set_var    W,outdist,#120
.noimdonee31
;	s_set_var		W,viewdist,#outviewdist
;	s_set_var		W,outdist,#outviewdist

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
	s_set_var		B,ptwonumhits,#0

	s_set_var		B,specialdelay,#1

	s_set_var		W,pviewposz,#0
;	s_set_var		B,playerdieYrotspeed,#128

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



makeallmedpspeed
	s_set_speed		x,#medpspeed
	s_set_var		W,pviewvelz,#medpspeed
	s_set_var		B,player_medspeed,#medpspeed
	s_set_var		B,player_tospeed,#medpspeed
	s_set_var		W,playervelZ,#medpspeed
	rts

;********************************************************************************************
playermove_srou

	ifeq	1
	lda	lives
	cmp	#0
	beq	.poneisdead
	bmi	.poneisdead
	bra	.notdead
.poneisdead
	s_set_alsflag	x,invisible
	s_set_alsflag		x,colldisable
;	jsl				playerstraight_strat
;	s_set_alvar        W,x,al_worldy,#-100
;	s_set_alvar        W,x,al_worldx,#0
	s_or_var	B,pshipflags,#psf_noctrl!psf_noYctrl!psf_nofire
;	s_set_var		B,specialdelaytwo,#1
	s_set_alvar		W,x,al_hp,#0
	lda	#0
	sta.l	m_damage
	lda	#1
	sta	ponedead
	sta.l	m_playeronedead
	s_set_expstrat	x,0
	s_set_strat	x,playerone_resume_strat
	rts
.notdead
	endc

;-------------------------------------------------------------------
; wire ship num hits check.
	lda	ponedead
	cmp	#0
	lbeq	.nothingtoseehere
	lda	ponerevivedelay
	cmp	#1
	beq	.revivepone
	lbpl	.decponerevive
	jmp	.nothingtoseehere
.revivepone
	lda	lives
	cmp	#0
	lbeq	.hedead
	lbmi	.hedead
	stz	ponedead
	stz	ponerevivedelay
	lda	#0
	sta.l	m_playeronedead
	s_clr_alsflag	x,invisible
	s_clr_alsflag	x,colldisable
	s_and_var	B,pshipflags,#~psf_noctrl!~psf_noYctrl!~psf_nofire
	s_set_objtobevar	y,pcboxobj_B
	s_set_alvar.w		B,y,al_hp,#100
	s_set_alvar.w		B,x,al_hp,#100

	s_set_expstrat	x,0
;	s_set_strat	x,playerone_resume_Istrat
	lda	livestwo
	bne	.nolockview
	lda	#1
	sta	noview
.nolockview
	lda	curstrat&WM
	cmp	#1
	beq	.1
	cmp	#2
	beq	.2
	cmp	#3
	beq	.3
	cmp	#4
	beq	.4
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
.1
	s_set_strat			x,playerintunnel_Istrat
	jmp	.done
.2
	s_set_strat			x,playerinStunnel_Istrat
	jmp	.done
.3
	s_set_strat			x,playerinMtunnel_Istrat
	jmp	.done
.4
	s_set_strat			x,playerinLtunnel_Istrat
	jmp	.done
.5
	s_set_strat			x,playerincolony_Istrat
	jmp	.done
.6
	s_set_strat			x,playerintraining_Istrat
	jmp	.done
.7
	s_set_strat			x,playerinspace_Istrat
	bra	.done
.8
	s_set_strat			x,playerinspacenovc_Istrat
	bra	.done
.9
	s_set_strat			x,playeronplanet_Istrat
	bra	.done
.10
	s_set_strat			x,playeronplanet2_Istrat
	bra	.done
.11
	s_set_strat			x,playerundergnd_Istrat
	bra	.done
.12
	s_set_strat			x,playerundergnd2_Istrat
	bra	.done
.13
	s_set_strat			x,playeronwater_Istrat
	bra	.done
.14
	s_set_strat			x,playeronwater_Istrat
	bra	.done
.15
	s_set_strat			x,playerinnucleus_Istrat
.done
	bra	.nothingtoseehere
.decponerevive
	dec	ponerevivedelay
	jmp	.npsc
;----------------------------------------------------
.nothingtoseehere



	a8
	s_jmpNOT_varAND		B,pshipflags2,#psf2_wireship,.notwire
	s_jmp_varlesseq		B,pnumhits,#3-1,.iswire
	
	s_beqdec_var		B,wireendflash,.backtonorm
	s_jmp_varAND		B,wireendflash,#3,.wire
	stz			shieldup
	a16

	lda			curr_ship
	a8
	cmp			#1
	lbne			.notwire
	lda			#pshipnum_norm
	sta			curr_ship
	jsl			select_ship_l
	jmp			.nochange 
;-----------------
;-----------------
	
.wire	
	lda		#1
	sta		shieldup
	a16
	lda			curr_ship
	a8
	cmp			#0
	lbne			.notwire
	lda			#pshipnum_wire
	sta			curr_ship
	jsl			select_ship_l
	jmp			.notwire    
	
	
.backtonorm
	stz			shieldup
	a16
	lda			curr_ship
	a8
	cmp			#1
	lbne			.nochange
	lda			#pshipnum_norm
	sta			curr_ship
	jsl			select_ship_l
.nochange
	s_and_var		B,pshipflags2,#~psf2_wireship
.iswire    
	s_set_var		B,wireendflash,#50
.notwire    

;-------------------------------------------------------------------

	s_beqdec_alvar		B,x,al_sbyte1,.nhfl
	s_set_var2rnd		viewshakeX,#15
	s_sub_var		B,viewshakeX,#7
	s_set_var2rnd		viewshakeY,#15
	s_sub_var		B,viewshakeY,#7
	s_set_var2rnd		viewshakeZ,#15
	s_sub_var		B,viewshakeZ,#7
	s_jmp_notdelay		1,.done2
	s_set_alsflag		x,hitflash
	s_set_alsflag		x,nohitaffect
	s_bra			.done2

.nhfl
	s_clr_alsflag		x,nohitaffect

	stz			viewshakeX
	stz			viewshakeY
	stz			viewshakeZ
.done2

	

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
	lda		al_speed,x
	sta		player_speed
	sexam		player_speed+1


;-----------------------------------------------------------------------
	lda	frozen					
	lbne	.nfptop					;if frozen, skip top and bottom borders
	s_test_var		B,pmovelimit,#pml_Bbottom
	s_beq			.nfup
	s_jmp_alvarmi		W,x,al_vy,.nfup
	s_jmp_alvarmore		B,x,al_speed,player_medspeed,.fast
	s_jmp_keydown		jdown,.nfd
	s_set_var		W,plrotx,#0
.nfd	s_set_alvar		W,x,al_worldy,maxpmoveY
	s_bra			.nfup
.fast
	s_set_alvar		W,x,al_worldy,maxpmoveY

	a16
	lda			plrotx
	nega
	asra
	sta			plrotx		
	a8


	s_or_var		B,pmovelimit,#pml_lwbottom!pml_rwbottom

	s_set_var		B,player_noctrlcnt,#4

.nfup

	s_and_var		B,arrows,#~(sprar_up!sprar_down)
	s_test_var		B,pmovelimitAND,#pml_Bbottom
	s_bne			.nfpbottom

	lda	frozen
	bne	.nfptop
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

	lda	tunneltime
	lbne	.noviewrot
	s_test_var		B,pshipflags,#psf_noctrl!psf_noYctrl
	s_bne			.zerovrot
	lda	playertwoactivated
	lbne	.noviewrot
	lda	nolockview
	lbne	.noviewrot
	lda	stopcounting

	s_jmp_varAND	B,superspeeddelay,#ktest3,.noviewrot
	s_jmp_varAND	B,superspeeddelay,#ktest4,.noviewrot
	s_jmp_varAND	B,superspeeddelay,#ktest5,.noviewrot
;	s_test_var		B,pmovelimitAND,#pml_Bbottom
;	s_bne			.nvxmax
;	s_jmp_alvarless		W,x,al_worldy,maxpmoveY,.nvxmax
.rot
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



;------------------------------------------------------------------------
; wing hitting walls or ground.

	s_test_var		B,pmovelimit,#pml_lwtop!pml_rwtop
	s_beq			.nwt
	s_add_var		W,plrotx,#256*3
.nwt

	s_test_var		B,pmovelimit,#pml_lwbottom!pml_rwbottom
	s_beq			.nwb

	a16
	lda			plrotx
	nega
	sec
	sbc			#256*10		; 256*10 = push wing up 
	sta			plrotx		; so not hit gnd again.	
	a8

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
	jmp			.no_pctrl
.ctrl


;--------------------------------------
; speed.

	s_jmp_alvarNOTZERO		B,x,al_sbyte2,.npsd

	lda.l			m_boostanim
	cmp			#40
	lbcc			.npsd

	s_jmp_keyup		x,.notboosting
;	s_jmp_keydown		b,.npsi
	lda	frozen
	lbne	.npsi
	s_jmp_varAND		B,pshipflags2,#psf2_boosting,.boost
	trigse			$32
.boost

	s_or_var		B,pshipflags2,#psf2_boosting

;	lda			#1
;	sta.l			m_boostcnt

	s_set_vartobeobj	boostobj,x
	lda	godmode
	beq	.normboost
	
	s_jmp_keyup		b,.normboost
	s_set_speed		x,#127					 ;player     superboost     speed
	s_set_var		B,player_tospeed,#127		 ;both values have to be the same
	bra	.doneboost


.normboost	
	s_set_speed		x,#maxpspeed
	s_set_var		B,player_tospeed,#maxpspeed
.doneboost
	;s_set_alvar		B,x,al_sbyte2,#20
    s_jmp_varEQ		B,splayerflymode,#spfm_inside,.nboostspr
	boost_sprite
.nboostspr


	s_jmp			.npsd
.notboosting
	s_and_var		B,pshipflags2,#~psf2_boosting
.npsi
;--------------------------------------------------------
	s_jmp_keyup		b,.notbraking


.brake
	s_or_var		B,pshipflags2,#psf2_braking

	s_jmp_varAND	B,pshipflags2,#psf2_braking,.nosfxbrake
	trigse			$33
.nosfxbrake
	lda			#1
	s_set_vartobeobj	boostobj,x

	lda	newgameplus
	and	#1
	lbne	.nofreeze
	
	lda	frozen								;load frozen status
	bne	.freeze								;if = 1 go to .freeze
.nofreeze	
	s_set_speed		x,#minpspeed
	s_set_var		B,player_tospeed,#minpspeed
	bra	.npsd

.freeze
	s_set_speed		x,#0				     ;player     superbrake     speed
	s_set_var		B,player_tospeed,#0		 ;both values have to be the same
	bra	.npsd
.notbraking
	s_and_var		B,pshipflags2,#~psf2_braking
.npsd

	s_test_var		B,pshipflags,#psf_noctrl
	s_bne			.no_pctrl


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
	s_add_var		W,plroty,#Zrotspeed
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
	s_sub_var		W,plroty,#Zrotspeed
.eprrc


;-----------------------------------------------------------------------


	s_test_var		B,pshipflags,#psf_noYctrl
	s_bne			.no_yctrl

	s_jmp_keyup		jup,.nhu
	s_add_var		W,plrotx,#Xrotspeed
.nhu
	s_jmp_keyup		jdown,.nhd
	s_sub_var		W,plrotx,#Xrotspeed
.nhd

.no_yctrl
;------------------------------------------------------------------------
.nhjr


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
	s_set_var		B,player_rolldelay,#3
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

	
	s_Achase_var		W,plroty,#0,3
	s_clr_alsflag		x,colldisable

;-------------------------------------------------------------------
; Z rotation chase.
	s_Achase_var	W,plrotz,#0,4
;-------------------------------------------------------------------



	s_Achase_var	W,plrotx,#0,3
	

	STZ			pmovelimit


				 
;	s_limit_alvar		B,x,al_speed,minPspeed,maxPspeed

	s_limit_var		W,plrotz,-$600,$600					;Limits world Z rotation
	
	
	s_copy_var2alvar	B,x,al_rotx,plrotx+1
	s_copy_var2alvar	B,x,al_roty,plroty+1
	s_add_alvar		B,x,al_roty,player_turnrot+1
	s_copy_var2alvar	B,x,al_rotz,plrotz+1
	s_add_alvar		B,x,al_rotz,player_ztilt
	s_add_alvar		B,x,al_rotz,player_zshake+1
	s_add_alvar		B,x,al_rotz,player_zstratadd
;----------------------------------------------------------
	s_jmp_varNOTZERO	B,player_rollZvel,.zroll
	s_achase_var		B,player_rollZoff,#0,3
	s_brl			.zrcont
.zroll
	s_add_vars		B,player_rollZoff,player_rollZvel
;	s_jmpNOT_varAND	B,strat_valid,#gm11,.noxtrabr
	s_jmp_varAND	B,strat_valid,#brflag,.noxtrabr ;no continuous barrel roll for boss 3-2
	lda	newgameplus
	bne	.noxtrabr
	lda	cockpitmode
	bne	.noxtrabr
	s_jmp_keydown		left,.zrcont
	s_jmp_keydown		right,.zrcont
.noxtrabr
	s_jmp_varpl		B,player_rollZvel,.zrispl
	s_add_var		B,player_rollZvel,#2
	s_bra			.zrcont
.zrispl       	
	s_sub_var		B,player_rollZvel,#2
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
;----------------------------------------------------
; HUD rotation

	lda	al_rotz,x
	sta	hudrot

;----------------------------------------------------
;	s_set_var		B,player_Ztilt,#0
;	s_achase_alvar		B,x,al_rotz,#0,1
;----------------------------------------------------



	rts					 

.hedead
	s_set_alsflag	x,invisible
	s_set_alsflag	x,colldisable
	rts



;******************************************************************************
playerlimitx_srou
	lda	frozen
	bne	.nmaxX
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

	s_jmp_keyup		right,.nogodnukes
	s_jmp_keyup		a,.nogodnukes
	s_jmp_lastkeydown	a,.nogodnukes
	lda	godmode
	beq	.nogodnukes ;if god mode off, skip
	s_set_var		B,specialdelay,#4
	trigse			$31
	lda	#1
	sta	godnuke
	s_weapon_pos		#0,#0,#80>>weapon_scale
	s_weapon_rot		#0,#0
	s_fire_weapon		x,NUKE,.npfa
	s_set_alvar		B,y,al_sbyte4,#2	
	jmp	.npfa
.nogodnukes
	s_jmp_keyup		a,.npfa
	s_jmp_lastkeydown	a,.npfa


;	s_weapon_pos		#0,#0,#80>>weapon_scale
;	s_weapon_rot		#0,#0
;	s_fire_weapon		x,spread,.npfa

	lda	godmode
	bne	.godmodeb ;if god mode on, set bomb delay to 1

	s_set_var		B,specialdelay,#20
	s_beqdec_var		W,specwepcntone,.npfa
	bra		.donegodmode
.godmodeb
	lda	madtrucker
	bne	.nogodmode
	s_set_var		B,specialdelay,#4
	bra	.donegodmode
.nogodmode
	s_set_var		B,specialdelay,#10
.donegodmode	


	trigse			$31

	s_weapon_pos		#0,#0,#80>>weapon_scale
	s_weapon_rot		#0,#0
	s_fire_weapon		x,NUKE,.npfa
	s_set_alvar		B,y,al_sbyte4,#2

;	ldy			pcboxobj_B
;	s_set_alvar		B,y,al_hp,#0


;	s_make_obj		#nullshape,.badobj
;	s_set_strat		y,bigparticleexplode_Istrat
;	s_copy_pos		y,x
;	s_add_alvar		W,y,al_worldz,#2000
;	s_set_alsflag		y,relexplode
;.badobj

.npfa

;------------------------------------------------------------
;	d_print_var		B,numplasers,1


	s_jmp_keyup		y,.resetfirecnt


	s_decbne_var		B,firedelay,.npfy

	lda	rapidfire
	and	#1
	bne	.continuenow
	s_beqdec_var		B,firecnt,.npfy
;------------------------------------------------------------
.continuenow
	lda		weaponnumberpone
	sta		weaponnumber

	lda	randomfire
	beq	.norandom
.randwep
	jsl	random_l
	and	#127
	cmp	#98
	beq	.okies
	cmp	#99
	beq	.okies
	cmp	#29
	bpl	.randwep
.okies
	sta	weaponnumber
.norandom
	jsl		dofireplease_l ;fire code moved to gstrats
	bra		.npfy
;------------------------------------------------------------
.resetfirecnt
	s_set_var		B,firecnt,#3
	s_set_var		B,firedelay,#1

.npfy
.noresetfc


;---------------------------------------------
; MM hack
	s_jmp_varNE	B,splayerflymode,#spfm_inside,.nin2

	s_copy_var2alvar	W,x,al_worldx,svar_word1
	s_copy_var2alvar	W,x,al_worldy,svar_word2
	s_copy_var2alvar	W,x,al_worldz,svar_word3
.nin2

;---------------------------------------------

	rts

deadplayerstrat
	s_start_strat
	s_set_objtobeplayer	y
	s_set_find		0
	s_find_obj		y,x,#playertwo1,.nitem
	s_copy_alvar2alvar.w	W,x,al_worldx,y,al_worldx
	s_copy_alvar2alvar.w	W,x,al_worldy,y,al_worldy
.nitem
	s_end_strat
;*****************************************************************************
playerdead_Istrat
	s_start_strat
;	s_set_strat	x,explode_Istrat
;	s_end_strat
;------------------------------------
; remove arrow warnings.
	dec	lives
	lda.l	m_playertwoactivated
	lbeq	.normaldeath
;-----------------------------------------------------------------------------	
	lda	livestwo
	beq	.twodead
	bra	.contin
.twodead
	lda	lives
	lbeq	.normaldeath
	lbmi	.normaldeath
.contin

;	lda	ponedead
;	cmp	#1
;	lbeq		.normaldeath

;	ifne	ponedead
	s_set_alsflag	x,invisible
	s_set_var	B,ponerevivedelay,#70
	s_set_expstrat	x,0
;	endc

	ifeq	0	;use
	s_set_alsflag		x,colldisable
;	jsl				playerstraight_strat
;	s_set_alvar        W,x,al_worldy,#-100
;	s_set_alvar        W,x,al_worldx,#0
	s_or_var	B,pshipflags,#psf_noctrl!psf_noYctrl!psf_nofire
;	s_set_var		B,specialdelaytwo,#1
	s_set_alvar		B,x,al_hp,#0
	lda	#0
	sta.l	m_damage
	lda	#1
	sta	ponedead
	sta.l	m_playeronedead
	lda	lives
	lbmi	.noviewreset
	lbne	.noviewreset
	lda	#1
	sta	dohofs
	lda	#1
	sta	dovofs
	stz	noxrot
	s_set_var    W,viewdist,#120
	s_set_var    W,outviewdist,#120
	s_set_var    W,outdist,#120
	stz	viewtype

.noviewreset
	s_end_strat
	
	endc	;end
;-----------------------------------------------------------------------------	
.normaldeath
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
	lda	nobgm
	bne	.skipbgm
	startbgm		$11
.skipbgm
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
;	s_jmp_ifnotlevel	2,.nlevel22
;	s_jmp_varNE		B,stage,#1,.nlevel22
;	s_set_var		B,playerdieYrotspeed,#128/3
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
	lda	nobgm
	bne	.nsnd
	startbgm		$11
.nsnd

;	startbgm			$f0
	s_clr_alsflag		x,sflag1	; hit gnd sound.
	s_playerctrl		off

;	s_end_strat
	
playerdead_strat
	s_start_strat
;	s_set_strat	x,explode_Istrat
;	s_end_strat

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
	stz	fadetored
.npzz



	s_jmp_NOTdelay		2,.npdc
	s_Fchase_var		W,player_speed,#0,1
.npdc


	s_copy_var2alvar	B,x,al_rotx,plrotx+1
	s_copy_var2alvar	B,x,al_roty,plroty+1
	s_copy_var2alvar	B,x,al_rotz,plrotz+1
	s_copy_var2alvar	B,x,al_speed,player_speed
	s_add_alvar		B,x,al_rotz,player_zstratadd


	s_gen_3dvecs		x,al_roty,al_rotx,al_speed
	
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

	IFEQ	CONTEST	;if=0
	lda	lives
	beq	.nodec	;if=0
	bmi	.nodec
;	s_dec_var		B,lives
.nodec
	lda	lives
	bmi	.settime
	beq	.settime
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
do_player_limitX
	jsr		playermove_srou
	s_gen_3dvecs	x,al_roty,al_rotx,al_speed
	jsr		framescalevecs
    	s_add_vecs2pos	x
	jsr		playerlimitX_srou
	jsr		playerfire_srou
	jsr		checkarrows_srou
	rts


do_player_Yvel125
	jsr		playermove_srou
	s_gen_3dvecs	x,al_roty,al_rotx,al_speed
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
	s_gen_3dvecs	x,al_roty,al_rotx,al_speed
	jsr		framescalevecs
	s_add_vecs2pos	x
	jsr		playerfire_srou
	jsr		checkarrows_srou
	rts

do_playerYvelD2
	jsr		playermove_srou
	s_gen_3dvecs	x,al_roty,al_rotx,al_speed

	a16

	lda	al_vx,x
;	jsl	perc62A_l
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
	s_gen_3dvecs	x,al_roty,al_rotx,al_speed
	a16

	lda	al_vx,x
;	jsl	perc62A_l
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
	s_gen_3dvecs	x,al_roty,al_rotx,al_speed


	a16
	lda	al_vx,x
;	jsl	perc62A_l
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
	lda	#0
	pha
	plb

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
	jsl	setship
	rts
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

twopZrotfloattab

	db	0

	db	1
	db	1
	db	2,2
	db	1
	db	1

	db	0
	db	0
	db	0

	db	-1
	db	-1
	db	-2,-2
	db	-1
	db	-1

twopZrotfloattab_len	equ	*-twopZrotfloattab


 

	strats_end


	

	
	

	


