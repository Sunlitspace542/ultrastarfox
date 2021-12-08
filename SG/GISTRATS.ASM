***************************************************************************
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
;*   File: GISTRATS.ASM                                                     *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr: GILES INTRO DEMO STRATS.                                        *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   Date: 29/7/92                                                         *
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

	incpublics	gistrats.ext

	strats_start

;*******************************************************************************
intro1pfall_Istrat
	s_start_strat
	s_set_strat	x,intro1pfall_strat
	s_set_alsflag	x,colldisable
intro1pfall_strat
	s_start_strat
	s_beqdec_alvar	B,x,al_Sbyte1,intro1pfalling_init
	s_end_strat
	

intro1pfalling_init
	s_set_strat	x,intro1pfalling_strat
	s_jsl		makeMEDexpobj_srou
	s_add_alvar	W,y,al_worldy,#-60
intro1pfalling_strat
	
	s_start_strat
	s_jmp_alvarEQ	B,x,al_sbyte2,#6,.nadd
	s_jmp_notdelay	1,.nadd
	s_inc_alvar	B,x,al_sbyte2
.nadd
	s_jmp_alvarMORE	B,x,al_rotx,#deg90,.nfall
	s_add_alvars	B,x,al_rotx,x,al_sbyte2
.nfall
	s_end_strat



;*******************************************************************************
;tunnel6_Istrat
;	s_start_strat
;	s_set_alptrs	x,tunnel6_strat,0,0
;	s_set_alsflag	x,colldisable
;	s_init_anim	x,#0
;tunnel6_strat
;	s_start_strat
;	s_jmp_alvarMI	B,x,al_sbyte1,.nanim
;	s_beqdec_alvar	B,x,al_sbyte1,.anim
;     	s_brl		.nanim
;.anim
;	s_cmp_anim	x,#9
;	s_beq		.nanim
;	s_add_anim	x,#1,#10
;.nanim
;	s_end_strat
	



;*****************************************************************************
;friendF1_Istrat
;	s_start_strat
;	s_set_alvar		B,x,al_sbyte1,#15
;	set_sound2		x,#$01
;             	s_jmp			friendF_init
;friendF2_Istrat
;	s_start_strat
;	s_set_alvar		B,x,al_sbyte1,#25
;;	set_sound1		x,#$0d
;
;friendF_init
;	s_set_aldata		x,#1,#0
;	s_set_alptrs		x,friendF_strat,hitflash_Istrat,explode_Istrat
;	s_set_speed		x,#20
;	s_gen_Zvec		x,al_speed
;friendF_strat		
;	s_start_strat
;	s_decbne_alvar		B,x,al_sbyte1,.noboost
;	s_set_speed		x,#100
;	s_gen_Zvec		x,al_speed
;	boost_sprite
;	s_set_vartobeobj	boostobj,x
;	trigse			$32
;.noboost
;	s_add_alvar		B,x,al_rotz,#deg45/4
;	s_add_vecs2pos		x
;	s_add_playerZ		x
;	s_jmp_alvarless		W,x,al_worldz,#4000,.nkf
;	s_remove_obj		x
;.nkf
;	s_end_strat





	ifeq	1
;*******************************************************************************
tsumami_Istrat
	s_start_strat
	s_set_alptrs	x,tsumami_strat,0,0
	s_set_alsflag	x,colldisable
	s_init_anim	x,#0
	s_end_strat
tsumami_strat
	s_start_strat

	s_beqdec_alvar	B,x,al_sbyte1,.anim
	s_brl		.nanim
.anim
	s_cmp_anim	x,#1
	s_bne		.nsnd
	trigse		$66
.nsnd
	

	s_cmp_anim	x,#14
	s_beq		.tsumami2_init
	s_add_anim	x,#1,#15
.nanim	s_end_strat

.tsumami2_init
	s_set_strat	x,.tsumami2_strat	
	s_set_alvar	W,x,al_shape,#tsu_1
	s_init_anim	x,#0
