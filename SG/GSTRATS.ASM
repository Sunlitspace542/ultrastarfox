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
;*   File: GSTRATS.ASM                                                     *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr: GILES' STRATEGY ROUTINES.                                       *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   Date: 12/2/92                                                         *
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

	INCPUBLICS	gstrats.ext

	strats_start

gstratsstart	
initgame_strats_l

	a16
;	stz	outdist
	stz	outvx
	stz	outvy
	stz	outvz
	stz	showtype


	lda	#0
	sta.l	m_bossmaxHP	; disable boss hit count meter

	a8
	stz	gameflags
	lda	#gf2_ingame
	sta	gameflags2
	stz	bossflags
	stz	stratflags
	lda	#1
	sta	sheildon


	lda	#40
	sta.l	m_boostanim

	a8i16
	stz	showtype


	phb
	lda	#$7e
	pha
	plb

	ifeq	0
	ldx	allst		;do all strategies
.stratlp	stz	aldead
	jsl	do_strat_l
	lda	aldead
	bne	.killal
	ldy	_next,x
.killed	tyx
	bne	.stratlp
	bra	.cont
.killal	ldy	_next,x
	jsl	removedeadal_l
	bra	.killed
.cont
	endc

	jsl	init_strats_l



;------------------------------------------------------------------------------

	s_make_obj	#nullshape,.badobj
	sty		dummyobj
	s_setnoremove_behind	y
	s_clr_alsflag		y,realobj
	s_set_alsflag		y,playerobj
	bra		.ok
.badobj
   	blink
.ok

;------------------------------------------------------------------------------

	s_set_objtobevar	x,playpt
	s_clr_alsflag		x,realobj
	s_set_alsflag		x,playerobj

	s_set_objtobevar	x,pcboxobj_B
	s_clr_alsflag		x,realobj
	s_set_alsflag		x,playerobj

	s_set_objtobevar	x,pcboxobj_LW
	s_clr_alsflag		x,realobj
	s_set_alsflag		x,playerobj

	s_set_objtobevar	x,pcboxobj_RW
	s_clr_alsflag		x,realobj
	s_set_alsflag		x,playerobj

;------------------------------------------------------------------------------
; make help ball weapon.
;	s_make_obj		#helpball,.bad1
;	s_set_strat		y,helpball_Istrat
;.bad1

;------------------------------------------------------------------------------
	plb
	
	rtl




;*****************************************************************************
def_playership		MACRO	; normal,no left,no right,both.
	dw	\1&WM
	dw	\2&WM
	dw	\3&WM
	dw	\4&WM
maxpships	=	maxpships+1
		ENDM

;-----------------------------------------------------------------------------
maxpships	=	0
player_shapes
	def_playership	myship_4,myship_r,myship_l,myship_b	
pwireshapes	def_playership	my_w,my_r_w,my_l_w,my_b_w		; 1 
pnullshapes	def_playership	nullshape,nullshape,nullshape,nullshape	; 2
	def_playership	my_up,my_up,my_up,my_up			; 5
	def_playership	nullshape,nullshape,nullshape,nullshape	; 2
pblackshapes	def_playership	Bmyship_4,Bmyship_r,Bmyship_l,Bmyship_b
	def_playership	myzoom_4,myzoom_r,myzoom_l,myzoom_b

;*****************************************************************************
;--------------------------------------
; entry a8i16: A : player ship number
setYplayershape_l
	asl	a
	asl	a
	asl	a
	sta	smvar_byte1

	lda	pshipflags
	and	#psf_brkLwing!psf_brkRwing
	beq	.nps

	bit	#psf_brkLwing
	beq	.notlb	
	bit	#psf_brkRwing
	bne	.bps
	s_set_alvar2vartab	B,W,W,y,al_shape,smvar_byte1,player_shapes+2
	bra	.gps
.notlb
	s_set_alvar2vartab	B,W,W,y,al_shape,smvar_byte1,player_shapes+4
	bra	.gps
.bps
	s_set_alvar2vartab	B,W,W,y,al_shape,smvar_byte1,player_shapes+6
	bra	.gps
.nps
	s_set_alvar2vartab	B,W,W,y,al_shape,smvar_byte1,player_shapes
.gps
	rtl
	
;--------------------------------------

;*****************************************************************************
;* select_ship
;*
;*
;* entry: a8i16
;*       	
;*	A : ship number
;* exit: a8i16
;*

	shorta
	longi


select_ship_l
	jsr	select_ship
	rtl
select_ship
	phx
	phy
	a16
	and	#$00ff
	asl	a
	asl	a
	asl	a
	tax
 	
	lda.l	player_shapes,x
	sta.l	playershape
	lda.l	player_shapes+2,x
	sta.l	playershapeL
	lda.l	player_shapes+4,x
	sta.l	playershapeR
	lda.l	player_shapes+6,x
	sta.l	playershapeLR

	a8
	ply
	plx
	rts


;*****************************************************************************
;* select_nextship
;*
;*
;* entry: a8i16
;*
;*
;* exit: a8i16
;*


	shorta
	longi
select_nextship
	inc	curr_ship
	lda	curr_ship
	cmp	#maxpships
	bmi	.nmps
	stz	curr_ship
.nmps
	lda	curr_ship
	jsr	select_ship
	rts
	



;*****************************************************************************
init_strats_l

	a8i16

;----------------------------------------------------
	s_jmpNOT_varAND	B,pstratflags,#pstf_inseq,.ninseq
	stz		arrows
.ninseq


;----------------------------------------------------
; hud flag.
	lda	#0
	sta	hudrot+1	; OFF
	s_jmp_varNE		B,splayerflymode,#spfm_inside,.nhud
	lda	#-1
	sta	hudrot+1	; ON
.nhud

;----------------------------------------------------
; boss dying flash.
	s_jmpNOT_varAND		B,bossflags,#bf_dying,.nbdye
	s_jmp_notdelay		2,.nbfl
	jsl	bossflash_l
	s_brl			.ndalc
.nbfl	dealloc_window		dyingred
.ndalc
	s_jmpNOT_varAND		B,gameflags,#gf_bossdead,.nbdye
	s_and_var		B,bossflags,#~bf_dying
	dealloc_window		dyingred
.nbdye


;----------------------------------------------------
	ldx	internalPLAYPT
	ldy	dummyobj
	s_copy_pos	y,x


;----------------------------------------------------
	lda	#15
	sta.l	m_hudcolour

	ldx	playpt
	lda	curr_ship
	cmp	#1
	bne	.flash
	s_jmpNOT_varAND		B,pshipflags2,#psf2_wireship,.nwire

	phx
	a16
	lda	al_colframe,x
	and	#3
	tax
	a8
	lda.l	wirehud_cols,x
	sta.l	m_hudcolour
	plx
	bra	.flash
.nwire
	s_jmpNOT_alsflag	x,hitflash,.nflash
.flash	
	s_add_colanim	x,#1,#4
	s_bra		.notwire
.nflash	
	s_init_colanim	x,#4
.notwire	


;----------------------------------------------------
; float vars.

	s_jmpNOT_varAND		B,playerflymode,#pfm_wobble,.nwob
	s_add_var		B,floatvar1,#4
	s_add_var		B,floatvar2,#8
.nwob


;----------------------------------------------------
	IFEQ	ENEMY_FIRING
	lda	stratflags
	ora	#sf_nofiring
	sta	stratflags
	ENDC

;----------------------------------------------------

	lda	playerflymode
	sta.l	m_pfm

;----------------------------------------------------
	lda	pshipflags
	and	#psf_nofire
	bne	.choff
	lda	#255
	sta	crosshairon
	bra	.donech
.choff
	stz	crosshairon

.donech

;----------------------------------------------------
; plane toggle.
	
;	s_jmp_keyup		select,.nps
;	s_jmp_lastkeydown	select,.nps
;    	jsr			select_nextship
;.nps

;----------------------------------------------------
; view toggle.
	s_jmp_varNE	W,viewdist,outdist,.npst
	s_jmp_varNE	B,stayblack,#-1,.npst
	s_jmp_varAND	B,pshipflags,#psf_noctrl,.npst
	s_jmp_varAND	B,pstratflags,#pstf_notdie,.npst
	s_jmp_varAND	B,pstratflags,#pstf_inseq,.npst
	s_set_objtobeplayer	x
	s_jmp_alvarNOTZERO	B,x,al_sbyte2,.npst

	s_jmp_keyup		select,.npst
	s_jmp_lastkeydown	select,.npst

	trigse	$65

	lda	splayerflymode
	inc	a
	cmp	splayerflymodeopt
	bmi	.ok
	lda	#0
.ok
	sta	splayerflymode

	ldx		playpt
	jsl		changeviewmode_l

.npst

;----------------------------------------------------
	a16
	ldx	internalplaypt
	lda	al_worldx,x
	sta	player_posx
	lda	al_worldy,x
	sta	player_posy
	lda	al_worldz,x
	sta	player_posz
	a8

	s_copy_alvar2var	W,x,playervelZ,al_vz


; END


;----------------------------------------------------
; player dying.
	s_test_var		B,gameflags,#GF_PLAYERDYING
	s_beq			.ndead

	s_Achase_var		W,outvx,#0,3
	s_Achase_var		W,plrotz,#0,2
	s_jmpNOT_varAND		B,playerflymode,#pfm_dieYrot,.nfo
	s_sub_var		W,outvy,playerdieYrotspeed
;	s_jmp_varLESS		W,outvy,#(-(deg90-deg11-deg11))*256,.n
.nfo 	
	s_test_var		B,gameflags,#GF_PLAYERDEAD
	s_bne			.isdead

	s_Achase_var		W,outdist,#500,4
	brl			.ndead

.isdead
	s_beqdec_var		B,timeuntilfade,.fadeit
	s_jmp			.notfin
.fadeit

	fadedown

	lda	fade
	lbne	.notfin

	stz	fadetored

	stz	circleanim
	stz	circleanim+1

	lda	gameflags2
	and	#~gf2_ingame
	sta	gameflags2

	jsl	clearmap_l

	lda	lives
	lbne	.notdeadyet

;-------------------------------------------------------------------------
; UN-RELIABLE CODE. 
	ifeq	1
	lda	#0
	sta.l	m_particlesON
	sta.l	m_particlesON+1

	lda	gameflags
	and	#~gf_playerdying
	sta	gameflags


	s_set_var		W,outvx,#0
	s_set_var		W,outvy,#0

	s_set_var		B,flashbg,#0

	ldx		allst
	s_make_obj		#nullshape,.ff
	s_clr_alsflag		y,realobj
	s_set_alsflag		y,playerobj
	sty		playpt
	sty		internalplaypt
	s_set_alptrs	y,playercred_istrat,playercred_istrat,playercred_istrat
	tyx
.ff
	jsl		playercred_istrat

	s_make_obj		#gamesh,.nob
	s_set_strat		y,path_istrat
	s_set_path		y,gameover
	s_set_aldata	y,#255,#0
	s_copy_pos		y,x
	s_set_alvar		W,y,al_worldx,#-270
	s_add_alvar		W,y,al_worldy,#120
	s_add_alvar		W,y,al_worldz,#3400	;800
