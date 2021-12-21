;***************************************************************************
;*                                                                         *
;*                               Star Fox                                  *
;*                              ----------                                 *
;*                                                                         *
;*                           SuperNES version.                             *
;*                                                                         *
;*                           Argonaut Software.      		               *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   File: PATHS.ASM                                                       *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr: Simple Alien path following code.                               *
;*_________________________________________________________________________*
;*                                                                         *
;*   Date: 18/9/92                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;* Author: Dylan Cuthbert.                                                 *
;*                                                                         *
;***************************************************************************

pathinfo	=	0	; output path information?

	strats_start

	incpublics	EXT\paths.ext

; alvars used:
; al_sbyte1 =  used for child macros
; al_sbyte2 =  loop count
; al_sbyte3 =  general purpose count
; al_sbyte4 =  friend ID
; al_sword1 =  used for child macros
; al_sword2 =  current position in path map
; al_ptr    =  used for child and shape macros

; sflags used:
; sflag1    =  Z relative to player on
; sflag2    =  always generate vecs on
; sflag3    =  helicopter flight mode on
; sflag4    =  space flight mode on
; sflag5    =  collision with player's weapon flag
; sflag6    =  smoke on
; sflag7    =  normal collision flag
; sflag8    =  flag macros

	incfile	pathmacs.asm

friendhp_unit	=	10

pathdha_istrat
	s_start_strat
	s_set_aldata	x,#10,#10
	bra	path_istrat
patht_istrat
	s_start_strat
	s_set_alsflag	x,colldisable
	s_set_alsflag	x,textobj
	s_set_aldata	x,#10,#hardAP
path_istrat
	s_start_strat
	s_set_alptrs	x,.strat,pathhit_istrat,explode_istrat
	s_set_colltype	x,ENEMY1
	s_set_alsflag	x,shadow
	s_set_alvar		B,x,al_sbyte4,#0
	stz		pathptr
	stz		pathptr+1
.strat
	s_start_strat

	ldy	al_sword2,x
	phx
	tyx
	lda.l	paths,x
	plx

	s_mode_change	x,a

	s_mode_table
	s_mode_entry	.relzon,p_reltoplayeron
	s_mode_entry	.relzoff,p_reltoplayeroff
	s_mode_entry	.wait,p_wait
	s_mode_entry	.genvon,p_alwaysgenvecson
	s_mode_entry	.genvoff,p_alwaysgenvecsoff
	s_mode_entry	.setvel,p_setvel
	s_mode_entry	.loop,p_loop
	s_mode_entry	.addb,p_addb
	s_mode_entry	.addw,p_addw
	s_mode_entry	.faceplayer,p_faceplayer
	s_mode_entry	.waitfaceplayer,p_waitfaceplayer
;	s_mode_entry	.firelaser,p_firelaser
;	s_mode_entry	.firelasercanhit,p_firelasercanhit
;	s_mode_entry	.firemissile,p_firemissile
	s_mode_entry	.achaseB,p_achaseB
	s_mode_entry	.achaseW,p_achaseW
	s_mode_entry	.waitachaseB,p_waitachaseB
	s_mode_entry	.waitachaseW,p_waitachaseW
	s_mode_entry	.theend,p_end
	s_mode_entry	.setb,p_setb
	s_mode_entry	.setw,p_setw
	s_mode_entry	.findobj,p_findshape
	s_mode_entry	.findnextobj,p_findnextshape
	s_mode_entry	.faceshape,p_faceshape
	s_mode_entry	.remove,p_remove
	s_mode_entry	.gotopos,p_gotopos
	s_mode_entry	.gotoshapepos,p_gotoshapepos
	s_mode_entry	.explode,p_explode
	s_mode_entry	.immune,p_immune
	s_mode_entry	.spaceshipon,p_spaceshipon
	s_mode_entry	.spaceshipoff,p_spaceshipoff
	s_mode_entry	.zacoon,p_zacoon
	s_mode_entry	.zacooff,p_zacooff
	s_mode_entry	.distless,p_distless
	s_mode_entry	.shapedistless,p_shapedistless
	s_mode_entry	.goto,p_goto
	s_mode_entry	.jump1,p_igoto
	s_mode_entry	.accel,p_accel
	s_mode_entry	.hitground,p_hitground
	s_mode_entry	.hitwall,p_hitwall
	s_mode_entry	.initanim,p_initanim
	s_mode_entry	.addanim,p_addanim
	s_mode_entry	.debris,p_debris
	s_mode_entry	.friend,p_friend
	s_mode_entry	.link,p_link
	s_mode_entry	.shapedead,p_shapedead
	s_mode_entry	.iflevel,p_iflevel
	s_mode_entry	.leftofplayer,p_leftofplayer
	s_mode_entry	.rightofplayer,p_rightofplayer
	s_mode_entry	.aboveplayer,p_aboveplayer
	s_mode_entry	.belowplayer,p_belowplayer
	s_mode_entry	.notfriend,p_notfriend
	s_mode_entry	.msg,p_msg
	s_mode_entry	.damage,p_damage
	s_mode_entry	.almostdead,p_almostdead
	s_mode_entry	.smokeon,p_smokeon
	s_mode_entry	.smokeoff,p_smokeoff
	s_mode_entry	.randomgoto,p_randomgoto
	s_mode_entry	.ifsameb,p_ifsameb
	s_mode_entry	.ifsameW,p_ifsameW
	s_mode_entry	.ifbetweenB,p_ifbetweenB
	s_mode_entry	.ifbetweenW,p_ifbetweenW
	s_mode_entry	.invincibleon,p_invincibleon
	s_mode_entry	.invincibleoff,p_invincibleoff
	s_mode_entry	.playerdead,p_playerdead
	s_mode_entry	.spawn,p_spawn
	s_mode_entry	.spawnlink,p_spawnlink
	s_mode_entry	.spawnchild,p_spawnchild
	s_mode_entry	.zremoveon,p_zremoveon
	s_mode_entry	.zremoveoff,p_zremoveoff
	s_mode_entry	.debug,p_debug
	s_mode_entry	.fire,p_fire
	s_mode_entry	.firecanhit,p_firecanhit
	s_mode_entry	.fireatplayer,p_fireatplayer
	s_mode_entry	.fireatplayercanhit,p_fireatplayercanhit
	s_mode_entry	.fireatshape,p_fireatshape
	s_mode_entry	.fireatshapecanhit,p_fireatshapecanhit
	s_mode_entry	.setweapon,p_weapon
	s_mode_entry	.childdead,p_childdead
	s_mode_entry	.linkchild,p_linkchild
	s_mode_entry	.flagshape,p_flagshape
	s_mode_entry	.flagchild,p_flagchild
	s_mode_entry	.flagmother,p_flagmother
	s_mode_entry	.ifflag,p_ifflag
	s_mode_entry	.text,p_text
	s_mode_entry	.trail,p_trail
	s_mode_entry	.gosub,p_gosub
	s_mode_entry	.return,p_return
	s_mode_entry	.do,p_do
	s_mode_entry	.next,p_next
	s_mode_entry	.inext,p_inext
	s_mode_entry	.break,p_break
	s_mode_entry	.breakc,p_breakc
	s_mode_entry	.invisibleon,p_invisibleon
	s_mode_entry	.invisibleoff,p_invisibleoff
	s_mode_entry	.always,p_always
	s_mode_entry	.alwaysoff,p_alwaysoff
	s_mode_entry	.force,p_force
	s_mode_entry	.sprite,p_sprite
	s_mode_entry	.setstrat,p_setstrat
	s_mode_entry	.setvBB,p_setvBB
	s_mode_entry	.setvBW,p_setvBW
	s_mode_entry	.setvWW,p_setvWW
	s_mode_entry	.setvWB,p_setvWB
	s_mode_entry	.addvBB,p_addvBB
	s_mode_entry	.addvBW,p_addvBW
	s_mode_entry	.addvWW,p_addvWW
	s_mode_entry	.addvWB,p_addvWB
	s_mode_entry	.negB,p_negB
	s_mode_entry	.negW,p_negW
	s_mode_entry	.setrandomB,p_setrandomB
	s_mode_entry	.setrandomW,p_setrandomW
	s_mode_entry	.ifhitflag,p_ifhitflag
	s_mode_entry	.collisionson,p_collisionson
	s_mode_entry	.collisionsoff,p_collisionsoff
	s_mode_entry	.start65816,p_start65816
	s_mode_entry	.ifnot,p_ifnot
	s_mode_entry	.particle,p_particle
	s_mode_entry	.shadowon,p_shadowon
	s_mode_entry	.shadowoff,p_shadowoff
	s_mode_entry	.sound,p_sound
	s_mode_entry	.sound2,p_sound2
	s_mode_entry	.qspawn,p_qspawn
	s_mode_entry	.unlinkchild,p_unlinkchild
	s_mode_entry	.behindplayer,p_behindplayer
	s_mode_entry	.importb,p_importb
	s_mode_entry	.importw,p_importw
	s_mode_entry	.exportb,p_exportb
	s_mode_entry	.exportw,p_exportw
	s_mode_entry	.div2b,p_div2b
	s_mode_entry	.div2w,p_div2w
	s_mode_entry	.indexb,p_indexb
	s_mode_entry	.indexw,p_indexw
	s_mode_entry	.pushb,p_pushb
	s_mode_entry	.pushw,p_pushw
	s_mode_entry	.pullb,p_pullb
	s_mode_entry	.pullw,p_pullw
	s_mode_entry	.withinrange,p_withinrange
	s_mode_entry	.shapeinrange,p_shapeinrange
	s_mode_entry	.msgwithmeter,p_msgwithmeter
	s_mode_entry	.doq,p_doq
	s_mode_entry	.doalvarb,p_doalvarb
	s_mode_entry	.doalvarw,p_doalvarw
	s_mode_entry	.gosubalvar,p_gosubalvar
	s_mode_entry	.unlinkself,p_unlinkself
	s_mode_entry	.becomechild,p_becomechild
	s_mode_entry	.becomeshape,p_becomeshape
	s_mode_entry	.becomemother,p_becomemother
	s_mode_entry	.unbecome,p_unbecome
	s_mode_entry	.become,p_become
	s_mode_entry	.removechild,p_removechild
	s_mode_entry	.ifzerob,p_ifzerob
	s_mode_entry	.ifzerow,p_ifzerow
	s_mode_entry	.ifnotzerob,p_ifnotzerob
	s_mode_entry	.ifnotzerow,p_ifnotzerow
	s_mode_entry	.set0b,p_set0b
	s_mode_entry	.set0w,p_set0w
	s_mode_entry	.incb,p_incb
	s_mode_entry	.incw,p_incw
	s_mode_entry	.decb,p_decb
	s_mode_entry	.decw,p_decw
	s_mode_entry	.addrotx,p_addrotx
	s_mode_entry	.addroty,p_addroty
	s_mode_entry	.addrotz,p_addrotz
	s_mode_entry	.addworldx,p_addworldx
	s_mode_entry	.addworldy,p_addworldy
	s_mode_entry	.addworldz,p_addworldz
	s_mode_entry	.addws,p_addws
	s_mode_entry	.wait1,p_wait1
	s_mode_entry	.score,p_score
	s_mode_table_end


