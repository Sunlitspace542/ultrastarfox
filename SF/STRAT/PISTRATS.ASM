;***************************************************************************
;*                                                                         *
;*                               Star Fox                                  *
;*                              -----------                                *
;*                                                                         *
;*                           SuperNES version.                             *
;*                                                                         *
;*                                                                         *
;*                           Argonaut Software.                            *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   File: PISTRATS.ASM                                                    *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr: PLAYER'S INTRO SEQ. DEMO STRATEGIES.                            *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   Date: 17/9/92                                                         *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;* Author:                                                                 *
;*                                                                         *
;*		Giles Goddard.                                                     *
;*                                                                         *
;***************************************************************************

	shorta
	longi

	strats_start

	incpublics	EXT\pistrats.ext

	IFNE	RUMBLE
partyboostrumbletab2
	db	$11,$11,$22,$22,$33,$33,$44,$44,$44,$44,$44,$44,$44,$44,$44,$44,$44,$44,$44,$44,$44,rmblend
	ENDC
;*****************************************************************************
playeropening_Istrat
	s_start_strat
	s_playerctrl		off
	s_playerfly_mode	Ltunnel
	s_set_alptrs		x,playerpening_strat,0,0

	stz		gameframe
	
	lda	#2
	sta	fadedir

	s_set_var	W,outvx,#-deg11*256
	s_or_var		B,gameflags,#gf_nozremove

	s_set_var		B,viewtype,#viewtype_toobj!viewtype_Fpos

	s_make_obj		#nullshape,.bad
	s_set_strat		y,viewopening_Istrat
	s_copy_pos		y,x
.bad
	s_AND_var		B,gameflags,#~gf_stratdone2

	s_set_var		B,psvar_byte3,#70
	s_set_alvar		W,x,al_shape,#Imyship_4

	s_set_var		B,psvar_byte1,#0
	s_set_var		B,psvar_byte2,#0

playerpening_strat
	s_start_strat


	s_inc_var		B,psvar_byte1
	s_jmp_varNE		B,psvar_byte1,#pZrotfloattab_len,.pfzptrok
	s_set_var		B,psvar_byte1,#0
.pfzptrok	s_set_alvar2vartab	B,B,B,x,al_rotz,psvar_byte1,pZrotfloattab

	s_add_var		B,psvar_byte2,#2
	s_jmp_varNE		B,psvar_byte2,#viewfloattab_len,.nmaxy
	s_set_var		B,psvar_byte2,#0
.nmaxy	s_set_alvar2vartab	B,B,W,x,al_worldy,psvar_byte2,viewfloattab,1

	s_add_alvar		W,x,al_worldy,#-30


	s_jmpNOT_varAND		B,gameflags,#gf_stratdone2,.nboost
	s_beqdec_var		B,psvar_byte3,playeropeningboost_init
.nboost

	s_add_Alvar		W,x,al_worldz,#medpspeed
	jsl		makeBG2black_l
	s_end_strat

playeropeningboost_init
	s_set_strat		x,playeropeningboost_strat
	s_set_vartobeobj	boostobj,x
	IFNE	RUMBLE
	s_queue_rumble_table	partyboostrumbletab2
	ENDC
	boost_sprite
	trigse			$32
	s_and_var		B,pshipflags3,#~psf3_enginesnd
playeropeningboost_strat
	s_start_strat
	s_achase_alvar		B,x,al_rotz,#0,3
	s_add_Alvar		W,x,al_worldz,#medpspeed+50
	s_end_strat


;*****************************************************************************
playerspaceflyin_Istrat
	s_start_strat
	s_playerctrl		off
	s_playerfly_mode	space
	s_set_alptrs		x,playerspaceflyin_strat,0,0
	s_set_pos		x,#0,#-400,#0
	s_or_var		B,pstratflags,#pstf_novdistC

	s_set_var		W,pviewvelz,#medpspeed
	s_set_var		W,player_tospeed,#medpspeed
	s_set_var		B,player_medspeed,#medpspeed
	s_set_speed		x,#medpspeed

playerspaceflyin_strat
	s_start_strat
	s_add_var		W,outdist,#3
	s_achase_alvar		W,x,al_worldy,viewcy,3,.fin
	s_jmp			playerinspace_strat
