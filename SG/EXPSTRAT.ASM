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
;*   File: EXPSTRAT.ASM                                                     *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr:  EXPLOSION STRATEGIES.                                       *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   Date: 11/6/92                                                         *
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

	INCPUBLICS	expstrat.ext


;*******************************************************************************
;*******************************************************************************
;*******************************************************************************
;* BOSS EXPLOSIONS.

;*******************************************************************************
Bossdelayexplode_Istrat	
	s_start_strat
	s_hardvars		x
	s_set_alptrs		x,Bossdelayexplode_strat,0,explode2_Istrat
Bossdelayexplode_strat
	s_start_strat
	s_set_alsflag		x,hitflash
	s_decbpl_lifecnt	x,.nd
	s_kill_obj		x
	s_jsl			makeFOLexpobj_srou
	s_or_var		B,gameflags,#gf_bossdead
	s_jmpto_expstrat	x
.nd
	s_add_playerZ		x
	lda			al_tempstratptr,x
	ora			al_tempstratptr+1,x
	ora			al_tempstratptr+2,x
	beq			.ntemp
	s_jmpto_tempstrat
.ntemp	s_end_strat

;*******************************************************************************
Qbossexplode_Istrat
	s_start_strat
	s_set_lifecnt		x,#0
	s_or_var		B,gameflags,#gf_bossdead
	s_set_alsflag		x,relexplode
	s_set_alsflag		x,sflag1
	s_jmp		circdelayexplode_Istrat


fakeexp_Istrat
	s_start_strat
	s_set_lifecnt		x,#0
	s_set_alsflag		x,relexplode
	s_set_alsflag		x,sflag1
	s_jmp		circdelayexplode_Istrat
;*******************************************************************************
; boss explode in 38 frames after small explosions.
bossexplode_Istrat
	s_start_strat

	s_boss_dying	

	s_jsl			makeSMLexpobj_srou
	s_jsl			addrnd2posy_srou
	s_set_lifecnt		y,#25-20
	s_clr_alsflag		y,noexpsnd      
	s_jsl			makeSMLexpobj_srou
	s_jsl			addrnd2posy_srou
	s_set_lifecnt		y,#30-20
	s_jsl			makeMEDexpobj_srou
	s_jsl			addrnd2posy_srou
	s_set_lifecnt		y,#35-20
	s_jsl			makeLexpobj_srou
	s_jsl			addrnd2posy_srou
	s_set_lifecnt		y,#37-20
	s_jsl			makeMEDexpobj_srou
	s_jsl			addrnd2posy_srou
	s_set_lifecnt		y,#39-20
	s_jsl			makeMEDexpobj_srou
	s_jsl			addrnd2posy_srou
	s_set_lifecnt		y,#42-20
	s_jsl			makeLexpobj_srou
	s_jsl			addrnd2posy_srou
	s_set_lifecnt		y,#44-20
	s_jsl			makeMEDexpobj_srou
	s_jsl			addrnd2posy_srou
	s_set_lifecnt		y,#46-20
	s_jsl			makeLexpobj_srou
	s_jsl			addrnd2posy_srou
	s_set_lifecnt		y,#48-20
	s_jsl			makeMEDexpobj_srou
	s_jsl			addrnd2posy_srou
	s_set_lifecnt		y,#49-20
	s_jsl			makeLexpobj_srou
	s_jsl			addrnd2posy_srou
	s_set_lifecnt		y,#52-20
	s_jsl			makeMEDexpobj_srou
	s_jsl			addrnd2posy_srou
	s_set_lifecnt		y,#52-20
	s_jsl			makeLexpobj_srou
	s_jsl			addrnd2posy_srou
	s_set_lifecnt		y,#54-20
	s_jsl			makeLexpobj_srou
	s_jsl			addrnd2posy_srou
	s_set_lifecnt		y,#54-20

	s_make_obj		#nullshape,.badobj1
	s_copy_sflags		y,x
	s_clr_alsflag		y,realobj
	s_set_alsflag		y,colldisable
	s_set_alsflag		y,noexpsnd      
	s_copy_pos		y,x
	s_set_lifecnt		y,#35-20
	s_set_alsflag		y,sflag1
	s_set_strat		y,circdelayexplode_Istrat	
.badobj1			
	s_set_lifecnt		x,#58-20
	s_jmp			bossdelayexplode_Istrat


;*****************************************************************************