;-------------------------------------------------------------------
.zadd14	s_set_alvar	B,x,al_sbyte3,#0
.add14	a8
	s_add_alvar	W,x,al_sword2,#14
	jmp		.strat
;-------------------------------------------------------------------
.zadd13	s_set_alvar	B,x,al_sbyte3,#0
.add13	a8
	s_add_alvar	W,x,al_sword2,#13
	jmp		.strat
;-------------------------------------------------------------------
.zadd9	s_set_alvar	B,x,al_sbyte3,#0
.add9	a8
	s_add_alvar	W,x,al_sword2,#9
	jmp		.strat
;-------------------------------------------------------------------
.zadd8	s_set_alvar	B,x,al_sbyte3,#0
.add8	a8
	s_add_alvar	W,x,al_sword2,#8
	jmp		.strat
;-------------------------------------------------------------------
.zadd7	s_set_alvar	B,x,al_sbyte3,#0
.add7	a8
	s_add_alvar	W,x,al_sword2,#7
	jmp		.strat
;-------------------------------------------------------------------
.zadd6	s_set_alvar	B,x,al_sbyte3,#0
.add6	a8
	s_add_alvar	W,x,al_sword2,#6
	jmp		.strat
;-------------------------------------------------------------------
.zadd5	s_set_alvar	B,x,al_sbyte3,#0
.add5	a8
	s_add_alvar	W,x,al_sword2,#5
	jmp		.strat
;-------------------------------------------------------------------
.zadd4	s_set_alvar	B,x,al_sbyte3,#0
.add4	a8
	s_add_alvar	W,x,al_sword2,#4
	jmp		.strat
;-------------------------------------------------------------------
.zadd3	s_set_alvar	B,x,al_sbyte3,#0
.add3	a8
	s_add_alvar	W,x,al_sword2,#3
	jmp		.strat
;-------------------------------------------------------------------
.zadd2	s_set_alvar	B,x,al_sbyte3,#0
.add2	a8
	s_add_alvar	W,x,al_sword2,#2
	jmp		.strat
;-------------------------------------------------------------------
.zadd1	s_set_alvar	B,x,al_sbyte3,#0
.add1	a8
	s_inc_alvar	W,x,al_sword2
	jmp		.strat
;-------------------------------------------------------------------
;-------------------------------------------------------------------
.jump1	a16
	getparam	1
	sta		al_sword2,x
	a8
	jmp		.strat

;-------------------------------------------------------------------
.jump2	a16
	getparam	2
	sta		al_sword2,x
	a8
	jmp		.strat
;-------------------------------------------------------------------
.jump3	a16
	getparam	3
	sta		al_sword2,x
	a8
	jmp		.strat
;-------------------------------------------------------------------
.jump4	a16
	getparam	4
	sta		al_sword2,x
	a8
	jmp		.strat
;-------------------------------------------------------------------
.jump5	a16
	getparam	5
	sta		al_sword2,x
	a8
	jmp		.strat
;-------------------------------------------------------------------
.jump6	a16
	getparam	6
	sta		al_sword2,x
	a8
	jmp		.strat
	
;-------------------------------------------------------------------
.jump7	a16
	getparam	7
	sta		al_sword2,x
	a8
	jmp		.strat
;-------------------------------------------------------------------

;**********
.zacoon	SHORTA
	s_set_alsflag	x,sflag3
	jmp		.add1
;**********
.zacooff	SHORTA
	s_clr_alsflag	x,sflag3
	jmp		.add1
;**********
.spaceshipoff SHORTA
	s_clr_alsflag	x,sflag4
	jmp		.add1
;**********
.spaceshipon	SHORTA
	s_set_alsflag	x,sflag4
	jmp		.add1
;**********
.relzon	SHORTA
	s_set_alsflag	x,sflag1
	jmp		.add1

;**********
.relzoff	SHORTA
	s_clr_alsflag	x,sflag1
	jmp		.add1

;**********
.wait	SHORTA
	getparam	1
	cmp		al_sbyte3,x
	s_beq		.zadd2
	s_inc_alvar	B,x,al_sbyte3
	jmp		.move

;**********
.wait1	SHORTA
	s_inc_alvar	W,x,al_sword2
	jmp		.move
	
;**********
.genvon	SHORTA
	s_set_alsflag	x,sflag2
	jmp		.add1
;**********
.genvoff	SHORTA
	s_clr_alsflag	x,sflag2
	jmp		.add1

;**********
.setvel	SHORTA
	getparam	1
	sta		al_vel,x
	s_jmp_alsflag	x,sflag2,.add2	; always generating vecs
	s_jsr		.genvecs
	jmp		.add2

.genvecs
	s_jmp_alsflag	x,sflag3,.norotx
	s_gen_3dvecs	x,al_roty,al_rotx,al_vel
	s_rts
.norotx
	s_gen_vecs	x,al_roty,al_vel
	s_rts

;**********
.loop	SHORTA
	getparam	1
	cmp		al_sbyte2,x
	beq		.finishedloop
	s_inc_alvar	B,x,al_sbyte2
	a16
	getparam	2
	sta		al_sword2,x
	a8
	jmp		.move

.finishedloop
	stz		al_sbyte2,x
	jmp		.add4

;**********
.addb	SHORTA
	addalvaroffset	1
	getparam	2
	clc
	adc.w		0,y
	sta.w		0,y
	jmp		.add3

;**********
.addrotx	SHORTA
	getparam	1
	clc
	adc		al_rotx,x
	sta		al_rotx,x
	jmp		.add2

;**********
.addroty	SHORTA
	getparam	1
	clc
	adc		al_roty,x
	sta		al_roty,x
	jmp		.add2

;**********
.addrotz	SHORTA
	getparam	1
	clc
	adc		al_rotz,x
	sta		al_rotz,x
	jmp		.add2

;**********
.addworldx	SHORTA
	getparam	1
	a16
	sexa
	clc
	adc		al_worldx,x
	sta		al_worldx,x
	jmp		.add2

