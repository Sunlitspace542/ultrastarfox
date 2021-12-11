;***************************************************************************
;*                                                                         *
;*                               Star Fox                                 *
;*                              -----------                                *
;*                                                                         *
;*                           SuperNES version.                             *
;*                                                                         *
;*                                                                         *
;*                           Argonaut Software.      		      *	   
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   File: GASTRATS.ASM                                                     *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr: GILES' ALIEN STRATEGIES.                                        *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   Date: 16/4/92                                                         *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;* Author:								      *
;*                                                                         *
;*		Giles Goddard.      				      *	
;*                                                                         *
;***************************************************************************

	incpublics	gastrats.ext

	strats_start

;*****************************************************************************
nucleuslauncher_Istrat
	s_start_strat
	s_set_aldata		x,#hardHP,#nucleusLaunchAP
	s_set_alvar		W,x,al_sword2,#boss8_circ
	s_setnoremove_behind	x
	s_set_alvar2rnd		x,al_sbyte3,#5
	s_set_colltype		x,enemyweap
 

nucleuslauncher_init
	s_init_anim		x,#0
	s_set_alptrs		x,nucleuslauncher_strat,hitflash_Istrat,explode_Istrat
nucleuslauncher_strat
	s_start_strat
	s_set_objtobeplayer	y

;	s_jmp_ABSalvarMORE	B,x,al_sbyte2,#deg45,nuclaunch_cont
;	s_jmp_ABSalvarLESS	B,x,al_sbyte2,#deg22+deg11,nuclaunch_cont
;	s_jmp_outZdistrng	x,y,#250<<boss8_scale,#400<<boss8_scale,nuclaunch_cont
;	s_jmp_Xdistmore		x,y,#100<<boss8_scale,nuclaunch_cont

	s_jmp_objinfront	y,x,nuclaunch_cont			   
	s_jmp_ABSalvarLESS	W,x,al_worldx,#700,nuclaunch_cont
	s_jmp_ABSalvarMORE	W,x,al_worldx,#900,nuclaunch_cont
	s_jmp_Xdistmore		x,y,#200,nuclaunch_cont

	s_jmp_ifnotlevel	1,.dif
	phx
	a16
	lda	#zaco_9
	jsl	find_shape_l
	a8
	txy
	plx
	s_jmp_objptrbad		y,nucleuslauncherfire_init
	s_brl			nuclaunch_cont

.dif

	phx
	a16
	lda	#zaco_9
	jsl	count_shapes_l
	a8
	plx
	cmp	#2
	lbeq	nuclaunch_cont


nucleuslauncherfire_init
	s_decbne_alvar		B,x,al_sbyte3,nuclaunch_cont
	s_set_strat		x,nucleuslauncherfire_strat
nucleuslauncherfire_strat
	s_start_strat

;	s_jmp_notdelay		2,.nanim
;	s_brl			.anim

;	s_jmp_notdelay		1,.nanim
.anim	s_add_anim		x,#1,#4
.nanim	s_cmp_anim		x,#3
	s_bne			.nfire

	s_push_alvar		B,x,al_roty
	s_set_alvar		B,x,al_roty,#deg180
	s_weapon_rot		#0,#0
	s_weapon_pos		#0,#0,#0
	s_fire_weapon		x,KAMIHMISSILE1
	s_pull_alvar		B,x,al_roty
	s_set_alvar		W,y,al_ptr,playpt
	s_set_alsflag		y,sflag1
	s_brl			nucleuslauncherclose_init
.nfire

nuclaunch_cont
	s_jsl	nucleuswallrot_srou_l	
	s_copy_alvar2alvar	B,x,al_roty,x,al_sbyte2
	s_add_alvar		B,x,al_roty,#deg180
	s_jmp_varAND		B,gameflags,#gf_bossdead,explode_Istrat
	s_end_strat

nucleuslauncherclose_init
	s_set_strat		x,nucleuslauncherclose_strat
nucleuslauncherclose_strat
	s_start_strat

	s_set_alvar		B,x,al_sbyte3,#5

	s_add_anim		x,#-1,#4
.nanim 	s_cmp_anim		x,#0
	s_bne			nuclaunch_cont

	s_brl			nucleuslauncher_init



;*****************************************************************************
nucleuspillar_Istrat	
	s_start_strat
	s_set_alptrs	x,nucleuspillar_strat,0,0
	s_set_aldata	x,#hardHP,#hardAP
	s_set_alvar		W,x,al_sword2,#boss8_circ
	s_setnoremove_behind	x
	s_set_alsflag	x,colldisable
	s_set_colltype		x,enemyweap
nucleuspillar_strat	
              	s_start_strat

	s_set_alvar	W,x,al_worldy,#nucleusheight

	s_jsl	nucleuswallrot_srou_l	
	s_copy_alvar2alvar	B,x,al_roty,x,al_sbyte2

	s_end_strat

;*****************************************************************************
; al_sword2=dist , al_sbyte2=angle

nucleuswallrot_srou_l
	
	a16
	stz	x1
	lda	al_sword2,x
	sta	z1
	a8
	lda	al_sbyte2,x			
	jsl	rotate_16xz_l
	
	a16
	lda	x2
	sta	al_worldx,x


	lda	z2
	asl	a
	clc
	adc	#160<<boss8_scale
	clc
	adc	player_posz		pviewposz
	sta	al_worldz,x
	a8

;	a16
;	lda	player_posx
;	nega
;	xba
;	a8
;	sta	tpa

	s_add_alvar	B,x,al_sbyte2,gsvar_byte1
	s_rtl

	
;*****************************************************************************
; al_sword2=dist , al_sbyte2=angle

nucleuswallrot2_srou_l
	
	a16
	stz	x1
	lda	al_sword2,x
	sta	z1
	a8
	lda	al_sbyte2,x			
	jsl	rotate_16xz_l
	
	a16
	lda	x2
	sta	al_worldx,x


	lda	z2
	asl	a
	clc
	adc	#210<<boss8_scale
	clc
	adc	pviewposz
	sta	al_worldz,x
	a8

	s_add_alvar	B,x,al_sbyte2,gsvar_byte1
	s_rtl

	





;*****************************************************************************
walkright_Istrat
	s_start_strat
	s_set_lifecnt	x,#30
	s_set_strat	x,walkright_strat

walkright_strat
	s_start_strat
	s_add_alvar	W,x,al_worldx,#20
	s_add_alvar	W,x,al_worldz,#-1
	s_add_playerZ	x
	s_add_alvar	B,x,al_rotx,#10
	s_set_alvar	B,x,al_roty,#-deg90
	s_set_alvar2alvartab	B,B,W,x,al_worldy,x,al_sbyte1,sintab,-5
	a16
	lda		al_worldy,x
	bmi		.arse
	nega
.arse
	sta		al_worldy,x
	s_add_alvar	B,x,al_sbyte1,#1
	
	s_dec_lifecnt	x
	s_end_strat


;*****************************************************************************
spacetest_Istrat
	s_start_strat
	s_set_alvar	B,x,al_roty,#deg180
	s_set_alvar	B,x,al_rotz,#-deg90
	s_set_aldata	x,#hardHP,#1
	s_add_playerZ	x
	s_end_strat






;*****************************************************************************
ship2_Istrat	; intermediate entrance ship.
	s_start_strat
	s_set_alptrs	x,ship2_strat,0,0
	s_set_aldata	x,#hardHP,#ship2AP
	s_set_alvar	B,x,al_roty,#deg180
	s_set_colltype	x,enemy1
	s_set_alvar	W,x,al_vz,#-40
	s_and_var		B,gameflags,#~gf_stratdone1
	s_and_var		B,gameflags,#~gf_stratdone2
	s_set_alvar		B,x,al_sbyte1,#39
	s_set_altype		x,gnd
	set_sound2	x,#5
ship2_strat	
	s_start_strat
	s_set_objtobeplayer	y
	
	s_achase_alvar	W,x,al_worldx,#0,5
	s_achase_alvar	W,x,al_worldy,viewcy,4

	s_jmp_Xdistmore		x,y,#30<<2,.outrng
	s_jmp_Zdistless		x,y,#2000,ship2into_init	; 1500
	s_brl			ship2fire_cont
.outrng	
	s_jmp_Zdistless		x,y,#2000,ship2outside_init	; 2000

ship2fire_cont
;	s_jmp_ZdistLESS		x,y,#2500,.nfire
;	s_jmp_notdelay		6,.nfire,al1pt
;	s_make_obj		#zaco_7,.nfire
;	s_set_strat		y,szaco3_Istrat
;	s_copy_pos		y,x
;	s_set_objtobeplayer	y
;	s_OR_var		B,gameflags2,#gf2_stratflag1
;.nfire

ship2_cont
	s_add_vecs2pos	x
	s_add_playerZ	x
	s_end_strat


ship2outside_init
	s_set_strat		x,ship2outside_strat
	s_or_var		B,gameflags,#gf_stratdone2
ship2outside_strat
	s_start_strat
;	s_jmp_alvarEQ		B,x,al_vz,#-20,.maxsp
;	s_dec_alvar		W,x,al_vz
;.maxsp
	s_jmp_leftofview	x,.goleft
	s_jmp_alvarMORE		W,x,al_vx,#60,ship2_cont
	s_add_alvar		W,x,al_vx,#5
	s_brl			ship2_cont
.goleft	s_jmp_alvarLESS		W,x,al_vx,#-60,ship2_cont
	s_sub_alvar		W,x,al_vx,#5
	s_brl			ship2_cont


ship2into_init
	s_set_strat		x,ship2into_strat	
	s_or_var		B,pstratflags,#pstf_notdie
ship2into_strat	
	s_start_strat
	s_set_objtobeplayer	y

	s_jmp_varAND	B,pshipflags2,#psf2_playerHP0,ship2outside_init

	s_set_speed		y,#medpspeed
	s_set_var		W,pviewvelz,#medpspeed
	s_set_var		B,player_medspeed,#medpspeed
	s_set_var		B,player_tospeed,#medpspeed

	s_achase_alvar	W,x,al_worldx,#0,5
	s_achase_alvar	W,x,al_worldy,viewcy,4

	s_jmp_Zdistless		x,y,#300,.doneguide
;	s_beqdec_alvar		B,x,al_sbyte1,.doneguide
	s_set_alsflag		x,colldisable
	s_playerctrl		off
	s_achase_alvar.w	W,y,al_worldy,#space_viewCY,3
	s_achase_alvar.w	W,y,al_worldx,#0,3

;------------------------------------------------
	s_or_var		B,pstratflags,#pstf_inseq
	lda		splayerflymode
	cmp		#spfm_inside
	bne		.nin
	lda		#spfm_tonorm
	sta		splayerflymode
	phx
	jsl		changeviewmode_l
	plx
.nin
;------------------------------------------------


	s_brl			ship2_cont
.doneguide	
	s_set_strat		x,.doneguide
	s_or_var		B,gameflags,#gf_stratdone1
	s_playerctrl		on
	s_set_alvar		W,x,al_vz,#-40
	s_brl			ship2_cont




;*****************************************************************************
ship3_Istrat	; last big ship 
	s_start_strat
	s_set_alptrs	x,ship3_strat,0,0
	s_set_aldata	x,#ship3HP,#ship3AP
	s_set_alvar	B,x,al_roty,#deg180+deg11
	s_set_colltype	x,enemy1
	s_set_alvar		W,x,al_vy,#-40
	s_set_altype	x,gnd
	s_set_alsflag		x,colldisable
	s_set_alvar		B,x,al_rotz,#deg90
	set_sound2		x,#8
ship3_strat
	s_start_strat
	s_set_objtobeplayer	y

	s_achase_alvar		B,x,al_rotz,#0,6
	s_achase_alvar		B,x,al_roty,#deg180,6

	s_jmp_lower		x,#space_viewCY+800,.nsu
	s_jmp_alvarZero		W,x,al_vy,.nfire
	s_inc_alvar		W,x,al_vy
	s_brl			.nfire
.nsu

	s_or_var		B,pstratflags,#pstf_notdie

	s_jmp_notdelay		1,.nfire
	s_push_alvar		B,x,al_vel
	s_set_alvar		B,x,al_vel,#50
	s_set_objtobeplayer	y
	s_weapon_pos		#0,#(-30<<4)>>weapon_scale,#0
	s_weapon_rndrots2obj	y,7,7
	s_fire_weapon		x,relfastelaser
	s_set_lifecnt		y,#100
	s_set_speed		y,#120
	s_pull_alvar		B,x,al_vel

.nfire



	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#(200/2)<<4,ship3_cont
	s_set_strat		x,ship3a_strat
	s_brl			ship3_cont
ship3a_strat
	s_start_strat

	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#600,ship3_cont
	s_set_alsflag		x,colldisable
	s_and_var		B,pshipflags,#~psf_noctrl
	s_or_var		B,gameflags,#gf_stratdone1
	set_sound2		x,#0
	s_set_strat		x,ship3b_strat
	s_brl			ship3b_strat

ship3_cont
	s_jmp_varAND	B,pshipflags2,#psf2_playerHP0,ship3c_init
	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#(200)<<4,ship3b_strat	; 250
;	startbgm		$f1
	s_achase_alvar.w	W,y,al_worldy,#space_viewCY,3
	s_achase_alvar.w	W,y,al_worldx,#0,4
	s_or_var		B,pshipflags,#psf_noctrl

;------------------------------------------------
	s_or_var		B,pstratflags,#pstf_inseq
	lda		splayerflymode
	cmp		#spfm_inside
	bne		.nin
	lda		#spfm_tonorm
	sta		splayerflymode
	phx
	jsl		changeviewmode_l
	plx
.nin
;------------------------------------------------

ship3b_strat
	s_start_strat


	a16
	lda		pviewvelz
	nega
	sta		al_vz,x
	a8

	s_add_vecs2pos	x
	s_add_playerZ	x
	s_end_strat


ship3c_init
	s_set_strat	x,ship3c_strat
	s_set_vecs	x,#0,#-10,#30
ship3c_strat
	s_add_vecs2pos	x
	s_add_playerZ	x
	s_end_strat



;*****************************************************************************
core0_Istrat
	s_set_colltype	x,enemy1
	s_set_alvar		B,x,al_roty,#deg180
	s_set_aldata	x,#hardHP,#0
	s_set_strat		x,core0_strat
	s_AND_var	B,gasflags,#~gasf_flag1
core0_strat
	s_start_strat
	s_jmpNOT_varAND	B,gasflags,#gasf_flag1,.nf
	s_AND_var	B,gasflags,#~gasf_flag1
	s_set_alsflag	x,hitflash
.nf
	s_end_strat
core1_Istrat
	s_start_strat
	s_set_alptrs	x,core1_strat,core1col_Istrat,core1exp_Istrat
	s_set_aldata	x,#core1HP,#hardAP
	s_set_alvar	B,x,al_roty,#deg180
	s_and_var	B,gameflags,#~gf_stratdone1
	s_set_colltype	x,enemy1
	s_set_alsflag	x,nohitaffect
core1_strat
	s_start_strat
	s_set_objtobeplayer	y
	s_jmp_Zdistmore	x,y,#1000,.ndam
	s_clr_alsflag	x,nohitaffect
.ndam
	s_add_alvar	B,x,al_roty,#8	
	s_end_strat

core1exp_Istrat
	s_start_strat
	jsl	makeLexpobj_srou
	s_set_alsflag	y,noexpsnd
	s_add_alvar	W,y,al_worldy,#-60
	s_set_expstrat	x,core1exp_strat
	s_or_var	B,gameflags,#gf_stratdone1
	s_set_alsflag	x,invisible
	s_set_lifecnt	x,#20
	s_setnoremove_behind	x
	trigse		$70
