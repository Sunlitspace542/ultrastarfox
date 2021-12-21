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
;*   File: PCTRATS.ASM                                                     *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr: PLAYER'S CLEAR SEQ. DEMO STRATEGIES.                            *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   Date: 17/9/92                                                         *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;* Author:								                                   *
;*                                                                         *
;*		Giles Goddard.      				                               *
;*                                                                         *
;***************************************************************************

	shorta
	longi

	strats_start

	incpublics	EXT\pcstrats.ext

;*****************************************************************************
set_playerClearbridge_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerClearbridge_Istrat
	rtl

playerclearbridge_Istrat
	s_start_strat
	s_set_strat		x,playerclearbridge_strat
	s_playerctrl		off

	s_set_var		W,minPmoveY,#-10000
	s_set_var		W,minPWmoveY,#-10000

	s_or_var		B,pstratflags,#pstf_novdistC
	s_or_var		B,pstratflags,#pstf_inseq

	s_set_var		W,psvar_word1,#0
	s_set_var		W,psvar_word2,#0
					     
	s_set_var		B,psvar_byte1,#125+38

playerclearbridge_strat
	s_start_strat
	jsr			centoutrots
	s_beqdec_var		B,psvar_byte1,playerclearbridge2_init
	s_achase_alvar.w	W,x,al_worldy,ViewCY,4
	s_achase_alvar.w	W,x,al_worldx,#0,4
	s_set_var		B,player_tospeed,#maxpspeed

	s_jmp_varmore		W,outdist,#500,.nda
	s_add_var		W,outdist,#4
.nda
	s_jmp			playeronbridge_strat

playerclearbridge2_init

playerclearbridge3_init
	jsr			dupplayer 
	s_set_strat		y,clshipbridgeboost_Istrat
	s_set_strat		x,playerclearbridge3_strat
playerclearbridge3_strat
	s_start_strat
	s_add_alvar		W,x,al_worldx,#3
	s_jmp			playeronbridge_strat


;*****************************************************************************
set_playerEscapeNucleus_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerEscapeNucleus_Istrat
	rtl
	

playerEscapeNucleus_Istrat
	s_start_strat

	s_or_var		B,pstratflags,#pstf_inseq

	s_set_strat		x,playerEscapeNucleus_strat
	s_set_speed		x,#0		  
	s_set_alvar		B,x,al_roty,#0
	s_set_alsflag		x,colldisable  

playerEscapeNucleus_strat
	s_start_strat	
	s_jmp_alvarEQ		B,x,al_roty,#-(deg45-deg22),playerEscapeNucleus2_init
	s_add_alvar		B,x,al_roty,#-1
	s_add_alvar		B,x,al_rotz,#-1
	s_jmp_alvarEQ		B,x,al_rotx,#deg11,.nxinc
	s_inc_alvar		B,x,al_rotx
.nxinc	s_brl			playerEscapeNucleus_cont

playerEscapeNucleus2_init
	s_set_strat		x,playerEscapeNucleus2_start
	s_set_alvar		B,x,al_sbyte3,#15
	s_set_vartobeobj	boostobj,x
	boost_sprite
playerEscapeNucleus2_start
	s_start_strat	

	s_decbne_alvar		B,x,al_sbyte3,playerEscapeNucleus_cont
	s_set_alvar		B,x,al_sbyte3,#1
	s_jmp_alvarEQ		B,x,al_rotx,#-deg11,.nxdec
	s_dec_alvar		B,x,al_rotx
.nxdec
	s_jmp_alvarEQ		B,x,al_rotz,#deg45,.nzinc
	s_add_alvar		B,x,al_rotz,#2
.nzinc
	s_jmp_alvarEQ		B,x,al_roty,#deg180+(deg22+deg11),.boost
	s_add_alvar		B,x,al_roty,#8
	brl			playerEscapeNucleus_cont
.boost

playerEscapeNucleus_cont

      
	s_speedto		x,#30,1

	s_set_var		W,pviewvelz,#medpspeed
	s_add_var		W,pviewposz,pviewvelz
	s_gen_3dvecs		x,al_roty,al_rotx,al_vel

	s_add_alvar		W,x,al_vz,#medpspeed

	s_add_vecs2pos		x
	
	s_end_strat