;**********
.addworldy	SHORTA
	getparam	1
	a16
	sexa
	clc
	adc		al_worldy,x
	sta		al_worldy,x
	jmp		.add2

;**********
.addworldz	SHORTA
	getparam	1
	a16
	sexa
	clc
	adc		al_worldz,x
	sta		al_worldz,x
	jmp		.add2

;**********
.addws	SHORTA
	addalvaroffset	1
	getparam	2
	a16
	sexa
	clc
	adc.w		0,y
	sta.w		0,y
	a8
	jmp		.add3


;**********
.addw	SHORTA
	addalvaroffset	1
	a16
	getparam	2
	clc
	adc.w		0,y
	sta.w		0,y
	a8
	jmp		.add4


;**********
.incb	SHORTA
	addalvaroffset	1
	lda.w	0,y
	inc	a
	sta.w	0,y
	jmp		.add2

;**********
.incw	SHORTA
	addalvaroffset	1
	a16
	lda.w	0,y
	inc	a
	sta.w	0,y
	a8
	jmp		.add2


;**********
.decb	SHORTA
	addalvaroffset	1
	lda.w	0,y
	dec	a
	sta.w	0,y
	jmp		.add2

;**********
.decw	SHORTA
	addalvaroffset	1
	a16
	lda.w	0,y
	dec	a
	sta.w	0,y
	a8
	jmp		.add2

;**********
.waitfaceplayer	SHORTA
	s_set_objtobeplayer	y
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,3,.add1
	jmp			.move

;**********
.faceplayer	SHORTA
	s_set_objtobeplayer	y
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,2
	jmp			.add1

;**********
.firelasercanhit	SHORTA
	s_jsr			.flaser
	jmp			.add1
.firelaser
	s_jsr			.flaser
	s_set_colltype		y,ENEMY1
	jmp			.add1

.flaser
	s_weapon_pos		#0,#0,#0
	s_weapon_rot		#0,#0
	s_fire_weapon		x,RELSLOWELASER
	s_rts

;**********
.firemissile	SHORTA
	s_weapon_pos		#0,#0,#0
	s_weapon_rot		#0,#0
	s_fire_weapon		x,HMISSILE1
	phx
	s_set_objtobeplayer	x
	s_set_alvartobeobj	y,al_ptr,x
	plx
	jmp			.add1

;**********
.setweapon	SHORTA
	getparam	1
	sta		al_weapontype,x
	jmp		.add2

;**********
.fire	SHORTA
	jsr	.fireit
	s_set_colltype		y,ENEMY1
	jmp		.add1

;**********
.firecanhit	SHORTA
	jsr	.fireit
	jmp		.add1


;**********
.fireatplayer	SHORTA
	jsr	.fireitatplayer
	s_set_colltype		y,ENEMY1
	jmp	.add1
;**********
.fireatplayercanhit	SHORTA
	jsr	.fireitatplayer
	jmp	.add1
;**********
.fireitatplayer	SHORTA
	jsr	.fireit
	phx
	s_set_objtobeplayer	x
	s_set_alvartobeobj	y,al_ptr,x
	plx
	rts


;**********
.fireatshape	SHORTA
	jsr	.fireitatshape
	s_set_colltype		y,ENEMY1
	jmp	.add1

;**********
.fireatshapecanhit	SHORTA
	jsr	.fireitatshape
	jmp	.add1

;**********
.fireitatshape	SHORTA
	jsr	.fireit
	phx
	a16
	lda	al_ptr,x
	tax
	a8
	s_set_alvartobeobj	y,al_ptr,x
	plx
	rts

;**********
.fireit	SHORTA
	s_weapon_pos	#0,#0,#0
	s_weapon_rot	#0,#0
	s_fire_weapon	x,CURRENT
	sty		becomelastobj&WM
	s_rts

;**********
.achaseB	SHORTA
	getparam	1
	sta		pathy1

	addalvaroffset	2

	lda.w		0,y
	sta		pathx1

	s_achase_var	B,pathx1,pathy1,3

	lda		pathx1
	sta.w		0,y
	jmp		.add3

;**********
.achaseW	SHORTA
	a16
	getparam	1
	sta		pathy1

	a8
	addalvaroffset	3
	a16

	lda.w		0,y
	sta		pathx1

	a8
	s_achase_var	W,pathx1,pathy1,3
	a16
	lda		pathx1
	sta.w		0,y
	a8
	jmp		.add4

;**********
.waitachaseB	SHORTA
	getparam	1
	sta		pathy1

	addalvaroffset	2

	lda.w		0,y
	sta		pathx1

	s_achase_var	B,pathx1,pathy1,3,.wacbfin

	lda		pathx1
	sta.w		0,y
	jmp		.move
.wacbfin

	lda		pathx1
	sta.w		0,y
	jmp		.add3

;**********
.waitachaseW	SHORTA
	a16
	getparam	1
	sta		pathy1

	a8
	addalvaroffset	3
	a16
	lda.w		0,y
	sta		pathx1

	a8
	s_achase_var	W,pathx1,pathy1,3,.wacwfin
	a16
	lda		pathx1
	sta.w		0,y
	a8
	jmp		.move
.wacwfin
	a16
	lda		pathx1
	sta.w		0,y
	a8
	jmp		.add4

;**********
.addvBB	SHORTA
	phx
	jsr		.getxyalvars

	lda.w		0,x
	clc
	adc.w		0,y
	sta.w		0,y

	plx
	jmp		.add3

;**********
.addvWW	SHORTA
	phx
	jsr		.getxyalvars

	a16
	lda.w		0,x
	clc
	adc.w		0,y
	sta.w		0,y

	plx
	jmp		.add3

;**********
.addvBW	SHORTA
	phx
	jsr		.getxyalvars

	a16
	lda.w		0,x
	a8
	clc
	adc.w		0,y
	sta.w		0,y

	plx
	jmp		.add3


;**********
.addvWB	SHORTA
	phx
	jsr		.getxyalvars

	lda.w		0,x
	a16
	sexa
	clc
	adc.w		0,y
	sta.w		0,y

	plx
	jmp		.add3


;**********
.setvBB	SHORTA
	phx
	jsr		.getxyalvars

	lda.w		0,x
	sta.w		0,y

	plx
	jmp		.add3

;**********
.setvWW	SHORTA
	phx
	jsr		.getxyalvars

	a16
	lda.w		0,x
	sta.w		0,y

	plx
	jmp		.add3

;**********
.setvBW	SHORTA
	phx
	jsr		.getxyalvars

	a16
	lda.w		0,x
	a8
	sta.w		0,y

	plx
	jmp		.add3

;**********
.setvWB	SHORTA
	phx
	jsr		.getxyalvars

	a8
	lda.w		0,x
	a16
	sexa
	sta.w		0,y

	plx
	jmp		.add3

;* * * * * *
.getxyalvars
	php
	a8
	addalvaroffset	2
	phy
	addalvaroffset	1
	plx
	plp
	rts

;**********
.importb	SHORTA
	jsr	.import
	lda		pathx2
	sta.w		0,y
	jmp		.add4

;**********
.importw	SHORTA
	jsr	.import
	a16
	lda		pathx2
	sta.w		0,y
	jmp		.add4

;**********
.exportb	SHORTA
	jsr	.export
	a8
	lda	pathx2
	sta.w	0,y
	jmp	.add4

;**********
.exportw	SHORTA
	jsr	.export
	LONGA
	lda	pathx2
	sta.w	0,y
	jmp	.add4

; * * * * *
.export	SHORTA
	addalvaroffset	1
	a16
	lda.w		0,y
	sta		pathx2
	getparam	2
	tay
	rts


;* * * * * *
.import	
	a16
	getparam	2
	tay
	lda.w		0,y
	sta		pathx2

	a8
	addalvaroffset	1
	rts


;**********
.setb	SHORTA
	addalvaroffset	2
	a8
	getparam	1
	sta.w		0,y
	jmp		.add3

;**********
.setw	SHORTA
	addalvaroffset	3
	a16
	getparam	1
	sta.w		0,y
	a8
	jmp		.add4

;**********
.set0b	SHORTA
	addalvaroffset	1
	a8
	lda	#0
	sta.w	0,y
	jmp		.add2

;**********
.set0w	SHORTA
	addalvaroffset	1
	a16
	lda		#0
	sta.w		0,y
	a8
	jmp		.add2

;**********
.findobj	SHORTA
	a16
	getparam	1
	sta		pathx1
	a8
	ldy		allst
	s_set_find	y
	s_find_nearobj	y,x,pathx1,#0,#7000,.notfound