.fin
	s_and_var		B,pstratflags,#~pstf_novdistC
	s_jmp			playerinspace_Istrat

;*****************************************************************************
playerinsidespaceflyin_Istrat
	s_start_strat
	s_playerctrl		off
	s_playerfly_mode	space
	s_set_alptrs		x,playerinsidespaceflyin_strat,playercoll_Istrat,playerdead_Istrat
	s_set_pos		x,#0,#-400,#0
	s_or_var		B,pstratflags,#pstf_novdistC

	s_copy_alvar2var	W,x,pviewposz,al_worldz
	s_set_var		W,outdist,#inviewdist
	s_set_var		W,viewdist,#inviewdist
	s_set_var		W,pviewvelz,#medpspeed
	s_set_var		W,player_tospeed,#medpspeed
	s_set_var		B,player_medspeed,#medpspeed
	s_set_speed		x,#medpspeed

playerinsidespaceflyin_strat
	s_start_strat
	s_add_var		W,outdist,#3
	s_achase_alvar		W,x,al_worldy,viewcy,3,.fin
	s_jmp			playerinspace_strat
.fin
	s_and_var		B,pstratflags,#~pstf_novdistC
	s_set_var		B,splayerflymode,#spfm_toinside
	jsl			changeviewmode_l
	s_jmp			playerinspace_strat


;*****************************************************************************
playerplanetflyin_Istrat
	s_start_strat
	s_playerctrl		off
	s_playerfly_mode	planet
	s_set_alptrs		x,playerplanetflyin_strat,0,0
	s_set_pos		x,#0,#-400,#0
	s_or_var		B,pstratflags,#pstf_novdistC

	s_set_var		W,pviewvelz,#medpspeed
	s_set_var		W,player_tospeed,#medpspeed
	s_set_var		B,player_medspeed,#medpspeed
	s_set_speed		x,#medpspeed

playerplanetflyin_strat
	s_start_strat
	s_add_var		W,outdist,#3
	s_achase_alvar		W,x,al_worldy,viewcy,3,.fin
	s_jmp			playeronplanet_strat
.fin
	s_and_var		B,pstratflags,#~pstf_novdistC
	s_jmp			playeronplanet_Istrat

;*****************************************************************************
playerLtunnelflyin_Istrat
	s_start_strat
	s_playerctrl		off
	s_playerfly_mode	Ltunnel
	s_set_alptrs		x,playerLtunnelflyin_strat,0,0
	s_set_alvar		W,x,al_worldy,#-120
	s_set_speed		x,#maxpspeed
playerLtunnelflyin_strat
	s_start_strat
	s_achase_alvar		W,x,al_worldy,viewcy,3,playerinLtunnel_Istrat
	s_jmp			playerintunnel_strat


;*****************************************************************************
;playerFieldflyin_Istrat
;	s_start_strat
;	s_playerctrl		off
;	s_playerfly_mode	Field
;	s_set_alptrs		x,playerFieldflyin_strat,0,0
;	s_set_alvar		W,x,al_worldy,#-200
;	s_set_speed		x,#maxpspeed
;playerFieldflyin_strat
;	s_start_strat
;	s_achase_alvar		W,x,al_worldy,viewcy,4,playeronField_Istrat
;	s_jmp			playeronfield_strat


;*****************************************************************************
playerColonyflyin_Istrat
	s_start_strat
	s_playerctrl		off
	s_playerfly_mode	Colony
	s_set_alptrs		x,playerColonyflyin_strat,0,0
	s_set_alvar		W,x,al_worldy,#-120
	s_set_speed		x,#maxpspeed
playerColonyflyin_strat
	s_start_strat
	s_achase_alvar		W,x,al_worldy,viewcy,4,playerinColony_Istrat
	s_jmp			playerincolony_strat

;*****************************************************************************
set_playerTunneltoOnPlanet_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerTunneltoOnPlanet_Istrat
	rtl

