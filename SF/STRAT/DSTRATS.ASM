;**************************************************************************
;*                                                                         *
;*                               Star Fox                                 *
;*                              ----------                                 *
;*                                                                         *
;*                           SuperNES version.                             *
;*                                                                         *
;*                           Argonaut Software.      		      *	   
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   File: DSTRATS.ASM                                                     *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr: DYLAN'S STRATEGY ROUTINES.                                      *
;*_________________________________________________________________________*
;*                                                                         *
;*   Date: 31/1/92                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;* Author:		Dylan Cuthbert.      				      *	
;*                                                                         *
;***************************************************************************


; ---- public routines:
; set_restart_position_l	; a.w = current mapptr ; saves current level info
; restart_l			; restarts at the last saved point
; remove_alptrs_l		; removes (zeros) any alptrs pointing to x
; find_alptr_l		; finds an alptr pointing to x (returns y, dummyobj if not found)
; find_y_l			; searches alienblocks for the shape in y (returns y)
; find_sword1_l		; same as alptr but is sword1
; kill_alptr_list_y		; y is first object in list (does kill_obj on all)
; moveobjtoend_l		; moves x to the end of the alienblock list
; positional_l		; (see fling.positional)

; ---- local routines:
; copypos_yx			; s_copy_pos		y,x
; dobj2obj3dangle_xy		; s_obj2obj_3dangle	x,y,al_roty,al_rotx,0
; drotsflat_x		; s_rots_flat		x
; daddvec2pos_x		; s_add_vecs2pos	x
; dincanim_x			; s_add_anim		x,#1,A.b
; dincanimjmp_x		; s_add_anim		x,#1,A.b,... returns C if jump
; ddecanim_x			; s_add_anim		x,#-1,A.b
; dzdistless			; longa
			; s_set_objtobeplayer	y
			; s_jmp_zdistless	x,y,A.w,... returns in a8 C if jump
; dfallyvec_x		; s_falldown_Yvec	x,2,#4,#0,... returns C

	INCPUBLICS	EXT\dstrats.ext

	strats_start

here12

sproutHP	equ	10
sproutAP	equ	4
armHP	equ	hardHP
armAP	equ	10
flingboss2HP	equ	80
flingboss1HP	equ	24
flingbossAP	equ	32
eggHP	equ	1
eggAP	equ	8
firebreathAP	equ	8
chickHP	equ	2
chickAP	equ	8
chickenbodyHP equ	64
chickenbodyAP equ	hardAP
chickenheadHP equ	4
chickentailHP	equ	2
madbikerHP	equ	10
madbikerAP	equ	4
madtruckerHP	equ	64
madtruckerAP	equ	2
barrierHP	equ	6
barrierAP	equ	12
castanetAP	equ	10
castanetHP	equ	120
ringlaserAP	equ	7
propturretHP	equ	20
propturretAP	equ	4
kingheadHP	equ	10
kingheadAP	equ	10
airshipAP	equ	hardAP
airshipHP	equ	hardHP
z5aHP	equ	10
z5aAP	equ	4
butteryHP	equ	20
butteryAP	equ	8
ironballAP	equ	6
bossffeetHP	equ	80
bossfheadHP	equ	6
bossfheadAP	equ	10
bossfheadHP2	equ	60
minicastanetHP equ	2
minicastanetAP equ	8
tree1HP	equ	hardHP
tree1AP	equ	8
seaneckHP	equ	hardHP
seaneckAP	equ	16



;- - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	shorta
	longi
copypos_yx
	s_copy_pos	y,x
	s_rts

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - -
dobj2obj3dangle_xy
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,0
	s_rts
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - -
drotsflat_x
	s_rots_flat	x
	s_rts

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - -
daddvecs2pos_x
	s_add_vecs2pos	x
	s_rts

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - -
positional_l
	jsr	fling.positional
	rtl
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - -
dincanim_x
	sta	x1
	s_add_anim	x,#1,x1
	s_rts

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - -
dincanimjmp_x
	sta	x1
	s_add_anim	x,#1,x1,.sec
	clc
	s_rts
.sec	sec
	s_rts

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - -
ddecanim_x
	sta	x1
	s_add_anim	x,#-1,x1
	s_rts

dzdistless_l
	jsr	dzdistless
	rtl
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	longa
dzdistless	sta	x1
	s_set_objtobeplayer	y
	s_jmp_zdistless		x,y,x1,.sec
	a8
	clc
	s_rts
.sec	a8sec
	s_rts

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - -
dfallyvec_x
	s_falldown_Yvec		x,2,#4,#0,.ok
	clc
	s_rts
.ok	sec
	s_rts
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	longa
truck_accel
	bmi	.addz
	lda	al_sword1,x
	clc
	adc	#-2
	bpl	.nomoremove
	cmp	#-20
	bcs	.nomoremove
	lda	#-20
	bra	.nomoremove
.addz	lda	al_sword1,x
	clc
	adc	#1
	bmi	.nomoremove
	cmp	#10
	bcc	.nomoremove
	lda	#10
.nomoremove	sta	al_sword1,x
	clc
	adc	al_worldz,x
	sta	al_worldz,x
	a8
	rts

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	IFEQ	1
turret1_istrat
	s_start_strat
	s_set_alptrs	x,turret1_strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#turretHP,#turretAP
	s_initface_player	x

turret1_strat
	s_start_strat
	s_damagefire		x,#turretHP-1,40,#0,#-44,#0,0
	s_set_objtobeplayer	y
	s_jmp_distmore		x,y,#TURRETDIST,.missit
	s_face_player		x,1,0,.fireit
	s_end_strat
.fireit
	s_jmp_onfire		x,.missit
	s_jmp_notdelay		4,.missit
;	s_weapon_pos		#0,#-30/2,#0
;	s_weapon_rot		#0,#0
;	s_fire_weapon		x,STARWARS
.missit
	s_end_strat

	ENDC

	IFEQ	1

flower1_istrat
	s_start_strat
	s_set_alptrs	x,flower1_strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#flowerHP,#flowerAP
	s_set_alvar	B,x,al_vel,#0


flower1_strat
	s_start_strat
	s_damagefire		x,#flowerHP-1,4,#0,#-20,#0,0
	s_add_alvar	B,x,al_roty,#6

	s_jmp_notdelay		5,.missit

	s_weapon_pos		#0,#-15/2,#0
	s_weapon_rot		#0,#0
	s_set_alvar		B,x,al_rotx,#-deg90/6
	s_set_alvar		B,x,al_rotz,#deg90
	s_fire_weapon		x,SLOWELASER
	s_set_alvar		B,x,al_rotx,#0
	s_set_alvar		B,x,al_rotz,#0
.missit
	s_end_strat


motherf_istrat
	s_start_strat
	s_set_alptrs	x,motherf_strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#150,#0
	s_set_alvar	B,x,al_type,#atgnd
;	s_set_alsflag	x,colldisable
	s_set_alsflag	x,shadow
	
	s_set_colltype	x,ENEMY1

motherf_strat
	s_start_strat

	s_set_objtobeplayer	y
	s_jmp_distmore	x,y,#MOTHERDIST,.miss
	s_add_playerz	x
	s_add_alvar	W,x,al_worldz,#5
	s_end_strat
.miss	s_set_strat	x,motherf3_strat
	s_set_alvar	B,x,al_sbyte1,#MOTHERcnt
motherf3_strat
	s_start_strat
	s_add_playerz	x
	s_beqdec_alvar	B,x,al_sbyte1,motherf2_istrat

	s_bemother		x

	s_end_strat

;	s_jmp_notdelay	6,.end


;	s_make_obj		#starbull,.end
;	s_copy_pos		y,x
;	tyx
;	s_jmp		lowerbull_istrat

;.end	s_end_strat


motherf2_istrat
	s_set_strat	x,motherf2_strat
	s_add_alvar	B,x,al_roty,#1
	s_end_strat
motherf2_strat
	s_start_strat
	s_bemother		x
;	s_jmp_random	.missfire,90

;	s_set_objtobeplayer	y
;	s_jmp_distless	x,y,#500,.missfire
;	s_set_alvar	B,x,al_rotx,#deg90
;	s_weapon_pos	#0,#100/2,#0
;	s_fire_weapon	x,ELASER
;	s_set_alvar	B,x,al_rotx,#0
.missfire
	s_add_playerz	x
	s_cmp_alvar	B,x,al_roty,#0
	s_beq		.miss
	s_add_alvar	B,x,al_roty,#1
	s_end_strat
.miss
	s_add_alvar	W,x,al_worldz,#-10
	s_set_alvar	B,x,al_type,#atgnd+atzremove
	s_end_strat


shadow1_istrat
	s_start_strat
	s_set_alptrs	x,shadow1_strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#100,#0
	s_set_alvar	B,x,al_type,#atgnd
	s_set_alsflag	x,colldisable
	
shadow1_strat
	s_start_strat
	s_set_objtobeplayer	y
	s_jmp_distmore	x,y,#MOTHERDIST,.miss
	s_add_playerz	x
	s_add_alvar	W,x,al_worldz,#5
	s_end_strat
.miss	s_set_strat	x,shadow13_strat
	s_set_alvar	B,x,al_sbyte1,#MOTHERCNT

shadow13_strat
	s_start_strat	
	s_add_playerz	x
	s_beqdec_alvar	B,x,al_sbyte1,shadow12_istrat

	s_jsr		shadow_srou
	s_end_strat

shadow12_istrat
	s_set_strat	x,shadow12_strat
	s_sub_alvar	W,x,al_worldz,#30<<4
	s_set_alvar	W,x,al_shape,#shadow2
	s_add_alvar	B,x,al_roty,#1
shadow12_strat
	s_start_strat
	s_cmp_alvar	B,x,al_roty,#0
	s_beq		.miss
	s_add_playerz	x
	s_add_alvar	B,x,al_roty,#1
	s_jsr		shadow_srou
	s_end_strat
.miss
	s_add_alvar	W,x,al_worldz,#30<<4
	s_set_alvar	W,x,al_shape,#shadow1
	s_set_strat	x,shadow14_strat
shadow14_strat
	s_start_strat
	s_add_playerz	x
	s_add_alvar	W,x,al_worldz,#-10
	s_set_alvar	B,x,al_type,#atgnd+atzremove
	s_jsr		shadow_srou
	s_end_strat


shadow_srou
	phx
	a16
	ldx	allst
	beq	.finished
.again
	lda	al_shape,x
	cmp	#motherf
	beq	.found
	lda	_next,x
	tax
	bne	.again
.finished
	a8
	plx
	s_remove_obj		x
	rts
.found	a8
	plx
	rts

lowerbull_istrat
	s_start_strat
	s_set_alptrs	x,lowerbull_strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#10,#0
	s_set_alvar	B,x,al_type,#atzremove
	s_set_alsflag	x,shadow
	s_initface_player	x


lowerbull_strat
	s_start_strat
	s_face_player	x,4,0,.norm
.norm	s_add_playerz	x
	s_add_alvar	W,x,al_worldy,#40
	s_jmp_higher	x,#-100,.end
	s_jmp		starbull_istrat
.end	s_end_strat


	ENDC


;------------------------------------------------------------


fly_istrat
	s_start_strat
	s_set_alptrs	x,fly_strat,hitflash_istrat,flydead_istrat
	s_set_colltype	x,ENEMY1
	s_set_aldata	x,#flyHP,#flyAP
	s_set_alvar	B,x,al_sbyte1,#-1
	s_leftview_strat	x,.missset
	s_set_alvar	B,x,al_sbyte1,#1
.missset	s_set_alvar	W,x,al_sword1,#-30
	s_set_alvar	B,x,al_sbyte2,#flyFC	; fire count
	s_set_alsflag	x,shadow



fly_strat
	s_start_strat
	s_jmp_notdelay	1,.noadd
	s_add_alvar	B,x,al_rotz,al_sbyte1
	s_add_alvar	B,x,al_rotx,#-1
	s_add_alvar	W,x,al_sword1,#2
	s_bmi		.noadd

	s_jmp		flylr_istrat

.noadd	s_sub_alvars	W,x,al_worldz,x,al_sword1
	s_add_playerz	x

	s_end_strat


flylr_istrat
	s_start_strat
	s_set_alvar	B,x,al_vel,#10
	s_copy_alvar2alvar	W,x,al_sword1,x,al_worldx
	s_copy_alvar2alvar	W,x,al_ptr,x,al_worldy
	s_set_alvar	B,x,al_sbyte1,#-32
	s_rightview_strat	x,flyr_istrat
	s_set_alvar	B,x,al_sbyte1,#32

flyr_istrat
	s_start_strat
	s_set_strat	x,flyr_strat
	s_set_alsflag	x,shadow
flyr_strat
	s_start_strat
	s_jsr		dgen3dvecs
	s_jsr		daddvecs2pos_x
	s_add_playerz	x
	s_copy_alvar2var	B,x,svar_byte1,al_sbyte1
	s_achase_alvar	B,x,al_roty,svar_byte1,1,.fin
.fin
	s_achase_alvar	B,x,al_vel,#40,3,.fin2
.fin2
	s_set_objtobeplayer	y
	s_jmp_distmore	x,y,#1000,fly2_istrat
	s_end_strat


dgen3dvecs	s_gen_3dvecs	x,al_roty,al_rotx,al_vel
	s_rts

dgenvecs	s_gen_vecs	x,al_roty,al_vel
	s_rts

highfly_istrat
	s_start_strat
	s_set_alsflag	x,shadow
	s_set_alptrs	x,0,hitflash_istrat,flydead_istrat
	s_set_aldata	x,#flyHP,#flyAP

	s_set_alvar	B,x,al_sbyte2,#flyFC	; fire count

;	s_copy_alvar2alvar	W,x,al_sword1,x,al_worldx
;	s_copy_alvar2alvar	W,x,al_ptr,x,al_worldy

	s_set_alvar2rnd	x,al_sword1
	s_set_alvar2rnd	x,al_sword1+1,#1	; x = 0-512
	s_sub_alvar	W,x,al_sword1,#256	; x = -256>255

	s_set_alvar2rnd	x,al_ptr,#63
	s_set_alvar	B,x,al_ptr+1,#0
	s_sub_alvar	W,x,al_ptr,#80		; y = -16>-80
	s_set_colltype	x,ENEMY1
	s_jmp		fly2_istrat

distantfly_istrat
	s_start_strat
	s_set_alsflag	x,shadow
	s_set_alptrs	x,0,hitflash_istrat,flydead_istrat
	s_set_aldata	x,#flyHP,#flyAP

	s_set_alvar	B,x,al_sbyte2,#flyFC	; fire count
	s_copy_alvar2alvar	W,x,al_sword1,x,al_worldx
	s_copy_alvar2alvar	W,x,al_ptr,x,al_worldy
	
fly2_istrat
	s_start_strat
	s_set_strat	x,fly2_strat
fly2_strat
	s_start_strat
	s_set_objtobeplayer	y
	s_add_playerz	x
	s_copy_alvar2var	W,x,svar_word1,al_sword1
	s_copy_alvar2var	W,x,svar_word2,al_ptr
	s_set_WP		x,y,1,svar_word1,svar_word2,#flyDIST
	s_goto_WP		x,x,1,#40,5,3,0,#500,#0,.chk1
	s_end_strat

.chk1

fly3_istrat
	s_start_strat
	s_set_alsflag	x,shadow
	s_set_strat	x,fly3_strat
	s_initface_player	x
	s_end_strat
fly3_strat
	s_start_strat
	s_face_player	x,1,0,.fireit
	s_add_playerz	x
	s_end_strat
.fireit
	s_jmp_notdelay	5,.missfire
	s_zero_vecs	x
	s_weapon_pos		#0,#0,#0
	s_weapon_rot		#0,#0
	s_fire_weapon	x,ELASER
	s_decbne_alvar	B,x,al_sbyte2,fly2_istrat
	s_jmp		fly4_istrat
.missfire
	s_add_playerz	x
	s_end_strat


fly4_istrat
	s_start_strat
	s_set_alsflag	x,shadow
	s_set_strat	x,fly4_strat
	s_set_alvar	B,x,al_vel,#5
	s_set_lifecnt	x,#100
fly4_strat
	s_start_strat

	s_dec_lifecnt	x
	s_jsr		dgen3dvecs
	s_jsr		daddvecs2pos_x
	s_achase_alvar	B,x,al_rotx,#-10,4
	s_achase_alvar	B,x,al_roty,#0,4
	s_speedto		x,#30,5
	s_add_playerz	x

	s_damagesmoke		x,#1,2

	s_end_strat

flydead_istrat
	s_start_strat
	s_set_expstrat	x,flydead_strat
flydead_strat
	s_start_strat
	s_set_alvar	B,x,al_rotx,#64
	s_speedto		x,#30,2
	s_jsr		dgen3dvecs
	s_jsr		daddvecs2pos_x
	s_jmp_lower	x,#0,flyhitgnd_istrat
	s_end_strat

flyhitgnd_istrat
	s_start_strat
	s_clr_alsflag	x,shadow
	s_set_expstrat	x,flyhitgnd_strat
	s_zero_vecs	x
	s_set_alvar	W,x,al_worldy,#0
	s_init_anim		x,#0
	s_set_alvar	B,x,al_rotx,#0
	s_end_strat
flyhitgnd_strat
	s_start_strat
	s_damagefire		x,#10,4
	s_end_strat



;--------------------------------------------------------------------------




cubefall_istrat
	s_start_strat
	s_set_alsflag	x,shadow
	s_set_alptrs	x,cubefall_strat,cubecoll_strat,cubeexp_strat
	s_set_aldata	x,#cubeHP,#cubeAP
	s_set_colltype	x,ENEMY1
cubefall_strat
	s_start_strat

	s_jsr	drotsflat_x

	s_falldown_Yvec	x,1,#1,#0
	s_jsr		daddvecs2pos_x

	s_end_strat

cubeexp_strat
	s_start_strat
	s_remove_obj	x
	s_end_strat

cubecoll_strat
	s_start_strat
	s_docoll		x,#framesperAP
	s_clr_alsflag	x,collide
	s_jmpto_strat	x


;--------------------------------------------------------------------------

	IFEQ	0

saucer1_istrat
	s_start_strat
	s_set_alptrs	x,saucer1_strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#saucer1HP,#saucer1AP

	s_set_alvar	B,x,al_sbyte2,#saucer1FC	; fire count

	s_copy_alvar2alvar	W,x,al_sword1,x,al_worldx
	s_copy_alvar2alvar	W,x,al_ptr,x,al_worldy
	s_set_alsflag	x,shadow
	s_init_anim		x,#0
	
saucer1_strat
	s_start_strat
	s_add_playerz	x
	s_cmp_anim		x,#0
	s_beq		.carryon
	lda	#7
	s_jsr	ddecanim_x
	s_jmp		.end
.carryon
	s_set_objtobeplayer	y
	s_copy_alvar2var	W,x,svar_word1,al_sword1
	s_copy_alvar2var	W,x,svar_word2,al_ptr
	s_set_WP		x,y,1,svar_word1,svar_word2,#flyDIST
.here
	s_goto_WP		x,x,1,#40,2,3,0,#500,#0,.chk1
.end	s_end_strat
.chk1
;	?*-.here
saucer1_istrat2
	s_start_strat
	s_set_strat	x,saucer1_strat2
	s_initface_player	x
saucer1_strat2
	s_start_strat
	s_face_player	x,2,0,saucer1_istrat3
	s_add_playerz	x
	s_end_strat

saucer1_istrat3
	s_start_strat
	s_set_strat	x,saucer1_strat3
saucer1_strat3
	s_start_strat
	s_add_playerz	x
	s_add_alvar	B,x,al_rotz,#10
	s_cmp_anim		x,#6
	s_beq		.miss
	lda	#7
	s_jsr	dincanim_x
	s_bra		.miss2
.miss
	s_jmp_notdelay	5,.miss2
	s_weapon_pos	#0,#0,#0
	s_weapon_rot	#0,#0
	s_fire_weapon	x,ELASER
	s_decbne_alvar	B,x,al_sbyte2,.missset
	s_set_strat	x,saucer1_istrat4
	s_bra		.miss2
.missset
	s_set_strat	x,saucer1_strat
.miss2
	s_end_strat

saucer1_istrat4
	s_start_strat
	s_set_strat	x,saucer1_strat4
	s_set_alvar	B,x,al_vel,#0
	s_set_lifecnt	x,#100
saucer1_strat4
	s_start_strat

	s_add_playerz	x

	s_achase_alvar	B,x,al_rotx,#-10,1
	s_achase_alvar	B,x,al_roty,#0,3,.fin

	s_cmp_anim		x,#0
	s_beq		.end
	lda	#7
	s_jsr	ddecanim_x
	s_bra		.end
.fin
	s_jsr		dgen3dvecs
	s_jsr		daddvecs2pos_x
	s_inc_alvar	B,x,al_vel
	s_dec_lifecnt	x
.end
	s_end_strat


	ENDC

;-------------------------------------------------------------------------

	IFEQ	1

airship_istrat

	s_start_strat
	s_set_alsflag	x,shadow
	s_set_alptrs	x,airship_strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#airshipHP,#airshipAP
airship_strat
	s_start_strat
	s_set_objtobeplayer	y
	s_jmp_distless	x,y,#2000,airship2_istrat
	s_add_alvar	W,x,al_worldz,#-10
	s_add_playerz	x
	s_end_strat

airship2_istrat
	s_start_strat
	s_set_strat	x,airship2_strat
airship2_strat
	s_start_strat
	s_add_playerz	x
	s_add_alvar	B,x,al_roty,#2
	s_cmp_alvar	B,x,al_roty,#deg90/4
	bcs		airship3_istrat
	s_end_strat


airship3_istrat
	s_start_strat
	s_set_strat	x,airship3_strat
	s_set_alvar	B,x,al_vel,#10
	s_gen_vecs		x,al_roty,al_vel
airship3_strat
	s_start_strat
	s_jsr		daddvecs2pos_x
	s_add_playerz	x
	s_bemother		x
	s_end_strat

	ENDC





;------------------------------------------------------------------------


pillar3_istrat
	s_start_strat
	s_set_alptrs	x,pillar3_strat,hitflash_istrat,pillar3explode_istrat
	s_set_aldata	x,#pillar3HP,#pillar3AP
pillar3_strat
	s_start_strat
	s_set_objtobeplayer	y
	s_jmp_distless	x,y,#pillar3DIST,pillar3fall_i
	s_jmp_alvarless	B,x,al_hp,#pillar3fallHP,pillar3fall_i
	s_test_hitflags	x,#HF2
	s_bne		pillar3fall_i
	s_end_strat

pillar3fall_i
	s_set_strat	x,pillar3fall_strat
	s_set_alsflag	x,nohitaffect
	s_set_alsflag	x,shadow
	s_set_alvar	B,x,al_sbyte1,#4
	s_rightview_strat	x,.misset
	s_set_alvar	B,x,al_sbyte1,#-4
.misset
	s_set_alvar	B,x,al_sbyte2,#16
	s_make_obj		#bouncyball,.end
	s_jsr			copypos_yx
	s_copy_pos		y,x
	s_sub_alvar		W,y,al_worldz,#10
	s_set_alptrs		y,explode_istrat,explode_istrat,explode_istrat
	s_kill_obj		y
.end	s_end_strat
pillar3fall_strat
	s_start_strat

	s_copy_alvar2var	B,x,svar_byte1,al_sbyte1
	s_add_alvar	B,x,al_rotz,svar_byte1
	s_dec_alvar	B,x,al_sbyte2
	s_beq		pillar3stay_istrat
	s_end_strat

pillar3stay_istrat
	s_start_strat
	s_clr_alsflag	x,nohitaffect
	s_clr_alsflag	x,shadow
	s_set_strat	x,pillar3stay_strat
	trigse	$49
pillar3stay_strat
	s_start_strat
	s_end_strat



;-----------------------------------------------------------------------
	IFEQ	1
floor1_istrat
	s_start_strat
	s_set_alptrs	x,floor1_strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#floor1HP,#floor1AP
	s_init_anim		x,#0

floor1_strat
	s_start_Strat

	s_set_objtobeplayer	y
	s_jmp_distless	x,y,#floor1DIST,floor1rise_i

	s_end_Strat

floor1rise_i
	s_set_strat	x,floor1rise_strat
floor1rise_strat
	s_Start_Strat
	s_cmp_anim		x,#6
	s_beq		.end
	s_add_anim		x,#2,#8
.end	s_end_strat

	ENDC
;------------------------------------------------------------------------

walking_istrat
	s_start_Strat
	s_set_alptrs	x,walking_strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#200,#walkingAP
	s_set_alvar	B,x,al_roty,#4
	s_set_alvar	B,x,al_vel,#medpspeed+10
	s_gen_vecs		x,al_roty,al_vel
	s_set_alvar	B,x,al_type,#0
	s_set_alvar	B,x,al_sbyte1,#200
	s_set_alvar	B,x,al_sbyte2,#4
	s_set_alvar	B,x,al_sbyte3,#4
	s_set_alsflag	x,shadow
	set_sound2	x,#$d

walking_strat
	s_start_strat
	s_jsr		daddvecs2pos_x
	s_beqdec_alvar	B,x,al_sbyte1,.walking2_i

	s_jmp		walking_hit

.walking2_i
	s_set_strat	x,walking2_strat
	s_set_alvar	B,x,al_type,#atzremove

walking2_strat
	s_start_strat
	s_gen_vecs		x,al_roty,al_vel
	s_jsr		daddvecs2pos_x
	s_cmp_alvar	B,x,al_roty,#128
	s_beq		.dontadd
	s_add_alvar	B,x,al_roty,#-4
.dontadd	s_cmp_alvar	B,x,al_vel,#10
	s_bcc		.miss
	s_sub_alvar	B,x,al_vel,#4
.miss

walking_hit
	s_test_hitflags	x,#HF1
	s_beq		.notleftleg
	s_clr_hitflags	x,#HF1
	s_beqdec_alvar	B,x,al_sbyte2,walking_right
.notleftleg	s_test_hitflags	x,#HF2
	s_beq		.notrightleg
	s_clr_hitflags	x,#HF2
	s_beqdec_alvar	B,x,al_sbyte3,walking_left

.notrightleg	s_test_hitflags	x,#HF3
	s_beq		.nothead
	s_clr_hitflags	x,#HF3
.nothead
	s_end_strat

walking_right
	s_set_alvar	B,x,al_sbyte1,#-2
	s_set_alvar	B,x,al_sbyte3,#1
	s_set_alvar	W,x,al_shape,#walker_r
	s_add_Roffs2pos	B,x,x,x,#25,#0,#0,1,1,1,1,1,1

	s_make_obj		#explosion,.nocreate
	s_add_Roffs2pos	B,y,x,x,#-50,#-40,#0,1,1,1,1,1,1
	s_set_alptrs	y,explode_istrat,explode_istrat,explode_istrat
	s_kill_obj		y
.nocreate
	s_jmp		walking_fall
walking_left
	s_set_alvar	B,x,al_sbyte1,#2
	s_set_alvar	B,x,al_sbyte3,#-1
	s_set_alvar	W,x,al_shape,#walker_l
	s_add_Roffs2pos	B,x,x,x,#-25,#0,#0,1,1,1,1,1,1

	s_make_obj		#nullshape,.nocreate
	s_add_Roffs2pos	B,y,x,x,#50,#-40,#0,1,1,1,1,1,1
	s_set_alptrs	y,explode_istrat,explode_istrat,explode_istrat
	s_kill_obj		y
.nocreate
walking_fall
	s_set_strat	x,wobble_strat
	s_set_alvar	B,x,al_sbyte2,#5

wobble_strat
	s_start_strat
	s_sub_alvars	B,x,al_rotz,x,al_sbyte3
	s_neg_alvar	B,x,al_sbyte3
	s_beqdec_alvar	B,x,al_sbyte2,fellit
	s_sub_alvars	B,x,al_roty,x,al_sbyte1
	s_end_strat

fellit	s_set_strat	x,fallover_strat
	s_set_alvar	B,x,al_sbyte2,#7
fallover_strat
	s_start_strat
;	s_sub_alvars	B,x,al_roty,x,al_sbyte1
	s_sub_alvars	B,x,al_rotz,x,al_sbyte1
	s_sub_alvars	B,x,al_sbyte1,x,al_sbyte3
	s_beqdec_alvar	B,x,al_sbyte2,.killit
	s_end_strat
.killit	s_make_obj		#explosion,.nocreate
	s_add_Roffs2pos	B,y,x,x,#0,#-80,#0,1,1,1,1,1,1
	s_set_alptrs	y,explode_istrat,explode_istrat,explode_istrat
	s_kill_obj		y

.nocreate
	s_kill_obj		x
	s_end_strat

;-------------------------------------------------------------

wallleftright_istrat
	s_start_strat
	s_init_anim		x,#0
	s_set_alptrs	x,wall2_strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#-1,#wall1AP
	s_set_alvar	B,x,al_roty,#deg180
	s_init_colanim	x,#0

wall2_strat
	s_start_strat
	s_test_hitflags	x,#HF1
	s_bne		wallnothit
	s_add_colanim	x,#1,#4
	s_jmp_notdelay	4,wallnothit
	s_jmp		wallchk

wallrnd_istrat
	s_start_strat
	s_jmp_random	wallr_istrat
walll_istrat
	s_start_strat
	s_init_anim		x,#1
	s_bra		wallin
wallr_istrat
	s_start_strat
	s_init_anim		x,#0
wallin	s_set_alptrs	x,wall1_strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#hardHP,#wall1AP
	s_set_alvar	B,x,al_roty,#deg180
	s_init_colanim	x,#4
	s_set_alsflag	x,nohitaffect

wall1_strat
	s_start_Strat
	s_beqdec_alvar	B,x,al_sbyte4,.noinc
.noinc	s_add_colanim	x,#1,#8
	s_cmp_colanim	x,#4
	bcs		.ok
	s_init_colanim	x,#4
.ok	s_test_hitflags	x,#HF1
	s_beq		wallnothit

	s_clr_hitflags	x,#HF1

	s_jmp_alvarNOTZERO	B,x,al_sbyte4,wallnothit
	s_set_alvar	B,x,al_sbyte4,#10
wallchk
	lda	al_animframe,x
	eor	#1
	sta	al_animframe,x

	trigse	$57

wallnothit
	s_set_objtobeplayer	y
	s_jmp_distless	x,y,#wall1DIST,walllr_i

	s_end_Strat

walllr_i
	s_cmp_anim		x,#0
	s_beq		wallright_i
wallleft_i
	s_set_strat	x,wallleft_strat
	s_set_alvar	W,x,al_shape,#wall_l
	jsl		movewallsound_l
wallleft_strat
	s_start_strat
	s_cmp_alvar	B,x,al_roty,#-64
	s_beq		.noadd
	s_add_alvar	B,x,al_roty,#16
.noadd
	s_end_strat


wallright_i
	s_set_strat	x,wallright_strat
	s_set_alvar	W,x,al_shape,#wall_r
	jsl		movewallsound_l
wallright_strat
	s_start_strat
	s_cmp_alvar	B,x,al_roty,#64
	s_beq		.noadd
	s_add_alvar	B,x,al_roty,#-16
.noadd
	s_end_strat


;---------------------------------------------------------------

	IFEQ	1