.nob
	s_make_obj		#oversh,.nober
	s_set_strat		y,path_istrat
	s_set_path		y,gameover
	s_set_aldata	y,#255,#0
	s_copy_pos		y,x
	s_set_alvar		W,y,al_worldx,#270
	s_add_alvar		W,y,al_worldy,#120
	s_add_alvar		W,y,al_worldz,#3400	;800
.nober
	phx
	lda	#waitmap>>16
	sta	mapbank
	ldx	#waitmap&7fffh
	stx	mapptr
	plx

	a16
	ldx	#0
.lp	stz	pal0palette,x
	inx
	inx
	cpx	#32*7
	bne	.lp

	txy
	ldx	#0
.lp2	lda.l	gameoverpal,x
	sta.w	pal0palette,y
	iny
	iny
	inx
	inx
	cpx	#32
	bne	.lp2

	lda	#-1
	sta	dotsflag

	lda	#0
	sta.l	m_meters
	endc

	a8
	lda	#le_gameover
	sta	levelfinished
;-------------------------------------------------------------------------

	bra	.notfin
.notdeadyet
	lda	bgflags
	ora	#bgf_restart
	sta	bgflags
;;	jsl	restart_l
.notfin

.ndead


;----------------------------------------------------

	lda	screenflashcnt
	beq	.disableflash

	s_jmp_varEQ	B,screenflashtype,#screenflashbodytype,.body
	lda	screenflashcnt
	cmp	#screenflashwingfrms
	bne	.nturq2
	jsl	flashturq2_l	
.nturq2
	dec	screenflashcnt
	bra	.nsflash	

;--------------------------------------------------------
.body
	lda	screenflashcnt
	cmp	#screenflashbodyfrms
	bne	.nturq
	jsl	flashturq_l	
	bra	.end
.nturq
	cmp	#2
	bne	.end
	jsl	flashred_l
.end
	dec	screenflashcnt
	bra	.nsflash
.disableflash
	dealloc_window	hitflash
.nsflash

	
;----------------------------------------------------
; View float

	s_jmpNOT_varAND		B,playerflymode,#pfm_wobble,.nwob2

	s_jmpNOT_varAND		B,pshipflags,#psf_brkLwing!psf_brkRwing,.nbrkwing
	s_set_var2vartab	W,W,W,viewfloatY,viewfloatptr,viewfloattab
	s_brl			.vcont
.nbrkwing	s_set_var2vartab	W,W,W,viewfloatY,viewfloatptr,viewfloattab,-1
.vcont

	s_add_var		W,viewfloatptr,#2
	s_jmp_varNE		W,viewfloatptr,#viewfloattab_len,.vptrok
	s_set_var		W,viewfloatptr,#0
.vptrok
.nwob2

;----------------------------------------------------


	jsl	random_l

	rtl
	






;*****************************************************************************
hardenemy1_Istrat
	s_start_strat	
	s_set_colltype		x,enemy1
hard_Istrat
	s_start_strat
	s_hardvars		x
	s_set_strat		x,0
	s_end_strat

;*****************************************************************************
hard180YRNZR_Istrat
	s_start_strat
	s_setnoremove_behind	x
	s_jmp			hard180YR_Istrat
;*****************************************************************************
hard180YR_Istrat
	printf	"albkls=",:$alblks,"%n"
	printf	"Addr=",:$*,"%n"
	printf	"dummyobj=",:$dummyobj,"%n"
	s_start_strat
	s_set_colltype	x,enemy1
	s_set_alvar		B,x,al_roty,#deg180
	s_hardvars		x
	s_set_strat		x,0
	s_end_strat

;*****************************************************************************
rockhard_Istrat
	s_start_strat
	s_set_colltype	x,enemy1
	s_set_alvar		B,x,al_roty,#deg180
	s_set_aldata		x,#hardHP,#rockhardAP
	s_set_strat		x,0
	s_end_strat


;*****************************************************************************
hardrot_Istrat
	s_start_strat
	s_set_colltype	x,enemy1
	s_hardvars		x
	s_set_strat		x,hardrot_strat
hardrot_strat
	s_start_strat
	s_add_alvars		B,x,al_rotx,x,al_sbyte1
	s_add_alvars		B,x,al_roty,x,al_sbyte2
	s_add_alvars		B,x,al_rotz,x,al_sbyte3
	s_end_strat



;*****************************************************************************
stayrelhard180yr_Istrat
	s_hardvars		x
	s_set_alvar		B,x,al_roty,#deg180
	s_set_strat		x,stayrelhard180YR_strat
stayrelhard180YR_strat
	s_start_strat
	s_add_playerZ	x			
	s_end_strat


stayrel_Istrat
stayrel_strat
	s_start_strat	
	s_add_playerZ	x
	s_set_alsflag	x,colldisable
	s_end_strat
	
;*****************************************************************************
staydist_Istrat
	s_start_strat	
	s_copy_alvar2alvar	W,x,al_worldz,x,al_sword1
	s_add_alvar		W,x,al_worldz,pviewposz
	s_set_alsflag	x,colldisable
	s_end_strat


;*****************************************************************************
boost_Istrat	s_start_strat
	s_set_lifecnt	x,#10
	s_set_alsflag	x,colldisable
	s_set_strat	x,boost_strat
	s_copy_alvar2var	B,x,svar_byte1,al_sbyte1
	s_sprite_obj	x,#0,svar_byte1
	s_clr_alsflag	x,invisible
	s_setnoremove_behind	x
boost_strat
	s_start_strat
	s_dec_alvar		B,x,al_tx
	s_set_objtobevar	y,boostobj
	s_jmp_objptrbad		y,remove_Istrat
	s_add_Roffs2pos		B,x,y,y,#0,#0,boostZoff,1,1,0
	s_dec_lifecnt		x
	s_end_strat

;*****************************************************************************
nocollanim0_Istrat
	s_init_anim		x,#0
nocoll_Istrat
	s_start_strat
	s_set_alsflag		x,colldisable
	s_set_strat		x,0
	s_end_strat

;*****************************************************************************
collide_Istrat
	s_start_strat
	s_docoll		x,#framesperAP
	s_jmp_alvarNOTzero	B,x,al_hp,.ncolexp
 	s_jmpto_expstrat	x
.ncolexp
	s_end_strat


;*****************************************************************************
pelasercollide_Istrat
	s_start_strat
	s_set_objtobealvar	y,x,al_collobjptr
	s_jmp_alsflag		y,nohitaffect,.solidhit
	s_jmp_alvarEQ.w		B,y,al_hp,#hardHP,.solidhit	

	lda.w	al_collstratptr,y
	ora.w	al_collstratptr+1,y
	ora.w	al_collstratptr+2,y
	bne	.nsolidhit

.solidhit	jsl			hitwallsound_l
.nsolidhit
	s_kill_obj		x
 	s_jmpto_expstrat	x

	
weapcollide_Istrat
	s_start_strat
	s_set_objtobealvar	y,x,al_collobjptr
	s_jmp_alvarNOTZERO.w	B,y,al_AP,.nzap
	s_docollAP		x,#framesperAP,#1
	s_brl			.dcol
.nzap
	s_jmpNOT_alcollflag	y,weapon,kill_Istrat
	s_docoll		x,#framesperAP
.dcol
	s_jmp_alvarNOTzero	B,x,al_hp,.ncolexp
 	s_jmpto_expstrat	x
.ncolexp
 	s_jmpto_strat	x


;*****************************************************************************

RebElaserCol_Istrat
	s_start_strat
	s_clr_alsflag		x,collide

	s_set_objtobealvar	y,x,al_collobjptr
	s_jmp_alvarNE.w		W,y,al_shape,#elaser2,.end
	phx
	tyx
	s_push_alvar		B,x,al_roty
	s_push_alvar		B,x,al_rotx
	s_push_alvar		B,x,al_vel
	s_push_alvar		W,x,al_immuneptr
	s_set_alvar		B,x,al_vel,#0
	s_add_alvar		B,x,al_roty,#deg180
	s_neg_alvar		B,x,al_rotx
	s_weapon_pos		#0,#0,#0
	s_weapon_rot		#0,#0
	s_fire_weapon		x,RebElaser
	s_pull_alvar		W,x,al_immuneptr
	s_pull_alvar		B,x,al_vel
	s_pull_alvar		B,x,al_rotx
	s_pull_alvar		B,x,al_roty
	plx
.end
    	s_jmpto_strat		x


DefElaserCol_Istrat
	s_start_strat
	s_clr_alsflag		x,collide

	s_set_objtobealvar	y,x,al_collobjptr
	s_jmp_alvarNE.w		W,y,al_shape,#elaser2,.end
	phx
	tyx
	s_push_alvar		B,x,al_roty
	s_push_alvar		B,x,al_rotx
	s_push_alvar		B,x,al_vel
	s_push_alvar		W,x,al_immuneptr
	s_set_alvar		B,x,al_vel,#0
	s_add_alvar		B,x,al_roty,#deg90
	s_set_alvar2rnd	x,al_rotx
;	s_neg_alvar		B,x,al_rotx
	s_weapon_pos		#0,#0,#0
	s_weapon_rot		#0,#0
	s_fire_weapon		x,RebElaser
	s_pull_alvar		W,x,al_immuneptr
	s_pull_alvar		B,x,al_vel
	s_pull_alvar		B,x,al_rotx
	s_pull_alvar		B,x,al_roty
	plx
.end
    	s_jmpto_strat		x
		


hitflashBOSSd_Istrat
	s_start_strat	
	s_jmp_alsflag		x,nohitaffect,.ndam
	trigse		$80
	s_set_objtobealvar	y,x,al_collobjptr
	phx	
	tyx
	jsl		makeMEDexpobj_srou
	s_set_alsflag	y,nopolyexp
	plx
	s_brl			hitflash_Istrat
.ndam	
	trigse		$24
	s_brl			hitflash_Istrat

hitflashMexp_Istrat
	s_start_strat	
	s_set_objtobealvar	y,x,al_collobjptr
	phx	
	tyx
	s_jsl		    	makeMEDexpobj_srou
	plx
	trigse		$24
	s_brl			hitflash_Istrat
hitflashSexp_Istrat
	s_start_strat	
	s_set_objtobealvar	y,x,al_collobjptr
	phx	
	tyx
	s_jsl		    	makeSMLexpobj_srou
	plx
	trigse		$24
	s_brl			hitflash_Istrat

hitflashLexp_Istrat
	s_start_strat	
	s_set_objtobealvar	y,x,al_collobjptr
	phx	
	tyx
	s_jsl		    	makeLexpobj_srou
	plx
	trigse		$24


coll_Istrat
	s_start_strat
	s_clr_alsflag		x,collide
	s_jmp_alsflag		x,nohitaffect,hitflash_Istrat.nocol
	s_docoll		x,#framesperAP
	s_jmp			hitflash_Istrat.Icont



hitflash_Istrat
	s_start_strat
	s_clr_alsflag		x,collide
	s_jmp_alsflag		x,nohitaffect,.nocol

	s_docoll		x,#framesperAP
	s_set_alsflag		x,hitflash

.Icont	local

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
	trigse		se_damageenemyfar
	s_jmp		.end
.mid	a8
	trigse		se_damageenemymid
	s_jmp		.end
