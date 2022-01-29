;***************************************************************************
;*                                                                         *
;*                                StarFox                                  *
;*                              -----------                                *
;*                                                                         *
;*                           SuperNES version.                             *
;*                                                                         *
;*                           Argonaut Software.      		      *	   
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   File: D2STRATS.ASM                                                    *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr: DYLAN'S STRATEGY ROUTINES 2.                                    *
;*_________________________________________________________________________*
;*                                                                         *
;*   Date: 26/9/92                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;* Author:		Dylan Cuthbert.      				      *	
;*                                                                         *
;***************************************************************************



bossgHP	equ	120
bossgAP	equ	8
seadragonHP	equ	4
seadragonAP	equ	6


	strats_start


	INCPUBLICS	EXT\d2strats.ext

	SHORTA
d2copypos_yx
	s_copy_pos	y,x
	rts

d2copyrots_yx
	s_copy_rots	y,x
	rts



;---------------------------------------------------------------
;---------------------------------------------------------------



bossg_istrat
	s_start_strat
	stz	maptrigger
	s_set_alptrs	x,.strat,hitflash_istrat,bossgexplode_istrat
	s_set_aldata	x,#hardHP,#bossgAP
	s_init_anim	x,#0
	s_set_alsflag	x,shadow
	s_set_colltype	x,ENEMY1
	s_mode_change	x,#0
	trigse		$9d

.strat	s_start_strat
	s_mode_table

	s_mode_entry	.waituntilalmosthitplayer
	s_mode_entry	.scrollmsg
	s_mode_entry	.sf9e
	s_mode_entry	.runaway,bossg_loopback
	s_mode_entry	.disappear
	s_mode_entry	.waitsometime
	s_mode_entry	.appear
	s_mode_entry	.moveto600h

	s_mode_entry	.opentrunk
	s_mode_entry	.launchleftfish
	s_mode_entry	.launchrightfish
	s_mode_entry	.waitabit2
	s_mode_entry	.closetrunk
	s_mode_entry	.waitabit2

	s_mode_entry	.opentrunk
	s_mode_entry	.launchleftfish
	s_mode_entry	.launchrightfish
	s_mode_entry	.waitabit2
	s_mode_entry	.closetrunk
	s_mode_entry	.waitabit2

	s_mode_entry	.opentrunk
	s_mode_entry	.launchleftfish
	s_mode_entry	.launchrightfish
	s_mode_entry	.waitabit2
	s_mode_entry	.closetrunk
	s_mode_entry	.waitabit2

	s_mode_entry	.opentrunk
	s_mode_entry	.launchleftfish
	s_mode_entry	.launchrightfish
	s_mode_entry	.waitabit2
	s_mode_entry	.closetrunk
;	s_mode_entry	.waitabit2

	s_mode_entry	.generateshadows
	s_mode_entry	.waitabit
	s_mode_entry	.sf9e
	s_mode_entry	.runaway 
	s_mode_entry	.loopback


;**********
.sf9d	SHORTA
	trigse		$9d
	jmp		.nxtmode
;**********
.sf9e	SHORTA
	trigse	$9e
	jmp		.nxtmode
;**********
.loopback
	s_mode_change	x,#bossg_loopback
	s_jmp		.strat
;**********
.opentrunk
	s_cmp_anim	x,#0
	bne		.nosnd1
	trigse		$5a
.nosnd1
	s_add_anim	x,#1,#10,.nxtmode
	s_jmp		.move2

;**********
.closetrunk
	s_cmp_anim	x,#9
	bne		.nosnd2
	trigse		$59
.nosnd2
	s_cmp_anim	x,#0
	s_beq		.nxtmode
	s_add_anim	x,#-1,#10
	s_jmp		.move2


;**********
.waitabit
	s_inc_alvar	B,x,al_sbyte1
	s_cmp_alvar	B,x,al_sbyte1,#70
	s_beq		.znxtmode
	s_jmp		.move2

;**********
.waitabit2
	s_inc_alvar	B,x,al_sbyte1
	s_cmp_alvar	B,x,al_sbyte1,#10
	s_beq		.znxtmode
	s_jmp		.move2