.tsumami2_strat	
	s_start_strat

	s_cmp_anim	x,#14
	s_beq		.nanim2
	s_add_anim	x,#1,#15
.nanim2	s_end_strat

	endc

;*******************************************************************************
	ifeq	1

friendstart1_istrat
	s_start_strat
	s_set_strat		x,friendstart1_strat
	s_set_alsflag		x,shadow
	s_set_alsflag		x,colldisable
	s_end_strat

friendstart1_strat
	s_start_strat
	s_beqdec_alvar		B,x,al_sbyte1,friendstart1up_init
	s_end_strat


friendstart1up_init
	s_set_strat		x,friendstart1up_strat
	s_set_alvar		B,x,al_sbyte1,#32+1
friendstart1up_strat
	s_start_strat
	s_beqdec_alvar		B,x,al_sbyte1,friendstart1go_init
	s_jmp_alvarLESS		B,x,al_sbyte1,#16+1,.nup
	s_add_alvar		W,x,al_worldy,#-5
	s_brl			.end
.nup	
	s_set_var2alvartab	B,W,W,svar_word1,x,al_sbyte2,startiYtab
	s_add_alvar		W,x,al_worldy,svar_word1
	s_set_var2alvartab	B,W,W,svar_word1,x,al_sbyte2,startiZtab
	s_add_alvar		B,x,al_rotz,svar_word1
	s_add_alvar		B,x,al_sbyte2,#2
	s_jmp_alvarNE		B,x,al_sbyte2,#32,.nmax
	s_set_alvar		B,x,al_sbyte2,#0
.nmax


.end	s_end_strat

startiYtab	
	dw			2,2,1,1,1,0,1,0
	dw			0,-1,-1,-1,-2,-2,-1,0

startiZtab	
	dw			1,1,1,0,-1,-1,-1,0
	dw			1,1,1,0,-1,-1,-1,0



friendstart1go_init
	s_set_vartobeobj	boostobj,x
	boost_sprite
	trigse			$32
friendstart1go2_init
	s_set_lifecnt		x,#50
	s_set_strat		x,friendstart1go_strat
friendstart1go_strat
	s_start_strat

	s_jmp_notdelay		1,.nm
	s_achase_alvar		W,x,al_worldy,viewcy,3
.nm

	s_add_alvar		W,x,al_worldz,#70
	s_dec_lifecnt		x
	s_end_strat


friendstart2_Istrat
	s_start_strat
	s_setnoremove_behind	x
	s_set_alsflag		x,colldisable
	s_beqdec_alvar		B,x,al_sbyte1,friendstart2go_init
	s_end_strat

friendstart2go_init
	s_start_strat	
	s_set_strat		x,friendstart2go_strat
	s_set_lifecnt		x,#50
	s_set_speed		x,#70
	s_set_alvar		B,x,al_rotx,#deg11
	s_set_alvar		B,x,al_rotz,#deg90
friendstart2go_strat
	s_start_strat

	s_set_objtobeplayer	y
	s_jmp_objinfront	y,x,.nb
	s_jmp_alsflag		x,sflag1,.nb
	s_set_alsflag		x,sflag1
	s_set_vartobeobj	boostobj,x
	boost_sprite
	trigse			$32
.nb


	s_achase_alvar		B,x,al_rotz,#0,4
	s_jmp_notdelay		1,.nch
	s_achase_alvar		B,x,al_rotx,#0,4
	s_achase_alvar		W,x,al_worldx,#0,4
	s_achase_alvar		W,x,al_worldy,viewcy,3
.nch	s_gen_3dvecs		x,al_roty,al_rotx,al_speed
	s_add_vecs2pos		x
	s_dec_lifecnt		x
	s_end_strat


	endc


friendstart3_Istrat
	s_start_strat
	s_setnoremove_behind	x
	s_set_alsflag		x,colldisable
	s_set_strat		x,friendstart3go_strat
	s_set_lifecnt		x,#70
	s_set_speed		x,#30
	s_set_alvar		B,x,al_rotz,#-deg90