makebosscircexp_srou
	trigse	$1d
	s_set_var		W,circleobj,#0
	s_make_obj		#nullshape,.badobj
	s_set_vartobeobj	circleobj,y
	s_set_strat		y,stayrel_strat
	s_copy_pos		y,x
.badobj	bigFOexp_sprite
	rtl

;*******************************************************************************
; boss immediately explodes with small outward explosions.
bossbigoutexplodeoff_Istrat					; with pos offset al_vx,vy,vz
	s_start_strat
	s_copy_alvar2var	W,x,svar_word1,al_vx
	s_copy_alvar2var	W,x,svar_word2,al_vy
	s_copy_alvar2var	W,x,svar_word3,al_vz
	s_brl			bossbigoutexplode_Icont	

bossbigoutexplode_Istrat
	s_start_strat
	s_set_var		W,svar_word1,#0	  
	s_set_var		W,svar_word2,#0	  
	s_set_var		W,svar_word3,#0	  
	
bossbigoutexplode_Icont
	s_or_var		B,gameflags,#gf_bossdead

	s_make_obj		#nullshape,.badobj1
	s_copy_sflags		y,x
	s_clr_alsflag		y,realobj
	s_set_alsflag		y,colldisable
	s_set_alsflag		y,noexpsnd      
	s_copy_pos		y,x
	s_set_lifecnt		y,#1
	s_clr_alsflag		y,sflag1
	s_set_strat		y,circdelayexplode_Istrat	
	jsr			addsvars2posy
.badobj1			


	s_make_obj		#nullshape,.badobj
	s_set_strat		y,BIGparticleexplode_Istrat
	s_copy_pos		y,x
	s_copy_sflags		y,x
	jsr			addsvars2posy
	s_set_alsflag		y,relexplode
.badobj


	lda		#10
.genexp
	pha
	jsl			makeLexpobj_srou
	jsr			setoutexp_srou
	jsl			makeFOLexpobj_srou
	jsr			setoutexp_srou
	s_set_alsflag		y,relexplode

	jsl			makeLexpobj_srou
	jsr			setoutexp_srou
	s_add_alvar		B,y,al_count,#8
	jsl			makeFOLexpobj_srou
	jsr			setoutexp_srou
	s_set_alsflag		y,relexplode
	s_add_alvar		B,y,al_count,#8

     	pla	
	dec	a
	lbne	.genexp

	s_set_lifecnt	x,#11
	s_jmp		delayremoverel_Istrat


setoutexp_srou
	s_set_var2rnd		svar_byte1
	s_set_var2rnd		svar_byte2,#63
	s_add_var		B,svar_byte2,#50
	s_make_xyvec		y,svar_byte1,svar_byte2
	s_set_alsflag		y,nopolyexp
	s_set_var2rnd		svar_byte1,#15
	s_set_lifecnt		y,svar_byte1
	s_jsl			addrnd2posy_srou
	jsr			addsvars2posy
	rts

addsvars2posy
	s_add_alvar		W,y,al_worldx,svar_word1
	s_add_alvar		W,y,al_worldy,svar_word2
	s_add_alvar		W,y,al_worldz,svar_word3
	rts


;*******************************************************************************
bigwhiteFOsprite_l
	a16
	lda			#whitefillscreen_circle
	sta			circleanim
	stz			circleobj
	a8
	rtl


;*******************************************************************************
;*******************************************************************************
;*******************************************************************************




;*******************************************************************************
delayexplode_Istrat	
	s_start_strat
	s_hardvars		x
	s_set_alptrs		x,delayexplode_strat,0,explode2_Istrat
delayexplode_strat
	s_start_strat
	s_set_alsflag		x,hitflash
	s_decbpl_lifecnt	x,.nd
	s_kill_obj		x
	s_jmpto_expstrat	x
.nd
	s_jmpNOT_alsflag	x,relexplode,.nrel
	s_add_playerZ		x
.nrel	s_end_strat



;*******************************************************************************
circdelayexplode_Istrat	
	s_start_strat
	s_hardvars		x
	s_set_alptrs		x,circdelayexplode_strat,0,0
	s_set_alsflag		x,colldisable
circdelayexplode_strat
	s_start_strat
	s_decbpl_lifecnt	x,.nd
	s_jsl			makebosscircexp_srou

	s_jmpNOT_alsflag		x,sflag1,.badobj
	s_make_obj		#nullshape,.badobj
	s_set_strat		y,BIGparticleexplode_Istrat
	s_copy_pos		y,x
	s_set_alsflag		y,relexplode