;**********
.generateshadows
	trigse		$2d
	s_make_obj	#boss_g_s,.nxtmode

	jsr		d2copypos_yx
	jsr		d2copyrots_yx
	s_sub_alvar	W,y,al_worldz,#50
	s_set_alvar	W,y,al_sword1,#-100

	s_set_strat	y,bossgs_istrat

	s_make_obj	#boss_g_s,.nxtmode

	jsr		d2copyrots_yx
	jsr		d2copypos_yx

	s_sub_alvar	W,y,al_worldz,#50

	s_set_strat	y,bossgs_istrat

	s_make_obj	#boss_g_s,.nxtmode

	jsr		d2copyrots_yx
	jsr		d2copypos_yx

	s_sub_alvar	W,y,al_worldz,#50
	s_set_alvar	W,y,al_sword1,#100

	s_set_strat	y,bossgs_istrat

	s_jmp		.nxtmode



;**********
.dropmines
	s_make_obj	#barrier,.nxtmode
	jsr		d2copyrots_yx
	s_set_strat	y,barrier_istrat
	stz	z1
	stz	y1
	stz	x1
	s_jsl	positional_l
	s_jmp	.nxtmode

;**********
.launchleftfish
	s_jsr		.launchfish
	s_jmp		.nxtmode

;**********
.launchrightfish
	s_jsr		.launchfish
	s_set_alsflag	y,sflag3
	s_jmp		.nxtmode

;**********
.launchsomefish
	s_jmp_notdelay	6,.nofish
	s_jsr		.launchfish
.nofish
	s_jmp		.move2
;**********
.waitsometime
	lda.l	m_bossmaxhp
	s_beq	.notyet
	s_jmp_notdelay	2,.notyet

	lda	al_hp,x
	cmp	#bossgHP
	beq	.notyet
	inc	a
	sta	al_hp,x

.notyet
	lda	maptrigger
	bit	#1
	bne	.wait	; not yet

	ldy		#sea_0
	s_jsl		find_y_l
	cpy		dummyobj
	s_bne		.wait
	ldy		#sea_0_0
	s_jsl		find_y_l
	cpy		dummyobj
	s_bne		.wait
	ldy		#sea_0_1
	s_jsl		find_y_l
	cpy		dummyobj
	s_bne		.wait

	jmp		.znxtmode
.wait
	lda.l	m_bossmaxhp
	s_beq	.move
	s_jmp	.move2
;**********
.disappear
	s_set_alvar	W,x,al_shape,#nullshape
	s_or_var	B,maptrigger,#1
	s_jmp		.nxtmode
;**********
.appear
	s_set_alvar	W,x,al_shape,#boss_g_0
	lda.l		m_bossmaxhp
	bne		.dontreset
	s_set_aldata	x,#bossgHP,#bossgAP
	s_set_bossmaxHp	x,al_hp
.dontreset
	s_jmp		.nxtmode
;**********
.znxtmode	stz	al_sbyte1,x
.nxtmode
	s_mode_change	x,+1
	s_jmp		.strat
;**********
.runaway
	a16
	lda	#1000
	s_jsl	dzdistless_L
	shorta
	s_bcc	.dontgen
	s_jsr		.genspark
.dontgen
	s_add_alvar	W,x,al_worldz,#70
	a16
	lda	#4000
	s_jsl	dzdistless_l
	shorta
	s_bcc		.nxtmode
	lda.l	m_bossmaxhp
	s_beq	.move
	s_jmp	.move2
	
;**********
.waituntilalmosthitplayer
	s_sub_alvar	W,x,al_worldz,#40
	a16
	lda	#150
	s_jsl	dzdistless_l
	shorta
	s_bcs	.nxtmode
	s_jmp	.end


;**********
.scrollmsg
	lda	#140
	s_jsl	dzdistless_l
	shorta
	s_bcc	.nozchange
	s_add_alvar	W,x,al_worldz,#40