;*****************************************************************************
set_playerClearDemo_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerClearDemo_Istrat
	rtl

playercleardemo_Istrat
	s_start_strat
	s_set_strat		x,playercleardemo_strat
	s_set_var		B,psvar_byte2,#110
	s_playerctrl		off
	s_and_var		B,gameflags,#~gf_viewrot


	s_set_var		W,minPmoveY,#-10000
	s_set_var		W,minPWmoveY,#-10000

	s_or_var		B,pstratflags,#pstf_novdistC

	s_or_var		B,pstratflags,#pstf_inseq
	s_set_var		B,psvar_byte3,#180

	s_set_var		W,psvar_word1,#0
	s_set_var		W,psvar_word2,#0


playercleardemo_strat
	s_start_strat
	s_beqdec_var		B,psvar_byte2,playercleardemo2_init
	jsr			centoutrots
	s_achase_alvar.w	W,x,al_worldy,#planet_ViewCY,4
	s_achase_alvar.w	W,x,al_worldx,#0,4
	s_set_var		B,player_tospeed,#maxpspeed

	s_jmp_varmore		W,outdist,#300,.nda
	s_add_var		W,outdist,#4
.nda
	s_dec_var		B,psvar_byte3
	s_jmp			playeronplanet_strat

playercleardemo2_init
	s_set_strat		x,playercleardemo2_strat
	s_set_var		B,psvar_byte1,#0
	s_set_var		B,psvar_byte2,#250
	

playercleardemo2_strat
	s_start_strat


	s_jmp_varless		B,outvy+1,#-deg90,.nvyi
	s_sub_var		W,outvy,#32
.nvyi

	s_jmp_varzero		B,psvar_byte2,.nsd
	s_sub_var		B,psvar_byte2,#1
	s_add_vars		B,psvar_byte1,psvar_byte2
	bcc			.nsd

.nsd

	s_jmp_varmore		W,outdist,#600,.nda
	s_add_var		W,outdist,#4
.nda

	s_sub_var		W,plrotx,#2*256


	s_sub_var		W,bg2Yscroll,#1


	jsr			playermove_srou

	s_beqdec_var		B,psvar_byte3,.nb
	s_jmp_varNE		B,psvar_byte3,#1,.nb
	jsr			dupplayer 
	s_set_strat		y,clshipboost_Istrat
	s_and_var		B,pshipflags3,#~psf3_enginesnd
.nb

	jsr		viewmove_srou

	a16
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

	lda	al_worldy,x
	sta	pviewposy
	a8

.nvp

	s_gen_3dvecs		x,al_roty,al_rotx,al_vel
.cont

	s_add_vecs2pos		x
	s_end_strat



;*****************************************************************************
set_playerClearEarth_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerClearEarth2_Istrat
	rtl


playerClearEarth2_Istrat
	s_start_strat
	s_set_strat		x,playerClearEarth2_strat
	s_set_var		B,psvar_byte1,#20
	s_or_var		B,pstratflags,#pstf_inseq
	s_playerctrl		off
playerClearEarth2_strat
	s_start_strat
	jsr			centoutrots
	s_achase_alvar		W,x,al_worldx,#0,3
	s_Achase_alvar		W,x,al_worldy,#Space_ViewCY-40,3
	s_beqdec_var		B,psvar_byte1,playerClearEarth_Istrat
	s_jmp			playerinspace_strat		


playerClearEarth_Istrat
	s_start_strat
	s_set_strat		x,playerClearEarth_strat
	s_set_var		B,psvar_byte1,#40
	s_set_speed		x,#maxpspeed-5
	s_or_var		B,pstratflags,#pstf_inseq
	s_or_var		B,playerflymode,#pfm_wobble
	s_brl			playerClearShip_Icont