hider_istrat
	s_set_alptrs	x,hider_strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#hiderHP,#hiderAP
	s_init_anim		x,#0
	s_set_alvar2rnd	x,al_sbyte1
	s_set_alvar2rnd	x,al_sbyte2
	s_set_alvar2rnd	x,al_sbyte3,#7
	s_add_alvar	B,x,al_sbyte3,#4
	s_set_colltype	x,ENEMY1
hider_i
	s_start_strat
	s_set_alvar2rnd	x,al_sword1,#15
	s_add_alvar	B,x,al_sword1,#8
	s_set_strat	x,hider_strat
hider_strat
	s_start_Strat
	s_jsr		hider_srou

	a16
	lda	#2000
	s_jsr	dzdistless
	shorta
	s_bcc	.nobra
	a16
	lda	#400
	s_jsr	dzdistless
	shorta
	bcs	.nobra

;	s_set_objtobeplayer	y
;	s_jmp_zdistmore	x,y,#2000,.nobra
;	s_jmp_zdistless	x,y,#400,.nobra
	s_beqdec_alvar	B,x,al_sword1,hider2_i
.nobra
	s_sub_alvar	W,x,al_worldz,#40
	s_end_strat
hider2_i
	s_set_strat	x,hider2_strat
	s_jmp		hider_end
hider2_strat
	s_start_strat
	s_add_playerz	x
	s_jsr		hider_srou
	s_cmp_alvar	B,x,al_roty,#128
	s_beq		hider3_i
	s_add_alvar	B,x,al_roty,#4
	s_end_strat
hider3_i
	s_set_strat	x,hider3_strat
	s_set_alvar	B,x,al_sword1,#32
	s_jmp		hider_end
hider3_strat
	s_start_strat
	s_jsr	drotsflat_x
	s_jsr		hider_srou
	s_add_alvar	B,x,al_sbyte1,#4
	s_beqdec_alvar	B,x,al_sword1,hider4_i
	s_add_alvars	B,x,al_sbyte2,x,al_sbyte3
	s_add_playerz	x

	lda	#16
	s_jsr	dincanimjmp_x
	bcs	.resetit
	s_jmp		hider_end
.resetit	s_init_anim		x,#8
	s_weapon_pos	#0,#15,#0
	s_set_objtobeplayer	y
	s_weapon_rots2obj	y
	s_fire_weapon	x,RELSLOWELASER
	
hider_end	s_end_strat

hider4_i
	s_set_strat	x,hider4_strat
	s_jmp		hider_end
hider4_strat
	s_start_Strat
	s_add_playerz	x
	s_jsr		hider_srou
	s_add_alvar	B,x,al_sbyte1,#4
	s_add_alvars	B,x,al_sbyte2,x,al_sbyte3
	s_cmp_anim		x,#0
	s_beq		.rotit
	s_jmp_notdelay	1,.missit
	lda	#16
	s_jsr	ddecanim_x
.missit	s_end_Strat
.rotit	s_cmp_alvar	B,x,al_roty,#0
	s_beq		.hider5_i
	s_add_alvar	B,x,al_roty,#4
	s_bra		.missit
.hider5_i	s_set_strat	x,hider_i
	s_bra		.missit

hider_srou
	s_set_alvar2alvartab	B,B,W,x,al_worldy,x,al_sbyte1,sintab,0
	s_set_alvar2alvartab	B,B,W,x,al_worldx,x,al_sbyte2,sintab,0
	s_add_alvars	W,x,al_worldx,x,al_worldy
	s_set_objtobeplayer	y
	s_add_alvars	W,x,al_worldy,y,al_worldy
	s_rts

	ENDC
;---------------------------------------------------------------

	IFEQ	0

searchmeteor_istrat
	s_start_strat
	s_sprite_obj	x,#0
	s_set_alptrs	x,.strat,hitflash_istrat,explode_istrat	meteorcol_istrat,meteorexp_istrat
	s_set_aldata	x,#meteorHP,#meteorAP
	s_set_alvar2rnd	x,al_vel,#7
	s_set_alvar2rnd	x,al_sbyte1,#3
	s_set_alvar2rnd	x,al_roty
	s_cmp_alvar	B,x,al_roty,#128
	s_bcc		.oneway
	s_neg_alvar	B,x,al_sbyte1
.oneway
	s_jmp_random	.noclear
	s_set_alvar	B,x,al_sbyte1,#0
.noclear
	s_set_objtobeplayer	y
	s_jsr		dgen3dvecs
	s_jsr		dobj2obj3dangle_xy
	s_jsr		drotsflat_x
	s_set_colltype	x,ENEMY1
	s_set_alsflag	x,nohitaffect
.strat
	s_start_Strat
	s_set_objtobeplayer	y
	s_achase_alvar2alvar.w	W,x,al_worldx,y,al_worldx,4
	s_achase_alvar2alvar.w	W,x,al_worldy,y,al_worldy,4
;	s_sub_alvar	W,x,al_worldz,#20
	s_copy_alvar2var	B,x,svar_byte1,al_sbyte1
	s_add_alvar	B,x,al_rotz,svar_byte1
	s_jsr		daddvecs2pos_x
	s_end_strat

slowmeteor_istrat
	s_start_strat
	s_sprite_obj	x,#0
	s_set_alvar	W,x,al_sword1,#20
	s_jmp		meteor_istrat.in

meteor_istrat2
	s_start_strat
	s_sprite_obj	x,#0
;	s_set_collstrat	x,hitflash_istrat
	s_set_alvar2rnd	x,al_sbyte1,#7
	s_set_alvar2rnd	x,al_roty
	s_set_alvar2rnd	x,al_vel,#15
	s_set_alvar	W,x,al_sword1,#60
	s_jmp		meteor_istrat3

meteor_istrat
	s_start_strat
	s_sprite_obj	x,#0
	s_set_alvar	W,x,al_sword1,#60
.in	LOCAL
	s_set_alptrs	x,meteor_strat,hitflash_istrat,explode_istrat	meteorcol_istrat,meteorexp_istrat
	s_set_aldata	x,#meteorHP,#meteorAP
	s_set_alvar	B,x,al_rotz,#0
	s_set_alvar2rnd	x,al_vel,#7
	s_set_alvar2rnd	x,al_sbyte1,#3
	s_set_alvar2rnd	x,al_roty
	s_cmp_alvar	B,x,al_roty,#128
	s_bcc		.oneway
	s_neg_alvar	B,x,al_sbyte1
.oneway
	s_jmp_random	.noclear
	s_set_alvar	B,x,al_sbyte1,#0
.noclear
meteor_istrat3
	s_sprite_obj	x,#0
	s_jsr		dgen3dvecs
	s_jsr	drotsflat_x
	s_set_colltype	x,ENEMY1
	s_set_alsflag	x,nohitaffect
meteor_strat
	s_start_strat
;	s_add_alvar	B,x,al_rotx,#2
	s_cmp_alvar	W,x,al_shape,#asteroid3
	s_beq		.missbit
	s_sub_alvars	W,x,al_worldz,x,al_sword1
.missbit
	s_add_alvars	B,x,al_rotz,x,al_sbyte1
	s_jsr		daddvecs2pos_x
	s_end_strat

meteorcol_istrat
	s_start_strat
	s_docoll		x,#framesperAP
	s_jmpto_strat	x

meteorexp_istrat
	s_start_strat
	s_cmp_alvar	W,x,al_shape,#asteroid3
	s_beq		explode_istrat
	s_cmp_alvar	W,x,al_shape,#asteroid4
	s_beq		explode_istrat
	s_make_obj	#asteroid3,.end
	s_jsr		copypos_yx
	s_set_strat	y,meteor_istrat2
	s_make_obj	#asteroid3,.end
	s_copy_pos	y,x
	s_set_strat	y,meteor_istrat2
.end	s_jmp		explode_istrat


	ENDC


	IFEQ	1

beamboxt_istrat
	s_start_strat
	s_set_alvar	B,x,al_rotz,#deg180
	s_bra		beambox_norm
beambox_istrat
	s_start_strat
beambox_norm	s_set_alptrs	x,beambox_strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#beamboxHP,#beamboxAP
	s_set_alvar	B,x,al_roty,#deg180
beambox_strat
	s_start_strat
	s_test_hitflags	x,#HF1
	s_beq		.boxnothit
	s_clr_hitflags	x,#HF1
	s_cmp_alvar	W,x,al_shape,#beambox2
	s_bne		.one
	s_set_alvar	W,x,al_shape,#beambox
	s_bra		.boxnothit
.one	s_set_alvar	W,x,al_shape,#beambox2
.boxnothit
	s_end_strat




swingwal_istrat
	s_start_strat
	s_set_alptrs	x,swingwal_strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#swingwalHP,#swingwalAP
	s_set_alvar	B,x,al_roty,#deg180
	s_set_alvar	B,x,al_rotx,#0
	s_set_alvar	B,x,al_sbyte1,#0
	s_set_alvar	B,x,al_sbyte2,#0

swingwal_strat
	s_start_strat
	s_test_hitflags	x,#HF1
	s_beq		.box1nothit
	s_clr_hitflags	x,#HF1
	s_beqdec_alvar	B,x,al_sbyte1,swingup_i
.box1nothit
	s_test_hitflags	x,#HF2
	s_beq		.box2nothit
	s_clr_hitflags	x,#HF2
	s_beqdec_alvar	B,x,al_sbyte2,swingdown_i
.box2nothit
	s_end_strat

swingup_i
	s_set_alvar	B,x,al_sbyte1,#4
	s_jmp		swingnorm
swingdown_i	s_set_alvar	B,x,al_sbyte1,#-4
swingnorm	s_set_strat	x,swingit_strat
	s_set_alvar	B,x,al_sbyte3,#32
	s_end_strat

swingit_strat
	s_start_strat
	s_cmp_alvar	B,x,al_sbyte3,#0
	s_beq		.nodec
	s_dec_alvar	B,x,al_sbyte3
	s_sub_alvars	B,x,al_rotx,x,al_sbyte1
	s_bra		.end
.nodec
	s_set_strat	x,swingwal_istrat
.end	s_end_strat


	ENDC

;----------------------------------------------------------------

tunnela_istrat
	s_start_strat
	s_set_alptrs	x,tunnela_strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#tunnelHP,#hardAP
	s_init_anim		x,#0
	
tunnela_strat
	s_start_strat
	lda	#16
	s_jsr	dincanim_x
	s_test_hitflags	x,#HF5
	s_beq		.end
	s_clr_hitflags	x,#HF5
	s_set_strat	x,tunnela2_strat
.end	s_end_strat

tunnela2_strat
	s_start_strat
	s_test_hitflags	x,#HF5
	s_beq		.end
	s_clr_hitflags	x,#HF5
	s_set_strat	x,tunnela_strat
.end	s_end_strat



;--------------------------------------------------------------------

iris_istrat
	s_start_strat
;--------------------------------------------------------------------
	s_jsr	fling.makeobj
	bcs	.dekinakatta

	jsr		copypos_yx
	jsr		fling.copyrots_yx
	s_set_alvar		W,y,al_shape,#iris_1
	s_set_strat		y,iris_1_istrat
	s_add_alvar		W,y,al_worldz,#100

.dekinakatta
	s_set_alvar	B,x,al_roty,#deg180
	s_set_alptrs	x,iris_strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#127,#hardAP
	s_init_anim		x,#0
iris_strat
	s_start_Strat
	s_set_objtobeplayer	y
	s_cmp_alvar	B,x,al_hp,#127-irisHP
	bcs		.miss
.animate	
	s_dooropen_snd	0

	lda	#8
	s_jsr	dincanimjmp_x
	bcs	.miss
.miss	s_end_strat


;---------------------------------------------------------------------

	IFEQ	1

swing_istrat
	s_start_strat
	s_set_alptrs	x,swing_strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#swingHP,#swingAP
	s_set_alvar	B,x,al_vel,#55
	s_set_alvar	B,x,al_roty,#3
	s_set_alvar	B,x,al_rotx,#-5
	s_jsr		dgen3dvecs
	s_init_anim		x,#0

swing_strat
	s_start_strat
	s_jsr		daddvecs2pos_x
;	s_inc_alvar	B,x,al_rotz
	s_set_objtobeplayer	y
	s_jmp_zdistmore	x,y,#700,swing_strat2_i
	s_end_strat


swing_strat2_i
	s_set_strat	x,swing_strat2
	s_end_strat
swing_strat2
	s_start_strat
	s_jsr		swing_Strat_srou
	s_add_playerz	x
	s_sub_alvar	W,x,al_worldz,#5

	a16
	lda	#660
	s_jsr	dzdistless
	shorta
	bcs	swing_strat3_i
;	s_jmp_zdistless	x,y,#660,swing_strat3_i
	s_dec_alvar	B,x,al_rotx

	s_end_strat

swing_strat3_i
	s_set_strat	x,swing_strat3
	s_end_strat
swing_strat3
	s_start_strat
	lda	#5
	s_jsr	dincanimjmp_x
	bcs	swing_strat4_i
	s_add_playerz	x
	s_end_strat

swing_strat4_i
	s_set_strat	x,swing_strat4
	s_set_alvar	B,x,al_vel,#75
swing_strat4
	s_start_Strat
	s_jsr		dgen3dvecs
	s_jsr		daddvecs2pos_x
	s_jmp_notdelay	1,.misit
	s_inc_alvar	B,x,al_roty
.misit	s_inc_alvar	B,x,al_rotx
	s_cmp_alvar	B,x,al_rotx,#10
	s_beq		swing_strat5_i
	s_end_strat

swing_strat5_i
	s_set_strat	x,swing_strat5
	s_set_alvar	B,x,al_vel,#65
swing_strat5
	s_start_strat
	s_jsr		dgen3dvecs
	s_jsr		daddvecs2pos_x

	s_jsr		swing_Strat_srou

	s_jmp_notdelay	1,.misit
	s_add_alvars	B,x,al_roty,x,al_rotz
	s_dec_alvar	B,x,al_rotz
	s_cmp_alvar	B,x,al_rotz,#-19
	s_beq		swing_strat6_i
.misit
	s_cmp_alvar	B,x,al_rotx,#-2
	s_beq		.nodec
	s_dec_alvar	B,x,al_rotx
.nodec
	s_end_strat

swing_strat6_i
	s_set_strat	x,swing_strat6
	s_jsr		dgen3dvecs
	s_end_strat
swing_strat6
	s_start_strat
	s_cmp_anim		x,#0
	s_beq		.missy
	lda	#6
	s_jsr	ddecanim_x
	s_bra	.con
.missy
.con
	s_add_playerz	x
	s_jsr		daddvecs2pos_x
	s_jsr		swing_Strat_srou
	s_add_alvar	B,x,al_rotz,#12
	s_end_strat

swing_strat_srou

	s_jmp_notdelay	3,.nofire
	s_weapon_pos	#0,#0,#0
	s_weapon_rot	#0,#0
	s_fire_weapon	x,RELSLOWELASER
.nofire
	rts

	ENDC
;------------------------------------------------------------


cameleon_istrat
	s_start_strat
	s_set_alptrs	x,cameleon_strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#cameleonHP,#cameleonAP
	s_set_alvar	B,x,al_sbyte1,#20
	trigse		$2b
cameleon_strat
	s_start_strat
	s_cmp_alvar	B,x,al_rotx,#deg180
	s_beq		.noadd
	s_add_alvar	B,x,al_rotx,#16
	s_jmp		.camstrat_end
.noadd
	s_cmp_alvar	B,x,al_rotz,#deg90
	s_beq		.nomoreadd
	s_add_alvar	B,x,al_rotz,#4
	s_jmp		.camstrat_end
.nomoreadd
	s_beqdec_alvar	B,x,al_sbyte1,.cameleon_strat3_i
	s_jmp_NOTdelay	4,.camstrat_end,al1pt
	s_set_objtobeplayer	y
	s_weapon_pos	#0,#0,#0
	s_weapon_rots2obj	y
	s_fire_weapon	x,relslowelaser
	s_jmp		.camstrat_end

.cameleon_strat3_i
	s_set_strat	x,.cameleon_strat3
.cameleon_strat3
	s_start_Strat
	s_cmp_alvar	B,x,al_roty,#deg180
	s_beq		.nomoreadd2
	s_add_alvar	B,x,al_roty,#16
	s_jmp		.camstrat_end
.nomoreadd2
	s_remove_obj		x
	s_end_Strat	

.camstrat_end
	s_add_playerZ	x
	s_end_strat


;-------------------------------------------------------------

mine0_istrat
	s_start_strat
	s_set_alptrs	x,mine0_strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#mine0HP,#mine0AP
	s_set_colltype	x,ENEMY1
	s_set_alvar2rnd	x,al_rotz
mine0_strat
	s_start_strat
	s_end_strat




;-------------------------------------------------------------

saucer_istrat
	s_start_strat
	s_set_alptrs	x,saucer_strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#saucerHP,#saucerAP
	s_set_alvar	W,x,al_vx,#0
	s_set_alvar	W,x,al_vz,#30
	s_set_alvar	W,x,al_vy,#-20
	s_jsl		makesplash_srou_l
	s_set_alsflag	x,shadow
	make_shadow	#saushad
saucer_strat
	s_start_strat
	move_shadow
	s_add_playerz	x
	s_jsr	drotsflat_x
	s_jsr		daddvecs2pos_x
	s_falldown_Yvec	x,1,#1,#0,.saucerbounce
	s_cmp_alvar	W,x,al_worldy,#0
	s_beq		.saucerbounce
	s_end_strat
.saucerbounce
	s_jsl		makesplash_srou_l
	s_cmp_alvar	W,x,al_vy,#0
	s_beq		.chigaustrat
	s_end_strat

.chigaustrat
	remove_shadow
	s_set_strat	x,saucer_strat2
	s_set_alvar	B,x,al_vel,#40
	s_set_alvar	B,x,al_sbyte1,#0
	s_set_alvar	B,x,al_sbyte2,#16
	s_set_alvar	W,x,al_vy,#0
	s_end_strat
saucer_strat2
	s_start_strat
	s_beqdec_alvar	B,x,al_sbyte2,.nosplash
	s_jsl		makesplash_srou_l
.nosplash
	s_gen_vecs		x,al_sbyte1,al_vel
	s_jsr		daddvecs2pos_x
	s_leftview_strat	x,.subit
	s_add_alvar	B,x,al_sbyte1,#8
	s_bra		.carryon
.subit	s_add_alvar	B,x,al_sbyte1,#-8
.carryon

	lda	al_sbyte1,x
	clc
	adc	#32
	cmp	#64
	bcc	.splashit
	sec
	sbc	#32+128-32
	cmp	#64
	bcc	.splashit
	
	s_end_strat
.splashit	s_jsl		makesplash_srou_L
	s_end_strat


	IFEQ	1
;-------------------------------------------------------------

eject_istrat
	s_start_strat
	s_set_alptrs	x,eject_strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#ejectHP,#ejectAP
	s_init_anim		x,#0
	s_set_alvar	B,x,al_sbyte1,#0
	s_set_alvar	B,x,al_sbyte2,#0
	s_set_alvar	B,x,al_sbyte3,#31
eject_strat
	s_start_strat
	s_add_playerz	x
	s_jsr		eject_srou
	s_inc_alvar	B,x,al_sbyte1
	s_add_alvars	B,x,al_sbyte2,x,al_sbyte3
	s_jmp_notdelay	2,.missdec
	s_cmp_alvar	B,x,al_sbyte3,#0
	s_beq		eject2_i
	s_dec_alvar	B,x,al_sbyte3
.missdec
	s_end_Strat
eject2_i
	s_set_strat	x,eject2_strat
	s_end_Strat
eject2_strat
	s_start_strat
	s_set_objtobeplayer	y
	s_jmp_zdistmore	x,y,#100,.noadd
	s_add_playerz	x
.noadd
	lda	#6
	s_jsr	dincanimjmp_x
	bcs	.finished
	s_end_strat
.finished	s_set_strat	x,eject3_strat
	s_end_strat
eject3_strat
	s_start_strat
	lda	#6
	s_jsr	dincanim_x
	s_bne		.nores
	s_init_anim		x,#4
.nores
	s_add_playerz	x
	s_leftview_strat	x,.oneway
	s_sub_alvar	W,x,al_worldx,#5
	s_end_strat
.oneway
	s_add_alvar	W,x,al_worldx,#5
	s_end_strat

eject_srou
	s_set_alvar2alvartab	B,B,W,x,al_worldy,x,al_sbyte1,sintab,0
	s_set_alvar2alvartab	B,B,W,x,al_worldx,x,al_sbyte2,sintab,0
	s_add_alvars	W,x,al_worldx,x,al_worldy
	s_sub_alvar	W,x,al_worldy,#50
	s_set_objtobeplayer	y
	s_add_alvars	W,x,al_worldy,y,al_worldy
	s_rts

	ENDC

;-------------------------------------------------------------

pillar2_Istrat
	s_start_strat
	s_hardvars		x
	s_set_strat		x,pillar2_strat
	s_init_anim		x,#0
	s_end_strat
pillar2_strat
	s_start_strat
	lda	#32
	s_jsr	dincanim_x
	s_end_strat

;-------------------------------------------------------------

gate_Istrat
	s_start_strat
	s_set_alptrs	x,gate_strat,0,0
	s_set_aldata	x,#1,#0
	s_init_colanim	x,#0
	s_set_alsflag	x,colldisable
	s_set_alsflag	x,shadow
	stz.w		eroll1&WM

;---- store the current map position
;     note: the map data needs a setfadeup quick after a gate position

	a16
	lda	mapptr
	sta	maprestarttemp
	a8
	lda	mapbank
	sta	maprestartbanktemp
;----
	s_end_strat

gate_strat
	s_start_strat

	a16
	lda	#200
	s_jsr	dzdistless
	shorta
	s_bcc	.norm
	s_jmp_outxydistrng	x,y,#0,#(25<<2),.norm


	ldy	pcboxobj_B
	lda.w	al_hp,y
	beq	.norm
	clc
	adc	#20
	cmp	#40
	bmi	.ok
	lda	#40
.ok
	sta.w	al_hp,y		

	trigse		se_gateofring

	s_set_strat	x,.strat2
	s_init_colanim	x,#4
	phx
	lda	maprestartbanktemp
	ldx	maprestarttemp
	s_jsl	set_restart_position_l
	plx

	lda	#1
	sta	eroll1


.strat2	s_start_strat
	s_add_alvars	B,x,al_rotz,x,al_sbyte1
	s_inc_alvar	B,x,al_sbyte1
	s_add_colanim	x,#1,#16,NOJUMP,#5
	s_bra	.end

.norm	s_add_colanim	x,#1,#4

.end	s_end_strat

;--------------------------------------------------------------
; this makes copies of all the current bg, music and level data
; so you can restore them if you die
; x = map position to restart at
; a = map bank to restart at


	shorta
	longi
set_restart_position_l
	stx	maprestart
	sta	maprestartbank
	ldx	currentbg
	stx	restartbg
	ldx	lastpalfade
	stx	restartpalfade

; also have to copy the map language's various stacks
	phb
	lda	#$7e	; ram bank
	pha
	plb

	ldx	mapjsrptr
	stx	maprestartjsrptr
	ldx	nummapjsr
	stx	maprestartnumjsr
	ldx	nummaploops
	stx	maprestartnumloops

	ldx	#15*3-1
.copystack1	lda	mapjsrstk,x
	sta	maprestartjsrstk,x
	dex
	bpl	.copystack1

	ldx	#2*4-1
.copystack2	lda	mapaddrs,x
	sta	maprestartaddrs,x
	lda	maploops,x
	sta	maprestartloops,x
	dex
	bpl	.copystack2


	plb
	rtl

	longi
restart_l
	php
	phb
	a8
	IFNE	FASTROM
	lda	#$80
	pha
	plb
	ELSEIF
	lda	#0
	pha
	plb
	ENDC

	disable

	a8i16
	lda	maprestartbank
	sta	mapbank
	ldx	maprestart
	stx	mapptr

; have to copy the map language's various stacks back in
	phb
	lda	#$7e	; ram bank
	pha
	plb

	ldx	maprestartjsrptr&WM
	stx	mapjsrptr
	ldx	maprestartnumjsr&WM
	stx	nummapjsr
	ldx	maprestartnumloops&WM
	stx	nummaploops

	ldx	#15*3-1
.copystack1	lda	maprestartjsrstk&WM,x
	sta	mapjsrstk,x
	dex
	bpl	.copystack1

	ldx	#2*4-1
.copystack2	lda	maprestartaddrs&WM,x
	sta	mapaddrs,x
	lda	maprestartloops&WM,x
	sta	maploops,x
	dex
	bpl	.copystack2

	plb


	jsl	initgame_l
	jsl	initblack_l
	jsl	find_window_pri_l

	jsl	playerstart_init_l

	lda	#50
	sta	stagecnt

	a16
	lda	restartbg
	jsl	setbg_l
	jsl	setbginfo_l
;	jsl	setrestartfade_l

	a8
	lda	#1
	sta	fadedir
	stz	fade

	plb
	plp
	enable
	rtl


;-------------------------------------------------------------

; sprouting dragons
lochnessmonster_istrat
	s_start_strat
	s_set_alsflag	x,sflag8	; lock ness monster
	s_set_var	W,sprouttail,#snake_3
	bra		seady.missheight
seadragon2_istrat
	s_start_strat
	s_set_alvar	B,x,al_sbyte2,#15
seadragon_istrat
seady	s_start_strat
	s_set_alvar2rnd	x,al_sbyte1,#3
	s_add_alvar	B,x,al_sbyte1,#2
	s_set_alvar	B,x,al_sword1+1,#255	; time until tail appears
.missheight	LOCAL
	s_set_alsflag	x,sflag2	; look, it's a dragon I tell you
	s_set_alsflag	x,sflag4	; fire breathing sea dragon
	s_set_var	W,sprouthead,#snake_1
	s_set_var	W,sproutbody,#snake_4
	s_set_var	B,sproutiHP,#seaneckHP
	s_sub_alvar	W,x,al_worldy,#sprout_maxy/2

	s_set_alvar	B,x,al_sword1,#4	; animation speed
	s_set_alsflag	x,colldisable

seadragon_istrat2
sead
	s_start_strat
	s_set_var	W,sproutstrat,#seadragon_istrat2&WM
	s_set_var	B,sproutstrat+2,#seadragon_istrat2>>16

	s_set_alptrs	x,sprouty.strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,sproutiHP,#seaneckAP
	s_set_alsflag	x,nohitaffect
	s_set_colltype	x,ENEMY1
	s_init_anim	x,#0
	s_jmp_alsflag x,sflag8,sprouty.strat
	s_beqdec_alvar	B,x,al_sbyte1,.stop ; height of snake
	jmp		sprouty.strat
.stop	s_set_strat	x,.stopstrat
.stopstrat	s_start_strat
	s_jmp_notalsflag	x,sflag2,.notsnakey11
	s_jmp_alsflag		x,sflag5,sprouty.withdraw_i
.notsnakey11	s_end_strat

; sprouting trees
tree3_istrat
	s_start_strat
	s_set_alvar	B,x,al_sbyte1,#255
	s_jmp		tree2.forcedentry

tree2_istrat
tree2
	s_start_strat
	s_set_alvar2rnd	x,al_sbyte1,#3
	s_inc_alvar	B,x,al_sbyte1
	s_set_alvar		B,x,al_sbyte2,#deg22
.forcedentry	local
	s_set_alsflag	x,sflag6	; look mummy, I'm a flower
	s_set_alsflag	x,sflag5	; kinky tree
	s_set_var	W,sprouthead,#stalk
	s_set_var	W,sproutbody,#stalk_1
	s_set_var	B,sproutiHP,#tree1HP
	s_sub_alvar	W,x,al_worldy,#sprout_maxy/2

	s_set_alvar	B,x,al_sword1+1,#255	; time until tail appears
	s_set_alvar	B,x,al_sword1,#2	; animation speed

	s_set_objtobeplayer	y
	s_cmp_alvars		W,x,al_worldx,y,al_worldx
	s_bmi			.otherway
	s_add_alvar		B,x,al_roty,#-deg45
	bra			.notthatway
.otherway
	s_neg_alvar		B,x,al_sbyte2
	s_add_alvar		B,x,al_roty,#deg45
.notthatway
tree2_istrat2
	s_start_strat
	s_set_alsflag	x,shadow
	s_set_var	W,sproutstrat,#tree2_istrat2&WM
	s_set_var	B,sproutstrat+2,#tree2_istrat2>>16

	s_set_alptrs	x,sprouty.strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,sproutiHP,#tree1ap
	s_set_alsflag	x,nohitaffect
	s_set_colltype	x,ENEMY1
	s_init_anim	x,#0
	s_beqdec_alvar	B,x,al_sbyte1,tree1.bloom		; height of tree
	jmp		sprouty.strat

tree1_istrat
	s_start_strat
	s_set_alsflag	x,sflag6	; look mummy, I'm a flower
	s_set_alsflag	x,sflag4	; leaves please
	s_set_alvar2rnd	x,al_sbyte1,#3
	s_inc_alvar	B,x,al_sbyte1
	s_set_var	W,sprouthead,#stalk
	s_set_var	W,sproutbody,#stalk_1
	s_set_var	B,sproutiHP,#tree1HP
	s_sub_alvar	W,x,al_worldy,#sprout_maxy/2

	s_set_alvar	B,x,al_sword1+1,#255	; time until tail appears
	s_set_alvar	B,x,al_sword1,#2	; animation speed

tree1_istrat2
tree1
	s_start_strat
	s_set_var	W,sproutstrat,#tree1_istrat2&WM
	s_set_var	B,sproutstrat+2,#tree1_istrat2>>16

	s_set_alptrs	x,sprouty.strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,sproutiHP,#tree1ap
	s_set_alsflag	x,nohitaffect
	s_set_colltype	x,ENEMY1
	s_init_anim	x,#0
	s_beqdec_alvar	B,x,al_sbyte1,.bloom		; height of tree
	s_not_alsflag	x,sflag3
	jmp		sprouty.strat

.bloom	LOCAL
	s_jmp_NOTalsflag	x,sflag5,.flower	; look mummy, im a prostitute
	s_clr_alsflag		x,sflag5
	s_set_alvar2rnd	x,al_sbyte1,#1
	s_inc_alvar	B,x,al_sbyte1
	jmp		sprouty.strat
.flower
	s_clr_alsflag	x,shadow
	s_set_strat	x,.flowerup
	s_set_alvar	W,x,al_shape,#flower
;	s_set_alsflag	x,shadow
.flowerup	s_start_strat
	s_cmp_anim	x,#10
	bne		.nbl
	jsl	makepollen_srou_l
.nbl
	s_add_anim	x,#1,#13,.bloomed
.bloomed
	s_end_strat

; tunnel sprouter
sproutt_istrat
	s_start_strat
	s_set_alsflag	x,sflag7
	s_jmp		sprout2_istrat
sprout_istrat
	s_start_strat

	s_set_alvar2rnd		x,al_sbyte1,#15	; z rot inc
	s_set_alvar2rnd		x,al_sbyte2,#7	; y rot inc
	s_set_alvar2rnd		x,al_sbyte3,#3	; x rot inc
	s_rightview_strat	x,.missneg
	s_neg_alvar		B,x,al_sbyte1