.near	a8
	trigse		se_damageenemynear
.end	ply

.nocol	local
	s_jmpto_strat		


;*****************************************************************************
misscol_Istrat
	s_start_strat
	s_set_objtobealvar	y,x,al_collobjptr
	
	A16
	LDA.W	AL_SHAPE,Y
	CMP	AL_SHAPE,X
	A8
	RLBEQ	nomcol
	 
	s_docoll		x,#framesperAP

	s_jmp_altype		y,MISSILE,.dohitf
	s_KILL_OBJ		x
	s_end_strat
.dohitf
	s_set_alsflag		x,hitflash
	s_set_collstrat		x,mchitflash_strat
	s_jmpto_strat		

mchitflash_strat
	s_start_strat
	s_docoll		x,#framesperAP
	s_clr_alsflag		x,hitflash
	s_clr_alsflag		x,collide
	s_set_collstrat		x,misscol_Istrat
nomcol	s_jmpto_strat		







;*****************************************************************************
hover_Istrat
	s_start_strat
	s_add_playerz	x
	s_add_alvar	B,x,al_roty,#4
	s_end_strat

	
;*****************************************************************************
move_strat
	s_start_strat
	s_add_vecs2pos		x
	s_damagesmoke		x,#walkerHP-1,3,#0,#-100,#0,0
	s_end_strat





;*****************************************************************************
faceplayer_strat	
	s_start_strat

	s_set_objtobeplayer	y
	s_obj2obj_angle		x,y,al_roty,2

	s_end_strat



;-----------------------------------------------------------------------------
;puff_strat
;	s_start_strat
;
;	s_rots_flat	x
;	
;	s_set_vecs	x,#1,#-3,0
;	
;	s_add_vecs2pos	x
;	
;	s_dec_lifecnt	x
;	
;	s_end_strat	


;-----------------------------------------------------------------------------


;-----------------------------------------------------------------------------
null_strat
	s_start_strat
	s_end_strat	




;*****************************************************************************
fadetonorm_l	
	a8
	stz		circleanim
	stz		circleanim+1
	jsl		fadewhite2norm_l
	rtl


;*****************************************************************************
chkstagedone
	php
	a8
	s_test_var		B,gameflags,#gf_stagedone
	bne			stagedone
	plp
	clc
	rtl

stagedone
	s_and_var		B,gameflags,#~gf_stagedone
	plp
	sec
	rtl

chkstratdone1
	php
	a8
	s_test_var		B,gameflags,#gf_stratdone1
	bne			stratdone1
	plp
	clc
	rtl
stratdone1
	s_and_var		B,gameflags,#~gf_stratdone1
	plp
	sec
	rtl

	
chkstratdone2
	php
	a8
	s_test_var		B,gameflags,#gf_stratdone2
	bne			stratdone2
	plp
	clc
	rtl
stratdone2
;	s_and_var		B,gameflags,#~gf_stratdone2
	plp
	sec
	rtl
	
chkbossdead
	php
	a8
	s_test_var		B,gameflags,#gf_bossdead
	bne			bossdead
	plp
	clc
	rtl
bossdead	
	s_and_var		B,gameflags,#~gf_bossdead
	s_set_bossmaxHP		#0
	plp
	sec
	rtl


chkobjsinmap
	php
	a16
	lda	mapvar1
	jsl	find_shape_l
	cpx	#0
	beq	.no
	plp
	sec	
	rtl		; yes

.no	plp
	clc
	rtl		; no



;*****************************************************************************
	shorta
makeSsplash_srou_l
	s_make_obj		#Ssplash,splbadobj
	s_brl			domakespl
makesplash_srou_l
	s_make_obj		#splash,splbadobj
domakespl	
	s_clr_alsflag		y,realobj
	s_rots_flat		y
	s_copy_pos		y,x
	s_set_strat		y,splash_Istrat
	s_add_alvar		W,y,al_worldz,#-5
;	phx
;	ldx	al_shape,y
;	lda.l	sh_ymax,x
;	lsr	a
;	lsr	a
;	a16
;	sexa
;	clc
;	sta.w	al_worldy,y
;	a8
;	plx
	s_sprite_obj		y,#0
splbadobj
	s_rtl

splash_Istrat
	s_start_strat
	s_set_alsflag		x,colldisable
	s_init_colanim		x,#0
	s_set_strat		x,splash_strat            
	s_add_playerZ		x
	s_end_strat
splash_strat
	s_start_strat
	s_add_playerZ		x
	s_add_colanim		x,#1,#7,.die
	s_end_strat
.die
	s_remove_obj		x
	s_end_strat



;*****************************************************************************
childremove_Istrat
	s_start_strat
	s_set_objtobemother	y,x
	s_remove_child		x,y
	s_remove_obj		x
	s_end_strat




kill_istrat
kill_strat
	s_start_strat
	s_kill_obj		x
	s_end_strat

remove_istrat
remove_strat
	s_start_strat
	s_remove_obj		x
	s_end_strat


delayremoverel_Istrat	
	s_start_strat
	s_set_alsflag		x,relexplode
	s_brl			delayrem_Icont
delayremove_Istrat	
	s_start_strat
	s_clr_alsflag		x,relexplode
delayrem_Icont
	s_hardvars		x
	s_set_alptrs		x,delayremove_strat,0,0
	s_set_alsflag		x,colldisable
delayremove_strat
	s_start_strat
	s_dec_lifecnt		x
	s_jmpNOT_alsflag	x,relexplode,.nrel
	s_add_playerZ		x
.nrel	s_end_strat




;*****************************************************************************
rotsflatstay_Istrat
	s_start_strat
	s_rots_flat	x
	s_set_alsflag	x,colldisable
	s_set_alptrs	x,0,0,0
	s_end_strat

sparky_Istrat
	s_start_strat
	s_set_alvar  	B,x,al_sbyte1,#2
	s_set_alvar	W,x,al_shape,#pexplod
	s_set_alsflag	x,colldisable
	s_set_strat	x,sparky_strat
	s_set_EXPstrat	x,sparky_strat
	s_set_COLLstrat	x,sparky_strat
	s_rots_flat	x
	s_end_strat
sparky_strat
	s_start_strat
	s_decbne_alvar	B,x,al_sbyte1,endsparky_strat
	s_remove_obj	x
endsparky_strat
	s_end_strat


;*****************************************************************************
;*****************************************************************************
fire_Istrat	s_start_strat
	s_set_alvar	B,x,al_sbyte2,#9
	s_set_strat		x,fire_strat
	s_end_strat

fire_strat	s_start_strat
	s_rots_flat	x

	s_decbne_alvar		B,x,al_sbyte2,.nfs
	s_copy_alvar2alvar	B,x,al_sbyte2,x,al_sbyte1
.makesmoke
	s_jsl		makesmoke_srou_l
	s_bra		.end
.nfs
	s_cmp_alvar	B,x,al_sbyte2,#8
	s_beq		.makesmoke
	s_cmp_alvar	B,x,al_sbyte2,#16
	s_beq		.makesmoke
.end
	s_end_strat


;-----------------------------------------------------------------------------
makefire_srou_l
	s_make_obj		#fire,.nfobj
	s_copy_var2alvar	B,y,al_sbyte1,smvar_byte1
	s_set_strat		y,fire_Istrat
	s_clr_alsflag		y,realobj
	s_set_alsflag		y,colldisable
	s_rots_flat		y
	s_copy_pos		y,x
	s_set_altype		y,zremove
	A16
	TYA
	STA.L			ALX_FIREOBJPTR,X
	A8
	s_set_alflag		x,onfire
.nfobj	s_rtl
;-----------------------------------------------------------------------------
makesmoke_srou_l
	ldy	#0
	s_make_obj	#smoke,.end
	s_clr_alsflag		y,realobj
	s_rots_flat	y
	s_copy_pos	y,x
	s_set_strat	y,smokeP_Istrat
	s_set_altype	y,zremove
	s_set_alsflag	y,colldisable
.end	s_rtl


;-----------------------------------------------------------------------------
puff_Istrat
	s_start_strat
	s_set_alptrs	x,puff_strat,0,0
	s_set_alsflag	x,colldisable
	s_init_colanim	x,#0
	s_sprite_obj	x,#0
puff_strat
	s_start_strat
	s_rots_flat	x
	s_add_colanim	x,#1,#9
	s_cmp_colanim	x,#8
	s_bne		.nrem
	s_remove_obj	x
.nrem
	s_add_playerZ	x
	s_end_strat

;-----------------------------------------------------------------------------
smokeP_istrat
	s_start_strat
	s_sprite_obj	x,#0
	s_set_alptrs	x,smokeP_strat,0,0
	s_set_alvar	B,x,al_sbyte1,#20
	s_set_alvar	W,x,al_sword1,#6
	s_init_colanim	x,#0
smokeP_strat
	s_start_strat
	s_rots_flat	x
;	s_jmp_notdelay	1,.noanim
	s_add_colanim	x,#1,#8
	s_cmp_colanim	x,#0
	s_beq		.kill
.noanim	s_sub_alvar	W,x,al_worldx,#1
	s_sub_alvars	W,x,al_worldy,x,al_sword1
	s_decbne_alvar	B,x,al_sbyte1,.end
	s_set_alvar	B,x,al_sbyte1,#20
	s_dec_alvar	W,x,al_sword1
;	s_cmp_alvar	W,x,al_sword1,#0
	s_bne		.end
.kill
	s_remove_obj	x
.end
	s_add_vecs2pos	x
	s_end_strat



;*****************************************************************************
missboundchkrem
missboundchkexp
	lda			missboundflags
	bit			#mb_right
	beq			.nml
	s_jmp_alvarmore		W,x,al_worldx,maxMmoveX,.killobj
.nml
	lda			missboundflags
	bit			#mb_left
	beq			.nmr
	s_jmp_alvarless		W,x,al_worldx,minMmoveX,.killobj
.nmr
	lda			missboundflags
	bit			#mb_top!mb_Rtop!mb_Ltop
	beq			.nmt
	s_jmp_alvarmore		W,x,al_worldy,minPmoveY,.nmt

	lda			missboundflags
	bit			#mb_Rtop
	beq			.nrt
	s_set_objtobeplayer	y
	s_jmp_alvarmore.w	W,y,al_worldx,missbTOPRIGHT,.nmt
.nrt
	lda			missboundflags
	bit			#mb_Ltop
	beq			.killobj
	s_set_objtobeplayer	y
	s_jmp_alvarmore.w	W,y,al_worldx,missbTOPLEFT,.killobj
.nmt
	lda			missboundflags
	bit			#mb_bottom!mb_Lbottom
	beq			.nmb
	s_jmp_alvarless		W,x,al_worldy,maxMmoveY,.nmb
	lda			missboundflags
	bit			#mb_Lbottom
	beq			.killobj
	s_set_objtobeplayer	y
	s_jmp_alvarmore.w	W,y,al_worldx,missbBOTLEFT,.killobj

.nmb
	s_end_strat
.killobj
	s_kill_obj	x	
	s_end_strat

.remobj	s_remove_obj	x
	s_end_strat