core1exp_strat
	s_start_strat
	s_set_objtobeplayer	y
	s_copy_pos		x,y
	jsl	shrapnel_srou_l		
	s_add_playerZ	x
	s_jmp_varAND	B,pshipflags3,#psf3_intunnel,.istun
	s_dec_lifecnt	x
.istun	s_end_strat


core1col_Istrat
	s_start_strat
	s_or_var	B,gasflags,#gasf_flag1
	s_jmp		hitflash_Istrat


;*****************************************************************************
ship1a_Istrat		; move slow to player and shoot.
	s_start_strat
	s_set_alptrs	x,ship1a_strat,ship1col_Istrat,ship1aexp_Istrat
	s_set_aldata	x,#ship1HP,#ship1AP
	s_gen_3dvecs	x,al_roty,al_rotx,al_vel
	s_set_colltype	x,enemy1	
	set_sound2	x,#8
ship1a_strat
	s_start_strat

	s_add_alvar		W,x,al_worldy,#-1

	s_set_objtobeplayer	y
	s_jmp_objinfront	y,x,.nfire

;	s_jmp_outZdistrng	x,y,#2000,#4000,.nfire
;	s_jmp_notdelay		5,.nfire1,al1pt
;	s_make_obj		#shark,.nfire1
;	s_set_strat		y,shark_Istrat
;	s_set_alvar		B,y,al_rotx,#deg90
;	s_copy_pos		y,x
;	s_add_alvar		W,y,al_worldy,#30<<3
;	s_set_speed		y,#50
;.nfire1


	s_jmp_alvarNOTZERO		B,x,al_hp,.nsmk
	s_jmp_alsflag	x,sflag1,.nsnd
	s_set_alsflag	x,sflag1
	trigse		$21
.nsnd
	s_jmp_notdelay		1,.nsmk
	s_jsl			makeLexpobj_srou
	s_jsl			addrnd2posy_srou
	s_set_alsflag		y,nopolyexp
	s_make_smoke		3,.nfire
	s_set_alvar		W,y,al_shape,#FOLsmoke
	s_brl			.nfire
.nsmk
	s_jmp_alvarMORE	B,x,al_hp,#ship1HP/2,.norm
	s_jmp_notdelay		4,.nfire,al1pt
	s_brl			.fire
.norm
	s_jmp_notdelay		2,.nfire,al1pt
.fire	s_weapon_pos		#0,#0,#0
	s_set_objtobeplayer	y
	s_set_var2rnd		svar_byte1,#7
	s_sub_var		B,svar_byte1,#3
	s_set_var2rnd		svar_byte2,#7
	s_sub_var		B,svar_byte2,#3
	s_weapon_rots2obj	y,svar_byte1,svar_byte2
	s_fire_weapon		x,RELSLOWELASER
.nfire

ship1a_cont
	s_add_playerZ	x
	s_add_vecs2pos	x	


;	s_damagesmoke		x,#ship1HP/2,3,#0,#-30,#0,3

	s_end_strat

ship1aexp_Istrat
	s_start_strat
	s_set_alsflag	x,nohitaffect
	s_jmpto_strat

ship1col_Istrat
	s_start_strat
	s_jmpNOT_alvarAND	B,x,al_hitflags,#HF2,.ncol
	phx
	s_set_objtobealvar	y,x,al_collobjptr
	tyx
	s_jsl			makeLexpobj_srou
	s_set_alsflag		y,nopolyexp
	plx
	s_set_alvar		B,x,al_hitflags,#0
	trigse		$24
	s_jmp			hitflash_Istrat
.ncol
	s_set_alvar		B,x,al_hitflags,#0
	s_clr_alsflag		x,collide
	s_jmpto_strat		x



;*****************************************************************************
ship1_Istrat			; come from behind and turn off downwards.
	s_start_strat
	s_set_alptrs	x,ship1_strat,ship1col_Istrat,explode_Istrat
	s_set_aldata	x,#ship1HP,#ship1AP
	s_set_speed	x,#10
	s_set_lifecnt	x,#100
ship1_strat
	s_start_strat

	s_gen_3dvecs	x,al_roty,al_rotx,al_vel
	s_add_playerZ	x
	s_add_vecs2pos	x	


	s_set_objtobeplayer	y
	s_jmp_Zdistless		x,y,#1000,.dr


	s_dec_lifecnt		x
	s_speedto		x,#60,1

	s_jmp_Zdistless		x,y,#1500,.dr

	s_jmp_alvarmore	B,x,al_rotx,#deg45/3,.nu
	s_add_alvar	B,x,al_rotx,#1
.nu
	s_jmp_alvareq	B,x,al_sbyte1,#1,.nr
	s_jmp_alvarne	B,x,al_sbyte1,#2,.dr
	s_add_alvar	B,x,al_roty,#1
	s_bra		.dr
.nr
	s_sub_alvar	B,x,al_roty,#1
	


.dr

	s_end_strat


;*****************************************************************************
friend1_Istrat
	s_start_strat
	s_set_alptrs	x,friend1_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata	x,#friendHP,#friendAP
	s_set_colltype	x,friend
	s_setnoremove_behind	x
	s_set_alsflag	x,shadow

	s_end_strat
friend1_strat
	s_start_strat
	s_set_objtobeplayer	y
	
	s_copy_alvar2alvar.w	W,x,al_worldz,y,al_worldz
	s_add_alvar		W,x,al_worldz,#200

	s_copy_alvar2var.w	W,y,svar_word1,al_worldy
	s_add_var		W,svar_word1,#-30
	s_achase_alvar		W,x,al_worldy,svar_word1,4

	s_achase_alvar2alvar.w		W,x,al_worldx,y,al_worldx,3
	s_copy_vecs		x,y


	s_achase_alvar2alvar.w		B,x,al_rotx,y,al_rotx,3
	s_achase_alvar2alvar.w		B,x,al_roty,y,al_roty,3
	s_achase_alvar2alvar.w		B,x,al_rotz,y,al_rotz,3
	

	s_jmpNOT_alsflag	y,sflag3,.nfire
	s_weapon_pos		#0,#0,#80
	s_weapon_rot		#0,#0
	s_fire_weapon		x,ELASER
.nfire

	s_end_strat


;*****************************************************************************
friend2_Istrat
	s_start_strat
	s_set_alptrs	x,friend2_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata	x,#hardHP,#friendAP
	s_set_colltype	x,friend
	s_setnoremove_behind	x
	s_set_alsflag	x,shadow


	s_end_strat
friend2_strat
	s_start_strat


	s_gen_3dvecs		x,al_roty,al_rotx,al_vel
	s_add_vecs2pos		x
	s_jmp_higher		x,#-30,.ok
	s_set_alvar		W,x,al_worldy,#-30
.ok


	s_set_objtobeplayer	y
	s_copy_alvar2alvar	B,x,al_vel,y,al_vel

;	s_copy_vecs		x,y 

	s_copy_alvar2alvar.w	W,x,al_worldz,y,al_worldz
	s_add_alvar		W,x,al_worldz,#200

	s_jmp_alvarZERO		W,x,al_sword1,.dofind
	s_set_objtobealvar	y,x,al_sword1
	s_jmp_Zdistless		x,y,#400,.dofind2
	s_jmp_alvarNOTZERO.w	B,y,al_HP,.skipfind
.dofind2	s_set_alvar		W,x,al_sword1,#0

.dofind	s_set_find		0
.find	
	s_find_radiusobj	y,x,#0,#500,#20000,.nofind
	
	s_jmp_alsflag		y,lockon,.find
	s_jmpNOT_colltype	y,Zenemy,.find
	a16
	lda.w			al_worldx,y
	sec
	sbc			player_posx
	bpl			.nneg
	nega
.nneg
	sta			tpa
	
	lda.w			al_worldz,y
	sec
	sbc			player_posz
	lbmi			.find	

	cmp			tpa
	a8
	lbmi			.find	

	s_set_alvartobeobj	x,al_sword1,y
	s_set_alsflag		y,lockon


.skipfind
	s_jmp_notdelay		2,.found
	s_weapon_pos		#0,#0,#80
	s_weapon_rot		#0,#0
	phy
	s_fire_weapon		x,ELASER
	ply
	s_brl			.found
.nofind
	
	s_achase_alvar		B,x,al_roty,#0,5
	s_achase_alvar		B,x,al_rotx,#0,5

	s_achase_alvar		W,x,al_worldx,player_posx,5
	s_achase_alvar		W,x,al_worldy,player_posy,5


	s_brl			.cont

.found
	s_set_alsflag		y,hitflash
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,3


.cont

	LDA	AL_ROTY,X
	ASL	A
	ASL	A
	STA	AL_ROTZ,X
	


	s_end_strat


	

;*****************************************************************************
fzaco_Istrat	
	s_start_strat
	s_set_alptrs		x,Fzaco_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata		x,#FzacoHP,#FzacoAP
	s_setnoremove_behind	x
	s_set_speed		x,#50
	s_set_alvar		B,x,al_roty,#deg22
	s_set_alvar		B,x,al_rotx,#-deg5
	s_add_alvar		W,x,al_worldx,player_posx
	s_add_alvar		W,x,al_worldy,player_posy
	s_set_colltype		x,enemyweap
	s_end_strat

fzaco_strat
	s_start_strat
	s_speedto		x,#0,1,fzaco2_init
	s_brl			fzaco_cont

fzaco2_init
	s_set_strat		x,fzaco2_strat
	s_set_alvar		B,x,al_sbyte2,#60
fzaco2_strat
	s_start_strat
	s_set_objtobeplayer	y
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,3

	s_jmpNOT_objpointnegZ	x,.nfire
	s_jmp_notdelay		4,.nfire,al1pt
	s_weapon_pos		#0,#0,#0
	s_weapon_rot		#0,#0
	s_fire_weapon		x,RELSLOWELASER	
.nfire
	s_beqdec_alvar		B,x,al_sbyte2,fzaco3_init
	s_brl			fzaco_cont
fzaco3_init
	s_set_strat		x,fzaco3_strat	
	s_setremove_behind	x
fzaco3_strat
	s_speedto		x,#50,1

	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#500,.nrot
	s_sub_alvar		B,x,al_rotx,#1
	s_sub_alvar		B,x,al_roty,#1
.nrot
fzaco_cont
	s_set_var2alvartab	B,B,W,tpx,x,al_sbyte1,sintab,-3
	s_set_var2alvartab	B,B,W,tpy,x,al_sbyte1,costab,-3
	s_add_alvar		W,x,al_worldx,tpx
	s_add_alvar		W,x,al_worldy,tpy

	s_add_alvar		B,x,al_sbyte1,#6

fzaco_cont2
	s_gen_3dvecs		x,al_roty,al_rotx,al_vel
	s_add_vecs2pos		x

	s_add_playerZ		x
	s_end_strat


	printroulen		fzaco_Istrat,<Friend Zaco>
			

;*****************************************************************************
friend0_Istrat	
	s_start_strat
	s_set_alptrs		x,friend0_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata		x,#FzacoHP,#FzacoAP
	s_setnoremove_behind	x
	s_set_speed		x,#60
	s_set_alvar		B,x,al_roty,#deg22
	s_set_alvar		B,x,al_rotx,#deg11
	s_add_alvar		W,x,al_worldx,player_posx
	s_add_alvar		W,x,al_worldy,player_posy
	s_set_colltype		x,enemyweap
;	set_sound1		x,#$c8
	s_end_strat

friend0_strat
	s_start_strat
	s_speedto		x,#30,1,friend02_init
	s_brl			friend0_cont
friend02_init
	s_set_strat		x,friend02_strat
friend02_strat
	s_start_strat
	s_set_find		0
.find	s_find_obj		y,x,#zaco_5,.nfind
	
;	s_achase_alvar2alvar	W,x,al_worldx,y,al_worldx,4
;	s_copy_alvar2var.w	W,y,svar_word1,al_worldy
;	s_add_var		W,svar_word1,#200
;	s_achase_alvar		W,x,al_worldy,svar_word1,4
	

	s_obj2obj_3dangle	x,y,al_roty,al_rotx,4

.nfind
	s_set_objtobeplayer	y
	s_copy_alvar2var.w	W,y,svar_word1,al_worldz
	s_add_var		W,svar_word1,#200
	s_achase_alvar		W,x,al_worldz,svar_word1,4




friend0_cont
	s_gen_3dvecs		x,al_roty,al_rotx,al_vel
	s_add_vecs2pos		x
	s_end_strat


	printroulen		friend0_Istrat,<Friend 0>
			



;*****************************************************************************
zacos_Istrat	; formation flying.
	s_start_strat
	s_set_alptrs	x,zacos_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata	x,#zacosHP,#zacosAP
	s_set_speed	x,#40	
	s_set_alvar	B,x,al_rotx,#deg90
	s_set_alvar	B,x,al_roty,#deg180
	s_add_alvar	W,x,al_worldx,player_posx
	s_set_alsflag	x,shadow
	s_set_colltype		x,Zenemy
	set_sound2	x,#$f

zacos_strat
	s_start_strat

	s_set_var	W,svar_word1,player_posy
	s_sub_var	W,svar_word1,#800

	s_jmp_higher	x,svar_word1,.nup
	s_jmp_alvarZERO	B,x,al_rotx,zacos2_init
	s_add_alvar		B,x,al_rotx,#-2
.nup


zacos_cont
	s_gen_3dvecs	x,al_roty,al_rotx,al_vel
	s_add_vecs2pos	x
	s_add_playerZ	x
	s_end_strat
	
;-------------------------------------------------------------

zacos2_init
	s_set_strat	x,zacos2_strat
	s_weapon_rot	#0,#0
	s_weapon_pos	#0,#0,#40>>weapon_scale
	s_fire_weapon	x,RELSLOWELASER
zacos2_strat
	s_start_strat
	s_set_objtobeplayer	y
	s_jmp_Zdistless		x,y,#2000,zacos3_init
	s_brl	zacos_cont


;-------------------------------------------------------------

zacos3_init
	s_set_strat	x,zacos3_strat
	s_add_alvar		B,x,al_rotx,#-4
zacos3_strat
	s_start_strat


	s_add_alvar		B,x,al_rotx,#-4
	s_beq			.fire
	s_jmp_alvarmi		B,x,al_rotx,.nfire
	s_jmp_alvarless		B,x,al_rotx,#-deg90,.nfire
	s_jmp_notdelay		2,.nfire
.fire	s_weapon_rot	#0,#0
	s_weapon_pos	#0,#0,#40>>weapon_scale
	s_fire_weapon	x,RELSLOWELASER
.nfire
	s_jmp_alvarEQ		B,x,al_rotx,#-4,zacos4_init

	s_brl	zacos_cont

;-------------------------------------------------------------
zacos4_init
	s_set_strat	x,zacos4_strat
zacos4_strat
	s_start_strat
	
	s_speedto	x,#60,1
	s_banktoplayer	

	s_brl	zacos_cont

;-------------------------------------------------------------




;*****************************************************************************
door1_Istrat
	s_start_strat
	s_set_aldata	x,#hardHP,#door1AP
	s_init_anim	x,#0
	s_set_alvar	B,x,al_roty,#deg180


door1openwait_init
	s_set_strat	x,door1openwait_strat
	s_clr_alsflag	x,colldisable
	s_end_strat
door1openwait_strat
	s_start_strat

	s_doorclose_snd	9	

	s_cmp_anim	x,#0
	s_beq		.nanim
	s_add_anim	x,#-1,#10
