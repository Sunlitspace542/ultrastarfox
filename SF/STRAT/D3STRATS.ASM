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
;*   File: D3STRATS.ASM                                                    *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr: DYLAN'S STRATEGY ROUTINES 3.                                    *
;*_________________________________________________________________________*
;*                                                                         *
;*   Date: 1/12/92                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;* Author: Dylan Cuthbert.                                                 *	
;*                                                                         *
;***************************************************************************


	strats_start

	INCPUBLICS	ext\d3strats.ext


;---------------------------------------------------------------
;---------------------------------------------------------------

bosshHP	equ	64
bosshAP	equ	4
bosshlegHP	equ	10
bosshlegAP	equ	4
bosshtopHP	equ	hardHP
bosshtopAP	equ	hardAP
fishHP	equ	4
fishAP	equ	8

ballmissileHP equ	6
ballmissileAP equ	16

;---------------------------------------------------------------
	longa
d3zdistless	sta	x1
	s_set_objtobeplayer	y
	s_jmp_zdistless		x,y,x1,.sec
	a8
	clc
	s_rts
.sec	a8sec
	s_rts
;---------------------------------------------------------------
; boss H the spider

bossh_leg1	=	1
bossh_leg2	=	3
bossh_leg3	=	5
bossh_leg4	=	2
bossh_leg5	=	4
bossh_top	=	6
bossh_teleport	=	7

bossh_istrat
	s_start_strat
	s_set_alptrs	x,.strat,hitflash_istrat,.explode
	s_set_aldata	x,#bosshHP,#bosshAP
	s_set_alsflag	x,shadow
	s_set_colltype	x,ENEMY1
	s_set_alvar	B,x,al_depthoffset,#1
	s_set_alvar	B,x,al_sbyte3,#1
	s_set_alsflag	x,nohitaffect
	s_set_var	B,bosshhitcount,#5*2+5*5
	s_set_bossmaxHP	bosshhitcount
	s_add_bossmaxHP	#bosshHP
	jsr		.generate
	s_mode_change	x,#0

.strat	s_start_strat
	s_mode_table

	s_mode_entry	.walkon
	s_mode_entry	.spin
	s_mode_entry	.droptoground
	s_mode_entry	.spinfaster
	s_mode_entry	.movebackandforth
	s_mode_entry	.middlestage
	s_mode_entry	.waitformiddle
	s_mode_entry	.scuttleforwards
	s_mode_entry	.scuttlebackwards
	s_mode_entry	.move2
	s_mode_entry	.droptoground
	s_mode_entry	.redlegs
	s_mode_entry	.spinfaster
	s_mode_entry	.movebackandforth,bh_looptohere
	s_mode_entry	.moveto2500
	s_mode_entry	.floatto400
	s_mode_entry	.teleport
	s_mode_entry	.moveto1500
	s_mode_entry	.waitforteleportfinish
	s_mode_entry	.waitabitthenloop

;	s_mode_entry	.lowerstage
;	s_mode_entry	.waitforlower
;	s_mode_entry	.scuttleforwards
;	s_mode_entry	.scuttlebackwards
;	s_mode_entry	.move2
;	s_mode_entry	.droptoground
;	s_mode_entry	.spinfaster
;	s_mode_entry	.movebackandforth
;	s_mode_entry	.move

	s_mode_entry	.stand
	s_mode_entry	.crouch

	s_mode_table_end
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
;**********
.znxtmode	SHORTA
	s_set_alvar	B,x,al_sbyte2,#0
;**********
.nxtmode	SHORTA
	s_mode_change	x,+1
	jmp		.strat


;**********
.walkon	SHORTA
	stz	pathx1
	a16
	lda	#2500
	jsr	d3zdistless
	shorta
	bcc	.noadd2
	s_add_alvar	W,x,al_worldz,#20
	inc	pathx1
.noadd2
	s_cmp_alvar	W,x,al_worldx,#0
	s_bmi		.noadd
	s_add_alvar	W,x,al_worldx,#-25
	inc	pathx1
.noadd
	lda	pathx1
	s_beq	.nxtmode
	jmp		.move


;**********
.waitabitthenloop
	s_cmp_alvar	B,x,al_pbyte1,#30
	bne		.normal
	s_set_alvar	B,x,al_pbyte1,#0
;	s_set_alvar	B,x,al_sbyte4,#0
	s_mode_change	x,#bh_looptohere
	jmp		.strat