playerTunneltoOnPlanet_Istrat
	s_start_strat
	s_playerctrl	on
	s_playerfly_mode	planet
	s_set_var		W,viewCY,#LTexit_viewCY	
	s_set_alptrs		x,playerTunneltoonplanet_strat,playercoll_Istrat,playerdead_Istrat
	

playerTunneltoOnPlanet_strat
	s_start_strat
	s_achase_var	W,viewCY,#planet_viewCY,4,playeronplanet_Istrat
	s_jmp		playeronplanet_strat



	ifeq	1
;*****************************************************************************
set_playerTakeOff_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerTakeOff_Istrat
	rtl

playertakeoff_Istrat
	s_start_strat


	s_playerctrl	off

	s_playerfly_mode	ltunnel
	s_set_speed	x,#0
	s_set_alptrs	x,playertakeoff_strat,0,0
	s_set_var	B,psvar_byte1,#50
	
	s_set_var	W,outdist,#outviewdist+200	
	
	s_set_pos	x,#0,#0,#0
	s_set_var	W,pviewposz,#0
   
	s_jsl		playerintunnel_strat

	s_set_alvar	W,x,al_worldy,#50

	s_set_var	B,scramble,#50

	stz		gameframe

	s_AND_var	B,gameflags2,#~gf2_stratflag1
	s_AND_var	B,playerflymode,#~pfm_wobble


	s_end_strat


playertakeoff_strat
	s_start_strat				 

 	stz	inatunnel

	s_jmp_varne		B,psvar_byte1,#50-1,.nfade
	lda	#2
	sta	fadedir
.nfade

	s_beqdec_var		B,psvar_byte1,playertakeoffl_init
	s_end_strat

playertakeoffl_init
	s_set_strat		x,playertakeoffl_strat
	s_set_var		B,psvar_byte1,#32+6+1
playertakeoffl_strat
	s_start_strat

 	stz	inatunnel

	s_beqdec_var		B,psvar_byte1,playertakeoffs_init
	s_jmp_varLESS		B,psvar_byte1,#16+6+1,.nup
	s_add_alvar		W,x,al_worldy,#-5
	s_brl			.end
.nup	

	s_set_var2vartab	B,W,W,svar_word1,psvar_byte2,startiYtab
	s_add_alvar		W,x,al_worldy,svar_word1
	s_add_var		B,psvar_byte2,#2
	s_jmp_varNE		B,psvar_byte2,#32,.nmax
	s_set_var		B,psvar_byte2,#0
.nmax
.end
	s_end_strat



	

playertakeoffs_init

	lda	#1
	sta	inatunnel

	lda	#50
	sta	stagecnt

	s_set_var		B,pmovelimit,#0
	s_or_var		B,pshipflags2,#psf2_forceboost
	s_set_strat		x,playerintunnel_strat
	s_push_stratptr	x
	s_set_strat		x,playertoCslow_Istrat
	s_jmpto_strat	


	s_set_strat		x,playertakeoffs_strat
playertakeoffs_strat
	s_start_strat

	s_jmp_notdelay		2,.nsi 
	s_speedto		x,#50,1
	s_gen_Zvec		x,al_vel
.nsi
	s_add_vecs2pos		x
	s_copy_alvar2var	W,x,pviewposz,al_worldz
	s_sub_var		W,pviewposz,#50
	s_end_strat

	endc



;*****************************************************************************
set_playerWarpOut_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerWarpOut_Istrat
	rtl
playerWarpOut_Istrat
	s_start_strat	


	s_or_var		B,pstratflags,#pstf_inseq

	s_playerctrl		off
	s_or_var		B,pstratflags,#pstf_novdistC

	s_make_obj		#nullshape,.badobj
	s_set_strat		y,hyperspaceout_Istrat
	IFNE	RUMBLE
	s_queue_rumble_table	hyperspacerumbletab
	ENDC
.badobj
	s_set_speed		x,#120
	s_set_var		B,player_tospeed,#120

	s_set_var		B,psvar_byte1,#64
	s_set_var		W,psvar_word2,#128

	s_set_var		W,outdist,#400
	s_playerfly_mode	space
	
	s_set_alptrs		x,playerWarpOut_strat,playercoll_Istrat,playerdead_Istrat
	
	s_OR_var		B,pstratflags,#pstf_flag1