friendstart3go_strat
	s_start_strat

	s_set_objtobeplayer	y
	s_jmp_objinfront	y,x,.nch
	s_jmp_alsflag		x,sflag1,.nb
	s_set_alsflag		x,sflag1
	s_set_vartobeobj	boostobj,x
	boost_sprite
	trigse			$32
.nb
	s_achase_alvar		B,x,al_rotz,#0,4
	s_jmp_notdelay		2,.nch
	s_achase_alvar		B,x,al_rotx,#-deg90,4
.nch	


	s_gen_3dvecs		x,al_roty,al_rotx,al_speed
	s_add_vecs2pos		x
	s_add_playerZ		x
	s_dec_lifecnt		x
	s_end_strat



friendkill_Istrat
	s_start_strat
	remove_shadow		
	s_jmp		explode_Istrat

;*******************************************************************************
friendexitbase_Istrat
	s_set_alsflag	x,colldisable
	s_set_lifecnt	x,#1500/pexitbasespeed
	s_set_strat	x,friendexitbase_strat
	s_set_alsflag	x,shadow
	s_set_alsflag	x,invisible
	s_set_alvar		B,x,al_sbyte2,#11	; time until left snd
friendexitbase_strat
	s_start_strat
	s_decbne_alvar	B,x,al_sbyte1,.nowt
	s_set_alvar	B,x,al_sbyte1,#1

	s_beqdec_alvar	B,x,al_sbyte2,.left
	lda	#%10110001
	s_brl	.sndcont
.left
	lda	#%01010001
.sndcont
	sta.l	alx_snd1,x

	s_add_alvar	W,x,al_worldz,#pexitbasespeed
	s_clr_alsflag	x,invisible
	s_dec_lifecnt	x
.nowt	s_end_strat

;*******************************************************************************
pshipIntoLB1_Istrat
	s_start_strat
	s_set_strat	x,pshipIntoLB1_strat
	s_set_alsflag	x,colldisable
	s_set_speed	x,#medpspeed
	s_set_alvar	B,x,al_sbyte1,#deg90/2
pshipIntoLB1_strat
	s_start_strat


	s_jmp_ifnotstate	x,0,.nsup
	s_speedto	x,#minpspeed,1
	s_sub_alvar	B,x,al_rotx,#2
	s_decbne_alvar	B,x,al_sbyte1,.nsup
	s_set_state		x,#1
	s_set_alvar	B,x,al_sbyte1,#deg180/2
.nsup

	s_jmp_ifnotstate	x,1,.nsdown
	s_jmp_alvarNE		B,x,al_sbyte1,#10,.nsopen
	s_OR_var		B,gameflags2,#gf2_stratflag1
.nsopen
	s_add_alvar		B,x,al_rotz,#8
	s_speedto	x,#minpspeed,1
	s_add_alvar	B,x,al_rotx,#2
	s_decbne_alvar	B,x,al_sbyte1,.nsdown
	s_set_state		x,#2
	s_set_speed	x,#maxpspeed
	s_set_vartobeobj	boostobj,x
	boost_sprite
	trigse		$32
	s_set_alvar		B,x,al_Sbyte1,#40
.nsdown



	s_jmp_ifnotstate	x,2,.nsdown2
	s_set_objtobevar	y,mapvar1
	s_achase_alvar2alvar	W,x,al_worldz,y,al_worldz,4
	s_achase_alvar2alvar	W,x,al_worldx,y,al_worldx,4
	s_achase_alvar		B,x,al_rotz,#0,3
	s_decbne_alvar		B,x,al_sbyte1,.nsdown2
	s_set_state		x,#4