.normal	s_inc_alvar	B,x,al_pbyte1
	jmp		.move3

;**********
.floatto400	SHORTA
;	s_set_alsflag	x,sflag4
	s_achase_alvar	W,x,al_worldy,#-400,4,.nxtmode
	jmp		.move
	


;**********
.waitforteleportfinish	SHORTA
	jsr	.checkifhit
	s_set_objtobechild	y,x,#bossh_teleport
	cpy	#0
	s_bne	.move
	s_clr_alsflag	x,sflag4
	jmp	.nxtmode

;**********
.teleport	SHORTA
	s_make_childobjrotpos	#boss_h_3&$FFFF,#bossh_teleport,#0,#0,#0,#0,#0,#0,teleporter_istrat,ENEMY1

	trigse		$98
	s_set_objtobechild	y,x,#bossh_teleport
	phx
	tyx
	jsl		moveobjtoend_l
	plx
.ng	jmp		.nxtmode



;**********
.moveto1500	SHORTA
	jsr	.checkifhit
	a16
	lda	#1500
	bra	.moveton
;**********
.moveto2500	SHORTA
	a16
	lda	#2500
.moveton	jsr	d3zdistless
	shorta
	s_bcs	.nxtmode
	s_add_alvar	W,x,al_worldz,#-50
	jmp	.move3
;**********
.redlegs	SHORTA
	s_set_objtobechild	y,x,#bossh_leg1
	s_set_alvar		W,y,al_coltab,#id_1_c&WM
	s_set_objtobechild	y,x,#bossh_leg2
	s_set_alvar		W,y,al_coltab,#id_1_c&WM
	s_set_objtobechild	y,x,#bossh_leg3
	s_set_alvar		W,y,al_coltab,#id_1_c&WM
	s_set_objtobechild	y,x,#bossh_leg4
	s_set_alvar		W,y,al_coltab,#id_1_c&WM
	s_set_objtobechild	y,x,#bossh_leg5
	s_set_alvar		W,y,al_coltab,#id_1_c&WM
	jmp			.nxtmode

;**********
.lowerstage
	s_set_var	B,x1,#bhl_lowerpose
	jsr	.setchildmode
	jmp		.nxtmode

;**********
.scuttlebackwards	SHORTA
	a16
	lda	#2000
	jsr	d3zdistless
	SHORTA
	s_bcc	.nxtmode
	s_add_alvar	W,x,al_worldz,#80
	jmp		.move2


;**********
.scuttleforwards	SHORTA
	a16
	lda	#1500
	jsr	d3zdistless
	SHORTA
	s_bcs	.nxtmode
	s_achase_alvar	B,x,al_sbyte3,#2,3
	s_sub_alvar	W,x,al_worldz,#50
	jmp		.move2

;**********
.waitforlower	SHORTA
	lda	#bhl_lowered
	jsr	.chkchildmode
	cmp	#5
	s_bne	.move2
	s_set_var	B,x1,#bhl_scamper3
	jsr		.setchildmode
	jmp		.nxtmode
;**********
.waitformiddle	SHORTA
	lda	#bhl_middled
	jsr	.chkchildmode
	cmp	#5
	s_bne	.move2
	s_set_var	B,x1,#bhl_scamper2
	jsr	.setchildmode
	jmp	.nxtmode

;**********
.middlestage	SHORTA
	s_set_var	B,x1,#bhl_middlepose
	jsr	.setchildmode
	jmp		.nxtmode


;**********
.movebackandforth	SHORTA
	s_jmp_alsflag	x,sflag2,.moveforwards
	s_add_alvar	W,x,al_worldz,#-40
	s_jmp_alsflag	x,sflag3,.golow
	a16
	lda		#2000
	jsr		d3zdistless
	SHORTA
	bcc		.dontgolow
	s_set_alsflag	x,sflag3
	s_jmp_random	.oneheight
	s_set_alvar	W,x,al_sword2,#-300
	bra		.golow
.oneheight
	s_set_alvar	W,x,al_sword2,#-70
.golow
	s_achase_alvar2alvar	W,x,al_worldy,x,al_sword2,3
.dontgolow
	a16
	lda		#500
	jsr		d3zdistless
	SHORTA
	bcc		.ok2
.notsflag2
	s_cmp_alvar	B,x,al_sbyte2,#1
	bne		.norm
;	s_cmp_alvar	B,x,al_sbyte4,#0
;	s_bne		.ok2
	s_clr_alsflag	x,sflag2
	s_jmp		.znxtmode