playerClearEarth_strat
	s_start_strat

	s_or_var		B,playerflymode,#pfm_wobble

	s_beqdec_var		B,psvar_byte1,.fin
	jsr			centoutrots
	s_Achase_alvar		W,x,al_worldy,#Space_ViewCY-40,4
	s_Achase_alvar		W,x,al_worldx,#0,4
.fin
	s_brl			playerClearShip_strat



;*****************************************************************************
set_playerClearShip_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerClearShip_Istrat
	rtl


playerClearShip_Istrat
	s_start_strat

	s_playerctrl		off

	a16
	lda			pviewposz
	sec
	sbc			#200
	sta			svar_word1
	a8
	s_set_pos		x,#0,#Space_ViewCY-40,svar_word1
	s_or_var		B,pstratflags,#pstf_inseq

	s_set_strat		x,playerClearShip_strat

	s_set_speed		x,#maxpspeed

playerClearShip_Icont


	stz			bg2Xscroll

	s_playerfly_mode	ClearShip

	s_playerctrl		off
	s_and_var		B,gameflags,#~gf_stagedone
	s_or_var		B,pstratflags,#pstf_novdistC

	s_set_alvar		B,x,al_sbyte3,#100	; 156
	s_clr_alsflag		x,sflag4


playerClearShip_strat
	s_start_strat

	a16
	lda	#232
	sta	bg2scroll
	stz	lastrot
	a8

	s_decbne_alvar		B,x,al_sbyte3,.nturn
	s_set_alvar		B,x,al_sbyte3,#1


	lda		bg2Xscroll
	cmp		#254		; 64
	beq		.maxsc
	clc
	adc		#2
	sta		bg2Xscroll
	cmp		#254-32		; 96
	bne		.nb
	s_and_var		B,pshipflags3,#~psf3_enginesnd
	s_set_vartobeobj	boostobj,x
	boost_sprite
	trigse		$32
	s_set_alsflag	x,sflag4
	bra		.maxsc
.nb	bcc		.donesc

.maxsc
	s_add_var	W,plroty,#256/32
	s_sub_var	W,plrotx,#256
	s_or_var	B,gameflags,#gf_stagedone
	s_add_alvar	W,x,al_worldz,#100
	s_add_alvar	W,x,al_worldy,#-10
	s_set_speed	x,#120
.donesc


	s_sub_var		B,player_Ztilt,#deg45/8

	s_jmp_varless		B,outvy+1,#-deg11,.nvyi	; -deg11
	s_sub_var		W,outvy,#32
.nvyi
	s_brl			.nspd

.nturn


	s_jmp_notdelay		2,.nspd
	s_speedto		x,#medpspeed+2,1
.nspd

	s_jmp_varLESS		W,outdist,#50,.min
	s_sub_var		W,outdist,#1
.min


	jsr		playermove_srou

	s_add_var	W,pviewposZ,#medpspeed

	s_gen_3dvecs		x,al_roty,al_rotx,al_vel


	a16
	lda		al_worldz,x
	sec
	sbc		pviewposZ
	cmp		#4000
	bmi		.nrem
	a8
 	s_set_alsflag		x,invisible
	a16
.nrem


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
	a8

	s_Achase_var		W,pviewposY,#Space_ViewCY,4



	s_add_vecs2pos		x

	s_end_strat




;*****************************************************************************
set_playerClearShip2_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerClearShip2_Istrat
	rtl


playerClearShip2_Istrat
	s_start_strat
	s_playerctrl		off
	s_or_var		B,pstratflags,#pstf_inseq
	s_set_strat		x,playerClearShip2_strat

	s_set_var		B,viewtype,#viewtype_fpos!viewtype_toobj

	s_or_var		B,gameflags,#gf_noZremove
	s_set_var		B,psvar_byte1,#60+35

	s_copy_alvar2var	W,x,psvar_word1,al_shape


	s_set_alvar		B,x,al_rotx,#0
	s_set_alvar		B,x,al_roty,#0
	s_set_alvar		B,x,al_rotz,#0
	s_set_alvar		W,x,al_worldx,#0
	s_set_alvar		W,x,al_worldy,#space_viewcy
	s_copy_alvar2var	W,x,viewposz,al_worldz
	s_add_var		W,viewposz,#1832
	s_add_var		W,viewposx,#-20

	s_playerfly_mode	ClearShip