.found	sty		al_ptr,x
	jmp		.add3
.notfound
	stz		al_ptr,x
	stz		al_ptr+1,x
	jmp		.add3

;**********
.findnextobj	SHORTA
	a16
	getparam	1
	sta		pathx1
	a8
	ldy		al_ptr,x
	s_beq		.fnotfound
	s_set_find	y
	s_find_nearobj	y,x,pathx1,#0,#3000,.fnotfound
.fnofound	sty		al_ptr,x
	jmp		.add3
.fnotfound
	stz		al_ptr,x
	stz		al_ptr+1,x
	jmp		.add3

;**********
.faceshape	SHORTA
	s_set_objtobealvar	y,x,al_ptr
	s_beq			.add1
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,3,.add1
	jmp			.move

;**********
.removechild	SHORTA
	getparam	1
	sta		pathx1
	phx
	s_jmp_alsflag	x,motherobj,.ok
	s_set_objtobemother	y,x
	tyx
.ok
	s_set_objtobechild	y,x,pathx1

	s_remove_obj		y

	plx
	jmp		.add2


;**********
.remove	SHORTA
	s_jmp_NOTalsflag	x,motherobj,.normremove

	ldy	al_sword1,x
.nxtobjtorem
	cpy	#0
	beq	.normremove
	a16
	lda.w	al_sword1,y
	pha
	a8
	s_remove_obj	y
	ply
	bra	.nxtobjtorem
	
.normremove
	s_remove_obj		x
	jmp			.end

;**********
.explode	SHORTA
	lda	al_sbyte4,x
	beq	.notfriend2
	a16
	and	#255
	tay
	a8
	lda	#0
	sta.w	friends_HP-1,y
.notfriend2
	s_jmp_NOTalsflag	x,motherobj,.normexplode

	ldy	al_sword1,x
.nxtobjtoremex
	cpy	#0
	beq	.normexplode
	a16
	lda.w	al_sword1,y
	pha
	a8
	s_kill_obj	y
	ply
	bra	.nxtobjtoremex
	
.normexplode
	s_kill_obj		x
	jmp			.end2


;**********
.gotopos	SHORTA
	a16
	getparam	1
	sta		pathx1
	getparam	3
	sta		pathy1
	getparam	5
	sta		pathz1

	getparam	7
	and		#255
	sta		pathz2

	a8

	s_set_objtobeplayer	y
	s_set_WP		x,y,1,pathx1,pathy1,pathz1
	s_jmp_NOTalsflag	x,sflag1,.noplayerpathz2
	s_add_playerz		x
.noplayerpathz2
	s_goto_WP		x,x,1,pathz2,20,2,0,#300,#0,.continue
	jmp		.dontaddvecs
.continue
	jmp		.add8


;**********
.gotoshapepos	SHORTA
	a16
	getparam	1
	sta		pathx1
	getparam	3
	sta		pathy1
	getparam	5
	sta		pathz1

	getparam	7
	and		#255
	sta		pathz2

	a8

	s_set_objtobealvar	y,x,al_ptr
	s_beq			.continue2
	s_set_WP		x,y,1,pathx1,pathy1,pathz1
	s_jmp_NOTalsflag	x,sflag1,.noplayerpathz2_2
	s_add_playerz		x
.noplayerpathz2_2
	s_goto_WP		x,x,1,pathz2,1,2,0,#300,#0,.continue2
	jmp		.dontaddvecs
.continue2
	jmp		.add8


;**********
.immune	SHORTA
	s_set_objtobealvar	y,x,al_ptr
	s_chk_objptr	y,.add1
	s_make_immune

	jmp		.add1

;**********
.distless	SHORTA
	a16
	getparam	1
	sta		pathx1
	a8
	s_set_objtobeplayer	y
.distmoreorless
	lda	pifnot
	beq	.dlpos
	stz	pifnot
	s_jmp_zdistmore		x,y,pathx1,.jump3
	jmp	.add5
.dlpos
	s_jmp_zdistless		x,y,pathx1,.jump3
	jmp		.add5

;**********
.shapedistless	SHORTA
	a16
	getparam	1
	sta		pathx1
	a8
	s_set_objtobealvar	y,x,al_ptr
	s_beq			.add5
	bra			.distmoreorless

;**********
.goto	SHORTA
	a16
	getparam	1
	sta		al_sword2,x
	a8
	jmp		.move


;**********
.accel	SHORTA
	getparam	1
	sta		al_count,x
	getparam	2
	sta		al_count1,x
	jmp		.add3

;**********
.hitground	SHORTA
	a16
	getparam 1
	clc
	adc	al_worldy,x
	a8
	php
	lda	pifnot
	beq	.hgpos
	stz	pifnot
	plp
	s_bpl	.add5
	jmp	.jump3
.hgpos
	plp
	s_bmi	.add5
	jmp	.jump3


;**********
.hitwall	SHORTA
	a16
	lda	maxpmoveX
	sec
	sbc	minpmoveX
	sta	x1
	lda	al_worldx,x
	sec
	sbc	minpmoveX
	cmp	x1
	s_bcs	.jump1
	lda	maxpmoveY
	sec
	sbc	minpmoveY
	sta	x1
	lda	al_worldy,x
	sec
	sbc	minpmoveY
	cmp	x1
	s_bcs	.jump1
	jmp	.add3


;**********
.initanim	SHORTA
	getparam	1
	sta		pathx1
	s_init_anim	x,pathx1
	jmp		.add2

;**********
.addanim	SHORTA
	getparam	1
	sta		pathx1
	getparam	2
	sta		pathx2
	s_add_anim	x,pathx1,pathx2
	jmp		.add3

;**********
.debris	SHORTA
	a16
	getparam	1
	sta		pathx1

	a8

	s_set_debrisdata	x,pathx1

	jmp		.add3

;**********
.friend	SHORTA
	getparam	1
	cmp		#friend_anyone
	beq		.randomselect
	a16
	and		#255
	tay
	a8
	lda.w		friends_hp-1,y
	s_beq		.nonealive
	tya
	jmp		.okdok
.randomselect

	lda		cock
	beq		.5050bunnyfrog
	lda		frog
	beq		.4060cockbunny
	lda		bunny
	beq		.4060cockfrog
.404020frogbunnycock
	jsl		random_l	; 20% falco, 40% frog/bunny
	cmp		#50
	bcc		.cock
	cmp		#150
	bcc		.bunny
	bra		.frog
.4060cockbunny
	lda		bunny
	beq		.cock
	s_jmp_random	.cock,40
	bra		.bunny
.4060cockfrog
	s_jmp_random	.cock,40
	bra		.frog
.5050bunnyfrog
	lda		frog
	beq		.nooneleft
	lda		bunny
	beq		.frog
	s_jmp_random	.frog
	jmp		.bunny

.nooneleft
	lda		bunny
	beq		.nonealive
.bunny	lda		#friend_rabbit
	bra		.okdok
.frog	lda		#friend_frog
	bra		.okdok
.cock	lda		#friend_falcon
.okdok
	sta		al_sbyte4,x
	jmp		.add2
.nonealive
	jmp		.add2

;**********
.link	SHORTA
	ldy	pathlink
	bne	.setshape
	stx	pathlink
	jmp	.add1
.setshape
	sty	al_ptr,x
	stx	al_ptr,y
	stz	pathlink
	stz	pathlink+1
	jmp	.add1

;**********
.shapedead	SHORTA
	ldy	al_ptr,x
	s_beq	.jump1
	jmp	.add3

;**********
.iflevel	SHORTA
	lda	pifnot
	beq	.ilpos
	stz	pifnot
	getparam	1
	dec		a
	cmp		currentlevel
	s_beq		.add4
	jmp		.jump2
.ilpos
	getparam	1
	dec		a
	cmp		currentlevel
	s_bne		.add4
	jmp		.jump2

;**********
.leftofplayer	SHORTA
	s_set_objtobeplayer	y

	a16
	lda.w	al_worldx,y
	cmp	al_worldx,x
	bpl	.alljump
	a8
	jmp	.add3

;**********
.rightofplayer	SHORTA
	s_set_objtobeplayer	y

	a16
	lda.w	al_worldx,y
	cmp	al_worldx,x
	bmi	.alljump
	a8
	jmp	.add3

;**********
.behindplayer	SHORTA
	s_set_objtobeplayer	y

	a16
	lda.w	al_worldz,y
	cmp	al_worldz,x
	bpl	.alljump
	jmp	.add3