.norm
	s_inc_alvar	B,x,al_sbyte2
	s_not_alsflag	x,sflag2
	s_clr_alsflag	x,sflag3
	bra		.ok2
.moveforwards
	s_fchase_alvar	W,x,al_worldy,#-400,5
	s_add_alvar	W,x,al_worldz,#40
	a16
	lda		#2500
	jsr		d3zdistless
	SHORTA
	bcc		.notsflag2

.ok2

	s_set_alvar2alvartab	B,B,W,x,al_worldx,x,al_sbyte4,sintab,2

	s_add_alvar		B,x,al_sbyte4,#4

	jmp	.move


;**********
.spinfaster	SHORTA
;	s_set_var	B,x1,#bhl_moveto30
;	jsr		.setchildmode

;	s_set_alvar	B,x,al_sbyte4,#0

	s_jmp_notdelay	2,.nochase
	s_fchase_alvar	B,x,al_sbyte3,#20,1
.nochase
	s_add_alvar	W,x,al_worldy,#-4
	s_cmp_alvar	W,x,al_worldy,#-400
	s_bmi		.nxtmode

	jmp		.move


;**********
.droptoground	SHORTA
	s_set_var	B,x1,#bhl_movetoflat
	jsr		.setchildmode

	s_add_vecs2pos	x
	s_falldown_Yvec	x,4,#8,#-80,.snd
	jmp		.move
.snd	trigse		$8e
	s_sub_var	B,bosshhitcount,#5
	jsr		.createsmoke
	jsr		.createsmoke
	jsr		.createsmoke
	jmp		.nxtmode

;**********
.crouch	SHORTA
	s_set_var	B,x1,#bhl_crouch
	jsr	.setchildmode
	jmp	.move
;**********
.stand	SHORTA
	s_inc_alvar	B,x,al_sbyte2
	s_cmp_alvar	B,x,al_sbyte2,#15
	s_beq		.nxtmode
	s_set_var	B,x1,#bhl_stand
	jsr		.setchildmode
	jmp		.move
;**********
.spin	SHORTA
	
	jmp		.move2


;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.createsmoke	SHORTA
	s_make_obj	#Lsmoke&$FFFF,.ng2
	s_set_strat	y,.smoke
	s_init_colanim	y,#0
	s_set_alsflag	y,colldisable
	s_copy_pos	y,x
	s_sprite_obj	y,#0
	jsl		random_l
	and		#31
	sec
	sbc		#15
	clc
	adc		al_tx,y
	sta		al_tx,y
	jsl		random_l
	a16
	sexa
	asl	a
	clc
	adc.w		al_worldx,y
	sta.w		al_worldx,y
.ng2	a8
	rts
.smoke	s_start_strat
	s_cmp_colanim	x,#7
	beq		.remove
	s_add_colanim	x,#1,#8
	s_end_strat
.remove	s_remove_obj	x
	s_end_strat
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.explode	SHORTA
	s_set_objtobechild	y,x,#bossh_top
	cpy	#0
	beq	.nope
	s_kill_obj	y
.nope	s_set_objtobechild	y,x,#bossh_teleport
	cpy	#0
	beq	.nope2
	s_remove_obj	y
.nope2	jml	bossexplode_istrat
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.checkifhit	SHORTA
;	s_cmp_alvar	B,x,al_hp,#bosshHP
;	s_beq		.nothit
;	s_set_objtobechild	y,x,#bossh_teleport
;	cpy	#0
;	beq	.nothit
;	s_set_alsflag	y,sflag1
;.nothit
	rts
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.chkchildmode	SHORTA
	sta	x1
	stz	y1
	lda	#bossh_leg1
	sta	z1
.nxtchk
	s_set_objtobechild	y,x,z1
	s_cmp_alvar		B,y,al_stratstate,x1
	bne	.noinc
	inc	y1
.noinc
	lda	z1
	inc	a
	sta	z1
	cmp	#bossh_top
	bne	.nxtchk
.notthatmode
	lda	y1
	rts
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.setchildmode	SHORTA
	s_set_objtobechild	y,x,#bossh_leg1
	s_mode_change		y,x1
	s_set_objtobechild	y,x,#bossh_leg2
	s_mode_change		y,x1
	s_set_objtobechild	y,x,#bossh_leg3
	s_mode_change		y,x1
	s_set_objtobechild	y,x,#bossh_leg4
	s_mode_change		y,x1
	s_set_objtobechild	y,x,#bossh_leg5
	s_mode_change		y,x1
	rts

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.ytab1
	dw	-15
	dw	-5
	dw	5
	dw	15