.missneg

;---------------- 65816
	jsl	random_l
	and	#12
	bit	#8
	beq	.carryon
	lda	#-2
.carryon
	clc
	adc	#4
	sta	al_sword1,x		; speed (4 or 8)
;----------------

	s_set_alvar2rnd	x,al_sword1+1,#15	; timer for length of sprout
sprout2_istrat
sprouty
	s_set_var	W,sproutstrat,#sprout2_istrat&WM
	s_set_var	B,sproutstrat+2,#sprout2_istrat>>16

;	s_set_var	W,sprouthead,#sprout
;	s_set_var	W,sproutbody,#sproutb
;	s_set_var	W,sprouttail,#sproutt

	s_set_alptrs	x,.strat,hitflash_istrat,.sproutexpl
	s_set_aldata	x,#1,#sproutap
	s_init_anim	x,#0
;	s_set_alsflag	x,shadow
	s_set_colltype	x,ENEMY1
.strat	LOCAL
	s_start_strat
;	s_set_objtobeplayer	y

	s_jmp_NOTalsflag x,sflag2,.notsnake2
	s_jmp_alsflag	x,sflag8,.lochness	; loch ness, so miss it
	s_jmp_alvarnotzero B,x,al_sbyte2,.lochness
	a16
	lda	#1000
	bra	.issnake
.notsnake2
	a16
	lda	#2000
.issnake
	s_jsr	dzdistless
	shorta
	s_bcc	.chksnake
	s_jmp_NOTalsflag x,sflag2,.notsnake
.lochness
	s_jmp_alsflag	x,sflag3,.notsnake
	s_jmp_alsflag	x,sflag8,.nobluff
	s_jmp_alvarnotzero B,x,al_sbyte2,.nobluff
	s_jmp_random	.bluff
	s_jsl		enemyupsea_l
.nobluff
	s_set_alsflag	x,sflag3	; only do this once
	s_make_obj	#snake_0,.failed ; create the head
	s_jsr		copypos_yx
	s_jsr		fling.copyrots_yx
	s_set_strat	y,snake_istrat
	s_set_alvartobeobj y,al_ptr,x
	s_set_colltype	y,ENEMY1
	s_copy_alvar2alvar	B,y,al_sbyte2,x,al_sbyte2
	s_copy_alvar2alvar	B,y,al_sbyte3,x,al_sword1+1
	s_jmp_notalsflag	x,sflag8,.notnessie
	s_set_alsflag	y,sflag1
.notnessie
	s_set_alsflag	x,sflag1	; always splash
.failed	s_set_alvar	W,x,al_shape,#snake_1
	s_clr_alsflag	x,colldisable
.notsnake
	s_copy_alvar2var	B,x,svar_byte1,al_sword1
	s_add_anim	x,svar_byte1,#8,.finished
.end	s_end_strat
.finished	s_jmp_notalsflag	x,sflag2,.notsnakey11
	s_jmp_alsflag		x,sflag5,.withdraw_i
.notsnakey11	s_set_strat	x,.strat2
	s_bra		.end
.chksnake	s_jmp_NOTalsflag x,sflag2,.end	; not a snake
	s_jmp_notdelay	3,.nosplash
	s_make_splash	x,s
	s_sub_alvar	W,y,al_worldz,#10
	s_jmp		.end

; snake's a bluffing
.bluff
	s_set_strat	x,.bluffstrat
.bluffstrat	s_start_strat
	s_jmp_notdelay	3,.nosplash
	s_make_splash	x,s
	s_sub_alvar	W,y,al_worldz,#10
.nosplash	s_end_strat

.strat2
	s_start_strat
	s_init_anim	x,#8
	s_make_obj	sprouthead,.end
	s_jsr		copypos_yx
	s_jsr		fling.copyrots_yx
	s_copy_alvar2alvar	B,y,al_sbyte1,x,al_sbyte1
	s_copy_alvar2alvar	B,y,al_sbyte2,x,al_sbyte2
	s_copy_alvar2alvar	B,y,al_sbyte3,x,al_sbyte3
	s_copy_alvar2alvar	W,y,al_sword1,x,al_sword1
	s_copy_sflags	y,x
	s_jsr		.roffs
	s_jmp_alsflag	x,sflag6,.tree1miss
	s_jmp_alsflag	x,sflag2,.snakemiss
	s_add_alvars	B,y,al_rotz,y,al_sbyte1
	s_add_alvars	B,y,al_roty,y,al_sbyte2
	s_add_alvars	B,y,al_rotx,y,al_sbyte3
	jmp		.normmiss
.tree1miss
	s_jmp_notalsflag x,sflag5,.notoverhang
	s_add_alvars	B,y,al_rotz,y,al_sbyte2
.notoverhang
	jmp		.normmiss
.snakemiss	s_jmp_notalsflag x,sflag8,.notlochness
	s_add_alvar	B,y,al_rotx,#-deg22
	s_clr_alsflag	y,sflag1	; dont always splash
	jmp		.normmiss
.notlochness
	s_add_alvar	B,y,al_rotx,#-deg11
.normmiss
	s_jsr		.roffs
	s_set_alvar	W,y,al_stratptr,sproutstrat
	s_set_alvar	B,y,al_stratptr+2,sproutstrat+2
	s_set_alvartobeobj	x,al_ptr,y	; link 'em up

	s_jsr		.boundscheck
	s_bcc		.strat3_i
.finishitup
	s_set_alvar	W,x,al_ptr,#-1
	s_remove_obj	y
	s_jmp		.strat3_i
.roffs
	s_add_Roffs2pos	B,y,y,y,#0,#-(sprout_maxy-5)/2,#0,1,1,1,0,0,0
	s_rts

.boundscheck
	s_jmpNOT_alsflag	x,sflag7,.nottunnel
	a16
	lda	maxpmoveX
	sec
	sbc	minpmoveX
	sta	x1
	lda.w	al_worldx,y
	sec
	sbc	minpmoveX
	cmp	x1
	bcs	.setit
	lda	maxpmoveY
	sec
	sbc	minpmoveY
	sta	x1
	lda.w	al_worldy,y
	sec
	sbc	minpmoveY
	cmp	x1
	bcs	.setit
	a8
	clc
	rts
.nottunnel
	s_cmp_alvar	W,y,al_worldy,#0
	s_bpl		.setit
	clc
	rts
.setit	a8
	sec
	rts

.killme
	s_set_strat	x,.fall_istrat
	s_jmp		.end
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.withdraw_i	LOCAL
	s_set_strat	x,.withdraw
	s_set_alvar	W,x,al_shape,sprouthead
.withdraw	s_start_strat
	s_cmp_anim	x,#0
	s_beq		.finishedshrink
	s_sub_alvar	B,x,al_animframe,#4
	s_end_strat
.finishedshrink
	s_jsl		find_alptr_l
	s_set_alsflag	y,sflag5
	s_remove_obj	x
	s_end_strat
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.strat3_i
	s_start_strat
	s_set_alvar	B,x,al_hp,sproutiHP
	s_set_alvar	W,x,al_shape,sproutbody
.norot
	s_set_strat	x,.strat3
.strat3
	s_start_strat
	s_jmp_notalsflag	x,sflag2,.notsnakey
	s_jmp_alsflag		x,sflag5,.withdraw_i
	s_cmp_alvar		W,x,al_ptr,#-1
	s_beq			.splashmo
	s_jmpNOT_alsflag	x,sflag1,.nosplash23
.splashmo	s_jmp_notdelay		3,.nosplash23
	s_make_splash		x,s
	s_set_alvar		W,y,al_worldy,#0
	s_sub_alvar		W,y,al_worldz,#10
.nosplash23
.notsnakey
	s_cmp_alvar	W,x,al_ptr,#0
	s_beq		.killme
	s_beqdec_alvar		B,x,al_sword1+1,.animate
	s_jmp_NOTalsflag	x,sflag6,.nottree
	s_jmp_NOTalsflag	x,sflag4,.notleaf
	s_cmp_alvar		B,x,al_sword1+1,#255-5
	s_bne			.notleaf
	s_jsr			.createleaf
.notleaf
.nottree
	s_jmp			.end

.createleaf
	s_make_obj	sprouthead,.end
	s_jsr		fling.copyrots_yx
	s_set_var	B,x1,#-20
	s_jmp_notalsflag x,sflag3,.notthere
	s_set_var	B,x1,#20
	s_add_alvar	B,y,al_roty,#deg180
.notthere
	s_add_Roffs2pos	B,y,x,x,x1,#0,#-10,1,1,1,0,0,0
	s_set_strat	y,leaf_istrat
	s_set_alvar	W,y,al_shape,#leaf
	s_add_alvar	B,y,al_rotz,#deg45
	s_copy_alvar2alvar	B,y,al_sbyte1,x,al_sbyte1
	
	s_rts

.animate
	s_set_strat		x,.finishup

	lda	al_sword1,x
	eor	#-1
	inc	a
	clc
	adc	#128
	sta	al_animframe,x

	s_jmp_NOTalsflag	x,sflag8,.notsnakespll
	s_cmp_alvar		W,x,al_ptr,#-1
	s_beq			.splashmo2
	s_jmp_NOTalsflag	x,sflag1,.notsnakespll
.splashmo2	s_make_splash		x
	s_set_alvar		W,y,al_worldy,#0
	s_sub_alvar		W,y,al_worldz,#10
.notsnakespll

	s_jmp_alsflag		x,sflag8,.finishup
	s_set_alvar		B,x,al_hp,#1
.finishup
	s_start_strat
	s_jmp_alvarzero		W,x,al_ptr,.killme
	s_set_alvar		W,x,al_shape,sprouttail
	s_copy_alvar2var	B,x,svar_byte1,al_sword1
	s_add_alvar		B,x,al_animframe,svar_byte1
	s_cmp_anim		x,#8
	s_beq			.rem
	s_jmp			.end

.rem	s_remove_obj	x
	s_jmp		.end

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.sproutexpl
	s_start_strat
	s_jsr		.expl
	s_end_strat
.expl	LOCAL
	s_jsr		.sprout_srou
	s_set_expstrat	x,explode_istrat
	s_jsl		remove_alptrs_l
	s_kill_obj	x
	s_rts

.fall_istrat
	s_set_strat	x,.fall
	s_set_alvar	B,x,al_vel,#30
	s_set_alvar2rnd	x,al_roty
	s_jsr		dgen3dvecs
	s_set_alvar	W,x,al_vy,#-10
	s_jsl		remove_alptrs_l
.fall
	s_start_strat
	s_add_alvar	B,x,al_rotz,#5
	s_add_alvar	B,x,al_rotx,#2
	s_falldown_Yvec	x,2,#3,#0,.le_fin
	s_jsr		daddvecs2pos_x

	txy
	s_jsr		.boundscheck
	bcs		.le_fin

	s_end_strat
.le_fin
	s_set_expstrat	x,explode_istrat
	s_kill_obj	x
	s_end_strat

.sprout_srou
	a8i16
	phx
	phy
.agai
	ldy	al_ptr,x
	s_set_strat	x,.fall_istrat
	tyx
	cpx	#0
	bne	.agai
	ply
	plx
	rts

;------------------------------------------------------------
leaf_istrat
	s_start_strat
	s_set_alptrs	x,.strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#hardHP,#hardAP
	s_set_colltype	x,ENEMY1
	s_set_alsflag	x,nohitaffect
	s_set_alsflag	x,colldisable
	s_init_anim	x,#0
	lda		#4
	sec
	sbc		al_sbyte1,x
	sta		al_sbyte1,x
.strat	s_start_strat
	lda	#7
	sec
	sbc	al_sbyte1,x
	s_jsr	dincanimjmp_x
.finished
	s_end_strat


;------------------------------------------------------------


	shorta
	longi
remove_alptrs_l
	phx
	a16
	txa
	ldx	allst
.lp
	cmp	al_ptr,x
	bne	.remok
	stz	al_ptr,x

.remok	ldy	_next,x
	tyx
	bne	.lp
	plx
	a8
	rtl



;-------------------------------------------------------------
arm_istrat
ars
	s_start_strat
	s_set_alptrs	x,.strat,0,explode_istrat
	s_set_aldata	x,#armHP,#armAP
	stz		al_sbyte1,x
	stz		al_sbyte2,x
	stz		al_sbyte3,x
	s_set_alvar	B,x,al_sbyte4,#32
	s_set_colltype	x,ENEMY1
	s_clr_altype	x,zremove
	s_cmp_alvar	W,x,al_shape,#grabber
	s_bne		.notthegrabber
	s_set_collstrat	x,.grabberhit
.notthegrabber
	a16
	lda	al_shape,x
	cmp	#boss_d_2
	beq		.yo_ok_im_a_chickentail
	cmp	#boss_d_0
	bne		.no_im_not
	a8
	s_set_aldata	x,#chickenheadHP+64,#armAP
	s_bra		.nottailmatey
.yo_ok_im_a_chickentail
	a8
	s_set_aldata	x,#chickentailHP+64,#armAP
.nottailmatey
	s_set_collstrat	x,.chickenheadcol
.no_im_not	a8

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.strat
	s_start_strat


; is it a chicken head or tail?
	s_cmp_alvar		W,x,al_shape,#boss_d_2
	s_beq			.taildesu
	s_cmp_alvar		W,x,al_shape,#boss_d_0
	s_bne			.notachicken
.taildesu
	lda	al_hp,x
	cmp	#65
	bcs	.yook
	jsr	.chickenheadhit
.yook
	s_cmp_alvar		W,x,al_shape,#boss_d_2
	s_beq			.notachicken

; get the head the right way up
	lda	al_rotx,x
	sec
	sbc	#deg90
	bpl	.onewayyosh
	stz	al_rotz,x
	bra	.otherwayyosh
.onewayyosh
	lda	#deg180
	sta	al_rotz,x
.otherwayyosh
;; now to stop it breathing fire if facing the wrong way
;	lda	al_rotx,x
;	sec
;	sbc	#deg90
;	bmi	.onewayyo
;	lda	al_roty,x
;	bra	.otherwayyo
;.onewayyo
;	lda	al_roty,x
;	eor	#128
;.otherwayyo	bpl	.notachicken

	lda	armmode
	eor	#64	; swap head mode
	sta	armmode
	bit	#1
	rlbeq	.notachicken

	asl	a
	eor	armmode
	bit	#64
	bne	.notachicken

;	s_jmp_random		.notachicken,80
	s_set_objtobevar	y,#firebreath
	s_jsl			find_y_l
	cpy			dummyobj
	bne			.notachicken

	s_jsr			fling.makeobj
	bcs			.notachicken
	s_jsr			copypos_yx
	s_jsr			fling.copyrots_yx
	s_set_strat		y,firebreathe_istrat
	s_set_alvar		W,y,al_shape,#firebreath

	trigse		$3b

	lda	armmode
	eor	#32
	sta	armmode	; allow other head to fire

	lda	al_rotx,x
	sec
	sbc	#deg90
	bmi	.onewayyou
	lda	#-deg45-deg11
	bra	.otherwayyou
.onewayyou	lda	#deg45+deg11
.otherwayyou	clc
	adc.w	al_rotx,y
	sta.w	al_rotx,y

.notachicken
	s_jmp_alsflag		x,sflag1,.nm
	s_jsr			.zipthrough
.nm
	s_jmpNOT_alsflag	x,sflag2,.nb
	s_cmp_alvar		W,x,al_shape,#grabber
	s_beq			.fire
	s_cmp_alvar		W,x,al_shape,#boss_d_2
	s_bne			.notaneggmate
; now for dropping a smelly
	s_jsr			fling.makeobj
	s_bcs			.nb
	s_set_alvar		W,y,al_shape,#egg
	s_jsr			copypos_yx
	s_jsr			fling.copyrots_yx
	s_set_strat		y,egg_istrat
	s_clr_alsflag		x,sflag2
	s_jmp			.nb

.notaneggmate
	s_jmpNOT_alsflag	x,sflag5,.nx
	s_jmpNOT_alsflag	x,sflag1,.nx
	s_jsr			sprouty.expl
	s_jmp			.end
.nx	s_jmp_alsflag		x,sflag3,.b
	s_init_anim		x,#0
	s_set_alvar		W,x,al_shape,#bulge
	s_set_alsflag		x,sflag3
	s_jmp			.nb
.b	lda	#5
	s_jsr	dincanim_x
	s_cmp_anim	x,#4
	s_beq	.nxtone	
	s_jmp	.nb
.nxtone	s_clr_alsflag		x,sflag2
	s_clr_alsflag		x,sflag3
	s_set_alvar		W,x,al_shape,#arm
	s_set_objtobealvar	y,x,al_ptr
	s_chk_objptr		y,.fire2
	s_set_alsflag		y,sflag2
	s_bra			.nb
.fire2	s_weapon_pos		#0,#0,#((armlength-5)>>weapon_scale)<<1
	s_bra			.fire1
.fire	s_weapon_pos		#0,#0,#((10)>>weapon_scale)<<1
.fire1	s_clr_alsflag		x,sflag2
	s_weapon_rot		#0,#0
	s_fire_weapon		x,HPLASMA
	s_set_alvar		W,y,al_ptr,playpt
.nb
; now for bullets going the other way
	s_jmpNOT_alsflag	x,sflag5,.nbl

	lda	#8
	s_jsr	ddecanim_x
	s_cmp_anim		x,#7
	s_bne			.nbl
	s_set_alvar		W,x,al_shape,#arm
	s_clr_alsflag		x,sflag5
	s_jsr			.passiton
.nbl
	s_jmp_varNOTzero	B,armmode,.nowait
	s_decbne_alvar		B,x,al_sbyte4,.notend
	s_set_alvar		B,x,al_sbyte4,#32
.nowait	lda	armmode
	and	#3<<1
	cmp	#3<<1
	s_beq	.notgrabber2
	a16
	lda	al_ptr,x
	bne	.notend
	lda	al_shape,x
	cmp	#grabber2
	beq	.notend
	cmp	#boss_d_2
	beq	.notgrabber2
	cmp	#boss_d_0
	beq	.notgrabber2
	cmp	#grabber
	a8
	s_bne	.generate
.notend	a16
	lda	al_shape,x
	cmp	#grabber2
	a8
	s_bne	.notgrabber2

	s_set_alvar		B,x,al_roty,#deg180
	stz			al_rotx,x
	stz			al_rotz,x

.notgrabber2
.end
	s_end_strat

.chickenheadcol
	s_start_strat
; ---- 65816
	lda	al_rotx,x
	sec
	sbc	#deg90
	bmi	.onewayyoshoh
	lda	al_roty,x
	sec
	sbc	#deg180
	bra	.otherwayyoshoh
.onewayyoshoh
	lda	al_roty,x
.otherwayyoshoh
	clc
	adc	#128+45
	cmp	#90
	bcs	.nothingdoingatall
	s_clr_alsflag	x,nohitaffect
	jml	hitflash_istrat

.nothingdoingatall
	s_set_alsflag	x,nohitaffect
	jml	hitflash_istrat


.chickenheadhit
	s_start_strat

	trigse		$3b

	s_cmp_alvar	W,x,al_shape,#boss_d_0
	s_beq		.head
	s_set_alvar	B,x,al_hp,#chickentailHP+64
	bra		.tail
.head
	s_add_alvar	B,x,al_hp,#chickenheadHP
.tail
	jsl	find_alptr_l
	cpy	dummyobj
	s_beq	.nothingdoing

	s_cmp_alvar.w	W,y,al_shape,#boss_d_1
	s_beq		.nothingdoing

	sty	x1	; neck piece to remove

	phx
	tyx
	jsl	find_alptr_l
	sty	y1	; find next neck down (or body)

	s_set_objtobevar	x,x1
	s_jsl		remove_alptrs_l
	s_set_alvar	W,x,al_ptr,#0
	test_alcollflags	x,acf_firstframe
	beq		.daijobu
	s_remove_obj	x
	bra		.firstframe
.daijobu
	s_kill_obj	x		; remove the neck piece
;	s_remove_obj	x
.firstframe
	plx

	s_set_objtobevar	y,y1
	cpy	dummyobj
	beq	.mainbody

	s_cmp_alvar.w	W,y,al_shape,#boss_d_1
	s_beq		.mainbody

	s_set_alvartobeobj	y,al_ptr,x
	s_bra			.nothingdoing

.mainbody
	s_set_objtobevar	y,#boss_d_1
	s_jsl			find_y_l
	cpy			dummyobj
	s_beq			.nothingdoing

	s_cmp_alvar		W,x,al_shape,#boss_d_2
	s_bne			.nottail
	s_Set_alvartobeobj	y,al_sword2,x
	s_bra			.nothingdoing
.nottail
	s_jmp_alvarZERO.w	W,y,al_ptr,.oneneck

	s_set_alvartobeobj	y,al_sword1,x
	s_bra			.nothingdoing
.oneneck
	s_set_alvartobeobj	y,al_ptr,x

.nothingdoing
;	lda	armmode
;	eor	#64	; swap head mode
;	sta	armmode
	rts


.grabberhit
	s_start_strat
; ---- 65816
	lda	al_roty,x
	clc
	adc	#128+45
	cmp	#90
	bcs	.dont

	lda	al_rotx,x
	clc
	adc	#45
	cmp	#90
	bcs	.dont

	s_set_objtobealvar	y,x,al_collobjptr	
	s_jmpNOT_colltype	y,laser,.dont

	s_jsr		.passiton
.dont
	s_end_strat


.passiton
	s_jmp_alsflag		x,sflag1,.tisok
	s_set_objtobevar	y,#flingboss
	s_jsl			find_y_l
	s_bra			.justset
.tisok
	s_jsl			find_alptr_l
	s_cmp_alvar		W,y,al_shape,#arm
	s_beq			.itsok
	s_cmp_alvar		W,y,al_shape,#bulge
	s_bne			.justset
.itsok	s_jmp_alsflag		y,sflag5,.dont2
	s_init_anim		y,#3
	s_set_alvar		W,y,al_shape,#bulge
.justset	s_set_alsflag		y,sflag5
.dont2
	s_rts

	shorta
.zipthrough
	phx
	phy
.next	ldy	al_ptr,x
	beq	.finished
	jsr	.position
	tyx
	bra	.next
.finished
	ply
	plx
	rts
.generate
	s_jsr			fling.makeobj
	s_bcc			.tisokyo
	s_jmp			.end
.tisokyo
	s_cmp_alvar		B,x,al_sword1,#1
	s_bne			.notgrabber
	s_jmpNOT_alsflag	x,sflag6,.normgrab
	s_set_alvar		W,y,al_shape,#grabber2
	s_sprite_obj	y,#0	;,#6
	s_init_anim		y,#0
	s_bra			.notgrabber
.normgrab
	s_jmp_varZERO		B,armmode,.normgrab3
	s_cmp_alvar		W,x,al_shape,#neck
	s_beq			.chickenhead
	s_set_alvar		W,y,al_shape,#boss_d_2
	s_add_var		B,armmode,#2
	s_bra			.normgrab2
.chickenhead
	s_set_alvar		W,y,al_shape,#boss_d_0
	s_add_var		B,armmode,#2
	s_bra			.normgrab2
.normgrab3
	s_set_alvar		W,y,al_shape,#grabber
	s_bra			.normgrab2
.notgrabber
;	s_jmpNOT_alsflag	x,sflag6,.normgrab2
;	s_set_alvar		W,y,al_shape,#texturedarm

	a16
	lda	#neck
	cmp	al_shape,x
	bne	.moony
	sta.w	al_shape,y
.moony	a8

.normgrab2
	s_set_strat		y,arm_istrat

	s_copy_alvar2alvar	B,y,al_sword1,x,al_sword1
	s_dec_alvar		B,y,al_sword1
	s_cmp_alvar		B,x,al_sword1,#3
	s_bmi			.missinc
	s_dec_alvar		B,x,al_sword1
.missinc
	s_copy_rots		y,x
	s_jmpNOT_alsflag	x,sflag6,.dontset
	s_set_alsflag		y,sflag6
.dontset
	s_set_alsflag		y,sflag1
	s_set_alvartobeobj	x,al_ptr,y	; link 'em up
	s_jsr			.noacc
	s_jmp			.end
.position	LOCAL
	s_cmp_alvar	W,x,al_shape,#grabber2
	s_beq		.noacc
; ---- 65816
	lda	al_rotx,x
	sec
	sbc.w	al_rotx,y
	adiv2
	sta	x1
	lda.w	al_rotx,y
	clc
	sbc	x1
	sta.w	al_rotx,y

	s_cmp_alvars	B,x,al_rotx,y,al_rotx
	s_beq		.nochangex

	lda		x1
	clc
	adc.w		al_sbyte1,y
	sta.w		al_sbyte1,y
.nochangex
	lda	al_roty,x
	sec
	sbc.w	al_roty,y
	adiv2
	sta	x1
	lda.w	al_roty,y
	clc
	sbc	x1
	sta.w	al_roty,y
	
	s_cmp_alvars	B,x,al_roty,y,al_roty
	s_beq		.nochangey

	lda		x1
	clc
	adc.w		al_sbyte2,y
	sta.w		al_sbyte2,y
.nochangey
	lda	al_rotz,x
	sec
	sbc.w	al_rotz,y
	adiv2
	sta	x1
	lda.w	al_rotz,y
	clc
	sbc	x1
	sta.w	al_rotz,y
	
	s_cmp_alvars	B,x,al_rotz,y,al_rotz
	s_beq		.nochangez

	lda		x1
	clc
	adc.w		al_sbyte3,y
	sta.w		al_sbyte3,y
.nochangez


	s_add_alvars	B,y,al_rotx,y,al_sbyte1
	s_add_alvars	B,y,al_roty,y,al_sbyte2
	s_add_alvars	B,y,al_rotz,y,al_sbyte3

	lda.w	al_sbyte1,y
	s_jsr	.adiv
	sta.w	al_sbyte1,y

	lda.w	al_sbyte2,y
	s_jsr	.adiv
	sta.w	al_sbyte2,y

	lda.w	al_sbyte3,y
	s_jsr	.adiv
	sta.w	al_sbyte3,y

.noacc
	stz	x1
	stz	y1
	lda	#(armlength-2)/2
	sta	z1
	s_jsr	fling.positional
	s_rts
.adiv	adiv2
	s_rts




;-------------------------------------------------------------

flingboss_istrat
fling
	s_start_strat
	s_set_bossmaxHP	#flingboss1HP+flingboss2HP
	stz		armmode
	s_init_anim	x,#0
	s_init_colanim	x,#0
	s_set_alptrs	x,.strat,hitflash_istrat,explode_istrat
	s_set_alsflag	x,nohitaffect
	s_set_aldata	x,#hardHP,#flingbossAP
	s_set_alvar	B,x,al_sbyte4,#flingboss1HP
	s_set_alvar	B,x,al_roty,#deg180
	stz		al_sword2,x
	s_set_colltype	x,ENEMY1

	s_add_alvar	W,x,al_worldz,#4000

	s_jsr		.generate
	s_bcc		.created
	s_set_strat		x,flingboss_istrat
	s_jmp		.end
.created
	s_set_strat	x,.strat
.strat
	s_start_strat

	lda	al_rotx,x
	sta	x1
	clc
	adc	#deg22
	sta	al_rotx,x
	eor	x1
	bpl	.nosound39
	trigse	$39
.nosound39
	s_sub_alvar	W,x,al_worldz,#50
	a16
	lda		#2000
	s_jsr		dzdistless
	SHORTA
	s_bcc		.nochk
.chk
	s_cmp_alvar	B,x,al_rotx,#0
	s_beq		.initmain
.nochk
	s_add_playerz	x
	jsr		.wavex
	jmp		.keepitlinked

.backforabit
.initmain
	s_set_strat	x,.mainstrat
	s_set_alvar	B,x,al_sbyte1,#80
.mainstrat
	s_start_strat
	s_beqdec_alvar	B,x,al_sbyte1,.spinlikecrazy

.fin
	s_add_colanim		x,#1,#4
	s_jmpNOT_alsflag	x,sflag5,.noflash
	s_set_alsflag		x,hitflash
	trigse			$2e
	s_clr_alsflag		x,sflag5
	s_beqdec_alvar		B,x,al_sbyte4,.crazy2
	s_beqdec_alvar		B,x,al_sbyte4,.crazy2
.noflash
	s_add_playerz		x
	s_jsr			.movebackandforth
	s_jsr			.triggermissile
	s_jsr			.triggermissile2
.keepitlinked
	s_set_objtobealvar	y,x,al_ptr
	s_jsr			.position1
	s_set_objtobealvar	y,x,al_sword1
	s_jsr			.position2

	s_add_bossHP		x,al_sbyte4,#flingboss2HP
.end
	s_end_strat

.spinlikecrazy
	s_not_alsflag		x,sflag2
;	s_jmpNOT_alsflag	x,sflag2,.otherstuff
	s_set_alvar		B,x,al_sbyte1,#100
	s_set_strat	x,.spin
	s_not_alsflag	x,sflag1
.spin
	s_jmpNOT_alsflag	x,sflag1,.subit
	s_add_alvar	B,x,al_roty,#8
	s_bra		.added
.subit	s_sub_alvar	B,x,al_roty,#8
.added
	s_cmp_alvar	B,x,al_roty,#64
	s_beq		.soundout
	s_cmp_alvar	B,x,al_roty,#-64
	s_bne		.nosound2
.soundout
	trigse		$39
.nosound2
	s_beqdec_alvar	B,x,al_sbyte1,.cmp
	s_jmp		.fin
.cmp
	s_cmp_alvar	B,x,al_roty,#deg180
	s_beq		.wavearmsabout
	s_jmp	.fin
.wavearmsabout
	s_set_strat	x,.wave
	s_set_alvar	B,x,al_sbyte1,#50
.wave
	s_start_strat
	lda	gameframe
	asl	a
	sta	x1
.tab
	s_jsr	.setvar2tab
	s_set_alvar	B,x,al_sbyte2,y1
	s_beqdec_alvar	B,x,al_sbyte1,.chkfin
	s_jmp	.fin
.chkfin	s_cmp_alvar	B,x,al_sbyte2,#0
	s_beq		.wavearmsforward
	s_jmp		.fin
.setvar2tab
	s_set_var2vartab	B,B,B,y1,x1,sintab,-2
	s_rts
.wavearmsforward
	s_set_strat	x,.wave2
	s_set_alvar	B,x,al_sbyte1,#140
.wave2
	s_start_strat
	s_cmp_alvar	B,x,al_sbyte3,#-24
	s_bne		.nosound
	trigse		$39
.nosound
	s_cmp_alvar	B,x,al_sbyte3,#-52
	s_beq		.nochange2
	s_sub_alvar	B,x,al_sbyte3,#4
.nochange2
	s_beqdec_alvar	B,x,al_sbyte1,.reset
	s_jmp		.fin
.reset
; move from side to side a bit
.sidetoside
	s_set_strat	x,.side
	s_set_alvar	B,x,al_sbyte1,#180
.side
	s_start_strat
	s_beqdec_alvar	B,x,al_sbyte1,.resetside
	a16
	lda	gameframe
	asl	a
	sta	x1
	a8
	s_jsr	.setvar2tab
	lda	y1
	adiv2
	clc
	adc	#deg180
	sta	al_roty,x
	
	s_jmp	.fin