.badobj
	s_remove_obj		x


.nd
	s_add_playerZ		x
	s_end_strat



;*******************************************************************************
makeLexpobj_srou
	jsl			makeexpobj_srou
	s_set_alvar		W,y,al_shape,#largeshape
	s_rtl
makeMEDexpobj_srou
	jsl			makeexpobj_srou
	s_set_alvar		W,y,al_shape,#mediumshape
	s_rtl
makeSMLexpobj_srou
	jsl			makeexpobj_srou
	s_set_alvar		W,y,al_shape,#smallshape
	s_rtl
makeFOLexpobj_srou
	jsl			makeexpobj_srou
	s_set_alvar		W,y,al_shape,#FOlargeshape
	s_rtl
makeexpobj_srou
	s_make_obj		#0,.badobj1
	s_clr_alsflag		y,realobj
	s_set_alsflag		y,colldisable
	s_set_alsflag		y,noexpsnd      
	s_set_alsflag		y,relexplode
	s_set_strat		y,delayexplode_Istrat
	s_copy_pos		y,x
	s_rtl
.badobj1
	ldy			dummyobj
	s_rtl


;*******************************************************************************
addrnd2posy_srou
	jsl			random_l
	a16
	sexa
	clc
	adc.w			al_worldx,y
	sta.w			al_worldx,y
	a8
	jsl			random_l
	a16
	sexa
	clc
	adc.w			al_worldy,y
	sta.w			al_worldy,y
	a8
	s_rtl

addrnd2posxyz2_srou
	jsl			random_l
	a16
	sexa
	asl	a
	clc
	adc.w			al_worldx,y
	sta.w			al_worldx,y
	a8
	jsl			random_l
	a16
	sexa
	asl	a
	clc
	adc.w			al_worldy,y
	sta.w			al_worldy,y
	a8
	jsl			random_l
	a16
	sexa
	asl	a
	clc
	adc.w			al_worldz,y
	sta.w			al_worldz,y
	a8
	s_rtl


;*****************************************************************************
;doimplode_Istrat
;	s_start_strat
;	s_set_strat		x,donowt_strat
;	s_jmp			implode_Istrat
;donowt_strat
;	s_start_strat
;	s_add_playerZ		x
;	s_add_alvar		B,x,al_roty,#4  
;	s_end_strat

;*****************************************************************************
implode_Istrat
	s_start_strat 
	s_set_alvar		B,x,al_count,#50	
	s_set_expstrat		x,implode_strat
	s_set_alflag		x,exp
	s_set_alvar		B,x,al_hp,#0
	s_set_alsflag		x,colldisable
	s_end_strat
implode_strat
	s_start_strat
	s_decbne_alvar		B,x,al_count,.nendimp
	s_clr_alflag		x,exp
	s_set_alvar		B,x,al_hp,#hardHP
	s_clr_alsflag		x,colldisable
.nendimp        	
	s_add_alvar		B,x,al_roty,#4  
	s_add_playerZ		x
	s_add_vecs2pos		x
	s_end_strat



;*****************************************************************************

Smarkexplode_Istrat		; leave small mark in ground.
	s_make_obj	#Smark,.badobj
	s_copy_pos	y,x
	s_set_alvar	W,y,al_worldy,#0
	s_clr_alsflag	y,realobj
.badobj
	s_jmp		explode_Istrat

;-----------------------------------------------------------------------
Mmarkexplode_Istrat		; leave small mark in ground.
	s_make_obj	#Mmark,.badobj
	s_copy_pos	y,x
	s_set_alvar	W,y,al_worldy,#0
	s_clr_alsflag	y,realobj
.badobj
	s_jmp		explode_Istrat

;-----------------------------------------------------------------------
Lmarkexplode_Istrat		; leave small mark in ground.
	s_make_obj	#Lmark,.badobj
	s_copy_pos	y,x
	s_set_alvar	W,y,al_worldy,#0
	s_clr_alsflag	y,realobj
.badobj
	s_jmp		explode_Istrat