.nanim

	s_set_objtobeplayer	y
	s_jmp_Zdistless		x,y,#500,door1closewait_init

	s_set_find		0
.find	s_find_radiusobj	y,x,#0,#0,#500,.end
     	s_jmp_alvarNOTZERO	B,y,al_vel,door1closewait_init
	s_brl			.find
.end	s_end_strat

door1closewait_init
	s_set_strat		x,door1closewait_strat
	s_set_alsflag		x,colldisable
	s_end_strat
door1closewait_strat
	s_start_strat

	s_doorclose_snd	1	

	s_cmp_anim	x,#9
	s_beq		.nanim
	s_add_anim	x,#1,#10
.nanim

	s_set_objtobeplayer	y
	s_jmp_Zdistless		x,y,#500,.end

	s_set_find		0
.find	s_find_radiusobj	y,x,#0,#0,#500,door1openwait_init
     	s_jmp_alvarZERO		B,y,al_vel,.find
.end
	s_end_strat


;*****************************************************************************
zaco2_Istrat	; fly straight for a while then dash towards player and circle.
	s_start_strat
	s_set_aldata	x,#zaco2HP,#zaco2AP
	s_set_speed	x,#50
	s_gen_3dvecs	x,al_roty,al_rotx,al_vel
	s_set_alvar	B,x,al_sbyte1,#15
	s_set_colltype	x,enemyweap
	s_set_colltype	x,enemy1
	s_set_colltype	x,Zenemy
	s_setnoremove_behind	x
	set_sound2	x,#$f
	s_set_alvar	B,x,al_sbyte2,#3	; loop 2 times
zaco2_init
	s_set_alptrs	x,zaco2_strat,hitflash_Istrat,explode_Istrat
zaco2_strat
	s_start_strat
	s_beqdec_alvar	B,x,al_sbyte1,.toplayer
	s_brl		zaco2_cont
.toplayer
	s_set_objtobeplayer	y
	s_jmp_Zdistless	x,y,#500,zaco2loop_init
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,3

zaco2_cont
	s_jmp_varAND	B,bossflags,#bf_dying,kill_Istrat
	s_gen_3dvecs	x,al_roty,al_rotx,al_vel
	s_add_vecs2pos	x
	s_jmp_higher	x,#0,.ngnd
	s_set_alvar	W,x,al_worldy,#0
	s_neg_alvar	B,x,al_rotx
.ngnd	s_add_playerZ	x
	s_end_strat

zaco2loop_init
	s_beqdec_alvar		B,x,al_sbyte2,zaco2dash_init
	s_set_strat	x,zaco2loop_strat
	s_set_alvar	B,x,al_sbyte1,#deg180/4
	s_jmp_iflevel		1,.nfire
	s_push_alvar	B,x,al_vel
	s_set_alvar	B,x,al_vel,#0
	s_weapon_pos	#0,#0,#0
	s_weapon_rot	#0,#0
	s_fire_weapon	x,HMISSILE1
	s_set_alvar	W,y,al_ptr,playpt
	s_pull_alvar	B,x,al_vel
.nfire
zaco2loop_strat
	s_start_strat
	s_beqdec_alvar		B,x,al_sbyte1,.cont

	s_jmp_rightofview	x,.tright
	s_sub_alvar		B,x,al_rotz,#10
	s_sub_alvar		B,x,al_roty,#4
	s_brl			zaco2_cont
.tright
	s_add_alvar		B,x,al_rotz,#10
	s_add_alvar		B,x,al_roty,#4
	s_brl			zaco2_cont

.cont
	
	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#2000,zaco2_init

	s_brl		zaco2_cont


zaco2dash_init
	s_set_strat	x,zaco2dash_strat
	s_set_lifecnt	x,#30
zaco2dash_strat
	s_start_strat
	s_dec_lifecnt	x,1
	s_brl		zaco2_cont


;*****************************************************************************
;*****************************************************************************
tower0_Istrat
	s_start_strat
;	s_set_alvar	W,x,al_depthoffset,#256
	s_set_aldata	x,#hardHP,#hardAP/2
	s_set_strat	x,tower0_strat
	s_end_strat
	
tower0_strat
	s_start_strat
	s_add_alvar		B,x,al_roty,#8
	s_end_strat


;*****************************************************************************
rader1_Istrat
	s_start_strat
	s_set_colltype	x,enemy1
	s_jmp		hard_Istrat
rader0_Istrat
	s_start_strat
	s_set_alptrs	x,rader0_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata	x,#raderHP,#raderAP
	s_set_colltype	x,enemy1
	s_set_colltype		x,Zenemy
rader0_strat
	s_start_strat
	s_add_alvar	B,x,al_roty,#8
	s_end_strat
	

;*****************************************************************************
; butterfly type, fly to distance and fly twisting to player.


zaco1L_Istrat	
	s_start_strat
	s_set_alvar	W,x,al_sword1,#1000
	s_set_alvar	B,x,al_sbyte2,#6
	s_brl		zaco1_Icont
zaco1R_Istrat	
	s_start_strat
	s_set_alvar	W,x,al_sword1,#-1000
	s_set_alvar	B,x,al_sbyte2,#-6

zaco1_Icont
	s_set_alsflag	x,shadow
	s_add_alvar	W,x,al_worldx,player_posx
	s_add_alvar	W,x,al_sword1,player_posx
	s_set_alptrs	x,zaco1_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata	x,#zaco1HP,#zaco1AP
	s_set_speed	x,#60
	s_setnoremove_behind	x
	s_set_objtobeplayer	y
	s_set_colltype	x,enemy2
	s_set_colltype	x,enemyweap
	s_set_colltype		x,Zenemy
	s_copy_alvar2var	W,x,svar_word1,al_sword1
	s_set_alvar		W,x,al_sWPx1,svar_word1
	set_sound2	x,#3

zaco1_strat	
	s_start_strat
	s_set_alvar		W,x,al_sWPz1,#1500
	s_add_alvar		W,x,al_sWPz1,player_posz
          	s_obj2WP_angle		x,x,1,al_roty,al_rotx,3

	s_set_objtobeplayer	y
	s_jmp_Zdistmore	x,y,#1000,zaco1a_init	

zaco1_cont
	s_gen_3dvecs	x,al_roty,al_rotx,al_vel
	s_jmp_higher	x,#0,.hok
	s_set_alvar	W,x,al_worldy,#0
.hok
	s_add_alvars	W,x,al_worldy,x,al_sword2
	s_add_alvars	W,x,al_worldx,x,al_ptr
	s_add_vecs2pos	x	
	s_add_playerZ	x
	s_end_strat
zaco1a_init
	s_set_strat	x,zaco1a_strat
	s_setremove_behind	x
zaco1a_strat
	s_start_strat
	s_Achase_alvar		B,x,al_roty,#deg0,3,zaco1b_init
	s_add_alvar		B,x,al_rotx,#-1
     	s_brl			zaco1_cont
zaco1b_init				       
	s_set_strat	x,zaco1b_strat

zaco1b_strat
	s_start_strat

	s_set_objtobeplayer	y
	s_jmp_Zdistless		x,y,#1400,.circ
	s_jmp_Zdistmore		x,y,#1800,.nocirc
	s_jmp_notdelay		2,.nocirc
	s_weapon_pos		#0,#0,#0
;	s_set_var2rnd		svar_byte1,#3
;	s_sub_var		B,svar_byte1,#2
;	s_weapon_rots2obj	y,svar_byte1,#0
	s_weapon_rots2obj	y
	s_fire_weapon		x,RELSLOWELASERHOME	
       	s_brl			.nocirc

.circ
	s_speedto		x,#45,1
	s_copy_alvar2alvar	B,x,al_sbyte1,x,al_rotz
	s_sub_alvar		B,x,al_sbyte1,#deg90
	s_set_alvar2alvartab	B,B,W,x,al_sword2,x,al_sbyte1,sintab,-3
	s_set_alvar2alvartab	B,B,W,x,al_ptr,x,al_sbyte1,costab,-2
	s_add_alvars		B,x,al_rotz,x,al_sbyte2
.nocirc


	s_jmp_Zdistless		x,y,#700,.nfpl
          	s_obj2obj_3dangle	x,y,al_roty,al_rotx,3
     	s_brl			zaco1_cont
.nfpl
;
;	s_add_alvar		B,x,al_rotx,#-1
;	s_set_objtobeplayer	y
;	s_cmp_alvars		W,x,al_worldx,y,al_worldx
;	s_bmi			.right
;	s_add_alvar		B,x,al_roty,#-1
;     	s_brl			zaco1_cont2
;.right
; 	s_add_alvar		B,x,al_roty,#1
     	s_brl			zaco1_cont


;*****************************************************************************
houdaiNS_Istrat	; NOT shoot plasma at zaco1 & zaco3
	s_start_strat
	s_set_alptrs	x,0,hitflash_Istrat,smarkexplode_Istrat
	s_set_aldata	x,#houdaiHP,#houdaiAP
	s_set_colltype	x,enemy1
	s_end_strat


houdai_Istrat	; shoot plasma at zaco1 & zaco3
	s_start_strat
	s_set_alptrs	x,houdai_strat,hitflash_Istrat,smarkexplode_Istrat
	s_set_aldata	x,#houdaiHP,#houdaiAP
	s_set_colltype	x,enemy1
houdai_strat

	s_start_strat
	s_set_find	0
.fobj	
	s_find_nearobj	y,x,#0,#0,#2000,.nfind
	s_jmpNOT_colltype	y,enemy2,.fobj
	s_set_alvartobeobj	x,al_sword1,y
.nfind
	s_set_objtobealvar	y,x,al_sword1
	s_chk_objptr		y,.badobj
	s_jmp_Zdistless	x,y,#200,.nfindobj
	s_obj2obj_angle		x,y,al_roty,1
.badobj
	s_set_objtobeplayer	y
	s_jmp_distless		x,y,#800,.nfindobj
	s_jmp_notdelay	4,.nfindobj,al1pt
	s_weapon_pos	#0,#-62>>weapon_scale,#40>>weapon_scale
	s_weapon_rot	#-deg22,#0
	s_fire_weapon	x,SHORTPLASMA	
.nfindobj	
	s_end_strat


;*****************************************************************************

misstankexp_Istrat
	s_start_strat
	s_jmp_alsflag		x,sflag1,.nmiss
	s_set_objtobealvar	y,x,al_ptr
	s_kill_obj		y
.nmiss
	s_jmp			smarkexplode_Istrat

misstank_Istrat
          	s_start_strat	
	set_sound2	x,#$9
	s_set_alptrs	x,misstank_strat,hitflash_Istrat,misstankexp_Istrat
	s_set_aldata	x,#misstankHP,#misstankAP
	s_make_obj	#small_m,.badobj
	s_set_alvartobeobj	x,al_ptr,y
	s_set_alvar		B,y,al_rotx,#-deg11
	s_set_colltype		y,enemy1
	s_set_colltype		x,Zenemy
	s_set_alptrs	y,0,hitflash_Istrat,explode_Istrat
	s_set_aldata	y,#4,#4
.badobj
	s_set_colltype		x,enemy1
	s_set_speed		x,#30
	s_set_alvar		B,x,al_sbyte1,#20
misstank_strat
	s_start_strat

	s_beqdec_alvar		B,x,al_sbyte1,.facepl
	s_brl			.nfacepl
.facepl
	s_achase_alvar		B,x,al_roty,#deg180,3
	s_add_playerZ	x
.nfacepl

	s_jmp_alsflag		x,sflag1,.nmiss
	s_set_objtobealvar	y,x,al_ptr
	s_copy_alvar2alvar	B,y,al_roty,x,al_roty
	s_copy_pos		y,x
	s_add_alvar		W,y,al_worldy,#-(65+20)


	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#1000,.notgo
	s_set_objtobealvar	y,x,al_ptr
	s_set_strat	y,woodsgo_strat
	s_set_alvar		B,y,al_sbyte2,#40
	s_set_speed		y,#60
;	s_jsl			makeMEDexpobj_srou
	s_set_alsflag		x,sflag1
.notgo
.nmiss

	s_gen_vecs	x,al_roty,al_vel
	s_add_vecs2pos	x
	s_end_strat

missgo_Istrat
	s_start_strat
	s_end_strat


;*****************************************************************************
woods_Istrat
	s_start_strat
	s_set_alptrs	x,woods_strat,hitflash_Istrat,woodsexp_Istrat
	s_set_aldata	x,#woodsHP,#woodsAP
	s_set_colltype		x,Zenemy
woods_strat
	s_start_strat
	s_set_objtobeplayer	y
	s_jmp_Zdistless		x,y,#2100,woodsgo_init
	s_end_strat

woodsgo_init
	s_set_strat		x,woodsgo_strat
	s_set_expstrat		x,stopexplode_Istrat
	s_jsl			makeMEDexpobj_srou
	s_set_alvar		B,x,al_sbyte1,#10
	set_sound2		x,#$2
	s_end_strat
woodsgo_strat
	s_start_strat
	s_jmp_notdelay		2,.nsm,al1pt
	s_jsl			makesmoke_srou_l
	a16
	lda		al_vx,x
	nega
	sta.w		al_vx,y
	lda		al_vy,x
	nega
	sta.w		al_vy,y
	lda		al_vz,x
	nega
	asl	a
	asl	a
	sta.w		al_vz,y
	a8
.nsm
	s_set_objtobeplayer	y
	s_add_alvar		B,x,al_rotz,#8
	s_speedto		x,#80,1
	s_gen_3dvecs		x,al_roty,al_rotx,al_vel
	s_add_vecs2pos		x
	s_add_playerZ		x
	s_jmp_Zdistless		x,y,#400,.nfire
	s_decbne_alvar		B,x,al_sbyte1,.nfire
	s_set_alvar		B,x,al_sbyte1,#1
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,2
.nfire
	s_end_strat


woodsexp_Istrat
	s_start_strat
	s_set_objtobealvar	y,x,al_ptr
	s_remove_obj		y
	s_jmp			smarkexplode_Istrat



;*****************************************************************************
cameleon2_Istrat
	s_start_strat
	s_set_alptrs	x,cameleon2_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata	x,#cameleonHP,#cameleonAP
	s_set_colltype		x,Zenemy
	s_brl		cam2nextpos
cameleon2_strat
	s_start_strat
	s_set_objtobeplayer	y
	s_achase_alvar		B,x,al_rotx,#deg180,2,.done
	s_brl			cameleon2_cont
.done
	trigse			$2b 
	s_weapon_pos		#0,#0,#0
	s_weapon_rots2obj	y
	s_fire_weapon		x,RELSLOWELASER
	s_brl			cam2hide_init
cameleon2_cont
	s_add_playerZ		x
	s_end_strat
cam2hide_init
	s_add_alvar		B,x,al_sbyte1,#2
	s_jmp_alvareq		B,x,al_sbyte1,#12,cam2dash_init
	s_set_strat		x,cam2hide_strat
cam2hide_strat
	s_start_strat
	s_achase_alvar		B,x,al_rotx,#0,4,cam2nextpos
	s_brl			cameleon2_cont
cam2nextpos
	s_set_alvar2alvartab	B,W,W,x,al_worldx,x,al_sbyte1,cam2posX_tab
	s_set_alvar2alvartab	B,W,W,x,al_worldy,x,al_sbyte1,cam2posY_tab
	s_set_strat		x,cameleon2_strat
	s_jmpto_strat		x

cam2dash_init
	s_set_strat		x,cam2dash_strat
cam2dash_strat
	s_start_strat
	s_achase_alvar		B,x,al_rotx,#deg180,2,.done
	s_brl			cameleon2_cont
