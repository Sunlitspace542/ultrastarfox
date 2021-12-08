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
;*   File: GA2STRATS.ASM                                                     *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr: GILES' ALIEN STRATEGIES.                                        *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   Date: 10/9/92                                                         *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;* Author:								      *
;*                                                                         *
;*		Giles Goddard.      				      *	
;*                                                                         *
;***************************************************************************

	incpublics	ga2strats.ext

	strats_start

;*****************************************************************************

starbull_Istrat
	s_start_strat
	s_set_alptrs		x,starbull_Strat,hitflash_Istrat,explode_Istrat
	s_set_aldata		x,#starbullHP,#starbullAP
	s_set_colltype		x,Zenemy
;	s_set_alsflag		x,colldisable

	s_setnoremove_behind	x

	s_set_wp		x,x,1,#0,#0,#0
	s_set_state		x,#0
	set_sound2		x,#2
starbull_strat
	s_start_strat

	s_set_objtobeplayer	y
	s_copy_pos2WP		x,1,y	
	s_add_alvar		W,x,al_sWPz1,#1000
	s_add_alvar		W,x,al_sWPy1,#-50


	s_goto_wp		x,x,1,#50,1,2,0,#500,#0,starbull2

;----------------------------------------------------------------

starbullc
	s_add_playerZ		x


	s_damagesmoke		x,#starbullHP-4,2,#0,#0,#0,0
	s_jmpNOT_onfire		x,.nsw

	s_jmp_NOTdelay		1,.nns
	s_next_state		x,#2
.nns

	s_jmp_ifnotstate	x,1,.dlw
	s_sub_alvar		B,x,al_rotz,#8
	s_jmp			.nsw
.dlw	s_add_alvar		B,x,al_rotz,#8
.nsw

	s_end_strat
;----------------------------------------------------------------


starbull2
	s_clr_alsflag		x,colldisable
 	s_set_strat		x,stbfp_strat
	s_set_alvar		B,x,al_sbyte1,#20
	s_initface_player	x
	s_jmp			starbullc

stbfp_strat
	s_start_strat			; face player
	s_face_player		x,2,3,.stbshoot
	s_jmp			starbullc

.stbshoot	
	s_beqdec_alvar		B,x,al_sbyte1,stbgo_init
	s_jmp_NOTdelay		2,.nfire
	s_weapon_pos		#0,#0,#0
	s_set_var2rnd		svar_byte1,#7
	s_sub_var		B,svar_byte1,#3
	s_weapon_rot		#0,svar_byte1
	s_fire_weapon		x,RELSLOWELASER
.nfire
	s_jmp			starbullc

stbgo_init
	s_set_strat		x,stbgo_strat
stbgo_strat
	s_start_strat
	s_remove_offscn	x
	s_Achase_alvar		B,x,al_roty,#0,2
	s_sub_alvar		B,x,al_rotx,#2
	s_speedto	x,#120,5
	s_gen_3dvecs	x,al_roty,al_rotx,al_speed
	s_add_vecs2pos	x
	s_jmp		starbullc




 
;*****************************************************************************
amoeba_Istrat
	s_start_strat
	s_sprite_obj	x,#0
	s_set_alptrs		x,amoeba_strat,amoebacol_Istrat,0
	s_set_aldata		x,#hardHP,#0
	s_set_alvar		B,x,al_roty,#deg180
amoeba_strat
	s_start_strat
amoeba_cont
	s_add_alvar	W,x,al_worldz,#-60
	s_add_playerZ	x
	s_end_strat

amoebacol_Istrat
	s_start_strat
	s_jmp_varEQ	B,slimecount,#3,.end
	s_jmp_alvarNE	W,x,al_collobjptr,playpt,.end
	s_set_strat	x,amoebastick_Istrat
	s_inc_var	B,slimecount
	s_jmpto_strat	
.end	s_jmp		amoebahome_init
	s_end_strat
;*****************************************************************************
metroid_Istrat
	s_start_strat
	s_sprite_obj	x,#0
	s_set_alptrs		x,amoeba_strat,metroidcol_Istrat,0
	s_set_aldata		x,#hardHP,#0
	s_set_alvar		B,x,al_roty,#deg180

metroidcol_Istrat
	s_start_strat
	s_jmp_varEQ	B,slimecount,#3,.end
	s_jmp_alvarNE	W,x,al_collobjptr,playpt,.end
	s_set_strat	x,metroidstick_Istrat
	s_inc_var	B,slimecount
	s_jmpto_strat	
.end	s_jmp		amoebahome_init
	s_end_strat
	

amoebahome_init
	s_set_strat		x,amoebahome_strat
amoebahome_strat
	s_start_strat
	s_set_objtobeplayer	y
	s_achase_alvar2alvar	W,x,al_worldx,y,al_worldx,4
	s_achase_alvar2alvar	W,x,al_worldy,y,al_worldy,4
	s_brl			amoeba_cont


metroidstick_Istrat
	s_start_strat

	s_playerfire	off

	s_set_alsflag	x,colldisable
	s_set_alvar	W,x,al_shape,#metroid1
	s_set_strat	x,amoebastick_strat
	
	a16
	lda		al_worldx,x
	sec
	sbc		player_posx
	asra
	asra
	sta		al_sword1,x	
	lda		al_worldy,x
	sec
	sbc		player_posy
	asra
	asra
	sta		al_sword2,x	
	a8
	jmp	amoebastick_strat

amoebastick_Istrat
	s_start_strat

	s_playerfire	off

	s_set_alsflag	x,colldisable
	s_set_alvar	W,x,al_shape,#amoeba1
	s_set_strat	x,amoebastick_strat
	
	a16
	lda		al_worldx,x
	sec
	sbc		player_posx
	asra
	asra
	sta		al_sword1,x	
	lda		al_worldy,x
	sec
	sbc		player_posy
	asra
	asra
	sta		al_sword2,x	
	a8


amoebastick_strat
	s_start_strat
	s_Set_objtobeplayer	y
 
	s_copy_alvar2var	W,x,svar_word1,al_sword1
	s_copy_alvar2var	W,x,svar_word2,al_sword2

	s_set_pos		x,#0,#0,#0
	s_add_Roffs2pos		B,x,y,y,svar_word1,svar_word2,#0,1,1,1
	s_add_playerZ		x	

	s_jmp_notdelay		2,.ngo,al1pt
	s_jmp_varNOTZERO	B,player_rollZvel,amoebago_init
.ngo

	s_jmp_notdelay		1,.nhfl
	s_set_objtobeplayer	y
	s_set_alsflag		y,hitflash
	TRIGSE		$56
.nhfl

;	s_jmp_notdelay		2,.nsnd
;	TRIGSE		$56
;.nsnd	


	s_jmp_notdelay		4,.ndam
	s_set_var		B,screenflashcnt,#screenflashbodyfrms
	s_set_var		B,screenflashtype,#screenflashbodytype
	s_set_objtobevar	y,pcboxobj_B
	s_jmp_varAND	B,pshipflags3,#psf3_nocollisions,.ndam ;check for god mode
	s_beqdec_alvar		B,y,al_hp,.ndam
.ndam


	s_end_strat	

amoebago_init
	s_set_strat	x,amoeba_strat
	s_clr_var	B,slimecount
	s_playerfire	on
	s_jmpto_strat	



**********************************************************************************
szaco2_Istrat
	s_start_strat
	s_set_aldata	x,#szaco2HP,#szaco2AP
	s_set_alptrs	x,szaco2_strat,hitflash_Istrat,explode_Istrat
	s_set_speed	x,#40
	s_add_alvar	W,x,al_sWPy1,#150
	s_add_alvar	W,x,al_sWPy1,player_posy
	s_set_debrisdata	x,#zaco_8p
	s_init_anim	x,#3
	s_set_alsflag	x,relexplode
	s_set_colltype	x,enemyweap
	set_sound2		x,#$3
szaco2_strat
	s_start_strat

;----------------------------------------------------------------
	s_jmp_IFNOTstate 	x,0,.nturn1
	s_copy_alvar2alvar	W,x,al_sWPZ1,x,al_worldz
	s_sub_alvar		W,x,al_sWPZ1,#10
	s_obj2WP_angle		x,x,1,al_roty,al_rotx,3
	s_jmp_loweralvar	x,al_sWPY1,.nturn1
	s_next_state		x,#3
.nturn1

;----------------------------------------------------------------
	s_jmp_IFNOTstate 	x,1,.nturn4
	s_Achase_2alvars	B,x,al_rotx,#0,2,al_roty,#deg180,2,.fin
	s_bra			.nturn4
.fin	s_next_state		x,#3
.nturn4

;----------------------------------------------------------------
	s_jmp_IFNOTstate 	x,2,.nturn3
	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#1000,.nturn3
	s_banktoplayer		x
	s_jmp_Zdistmore		x,y,#600,.nturn3
	s_next_state		x,#3
.nturn3


;----------------------------------------------------------------
	s_jmp_IFNOTstate 	x,3,.ndash
	s_achase_alvar		B,x,al_roty,#deg180,2
.ndash

	s_set_objtobeplayer	y
	s_jmp_outZdistrng	x,y,#400,#1500,.nfire
	s_jmp_notdelay		3,.nfire,al1pt
	s_weapon_rot		#0,#0
	s_weapon_pos		#0,#0,#0
	s_fire_weapon		x,RELSLOWELASER
.nfire

;----------------------------------------------------------------



szaco2_cont
	s_gen_3dvecs		x,al_roty,al_rotx,al_speed
	s_add_vecs2pos		x
	s_add_playerZ		x
	s_end_strat



;**********************************************************************************
	defWPpostab	szaco0a
;	defWPpos	40<<8,0,0,wp_speedchg
	defWPpos	0,0,2500
	defWPpos	0,0,1600,wp_fire
	defWPpos	-400,-300,1000
	defWPpos	400,400,1000
	defWPpos	0,0,200

	defWPpostab	szaco0b
;	defWPpos	40<<8,0,0,wp_speedchg
	defWPpos	0,0,2500
	defWPpos	0,0,1600,wp_fire
	defWPpos	400,-300,1000
	defWPpos	-400,400,1000
	defWPpos	0,0,200

	defWPpostab	szaco0c
;	defWPpos	40<<8,0,0,wp_speedchg
	defWPpos	0,0,2500
	defWPpos	0,0,1600,wp_fire
	defWPpos	0,0,1000
	defWPpos	400,-400,1000
	defWPpos	0,0,200

	defWPpostab	szaco0d
;	defWPpos	40<<8,0,0,wp_speedchg
	defWPpos	0,0,2500
	defWPpos	0,0,1600,wp_fire
	defWPpos	-200,0,1000
 	defWPpos	-400,200,1000
	defWPpos	0,0,200


szaco0_Istrat
	s_set_alptrs	x,szaco0_strat,hitflash_Istrat,escapeeexplode2_Istrat
	s_set_aldata	x,#szaco0HP,#szaco0AP
	s_set_debrisdata	x,#zaco_4p
	s_set_alvar2rnd	x,al_sbyte1,#3
	s_set_alsflag	x,relexplode
	set_sound2		x,#$f
;	s_set_lifecnt	x,#150
	s_set_alvar		W,x,al_sword1,#340
szaco0_strat
	s_start_strat

	s_jmp_alvarNE		B,x,al_sbyte1,#0,.n0
	s_goto_WPpostab		x,x,1,#40,1,2,3,#300,#40,szaco0a
.n0	
	s_jmp_alvarNE		B,x,al_sbyte1,#1,.n1
	s_goto_WPpostab		x,x,1,#40,1,2,3,#300,#40,szaco0b
.n1	
	s_jmp_alvarNE		B,x,al_sbyte1,#2,.n2
	s_goto_WPpostab		x,x,1,#40,1,2,3,#300,#40,szaco0c
.n2
	s_jmp_alvarNE		B,x,al_sbyte1,#3,.n3
	s_goto_WPpostab		x,x,1,#40,1,2,3,#300,#40,szaco0d
.n3

	
	s_beqdec_alvar	W,x,al_sword1,.nrel
	s_add_playerZ	x
.nrel	s_end_strat

;**********************************************************************************
cruiser2fire_Istrat
	s_start_strat
	s_make_childobj	#hou_3,#1,cruiser2launcher_Istrat,enemy1	      
	s_set_relpos	y,#20,#-10,#-15
	s_set_alvar	B,y,al_sbyte2,#1
	s_make_childobj	#hou_3,#2,cruiser2launcher_Istrat,enemy1	      
	s_set_relpos	y,#20,#-10,#0
	s_set_alvar	B,y,al_sbyte2,#20
	s_make_childobj	#hou_3,#3,cruiser2launcher_Istrat,enemy1	      
	s_set_relpos	y,#20,#-10,#15
	s_set_alvar	B,y,al_sbyte2,#40
	s_set_strat	x,cruiser2fire_strat
	s_brl		cruiser2_Icont
cruiser2_Istrat
	s_start_strat
	s_set_strat	x,cruiser2_strat
cruiser2_Icont
	s_set_aldata	x,#hardHP,#hardAP
	s_set_alvar	B,x,al_rotz,#-deg22-deg11
	s_set_alvar	B,x,al_roty,#deg180+deg22+deg11
	s_set_colltype	x,enemy1
	s_set_alsflag	x,colldisable
	set_sound2	x,#$b
	s_jmpto_strat

cruiser2fire_strat
	s_start_strat
	s_count_childs	x,svar_byte1
	s_jmp_varNOTZERO	B,svar_byte1,.cont2
	s_speedto		x,#50,1
	s_jsl		    	makeMEDexpobj_srou
	s_jsl			addrnd2posxyz2_srou

	s_jmpNOT_onframe	7,15,.nsnd
	trigse			se_destructenemynear
.nsnd
	s_jmpNOT_onframe	14,15,.nsnd1
	trigse			se_destructenemymid
.nsnd1


	s_make_smoke	1,.cont
.cont
	s_jmp_alvarEQ	B,x,al_rotx,#deg45,.cont2
	s_add_alvar	B,x,al_rotx,#1
.cont2

cruiser2_strat
	s_start_strat
	s_gen_3dvecs	x,al_roty,al_rotx,al_speed
	s_add_vecs2pos	x
	s_add_playerZ	x
	s_end_strat

cruiser2launcher_Istrat
	s_start_strat
	s_set_alptrs	x,cruiser2launcher_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata	x,#cruiser2launcherHP,#hardAP