.resetside
	s_set_alvar	B,x,al_sbyte3,#0
	s_set_alvar	B,x,al_roty,#deg180
	s_jmp		.backforabit
.otherstuff
	s_set_strat	x,.spinship
	s_set_alvar	B,x,al_sbyte2,#0
	s_set_alvar	B,x,al_sbyte3,#0
.spinship
	s_start_strat
	s_add_alvar	B,x,al_rotz,#4
	s_cmp_alvar	B,x,al_rotz,#0
	s_beq		.wavearmsforward
	s_jmp		.fin

.movebackandforth
	s_jsr			.wavex
	s_set_objtobeplayer	y
	s_jmpNOT_alsflag	x,sflag3,.forward
	s_add_alvar		W,x,al_worldz,#20
	s_Fchase_alvar		B,x,al_rotx,#0,1
	s_jsr			.fchasey1

	a16
	lda	#2000
	s_jsr	dzdistless
	shorta
	s_bcc	.notflag	
;	s_jmp_zdistmore		x,y,#2000,.notflag
	s_bra			.nochange
.forward
	s_sub_alvar		W,x,al_worldz,#40
	s_Fchase_alvar		B,x,al_rotx,#20,1
	s_jsr			.fchasey2

	a16
	lda	#500
	s_jsr	dzdistless
	shorta
	s_bcc	.nochange
;	s_jmp_zdistmore		x,y,#500,.nochange
.notflag	s_not_alsflag		x,sflag3
.nochange
	s_rts
.wavex
	s_copy_alvar2var	W,x,x1,al_worldx
	s_set_var2vartab	B,B,W,x1,gameframe,sintab,1
	s_set_alvar		W,x,al_worldx,x1
	s_rts
.fchasey2	a16
	lda.w	al_worldy,y
	sec
	sbc	#250
	sta	svar_word1
	a8
	bra	.fchasey
.fchasey1	a16
	lda.w	al_worldy,y
	clc
	adc	#100
	sta	svar_word1
	a8
.fchasey	s_achase_alvar	W,x,al_worldy,svar_word1,4
	s_rts


.generate
	s_jmp_alvarNOTzero	W,x,al_ptr,.theotherarm
	s_jsr			.makeobj
	bcs			.dekinai
	s_set_strat		y,arm_istrat
	s_set_alvar		B,y,al_sword1,#5
	s_set_alvartobeobj	x,al_ptr,y	; link 'em up
	s_jsr			.position1
.theotherarm
	s_jsr			.makeobj
	bcs			.dekinai
	s_set_strat		y,arm_istrat
	s_set_alvar		B,y,al_sword1,#5
	s_set_alvartobeobj	x,al_sword1,y	; link 'em up
	s_jsr			.position2
	clc
.dekinai	s_rts

.makeobj	LOCAL
	s_make_obj	#arm,.fail
	clc
	s_rts
.fail	sec
	s_rts

.positions
.position1
	s_jsr			.copyrots_yx

	lda.w	al_roty,y
	clc
	adc	#deg90
	clc
	adc	al_sbyte3,x
	sta.w	al_roty,y
	lda.w	al_rotx,y
	clc
	adc	al_sbyte2,x
	clc
	adc	al_rotz,x
	sta.w	al_rotx,y

;	s_add_alvar		B,y,al_roty,#deg90
;	s_add_alvars		B,y,al_rotx,x,al_sbyte2
;	s_add_alvars		B,y,al_rotx,x,al_rotz
;	s_add_alvars		B,y,al_roty,x,al_sbyte3

	s_set_var		B,x1,#-(flingbosswidth-10)
	s_set_var		B,y1,#0
	s_set_var		B,z1,#2
	s_jmp			.positional
.position2
	s_jsr			.copyrots_yx

	lda.w	al_roty,y
	clc
	adc	#-deg90
	sec
	sbc	al_sbyte3,x
	sta.w	al_roty,y
	lda.w	al_rotx,y
	clc
	adc	al_sbyte2,x
	sec
	sbc	al_rotz,x
	sta.w	al_rotx,y
;	s_add_alvar		B,y,al_roty,#-deg90
;	s_add_alvars		B,y,al_rotx,x,al_sbyte2
;	s_sub_alvars		B,y,al_rotx,x,al_rotz
;	s_sub_alvars		B,y,al_roty,x,al_sbyte3
	s_set_var		B,x1,#flingbosswidth-10
	s_set_var		B,y1,#0
	s_set_var		B,z1,#2
	s_jmp			.positional
	s_rts

	IFEQ	1
.position3
	s_jsr			.copyrots_yx

	lda.w	al_rotx,y
	clc
	adc	al_sbyte2,x
	sec
	sbc	#deg22
	sec
	sbc	al_rotz,x
	sta.w	al_rotx,y
	lda.w	al_roty,y
	sec
	sbc	al_sbyte3,x
	sta.w	al_roty,y
	lda.w	al_rotz,y
	sec
	sbc	#deg90
	sta.w	al_rotz,y
	
;	s_add_alvars		B,y,al_rotx,x,al_sbyte2
;	s_sub_alvar		B,y,al_rotx,#deg22
;	s_sub_alvars		B,y,al_rotx,x,al_rotz
;	s_sub_alvars		B,y,al_roty,x,al_sbyte3
;	s_sub_alvar		B,y,al_rotz,#deg90
	s_set_var		B,x1,#0
	s_set_var		B,y1,#-25
	s_set_var		B,z1,#5
	s_jmp			.positional
.position4
	s_jsr			.copyrots_yx
	lda.w	al_rotx,y
	sec
	sbc	al_sbyte2,x
	clc
	adc	#deg11
	sec
	sbc	al_rotz,x
	sta.w	al_rotx,y
	lda.w	al_roty,y
	sec
	sbc	al_sbyte3
	sta.w	al_roty,y
	lda.w	al_rotz,y
	sec
	sbc	#deg90
	sta.w	al_rotz,y

;	s_sub_alvars		B,y,al_rotx,x,al_sbyte2
;	s_add_alvar		B,y,al_rotx,#deg11
;	s_sub_alvars		B,y,al_rotx,x,al_rotz
;	s_sub_alvars		B,y,al_roty,x,al_sbyte3
;	s_sub_alvar		B,y,al_rotz,#deg90
	s_set_var		B,x1,#0
	s_set_var		B,y1,#0
	s_set_var		B,z1,#5
	s_jmp			.positional

	ENDC

.position5
	s_jsr			.copyrots_yx
	lda.w	al_rotx,y
	sec
	sbc	al_sbyte2,x
	clc
	adc	#deg11
	sec
	sbc	al_rotz,x
	sta.w	al_rotx,y
	lda.w	al_roty,y
	sec
	sbc	al_sbyte3,x
	sta.w	al_roty,y
	lda.w	al_rotz,y
	sec
	sbc	#deg90
	sta.w	al_rotz,y

;	s_sub_alvars		B,y,al_rotx,x,al_sbyte2
;	s_add_alvar		B,y,al_rotx,#deg11
;	s_sub_alvars		B,y,al_rotx,x,al_rotz
;	s_sub_alvars		B,y,al_roty,x,al_sbyte3
;	s_sub_alvar		B,y,al_rotz,#deg90
	s_set_var		B,x1,#0
	s_set_var		B,y1,#10
	s_set_var		B,z1,#20
.positional	LOCAL
	s_add_Roffs2pos		B,y,x,x,x1,y1,z1,1,1,1,2,2,2
	s_rts
.copyrots_yx	LOCAL
	s_copy_rots	y,x
	s_rts
;	?*-.positions

.triggermissile
	s_beqdec_alvar		B,x,al_sword2+1,.firem
	s_rts

.firem	s_beqdec_alvar		B,x,al_sword2,.rndbit
	
	s_jmpNOT_alsflag	x,sflag4,.missile2
	s_set_objtobealvar	y,x,al_sword1
	s_bra			.set
.missile2	s_set_objtobealvar	y,x,al_ptr
.set	s_set_alsflag		y,sflag2
	s_set_alvar		B,x,al_sword2+1,#4
.no
	s_rts

.rndbit
	s_jmp_random		.no,99
	s_set_alvar		B,x,al_sword2,#3
	s_not_alsflag		x,sflag4
	s_rts

.triggermissile2
	s_jmp_notdelay		6,.no
	s_weapon_rot		#deg11,#0
	s_jsr			.missile
	s_rts

.triggermissile3
	s_jmp_notdelay		6,.nofire
	s_cmp_alvar		B,x,al_hp,#flingboss2HP/2
	s_bmi			.harder
	s_weapon_rot		#deg11,#deg45+deg22
	s_jsr			.missile
	s_weapon_rot		#deg11,#-deg45-deg22
	s_jsr			.missile
.nofire
	s_rts
.harder
	s_weapon_rot		#deg11,#deg45
	s_jsr			.missile
	s_weapon_rot		#deg11,#-deg45
	s_jsr			.missile
	s_weapon_rot		#0,#0
	s_jsr			.missile
	s_weapon_rot		#deg22,#0
	s_jsr			.missile
	s_rts
.missile
	s_weapon_pos		#0,#((20)>>weapon_scale),#0
	s_fire_weapon		x,BOSSHMISSILE1
	s_set_alvar		W,y,al_ptr,playpt
	s_set_colltype		y,ENEMY1
	s_rts

.pullthearmsoff
	phx
	s_set_objtobealvar	y,x,al_ptr
	tyx
	s_jsr	sprouty.expl
	plx
	phx
	s_set_objtobealvar	y,x,al_sword1
	tyx
	s_jsr	sprouty.expl
	plx
	s_rts


	IFEQ	1

; now for the arms to blow off
.crazy	s_jsr		.pullthearmsoff
	s_set_strat	x,.almostgone
	stz		al_sbyte2,x
	stz		al_sbyte3,x
	s_jsr		.generate2
.almostgone
	s_start_strat
	s_jmpNOT_alsflag	x,sflag5,.noflash2
	s_set_alsflag		x,hitflash
	s_clr_alsflag		x,sflag5
	s_dec_alvar		B,x,al_sbyte4	; decrement HP
	s_cmp_alvar		B,x,al_sbyte4,#4
	s_bcc			.crazy2
.noflash2
	s_add_playerz	x
	s_jsr		.movebackandforth

	lda	gameframe
	sta	x1
	s_jsr		.setvar2tab
	lda	y1
	clc
	adc	#deg180
	sta	al_roty,x

	lda	gameframe
	asl	a
	asl	a
	asl	a
	sta	x1
	s_jsr		.setvar2tab
	lda	y1
	adiv2
	adiv2
	sta	al_sbyte2,x
	s_set_objtobealvar	y,x,al_ptr
	s_jsr			.position3
	s_set_objtobealvar	y,x,al_sword1
	s_jsr			.position4
	s_jsr			.triggermissile
	s_end_strat

.generate2
	s_jsr			.makeobj
	s_set_strat		y,arm_istrat
	s_set_alvar		B,y,al_sword1,#3
	s_set_alvartobeobj	x,al_ptr,y	; link 'em up
	s_jsr			.position3

	s_jsr			.makeobj
	s_set_strat		y,arm_istrat
	s_set_alvar		B,y,al_sword1,#3
	s_set_alvartobeobj	x,al_sword1,y	; link 'em up
	s_jsr			.position4

	s_rts

	ENDC

.crazy2	s_jsr		.pullthearmsoff
.andagainif
	s_set_alptrs	x,.almostgone2,hitflash_istrat,deadflingboss_istrat
	s_clr_alsflag	x,nohitaffect
	s_set_aldata	x,#flingboss2HP,#flingbossAP
	s_set_alvar	W,x,al_sword1,#80
	stz		al_sbyte2,x
	stz		al_sbyte3,x
	s_jsr		.generate3
	bcc		.almostgone2
	s_set_strat	x,.andagainif
	s_jmp		.end
.almostgone2
	s_start_strat

	s_add_colanim		x,#1,#8,NOJUMP,#4
	lda	#9
	s_jsr	dincanimjmp_x
	s_add_playerz		x
	s_copy_alvar2var	W,x,svar_word1,al_sword1
	s_add_alvar		W,x,al_worldz,svar_word1
	s_beqdec_alvar		W,x,al_sword1,.backfoth
	s_dec_alvar		W,x,al_sword1
	s_jsr			.wavex
.spinning
	s_cmp_alvar	B,x,al_roty,#72
	bcc		.nosound4
	s_cmp_alvar	B,x,al_roty,#96
	bcc		.soundout3
.nosound4
	s_cmp_alvar	B,x,al_roty,#72+128
	bcc		.nosound3
	s_cmp_alvar	B,x,al_roty,#96+128
	bcs		.nosound3
.soundout3
	trigse		$39
.nosound3
	lda	al_hp,x
	lsr	a
	lsr	a
	and	#-8
	eor	#255
	adc	#19
	clc
	adc	al_roty,x
	sta	al_roty,x

	s_set_objtobealvar	y,x,al_ptr
	s_jsr			.position5
	s_jsr			.triggermissile3
	s_add_bossHP		x,al_hp
	s_end_strat

.backfoth	s_jsr			.movebackandforth
	s_jmp			.spinning

.generate3
	s_jsr			.makeobj
	bcs			.dekinai2
	s_set_strat		y,arm_istrat
	s_set_alvar		B,y,al_sword1,#6
	s_set_alvartobeobj	x,al_ptr,y	; link 'em up
	s_set_alsflag		y,sflag6
	s_jsr			.position5
	clc
.dekinai2
	s_rts

	longi
find_alptr_l
	php
	ai16
	txa
	ldy	allst
.carryon
	tyx
	cmp	al_ptr,x
	beq	.found
	ldy	_next,x
	bne	.carryon
	ldx	dummyobj
.found
	txy
	tax
	plp
	rtl


	SHORTA
	LONGI

kill_robot_l
	php
	a8i16
	phb
	lda	#$7e
	pha
	plb

	ldy	#robot_0
	jsl	find_y_l
	cpy	dummyobj
	beq	.nokill
	s_set_alsflag	y,sflag8
.nokill

	plb
	plp
	rtl

find_y_l
	php
	phx
	ai16
	tya
	ldy	allst
.carryon
	tyx
	cmp	al_shape,x
	beq	.found
	ldy	_next,x
	bne	.carryon
	ldx	dummyobj
.found
	txy
	plx
	plp
	rtl

find_sword1_l
	php
	ai16
	txa
	ldy	allst
.carryon
	tyx
	cmp	al_sword1,x
	beq	.found
	ldy	_next,x
	bne	.carryon
	ldx	dummyobj
.found
	txy
	tax
	plp
	rtl


;-------------------------------------------------------------

speedlines_istrat
	s_start_strat
	s_set_strat	x,.strat
	s_set_alsflag	x,colldisable
	s_set_alvar	B,x,al_rotx,#deg90
	s_init_colanim	x,#0
.strat
	s_start_strat
	s_sub_alvar	W,x,al_worldz,#120
	s_end_strat
;-------------------------------------------------------------

largeplasma_istrat
	s_start_strat
	s_hardvars	x
	s_sub_alvar	W,x,al_worldz,#120
	s_jsr	drotsflat_x
	s_end_strat

;-------------------------------------------------------------

deadflingboss_istrat
	s_start_strat
; remove the tentacle
	phx
	s_set_objtobealvar	y,x,al_ptr
	tyx
	s_jsr	sprouty.expl
	plx

	s_set_alvar	B,x,al_roty,#deg180
	s_hardvars	x
	s_set_strat	x,.strat
	s_set_expstrat	x,bossexplode_istrat
	s_set_alvar	W,x,al_sword1,#161
.strat	s_start_Strat
	s_set_objtobeplayer	y

	a16
	lda	#100
	s_jsr	dzdistless
	shorta
	s_bcc	.end
;	s_jmp_zdistmore	x,y,#100,.end
	s_set_strat	x,.strat2

.strat2
	s_add_playerz	x
	s_sub_alvar	W,x,al_sword1,#4
	s_cmp_alvar	W,x,al_sword1,#40
	s_bmi		.die
	s_copy_alvar2var	W,x,svar_word1,al_sword1
	s_add_alvar		W,x,al_worldz,svar_word1
	s_add_alvar		B,x,al_rotx,#-20
.end	s_end_strat
.die	s_test_var		B,gameflags,#gf_playerdying!gf_playerdead
	s_bne			.end
	s_kill_obj		x
	s_bra			.end
;-------------------------------------------------------------
	IFNE	prntrouln_on
	printroulen	ars,<Fling boss>
	ENDC


;-------------------------------------------------------------

chicken_istrat
chick
	s_start_strat

	a16
	lda	#chickenbodyHP
	sta.l	m_bossmaxHP
	a8

	s_set_var	B,armmode,#128
	s_set_alptrs	x,chick,hitflash_istrat,.chickenexplode
	s_set_aldata	x,#chickenbodyHP,#chickenbodyAP
	s_set_alvar	B,x,al_count,#16
	s_set_alvar	B,x,al_count1,#0
	s_set_alsflag	x,sflag6
	s_clr_altype	x,zremove
	s_init_anim	x,#0
	s_set_alsflag	x,shadow
	s_Set_colltype	x,ENEMY1
	s_jsr		.generate
	s_bcs		.end
	s_set_strat	x,.strat
.repeat
	s_mode_change	x,#0
.strat
	s_mode_table

	s_mode_entry	.foldwings
	s_mode_entry	.sitdown
	s_mode_entry	.waitfor600z
	s_mode_entry	.getup
	s_mode_entry	.unfoldwings
	s_mode_entry	.cometurn
	s_mode_entry	.goturn
	s_mode_entry	.foldwings
	s_mode_entry	.cometurn
	s_mode_entry	.startturn
	s_mode_entry	.endturn
	s_mode_entry	.moveabit
	s_mode_entry	.unfoldwings
	s_mode_entry	.waitabit
	s_mode_entry	.jump
	s_mode_entry	.waitfor600z
	s_mode_entry	.foldwings
	s_mode_entry	.getup
	s_mode_entry	.waitabit
	s_mode_entry	.goturn
	s_mode_entry	.startturn
	s_mode_entry	.endturn
	s_mode_entry	.sitdown
	s_mode_entry	.fireblaze
	s_mode_entry	.getup
	s_mode_entry	.attack
	s_mode_entry	.waitabit
	s_mode_entry	.cometurn
	s_mode_entry	.goturn
	s_mode_entry	.repeat

	s_mode_label	flyaway_mode
	s_mode_entry	.unfoldwings
	s_mode_entry	.getup
	s_mode_entry	.waitabit
	s_mode_entry	.cometurn
	s_mode_entry	.goturn
	s_mode_entry	.flyflyaway
	s_mode_entry	.cometurnfly

	s_mode_table_end


;- - - - - - - - - - - - - -
; code for the various modes
;- - - - - - - - - - - - - -

;**********
.cometurn	s_start_strat
	s_jmpNOT_alsflag	x,sflag3,.notnxtmode
	s_jmp_alsflag	x,sflag1,.notnxtmode
.nxtmode	s_jsr		.nxtmode_srou
.notnxtmode	s_jmp		.move
.nxtmode2	s_jsr		.nxtmode_srou
	s_jmp		.nomove

.nxtmode3	s_jsr		.nxtmode_srou
	s_jmp		.nomove

.nxtmode_srou
	s_set_strat	x,.strat
	s_mode_change	x,+1
	s_rts

;**********
.goturn	s_start_strat
	s_jmp_alsflag	x,sflag3,.move
	s_jmpNOT_alsflag	x,sflag1,.nxtmode
	s_jmp		.move
;**********
.walkcontinuously
	s_start_strat
	a16
	ldy	playpt
	lda.w	al_worldz,y
	clc
	adc	#1300
	sta	al_worldz,x
	stz	al_worldx,x
	a8
	s_set_alvar	B,x,al_roty,#deg180
	s_Jmp		.move


;**********
.jump	s_start_strat
	s_set_strat	x,.strat2
	s_init_anim	x,#7
.strat2	s_start_strat
	s_add_anim	x,#8,#10,.stopanim
.stopanim	a16
	lda	#600
	s_jsr	dzdistless
	shorta
	bcs	.leap
	s_jmp	.nomove

;**********
.leap	s_start_strat
	s_set_strat	x,.strat3
	trigse		$3b
	s_set_alvar	W,x,al_vy,#-60
.strat3	s_add_playerz	x
	s_add_alvar	W,x,al_worldz,#40
	s_add_alvars	W,x,al_worldy,x,al_vy
	s_jsr		dfallyvec_x
	s_bcs		.nxtmode2
	s_jmp		.nomove


;**********
.moveabit	s_start_strat
	lda	al_sbyte1,x
	inc	a
	sta	al_sbyte1,x
	cmp	#20
	s_bcs	.nxtmode
	s_jmp		.move
;**********
.waitabit	s_start_strat
	s_init_anim	x,#0
	s_set_alvar	B,x,al_sbyte2,#0
	s_set_alvar	B,x,al_sbyte4,#0
	s_and_var	B,armmode,#-2
	s_set_alvar	B,x,al_sbyte1,#10
	s_set_strat	x,.strat4
.strat4	s_start_strat
	s_beqdec_alvar	B,x,al_sbyte1,.nxtmode2
	s_jmp		.nomove

;**********
.fireblaze	s_start_strat
	s_not_alsflag	x,sflag4
	s_set_strat	x,.strat5
	s_or_var	B,armmode,#1
.strat5	s_start_strat
	a16
	lda	#1500
	s_jsr	dzdistless
	shorta
	s_bcs	.nxtmode2
	s_jmp	.nomove

;**********
.waitfor600z	s_start_strat
	a16
	lda	#600
	s_jsr	dzdistless
	shorta
	s_bcs	.nxtmode2
	s_jmp		.nomove
;**********
.attack	s_set_strat	x,.strat6
	s_set_alvar	B,x,al_sbyte1,#200
.strat6	s_start_strat

	lda	gameframe
	and	#31
	bne	.nonot
	s_not_alsflag	x,sflag5
.nonot
	lda	#8
	s_jsr	ddecanim_x
	s_add_playerz	x
	s_beqdec_alvar	B,x,al_sbyte1,.nxtmode
	s_cmp_alvar	B,x,al_sbyte1,#160
	blo		.strike
	s_jmp		.nomove
.strike	s_jmp_alsflag	x,sflag5,.strike1
.strike2
	s_set_alvar	B,x,al_sbyte4,#-deg22
	s_set_alvar	B,x,al_sbyte2,#deg22
	s_jmp		.nomove
.strike1
	s_set_alvar	B,x,al_sbyte2,#-deg22
	s_set_alvar	B,x,al_sbyte4,#deg22
	s_jmp		.nomove

;**********
.startturn	s_start_strat
	s_not_alsflag	x,sflag3
	s_jmp		.nxtmode

;**********
.endturn	s_start_strat
	s_jmpNOT_alsflag	x,sflag1,.nxtmode
	s_jmp		.move

;**********
.sitdown	s_start_strat
	s_add_anim	x,#1,#13,.nxtmode2,#10
	s_jmp		.nomove
;**********
.getup	s_start_strat
	s_cmp_anim	x,#7
	s_bmi		.nxtmode2
	lda	#12
	s_jsr	ddecanim_x
	s_cmp_anim	x,#7
	s_beq		.nxtmode2
	s_jmp		.nomove


;**********
.foldwings	s_start_strat
	s_jsr	.getwing1
	s_set_alsflag	y,sflag1
	s_jsr	.getwing2
	s_set_alsflag	y,sflag1
	jmp	.nxtmode2
;**********
.unfoldwings	s_start_strat
	s_jsr	.getwing1
	s_clr_alsflag	y,sflag1
	s_jsr	.getwing2
	s_clr_alsflag	y,sflag1
	jmp	.nxtmode2

;**********
.flyflyaway	s_start_strat
	s_set_strat	x,.strat7
	s_set_alvar	W,x,al_vy,#-70
	s_set_alvar	B,x,al_sbyte1,#20
.strat7	s_start_strat
	s_add_alvar	W,x,al_worldz,#40
	s_add_alvars	W,x,al_worldy,x,al_vy
.nomove3
	s_add_playerz	x
	s_jsr		dfallyvec_x

	a16
	lda	al_worldy,x
	bpl	.subit
	cmp	#-100
	bmi	.negative
.subit	lda	al_vy,x
	sec
	sbc	#20
	bpl	.negative2
	cmp	#-60
	bpl	.negative2
	lda	#-60
.negative2
	sta	al_vy,x
	
.negative	a8

	s_beqdec_alvar	B,x,al_sbyte1,.nxtmode3

	s_jmp	.nomove2

;**********
.cometurnfly	s_start_strat
	s_set_strat	x,.strat8
	s_set_alvar	B,x,al_vel,#-20
.strat8	s_start_strat
	s_cmp_alvar	B,x,al_vel,#-80
	s_beq		.nodec
	s_dec_alvar	B,x,al_vel
.nodec
	s_set_alvar	B,x,al_sbyte1,#10
	s_jsr		dgen3dvecs
	s_jsr		daddvecs2pos_x

	lda	al_roty,x
	beq	.ok
	sec
	sbc	#8
	sta	al_roty,x
.ok
	s_jmp		.nomove3


;- - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.getwing1	ldy	al_sWPx1,x
	s_rts
.getwing2	ldy	al_sWPy1,x
	s_rts

.move
	s_add_playerz		x
	s_jsr			.movebackandforth

.nomove
	s_jsr			.triggeregg
.nomove2
	s_jsr			.waveheads

	s_set_objtobealvar	y,x,al_ptr
	s_jsr			.position1
	s_set_objtobealvar	y,x,al_sword1
	s_jsr			.position2
	s_set_objtobealvar	y,x,al_sword2
	s_jsr			.position3
	s_jsr			.getwing1
	s_jsr			.position4
	s_jsr			.getwing2
	s_jsr			.position5

	s_jsr			.check_fin

	s_jsr			.regrownecks


	s_add_bossHP	x,al_hp

.end	s_end_strat

.check_fin
	a16
	lda	#boss_d_2
	ldy	al_sword2,x
	cmp.w	al_shape,y
	beq	.oksetred

	lda	#boss_d_0	; chicken head check
	ldy	al_ptr,x
	cmp.w	al_shape,y
	bne	.normal
	ldy	al_sword1,x
	cmp.w	al_shape,y
	bne	.normal
.oksetred
	a8
	s_clr_alsflag	x,nohitaffect

	a16
	lda	#ID_1_C&WM
	sta	x1
	a8
	s_jmp_alsflag	x,sflag6,.noset
	s_set_alvar	B,x,al_count,#56	; red time
	s_inc_alvar	B,x,al_count1
.noset
	s_set_alsflag	x,sflag6
	lda	gameframe
	and	#1
	bne	.norm2
	bra		.setcolours

.normal
	a8
	s_set_alsflag	x,nohitaffect
.norm2
	s_set_var	W,x1,#0

.setcolours
	s_set_coltab	x,x1
	s_jsr		.getwing1
	s_jsr		.setcoltaby
	s_jsr		.getwing2
	s_jsr		.setcoltaby

	rts
.setcoltaby
	s_set_coltab	y,x1
	s_rts

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

.regrownecks
	s_decbne_alvar	B,x,al_count,.nogrow
	s_jmp_alsflag	x,sflag6,.othercount
	s_set_alvar	B,x,al_count,#80	; slow regrow
	s_bra		.notthisone
.othercount
	s_set_alvar	B,x,al_count,#4		; fast regrow
.notthisone
	a16
	stz	x2	; finished growing count
	txa
	clc
	adc	#al_ptr
	tay
	a8
	lda	#3
	jsr	.regrowneck
	a16
	txa
	clc
	adc	#al_sword1
	tay
	a8
	lda	#3
	jsr	.regrowneck

	a16
	txa
	clc
	adc	#al_sword2
	tay
	a8
	lda	#5
	jsr	.regrowneck

	lda	x2
	cmp	#3
	bne	.nogrow
	s_clr_alsflag	x,sflag6	; slow down grow rate
.nogrow
	rts

.regrowneck
	sec
	sbc	al_count1,x
	bmi	.set13
	cmp	#2
	bcs	.noset13
.set13	lda	#2
.noset13	sta	y2
	stz	y2+1

	phx
	a16
	stz	x1
	ldx	0,y
.andagain	lda	al_shape,x
	cmp	#boss_d_0
	beq	.reachedend
	cmp	#boss_d_2
	beq	.reachedend
	inc	x1
	stx	y1
	lda	al_ptr,x
	tax			; get the next shape
	bra	.andagain
.reachedend
	lda	x1
	cmp	y2		; length to grow to?
	bcs	.clrtheflag

	sty	z1		; store arm origin

	a8
	s_jsr		fling.makeobj
	s_bcs		.okdone
;	s_set_expstrat	y,explode_istrat
	s_set_strat	y,arm_istrat
	s_cmp_alvar	W,x,al_shape,#boss_d_0
	s_beq		.thenecked
	s_set_alvar	W,y,al_shape,#arm
	s_bra		.notthetail
.thenecked
	s_set_alvar	W,y,al_shape,#neck
.notthetail
	a16
	lda	x1
	beq	.mainbody

	stx	al_ptr,y
	ldx	y1
	sty	al_ptr,x

	s_jsr	fling.copyrots_yx
	s_jsr	copypos_yx
	bra	.okdone

.mainbody
	stx	al_ptr,y
	ldx	z1
	sty	0,x
	bra	.okdone
.clrtheflag	a8
	plx
	inc	x2
	s_rts
.okdone
	plx
	a8
	s_rts


;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.movebackandforth
	lda	#8
	s_jsr	dincanim_x
	s_jmpNOT_alsflag	x,sflag3,.forward
	s_set_alvar		B,x,al_vel,#-20
	s_jsr			.needtorotate1

	a16
	lda	#2500
	s_jsr	dzdistless
	shorta
	s_bcc	.notflag
	s_bra			.nochange
.forward
	s_set_alvar		B,x,al_vel,#-40
	s_jsr			.needtorotate2
	a16
	lda	#600
	s_jsr	dzdistless
	shorta
	s_bcc	.nochange
.notflag	s_not_alsflag		x,sflag3
.nochange
	s_gen_vecs	x,al_roty,al_vel
	s_add_alvars	W,x,al_worldz,x,al_vz
	s_add_alvars	W,x,al_worldx,x,al_vx

	s_rts

.leftviewchk
	s_set_alsflag		x,sflag1
	s_leftview_strat	x,.otherway
	s_clr_alsflag		x,sflag2
	s_rts
.otherway	s_set_alsflag		x,sflag2
	s_rts

.needtorotate1
	s_jmp_alsflag	x,sflag1,.rotate
	lda		al_roty,x
	cmp		#deg180
	s_beq		.yohohoandabarrelofrum
	s_jsr		.leftviewchk
	s_not_alsflag	x,sflag2
	s_bra		.rotate
.needtorotate2
	s_jmp_alsflag	x,sflag1,.rotate
	lda	al_roty,x
	s_beq	.yohohoandabarrelofrum
	s_jsr	.leftviewchk

.rotate	s_jmp_alsflag		x,sflag2,.otherfchase

	lda	al_roty,x
	clc
	adc	#deg11
	sta	al_roty,x
	bra	.chkit1
.otherfchase
	lda	al_roty,x
	sec
	sbc	#deg11
	sta	al_roty,x