;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
gggy	=	(10<<bossh_scale)>>childscale
.generate	SHORTA
	s_make_mother	x
	s_make_childobjrotpos	#boss_h_1&$FFFF,#bossh_leg1,#0,#gggy,#(30<<bossh_scale)>>childscale,#0,#-deg180,#0,bosshleg_istrat,ENEMY1

	s_make_childobjrotpos	#boss_h_1&$FFFF,#bossh_leg2,#(28<<bossh_scale)>>childscale,#gggy,#(9<<bossh_scale)>>childscale,#0,#-deg72-deg180,#0,bosshleg_istrat,ENEMY1

	s_make_childobjrotpos	#boss_h_1&$FFFF,#bossh_leg3,#(18<<bossh_scale)>>childscale,#gggy,#(-24<<bossh_scale)>>childscale,#0,#-deg144-deg180,#0,bosshleg_istrat,ENEMY1

	s_make_childobjrotpos	#boss_h_1&$FFFF,#bossh_leg4,#(-18<<bossh_scale)>>childscale,#gggy,#(-24<<bossh_scale)>>childscale,#0,#-deg216+deg180,#0,bosshleg_istrat,ENEMY1

	s_make_childobjrotpos	#boss_h_1&$FFFF,#bossh_leg5,#(-28<<bossh_scale)>>childscale,#gggy,#(9<<bossh_scale)>>childscale,#0,#-deg288+deg180,#0,bosshleg_istrat,ENEMY1

	s_make_childobjrotpos	#boss_h_2&$FFFF,#bossh_top,#0,#0,#0,#0,#0,#0,bosshtop_istrat,ENEMY1

	s_jsr	.position
	rts
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.position	SHORTA
	s_rotpos_allchildren	x
	rts
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.move2	SHORTA


	lda		#bhl_waggle
	jsr		.chkchildmode
	cmp		#3		; 3 legs up?
	s_bpl		.nxtmode
	cmp		#2
	s_bne		.nxtchk1
	s_set_alvar	B,x,al_sbyte3,#6
	bra		.nxtchk2
.nxtchk1	cmp		#1
	s_bne		.nxtchk2
	s_set_alvar	B,x,al_sbyte3,#4
.nxtchk2

	txy
	a16
	lda	gameframe
	and	#3
	asl	a
	tax
	lda.l	.ytab1,x
	tyx
	clc
	adc	al_worldy,x
	sta	al_worldy,x
	a8

	
.move3	SHORTA
	s_set_alvar2alvartab	B,B,W,x,al_worldx,x,al_sbyte4,sintab,2
	s_add_alvar		B,x,al_sbyte4,#2


.move	SHORTA

	IFEQ	1
	s_jmp_random	.noshake,99
	s_jmp_random	.othershake
	s_set_objtobechild	y,x,#bossh_leg4
	s_mode_change		y,#bhl_shakealeg
	s_set_objtobechild	y,x,#bossh_leg1
	s_mode_change		y,#bhl_shakealeg
	bra			.noshake
.othershake
	s_set_objtobechild	y,x,#bossh_leg2
	s_mode_change		y,#bhl_shakealeg
	s_set_objtobechild	y,x,#bossh_leg5
	s_mode_change		y,#bhl_shakealeg
.noshake
	ENDC
	lda		al_roty,x
	and		#128
	pha
	s_add_alvars	B,x,al_roty,x,al_sbyte3
	lda		al_roty,x
	and		#128
	sta		x1
	pla
	eor		x1
	beq		.nosound
	s_cmp_alvar	B,x,al_sbyte3,#8
	s_bmi		.nosound
	trigse	$4f
.nosound

	s_add_playerz	x
	s_jmp_childrendead	x,#1,#5,.setcoltab
	s_set_alvar	B,x,al_hp,#bosshHP
	bra		.dontsetcoltab
.setcoltab
	s_set_coltab	x,#id_1_c&WM
	s_clr_alsflag	x,nohitaffect
	s_add_alvar	B,x,al_tx,#10
.dontsetcoltab
	s_add_alvar	B,x,al_tx,#5
;	s_jmp_alsflag	x,sflag4,.powerup
;	s_achase_alvar	B,x,al_ty,#0,5
;	bra		.nopowerup
;.powerup	s_add_alvar	B,x,al_ty,#-10
;.nopowerup
	jsr		.position
	s_add_bossHP	x,al_hp
	s_add_bossHP	bosshhitcount
	