.done
	s_add_alvar		B,x,al_rotz,#4
	s_speedto		x,#30,1
	s_set_objtobeplayer	y
	s_jmp_Zdistless		x,y,#300,.nch
	s_obj2obj_3dangle	x,y,al_sbyte1,al_sbyte2,2
	s_gen_3dvecs		x,al_sbyte1,al_sbyte2,al_vel
.nch	s_add_vecs2pos		x
	s_brl			cameleon2_cont



cam2posX_tab
	dw	-300,300,-250,0,250,-300
cam2posY_tab
	dw	-60,-60,200,-200,200,-60


;*****************************************************************************
evader_Istrat
	s_start_strat
	s_set_alptrs	x,evader_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata	x,#evaderHP,#evaderAP
	s_set_colltype		x,Zenemy
	s_brl		evadernewpos
evaderA_strat
	s_start_strat
	s_set_objtobeplayer	y
	s_copy_alvar2alxvar	W,x,alx_sWPz1,y,al_worldz
	s_copy_alvar2var	W,x,svar_word1,al_sword1
	s_add_alvar		W,x,al_sWPz1,svar_word1
	s_goto_wp		x,x,1,#50,8,3,0,#500,#0,evader_init
	s_brl			evader_cont
evader_init
           	s_set_strat	x,evader_strat
evader_strat
	s_start_strat
	s_set_objtobeplayer	y
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,3,.done
	s_brl			evader_cont
.done
	s_jmp_NOTdelay		3,evader_cont
	s_weapon_pos		#0,#0,#0
	s_weapon_rot		#0,#0
	s_fire_weapon		x,RELSLOWELASERHOME
evader_cont	
	s_add_playerZ	x
	
	s_set_find	0
	s_find_nearobj	y,x,#elaser2,#0,#350,nfindevad
evadernewpos
	jsl			random_l
	and			#3
	asl			a
	sta			al_sbyte1,x
	s_set_alvar2alvartab	B,W,W,x,al_sWPx1,x,al_sbyte1,evaderX_pos
	jsl			random_l
	and			#3
	asl			a
	sta			al_sbyte1,x
	s_set_alvar2alvartab	B,W,W,x,al_sWPy1,x,al_sbyte1,evaderY_pos
	jsl			random_l
	and			#3
	asl			a
	sta			al_sbyte1,x
	s_set_alvar2alvartab	B,W,W,x,al_sword1,x,al_sbyte1,evaderZ_pos
	s_set_strat		x,evaderA_strat
nfindevad
	s_end_strat

evaderX_pos	dw		-400,400,-100,100
evaderY_pos	dw		-300,-200,-100,-50
evaderZ_pos	dw		1000,800,1600,1200



;*****************************************************************************
patrol_Istrat
	s_start_strat
	s_set_alptrs	x,patrol_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata	x,#patrolHP,#patrolAP
	s_set_alvar	B,x,al_roty,#deg90
	s_set_speed	x,#20
	s_set_colltype		x,Zenemy
	s_end_strat
patrol_strat
	s_start_strat
	s_gen_3dvecs	x,al_roty,al_rotx,al_vel
	s_add_vecs2pos	x
	s_add_playerZ	x
	s_end_strat



;*****************************************************************************
truck_Istrat
	s_start_strat
	s_set_alptrs	x,truck_strat,truckcol_Istrat,explode_Istrat
	s_set_aldata	x,#truckHP,#truckAP
	s_copy_alvar2alvar	B,x,al_sbyte1,x,al_roty
	s_set_speed	x,#30
	s_gen_vecs		x,al_sbyte1,al_vel
	s_set_colltype		x,Zenemy
	s_end_strat
truck_strat
	s_start_strat
	s_clr_alsflag	x,sflag1
	s_brl		truck_norm
truck_cont
	s_gen_vecs		x,al_sbyte1,al_vel
truck_norm
	s_set_objtobeplayer	y
	s_jmp_outZdistrng	x,y,#1000,#3000,.nfire
	s_jmp_NOTdelay		4,.nfire
	s_jmp_alsflag		x,sflag2,.nfire
	s_set_alsflag		x,sflag2
	s_weapon_pos		#0,#-105>>weapon_scale,#100>>weapon_scale
	s_weapon_rot		#0,#0
	s_fire_weapon		x,HMISSILE1
	s_set_alvar		W,y,al_ptr,playpt
.nfire

	s_achase_alvar2alvar	B,x,al_roty,x,al_sbyte1,1
	s_add_vecs2pos	x
	s_end_strat

truckcol_Istrat
	s_start_strat
	s_set_objtobealvar	y,x,al_collobjptr
	s_jmp_alvarne.w		W,y,al_shape,#rail_4,hitflash_Istrat
	s_clr_alsflag		x,collide
	s_jmp_alsflag		x,sflag1,truck_cont
	s_set_alsflag		x,sflag1

	s_copy_pos		x,y

	s_jmp_alvarNE.w		B,y,al_sbyte1,#1,.not_right
	s_add_alvar		B,x,al_sbyte1,#-deg90
	s_brl			truck_cont	    
.not_right
	s_sub_alvar		B,x,al_sbyte1,#-deg90
	s_brl			truck_cont	    



;*****************************************************************************
trackcorner_Istrat
	s_start_strat
	s_set_alptrs	x,0,0,0
	s_set_aldata	x,#hardHP,#0
	s_end_strat

;*****************************************************************************
jump1_Istrat
	s_start_strat
	s_set_alptrs	x,0,0,0
	s_set_aldata	x,#jump1HP,#jump1AP
	s_set_alvar	B,x,al_roty,#deg180
	s_set_colltype	x,enemy1
	s_set_colltype	x,enemyweap
	s_end_strat
jump0_Istrat
	s_start_strat
	s_set_alptrs	x,jump0_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata	x,#jump0HP,#jump0AP
	s_set_alvar	B,x,al_roty,#deg180
	s_set_alsflag	x,colldisable
	s_set_colltype	x,enemy1
	s_set_colltype	x,enemyweap
	s_set_colltype		x,Zenemy
	s_end_strat
jump0_strat
	s_start_strat
	s_set_objtobeplayer	y
	s_jmp_Zdistless		x,y,#1500,jump0a_init
	s_end_strat


jump0a_init
	s_set_strat		x,jump0a_strat
	s_set_alvar		W,x,al_vy,#-30
jump0a_strat
	s_start_strat

	s_jmp_lower	x,#-90,.njump
	s_clr_alsflag	x,colldisable
.njump

	s_jmp_alsflag	x,sflag1,.nfire
	s_cmp_alvar	W,x,al_vy,#0
	s_bmi		.nfire
	s_set_alsflag	x,sflag1
	s_weapon_pos		#0,#0,#0
	s_weapon_rot		#0,#0
	s_fire_weapon		x,HMISSILE1
	s_set_alvar.w		W,y,al_ptr,playpt

.nfire
	
	s_falldown_Yvec	x,4,#2,#-35
	s_add_vecs2pos	x
	s_end_strat



;*****************************************************************************
shark_Istrat
	s_start_strat
	s_set_alptrs	x,shark_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata	x,#sharkHP,#sharkAP
	s_set_colltype	x,enemyweap           	
	s_set_colltype	x,enemy1	
	s_set_colltype		x,Zenemy
	s_set_alvar	W,x,al_ptr,playpt
	s_init_anim	x,#0
shark_strat
	s_start_strat
	
	s_jmp_notdelay	1,.nmax
	s_cmp_anim	x,#15
	s_beq		.nmax
	s_add_anim	x,#1,#16
.nmax

	s_set_objtobealvar	y,x,al_ptr

	s_jmp_Zdistless		x,y,#1100,sharka_init
shark_cont2
	s_jmp_Zdistless		x,y,#500,shark_cont
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,3
shark_cont	
	s_gen_3dvecs		x,al_roty,al_rotx,al_vel
	s_add_playerZ		x
	s_add_vecs2pos		x
	s_end_strat
						   

sharka_init
	s_set_strat	x,sharka_strat
	s_set_alvar	B,x,al_sbyte1,#30
	s_set_alvar2rnd	x,al_sbyte2,#15
	s_sub_alvar	B,x,al_sbyte2,#7
sharka_strat
	s_start_strat
	s_beqdec_alvar	B,x,al_sbyte1,.dash

	s_speedto	x,#40,2

	s_sub_alvar	B,x,al_rotx,#4
	s_add_alvars	B,x,al_roty,x,al_sbyte2

	s_jmp_NOtdelay	2,.nfire,al1pt
	s_make_obj	#mine_0,.nfire
	s_set_strat	y,mine0_istrat
	s_copy_pos	y,x
.nfire
	
	s_jmp		shark_cont
.dash
	s_set_objtobealvar	y,x,al_ptr
	s_speedto	x,#50,1
	s_jmp		shark_cont2

;****************************************************************************
kami_Istrat			; generate rnd x,-500,horizon
	s_start_strat
	s_set_alptrs	x,kami_strat,hitflash_Istrat,kamiDIE_Istrat
	s_set_aldata	x,#kamiHP,#kamiAP
	s_set_speed	x,#20
	s_set_alvar2rnd	x,al_sbyte1
	s_set_colltype		x,Zenemy
	s_end_strat
kami_strat
	s_start_strat
	s_add_alvar		B,x,al_sbyte1,#2
	s_set_alvar		W,x,al_vz,#-14
	s_set_alvar		W,x,al_vy,#1


	s_set_alvar2alvartab	B,B,W,x,al_vx,x,al_sbyte1,sintab,-3
	lda			al_vx,x
	asl	a
	asl	a
	clc
	adc			#deg180
	sta			al_roty,x

	lda			al_vx,x
	asl			a
	clc
	adc			#deg90
	sta			al_rotz,x


kami_cont
	s_add_playerZ		x
	s_add_vecs2pos		x
	s_end_strat

kamiDIE_Istrat
	s_start_strat
	s_set_expstrat		x,kamiDIE_strat
	s_jsl			makeMEDexpobj_srou
kamiDIE_strat
	s_start_strat
	s_jmp_NOTdelay		1,.nsm
	s_jsl			makesmoke_srou_l
.nsm
	s_speedto		x,#40,1

	s_jmp_lower		x,#-100,kamigo_init
	s_jmp_alvarMORE		B,x,al_rotx,#deg45,.maxx
	s_add_alvar		B,x,al_rotx,#4
.maxx
	s_gen_3dvecs		x,al_roty,al_rotx,al_vel
	s_add_alvar		B,x,al_rotz,#4
	s_brl			kami_cont

kamiGO_init
	s_set_strat		x,kamiGO_strat
	s_set_alvar		B,x,al_HP,#hardHP
kamiGO_strat
	s_start_strat
	s_speedto		x,#80,1
	s_add_alvar		B,x,al_rotz,#4

	s_jmp_NOTdelay		2,.nsm
	s_jsl			makesmoke_srou_l
.nsm

	s_set_objtobeplayer	y
	s_jmp_Zdistless		x,y,#400,kami_cont
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,3
	s_gen_3dvecs		x,al_roty,al_rotx,al_vel
	s_brl			kami_cont





;*****************************************************************************
crabwalkspeed	equ	8
crabwalkFspeed	equ	8

crabB_Istrat
	s_start_strat
	s_set_alptrs	x,crabB_strat,hitflash_Istrat,smarkexplode_Istrat
	s_set_alvar	B,x,al_sbyte1,#0
	s_brl		crab_init
crabL_Istrat
	s_start_strat
	s_set_alptrs	x,crabL_strat,hitflash_Istrat,smarkexplode_Istrat
	s_set_alvar	B,x,al_sbyte1,#deg90
	s_brl		crab_init

crabT_Istrat
	s_start_strat
	s_set_alptrs	x,crabT_strat,hitflash_Istrat,smarkexplode_Istrat
	s_set_alvar	B,x,al_sbyte1,#deg180
	s_brl		crab_init

crabR_Istrat
	s_start_strat
	s_set_alptrs	x,crabR_strat,hitflash_Istrat,smarkexplode_Istrat
	s_set_alvar	B,x,al_sbyte1,#deg180+deg90


crab_init
	s_set_aldata	x,#crabHP,#crabAP
	s_set_alvar	B,x,al_roty,#deg180
	s_set_alvar	B,x,al_sbyte2,#10
	s_end_strat

crab_cont
     	s_add_playerZ	x
	s_add_alvar	W,x,al_worldz,#crabwalkFspeed

	s_jmp_alsflag	x,sflag1,.nadd
	s_add_alvar	W,x,al_worldx,svar_word1
	s_add_alvar	W,x,al_worldy,svar_word2
.nadd

	
	s_achase_alvar2alvar	B,x,al_rotz,x,al_sbyte1,1

	s_set_objtobeplayer	y

	s_jmp_Zdistless		x,y,#4000,.ndie
	s_remove_obj		x
	s_end_strat
.ndie



	s_jmp_Zdistless		x,y,#1500,.chkfire
	s_add_alvar	W,x,al_worldz,#crabwalkFspeed*2
	s_brl			.nfire

.chkfire
	s_jmp_alvarINLIMIT	W,x,al_worldx,crabwalkspeed/2,.dfire
.nfire2
	s_clr_alsflag		x,sflag1
	s_brl			.nfire
	
.dfire
	s_jmp_alsflag		x,sflag1,.nfs
	s_set_alsflag		x,sflag1
	s_set_alvar		B,x,al_sbyte2,#10
.nfs

	s_decbne_alvar		B,x,al_sbyte2,.nres
	s_clr_alsflag		x,sflag1
.nres
	s_jmp_alvarNE		B,x,al_sbyte2,#5,.nfire
	s_weapon_pos		#0,#0,#0
	s_fire_weapon		x,MISSILE2
	s_set_alsflag		y,sflag1
	s_set_alsflag		y,sflag2
;	s_set_alvar		W,y,al_shape,#smissile
.nfire
     
	
	s_end_strat

crabB_init
	s_set_strat	x,crabB_strat
	s_set_alvar	B,x,al_sbyte1,#0
crabB_strat
	s_start_strat
	s_weapon_rot		#-deg45,#0
	s_set_var		W,svar_word1,#-crabwalkspeed
	s_set_var		W,svar_word2,#0
	s_jmp_alvarless	W,x,al_worldx,minPmoveX,crabL_init
	s_brl		crab_cont


crabL_init
	s_set_strat	x,crabL_strat
	s_set_alvar	B,x,al_sbyte1,#deg90
crabL_strat	
	s_start_strat
	s_set_var		W,svar_word1,#0
	s_set_var		W,svar_word2,#-crabwalkspeed
	s_jmp_alvarless	W,x,al_worldy,minPmoveY,crabT_init
	s_brl		crab_cont


crabT_init
	s_set_strat	x,crabT_strat
	s_set_alvar	B,x,al_sbyte1,#deg180
crabT_strat	
	s_start_strat
	s_weapon_rot		#deg45,#0
	s_set_var		W,svar_word1,#crabwalkspeed
	s_set_var		W,svar_word2,#0
	s_jmp_alvarmore	W,x,al_worldx,maxPmoveX,crabR_init
	s_brl		crab_cont

crabR_init
	s_set_strat	x,crabR_strat
	s_set_alvar	B,x,al_sbyte1,#deg180+deg90
crabR_strat	
	s_start_strat
	s_set_var		W,svar_word1,#0
	s_set_var		W,svar_word2,#crabwalkspeed
	s_jmp_alvarmore	W,x,al_worldy,maxPmoveY,crabB_init
	s_brl		crab_cont


;*****************************************************************************
	IFEQ	1
mouse_Istrat
	s_start_strat
	s_set_alptrs	x,mouse_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata	x,#8,#2

	s_jmp		mousea_init
	
	s_set_wp		x,x,1,#0,#0,#2000