.chkit1	and	#127
	beq	.clrflag1
	rts
.clrflag1
	s_clr_alsflag	x,sflag1
.yohohoandabarrelofrum
	s_rts


.generate
	s_jmp_alvarNOTzero	W,x,al_ptr,.theotherneck1
	s_jsr			fling.makeobj
	s_bcs			.dekinai
	s_set_strat		y,arm_istrat
	s_set_alvar		W,y,al_shape,#neck
	s_set_alvar		B,y,al_sword1,#1
	s_set_alvartobeobj	x,al_ptr,y	; link 'em up
	s_jsr			.position1
.theotherneck1
	s_jmp_alvarNOTzero	W,x,al_sword1,.theotherneck2
	s_jsr			fling.makeobj
	s_bcs			.dekinai
	s_set_strat		y,arm_istrat
	s_set_alvar		W,y,al_shape,#neck
	s_set_alvar		B,y,al_sword1,#1
	s_set_alvartobeobj	x,al_sword1,y	; link 'em up
	s_jsr			.position2

.theotherneck2
	s_jmp_alvarNOTzero	W,x,al_sword2,.thewings
	s_jsr			fling.makeobj
	s_bcs			.dekinai
	s_set_strat		y,arm_istrat
	s_set_alvar		B,y,al_sword1,#1
	s_set_alvartobeobj	x,al_sword2,y	; link 'em up
	s_jsr			.position3
.thewings	s_jmp_alsflag		x,sflag1,.theotherwing
	s_jsr			fling.makeobj
	bcs			.dekinai
	s_set_alvar		W,y,al_shape,#boss_d_8
	s_set_strat		y,wings_istrat
	s_set_alsflag		x,sflag1
	a16
	tya
	sta	al_sWPx1,x
	a8
;	s_set_alvartobeobj	x,al_sWPx1,y	; link 'em up
	s_jsr			.position4
.theotherwing
	s_jsr			fling.makeobj
	bcs			.dekinai
	s_set_alvar		W,y,al_shape,#boss_d_9
	s_set_strat		y,wings_istrat
	s_set_alsflag		x,sflag2

	a16
	tya
	sta	al_sWPy1,x
	a8
;	s_set_alvartobeobj	x,al_sWPy1,y	; link 'em up
	s_jsr			.position5

	s_clr_alsflag		x,sflag1
	clc
.dekinai
	s_rts

.waveheads
	lda	gameframe
	asl	a
	asl	a
	sta	y1
	s_set_alvar2vartab	B,B,B,x,al_sbyte3,y1,sintab,-3
	s_rts
.position1
	s_jsr			fling.copyrots_yx

	lda.w	al_roty,y
	sec
	sbc	al_sbyte3,x
	sec
	sbc	#deg11
	sta.w	al_roty,y

	lda.w	al_rotx,y
	clc
	adc	al_sbyte2,x
	clc
	adc	al_sbyte3,x
	clc
	adc	al_rotz,x
	sec
	sbc	#deg90+deg45+deg22
	sta.w	al_rotx,y

	lda.w	al_rotz,y
	clc
	adc	#deg180
	sta.w	al_rotz,y


	s_set_var		B,x1,#-10
	s_set_var		B,y1,#-50
	s_set_var		B,z1,#-15
	s_jsr			.addtabtoy
	s_jmp			fling.positional

.position2
	s_jsr			fling.copyrots_yx

	lda.w	al_roty,y
	clc
	adc	al_sbyte3,x
	clc
	adc	#deg180+deg11
	sta.w	al_roty,y

	lda.w	al_rotx,y
	sec
	sbc	al_sbyte4,x
	sec
	sbc	al_sbyte3,x
	clc
	adc	al_rotz,x
	sec
	sbc	#deg90-deg45-deg22
	sta.w	al_rotx,y


	s_set_var		B,x1,#10
	s_set_var		B,y1,#-50
	s_set_var		B,z1,#-15
	s_jsr			.addtabtoy
	s_jmp			fling.positional


.position3
	s_jsr			fling.copyrots_yx

	lda	gameframe
	asl	a
	asl	a
	asl	a
	sta	y1
	s_set_var2vartab	B,B,B,x1,y1,sintab,-2

	s_cmp_var	B,y1,#0
	beq		.soundit
	s_cmp_var	B,y1,#128
	bne		.nosound
.soundit
	phy
	a16
	lda	#2000
	jsr	dzdistless
	shorta
	ply
	bcc	.nosound
	trigse		$39
.nosound

	lda.w	al_roty,y
	clc
	adc	x1
	sta.w	al_roty,y

	lda.w	al_rotx,y
	clc
	adc	al_rotz,x
	clc
	adc	#deg11
	sta.w	al_rotx,y

	s_set_var		B,x1,#0
	s_set_var		B,y1,#-25
	s_set_var		B,z1,#15
	s_jsr			.addtabtoy
	s_jmp			fling.positional

.position4
	s_jsr			fling.copyrots_yx

	s_set_var		B,x1,#-18
	s_set_var		B,y1,#0
	s_set_var		B,z1,#0
	s_jsr			.addtabtoy
	s_jmp			fling.positional

.position5
	s_jsr			fling.copyrots_yx

	s_set_var		B,x1,#18
	s_set_var		B,y1,#0
	s_set_var		B,z1,#0
	s_jsr			.addtabtoy
	s_jmp			fling.positional

.addtabtoy
	phx
	lda	al_animframe,x
	a16
	and	#15
	asl	a
	tax
	a8
	lda.l	.updowntab,x
	clc
	adc	y1
	sta	y1
	lda.l	.updowntab+1,x
	clc
	adc	z1
	sta	z1
	plx
	rts

.updowntab	db	0,0
	db	-10,0
	db	-14,0
	db	-10,0
	db	0,0
	db	-10,0
	db	-14,0
	db	-10,0
	db	7,5
	db	15,10
	db	-2,-14
	db	4,-27
	db	15,-35

.triggeregg
;	a16
;	lda	#2000
;	s_jsr	dzdistless
;	shorta
;	bcs		.dontdo

	s_jmpNOT_alsflag	x,sflag3,.dontdo

	s_jmp_random	.dontdo,99
	s_set_objtobealvar	y,x,al_sword2
	s_jmp_alsflag		y,sflag2,.dontdo
	s_set_alsflag		y,sflag2
.dontdo
	rts

.chickenexplode
	s_start_strat
	s_set_objtobealvar	y,x,al_ptr
	s_jsl	kill_alptr_list_y_l
	s_set_objtobealvar	y,x,al_sword1
	s_jsl	kill_alptr_list_y_l
	s_set_objtobealvar	y,x,al_sword2
	s_jsl	kill_alptr_list_y_l
	s_jsr	.getwing1
	s_kill_obj	y
	s_jsr	.getwing2
	s_kill_obj	y

	s_set_expstrat	x,bossexplode_istrat
	s_end_Strat

	IFNE	prntrouln_on
	printroulen	chick,<dump chicken>
	ENDC


;--------------------------------------------------------------------

egg_istrat
eggy
	s_start_Strat
	s_sprite_obj	x,#0	;,#4
	s_set_Alptrs	x,.strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#eggHP+20,#eggAP
	s_Set_colltype	x,ENEMY1
	s_set_alsflag	x,shadow
	s_jsr		drotsflat_x
.strat	s_start_strat
	s_jsr		dfallyvec_x
	bcs		.explodeit
	s_add_alvars	W,x,al_worldy,x,al_vy
.end	s_end_strat
.explodeit	s_jmp_random	.notopen,30
	a16
	lda		#600
	s_jsr		dzdistless
	shorta
	s_bcs		.notopen
.explodeit2
	s_set_alvar	W,x,al_shape,#boss_d_7

	s_jsr		fling.makeobj
	s_bcs		.end
	s_set_alvar	W,y,al_shape,#boss_d_6
	s_jsr		copypos_yx
	s_jsr		fling.copyrots_yx
	s_set_strat	y,shell_istrat
	s_set_alvar	W,y,al_vy,#-15
	s_set_alsflag	y,hitflash

	s_set_alsflag	x,hitflash
	s_set_alvar	W,x,al_vy,#-15
	s_set_strat	x,.outcomesachicken
	trigse		$3a

	s_jsr		fling.makeobj
	bcs		.outcomesachicken
	s_set_alvar	W,y,al_shape,#boss_d_4
	s_jsr		copypos_yx
	s_jsr		fling.copyrots_yx
	s_set_strat	y,chick_istrat
	
.outcomesachicken
	s_start_strat
	s_add_alvars	W,x,al_worldy,x,al_vy
	s_add_alvar	B,x,al_rotz,#-6
	s_jsr		dfallyvec_x
	s_bcs		nothing_istrat
	s_sub_alvar	W,x,al_worldx,#15
	s_end_strat

.remove	s_remove_obj	x
	s_rts

.notopen	s_set_strat	x,.waittobehit
.waittobehit	s_start_strat
	s_cmp_alvar	B,x,al_Hp,#20+eggHP
	s_bne		.explodeit2
	s_end_strat

;--------------------------------------------------------------------
chick_istrat
	s_start_strat
	s_set_colltype	x,ENEMY1
	s_set_alsflag		x,shadow
	s_set_alptrs		x,.strat,hitflash_istrat,explode_istrat
	s_set_aldata		x,#chickHP,#chickAP
	s_set_objtobeplayer	y
	s_jsr			dobj2obj3dangle_xy
	s_set_alvar		B,x,al_vel,#80
	s_jsr			dgen3dvecs
.strat	s_start_strat
	s_add_playerz	x
	s_jsr		daddvecs2pos_x
	s_end_strat
;--------------------------------------------------------------------
nothing_istrat
	s_start_strat
	s_set_strat	x,nothing_istrat
	s_set_alsflag	x,colldisable
	s_end_strat
;--------------------------------------------------------------------
shell_istrat
	s_start_strat
	s_set_colltype	x,ENEMY1
	s_set_aldata	x,#hardHP,#hardAP
	s_set_alsflag	x,shadow
	s_add_alvars	W,x,al_worldy,x,al_vy
	s_add_alvar	W,x,al_worldx,#15
	s_add_alvar	B,x,al_rotz,#6
	s_jsr		dfallyvec_x
	s_bcs		nothing_istrat
	s_end_strat

	IFNE	prntrouln_on
	printroulen	eggy,<egg strategy>
	ENDC

;--------------------------------------------------------------------
firebreathe_istrat
	s_start_strat
	s_set_alvar	B,x,al_vel,#80
firebreathe2_istrat
	s_start_strat
	s_init_colanim	x,#0
	s_set_alsflag	x,nohitaffect
	s_set_aldata	x,#hardHP,#firebreathAP
	s_set_colltype	x,ENEMY1
	s_set_alvar	B,x,al_sbyte1,#2	; animation speed
	s_sprite_obj	x,#0
.backagain
; restart point if fire hits ground
	s_set_alptrs	x,.strat,hitflash_istrat,explode_istrat
	s_jsr	dgen3dvecs
	s_jsr	drotsflat_x
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.strat	s_start_strat
	s_add_colanim	x,#1,#2

; create a trail piece
	s_push_var	W,allst
	stx		allst
	s_make_obj	#firebreath,.cantadd
	s_copy_pos	y,x
	s_copy_rots	y,x
	s_set_strat	y,.short_istrat
	s_copy_alvar2alvar	B,y,al_sbyte1,x,al_sbyte1
.cantadd
	s_pull_var	W,allst

; move the fire ball
	s_add_playerz	x
	s_jsr		daddvecs2pos_x

; bounds checking
	s_jmp_alvarpl		W,x,al_worldy,.ifhitground
	s_jmp_alvarOUTLIMIT	W,x,al_worldx,1000,.short_istrat

; if out of range then remove
	a16
	lda	#4000
	s_jsr	dzdistless
	shorta
	s_bcc	.short_istrat
.end	s_end_strat
.ifhitground
	s_set_alvar	W,x,al_worldy,#0
	s_set_alvar	B,x,al_sbyte1,#2
	s_set_alvar	B,x,al_vel,#80
	s_set_objtobeplayer	y
	s_jsr	dobj2obj3dangle_xy
	s_set_strat	x,.backagain
	s_end_strat

.short_istrat
	s_start_strat
	s_set_colltype	x,ENEMY1
	s_add_playerz	x
	s_jsr		drotsflat_x
	s_init_colanim	x,#0
	s_set_alptrs	x,.sstrat,hitflash_istrat,explode_istrat
	s_set_alsflag	x,nohitaffect
	s_set_aldata	x,#hardHP,#firebreathAP
	s_sprite_obj	x,#0
.sstrat	s_start_strat
	s_copy_alvar2var	B,x,svar_byte1,al_sbyte1
	s_add_colanim	x,svar_byte1,#8,.rem
	s_end_strat
.rem	s_remove_obj	x
	s_jmp		.end


;--------------------------------------------------------------------

	IFNE	prntrouln_on
	printroulen	firebreathe_istrat,<fire breath>
	ENDC

;--------------------------------------------------------------------
; mode change code
	shorta
modechangeadd_l
	sta	x1
	lda	al_stratstate,x
	clc
	adc	x1
	sta	al_stratstate,x
	rtl

modechangeset_l
	sta	al_stratstate,x
	rtl

jumptostate_l
	sty	tmpstate
	lda	al_stratstate,x
	a16
	and	#255
	asl	a
	asl	a
	tay
	a8
	lda.l	[tempaddrl],y
	pha
	iny
	a16
	lda.l	[tempaddrl],y
	pha
	a8
	ldy	tmpstate
	rtl

;--------------------------------------------------------------------

wings_istrat
	s_start_strat
	s_set_alptrs	x,.strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#hardHP,#hardAP
	s_set_alsflag	x,nohitaffect
	s_set_alsflag	x,colldisable
	s_set_alsflag	x,shadow
	s_clr_altype	x,zremove
	s_init_anim	x,#0
.strat	s_start_Strat
	s_jmp_alsflag	x,sflag1,.fold
	s_add_anim	x,#1,#15
	s_cmp_anim	x,#14
	s_bne		.ok
	s_init_anim	x,#4
.ok
.end	s_end_strat
.fold	s_cmp_anim	x,#0
	s_beq		.done
	s_add_anim	x,#-1,#15
.done	s_jmp	.end

;--------------------------------------------------------------------

	IFEQ	1
speeddowntail	=	6

parasite_istrat
	s_start_strat
	s_move_objtoend	x
	s_set_alptrs	x,.strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#64,#hardAP
	s_clr_altype	x,zremove
	s_set_colltype	x,ENEMY1
	s_end_strat

.strat	s_start_Strat

	s_cmp_alvar	B,x,al_hp,#64-8
	s_bpl		.okey
	s_set_alvar	B,x,al_hp,#64
	s_set_alsflag	x,sflag1
.okey
	s_jmp_NOTalsflag	x,sflag1,.okndo
	s_jsr		.movealongtail
.okndo
	txy
	s_set_objtobealvar	x,y,al_ptr
	s_beq		.nopos
	s_jsr		.position
.nopos	tyx
	s_end_strat


.movealongtail
	s_add_alvar	B,x,al_sbyte1,#speeddowntail
	s_cmp_alvar	B,x,al_sbyte1,#armlength/2
	s_bmi		.tisokfornow

	s_set_objtobealvar	y,x,al_ptr
	s_copy_alvar2alvar	W,x,al_ptr,y,al_ptr
	s_set_alvar		B,x,al_sbyte1,#0
	s_clr_alsflag		x,sflag1
	s_jmp_alvarNOTzero	W,x,al_ptr,.tisokfornow
	s_or_var		B,armmode,#16
	s_set_strat		x,.droptoground
.tisokfornow
	s_rts
.position
	s_jsr		fling.copyrots_yx
	s_set_var	B,x1,#0
	s_set_var	B,y1,#0
	s_copy_alvar2var.w	B,y,z1,al_sbyte1
	s_jmp		fling.positional

.droptoground
	s_start_strat
	s_set_alvar	B,x,al_rotx,#0
	s_set_alvar	B,x,al_rotz,#0
	s_jsr	dfallyvec_x
	bcs	.nxtstrat
	s_add_alvars	W,x,al_worldy,x,al_vy
	s_end_strat
.nxtstrat	s_set_strat	x,.wigglearound
	s_set_alvar	B,x,al_vel,#60
.wigglearound
	s_start_Strat
	s_jsr		dgenvecs
	s_jsr		daddvecs2pos_x
	s_set_objtobeplayer	y
	s_add_playerz	x

	a16
	lda	al_worldz,x
	sec
	sbc.w	al_worldz,y
	bmi	.ara
	cmp	#3000
	bmi	.daijob2
	a8
	s_set_alsflag	x,sflag1
	bra	.carryon2
.daijob2	longa
	cmp	#1000
	a8
	bpl	.daijob
.ara	a8
	s_clr_alsflag	x,sflag1
	bra	.carryon2

.daijob	s_jmp_alsflag	x,sflag1,.otherway
	a16
	lda	al_worldx,x
	cmp.w	al_worldx,y
	a8
	bmi	.subit

	lda	al_roty,x
	cmp	#deg90-deg22
	beq	.carryon2
	clc
	adc	#-8
	bra	.carryon
.subit	lda	al_roty,x
	cmp	#-deg90+deg22
	beq	.carryon2
	clc
	adc	#-8
.carryon	and	#~7
	sta	al_roty,x
.carryon2
.end
	s_end_strat
.otherway
	lda	al_roty,x
	cmp	#deg180
	beq	.carryon2
	clc
	adc	#8
	bra	.carryon


	ENDC


;--------------------------------------------------------------------
; y is first object in list
kill_alptr_list_y_l
	php
	phx
	tyx
	a8
.carryon
	ldy	al_ptr,x
	s_kill_obj	x
	tyx
	bne	.carryon

	plx
	plp
	rtl

;--------------------------------------------------------------------
; this moves the object (x) to the end of the list

moveobjtoend_l
	php
	ai16
	phy
	txa

; find the bottom of the list
.nxt	tay
	lda.w	_next,y
	bne	.nxt

	stx	x1
	cpy	x1
	beq	.alreadythere

	stx	_next,y
	lda	_prev,x
	sty	_prev,x
	tay
	bne	.ok
	lda	_next,x
	bra	.notok
.ok	lda	_next,x
	sta.w	_next,y
.notok
	sty	x1
	tay
	lda	x1
	sta.w	_prev,y
	stz	_next,x

.alreadythere
	ply
	plp
	rtl

;--------------------------------------------------------------------

bike2_istrat
	s_start_strat
	s_set_colltype	x,ENEMY1
	s_init_anim	x,#7
	s_add_playerz	x
	s_cmp_alvar	B,x,al_sbyte1,#5
	bcs		.nodec
	s_set_alvar	W,x,al_sword1,#-20
.nodec
	s_sub_alvar	W,x,al_worldz,#5
	s_inc_alvar	B,x,al_sbyte1
	s_cmp_alvar	B,x,al_sbyte1,#11
	s_beq		madbiker_istrat	
	s_end_strat
madbiker_istrat
	s_start_strat
	s_set_alptrs	x,.strat,.hit,.explode
	s_set_aldata	x,#madbikerHP,#madbikerAP
	s_clr_altype	x,zremove
	s_init_anim	x,#7
	s_set_colltype	x,ENEMY2
	s_set_alsflag	x,shadow
	s_copy_alvar2alvar	W,x,al_sword2,x,al_worldy
	jsl		makeengine_srou_l
	cpy		#0
	beq		.noboost
	s_clr_altype	y,zremove
	s_set_alvar	B,y,al_tx,#-10
	s_set_relpos	y,#0,#-5,#-10
.noboost
	set_sound2	x,#9
	s_mode_change	x,#0
.strat	s_start_strat
	s_mode_table
	s_mode_entry	.movealongside
	s_mode_entry	.shuntplayer
	s_mode_label	boostit
	s_mode_entry	.rightwayup
	s_mode_entry	.initboost
	s_mode_entry	.doboost
	s_mode_entry	.awayfromplayer
	s_mode_label	repeathere
	s_mode_entry	.movealongside
	s_mode_entry	.shuntplayer
	s_mode_entry	.waittwosecs
	s_mode_label	playaway
	s_mode_entry	.awayfromplayer
	s_mode_entry	.rightwayup
	s_mode_entry	.randomjump

	s_mode_table_end

;*********
.repeat
	s_mode_change	x,#repeathere
	s_jmp		.strat
;*********
.randomjump
	s_jmp_random	.repeat,90
	s_mode_change	x,#boostit
	s_jmp		.strat
;*********

.movealongside
	s_jmp_alsflag	x,sflag1,.gitaway
	s_set_objtobeplayer	y
	a16
	lda	al_worldz,x
	sec
	sbc	#120
	cmp.w	al_worldz,y
	s_jsr	truck_accel
	shorta
	lda	al_sbyte2,x
	inc	a
	sta	al_sbyte2,x
	cmp	#30
	s_bne	.move
	stz	al_sbyte2,x
	s_mode_change	x,+1
	s_jmp		.move
.gitaway
	s_set_alvar		B,x,al_sbyte1,#7
	s_mode_change	x,#playaway
	s_jmp		.move

;*********
.waittwosecs
	s_set_objtobeplayer	y
	a16
	lda	al_worldz,x
	clc
	adc	#10
	cmp.w	al_worldz,y
	s_jsr	truck_accel
	shorta
	lda	al_sbyte2,x
	inc	a
	sta	al_sbyte2,x
	cmp	#8
	s_bne	.move
	stz	al_sbyte2,x
	s_mode_change	x,+1
	s_jmp	.move
;*********

.shuntplayer
	s_set_alvar		B,x,al_sbyte1,#5
	s_jmp_alsflag		x,sflag1,.spnxtmode
	s_add_alvar		W,x,al_worldz,#-15
	s_add_alvar		B,x,al_rotz,#-4
	s_set_objtobeplayer	y
	s_cmp_alvars		W,x,al_worldx,y,al_worldx
	s_bmi			.otherway
	s_add_alvar		B,x,al_rotz,#8
.otherway
	lda	al_rotz,x
	s_beq	.nmode
	clc
	adc	#deg45
	cmp	#deg90
	s_bcc	.move
.nmode
	s_mode_change		x,+1
	s_set_alsflag		x,sflag2
	s_jmp			.move
.sp2nxtmode
	s_set_alvar		B,x,al_sbyte1,#7
.spnxtmode
	s_jmp			.nxtmode

;*********

.awayfromplayer
	s_jmp_alsflag		x,sflag2,.nnmode
	s_add_alvar		W,x,al_worldz,#10
	s_set_alvar		B,x,al_sbyte4,#8
	s_set_objtobeplayer	y
	s_cmp_alvars		W,x,al_worldx,y,al_worldx
	s_bmi			.otherwayfrom
	s_set_alvar		B,x,al_sbyte4,#-8
.otherwayfrom
	s_add_alvars		B,x,al_rotz,x,al_sbyte4
	s_decbne_alvar		B,x,al_sbyte1,.move
	s_mode_change		x,+1
	s_jmp			.move
.nnmode
	s_clr_alsflag		x,sflag2
	s_jmp			.nxtmode

;*********
.rightwayup
	lda	al_rotz,x
	s_beq	.nxtmode
	bmi	.addrz
	sec
	sbc	#8
.addrz	clc
	adc	#4
	sta	al_rotz,x
	s_jmp	.move

;*********

.initboost
	s_mode_change		x,+1

;*********
.doboost
	s_jmp_alsflag		x,sflag1,.sp2nxtmode
	s_add_alvar		W,x,al_worldz,#20
	s_beqdec_alvar		B,x,al_sbyte1,.nxtmodeclr
	s_jmp			.move
.nxtmodeclr	s_set_alsflag		x,sflag2
.nxtmode	s_mode_change		x,+1
	s_jmp			.move

; - - - - - - - - - - - - - - - - - - - - - - - -
.hit	s_start_strat
	s_set_alsflag	x,sflag1

	s_set_objtobealvar	y,x,al_collobjptr

	s_clr_alsflag		x,nohitaffect
	s_jmp_alcollflag	y,weapon,.normhit
	s_set_alsflag		x,nohitaffect
.normhit	jml		hitflash_istrat

; - - - - - - - - - - - - - - - - - - - - - - - -
.explode	s_start_Strat
	s_set_alptrs	x,.konostrat,hitflash_istrat,explode_istrat
	s_Set_alvar	W,x,al_sword2,#0
	s_set_alvar	B,x,al_hp,#1
	s_clr_colltype	x,ENEMY2
.konostrat
	s_start_Strat
	s_sub_alvars	W,x,al_worldz,x,al_sword2
	s_add_alvar	W,x,al_sword2,#3
	s_falldown_Yvec		x,1,#4,#-25,explode_istrat
	s_add_playerz	x
	s_add_alvars	W,x,al_worldy,x,al_vy
	s_add_alvar	B,x,al_rotx,#4
	s_jmp_NOTalsflag x,sflag6,.noflip
	s_add_alvar	B,x,al_rotx,#24
	s_cmp_alvar	B,x,al_rotx,#24
	s_bcc		.killit
.noflip
	a16
	lda	al_worldy,x
	clc
	adc	#25
	a8
	bmi	.dontset
	s_set_alsflag	x,sflag6
.dontset
	s_end_strat
.killit	s_kill_obj	x
	s_end_strat
; - - - - - - - - - - - - - - - - - - - - - - - -
.boundscheck
	a16
	lda	al_worldx,x
	clc
	adc	#15
	cmp	maxpmoveX
	bpl	.hitwall
	a8
	rts
.hitwall	longa
	lda	maxpmoveX
	sec
	sbc	#16
	sta	al_worldx,x
	a8

	phx
	txy
	s_set_objtobevar	x,dummyobj
	s_copy_pos		x,y
	s_add_alvar		W,x,al_worldx,#15
	s_jsl	sgenspark_srou_l
	plx
	s_add_alvar		B,x,al_rotz,#8
	rts

; - - - - - - - - - - - - - - - - - - - - - - - -
.move

	lda	al_rotz,x
	eor	#255
	inc	a
	asra
	asra
	a16
	sexa
	clc
	adc	al_worldx,x
	sta	al_worldx,x

	s_push_alvar		W,x,al_worldx
	s_set_objtobeplayer	y
	s_fchase_alvar2alvar	W,x,al_sword2,y,al_worldy,1
	s_copy_alvar2alvar	W,x,al_worldy,x,al_sword2
	s_float		x,64
	s_pull_alvar		W,x,al_worldx

	s_add_playerz	x

	s_jsr	.boundscheck

	s_clr_alsflag	x,sflag1

	jsl	updateengine_srou_l
.end
	s_end_Strat


;--------------------------------------------------------------------
roadline_istrat
	s_start_strat
	s_set_alsflag	x,colldisable
	s_set_alsflag	x,shadowshape
	s_set_altype	x,gnd
	s_end_strat
;--------------------------------------------------------------------

madtrucker_istrat
	s_start_Strat
	s_set_var		B,maptrigger,#0
	s_set_aldata	x,#madtruckerHP,#madtruckerAP
	s_clr_altype	x,zremove
	s_init_anim	x,#0
	s_set_colltype	x,ENEMY1
	s_set_alsflag	x,shadow
	s_jsr		.generate
	s_bcs		.end
	s_set_alptrs	x,.strat,.hit,.explode
	s_mode_change	x,#0
	s_set_bossmaxHP	#madtruckerHP
	set_sound2	x,#8
.strat	s_start_strat
	s_mode_table

	s_mode_entry	.bargeforward
	s_mode_entry	.maketwobikes
	s_mode_entry	.openup
	s_mode_entry	.moveleftlane
	s_mode_entry	.close
	s_mode_entry	.movefarleft

	s_mode_label	bikesagain
	s_mode_entry	.waitforbikes
	s_mode_entry	.movefarforward
	s_mode_entry	.bumpitup
	s_mode_entry	.dropmines
	s_mode_entry	.waitabit4
	s_mode_entry	.bumpitdown
	s_mode_entry	.chkbikesagain

	s_mode_label	madbikesdead
	s_mode_entry	.hangback
	s_mode_entry	.waitabit3
	s_mode_entry	.movefarleft3
	s_mode_entry	.repeat

	s_mode_table_end

;**********
.movefarforward
	a16
	lda	#1200
	s_jsr	dzdistless
	shorta
	s_bcc	.nxttime
	s_jmp_alsflag	x,sflag1,.leftlane22
	s_jsr	.rightlane
	s_bra	.rightlane22
.leftlane22	s_jsr	.leftlane
.rightlane22
	s_jmp	.move4
.nxttime	s_not_alsflag	x,sflag1
	s_jmp		.nxtmode
;**********
.dropmines
	s_jsr	fling.makeobj
	s_bcs	.nxtmode
	s_jsr	fling.copyrots_yx
	s_set_alvar	W,y,al_shape,#barrier
	s_set_strat	y,barrier_istrat
	s_set_var	B,z1,#-40
	stz	y1
	stz	x1
	s_jsr	fling.positional
	s_jmp	.nxtmode

;**********
.repeat
	s_mode_change	x,#0
	s_jmp		.strat
;**********
.nxtmode	a8
	s_mode_change	x,+1
	s_jmp		.strat

;**********
.hangaround
	s_jmp		.move
;**********
.rightlane	a16
	lda	al_worldx,x
	bmi	.nochk2
	cmp	#30
	bcs	.secit2
.nochk2	clc
	adc	#2
	sta	al_worldx,x
	a8
	clc
	rts
.secit2	a8
	sec
	rts
;**********
.leftlane
	a16
	lda	al_worldx,x
	bpl	.nochk
	cmp	#-70
	bcc	.secit1
.nochk	sec
	sbc	#4
	sta	al_worldx,x
	a8
	clc
	rts
.secit1	a8
	sec
	rts
;**********
.openup
	s_jsr	.openback
	s_bcs	.nxtmode
	s_jmp	.move

.openback
	s_set_objtobealvar	y,x,al_ptr
	s_cmp_anim	y,#1
	bne		.nosound
	trigse		$5a
.nosound
	s_add_anim	y,#1,#13,.secret
	clc
	s_rts
.secret	sec
	s_Rts
;**********
.close
	s_jsr	.closeback
	s_bcs	.nxtmode
	s_jmp	.move
.closeback
	s_set_objtobealvar	y,x,al_ptr
	s_cmp_anim	y,#10
	bne		.nosound2
	trigse	$59
.nosound2
	s_cmp_anim	y,#0
	cmp	#0
	s_beq		.secret
	s_add_anim	y,#-1,#16
	s_rts
;**********
.movefarleft
	s_jsr	.farleftlane
	s_bcs	.nxtmode
	s_jmp	.move2
.movefarleft3
	s_jsr	.farleftlane
	s_bcs	.nxtmode
	s_jmp	.move3
;**********
.moveleftlane
	s_jsr	.leftlane
	s_bcs	.nxtmode
	s_jmp	.move2
;**********
.farleftlane
	a16
	lda	al_worldx,x
	bpl	.nochk3
	cmp	#-160
	bcs	.nochk3
	s_or_var	B,maptrigger,#1
	sec
	rts
.nochk3	longa
	sec
	sbc	#5
	sta	al_worldx,x
	a8
	clc
	rts