playerClearShip2_strat
	s_start_strat


	s_jmp_ifnotstate	x,0,.nblack
	s_decbne_var		B,psvar_byte1,.nblack

	a8
	lda	pshipflags
	a16
	and	#psf_brkLwing!psf_brkRwing
	beq	.nps

	bit	#psf_brkLwing
	beq	.notlb	
	bit	#psf_brkRwing
	bne	.bps
	lda.l	pblackshapes+2
	sta	al_shape,x
	bra	.gps
.notlb
	lda.l	pblackshapes+4
	sta	al_shape,x
	bra	.gps
.bps
	lda.l	pblackshapes+6
	sta	al_shape,x
	bra	.gps
.nps
	lda.l	pblackshapes
	sta	al_shape,x
.gps
	a8

	s_set_var		B,psvar_byte1,#15
	s_next_state		x
.nblack

	s_jmp_ifnotstate	x,1,.nnorm
	s_decbne_var		B,psvar_byte1,.nnorm
	s_set_alvar		W,x,al_shape,psvar_word1
	s_set_var		B,bg2Xscroll,#254
	s_next_state		x
	s_set_var		B,psvar_byte1,#200
.nnorm

	s_jmp_ifnotstate	x,2,.nfast
	s_add_var		W,viewposz,#10
	s_decbne_var		B,psvar_byte1,.nfast
	s_set_alsflag		x,sflag4
	s_set_var		B,viewtype,#viewtype_fpos
	s_and_var		B,pshipflags3,#~psf3_enginesnd
	s_set_vartobeobj	boostobj,x
	boost_sprite
	s_and_var		B,pshipflags3,#~psf3_enginesnd
	trigse		$32
	s_next_state		x
	s_set_var		B,psvar_byte1,#45+40
.nfast

	s_jmp_ifnotstate	x,3,.nboost
	s_add_var		W,viewposz,#10
	s_Add_alvar		W,x,al_worldz,#100
	s_decbne_var		B,psvar_byte1,.nboost
	s_or_var		B,gameflags,#gf_stagedone
.nboost



	
	s_add_alvar		W,x,al_worldz,#medpspeed
	
	s_add_var		W,viewposz,#medpspeed-15
	s_jmp_varLESS		W,viewposy,#-200,.max
	s_sub_var		W,viewposy,#1
.max

	s_end_strat
	





;*****************************************************************************
set_playerClearTurn_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerClearTurn_Istrat
	rtl
playerClearTurn_Istrat
	s_start_strat	
	s_set_var		W,psvar_word1,#100+140+10+20	; 240+56
           	s_set_strat		x,playerClearTurn_strat
	s_playerctrl		off

	s_or_var		B,pstratflags,#pstf_novdistC
	s_or_var		B,pstratflags,#pstf_inseq
	s_and_var		B,gameflags,#~gf_viewrot
	s_or_var		B,playerflymode,#pfm_wobble


playerClearTurn_strat
	s_start_strat
	jsr			centoutrots
	s_beqdec_var		W,psvar_word1,playerClearTurn2_init
	s_jmp_varLESS		W,outdist,#100,.min
	s_sub_var		W,outdist,#1
.min
	s_achase_alvar.w	W,x,al_worldy,#Space_ViewCY+20,4
	s_achase_alvar.w	W,x,al_worldx,#0,4
	s_jmp			playerinspace_strat

playerClearTurn2_init
	s_jsr			dupplayer
	s_set_strat		y,clshipTurn_Istrat
	s_set_alvar		B,y,al_sbyte1,#(deg180+deg45+deg22+deg11)/4
	s_clr_alsflag		y,sflag2
	s_set_strat		x,playerClearTurn2_strat
	s_set_var		W,outvy,#0
playerClearTurn2_strat
	s_start_strat		
	s_jmp			playerinspace_strat





;*****************************************************************************
set_playerDIVE_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerDIVE_Istrat
	rtl