playerWarpOut_strat
	s_start_strat

	jsl		fadewhite2norm_l

	s_sub_var		W,outdist,#5

	s_dec_var		B,psvar_byte1
;	s_jmp_varLESS		B,psvar_byte1,#15,.warpoutend
	s_jmp_varZERO	B,psvar_byte1,.warpoutend

	s_add_alvar		W,x,al_worldz,psvar_word2
	s_add_var		W,pviewposz,psvar_word2

	s_sub_var		W,psvar_word2,#2

	s_jmp			playerinspace_strat

.warpoutend
	s_and_var		B,pstratflags,#~pstf_novdistC
	s_set_var		W,viewdist,#outviewdist
	s_set_var		B,player_tospeed,#medpspeed
	s_set_strat		x,playerinspace_strat
	lda		#spfmo_abc
	sta		splayerflymodeopt

	a8
	lda		#spfm_toinside
	sta		splayerflymode
	phx
	jsl		changeviewmode_l
	plx

	startbgm		4
	IFNE	RUMBLE
	s_end_rumble_table
	ENDC
	s_jmp			playerinspace_strat

;*****************************************************************************
hyperspaceout_Istrat
	s_start_strat
	s_set_strat		x,hyperspaceout_strat
	s_set_alvar		W,x,al_sword1,#hyper&WM
	s_set_alvar		B,x,al_sbyte1,#64
hyperspaceout_strat
	s_start_strat

	s_beqdec_alvar		B,x,al_sbyte1,remove_Istrat
	
	s_copy_alvar2var	B,x,svar_byte1,al_sbyte1
	s_scale_var		B,svar_byte1,-4
	s_scale_var		B,svar_byte1,1
	s_set_alvar2vartab	B,W,W,x,al_sword1,svar_byte1,hypers_tab


.end
	s_brl			hyperspace_strat
	
hypers_tab
	dw			hyper4
	dw			hyper3
	dw			hyper2
	dw			hyper



hyperspace_Istrat
	s_start_strat
	s_set_strat		x,hyperspace_strat
	s_set_alvar		W,x,al_sword1,#hyper&WM
hyperspace_strat
	s_start_strat

	s_set_alvar		B,x,al_roty,#deg180
	s_set_objtobeplayer	y
	s_copy_alvar2alvar	W,x,al_worldz,y,al_worldz
	s_add_alvar		W,x,al_worldz,#4000
	
	s_jmp_varAND		B,pstratflags,#pstf_flag1,.ndel
	s_jmp_notdelay		1,.nfire

.ndel
	s_copy_alvar2var	W,x,svar_word1,al_sword1
	s_make_obj		svar_word1,.badobj

	s_set_alsflag		y,colldisable
	s_set_strat		y,hyper_Istrat
	s_copy_pos		y,x

	exg_xy
	s_set_alvar2rnd		x,al_worldx
	s_set_alvar2rnd		x,al_worldx+1,#1
	s_sub_alvar		W,x,al_worldx,#256

	s_set_alvar2rnd		x,al_worldy
	s_set_alvar2rnd		x,al_worldy+1,#1
	s_sub_alvar		W,x,al_worldy,#256
	s_set_alvar2rnd		x,al_rotz

	s_add_roffs2pos		B,x,x,x,#0,#50,#0,0,0,1,0,0,0
	
	s_add_alvar		W,x,al_worldy,#Space_ViewCY

	exg_xy

	s_copy_alvar2alvar	W,y,al_worldz,x,al_worldz


.badobj

.nfire

	s_end_strat


hyper_istrat
	s_start_strat
	s_add_alvar		W,x,al_worldz,#-80		; -20
	s_end_strat


straight_istrat
	s_set_strat		x,straight_strat
	s_gen_3dvecs		x,al_roty,al_rotx,al_vel,2
straight_strat
	s_start_strat
	s_add_vecs2pos		x
	s_add_playerZ		x
	s_end_strat




;*****************************************************************************
set_playerDIVEGND_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerDIVEGND_Istrat
	rtl