;**********
.waitforbikes
	s_jmp_random	.nxtmode,1
	ldy	#air_1
	jsl	find_y_l
	cpy	dummyobj
	s_bne	.move2
	s_mode_change	x,#madbikesdead
	s_jmp		.strat

;**********
.chkbikesagain
	s_mode_change	x,#bikesagain
	s_jmp		.strat

;**********
.bumpitup
	s_sub_alvar	W,x,al_worldy,#2
	s_jsr	.openback
	s_jsr	.openback
	s_jsr	.openback
	s_bcs	.nxtmode
	s_jmp	.move
;**********
.bumpitdown
	s_add_alvar	W,x,al_worldy,#2
	s_jsr	.closeback
	s_jsr	.closeback
	s_jsr	.closeback
	s_bcs	.nxtmode
.npullptr
	s_jmp	.move
	

;**********
.maketwobikes
	s_jsr	fling.makeobj
	s_bcs	.nxtmode
	s_jsr	fling.copyrots_yx
	s_set_alvar	W,y,al_shape,#air_1
	s_set_strat	y,bike2_istrat
	stz	z1
	s_set_var	B,y1,#10
	s_set_var	B,x1,#7
	s_jsr	fling.positional

	s_jsr	fling.makeobj
	s_bcs	.nxtmode
	s_jsr	fling.copyrots_yx
	s_set_alvar	W,y,al_shape,#air_1
	s_set_strat	y,bike2_istrat
	stz	z1
	s_set_var	B,y1,#10
	s_set_var	B,x1,#-7
	s_jsr	fling.positional


	s_jmp	.nxtmode
;**********
.bargeforward

	s_jsr		.rightlane
	s_bcs		.nxtmode

	jmp		.move2

;**********
.hangback
	s_jsr		.rightlane
	bcs		.hbnxt
	
	s_jmp		.move3
.hbnxt	s_or_var	B,maptrigger,#1
	s_jmp		.nxtmode

;**********
.waitabit3
	lda	al_sbyte1,x
	inc	a
	sta	al_sbyte1,x
	cmp	#55
	s_bne	.move3
	stz	al_sbyte1,x
	s_jmp	.nxtmode

;**********
.waitabit4	lda	al_sbyte1,x
	inc	a
	sta	al_sbyte1,x
	cmp	#15
	s_bne	.move4
	stz	al_sbyte1,x
	jmp	.nxtmode


;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

.generate
	s_jsr			fling.makeobj
	bcs			.dekinai
	s_set_strat		y,hard_istrat
	s_init_anim		y,#0
	s_clr_altype		y,zremove
	s_set_colltype		y,ENEMY1
	s_set_alvartobeobj	x,al_ptr,y	; link 'em up
	s_set_alvar		W,y,al_shape,#boss_9_0
	s_jsr			.position1

	clc
	rts

.dekinai
	sec
	rts

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.position1
	s_jsr			fling.copyrots_yx

	s_set_var		B,x1,#0
	s_set_var		B,y1,#0
	s_set_var		B,z1,#-24+(20/4)
	s_jmp			fling.positional

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.move4
	s_set_objtobeplayer	y
	a16
	lda	al_worldz,x
	sec
	sbc	#1200
	cmp.w	al_worldz,y
	s_jsr	truck_accel
	shorta
	jmp	.move
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.move3
	s_set_objtobeplayer	y
	a16
	lda	al_worldz,x
	sec
	sbc	#120
	cmp.w	al_worldz,y
	s_jsr	truck_accel
	shorta
	s_set_objtobeplayer	y
	a16
	lda	al_worldz,x
	sec
	sbc	#50
	cmp.w	al_worldz,y
	a8
	s_bpl	.move
	a16
	lda.w	al_worldz,y
	clc
	adc	#50
	sta	al_worldz,x
	jmp	.move
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.move2
	s_set_objtobeplayer	y
	a16
	lda		al_worldz,x
	sec
	sbc		#600
	cmp.w		al_worldz,y
	s_jsr		truck_accel
	shorta
	jmp		.move
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.hit	s_start_strat

	s_set_objtobealvar	y,x,al_ptr
	exg_xy
	s_cmp_anim	x,#0
	s_bne		.tabunactual
	exg_xy
	jmp		.noactualhit
.tabunactual
	s_test_hitflags	x,#HF1
	s_beq		.carryon
	s_clr_hitflags	x,#HF1
	exg_xy
	s_jmp		.noactualhit
.carryon	exg_xy
	s_test_hitflags	x,#HF2
	s_bne		.actualhit
.noactualhit
	s_Set_alsflag	x,nohitaffect
	jml		hitflash_istrat
.actualhit
	s_clr_hitflags	x,#HF2
	s_clr_alsflag	x,nohitaffect
	jml		hitflash_istrat
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.move
	s_add_playerz	x
.nomove
	s_set_objtobealvar	y,x,al_ptr
	s_jsr			.position1

	s_add_bossHP	x,al_hp
.end	s_end_strat

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

.explode
	s_start_strat
	s_set_objtobealvar	y,x,al_ptr
	s_set_altype	y,zremove
	s_set_expstrat	x,.swerveviolently
	s_set_alvar	B,x,al_sbyte1,#35
	trigse		$1e
	startbgm	$f1
	set_sound2	x,#0
.swerveviolently
	s_start_strat
	s_decbne_alvar	B,x,al_sbyte1,.swervy
	s_set_expstrat	x,.skid
	s_or_var	B,maptrigger,#2
	s_set_alvar	W,x,al_sword1,#20
	jsl		bigwhiteFOsprite_l
	stx		circleobj
	IFNE	RUMBLE
	s_queue_rumble	5,5,20
	ENDC
	trigse		$1d
	s_jmp		.skid
.swervy
	lda	gameframe
	asl	a
	asl	a
	asl	a
	asl	a
	sta	x1
	s_set_alvar2vartab	B,B,B,x,al_roty,x1,sintab,-3
	s_jsr		.farleftlane
	s_jsr		.destroybikes
	s_jsr		.genspark
	s_jmp		.move

.skid
	s_start_strat
	s_set_objtobeplayer	y
	a16
	lda.w	al_worldz,y
	cmp	al_worldz,x
	bmi	.notbehind
	stz	circleanim
	stz	circleobj
	a8
	s_remove_obj	x
	s_end_strat
.notbehind
	a8
	s_or_var	B,maptrigger,#2
	s_achase_alvar	B,x,al_roty,#-deg45-deg22,2,.nozchange
	s_set_alvar	W,x,al_sword1,#40
.nozchange
;	s_jsr		.destroybikes
;	s_jsr		.farleftlane
;	s_jsr		.genspark
;	s_jmp		.move

;.flipitover	s_set_strat	x,.flippul
.flippul	s_start_strat
	s_add_alvar	W,x,al_worldx,#-4
	s_cmp_alvar	B,x,al_rotz,#deg90
	s_beq		.ending
	s_add_alvar	B,x,al_rotz,#deg11
.ending
	s_add_alvars	W,x,al_worldz,x,al_sword1
	s_jmp_alvarMI	W,x,al_sword1,.noadd
	s_sub_alvar	W,x,al_sword1,#15
.noadd
	s_jsr		.destroybikes
	s_jsr		.genspark
	s_jsr		.genspark2
	s_jmp		.nomove

.destroybikes
	ldy	#air_1
	s_jsl	find_y_l
	s_kill_obj	y
	s_rts

.genspark
	phx
	txy
	s_set_objtobevar	x,dummyobj
	s_copy_pos		x,y
	s_add_alvar		W,x,al_worldz,#-30
	s_add_alvar		W,x,al_worldy,#60
	s_jsl	sgenspark_srou_l
	plx
	rts
.genspark2
	phx
	txy
	s_set_objtobevar	x,dummyobj
	s_copy_pos		x,y
	s_add_alvar		W,x,al_worldz,#-10
	s_add_alvar		W,x,al_worldx,#50
	s_add_alvar		W,x,al_worldy,#60
	s_jsl	sgenspark_srou_l
	plx
	rts


;--------------------------------------------------------------------
barrier_istrat
	s_start_strat
	s_set_alptrs	x,.strat,.hit,explode_istrat
	s_set_aldata	x,#barrierHP,#barrierAP
	s_set_alvar	B,x,al_roty,#deg180
	s_init_anim	x,#0
	s_set_alvar	W,x,al_vy,#0
	set_sound2	x,#3
.strat	s_start_Strat
	s_jsr	dfallyvec_x
	bcs	.nxtstrat
	s_add_alvars	W,x,al_worldy,x,al_vy
.end	s_end_Strat
.nxtstrat	s_set_strat	x,.strat2
.strat2	s_start_Strat
	s_add_anim	x,#1,#16,.nxtstrat2
	s_Jmp		.end
.nxtstrat2	s_set_strat	x,.strat3
.strat3	s_start_strat
	s_add_anim	x,#1,#16,NOJUMP,#13
	s_jmp		.end

.hit	s_start_strat
	s_test_hitflags	x,HF1
	s_bne		.realhit
	s_set_alsflag	x,nohitaffect
	jml		hitflash_istrat
.realhit
	s_clr_hitflags	x,HF1
	s_clr_alsflag	x,nohitaffect
	jml		hitflash_istrat

;--------------------------------------------------------------------

castanet_istrat
	s_start_strat

	s_set_alsflag	x,colldisable
	s_set_aldata	x,#hardHP,#hardAP
	s_set_colltype	x,ENEMY1
	s_init_anim	x,#0
	s_clr_altype	x,zremove
	s_set_bossmaxHP	#castanetHP*2

	s_jsr		.generate
	s_bcs		.end
	s_set_alptrs	x,.strat,hitflash_istrat,0
	s_set_alsflag	x,nohitaffect
	s_mode_change	x,#0
.strat	s_start_strat
	s_mode_table
	s_mode_entry	.rolloninit
	s_mode_entry	.rollon
	s_mode_entry	.moveaway,cast_repeat
	s_mode_entry	.generateminis
	s_mode_entry	.moveapart
	s_mode_entry	.movetoplayer
	s_mode_entry	.smashtogether
	s_mode_entry	.moveaway
	s_mode_entry	.rotate90r
	s_mode_entry	.generateminis
	s_mode_entry	.moveapart
	s_mode_entry	.movetoplayer
	s_mode_entry	.smashtogether
	s_mode_entry	.moveaway
	s_mode_entry	.rotate90l

;	s_mode_entry	.moveapart
;	s_mode_entry	.launchminis
;	s_mode_entry	.smashtogether

;;	s_mode_entry	.beginspinning
;;	s_mode_entry	.spinuptospeed
;;	s_mode_entry	.beginwhizz
;;	s_mode_entry	.forward
;;	s_mode_entry	.backward
;;	s_mode_entry	.forward
;;	s_mode_entry	.backward

;;	s_mode_entry	.waitfor0
	s_mode_entry	.checkhp
	s_mode_entry	.moveapart
	s_mode_entry	.aim
	s_mode_entry	.fire
	s_mode_entry	.smashtogether
	s_mode_entry	.rotate90r
	s_mode_entry	.moveapart
	s_mode_entry	.aim
	s_mode_entry	.fire
	s_mode_entry	.smashtogether
	s_mode_entry	.rotate90l


	s_mode_entry	.repeat

	s_mode_table_end
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
;**********
.rolloninit	SHORTA
	s_add_alvar	W,x,al_worldz,#6000
	s_add_alvar	W,x,al_worldy,#4000
	s_set_alvar	W,x,al_sword2,#-500
	s_set_alsflag	x,sflag8
	jmp		.nxtmode

;**********
.rollon	SHORTA
	s_add_alvars	W,x,al_worldy,x,al_sword2
	s_add_alvar	W,x,al_sword2,#20
	s_sub_alvar	W,x,al_worldz,#150
	a16
	lda		#2000
	jsr		dzdistless
	SHORTA
	s_bcs		.nxtmode
	jmp		.move


;**********
.repeat	SHORTA
	s_mode_change	x,#cast_repeat
	jmp		.strat

;**********
.checkhp
	s_jsr	.gethp
	cmp	#castanetHP+castanetHP/2
	s_bcc	.nxtmode
	s_Jmp	.repeat

.gethp
	s_set_objtobealvar	y,x,al_ptr
	lda.w	al_hp,y
	sta	x1
	s_set_objtobealvar	y,x,al_sword1
	lda.w	al_hp,y
	clc
	adc	x1
	rts
	
;**********
.aim
	s_achase_alvar	B,x,al_sbyte3,#deg22,2,.nxtmode
	s_set_var	B,powerbuild,#0
	s_jmp		.move

;**********
.fire
	lda	al_sbyte1,x
	lsr	a
	lsr	a
	lsr	a
	sta	svar_byte1
	s_add_anim		x,svar_byte1,#8

	s_set_objtobealvar	y,x,al_ptr
	s_set_alsflag		y,sflag1
	s_set_objtobealvar	y,x,al_sword1
	s_set_alsflag		y,sflag1
	s_inc_alvar		B,x,al_sbyte1
	s_cmp_alvar		B,x,al_sbyte1,#40
	s_bcc			.move
	s_set_var		B,powerbuild,#1
	s_set_objtobealvar	y,x,al_ptr
	s_clr_alsflag		y,sflag1
	s_set_objtobealvar	y,x,al_sword1
	s_clr_alsflag		y,sflag1
	s_cmp_alvar		B,x,al_sbyte1,#60
	s_bcc			.move
	s_jmp			.znxtmode
;;;**********
;;.waitfor0
;;	s_cmp_alvar	B,x,al_count,#4
;;	s_bne		.move3
;;	s_decbne_alvar	B,x,al_sbyte4,.noset1
;;	s_jmp_alvarZERO	B,x,al_rotx,.nxtmode
;;	s_set_alvar	B,x,al_sbyte4,#1
;;.noset1
;;	s_jmp		.move2
;;;**********
;;.beginwhizz
;;	s_set_alvar	B,x,al_count,#0
;;	s_copy_alvar2alvar W,x,al_sword2,x,al_worldx
;;	s_jmp		.nxtmode

;;;**********
;;.forward
;;	s_sub_alvar	W,x,al_worldz,#40
;;	s_inc_alvar	B,x,al_sbyte1
;;	s_cmp_alvar	B,x,al_sbyte1,#2000/40
;;	s_beq		.znxtmode
;;	
;;	s_jmp		.move3
;;;**********
;;.backward
;;	s_add_alvar	W,x,al_worldz,#30
;;
;;	a16
;;	lda	#2000
;;	s_jsr	dzdistless
;;	shorta
;;	s_bcc	.nxtmode
;;
;;	s_jmp		.move3


;;;**********
;;.beginspinning
;;
;;	s_inc_alvar	B,x,al_sbyte4
;;	s_cmp_alvar	B,x,al_sbyte4,#deg360/(360/15)+20
;;	s_beq		.nnnmode
;;
;;	lda	al_sbyte4,x
;;	cmp	#deg360/12
;;	bcc	.nolim
;;	lda	#deg360/12
;;.nolim	clc
;;	adc	al_rotx,x
;;	sta	al_rotx,x
;;	s_jmp		.move
;;.nnnmode	s_set_alvar	B,x,al_sbyte4,#deg360/(360/15)
;;	s_jmp		.nxtmode
;;
;;;**********
;;.spinuptospeed
;;	s_jmp_notdelay	1,.missit2
;;	s_dec_alvar	B,x,al_sbyte4
;;.missit2
;;	s_cmp_alvar	B,x,al_sbyte4,#5
;;	s_beq		.nxtmode
;;	s_jmp		.move2
;;

;**********
.generateminis
	s_jsr		.launchminicastanets
	s_jsr		.launchminicastanets
	s_jsr		.launchminicastanets
	s_jsr		.launchminicastanets
	s_jmp		.nxtmode

.launchminicastanets
	s_jsr		fling.makeobj
	s_bcs		.cantdo
	s_set_strat	y,path_istrat
	s_set_path	y,minicastanet
	s_jmp_NOTalsflag x,sflag1,.nototherpath
	s_set_path	y,minicastanetLR
.nototherpath
	s_set_alvar	W,y,al_shape,#boss_e_4
	s_set_colltype	y,ENEMY1
	s_set_aldata	y,#minicastanetHP,#minicastanetAP
	s_jsr		copypos_yx
	s_jsr		fling.copyrots_yx

	s_jsl		random_l
	a16
	sexa
	clc
	adc.w		al_worldx,y
	sta.w		al_worldx,y
	a8
	s_jsl		random_l
	a16
	sexa
	clc
	adc.w		al_worldy,y
	sta.w		al_worldy,y

	s_add_alvar	W,y,al_worldz,#20

	s_jsl	random_l
	and	#7
	asl	a
	asl	a
	sta.w	al_sbyte1,y
	
.cantdo
	s_rts

;**********
.znxtmode	stz	al_sbyte1,x
.nxtmode	s_mode_change	x,+1
	s_jmp		.strat
;**********
.moveapart
	s_set_objtobealvar	y,x,al_ptr
	s_set_collstrat		y,castbit_istrat.hit
	s_set_objtobealvar	y,x,al_sword1
	s_set_collstrat		y,castbit_istrat.hit
	s_inc_alvar	B,x,al_sbyte2
	s_inc_alvar	B,x,al_sbyte2
	s_cmp_alvar	B,x,al_sbyte2,#40
	s_bcs		.nxtmode	
	s_jmp		.move

;**********
.rotate90r
	s_set_alsflag	x,sflag1
	s_add_alvar	B,x,al_rotz,#8
	s_inc_alvar	B,x,al_sbyte1
	s_cmp_alvar	B,x,al_sbyte1,#deg90/8
	s_beq		.znxtmode
	s_jmp		.move
;**********
.rotate90l
	s_add_alvar	B,x,al_rotz,#-8
	s_inc_alvar	B,x,al_sbyte1
	s_cmp_alvar	B,x,al_sbyte1,#deg90/8
	s_beq		.zznxtmode
	s_jmp		.move
.zznxtmode
	s_clr_alsflag	x,sflag1
	s_jmp		.znxtmode
;**********
.movetoplayer
	s_achase_alvar	B,x,al_sbyte3,#deg45,2
	s_sub_alvar	W,x,al_worldz,#2000/100
	s_inc_alvar	B,x,al_sbyte1
	s_cmp_alvar	B,x,al_sbyte1,#100
	s_bcs		.znxtmode
	s_jmp		.move

;**********
.smashtogether
	s_achase_alvar	B,x,al_sbyte3,#0,1
	s_beqdec_alvar	B,x,al_sbyte2,.sndnxtmode
	s_beqdec_alvar	B,x,al_sbyte2,.sndnxtmode
	s_set_objtobealvar	y,x,al_ptr
	s_cmp_alvar		W,y,al_collstratptr,#0
	beq			.nosound
	trigse			$8d
.nosound
	s_set_collstrat		y,0
	s_set_objtobealvar	y,x,al_sword1
	s_set_collstrat		y,0
	s_jmp		.move

.sndnxtmode
	trigse		$8e
	s_jmp		.nxtmode

;**********
.moveaway
	s_clr_alsflag	x,sflag8
	a16
	lda	#2000
	s_jsr	dzdistless
	shorta
	s_bcc	.nxtmode
	s_add_alvar	W,x,al_worldz,#60
	s_jmp		.move

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.move3
	s_set_alvar2alvartab	B,B,W,x,al_worldx,x,al_count,sintab,1
	s_add_alvars		W,x,al_worldx,x,al_sword2
	s_set_alvar2alvartab	B,B,B,x,al_rotz,x,al_count,sintab,1
	s_add_alvar		B,x,al_count,#4
.move2
	s_add_alvars	B,x,al_rotx,x,al_sbyte4
	s_add_anim	x,#1,#8
.move

	s_set_objtobealvar	y,x,al_sword1
	s_jmp_alvarZERO.w	B,y,al_hp,.ok_change_mode
	s_set_objtobealvar	y,x,al_ptr
	s_bne			.movenochk
	s_set_objtobealvar	y,x,al_sword1
	s_bra			.ok_change_mode2
.ok_change_mode
	s_set_objtobealvar	y,x,al_ptr
.ok_change_mode2
	s_set_strat	y,trucklaunch_istrat
	s_remove_obj	x
	s_jmp		.end

.movenochk
	stz	locusmode
	s_jsr	.gethp
	cmp	#castanetHP/2
	bcs		.flagcheck
	lda		#2
	sta		locusmode
.flagcheck
	s_jmp_alsflag	x,sflag1,.onelocus
	lda	#1
	bra		.otherlocus
.onelocus	lda	#0
.otherlocus	ora	locusmode
	sta	locusmode

	s_add_playerz	x
	s_jmp_alsflag	x,sflag8,.nohomein
	s_set_objtobeplayer	y
	s_achase_alvar2alvar	W,x,al_worldx,y,al_worldx,4
	s_achase_alvar2alvar	W,x,al_worldy,y,al_worldy,4
.nohomein
	s_set_objtobealvar	y,x,al_ptr
	s_beq			.dontdo
	s_add_bossHP.w	y,al_hp
	s_jsr	.position1
.dontdo
	s_set_objtobealvar	y,x,al_sword1
	s_beq			.dontdo2
	s_add_bossHP.w	y,al_hp
	s_jsr	.position2
.dontdo2

.end	s_end_strat

.generate
	s_jmp_alvarNOTzero	W,x,al_ptr,.theothercastanet
	s_jsr			fling.makeobj
	s_bcs			.dekinai
	s_set_strat		y,castbit_istrat
	s_set_alvar		W,y,al_shape,#boss_e_0
	s_set_alvartobeobj	x,al_ptr,y	; link 'em up
	s_set_alvar		B,y,al_depthoffset,#1
	s_jsr			.position1
.theothercastanet
	s_jsr			fling.makeobj
	s_bcs			.dekinai
	s_set_strat		y,castbit_istrat
	s_set_alvar		W,y,al_shape,#boss_e_1
	s_set_alvartobeobj	x,al_sword1,y	; link 'em up
	s_set_alvar		B,y,al_hp,#1
	s_set_alvar		B,y,al_depthoffset,#2
	s_jsr			.position2
	clc
.dekinai	s_rts

.position1
	s_jsr		fling.copyrots_yx

	lda	al_animframe,x
	phx
	tyx
	sta	al_animframe,x
	plx

	s_jmp_alsflag	x,sflag1,.otherbit1

	lda.w	al_roty,y
	sec
	sbc	al_sbyte3,x
	sta.w	al_roty,y
	s_bra	.nototherbit1
.otherbit1
	lda.w	al_rotx,y
	sec
	sbc	al_sbyte3,x
	sta.w	al_rotx,y

.nototherbit1
	s_set_var		B,x1,#-42
	s_varsub_alvar		B,x,x1,al_sbyte2
	s_set_var		B,y1,#0
	s_set_var		B,z1,#0
	s_jmp			fling.positional

.position2
	s_jsr			fling.copyrots_yx

	lda	al_animframe,x
	phx
	tyx
	eor	#7
	sta	al_animframe,x
	s_add_anim	x,#-1,#8
	plx

	lda.w	al_rotz,y
	clc
	adc	#deg180
	sta.w	al_rotz,y


	s_jmp_alsflag	x,sflag1,.otherbit2


	lda.w	al_roty,y
	clc
	adc	al_sbyte3,x
	sta.w	al_roty,y

	s_bra	.nototherbit2
.otherbit2
	lda.w	al_rotx,y
	clc
	adc	al_sbyte3,x
	sta.w	al_rotx,y

.nototherbit2

	s_set_var		B,x1,#42
	s_varadd_alvar		B,x,x1,al_sbyte2
	s_set_var		B,y1,#0
	s_set_var		B,z1,#0
	s_jmp			fling.positional
	s_rts


;--------------------------------------------------------------------
castbit_istrat
	s_start_strat
	s_set_alptrs	x,.strat,.hit,explode_istrat
	s_set_aldata	x,#castanetHP,#castanetAP
	s_clr_altype	x,zremove
	s_set_colltype	x,ENEMY1
	s_set_colltype	x,ENEMYWEAP
.strat	s_start_strat
	s_cmp_alvar	W,x,al_shape,#boss_e_0
	s_beq		.nochk
	s_cmp_alvar	B,x,al_rotz,#128
	s_bne		.othersh
	s_set_alvar	W,x,al_shape,#boss_e_1
	bra		.nochk
.othersh	s_set_alvar	W,x,al_shape,#boss_e_1a
.nochk
	s_jmp_NOTalsflag	x,sflag1,.end
	s_jmp_NOTdelay		1,.end
	s_jsl	fireringlaser_l
.end	s_end_strat

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

.hit	LOCAL
	s_start_strat
	s_test_hitflags	x,#HF2
	s_bne		.actualhit
	s_set_alsflag	x,nohitaffect
	jml		hitflash_istrat
.actualhit
	s_clr_hitflags	x,#HF2
	s_clr_alsflag	x,nohitaffect
	jml		hitflash_istrat
	
;--------------------------------------------------------------------
trucklaunch_istrat
	s_start_strat
	s_Set_alptrs	x,.strat,hitflash_istrat,bossexplode_istrat
	s_copy_alvar2alvar	B,x,al_sbyte4,x,al_hp
	s_set_aldata	x,#hardHP,#hardAP
	s_set_alsflag	x,colldisable
	s_set_alvar	B,x,al_sbyte1,#70
.strat	s_start_strat
	s_fchase_alvar	W,x,al_worldx,#-150,8
	s_fchase_alvar	W,x,al_worldy,#-200,8
	a16
	lda	#2000
	s_jsr	dzdistless
	shorta
	s_bcc	.noadd
	s_add_alvar	W,x,al_worldz,#30
.noadd
	s_beqdec_alvar	B,x,al_sbyte1,.nxtstrat
.move
	s_add_playerz	x
	s_add_bossHP	x,al_sbyte4
.end	s_end_strat

.nxtstrat	s_set_strat	x,.strat2
	s_set_alvar	B,x,al_sbyte1,#40
.strat2	s_start_strat
	s_achase_alvar	B,x,al_roty,#-deg45-deg22,4
	s_achase_alvar	B,x,al_rotz,#-deg45+deg11,4
	s_achase_alvar	B,x,al_rotx,#0,4
	s_beqdec_alvar	B,x,al_sbyte1,.nxtstrat2
	s_jmp	.move
.nxtstrat2	s_set_alvar	B,x,al_sbyte1,#1
	s_jsr			fling.makeobj
	s_bcs			.end
	s_jsr			copypos_yx
	s_jsr			fling.copyrots_yx
	s_set_strat		y,fallingtruck_istrat
	s_set_alvar		W,y,al_shape,#boss_e_3
	s_add_alvar		B,y,al_roty,#-deg90
	s_copy_alvar2alvar.w	B,y,al_rotx,y,al_rotz
	s_neg_alvar		B,y,al_rotx
	s_set_alvar		B,y,al_rotz,#0

	s_set_strat	x,.strat3

.strat3	s_start_Strat

	s_decbne_alvar		B,x,al_sbyte1,.move
	s_set_bossmaxHP		#0
	s_kill_obj		x
	s_jmp			.end

;--------------------------------------------------------------------
fallingtruck_istrat
	s_start_strat
	s_set_alptrs	x,.strat,hitflash_istrat,0
	s_set_aldata	x,#hardHP,#hardAP
	s_set_alsflag	x,colldisable
	s_set_alvar	B,x,al_vel,#50
	s_set_alvar	B,x,al_sbyte1,#10
.strat	s_start_strat
	s_jsr	dgen3dvecs
	s_jsr	daddvecs2pos_x
	s_beqdec_alvar	B,x,al_sbyte1,.cmpit
	s_bra		.noadd
.cmpit
	lda	al_rotx,x
	sec
	sbc	#deg90+deg22
	cmp	#deg22
	bcc	.noadd
	sec
	sbc	#deg11-deg90-deg22
	sta	al_rotx,x
.noadd
	s_add_playerz	x
.end	s_end_strat

;--------------------------------------------------------------------
firenormringlaser_l
; x is alien to fire from, returns carry if failed
	s_jsr			fling.makeobj
	bcs			.failed
	s_jsr			copypos_yx
	s_jsr			fling.copyrots_yx
	s_set_strat		y,ringlaser_istrat
	s_set_alvar		W,y,al_shape,#ringlaser
	s_set_alvar		B,y,al_vel,#120
	s_make_immune
.nosub
	clc
	s_rtl
.failed
	ldy	dummyobj
	s_rtl
;--------------------------------------------------------------------
fireringlaser_l
; x is alien to fire from, returns carry if failed
	s_jsr			fling.makeobj
	s_bcs			.failed
	s_jsr			copypos_yx
	s_jsr			fling.copyrots_yx
	s_set_strat		y,ringlaser_istrat
	s_set_alvar		W,y,al_shape,#ringlaser
	s_set_alvar		B,y,al_vel,#60
	s_make_immune
	lda	locusmode
	bit	#1
	bne	.oneway

	lda.w	al_rotz,y
	sec
	sbc	#deg90
	bpl	.subitx
	s_add_alvar	B,y,al_rotx,#deg90
	bra	.nosubitx
.subitx	s_add_alvar	B,y,al_rotx,#-deg90
.nosubitx
	lda	#0
;	sta.w	al_rotx,y
	sta.w	al_rotz,y
	sta.w	al_roty,y
	bra	.nosub
.oneway
	lda.w	al_rotz,y
	bmi	.subit
	s_add_alvar		B,y,al_roty,#-deg90
	bra	.nosub
.subit
	s_add_alvar		B,y,al_roty,#deg90
.nosub
	clc
	s_rtl
.failed
	ldy	dummyobj
	s_rtl
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

ringlaser_istrat
	s_start_strat
	s_set_alptrs	x,.strat,.hit,0
	s_set_aldata	x,#hardHP,#ringlaserAP
	s_init_colanim	x,#0
	s_set_alsflag	x,sameshapecollide
	s_sprite_obj	x,#0	;,#12

	trigse	$5c
.regenvecs
	s_jsr	dgen3dvecs
	s_jsr	drotsflat_X
.strat
	s_jsr	daddvecs2pos_x
.move
	s_add_playerz	x
	s_add_colanim	x,#1,#5
	
.end	s_end_strat
.aimtoplayer
	s_start_strat
	s_set_collstrat	x,hitflash_istrat
	s_set_strat	x,.strat2
	s_set_alvar	B,x,al_vel,#120
	s_jsr		drotsflat_x
	s_set_alvar	B,x,al_sbyte1,#4
.strat2	s_start_strat
	s_jmp_varNOTzero B,powerbuild,.nstrat
	s_decbne_alvar	B,x,al_sbyte1,.move
	s_remove_obj	x
	s_jmp		.end
.nstrat
	s_set_strat	x,.nnstrat
	s_set_objtobeplayer	y
	s_jsr		dobj2obj3dangle_xy
	s_copy_alvar2alvar	B,x,al_sbyte1,x,al_rotx
	s_copy_alvar2alvar	B,x,al_sbyte3,x,al_roty
	s_jsr		dgen3dvecs
	s_jsr		drotsflat_x
	s_set_strat	x,.curvestrat
	s_jmp_varZERO	B,locusmode,.lftrgt
	s_cmp_var	B,locusmode,#1
	s_beq		.updwn
	s_jmp_random	.lftrgt