.end	s_end_strat
;---------------------------------------------------------------



bosshleg_istrat
	s_start_strat
	s_set_alptrs	x,.strat,.hit,.explode
	s_set_aldata	x,#bosshlegHP+64,#bosshlegAP
	s_set_alvar	B,x,al_depthoffset,#1

	lda		al_sbyte1,x
	clc
	adc		#bossh_leg1-3
	sta		x1

	s_init_anim	x,x1
	s_mode_change	x,#0
.strat	s_start_strat
	s_mode_table
	s_mode_entry	.move2,bhl_scampering

	s_mode_entry	.shakealeg,bhl_shakealeg
	s_mode_entry	.shakealeg2

	s_mode_entry	.stand,bhl_stand

	s_mode_entry	.crouch,bhl_crouch

	s_mode_entry	.legup,bhl_legup
	s_mode_entry	.waggle,bhl_waggle
	s_mode_entry	.movetoflat,bhl_movetoflat
	s_mode_entry	.moveto30,bhl_moveto30

	s_mode_entry	.lowerpose,bhl_lowerpose
	s_mode_entry	.middled,bhl_lowered
	s_mode_entry	.scamper3,bhl_scamper3

	s_mode_entry	.middlepose,bhl_middlepose
	s_mode_entry	.middled,bhl_middled
	s_mode_entry	.scamper2,bhl_scamper2
	s_mode_table_end
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; mode code:

;**********
.scamper2	SHORTA
	s_jmp_alsflag	x,sflag1,.otheranim2
	s_cmp_anim	x,#6
	beq		.nottheflag3
	lda	#1
	jsr	.animateit
	jmp		.animed
.otheranim2	s_cmp_anim	x,#4
	beq		.nottheflag3_snd
	lda	#-1
	jsr	.animateit
	jmp		.animed
.nottheflag3_snd
	jsr		.soundout
.nottheflag3	s_not_alsflag	x,sflag1
	jmp		.animed

;**********
.scamper3	SHORTA
	s_jmp_alsflag	x,sflag1,.otheranim3
	s_cmp_anim	x,#11
	beq		.nottheflag4
	lda	#1
	jsr	.animateit
	jmp		.animed
.otheranim3	s_cmp_anim	x,#9
	beq		.nottheflag4_snd
	lda	#-1
	jsr	.animateit
	jmp		.animed
.nottheflag4_snd
	jsr		.soundout
.nottheflag4	s_not_alsflag	x,sflag1
	jmp		.animed


;*********
.lowerpose	SHORTA
	s_set_collstrat	x,.hit
	s_set_alvar	B,x,al_hp,#bosshlegHP+64
	s_set_alsflag	x,sflag1
	lda	al_sbyte1,x
	and	#3
	clc
	adc	#9
	sta	x1
	s_cmp_anim	x,x1
	s_beq		.nxtmode

	s_add_anim	x,#-1,#16
	jmp		.move

;*********
.middlepose	SHORTA
	s_set_collstrat	x,.hit
	s_set_alvar	B,x,al_hp,#bosshlegHP+64
	s_set_alsflag	x,sflag1
	lda	al_sbyte1,x
	and	#3
	clc
	adc	#4
	sta	x1
	s_cmp_anim	x,x1
	s_beq		.nxtmode

	s_add_anim	x,#-1,#16
	jmp		.move

;*********
.middled	jmp	.move
	

;*********
.movetoflat	SHORTA
	s_cmp_alvar	W,x,al_coltab,#id_1_c
	s_beq		.noreset	; in red mode?
	s_set_alvar	B,x,al_hp,#bosshlegHP+64
	s_set_collstrat	x,defelasercol_istrat
	bra		.noset
.noreset
	s_set_collstrat	x,.hit
.noset
	s_add_anim	x,#1,#15,.move
	jmp		.move
;*********
.crouch	SHORTA
	s_add_anim	x,#1,#11,.move
	jmp		.move
;*********
.stand	SHORTA
	s_cmp_anim	x,#0
	s_beq		.move
	bpl		.godown
	s_add_anim	x,#1,#16
	jmp		.move
.godown
	s_add_anim	x,#-1,#16
	jmp		.move
;*********
.moveto30	SHORTA
	s_jmp_notdelay	4,.move
	s_cmp_anim	x,#11
	s_beq		.move
	s_add_anim	x,#-1,#16
	jmp		.move