playerDIVEGND_Istrat
	s_start_strat

	s_jmp_varMORE	B,stayblack,#11,playeronplanet_Istrat

	s_or_var		B,gameflags,#gf_nozremove


	s_playerfly_mode	planet
	s_set_alptrs		x,playerDIVEGND_strat,playercoll_Istrat,playerdead_Istrat


	s_and_var		B,gameflags,#~gf_viewrot	
	s_playerctrl		off

	jsr			dupplayer
	s_set_strat		y,pshipDIVEGND_Istrat
;	s_set_alvar		W,y,al_shape,#myship_4
	s_set_vartobeobj	svar_word1,y
	s_set_pos		y,#0,#0,#0
	s_set_vartobeobj	viewtoobj,y

	s_make_obj		#nullshape,.badobj
	phx
	tyx
	s_set_strat		x,viewDIVEGND_Istrat
	s_set_alvar		W,x,al_sword1,svar_word1
	s_set_pos		x,#0,#0,#0
	s_set_objtobevar	y,svar_word1
	s_set_alvartobeobj	y,al_sword1,x
 	plx
.badobj

	s_set_var		B,viewtype,#viewtype_norm

;----------------------------------------------------------------------
;	s_set_var		B,viewtype,#viewtype_fpos!viewtype_toobj
;	s_set_var		W,viewposx,#-400
;	s_set_var		W,viewposy,#-105
;	s_set_var		W,viewposz,#1800
;----------------------------------------------------------------------
	



	s_set_pos		x,#0,#0,#0
	s_set_var		W,lastplayZ,#0
	s_set_var		W,outvx,#-deg90*256
	s_set_var		W,outvx,#0


playerDIVEGND_strat
	s_start_strat


	IFEQ	1
	a16
	ldy	viewtoobj
	lda.w	al_worldz,y
	sec
	sbc	viewposz
	bmi	.nchg
	cmp	#4000
	bmi	.nchg
	a8
	s_set_var	W,viewposx,#-400
	s_set_var	W,viewposy,#-105
	s_add_var	W,viewposz,#8000
.nchg
	a8
	ENDC


;	jsr			calcbgscroll
	s_end_strat


;*****************************************************************************
playerExitBase_Istrat
set_playerExitBase_l
	a8i16
	lda	#$7e
	pha
	plb
	
	s_set_objtobeplayer	x
	s_set_var		W,lastplayZ,#0
	jsl			clearmap_l
	s_set_var		W,Bg2Yscroll,#232

	s_or_var		B,gameflags,#gf_nozremove

	s_playerfly_mode	exitbase
	s_set_alptrs		x,playerExitBasewait_strat,playercoll_Istrat,playerdead_Istrat


	s_and_var		B,gameflags,#~gf_viewrot	
	s_playerctrl		off

	s_set_var		B,viewtype,#viewtype_fpos!viewtype_toobj
	s_set_var		W,viewposx,#-400
	s_set_var		W,viewposy,#-145
	s_set_var		W,viewposz,#1000
	

	s_set_var		B,psvar_byte1,#15+((1000/pexitbasespeed)*2)
	s_set_var		B,player_medspeed,#0

	s_set_pos		x,#-27<<mybase_scale,#-39<<mybase_scale,#-200

	s_set_alsflag		x,invisible

	s_set_var		B,nomaxbg2Yscroll,#1
	
	s_and_var		B,pshipflags3,#~psf3_enginesnd
	rtl

;-----------------------------------------------------------------------
playerExitBasewait_strat
	s_start_strat

	s_jmp_varNE	B,psvar_byte1,#(17+((1000/pexitbasespeed)*2)-17),.nbgms
.nbgms
	s_set_pos		x,#-27<<mybase_scale,#-39<<mybase_scale,#-200
	s_decbne_var		B,psvar_byte1,playeronplanet_strat
;-----------------------------------------------------------------------

playerExitBaseGo_init
	s_set_var		B,psvar_byte1,#((80-pexitbasespeed)*2)
	s_set_strat		x,playerExitBaseGo_strat
	s_clr_alsflag		x,invisible
	s_set_var		B,stagecnt,#50
	set_sound2		x,#0
	s_set_var		B,psvar_byte2,#0
	s_set_alvar		B,x,al_snd1,#%10110001