.updwn
	s_jmp_random	.nnstrat
	s_add_alvar	B,x,al_sbyte1,#30
	s_set_alvar	B,x,al_sbyte2,#-6
	stz		al_sbyte4,x
	s_set_alvar	B,x,al_roty,#deg45+deg180
	s_bra		.curvestrat
.lftrgt	s_jmp_random	.rgt
	s_add_alvar	B,x,al_sbyte3,#30
	s_set_alvar	B,x,al_sbyte4,#-6
	stz		al_sbyte2,x
	s_set_alvar	B,x,al_rotx,#deg45
	s_bra		.curvestrat
.rgt
	s_add_alvar	B,x,al_sbyte3,#-30
	s_set_alvar	B,x,al_sbyte4,#6
	stz		al_sbyte2,x
	s_set_alvar	B,x,al_rotx,#deg45
	s_bra		.curvestrat

.nnstrat	s_add_alvar	B,x,al_sbyte1,#-30
	s_set_alvar	B,x,al_sbyte2,#6
	stz		al_sbyte4,x
	s_set_alvar	B,x,al_roty,#deg45+deg180
.curvestrat
	s_add_alvars	B,x,al_sbyte1,x,al_sbyte2
	s_add_alvars	B,x,al_sbyte3,x,al_sbyte4
	s_gen_3dvecs	x,al_sbyte3,al_sbyte1,al_vel
	s_jsr	daddvecs2pos_x
	s_jmp		.strat

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

.hit	s_start_strat
	s_set_objtobealvar	y,x,al_collobjptr
	s_beq			.carryon
	s_cmp_alvars.w		W,x,al_shape,y,al_shape
	s_bne			.carryon
	s_set_strat		x,.aimtoplayer
	a16
	lda	al_worldx,x
	clc
	adc.w	al_worldx,y
	adiv2
	sta	al_worldx,x
	sta.w	al_worldx,y
	a8
	s_clr_alsflag	x,sameshapecollide
.carryon
	s_set_alsflag	x,nohitaffect
	jml		hitflash_istrat

;--------------------------------------------------------------------

web_turret1	=	1
web_turret2	=	2
web_turret3	=	3
web_turret4	=	4
web_turret5	=	5
web_turret6	=	6
web_fan	=	7

webmonster_istrat
	s_start_strat
	s_set_alvar	B,x,al_depthoffset,#1
	s_set_colltype	x,ENEMY1
	s_set_bossmaxHP	#0
	s_set_alvar	B,x,al_rotx,#deg90+deg45
	s_set_alvar	W,x,al_worldy,#1000
	s_jsr		.generate

	s_set_alptrs	x,.strat,hitflash_istrat,0
	s_set_aldata	x,#hardHP,#hardAP
.strat	s_start_strat

	s_cmp_alvar	B,x,al_rotx,#0
	s_bne		.missthat
	s_cmp_alvar	W,x,al_worldy,#0
	s_bne		.missthat2
	jmp		.mainstrat
.missthat
	s_add_alvar	B,x,al_rotx,#-1
.missthat2
	s_add_alvar	W,x,al_worldy,#-10
	jmp		.move

.setmainstrat
	s_set_strat	x,.mainstrat
.mainstrat	s_start_Strat
	s_jmp_childrendead	x,#web_turret1,#web_turret6,.bossdead

.move	s_add_alvar	B,x,al_rotz,#-1
	s_add_playerz	x
	s_keeprelto_player	x
	s_jsr		.position
.end	S_end_strat
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.bossdead
	s_jmp_alvarNOTZERO	B,x,al_sbyte2,.nolaunchweb
;	s_jsr		drill_istrat.launchweb
	s_set_objtobechild	y,x,#web_fan
	s_set_strat		y,launchatplayer_istrat
;	trigse		$8f
.nolaunchweb
	s_add_alvars	B,x,al_rotz,x,al_sbyte2
	lda	al_sbyte2,x
	inc	a
	sta	al_sbyte2,x
	cmp	#30
	s_beq	bossexplode_istrat
	cmp	#20
	bcs	.noexp
	cmp	#1
	bne	.nosound
	lda		pshipflags2
	and		#psf2_playerHP0
	bne		.nosound
	trigse	$1e
	lda	#$f1
	sta	bgm_music
	stz	bgmcnt
.nosound	s_jsl	makemedexpobj_srou
	s_jsl	addrnd2posy_srou
.noexp
	jmp	.move
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.position
	s_rotpos_allchildren	x
	s_rts
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.generate
	s_make_mother	x
	s_make_childobjrotpos	#boss_0_2,#web_turret6,#0,#(-65<<boss00_scale)>>childscale,#0,#0,#0,#0,propturret_istrat,ENEMY1
	s_make_childobjrotpos	#boss_0_2,#web_turret3,#(56<<boss00_scale)>>childscale,#(-32<<boss00_scale)>>childscale,#0,#0,#0,#-deg60,propturret_istrat,ENEMY1
	s_make_childobjrotpos	#boss_0_2,#web_turret5,#(56<<boss00_scale)>>childscale,#(32<<boss00_scale)>>childscale,#0,#0,#0,#-deg120,propturret_istrat,ENEMY1
	s_make_childobjrotpos	#boss_0_2,#web_turret2,#0,#(65<<boss00_scale)>>childscale,#0,#0,#0,#-deg180,propturret_istrat,ENEMY1
	s_make_childobjrotpos	#boss_0_2,#web_turret4,#(-56<<boss00_scale)>>childscale,#(32<<boss00_scale)>>childscale,#0,#0,#0,#-deg240,propturret_istrat,ENEMY1
	s_make_childobjrotpos	#boss_0_2,#web_turret1,#(-56<<boss00_scale)>>childscale,#(-32<<boss00_scale)>>childscale,#0,#0,#0,#-deg300,propturret_istrat,ENEMY1
	s_make_childobjrotpos	#boss_0_0,#web_fan,#0,#0,#(-10<<boss00_scale)>>childscale,#0,#0,#0,drill_istrat,ENEMY1

	s_jsr	.position
	s_rts


;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
drill_istrat
	s_start_strat
	s_init_anim	x,#0
	s_set_aldata	x,#hardHP,#2
	s_set_alptrs	x,.strat,.hit,explode_istrat
	s_set_alsflag	x,nohitaffect
.strat	s_start_strat

	s_set_objtobemother	y,x

	lda	al_childrotz,x
	clc
	adc	al_sbyte2,x
	sta	al_childrotz,x
	bcc	.nosound
	trigse	$4f
.nosound

	s_jmp_alvarZERO	B,x,al_sbyte3,.carryon

	s_jmp_NOTalsflag	x,sflag2,.noadd60
	lda	al_childrotz,x
	clc
	adc	#deg60
	bra	.rechk
.noadd60	lda	al_childrotz,x
.rechk	beq	.nochange
	sec
	sbc	#deg120
	bcs	.rechk
	cmp	#256-4
	bcc	.noz
	sta	x1
	lda	al_childrotz,x
	sec
	sbc	x1
	sta	al_childrotz,x
	bra	.nochange
.noz

	lda	al_childrotz,x
	sec
	sbc	#4
	and	#-4
	sta	al_childrotz,x

	jmp	.noneofthis

.nochange
	s_dec_alvar	B,x,al_sbyte3

	s_jmp_NOTalsflag	x,sflag2,.blockoneset

	s_clr_childsflag	y,sflag1,#web_turret4,#web_turret6
	s_jmp			.noneofthis
.blockoneset
	s_clr_childsflag	y,sflag1,#web_turret1,#web_turret3

	s_jmp		.noneofthis
.carryon

	lda	al_sbyte2,x
	inc	a
	cmp	#deg360/6
	bcc	.ok2
	inc	a
.ok2
	cmp	#deg360/3
	bcc	.ok
	lda	#0
.ok
	sta	al_sbyte2,x
	cmp	#deg360/6+deg360/12
	s_bne	.normchk
	lda	al_rotx,x
	bne	.noinitialsound
	s_jsr	.launchweb
	trigse	$8f
.noinitialsound
	s_set_strat	x,.drillattack
	s_end_strat
	s_jmp		.drillattack
.normchk	ora	#0
	s_beq	.clr

	s_set_alvar		W,x,al_shape,#boss_0_0a
	s_set_childsflag	y,sflag1,#web_turret1,#web_turret6
	bra			.set
.clr
	s_not_alsflag		x,sflag2
	s_set_alvar		B,x,al_sbyte3,#50
	s_set_alvar		W,x,al_shape,#boss_0_0
.set
.noneofthis
.end
	s_end_strat

.hit	s_start_strat
	s_cmp_alvar	W,x,al_shape,#boss_0_0
	s_beq		.norebound
;	phx
;	txy
;	s_set_objtobealvar	x,y,al_collobjptr
;	s_weapon_rot	#0,#deg180
;	s_weapon_pos	#0,#0,#0
;	s_fire_weapon	x,RELSLOWELASER
;	s_set_colltype	y,ENEMY1
;	plx

	jml	RebElasercol_istrat

.norebound	jml	hitflash_istrat

.drillattack	s_start_strat


.move
	ldy	#boss_0_3
	s_jsl	find_y_l
	cpy	dummyobj
	bne	.ok33
	s_set_strat	x,.drillretrieve
	s_jmp		.drillretrieve
.ok33
	s_jmp_NOTalsflag	y,sflag2,.ok23
	s_jmp_notdelay	2,.ok23
	lda	#11
	s_jsr	dincanimjmp_x
.ok23
	s_cmp_anim	x,#10
	s_bne		.nomove
	s_set_objtobemother	y,x
	phx
	tyx
	a16
	lda	#350
	s_jsr	dzdistless
	shorta
	bcs	.ok55
	s_add_alvar	W,x,al_worldz,#-20
.ok55
	plx
.nomove

.moveagain

	lda	al_childrotz,x
	clc
	adc	al_sbyte2,x
	sta	al_childrotz,x
	bcs	.nosound2
	s_cmp_anim	x,#8
	bcs	.metalsound
	trigse	$4f
	bra	.nosound2
.metalsound
	trigse	$50
.nosound2
	s_jmp	.end

.drillretrieve
	s_start_strat
	s_cmp_anim	x,#0
	s_beq		.noanim

	lda		#11
	s_jsr		ddecanim_x
	s_jmp		.anim
.noanim
	s_set_objtobemother	y,x
	phx
	tyx
	s_add_alvar	W,x,al_worldz,#80
	a16
	lda		#1200
	s_jsr		dzdistless
	plx
	shorta
	bcs		.notbacktonorm
	s_set_objtobemother	y,x
	s_set_childsflag y,sflag3,#web_turret1,#web_turret6
	s_set_strat	x,.strat
	s_jmp		.strat
.notbacktonorm
.anim

	s_jmp	.moveagain

.launchweb	LOCAL
	s_jsr	fling.makeobj
	bcs	.failed
	s_set_strat	y,web_istrat
	s_set_alvar	W,y,al_shape,#boss_0_3
	s_jsr		fling.copyrots_yx
	s_jsr		copypos_yx

	clc
.failed	s_rts

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
launchatplayer_istrat
	s_start_strat
	s_set_alvar	B,x,al_sbyte2,#80
	s_set_strat	x,.strat
.strat	s_start_strat
	s_beqdec_alvar	B,x,al_sbyte2,.more
	s_end_strat
.more	s_set_objtobemother	y,x
	s_remove_child		x,y
	s_set_strat		x,.strat2
.strat2	s_start_strat
	s_end_strat
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
web_istrat
	s_start_strat
	s_set_alptrs	x,.strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#hardHP,#0
	s_set_alsflag	x,nohitaffect
	s_set_alsflag	x,colldisable
	s_set_colltype	x,ENEMY1
	s_init_anim	x,#0
	s_set_alvar	B,x,al_sbyte3,#100
.strat	s_start_strat
	s_jsr		.chkhit

	a16
	lda	#600
	s_jsr	dzdistless
	shorta
	bcc	.ok23
	lda	#8
	s_jsr	dincanimjmp_x
.ok23
	s_add_playerz	x
	s_set_alsflag	x,sflag2
	s_jmp_alsflag	x,sflag3,.gopast
	s_jmp_alsflag	x,sflag1,.nomove
.gopast
	s_sub_alvar	W,x,al_worldz,#40
	s_clr_alsflag	x,sflag2
.nomove

.move	s_set_objtobeplayer	y
	s_jmp_alsflag		x,sflag2,.nofchase
	s_fchase_alvar2alvar	W,x,al_worldx,y,al_worldx,12
	s_fchase_alvar2alvar	W,x,al_worldy,y,al_worldy,6
	s_playerfire		on
	s_jmp			.noachase
.nofchase
	s_playerfire		off
	s_copy_alvar2alvar	W,y,al_worldx,x,al_worldx
	s_copy_alvar2alvar	W,y,al_worldy,x,al_worldy
	s_fchase_alvar		W,x,al_worldx,#0,1
	s_fchase_alvar		W,x,al_worldy,#0,1
	s_copy_alvar2alvar	W,x,al_worldz,y,al_worldz
	s_add_alvar		W,x,al_worldz,#40
	s_beqdec_alvar		B,x,al_sbyte3,.finishup

	s_jmp_varZERO	B,player_rollZvel,.nshake
	s_jmp_alsflag	x,sflag8,.nodo
	s_set_alsflag	x,sflag8
	s_add_alvar		B,x,al_sbyte4,#13
	s_brl		.doneshake
.nshake
	s_clr_alsflag	x,sflag8
.nodo

	lda	lastcont0
	eor	cont0
	and	#key_Jleft!key_Jright!key_Jup!key_Jdown
	beq	.zeroit
	s_inc_alvar	B,x,al_sbyte4
.doneshake	s_cmp_alvar	B,x,al_sbyte4,#50
	s_bmi		.noachase
.finishup	s_set_alsflag	x,sflag3
	s_jmp		.noachase
.zeroit

.noachase
	s_clr_alsflag		x,sflag1
.end	s_end_strat

.chkhit
	s_set_objtobeplayer	y
	a16
	lda	#50
	s_jsr	dzdistless
	shorta
	s_bcc	.norm
	s_jmp_outxydistrng	x,y,#0,#(25<<2),.norm
	s_jmp_alsflag	x,sflag2,.alreadyhit
	trigse	$51
.alreadyhit
	s_set_alsflag	x,sflag1
	s_rts
.norm	s_clr_alsflag	x,sflag1
	s_rts

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
propturret_istrat
	s_start_strat
	s_set_alptrs	x,.strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#propturretHP,#propturretAP
	s_add_bossmaxHP	x,al_hp
	s_set_alvar	B,x,al_depthoffset,#1
.strat	s_start_strat
	s_jmp_NOTalsflag	x,sflag3,.fannotfading
	s_jmp_notdelay	3,.fannotfading
	lda	al_depthoffset,x
	cmp	#1
	beq	.clrflag
	dec	a
	sta	al_depthoffset,x
	bra	.fannotfading
.clrflag	a8
	s_clr_alsflag		x,sflag3
.fannotfading
	a8
	s_jmp_alsflag	x,sflag1,.fanspinning
	s_clr_alsflag	x,nohitaffect

;	s_set_alvar	B,x,al_depthoffset,#$1

	s_jmp_NOTalsflag	x,sflag2,.fannotspinning

	s_weapon_rot	#0,#-deg180
	s_weapon_pos	#0,#0,#0
	s_fire_weapon	x,HMISSILE1
	s_set_alvar	W,y,al_ptr,playpt
	s_clr_alsflag	x,sflag2
	s_set_colltype	y,ENEMY1
	s_jmp		.fannotspinning

.fanspinning	s_set_alsflag	x,nohitaffect
	s_set_alsflag	x,sflag2

	s_jmp_alsflag	x,sflag3,.fannotspinning
	s_jmp_notdelay	4,.fannotspinning
	lda		al_depthoffset,x
	cmp		#$4
	beq		.fannotspinning
	inc		a
	sta		al_depthoffset,x

.fannotspinning
	a8
	s_add_bossHP	x,al_hp
.end	s_end_strat


;--------------------------------------------------------------------

child_rotpos_l
	phy

	s_set_objtobemother	y,x

	a16
	lda	al_childrotobj,x
	beq	.ok
	tay
.ok	a8


	s_copy_alvar2var	B,x,x1,al_childx
	s_copy_alvar2var	B,x,y1,al_childy
	s_copy_alvar2var	B,x,z1,al_childz
	s_copy_rots		x,y

	lda	al_childrotx,x
	clc
	adc.w	al_rotx,y
	sta	al_rotx,x

	lda	al_childroty,x
	clc
	adc.w	al_roty,y
	sta	al_roty,x

	lda	al_childrotz,x
	clc
	adc.w	al_rotz,y
	sta	al_rotz,x

	s_add_roffs2pos		B,x,y,y,x1,y1,z1,1,1,1,childscale,childscale,childscale

	ply
	rtl

;--------------------------------------------------------------------

rotpos_allchildren_l
	phy
	phx
.again
	ldy	al_sword1,x
	beq	.finished
	tyx
	
	jsl	child_rotpos_l
	bra	.again
.finished
	plx
	ply
	rtl
;--------------------------------------------------------------------
bossf_body	=	1
bossf_head	=	2
bossf_feet	=	3
bossf_arm1	=	4
bossf_arm2	=	5

airship_istrat
	s_start_strat
	s_set_alptrs	x,.strat,.hit,.explode
	s_set_aldata	x,#airshipHP,#airshipAP
	s_set_alsflag	x,shadow
	s_set_alsflag	x,nohitaffect
	s_set_colltype	x,ENEMY1
	s_set_alsflag	x,colldisable
	s_set_var	B,powerbuild,#0
	trigse	$5b
	s_mode_change	x,#0
.strat	s_start_strat
	s_mode_table
	s_mode_entry	.flyuptofront
	s_mode_entry	.pauseabit
	s_mode_entry	.majorchange
	s_mode_entry	.droptoground
	s_mode_entry	.swivel180
	s_mode_entry	.rotatearms
	s_mode_entry	.joinsound
	s_mode_entry	.rejoin
	s_mode_entry	.majorchange2
	s_mode_entry	.moveback
	s_mode_entry	.startironballs
	s_mode_entry	.openhatch
	s_mode_entry	.bodyrot
	s_mode_entry	.stopit

	s_mode_label	transformer_loop_here

	s_mode_entry	.ohmightylord
	s_mode_entry	.openhatch
	s_mode_entry	.swivelforabit

	s_mode_entry	.checkdist
	s_mode_entry	.smackhands
	s_mode_entry	.waitforsmack

	s_mode_entry	.startbodyrot
	s_mode_entry	.liftarmfire1
	s_mode_entry	.liftarmfire2
	s_mode_entry	.checkdist
	s_mode_entry	.liftarmfire1
	s_mode_entry	.liftarmfire2
	s_mode_entry	.endbodyrot
	s_mode_entry	.checkdist

	s_mode_entry	.fullopenhatch

	s_mode_entry	.eyes

	s_mode_entry	.checkdist

	s_mode_entry	.loopround

	s_mode_label	transformer_hurt_loop

	s_mode_entry	.launchbigmissile

	s_mode_entry	.fullopenhatch
	s_mode_entry	.eyes

	s_mode_entry	.startbodyrot
	s_mode_entry	.liftarmfire1
	s_mode_entry	.liftarmfire2
	s_mode_entry	.liftarmfire1
	s_mode_entry	.liftarmfire2
	s_mode_entry	.endbodyrot


	s_mode_entry	.ohmightylord
	s_mode_entry	.openhatch
	s_mode_entry	.swivelforabit

	s_mode_entry	.smackhands
	s_mode_entry	.waitforsmack

	s_mode_entry	.checkdist

	s_mode_entry	.loopround

	s_mode_label	bossf_heli
	s_mode_entry	.heli
	s_mode_entry	.backforth


	s_mode_table_end

;**********
.joinsound	shorta
	trigse	$8e
	s_set_alsflag	x,sflag8
	jmp	.nxtmode
	

;**********
.checkdist
	a16
	lda	#2700
	s_jsr	dzdistless
	SHORTA
	bcs	.addtoz

	s_sub_alvar	W,x,al_worldz,#20

	a16
	lda	#2700
	s_jsr	dzdistless
	SHORTA
	s_bcs	.nxtmode
	s_jmp	.move2
.addtoz
	s_add_alvar	W,x,al_worldz,#20
	a16
	lda	#2700
	s_jsr	dzdistless
	SHORTA
	s_bcc	.nxtmode
	s_jmp	.move2


;**********
.backforth
	s_jmp_alsflag	x,sflag2,.oneway2
	a16
	lda		#800
	s_jsr		dzdistless
	shorta
	bcs		.notit
	s_sub_alvar	W,x,al_worldz,#50
	s_jmp		.nochange
.oneway2
	a16
	lda		#2500
	s_jsr		dzdistless
	shorta
	s_bcc		.notit
	s_add_alvar	W,x,al_worldz,#50
	s_jmp		.nochange

.notit	s_not_alsflag	x,sflag2
.nochange
	s_jmp		.move2
;**********
.heli
	s_set_objtobechild	y,x,#bossf_body
	s_mode_change		y,#bossfbody_toground
	s_set_objtobechild	y,x,#bossf_arm1
	s_mode_change		y,#bossfarm_heli1
	s_set_objtobechild	y,x,#bossf_arm2
	s_mode_change		y,#bossfarm_heli2
	s_set_objtobechild	y,x,#bossf_head
	s_mode_change		y,#bossfhead_heli
	s_jmp		.nxtmode


;**********
.znxtmode	s_set_alvar	B,x,al_sbyte2,#0
.nxtmode	s_mode_change	x,+1
	s_jmp		.strat

;**********
.launchbigmissile
	s_set_objtobechild	y,x,#bossf_feet
	s_set_alsflag		y,sflag6
	s_jmp			.nxtmode
;**********
.loopround
	s_set_objtobechild	y,x,#bossf_feet
	s_cmp_alvar		B,y,al_hp,#bossffeetHP/2
	bcs			.norm
	s_mode_change		x,#transformer_hurt_loop
	s_jmp			.strat
.norm
	s_mode_change		x,#transformer_loop_here
	s_jmp			.strat

;**********
.liftarmfire1
	s_set_objtobechild	y,x,#bossf_arm1
	s_mode_change	y,#armliftfire
	s_inc_alvar	B,x,al_sbyte2
	s_cmp_alvar	B,x,al_sbyte2,#70
	s_beq		.zz2nxtmode
	s_jmp			.move2
.zz2nxtmode
	s_or_var	B,powerbuild,#128
	s_mode_change	y,#armfire2
	s_jmp		.znxtmode
.zznxtmode
	s_mode_change	y,#0
	s_jmp		.znxtmode
;**********
.liftarmfire2
	s_set_objtobechild	y,x,#bossf_arm2
	s_mode_change	y,#armliftfire
	s_inc_alvar	B,x,al_sbyte2
	s_cmp_alvar	B,x,al_sbyte2,#70
	s_beq		.zz2nxtmode
	s_jmp			.move2
;**********
.openhatch
	s_set_objtobechild	y,x,#bossf_feet
	s_clr_alsflag		y,sflag4
	s_set_alsflag		y,sflag2
	s_jmp			.nxtmode
;**********
.closehatch
	s_set_objtobechild	y,x,#bossf_feet
	s_clr_alsflag		y,sflag2
	s_clr_alsflag		y,sflag4
	s_jmp			.nxtmode
;**********
.fullopenhatch
	s_set_objtobechild	y,x,#bossf_feet
	s_set_alsflag		y,sflag4
	s_jmp			.nxtmode
;**********
.eyes
	s_set_objtobechild	y,x,#bossf_head
	s_mode_change		y,#ringlasereyes

	lda	al_sbyte2,x
	cmp	#100
	s_beq	.zzznxtmode
	inc	a
	sta	al_sbyte2,x
	s_jmp		.move2
.zzznxtmode	s_mode_change		y,#0
	s_jmp		.znxtmode
;**********
.smackhands
	s_set_objtobechild	y,x,#bossf_arm1
	s_mode_change		y,#smack1
	s_set_objtobechild	y,x,#bossf_arm2
	s_mode_change		y,#smack2
	s_jmp			.nxtmode
;**********
.waitforsmack
	s_set_objtobechild	y,x,#bossf_arm1
	lda		al_stratstate,y
	s_bne		.move2
	s_jmp		.nxtmode
;**********
.swivelforabit
	s_set_objtobechild	y,x,#bossf_body
	s_add_alvar	B,y,al_childroty,#deg22
	s_bcc		.nosnd
	trigse		$39
.nosnd
	pha
	s_set_objtobechild	y,x,#bossf_head
	pla
	s_sta	al_childroty,y
	lda	al_sbyte2,x
	cmp	#200
	bne	.incit
	s_lda	al_childroty,y
	s_bne	.move2
	stz	al_sbyte2,x
	s_jmp	.nxtmode
.incit	inc	a
	sta	al_sbyte2,x
	s_jmp			.move2
;**********
.ohmightylord
	s_set_objtobechild	y,x,#bossf_arm1
	s_mode_change		y,#ohlord1
	s_set_objtobechild	y,x,#bossf_arm2
	s_mode_change		y,#ohlord2
	s_jmp			.nxtmode
;**********
.startbodyrot
	s_set_objtobechild	y,x,#bossf_body
	s_set_alsflag		y,sflag1
	s_jmp			.nxtmode
;**********
.endbodyrot
	s_set_objtobechild	y,x,#bossf_body
	s_clr_alsflag		y,sflag1
	s_jmp			.nxtmode
;**********
.bodyrot
	s_set_objtobechild	y,x,#bossf_body
	s_set_alsflag		y,sflag1
	s_inc_alvar		B,x,al_sbyte2
	s_cmp_alvar		B,x,al_sbyte2,#200
	s_bne			.move2
	s_set_alvar		B,x,al_sbyte2,#0
	s_clr_alsflag		y,sflag1
	s_jmp			.nxtmode
;**********
.startironballs
	s_set_objtobechild	y,x,#bossf_arm1
	s_mode_change		y,#fireironballs
	s_set_objtobechild	y,x,#bossf_arm2
	s_mode_change		y,#fireironballs
	s_jmp		.nxtmode
;**********
.stopironballs
.stopit
	s_set_objtobechild	y,x,#bossf_arm1
	s_mode_change		y,#0
	s_set_objtobechild	y,x,#bossf_arm2
	s_mode_change		y,#0
	s_set_objtobechild	y,x,#bossf_body
	s_jmp_alsflag		y,sflag3,.move2
	s_jmp		.nxtmode
;**********
.moveback
	s_set_objtobechild	y,x,#bossf_feet
	s_mode_change	y,#1
	a16
	lda	#2700
	s_jsr	dzdistless
	shorta
	s_bcc	.nxtmode
	s_add_alvar	W,x,al_worldz,#40
	s_jmp		.move2
;**********

.majorchange2
	s_set_objtobechild	y,x,#bossf_body
	s_set_alvar		W,y,al_shape,#boss_f_5
	s_init_anim		y,#0
	phy
	phy
	s_make_childobjrotpos	#boss_f_7,#bossf_arm1,#(-40<<bossf_scale)>>childscale,#(0<<bossf_scale)>>childscale,#(10<<bossf_scale)>>childscale,#0,#0,#0,bossfarm_istrat,ENEMY1
	a16
	pla
	sta	al_childrotobj,y
	a8
	s_make_childobjrotpos	#boss_f_6,#bossf_arm2,#(40<<bossf_scale)>>childscale,#(0<<bossf_scale)>>childscale,#(10<<bossf_scale)>>childscale,#0,#0,#0,bossfarm_istrat,ENEMY1
	a16
	pla
	sta	al_childrotobj,y
	a8
	s_jmp		.nxtmode

;**********
.rejoin
	s_set_alsflag	x,sflag1

	lda	al_sbyte2,x
	and	#-2
	s_beq	.nxtmode
	sec
	sbc	#2
	sta	al_sbyte2,x

	s_jsr	.changez
	s_jmp	.move3
.changez
	s_set_objtobechild	y,x,#bossf_head
	s_fchase_alvar		B,y,al_childz,#-10,2

	s_set_objtobechild	y,x,#bossf_body
	s_fchase_alvar		B,y,al_childz,#-10,2
	s_rts

;**********
.rotatearms
	s_dec_alvar		B,x,al_sbyte2
	s_set_objtobechild	y,x,#bossf_body
	s_add_anim		y,#1,#13,.nxtmode
	s_set_objtobechild	y,x,#bossf_head
	s_add_anim		y,#1,#4,.here3344
.here3344
	s_jsr	.changez
	s_jmp		.move3
;**********
.swivel180
	s_set_objtobechild	y,x,#bossf_feet
	s_cmp_alvar	B,y,al_childroty,#0
	s_beq		.nxtmode
	s_add_alvar	B,y,al_childroty,#4
	s_cmp_alvar	B,x,al_sbyte2,#66
	s_beq		.noinc
	s_inc_alvar	B,x,al_sbyte2
.noinc
	s_jsr	.changez
	s_jmp		.move3
;**********
.droptoground
	a16
	lda		al_worldy,x
	cmp		#-120
	s_beq		.noadd
	clc
	adc		#5
	sta		al_worldy,x
	a8
	bra		.noinc
.noadd	a8

	s_cmp_alvar		B,x,al_sbyte2,#50
	s_beq			.nxtmode
	s_inc_alvar		B,x,al_sbyte2
	

	s_jmp		.move3
;**********
.majorchange
	trigse	$8e
	s_set_alvar	W,x,al_shape,#nullshape
	s_jsr		.generate
	s_jmp		.nxtmode
;**********
.pauseabit
	s_inc_alvar	B,x,al_sbyte2
	s_cmp_alvar	B,x,al_sbyte2,#20
	s_bne		.move
	s_set_alvar	B,x,al_sbyte2,#0
	s_jmp		.nxtmode
;**********
.flyuptofront
	s_cmp_alvar	W,x,al_worldy,#-200
	s_beq		.noaddy
	s_add_alvar	W,x,al_worldy,#5
.noaddy
	a16
	lda	#2000
	s_jsr	dzdistless
	shorta
	bcs	.addz
	s_cmp_alvar	B,x,al_roty,#deg180
	s_bne		.notnxtmode
	s_set_alvar	B,x,al_rotz,#0
	s_jmp		.nxtmode
.notnxtmode
	lda	al_rotz,x
	adiv2
	sec
	adc	al_roty,x
	sta	al_roty,x

	s_cmp_alvar	B,x,al_roty,#deg90
	bcs		.otherway
	s_add_alvar	B,x,al_rotz,#1
	s_jmp	.move
.otherway
	s_cmp_alvar	B,x,al_rotz,#2
	s_bcc		.move
	s_sub_alvar	B,x,al_rotz,#1
	s_jmp	.move
.addz
	s_add_alvar	W,x,al_worldz,#20
	s_add_alvar	W,x,al_worldx,#1
	s_jmp		.move

;**********
.circle
	
	s_jmp		.move

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.hit	s_start_strat
	trigse	$27
	jml	hitflash_istrat
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.explode
	a16
	lda			#3000
	s_jsr			dzdistless
	shorta
	s_bcc			.finishitall
	s_add_alvar		W,x,al_worldz,#100
	s_jmp			.move2