playerDIVE_Istrat
	s_start_strat	
	s_set_var		W,psvar_word2,#0
           	s_set_strat		x,playerDIVE_strat
	s_playerctrl		off

	s_or_var		B,pstratflags,#pstf_novdistC
	s_set_var		W,psvar_word1,#210+56+20

	lda	playerflymode
	ora	#pfm_wobble
	sta	playerflymode


playerDIVE_strat
	s_start_strat
	jsr			centoutrots
	s_beqdec_var		W,psvar_word1,playerDIVE2_init

	s_jmp_varMORE		W,psvar_word1,#60,.nsc
	s_jmp_varLESS		W,psvar_word1,#30,.nsc
	s_add_var		W,bg2Yscroll,#1
.nsc


pdivecont
	s_achase_alvar.w	W,x,al_worldy,#Space_ViewCY+20,4
	s_achase_alvar.w	W,x,al_worldx,#0,4
	s_jmp			playerinspace_strat

playerDIVE2_init
	s_set_strat		x,playerDIVE2_strat
	jsr			dupplayer
	s_set_strat		y,clshipDIVEboost_Istrat
	s_and_var		B,pshipflags3,#~psf3_enginesnd
playerDIVE2_strat
	s_start_strat
	s_jmp			playerinspace_strat






;*****************************************************************************
set_playerClearCHASE_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerClearCHASE_Istrat
	rtl

playerclearCHASE_Istrat
	s_start_strat
	s_set_strat		x,playerclearCHASE_strat
	s_playerctrl		off

	s_and_var		B,gameflags,#~gf_viewrot

	s_set_var		W,minPmoveY,#-10000
	s_set_var		W,minPWmoveY,#-10000

	s_or_var		B,pstratflags,#pstf_novdistC
	s_or_var		B,pstratflags,#pstf_inseq

	s_set_var		W,psvar_word1,#246+54
	s_set_var		W,psvar_word2,#0
	s_set_var		W,psvar_word3,#218  	; outvy add
	s_set_var		W,psvar_word4,#5	; Y scroll add
					     
	s_set_var		B,player_tospeed,#maxpspeed

	s_or_var		B,gameflags,#gf_noZremove


	s_set_var		W,outvx,#0
	s_set_var		W,outvy,#0

playerclearCHASE_strat
	s_start_strat

	s_achase_alvar.w	W,x,al_worldy,ViewCY,3
	s_achase_alvar.w	W,x,al_worldx,#0,3

	s_jmp_varmore		W,outdist,#500,.nda
	s_add_var		W,outdist,#4
.nda

	s_jmp_varMORE		W,psvar_word1,#220,.nx1
	s_jmp_varLESS		W,psvar_word1,#120,.nx1
	s_sub_var		W,outvx,#64
	s_brl			.donex
.nx1
	s_jmp_varMORE		W,psvar_word1,#120,.nx2
	s_jmp_varLESS		W,psvar_word1,#20,.nx2
	s_add_var		W,outvx,#64
.nx2


.donex
	s_jmp_varMORE		W,psvar_word1,#9,.nslowoy
	s_sub_var		W,psvar_word3,#21
.nslowoy

	s_jmp_varMORE		W,psvar_word1,#4,.nslowsy
	s_dec_var		W,psvar_word4
.nslowsy

	s_add_var		W,outvy,psvar_word3

	s_jmp_varMORE		W,psvar_word1,#56,.nsc
	s_add_var	W,bg2Yscroll,psvar_word4
.nsc
	s_beqdec_var	W,psvar_word1,playerCHASE2_init
	s_jmp			playerinSPACE_strat

playerCHASE2_init
	jsr			dupplayer
	s_set_strat		y,clshipboost_Istrat
	s_set_strat		x,playerCHASE2_strat
	s_and_var		B,pshipflags3,#~psf3_enginesnd
playerCHASE2_strat
	s_start_strat
	s_jmp			playerinSPACE_strat


;*****************************************************************************
set_playerClearUNDER_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerClearUNDER_Istrat
	rtl