;*****************************************************************************
miss_end
	s_jmp_varAND		B,gameflags,#gf_bossdead,kill_Istrat
	s_jmp_varAND		B,bossflags,#bf_dying,kill_Istrat
	s_jmp_NOTalsflag	x,sflag1,missboundchkexp
	s_end_strat

;*****************************************************************************
laser_Istrat	  			; relative to player speed.
	s_start_strat
	s_set_strat		x,laser_strat
	s_copy_alvar2alvar	B,x,al_rotx,x,al_sbyte1
	s_copy_alvar2alvar	B,x,al_roty,x,al_sbyte2
	s_gen_3dvecs		x,al_roty,al_rotx,al_vel
	s_addgen_3dvecs		x,al_roty,al_rotx,al_sbyte3
laser_strat
	s_start_strat
	s_add_playerZ		x
	s_add_vecs2pos		x
	s_decbne_lifecnt	x,.lnd
	s_remove_obj		x
	s_end_strat
.lnd
	s_add_alvar		B,x,al_rotz,#20
	s_brl			miss_end

;*****************************************************************************
makeengine_srou_l
	s_make_obj	#boostshape,.bad

	phx
	phy
	a16
	ldy		al_shape,x
	tyx
	lda.l		sh_Zmax,x
	nega
	sta		svar_word2
	lda.l		sh_Ymax,x
	sec
	sbc		#24
	sta		svar_word1
	ply
	plx
	a8
	
	s_sprite_obj		y,#0,svar_word1
	s_set_alvar		B,y,al_relposz,svar_word2

	A16
	TYA	
	STA.L			ALX_FIREOBJPTR,X
	A8

	s_set_alsflag		y,colldisable
	jsl			updateengine_srou_l
	s_set_alsflag		y,invisible
	s_set_alflag		x,onfire
	
.bad	rtl

;*****************************************************************************
updateengine_srou_l
	s_set_objtobealvar	y,x,al_fireobjptr
	s_jmp_objptrbad		y,.bad
	s_clr_alsflag		y,invisible
	s_copy_alvar2var	B,y,svar_byte1,al_relposZ
	s_add_Roffs2pos		B,y,x,x,#0,#0,svar_byte1,1,1,0
.bad	rtl


;*****************************************************************************
hmissile1_Istrat 			; relative to player speed.
	s_start_strat
	s_set_strat		x,hmissile1_strat
	set_sound2		x,#2
	s_set_alsflag		x,shadow
	s_set_colltype		x,Zenemy
;	s_set_alvar		B,x,al_sbyte1,#10
	s_gen_3dvecs		x,al_roty,al_rotx,al_vel
	s_addgen_3dvecs		x,al_roty,al_rotx,al_sbyte3
	jsl			makeengine_srou_l
	s_end_strat
hmissile1_strat			
	s_start_strat

	s_jmpNOT_alsflag	x,sflag3,.nanim
	s_cmp_anim		x,#15
	s_beq			.nanim
	s_add_anim		x,#1,#16
.nanim



	s_add_alvar		B,x,al_rotz,#10

;	s_decbne_alvar		B,x,al_sbyte1,.cont
;	s_set_alvar		B,x,al_sbyte1,#1


	s_set_objtobealvar	y,x,al_ptr
	s_jmp_alsflag		x,sflag2,.cont

	s_jmp_distless		x,y,#300,.nac
	
	s_chk_objptr		y,.nhs
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,3
.nhs
	s_gen_3dvecs		x,al_roty,al_rotx,al_vel
	s_addgen_3dvecs		x,al_roty,al_rotx,al_sbyte3
	s_bra			.cont
.nac				      	
	s_set_alsflag		x,sflag2
.cont
	s_add_playerZ		x
	s_add_vecs2pos		x
	s_dec_lifecnt		x
	jsl			updateengine_srou_l
	s_remove_offscn		x
	s_brl			miss_end



;*****************************************************************************
hmissile2_Istrat 			; move straight for short time then quick turn relative to player speed.
	s_start_strat
	s_set_strat		x,hmissile2_strat
	set_sound2		x,#2
	s_set_alsflag		x,shadow
	s_set_colltype		x,Zenemy
	s_set_alvar		B,x,al_sbyte1,#25
	s_gen_3dvecs		x,al_roty,al_rotx,al_vel
	s_addgen_3dvecs		x,al_roty,al_rotx,al_sbyte3
	jsl			makeengine_srou_l

	s_end_strat
hmissile2_strat			
	s_start_strat

	s_add_alvar		B,x,al_rotz,#10

	s_decbne_alvar		B,x,al_sbyte1,.cont
	s_set_alvar		B,x,al_sbyte1,#1

	s_set_objtobealvar	y,x,al_ptr
	s_jmp_alsflag		x,sflag2,.cont

	s_jmp_distless		x,y,#300,.nac
	
	s_chk_objptr		y,.nhs
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,1
.nhs
	s_gen_3dvecs		x,al_roty,al_rotx,al_vel
	s_addgen_3dvecs		x,al_roty,al_rotx,al_sbyte3
	s_bra			.cont
.nac				      	
	s_set_alsflag		x,sflag2
.cont
	s_add_playerZ		x
	s_add_vecs2pos		x
	s_dec_lifecnt		x
	jsl			updateengine_srou_l
	s_remove_offscn		x
	s_brl			miss_end



;*****************************************************************************
hmissile3_Istrat 			; kamikaze Zaco9 shoot elaser hmissile.
	s_start_strat
	s_set_strat		x,hmissile3_strat
	set_sound2		x,#2
	s_set_alsflag		x,shadow
	s_set_colltype		x,Zenemy
	s_gen_3dvecs		x,al_roty,al_rotx,al_vel
	s_addgen_3dvecs		x,al_roty,al_rotx,al_sbyte3
	jsl			makeengine_srou_l
	s_end_strat
hmissile3_strat
	s_start_strat

	s_set_objtobealvar	y,x,al_ptr

	s_jmp_alsflag		x,sflag2,.cont

	s_jmp_outZdistrng	x,y,#1000,#2000,.nfire
	s_jmp_notdelay		3,.nfire
	phy
	s_weapon_pos		#(-10<<1>weapon_scale,#(15<<1)>>weapon_scale,#0
	s_weapon_rot		#0,#deg5
	s_fire_weapon		x,RELSLOWELASER
	s_weapon_pos		#(10<<1>weapon_scale,#(15<<1)>>weapon_scale,#0
	s_weapon_rot		#0,#-deg5
	s_fire_weapon		x,RELSLOWELASER
	ply
.nfire


	s_jmp_Zdistless		x,y,#500,.nac
	s_jmp_outZdistrng	x,y,#500,#2000,.cont
	
	s_chk_objptr		y,.nhs
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,0
.nhs
	s_gen_3dvecs		x,al_roty,al_rotx,al_vel
	s_addgen_3dvecs		x,al_roty,al_rotx,al_sbyte3
	s_bra			.cont
.nac				      	
	s_set_alsflag		x,sflag2
.cont
	s_add_playerZ		x
	s_add_vecs2pos		x
	jsl			updateengine_srou_l
	s_dec_lifecnt		x
	s_remove_offscn		x
	s_brl			miss_end


;*****************************************************************************
chickhmissile1_Istrat 			; relative to player speed.
	s_start_strat
	s_set_strat		x,chickhmissile1_strat
	set_sound2		x,#2
	s_set_alsflag		x,shadow
	s_set_colltype		x,Zenemy
	s_set_alvar		B,x,al_rotz,#deg180
	s_end_strat
chickhmissile1_strat
	s_start_strat


;	s_add_alvar		B,x,al_rotz,#20

;	s_set_objtobealvar	y,x,al_ptr
	s_set_objtobeplayer	y 
	
	s_achase_alvar		W,x,al_worldx,player_posx,3
	s_achase_alvar		W,x,al_worldy,player_posy,3

	s_jmp_alsflag		x,sflag2,.near
	s_jmp_distmore		x,y,#400,.far
	s_jmp_anyJkeydown	.far
	s_set_alsflag		x,sflag2
.near				       
	s_set_alsflag		x,colldisable
	s_dec_lifecnt		x

	s_jmp_lower		y,viewcy,.up
	s_add_alvar		B,x,al_rotx,#2
	s_brl			.nhs
.up
	s_sub_alvar		B,x,al_rotx,#2
	s_brl			.nhs

.far
	s_chk_objptr		y,.nhs
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,0
.nhs
	s_gen_3dvecs		x,al_roty,al_rotx,al_vel
;	s_addgen_3dvecs		x,al_roty,al_rotx,al_sbyte3

.cont
	s_add_playerZ		x
	s_add_vecs2pos		x
	s_remove_offscn		x
	s_brl			miss_end


;*****************************************************************************
STBhmissile1_Istrat 			; relative to player speed.
				; set al_sbyte1,2 to init. vector angles.
				; set al_roty,rotx to init. obj rotation angles.
				; al_roty,rotx chase to sbyte1,2.
	s_start_strat
	s_set_strat		x,STBhmissile1_strat
	set_sound2		x,#2
	s_set_alsflag		x,shadow
	s_set_colltype		x,Zenemy
	s_set_speed		x,#10
	s_set_alvar		B,x,al_sbyte3,#20
	jsl			makeengine_srou_l
STBhmissile1_strat
	s_start_strat

	s_speedto		x,#60,2
	s_jmp_alvarNE		B,x,al_vel,#60,.nzr
.nzr	s_add_alvar		B,x,al_rotz,#10


	s_set_objtobealvar	y,x,al_ptr

;	s_jmp_XYdistmore	x,y,#500,remove_Istrat

	s_jmp_alsflag		x,sflag2,.cont

	s_jmp_distless		x,y,#600,.nac
	
	s_chk_objptr		y,.nhs
	s_decbne_alvar		B,x,al_sbyte3,.nhs
	s_set_alvar		B,x,al_sbyte3,#1
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,4
.nhs
	s_achase_alvar2alvar	B,x,al_sbyte1,x,al_roty,3
	s_achase_alvar2alvar	B,x,al_sbyte2,x,al_rotx,3

	s_gen_3dvecs		x,al_sbyte1,al_sbyte2,al_vel
	s_bra			.cont
.nac				      	
	s_set_alsflag		x,sflag2
.cont

	s_add_playerZ		x
	s_add_vecs2pos		x
	s_dec_lifecnt		x
	jsl			updateengine_srou_l
	s_remove_offscn		x
	s_brl			miss_end



;*****************************************************************************
Qhmissile1_Istrat 			; relative to player speed.
	s_start_strat
	s_set_strat		x,Qhmissile1_strat
	set_sound2		x,#2
	s_set_alsflag		x,shadow
	jsl			makeengine_srou_l
Qhmissile1_strat
	s_start_strat

	s_add_alvar		B,x,al_rotz,#10

	s_set_objtobealvar	y,x,al_ptr

	s_chk_objptr		y,.nhs
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,0
.nhs
	s_gen_3dvecs		x,al_roty,al_rotx,al_vel

	s_add_playerZ		x
	s_add_vecs2pos		x
	s_dec_lifecnt		x
	jsl			updateengine_srou_l
	s_remove_offscn		x
	s_brl			miss_end