.nsdown2
		

	s_jmp_ifnotstate	x,4,.nend
	s_set_objtobeplayer	y
	s_set_strat		y,playerinLtunnel_Istrat
	s_clr_alsflag		y,invisible
	s_set_vartobeobj	viewtoobj,y

	s_set_var		B,viewtype,#viewtype_norm
	s_set_var		W,pviewvelz,#maxpspeed
	s_set_var		W,player_tospeed,#maxpspeed
	s_set_var		W,outdist,#inviewdist
	s_set_var		W,viewdist,#inviewdist
	s_set_var		B,player_medspeed,#medpspeed
	s_set_speed		y,#maxpspeed
	s_set_alvar		B,y,al_sbyte2,#1	; boost delay

	s_set_alvar		W,y,al_worldy,#Ltunnel_viewCY-5
	s_set_alvar		W,y,al_worldx,#0

	s_copy_alvar2var	W,y,player_posz,al_worldz
	s_copy_alvar2var	W,y,pviewposz,al_worldz
	s_sub_var		W,pviewposz,#maxpspeed
	s_set_var		W,pviewposy,#Ltunnel_viewCY
	s_set_var		W,pviewposx,#0

	s_set_var		W,outvx,#0
	s_set_var		W,outvy,#0
	s_set_var		W,outvz,#0

	s_AND_var		B,gameflags,#~gf_noZremove

	s_set_var		B,floatvar1,#0
	s_set_var		B,floatvar2,#0


	s_remove_obj		x
	s_end_strat

.nend


	s_gen_3dvecs	x,al_roty,al_rotx,al_speed
	s_add_vecs2pos	x

	s_end_strat



;*******************************************************************************
viewIntoLB1_Istrat
	s_start_strat
	s_set_strat	x,viewIntoLB1_strat
	s_set_alsflag	x,colldisable
	s_set_speed	x,#medpspeed
	s_set_alvar	B,x,al_sbyte1,#deg90/3

	s_set_alvar	W,x,al_sword1,outdist	; Z offset
	s_set_alvar	W,x,al_sword2,#0	; Y offset
	s_set_alvar	W,x,al_ptr,#0		; X offset

	s_jmp_random	.left
	s_set_alsflag	x,sflag1
.left

viewIntoLB1_strat
	s_start_strat

	s_set_objtobevar	y,viewtoobj
	

	s_jmp_ifNOTstate	y,0,.nsup
	s_add_alvar		W,x,al_sword1,#4

	s_jmp_alsflag		x,sflag1,.right
	s_add_alvar		W,x,al_ptr,#2
	s_brl			.nsup
.right	s_add_alvar		W,x,al_ptr,#-2
.nsup

	s_jmp_ifNOTstate	y,1,.nsdown1	; going down
	s_achase_alvar		W,x,al_sword1,#5,4
	s_add_alvar		W,x,al_sword2,#-8
.nsdown1

	s_jmp_ifnotstate	y,2,.nsdown2  	; boost
;	s_sub_var		W,outvz,#4*256
	s_achase_alvar		W,x,al_sword2,#maxpspeed-(inviewdist+maxpspeed),4
	s_achase_alvar		W,x,al_ptr,#0,3
.nsdown2


	s_jmp_ifnotstate	y,3,.nnorm	; chase Z to norm
;	s_achase_var		W,outvz,#0,3
.nnorm


	s_jmp_ifnotstate	y,4,.nend
	s_remove_obj		x
.nend

	s_copy_pos		x,y
	s_sub_alvars		W,x,al_worldz,x,al_sword1
	s_add_alvars		W,x,al_worldy,x,al_sword2
	s_add_alvars		W,x,al_worldx,x,al_ptr

	s_copy_alvar2var	W,x,viewposx,al_worldx
	s_copy_alvar2var	W,x,viewposy,al_worldy
	s_copy_alvar2var	W,x,viewposz,al_worldz

	s_copy_alvar2var	W,x,bgsscrollZ,al_worldy


;	s_set_objtobeplayer	y
;	s_copy_pos		y,x
	s_end_strat


;*******************************************************************************
lastb2_Istrat		; tunnel.
	s_start_strat
	s_set_alsflag	x,colldisable

	s_jmpNOT_varAND	B,pstratflags,#pstf_inseq,.invis
	s_clr_alsflag	x,invisible
	s_jmp_varAND	B,gameflags2,#gf2_stratflag1,.isvis