playerclearUNDER_Istrat
	s_start_strat
	s_set_strat		x,playerclearUNDER_strat
	s_playerctrl		off

	s_and_var		B,gameflags,#~gf_viewrot

	s_set_var		W,minPmoveY,#-10000
	s_set_var		W,minPWmoveY,#-10000

	s_or_var		B,pstratflags,#pstf_novdistC
	s_or_var		B,pstratflags,#pstf_inseq

	s_set_var		W,psvar_word1,#140+54
	s_set_var		W,psvar_word2,#0
					     
	s_set_var		B,player_tospeed,#maxpspeed

playerclearUNDER_strat
	s_start_strat

	s_achase_alvar.w	W,x,al_worldy,#undergnd_ViewCY-20,3
	s_achase_alvar.w	W,x,al_worldx,#0,3

	s_jmp_varmore		W,outdist,#500,.nda
	s_add_var		W,outdist,#4
.nda

	s_add_var		W,outvy,#169

	s_beqdec_var		W,psvar_word1,playerUNDER2_init

	s_jmp			playerundergnd_strat


playerUNDER2_init
	s_and_var		B,pshipflags3,#~psf3_enginesnd
	jsr			dupplayer
	s_set_strat		y,clshipUNDERboost_Istrat
	s_set_strat		x,playerUNDER2_strat
	s_set_alsflag		y,sflag2
playerUNDER2_strat
	s_start_strat
	s_jmp			playerundergnd_strat


;*****************************************************************************
set_playerWarp_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerwarp_Istrat
	rtl
playerwarp_Istrat
	s_start_strat	
           	s_set_strat		x,playerwarp_strat
	s_playerctrl		off

	s_or_var		B,pstratflags,#pstf_novdistC
	s_or_var		B,pstratflags,#pstf_inseq

	s_set_var		W,psvar_word2,#0

	s_or_var		B,gameflags,#gf_noZremove
	s_AND_var		B,gameflags,#~gf_viewrot

	s_set_var		W,psvar_word1,#200

	lda	playerflymode
	ora	#pfm_wobble
	sta	playerflymode

	s_or_var		B,pshipflags3,#psf3_nocollisions

playerwarp_strat
	s_start_strat


    
;-----------------------------------------------------------
	s_jmp_ifnotstate	x,0,.ns0
	s_jmp_notdelay		2,.nv
	s_sub_var		W,outdist,#1
.nv	s_achase_alvar.w	W,x,al_worldy,#Space_ViewCY+20,4
	s_achase_alvar.w	W,x,al_worldx,#0,4
	jsr			centoutrots
	s_decbne_var		W,psvar_word1,.ns0
	s_next_state		x
	s_set_var		W,psvar_word1,#256-30
	lda	playerflymode
	and	#~pfm_wobble
	sta	playerflymode
.ns0

;-----------------------------------------------------------
	s_jmp_ifnotstate	x,1,.nsturn

	s_jmp_varNE		W,psvar_word1,#20,.nbgmout
	startbgm		bgm_fadeout
.nbgmout

	s_jmp_varMORE		W,outdist,#500,.max
	s_add_var		W,outdist,#5
.max
	s_add_var		W,outvy,#256
	s_achase_alvar.w	W,x,al_worldy,#Space_ViewCY+20,4
	s_achase_alvar.w	W,x,al_worldx,#0,4
	s_decbne_var		W,psvar_word1,.nsturn
	s_next_state		x
	s_make_obj		#nullshape,.bad
	s_set_strat		y,hyperspace_Istrat
.bad	s_set_var		W,psvar_word1,#60
	startbgm		8
.nsturn


;-----------------------------------------------------------
	s_jmp_ifnotstate	x,2,.nssboost
	s_achase_var		W,outvy,#0,4
	s_AND_var		B,gameflags,#~gf_noZremove
	s_sub_var		W,outdist,#9	; 8	
	s_achase_alvar.w	W,x,al_worldy,#Space_ViewCY+80,3
	s_beqdec_var		W,psvar_word1,playerwarp1_init
	s_brl			playerwarp
	