;*******************************************************************************
bigexplode_Istrat		; make large explosion as well
	s_start_strat
	jsl			makeLexpobj_srou
	s_set_alsflag		y,nopolyexp
	s_jsl			addrnd2posy_srou
	s_set_lifecnt		y,#1
	jsl			makeLexpobj_srou
	s_set_alsflag		y,nopolyexp
	s_jsl			addrnd2posy_srou
	s_clr_alsflag		y,noexpsnd
	s_set_lifecnt		y,#2
	jsl			makeLexpobj_srou
	s_set_alsflag		y,nopolyexp
	s_jsl			addrnd2posy_srou
	s_set_lifecnt		y,#3
	jsl			makeLexpobj_srou
	s_set_alsflag		y,nopolyexp
	s_jsl			addrnd2posy_srou
	s_clr_alsflag		y,noexpsnd
	s_set_lifecnt		y,#4
	jsl			makeLexpobj_srou
	s_set_alsflag		y,nopolyexp
	s_jsl			addrnd2posy_srou
	s_set_lifecnt		y,#5
	s_set_lifecnt		x,#4
	s_set_alsflag		x,relexplode
	s_jmp			delayexplode_Istrat



;*******************************************************************************

FASTexplodeDebris_Istrat		; uses al_sword2 as debris shape.

	s_make_obj		#nullshape,.badobjp
	s_set_strat		y,FASTparticleexplode_Istrat
	s_copy_pos		y,x
.badobjp
	s_brl			explodedebris_Icont


;-------------------------------------------------------------
escapeeexplode2_Istrat		; make little man 10 percent of times.
;	s_jmp_random		noescapee_Icont,90
	bra		makeescapee_Icont

escapeeexplode_Istrat		; make little man 20 percent of times.
	s_jmp_random		noescapee_Icont,80
makeescapee_Icont
	s_make_obj		#escapee,noescapee_Icont
	s_set_strat		y,escapee_Istrat
	s_copy_pos		y,x
	s_add_alvar		W,x,al_worldz,#40
noescapee_Icont
	s_jmp			explode_Istrat


escapee_Istrat
	s_start_strat
	s_add_alvar	B,x,al_rotz,#8	
	s_end_strat


;-------------------------------------------------------------

explodeDebris_Istrat		; uses al_sword2 as debris shape.


	s_make_obj		#nullshape,.badobjp
	s_set_strat		y,particleexplode_Istrat
	s_copy_pos		y,x
.badobjp

explodedebris_Icont

	IFEQ	0
	a16
	ldy	al_debrisshape,x
	phx
	tyx
	lda.l	sh_size,x
     	plx

	cmp	#expsize_small
	lbcc	.small
	cmp	#expsize_medium
	lbcc	.medium
	cmp	#expsize_large
	lbcc	.large

.small	lda	#15
	bra	.cont
.medium	lda	#30
	bra	.cont
.large 	lda	#35
.cont  	sta	svar_byte2
	ENDC
	

	a8
	s_copy_alvar2var	W,x,svar_word1,al_debrisshape
	
	s_set_var2rnd	svar_byte1
	s_copy_var2var	B,svar_byte3,svar_byte1
	s_add_var	B,svar_byte3,#deg360/16


	s_make_obj	svar_word1,.badobj
	s_set_strat	y,exppiece_Istrat
	s_copy_pos	y,x
	s_copy_rots	y,x
	s_copy_sflags	y,x
	s_make_xyvec	y,svar_byte3,svar_byte2
.badobj

	s_add_var	B,svar_byte3,#deg360/3
	s_make_obj	svar_word1,.badobj1
	s_set_strat	y,exppiece_Istrat
	s_copy_pos	y,x
	s_copy_rots	y,x
	s_copy_sflags	y,x
	s_make_xyvec	y,svar_byte3,svar_byte2
.badobj1


	IFEQ		1
	lda		#8+1
.mkp	pha
	s_make_obj	svar_word2,.badobj2
	s_set_strat	y,expSpiece_Istrat
	s_copy_pos	y,x
	s_copy_rots	y,x
	s_copy_sflags	y,x
	s_clr_alsflag	y,special
	s_copy_var2var	B,svar_byte3,svar_byte2
	s_sub_var	B,svar_byte3,#7
	s_add_rnd2var	svar_byte3,#7
	s_make_xyvec	y,svar_byte1,svar_byte3
.badobj2	s_add_var	B,svar_byte1,#deg360/8
	pla
	dec	a
	lbne	.mkp
	ENDC

	s_jmp		explode_Icont

expSpiece_Istrat
	s_start_strat
	s_set_strat	x,expSpiece_strat
	s_set_alvar2rnd	x,al_rotx
	s_set_alvar2rnd	x,al_rotz
	s_set_alsflag	x,colldisable
	s_clr_alsflag	x,hitflash
	s_set_lifecnt	x,#15