.invis	s_set_alsflag	x,invisible
.isvis
	s_end_strat

;*******************************************************************************
lastb3_Istrat		; top entrance door.
	s_start_strat
	s_set_alsflag	x,colldisable

	s_jmpNOT_varAND		B,pstratflags,#pstf_inseq,.close
	s_JMPNOT_varAND		B,gameflags2,#gf2_stratflag1,.close
	s_set_objtobevar	y,viewtoobj
	s_jmp_objptrbad		y,.close
	s_jmp_Hdistmore		x,y,#500,.close
	s_OR_var		B,gameflags2,#gf2_stratflag2
.open	
	s_cmp_anim		x,#0
	s_bne		.nsnd
	trigse		$55
.nsnd
	s_cmp_anim		x,#10
	s_beq			.end
	s_add_anim		x,#1,#11
	s_brl			.end
.close
	s_init_anim		x,#0
.end
    	s_end_strat

;*****************************************************************************
lastb4_Istrat	; second door
	s_start_strat
	s_set_alvar	B,x,al_rotx,#deg90

	s_set_alsflag	x,colldisable
	s_set_alsflag	x,invisible

	s_jmpNOT_varAND	B,pstratflags,#pstf_inseq,.close
	s_jmpNOT_varAND	B,gameflags2,#gf2_stratflag2,.close
	s_clr_alsflag	x,invisible

	s_set_objtobevar	y,viewtoobj
	s_jmp_objptrbad		y,.end
	s_jmp_Hdistmore		x,y,#700,.close
	s_OR_var		B,gameflags,#gf_stratdone1
	s_jmp_Hdistmore		x,y,#300,.close

.open	
	s_cmp_anim		x,#0
	s_bne		.nsnd
	trigse		$55
.nsnd
	s_cmp_anim		x,#9
	s_beq			.end
	s_add_anim		x,#1,#10
	s_brl			.end
.close
	s_init_anim		x,#0
.end



	s_end_strat
;*****************************************************************************
shipintro_Istrat
	s_start_strat
	s_set_strat	x,shipintro_strat
	s_set_alvar2rnd	x,al_sbyte3,#15
	s_set_alvar2rnd	x,al_sbyte4,#7
	s_scale_alvar	B,x,al_sbyte2,1
	s_AND_var		B,gameflags,#~gf_stratdone2
	s_set_alsflag	x,shadow
	s_set_lifecnt	x,#40
	s_setnoremove_behind	x
shipintro_strat
	s_start_strat


	s_jmpNOT_varAND		B,gameflags,#gf_stratdone2,.nboost
	s_jmp_alvarMI		B,x,al_sbyte1,.declife
	s_decbne_alvar		B,x,al_sbyte1,.nboost
	s_set_alvar		B,x,al_sbyte1,#1
	s_add_alvar		W,x,al_worldz,#50
.declife	s_dec_lifecnt		x
.nboost

	s_jmp_alvarNE		B,x,al_sbyte1,#2,.nspr
	s_set_vartobeobj	boostobj,x
	boost_sprite
	trigse			$32
.nspr

	jsl			floatCLship_l
	s_add_alvars	W,x,al_worldy,x,al_sword1


	s_add_alvar	W,x,al_worldz,#medpspeed
	s_end_strat

;******************************************************************************
viewopening_Istrat
	s_start_strat
	s_set_alsflag	x,invisible
	s_set_strat	x,viewopening_strat
	s_add_alvar		W,x,al_worldx,#-600*2
	s_add_alvar		W,x,al_worldy,#-1000*2
	s_add_alvar		W,x,al_worldz,#3500
	s_set_alvar		B,x,al_roty,#deg180
	s_set_alvar		B,x,al_rotx,#deg5
	s_set_alvar		B,x,al_sbyte1,#90
	s_AND_var		B,gameflags,#~gf_stratdone1
	s_and_var		B,pshipflags3,#~psf3_enginesnd
viewopening_strat
	s_start_strat

	s_set_var		W,svar_word1,player_posx
	s_set_var		W,svar_word2,#-30