.nssboost

	s_jmp			playerinspace_strat

;--------------------------------------------------------
playerwarp1_init
	startbgm 		$e

	jsr			dupplayer
	s_set_alvar		B,y,al_sbyte2,#19
	s_set_strat		y,clshipboostnosnd_Istrat


	s_set_strat		x,playerwarp1_strat

	s_set_var		B,psvar_byte1,#20

	s_AND_var		B,pshipflags3,#~psf3_enginesnd

playerwarp1_strat
	s_start_strat

	s_add_var		W,psvar_word2,#2

	s_decbne_var		B,psvar_byte1,playerwarp
	s_set_var		B,psvar_byte1,#1
	s_or_var		B,pstratflags,#pstf_flag1
	stz			dotsflag
	stz			dotsflag+1
	lda			#0
	sta.l			m_clrbitmaps
	s_jmp			playerwarpnoadd
playerwarp

	s_jmp_varMORE		W,psvar_word2,#400,playerwarpnoadd
	s_add_var		W,psvar_word2,#1
playerwarpnoadd


	s_add_var		W,pviewposz,psvar_word2
	s_add_alvar		W,x,al_worldz,psvar_word2
	s_jmp			playerinspace_strat


;--------------------------------------------------------

playerwarp2_init
	s_set_strat		x,playerwarp2_strat
playerwarp2_strat
	s_start_strat
	s_jmp			playerinspace_strat



;*****************************************************************************
set_playerOutOfLB1_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerOutOfLB1_Istrat
	rtl

playerOutofLB1_Istrat
	s_playerctrl	off
	s_set_strat	x,playerOutofLB1_strat
	s_AND_var	B,playerflymode,#~pfm_wobble
	s_OR_var	B,pstratflags,#pstf_inseq
	s_AND_var	B,gameflags,#~gf_stratdone1
	s_playerfly_mode	Ltunnel
	trigse	$1e
playerOutofLB1_strat
	s_start_strat
	s_achase_alvar	W,x,al_worldx,#0,4
	s_achase_alvar	W,x,al_worldy,viewcy,4
	s_jsr		shrapnel_srou
	s_jmp		playerintunnel_strat


;*****************************************************************************
set_playerOutOfLB2a_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerOutOfLB2a_Istrat
	rtl

playerOutofLB2a_Istrat
	s_set_strat		x,playeroutofLB2a_strat
	
	s_set_vartobeobj	boostobj,x
	s_set_speed		x,#maxpspeed
	s_set_var		B,player_tospeed,#maxpspeed
	boost_sprite
	trigse			$32

playerOutofLB2a_strat
	s_start_strat
	s_sub_var	B,player_Zstratadd,#4
	s_jmp			playerintunnel_strat

;*****************************************************************************
set_playerOutOfLB2_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerOutOfLB2_Istrat
	s_set_var		W,outvx,#-deg90*256
	rtl

playerOutofLB2_Istrat
	s_playerctrl	off
	s_set_strat	x,playerOutofLB2_strat
	s_AND_var	B,playerflymode,#~pfm_wobble
	s_OR_var	B,pstratflags,#pstf_inseq
	s_playerfly_mode	planet
	s_or_var		B,gameflags,#gf_noZremove
	s_set_alsflag		x,invisible
	s_set_var		W,outvx,#-deg90*256
	s_set_var		W,bg2Yscroll,#232-32
	s_AND_var	B,gameflags,#~gf_stratdone1
playerOutofLB2_strat
	s_start_strat
	s_add_alvar		W,x,al_worldz,#medpspeed
	s_end_strat


;----------------------------------------------------------------------------
shrapnel_srou_l
	jsr	shrapnel_srou
	rtl
shrapnel_srou
	s_jmp_notdelay	3,.nshrap
	s_make_obj	#shrap1,.nshrap
	s_set_strat	y,shrapfall2_Istrat
	s_set_alvar2rnd	y,al_worldx
	s_sub_alvar	W,y,al_worldx,#128
	s_set_alvar2rnd	y,al_worldy
	s_sub_alvar	W,y,al_worldy,#128
	s_add_alvar	W,y,al_worldy,viewcy
	s_set_alvar2rnd	y,al_roty
	s_set_alvar2rnd	y,al_rotx
	s_copy_alvar2alvar	W,y,al_worldz,x,al_worldz
	s_add_alvar	W,y,al_worldz,#2000