cruiser2launcher_strat
	s_start_strat
	s_do_childrelpos	x,4
	s_add_alvar		B,x,al_rotx,#-deg45+deg22+deg11
	s_add_alvar		B,x,al_roty,#-deg90


	s_decbne_alvar		B,x,al_sbyte2,.nfire
	s_set_alvar		B,x,al_sbyte2,#60

	s_set_objtobeplayer	y

	s_jmp_rightofview	x,.nfirecheat
	s_jmp_Xdistless		x,y,#1000,.nfirecheat
	s_push_alvar		W,x,al_worldx
	s_push_alvar		W,x,al_worldz
	s_push_alvar		B,x,al_roty
	s_push_alvar		B,x,al_rotx
	s_set_alvar		B,x,al_roty,#deg180
	s_set_alvar		B,x,al_rotx,#0
	s_set_alvar		W,x,al_worldx,#0
	s_sub_alvar		W,x,al_worldz,#1000
	s_weapon_pos		#0,#0,#0
	s_weapon_rndrot		7,7
	s_fire_weapon		x,FAKEFARHMISSILE1
	s_set_alvar		W,y,al_ptr,playpt
	s_set_colltype		y,enemy1
	s_pull_alvar		B,x,al_rotx
	s_pull_alvar		B,x,al_roty
	s_pull_alvar		W,x,al_worldz
	s_pull_alvar		W,x,al_worldx
	s_brl			.nfire
.nfirecheat

	s_jmp_Xdistmore		x,y,#700,.nfire
	s_weapon_pos		#0,#0,#5
	s_weapon_rot		#0,#0
	s_fire_weapon		x,FAKEFARHMISSILE1,.nfire
	s_set_alvar		W,y,al_ptr,playpt
	s_set_colltype		y,enemy1
.nfire

	s_end_strat


;**********************************************************************************
ships_Istrat
	s_start_strat
	s_set_strat	x,ships_strat
	s_set_alsflag	x,colldisable
	s_set_lifecnt	x,#70
ships_strat
	s_start_strat
	s_dec_lifecnt	x
	s_add_alvars	W,x,al_worldx,x,al_sword1
	s_add_alvars	W,x,al_worldy,x,al_sword2
	s_add_alvar	W,x,al_worldz,#medpspeed-5
	s_end_strat

;**********************************************************************************
szaco5_Istrat	; to player and loop up.
	s_start_strat
	s_set_alptrs	x,szaco5_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata	x,#szaco5HP,#szaco5AP
	s_set_debrisdata	x,#zaco_7p
	s_set_alvar	B,x,al_roty,#deg180
	s_set_colltype	x,enemy1
	s_init_anim	x,#0
	s_set_alsflag	x,relexplode
	s_set_speed		x,#30
	jsl		makeengine_srou_l	
szaco5_strat
	s_start_strat
	s_set_objtobeplayer	y

	s_jmp_ifnotstate	x,0,.ns0
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,2
	s_jmp_Zdistmore		x,y,#1500,.ns0
	s_weapon_pos		#0,#0,#0
	s_weapon_rots2obj	y
	phy
	s_fire_weapon		x,RELSLOWELASER
	ply
	s_next_state		x
.ns0

	s_jmp_ifnotstate	x,1,.ns1
	s_set_alvar		B,x,al_sbyte1,#deg360/8
	s_cmp_anim		x,#9
	s_beq			.max
	s_add_anim		x,#1,#10
.max 	s_jmp_Zdistmore		x,y,#200,.ns1
	s_set_speed		x,#40
	s_next_state		x
	s_set_alvar2rnd		x,al_sbyte2,#31
	s_sub_alvar		B,x,al_sbyte2,#15
	s_add_alvars		B,x,al_roty,x,al_sbyte2
.ns1

	s_jmp_ifnotstate	x,2,.ns2
	s_beqdec_alvar		B,x,al_sbyte1,nextstate
	s_sub_alvar		B,x,al_rotx,#8
.ns2

	s_jmp_ifnotstate	x,3,.ns3
	s_banktoplayer	
.ns3
	

	s_gen_3dvecs		x,al_roty,al_rotx,al_speed
	s_add_vecs2pos		x
	s_add_playerZ		x
	jsl		updateengine_srou_l	
	s_end_strat
	


;**********************************************************************************
sdoor1_Istrat			; first door
	s_start_strat	
	s_set_alsflag	x,colldisable
	s_set_strat	x,sdoor1_strat
	s_init_anim	x,#0
	s_set_altype	x,gnd
sdoor1_strat
	s_start_strat
	s_set_objtobealvar	y,x,al_sword1
	s_copy_pos		x,y
	s_add_alvar		W,x,al_worldz,#(-100<<2)+50

	s_add_playerZ		x
	
	s_jmp_varAND		B,gameflags,#gf_stratdone2,.close
	s_jmp_varAND		B,gameflags2,#gf2_stratflag1,.open
	s_set_objtobeplayer	y
	s_jmp_objinfront	y,x,.open
	s_jmp_Zdistless		x,y,#80<<2,.open

.close	
	s_doorclose_snd	9	
	s_cmp_anim		x,#0
	s_beq			.nopen
	s_add_anim		x,#-1,#10
	s_bra			.nopen


.open	
	s_dooropen_snd	0	
	s_cmp_anim		x,#9
	s_beq			.max
	s_add_anim		x,#1,#10
	s_bra			.nopen
.max	s_AND_var		B,gameflags2,#~gf2_stratflag1

.nopen
	s_end_strat			       
						   

;**********************************************************************************
sdoor2_Istrat			; second door
	s_start_strat	
	s_set_alsflag	x,colldisable
	s_set_strat	x,sdoor2_strat
	s_init_anim	x,#0
	s_set_altype	x,gnd
	s_and_var		B,gameflags,#~gf_stratdone2
sdoor2_strat
	s_start_strat


	s_jmpNOT_varAND		B,gameflags,#gf_stratdone2,.ninvis
	s_Set_alsflag		x,invisible
.ninvis

	s_set_objtobealvar	y,x,al_sword1
	s_copy_pos		x,y
	s_add_alvar		W,x,al_worldz,#(-10<<2)

	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#10<<2,.nopen
	s_dooropen_snd	0	
	s_cmp_anim		x,#9
	s_beq			.nopen
	s_add_anim		x,#1,#10
.nopen	
	s_end_strat			       
;**********************************************************************************
leng0_Istrat
	s_start_strat
	s_set_alptrs	x,leng0_strat,0,0
	s_set_aldata	x,#hardHP,#hardAP
	s_init_anim	x,#0
	s_set_alsflag	x,colldisable
leng0_strat
	s_start_strat
	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#1300,.nopen
	s_cmp_anim		x,#0
	s_bne		.nsnd
	trigse		$54
.nsnd
	s_cmp_anim		x,#10
	s_beq			.max
	s_add_anim		x,#1,#11
	s_brl			.nopen
.max	s_clr_alsflag		x,colldisable
.nopen
	s_end_strat


;**********************************************************************************
cruiser1_Istrat
	s_start_strat	
	s_set_alsflag	x,sflag1
cruiser1F_Istrat
	s_set_aldata	x,#30,#hardAP
	s_set_alptrs	x,cruiser1_strat,hitflashMexp_Istrat,cruiser1fall_Istrat
	s_set_speed	x,#20
	s_set_alvar	B,x,al_roty,#-deg90
	s_set_colltype	x,enemy1	
	set_sound2	x,#$a
cruiser1_strat
	s_start_strat

	s_beqdec_alvar	B,x,al_sbyte1,.turn
	s_brl		.nturn
.turn
	s_jmp_notdelay	2,.nturn
	s_add_alvar	B,x,al_roty,#-1
.nturn
	s_jmp_alsflag		x,sflag1,.nfire
	s_set_objtobeplayer	y
	s_jmp_outZdistrng	x,y,#1000,#2000,.nfire
	s_jmp_notdelay		5,.nfire,al1pt

	s_weapon_pos		#0,#0,#0
	s_weapon_rot		#0,#0
	s_fire_weapon		x,STBHMISSILE1
	s_set_alvar		B,y,al_sbyte1,#-deg90
	s_set_alvar		B,y,al_sbyte2,#0
	s_set_alvar		W,y,al_ptr,playpt

	s_fire_weapon		x,STBHMISSILE1
	s_set_alvar		B,y,al_sbyte1,#deg90
	s_set_alvar		B,y,al_sbyte2,#0
	s_set_alvar		W,y,al_ptr,playpt

.nfire	



cruiser1_cont
	s_gen_3dvecs	x,al_roty,al_rotx,al_speed
	s_add_vecs2pos	x
	s_add_playerZ	x
	s_end_strat


cruiser1fall_Istrat
	s_start_strat
	s_set_expstrat	x,cruiser1fall_strat
	jsl		makeLexpobj_srou
	s_clr_alsflag	y,noexpsnd
	trigse		$21
cruiser1fall_strat
	s_start_strat
	s_jmp_alvarEQ	B,x,al_rotx,#deg45,.nadd
	s_add_alvar	B,x,al_rotx,#1
.nadd
	s_make_smoke	2,.nsmk
.nsmk	s_brl		cruiser1_cont
	


;**********************************************************************************
crane0_Istrat
	s_start_strat
	s_set_alptrs	x,crane0_strat,crane0col_Istrat,0
	s_set_aldata	x,#hardHP,#2
	s_set_alvar	B,x,al_sbyte1,#6
	s_make_obj	#zaco_7,.badobj
	s_set_alvartobeobj	x,al_ptr,y
	s_set_alsflag		y,colldisable
	s_set_alptrs		y,0,hitflash_Istrat,explode_Istrat
	s_set_aldata		y,#6,#8
	s_set_alsflag		y,shadow
	s_init_anim		y,#0
	s_set_colltype		y,enemy1
.badobj
	s_set_alsflag		x,shadow
	s_set_colltype		x,enemy1
crane0_strat
	s_start_strat

	s_set_objtobeplayer	y

	s_jmp_ifnotstate	x,0,.ns0
;	s_jmp_Zdistmore		x,y,#1500,.ns0
	s_set_alvar		B,x,al_roty,#deg90
	s_add_alvar		W,x,al_worldx,#-10
	s_decbne_alvar		B,x,al_sbyte1,.ns0
	s_next_state		x
	s_set_alvar		B,x,al_sbyte1,#6000/(medpspeed-10)
.ns0


	s_jmp_ifnotstate	x,1,.ns1
	s_achase_alvar		B,x,al_roty,#deg180,2
	s_add_playerZ		x
	s_add_alvar		W,x,al_worldz,#-10
	s_decbne_alvar		B,x,al_sbyte1,.ns1
	s_set_alvar		B,x,al_sbyte1,#6
	s_next_state		x
.ns1


	s_jmp_ifnotstate	x,2,.ns2
	s_achase_alvar		B,x,al_roty,#deg90,2
	s_add_alvar		W,x,al_worldx,#-10
	s_decbne_alvar		B,x,al_sbyte1,.ns2
	s_next_state		x
.ns2

	s_jmp_Zdistmore		x,y,#1700,.ndash
	phy
	s_set_objtobealvar	y,x,al_ptr
	s_set_strat		y,tzaco7go_Istrat
	s_set_alvar		W,x,al_ptr,#0
	ply
.ndash

	s_set_objtobealvar	y,x,al_ptr
	s_chk_objptr		y,.ncarry
	s_copy_pos		y,x
	s_copy_rots		y,x
.ncarry

	s_end_strat		x



crane0col_Istrat
	s_start_strat
	s_set_objtobealvar	y,x,al_collobjptr
	s_jmpNOT_colltype	y,laser,.end
	s_jmpNOT_colltype	y,friend,.end

	s_set_objtobealvar	y,x,al_ptr
	s_jmpNOT_alvarAND	B,x,al_hitflags,#HF1,.nexp
	s_kill_obj		y
	s_brl			.end
.nexp
	s_jmpNOT_alvarAND	B,x,al_hitflags,#HF2,.ndrop
	s_set_strat		y,tzaco7fall_Istrat
	s_set_alvar		W,x,al_ptr,#0
.ndrop


.end
	s_set_alvar		B,x,al_hitflags,#0
	s_jmpto_strat	


tzaco7fall_Istrat
	s_start_strat
	s_jmp_lower		x,#0,explode_Istrat
	s_add_alvar		W,x,al_vy,#5
	s_add_vecs2pos		x
	s_add_playerZ		x
	s_end_strat

tzaco7go_Istrat
	s_set_strat	x,tzaco7go_strat
	s_set_alvar	W,x,al_vy,#5
	s_set_alvar	W,x,al_vz,#-20
	s_clr_alsflag	x,colldisable
tzaco7go_strat
	s_start_strat      

	s_cmp_anim	x,#9
	s_beq		.nanim
	s_add_anim	x,#1,#10
.nanim
	
	s_jmp_alvarZERO	W,x,al_vy,.ny
	s_sub_alvar	W,x,al_vy,#1
	s_brl		.ncy
.ny
	s_achase_alvar	W,x,al_worldy,player_posy,3
.ncy

	s_add_playerZ	x
	s_add_vecs2pos	x
	s_end_strat

;**********************************************************************************
twall0_Istrat
	s_start_strat
	s_hardvars		x
	s_set_strat		x,twall0_strat
	s_set_alvar		B,x,al_roty,#deg180
	s_set_alsflag		x,shadow
	set_sound2		x,#$e
twall0_strat
	s_start_strat

	s_jmp_ifnotstate	x,0,.nup
	s_add_alvar		W,x,al_worldy,#-5
	s_jmp_alvarEQ		W,x,al_worldy,#-120+(10<<1),setstate1
.nup
	s_jmp_ifnotstate	x,1,.ndown
	s_add_alvar		W,x,al_worldy,#5
	s_jmp_alvarEQ		W,x,al_worldy,#0-(10<<1),setstate0
.ndown
	s_end_strat

;**********************************************************************************
	ifeq	1
twall2_Istrat
	s_start_strat
	s_hardvars		x
	s_set_strat		x,twall2_strat
	s_set_alvar		B,x,al_roty,#deg180
twall2_strat
	s_start_strat

	s_jmp_ifnotstate	x,0,.nright
	s_add_alvar		W,x,al_worldx,#5
	s_jmp_alvarEQ		W,x,al_worldx,#90-(30<<1),setstate1
.nright
	s_jmp_ifnotstate	x,1,.nleft
	s_add_alvar		W,x,al_worldx,#-5
	s_jmp_alvarEQ		W,x,al_worldx,#-90+(30<<1),setstate0
.nleft
	s_end_strat

	endc

;**********************************************************************************
tzaco7cat_Istrat
	s_start_strat
	s_set_alptrs	x,tzaco7cat_strat,hitflash_Istrat,explode_Istrat
	s_init_anim	x,#0
	s_set_aldata	x,#2,#4
	s_set_colltype	x,enemy1
tzaco7cat_strat
	s_start_strat
	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#500,.ndist
	s_cmp_anim		x,#9
	s_beq			.ndist
	s_add_anim		x,#1,#10
.ndist
	s_end_strat