;*********
.modescamper	SHORTA
	s_mode_change	x,#bhl_scampering
	jmp		.strat
;*********
.nxtmode	SHORTA
	s_mode_change	x,+1
	jmp		.strat

;*********
.shakealeg	SHORTA
	s_clr_alsflag	x,sflag1
	jmp		.nxtmode

;*********
.shakealeg2	SHORTA
	s_jmp_alsflag	x,sflag1,.backdown
	s_cmp_anim	x,#5
	beq		.nottheflag2
	s_add_anim	x,#1,#16
	jmp		.move
.backdown	s_cmp_anim	x,#0
	s_beq		.modescamper
	s_add_anim	x,#-1,#16
	jmp		.move
.nottheflag2	s_not_alsflag	x,sflag1
	jmp		.move

;**********
.legup	SHORTA
	s_add_anim	x,#1,#11,.nxtmode
	s_set_alvar	B,x,al_hp,#bosshlegHP+64
	jmp		.move

;**********
.waggle
	s_set_alvar	B,x,al_hp,#bosshlegHP+64
	s_cmp_anim	x,#10
	beq		.setto9
	s_init_anim	x,#10
	jmp		.move

.setto9	s_init_anim	x,#9
	jmp		.move
	
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.animateit	SHORTA

	sta	x1

;	lda	al_hp,x
;	eor	#255
;	inc	a
;	asl	a
;	asl	a
;	asl	a
;	asl	a
;	sta	al_sbyte3,x

;	lda	al_sbyte2,x
;	clc
;	adc	al_sbyte3,x
;	sta	al_sbyte2,x
;	bcs	.anim
;	rts

.anim	s_add_anim	x,x1,#16
	rts
	

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.soundout	SHORTA
;	lda	al_sbyte1,x
;	and	#1
;	beq	.nosound
	trigse	$97
.nosound	rts
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.move2	SHORTA
	s_jmp_alsflag	x,sflag1,.otheranim
	s_cmp_anim	x,#3
	beq		.nottheflag
	lda	#1
	jsr	.animateit
	bra		.animed
.otheranim	s_cmp_anim	x,#0
	beq		.nottheflag_snd
	lda	#-1
	jsr	.animateit
	bra		.animed
.nottheflag_snd
	jsr		.soundout
.nottheflag	s_not_alsflag	x,sflag1
.animed
	s_cmp_alvar	B,x,al_hp,#64
	bpl		.notdead
	s_mode_change	x,#bhl_legup
.notdead
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.move
	s_cmp_anim	x,#13
	s_bcc		.oneshape
	s_set_alvar	W,x,al_shape,#boss_h_1a&$FFFF
	bra		.othershape
.oneshape	s_set_alvar	W,x,al_shape,#boss_h_1&$FFFF
.othershape
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.end	s_end_strat

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.hit	s_start_strat
	trigse	$24
	jml		hitflash_istrat

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.explode	s_start_strat
	s_sub_var	B,bosshhitcount,#5
	s_set_expstrat	x,.explode2
	s_set_objtobemother	y,x
	s_remove_child	x,y
	s_set_alvar	B,x,al_vel,#120
	s_gen_vecs	x,al_roty,al_vel
	s_set_alsflag	x,colldisable
.explode2	s_start_strat
	s_add_vecs2pos	x
	s_add_alvar	B,x,al_roty,#deg22
	
	s_falldown_Yvec	x,4,#4,#-20,explode_istrat
	s_end_strat

;---------------------------------------------------------------
bosshtop_istrat
	s_start_strat
	s_set_alsflag	x,shadow
	s_set_alptrs	x,.strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#bosshtopHP,#bosshtopAP
	s_set_alsflag	x,nohitaffect
.strat	s_start_strat
	s_add_alvar	B,x,al_childroty,#5
	s_cmp_alvar	B,x,al_roty,#-deg22
	bcs		.fire
	s_cmp_alvar	B,x,al_roty,#deg22
	bcs		.nofire
.fire
	s_jmp_notdelay	4,.nofire
	s_weapon_pos	#0,#-50,#0
	s_weapon_rot	#0,#deg180
	s_fire_weapon	x,HPLASMA
	s_set_alvar	W,y,al_ptr,playpt
	s_set_lifecnt	y,#255
	s_set_colltype	y,ENEMY1
.nofire
	s_end_strat
;---------------------------------------------------------------