mouse_strat
	s_start_strat
	s_jmp_alvarless		B,x,al_HP,#6,mousea_init

	s_set_objtobeplayer	y
;	s_jmp_Zdistmore		x,y,#3000,.notnewwp
	s_jmp_alsflag		x,sflag1,.notnewwp

	s_set_find		0
	s_find_nearobj		y,x,#pyramid,#0,#4000,.notnewwp
	s_set_wp		x,y,1,#0,#0,#1000
	s_set_alsflag		x,sflag1
.notnewwp
	s_goto_wp		x,x,1,#70,4,1,0,#500,#0
;	s_jmp_WPdistmore	x,x,1,#200,.notthere
	s_clr_alsflag		x,sflag1
.notthere

	s_end_strat


mousea_init
	s_set_strat		x,mousea_strat
mousea_strat
	s_start_strat


	s_set_alvar		W,x,al_vz,#35
	s_add_alvar		B,x,al_sbyte1,#8

	s_jmp_alvarmoreeq	B,x,al_HP,#4,.ds1
	s_set_alvar		W,x,al_vz,#40
	s_set_alvar2alvartab	B,B,W,x,al_vx,x,al_sbyte1,sintab,-2
	s_brl			.dones
.ds1
	s_set_alvar2alvartab	B,B,W,x,al_vx,x,al_sbyte1,sintab,-3

.dones

	lda			al_vx,x
	nega
	sta			al_roty,x

	s_add_vecs2pos		x

	s_end_strat
	ENDC
;*****************************************************************************
torpedo_Istrat
	s_start_strat
	s_set_alptrs	x,torpedo_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata	x,#torpedoHP,#torpedoAP
	s_set_alvar	W,x,al_shape,#nullshape
	s_set_speed	x,#30
	s_set_alsflag	x,colldisable
	s_set_colltype		x,Zenemy
torpedo_strat
	s_start_strat
	

;	s_jmp_notdelay		1,.nspl
	s_jsl			makeSsplash_srou_l
.nspl
	s_set_objtobeplayer	y

	s_jmp_Zdistless		x,y,#800,torpedoa_init
	s_obj2obj_angle		x,y,al_roty,3
torpedo_cont
	s_gen_3dvecs		x,al_roty,al_rotx,al_vel
	s_add_playerZ		x
	s_add_vecs2pos		x
	s_end_strat

torpedoa_init
	s_set_strat		x,torpedoa_strat
	s_set_alvar		B,x,al_rotx,#-deg45
	s_set_alvar		W,x,al_shape,#f_fish		torpedo
	s_jsl			makesplash_srou_l
	s_clr_alsflag		x,colldisable
	jsl		enemyupsea_l
torpedoa_strat
	s_start_strat
	s_achase_alvar		B,x,al_rotx,#0,2
	s_brl			torpedo_cont


;*****************************************************************************
seamon_Istrat
	s_start_strat
	s_set_alptrs	x,seamon_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata	x,#4,#8
	s_set_alvar	W,x,al_vz,#30
	s_set_alvar	B,x,al_roty,#deg180
	s_set_alvar	B,x,al_sbyte1,#10
	s_set_alvar2rnd	x,al_sbyte2
	s_set_alvar	B,x,al_sbyte4,#1
	s_set_alvar	W,x,al_sword2,#-10
	s_set_alvar	B,x,al_sbyte3,#40
	s_set_state	x,#2
	s_set_colltype		x,Zenemy
	s_end_strat
seamon_strat
	s_start_strat


	s_add_vecs2pos		x

	s_jmp_IFstate		x,3,.dmc
	s_jmp_alvarNOTZERO	W,x,al_worldy,.nsc
.dmc	s_beqdec_alvar		B,x,al_sbyte3,.dlrm
	s_brl			.nsc
.dlrm
	s_set_alvar2alvartab	B,B,W,x,al_vx,x,al_sbyte2,sintab,-4
	s_add_alvar		B,x,al_sbyte2,#4

	s_decbne_alvar		B,x,al_sbyte1,.nsc
	s_set_alvar		B,x,al_sbyte1,#10
	s_set_alvar		W,x,al_shape,#sea_0_1
	s_not_alsflag		x,sflag2
	s_beq			.nsc
	s_set_alvar		W,x,al_shape,#sea_0_0
.nsc

	s_jmp_lower		x,#-1,.nds
	s_add_alvar		W,x,al_vy,#2
	s_jmp_lower		x,#-30,.hs
	s_set_alvar		W,x,al_shape,#sea_0
	s_jmp_NOTdelay		4,.nzv,al1pt
	s_set_objtobeplayer	y
	s_jmp_outZdistrng	x,y,#500,#1000,.nzv
	s_jmp_Xdistmore		x,y,#200,.nzv
	s_weapon_rots2obj	y
	s_weapon_pos		#0,#0,#0
	s_fire_weapon		x,RELSLOWELASER
	s_brl			.nzv
.hs
	s_jmp_alvarmi		W,x,al_vy,.nzv
	s_set_alvar		W,x,al_shape,#sea_0_0
	s_jmp_alsflag		x,sflag1,.nds
	s_set_alsflag		x,sflag1
	jsl		enemydownsea_l
	jsl			makesplash_srou_l
	s_set_alvar		W,y,al_worldy,#0
	s_set_alvar		B,x,al_sbyte3,#10
	s_set_alsflag		x,colldisable
	s_jmp			.nzv
.nds
	s_jmp_alvarmi		W,x,al_vy,.nzv
	s_set_alvar		W,x,al_worldy,#0
	s_set_alvar		W,x,al_vy,#0
.nzv

	s_set_objtobeplayer	y
	s_decbne_alvar		B,x,al_sbyte4,.njump1

	s_next_state		x,#3

	s_jmp_IFNOTstate	x,1,.ns1
	s_set_alvar		B,x,al_sbyte4,#40
	s_set_alvar		W,x,al_vy,#-15
	s_brl			.ns3
.ns1
	s_jmp_IFNOTstate	x,2,.ns2
	s_set_alvar		B,x,al_sbyte4,#40
	s_set_alvar		W,x,al_vy,#-15
	s_brl			.ns3
.ns2
	s_jmp_IFNOTstate	x,3,.ns3
	s_set_alvar		B,x,al_sbyte4,#60
	s_set_alvar		W,x,al_vy,#-25
.ns3


	jsl		enemyupsea_l

	s_clr_alsflag		x,colldisable
	s_set_alvar		W,x,al_vx,#0		
	s_clr_alsflag		x,sflag1
	jsl			makesplash_srou_l
.njump1

	s_end_strat

;*****************************************************************************
wormhead_Istrat
	s_start_strat
	s_set_alptrs	x,worm_strat,hitflash_Istrat,wormheadexp_Istrat
	s_and_var	B,gasflags,#~gasf_killtype1
	s_and_var	B,gasflags,#~gasf_killtype2
	set_sound2	x,#5
	s_jmp		worm_init


worm_Istrat
	s_start_strat
	s_set_alptrs	x,worm_strat,hitflash_Istrat,wormexp_Istrat

worm_init
	s_set_alvar	B,x,al_roty,#deg180
	s_set_aldata	x,#wormHP,#wormAP
	s_set_colltype	x,enemy1
	s_set_alvar		W,x,al_vz,#-10
	s_end_strat
worm_strat
	s_start_strat

	s_set_alvar2alvartab	B,B,W,x,al_vx,x,al_sbyte2,sintab,-4
	s_set_alvar2alvartab	B,B,W,x,al_vy,x,al_sbyte2,costab,-4
	s_add_alvar		B,x,al_sbyte2,#4
	
	s_set_objtobealvar	y,x,al_sword1
	s_chk_objptr		y,.badobj
	s_jmp_alvarNOTzero.w	B,y,al_hp,.badobj
	s_test_var		B,gasflags,#gasf_killtype1
	s_bne			kill_Istrat
	s_jmp			.cont
.badobj
	s_test_var		B,gasflags,#gasf_killtype2
	s_bne			wormsplit_init
.cont
	s_add_vecs2pos		x
	s_add_playerZ		x
	s_end_strat


wormexp_Istrat
	s_start_strat
	s_test_var		B,gasflags,#gasf_killtype1
	bne			.nsws
	s_or_var		B,gasflags,#gasf_killtype2
.nsws	
	s_jmp			explode_Istrat

wormheadexp_Istrat
	s_start_strat
	s_or_var		B,gasflags,#gasf_killtype1
	s_jmp			explode_Istrat

wormsplit_init
	s_set_alvar2rnd		x,al_vx,#63
	s_set_alvar		B,x,al_vx+1,#0
	s_sub_alvar		W,x,al_vx,#32

	s_set_alvar2rnd		x,al_vy,#63
	s_set_alvar		B,x,al_vy+1,#0
	s_sub_alvar		W,x,al_vy,#32

	s_set_alvar		W,x,al_vz,#0

	s_set_alvar		B,x,al_sbyte2,#6*3
	s_set_strat		x,wormsplit_strat

	s_end_strat
wormsplit_strat
	s_start_strat
	s_beqdec_alvar		B,x,al_sbyte2,wormgo_init
	s_add_vecs2pos		x
	s_add_playerZ		x
	s_end_strat

	ifeq	1
wormfire_init
	s_set_strat		x,wormfire_strat
	s_set_alvar2rnd		x,al_sbyte2,#15
wormfire_strat
	s_start_strat
	s_decbne_alvar		B,x,al_sbyte2,.nwf
	s_set_objtobeplayer	y
	s_weapon_rots2obj 	y
	s_weapon_pos		#0,#0,#0
	s_fire_weapon		x,RELSLOWELASER
	s_set_alsflag		x,hitflash
	s_jmp			w0ormgo_init
.nwf
	s_end_strat
	endc

wormgo_init
	s_set_strat		x,wormgo_strat
	s_zero_vecs		x
	s_set_alvar		W,x,al_vz,#-10

wormgo_strat
	s_start_strat
	s_leftview_strat	x,.gl
	s_add_alvar		W,x,al_vx,#-1
	s_jmp			.dg
.gl	s_add_alvar		W,x,al_vx,#1
.dg

	s_add_vecs2pos		x
	s_end_strat


;*****************************************************************************
worm2_Istrat
	s_start_strat
	s_set_alptrs	x,worm2_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata	x,#4,#2
	s_set_colltype	x,enemy1

	s_set_state	x,#0
	s_set_alvar	B,x,al_sbyte3,#10

	s_set_alvar2rnd	x,al_rotz
	s_set_lifecnt	x,#120

	set_sound2	x,#5
	s_setnoremove_behind	x
worm2_strat
	s_start_strat
	

	s_add_alvar	B,x,al_rotz,#3

	s_decbne_alvar	B,x,al_sbyte3,.nns
	s_set_alvar	B,x,al_sbyte3,#32
	s_next_state	x,#4
.nns
		
sh1	equ	-3
sh2	equ	-2

zsh1	equ	0
zsh2	equ	1
zsh3	equ	2


	s_jmp_IFNOTstate	x,1,.ns1
	s_set_alvar2alvartab	B,B,W,x,al_vx,x,al_sbyte1,sintab,sh1
	s_set_alvar2alvartab	B,B,W,x,al_vy,x,al_sbyte1,costab,sh1
	s_set_alvar		W,x,al_vz,#0
	s_add_alvar		B,x,al_sbyte1,#4
	s_jmp			.worm_end
.ns1				
	s_jmp_IFNOTstate	x,2,.ns2
	s_set_alvar2alvartab	B,B,W,x,al_vx,x,al_sbyte1,sintab,sh1
	s_set_alvar2alvartab	B,B,W,x,al_vy,x,al_sbyte1,costab,sh1
	s_set_alvar2alvartab	B,B,W,x,al_vz,x,al_sbyte1,costab,zsh1
	s_add_alvar		B,x,al_sbyte1,#4
	s_jmp			.worm_end
.ns2
	s_jmp_IFNOTstate	x,3,.ns3
	s_set_alvar2alvartab	B,B,W,x,al_vx,x,al_sbyte1,sintab,sh1
	s_set_alvar2alvartab	B,B,W,x,al_vy,x,al_sbyte1,costab,sh1
	s_set_alvar2alvartab	B,B,W,x,al_vz,x,al_sbyte1,costab,zsh2
	s_add_alvar		B,x,al_sbyte1,#4
	s_jmp			.worm_end
.ns3
	s_jmp_IFNOTstate	x,4,.ns4
	s_set_alvar2alvartab	B,B,W,x,al_vx,x,al_sbyte1,sintab,sh1
	s_set_alvar2alvartab	B,B,W,x,al_vy,x,al_sbyte1,costab,sh1
	s_set_alvar2alvartab	B,B,W,x,al_vz,x,al_sbyte1,costab,zsh3
	s_add_alvar		B,x,al_sbyte1,#4
.ns4


.worm_end
	s_jmp_notdelay		1,.nd
	s_dec_lifecnt		x
.nd

	s_add_vecs2pos		x
	s_add_playerZ		x
	s_end_strat




;*****************************************************************************
sokuten_Istrat
	s_start_strat	
	s_set_aldata		x,#sokutenHP,#sokutenAP
	s_set_alptrs		x,sokuten_strat,hitflash_Istrat,explode_Istrat
	s_set_speed		x,#30
	s_set_alvar		B,x,al_sbyte1,#-deg90
sokuten_strat
	s_start_strat	
	s_gen_vecs		x,al_sbyte1,al_vel
	s_copy_alvar2alvar	B,x,al_roty,x,al_sbyte1

	s_beqdec_alvar		B,x,al_sbyte2,.doturn
	s_brl			.no_yi

.doturn
	s_set_collstrat		x,0
	s_jmp_alvarless		B,x,al_sbyte1,#-deg180,.no_yi
	s_set_collstrat		x,hitflash_Istrat
	s_dec_alvar		B,x,al_sbyte1

	
.no_yi	s_add_alvar		B,x,al_roty,#deg90
	s_sub_alvar		B,x,al_rotz,#4
	s_add_vecs2pos		x
	s_add_playerZ		x
	s_end_strat




;*****************************************************************************
flypillarS_Istrat
	s_start_strat
	s_set_aldata		x,#flypillarHP,#flypillarAP
	s_set_alptrs		x,0,hitflash_Istrat,pillar3explode_Istrat
	s_end_strat
flypillar_Istrat
	s_start_strat
	s_set_alptrs		x,flypillar_strat,hitflash_Istrat,pillar3explode_Istrat
	s_set_aldata		x,#flypillarHP,#flypillarAP
	s_setnoremove_behind	x
	s_set_alvar		B,x,al_rotx,#-deg90
	s_set_alvar		W,x,al_vZ,#60
	s_set_alvar2rnd		x,al_sword1
	s_add_alvar		W,x,al_sword1,#200

	s_set_alvar2rnd		x,al_worldx
	s_set_alvar2rnd		x,al_worldx+1,#1
	s_sub_alvar		W,x,al_worldx,#256
	s_add_alvar		W,x,al_worldx,player_posx
	
	set_sound2		x,#4

flypillar_strat
	s_start_strat
	s_add_playerZ		x
	s_set_objtobeplayer	y
	s_copy_alvar2var	W,x,svar_word1,al_sword1
	s_jmp_Zdistless		x,y,svar_word1,.nxr
	s_achase_alvar		B,x,al_rotx,#0,2
	s_jmp_lower		x,#0,flypillar_end
	s_add_alvar		W,x,al_worldy,#20
.nxr
	s_add_vecs2pos		x
	s_set_alsflag		x,shadow
	s_end_strat