;**********************************************************************************
warker3_Istrat
	s_start_strat
	s_set_alptrs	x,warker3_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata	x,#8,#4
	s_set_alvar	B,x,al_roty,#deg180
	s_init_anim	x,#0
	s_set_colltype	x,enemyweap
warker3_strat
	s_start_strat

	s_set_objtobeplayer	y

	s_jmp_ifnotstate	x,0,.ns0
	s_jmp_Zdistmore		x,y,#700,.ns0
	s_next_state		x
	s_set_alvar		W,x,al_vz,#medpspeed-15
	s_set_alvar		W,x,al_vy,#-10
	s_brl			.end
.ns0

	s_jmp_ifnotstate	x,1,.ns1
	s_achase_alvar		W,x,al_worldx,#0,2
	s_add_alvar		W,x,al_vy,#1
	s_jmp_higher		x,#0,.ns1
	s_set_alvar		W,x,al_vy,#0
	s_next_state		x
.ns1	

	s_jmp_ifnotstate	x,2,.ns2
	s_set_alsflag		x,sflag1
	s_set_alvar		W,x,al_vz,#medpspeed+10
	s_jmp_Zdistless		x,y,#1000,.ns2
	s_weapon_pos		#0,#-40>>weapon_scale,#0
	s_weapon_rots2obj	y
	phy
	s_fire_weapon		x,RELSLOWELASER
	ply
	s_next_state		x
	s_set_alvar2rnd		x,al_sbyte1,#3
.ns2

	s_jmp_ifnotstate	x,3,.ns3
	s_set_alvar		W,x,al_vy,#0
	s_jmp_Zdistless		x,y,#1000,.nstop
	s_set_alvar		W,x,al_vz,#0
.nstop

	s_jmp_alvarEQ		B,x,al_sbyte1,#0,.top
	s_jmp_alvarNE		B,x,al_sbyte1,#1,.ntop
.top	s_achase_alvar		B,x,al_rotz,#deg180,1
	s_achase_alvar		W,x,al_worldy,#-120,2
	s_achase_alvar		W,x,al_worldx,player_posx,2
	s_brl			.ns3
.ntop
	s_jmp_alvarNE		B,x,al_sbyte1,#2,.nleft
	s_achase_alvar		B,x,al_rotz,#deg90,1
	s_achase_alvar		W,x,al_worldy,player_posy,2
	s_achase_alvar		W,x,al_worldx,minPmoveX,2
	s_brl			.ns3
.nleft

	s_jmp_alvarNE		B,x,al_sbyte1,#3,.nright
	s_achase_alvar		B,x,al_rotz,#-deg90,1
	s_achase_alvar		W,x,al_worldy,player_posy,2
	s_achase_alvar		W,x,al_worldx,maxPmoveX,2
.nright


.ns3

	s_jmpNOT_alsflag	x,sflag1,.nanim
	s_add_anim		x,#1,#11
.nanim

.end

	s_add_vecs2pos	x
	s_end_strat


;**********************************************************************************
zaco7_Istrat
	s_start_strat
	s_set_aldata	x,#szaco5HP,#szaco5AP
	s_set_alptrs	x,zaco7_strat,hitflash_Istrat,explode_Istrat
zaco7_strat
	s_start_strat

	s_cmp_anim		x,#9
	s_beq			.max
	s_add_anim		x,#1,#10
.max


	s_set_objtobeplayer	y

	s_jmp_Zdistless		x,y,#600,.nbank
	s_banktoplayer	
	s_brl			.cont
.nbank
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,3	
	s_achase_alvar		B,x,al_rotz,#0,3
.cont

	s_gen_3dvecs	x,al_roty,al_rotx,al_speed
	s_add_vecs2pos	x
	s_add_playerZ	x
	s_end_strat
;**********************************************************************************
; come up from planet and shoot laser at player



bazooka1L_Istrat	
	s_start_strat
	s_set_alsflag	x,sflag1
bazooka1R_Istrat
	s_start_strat
	s_set_debrisdata	x,#bazz_1p
	s_set_alvar		W,x,al_sword1,#bazz_1q
	s_brl			bazooka_Icont	


bazookaL_Istrat	
	s_start_strat
	s_set_alsflag	x,sflag1
bazookaR_Istrat
	s_start_strat
	s_set_debrisdata	x,#bazooka1
	s_set_alvar		W,x,al_sword1,#bazooka2
bazooka_Icont
	s_set_alptrs	x,bazooka_strat,hitflash_Istrat,bazexp_Istrat
	s_set_colltype		x,enemy1
	s_set_aldata	x,#bazookaHP,#bazookaAP
        	s_init_anim	x,#0
	s_set_alvar	W,x,al_vy,#-15
	s_set_alvar	B,x,al_rotx,#-deg90
	s_set_alvar	B,x,al_roty,#deg180
	s_set_speed	x,#80
	set_sound2		x,#$3

bazooka_strat
	s_start_strat

	s_jmp_ifstate		x,0,.nchy
	s_jmp_ifstate		x,3,.nchy
	s_achase_alvar		W,x,al_worldy,player_posy,2
.nchy

;----------------------------------
	s_jmp_ifNOTstate	x,0,.nsup
	s_jmp_lower		x,#space_viewCY+500,.nsup
	s_speedto		x,#0,1
	s_achase_alvar		B,x,al_rotx,#0,3,nextstate
.nsup

;----------------------------------
	s_jmp_ifNOTstate	x,1,.ncent
	s_speedto		x,#0,1
	s_set_alvar		B,x,al_sbyte1,#deg90
	s_set_objtobeplayer	y
	s_set_var		B,svar_byte1,#-deg45/2
	s_jmp_alsflag		x,sflag1,.leftoff
	s_set_var		B,svar_byte1,#deg45/2
.leftoff
	
	s_obj2obj_angleOFF 	x,y,al_roty,svar_byte1,2,nextstate
.ncent
;----------------------------------
	s_jmp_ifNOTstate	x,2,.nfire
	s_speedto		x,#0,2
	s_beqdec_alvar		B,x,al_sbyte1,nextstate


	s_jmp_alsflag		x,sflag1,.leftturn
	s_sub_alvar		B,x,al_roty,#2
	s_brl			.turncont
.leftturn	s_add_alvar		B,x,al_roty,#2
.turncont

;	s_jmp_notdelay		1,.nfire
	s_add_anim		x,#1,#3
	s_cmp_anim		x,#0
	s_beq			.nfire
	s_cmp_anim		x,#2
	s_beq			.left
	s_weapon_pos		#(30<<2)>>weapon_scale,#0,#0
	s_brl			.fire
.left	s_weapon_pos		#(-30<<2)>>weapon_scale,#0,#0
.fire	s_weapon_rndrot		3,0
	s_fire_weapon		x,RELSLOWELASER
.nfire	
;----------------------------------
	s_jmp_ifNOTstate	x,3,.ngo
	s_speedto		x,#80,4
	s_achase_alvar		B,x,al_roty,#deg0,3
	s_achase_alvar		B,x,al_rotx,#deg45,3
.ngo


.end
	s_gen_3dvecs		x,al_roty,al_rotx,al_speed
	s_add_vecs2pos		x
	s_add_playerZ		x
	s_end_strat
	
bazexp_Istrat
	s_start_strat
	s_copy_alvar2var	W,x,svar_word1,al_sword1
	s_make_obj		svar_word1,.badobj
	s_copy_pos		y,x
	s_copy_rots		y,x
	s_set_strat		y,bazfall_Istrat
.badobj
	s_jmp		escapeeexplode_Istrat

bazfall_Istrat
	s_start_strat
	s_set_lifecnt		x,#30
	s_set_strat		x,bazfall_strat
	s_set_alsflag		x,colldisable
bazfall_strat
	s_start_strat
	s_add_alvar		B,x,al_roty,#16
	s_add_alvar		W,x,al_vy,#2
	s_make_smoke		1,.nsmk
.nsmk
	s_add_vecs2pos		x
	s_add_playerz		X
	s_dec_lifecnt		x
	s_end_strat


;**********************************************************************************
uperm_Istrat	; come up from planet and dash to player.
	s_start_strat
	s_set_alptrs 		x,uperm_strat,hitflash_Istrat,explodegate2_Istrat
	s_set_colltype		x,enemy1
	s_set_colltype		x,enemyweap
	s_set_aldata		x,#upermHP,#upermAP
	s_set_alvar		B,x,al_roty,#deg180
	s_set_alvar		B,x,al_rotx,#-deg90
	s_set_speed		x,#70
	s_set_alvar		W,x,al_sword1,player_posy
	set_sound2		x,#$2
uperm_strat
	s_start_strat

	s_copy_alvar2var	W,x,svar_word1,al_sword1
	s_add_var		W,svar_word1,#756
	s_jmp_lower		x,svar_word1,.nysearch
	s_achase_alvar		B,x,al_rotx,#0,3
.nch	
	s_set_objtobeplayer	y
	s_jmp_outZdistrng	x,y,#400,#1300,.nysearch
	s_speedto		x,#80,2
	s_add_alvar		B,x,al_rotz,#10
        	s_obj2obj_angle		x,y,al_roty,1
.nysearch
	s_add_alvar		B,x,al_rotz,#8
	s_gen_3dvecs		x,al_roty,al_rotx,al_speed
	s_add_vecs2pos		x
	s_add_playerZ		x
	s_end_strat

;**********************************************************************************
warp_Istrat
	s_set_alptrs 		x,warp_strat,hitflash_Istrat,explode_Istrat
	s_set_colltype		x,enemy1
	s_set_colltype		x,enemyweap
	s_set_aldata		x,#warpHP,#warpAP
	s_set_alvar		B,x,al_rotx,#deg90
	s_set_alvar2rnd		x,al_sbyte1,#7
	s_scale_ALvar		B,x,al_sbyte1,2
	s_set_alvar		B,x,al_sbyte2,#1
	s_set_alvar		B,x,al_sbyte3,#0
	s_set_alvar		B,x,al_sbyte4,#4
warp_strat
	s_start_strat
 

;-----------------------------------------------
	s_jmp_ifnotstate	x,0,.nto
	s_add_alvar		B,x,al_rotz,#12
	s_set_var2alvartab	B,W,W,svar_word1,x,al_sbyte1,warppostab
	s_set_var2alvartab	B,W,W,svar_word2,x,al_sbyte1,warppostab+2
	s_achase_2alvars	W,x,al_worldx,svar_word1,2,al_worldy,svar_word2,2,nextstate
	s_copy_alvar2var	W,x,svar_word1,al_sword1
	s_add_var		W,svar_word1,player_posz
	s_add_var		W,svar_word1,#1500
	s_achase_alvar		W,x,al_worldz,svar_word1,2
.nto
;-----------------------------------------------
	s_jmp_ifnotstate	x,1,.nshapein
	s_achase_alvar		B,x,al_rotz,#0,2
	s_set_alvar		B,x,al_sbyte2,#20	; fire time
	s_jmp_notdelay		2,.nshapein

	s_jmp_alvarNE		B,x,al_sbyte3,#6,.n6
	trigse			$2b
	s_jmp			nextstate
.n6
	s_add_alvar		B,x,al_sbyte3,#2
.nshapein

;-----------------------------------------------
	s_jmp_ifnotstate	x,2,.nfire
	s_achase_alvar		B,x,al_rotx,#0,2
	s_achase_alvar		B,x,al_rotz,#0,2
	s_clr_alsflag		x,colldisable
	s_beqdec_alvar		B,x,al_sbyte2,nextstate
	s_jmp_notdelay		3,.nfire,al1pt
	s_set_objtobeplayer	y
	s_weapon_pos		#0,#0,#-elaserfireZoff>>weapon_scale
	s_jmp_random		.norm,70
	s_fire_weapon		x,RELSLOWELASERHOME
	s_brl			.nfire
.norm
	s_weapon_rndrots2obj	y,7,7
	s_fire_weapon		x,RELSLOWELASER
.nfire

;-----------------------------------------------
	s_jmp_ifnotstate	x,3,.nshapeout
	s_achase_alvar		B,x,al_rotx,#deg90,2
	s_add_alvar		B,x,al_rotz,#12
	s_set_alsflag		x,colldisable
	s_jmp_notdelay		2,.nshapeout

	s_set_alvar2rnd		x,al_sword1
	a16
	lda			al_sword1,x
	sexa
	asl			a
	sta			al_sword1,x
	a8	

	s_sub_alvar		B,x,al_sbyte3,#2
	s_jmp_alvarNOTZERO	B,x,al_sbyte3,.nshapeout
	s_set_state		x,#0
	s_decbne_alvar		B,x,al_sbyte4,.ngoa
	s_set_state		x,#4
.ngoa

	s_add_alvar		B,x,al_sbyte1,#4
	s_jmp_alvarNE		B,x,al_sbyte1,#32,.nmax
	s_set_alvar		B,x,al_sbyte1,#0
.nmax	
.nshapeout
;-----------------------------------------------
	s_jmp_ifnotstate	x,4,.nsgoai
	s_set_var2rnd		svar_byte1
	s_make_xyvec		x,svar_byte1,#40
	s_set_alvar		W,x,al_vz,#-30
	s_set_state		x,#5
.nsgoai
	
	s_jmp_ifnotstate	x,5,.nsgoa
	s_add_vecs2pos		x
.nsgoa



;-----------------------------------------------

	s_set_alvar2alvartab	B,W,W,x,al_shape,x,al_sbyte3,warpshapetab
.end
	s_add_playerZ		x
	s_end_strat

warpshapetab
	dw	warp_3
	dw	warp_2
	dw	warp_1
	dw	warp

warppostab
	dw	500,-500-space_viewCY
	dw	-500,-500-space_viewCY
	dw	-500,500-space_viewCY
	dw	500,500-space_viewCY
	dw	0,0-space_viewCY
	dw	0,-250-space_viewCY
	dw	250,250-space_viewCY
	dw	-250,250-space_viewCY	


;**********************************************************************************
tank2_Istrat
	s_start_strat
	set_sound2	x,#$4
	s_set_alptrs 		x,tank2_strat,hitflash_Istrat,explode_Istrat
	s_set_colltype		x,enemy1
	s_set_colltype		x,enemyweap
	s_set_aldata		x,#tank2HP,#tank2AP
	s_set_alvar		B,x,al_roty,#deg180
	s_set_speed		x,#30

	s_make_childobj	#zaco_7,#1,tank2zaco_Istrat,enemy1	      
	s_set_relpos	y,#-30,#-35,#5
	s_set_alvar	W,y,al_sword2,#-140
	s_make_childobj	#zaco_7,#2,tank2zaco_Istrat,enemy1	      
	s_set_relpos	y,#30,#-35,#5
	s_set_alvar	W,y,al_sword2,#-140

	s_make_childobj	#zaco_7,#3,tank2zaco_Istrat,enemy1	      
	s_set_relpos	y,#-30,#-35,#-40
	s_set_alvar	W,y,al_sword2,#-200
	s_make_childobj	#zaco_7,#4,tank2zaco_Istrat,enemy1	      
	s_set_relpos	y,#30,#-35,#-40
	s_set_alvar	W,y,al_sword2,#-200