.nozchange
	s_add_alvar	B,x,al_tx,#4
	lda		al_tx,x
	and		#127
	s_beq		.nxtmode
	s_jmp		.move

;**********
.moveto600h
	s_jmp_alsflag	x,sflag8,.nosnd
	a16
	lda	#1500
	s_jsl	dzdistless_l
	shorta
	s_bcc	.nosnd
	trigse	$9d
	s_set_alsflag	x,sflag8
.nosnd
	a16
	lda	#600
	s_jsl	dzdistless_l
	shorta
	bcs	.z8nxtmode
	s_sub_alvar	W,x,al_worldz,#40
	s_jmp	.move2

.z8nxtmode	s_clr_alsflag	x,sflag8
	jmp		.nxtmode

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.genspark
	phx
	txy
	s_set_objtobevar	x,dummyobj
	s_copy_pos		x,y
;	jsr			d2copypos_xy
	s_sub_alvar		W,x,al_worldy,#60
	s_jsl			sgenspark_srou_l
	plx
	rts

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.launchfish
	s_make_obj	#f_fish,.dekinai
	s_set_strat	y,flyingfish_istrat
	jsr			d2copypos_yx
	s_add_alvar	W,y,al_worldy,#30
	jsr		d2copyrots_yx

.dekinai
	s_rts
	
	
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.move2
	s_add_bosshp	x,al_hp

	s_add_playerz	x

	s_jmp_notdelay	1,.nosplash
	s_push_var	W,allst
	s_set_vartobeobj	allst,x
	s_add_alvar	W,x,al_worldz,#30
	s_make_splash	x,s
	s_add_alvar	W,x,al_worldz,#-30
	s_pull_var	W,allst
.nosplash

	s_jmp	.end
	
.move
	s_add_playerz	x
	
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.end	s_end_strat



;--------------------------------------------------------------------

bossgexplode_istrat
	s_start_strat
.chkagain
	ldy	#boss_g_s
	jsl	find_y_l
	cpy	dummyobj
	beq	.okdone
	cpy	#0
	beq	.okdone
	s_remove_obj	y
	bra	.chkagain
.okdone

	s_set_expstrat	x,.strat
.strat	s_start_strat

	lda	#3
.make3
	pha
	jsl	makeSMLexpobj_srou
	s_set_alsflag	y,nopolyexp
	s_sub_alvar	W,y,al_worldy,#60
	s_add_rnd2pos	y,15,15,15
	s_set_alvar	W,y,al_shape,#explosion5

	pla
	dec	a
	s_bne	.make3

	s_add_anim	x,#1,#10,.nomore
.nomore
	a16
	lda	#350
	s_jsl	dzdistless_l
	shorta
	s_bcc	.end

	bra	.toppleoff

.end	s_make_splash	x,s
	s_end_strat

.toppleoff
	s_or_var	B,maptrigger,#2
	jml		bossexplode_istrat
	s_set_expstrat	x,.strat2
	jsl	makeLexpobj_srou
	s_sub_alvar	W,y,al_worldy,#60
	s_set_alvar	B,x,al_sbyte1,#0
	s_add_alvar	W,x,al_worldy,#10
.strat2	s_start_strat
	s_Add_playerz	x
	s_add_alvars	B,x,al_rotz,x,al_sbyte1

	s_cmp_alvar	B,x,al_rotz,#deg90+deg22
	s_bmi		.norebounce
	s_set_alvar	B,x,al_rotz,#deg90+deg22
	lda	al_sbyte1,x
	eor	#255
	inc	a
	asra
	sta	al_sbyte1,x
	s_make_splash	x
	s_add_alvar	W,y,al_worldx,#-40
	s_make_splash	x
	s_add_alvar	W,y,al_worldx,#10
	s_add_alvar	W,y,al_worldz,#30
	s_sub_alvar	W,x,al_worldz,#30
	s_or_var	B,maptrigger,#2
	jml		bossexplode_istrat
.norebounce
	s_cmp_alvar	W,x,al_worldy,#0
	s_bpl		.nochange
	s_add_alvar	W,x,al_worldy,#10