flypillar_end
	trigse			se_damageenemynear	
	s_set_strat		x,0
	s_set_alvar		B,x,al_rotx,#0
	s_setremove_behind	x
	s_clr_alsflag		x,shadow
	s_end_strat

;*****************************************************************************
Lwalker1_Istrat
	s_start_strat
	s_set_alvar		B,x,al_roty,#-(deg90+deg45)
	s_jmp			walker1_Istrat
Rwalker1_Istrat
	s_start_strat
	s_set_alvar		B,x,al_roty,#(deg90+deg45)
walker1_Istrat
	s_start_strat
	s_set_alvar		B,x,al_sbyte1,#200
	s_set_alptrs		x,walker1_Strat,hitflash_Istrat,explode_Istrat
	s_set_aldata		x,#walkerHP,#0
	s_set_speed		x,#10
	s_gen_vecs		x,al_roty,al_vel
	set_sound2		x,#3
walker1_strat
	s_start_strat
	s_add_vecs2pos		x
	s_set_objtobeplayer	y
	s_jmp_distmore		x,y,#3000,.ew1s
	s_set_alvartobeobj	x,al_ptr,y
	s_weapon_pos		#0,#-50>>weapon_scale,#0
	s_weapon_rot		#0,#0
	s_fire_weapon		x,HMISSILE1
	s_set_strat		x,move_strat
.ew1s	
	s_end_strat


;*****************************************************************************
mine1_Istrat
	s_start_strat
	s_end_strat
;*****************************************************************************
minumusi_Istrat
	s_start_strat
	s_end_strat



;*****************************************************************************
wireman_Istrat
	s_start_strat
	s_set_aldata		x,#wiremanHP,#wiremanAP
	s_set_alsflag		x,shadow

wireman_init
	s_set_alptrs		x,wireman_strat,hitflash_Istrat,wiremandie_Istrat
	s_set_speed		x,#40
wireman_strat
	s_start_strat
	s_set_objtobeplayer	y
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,2
	s_jmp_distless		x,y,#1500,wireman2_init

wireman_cont
	s_jmp_lower		x,#0,wiremanup_init
wireman_cont2
	s_gen_3dvecs		x,al_roty,al_rotx,al_vel
	s_add_vecs2pos		x
	s_add_playerZ		x
	s_end_strat
wireman2_init
	s_set_alvar		B,x,al_sbyte1,#deg180/4

	s_set_strat		x,wireman2X_strat
	s_jmp_random		wireman2X_strat
	s_set_strat		x,wireman2YR_strat
	s_jmp_random		wireman2YL_strat
	s_set_strat		x,wireman2YL_strat

wireman2YL_strat
	s_start_strat
	s_add_alvar		B,x,al_roty,#4
	s_add_alvar		B,x,al_rotz,#4
	s_beqdec_alvar		B,x,al_sbyte1,wireman_init
	s_brl			wireman_cont
wireman2YR_strat
	s_start_strat
	s_sub_alvar		B,x,al_roty,#4
	s_sub_alvar		B,x,al_rotz,#4
	s_beqdec_alvar		B,x,al_sbyte1,wireman_init
	s_brl			wireman_cont
wireman2X_strat
	s_start_strat
	s_sub_alvar		B,x,al_rotx,#4
	s_beqdec_alvar		B,x,al_sbyte1,wireman_init
	s_brl			wireman_cont

wiremanup_init
	s_set_strat		x,wiremanup_strat
	s_set_alvar		W,x,al_worldy,#0
	s_set_alvar		B,x,al_rotx,#-deg22
	s_set_alvar		B,x,al_sbyte1,#30
wiremanup_strat
	s_start_strat
	s_beqdec_alvar		B,x,al_sbyte1,wireman_init
	s_brl			wireman_cont2


wiremandie_Istrat
	s_start_strat
	s_make_obj	#item_6,.badobj
	s_set_strat	y,item6_Istrat
	s_copy_pos	y,x
.badobj
	s_jmp		explode_Istrat


;*****************************************************************************
bomwing_Istrat
	s_start_strat
	s_set_aldata		x,#bomwingHP,#bomwingAP
	s_set_speed		x,#20
	s_set_alvar		B,x,al_roty,#deg45

bomwing_init
	s_set_alptrs		x,bomwing_strat,hitflash_Istrat,bomwingdie_Istrat
	s_set_alvar		B,x,al_sbyte1,#20
bomwing_strat
	s_start_strat

	s_beqdec_alvar		B,x,al_sbyte1,bomwing2_init
	s_gen_vecs		x,al_roty,al_vel
	s_add_vecs2pos		x
bomwing_cont
	s_add_alvar		W,x,al_worldz,#35
	s_end_strat


bomwing2_init
	s_set_strat		x,bomwing2_strat
	s_set_alvar		B,x,al_sbyte1,#(deg360/3)/2
bomwing2_strat
	s_start_strat

	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#3000,.nfire
	s_jmp_objpointposZ	x,.nfire	
	s_jmp_notdelay		3,.nfire
	s_weapon_pos		#0,#0,#0
	s_weapon_rot		#-deg22,#0
	s_fire_weapon		x,HPLASMA
	s_set_alvar		W,y,al_ptr,playpt
.nfire	

	s_add_alvar		B,x,al_roty,#2
	s_beqdec_alvar		B,x,al_sbyte1,bomwing_init
	s_brl			bomwing_cont

bomwingdie_Istrat
	s_start_strat
	s_make_obj	#item_5,.badobj
	s_set_strat	y,item5_Istrat
	s_copy_pos	y,x
	s_add_alvar	W,y,al_worldy,#-20
.badobj
	s_jmp		explode_Istrat


;*****************************************************************************
item5_Istrat	; special weapon power up
	s_set_alptrs		x,item5_strat,0,0
	s_set_alsflag		x,colldisable
item5_strat
	s_start_strat
	s_remove_ifplayerdead	x

	s_jmp_alvarNOTZERO	B,x,al_sbyte1,.stop
	s_add_alvar		W,x,al_worldz,#20
.stop


	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#60*2,.nitem
	s_jmp_XYdistmore	x,y,#30*2,.nitem

	s_jmp_varmoreEQ		W,specwepcnt,#5,.maxspec
	s_inc_var		W,specwepcnt
	s_set_var		B,specflash,#30
	TRIGSE			$18
	s_score			#100
.maxspec

	s_set_strat		x,flashplayer_Istrat
	s_jmpto_strat		x
.nitem	s_end_strat



;*****************************************************************************
item6_Istrat	; wireframe ship power up
	s_set_alptrs		x,item6_strat,0,0
	s_set_alsflag		x,colldisable
item6_strat
	s_start_strat
	s_remove_ifplayerdead	x

	s_jmp_alvarNOTZERO	B,x,al_sbyte1,.stop
	s_add_alvar		W,x,al_worldz,#20
.stop


	s_add_alvar		B,x,al_roty,#4
	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#60*2,.nitem
	s_jmp_XYdistmore	x,y,#30*2,.nitem
	s_set_var		B,pnumhits,#0
	lda			#pshipnum_wire
	sta			curr_ship
	jsl			select_ship_l
	s_or_var		B,pshipflags2,#psf2_wireship
	
	s_set_var		B,shieldup,#1

	TRIGSE			$16
	s_jmp			remove_Istrat
.nitem	s_end_strat



;*****************************************************************************
wl_Istrat		; double laser power up releaser
	s_start_strat
	s_set_alptrs		x,wl_strat,hitflash_Istrat,wldie_Istrat
	s_set_aldata		x,#wlHP,#wlAP
	s_end_strat

wl_strat
	s_start_strat
	s_end_strat
	

wldie_Istrat
	s_start_strat
	s_make_obj	#item_7,.badobj
	s_set_strat	y,item7_Istrat
	s_copy_pos	y,x
.badobj
	s_jmp		explode_Istrat



;*****************************************************************************
item3_Istrat	; add 5 to player's body HP ; Pyramidal Power-Up from Starxxon's tweet
	s_set_alptrs		x,item3_strat,0,0
	s_set_alsflag		x,colldisable
item3_strat
	s_start_strat
	s_remove_ifplayerdead	x
	s_add_alvar		B,x,al_roty,#4
	s_add_alvar		B,x,al_rotz,#4
	s_add_alvar		W,x,al_worldz,#20
	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#60*2,.nitem
	s_jmp_XYdistmore	x,y,#30*2,.nitem
	s_set_objtobevar	y,pcboxobj_B
	s_add_alvar.w		B,y,al_hp,#5
	s_jmp_alvarlesseq.w	B,y,al_hp,#playerB_HP,.max
	s_set_alvar.w		B,y,al_hp,#playerB_HP
.max	TRIGSE			$10
	s_set_strat		x,flashplayer_Istrat
	s_jmpto_strat		x
.nitem	s_end_strat


;*****************************************************************************
item0_Istrat	; 1 up 
	s_start_strat
	s_set_alptrs 		x,item0_strat,0,0
	s_set_alsflag		x,colldisable
	s_set_alvar		B,x,al_rotx,#-deg90
	
item0_strat	
	s_start_strat
	s_remove_ifplayerdead	x
	s_add_alvar		W,x,al_worldz,#30
	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#40*2,.nitem
	s_jmp_Ydistmore		x,y,#60*2,.nitem
	s_jmp_Xdistmore		x,y,#40*2,.nitem
	trigse	$e
	inc			lives

	phx
	s_set_objtobealvar	y,x,al_sword1
	s_jmp_objptrbad		y,.bad1
	tyx
	s_set_objtobechild	y,x,#1
	s_jmp_objptrbad		y,.bad1
	s_remove_obj		y
	s_set_objtobechild	y,x,#3
	s_jmp_objptrbad		y,.bad1
	s_remove_obj		y
	s_set_objtobechild	y,x,#4
	s_jmp_objptrbad		y,.bad1
	s_remove_obj		y
.bad1	plx

	s_remove_obj		x

.nitem	s_end_strat


;*****************************************************************************
up1man_Istrat
	s_start_strat	
	s_set_alptrs 		x,up1man_strat,0,0
	s_set_alsflag		x,colldisable

	s_make_childobj	#up1_man,#1,up1manchild1_Istrat,enemyweap
	s_make_childobj	#up1_man,#2,up1manchild2_Istrat,enemyweap
	s_make_childobj	#up1_man,#3,up1manchild3_Istrat,enemyweap

	s_set_alvar		B,x,al_sbyte2,#5

up1man_strat
	s_start_strat
	s_set_objtobeplayer	y


	s_jmp_alvarZERO		B,x,al_sbyte3,.ninrng
	s_add_alvars		B,x,al_rotz,x,al_sbyte2

	s_jmp_Zdistmore		x,y,#1500,.npos
	s_add_alvar		W,x,al_worldz,#30
.npos	

	s_jmp_alvarNE		B,x,al_sbyte3,#3,.ninrng
	s_jmp_alsflag		x,sflag1,.ninrng
	s_set_alsflag		x,sflag1
	s_make_obj		#myship_4,.badobj
	s_set_alvar		B,y,al_rotx,#-deg90
	s_set_strat		y,item0_Istrat
	s_copy_pos		y,x
	s_set_alvartobeobj	y,al_sword1,x
.badobj


.ninrng

	s_end_strat


up1manhit_Istrat
	s_start_strat
	s_jmp_alsflag		x,sflag1,.nhit
	TRIGSE			$10
	s_set_objtobemother	y,x
	s_add_alvar		B,y,al_sbyte2,#2		; angle rot
	s_inc_alvar		B,y,al_sbyte3		; num hits
	s_set_alsflag	x,sflag1
	s_clr_alsflag	x,collide
	s_set_alsflag	x,colldisable
.nhit	s_jmpto_strat	x

up1manchild1_Istrat
	s_start_strat
	s_set_alptrs		x,up1manchild_strat,up1manhit_Istrat,0
	s_set_aldata		x,#hardHP,#up1manAP
	s_set_alvar		B,x,al_sbyte2,#-80
	s_set_alvar		B,x,al_sbyte3,#75
	s_set_alvar		B,x,al_sbyte4,#deg45+deg90
	s_jmpto_strat		x
up1manchild2_Istrat
	s_start_strat
	s_set_alptrs		x,up1manchild_strat,up1manhit_Istrat,0
	s_set_aldata		x,#hardHP,#up1manAP
	s_set_alvar		B,x,al_sbyte2,#80
	s_set_alvar		B,x,al_sbyte3,#75
	s_set_alvar		B,x,al_sbyte4,#deg45+deg180
	s_jmpto_strat		x
up1manchild3_Istrat
	s_start_strat
	s_set_alptrs		x,up1manchild_strat,up1manhit_Istrat,0
	s_set_aldata		x,#hardHP,#up1manAP
	s_set_alvar		B,x,al_sbyte2,#0
	s_set_alvar		B,x,al_sbyte3,#-90
	s_set_alvar		B,x,al_sbyte4,#0
	s_jmpto_strat		x

up1manchild_strat
	s_start_strat
	s_set_objtobemother	y,x
	s_copy_alvar2var	B,x,svar_byte1,al_sbyte2
	s_copy_alvar2var	B,x,svar_byte2,al_sbyte3

	s_add_roffs2pos		B,x,y,y,svar_byte1,svar_byte2,#0,0,0,1

	s_copy_alvar2alvar	B,x,al_rotz,y,al_rotz
	s_add_alvars		B,x,al_rotz,x,al_sbyte4

	s_jmpNOT_alsflag	x,sflag1,.nfl
	s_jmp_NOTdelay		1,.nfl,al1pt
	s_set_alsflag		x,hitflash
.nfl	
	s_end_strat


	



;*****************************************************************************
winglazerman_Istrat	; wing laser or special helpball releaser.
	s_start_strat	
	s_set_alptrs		x,winglazerman_strat,hitflash_Istrat,winglazermandie_Istrat
	s_set_aldata		x,#winglazermanHP,#winglazermanAP
	s_set_speed		x,#40
	s_set_alsflag		x,shadow
	s_set_alvar		B,x,al_sbyte2,#2
winglazerman_strat
	s_start_strat	

	s_set_objtobeplayer	y
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,2

	s_jmp_Zdistless		x,y,#1000,winglazerman2_init

winglazerman_cont
	s_gen_3dvecs		x,al_roty,al_rotx,al_vel
	s_add_vecs2pos		x
	s_add_playerZ		x
	s_end_strat

winglazermango_init
	s_set_strat		x,winglazermango_strat
	s_set_lifecnt		x,#100
winglazermango_strat			 
	s_start_strat
	s_speedto	x,#50,1
	s_achase_alvar	B,x,al_roty,#0,4
	s_achase_alvar	B,x,al_rotx,#-5,4
	s_dec_lifecnt	x
	s_jmp			winglazerman_cont


winglazerman2_init
	s_beqdec_alvar	B,x,al_sbyte2,winglazermango_init
	s_set_strat	x,winglazerman2_strat
	s_set_alvar	B,x,al_sbyte1,#deg360/4
winglazerman2_strat
	s_start_strat
	
	s_speedto	x,#20,1
	s_add_alvar	B,x,al_roty,#4

	s_beqdec_alvar	B,x,al_sbyte1,winglazerman3_init
	s_jmp		winglazerman_cont	

winglazerman3_init
	s_set_strat	x,winglazerman3_strat
	s_set_alvar	B,x,al_sbyte1,#30
	s_set_alvar	B,x,al_sbyte3,#5