;*****************************************************************************
homingflat_Istrat 			; relative to player speed.
				; keep init. angle but home to object.

	s_start_strat
	s_set_strat		x,homingflat_strat
	s_copy_alvar2alvar	B,x,al_sbyte1,x,al_roty
	s_copy_alvar2alvar	B,x,al_sbyte2,x,al_rotx
	s_set_alvar		B,x,al_rotx,#0
	s_set_alvar		B,x,al_roty,#deg180
	set_sound2		x,#6
homingflat_strat
	s_start_strat

	s_remove_offscn		x
	
	s_rots_flat		x

	s_set_objtobealvar	y,x,al_ptr
	s_chk_objptr		y,.nhs
	s_jmp_Zdistless		x,y,#500,.nhs
	s_obj2obj_3dangle	x,y,al_sbyte1,al_sbyte2,4
.nhs
	s_gen_3dvecs		x,al_sbyte1,al_sbyte2,al_vel
	s_addgen_3dvecs		x,al_sbyte1,al_sbyte2,al_sbyte3
	s_add_playerZ		x
	s_add_vecs2pos		x
	s_dec_lifecnt		x
	s_brl			miss_end
;*****************************************************************************
Yhoming_Istrat 			; Y rotation only relative to player speed.
	s_start_strat
	s_set_strat		x,Yhoming_strat
	set_sound2		x,#6

	s_set_var2rnd		svar_byte1,#7
	s_init_anim		x,svar_byte1
Yhoming_strat
	s_start_strat

	s_add_anim		x,#1,#8
	
	s_set_objtobealvar	y,x,al_ptr
	s_obj2obj_angle		x,y,al_roty,0
.nhs
	s_gen_3dvecs		x,al_roty,al_rotx,al_vel
	s_add_playerZ		x
	s_add_vecs2pos		x
	s_dec_lifecnt		x
	s_brl			miss_end
;*****************************************************************************
relflatmiss_Istrat 			; relative to player speed.
	s_start_strat
	s_set_strat		x,relflatmiss_strat
	s_copy_alvar2alvar	B,x,al_sbyte1,x,al_roty
	s_copy_alvar2alvar	B,x,al_sbyte2,x,al_rotx
	s_gen_3dvecs		x,al_sbyte1,al_sbyte2,al_vel
	set_sound2		x,#6
relflatmiss_strat
	s_start_strat
;	s_rots_flat		x
	s_add_playerZ		x
	s_add_vecs2pos		x
	s_dec_lifecnt		x,1
;	s_remove_offscn		x
	s_brl			miss_end

;*****************************************************************************
flatmiss_Istrat 			
	s_start_strat
	s_set_strat		x,flatmiss_strat
	s_copy_alvar2alvar	B,x,al_sbyte1,x,al_roty
	s_copy_alvar2alvar	B,x,al_sbyte2,x,al_rotx
	s_gen_3dvecs		x,al_sbyte1,al_sbyte2,al_vel
	set_sound2		x,#6
flatmiss_strat
	s_start_strat
	s_rots_flat		x
	s_add_vecs2pos		x
	s_dec_lifecnt		x,1
;	s_remove_offscn		x
	s_brl			miss_end



;*****************************************************************************
missile1_Istrat 			; relative to player speed.
	s_start_strat
	s_set_strat		x,missile1_strat
	set_sound2		x,#2
	s_set_colltype		x,Zenemy
	s_set_alsflag		x,shadow
	jsl			makeengine_srou_l
missile1_strat
	s_start_strat
	s_dec_lifecnt		x
	s_add_alvar		B,x,al_rotz,#10

	s_jmp_alsflag		x,sflag1,.strm
	s_Achase_alvar2alvar	B,x,al_roty,x,al_sbyte2,2
	s_Achase_alvar2alvar	B,x,al_rotx,x,al_sbyte1,2
	s_gen_3dvecs		x,al_roty,al_rotx,al_vel
	s_addgen_3dvecs		x,al_roty,al_rotx,al_sbyte3
.strm
	s_add_playerZ		x
	s_add_vecs2pos		x
	jsl			updateengine_srou_l
	s_brl			miss_end



;*****************************************************************************
missile2_Istrat
	s_start_strat
	s_copy_alvar2alvar	B,x,al_rotx,x,al_sbyte1
	s_copy_alvar2alvar	B,x,al_roty,x,al_sbyte2
	s_set_strat		x,missile2a_strat
	s_setremove_behind	x
	set_sound2		x,#2
	s_set_alsflag		x,shadow
	s_set_colltype		x,Zenemy
	jsl			makeengine_srou_l
	s_end_strat

missile2a_strat
	s_start_strat

	s_jmp_alsflag		x,sflag2,.nspi
	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#600,.nspi
	s_speedto		x,#100,5
.nspi

	
	s_gen_3dvecs		x,al_roty,al_rotx,al_vel
	s_add_playerz		x
	s_add_vecs2pos		x

	s_dec_lifecnt		x
	s_achase_2alvars	B,x,al_rotx,#0,2,al_roty,#deg180,2
	s_add_alvar		B,x,al_rotz,#10

	jsl			updateengine_srou_l
	s_brl			miss_end


;*****************************************************************************
relelaser_Istrat 			; relative to player speed.
	s_start_strat
	s_set_strat		x,relelaser_strat
	s_copy_alvar2alvar	B,x,al_rotx,x,al_sbyte1
	s_copy_alvar2alvar	B,x,al_roty,x,al_sbyte2

	s_gen_3dvecs		x,al_roty,al_rotx,al_vel,1   ; laser spd.
	s_addgen_3dvecs		x,al_roty,al_rotx,al_sbyte3  ; mother obj speed

	s_init_anim		x,#0
	s_end_strat
relelaser_strat
	s_start_strat

	s_cmp_anim		x,#4
	s_beq			.nai
	s_add_anim		x,#2,#8
.nai
	s_add_playerZ		x
	s_add_vecs2pos		x

	s_decbne_lifecnt	x,.lnd
	s_remove_obj		x
	s_end_strat
.lnd
	s_brl			miss_end

;*****************************************************************************
relelaserhome_Istrat 			; relative to player speed.
	s_start_strat
	s_set_strat		x,relelaserhome_strat
	s_copy_alvar2alvar	B,x,al_rotx,x,al_sbyte1
	s_copy_alvar2alvar	B,x,al_roty,x,al_sbyte2

	s_gen_3dvecs		x,al_roty,al_rotx,al_vel,1   ; laser spd.

	s_init_anim		x,#0
	s_end_strat
relelaserhome_strat
	s_start_strat

	s_cmp_anim		x,#4
	s_beq			.nai
	s_add_anim		x,#2,#8
.nai
	s_jmp_alsflag		x,sflag2,.nhs
	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#800,.nmin
	s_set_alsflag		x,sflag2
.nmin
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,1
	s_gen_3dvecs		x,al_roty,al_rotx,al_vel,1   ; laser speed
.nhs

	s_add_playerZ		x
	s_add_vecs2pos		x

	s_decbne_lifecnt	x,.lnd
	s_remove_obj		x
	s_end_strat
.lnd
	s_brl			miss_end



;*****************************************************************************
elaser_Istrat 			
	s_start_strat
	s_set_strat		x,elaser_strat
	s_copy_alvar2alvar	B,x,al_rotx,x,al_sbyte1
	s_copy_alvar2alvar	B,x,al_roty,x,al_sbyte2

	s_gen_3dvecs		x,al_roty,al_rotx,al_vel,1   ; laser spd.
;	s_addgen_3dvecs		x,al_roty,al_rotx,al_sbyte3  ; mother obj speed

	s_init_anim		x,#0
	s_end_strat
elaser_strat
	s_start_strat
 
	s_cmp_anim		x,#4
	s_beq			.nai
	s_add_anim		x,#2,#8
.nai
	s_add_vecs2pos		x

	s_decbne_lifecnt	x,.lnd
	s_remove_obj		x
	s_end_strat
.lnd
	s_brl			miss_end

;*****************************************************************************
elaser2die_Istrat
	s_start_strat

	s_set_alvar		W,x,al_ptr,#0
	s_make_obj		#lfdie,.badobj
	s_clr_alsflag		y,realobj
	s_set_alvartobeobj	x,al_ptr,y
	s_copy_pos		y,x
	s_set_strat		y,rotsflatstay_Istrat
	s_set_alsflag		y,colldisable
.badobj
	s_set_expstrat		x,elaser2die_strat

elaser2die_strat
	s_start_strat

 

	s_jmpNOT_alsflag	x,relexplode,.nrel
	s_jmp_varAND		B,gameflags,#gf_playerdying,.nrel
	s_add_playerZ		x
.nrel

	s_cmp_anim		x,#8
	s_beq			.eea
	s_add_anim		x,#2,#9
	s_end_strat
.eea
	s_set_objtobealvar	y,x,al_ptr
	s_chk_objptr		y,.nrs
	s_remove_obj		y
.nrs	
	s_remove_obj		x
	s_end_strat


;*****************************************************************************

Pbeam_Istrat 			
	s_start_strat
	s_set_strat		x,Pbeam_strat
	s_copy_alvar2alvar	B,x,al_rotx,x,al_sbyte1
	s_copy_alvar2alvar	B,x,al_roty,x,al_sbyte2

	s_gen_3dvecs		x,al_roty,al_rotx,al_vel,2   ; laser spd.
	s_addgen_3dvecs		x,al_roty,al_rotx,al_sbyte3  ; mother obj speed

	s_init_anim		x,#4
	s_jmp_varAND		B,pstratflags,#pstf_firstframeLcol,.ffr
	s_set_alsflag		x,colldisable
.ffr	s_end_strat

Pbeam_strat
	s_start_strat
	s_set_alvar		B,x,al_rotx,#0
	s_set_alvar		B,x,al_roty,#0
	s_add_alvar		B,x,al_rotz,#24
	s_brl			pelaser_strat
	

;*****************************************************************************
Pelaser_Istrat 			
	s_start_strat
	s_set_strat		x,Pelaser_strat
	s_copy_alvar2alvar	B,x,al_rotx,x,al_sbyte1
	s_copy_alvar2alvar	B,x,al_roty,x,al_sbyte2

	s_gen_3dvecs		x,al_roty,al_rotx,al_vel,2   ; laser spd.
	s_addgen_3dvecs		x,al_roty,al_rotx,al_sbyte3  ; mother obj speed

	s_init_anim		x,#4
	s_jmp_varAND		B,pstratflags,#pstf_firstframeLcol,.ffr
	s_set_alsflag		x,colldisable
.ffr	s_end_strat
Pelaser_strat
	s_start_strat

	s_remove_ifplayerdead	x
	s_clr_alsflag		x,colldisable
	
	s_add_vecs2pos		x

	s_decbne_lifecnt	x,.lnd
	s_remove_obj		x
	dec			numplasers
	s_end_strat
.lnd
	s_brl			miss_end

pelaser2die_Istrat
	s_start_strat
	s_setnoremove_behind	x
	dec			numplasers
	s_jmp			elaser2die_Istrat


playerbeamdie_Istrat
	s_start_strat
	dec			numplasers
	s_set_expstrat		x,remove_Istrat
	s_end_strat