;**********
.aboveplayer	SHORTA
	s_set_objtobeplayer	y

	a16
	lda.w	al_worldy,y
	cmp	al_worldy,x
	bpl	.alljump
	a8
	jmp	.add3

;**********
.belowplayer	SHORTA
	s_set_objtobeplayer	y

	a16
	lda.w	al_worldy,y
	cmp	al_worldy,x
	bmi	.alljump
	a8
	jmp	.add3

.alljump	jmp	.jump1

;**********
.notfriend	SHORTA
	lda	pifnot
	beq	.nfpos
	stz	pifnot
	getparam	1
	cmp		#friend_anyone
	bne		.daijobu2

	lda		al_sbyte4,x
	s_beq		.add4
.daijobu2
	cmp		al_sbyte4,x
	s_beq		.jump2
	jmp		.add4
.nfpos
	getparam	1
	cmp		#friend_anyone
	bne		.daijobu

	lda		al_sbyte4,x
	beq		.jumpit2

.daijobu
	cmp		al_sbyte4,x
	s_beq		.add4
.jumpit2	jmp		.jump2

;**********
.msg	SHORTA
	getparam	1
	phx
	jsl		send_message_l
	plx
	jmp		.add2

;**********
.msgwithmeter
	SHORTA
	lda	#-1
	sta	friends_meter
	getparam	1
	phx
	jsl		send_message_l
	plx
	jmp		.add2

;**********
.almostdead	SHORTA
	lda		al_sbyte4,x
	beq		.nocando2
	a16
	and		#255
	tay
	a8
	lda.w		friends_hp-1,y
	cmp		#friendHP_unit+1
	bcs		.nocando2
	jmp		.jump1
.nocando2
	jmp		.add3

;**********
.damage	SHORTA
	lda		al_sbyte4,x
	beq		.nocando
	a16
	and		#255
	tay
	a8
	lda.w		friends_hp-1,y
	sec
	sbc		#friendHP_unit
	bcs		.nozero
	lda		#0
.nozero
	sta.w		friends_hp-1,y

.nocando	jmp		.add1


;**********
.smokeon	SHORTA
	s_set_alsflag	x,sflag6
	jmp		.add1

;**********
.smokeoff	SHORTA
	s_clr_alsflag	x,sflag6
	jmp		.add1


;**********
.theend	SHORTA
	s_set_altype	x,zremove
	jmp		.move

;**********
.randomgoto	SHORTA
	s_jmp_random	.alljump
	jmp		.add3

;**********
.ifzerob	SHORTA
	addalvaroffset	1
	lda.w		0,y
	s_beq		.jump2
	jmp		.add4

;**********
.ifzerow	SHORTA
	addalvaroffset	1
	a16
	lda.w		0,y
	s_beq		.jump2
	jmp		.add4

;**********
.ifnotzerob	SHORTA
	addalvaroffset	1
	lda.w		0,y
	s_beq		.add4
	jmp		.jump2


;**********
.ifnotzerow	SHORTA
	addalvaroffset	1
	a16
	lda.w		0,y
	s_beq		.add4
	jmp		.jump2

;**********
.ifsameb	SHORTA
	addalvaroffset	1
	getparam	2
	cmp.w		0,y
	php
	lda		pifnot
	beq		.isbpos
	stz		pifnot	
	plp
	s_beq		.add5
	jmp		.jump3

.isbpos	plp
	s_bne		.add5
	jmp		.jump3

;**********
.ifsamew	SHORTA
	addalvaroffset	1
	a16
	getparam	2
	cmp.w		0,y
	a8
	php
	lda		pifnot
	beq		.iswpos
	stz		pifnot	
	plp
	s_beq		.add6
	jmp		.jump4

.iswpos	plp
	s_bne		.add6
	jmp		.jump4


;**********
.ifbetweenb	SHORTA
	addalvaroffset	1
	lda		pifnot
	beq		.ibbpos
	stz		pifnot	
	getparam	2
	cmp.w		0,y
	s_bpl		.jump4
	getparam	3
	cmp.w		0,y
	s_bmi		.jump4
	jmp		.add6
.ibbpos
	getparam	2
	cmp.w		0,y
	s_bpl		.add6
	getparam	3
	cmp.w		0,y
	s_bmi		.add6
	jmp		.jump4



;**********
.ifbetweenw	SHORTA
	addalvaroffset	1
	lda		pifnot
	beq		.ibwpos
	stz		pifnot

	a16
	getparam	2
	cmp.w		0,y
	s_bpl		.jump6
	getparam	4
	cmp.w		0,y
	s_bmi		.jump6
	jmp		.add8

.ibwpos
	a16
	getparam	2
	cmp.w		0,y
	s_bpl		.add8
	getparam	4
	cmp.w		0,y
	s_bmi		.add8
	jmp		.jump6

;**********
.invincibleon	SHORTA
	s_set_alsflag	x,nohitaffect
	jmp		.add1

;**********
.invincibleoff	SHORTA
	s_clr_alsflag	x,nohitaffect
	jmp		.add1
	

;**********
.playerdead	SHORTA
	s_test_var	B,pshipflags2,#psf2_playerHP0
	s_bne		.alljump
	s_test_var	B,gameflags,#gf_playerdying
	s_beq		.add3
	jmp		.alljump

;**********
.spawnchild	SHORTA
; shape:
	a16
	getparam	1
	sta		pathx2
; rot x,y,z:
	a8
	getparam	5
	sta		pathx1+1
	getparam	6
	sta		pathy1+1
	getparam	7
	sta		pathz1+1
; x,y,z:
	getparam	10
	sta		pathx1
	getparam	11
	sta		pathy1
	getparam	12
	sta		pathz1
; childnum:
	getparam	13
	sta		pathy2

	s_push_var	W,allst
	stx		allst
	s_make_childobjrotpos	pathx2,pathy2,pathx1,pathy1,pathz1,pathx1+1,pathy1+1,pathz1+1,path_istrat,ENEMY1
	sty		becomelastobj&WM
	s_pull_var	W,allst

; hp,ap:
	a8
	getparam	8
	sta.w		al_hp,y
	getparam	9
	sta.w		al_ap,y

; path map:
	a16
	getparam	3
	sta.w		al_sword2,y

	jmp		.add14

;**********
.spawnlink	SHORTA
	s_jsr		.makeit
	sty	al_ptr,x
	cpy	#0
	s_beq	.add13
	stx	al_ptr,y	; link the shapes together
	jmp		.add13


;**********
.qspawn	SHORTA
	a16
	getparam	1
	sta	pathx1
	getparam	3
	sta	pathx2
	a8
	s_push_var	W,allst
	s_make_obj	pathx1,.cantdo2

	sty		becomelastobj&WM

	s_pull_var	W,allst

	s_set_strat	y,path_istrat
	s_set_alvar	W,y,al_sword2,pathx2

	s_copy_pos	y,x
	s_copy_rots	y,x

	getparam	5
	sta.w	al_hp,y
	getparam	6
	sta.w	al_ap,y
	jmp	.add7

.cantdo2	s_pull_var	W,allst
	jmp	.add7

;**********
.spawn	SHORTA
	s_jsr		.makeit
	jmp		.add13

.makeit
	a16
	getparam	1
	sta		pathx1
	getparam	3
	sta		pathy2
	a8
	s_push_var	W,allst
	stx		allst
	s_make_obj	pathx1,.cantdo
	sty		becomelastobj&WM
	s_pull_var	W,allst
	s_set_strat	y,path_istrat
	s_set_alvar	W,y,al_sword2,pathy2
	getparam	5
	clc
	adc		al_rotx,x
	sta.w		al_rotx,y
	getparam	6
	clc
	adc		al_roty,x
	sta.w		al_roty,y
	getparam	7
	clc
	adc		al_rotz,x
	sta.w		al_rotz,y
	getparam	8
	sta.w		al_hp,y
	getparam	9
	sta.w		al_ap,y

	getparam	10
	sta		pathx1
	getparam	11
	sta		pathy1
	getparam	12
	sta		pathz1

	s_add_Roffs2pos	B,y,x,x,pathx1,pathy1,pathz1,1,1,1,2,2,2

	rts
.cantdo	s_pull_var	W,allst
	ldy	#0
	rts


;**********
.debug	SHORTA
	blink
;**********
.zremoveon	SHORTA
	s_set_altype	x,zremove
	jmp		.add1

;**********
.zremoveoff	SHORTA
	s_clr_altype	x,zremove
	jmp		.add1


;**********
.childdead	SHORTA
	getparam	1
	sta		pathx1
	phx
	s_jmp_alsflag	x,motherobj,.okmother	; am I mother?

	s_set_objtobemother	y,x		; if child
	tyx					; set x to be mother
	s_beq		.cannaedojim2