.nochange
	s_sub_alvar	W,x,al_worldx,#5
	s_add_alvar	B,x,al_sbyte1,#2
	s_make_splash	x
	s_end_strat

;--------------------------------------------------------------------
bossgs_istrat
	s_start_strat
	s_set_colltype	x,ENEMY1
	s_set_alptrs	x,.strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#hardHP,#hardAP
	s_set_alvar	B,x,al_sbyte1,#40
.strat	s_start_strat
	lda	gameframe
	bit	#1
	beq	.setcoltab
	s_set_coltab	x,#BLACK_C
	bra		.black
.setcoltab	s_clr_coltab	x
.black
	s_fchase_alvar2alvar	W,x,al_worldx,x,al_sword1,5
	
	s_beqdec_alvar	B,x,al_sbyte1,.dash
	s_add_playerz	x
	s_end_strat
.dash
	s_sub_alvar	W,x,al_worldz,#50
	s_end_strat
;--------------------------------------------------------------------

;--------------------------------------------------------------------------
; mother strategies

mother1_istrat
	s_start_strat
	s_copy_alvar2alvar	W,x,al_sword2,x,al_worldz
	s_set_objtobeplayer	y
	s_sub_alvars		W,x,al_sword2,y,al_worldz
	s_set_strat		x,.strat
.strat
	s_start_strat
	s_set_objtobeplayer	y
	s_copy_alvar2alvar	W,x,al_worldz,y,al_worldz
	s_add_alvars		W,x,al_worldz,x,al_sword2

	s_push_var		W,allst
	s_set_vartobeobj	allst,x
	s_bemother		x
	s_pull_var		W,allst
	s_end_strat


; mother2 strategy

mother2_istrat
	s_start_strat
	s_copy_alvar2alvar	W,x,al_sword2,x,al_worldz
	s_set_objtobeplayer	y
	s_sub_alvars		W,x,al_sword2,y,al_worldz
	s_set_strat		x,.strat
.strat
	s_start_strat
	s_set_objtobeplayer	y
	s_copy_alvar2alvar	W,x,al_worldz,y,al_worldz
	s_add_alvars		W,x,al_worldz,x,al_sword2
	
	s_push_var		W,allst
	s_set_vartobeobj	allst,y
	s_bemother		x
	s_pull_var		W,allst
	s_end_strat

;--------------------------------------------------------------------

para_istrat
	s_start_strat
	s_set_alptrs	x,para_strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#paraHP,#paraAP
	s_set_alvar	B,x,al_sbyte1,#-paraSWINGMAX
	s_set_alsflag	x,shadow
para_strat
	s_start_strat
	s_add_playerz	x
	s_add_alvar	W,x,al_worldy,#10
	s_cmp_alvar	B,x,al_rotz,#128
	s_bcs		.addtoit
	s_cmp_alvar	B,x,al_sbyte1,#-paraSWINGMAX
	s_beq		.ok
	s_sub_alvar	B,x,al_sbyte1,#paraSWINGSPD
	s_bra		.ok
.addtoit
	s_cmp_alvar	B,x,al_sbyte1,#paraSWINGMAX
	s_beq		.ok
	s_add_alvar	B,x,al_sbyte1,#paraSWINGSPD
.ok
	s_copy_alvar2var	B,x,svar_byte1,al_sbyte1
	s_add_alvar	B,x,al_rotz,svar_byte1

	s_jmp_lower	x,#0,para2_istrat
	s_end_strat

para2_istrat
	s_start_strat
	s_set_strat	x,para2_strat
	s_set_alvar	W,x,al_worldy,#0
	s_Set_alvar	B,x,al_rotz,#0
	s_set_alvar	W,x,al_shape,#para_1
	s_set_alvar	B,x,al_vel,#10
	s_initface_player	x
	s_end_strat

para2_strat	s_start_strat
	s_face_player	x,1,0,.nogen
	s_gen_vecs		x,al_roty,al_vel
.nogen
	s_add_vecs2pos	x
	s_set_objtobeplayer	y
	s_jmp_distless	x,y,#400,parajump_i

	s_jmp_notdelay	4,.njump,al1pt
	s_set_alvar		W,x,al_vy,#-15