tank2_strat	
	s_start_strat


;-----------------------------------------
	s_jmp_ifnotstate	x,0,.nTopl
	s_set_objtobeplayer	y
	s_set_alvar		B,x,al_sbyte2,#100
	s_jmp_Zdistless		x,y,#1000,nextstate
.nTopl

;-----------------------------------------
	s_jmp_ifnotstate	x,1,.nback
	s_speedto		x,#-20,1,nextstate
	s_jmp_alvarPL		B,x,al_speed,.nback
	s_sub_alvar		B,x,al_roty,#1
	s_jmp_frameMORE		15,31,.nback
	s_add_alvar		B,x,al_roty,#2
.nback
;-----------------------------------------
	s_jmp_ifnotstate	x,2,.nfor
	s_speedto		x,#20,1,nextstate
	s_jmp_alvarPL		B,x,al_speed,.nfor
	s_sub_alvar		B,x,al_roty,#1
	s_jmp_frameMORE		15,31,.nfor
	s_add_alvar		B,x,al_roty,#2
.nfor


;-----------------------------------------
	s_jmp_ifnotstate	x,3,.ngo
	s_jmp_alvarEQ		B,x,al_roty,#deg180+deg45,.ngo
	s_add_alvar		B,x,al_roty,#1
	s_speedto		x,#30,1
.ngo

	s_beqdec_alvar		B,x,al_sbyte2,.ninc
	s_jmp_alvarNE		B,x,al_sbyte2,#90,.nf1
	s_set_childstate	#1,#1
.nf1
	s_jmp_alvarNE		B,x,al_sbyte2,#70,.nf2
	s_set_childstate	#2,#1
.nf2
	s_jmp_alvarNE		B,x,al_sbyte2,#50,.nf3
	s_set_childstate	#3,#1
.nf3
	s_jmp_alvarNE		B,x,al_sbyte2,#30,.nf4
	s_set_childstate	#4,#1
.nf4
.ninc


	s_gen_vecs		x,al_roty,al_speed
	s_add_vecs2pos		x
	s_add_playerZ		x
	s_end_strat

;-----------------------------------------------------------------------------
	
tank2zaco_Istrat
	s_start_strat
	s_set_alptrs	x,tank2zaco_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata	x,#4,#8
	s_init_anim	x,#0
	s_set_colltype	x,enemyweap
	jsl		makeengine_srou_l
tank2zaco_strat
	s_start_strat

;------------------------------
	s_jmp_ifnotstate	x,0,.nrelpos
	s_set_objtobemother	y,x
	s_jmp_objptrok		y,.ok
	s_set_strat		x,explode_Istrat
.ok	
	s_do_childrelpos	x,1
	s_brl			.end
.nrelpos
	

;------------------------------
	s_jmp_ifnotstate	x,1,.nup
	s_jmp_higheralvar	x,al_sword2,nextstate
	s_add_alvar		W,x,al_worldy,#-5
	s_cmp_anim		x,#9
	s_beq			.endrel
	s_add_anim		x,#1,#10
	s_brl			.endrel
.nup


;------------------------------
	s_jmp_ifnotstate	x,2,.ngo
	s_speedto		x,#30,1
	s_set_objtobeplayer	y
	s_jmp_Zdistless		x,y,#500,.ngo
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,2
	s_jmp_notdelay		2,.ngo
	s_weapon_pos		#0,#0,#0
	s_weapon_rndrots2obj	y,7,7
	s_fire_weapon		x,RELSLOWELASER
.ngo

	s_gen_3dvecs		x,al_roty,al_rotx,al_speed
	s_add_vecs2pos		x
.endrel	s_add_playerZ		x
	jsl		updateengine_srou_l

.end	s_end_strat
	


;**********************************************************************************
ship3a_Istrat
	s_start_strat
	s_set_alsflag	x,colldisable
	s_set_alvar	B,x,al_roty,#deg180
	s_add_alvar	W,x,al_worldz,#-10	
	s_add_alvar	W,x,al_worldy,#8
	s_jmp_alvarEQ	B,x,al_rotx,#deg45,.max
	s_add_alvar	B,x,al_rotx,#1
.max		
	s_jmp_lower	x,#10000,remove_Istrat
	s_add_playerZ	x
	s_end_strat

;**********************************************************************************
dragonfly_Istrat
	s_start_strat
	s_set_alptrs	x,dragonfly_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata	x,#dragonflyHP,#dragonflyAP
	s_set_speed	x,#70
	s_set_alvar	B,x,al_roty,#-deg90
	s_set_lifecnt	x,#100
	s_set_alsflag	x,shadow
	s_set_colltype	x,enemy1
	s_set_alvar	B,x,al_sbyte1,#35
dragonfly_strat
	s_start_strat
	
;--------------------------------------
	s_jmp_ifnotstate	x,0,.ndown
	s_achase_alvar		B,x,al_rotx,#deg11,2
	s_achase_alvar		B,x,al_roty,#-deg90,2
	s_decbne_alvar		B,x,al_sbyte1,.ndown
	s_set_alvar		B,x,al_sbyte1,#20
	s_next_state		x
	jsr			makeSdrag_srou
.ndown	
;--------------------------------------
	s_jmp_ifnotstate	x,1,.nup
	s_achase_alvar		B,x,al_rotx,#0,2
	s_achase_alvar		B,x,al_roty,#deg90,2
	s_decbne_alvar		B,x,al_sbyte1,.nup
	s_set_alvar		B,x,al_sbyte1,#20
	s_set_state		x,#2
	jsr			makeSdrag_srou
.nup	

;--------------------------------------
	s_jmp_ifnotstate	x,2,.naway
	s_achase_alvar		B,x,al_rotx,#-deg22,2
	s_achase_alvar		B,x,al_roty,#-deg45,2
.naway	

;--------------------------------------
	s_dec_lifecnt		x

	s_gen_3dvecs	x,al_roty,al_rotx,al_speed
	s_add_vecs2pos	x
	s_scale_alvar	W,x,al_vz,1
	s_add_playerZ	x
	s_end_strat

makeSdrag_srou
	s_make_obj		#f_dra_1,.badobj
	s_copy_pos		y,x
	s_set_strat		y,Sdragonfly_Istrat
.badobj	rts

;**********************************************************************************
Sdragonfly_Istrat
	s_start_strat	
	s_set_alptrs	x,Sdragonfly_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata	x,#SdragonflyHP,#SdragonflyAP
	s_set_speed	x,#25
	s_set_alvar	B,x,al_sbyte1,#6
	s_set_alsflag	x,shadow
	s_set_colltype	x,enemy1
Sdragonfly_strat
	s_start_strat
	
	s_set_objtobeplayer	y

	s_set_var		B,svar_byte1,#0
	s_jmp_Zdistless		x,y,#500,.nright

	s_jmp_ifnotstate	x,0,.nleft
      	s_set_var		B,svar_byte1,#-deg45
	s_decbne_alvar		B,x,al_sbyte1,.nleft
	s_set_alvar		B,x,al_sbyte1,#12
	s_next_state		x
.nleft
		  
	s_jmp_ifnotstate	x,1,.nright
      	s_set_var		B,svar_byte1,#deg45
	s_decbne_alvar		B,x,al_sbyte1,.nright
	s_set_alvar		B,x,al_sbyte1,#12
	s_set_state		x,#0
.nright
	s_jmp_ifnotstate	x,2,.nstop
	s_decbne_alvar		B,x,al_sbyte1,.naddv
	s_set_alvar		B,x,al_sbyte1,#1
	s_brl			.addv
.nstop


	s_obj2obj_3dangle	x,y,al_roty,al_rotx,1

	s_jmp_Zdistmore		x,y,#400,.nstopi
	s_set_state		x,#2
	s_set_alvar		B,x,al_sbyte1,#20
.nstopi

	s_obj2obj_3dangleOFF	x,y,al_sbyte2,svar_byte1,al_sbyte3,#0,1
	s_gen_3dvecs		x,al_sbyte2,al_sbyte3,al_speed
.addv	s_add_vecs2pos		x
.naddv
	s_add_playerZ		x	
	s_end_strat


;**********************************************************************************
spacebar_Istrat
	s_start_strat
	s_set_alptrs	x,spacebar_strat,0,0
	s_hardvars	x
	s_set_colltype	x,enemy1
spacebar_strat
	s_start_strat
	s_spacemist	x
	s_end_strat	

;**********************************************************************************
SPINspacebar_Istrat
	s_start_strat
	s_set_alptrs	x,SPINspacebar_strat,0,0
	s_hardvars	x
	s_set_colltype	x,enemy1
SPINspacebar_strat
	s_start_strat
	s_spacemist	x
	s_add_alvars	B,x,al_rotz,x,al_sbyte1
	s_achase_alvar	B,x,al_roty,#0,3
	s_end_strat	


;**********************************************************************************
spacebar1_Istrat
	s_start_strat
	s_set_alptrs	x,spacebar1_strat,0,0
	s_hardvars	x
	s_set_colltype	x,enemy1

	s_jmp_alvarZERO	B,x,al_sbyte2,.col
	s_set_alsflag	x,colldisable
.col
	
spacebar1_strat
	s_start_strat

	s_add_alvars	B,x,al_rotz,x,al_sbyte1

	
	s_spacemist	x


;	s_jmp_ifnotstate	x,0,.ndown
;;	s_add_alvar		W,x,al_worldy,#10
;	s_jmp_higher		x,#space_viewCY+300,.ndown
;	s_set_state		x,#1
;.ndown
;	s_jmp_ifnotstate	x,1,.nup
;;	s_add_alvar		W,x,al_worldy,#-10
;	s_jmp_lower		x,#space_viewCY-300,.nup
;	s_set_state		x,#0
;.nup
;	s_add_playerZ	x
	s_end_strat	

;-----------------------------------------------------------------------
spacebar2_Istrat
	s_start_strat
	s_set_alptrs	x,spacebar2_strat,0,0
	s_hardvars	x
spacebar2_strat
	s_start_strat
	s_set_objtobealvar	y,x,al_ptr
	s_chk_objptr		y,.bad
	s_push_alvar		W,y,al_worldx
	s_push_alvar		W,y,al_worldy
	s_push_alvar		W,y,al_worldz
	
	s_add_Roffs2pos		B,y,y,y,#Xspacebarlen/2,#0,#0,0,0,1
	jsl			XangleXY_l
	a8
	xba
	sta			al_rotz,x

;	s_copy_alvar2var	B,y,svar_byte1,al_rotz
;	s_achase_alvar		B,x,al_rotz,svar_byte1,3


	s_add_Roffs2pos		B,x,y,x,#Xspacebarlen/2,#0,#0,0,0,1

	s_pull_alvar		W,y,al_worldz
	s_pull_alvar		W,y,al_worldy
	s_pull_alvar		W,y,al_worldx

.bad	
	s_add_playerZ	x

	s_spacemist	x

	s_end_strat	



;**********************************************************************************
spacebar3_Istrat
	s_set_alptrs	x,spacebar3_strat,0,0
	s_hardvars	x
	s_set_objtobealvar	y,x,al_ptr
	s_copy_alvar2alvar	W,x,al_sword1,x,al_worldx
	s_copy_alvar2alvar	W,x,al_sword2,x,al_worldy
	s_copy_alvar2alvar	W,x,al_immuneptr,x,al_worldz
	s_sub_alvars		W,x,al_sword1,y,al_worldx
	s_sub_alvars		W,x,al_sword2,y,al_worldy
	s_sub_alvars		W,x,al_immuneptr,y,al_worldz
	s_set_colltype		x,enemy1

spacebar3_strat
	s_start_strat
	s_set_objtobealvar	y,x,al_ptr
	s_chk_objptr		y,.bad

	a16
	lda	al_sword1,x
	sta	x1
	lda	al_sword2,x
	sta	z1
	a8
	lda.w	al_rotz,y			
	nega
	jsl	rotate_16xz_l
	a16
	lda	x2
	clc
	adc.w	al_worldx,y
	sta	al_worldx,x
	lda	z2
	clc
	adc.w	al_worldy,y
	sta	al_worldy,x
	lda.w	al_worldz,y
	clc
	adc	al_immuneptr,x
	sta	al_worldz,x
	a8

	s_add_alvars	B,x,al_rotz,y,al_sbyte1

.bad

	s_spacemist	x

	s_end_strat


;**********************************************************************************
colony0_Istrat
	s_start_strat	
	s_set_strat	x,colony0_strat
	s_set_aldata	x,#10,#10
	s_and_var		B,gameflags,#~gf_stratdone1
	s_set_colltype		x,enemy1
	s_set_altype		x,gnd
	set_sound2		x,#8
colony0_strat
	s_start_strat

	s_set_objtobeplayer	y

	s_jmp_alsflag		x,sflag1,.nthere
	s_jmp_Zdistmore		x,y,#200<<2,.nclose	; 70<<2
	s_set_alsflag		x,colldisable

	s_jmp_varAND	B,pshipflags2,#psf2_playerHP0,colony0_cont


;------------------------------------------------
	s_or_var		B,pstratflags,#pstf_inseq
	lda	superspeeddelay
	cmp	#ktest
	bne	.nin
	lda		splayerflymode
	cmp		#spfm_inside
	bne		.nin
	lda		#spfm_tonorm
	sta		splayerflymode
	lda	#0
	sta	hudrot+1	; OFF
	jsl	changeviewmode_l

	phx
	plx
.nin
;------------------------------------------------

	s_playerctrl		off
	s_achase_alvar		W,y,al_worldx,#0,4
	s_achase_alvar		W,y,al_worldy,viewcy,4
	s_jmp_objinfront	x,y,.nthere
	s_or_var		B,gameflags,#gf_stratdone1
	s_set_alsflag		x,sflag1
	s_brl			.nthere

.nclose
	s_jmp_Zdistless		x,y,#1500,.nthere
	s_jmp_notdelay		4,.nthere
	s_make_obj		#XPwirespacebar,.nthere
	s_copy_pos		y,x    
	s_set_alvar2rnd		y,al_rotz
	s_set_alvar2rnd		y,al_sbyte1,#15
	s_sub_alvar		B,y,al_sbyte1,#7
	s_set_strat		y,SPINspacebar_Istrat
	s_add_rnd2pos		y,255,255,0
	s_set_alvar		B,y,al_roty,#deg90
.nthere


colony0_cont
	s_add_alvar	W,x,al_worldz,#-20	
	s_add_playerZ	x
	s_end_strat