.okmother
	s_jmp_childrendead	x,pathx1,.cdjump2
.cannaedojim2
	plx
	jmp	.add4
.cdjump2	plx
	jmp	.jump2

;**********
.linkchild	SHORTA
	getparam	1
	sta		pathx1

	s_set_objtobechild	y,x,pathx1

	cpy	#0
	s_beq	.add2

	a16
	tya
	cmp	al_ptr,x
	a8
	s_beq	.add2

	a16
	lda.w	al_ptr,y
	sta	pathx1
	lda	al_ptr,x
	sty	al_ptr,x	; link it in
	sta.w	al_ptr,y
	a8

	phx
	tyx
	jsl	find_alptr_l	; get one in list behind
	ldx	pathx1
	stx	al_ptr,y
	plx

;**********
.flagchild	SHORTA
	getparam	1
	sta		pathx1

	phx
	s_jmp_alsflag	x,motherobj,.fcmother
	s_set_objtobemother	y,x
	tyx
	cpy	#0
	beq		.cannaedojim
.fcmother

	s_set_objtobechild	y,x,pathx1
.cannaedojim
	plx
	cpy	#0
	s_beq	.add2

	s_set_alsflag	y,sflag8	; flag it
	jmp		.add2


;**********
.unlinkself	SHORTA
	s_jmp_NOTalsflag	x,childobj,.add1
	s_set_objtobemother	y,x
	s_remove_child	x,y
	jmp		.add1
;**********
.unlinkchild	SHORTA
	getparam	1
	sta		pathx1

	phx
	s_jmp_alsflag	x,motherobj,.ulcmother
	s_set_objtobemother	y,x
	tyx
	cpy	#0
	beq		.ulccannaedojim
.ulcmother

	s_set_objtobechild	y,x,pathx1
.ulccannaedojim
	plx
	cpy	#0
	s_beq	.add2

	phx
	s_set_objtobemother	x,y
	s_remove_child		y,x
	plx

	jmp		.add2


;**********
.flagmother	SHORTA

	s_set_objtobemother	y,x
	cpy	#0
	s_beq		.add1
	s_set_alsflag	y,sflag8	; flag it
	jmp		.add1

;**********
.flagshape	SHORTA

	s_set_objtobealvar	y,x,al_ptr
	cpy	#0
	s_beq		.add1
	s_set_alsflag	y,sflag8	; flag it
	jmp		.add1

;**********
.ifflag	SHORTA
	s_jmp_NOTalsflag	x,sflag8,.add3
	s_clr_alsflag	x,sflag8
	jmp		.jump1


;**********
.text	SHORTA
	a16
	getparam	1
	sta	pathx1
	a8
	getparam	3
	sta	pathy1
	getparam	4
	sta	pathz1

	s_text_obj	x,pathx1,pathy1,pathz1

	jmp	.add5


;**********
.trail	SHORTA
	getparam	1
	sta		al_ty,x
	jmp		.add2

;**********
.gosubalvar	SHORTA
	addalvaroffset	1
	s_dec_alvar	W,x,al_sword2
	s_mpush		W,x,x,al_sword2
	a16
	lda.w		0,y
	sec
	sbc		#paths&WM
	sta.w		al_sword2,x
	a8
	jmp		.strat

;**********
.gosub	SHORTA
	s_mpush		W,x,x,al_sword2
	jmp		.jump1
;**********
.return	SHORTA
	s_mpull		W,x,x,al_sword2
	s_cmp_alvar	W,x,al_sword2,#-1
	s_beq		.finishedtrigger
	jmp		.add3

;**********
.doalvarb	SHORTA
	a16
	lda	al_sword2,x
	inc	a
	inc	a
	a8
	s_mpush		W,x,A

	addalvaroffset	1

	a16
	lda.w		0,y
	and		#255
	a8
	s_mpush		W,x,A

	jmp		.add2

;**********
.doalvarw	SHORTA
	a16
	lda	al_sword2,x
	inc	a
	inc	a
	a8
	
	s_mpush		W,x,A

	addalvaroffset	1

	a16
	lda.w		0,y
	a8
	s_mpush		W,x,A

	jmp		.add2
	

;**********
.doq	SHORTA
	a16
	lda		al_sword2,x
	inc		a
	inc		a
	a8
	s_mpush		W,x,A
	a16
	getparam	1
	and	#255
	a8

	s_mpush		W,x,A

	jmp		.add2

;**********
.do	SHORTA
	a16
	lda		al_sword2,x
	clc
	adc		#3
	a8
	s_mpush		W,x,A
	a16
	getparam	1
	a8

	s_mpush		W,x,A

	jmp		.add3

;**********
.next	SHORTA
	s_mpull		W,x,pathx1
	a16
	dec	pathx1
	a8
	beq	.endnext
	s_mpull	W,x,x,al_sword2
	s_mpush	W,x,x,al_sword2	; push it back on for next time

	s_mpush	W,x,pathx1
	jmp	.move

.endnext
	s_mpull	W,x,pathx1
	jmp		.add1

;**********
.inext	SHORTA
	s_mpull		W,x,pathx1
	a16
	dec	pathx1
	a8
	beq	.endnext
	s_mpull	W,x,x,al_sword2
	s_mpush	W,x,x,al_sword2	; push it back on for next time

	s_mpush	W,x,pathx1
	jmp	.strat


;**********
.break	SHORTA
	s_mpull		W,x,pathx1
	s_mpull		W,x,pathx1	; restore stack
	jmp		.jump1


;**********
.breakc	SHORTA
	s_mpull		W,x,pathx1
	s_mpull		W,x,pathx1	; restore stack
	jmp	.add1

;**********
.invisibleon	SHORTA
	s_set_alsflag	x,invisible
	s_set_alsflag	x,colldisable
	jmp	.add1

;**********
.invisibleoff	SHORTA
	s_clr_alsflag	x,invisible
	s_clr_alsflag	x,colldisable
	jmp	.add1


;**********
.always	SHORTA
	s_jmp_alvarNOTZERO	W,x,al_stratmem,.freeit
	s_alloc			x,y,#4
	lda	#1
	sta	heap,y		; one routine stored
	a16
	getparam	1
	sta	heap+1,y	; store the address
	a8
	getparam	3
	sta	heap+3,y	; store trigger
	a16
	tya
	sta			al_stratmem,x
	a8
	s_jmp			.add4
; already some routines running so free up the space and allocate a larger area
.freeit
	ldy	al_stratmem,x
	lda	heap,y
	inc	a		; allow one more entry
	sta	pathz1
	asl	a		; *3
	clc
	adc	pathz1
	inc	a		; allow count byte
	sta	pathx1
	stz	pathx1+1
	a16
	s_alloc	x,y,pathx1	; allocate new buffer

	phx
	sty	pathx2		; pathx2 = new list
	ldy	al_stratmem,x	; pointer to old list
	ldx	pathx2		; x = new list

	lda	heap,y		; get count (count from old list)
	sta	pathx1		; store it in temporary
	inc	a		; inc it
	sta	heap,x		; and store it in new list
	iny
	inx			; skip first byte (ie. count)
.nxtcopy
	lda	heap,y
	sta	heap,x
	lda	heap+1,y
	sta	heap+1,x	; copy address
	lda	heap+2,y
	sta	heap+2,x	; and trigger flag
	inx
	inx
	inx
	iny
	iny
	iny
	dec	pathx1
	bne	.nxtcopy

	stx	pathy1	; points to last entry
	plx

	ldy	al_stratmem,x
	s_free	x,y

	a16
	lda	pathx2	; points to beginning
	sta	al_stratmem,x
	a8

	a16
	getparam	1
	ldy	pathy1
	sta	heap,y
	a8
	getparam	3
	sta	heap+2,y	; store the trigger
	jmp	.add4

;**********
.alwaysoff	SHORTA
	ldy	al_stratmem,x
	s_beq	.add3
	lda	heap,y
	cmp	#1
	bne	.carryon
	s_free	x,y
	stz	al_stratmem,x
	stz	al_stratmem+1,x
	s_jmp	.add3
.carryon
	sta	pathx1
	stz	pathx1+1
	a16
	getparam	1

	iny
.findroutine
	cmp	heap,y
	beq	.foundit
	iny
	iny
	iny
	dec	pathx1
	bne	.findroutine
; cant find the routine so return
	jmp	.add3