;*****************************************************************************
nuke_Istrat 			; relative to player speed.
	s_start_strat
	s_set_alptrs		x,nuke_strat,weapcollide_Istrat,nukeexp_Istrat
	s_gen_3dvecs		x,al_roty,al_rotx,al_vel,1   ; nuke spd.
	s_addgen_3dvecs		x,al_roty,al_rotx,al_sbyte3  ; mother obj speed

	s_set_alvar		B,x,al_rotx,#0
	s_set_alvar		B,x,al_roty,#deg180
	set_sound2		x,#6
	s_end_strat
nuke_strat
	s_start_strat
	s_remove_ifplayerdead	x
	s_jmp_varAND		B,pshipflags,#psf_nofire,removenuke_Istrat


	s_add_vecs2pos		x
	s_dec_lifecnt		x,1


	s_jmpNOT_varAND		B,playerflymode,#pfm_diefall,.notdead
	s_add_alvar		W,x,al_vy,#2
.notdead


	s_jmp_keyup		a,.nexp
	s_jmp_lastkeydown	a,.nexp
	s_kill_obj		x
.nexp

	s_jmp_NOTalsflag	x,sflag1,missboundchkexp
	s_end_strat

removenuke_Istrat
	s_start_strat
	s_inc_var	W,specwepcnt
	s_set_var	B,specialdelay,#1
	s_jmp		remove_Istrat


nukeexp_Istrat
	s_start_strat
	s_set_alvar		W,x,al_sword1,#nukeRATE
	s_set_expstrat		x,nukeexp_strat
	s_set_alvar		W,x,al_shape,#nullshape
	s_jsl			makeMEDexpobj_srou
	s_set_vartobeobj	circleobj,x
	big_circle_exp
	trigse			$30
	set_sound2		x,#0
	s_end_strat
nukeexp_strat
	s_start_strat

	a16
	lda	al_sword1,x
	cmp	#nukeMAXRADIUS
	a8
	bmi	.donuke	
	s_remove_obj	x
	s_end_strat
.donuke
	s_add_playerZ		x


	s_jmp_varAND	B,pshipflags2,#psf2_playerHP0,.nonuke

	s_set_find		0
	a16
	lda			al_sword1,x
	sta			svar_word2
	sec
	sbc			#nukeRATE
	sta			svar_word1
	a8
	
.here	
	s_find_radiusobj	y,x,#0,svar_word1,svar_word2,.donefind

	s_jmp_alsflag		y,nohitaffect,.here
	s_jmp_alsflag		y,colldisable,.here
	s_jmpNOT_alflag		y,frontpl,.here

	lda.w			al_hp,y
	bmi			.here
	sec
	sbc			#nukeAP
	bpl			.nneg
	lda			#0
.nneg
	sta.w			al_hp,y
	s_set_alsflag	y,hitflash
	s_set_altype		y,nuked
	brl			.here
.donefind
	s_add_alvar		W,x,al_sword1,#nukeRATE

.nonuke
	s_end_strat





;*****************************************************************************
spread_Istrat
	s_start_strat
	s_set_strat		x,spread_strat
	s_set_alvar		B,x,al_sbyte3,#10
	s_set_colltype		x,friend
	s_set_colltype		x,enemyweap
	s_gen_3dvecs		x,al_roty,al_rotx,al_vel

spread_strat
	s_start_strat
	s_beqdec_alvar		B,x,al_sbyte3,spreadA_init

	s_add_alvar		B,x,al_rotz,#8
	s_add_vecs2pos		x
	s_dec_lifecnt		x
	s_add_playerZ		x
	s_brl			miss_end


spreadA_init
	s_set_find		0
.find	s_find_obj		y,x,#0,.nfind

	s_jmp_alcollflag	y,weapon,.find
	s_jmp_alsflag		y,colldisable,.find
	s_jmp_alvarEQ.w		B,y,al_HP,#hardHP,.find

;	s_jmp_alsflag		y,lockon,.find
;	s_set_alsflag		y,lockon

	sty			svar_word1
	s_weapon_pos		#0,#0,#0
	s_weapon_rot		#0,#0
	s_fire_weapon		x,QHMISSILE1
	s_set_alvar		W,y,al_ptr,svar_word1

	s_bra			.find
.nfind
	s_jmp			explode_Istrat

	

;*****************************************************************************
numhelpshots	equ	10

helpball_Istrat
	s_start_strat
	s_sprite_obj	x,#0
	s_set_alptrs	x,helpball_strat,0,0
	s_set_alsflag	x,colldisable
	s_set_alvar	B,x,al_sbyte3,#30
helpball_strat
	s_start_strat
	s_set_objtobeplayer	y
	s_rots_flat		x

	s_jmp_alvarLESS		B,x,al_sbyte2,#numhelpshots,.ok
	s_add_alvar		B,x,al_sbyte3,#3
	s_jmp_alvarLESS		B,x,al_sbyte3,#120,.ok
	s_remove_obj		x
.ok
	s_copy_alvar2var	B,x,svar_byte1,al_sbyte3
	s_add_Roffs2pos		B,x,y,x,#0,svar_byte1,#60,0,0,1
	s_add_alvar		B,x,al_rotz,#12


	s_set_find		0
.next	s_find_radiusobj		y,x,#0,#300,#4000,.nfound
	s_jmpNOT_alflag		y,inviewpl,.next
	s_jmp_alsflag		y,nohitaffect,.next
	s_jmp_alsflag		y,colldisable,.next
	s_jmp_colltype		y,friend,.next
	s_jmp_alsflag		y,lockon,.next
	s_jmp_alvarEQ.w		B,y,al_hp,#hardHP,.next
;	s_jmp_outXYdistrng	x,y,#0,#1000,.next

	s_jmp_alvarEQ		B,x,al_sbyte1,#3,.nfound

	s_set_alsflag		y,lockon
	s_set_vartobeobj	svar_word1,y
	s_make_obj		#shelpball,.bad
	s_set_strat		y,helpballhome_Istrat
	s_copy_pos		y,x
	s_set_alvar		W,y,al_ptr,svar_word1
	s_set_alvartobeobj	y,al_sword1,x
	s_inc_alvar		B,x,al_sbyte1
	s_inc_alvar		B,x,al_sbyte2
.bad
	s_brl			.next	

.nfound

	s_end_strat


helpballhome_Istrat
	s_start_strat
	s_set_alptrs		x,helpballhome_strat,helpballHcoll_Istrat,helpballHrem_Istrat
	s_set_aldata		x,#1,#20
	s_set_speed		x,#40
	s_set_lifecnt		x,#70
	s_set_colltype		x,laser
	s_set_colltype		x,friend
	s_setnoremove_behind	x
	s_sprite_obj	x,#0
helpballhome_strat
	s_start_strat
	s_rots_flat		x
	s_set_objtobealvar	y,x,al_ptr
	s_jmp_objptrbad		y,helpballHrem_Istrat
	s_obj2obj_3dangle	x,y,al_sbyte1,al_sbyte2,0
	s_gen_3dvecs		x,al_sbyte1,al_sbyte2,al_vel	
	s_add_vecs2pos		x
	s_add_playerZ		x
	s_dec_lifecnt		x,1
	s_end_strat

helpballHcoll_Istrat
	s_set_objtobealvar	y,x,al_ptr
	a16
	lda		al_collobjptr,x
	sta		svar_word1
	cpy		svar_word1
	a8
	lbeq		coll_Istrat
.ncol 	
	s_clr_alsflag		x,collide
	s_jmpto_strat	
	

helpballHrem_Istrat
	s_set_objtobealvar	y,x,al_ptr
	s_jmp_objptrbad		y,.nclr
	s_clr_alsflag		y,lockon
.nclr
	s_set_objtobealvar	y,x,al_sword1
	s_dec_alvar		B,y,al_sbyte1
	s_jmp			remove_Istrat




;*****************************************************************************
fire_nuke	; player's special weapon
	s_make_obj		#nuke,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#2,#8
	s_set_alptrs		y,nuke_Istrat,0,0
	s_set_speed		y,#50
	s_set_lifecnt		y,#28
	s_set_colltype		y,laser
	s_set_colltype		y,friend
	jsr			gen_weapon
.badobj	rtl

;*****************************************************************************
fire_Elaser	; player's laser.
	s_make_obj		#elaser2,.badobj
	s_set_aldata		y,#1,#elaserAP
	s_set_alptrs		y,Pelaser_Istrat,pelasercollide_Istrat,pelaser2die_Istrat
	s_set_speed		y,#66
	s_set_lifecnt		y,#10
	s_set_colltype		y,laser
	s_set_colltype		y,friend
	jsr			gen_weapon
.badobj	rtl


;*****************************************************************************
fire_playerbeam	; player's laser.
;	s_make_obj		#t_bool_6,.badobj
	s_make_obj		#playerbeam,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#playerbeamAP
	s_set_alptrs		y,pbeam_Istrat,pelasercollide_Istrat,playerbeamdie_Istrat
	s_set_speed		y,#66		40
	s_set_lifecnt		y,#10		18
	s_set_colltype		y,laser
	s_set_colltype		y,friend
	jsr			gen_weapon
.badobj	rtl

;*****************************************************************************
fire_friendElaser	; friend's laser.
	s_weapon_pos		#0,#0,#80     
	s_make_obj		#elaser2,.badobj
	s_set_aldata		y,#1,#elaserAP
	s_set_alptrs		y,relelaser_Istrat,weapcollide_Istrat,elaser2die_Istrat
	s_set_speed			y,#55+11
	s_set_lifecnt		y,#10
	s_set_colltype		y,laser
	s_set_colltype		y,friend
	jsr			gen_weapon
	jsl			lasersound_l
.badobj	rtl

;*****************************************************************************
fire_RebElaser		; rebound player's laser
	s_make_obj		#elaser2,.badobj
	s_set_aldata		y,#1,#enemylaserAP
	s_set_alptrs		y,relelaser_Istrat,weapcollide_Istrat,elaser2die_Istrat
	s_set_speed		y,#60
	s_set_lifecnt		y,#40
	s_set_colltype		y,enemyweap
	s_set_colltype		y,laser
	s_set_colltype		y,enemy1
	s_set_colltype		y,enemy2
	s_add_var		W,svar_weapZ,#80>>weapon_scale
	jsr			gen_weapon
	jsl			hitwallsound_l
.badobj	rtl



;*****************************************************************************
fire_relbeamball			; relative to player speed.
fire_plasma				; relative to player speed.
	s_make_obj		#bouncyball,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#plasmaAP
	s_set_alptrs		y,relflatmiss_Istrat,weapcollide_Istrat,remove_Istrat
	s_set_speed		y,#80
	s_set_lifecnt		y,#30+70
	s_set_colltype		y,laser
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
	jsl			enemybattrysound_l
.badobj	rtl


;*****************************************************************************
fire_beamball
	s_make_obj		#bouncyball,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#8
	s_set_alptrs		y,flatmiss_Istrat,weapcollide_Istrat,remove_Istrat
	s_set_speed		y,#70
	s_set_lifecnt		y,#30+70
	s_set_colltype		y,laser
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
	jsl			enemybattrysound_l
.badobj	rtl


;*****************************************************************************
fire_relovalbeam			; relative to player speed.
	s_make_obj		#ovalbeam,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#8
	s_set_alptrs		y,relflatmiss_Istrat,weapcollide_Istrat,remove_Istrat
	s_set_speed		y,#70
	s_set_lifecnt		y,#30+70
	s_set_colltype		y,laser
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
	jsl			enemybattrysound_l