;**********************************************************************************
colony1_Istrat
	s_start_strat	
	s_set_strat	x,colony1_strat
	s_set_alsflag	x,colldisable
	s_set_altype	x,gnd
colony1_strat
	s_start_strat

	a16
	lda	viewposy
	sec	
	sbc	viewcy
	nega
	clc
	adc	viewcy
	clc
	adc	#50
	sta	al_worldy,x
	a8	

	s_brl	colony0_cont


;**********************************************************************************
colony2_Istrat			
	s_start_strat	
	s_set_alsflag	x,colldisable
	s_set_strat	x,colony2_strat
	s_init_anim	x,#0
	s_set_altype	x,gnd
colony2_strat
	s_start_strat
	s_set_objtobealvar	y,x,al_ptr
	s_copy_pos		x,y
	s_add_alvar		W,x,al_worldz,#70<<2

;	s_add_playerZ		x
	
	s_set_objtobeplayer	y
	s_jmp_objinfront	y,x,.open
	s_jmp_Zdistmore		x,y,#10<<2,.nopen
.open	s_cmp_anim		x,#9
	s_beq			.nopen
	s_add_anim		x,#1,#10
.nopen
	s_end_strat			       


	
;**********************************************************************************
spacebarwalker_Istrat
	s_start_strat
	s_set_alptrs	x,spacebarwalker_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata	x,#4,#4
	s_set_colltype		x,enemy1
spacebarwalker_strat
	s_start_strat

	s_set_objtobeplayer	y
	s_obj2obj_angle		x,y,al_roty,1


	s_jmp_objinfront	y,x,.nfire
	s_jmp_notdelay		4,.nfire,al1pt
	s_weapon_pos		#0,#(-40<<1)>>weapon_scale,#0
	s_weapon_rots2obj	y
	s_fire_weapon		x,RELSLOWELASER
.nfire	

	s_end_strat




;**********************************************************************************
spacebarshoot_Istrat
	s_start_strat
	s_set_alptrs	x,spacebarshoot_strat,hitflash_Istrat,0
	s_hardvars		x
	s_set_colltype		x,enemy1
	s_set_lifecnt		x,#80
spacebarshoot_strat
	s_start_strat

	s_add_alvars		B,x,al_rotz,x,al_sbyte1
	s_add_alvars		W,x,al_worldx,x,al_sword1
	s_add_alvars		W,x,al_worldy,x,al_sword2

	s_spacemist	x

	s_dec_lifecnt		x
	s_end_strat

	ifeq	1
;**********************************************************************************
spacebarspinshoot_Istrat
	s_start_strat
	s_set_alptrs		x,spacebarspinshoot_strat,hitflash_Istrat,0
	s_hardvars		x
	s_set_colltype		x,enemy1
	s_set_lifecnt		x,#80
spacebarspinshoot_strat
	s_start_strat

	s_add_alvars		B,x,al_rotz,x,al_sbyte1
	s_add_alvars		W,x,al_worldx,x,al_sword1
	s_add_alvars		W,x,al_worldy,x,al_sword2

	s_spacemist	x

	s_dec_lifecnt		x
	s_end_strat
	endc


;**********************************************************************************
shou0a_Istrat
	s_start_strat
	s_set_alsflag	x,sflag1
shou0_Istrat
	s_start_strat
	s_set_alptrs	x,shou0_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata	x,#shou0HP,#shou0AP
	s_set_colltype		x,enemy1
.again	s_set_alvar2rnd		x,al_sbyte1,#3
	s_jmp_alvarEQ		B,x,al_sbyte1,#3,.again
shou0_strat
	s_start_strat

	s_set_objtobeplayer	y
	s_jmp_OUTZdistrng	x,y,#500,#2500,.nospin

	s_jmp_alvarNE		B,x,al_sbyte1,#0,.nsp0
	s_add_alvar		B,x,al_roty,#6
	s_add_alvar		B,x,al_rotx,#6
	s_brl			.fire
.nsp0
	s_jmp_alvarNE		B,x,al_sbyte1,#1,.nsp1
	s_add_alvar		B,x,al_roty,#6
	s_add_alvar		B,x,al_rotz,#6
	s_brl			.fire
.nsp1
	s_add_alvar		B,x,al_rotx,#6
	s_add_alvar		B,x,al_rotz,#6
	

.fire	
	s_jmp_alsflag		x,sflag1,.typea
	s_jmp_notdelay		4,.nospin,al1pt
	s_weapon_pos		#0,#0,#0
	s_weapon_rots2obj	y
	s_fire_weapon		x,PLASMA
	s_brl			.nospin
.typea
	s_jmp_notdelay		5,.nospin,al1pt
	s_weapon_pos		#0,#0,#0
	s_weapon_rots2obj	y
	s_fire_weapon		x,PLASMA

.nospin
	s_end_strat


;**********************************************************************************
walker2_Istrat	; in tunnel chase players X
	s_start_strat
	s_set_alptrs	x,walker2_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata	x,#walker2HP,#walker2AP
	s_set_colltype	x,enemy1
	s_set_alvar	B,x,al_sbyte1,#15*2
walker2_strat
	s_start_strat

;	s_decbne_alvar	B,x,al_sbyte1,.nshoot
;	s_Set_alvar	B,x,al_sbyte1,#1
;	s_jmp_alsflag	x,sflag1,.nshoot
;	s_set_alsflag	x,sflag1
;	s_set_objtobeplayer	y
;	s_weapon_pos	#0,#-65>>weapon_scale,#0
;	s_weapon_rots2obj	y
;	s_fire_weapon	x,PLASMA
;	s_set_colltype	y,enemy1
;.nshoot

	
	s_limit_alvar	W,x,al_worldx,(Mtunnel_minx+30),(Mtunnel_maxx-30)
	
	s_achase_alvar	W,x,al_worldx,player_posx,2

	s_add_playerZ	x
	s_add_alvar	W,x,al_worldz,#-30
	s_end_strat


;**********************************************************************************
volcano_Istrat
	s_start_strat
	s_set_alptrs	x,volcano_strat,0,0
	s_set_aldata	x,#hardHP,#hardAP
	s_set_colltype	x,enemy1
	s_set_alvar	B,x,al_roty,#deg180

	s_make_obj	volcano,.badobj
	s_set_strat	y,particlefire_Istrat
	s_copy_pos	y,x
	s_add_alvar	W,y,al_worldy,#-30<<2
.badobj
	s_clr_alsflag		x,sflag1
volcano_strat
	s_start_strat
		
	s_set_objtobeplayer	y
	s_jmp_outZdistrng 	x,y,#600,#4000,.nfire
	s_jmp_alsflag		x,sflag1,.nsnd
	s_set_alsflag		x,sflag1
	trigse			$9a
.nsnd
	s_jmp_notdelay		4,.nfire,al1pt
      	s_make_obj		#fireball,.nfire
	s_set_strat		y,volplasma_Istrat
	s_copy_pos		y,x
	s_add_alvar		W,y,al_worldy,#-30<<2
.nfire

	s_jmp_notdelay		3,.nfire2,al1pt
      	s_make_obj		#fireball,.nfire2
	s_set_strat		y,volrock_Istrat
	s_copy_pos		y,x
	s_add_alvar		W,y,al_worldy,#-30<<2
.nfire2


	s_end_strat

;-----------------------------------------------------------------------------
volplasma_Istrat
	s_start_strat
	s_sprite_obj	x,#0
	s_set_alptrs	x,volplasma_strat,hitflash_istrat,explode_Istrat
	s_set_aldata	x,#2,#plasmaAP
	s_set_colltype	x,enemy1
	s_set_alvar		B,x,al_sbyte1,#deg180
	s_set_alvar		B,x,al_sbyte2,#-deg90
	s_set_speed		x,#50
	s_gen_3dvecs		x,al_sbyte1,al_sbyte2,al_speed
	s_set_alsflag	x,shadow	

volplasma_strat
	s_start_strat

	s_make_smoke		2,.nsmk
.nsmk

	s_set_objtobeplayer	y
	s_jmp_Zdistless		x,y,#500,.cont
	s_obj2obj_3dangle	x,y,al_sbyte1,al_sbyte2,2
	s_gen_3dvecs		x,al_sbyte1,al_sbyte2,al_speed
.cont
	s_add_vecs2pos		x
	s_jmp_higher		x,#0,.high
	s_set_alvar		W,x,al_worldy,#0
.high
	s_add_playerZ		x
	s_Add_vecs2pos		x
	s_rots_flat		x
	s_end_strat



;-----------------------------------------------------------------------------
volrock_Istrat
	s_start_strat
	s_sprite_obj	x,#0
	s_set_alptrs	x,volrock_strat,hitflash_Istrat,explode_istrat
	s_set_aldata	x,#2,#plasmaAP
	s_set_colltype	x,enemy1
	s_set_alsflag	x,shadow	

	s_set_alvar2rnd		x,al_sbyte1,#127
	s_add_alvar		B,x,al_sbyte1,#deg180-64

	s_set_var2rnd		svar_byte1,#7
	s_add_var		B,svar_byte1,#15
	s_set_speed		x,svar_byte1
	s_gen_vecs		x,al_sbyte1,al_speed

	s_set_alvar2rnd		x,al_vy,#15
	s_set_alvar		B,x,al_vy+1,#0
	s_neg_alvar		W,x,al_vy
	s_add_alvar		W,x,al_vy,#-30
volrock_strat
	s_start_strat

	s_make_smoke		2,.nsmk
.nsmk

	s_falldown_Yvec		x,1,#2,#0
	s_Add_vecs2pos		x
	s_rots_flat		x
	s_end_strat




;**********************************************************************************
firepillar_Istrat
	s_start_strat
	s_set_alptrs	x,firepillar_strat,0,0
	s_set_aldata	x,#hardhp,#hardAP
	s_set_colltype	x,enemy1
	s_set_alvar	B,x,al_roty,#deg180
	s_set_alvar	B,x,al_rotz,#deg180

	s_set_alvar2rnd	x,al_worldx
	s_set_alvar2rnd	x,al_worldx+1,#3
	s_sub_alvar	W,x,al_worldx,#512

	a16
	lda		player_posx
	asra
	clc
	adc		al_worldx,x
	sta		al_worldx,x
	a8


	s_jmp_random		.ndrop,70
	s_set_alsflag		x,sflag2
.ndrop

firepillar_strat
	s_start_strat
	
	s_jmp_alsflag		x,sflag2,.nfire

	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#1000,.badobj
	s_jmp_alsflag	x,sflag1,.badobj
	s_make_obj	#nullshape,.badobj
	s_set_strat	y,particlefiredown_Istrat
	s_copy_pos	y,x
	s_add_alvar	W,y,al_worldy,#30<<1
	s_set_alsflag	x,sflag1
	trigse			$49
.badobj


	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#800,.nfire
	s_jmp_notdelay		2,.nfire,al1pt
      	s_make_obj		#fireball,.nfire
	s_set_strat		y,volrockdown_Istrat
	s_copy_pos		y,x
;	s_add_alvar		W,y,al_worldy,#30<<2
.nfire

	s_end_strat



;-----------------------------------------------------------------------------
volrockdown_Istrat
	s_start_strat
	s_sprite_obj	x,#0
	s_set_alptrs	x,volrockdown_strat,hitflash_istrat,explode_istrat
	s_set_aldata	x,#2,#plasmaAP
	s_set_colltype	x,enemy1
	s_set_vecs	x,#0,#80,#0
volrockdown_strat
	s_start_strat

	s_Add_vecs2pos		x


	s_jmp_ifnotstate	x,0,.nsdown
	s_jmp_higher		x,#0,.nsdown
	s_set_alvar2rnd		x,al_vx,#15
	s_sub_alvar		W,x,al_vx,#7
	s_set_alvar2rnd		x,al_vy,#7
	s_sub_alvar		W,x,al_vy,#15
	s_set_alvar2rnd		x,al_vz,#15
	s_sub_alvar		W,x,al_vz,#7
	s_next_state		x
	s_set_alvar		W,x,al_worldy,#0
	s_Add_vecs2pos		x
.nsdown


	s_jmp_ifnotstate	x,1,.nsbounce
	s_falldown_Yvec		x,1,#2,#0,remove_istrat
.nsbounce
	
	s_rots_flat		x
	s_end_strat

;*******************************************************************************
meteo0_Istrat
	s_start_strat
	s_set_alptrs	x,.meteo0_strat,coll_Istrat,.exp_Istrat
	s_set_aldata	x,#2,#16
	s_set_alvar	B,x,al_roty,#deg180
	s_init_anim	x,#0
	s_set_alvar	B,x,al_sbyte1,#20
	s_set_alsflag	x,nohitaffect
.meteo0_strat
	s_start_strat


	s_jmp_alvarZERO		B,x,al_sbyte1,.nclose
	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#1000,.nclose
	s_cmp_anim		x,#8
	s_beq			.max
	s_add_anim		x,#1,#9
	s_brl			.done
.max 
	s_clr_alsflag	x,nohitaffect
	s_jmp_notdelay		3,.nfire,al1pt
	s_weapon_pos		#0,#0,#0
	s_weapon_rots2obj	y
	s_fire_weapon		x,RELSLOWELASERHOME
.nfire
	s_dec_alvar		B,x,al_sbyte1
.done	s_add_playerZ		x
.nclose
	s_end_strat

.exp_Istrat
	s_start_strat
	s_make_obj	#asteroid1,.badobj
	s_set_strat	y,meteor_Istrat
	s_copy_pos	y,x
.badobj
	s_jmp		explode_Istrat




	ifeq	1
;**********************************************************************************
blackhole_Istrat
	s_start_strat
	s_sprite_obj	x,#0
	s_set_alptrs	x,.blackhole_strat,hitflash_Istrat,.exp_Istrat
	s_set_aldata	x,#10,#meteorAP
	s_set_alvar	B,x,al_roty,#deg180
	s_set_alvar	B,x,al_sbyte1,#70
	s_set_var		B,nosetport3,#1
.blackhole2_strat
	s_start_strat
	s_add_alvar		B,x,al_rotz,#12
	s_set_objtobeplayer	y
	s_jmp_alsflag		x,sflag1,.do
	s_jmp_distmore		x,y,#100,.ninto
	s_setnoremove_behind	x
	s_set_alsflag		x,sflag1
.do	
	s_copy_pos		x,y
	s_add_alvar		W,x,al_worldz,#100

	s_jmp_alvarNE		B,x,al_sbyte1,#31,.nf
	startbgm		$f1
	fadedown
.nf
	s_decbne_alvar		B,x,al_sbyte1,.nc
	routechange	2
	s_set_var	B,levelfinished,#le_enterbhole