expSpiece_strat
	s_start_strat
	s_add_alvar	B,x,al_rotx,#16
	s_add_alvar	B,x,al_rotz,#6
;	s_add_alvar	W,x,al_worldz,#-50
	s_add_vecs2pos	x
	s_dec_lifecnt	x
	s_jmpNOT_alsflag	x,relexplode,.nrel
	s_add_playerZ	x
.nrel	s_end_strat	



exppiece_Istrat
	s_start_strat
	s_set_alptrs	x,exppiece_strat,0,exppieceexp_Istrat
	s_set_aldata	x,#hardHP,#8

	s_set_alsflag	x,colldisable
;	s_set_alvar2rnd	x,al_rotx
;	s_set_alvar2rnd	x,al_rotz

	s_set_var2rnd	svar_byte1,#7
	s_add_var	B,svar_byte1,#10
	s_set_lifecnt	x,svar_byte1

	s_clr_alsflag	x,hitflash

	s_add_vecs2pos	x

exppiece_strat
	s_start_strat
	s_add_alvar	B,x,al_rotx,#8
	s_add_alvar	B,x,al_rotz,#4

	s_dec_lifecnt	x,1

	s_add_vecs2pos	x

	s_jmpNOT_alsflag	x,relexplode,.nrel
	s_add_playerZ	x
	s_sub_alvar	W,x,al_worldz,#medpspeed/2
.nrel
	s_end_strat


exppieceexp_Istrat
	s_start_strat
	s_clr_alsflag	x,special
	s_clr_alsflag	x,Cspecial
	s_brl	explode2_Istrat

;*******************************************************************************
explodeBigParts_Istrat
	s_make_obj		#nullshape,.badobj
	s_set_strat		y,BIGparticleexplode_Istrat
	s_copy_pos		y,x
.badobj
	s_brl			explode2_Istrat


;*******************************************************************************
stopexplode_Istrat
	s_set_alsflag		x,relexplode
	s_sub_alvars		W,x,al_worldx,x,al_vx
	s_sub_alvars		W,x,al_worldy,x,al_vy
	s_sub_alvars		W,x,al_worldz,x,al_vz
	s_zero_vecs		x
	s_brl			explode_Istrat

stopexplode2_Istrat
	s_set_alsflag		x,relexplode
	s_sub_alvars		W,x,al_worldx,x,al_vx
	s_sub_alvars		W,x,al_worldy,x,al_vy
	s_sub_alvars		W,x,al_worldz,x,al_vz
	s_zero_vecs		x
	s_brl			explode2_Istrat
;*******************************************************************************
explode2_Istrat
	s_start_strat
;-------------------------------------------------------------
; sort out mother and child stuff if family

	s_jmp_alsflag		x,childobj,.ddiv
	s_jmpNOT_alsflag	x,motherobj,.ndiv
.ddiv	jsl	divorcefamily_l
.ndiv
;-------------------------------------------------------------



;-----------------------
; set gate2 if "special.
	s_jmpNOT_alsflag	x,special,.badobjs
	s_make_obj	#gate_2,.badobjs
	s_copy_pos	y,x
	s_set_strat	y,gate2_Istrat
.badobjs
;-----------------------

	s_jmp_alvarNOTZERO	W,x,al_debrisshape,explodedebris_Istrat
	s_jmp		explode_Icont
	
explode_Istrat
	s_start_strat
	s_jmp_colltype		y,enemyweap,.skipscore
	s_cmp_alvar			W,y,al_shape,#missile
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#c_miss
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#boss_A_1
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#largeshape
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#FOlargeshape
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#mediumshape
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#smallshape
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#gate_2
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#big_m
	lbeq					.skipscore
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
	s_cmp_alvar			W,y,al_shape,#robot_0
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#ray_bred
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#ray_1
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#bulge
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#myship_4
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#boss_f_b
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#sface2_b
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#sface_b
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#fireface1_b
	lbeq					.skipscore	
	s_cmp_alvar			W,y,al_shape,#fireface_b
	lbeq					.skipscore	
	s_cmp_alvar			W,y,al_shape,#face_0
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#face_0_1
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#face_1
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
	lda	bgm_music
	cmp	#5
	bne	.skipbgm
	s_cmp_alvar			W,y,al_shape,#zaco_6
	lbeq					.skipscore
	s_cmp_alvar			W,y,al_shape,#boss_d_4
	lbeq					.skipscore		