.badobj	rtl


;*****************************************************************************
fire_relringlaser				; relative to player speed.
	s_make_obj		#ringlaser,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#6
	s_set_alptrs		y,relflatmiss_Istrat,weapcollide_Istrat,remove_Istrat
	s_set_speed		y,#70
	s_set_lifecnt		y,#30+70
	s_set_colltype		y,laser
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
	jsl			enemybattrysound_l
.badobj	rtl


;*****************************************************************************
fire_ovalbeam			
	s_make_obj		#ovalbeam,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#8
	s_set_alptrs		y,flatmiss_Istrat,weapcollide_Istrat,remove_Istrat
	s_set_speed		y,#70
	s_set_lifecnt		y,#30+70
	s_set_colltype		y,laser
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
	jsl			enemybattrysound_l
.badobj	rtl


;*****************************************************************************
fire_ringlaser				
	s_make_obj		#ringlaser,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#6
	s_set_alptrs		y,flatmiss_Istrat,weapcollide_Istrat,remove_Istrat
	s_set_speed		y,#70
	s_set_lifecnt		y,#30+70
	s_set_colltype		y,laser
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
	jsl			ringlasersound_l
.badobj	rtl


;*****************************************************************************
fire_shortplasma		; relative to player speed.
	s_make_obj		#bouncyball,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#plasmaAP
	s_set_alptrs		y,relflatmiss_Istrat,weapcollide_Istrat,remove_Istrat
	s_set_speed		y,#80
	s_set_lifecnt		y,#30
	s_set_colltype		y,laser
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
	jsl			enemybattrysound_l
.badobj	rtl

;*****************************************************************************
fire_Hplasma				; relative to player speed.
	s_make_obj		#bouncyball,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#HplasmaAP
	s_set_alptrs		y,homingflat_Istrat,weapcollide_Istrat,remove_Istrat
	s_set_speed		y,#60
	s_set_lifecnt		y,#50
	s_set_colltype		y,laser
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
	jsl			enemybattrysound_l
.badobj	rtl

;*****************************************************************************
fire_YHplasma				; relative to player speed.
	s_make_obj		#sparklas,.badobj
	s_sprite_obj		y,#0
	s_set_aldata		y,#1,#8
	s_set_alptrs		y,Yhoming_Istrat,weapcollide_Istrat,remove_Istrat
	s_set_speed		y,#100
	s_set_lifecnt		y,#50
	s_set_colltype		y,laser
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	s_setnoremove_behind	y
	jsr			gen_weapon
	jsl			enemybattrysound_l
.badobj	rtl

;*****************************************************************************
fire_relslowElaser 			; relative to player speed.
	s_make_obj		#elaser2a,.badobj
	s_set_aldata		y,#1,#enemylaserAP
	s_set_alptrs		y,relelaser_Istrat,weapcollide_Istrat,elaser2die_Istrat
	jsr			doelaserspeed
	s_set_lifecnt		y,#40
	s_set_colltype		y,enemyweap
	s_set_colltype		y,laser
	s_set_alsflag		y,relexplode
	s_add_var		W,svar_weapZ,#elaserfireZoff>>weapon_scale
	jsr			gen_weapon
	jsl			lasersound_l
	jsr			laserflash
.badobj	rtl
;*****************************************************************************
fire_relslowElaserHome 			; relative to player speed.
	s_make_obj		#elaser2a,.badobj
	s_set_aldata		y,#1,#enemylaserAP
	s_set_alptrs		y,relelaserhome_Istrat,weapcollide_Istrat,elaser2die_Istrat
	jsr			doelaserspeed
	s_set_lifecnt		y,#40
	s_set_colltype		y,enemyweap
	s_set_colltype		y,laser
	s_set_alsflag		y,relexplode
	s_add_var		W,svar_weapZ,#80>>weapon_scale
	jsr			gen_weapon
	jsl			lasersound_l
	jsr			laserflash
.badobj	rtl
;*****************************************************************************
fire_relfastElaser 			; relative to player speed.
	s_make_obj		#elaser2a,.badobj
	s_set_aldata		y,#1,#enemylaserAP
	s_set_alptrs		y,relelaser_Istrat,weapcollide_Istrat,elaser2die_Istrat
	s_set_speed		y,#90
	s_set_lifecnt		y,#40
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	s_set_colltype		y,laser
	s_add_var		W,svar_weapZ,#80>>weapon_scale
	jsr			gen_weapon
	jsl			lasersound_l
	jsr			laserflash
.badobj	rtl
;*****************************************************************************
fire_slowElaser 			
	s_make_obj		#elaser2a,.badobj
	s_set_aldata		y,#1,#enemylaserAP
	s_set_alptrs		y,elaser_Istrat,weapcollide_Istrat,elaser2die_Istrat
	s_set_speed		y,#60
	s_set_lifecnt		y,#40
	s_set_colltype		y,enemyweap
	s_set_colltype		y,laser
	s_add_var		W,svar_weapZ,#80>>weapon_scale
	jsr			gen_weapon
	jsl			lasersound_l
	jsr			laserflash
.badobj	rtl


;*****************************************************************************
fire_FakeFarHmissile1				; relative to player

;	s_make_obj		#amissile,.badobj
	s_make_obj		#missile,.badobj
	s_set_aldata		y,#hmissile1HP,#hmissile1AP
	s_set_alptrs		y,hmissile1_Istrat,weapcollide_Istrat,stopexplode_Istrat
	s_copy_alvar2alvar	W,y,al_ptr,x,al_ptr
	s_set_speed		y,#60
	s_set_lifecnt		y,#100
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	s_set_alsflag		y,sflag3
	s_init_anim	y,#0
	jsr			gen_weapon
	jsl			missilesound_l
.badobj	rtl

;*****************************************************************************
fire_Hmissile1				; relative to player
	s_make_obj		#missile,.badobj
	s_set_aldata		y,#hmissile1HP,#hmissile1AP
	s_set_alptrs		y,hmissile1_Istrat,weapcollide_Istrat,stopexplode_Istrat
	s_copy_alvar2alvar	W,y,al_ptr,x,al_ptr
	s_set_speed		y,#60
	s_set_lifecnt		y,#100
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
	jsl			missilesound_l
	phx
	phy
	tyx
	s_make_obj		#smoke,.badobj1
	s_copy_pos		y,x
	s_clr_alsflag		y,realobj
	s_set_strat		y,puff_Istrat
.badobj1	
	ply
	plx

.badobj	rtl


;*****************************************************************************
fire_Hmissile2				; move for short time then quick turn relative to player
	s_make_obj		#missile,.badobj
	s_set_aldata		y,#hmissile1HP,#hmissile1AP
	s_set_alptrs		y,hmissile2_Istrat,weapcollide_Istrat,stopexplode_Istrat
	s_copy_alvar2alvar	W,y,al_ptr,x,al_ptr
	s_set_speed		y,#60
	s_set_lifecnt		y,#100
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
	jsl			missilesound_l
.badobj	rtl

;*****************************************************************************
fire_bossHmissile1				; relative to player
	jsl	fire_hmissile1
	s_jmp_objptrbad		y,.bad
	s_set_expstrat	y,explodegate2_Istrat
.bad	s_rtl


;*****************************************************************************
fire_bossHmissile2				; relative to player
	jsl	fire_hmissile2
	s_jmp_objptrbad		y,.bad
	s_set_expstrat	y,explodegate2_Istrat
.bad	s_rtl
	
;*****************************************************************************
fire_kamiHmissile1				; relative to player
	s_make_obj		#zaco_9,.badobj
	s_set_aldata		y,#kamihmissile1HP,#kamihmissile1AP
	s_set_alptrs		y,hmissile3_Istrat,weapcollide_Istrat,explode_Istrat
	s_copy_alvar2alvar	W,y,al_ptr,x,al_ptr
	s_set_speed		y,#40
	s_set_lifecnt		y,#100
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
	jsl			missilesound_l
.badobj	rtl

;*****************************************************************************
fire_chickHmissile1				; relative to player
	s_make_obj		#c_miss,.badobj
	s_set_aldata		y,#hardHP,#hmissile1AP*5
	s_set_alptrs		y,chickhmissile1_Istrat,weapcollide_Istrat,explode_Istrat
	s_copy_alvar2alvar	W,y,al_ptr,x,al_ptr
	s_set_speed		y,#30
	s_set_lifecnt		y,#30
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
	jsl			missilesound_l
.badobj	rtl

;*****************************************************************************
fire_STBHmissile1				; relative to player
	s_make_obj		#missile,.badobj
	s_set_aldata		y,#hmissile1HP,#hmissile1AP
	s_set_alptrs		y,stbhmissile1_Istrat,weapcollide_Istrat,stopexplode_Istrat
	s_copy_alvar2alvar	W,y,al_ptr,x,al_ptr
	s_set_lifecnt		y,#100
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	s_set_colltype		y,enemy2
	jsr			gen_weapon
	jsl			missilesound_l
.badobj	rtl

;*****************************************************************************
fire_QHmissile1				; relative to player
	s_make_obj		#missile,.badobj
	s_set_aldata		y,#1,#50
	s_set_alptrs		y,Qhmissile1_Istrat,weapcollide_Istrat,stopexplode_Istrat
	s_copy_alvar2alvar	W,y,al_ptr,x,al_ptr
	s_set_speed		y,#60
	s_set_lifecnt		y,#100
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
	jsl			missilesound_l
.badobj	rtl



;*****************************************************************************
fire_missile2				
	s_make_obj		#missile,.badobj
	s_set_aldata		y,#missile2HP,#missile2AP
	s_set_alptrs		y,missile2_Istrat,weapcollide_Istrat,stopexplode_Istrat
	s_copy_alvar2alvar	W,y,al_ptr,x,al_ptr
	s_set_speed		y,#30
	s_set_lifecnt		y,#100
	s_set_colltype		y,enemyweap
	s_set_alsflag		y,relexplode
	jsr			gen_weapon
	jsl			missilesound_l
.badobj	rtl

;*****************************************************************************
fire_missile1				
	s_make_obj		#missile,.badobj
	s_set_aldata		y,#missile2HP,#missile2AP
	s_set_alptrs		y,missile1_Istrat,weapcollide_Istrat,stopexplode_Istrat
	s_copy_alvar2alvar	W,y,al_ptr,x,al_ptr
	s_set_speed		y,#30
	s_set_lifecnt		y,#100
	s_set_colltype		y,enemyweap
	jsr			gen_weapon
	jsl			missilesound_l
.badobj	rtl



;*****************************************************************************
fire_spread
	s_make_obj		#missile,.badobj
	s_set_aldata		y,#missile2HP,#missile2AP
	s_set_alptrs		y,spread_Istrat,weapcollide_Istrat,explode_Istrat
	s_set_speed		y,#40
	s_set_lifecnt		y,#50
	jsr			gen_weapon
.badobj	rtl


;*****************************************************************************
doelaserspeed

	s_set_speed		y,#48
	s_jmp_iflevel	1,.slow
	s_set_speed		y,#60
.slow	rts