.foundit	sty	pathy1	; store pointer to routine to be removed

	ldy	al_stratmem,x	; y = beginning of list

	lda	heap,y
	and	#255	; get count
	dec	a
	a8
	sta	heap,y	; store the count
	a16
	sta	pathx1	; store the count again
	asl	a
	clc
	adc	pathx1	; multiply it by 3
	clc
	adc	al_stratmem,x	; add the base address
	inc	a		; allow for count
	sta	pathy2
	ldy	pathy1	; restore pointer to routine to be removed
	a8
	bra	.jumpin
.shiftthemdown
	lda	heap+3,y
	sta	heap,y
	iny
.jumpin
	cpy	pathy2
	bne	.shiftthemdown
	s_jmp	.add3


;**********
.force	SHORTA
	ldy	pathptr
	s_beq	.add3	; not within trigger routine

	a16
	getparam	1
	sta	pathptr
	jmp	.add3


;**********
.sprite	SHORTA
	getparam	1
	sta		pathx1
	getparam	2
	sta		pathy1
	s_sprite_obj	x,pathx1,pathy1
	jmp		.add3

;**********
.setstrat	SHORTA
	a16
	getparam	1
	sta	al_stratptr,x
	a8
	getparam	3
	sta	al_stratptr+2,x
	s_mode_change	x,#0
	s_set_alvar	W,x,al_sword2,#0
	jmp	.move

;**********
.negB	SHORTA
	stx	pathx1
	a16
	getparam	1
	clc
	adc	pathx1
	tay
	a8
	lda.w	0,y
	eor	#-1
	inc	a
	sta.w	0,y
	jmp	.add3

;**********
.negW	SHORTA
	stx	pathx1
	a16
	getparam	1
	clc
	adc	pathx1
	tay
	lda.w	0,y
	eor	#-1
	inc	a
	sta.w	0,y
	jmp	.add3

;**********
.setrandomB	SHORTA
	getparam	3
	sta	pathz1	; store the mask

	stx	pathx1
	a16
	getparam	1
	clc
	adc	pathx1
	tay
	a8
	jsl	random_l
	and	pathz1
	sta.w	0,y
	
	jmp	.add4

;**********
.setrandomW	SHORTA
	a16
	getparam	3
	sta	pathz1	; store the mask

	stx	pathx1
	getparam	1
	clc
	adc	pathx1
	tay
	a8
	jsl	random_l
	xba
	jsl	random_l
	a16
	and	pathz1
	sta.w	0,y
	
	jmp	.add5
	

;**********
.ifhitflag	SHORTA
	getparam	3
	sta		pathx1

	s_test_hitflags	x,pathx1
	s_beq		.add4		; none hit

	s_clr_hitflags	x,pathx1	; clear them

	jmp	.jump1

;**********
.collisionson SHORTA
	s_clr_alsflag	x,colldisable
	jmp	.add1

;**********
.collisionsoff SHORTA
	s_set_alsflag	x,colldisable
	jmp	.add1


;**********
.start65816	SHORTA
	phx
	phb
	php

; push return address
	lda	#.ret>>16
	pha
	pea	.ret&WM-1

; push 65816 code address
	lda	#paths>>16
	pha

	a16
	lda	al_sword2,x
	clc
	adc	#paths&WM
	pha
	a8

	lda	#$7e
	pha
	plb

	rtl
.ret
	plp
	plb
	plx
	a16
	sta	al_sword2,x
	a8
	jmp	.strat

;**********
.ifnot	SHORTA
	s_set_var	B,pifnot,#1
	jmp	.add1

;**********
.particle	SHORTA
	s_make_obj	#nullshape,.couldnt
	s_set_strat	y,particleexplode_istrat
	s_copy_pos	y,x
.couldnt	jmp	.add1

;**********
.shadowon	SHORTA
	s_set_alsflag	x,shadow
	jmp		.add1

;**********
.shadowoff	SHORTA
	s_clr_alsflag	x,shadow
	jmp		.add1

;**********
.sound	SHORTA
	getparam	1
	trigse	a

	jmp	.add2

;**********
.sound2	SHORTA
	getparam	1
	sta	pathx1
	set_sound2	x,pathx1

	jmp	.add2

;**********
.div2b	SHORTA
	stx	pathx1
	a16
	getparam	1
	clc
	adc	pathx1
	tay
	a8
	lda.w	0,y
	bpl	.normsh
	inc	a
.normsh	asra
	sta.w	0,y
	jmp	.add3

;**********
.div2w	SHORTA
	stx	pathx1
	a16
	getparam	1
	clc
	adc	pathx1
	tay
	lda.w	0,y
	bpl	.normsh
	inc	a
.normsh	asra
	sta.w	0,y
	jmp	.add3
	

;**********
.indexb	SHORTA
	jsr	.index
	LONGA
	lda	pathx2
	clc
	adc	fptr
	sta	fptr	; 24 bit address set up in fptr
	a8
	lda	[fptr]
	sta.w	0,y

	jmp	.add8

;**********
.indexw	SHORTA
	jsr	.index
	LONGA
	lda	pathx2
	asl	a
	clc
	adc	fptr
	sta	fptr	; 24 bit address set up in fptr
	lda	[fptr]
	sta.w	0,y

	jmp	.add8

;* * * * * *
.index	SHORTA
	
	
	getparam	3
	sta		fptr+2
	a16
	getparam	1
	sta		fptr
	stx		pathx1
	getparam	4
	clc
	adc		pathx1
	tay
	lda.w		0,y	; index from alien var
	and		#255
	sta		pathx2

	getparam	6
	clc
	adc		pathx1
	tay
	rts

;**********
.pushb	SHORTA
	addalvaroffset	1
	a8
	s_mpush		B,x,y,0
	jmp		.add2

;**********
.pushw	SHORTA
	addalvaroffset	1
	a8
	s_mpush		W,x,y,0
	jmp		.add2

;**********
.pullb	SHORTA
	addalvaroffset	1
	a8
	s_mpull		B,x,y,0
	jmp		.add2
;**********
.pullw	SHORTA
	addalvaroffset	1
	a8
	s_mpull		W,x,y,0
	jmp		.add2
	
;**********
.withinrange	SHORTA
	a16
	getparam	1
	sta	pathx1
	lda	#200
	jsl	dzdistless_l
	SHORTA
	s_bcc	.add5
	s_jmp_outxydistrng	x,y,#0,pathx1,.add5
	jmp	.jump3

;**********
.shapeinrange	SHORTA
	a16
	getparam	1
	sta	pathx1
	a8
	s_set_objtobealvar	y,x,al_ptr
	s_jmp_zdistmore		x,y,#200,.add5
	s_jmp_outxydistrng	x,y,#0,pathx1,.add5
	jmp	.jump3

;**********
.becomemother	SHORTA
	s_set_vartobeobj	becomeobj&WM,x
	s_push_alvar		W,x,al_sword2

	s_set_objtobemother	y,x
	s_copy_alvar2var	W,y,becomepath,al_sword2
	tyx
	s_pull_alvar		W,x,al_sword2
	jmp	.add1


;**********
.becomeshape	SHORTA
	s_set_vartobeobj	becomeobj,x
	s_push_alvar		W,x,al_sword2

	s_set_objtobealvar	y,x,al_ptr
	s_copy_alvar2var	W,y,becomepath,al_sword2
	tyx
	s_pull_alvar		W,x,al_sword2
	jmp	.add1

;**********
.becomechild	SHORTA
	getparam	1
	sta		pathx1

	s_set_vartobeobj	becomeobj,x
	s_push_alvar		W,x,al_sword2

	s_jmp_alsflag	x,motherobj,.okmotherbc	; am I mother?

	s_set_objtobemother	y,x		; if child
	tyx					; set x to be mother
.okmotherbc
	s_set_objtobechild	y,x,pathx1
	s_copy_alvar2var	W,y,becomepath,al_sword2
	tyx

	s_pull_alvar		W,x,al_sword2

	jmp	.add2


;**********
.unbecome	SHORTA
	s_push_alvar	W,x,al_sword2
	s_set_alvar	W,x,al_sword2,becomepath
	s_set_objtobevar	x,becomeobj
	s_pull_alvar	W,x,al_sword2
	jmp		.add1

;**********
.become	SHORTA
	s_set_vartobeobj	becomeobj,x
	s_push_alvar		W,x,al_sword2

	s_set_objtobevar	y,becomelastobj
	s_copy_alvar2var	W,y,becomepath,al_sword2
	tyx
	s_pull_alvar		W,x,al_sword2
	jmp	.add1

;**********
.score	SHORTA
	a16
	getparam	1
	clc
	adc.l	playerscore
	sta.l	playerscore
	jmp	.add3