winglazerman3_strat
	s_start_strat

	s_speedto	x,#0,1

	s_set_objtobeplayer	y
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,2

	s_jmp_notdelay		2,.nfire
	s_copy_alvar2var	B,x,svar_byte1,al_sbyte3

	s_weapon_pos		#-27>>weapon_scale,#0,#0
	s_weapon_rot		svar_byte1,#deg5
	s_fire_weapon		x,RELSLOWELASER
	s_weapon_pos		#27>>weapon_scale,#0,#0
	s_weapon_rot		svar_byte1,#-deg5
	s_fire_weapon		x,RELSLOWELASER
	s_sub_alvar		B,x,al_sbyte3,#1
.nfire

	s_beqdec_alvar	B,x,al_sbyte1,winglazerman2_init
	s_jmp		winglazerman_cont	


winglazermandie_Istrat
	s_start_strat

	s_jmp_varAND		B,pshipflags,#psf_brkLwing!psf_brkRwing,.dlaser
	s_jmpNOT_varAND		B,pshipflags3,#psf3_beamball,.dlaser
	IFNE	winglazerman_helperball
;.helpball
.dlaser	s_make_obj	#item_3,.badobj ; it seems the laser upgrade/wing repair enemy originally would have also given helperballs.
	; help ball (HELPERBALL) ;would normally use item_7, however,
	;to help diffrentiate, it has been changed to item_3.
	;unfortunately, .helpball does not exist, so It's either
	;laser upgrade (winglazerman_helperball equ 0) or helper ball (winglazerman_helperball equ 1), not both.
	s_set_strat	y,item7a_istrat
	s_copy_pos	y,x
.badobj
	ELSEIF
	s_brl		.badobj

.dlaser	s_make_obj	#item_7,.badobj		; double laser / repair
	s_set_strat	y,item7_istrat
	s_copy_pos	y,x
.badobj
	ENDC
	s_jmp		explode_Istrat


;*****************************************************************************
item7_Istrat	; player's double laser pod.
	s_set_alptrs		x,item7_strat,0,0
	s_set_alsflag		x,colldisable
item7_strat
	s_start_strat
	s_remove_ifplayerdead	x

	s_jmp_alvarNOTZERO	B,x,al_sbyte1,.stop
	s_add_alvar		W,x,al_worldz,#20
.stop

	s_jsr			itemtorange_srou

	s_add_alvar		B,x,al_roty,#4
	s_add_alvar		B,x,al_rotz,#4
	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#60*2,.nitem
	s_jmp_XYdistmore	x,y,#30*2,.nitem

	s_jmpNOT_varAND	B,pshipflags,#psf_brkLwing!psf_brkRwing,.dlaser
	s_make_obj		#ripair_w,.cont
	s_set_strat		y,ripair_Istrat
	s_brl		.cont
.dlaser
	TRIGSE			$15
	s_score			#100
	
	phx
	ldx			pcboxobj_LW
	s_jsl			pLWing_Istrat
	ldx			pcboxobj_RW
	s_jsl			pRWing_Istrat
	plx

	s_jmp_varAND	B,pshipflags2,#psf2_doublaser,.dbeam
	s_or_var		B,pshipflags2,#psf2_doublaser
	s_brl		.cont
.dbeam
	s_or_var		B,pshipflags3,#psf3_beamball
.cont
	s_set_strat		x,flashplayer_Istrat
	s_jmpto_strat		x
.nitem	s_end_strat


;*****************************************************************************
item7a_Istrat	; player's special help ball ; HELPERBALL
	s_set_alptrs		x,item7a_strat,0,0
	s_set_alsflag		x,colldisable
item7a_strat
	s_start_strat
	s_remove_ifplayerdead	x

	s_jmp_alvarNOTZERO	B,x,al_sbyte1,.stop
	s_add_alvar		W,x,al_worldz,#20
.stop

	s_jsr			itemtorange_srou

	s_add_alvar		B,x,al_roty,#4
	s_add_alvar		B,x,al_rotz,#4
	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#60*2,.nitem
	s_jmp_XYdistmore	x,y,#30*2,.nitem
	s_make_obj		#helpball,.bad1
	s_set_strat		y,helpball_Istrat
	TRIGSE			$10
.bad1
	s_set_strat		x,flashplayer_Istrat
	s_jmpto_strat		x
.nitem	s_end_strat


;*****************************************************************************
ripman_Istrat
	s_start_strat
	s_set_alptrs		x,ripman_strat,hitflash_Istrat,ripmanexp_Istrat
	s_set_aldata		x,#ripmanHP,#ripmanAP
	s_set_alsflag		x,shadow
	s_set_colltype		x,enemyweap
ripman_strat
	s_start_strat
	s_jmp_lower		x,#-30,.gnd
	s_add_alvar		B,x,al_roty,#16
	s_add_alvar		W,x,al_worldy,#3
	s_add_alvar		W,x,al_worldx,#4
	s_add_alvar		W,x,al_worldz,#35
.gnd	s_end_strat

ripmanexp_Istrat	
	s_start_strat
	TRIGSE			$0a
;	s_make_obj		#item_4,.badobj
;	s_copy_pos		y,x
;	s_set_strat		y,item4_Istrat
;.badobj

	s_make_obj		#ripair_w,.badobj
	s_set_strat		y,ripair_Istrat
.badobj
	s_jmp			explode_Istrat

;	s_clr_alsflag		x,collide
;	s_set_collstrat		x,0
;	s_jmpto_strat		x

;*****************************************************************************
item4_Istrat	; repair pod.
	s_start_strat
	s_set_alptrs		x,item4_strat,0,0
	s_set_alsflag		x,colldisable
	s_end_strat

item4_strat
	s_start_strat
	s_remove_ifplayerdead	x
	s_add_alvar		B,x,al_roty,#4
	s_add_alvar		B,x,al_rotx,#4

	s_jsr			itemtorange_srou

	s_add_alvar		W,x,al_worldz,#20
	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#60*2,.nitem
	s_jmp_XYdistmore	x,y,#50*2,.nitem
	s_make_obj		#ripair_w,.badobj
	s_set_strat		y,ripair_Istrat
	s_remove_obj		x
.badobj
.nitem	s_end_strat



;*****************************************************************************
ripair_Istrat	; repair ship to full strength.
	s_start_strat		
	s_set_alptrs		x,ripair_strat,0,0
	s_set_alsflag		x,colldisable
	s_set_alvar		W,x,al_worldz,player_posz
	s_add_alvar		W,x,al_worldz,#-200
	s_set_alvar		W,x,al_worldx,player_posx
	s_add_alvar		W,x,al_worldx,#500
	s_set_alvar		W,x,al_worldy,player_posy
	s_set_alsflag		x,shadow
	s_setnoremove_behind	x
	s_set_vecs		x,#0,#0,#30
	s_set_alvar		B,x,al_rotz,#deg90
	trigse			$8b
	s_set_alvar		B,x,al_sbyte1,#30	; 30
	s_end_strat
ripair_strat
	s_start_strat

	s_set_objtobeplayer	y

	s_add_playerZ		x
	s_add_alvars		W,x,al_worldz,x,al_vz

	s_achase_alvar		W,x,al_worldx,player_posx,3
	s_achase_alvar		W,x,al_worldy,player_posy,3

	s_decbne_alvar		B,x,al_sbyte1,.nreccoll
	s_set_alvar		B,x,al_sbyte1,#1
	s_achase_alvar		W,x,al_worldx,player_posx,1
	s_achase_alvar		W,x,al_worldy,player_posy,1
	s_achase_alvar2alvar	B,x,al_rotz,y,al_rotz,1
	
	s_jmp_Zdistmore		x,y,#500,.npos
	s_set_alvar		W,x,al_worldx,player_posx
	s_set_alvar		W,x,al_worldy,player_posy
	s_copy_alvar2alvar	B,x,al_rotz,y,al_rotz
.npos

	s_set_alvar		W,x,al_vz,#-40

;	s_jmp_alvareq		W,x,al_vz,#-15,.iszv	    ; -20
;	s_dec_alvar		W,x,al_vz
;	s_bra			.nspd
.iszv	s_setremove_behind	x
.nspd



	s_jmp_XYdistmore	x,y,#20,.nreccoll
	s_jmp_objinfront	y,x,.catch
	s_jmp_Zdistmore		x,y,#30,.nreccoll
.catch	phx
	ldx			pcboxobj_LW
	s_jsl			pLWing_Istrat
	ldx			pcboxobj_RW
	s_jsl			pRWing_Istrat
	plx

	s_and_var		B,pshipflags,#~(psf_brkLwing!psf_Lwingcoll!psf_brkRwing!psf_Rwingcoll)


	s_copy_pos		x,y

	TRIGSE			$17
	s_set_strat		x,flashplayer_Istrat
.nreccoll
	s_end_strat
	
	
flashplayer_Istrat
	s_start_strat
      	s_jmp_varEQ		B,splayerflymode,#spfm_inside,remove_Istrat
	s_set_lifecnt	x,#20
	s_set_alsflag	x,colldisable	
	s_set_strat	x,flashplayer_strat
flashplayer_strat
	s_start_strat

	s_set_objtobeplayer	y
	s_copy_rots	x,y
	s_copy_pos	x,y


	s_remove_ifplayerdead	x

	s_jmp_notdelay	1,.dowire
	s_set_alvar	W,x,al_shape,#nullshape
	brl	.endpfl	
.dowire
	exg_xy
	s_ldajsl	B,#pshipnum_wire,setYplayershape_l
	exg_xy
	s_add_colanim	x,#1,#4
.endpfl	

	s_dec_lifecnt	x

	s_end_strat



itemtorange_srou
	s_set_var		W,svar_word1,minpmoveY
	s_add_var		W,svar_word1,#50
	s_jmp_lower		x,svar_word1,.iny
	s_add_alvar		W,x,al_worldy,#3
.iny
	s_rts



;*****************************************************************************
tunnel_Istrat	
	s_start_strat
	s_set_alptrs		x,0,hitflash_Istrat,explode_Istrat
	s_set_aldata		x,#tunnelHP,#hardAP
	s_end_strat	

;*****************************************************************************
bee1_Istrat
	s_start_strat
	s_set_alptrs		x,bee1_strat,hitflash_Istrat,explode_istrat
	s_set_aldata		x,#bee1HP,#bee1AP
	s_set_colltype		x,Zenemy

	s_set_alvar		W,x,al_vz,#-40
	s_set_alvar		B,x,al_roty,#deg180
	s_set_alvar2rnd		x,al_sbyte1
	set_sound2		x,#3
	s_set_alsflag		x,shadow
	s_end_strat  

bee1_strat
	s_start_strat

	ifeq	0
	s_set_alvar2alvartab	B,B,W,x,al_worldx,x,al_sbyte1,costab,1
	s_set_alvar2alvartab	B,B,W,x,al_worldy,x,al_sbyte2,sintab,-1
	s_add_alvar		B,x,al_sbyte1,#2
	s_add_alvar		B,x,al_sbyte2,#8

	s_add_alvar		W,x,al_worldy,#space_viewCY


	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#2000,.bee1_cont
	s_jmp_Zdistless		x,y,#500,bee1a_init
	s_achase_alvar		W,x,al_vz,#0,1

.bee1_cont	s_add_vecs2pos		x
	s_end_strat
	endc



	s_add_vecs2pos		x

	s_copy_alvar2var	W,x,svar_word1,al_worldx
	s_copy_alvar2var	W,x,svar_word2,al_worldy
	s_varsub_alvar		W,x,svar_word1,al_sword1
	s_varsub_alvar		W,x,svar_word2,al_sword2


	s_jmp_varmore		W,svar_word1,#-100,.nbxi
	s_add_alvar		W,x,al_vx,#2
	s_set_alvar		B,x,al_sbyte1,#(deg180+deg90)
.nbxi
	s_jmp_varless		W,svar_word1,#100,.nbxd
	s_sub_alvar		W,x,al_vx,#2
	s_set_alvar		B,x,al_sbyte1,#deg90
.nbxd					    
	s_limit_alvar		W,x,al_vx,-10,10
   

	s_achase_alvar2alvar	B,x,al_roty,x,al_sbyte1,2

	s_jmp_varmore		W,svar_word2,#-50,.nbyi
	s_add_alvar		W,x,al_vy,#4
.nbyi
	s_jmp_varless		W,svar_word2,#50,.nbyd
	s_sub_alvar		W,x,al_vy,#4 
.nbyd
	s_limit_alvar		W,x,al_vy,-20,20


	s_set_objtobeplayer	y
	s_jmp_distless		x,y,#500,bee1a_init

	s_end_strat

bee1a_init
	s_set_strat		x,bee1a_strat
	s_initface_player	x
bee1a_strat	
	s_start_strat
	s_add_playerz		x
	s_copy_alvar2alvar	B,x,al_sbyte1,x,al_rotx
	s_face_player		x,2,5,bee1b_init
	s_end_strat


bee1b_init
	s_set_strat		x,bee1b_strat
bee1b_strat
	s_start_strat
	s_speedto		x,#30,1
	s_gen_3dvecs		x,al_roty,al_sbyte1,al_vel
	s_setremove_behind	x
	s_add_playerz		x
	s_add_vecs2pos		x
	s_sub_alvar		B,x,al_rotx,#1
	s_end_strat




;*****************************************************************************
misspod_Istrat		; al_sbyte1 = 0/1/2 (X/H/V formation)
	s_start_strat
	s_set_alptrs		x,misspod_strat,hitflash_Istrat,explode_istrat
	s_set_aldata		x,#misspodHP,#misspodAP
	s_set_vecs		x,#0,#0,#-10
	s_set_alvar		B,x,al_roty,#deg180
	s_set_alvar2rnd		x,al_sbyte1,#3
	set_sound2		x,#$2
	s_end_strat	
misspod_strat
	s_start_strat	
	s_set_objtobeplayer	y
	s_jmp_distless		x,y,#1000,misspoda_init

endmisspod
	s_add_vecs2pos		x
	s_add_alvar		B,x,al_rotz,#5
	s_end_strat

;--------------------------------------------------------------
misspoda_init
	s_set_strat		x,misspoda_strat
	trigse		$49
misspoda_strat
	s_start_strat
	s_weapon_rot		#0,#0

	s_jmp_alvarEQ		B,x,al_sbyte1,#3,misspodX
	s_jmp_alvarEQ		B,x,al_sbyte1,#0,misspodX
	s_jmp_alvarEQ		B,x,al_sbyte1,#1,misspodH


;	s_jmp_random	misspodH,50
;	s_jmp_random	misspodX,50

misspodV
	s_push_alvar		B,x,al_rotz
	s_set_alvar		B,x,al_rotz,#0

	s_weapon_pos		#0,#0,#120>>weapon_scale
	s_set_alvar		B,x,al_rotx,#0		; middle
	s_set_alvar		B,x,al_roty,#deg180
	s_fire_weapon		x,missile2

	s_weapon_pos		#0,#70>>weapon_scale,#0
	s_fire_weapon		x,missile2
	s_weapon_pos		#0,#-70>>weapon_scale,#0
	s_fire_weapon		x,missile2

	s_set_alvar		B,x,al_roty,#deg180
	s_set_alvar		B,x,al_rotx,#deg90
	s_fire_weapon		x,missile2
	s_set_alvar		B,x,al_rotx,#-deg90
	s_fire_weapon		x,missile2
	s_set_expstrat		y,explodegate2_Istrat

	s_pull_alvar		B,x,al_rotz

	s_kill_obj		x
;	s_remove_obj		x
	s_end_strat