;*****************************************************************************
gen_weapon
	s_set_alvar		B,y,al_type,#ATMISSILE
	s_set_alcollflag	y,WEAPON
	s_copy_rots		y,x
	s_set_alvar.w		B,y,al_rotz,#0

	s_add_Roffs2pos.w	B,y,x,x,svar_weapx,svar_weapy,svar_weapz,1,1,1,weapon_scale,weapon_scale,weapon_scale


	phx	
	
	ldx	svar_weapobj
	beq	.nrotobj
	a16
	lda	al_worldx,x
	sta	x2
	lda	al_worldy,x
	sta	y2
	lda	al_worldz,x
	sta	z2
	a8
	exg_xy
	jsl	Xanglexabs_l  
	clc
	adc	svar_weapRx
	sta	al_rotx,x
	jsl	Yanglexabs_l  
	nega
	clc
	adc	svar_weapRy
	sta	al_roty,x
	exg_xy
        	bra	.donerot
.nrotobj
	s_add_alvar		B,y,al_rotx,svar_weapRx
	s_add_alvar		B,y,al_roty,svar_weapRy
.donerot

	plx


	s_copy_alvar2alvar	B,y,al_sbyte1,y,al_rotx
	s_copy_alvar2alvar	B,y,al_sbyte2,y,al_roty


	s_copy_alvar2alvar	B,y,al_sbyte3,x,al_vel		; copy speed

	s_make_immune		


	rts




;*****************************************************************************
laserflash
	phx
	tyx
	
	s_set_objtobeplayer	y
	s_set_var		W,swvar_word1,#Sflash_0
	s_jmp_Zdistless		x,y,#bigSflashDist,.flashsize
	s_set_var		W,swvar_word1,#Mflash_0
	s_jmp_Zdistless		x,y,#bigMflashDist,.flashsize
	s_set_var		W,swvar_word1,#Lflash_0
.flashsize

	s_make_obj	swvar_word1,.badobj
	s_copy_pos	y,x
	s_set_alvar	B,y,al_roty,#deg180
	s_set_strat	y,flash_Istrat
.badobj	txy
	plx
	rts

flash_Istrat
	s_start_strat
	s_sprite_obj	x,#0
	s_set_alsflag	x,colldisable
	s_init_COLanim	x,#0
	s_set_strat	x,flash_strat
	s_add_playerZ	x
	s_end_strat	
flash_strat
	s_start_strat
	s_add_playerZ	x
	s_cmp_COLanim	x,#2
	s_beq		remove_Istrat
	s_add_COLanim	x,#1,#4
	s_end_strat

	




;*****************************************************************************

float256_srou_l
	jsr			flout_srou
	s_set_var2vartab	B,B,W,tpx,x1,sintab,-1
	s_set_var2vartab	B,B,W,tpy,x2,sintab,-1
	brl			float_cont

float128_srou_l
	jsr			flout_srou
	s_set_var2vartab	B,B,W,tpx,x1,sintab,-2
	s_set_var2vartab	B,B,W,tpy,x2,sintab,-2
	brl			float_cont

float64_srou_l
	jsr			flout_srou
	s_set_var2vartab	B,B,W,tpx,x1,sintab,-3
	s_set_var2vartab	B,B,W,tpy,x2,sintab,-3
	brl			float_cont

float32_srou_l
	jsr			flout_srou
	s_set_var2vartab	B,B,W,tpx,x1,sintab,-4
	s_set_var2vartab	B,B,W,tpy,x2,sintab,-4


float_cont
	s_add_alvar		W,x,al_worldx,tpx
	s_add_alvar		W,x,al_worldy,tpy
	s_rtl
flout_srou
	lda			floatvar1
	stx			x1
	clc
	adc			x1
	sta			x1

	lda			floatvar2
	stx			x2
	clc
	adc			x2
	sta			x2

	rts

	


;*****************************************************************************
Xflytopos_l
	a16
	lda			svar_word3
	sec
	sbc			al_worldx,x
	a8
	bmi			.dec
	inc			al_sbyte3,x	
	bra			.end
.dec
	dec			al_sbyte3,x	
.end

	s_limit_alvar		B,x,al_sbyte3,-10,10

	s_add_alvars		B,x,al_rotz,x,al_sbyte3
	s_limit_alvar		B,x,al_rotz,-deg45,deg45

	lda			al_sbyte3,x
	a16
	sexa
	clc
	adc			al_worldx,x
	sta			al_worldx,x
	a8

	s_achase_alvar		W,x,al_worldx,svar_word3,7

.stop
	rtl

;*****************************************************************************
yppos	equ	20


;---------------------------------------
printaw1_l
	phy
	phx
	php
	sta	tpa
	a8
	sprint	0,yppos-1
	lda	tpa+1
	jsl	printb_l
	sprint	2,yppos-1
	lda	tpa
	jsl	printb_l
	plp
	plx
	ply
	rtl
;---------------------------------------
printaw2_l
	phy
	phx
	php
	sta	tpa
	a8
	sprint	5,yppos-1
	lda	tpa+1
	jsl	printb_l
	sprint	7,yppos-1
	lda	tpa
	jsl	printb_l
	plp
	plx
	ply
	rtl
;---------------------------------------
printaw3_l
	phy
	phx
	php
	sta	tpa
	a8
	sprint	10,yppos-1
	lda	tpa+1
	jsl	printb_l
	sprint	12,yppos-1
	lda	tpa
	jsl	printb_l
	plp
	plx
	ply
	rtl
;---------------------------------------
printab1_l
	phy
	phx
	php
	sprint	0,yppos
	lda	tpa
	jsl	printb_l
	plp
	plx
	ply
	rtl
;---------------------------------------
printab2_l
	phy
	phx
	php
	sprint	3,yppos
	lda	tpa
	jsl	printb_l
	plp
	plx
	ply
	rtl

;---------------------------------------
printab3_l
	phy
	phx
	php
	sprint	6,yppos
	lda	tpa
	jsl	printb_l
	plp
	plx
	ply
	rtl

;---------------------------------------
printab4_l
	phy
	phx
	php
	sprint	9,yppos
	lda	tpa
	jsl	printb_l
	plp
	plx
	ply
	rtl

;---------------------------------------
printab5_l
	phy
	phx
	php
	sprint	12,yppos
	lda	tpa
	jsl	printb_l
	plp
	plx
	ply
	rtl


;-------------------------------------------------------------------------------
changeviewmode_l

	s_jmp_varNE	B,splayerflymode,#spfm_norm,.nnorm
;	s_set_var	W,outdist,#outviewdist
	s_set_var	W,viewdist,#outviewdist
;	s_set_strat	x,playerinspace_Istrat
.nnorm
	s_jmp_varNE	B,splayerflymode,#spfm_close,.nclose
;	s_set_var	W,outdist,#inviewdist
	s_set_var	W,viewdist,#inviewdist
;	s_set_strat	x,playerinspace_Istrat
.nclose
	s_jmp_varNE	B,splayerflymode,#spfm_toinside,.ntoinside
	jsl		set_playerintocock_l
.ntoinside

	s_jmp_varNE	B,splayerflymode,#spfm_tonorm,.ntonorm
	jsl		set_playeroutofcock_l
.ntonorm

;	s_jmp_varNE	B,splayerflymode,#spfm_inside,.ninside
;	jsl		set_playerintocock_l
;	s_set_var	W,outdist,#0
;	s_set_var	W,viewdist,#0
;	s_set_strat	x,playerinbigspace_Istrat
;
;.ninside

	rtl

;-------------------------------------------------------------------------------



;*****************************************************************************
viewfloattab
	dw	0

	dw	1
	dw	2
	dw	3
	dw	4,4
	dw	5,5
	dw	6,6,6
	dw	5,5
	dw	4,4
	dw	3
	dw	2
	dw	1

	dw	0

	dw	-1
	dw	-2
	dw	-3
	dw	-4,-4
	dw	-5,-5
	dw	-6,-6,-6
	dw	-5,-5
	dw	-4,-4
	dw	-3
	dw	-2
	dw	-1

viewfloattab_len	equ	*-viewfloattab



;*****************************************************************************
calcteamdamage_l

	a8
	lda	specialobjtotal
	clc
	adc	spectot
	sta	spectot
	lda	specials_dead
	clc
	adc	spectotdead
	sta	spectotdead


	a8
	lda	specialobjtotal
	sec
	sbc	specials_dead
	beq	.plok
	asl	a
	sta	tpa
	lda	planetdead
	clc
	adc	tpa
	cmp	#100
	bcc	.plok2
	lda	#100
.plok2	sta	planetdead
.plok
	rtl

	strats_end


;*****************************************************************************
calcbgscroll_l
	phy
	php
	i8
	

	a16
	lda		outvx
	asra
	asra
	asra
	asra
	asra
	asra
	sta	tpa
	asra
	clc
	adc	tpa
	nega

	ldy	nomaxbg2Yscroll
	bne	.nmin

	cmp	#232
	bmi	.nmax
	lda	#232
.nmax

	cmp	#-56
	bpl	.nmin
	lda	#-56
.nmin

	clc
	adc		bg2Yscroll
	and		#511
	sta		bg2scroll
	stz		lastrot

	lda		outvy
	sec
	sbc		player_turnrot
	asra	
	asra	
	asra	
	asra	
	asra
	clc
	adc		bg2Xscroll
	sta.l		m_scrollxoff
	a8

	plp
	ply
	rtl

;---------------------------------------------------
; hud wireframe animation colours

wirehud_cols
	db	8,7,6,5

;---------------------------------------------------

;***************************************************************************
gameoverinit_l

	a8i16
	phx
	lda	#waitmap>>16
	sta	mapbank
	ldx	#waitmap&7fffh
	stx	mapptr
	plx

	jsl	initgame_l
	jsl	playerstart_init_l
	jsl	set_playercred_l

	lda	#0
	sta.l	m_particlesON
	sta.l	m_particlesON+1

	lda	gameflags
	and	#~gf_playerdying
	sta	gameflags

	ldx	playpt
	a8i16
	s_make_obj		#gamesh,.nob
	s_set_strat		y,path_istrat
	s_set_path		y,gameover
	s_set_aldata	y,#255,#0
	s_copy_pos		y,x
	s_set_alvar		W,y,al_worldx,#-270
	s_add_alvar		W,y,al_worldy,#120
	s_add_alvar		W,y,al_worldz,#3400	;800
.nob
	s_make_obj		#oversh,.nober
	s_set_strat		y,path_istrat
	s_set_path		y,gameover
	s_set_aldata	y,#255,#0
	s_copy_pos		y,x
	s_set_alvar		W,y,al_worldx,#270
	s_add_alvar		W,y,al_worldy,#120
	s_add_alvar		W,y,al_worldz,#3400	;800
.nober

	a16
	ldx	#0
.lp	stz	pal0palette,x
	inx
	inx
	cpx	#32*7
	bne	.lp

	txy
	ldx	#0
.lp2	lda.l	gameoverpal,x
	sta.w	pal0palette,y
	iny
	iny
	inx
	inx
	cpx	#32
	bne	.lp2

	lda	#-1
	sta	dotsflag

	lda	#0
	sta.l	m_meters

endgameoverinit
	rtl

;-----------------------------------------------------------------