teleporter_istrat
	s_start_strat
	s_init_anim	x,#0
	s_set_aldata	x,#hardHP,#hardAP
	s_set_alsflag	x,colldisable
	s_set_strat	x,.strat
	s_set_alvar	B,x,al_sbyte2,#50

.strat	s_start_strat

	s_jmp_notalsflag	x,sflag1,.nodie

	s_cmp_anim	x,#0
	s_beq	.nomore2

	s_add_anim	x,#-1,#16

	jmp	.move
.nodie	s_cmp_alvar	B,x,al_sbyte2,#20
	beq		.dobonfire
	s_cmp_alvar	B,x,al_sbyte2,#1
	bne		.nobonfire
.dobonfire
	jsr		fire_bonfire
.nobonfire

	s_beqdec_alvar	B,x,al_sbyte2,.knockitdown
	s_add_anim	x,#1,#10,.nomore
.nomore	s_add_alvar	B,x,al_ty,#-5
.move	s_add_playerz	x
	s_set_alvar	B,x,al_rotx,#0
	s_set_alvar	B,x,al_roty,#0
	s_set_alvar	B,x,al_rotz,#0
.end	s_end_strat
.knockitdown
	s_add_anim	x,#1,#20,.nomore2
	bra		.nomore
.nomore2
	s_remove_obj	x
	s_end_strat
;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
fire_bonfire
	s_make_obj	#fireball&$FFFF,.ng
	s_copy_pos	y,x
	s_set_alvar	W,y,al_worldy,#0
	s_set_strat	y,bonfire_istrat
	s_set_colltype	y,ENEMY1
	trigse		$99
	phx
	tyx
	s_set_objtobeplayer	y
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,0
	plx
.ng
	rts

bonfire_istrat
	s_start_strat
	s_set_alptrs	x,.strat,hitflash_istrat,explode_istrat
	s_set_alsflag	x,nohitaffect
	s_set_aldata	x,#hardHP,#hardAP
	s_set_coltab	x,#bonfire_c
	s_sprite_obj	x,#0
	s_set_alvar	B,x,al_vel,#120
	s_gen_3dvecs	x,al_roty,al_rotx,al_vel
.strat	s_start_strat
	s_make_obj	#fireball&$FFFF,.ng
	s_copy_pos	y,x
	s_set_strat	y,.dummdumm_strat
	s_set_alsflag	y,colldisable
.ng
	s_add_vecs2pos	x
	s_add_playerz	x
	s_end_strat

.dummdumm_strat
	s_start_strat
	s_set_colltype	x,ENEMY1
	s_set_coltab	x,#bonfire_c
	s_sprite_obj	x,#1
	s_cmp_alvar	B,x,al_sbyte1,#10
	beq		.rem
	s_inc_alvar	B,x,al_sbyte1
	s_add_playerz	x
	s_end_strat
.rem	s_remove_obj	x
	s_end_strat
;--------------------------------------------------------------------

fire_ironball4
	s_make_obj		#ironball&$FFFF,.nocando
	s_bcs			.nocando
	s_copy_rots		y,x
	s_copy_pos		y,x
	s_set_strat		y,ironball_istrat
	s_set_colltype		y,ENEMY1

	phx
	tyx
	s_set_objtobeplayer	y
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,0
	txy
	plx

	s_set_var2rnd		x1,#deg22-1
	s_set_var2rnd		y1,#deg90-1
	s_sub_var		B,y1,#deg45
	s_add_alvar		B,y,al_rotx,x1
	s_add_alvar		B,y,al_rotx,#-deg11
	s_add_alvar		B,y,al_roty,y1
	
	s_set_alsflag		y,sflag1
	trigse	$49
.nocando
	s_rts

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

ironballmissile_istrat
	s_start_strat
	s_sprite_obj	x,#0	;,#12
	s_set_alptrs	x,.strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#ballmissileHP,#ballmissileAP
.strat	s_start_strat
	a16
	lda	#1000
	s_jsl	dzdistless_l
	shorta
	s_bcs	.strat2_i
.end	s_end_strat
.strat2_i	s_set_strat	x,.strat2
.strat2	s_start_strat

	s_jsr		fire_ironball4
	s_jsr		fire_ironball4
	s_jsr		fire_ironball4
	s_jsr		fire_ironball4
	s_jsr		fire_ironball4
	s_jsr		fire_ironball4
	s_jsr		fire_ironball4
	s_jsr		fire_ironball4
	s_jsr		fire_ironball4
	s_kill_obj	x
	s_end_strat