.skipbgm	
	s_jmp_iflevel	2,.level2
	bra	.notlevel2
.level2
	s_cmp_alvar			W,y,al_shape,#sea_0_0
	beq					.skipscore
	s_cmp_alvar			W,y,al_shape,#sea_0_1
	beq					.skipscore
	s_cmp_alvar			W,y,al_shape,#sea_0
	beq					.skipscore
	s_cmp_alvar			W,y,al_shape,#f_fish
	beq					.skipscore
.notlevel2

	s_score	#10
.skipscore

;-------------------------------------------------------------
; sort out mother and child stuff if family

	s_jmp_alsflag		x,childobj,.ddiv
	s_jmpNOT_alsflag	x,motherobj,.ndiv
.ddiv	jsl	divorcefamily_l
.ndiv
;-------------------------------------------------------------



;-----------------------
; set gate2 if "special.
	s_jmpNOT_alsflag	x,special,.badobjs
	s_make_obj	#gate_2,.badobjs
	s_copy_pos	y,x
	s_set_strat	y,gate2_Istrat
.badobjs
;-----------------------

	s_jmp_alvarNOTZERO	W,x,al_debrisshape,explodedebris_Istrat

explode_Icont
	s_test_special		x

	s_jmpNOT_alflag		x,inviewpl,remove_strat

	s_set_alflag		x,exp

	s_set_alvar		B,x,al_hp,#0
	s_clr_alsflag	x,ssprite

	s_set_alsflag		x,colldisable
	s_jmpNOT_onfire		x,.nef
	s_remove_fire		x
.nef
	s_make_obj		#nullshape,remove_strat
	s_copy_sflags		y,x
	s_clr_alsflag		y,special
	s_clr_alsflag		y,hitflash
 	s_clr_alsflag		y,realobj
	s_clr_alsflag		y,shadow

	s_sprite_obj		y,#0

;---- 65816
; change the explosion length according to the size
	a16
	phy

	ldy	al_shape,x
	phx
	tyx

	stz	svar_word1

	lda.l	sh_size,x

	cmp	#expsize_small
	lbcc	.small
	cmp	#expsize_medium
	lbcc	.medium
	cmp	#expsize_large
	lbcc	.large
.FOlarge
	plx
	ply
	a8
	s_set_alvar		B,y,al_count1,#8
	s_set_alvar		W,y,al_shape,#explosion4&WM
	s_set_alvar		W,x,al_shape,#expl_8&WM
	s_set_expstrat		x,Lexplode_strat
	s_jmp			.end
.large	longa
	sec
	sbc	#expsize_large
	sta	x1
	lda.l	sh_shift,x
	and	#255
	beq	.l_noshift
.l_shiftitdown
	lsr	x1
	dec	a
	bne	.l_shiftitdown
.l_noshift
	lda	x1
	plx
	ply
	lsr	a
	lsr	a
	lsr	a
	lsr	a
	lsr	a
	a8
	sta	al_tx,y

	s_set_alvar		B,y,al_count1,#8
	s_set_alvar		W,y,al_shape,#explosion3&WM
	s_set_alvar		W,x,al_shape,#expl_8&WM
	s_set_expstrat		x,explode_strat
	s_jmp			.end

.medium	longa
	sec
	sbc	#expsize_medium
	sta	x1
	lda.l	sh_shift,x
	and	#255
	beq	.m_noshift
.m_shiftitdown
	lsr	x1
	dec	a
	bne	.m_shiftitdown
.m_noshift
	lda	x1
	plx
	ply
	lsr	a
	lsr	a
	lsr	a
	lsr	a
	a8
	sta	al_tx,y

	s_set_alvar		B,y,al_count1,#6
	s_set_alvar		W,y,al_shape,#explosion2&WM
	s_set_alvar		W,x,al_shape,#expl_6&WM
	s_set_expstrat		x,explode_strat
	s_jmp			.end

.small	longa
	sec
	sbc	#expsize_small
	sta	x1
	lda.l	sh_shift,x
	and	#255
	beq	.s_noshift
.s_shiftitdown
	lsr	x1
	dec	a
	bne	.s_shiftitdown