.nc
	startbgm		$f4

	s_playerctrl		off
	s_achase_alvar		W,y,al_worldy,viewcy,2
	s_achase_alvar		W,y,al_worldx,#0,2

	s_add_var		W,viewdist,#8

	s_add_var		B,player_zstratadd,#12
	s_set_var		B,screenflashcnt,#screenflashwingfrms
	s_set_var		B,screenflashtype,#screenflashwingtype


	s_achase_alvar		W,x,al_worldy,player_posy,2
	s_achase_alvar		W,x,al_worldx,player_posx,2
	s_add_alvar		W,x,al_worldz,#-20
.ninto
.blackhole_strat
	s_add_playerZ	x
	s_add_alvar	W,x,al_worldz,#-30
	s_end_strat
.exp_Istrat
	s_start_strat
	s_set_alvar	B,x,al_roty,#0
	s_set_alvar	W,x,al_shape,#b_holl
	s_set_alsflag	x,colldisable
	s_set_strat	x,.blackhole2_strat	
	s_jmpto_strat
	endc


	ifeq	0
;*********************************************************************************
blackhole_Istrat
	s_start_strat
	s_set_alptrs	x,.blackhole_strat,hitflash_Istrat,.exp_Istrat
	s_sprite_obj	x,#0
	s_set_aldata	x,#20,#meteorAP
	s_set_alvar	B,x,al_roty,#deg180
	s_set_alvar	W,x,al_sword1,#100
	s_set_alvar	B,x,al_sbyte1,#70
	s_end_strat	
.blackhole2_strat
	s_start_strat
	s_jmp_ifplayerdead	.ninto

	s_add_alvar		B,x,al_rotz,#12
	s_set_objtobeplayer	y
	s_jmp_alsflag		x,sflag1,.do
	s_jmp_distmore		x,y,#100,.ninto
	s_setnoremove_behind	x
	s_set_alsflag		x,sflag1
.do	

	s_jmp_alvarNE		B,x,al_sbyte1,#70,.nbgm
	startbgm		$f4
	s_and_var		B,pshipflags3,#~psf3_enginesnd
.nbgm


	s_jmp_alvarNE		B,x,al_sbyte1,#31,.nf
	startbgm		$f1 
	fadedown
.nf
	s_decbne_alvar		B,x,al_sbyte1,.nc
	routechange	2
	s_set_var	B,levelfinished,#le_enterbhole
.nc

	s_playerctrl		off
	s_or_var		B,pshipflags3,#psf3_nocollisions
	s_achase_alvar		W,y,al_worldy,viewcy,2
	s_achase_alvar		W,y,al_worldx,#0,2

	s_add_var		W,viewdist,#8

	s_add_var		B,player_zstratadd,#12
	s_set_var		B,screenflashcnt,#screenflashwingfrms
	s_set_var		B,screenflashtype,#screenflashwingtype


	s_achase_alvar		W,x,al_worldy,player_posy,2
	s_achase_alvar		W,x,al_worldx,player_posx,2
	s_add_alvar		W,x,al_worldz,#-20

	s_jmp_alvarMORE		B,x,al_sbyte1,#30,.slow
	s_jmp_ifdelay		2,.snd
.slow	s_jmp_notdelay		3,.nsnd
.snd	trigse			$2c
.nsnd
	s_jmp_notdelay		2,.badobj
	s_make_obj		#blackhole,.badobj
	s_sprite_obj		y,#0
	s_set_alsflag		y,colldisable
	s_set_alvar		W,y,al_worldx,player_posx
	s_set_alvar		W,y,al_worldy,player_posy
	s_set_alvar		W,y,al_worldz,player_posz
	s_add_alvars		W,y,al_worldz,x,al_sword1
	s_jmp_alvarMORE		W,x,al_sword1,#600,.max
	s_add_alvar		W,x,al_sword1,#300
.max	s_set_strat		y,.blackhole3_strat
.badobj	
.ninto
.blackhole_strat
	s_add_playerZ	x
	s_add_alvar	W,x,al_worldz,#-30
	s_end_strat
.exp_Istrat
	s_start_strat
	s_set_alvar	W,x,al_shape,#blackhole
	s_set_alsflag	x,colldisable
	s_set_strat	x,.blackhole2_strat	
	s_jmpto_strat

.blackhole3_strat
	s_start_strat
	s_add_alvar		B,x,al_rotz,#12
	s_set_alvar		B,x,al_roty,#deg180
	s_achase_alvar		W,x,al_worldy,player_posy,2
	s_achase_alvar		W,x,al_worldx,player_posx,2
	s_add_alvar		W,x,al_worldz,#-20
	s_brl			.blackhole_strat

	endc


;***********************************************************************************
aircarHP	equ	10
aircarAP	equ	10
airtruckHP	equ	16
airtruckAP	equ	10

scorpion1_Istrat		; come on from side, skid and stop
	s_start_strat
	s_set_alptrs	x,scorpion1_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata	x,#aircarHP,#aircarAP
	s_set_alvar	B,x,al_rotz,#-deg90
	s_set_alvar	B,x,al_sbyte1,#25
	s_set_alvar	B,x,al_roty,#1
	s_set_colltype	x,enemy1
	s_init_colanim	x,#0

scorpion1_strat	
	s_start_strat

	s_beqdec_alvar	B,x,al_sbyte1,.stop

	s_jmp_alvarmore	B,x,al_sbyte1,#15,.chzz
	s_set_alsflag	x,shadow
	s_add_alvar	B,x,al_rotz,#1
	s_brl		.donez	
.chzz	s_achase_alvar	B,x,al_rotz,#0,3
.donez
	s_achase_alvar	W,x,al_worldx,player_posx,3
	s_achase_alvar	W,x,al_worldy,0,3
	s_add_playerZ	x
	s_brl		.end
.stop	
	s_init_colanim	x,#1
	s_achase_alvar	B,x,al_rotz,#0,3
	
.end	s_end_strat

aircar1_Istrat		; come on from side, skid and stop
	s_start_strat
	s_set_alptrs	x,aircar1_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata	x,#aircarHP,#aircarAP
	s_set_alvar	B,x,al_rotz,#-deg90
	s_set_alvar	B,x,al_sbyte1,#25
	s_set_alvar	B,x,al_roty,#1
	s_set_colltype	x,enemy1
	s_init_colanim	x,#0
	set_sound2		x,#$f
aircar1_strat	
	s_start_strat

	s_beqdec_alvar	B,x,al_sbyte1,.stop

	s_jmp_alvarmore	B,x,al_sbyte1,#15,.chzz
	s_set_alsflag	x,shadow
	s_add_alvar	B,x,al_rotz,#1
	s_brl		.donez	
.chzz	s_achase_alvar	B,x,al_rotz,#0,3
.donez
	s_achase_alvar	W,x,al_worldx,player_posx,3
	s_achase_alvar	W,x,al_worldy,player_posy,3
	s_add_playerZ	x
	s_brl		.end
.stop	
	s_init_colanim	x,#1
	s_achase_alvar	B,x,al_rotz,#0,3
	
.end	s_end_strat





aircar2_Istrat	 ; come from behind stop and drop barrier
	s_start_strat
	s_set_alptrs	x,aircar2_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata	x,#aircarHP,#aircarAP
	s_set_alvar	B,x,al_rotz,#-deg90
	s_set_alvar	B,x,al_sbyte1,#50
	s_set_colltype	x,enemy1
	s_init_colanim	x,#0
	set_sound2		x,#$f
aircar2_strat	
	s_start_strat

	s_jmp_ifnotstate	x,0,.nsto
	s_achase_alvar	B,x,al_rotz,#0,4
	s_achase_alvar	W,x,al_worldx,player_posx,4
	s_add_alvar	W,x,al_worldz,#20
	s_add_playerZ	x
	s_decbne_alvar	B,x,al_sbyte1,.nsto
	s_make_obj		#barrier,.badobj
	s_set_colltype		y,enemy1
	s_copy_pos		y,x
	s_copy_rots		y,x
	s_set_strat		y,barrier_istrat
	s_make_immune		
.badobj	s_next_state		x
	s_set_vecs		x,#0,#0,#-30
.nsto


	s_jmp_ifnotstate	x,1,.nsaway
       	s_add_alvar		B,x,al_rotz,#1
       	s_add_alvar		B,x,al_roty,#1
	s_add_playerZ		x
	s_add_vecs2pos		x
	s_jmp_alvarEQ		W,x,al_vx,#-10,.nsaway
	s_add_alvar		W,x,al_vx,#-1
.nsaway


	s_end_strat




aircar3_Istrat		; come in from left and drive like a fucking maniac.
	s_start_strat
	s_set_alptrs	x,aircar3_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata	x,#aircarHP,#aircarAP
	s_set_speed	x,#40
	s_set_alvar	B,x,al_sbyte1,#50
	s_set_alsflag	x,shadow
	s_set_alvar	B,x,al_rotz,#-deg90
	s_set_colltype	x,enemy1
	s_init_colanim	x,#0
	set_sound2		x,#$f
aircar3_strat	
	s_start_strat
	
	
	s_jmp_ifnotstate	x,0,.nchp
	s_achase_alvar		B,x,al_rotz,#0,4
	s_achase_alvar		W,x,al_worldx,#0,4
	s_decbne_alvar		B,x,al_sbyte1,.nchp
	s_next_state		x
	s_set_alvar		B,x,al_sbyte1,#0
.nchp
	s_jmp_ifnotstate	x,1,.nl
	s_set_alvar2alvartab	B,B,B,x,al_roty,x,al_sbyte1,SINtab,-2	
	s_add_alvar		B,x,al_sbyte1,#5
	s_set_alvar2alvartab	B,B,B,x,al_rotz,x,al_sbyte1,SINtab,-3
	s_add_alvar		W,x,al_sword1,#5
	s_jmp_alvarless		W,x,al_sword1,#256+64,.nl
	s_next_state		x
	s_set_lifecnt		x,#40
.nl

	s_jmp_ifnotstate	x,2,.ngo
	s_speedto		x,#50,1
	s_dec_lifecnt		x
	s_jmp_notdelay		1,.ngo
	s_add_alvar		B,x,al_rotx,#-1
.ngo
	

	

	s_achase_alvar2alvar	B,x,al_skidy,x,al_roty,3

	s_gen_3dvecs	x,al_skidy,al_rotx,al_speed
	s_set_alvar	W,x,al_vz,#12
	s_add_vecs2pos	x
	s_add_playerZ	x
	s_end_strat


scorpion4_Istrat		; stop then speedup when player near
	s_start_strat
	s_set_alptrs	x,scorpion4_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata	x,#aircarHP,#aircarAP
	s_set_alsflag	x,shadow
	s_set_colltype	x,enemy1
	s_init_colanim	x,#1
	s_set_lifecnt	x,#60
scorpion4_strat	
	s_start_strat

	s_achase_alvar	W,x,al_worldx,player_posx,4
	
	s_set_objtobeplayer	y

	s_jmp_Zdistless	x,y,#600,.nys
	s_achase_alvar	W,x,al_worldy,0,4
.nys



	s_jmp_alsflag	x,sflag1,.speedup
	s_jmp_Zdistmore	x,y,#400,.nspeedup
	s_init_colanim	x,#0
	s_set_alsflag	x,sflag1
.speedup	s_speedto	x,#medpspeed+15,5,.go
	s_brl		.nspeedup
.go	s_add_alvar	B,x,al_roty,#1	
	s_add_alvar	B,x,al_rotz,#1	
	s_dec_lifecnt	x
.nspeedup
	s_gen_3dvecs	x,al_roty,al_rotx,al_speed
	s_add_vecs2pos	x
	s_end_strat



aircar4_Istrat		; stop then speedup when player near
	s_start_strat
	s_set_alptrs	x,aircar4_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata	x,#aircarHP,#aircarAP
	s_set_alsflag	x,shadow
	s_set_colltype	x,enemy1
	s_init_colanim	x,#1
	s_set_lifecnt	x,#60
	set_sound2		x,#$f
aircar4_strat	
	s_start_strat

	s_achase_alvar	W,x,al_worldx,player_posx,4
	
	s_set_objtobeplayer	y

	s_jmp_Zdistless	x,y,#600,.nys
	s_achase_alvar	W,x,al_worldy,player_posy,4
.nys



	s_jmp_alsflag	x,sflag1,.speedup
	s_jmp_Zdistmore	x,y,#400,.nspeedup
	s_init_colanim	x,#0
	s_set_alsflag	x,sflag1
.speedup	s_speedto	x,#medpspeed+15,5,.go
	s_brl		.nspeedup
.go	s_add_alvar	B,x,al_roty,#1	
	s_add_alvar	B,x,al_rotz,#1	
	s_dec_lifecnt	x
.nspeedup
	s_gen_3dvecs	x,al_roty,al_rotx,al_speed
	s_add_vecs2pos	x
	s_end_strat



aircar5_Istrat		; come in from left and hit wall
	s_start_strat
	s_set_alptrs	x,aircar5_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata	x,#aircarHP,#aircarAP
	s_set_speed	x,#40
	s_set_alvar	B,x,al_sbyte1,#50
	s_set_alsflag	x,shadow
	s_set_alvar	B,x,al_rotz,#deg90
	s_set_alvar	B,x,al_roty,#-deg22
	s_set_colltype	x,enemy1
	s_init_colanim	x,#0
	set_sound2		x,#$f
aircar5_strat	
	s_start_strat
	
	
	s_jmp_ifnotstate	x,0,.nchp
	s_achase_alvar		B,x,al_rotz,#0,4
	s_jmp_alvarless		W,x,al_worldx,#colony_maxX-20,.nchp
	s_next_state		x
	s_set_vecs		x,#-5,#-10,#-20
	s_set_alvar		B,x,al_rotz,#deg11
	s_set_alvar		B,x,al_sbyte1,#16
	s_jsl		    	makeSMLexpobj_srou
	s_set_alvar		W,y,al_worldx,#colony_maxX
.nchp
	

	s_jmp_ifnotstate	x,1,.nhit
	s_jmp_notdelay		1,.cadd
	s_beqdec_alvar		B,x,al_sbyte1,.nd
.cadd	s_achase_alvar		B,x,al_roty,#deg22,2
	s_add_alvars		B,x,al_rotz,x,al_sbyte1
	
.nd
	s_falldown_Yvec		x,1,#2,#-25
	s_brl			.cont
.nhit

	s_gen_3dvecs	x,al_roty,al_rotx,al_speed
	s_scale_alvar	W,x,al_vx,1
	s_set_alvar	W,x,al_vz,#20
.cont
	s_add_vecs2pos	x
	s_add_playerZ	x
	s_end_strat




truck1_Istrat		; drive slowly in players direction.
	s_start_strat
	s_set_alptrs	x,truck1_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata	x,#airtruckHP,#truckAP
	s_set_alsflag	x,shadow
	s_set_colltype	x,enemy1
	s_set_lifecnt	x,#60
	set_sound2		x,#$4