;--------------------------------------------------------------------
base_1_istrat
	s_start_strat
	s_set_alptrs	x,.strat,hitflash_istrat,explode_istrat
	s_Set_aldata	x,#hardHP,#hardAP
	s_set_alsflag	x,nohitaffect
	s_init_anim	x,#0
.strat	s_start_strat
	s_jmp_alsflag	x,sflag1,.otherway
.other2	s_clr_alsflag	x,sflag1
	s_doorclose_snd	0
	s_add_anim	x,#1,#8,.setother
	s_end_strat
.setother	s_inc_alvar	B,x,al_sbyte1
	s_cmp_alvar	B,x,al_sbyte1,#10
	bne		.end
	s_set_alvar	B,x,al_sbyte1,#0
	s_set_alsflag	x,sflag1
.end	s_end_strat
.otherway	s_cmp_anim	x,#0
	s_beq		.otherway2
	s_dooropen_snd	7
	s_add_anim	x,#-1,#8
	s_end_strat
.otherway2	s_inc_alvar	B,x,al_sbyte1
	s_cmp_alvar	B,x,al_sbyte1,#10
	lbne		.end
	s_set_alvar	B,x,al_sbyte1,#0
	brl	.other2


;--------------------------------------------------------------------
big_meteor_istrat
	s_start_strat
	s_set_alptrs	x,.strat,hitflash_istrat,explode_istrat
	s_set_alsflag	x,nohitaffect
	s_set_aldata	x,#hardHP,#12
	s_rots_flat	x
	s_set_alvar2rnd	x,al_sbyte1,#15
	s_sub_alvar	B,x,al_sbyte1,#8
.strat	s_start_strat
	s_end_strat
;--------------------------------------------------------------------
break_meteor_istrat
	s_start_strat
	s_set_path	x,break2
	s_set_aldata	x,#2,#meteorAP
	jml		path_istrat
;--------------------------------------------------------------------
break_meteort_istrat
	s_start_strat
	s_set_path	x,break1
	s_set_aldata	x,#2,#meteorAP
	jml		path_istrat
;--------------------------------------------------------------------
iris_1_istrat
	s_start_strat
	s_set_alsflag	x,colldisable
	s_end_strat
;--------------------------------------------------------------------

flyingfish_istrat
	s_start_strat
	s_set_colltype	x,ENEMY1
	s_set_alptrs	x,.strat,hitflash_istrat,explode_istrat
	s_add_alvar	B,x,al_roty,#deg180
	s_set_aldata	x,#fishHP,#fishAP
;	s_jmp_random	.oneway
;	s_set_alsflag	x,sflag3
;.oneway
	s_init_anim	x,#0
.strat	s_start_strat
	s_jmp_alsflag	x,sflag2,.end
	s_jmp_notdelay	1,.dontmake
	s_make_splash	x,s
.dontmake
	s_cmp_alvar	W,x,al_worldy,#0
	s_bpl		.atsealevel
	s_add_alvar	W,x,al_vy,#2
	s_add_alvars	W,x,al_worldy,x,al_vy
	s_bmi		.atsealevel
	s_set_alvar	W,x,al_worldy,#0
.atsealevel
	s_add_playerz	x
	s_jmp_alsflag	x,sflag3,.left
	s_achase_alvar	W,x,al_worldx,#-200,3,.jumping
	s_cmp_alvar	W,x,al_worldx,#-150
	s_bmi		.jumping
	s_jmp		.end
.left
	s_achase_alvar	W,x,al_worldx,#200,3,.jumping
	s_cmp_alvar	W,x,al_worldx,#150
	s_bpl		.jumping
	jmp		.end

.jumping
	s_set_objtobeplayer	y
	s_obj2obj_angle	x,y,al_roty,0
	s_set_alvar	B,x,al_animframe,#0
	s_set_strat	x,.flying
	s_set_alvar	B,x,al_vel,#70
	s_gen_vecs	x,al_roty,al_vel
	s_set_alvar	W,x,al_vy,#-15
	s_make_splash	x
	s_jsl	enemyupsea_l
.flying
	s_start_strat

	s_add_alvar	W,x,al_vy,#2
	s_add_vecs2pos	x

	s_add_playerz	x
	s_cmp_alvar	W,x,al_worldy,#0
	s_bmi		.end
	s_make_splash	x
	s_set_alsflag	x,sflag2


.end	s_end_strat


;---------------------------------------------------------------
	strats_end