;--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
	SHORTA
.addalvaroffset
	php
	a16
	and	#255
	bit	#128
	beq	.simple
	clc
	adc	#(alx_start&WM)-128

.simple
	clc
	adc	pathx1
	tay
	plp
	rts

;--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
;--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

.triggers	SHORTA
	lda	pathptr
	ora	pathptr
	beq	.daijobu34
	blink	3	; whoops who's causing a frame wait within a trigger?
.daijobu34
	ldy	al_sword2,x
	sty	pathptr

	ldy	al_stratmem,x
	s_beq	.nothingdoing
	lda	heap,y
	s_beq	.nothingdoing
	iny
.nxttrig	pha
	phy

	phx
	lda	heap+2,y
	a16
	and	#255
	asl	a
	tax
	a8
	jmp	(.tab&WM,x)
.tab	dw	.gosubit&WM
	dw	.2&WM
	dw	.4&WM
	dw	.8&WM
	dw	.16&WM
	dw	.32&WM
	dw	.64&WM
	dw	.128&WM
	dw	.hit&WM
	dw	.playerhit&WM
	dw	.flagged&WM
	dw	.whenshapedead&WM
	dw	.whendead&WM

;---------
.whendead
	plx
	phx
	s_jmp_alvarZERO		B,x,al_hp,.gosubit
	brl			.dontgosubit
;---------
.whenshapedead
	plx
	phx
	s_jmp_alvarNOTZERO	W,x,al_ptr,.dontgosubit
	s_jmp			.gosubit
;---------
.flagged
	plx
	phx
	s_jmp_NOTalsflag	x,sflag8,.dontgosubit
	s_clr_alsflag		x,sflag8
	bra			.gosubit
;---------
.playerhit
	plx
	phx
	s_jmp_NOTalsflag	x,sflag5,.dontgosubit
	bra	.gosubit
;---------
.hit
	plx
	phx
	s_jmp_NOTalsflag	x,sflag7,.dontgosubit
	bra	.gosubit
;---------
.2	lda	#1
	bra	.framestuff
;---------
.4	lda	#3
	bra	.framestuff
;---------
.8	lda	#7
	bra	.framestuff
;---------
.16	lda	#15
	bra	.framestuff
;---------
.32	lda	#31
	bra	.framestuff
;---------
.64	lda	#63
	bra	.framestuff
;---------
.128	lda	#127
	bra	.framestuff

.framestuff
	and	gameframe
	beq	.gosubit
	bra	.dontgosubit
.gosubit
	plx
	phx

	a16
	lda		#-1
	s_mpush		W,x,A	; store return address
	a16
	lda		heap,y	; get gosub routine's addr
	sta		al_sword2,x
	a8
	jmp	.strat		; do it!
;	s_mpull		W,x,pathx1
.finishedtrigger
.dontgosubit
	plx
.nxtone
	ply
	iny
	iny
	iny
	a8
	pla
	dec	a
	s_bne	.nxttrig

	ldy	pathptr
	sty	al_sword2,x

.nothingdoing
	stz	pathptr
	stz	pathptr+1
	rts

;--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
;--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
	SHORTA
.move
	s_jmp_alvarZERO		B,x,al_count1,.noaccel

	lda		al_vel,x
	cmp		al_count,x
	bmi		.incit
	sec
	sbc		al_count1,x
	cmp		al_count,x
	bpl		.finish
	lda		al_count,x
	bra		.finish2
.incit	clc
	adc		al_count1,x
	cmp		al_count,x
	bmi		.finish
	lda		al_count,x
.finish2	sta		al_vel,x
	stz		al_count1,x
	bra		.finish3
.finish	sta		al_vel,x
.finish3

	s_jmp_alsflag	x,sflag2,.noaccel
	s_jsr		.genvecs
.noaccel

	s_jmp_NOTalsflag	x,sflag4,.norely

	lda	al_rotz,x
	adiv2
	adiv2
	clc
	adc	al_roty,x
	sta	al_roty,x

.norely

	s_jmp_NOTalsflag	x,sflag3,.norelvel

	lda	al_rotx,x
	sta	al_vel,x

	s_jmp_alsflag	x,sflag2,.norelvel
	s_jsr		.genvecs

.norelvel

	s_jmp_NOTalsflag	x,sflag1,.noplayerz
	s_add_playerz	x
.noplayerz
	s_jmp_NOTalsflag	x,sflag2,.dontalwaysgenvecs
	s_jsr			.genvecs
.dontalwaysgenvecs
	s_add_vecs2pos		x
.dontaddvecs

	s_jmp_NOTalsflag	x,sflag6,.nosmoke
	s_make_smoke		2,.nosmoke
.nosmoke
	s_jmp_NOTalsflag	x,textobj,.notrail
	s_jmp_alvarZERO		B,x,al_ty,.notrail

	s_make_obj		#nullshape,.notrail
	s_copy_rots		y,x
	s_copy_pos		y,x
	s_copy_alvar2alvar	W,y,al_coltab,x,al_coltab ; text string
	s_copy_alvar2alvar	B,y,al_tx,x,al_tx	; text size
	s_copy_alvar2alvar	B,y,al_depthoffset,x,al_ty ; colour
	s_set_alsflag		y,textobj
	s_set_alsflag		y,colldisable
	s_set_strat		y,trail_istrat
.notrail
.end2
	jsr			.triggers

	s_jmp_NOTalsflag	x,motherobj,.notmother
	s_rotpos_allchildren	x
.notmother

.end	s_clr_alsflag		x,sflag7
	s_clr_alsflag		x,sflag5
	s_end_strat


;--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
;--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

pathhit_istrat
	s_set_alsflag	x,sflag7

	s_set_objtobealvar	y,x,al_collobjptr

	s_jmpNOT_colltype	y,FRIEND,.notfriend
	s_jmpNOT_colltype	y,LASER,.notfriend
	s_set_alsflag	x,sflag5
.notfriend
	jml	hitflash_istrat


;---*---*---*---*---*---*---*---*---*---*---*---*---*---*---*---*---
;-*- -*- -*- -*- -*- -*- -*- -*- -*- -*- -*- -*- -*- -*- -*- -*- -*-
;---*---*---*---*---*---*---*---*---*---*---*---*---*---*---*---*---


trail_istrat
	s_start_strat
	s_set_aldata	x,#10,#hardAP
	s_set_strat		x,.strat
	s_set_alvar		B,x,al_sbyte1,#5
.strat	s_start_strat
	lda	al_sbyte1,x
	and	#1
	bne	.nodo
	s_cmp_alvar	B,x,al_depthoffset,#1
	s_beq		.nodo
	s_cmp_alvar	B,x,al_depthoffset,#5
	s_beq		.nodo
	s_cmp_alvar	B,x,al_depthoffset,#9
	s_beq		.nodo
	s_dec_alvar	B,x,al_depthoffset
.nodo
.move	s_add_playerz	x
	s_beqdec_alvar	B,x,al_sbyte1,.removeit
.end	s_end_strat
.removeit	s_remove_obj	x
	jmp		.end
;---*---*---*---*---*---*---*---*---*---*---*---*---*---*---*---*---
;-*- -*- -*- -*- -*- -*- -*- -*- -*- -*- -*- -*- -*- -*- -*- -*- -*-
;---*---*---*---*---*---*---*---*---*---*---*---*---*---*---*---*---

	getparam_codegen	1
	getparam_codegen	2
	getparam_codegen	3
	getparam_codegen	4
	getparam_codegen	5
	getparam_codegen	6
	getparam_codegen	7
	getparam_codegen	8
	getparam_codegen	9
	getparam_codegen	10
	getparam_codegen	11
	getparam_codegen	12
	getparam_codegen	13
	getparam_codegen	14
	getparam_codegen	15


;---*---*---*---*---*---*---*---*---*---*---*---*---*---*---*---*---
;-*- -*- -*- -*- -*- -*- -*- -*- -*- -*- -*- -*- -*- -*- -*- -*- -*-
;---*---*---*---*---*---*---*---*---*---*---*---*---*---*---*---*---

paths
	IFEQ	CONTEST
	incfile	maps\pathdata.asm
	fileslog	maps\epathdat.asm
	ELSEIF
	fileslog	maps\pathdata.asm
	incfile	maps\epathdat.asm
	ENDC
dpaths
	incfile	maps\dpathdat.asm
kpaths
	incfile	maps\kpathdat.asm

;	printf	numpaths," paths in ",*-paths," bytes.%n"

	IFNE	pathinfo

	FCLOSE	!

	include	pathinfo.asm

	ENDC

	strats_end