;	s_set_var		W,svar_word2,player_posy
	s_set_var		W,svar_word3,player_posz


;-------------------------------------------------------------------------
	s_jmp_ifnotstate	x,0,.ns0
	s_add_var		W,svar_word1,#-400
	s_add_var		W,svar_word2,#-700
	s_add_var		W,svar_word3,#-700
	s_achase_alvar		W,x,al_worldx,svar_word1,5
	s_achase_alvar		W,x,al_worldy,svar_word2,5
	s_achase_alvar		W,x,al_worldz,svar_word3,5
	s_decbne_alvar		B,x,al_sbyte1,.ns0
	s_next_state		x
	s_set_alvar		B,x,al_sbyte1,#80
	s_or_var		B,gameflags,#gf_stratdone2
	s_or_var		B,pshipflags3,#psf3_enginesnd
.ns0

;-------------------------------------------------------------------------
	s_jmp_ifnotstate	x,1,.ns1
	
	s_decbne_alvar		B,x,al_sbyte1,.ndone
	s_or_var		B,gameflags,#gf_stratdone1
.ndone

	s_AND_var		B,gameflags,#~gf_nozremove

	s_add_var		W,svar_word2,#20
	s_add_var		W,svar_word3,#-300

	s_achase_alvar		W,x,al_worldy,svar_word2,4
	s_achase_alvar		W,x,al_worldx,svar_word1,3,.zoom
	s_brl			.nfuck
.zoom 	s_add_alvar		W,x,al_worldz,#10
	s_brl			.ns1
.nfuck
	s_achase_alvar		W,x,al_worldz,svar_word3,4
.ns1


;-------------------------------------------------------------------------



.end	s_add_alvar		W,x,al_worldz,#medpspeed
	s_copy_alvar2var	W,x,viewposx,al_worldx
	s_copy_alvar2var	W,x,viewposy,al_worldy
	s_copy_alvar2var	W,x,viewposz,al_worldz
	s_end_strat




playerdownintro_cont
	s_achase_alvar2alvar		B,x,al_sbyte3,x,al_roty,5
	s_achase_alvar2alvar		B,x,al_sbyte4,x,al_rotx,5
	s_gen_3dvecs	x,al_sbyte3,al_sbyte4,al_speed
	s_add_vecs2pos	x
	s_add_playerZ	x
	s_end_strat


;***********************************************************************************
playerdown2intro_Istrat
	s_start_strat

	s_set_alsflag	x,colldisable
	s_set_alvar	B,x,al_rotx,#deg22
	s_setnoremove_behind	x
	s_set_strat	x,playerdown2intro_strat
	s_copy_alvar2alvar	B,x,al_sbyte3,x,al_roty
	s_copy_alvar2alvar	B,x,al_sbyte4,x,al_rotx

	s_set_alvar		B,x,al_sbyte1,#30      

	s_set_speed	x,#120

	s_set_aldata		x,#8,#hardAP
	s_set_lifecnt		x,#70	
	set_sound2		x,#1

playerdown2intro_strat
	s_start_strat

	s_dec_lifecnt		x

;---------------------------------------------------------------
	s_jmp_ifnotstate	x,0,.nsdown
	s_beqdec_alvar		B,x,al_sbyte1,nextstate
	s_jmp_notdelay		2,.nsdown
	s_add_alvar		B,x,al_rotx,#-1
	s_add_alvar		B,x,al_roty,#1
.nsdown

;---------------------------------------------------------------
	s_jmp_ifnotstate	x,1,.nturn1
	s_achase_alvar		B,x,al_roty,#deg90,4
	s_achase_alvar		B,x,al_rotx,#0,4
	s_achase_alvar		B,x,al_rotz,#deg45,3
.nturn1
;---------------------------------------------------------------

	s_brl			playerdownintro_cont