truck1_strat	
	s_start_strat
	s_add_playerZ	x
	s_add_alvar	W,x,al_worldz,#-35
	s_end_strat



truck2_Istrat		; drive like a drunk in players's direction.
	s_start_strat
	s_set_alptrs	x,truck2_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata	x,#airtruckHP,#truckAP
	s_set_speed	x,#60
	s_set_alvar	B,x,al_sbyte1,#50
	s_set_alsflag	x,shadow
	s_set_colltype	x,enemy1
	set_sound2		x,#$4
truck2_strat	
	s_start_strat
	
	s_set_alvar2alvartab	B,B,B,x,al_roty,x,al_sbyte1,SINtab,-2	
	s_add_alvar		B,x,al_sbyte1,#6
	
	s_achase_alvar2alvar	B,x,al_skidy,x,al_roty,3

	s_gen_3dvecs	x,al_skidy,al_rotx,al_speed
	s_set_alvar	W,x,al_vz,#-35
	s_add_vecs2pos	x
	s_add_playerZ	x
	s_end_strat



;***********************************************************************************
mine2HP	equ	2
mine2AP	equ	8
mine2_Istrat
	s_start_strat
	s_set_alptrs	x,mine2_strat,hitflash_Istrat,mine2expnofire_Istrat
	s_set_aldata	x,#mine2HP,#mine2AP
	s_set_alvar	W,x,al_vy,#-45
	s_set_alvar2rnd	x,al_roty
	s_set_alsflag	x,relexplode
	s_set_colltype		x,enemyweap
mine2_strat
	s_start_strat
	

	s_add_vecs2pos	x
	s_add_playerZ	x

	s_jmp_alvarEQ	W,x,al_vy,#15,mine2exp_Istrat
	s_jmp_alvarMI	W,x,al_vy,.nfall
	s_add_alvar	B,x,al_rotx,#2
	s_brl		.nspin
.nfall

	s_add_alvar	B,x,al_roty,#12
.nspin	s_add_alvar	W,x,al_vy,#1

	s_end_strat

mine2exp_Istrat
	s_start_strat

	s_weapon_pos		#0,#0,#0

	s_set_objtobeplayer	y
	s_weapon_rots2obj	y
	s_fire_weapon		x,relovalbeam
	s_add_rnd2alvar		y,al_speed,#31

	s_set_objtobeplayer	y
	s_weapon_rots2obj	y,#0,#deg11
	s_fire_weapon		x,relovalbeam
	s_add_rnd2alvar		y,al_speed,#31

	s_set_objtobeplayer	y
	s_weapon_rots2obj	y,#0,#-deg11
	s_fire_weapon		x,relovalbeam
	s_add_rnd2alvar		y,al_speed,#31

	s_set_objtobeplayer	y
	s_weapon_rots2obj	y,#-deg11,#0
	s_fire_weapon		x,relovalbeam
	s_add_rnd2alvar		y,al_speed,#31

	s_set_objtobeplayer	y
	s_weapon_rots2obj	y,#deg11,#0
	s_fire_weapon		x,relovalbeam
	s_add_rnd2alvar		y,al_speed,#31

mine2expnofire_Istrat

	s_make_obj		#nullshape,.badobjp
	s_set_strat		y,particleexplode_Istrat
	s_copy_pos		y,x
.badobjp

	s_jmp			explode_Istrat	




;*****************************************************************************
gate3_Istrat
	s_start_strat
	s_set_strat	x,gate3_strat
	s_set_alsflag	x,colldisable
	s_set_alsflag	x,shadow
	s_init_colanim	x,#0
gate3_strat
	s_start_strat
	s_add_alvar	B,x,al_rotx,#8
	s_add_alvar	B,x,al_roty,#6
	s_add_alvar	B,x,al_rotz,#12

	s_set_objtobeplayer	y
	s_jmp_Zdistmore	x,y,#200,.ntouch
	s_jmp_outxydistrng	x,y,#0,#(25<<2),.ntouch
	s_jmp_alsflag	x,sflag1,.touched
	s_set_alsflag	x,sflag1
	ldy	pcboxobj_B
	lda.w	al_hp,y
	beq	.ntouch
	clc
	adc	#20
	cmp	#100
	bmi	.ok
	lda	#100
.ok
	sta.w	al_hp,y		
	trigse		$10
.touched
	s_init_colanim	x,#4
.ntouch

	s_end_strat
	

;*****************************************************************************
gate2_Istrat
	s_start_strat
	s_set_strat	x,gate2_strat
	s_set_alsflag	x,colldisable
	s_set_alsflag	x,shadow
gate2_strat
	s_start_strat


	s_jmp_alvarMORE	W,x,al_worldx,maxPmoveX,.move
	s_jmp_alvarLESS	W,x,al_worldx,minPmoveX,.move
	s_jmp_alvarMORE	W,x,al_worldy,maxPmoveY,.move
	s_jmp_alvarMORE	W,x,al_worldy,minPmoveY,.nmove
.move
	s_achase_alvar	W,x,al_worldx,#0,4
	s_achase_alvar	W,x,al_worldy,viewcy,4
.nmove

	s_jmpnot_varAND	B,playerflymode,#pfm_shadows,.ngnd
	s_jmp_higher	x,#-30<<1,.ngnd
	s_set_alvar	W,x,al_worldy,#-30<<1
.ngnd

	
	s_add_alvar	B,x,al_rotx,#8
	s_add_alvar	B,x,al_roty,#6
	s_add_alvar	B,x,al_rotz,#12

	s_jmp_alsflag	x,sflag1,.touched
	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#30<<1,.ntouch
	s_jmp_XYdistmore	x,y,#30<<1,.ntouch
	

	ldy	pcboxobj_B
	lda.w	al_hp,y
	beq	.ntouch
	clc
	adc	#5
	cmp	#100
	bmi	.ok
	lda	#100
.ok
	sta.w	al_hp,y		
	trigse		$10
;	s_score		#1
	s_set_alsflag	x,sflag1

.touched
     	s_init_colanim	x,#0
	s_brl		.cont
.ntouch
     	s_init_colanim	x,#4
.cont
	s_add_playerZ	x
	s_add_alvar	W,x,al_worldz,#-50


	s_end_strat



;*****************************************************************************
sfish_Istrat
	s_start_strat
	s_set_strat	x,sfish_strat
	s_set_alsflag	x,colldisable
	s_set_aldata	x,#100,#hardAP

	s_set_alvar2rnd	x,al_rotz

	s_set_objtobealvar	y,x,al_ptr
	s_chk_objptr		y,.Ialone
.Itogether
  	s_set_alvar2rnd		x,al_vx
	s_sub_alvar		W,x,al_vx,#128
  	s_set_alvar2rnd		x,al_vy
	s_sub_alvar		W,x,al_vy,#128
  	s_set_alvar2rnd		x,al_vz
	s_sub_alvar		W,x,al_vz,#128
	s_brl			.Icont
.Ialone
	s_setnoremove_behind	x
	s_set_lifecnt		x,#200			
	s_set_alvar		B,x,al_sbyte1,#200

	s_set_alvar		W,x,al_vx,#20	
	s_set_alvar		W,x,al_vy,#10	
	s_set_alvar		W,x,al_vz,#-10	
;  	s_set_alvar2rnd		x,al_vx,#63
;	s_sub_alvar		W,x,al_vx,#31
;  	s_set_alvar2rnd		x,al_vy,#63
;	s_sub_alvar		W,x,al_vy,#31
;  	s_set_alvar2rnd		x,al_vz,#63
;	s_sub_alvar		W,x,al_vz,#31

.Icont

sfish_strat
	s_start_strat

	s_add_alvar		B,x,al_rotz,#8

	s_set_objtobealvar	y,x,al_ptr
	s_chk_objptr		y,.alone
.together
	s_jmp_alvarNOTZERO	W,y,al_sword1,.foundnuke
	s_jmp_alvarNOTZERO	W,y,al_sword2,.foundlaser

	s_beqdec_alvar		B,x,al_sbyte1,.nlasdelay
	s_brl			.foundlaser2
.nlasdelay

	s_copy_alvar2var	W,x,svar_word1,al_vx
	s_copy_alvar2var	W,x,svar_word2,al_vy
	s_copy_alvar2var	W,x,svar_word3,al_vz

.togcont
	s_varadd_alvar.w	W,y,svar_word1,al_worldx
	s_achase_alvar		W,x,al_worldx,svar_word1,3

	s_varadd_alvar.w	W,y,svar_word2,al_worldy
	s_achase_alvar		W,x,al_worldy,svar_word2,3

	s_varadd_alvar.w	W,y,svar_word3,al_worldz
	s_achase_alvar		W,x,al_worldz,svar_word3,3
	
	s_achase_alvar2alvar	B,x,al_rotx,y,al_rotx,4
	s_achase_alvar2alvar	B,x,al_roty,y,al_roty,4
	s_brl			.cont

.foundlaser
	s_set_alvar2rnd		x,al_sbyte1,#7
	s_add_alvar		B,x,al_sbyte1,#5
.foundlaser2

	s_copy_alvar2var	W,x,svar_word1,al_vx
	s_scale_var		W,svar_word1,2
	s_copy_alvar2var	W,x,svar_word2,al_vy
	s_scale_var		W,svar_word2,2
	s_copy_alvar2var	W,x,svar_word3,al_vz
	s_scale_var		W,svar_word3,2
	s_brl			.togcont


.foundnuke
	phx
	tyx
	ldy		al_sword1,x
	plx	

	s_copy_alvar2var	W,x,svar_word1,al_worldx
	s_copy_alvar2var	W,x,svar_word2,al_worldy
	s_copy_alvar2var	W,x,svar_word3,al_worldz

	s_achase_alvar2alvar	W,x,al_worldx,y,al_worldx,4
	s_achase_alvar2alvar	W,x,al_worldy,y,al_worldy,4
	s_achase_alvar2alvar	W,x,al_worldz,y,al_worldz,4

	s_set_wp		x,0,1,svar_word1,svar_word2,svar_word3
	s_obj2wp_angle		x,x,1,al_roty,al_rotx,0 
	s_add_alvar		B,x,al_roty,#deg180
	s_neg_alvar		B,x,al_rotx
      	s_brl			.cont
;-----------------------------------------------------------------------
.alone


	s_set_alvar		W,x,al_sword1,#0
	s_set_find		0
	s_find_obj		y,x,#nuke,.nnuke
	s_set_alvartobeobj	x,al_sword1,y
.nnuke

	s_set_alvar		W,x,al_sword2,#0
	s_set_find		0
	s_find_radiusobj	y,x,#elaser2,#0,#200,.nlaser
	s_set_alvartobeobj	x,al_sword2,y
.nlaser

	s_copy_alvar2var	W,x,svar_word1,al_worldx
	s_copy_alvar2var	W,x,svar_word2,al_worldy
	s_copy_alvar2var	W,x,svar_word3,al_worldz
	s_add_vecs2pos		x
	s_set_wp		x,0,1,svar_word1,svar_word2,svar_word3
	s_obj2wp_angle		x,x,1,al_roty,al_rotx,0 
	s_add_alvar		B,x,al_roty,#deg180
	s_neg_alvar		B,x,al_rotx

	s_jmp_alvarLESS		W,x,al_worldx,#-400,.turnx
	s_jmp_alvarLESS		W,x,al_worldx,#400,.nturnx
.turnx	s_neg_alvar		W,x,al_vx
.nturnx


	s_jmp_alvarLESS		W,x,al_worldy,#-400,.turny
	s_jmp_alvarLESS		W,x,al_worldy,#400,.nturny
.turny	s_neg_alvar		W,x,al_vy
.nturny



	s_decbne_alvar		B,x,al_sbyte1,.swim
	s_set_alvar		B,x,al_sbyte1,#1
	s_set_alvar		W,x,al_vz,#-20
	s_dec_lifecnt		x
	s_brl			.nturnz
.swim


	a16
	lda			al_worldz,x
	sec
	sbc			player_posz
	sta			svar_word1
	a8
	s_jmp_varLESS		W,svar_word1,#700,.turnz
	s_jmp_varLESS		W,svar_word1,#1500,.nturnz
.turnz	s_neg_alvar		W,x,al_vz
.nturnz

.cont
	s_add_playerZ		x
	s_end_strat







**********************************************************************************
szaco3_Istrat
	s_start_strat
	s_set_aldata	x,#szaco5HP,#szaco5AP
	s_set_alptrs	x,szaco3_strat,hitflash_Istrat,explode_Istrat
	s_set_speed		x,#70
	s_set_debrisdata	x,#zaco_7p
	s_init_anim		x,#9
	s_set_alsflag	x,relexplode
	s_set_colltype	x,enemy1
	s_set_alvar		B,x,al_roty,#deg180
	s_set_lifecnt	x,#70
	set_sound2	x,#$f
szaco3_strat
	s_start_strat

	s_dec_lifecnt	x

	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#400,.nbank
	s_banktoplayer		x
	s_brl			.cont
.nbank
	s_obj2obj_3dangle		x,y,al_roty,al_rotx,1

.cont
	s_gen_3dvecs		x,al_roty,al_rotx,al_speed
	s_add_vecs2pos		x
	s_add_playerZ		x
	s_end_strat



**********************************************************************************
tadpole_Istrat
	s_start_strat
	s_set_alptrs	x,tadpole_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata	x,#4,#10
	s_set_speed	x,#30
	s_set_lifecnt	x,#60


	s_jmp_alvarMI	W,x,al_worldx,.left
	s_set_alsflag		x,sflag1
.left

	s_set_alvar		B,x,al_sbyte1,#40
tadpole_strat
	s_start_strat 
	s_set_objtobeplayer	y

;-----------------------------------------------------
	s_jmp_ifnotstate	x,0,.nswim
	s_jmpNOT_alsflag	x,sflag1,.right
	s_achase_alvar	B,x,al_roty,#deg90,4
	s_add_alvar		B,x,al_rotx,#-2
	s_brl		.dswd
.right
	s_achase_alvar	B,x,al_roty,#-deg90,4
	s_add_alvar		B,x,al_rotx,#2
.dswd
	s_beqdec_alvar	B,x,al_sbyte1,nextstate
.nswim
;-----------------------------------------------------
	s_jmp_ifnotstate	x,1,.ntopl
	s_set_alvar		B,x,al_sbyte1,#20
	s_obj2obj_3dangle	x,y,al_roty,al_rotx,3	
	s_jmp_zdistmore		x,y,#1500,.ntopl
	s_weapon_pos		#0,#0,#0
	s_weapon_rot		#0,#0
	s_fire_weapon		x,RELSLOWELASERHOME
	s_next_state		x