.nshrap

	s_jmp_notdelay	1,.nexp
	jsl			makeLexpobj_srou
	s_setnoremove_behind		y
	s_set_alsflag		y,nopolyexp
	s_clr_alsflag		y,noexpsnd      
	s_set_alvar		W,y,al_vz,#150
	s_add_alvar		W,y,al_worldz,#-200
	s_jsl			addrnd2posy_srou

	jsl			makeMEDexpobj_srou
	s_setnoremove_behind		y
	s_set_alsflag		y,nopolyexp
	s_clr_alsflag		y,noexpsnd      
	s_set_alvar		W,y,al_vz,#150
	s_add_alvar		W,y,al_worldz,#-200
	s_jsl			addrnd2posy_srou
.nexp


	rts

shrapfall2_Istrat
	s_start_strat
	s_add_alvar		W,x,al_worldz,#-30
	s_end_strat


;----------------------------------------------------------------------------


;*****************************************************************************
set_playerOutOfLB3_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerOutOfLB3_Istrat
	rtl

playerOutofLB3_Istrat
	s_playerctrl	off
	s_set_strat	x,playerOutofLB3_strat
	s_playerfly_mode	space
	s_OR_var	B,pstratflags,#pstf_inseq
	s_AND_var	B,playerflymode,#~pfm_wobble
	s_or_var		B,gameflags,#gf_noZremove
	s_set_alsflag		x,invisible
	s_AND_var	B,gameflags,#~gf_stratdone1

	s_set_var	W,bg2Yscroll,#232+60

playerOutofLB3_strat
	s_start_strat

	s_jmp_varEQ	W,bg2Yscroll,#232-60,.stopsc
	s_dec_var	W,bg2Yscroll
.stopsc
	

	s_add_alvar		W,x,al_worldz,#medpspeed
	s_end_strat


;*****************************************************************************
set_playerclearcolony_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerclearcolony_Istrat
	rtl

playerclearcolony_Istrat
	s_playerctrl	off
	s_set_strat		x,playerclearcolony_strat
	jsr			dupplayer
	s_set_strat		y,pshipcolony_Istrat
playerclearcolony_strat
	s_start_strat
	s_add_alvar		W,x,al_worldz,#medpspeed
	s_end_strat	


;*****************************************************************************
set_playerwashent_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerwashent_Istrat
	rtl

playerwashent_Istrat
	s_playerctrl	off
	s_set_strat		x,playerwashent_strat
	jsr			dupplayer
	s_set_strat		y,pshipwashent_Istrat
playerwashent_strat
	s_start_strat
	s_add_alvar		W,x,al_worldz,#medpspeed
	s_end_strat	





;*****************************************************************************
set_playertoCslow_l
	a8i16
	s_set_objtobeplayer	x
	s_push_stratptr		x
	s_set_strat		x,playertoCslow_Istrat
	s_playerctrl		off
	rtl

playertoCslow_Istrat
	s_start_strat
	s_set_var	W,viewdist,#outviewdist
	s_jsl		playertomiddle4_srou_l
	s_jmpto_tempstrat		

;-----------------------------------------------------------------------------
playertomiddle1_srou_l
	s_set_objtobeplayer	y
	s_achase_alvar.w	W,y,al_worldy,ViewCY,1
	s_achase_alvar.w	W,y,al_worldx,#0,1
	s_rtl
;-----------------------------------------------------------------------------
playertomiddle4_srou_l
	s_set_objtobeplayer	y
	s_achase_alvar.w	W,y,al_worldy,ViewCY,4
	s_achase_alvar.w	W,y,al_worldx,#0,4
	s_rtl


centoutrots
	s_achase_var		W,outvx,#0,3
	s_achase_var		W,outvy,#0,3
	rts

	strats_end