.finishitall
	s_set_objtobechild	y,x,#bossf_arm1
	s_kill_obj		y
	s_set_objtobechild	y,x,#bossf_arm2
	s_kill_obj		y
	s_set_objtobechild	y,x,#bossf_body
	s_kill_obj		y
	s_set_expstrat		x,bossexplode_istrat
	s_end_strat
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.position
	s_rotpos_allchildren	x
	s_rts
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.generate
	s_make_mother	x
	s_make_childobjrotpos	#boss_f_2,#bossf_body,#0,#0,#(40<<bossf_scale)>>childscale,#0,#0,#0,bossfbody_istrat,ENEMY1
	s_make_childobjrotpos	#boss_f_1,#bossf_head,#0,#(-22<<bossf_scale)>>childscale,#(10<<bossf_scale)>>childscale,#0,#0,#0,bossfhead_istrat,ENEMY1
	s_make_childobjrotpos	#boss_f_3,#bossf_feet,#0,#0,#0,#0,#deg180,#0,bossffeet_istrat,ENEMY1

	s_jsr		.position
	s_rts

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.checkrejoin
	s_jmp_NOTalsflag	x,sflag1,.dontsetit2
	s_set_objtobechild	y,x,#bossf_body
	s_cmp_alvar		B,y,al_childy,#-40
	s_bmi			.dontsetit1
	s_set_alvar		B,y,al_childy,#-40
.dontsetit1
	s_set_objtobechild	y,x,#bossf_head
	s_cmp_alvar		B,y,al_childy,#-67
	s_bmi			.dontsetit2
	s_jmp_NOTalsflag	x,sflag8,.nosound1
	s_clr_alsflag	x,sflag8
	trigse		$8e
.nosound1
	s_set_alvar		B,y,al_childy,#-67
.dontsetit2
	s_rts
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.move3
	a16
	lda	al_worldy,x
	eor	#-1
	inc	a
	clc
	adc	#-200

	lsr	a
	lsr	a
	sta		y1
	lsr	a

	sta		x1
	a8
	s_set_objtobechild	y,x,#bossf_body
	s_set_alvar		B,y,al_childy,x1

	lda	al_sbyte2,x
	sec
	sbc	#25
	bcc	.nochange1
	eor	#-1
	sec
	adc	al_childy,y
	sta	al_childy,y
.nochange1

	s_set_objtobechild	y,x,#bossf_head
	s_set_alvar		B,y,al_childy,x1
	s_add_alvar		B,y,al_childy,#-22
	lda		al_sbyte2,x
	cmp		#35
	bcc		.nochange2
	lda	#35
.nochange2	sta	z1
	lsr	a
	clc
	adc	z1
	eor	#-1
	sec	a
	adc	al_childy,y
	cmp	#-22
	sta	al_childy,y

.nozmove

	s_jsr			.checkrejoin

.move2
	s_jsr		.position
.move
	s_add_playerz	x
.end	s_end_strat

;--------------------------------------------------------------------
bossfhead_istrat
	s_start_strat
	s_set_alptrs	x,.strat,.hit,.explode
	s_set_alsflag	x,nohitaffect
	s_set_aldata	x,#hardHP,#hardAP
	s_set_colltype	x,ENEMY1
	s_mode_change	x,#0
	s_init_anim	x,#0
.strat	s_start_Strat
	s_mode_table
	s_mode_entry	.stayabove
	s_mode_label	ringlasereyes
	s_mode_entry	.ringlasereyes
	s_mode_label	bossfhead_heli
	s_mode_entry	.heli
	s_mode_entry	.animate
	s_mode_label	bossfheadloop
	s_mode_entry	.movetobeginrotate
	s_mode_entry	.rotate
	s_mode_entry	.loopround

.loopround
	s_mode_change	x,#bossfheadloop
	s_jmp		.strat
.znxtmode
	s_set_alvar	B,x,al_sbyte4,#0
.nxtmode	s_mode_change	x,+1
	s_jmp		.strat

;**********
.animate
	s_cmp_anim	x,#0
	s_beq		.nxtmode
	s_add_anim	x,#-1,#10
	s_jmp		.move


flightrad	=	70
bossheadflyheight =	-15

;**********
.movetobeginrotate
	s_set_alsflag	x,shadow
	s_set_alvar	B,x,al_hp,#bossfheadHP2
	s_set_bossmaxHP	x,al_hp
	s_add_bosshp	x,al_hp
	s_clr_alsflag	x,nohitaffect
	s_achase_alvar	B,x,al_childrotx,#0,4
	s_achase_alvar	B,x,al_childroty,#deg90,4
	s_achase_alvar	B,x,al_childrotz,#0,4
	s_achase_alvar	B,x,al_childx,#0,4
	s_achase_alvar	B,x,al_childy,#bossheadflyheight,4
	s_achase_alvar	B,x,al_childz,#flightrad,4
	s_set_alvar	B,x,al_sbyte3,#0
	s_set_alvar	B,x,al_sbyte2,#0
	s_inc_alvar	B,x,al_sbyte4
	s_cmp_alvar	B,x,al_sbyte4,#50
	s_beq		.znxtmode
	s_jmp		.move

;**********
.rotate
	s_set_alvar2alvartab	B,B,B,x,al_childy,x,al_sbyte2,sintab,-4

	s_add_alvar	B,x,al_childy,#bossheadflyheight
	s_add_alvar	B,x,al_sbyte2,#16

	s_add_bosshp	x,al_hp
	s_add_alvar	B,x,al_sbyte3,#4

	lda	#flightrad
	sta	z1
	stz	x1
	lda	al_sbyte3,x
	s_jsl	rotate_8xz_l
	lda	x2
	sta	al_childx,x
	lda	z2
	sta	al_childz,x

	lda	al_sbyte3,x
	clc
	adc	#deg90
	sta	al_childroty,x

	lda	#deg11
	sta	al_childrotz,x
	
	s_jmp		.move


;**********
.blastit
	s_inc_alvar	B,x,al_sbyte4
	s_cmp_alvar	B,x,al_sbyte4,#20
	s_beq		.znxtmode
	s_jmp		.ringlasereyes

;**********
.heli
	s_achase_alvar	B,x,al_childroty,#0,5,.nxtmode
	s_set_collstrat	x,.hit
	s_jmp		.move

;**********
.ringlasereyes
	s_jmp_notdelay	3,.norings

	phx
	s_jsl	firenormringlaser_l
	tyx
	s_set_objtobeplayer	y
	s_jsr	dobj2obj3dangle_xy
	s_set_colltype	x,ENEMY1
	s_sub_alvar	W,x,al_worldx,#80
	plx

	phx
	s_jsl	firenormringlaser_l
	tyx
	s_set_objtobeplayer	y
	s_jsr	dobj2obj3dangle_xy
	s_set_colltype	x,ENEMY1
	s_add_alvar	W,x,al_worldx,#80
	plx
.norings
	s_jmp		.move
;**********
.stayabove
	s_jmp		.move

.move

.end	s_end_strat

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.hit
	s_start_strat
	s_jmp_alsflag	x,nohitaffect,.nohurt
	trigse	$80
.nohurt	jml	hitflash_istrat

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.explode
	s_set_objtobemother	y,x
	s_kill_obj	y
	trigse	$81
	jml	explode_istrat

;--------------------------------------------------------------------
bossfbody_istrat
	s_start_strat
	s_set_alptrs	x,.strat,.hit,explode_istrat
	s_set_aldata	x,#hardHP,#hardAP
	s_set_colltype	x,ENEMY1
	s_set_alsflag	x,shadow
	s_set_alsflag	x,nohitaffect
	s_mode_change	x,#0
	s_init_anim	x,#0
.strat	s_start_Strat
	s_mode_table
	s_mode_entry	.stayabove
	s_mode_label	bossfbody_toground
	s_mode_entry	.toground
	s_mode_entry	.spin
	s_mode_entry	.riseup
	s_mode_entry	.movebackandforwards
	s_mode_entry	.move2

.nxtmode	s_mode_change	x,+1
	s_jmp		.strat
;**********
.movebackandforwards

	s_jmp		.move3
;**********
.spin
	s_jmp_NOTdelay	1,.missitnow
	s_inc_alvar	B,x,al_sbyte4
.missitnow
	s_cmp_alvar	B,x,al_sbyte4,#deg22+deg11
	s_beq		.nxtmode
	s_jmp		.move2

;**********
.riseup
	s_clr_alsflag	x,sflag2
	s_dec_alvar	B,x,al_childy
	s_cmp_alvar	B,x,al_childy,#-35
	s_beq		.nxtmode
	s_jmp		.move2

;**********
.toground
	s_clr_alsflag	x,sflag1
	s_set_alvar	B,x,al_sbyte4,#0
	s_achase_alvar	B,x,al_childy,#(-10<<bossf_scale)>>childscale,2,.nxtmode
	s_achase_alvar	B,x,al_childroty,#0,3
	s_jmp		.move2
;**********
.stayabove
	s_jmp		.move


;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.hit	s_start_strat
	trigse	$27
	jml	hitflash_istrat
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.move3
	s_jmp_random	.move2,99
	s_jsr		launchhead
.move2
	s_add_alvars	B,x,al_childroty,x,al_sbyte4

	bcc		.nosnd
	trigse		$39
.nosnd

	s_jmp		.end

.move
	s_jmp_alsflag	x,sflag1,.backandforth
	s_jmp_NOTalsflag x,sflag3,.notbackandforth
	s_fchase_alvar	B,x,al_childroty,#0,1,.clrsflag3
	bra		.notbackandforth
.clrsflag3	s_clr_alsflag	x,sflag3
	bra		.notbackandforth
.backandforth
	s_set_alsflag	x,sflag3
	s_jmp_alsflag	x,sflag2,.oneway
	s_fchase_alvar	B,x,al_childroty,#-deg22,1,.notsflag2
	bra		.notbackandforth
.oneway
	s_fchase_alvar	B,x,al_childroty,#deg22,1,.notsflag2
	bra		.notbackandforth
.notsflag2	s_not_alsflag	x,sflag2
.notbackandforth
.end	s_end_strat

;--------------------------------------------------------------------
bossffeet_istrat
	s_start_strat
	s_set_alptrs	x,.strat,.hit,.explode
	s_set_aldata	x,#bossffeetHP,#hardAP
	s_set_alsflag	x,shadow
	s_set_colltype	x,ENEMY1
	s_set_bossmaxHP	x,al_hp
	s_mode_change	x,#0
	s_init_anim	x,#0
.strat	s_start_Strat
	s_mode_table
	s_mode_entry	.stayabove
	s_mode_entry	.backandforth
	s_mode_table_end

;**********
.backandforth

	s_set_objtobemother	y,x

	lda	al_childroty,x
	adiv2
	eor	#255
	inc	a
	a16
	sexa
	clc
	adc.w	al_worldx,y
	sta.w	al_worldx,y
	a8

	phx
	s_set_objtobeplayer	x
	a16
	lda.w	al_worldx,y
	sec
	sbc	al_worldx,x
	sta	x1
	a8
	plx

	s_jmp_alsflag	x,sflag1,.oneway
	s_inc_alvar	B,x,al_childroty
	s_cmp_alvar	B,x,al_childroty,#32
	s_bmi		.nochange1
	s_set_alvar	B,x,al_childroty,#32
.nochange1
	s_cmp_var	W,x1,#-50
	bpl		.otherway
	s_set_alsflag	x,sflag1
	bra		.otherway
.oneway
	s_dec_alvar	B,x,al_childroty
	s_cmp_alvar	B,x,al_childroty,#-32
	s_bpl		.nochange2
	s_set_alvar	B,x,al_childroty,#-32
.nochange2
	s_cmp_var	W,x1,#35
	bmi		.otherway
	s_clr_alsflag	x,sflag1
	
.otherway
	s_jmp		.move

;**********
.stayabove
	s_jmp		.move

.move
	s_jmp_alsflag		x,sflag4,.fullopen
	s_jmp_NOTalsflag	x,sflag2,.finishup
	s_jmp_alsflag		x,sflag3,.close
.fullopen
	s_add_anim		x,#1,#10,.notit
	bra			.ok
.close	s_cmp_anim		x,#0
	s_beq			.notit
	s_add_anim		x,#-1,#10
	bra			.ok
.notit	s_not_alsflag		x,sflag3
	bra			.ok
.finishup	s_cmp_anim		x,#0
	s_beq			.ok
	s_add_anim		x,#-1,#10
.ok
	s_jmp_NOTalsflag	x,sflag5,.nothit
	s_cmp_anim		x,#8
	s_bne			.nothit
	s_jmp_random		.missfire,70
	s_weapon_rot		#0,#0
	s_weapon_pos		#0,#((-20)>>weapon_scale),#-30
	s_fire_weapon		x,BOSSHMISSILE1
	s_set_alvar		W,y,al_ptr,playpt
	s_set_colltype		y,ENEMY1
.missfire
	s_clr_alsflag		x,sflag5

.nothit

	s_jmp_notalsflag	x,sflag6,.dontfire
	s_jsr			launchbigmissile
	s_clr_alsflag		x,sflag6
.dontfire

	s_add_bossHP		x,al_hp

.end	s_end_strat


;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.explode
	s_set_objtobemother	y,x
	s_mode_change		y,#bossf_heli
	jml	explode_istrat
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.hit
	s_start_strat
	s_cmp_anim	x,#5
	s_bmi		.donthit
	s_test_hitflags	x,#HF1
	s_beq		.donthit
	s_clr_hitflags	x,#HF1!HF2
	s_clr_alsflag	x,nohitaffect
	s_set_alsflag	x,sflag5
	trigse		$80
	jml		hitflash_istrat
.donthit
	s_clr_hitflags	x,#HF2!HF1
	s_set_alsflag	x,nohitaffect
	trigse		$27
	jml		hitflash_istrat


blub
.blub
;--------------------------------------------------------------------
bossfarm_istrat
	s_start_strat
	s_set_alptrs	x,.strat,.hit,.explode
	s_set_aldata	x,#hardHP,#hardAP
	s_set_alsflag	x,nohitaffect
	s_set_alsflag	x,shadow
	s_set_colltype	x,ENEMY1
	s_mode_change	x,#0
	s_init_anim	x,#0
.strat	s_start_Strat
	s_mode_table
	s_mode_entry	.stayabove
	s_mode_label	fireironballs
	s_mode_entry	.firerandomly
	s_mode_label	ohlord1
	s_mode_entry	.ohlord1
	s_mode_label	ohlord2
	s_mode_entry	.ohlord2
	s_mode_label	smack1
	s_mode_entry	.smack1
	s_mode_label	smack2
	s_mode_entry	.smack2
	s_mode_label	armliftfire
	s_mode_entry	.armliftfire
	s_mode_label	armfire2
	s_mode_entry	.armfire2
	s_mode_label	bossfarm_heli1
	s_mode_entry	.heli1

	s_mode_label	bossfarm_heli2
	s_mode_entry	.heli2

;**********
.heli1
	s_achase_alvar	B,x,al_childrotz,#-deg90,5
	s_achase_alvar	B,x,al_childroty,#deg90,5
	s_achase_alvar	B,x,al_childrotx,#0,5
	s_jmp		.move2
;**********
.heli2
	s_achase_alvar	B,x,al_childrotz,#-deg90,5
	s_achase_alvar	B,x,al_childroty,#-deg90,5
	s_achase_alvar	B,x,al_childrotx,#0,5
	s_jmp		.move2
;**********
.mode0	s_mode_change	x,#0
	s_jmp		.strat
;**********
.armliftfire
	s_fchase_alvar	B,x,al_sbyte2,#-deg90,1,.firerandomly2
	s_jmp		.move
.firerandomly2
	s_jmp_notdelay	2,.move
	s_jsr		fire_ironball2
	jmp		.move

;**********
.armfire2
	s_jmp_alvarNOTZERO	B,x,al_sbyte2,.stayabove
	s_jmp_notdelay		3,.nofireyet
	s_inc_alvar		B,x,al_sbyte4
	s_cmp_alvar		B,x,al_sbyte4,#3
	s_beq			.zmode0
	s_jsr			fire_ironball3
.nofireyet
	s_jmp		.move
.zmode0	s_set_alvar	B,x,al_sbyte4,#0
	s_mode_change	x,#0
	s_jmp		.strat
;**********
.smack1
	s_fchase_alvar	B,x,al_childroty,#0,deg22,.mode0
	s_jmp		.move
;**********
.smack2
	s_fchase_alvar	B,x,al_childroty,#0,deg22,.mode0
	s_jmp		.move
;**********
.ohlord1
	s_fchase_alvar	B,x,al_childroty,#deg90,1
	s_jsr		.firerandomly3
	s_jmp		.move
;**********
.ohlord2
	s_fchase_alvar	B,x,al_childroty,#-deg90,1
	s_jsr		.firerandomly3
	s_jmp		.move
;**********
.firerandomly
	s_jmp_random	.nofire,99
	s_jsr		fire_ironball
	s_set_alvar	B,x,al_childz,#(-40<<bossf_scale)>>childscale
	s_set_alvar	B,x,al_sbyte3,#-deg22
.nofire
	s_fchase_alvar	B,x,al_sbyte2,#-deg22,1
	s_jmp		.move
;**********
.stayabove
	s_fchase_alvar	B,x,al_sbyte2,#0,1
	s_jmp		.move

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.move2
	s_jmp		.end
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.move
	s_fchase_alvar	B,x,al_childz,#(10<<bossf_scale)>>childscale,1
	s_fchase_alvar	B,x,al_sbyte3,#0,1
	s_copy_alvar2alvar	B,x,al_rotx,x,al_sbyte2
	s_add_alvars	B,x,al_rotx,x,al_sbyte3
	s_add_alvars	B,x,al_rotx,x,al_sword2
	s_fchase_alvar	B,x,al_sword2,#0,1
.end	s_end_strat

.firerandomly3
	s_cmp_alvar	B,x,al_roty,#deg180
	s_bne		.nofire3
	s_jsr		fire_ironball3

.nofire3	s_rts
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.hit
	s_start_strat
	s_set_alvar	B,x,al_sword2,#-16
	trigse	$27
	jml	hitflash_istrat
	
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.explode
	s_set_objtobemother	y,x
	s_remove_child	x,y
	s_set_alvar	B,x,al_vel,#100
	s_jsr		dgen3dvecs
	s_set_expstrat	x,.expstrat
.expstrat	s_start_strat
	s_jsr		dfallyvec_x
	s_cmp_alvar	W,x,al_worldy,#0
	s_beq		.finish
	s_jsr		daddvecs2pos_x

	s_end_strat
.finish
	s_set_expstrat	x,explode_istrat
	s_end_strat

;--------------------------------------------------------------------

fire_ironball
	s_jsr			fling.makeobj
	s_bcs			.nocando
	s_jsr			copypos_yx
	s_jsr			fling.copyrots_yx
	s_set_strat		y,ironball_istrat
	s_set_alvar		W,y,al_shape,#ironball
	s_set_colltype		y,ENEMY1
;	s_add_alvar		B,y,al_rotx,#0

	s_add_alvar		B,x,al_rotx,#-deg90
	s_set_var		B,x1,#0
	s_set_var		B,y1,#0
	s_set_var		B,z1,#120
	s_jsr			fling.positional
	s_add_alvar		B,x,al_rotx,#deg90

	s_set_var2vartab	B,B,B,x1,gameframe,sintab,-4
	s_add_alvar		B,x,al_rotx,x1
	s_set_alsflag		y,sflag3

	trigse	$49
.nocando
	s_rts
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

fire_ironball2
	s_jsr			fling.makeobj
	s_bcs			.nocando
	s_jsr			copypos_yx
	s_jsr			fling.copyrots_yx
	s_set_strat		y,ironball_istrat
	s_set_alvar		W,y,al_shape,#ironball
	s_set_colltype		y,ENEMY1

	s_add_alvar		B,x,al_rotx,#-deg90
	s_set_var		B,x1,#0
	s_set_var		B,y1,#0
	s_set_var		B,z1,#120
	s_jsr			fling.positional
	s_add_alvar		B,x,al_rotx,#deg90

	phx
	tyx
	s_set_objtobeplayer	y
	s_jsr			dobj2obj3dangle_xy
	txy
	plx

	s_set_var2rnd		x1,#3
	s_sub_var		B,x1,#2
	s_add_alvar		B,y,al_roty,x1
	s_set_alsflag		y,sflag2
	s_inc_var		B,powerbuild

	trigse	$49
.nocando
	s_rts

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

fire_ironball3
	s_jsr			fling.makeobj
	s_bcs			.nocando
	s_jsr			copypos_yx
	s_jsr			fling.copyrots_yx
	s_set_strat		y,ironball_istrat
	s_set_alvar		W,y,al_shape,#ironball
	s_set_colltype		y,ENEMY1

	s_set_var		B,x1,#0
	s_set_var		B,y1,#0
	s_set_var		B,z1,#120
	s_jsr			fling.positional

	phx
	tyx
	s_set_objtobeplayer	y
	s_jsr			dobj2obj3dangle_xy
	txy
	plx

	s_set_var2rnd		x1,#deg22-1
	s_add_alvar		B,y,al_rotx,x1
	s_add_alvar		B,y,al_rotx,#-deg11
	
	s_set_alsflag		y,sflag1
	trigse	$49
.nocando
	s_rts




;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ironball_istrat
	s_start_strat
	s_sprite_obj	x,#0	;,#12
	s_set_alptrs	x,.strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#hardHP,#ironballAP
	s_set_alsflag	x,nohitaffect
	s_set_alsflag	x,shadow
	s_set_alvar2rnd	x,al_vel,#7
	s_add_alvar	B,x,al_vel,#103-7
	s_jmp_NOTalsflag x,sflag1,.notfaster
	s_add_alvar	B,x,al_vel,#20
.notfaster
	s_jsr		dgen3dvecs
	s_jsr		drotsflat_x
.strat	s_start_strat
	s_jmp_NOTalsflag	x,sflag2,.nopowerbuild

	s_set_objtobeplayer	y
	a16
	lda	al_worldz,x
	sec
	sbc.w	al_worldz,y
	sta	x1
	cmp	#1000
	bmi	.nosub
	lda	al_worldz,x
	sec
	sbc	#50
	sta	al_worldz,x
.nosub
	a8

	s_cmp_alvar		W,x,al_worldy,#-2000
	s_bpl			.nolimit
	s_set_alvar		W,x,al_worldy,#-2000
.nolimit
	s_cmp_var		B,powerbuild,#128
	s_bcc			.otherbit
	s_dec_var		B,powerbuild
	s_cmp_var		B,powerbuild,#128
	s_bne			.noreset
	s_set_var		B,powerbuild,#0
.noreset
	s_set_objtobeplayer	y
	s_jsr		dobj2obj3dangle_xy
	s_set_var2rnd	x1,#7
	s_sub_var	B,x1,#4
	s_add_alvar	B,x,al_rotx,#0
	s_add_alvar	B,x,al_roty,x1
	s_add_alvar	B,x,al_rotx,x1
	s_jsr		dgen3dvecs
	s_jsr		drotsflat_x
	txy
	s_add_vecs2vecs	x,y
	s_clr_alsflag	x,sflag2
	s_set_alsflag	x,sflag1
	s_jmp		.homedake
.otherbit
	s_sub_alvar	W,x,al_worldy,#100
	s_jmp		.homedake

.nopowerbuild
	s_jmp_NOTalsflag	x,sflag1,.normfall

	s_falldown_Yvec		x,2,#1,#0
	
	bra		.moveit
.normfall	s_jsr		dfallyvec_x
.moveit
	s_jsr		daddvecs2pos_x
	s_set_objtobeplayer	y
	s_fchase_alvar2alvar	W,x,al_worldx,y,al_worldx,1
	s_jmp_NOTalsflag	x,sflag3,.homedake
	s_fchase_alvar2alvar	W,x,al_worldx,y,al_worldx,1
	s_fchase_alvar2alvar	W,x,al_worldx,y,al_worldx,1
	s_fchase_alvar2alvar	W,x,al_worldx,y,al_worldx,1
	s_fchase_alvar2alvar	W,x,al_worldx,y,al_worldx,1
	s_fchase_alvar2alvar	W,x,al_worldx,y,al_worldx,1
	s_sub_alvar		W,x,al_worldz,#60
.homedake
	s_add_playerz	x
.end	s_end_Strat
;--------------------------------------------------------------------
topright1_istrat
	s_start_Strat
	s_set_alvar	B,x,al_roty,#deg180
	s_set_alvar	B,x,al_rotz,#-deg180
	jml	nocoll_istrat
topleft1_istrat
	s_start_Strat
	s_set_alvar	B,x,al_roty,#deg180
	s_set_alvar	B,x,al_rotz,#deg90
	jml	nocoll_istrat
botleft1_istrat
	s_start_Strat
	s_set_alvar	B,x,al_roty,#deg180
	s_set_alvar	B,x,al_rotz,#0
	jml	nocoll_istrat
botright1_istrat
	s_start_Strat
	s_set_alvar	B,x,al_roty,#deg180
	s_set_alvar	B,x,al_rotz,#-deg90
	jml	nocoll_istrat

leftwall_istrat
	s_start_strat
	s_set_alvar	B,x,al_roty,#deg180
	jml	nocoll_istrat

rightwall_istrat
;	s_start_strat
;	s_set_alvar	B,x,al_roty,#0
	jml	nocoll_istrat
duct_istrat
	s_start_strat
	jml	nocoll_istrat
;--------------------------------------------------------------------
	IFEQ	1
zaco5again_istrat
	s_start_strat
	s_set_alptrs	x,.strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#z5aHP,#z5aAP
	s_set_alsflag	x,shadow
.strat	s_start_strat
	s_add_alvar	W,x,al_worldz,#40
	s_achase_alvar	W,x,al_worldx,#0,3
	s_achase_alvar	W,x,al_worldy,#-60,3
	a16
	lda		#1000
	s_jsr		dzdistless
	shorta
	s_bcc		.strat2i
.move
	s_add_playerz	x
.end	s_end_strat
.strat2i	s_set_strat	x,.strat2
.strat2	s_start_strat
	s_cmp_alvar	B,x,al_roty,#deg180
	s_beq		.strat3i
	s_add_alvar	B,x,al_roty,#16
	s_jmp		.move
.strat3i	s_set_strat	x,.strat3
	s_set_objtobeplayer	y
	s_jsr		dobj2obj3dangle_xy
	s_set_alvar	B,x,al_sbyte1,#40
.strat3	s_start_strat
	s_jmp_notdelay		4,.missit
	s_weapon_pos		#0,#0,#0
	s_weapon_rot		#0,#0
	s_fire_weapon		x,SLOWELASER
.missit
	s_beqdec_alvar	B,x,al_sbyte1,.strat4i
	s_jmp		.move
.strat4i	s_set_strat	x,.strat4
.strat4	s_start_strat
	s_sub_alvar	W,x,al_worldz,#80
	s_add_alvar	B,x,al_rotz,#16
	s_jmp		.move
	ENDC
;--------------------------------------------------------------------
	IFEQ	1
buttery_istrat
	s_start_strat
	s_set_alptrs	x,.strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#butteryHP,#butteryAP
.strat	s_start_strat

.move
.end	s_end_strat
	ENDC

;--------------------------------------------------------------------

launchbigmissile
	s_jsr			fling.makeobj
	s_bcs			.nocando
	s_jsr			copypos_yx
	s_jsr			fling.copyrots_yx
	s_set_strat		y,ironballmissile_istrat
	s_set_alvar		W,y,al_shape,#big_m
	s_set_colltype		y,ENEMY1

	s_set_var		B,x1,#0
	s_set_var		B,y1,#0
	s_set_var		B,z1,#120
	s_jsr			fling.positional

	phx
	tyx
	s_set_objtobeplayer	y
	s_jsr			dobj2obj3dangle_xy
	txy
	plx

.nocando
	s_rts



launchhead
	s_jsr			fling.makeobj
	bcs			.nocando
	s_jsr			copypos_yx
	s_jsr			fling.copyrots_yx
	s_set_strat		y,headfire_istrat
	s_set_alvar		W,y,al_shape,#boss_f_b
	s_set_colltype		y,ENEMY1
	s_set_alsflag		y,shadow

	phx
	tyx
	s_set_objtobeplayer	y
	s_jsr			dobj2obj3dangle_xy
	txy
	plx

.nocando
	rts

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

headfire_istrat
	s_start_Strat
	s_set_alptrs	x,.strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#bossfheadHP,#bossfheadAP
.strat	s_start_strat

	s_jsr		dfallyvec_x
	s_jsr		daddvecs2pos_x
	s_cmp_alvar	W,x,al_worldy,#0
	s_beq		.reachedground

.move
	s_add_playerz	x
.end	s_end_strat
.reachedground
	s_set_strat	x,.strat2
	trigse	$8f
	s_set_objtobeplayer	y
	s_jsr			dobj2obj3dangle_xy
	s_set_alvar		B,x,al_vel,#120
	s_jsr			dgen3dvecs
	
.strat2	s_start_strat

	s_add_alvar		B,x,al_rotx,#deg45
	s_jsr			daddvecs2pos_x
	s_Add_playerz		x
	s_end_strat


;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


skillfly_istrat
	s_start_strat
	s_set_alsflag	x,colldisable
	s_cmp_alvar	W,x,al_shape,#nullshape
	s_bne		.noinvis
	s_set_alsflag	x,invisible
.noinvis	s_set_strat		x,.strat
	s_inc_var		B,skillfly&WM
	s_cmp_alvar		W,x,al_sword1,#0
	s_bne			.strat
	s_set_alvar		W,x,al_sword1,#(20<<2)
.strat	s_start_strat

	a16
	lda	#200
	s_jsr	dzdistless
	shorta
	s_bcc	.norm

	s_copy_alvar2var	W,x,pathx1,al_sword1
	s_jmp_outxydistrng	x,y,#0,pathx1,.norm

	s_dec_var		B,skillfly&WM
.rem
	s_remove_obj	x
	s_end_strat

.norm
	s_set_objtobeplayer	y
	s_add_alvar		W,x,al_worldz,#1000
	s_jmp_objinfront	y,x,.rem
	s_sub_alvar		W,x,al_worldz,#1000
	s_end_strat
	

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
damyscr_istrat	s_start_strat
	s_set_path	x,damyscr
	jsl		random_l
	txy
	a16
	and		#62
	tax
	lda.l		damyscr_shapeslist,x
	sta.w		al_shape,y
	a8
	tyx
	
	jml		path_istrat
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

;


damyscr_shapeslist
	dw	zaco_0
	dw	zaco_7p
	dw	zaco_4
	dw	zaco_5
	dw	zaco_6
	dw	zaco_8
	dw	zaco_9
	dw	zaco_a
	dw	zaco_b
	dw	kamikaze
;
	dw	d_head_0
	dw	air_1
	dw	warker_3
	dw	boss_7_1
	dw	shark
	dw	mine_0
	dw	boss_d_0
	dw	boss_e_0	
	dw	boss_f_1
	dw	carrier
;
	dw	robot_0
	dw	heli
	dw	walker_0
	dw	round_0
	dw	bazooka
	dw	miss_1_2
	dw	walker_2
	dw	car_0
	dw	old_type
	dw	uper_m	
;
	dw	tadpole
	dw	zaco_1

;
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	IFNE	prntrouln_on
	printroulen	here12,<dstrats>
dstratlen	=	*-here12
	?dstratlen
	ENDC

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