.s_noshift
	lda	x1
	plx
	ply
	lsr	a
	lsr	a
	lsr	a
	a8
	sta	al_tx,y		; set size of sprite

	s_set_alvar		B,y,al_count1,#4
	s_set_alvar		W,y,al_shape,#explosion&WM
	s_set_alvar		W,x,al_shape,#expl_4&WM
	s_set_expstrat		x,explode_strat


.end
	s_set_alvar2rnd		x,al_rotx
	s_set_alvar2rnd		x,al_roty
	s_set_alvar		B,x,al_count1,#12	; poly count
	s_set_alvar		B,x,al_count,#0
	s_set_alvar		B,y,al_count,#0
	s_init_colanim		x,#0
	s_init_colanim		y,#0
	s_copy_pos		y,x
	s_rots_flat		y
	s_set_alptrs		y,explode_strat,0,0
	s_set_aldata		y,#hardhp,#hardap
	s_set_alsflag		y,colldisable
	s_sub_alvar		W,y,al_worldy,svar_word1
	s_copy_vecs		y,x

	s_jmp_alsflag		x,noexpsnd,.nesnd

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
	trigse		se_destructenemyfar
	s_jmp		.end2
.mid	a8
	trigse		se_destructenemymid
	s_jmp		.end2
.near	a8
	trigse		se_destructenemynear
.end2	ply
.nesnd

	s_jmpNOT_alsflag	x,nopolyexp,.npoly
	s_remove_obj	x
.npoly
	s_end_strat



Lexplode_strat
	s_start_strat
	s_jmp_NOTdelay		1,explode_end
	s_add_colanim		x,#1,#8
	s_inc_alvar	 	B,x,al_count
	s_jmp			explode_end
explode_strat
	s_start_strat
	s_add_colanim		x,#1,#8
	s_inc_alvar	 	B,x,al_count

explode_end	
	s_jmpNOT_alsflag	x,relexplode,.nrel
	s_add_playerZ		x
.nrel

	s_add_vecs2pos		x
	s_cmp_alvars		B,x,al_count,x,al_count1
	s_bpl			remove_strat
	s_end_strat


;********************************************************************************
particleexplode_Istrat
	s_start_strat
;	s_set_alptrs	x,particleexplode_strat,particleexplode_strat,particleexplode_strat
	s_set_expstrat	x,particleexplode_strat
	s_set_alsflag	x,colldisable
	s_set_alflag	x,exp
	s_particle_data	x,6,60,30
	s_end_strat
particleexplode_strat
	s_start_strat
	s_particle_data	x,0,0,0
	s_inc_alvar	 	B,x,al_count
	s_jmp_alvarEQ		B,x,al_count,#40,remove_Istrat
;	s_Add_playerZ		x
	s_add_alvar		W,x,al_worldz,#medpspeed-30
	s_end_strat



;*******************************************************************************
fastparticleexplode_Istrat
	s_start_strat
;	s_set_alptrs	x,fastparticleexplode_strat,fastparticleexplode_strat,fastparticleexplode_strat
	s_set_expstrat	x,fastparticleexplode_strat
	s_set_alsflag	x,colldisable
	s_set_alflag	x,exp
	s_particle_data	x,7,60,40		100
	s_end_strat

fastparticleexplode_strat
	s_start_strat
	s_particle_data	x,0,0,0
;	s_inc_alvar	 	B,x,al_count
;	s_jmp_alvarEQ		B,x,al_count,#50,remove_Istrat
	s_end_strat

;*******************************************************************************
BIGparticleexplode_Istrat
	s_start_strat
;	s_set_alptrs	x,BIGparticleexplode_strat,BIGparticleexplode_strat,BIGparticleexplode_strat
	s_set_expstrat	x,BIGparticleexplode_strat
	s_set_alsflag	x,colldisable
	s_set_alflag	x,exp
	s_particle_data	x,4,255,100	
	s_end_strat
BIGparticleexplode_strat
	s_start_strat
	s_particle_data	x,0,0,0
	s_inc_alvar	 	B,x,al_count
	s_jmp_alvarEQ		B,x,al_count,#110,remove_Istrat
	s_jmpNOT_alsflag	x,relexplode,.nrel
	s_add_playerZ		x
.nrel	s_end_strat


;*******************************************************************************
CIRC2particleexplode_Istrat
	s_start_strat
;	s_set_alptrs	x,CIRC2particleexplode_strat,CIRC2particleexplode_strat,CIRC2particleexplode_strat
	s_set_expstrat	x,CIRC2particleexplode_strat
	s_set_alsflag	x,colldisable
	s_set_alflag	x,exp
	s_particle_data	x,6,250,60	
	s_end_strat