.njump

	s_add_vecs2pos	x
	s_falldown_Yvec	x,1,#3,#0

	s_end_Strat

parajump_i
	s_set_strat	x,parajump_strat
parajump_strat
	s_start_strat
	s_achase_alvar	W,x,al_worldy,player_posy,2

	s_set_objtobeplayer	y
	s_jmp_Zdistmore	x,y,#200,.nx
	s_achase_alvar	W,x,al_worldx,player_posx,3
.nx
	s_end_strat

;;;--------------------------------------------------------------------
;;
;;	shorta
;;	longi
;;volcano_srou_l
;;
;;	s_jsr		fling.makeobj
;;	bcs		.cantmake
;;	s_jsr		copypos_yx
;;	s_jsr		fling.copyrots_yx
;;	s_set_strat	y,fireball_istrat
;;	s_set_alvar	W,y,al_shape,#fireball
;;	s_set_alvar2rnd	y,al_roty
;;	s_set_alvar2rnd	y,al_vel,#63
;;	s_set_alvar2rnd	y,al_vy,#31
;;	s_sub_alvar	W,y,al_vy,#64
;;
;;.cantmake
;;	rtl
;;
;;;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
;;
;;fireball_istrat
;;	s_start_strat
;;	s_jsr	dgen3dvecs
;;	s_jsr	drotsflat_x
;;	s_set_alptrs	x,.strat,hitflash_istrat,explode_istrat
;;	s_set_aldata	x,#hardHP,#hardAP
;;	s_set_alsflag	x,nohitaffect
;;.strat	s_start_Strat
;;	s_jsr		daddvecs2pos_x
;;	s_jsr		dfallYvec_x
;;.end	s_end_strat
;;
;;
;;;--------------------------------------------------------------------



;--------------------------------------------------------------------


massivebase_istrat
	s_start_strat
	s_set_alptrs	x,.strat,0,0
	s_set_alsflag	x,colldisable
	s_set_aldata	x,#hardHP,#hardAP
	s_set_alvar	B,x,al_roty,#deg180
	s_set_var	B,maptrigger,#0
	s_clr_altype	x,zremove
.strat	s_start_strat
	a16
	lda	#3000
	jsl	dzdistless_l
	shorta
	bcc	.noforce
	s_playerctrl	off
	s_set_objtobeplayer	y

	s_achase_alvar	W,y,al_worldx,#0,4
	s_achase_alvar	W,y,al_worldy,viewcy,4
.noforce
	a16
	lda	#$3500
	jsl	dzdistless_l
	shorta
	bcs	.complex
	s_set_alvar	W,x,al_shape,#kichi_1
	s_end_strat
.complex
	s_set_alvar	W,x,al_shape,#kichi_0

	
	s_end_strat


;--------------------------------------------------------------------

kdoor2_istrat
	s_start_strat
;	s_set_altype	x,gnd
	s_set_alsflag	x,sflag1
kdoor_istrat
	s_start_Strat
	s_set_alptrs	x,.strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#hardHP,#hardAP
	s_set_alsflag	x,colldisable
	s_init_anim	x,#0
.strat	s_start_strat
	a16
	lda	#600
	s_jsl	dzdistless_l
	shorta
	bcs	.open
	s_doorclose_snd	7
	s_cmp_anim	x,#0
	s_beq		.end
	s_add_anim	x,#-1,#8
	bra	.end
.open
	s_dooropen_snd	0	
	s_add_anim	x,#1,#8,.remove
	s_bra		.end
.remove
	s_jmp_notalsflag	x,sflag1,.noflagclr
	s_playerctrl	on
	ldy		#kichi_0
	s_jsl		find_Y_l
	cpy		dummyobj
	beq		.end
	s_remove_obj	y
	
.noflagclr
.end	s_end_strat

;--------------------------------------------------------------------

kichi2_istrat
	s_start_Strat
;	s_set_altype	x,gnd
	jml	nocoll_istrat

;--------------------------------------------------------------------