;***********************************************************************************
playerdown3intro_Istrat
	s_start_strat

	s_set_alsflag	x,colldisable
	s_set_alvar	B,x,al_rotx,#deg22
	s_setnoremove_behind	x
	s_set_strat	x,playerdown3intro_strat
	s_copy_alvar2alvar	B,x,al_sbyte3,x,al_roty
	s_copy_alvar2alvar	B,x,al_sbyte4,x,al_rotx

	s_set_alvar		B,x,al_sbyte1,#30      

	s_set_speed	x,#120
	s_set_aldata		x,#8,#hardAP

	s_set_lifecnt		x,#70	
	set_sound2		x,#1
	
playerdown3intro_strat
	s_start_strat

	s_dec_lifecnt		x

;---------------------------------------------------------------
	s_jmp_ifnotstate	x,0,.nsdown
	s_beqdec_alvar		B,x,al_sbyte1,nextstate
	s_jmp_notdelay		2,.nsdown
	s_add_alvar		B,x,al_rotx,#-1
	s_sub_alvar		B,x,al_roty,#1
.nsdown

;---------------------------------------------------------------
	s_jmp_ifnotstate	x,1,.nturn1
	s_achase_alvar		B,x,al_roty,#-deg90,4
	s_achase_alvar		B,x,al_rotx,#0,4
	s_achase_alvar		B,x,al_rotz,#-deg45,3
.nturn1
;---------------------------------------------------------------

	s_brl			playerdownintro_cont


;**********************************************************************
playerfireintro_Istrat
	s_start_strat
	s_set_strat	x,playerfireintro_strat
	s_setnoremove_behind	x
	s_set_lifecnt	x,#35
playerfireintro_strat
	s_start_strat
	s_dec_lifecnt		x
	s_jmp_notdelay		2,.nfire,al1pt

	s_set_objtobealvar	y,x,al_sword1
	s_weapon_pos		#-50,#0,#0
	s_weapon_rots2obj	y
	s_fire_weapon		x,RELFASTELASER
	s_setnoremove_behind	y
	s_set_lifecnt		y,#60
	s_add_alvar		W,y,al_worldx,#-350

	s_set_objtobealvar	y,x,al_sword1
	s_weapon_pos		#50,#0,#0
	s_weapon_rots2obj	y
	s_fire_weapon		x,RELFASTELASER
	s_setnoremove_behind	y
	s_set_lifecnt		y,#60
	s_add_alvar		W,y,al_worldx,#350

.nfire
	s_add_playerZ		x
	s_end_strat


;***********************************************************************************
boss7intro_Istrat
	s_start_strat
	s_set_alsflag	x,colldisable

	s_set_strat	x,boss7intro_strat
	s_setnoremove_behind	x

	s_set_vecs	x,#0,#5,#15
	s_nodepthcue	x

	s_make_childobj	#deboss_0,#1,boss7intropart_Istrat,enemy1	      
	s_nodepthcue	y
	s_make_childobj	#deboss_2,#2,boss7intropart_Istrat,enemy1	      
	s_nodepthcue	y

boss7intro_strat
	s_start_strat


	s_jmp_varless	W,bg2Yscroll,#160,.slow1
	s_jmp_varless	W,bg2Yscroll,#200,.slow2
	s_jmp_varmore	W,bg2Yscroll,#232,.nsc
.slow3
	s_jmp_notdelay	2,.nsc
	s_add_var	W,bg2Yscroll,#1
	s_brl		.nsc
.slow2	s_jmp_notdelay	1,.nsc
	s_add_var	W,bg2Yscroll,#1
	s_brl		.nsc
.slow1	;s_jmp_notdelay	1,.nsc
	s_add_var	W,bg2Yscroll,#1
.nsc


	s_jmp_higher	x,#space_viewcy-400,.nstop
	s_jmp_notdelay	2,.nstop
	s_beqdec_alvar	W,x,al_vy,.nstop
.nstop
;	s_set_objtobeplayer	y
;	s_jmp_Zdistless		x,y,#2000,.nf
;	s_jmp_notdelay		5,.nf
;	s_make_obj		#zaco_5,.nf
;	s_set_strat		y,zacointro_Istrat
;	s_copy_pos		y,x
;.nf

	s_add_vecs2pos	x
	s_add_playerZ	x
	s_end_strat