CIRC2particleexplode_strat
	s_start_strat
	s_particle_data	x,0,0,0
	s_inc_alvar	 	B,x,al_count
	s_jmp_alvarEQ		B,x,al_count,#50,remove_Istrat
	s_jmpNOT_alsflag	x,relexplode,.nrel
	s_add_playerZ		x
.nrel	s_end_strat



;*******************************************************************************
CIRCparticleexplode_Istrat
;	s_start_strat
;;	s_set_alptrs	x,CIRCparticleexplode_strat,CIRCparticleexplode_strat,CIRCparticleexplode_strat
;	s_set_expstrat	x,CIRCparticleexplode_strat
;	s_set_alsflag	x,colldisable
;	s_set_alflag	x,exp
;	s_particle_data	x,4,60,5
;	s_end_strat
CIRCparticleexplode_strat
;	s_start_strat
;	s_particle_data	x,0,0,0
;	s_inc_alvar	 	B,x,al_count
;	s_jmp_alvarEQ		B,x,al_count,#10,remove_Istrat
;	s_add_playerZ		x
	s_end_strat


;*******************************************************************************
particlefire_Istrat
	s_start_strat
	s_particle_data	x,2,2,25
particlefire_Icont
;	s_set_alptrs	x,particlefire_strat,particlefire_strat,particlefire_strat
	s_set_expstrat	x,particlefire_strat
	s_set_alsflag	x,colldisable
	s_set_alflag	x,exp
	s_end_strat
particlefire_strat
	s_start_strat
	s_end_strat


particlefiredown_Istrat
	s_start_strat
	s_particle_data	x,3,4,9
	s_jmp		particlefire_Icont



;********************************************************************************
makepollen_srou_l
	s_make_obj	#nullshape,.bad
	s_copy_pos	y,x
	s_set_strat	y,particlepollen_Istrat
	s_add_alvar	W,y,al_worldy,#-120
.bad
	rtl

particlepollen_Istrat
	s_start_strat
	s_set_expstrat	x,particlepollen_strat
	s_set_alsflag	x,colldisable
	s_set_alflag	x,exp
	s_particle_data	x,6,60,250
	s_end_strat
particlepollen_strat
	s_start_strat
	s_particle_data	x,0,0,0
	s_inc_alvar	 	B,x,al_count
	s_jmp_alvarEQ		B,x,al_count,#250,remove_Istrat
;	s_Add_playerZ		x
	s_end_strat


;********************************************************************************
explodegate2_Istrat
	s_start_strat
	s_jmp_random	.badobjs,80
	s_set_objtobealvar	y,x,al_collobjptr
	s_jmp_objptrbad	y,.do
	s_jmpNOT_colltype	y,laser,.badobjs
.do	s_make_obj	#gate_2,.badobjs
	s_copy_pos	y,x
	s_set_strat	y,gate2_Istrat
.badobjs
	s_jmp	stopexplode2_Istrat
;********************************************************************************
tow0explode_Istrat
	s_start_strat
	s_set_alvar	W,x,al_sword2,#160
	s_brl		pillarexplode_istrat

pillar3explode_Istrat
	s_start_strat
	s_set_alvar	W,x,al_sword2,#0
pillarexplode_Istrat

	lda	#0
	sta	x1
	lda	#-10<<2
	sta	y1
	lda	al_rotz,x
	jsl	rotate_8yx_l

	s_set_var	W,x1,#0
	s_set_var	W,y1,#0

	
	lda	#8
.makeexp
	sta	z1
	jsl	makeMEDexpobj_srou
	s_clr_alsflag	y,relexplode
	s_set_alsflag	y,nopolyexp
	s_add_alvar	W,y,al_worldx,x1
	s_add_alvar	W,y,al_worldy,y1
	s_add_alvars	W,y,al_worldy,x,al_sword2
        	s_set_strat	y,delayexplode_Istrat
	s_Add_var	W,x1,x2
	s_Add_var	W,y1,y2
	s_sub_alvar	W,y,al_worldz,#10
	lda		#8
	sec
	sbc		z1
	sta.w		al_count,y
	lda	z1
	dec	a
	bne	.makeexp

	s_set_lifecnt		x,#7
	s_jmp		delayremove_Istrat



;********************************************************************************