misspodH
	s_push_alvar		B,x,al_rotz
	s_set_alvar		B,x,al_rotz,#0

	s_weapon_pos		#0,#0,#120>>weapon_scale
	s_set_alvar		B,x,al_rotx,#0		; middle
	s_set_alvar		B,x,al_roty,#deg180
	s_fire_weapon		x,missile2

	s_weapon_pos		#70>>weapon_scale,#0,#0
	s_fire_weapon		x,missile2
	s_weapon_pos		#-70>>weapon_scale,#0,#0
	s_fire_weapon		x,missile2

	s_set_alvar		B,x,al_rotx,#0
	s_set_alvar		B,x,al_roty,#deg90
	s_fire_weapon		x,missile2
	s_set_alvar		B,x,al_roty,#-deg90
	s_fire_weapon		x,missile2
	s_set_expstrat		y,explodegate2_Istrat

	s_pull_alvar		B,x,al_rotz

	s_kill_obj		x
;	s_remove_obj		x
	s_end_strat

misspodX
	s_push_alvar		B,x,al_rotz
	s_set_alvar		B,x,al_rotz,#0

	s_weapon_pos		#0,#0,#0
	s_set_alvar		B,x,al_rotx,#0
	s_set_alvar		B,x,al_roty,#deg180
	s_fire_weapon		x,missile2

	s_set_alvar		B,x,al_rotx,#0
	s_set_alvar		B,x,al_roty,#deg90
	s_fire_weapon		x,missile2
	s_set_alvar		B,x,al_roty,#-deg90
	s_fire_weapon		x,missile2

	s_set_alvar		B,x,al_roty,#deg180
	s_set_alvar		B,x,al_rotx,#deg90
	s_fire_weapon		x,missile2
	s_set_alvar		B,x,al_rotx,#-deg90
	s_fire_weapon		x,missile2
	s_set_expstrat		y,explodegate2_Istrat

	s_pull_alvar		B,x,al_rotz

	s_kill_obj		x
;	s_remove_obj		x
	s_end_strat



;*****************************************************************************
fffirerate	equ	3


fastfighter1_Istrat
	s_start_strat
	s_set_alptrs		x,fastfighter1_Strat,hitflash_Istrat,explode_Istrat
	s_set_alvar		B,x,al_sbyte1,#8 ; shoot 4 times at target
	s_jmp			fastfighter_init

fastfighter1_strat
	s_start_strat		

	s_set_objtobealvar	y,x,al_ptr
	s_chk_objptr		y,.nfire
	s_jmp_Zdistless		x,y,#1500,.fire
.nfire


	s_jmp_notdelay		3,.nofire,al1pt
	s_weapon_pos		#0,#0,#65>>weapon_scale
	s_weapon_rndrot		7,15
	s_fire_weapon		x,SLOWELASER
	s_brl			.nofire
.nfire2

.fire
	s_jmp_notdelay		2,.nofire,al1pt
	s_set_objtobealvar	y,x,al_ptr
	s_jmp_objinfront	y,x,.nofire
	s_beqdec_alvar		B,x,al_sbyte1,.nofire
	s_weapon_rots2obj	y
	s_weapon_pos		#0,#0,#65>>weapon_scale
	s_fire_weapon		x,RELSLOWELASER
.nofire	


	s_jmp			dofighter

fastfighter3_Istrat
	s_start_strat
	s_set_alptrs		x,fastfighter3_Strat,hitflash_Istrat,explode_Istrat
	s_set_alvar		B,x,al_sbyte1,#fffirerate
	s_jmp			fastfighter_init

fastfighter3_strat
	s_start_strat		
	s_decbne_alvar		B,x,al_sbyte1,.nofire
	s_set_alvar		B,x,al_sbyte1,#fffirerate
	s_weapon_pos		#0,#0,#65>>weapon_scale
	s_weapon_rndrot		7,15
	s_fire_weapon		x,SLOWELASER
	s_set_strat		x,fastfighter1_strat
.nofire	s_jmp			dofighter



fastfighter2_Istrat
	s_start_strat
	s_set_alptrs		x,fastfighter2_Strat,hitflash_Istrat,explode_Istrat
	s_jmp			fastfighter_init

fastfighter2_strat
	s_start_strat		
	s_jmp_NOTdelay		3,.nofire,al1pt
	s_weapon_pos		#0,#0,#65>>weapon_scale

;	s_set_var2rnd		svar_byte1,#15
;	s_sub_var		B,svar_byte1,#7
	s_set_var2rnd		svar_byte2,#7
	s_sub_var		B,svar_byte2,#3
	s_weapon_rot		#0,svar_byte2

	s_fire_weapon		x,SLOWELASER
.nofire	s_jmp			dofighter




fastfighter_init
	s_set_var2rnd		svar_byte1
	s_set_aldata		x,#fighterHP,#fighterAP
	s_set_alvar		B,x,al_roty,#deg180
;	s_set_alvar		B,x,al_roty,#deg90
	s_set_speed		x,#80
	s_gen_3dvecs		x,al_roty,al_rotx,al_vel
	s_set_alsflag		x,colldisable
	set_sound2		x,#2
	s_end_strat



fighter_Istrat
	s_start_strat
	s_set_alptrs		x,fighter_Strat,hitflash_Istrat,explode_Istrat
	s_set_aldata		x,#fighterHP,#fighterAP
	s_set_alvar		B,x,al_roty,#deg180
	s_set_speed		x,#0
	s_set_alvar2rnd		x,al_sbyte1
	s_gen_3dvecs		x,al_roty,al_rotx,al_vel
	s_set_colltype		x,enemyweap
	s_end_strat

fighter_strat
	s_start_strat
	s_copy_alvar2var	B,x,svar_byte1,al_sbyte1
	s_jmp_notdelay		5,.nofire,svar_byte1
	s_weapon_pos		#0,#0,#120>>weapon_scale
	s_weapon_rot		#0,#0
	s_fire_weapon		x,SLOWELASER
.nofire


dofighter	
	s_set_objtobeplayer	y
	s_jmp_distmore	x,y,#1000,.nrot
	s_banktoplayer	x
.nrot	
	s_jmp_alvarmore		B,x,al_HP,#fighterHP-1,.nsw

	s_jmp_NOTdelay		1,.nns
	s_next_state		x,#2
.nns
	s_jmp_ifnotstate	x,1,.dlw
	s_sub_alvar		B,x,al_rotz,#5
	s_jmp			.nsw
.dlw	s_add_alvar		B,x,al_rotz,#5
.nsw
	s_add_vecs2pos	x
	s_end_strat



;*****************************************************************************
windmill_Istrat  	; al_roty = start direction.	: al_word1,Y rot add
	s_start_strat
	s_set_alptrs		x,windmill_Strat,hitflash_Istrat,windexp_Istrat
	s_set_aldata		x,#windmillHP,#windmillAP
	s_set_speed		x,#50
	set_sound2		x,#$f
windmill_strat
	s_start_strat
	s_set_objtobeplayer	y
	
	s_jmp_OUTZdistrng	x,y,#500,#2000,.nrot
	s_jmp_notdelay		1,.nrot
	s_add_alvars		B,x,al_roty,x,al_sword1
.nrot

	s_add_playerZ		x
	s_gen_3dvecs		x,al_roty,al_rotx,al_vel
	s_add_vecs2pos		x
	s_add_alvar		B,x,al_rotz,#4

;-------------------------------------------------------------
; smoke
	s_weapon_rot		#0,#0
	s_jmp_notdelay		4,.nf1
	s_weapon_pos		#0,#(-55<<2)>>weapon_scale,#(10<<2)>>weapon_scale
	s_fire_weapon		x,SLOWELASER
.nf1

.ndw2	s_jmp_notdelay		4,.nf2,#4
	s_weapon_pos		#(55<<2)>>weapon_scale,#0,#(10<<2)>>weapon_scale
	s_fire_weapon		x,SLOWELASER
.nf2

.ndw3	s_jmp_notdelay		4,.nf3,#8
	s_weapon_pos		#0,#(55<<2)>>weapon_scale,#(10<<2)>>weapon_scale
	s_fire_weapon		x,SLOWELASER
.nf3

.ndw4	s_jmp_notdelay		4,.nf4,#12
	s_weapon_pos		#(-55<<2)>>weapon_scale,#0,#(10<<2)>>weapon_scale
	s_fire_weapon		x,SLOWELASER
.nf4
	s_end_strat


windexp_Istrat
	s_start_strat
 
	
	s_make_obj	#round0p,.bad1
	s_copy_rots	y,x
	s_copy_pos	y,x
	s_add_Roffs2pos	B,y,x,x,#0,#30<<2,#0,1,1,1
	s_set_strat	y,windspin_Istrat
.bad1

	s_make_obj	#round0p,.bad2
	s_copy_rots	y,x
	s_copy_pos	y,x
	s_add_Roffs2pos	B,y,x,x,#0,#-30<<2,#0,1,1,1
	s_add_alvar	B,y,al_rotz,#deg180
	s_set_strat	y,windspin_Istrat
.bad2


	s_make_obj	#round0p,.bad3
	s_copy_rots	y,x
	s_copy_pos	y,x
	s_add_Roffs2pos	B,y,x,x,#-30<<2,#0,#0,1,1,1
	s_add_alvar	B,y,al_rotz,#deg90
	s_set_strat	y,windspin_Istrat
.bad3

	s_make_obj	#round0p,.bad4
	s_copy_rots	y,x
	s_copy_pos	y,x
	s_add_Roffs2pos	B,y,x,x,#30<<2,#0,#0,1,1,1
	s_sub_alvar	B,y,al_rotz,#deg90
	s_set_strat	y,windspin_Istrat
.bad4


	s_make_obj		#nullshape,.badobjp
	s_set_strat		y,particleexplode_Istrat
	s_copy_pos		y,x
.badobjp
	s_jmp		escapeeexplode_Istrat

windspin_Istrat
	s_start_strat
	s_set_alsflag		x,colldisable
	s_set_alptrs		x,windspin_strat,0,explode_Istrat
	s_copy_alvar2var	B,x,svar_byte1,al_rotz
	s_make_xyvec		x,svar_byte1,#30
	s_set_lifecnt		x,#40
	s_set_alvar2rnd		x,al_sbyte1,#15
	s_add_alvar		B,x,al_sbyte1,#7
	s_set_aldata		x,#hardHP,#hardAP
windspin_strat
	s_start_strat	
	s_add_alvars		B,x,al_rotz,x,al_sbyte1
	s_dec_lifecnt		x,1
	s_add_vecs2pos		x
	s_end_strat


;*****************************************************************************
doma_Istrat
domb_Istrat
	s_start_strat
	s_set_alptrs		x,doma_Strat,hitflash_Istrat,explode_Istrat
	s_set_aldata		x,#domaHP,#0
	s_set_alvar		B,x,al_roty,#deg180
	s_set_speed		x,#30
	s_set_alvar2rnd		x,al_sbyte1
	s_gen_3dvecs		x,al_roty,al_rotx,al_vel
	s_set_state		x,#0

doma_strat
	s_start_strat


	s_set_objtobeplayer	y
	s_jmp_distmore		x,y,#2000,.nrot
	s_jmp_ifnotstate	x,0,.ncp
	s_next_state		x,#1
	s_set_alvar		W,x,al_vx,#21
	s_jmp			.ncp
.nrot	
	s_copy_alvar2alvar	W,x,al_worldx,y,al_worldx
	s_copy_alvar2alvar	W,x,al_worldy,y,al_worldy
.ncp


	s_jmp_alvarless		W,x,al_vx,#20,.ngl
	s_sub_alvar		W,x,al_vx,#1
.ngl
	s_jmp_alvarmore		W,x,al_vx,#-20,.ngr
	s_add_alvar		W,x,al_vx,#1
.ngr


;	s_copy_alvar2var	B,x,svar_byte1,al_sbyte1
;	s_jmp_notdelay		5,.nofire,svar_byte1
;	s_weapon_pos		#0,#0,#120>>weapon_scale
;	s_weapon_rot		#0,#0
;	s_fire_weapon		x,SLOWELASER
;.nofire	  

	s_add_vecs2pos	x
	s_add_playerZ	x
	s_end_strat










;;*****************************************************************************
;cloud_Istrat
;	s_start_strat
;	s_set_alvar	B,x,al_rotx,#deg90
;	s_set_strat	x,0
;	s_set_altype	x,gnd
;	s_end_strat



;*****************************************************************************
exitcoll_Istrat
	s_start_strat
;	phx
;	ai16
;	setlevel	1
;	plx
;	a8i16
	s_remove_obj	x
	s_end_strat

;*****************************************************************************
exit_Istrat
	s_start_strat
	s_set_alptrs		x,0,0,0
;	s_set_altype		x,gnd
	s_set_alsflag		x,colldisable		
	s_end_strat

;*****************************************************************************
gnd_Istrat
	s_start_strat
	s_set_alptrs		x,0,0,0
	s_set_altype		x,gnd
	s_set_alsflag		x,colldisable		
	s_end_strat

;*****************************************************************************
exitlight1_Istrat
	s_start_strat		
	s_set_alvar		B,x,al_sbyte2,#2
	s_jmp			exitlight_init
exitlight2_Istrat
         	s_start_strat		
	s_set_alvar		B,x,al_sbyte2,#4
	s_jmp			exitlight_init
exitlight3_Istrat
	s_start_strat		
	s_set_alvar		B,x,al_sbyte2,#6
	s_jmp			exitlight_init
exitlight4_Istrat
	s_start_strat		
	s_set_alvar		B,x,al_sbyte2,#8
	s_jmp			exitlight_init
exitlight5_Istrat
	s_start_strat		
	s_set_alvar		B,x,al_sbyte2,#10
	s_jmp			exitlight_init
exitlight6_Istrat
	s_start_strat		
	s_set_alvar		B,x,al_sbyte2,#12

exitlight_init
	s_set_alsflag		x,colldisable		

exitlightA_init
	s_set_strat		x,exitlightA_strat
exitlightA_strat
	s_start_strat
	s_beqdec_alvar		B,x,al_sbyte2,exitlightB_init
	s_init_colanim		x,#1
	s_end_strat

exitlightB_init
	s_set_strat		x,exitlightB_strat
	s_set_alvar		B,x,al_sbyte1,#3
	s_init_colanim		x,#0
exitlightB_strat
	s_start_strat
	s_beqdec_alvar		B,x,al_sbyte1,.dwait
	s_end_strat

.dwait						 
	s_set_alvar		B,x,al_sbyte2,#12
	s_jmp			exitlightA_init



;*****************************************************************************
exitopensnd2_Istrat
	s_start_strat
	s_set_alsflag		x,sflag1
	s_brl			exitopen_Istrat
exitopensnd_Istrat
	s_start_strat
	set_sound2		x,#5
exitopen_Istrat
	s_start_strat
	s_set_altype	x,gnd
	s_set_alsflag		x,donesnd
	s_set_aldata		x,#127,#0
	s_set_colltype	x,enemy1
	s_set_strat		x,exitopen_strat
exitopen_strat
	s_start_strat
	
	s_set_objtobealvar	y,x,al_sword2
	s_chk_objptr		y,.nrel
	s_copy_vecs		x,y
	s_add_playerZ		x
.nrel
	s_add_vecs2pos		x		


	s_set_objtobeplayer	y
	s_copy_alvar2var	W,x,svar_word1,al_sword1
	s_jmp_zdistmore		x,y,svar_word1,.noopen

	s_set_alsflag		x,colldisable

	lda			al_sbyte1,x
	sta			svar_word1
	sexam			svar_word1+1
	s_add_alvar		W,x,al_worldy,svar_word1

	s_jmpNOT_alsflag	x,sflag1,.nopensnd
	s_clr_alsflag	x,sflag1
	s_dooropen_snd	
.nopensnd

.noopen
	s_end_strat






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