.ntopl	       

;-----------------------------------------------------
	s_jmp_ifnotstate	x,2,.ndive
	s_add_alvar		B,x,al_rotz,#2
	s_add_alvar		B,x,al_rotx,#2
	s_decbne_alvar		B,x,al_sbyte1,.ndive
	s_next_state		x
	s_set_alvar		B,x,al_sbyte1,#(deg180+deg45)/4
.ndive

;-----------------------------------------------------
	s_jmp_ifnotstate	x,3,.nup
	s_beqdec_alvar		B,x,al_sbyte1,nextstate
	s_add_alvar		B,x,al_rotz,#8
	s_sub_alvar		B,x,al_rotx,#4
.nup


;-----------------------------------------------------
	s_jmp_ifnotstate	x,4,.ngo
	s_add_alvar		B,x,al_rotz,#8
	s_sub_alvar		B,x,al_rotx,#1
	s_dec_lifecnt		x
	s_speedto		x,#60,1
	s_sub_alvar		B,x,al_roty,#2
	s_jmpNOT_alsflag	x,sflag1,.left
	s_add_alvar		B,x,al_roty,#4
.left
.ngo

	s_gen_3dvecs		x,al_roty,al_rotx,al_speed
	s_add_vecs2pos		x
	s_add_playerZ		x
	s_end_strat	


	strats_end

;****************************************************************************
openlr_Istrat
	s_start_strat
	s_set_alptrs	x,openlr_strat,openlrcol_Istrat,0
	s_set_aldata	x,#hardHP,#hardAP
openlr_strat
	s_start_strat
	s_jmpNOT_alsflag	x,sflag1,.close	

.open	s_dooropen_snd	0
	s_set_alsflag	x,colldisable
	s_cmp_anim	x,#9
	s_beq		.fin
	s_add_anim	x,#1,#10
	s_brl		.fin
.close	s_init_anim	x,#0
.fin	s_end_strat

openlrcol_Istrat
	s_start_strat
	trigse	$57
	s_set_alsflag	x,sflag1
	s_jmp	hitflash_Istrat

;****************************************************************************
updoor_Istrat
	s_start_strat
	s_set_alptrs	x,updoor_strat,updoorcol_Istrat,0
	s_set_aldata	x,#hardHP,#hardAP
updoor_strat
      	s_start_strat

	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#700,.close
.open	s_set_alvar		B,x,al_sbyte1,#100
 
	s_dooropen_snd	0
	s_cmp_anim	x,#8
	s_beq		.fin
	s_add_anim	x,#1,#10
	s_brl		.fin
.close	s_init_anim	x,#0
.fin	

	s_beqdec_alvar	B,x,al_sbyte1,.coll
.coll	s_end_strat
	


updoorcol_Istrat
	s_start_strat
	trigse	$57
	s_jmp_alvarNOTZERO	B,x,al_sbyte1,coll_Istrat
	s_set_alvar	B,x,al_sbyte1,#5
	s_add_alvar	B,x,al_rotz,#deg180
	s_jmp		hitflash_Istrat

;*********************************************************************************
colonyexit_Istrat
	s_start_strat
	s_nodepthcue	x
	s_set_alsflag	x,colldisable
	s_set_altype	x,gnd
	s_set_objtobeplayer	y
	s_jmp_objinfront	x,y,.close
	s_jmp_Zdistless		x,y,#medpspeed+10,.close
	s_dooropen_snd		0
	s_cmp_anim		x,#9
	s_beq			.end
	s_add_anim		x,#1,#10
	s_brl			.end
.close	s_init_anim		x,#0   
.end	s_end_strat	  
 
;*********************************************************************************
bossseamon_Istrat
	s_start_strat
	s_set_alptrs	x,bossseamon_strat,hitflash_Istrat,bossseamonexp_Istrat
	s_set_aldata	x,#2,#4
	s_set_alvar2rnd	x,al_sbyte2
	s_set_alvar	B,x,al_roty,#deg180
	s_set_colltype	x,enemyweap
	s_setnoremove_behind	x
	s_set_alvar	B,x,al_sbyte3,#60
	s_set_alvar	B,x,al_sbyte4,#3
bossseamon_strat
	s_start_strat

;-----------------------------------------------------------
	s_jmp_ifnotstate	x,0,.ns0	; move around in distance.
	s_set_alsflag		x,colldisable
	s_beqdec_alvar		B,x,al_sbyte3,setstate2
	s_speedto	x,#20,1
	s_gen_vecs	x,al_sbyte2,al_speed
    	s_set_alvar	W,x,al_vz,#-40
	s_add_alvar	B,x,al_sbyte2,#4
	s_jmp_notdelay	5,.ns0,al1pt
	jsl		enemydownsea_l
	jsl		makesplash_srou_l
	s_set_alvar	B,x,al_sbyte1,#10
	s_set_alvar		W,x,al_shape,#sea_0_1
	s_next_state	x
.ns0
;-----------------------------------------------------------
	s_jmp_ifnotstate	x,1,.ns1  	; make small splash.
	s_set_vecs		x,#0,#0,#0
	s_decbne_alvar		B,x,al_Sbyte1,.ns1
	s_set_state		x,#0
	s_set_alvar		W,x,al_shape,#sea_0_0
	jsl		enemydownsea_l
	jsl		makesplash_srou_l
.ns1
;-----------------------------------------------------------
	s_jmp_ifnotstate	x,2,.ns2	; jump out of water and fire laser
	s_clr_alsflag		x,colldisable
	s_set_alvar		W,x,al_vz,#0
	s_neg_alvar		W,x,al_vx
	s_set_alvar		W,x,al_vy,#-15
	s_set_alvar		W,x,al_shape,#sea_0
	jsl		enemydownsea_l
	jsl		makesplash_srou_l
	s_add_vecs2pos		x
	s_beqdec_alvar		B,x,al_sbyte4,setstate5
	s_next_state		x
.ns2
;-----------------------------------------------------------
	s_jmp_ifnotstate	x,3,.ns3 
	s_jmp_alvarMI		W,x,al_vy,.nfire
	s_jmp_notdelay		3,.nfire,al1pt
	s_weapon_pos		#0,#0,#0
	s_set_objtobeplayer	y
	s_weapon_rots2obj	y
	s_fire_weapon		x,RELSLOWELASER
.nfire

	s_add_alvar		W,x,al_vy,#1
	s_jmp_higher		x,#0,.ns3
	s_set_alvar		W,x,al_vy,#0
	jsl		enemydownsea_l
	jsl		makesplash_srou_l
	s_set_alvar		W,x,al_shape,#sea_0_0
	s_set_speed		x,#0
	s_set_alvar		B,x,al_sbyte3,#30
	s_next_state		x
.ns3
;-----------------------------------------------------------
	s_jmp_ifnotstate	x,4,.ns4 
	s_set_alsflag		x,colldisable
	s_beqdec_alvar		B,x,al_sbyte3,setstate2
.ns4

;-----------------------------------------------------------
	s_jmp_ifnotstate	x,5,.ns5
	jsl		enemydownsea_l
	jsl		makesplash_srou_l
	s_set_alvar		W,x,al_vy,#-20
	s_set_alvar		W,x,al_shape,#sea_0
	s_add_vecs2pos		x
	s_next_state		x
.ns5 

;-----------------------------------------------------------
	s_jmp_ifnotstate	x,6,.ns6
	s_add_alvar		W,x,al_vy,#2
	s_jmp_higher		x,#0,.ns6
	s_set_alvar		W,x,al_vy,#0
	jsl		enemydownsea_l
	jsl		makesplash_srou_l
	s_set_alvar		W,x,al_shape,#sea_0_1
	s_next_state		x
.ns6

;-----------------------------------------------------------
	s_jmp_ifnotstate	x,7,.ns7
	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#200,.ok
	s_jmp_objinfront	x,y,.ok
	s_set_state		x,#8
	s_set_vecs		x,#0,#0,#50
	s_set_alvar		W,x,al_worldy,#-150
	s_set_alvar		W,x,al_shape,#sea_0
	s_brl			.ns7
.ok	s_obj2obj_angle		x,y,al_sbyte2,0
	s_set_speed		x,#20
	s_gen_vecs		x,al_sbyte2,al_speed
	s_set_state		x,#5
.ns7


;-----------------------------------------------------------
	s_jmp_ifnotstate	x,8,.ns8
	s_set_objtobeplayer	y
	s_add_alvar		W,x,al_vy,#2
	s_jmp_higher		x,#0,.ns8
	s_set_alvar	B,x,al_sbyte4,#2
	s_set_state		x,#2
	s_set_alvar		W,x,al_vy,#0
	s_set_alvar2rnd		x,al_vx,#7
	s_add_alvar		W,x,al_vx,#5
	s_jmp_random		.nneg
	s_neg_alvar		W,x,al_vx
.nneg
	s_set_alvar		W,x,al_shape,#sea_0_0
.ns8

;-----------------------------------------------------------
	s_limit_alvar		W,x,al_worldx,bridge_minX*2,bridge_maxX*2

	s_Add_vecs2pos	x
	s_add_playerZ	x
	s_end_strat
	
bossseamonexp_Istrat
	s_start_strat
	s_dec_var	B,gsvar_byte1
	s_jmp		explode_Istrat


;****************************************************************************
dpilar_Istrat
halfd_Istrat
	s_start_strat
	s_set_alptrs	x,halfd_strat,0,0
	s_set_aldata	x,#hardHP,#hardAP
halfd_strat
      	s_start_strat

	s_set_objtobeplayer	y
	s_jmp_Zdistmore		x,y,#700,.close
.open	s_dooropen_snd	0
	s_cmp_anim	x,#9
	s_beq		.fin
	s_add_anim	x,#1,#10
	s_brl		.fin
.close	s_init_anim	x,#0
.fin	

	s_end_strat
 
;****************************************************************************
pole0_Istrat
	s_start_strat
	s_set_alptrs	x,pole0_strat,pole0col_Istrat,0
	s_set_aldata	x,#hardHP,#hardAP

	s_set_alvar	B,x,al_sbyte1,#3
	s_jmp_random	.nmi
	s_set_alvar	B,x,al_sbyte1,#-3
.nmi

pole0_strat
	s_start_strat
	s_add_alvar	W,x,al_worldz,#30
	s_add_alvars	B,x,al_rotz,x,al_sbyte1
	s_beqdec_alvar	B,x,al_sbyte2,.d
.d	s_end_strat	
pole0col_Istrat
	s_start_strat
;--------------------
	s_jmp_alvarAND	B,x,al_hitflags,#HF1,.nowt

	s_jmp_alvarNOTZERO	B,x,al_sbyte2,.nowt
	s_set_alvar		B,x,al_sbyte2,#6
	trigse			$57

;--------------------
	s_jmpNOT_alvarAND	B,x,al_hitflags,#HF2,.nup
	s_jmp_alvarPL		B,x,al_sbyte1,.ncl
	s_clr_alvar		B,x,al_sbyte1
	s_brl			.nowt
.ncl	s_add_alvar		B,x,al_sbyte1,#2
	s_brl			.nowt
.nup
;--------------------
	s_jmpNOT_alvarAND	B,x,al_hitflags,#HF3,.nowt
	s_jmp_alvarZERO		B,x,al_sbyte1,.ncl2
	s_jmp_alvarMI		B,x,al_sbyte1,.ncl2
	s_clr_alvar		B,x,al_sbyte1
	s_brl			.nowt
.ncl2	s_sub_alvar		B,x,al_sbyte1,#2

;--------------------

.nowt	s_clr_alvar	B,x,al_hitflags
	s_clr_alsflag	x,collide
	s_jmpto_strat

	ifeq	1
;****************************************************************************
pilonpillar_Istrat
	s_set_alptrs	x,pilonpillar_strat,pilonpillarcol_Istrat,explode_Istrat
	s_set_aldata	x,#100,#1
pilonpillar_strat
	s_start_strat


	s_add_vecs2pos	x
	s_jmp_lower	x,#0,.stop



	s_end_strat
.stop	s_set_alvar	W,x,al_worldy,#0
	s_end_strat


pilonpillarcol_Istrat
	s_start_strat
	s_set_objtobealvar	y,x,al_collobjptr
	s_jmp_objptrbad		y,explode_Istrat
	s_copy_vecs		x,y
	s_set_strat		x,groundpilon_Istrat
	s_clr_alsflag		x,collide
	s_end_strat
 	endc

;****************************************************************************
groundpilon_Istrat
	s_start_strat
	s_set_alptrs	x,groundpilon_strat,hitflash_Istrat,explode_Istrat
	s_set_aldata	x,#16,#1
	s_copy_alvar2alvar	B,x,al_sbyte1,x,al_hp
groundpilon_strat
	s_start_strat


;----------------------------------------------------------
	s_cmp_alvars	B,x,al_hp,x,al_sbyte1
	s_beq		.ok
	s_copy_alvar2alvar	B,x,al_sbyte1,x,al_hp
	trigse		$14
	s_set_var2rnd	svar_word1,#15
	s_set_var2rnd	svar_word1+1,#0
	s_sub_var	W,svar_word1,#7
	s_set_vecs	x,svar_word1,#-60,#80
.ok

;----------------------------------------------------------

	s_add_vecs2pos	x

	s_jmp_lower	x,#-35,.nadd

	s_clr_alsflag	x,shadow

	s_jmp_alvarMI		W,x,al_vy,.none
	s_set_find		0
.loop	s_find_obj		y,x,#pilon,.none
	s_jmp_distmore		x,y,#70,.loop
	s_jmp_Ydistmore		x,y,#70,.loop
	s_jmp_objhigher		y,x,.loop
	s_copy_alvar2alvar	W,x,al_worldy,y,al_worldy
	s_sub_alvar		W,x,al_worldy,#70
         	s_brl			.found
.none
	s_set_alsflag	x,shadow
	s_add_alvar	W,x,al_vy,#5
	s_jmp_alvarZERO	W,x,al_vz,.isdown
	s_add_alvar	B,x,al_rotx,#10
	s_add_alvar	B,x,al_roty,#5
.isdown	s_end_strat

.nadd
	s_set_alvar	W,x,al_worldy,#0
.found
	s_set_alvar	B,x,al_rotx,#0
	s_zero_vecs		x

	s_jmpNOT_alsflag	x,shadow,.nsnd
	s_clr_alsflag	x,shadow
	trigse		$86
.nsnd

	s_end_strat

;*************************************************************************8
clasteroid_Istrat
	s_start_strat
	s_sprite_obj	x,#0
	s_set_alsflag	x,colldisable
	s_set_strat	x,clasteroid_strat
	s_set_lifecnt	x,#70
clasteroid_strat
	s_start_strat
	s_dec_lifecnt	x	
	s_end_strat
	