snake_istrat
	s_start_strat
	s_set_alptrs	x,.strat,hitflash_istrat,.explode
	s_set_aldata	x,#seadragonHP,#seadragonAP
	s_set_colltype	x,ENEMY1
	s_make_splash	x
	s_set_objtobeplayer	y
	s_cmp_alvars	W,x,al_worldx,y,al_worldx
	s_bmi		.otherway
	s_add_alvar	B,x,al_roty,#-deg90
	bra		.notthatway
.otherway
	s_add_alvar	B,x,al_roty,#deg90
.notthatway
.strat
	s_start_strat
	ldy	al_ptr,x
	a16
	lda.w	al_ptr,y
	cmp	#-1
	a8
	s_beq	.underwater

	s_jmp_alsflag		x,sflag1,.dootherthing
	s_set_objtobeplayer	y
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,1
	bra			.otherthang
.dootherthing
	jsr		.getneck
	cpy		#-1
	beq		.otherthang
	s_copy_rots	x,y
	s_add_alvar	B,x,al_roty,#deg180
	s_neg_alvar	B,x,al_rotx
	s_add_alvar	B,x,al_rotx,#-deg90-deg22
.otherthang

	jsr	.getneck

	lda.w	al_animframe,y
	and	#127
	asl	a
	sta	y1
	asl	a
	asl	a
	adc	y1
	adc	#-40
	eor	#255
	inc	a
	sta	y1

	s_add_roffs2pos	B,x,y,y,#0,y1,#-10,1,1,1,0,0,0


	lda	al_sbyte2,x
	beq	.notsnakey
	cmp	#1
	bne	.notfire

	s_jmp_notdelay		4,.notsnakey
	s_make_obj		#firebreath,.notsnakey
	jsr			d2copypos_yx
	jsr			d2copyrots_yx
	s_set_strat		y,firebreathe2_istrat
	s_set_alvar		B,y,al_vel,#120
	trigse		$2e

	bra	.notsnakey
.notfire
	dec	a
	sta	al_sbyte2,x
.notsnakey

.end
	s_end_strat
.remove	s_remove_obj	x
	jmp		.end

.explode
	s_jmp_alsflag	x,sflag1,.dontdothat
	jsr		.getneck
	s_set_alsflag	y,sflag5	; sink it back down
.dontdothat
	s_set_alvar	W,x,al_ptr,#0
	s_set_expstrat	x,explode_istrat
	jml		explode_istrat

;- - - - - - - - - - - - -
.underwater
	s_set_strat	x,.swimabit
	s_jsl	enemydownsea_l
	s_set_alvar	W,x,al_shape,#nullshape
	s_copy_rots	x,y
	s_set_alvar	B,x,al_vel,#-20
	s_set_alvar	B,x,al_sbyte1,#10
	s_set_alvar	B,x,al_rotx,#0
	s_gen_vecs		x,al_roty,al_vel
.swimabit	s_start_strat
	s_add_vecs2pos	x
	s_beqdec_alvar	B,x,al_sbyte1,.startnextneck
	s_end_Strat
.startnextneck
	s_add_alvar	B,x,al_roty,#deg180
	s_set_objtobeplayer	y
	s_obj2obj_angle	x,y,al_roty,1
	s_add_alvar	B,x,al_roty,#deg180

	s_make_obj	#nullshape,.dekinai
	jsr			d2copypos_yx
	jsr		d2copyrots_yx
	s_set_strat	y,lochnessmonster_istrat
	s_set_alvar	W,y,al_worldy,#0
	s_copy_alvar2alvar B,y,al_sword1+1,x,al_sbyte3
	s_jsl	enemyupsea_l

.dekinai	s_jmp		.remove
;- - - - - - - - - - - - -
.getneck
	ldy	al_ptr,x
	s_beq	.removeit

	a16
	lda.w	al_ptr,y
	beq	.daijobu
	tay		; get next neck piece if need be
	sta	al_ptr,x
.daijobu	a8
	rts
.removeit	ply
	jmp	.remove


;--------------------------------------------------------------------
	strats_end