playerExitBaseGo_strat
	s_start_strat

	s_inc_var		B,psvar_byte2
	s_jmp_varNE		B,psvar_byte2,#12,.nclose
	s_set_alvar		B,x,al_snd1,#%10010001
.nclose

	s_jmp_varNE		B,psvar_byte2,#20,.nclose2
	s_set_alvar		B,x,al_snd1,#%10000001
.nclose2

	s_jmp_varNE		B,psvar_byte2,#30,.nfar
	s_set_alvar		B,x,al_snd1,#%10100001
.nfar


	s_set_var		B,player_medspeed,#pexitbasespeed
	s_decbne_var		B,psvar_byte1,playeronplanet_strat
;-----------------------------------------------------------------------
playerExitBaseFollow_init
	s_set_strat		x,playerExitBaseFollow_strat
	s_or_var		B,pshipflags3,#psf3_enginesnd
playerExitBaseFollow_strat
	s_start_strat
	
	s_achase_alvar		W,x,al_worldx,#0,2
	s_achase_alvar		W,x,al_worldy,viewcy,2

	s_Achase_var		W,viewposx,#0,2
	s_Achase_var		W,viewposy,viewcy,2
	s_Achase_var		W,viewposz,player_posz,3

	s_varadd_alvar		W,x,viewposz,al_vz


	s_set_objtobevar	y,viewpt
	s_jmp_Zdistmore		x,y,#outviewdist+pexitbasespeed,playeronplanet_strat

	s_set_var		B,viewtype,#viewtype_norm
	s_AND_var		B,gameflags,#~gf_nozremove
	s_set_var		B,player_medspeed,#medpspeed

	s_make_obj		#myship_4,.badobj
	s_set_strat		y,friendstart3_Istrat
	s_set_alsflag		y,colldisable
	s_copy_pos		y,x
	a16
	lda		#-50
	sta.w		al_worldx,y
	lda		#-100
	sta.w		al_worldy,y
	lda.w		al_worldz,y
	clc
	adc		#-200
	sta.w		al_worldz,y
;	s_add_alvar		W,y,al_worldx,#-50
;	s_add_alvar		W,y,al_worldy,#-50
;	s_add_alvar		W,y,al_worldz,#-200
	a8
.badobj

	lda	#0
	sta.l	alx_snd1,x

	s_set_var		B,nomaxbg2Yscroll,#0

	s_jmp			playeronplanet_Istrat


	strats_end

;*****************************************************************************
set_playerIntoLB1_l
	a8i16
	s_set_objtobeplayer	x
	s_set_strat		x,playerIntoLB1a_Istrat
	rtl

playerIntoLB1a_Istrat
	s_playerctrl	off
	s_set_strat	x,playerIntoLB1a_strat
playerIntoLB1a_strat
	s_start_strat
	s_achase_alvar	W,x,al_worldx,#0,4
	s_achase_alvar	W,x,al_worldy,viewcy,4
	s_set_objtobevar	y,mapvar1
	s_jmp_Zdistless		x,y,#1785,playerintoLB1_Istrat	
	s_jmp		playeronplanet_strat



playerIntoLB1_Istrat
	s_start_strat

	s_playerctrl	off

	s_set_alptrs	x,playerIntoLB1_strat,0,0
	
	s_AND_var	B,gameflags,#~gf_stratdone1
	s_AND_var	B,playerflymode,#~pfm_wobble
	s_OR_var	B,pstratflags,#pstf_inseq

	jsr			dupplayer
	s_set_strat		y,pshipIntoLB1_Istrat
	s_set_vartobeobj	viewtoobj,y
	s_set_var		B,viewtype,#viewtype_fpos!viewtype_toobj


	s_make_obj		#nullshape,.badobj
	s_set_strat		y,viewIntoLB1_Istrat
	s_copy_pos		y,x
.badobj


	s_or_var		B,gameflags,#gf_noZremove


playerIntoLB1_strat
	s_start_strat
	s_add_alvar		W,x,al_worldz,#medpspeed

;	jsl		calcbgscroll_l

	s_end_strat


	s_end_strat

;*****************************************************************************