boss7intropart_Istrat
	s_start_strat
	s_set_alsflag	x,colldisable
	s_do_childrelpos	x,4
	s_end_strat
;***************************************************************************

zacointro_Istrat
	s_start_strat
	s_set_strat	x,zacointro_strat
	s_set_alsflag	x,colldisable
	s_set_alvar2rnd	x,al_rotx,#15
	s_add_alvar	B,x,al_rotx,#deg90-7
	s_set_alvar2rnd	x,al_roty
	s_set_alvar2rnd	x,al_rotz
	s_set_alvar	B,x,al_sbyte1,#10
	s_set_speed	x,#60
	s_set_lifecnt	x,#60
	set_sound2	x,#3

	s_init_anim	x,#0
zacointro_strat
	s_start_strat

	s_add_anim	x,#1,#12

	s_dec_lifecnt	x
	s_decbne_alvar	B,x,al_sbyte1,.nturn
	s_set_alvar	B,x,al_sbyte1,#1
	s_achase_alvar	B,x,al_roty,#0,3
	s_achase_alvar	B,x,al_rotx,#0,3
	s_achase_alvar	B,x,al_rotz,#0,4
	s_speedto	x,#120,2
	s_brl		.nz
.nturn
	s_add_alvar	B,x,al_rotz,#6
.nz

	s_gen_3dvecs	x,al_roty,al_rotx,al_speed
	s_add_vecs2pos	x
	s_add_playerZ	x
	s_end_strat

;***************************************************************************
zaco2intro_Istrat
	s_start_strat
	s_set_strat	x,zaco2intro_strat
	s_set_alsflag	x,colldisable
	s_set_speed	x,#45
	s_set_alvar	B,x,al_rotx,#deg90
	s_set_alvar	B,x,al_sbyte1,#30
	s_set_alvar	B,x,al_sbyte2,#6	; time until end after near player.
	set_sound2	x,#3
	s_init_anim	x,#0

zaco2intro_strat
	s_start_strat

	s_add_anim	x,#1,#12

;--------------------------------------------------------
	s_jmp_ifnotstate	x,0,.ns0
	s_add_alvar	B,x,al_rotz,#6
	s_decbne_alvar	B,x,al_sbyte1,.ns0
	s_next_state	x
	s_set_alvar	B,x,al_sbyte1,#42
.ns0
;--------------------------------------------------------
	s_jmp_ifnotstate	x,1,.ns1
	s_add_alvar	B,x,al_rotx,#4
	s_add_alvar	B,x,al_roty,#9
	s_add_alvar	B,x,al_rotz,#6
	s_decbne_alvar	B,x,al_sbyte1,.ns1
	s_next_state	x
	s_set_alvar	B,x,al_sbyte1,#20
.ns1

;--------------------------------------------------------
	s_jmp_ifnotstate	x,2,.ns2
	s_add_alvar	B,x,al_rotz,#6
	s_set_objtobeplayer	y

	s_jmp_Zdistless		x,y,#50,.nfire
	s_jmp_Zdistmore		x,y,#1000,.nfire
	s_jmp_notdelay		2,.ns2
	s_weapon_pos		#0,#0,#0
	s_weapon_rndrots2obj	y,7,7
	s_fire_weapon		x,RELFASTELASER
.nfire
	s_set_objtobeplayer	y
	s_jmp_Zdistless		x,y,#500,.ns2
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,2
.ns2


;--------------------------------------------------------

	s_gen_3dvecs	x,al_roty,al_rotx,al_speed
	s_add_vecs2pos	x
	s_add_playerZ	x

	s_set_objtobeplayer	y
	s_jmp_objinfront	x,y,.nexit
	s_decbne_alvar		B,x,al_sbyte2,.nexit
	s_set_var		B,exitintro,#1
.nexit

	s_end_strat




	strats_end

































