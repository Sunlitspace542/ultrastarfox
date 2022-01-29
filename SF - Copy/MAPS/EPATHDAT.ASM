;*******************************************************************
;
;		kawaguchi path fun
;
;*******************************************************************


	START_PATH	example
	p_set		pbyte1,0

	p_trigger	.hit,whenhit
	p_end


.hit
	p_index	pword1,.jumptable,pbyte1
	p_inc	pbyte1
	p_ifnotsame	pbyte1,5,.norm
	p_zero	pbyte1
.norm
	p_gosub	pword1

	p_return

.jumptable
	dw	.one&WM
	dw	.two&WM
	dw	.three&WM
	dw	.four&WM
	dw	.five&WM

.one
	p_soundeffect	1
	p_return
.two
	p_soundeffect	2
	p_return
.three
	p_soundeffect	3
	p_return
.four
	p_soundeffect	4
	p_return
.five
	p_soundeffect	5
	p_return

;*******************************************************************
;		mato_0_100
;*******************************************************************
	START_PATH	mato_0_100
;mato_dai
	P_RELTOPLAYER	ON
	P_SETVEL       -15
	P_COLLISIONS	OFF
	P_SPAWN		0,-50,0,0,0,0,target_1,mato,2,2	
	P_END
;-------------------------------------------------------------------
;mato
 	start_path	mato
	p_reltoplayer	on
	p_setvel	-15
	p_trigger	.rot,always
	p_trigger	show_score100,whendead
	p_end
;-------------------------------------------------------------------
.rot
	p_add		rotz,8
 	p_return
;*******************************************************************
;		mato_500
;*******************************************************************
	START_PATH	mato_0_500
;mato_dai
	P_RELTOPLAYER	ON
	P_SETVEL       -15
	P_COLLISIONS	OFF
	P_SPAWN		0,-50,0,0,0,0,target_1,mato_1,6,6	
	P_END
;-------------------------------------------------------------------
;mato
	start_path	mato_1
	p_set		coltab,id_1_c	;Set shape color
	p_reltoplayer	on
	p_setvel	-15
	p_trigger	.rot,always
	p_trigger	show_score_500,whendead
	p_end
;-------------------------------------------------------------------
.rot
	p_add		rotz,16
 	p_return
;*******************************************************************
;		mato_2
;*******************************************************************
	start_path	mato_2
	p_reltoplayer	on
	p_setvel	-15
	p_shadow	on
	p_trigger	.move_r_slow,always
	p_wait		80
	p_trigger	.move_r_hi,always
	p_end
.move_r_slow
	p_add		worldx,-5
	p_return
.move_r_hi
	p_addanim	2,12
	p_add		worldx,-20
	p_return
;*******************************************************************
;		mato_3
;*******************************************************************
;=======================  PATH START ==============================
	start_path	mato_3
	p_reltoplayer	on
	p_setvel	-30
	p_trigger	show_score100,whendead
	p_trigger	.rot,always
	p_end
;-------------------------------------------------------------------
.rot
	p_add		rotz,8
 	p_return

;*******************************************************************
;*		bell_0
;*******************************************************************
	start_path	bell_0
;----- score disp counter init ----
	p_set		pbyte1,5

;----- player status  ------
	p_reltoplayer	on
	p_setvel	-30	;pilon speed
;----- Hit Check ------
bell_hit_check
	p_trigger	Hit_to_laser,WhenHitByPlayer
	p_trigger   	Hit_to_player,WhenHit
;----- path loop -----
bell_loop
	p_goto		bell_loop
;------------------------------------------------------------------
Hit_to_player
	p_withinradius	100,Hit_to_laser
	p_return
;------------------------------------------------------------------
Hit_to_laser
	p_collisions	off	;not check collisions detection
	p_set		hp,20

	p_dec		pbyte1
	p_index		pword1,.scoretable,pbyte1
	p_export	gword1,pword1	;gword1 ,<-- pword1

	p_spawn		0,-100,128,0,0,0,nullshape,disp_score,10,10
	p_become
	p_import	pword1,gword1
	p_unbecome

	p_force		.bell_jump
	p_return

.scoretable
	dw	msg_score1000
	dw	msg_score500
	dw	msg_score100
	dw	msg_score100
	dw	msg_score100
;------------------------------------------------------------------
.bell_jump

	p_ifsame	pbyte1,0,.pilon_explode	;if counter = 0(pilon die)

	p_trigger	Hit_to_laser,off     	;(not hit check) 
	p_trigger	Hit_to_player,off	;(not hit check)

;------- x rotation ------
	p_trigger	.rotx,always

;------- pilon y,z move ------ 
	p_set		pbyte2,-40
	p_do		41
;		p_add		worldx,pbyte2
		p_add		worldy,pbyte2
		p_add		worldz,50
		p_add		pbyte2,2 
	p_next
;----- pilon status reset -----
	p_trigger	.rotx,off
	p_set		rotx,0

	p_collisions	on

;-------- pilon color change check --------
	p_ifnotsame	pbyte1,1,bell_hit_check
	p_set		coltab,id_5_c
	p_goto		bell_hit_check
;------------------------------------------------------------------
.rotx
	p_add		rotx,16
	p_return
;------------------------------------------------------------------
.pilon_explode
	p_set		hp,0
	p_wait		10
	p_remove

;******************************************************************
;* 		score display path 
;******************************************************************
	start_path	disp_score
	p_collisions	off

	p_distmore	500,.tex_set
	p_add		worldz,300
.tex_set
	p_text		msg_score100,5,-50
	p_set		coltab,pword1
	p_trigger	pflash,2

	p_reltoplayer	on
	p_setvel	-20;(forword)
;----- score display time -----
	p_wait		15
	p_remove
;-------------------------------------------------------------------
pflash
		p_ifsame	depthoffset,5,.set6
		p_set		depthoffset,5
		p_return
.set6
		p_set		depthoffset,6
		p_return

;*******************************************************************
;
;			RING
;
;*******************************************************************
;------------- Red Ring ------------
	start_path	RringD
	p_inc		pbyte1	    	;pbyte1 = 4
	start_path	RringU
	p_inc		pbyte1		;pbyte1 = 3
	start_path	RringL
	p_inc		pbyte1		;pbyte1 = 2
	start_path	RringR
	p_inc		pbyte1		;pbyte1 = 1
	start_path	RringS	;pbyte1 = 0
	p_set		coltab,id_5_c&wm
	p_igoto		pBringS
;------------ Blue Ring --------------
	start_path	BringD	;pbyte1 = 4
	p_inc		pbyte1
	start_path	BringU	;pbyte1 = 3
	p_inc		pbyte1
	start_path	BringL	;pbyte1 = 2
	p_inc		pbyte1
	start_path	BringR	;pbyte1 = 1
	p_inc		pbyte1

;=========================== PTAH START ===========================
	start_path	BringS	;pbyte1 = 0
;pstop_ringS
	p_reltoplayer	on
	p_setvel	-50

	p_trigger	.Hit_laser,WhenHitByPlayer
	p_trigger	.Check_pbyte1,Always
	p_trigger	.Near_check,Always
	p_trigger	.Mov_ring,Always

	p_end
;--------------------------- Hit Laser ---------------------------
.Hit_laser
	p_zero	pbyte1
	p_zero	rotx
	p_zero	roty
	p_return

;-------------------   Ring Through Check -----------------------
.Check_pbyte1
	p_ifzero	pbyte1,.jump_Chcek_ring
	p_return

.jump_Chcek_ring
	p_force		.Check_ring
	p_return

.Check_ring
	p_trigger	.Mov_ring,off
	p_trigger	.Hit_laser,off
	p_trigger	.Check_pbyte1,off
	p_trigger	.Near_check,off

	p_collisions	off
	p_trigger	.Through_check,Always
	p_end
;---------------------------------------------------------------
.Through_check
	P_WITHINRADIUS	70,.jump_through_ring
	p_return

.jump_through_ring
	p_force		.Through_ring
	p_return

;------------------ Through Ring -------------------
.Through_ring
	p_trigger	.Through_check,off
	P_SOUNDEFFECT	$10
	p_end
;------------------ Move Ring ----------------------
.Mov_ring
	p_index	pword1,.jumptable,pbyte1
	p_gosub	pword1
	p_return

.Stop
	p_return
.Right
	p_add	roty,32
	p_add	worldx,20
	p_return
.Left
	p_add	roty,-32
	p_add	worldx,-20
	p_return
.Up
	p_add	rotx,32
	p_add	worldy,10
	p_return
.Down
	p_add	rotx,-32
	p_add	worldy,-10
	p_return

.jumptable
	dw	.Stop&WM
	dw	.Right&WM
	dw	.Left&WM
	dw	.Up&WM
	dw	.Down&WM

;----------------- Near to player  -----------------
.Near_check
	p_distless	200,.near_to_player
	p_return
.near_to_player
	p_collisions	off
       	p_return

;***********************************************************************
;*			DISPLAY SCORE
;***********************************************************************
show_score100
	p_set		pword1,msg_score100
	p_export	gword1,pword1	;gword1 ,<-- pword1
	p_spawn		0,-100,128,0,0,0,nullshape,disp_score,10,10
	p_become
	p_import	pword1,gword1	;pword <---- gword
	p_unbecome
	p_return
;-------------------------------------------------------------------
show_score_500
	p_set		pword1,msg_score500
	p_export	gword1,pword1	;gword1 ,<-- pword1
	p_spawn		0,-100,128,0,0,0,nullshape,disp_score,10,10
	p_become
	p_import	pword1,gword1	;pword <---- gword
	p_unbecome
	p_return
;================== 2ND PATH START ===================
	start_path	disp_score_100
	p_collisions	off
	p_text		msg_score100,5,-50
	p_set		coltab,pword1
	p_trigger	.flash,4		;flash check
	p_reltoplayer	on
	p_wait		10
	p_remove
	p_end
;-------------------------------------------------------------------
.flash
		p_ifsame	depthoffset,5,.set6
		p_set		depthoffset,5
		p_return
.set6
		p_set		depthoffset,6
		p_return
		p_end

;******************************************************************
;*
;******************************************************************
	start_path	kzaco_0
	start_path	kzaco_2
	start_path	kzaco_3
	start_path	kzaco_4

	p_reltoplayer	on
;====================== Moving Routine =======================
.mov1
	p_set		roty,128
	p_set		rotx,-64

	p_do   		10
	p_add		worldy,-50	
	p_next

.mov2
	p_do		100
	p_chase		rotx,0
	p_add		worldz,-20
	p_ifzero	rotx,.mov3
  	p_next

.mov3
	p_trigger	.Shot,8
	p_do		100
	p_add		worldz,-50
  	p_next
	p_end

.Shot
	p_weapon	SlowElaser
	p_fire		
	p_return

;******************************************************************
;*
;******************************************************************
	start_path	kzaco_1

	p_spaceship 	on
	p_add		rotz,16
	p_end

;====================== Moving Routine =======================
.mov1
	p_do		20
	p_add		worldz,30	
	p_next

	p_end

.mov2
	p_do		20
	p_add		worldy,50
  	p_next
.mov3
	p_do		20
	p_add		worldz,-30
  	p_next

	p_end


;******************************************************************
;***				  	    ***
;***		EGURIN'S  PATHDATA		    ***
;***					    ***
;******************************************************************

	START_PATH	e_gate

	P_INVISIBLE		ON

	P_WAIT		1

	P_REMOVE

;---------------------------------------------------------------------------

	START_PATH	e_flower

	P_INVISIBLE		ON
.flow_w
	P_DISTLESS		1500,.flow_open
	P_GOTO		.flow_w
.flow_open
	P_QSPAWN		flower,e_flopen,10,8
	P_REMOVE
;---------------------------------------------------------------------------

	START_PATH	e_flopen

	P_SETANIM		0
	P_INVINCIBLE	ON
	P_ZERO		pbyte1

	P_DO		12
	P_ADDANIM		1,13
	P_ADD		pbyte1,1
	P_IFNOTSAME	pbyte1,8,.e_flpo
	P_POLLEN	ON
.e_flpo
	P_NEXT

	P_END
;---------------------------------------------------------------------------

	START_PATH	trn_score

	P_RELTOPLAYER	ON
	P_COLLISIONS	OFF
	P_ZREMOVE		OFF

	P_SET		worldx,600
	P_SET		worldy,-1000
	P_ADD		worldz,3000
	P_SET		rotz,0

	P_TRIGGER		.read_eword,always
	P_TRIGGER		display_pword1,always

	P_WAIT		7

	P_TRIGGER		display_pword1,OFF
	P_WAIT		1

	P_REMOVE

.read_eword
	P_IMPORT		pword1,eword1
	P_RETURN

;---------------------------------------------------------------------------

	START_PATH	trn_ring2

	P_SET		pbyte2,1
	P_TRIGGER		ptrn_ring.trn_rot1,always

	P_IGOTO		ptrn_ring.trn_ring01

;---------------------------------------------------------------------------

	START_PATH	trn_ring

	P_SET		coltab,id_5_c
	P_SET		pbyte2,0
	P_TRIGGER	.trn_rot,always
.trn_ring01	LOCAL
	P_IMPORT		pword1,eword2
	P_IFSAME		pword1,601,.trn_ew2max
	P_ADD		pword1,1
	P_EXPORT		eword2,pword1
.trn_ew2max
	P_IMPORT		pword1,eword2
	P_IFNOTSAME		pword1,601,.trn_norm
	P_TRIGGER		.trn_jump,always
.trn_norm
	P_ZERO		pbyte1
	P_COLLISIONS	OFF

.trngate_wait
	P_WITHINRADIUS	70,.trngate_ok
	P_BEHINDPLAYER	.trngate_no
	P_GOTO		.trngate_wait
.trngate_no
	P_QSPAWN		nullshape,trn_score,10,10
	P_SET		pword1,0
	P_EXPORT		eword1,pword1
	P_WAIT		5
	P_REMOVE
.trngate_ok
	P_QSPAWN		nullshape,trn_score,10,10
	P_IMPORT		pword1,eword1
	P_IFSAME		pword1,999,.trngate_mada
	P_ADD		pword1,1
.trngate_mada
	P_EXPORT		eword1,pword1
	P_IMPORT		pbyte2,ebyte2
	P_SOUNDEFFECT	$10
	P_WAIT		5
	P_IFSAME		pbyte2,2,.trngate_yes
	P_IFSAME		pword1,5,.trngate_mes1
	P_IFSAME		pword1,10,.trngate_mes2
.trngate_yes
	P_REMOVE
.trngate_mes1
	P_MSG		121
	P_REMOVE
.trngate_mes2
	P_MSG		122
	P_REMOVE
.trn_rot
	P_ADD		rotz,8
	P_RETURN
.trn_rot1	LOCAL
	P_ADD		rotz,-8
	P_RETURN

.trn_jump
	P_ADD		worldy,pbyte1
	P_HITGROUND		80,.trn_p1ini
	P_ADD		pbyte1,3
	P_RETURN
.trn_p1ini
	P_SET		pbyte1,-40
	P_RETURN

;---------------------------------------------------------------------------

	START_PATH	trn_ck
				;pbyte1 is ebyte1
				;pbyte2=0 is can say
	P_RELTOPLAYER	ON
	P_INVISIBLE		ON

	P_SET		pbyte1,0
	P_SET		pword1,0
	P_EXPORT		eword1,pword1
	P_EXPORT		eword2,pword1
	P_EXPORT		ebyte2,pbyte1
	P_TRIGGER		.trn_ck_yn,always

	P_MSG		118
	P_WAIT		60
	P_MSG		119
	P_WAIT		60
	P_MSG		124
	P_WAIT		60
	P_MSG		123
	P_WAIT		100
	P_MSG		120

.trn_ck_w
	P_WAIT		1
	P_GOTO		.trn_ck_w
.trn_ck_yn
	P_DISTMORE		2000,.trn_distok
	P_ADD		worldz,1000
.trn_distok
	P_DISTLESS		4000,.trn_distok2
	P_ADD		worldz,-1000
.trn_distok2
	P_IMPORT		pword1,eword1
	P_IFSAME		pword1,15,.trn_ck_ms3

	P_ZERO		pbyte1
.trn_ck_mada
	P_RETURN

.trn_ck_ms3
	P_IFSAME		pbyte1,1,.trn_ck_mada
	P_SET		pbyte1,1
	P_MSG		125
	P_SET		pbyte2,2
	P_EXPORT		ebyte2,pbyte2
	P_RETURN

;---------------------------------------------------------------------------

	START_PATH	tenki_dm

	P_COLLISIONS	OFF

	P_ADD		roty,128

	P_END

;---------------------------------------------------------------------------

	START_PATH	tenki_on

	P_COLLISIONS		OFF
	P_ZREMOVE		ON
	P_SET			pbyte1,0
	P_EXPORT		ebyte3,pbyte1
	P_ADD		roty,128

.tenki_0
	P_WITHINRADIUS		100,.tenki_1
	P_GOTO			.tenki_0

.tenki_1
	P_SOUNDEFFECT		$12
	P_SET			pbyte1,1
	P_EXPORT		ebyte3,pbyte1
	P_WAIT			3
	P_REMOVE
;---------------------------------------------------------------------------
;x=0970,y=-100,z=7000,big_meteor,bird_meteor,10,10

	START_PATH		bird_meteor

	P_INVINCIBLE	ON
	P_TRIGGER		.big_met_c,whenhitbyplayer
	P_SET		pbyte1,0
	P_EXPORT		eflag1,pbyte1
	P_SPRITE		0

.big_met_w
	P_DISTLESS		1000,.big_met_end
	P_GOTO		.big_met_w
.big_met_end
	P_TRIGGER		.big_met_c,OFF

	P_END
.big_met_c
	P_ADD		pbyte1,1
	P_IFNOTSAME		pbyte1,10,.big_met_ret
	P_FORCE		.big_met_next
.big_met_ret
	P_RETURN
.big_met_next
	P_TRIGGER		.big_met_c,OFF
	P_RELTOPLAYER	ON
	P_DO		8
	P_QSPAWN		nullshape,damy_exp,10,10
	P_NEXT
	P_QSPAWN		egg,e_egg,10,10
	P_EXPLODE

;---------------------------------------------------------------------------

	START_PATH	damy_exp


	P_SETRANDOM		pbyte1,127
	P_SETRANDOM		pbyte2,127

	P_ADD		pbyte1,pbyte1
	P_ADD		pbyte1,pbyte1
	P_ADD		pbyte2,pbyte2
	P_ADD		pbyte2,pbyte2
	P_ADD		worldx,pbyte1
	P_ADD		worldy,pbyte2
	P_ADD		worldz,-50

	P_EXPLODE

;---------------------------------------------------------------------------

	START_PATH	damy_exp2

	P_EXPLODE

;---------------------------------------------------------------------------

	START_PATH	e_egg

	P_RELTOPLAYER	ON
	P_SPRITE		0

.egg_0
	P_DISTMORE		6000,.egg_1
	P_CHASE		worldx,0
	P_CHASE		worldy,140
	P_ADD		worldz,100
	P_GOTO		.egg_0
.egg_1
	P_INVISIBLE		ON
	P_WAIT		5
	P_SOUNDEFFECT	$3a
	P_QSPAWN		big_bird,e_big_bird,10,10
	P_REMOVE

;---------------------------------------------------------------------------

	START_PATH	e_big_bird

;0,1,2,3 nobiru
;4~13? patapata

	P_RELTOPLAYER	ON
	P_ALWAYSGENVECS	ON
	P_COLLISIONS	OFF
	P_SET		pbyte1,-20
	P_SET		pbyte2,0
	P_TRIGGER		.bird_updown,always
	P_TRIGGER		.bird_pcheck,always

	P_SET		roty,128

	P_SPAWN		0,0,0,0,0,0,boss_d_8,chibir_1,10,10,1
	P_SPAWN		0,0,0,0,0,0,boss_d_9,chibir_2,10,10,2

	P_SETVEL		40
	P_WAIT		9
	P_SOUNDEFFECT	$90
	P_WAIT		1
;.tes_0
	P_WAITCHASE		roty,128-32
	P_WAIT		1
	P_WAITCHASE		roty,128
	P_WAIT		1
	P_WAITCHASE		roty,128+32
	P_WAIT		23
	P_WAITCHASE		roty,128
	P_WAIT		1
	P_WAITCHASE		roty,128-32
	P_WAIT		1
	P_WAITCHASE		roty,128
	P_WAIT		100
;.tes_rem
	P_REMOVE
.bird_updown
	P_PLAYERDEAD	.bird_end
	P_IFSAME		pbyte2,1,.bird_bil
	P_ADD		worldy,pbyte1
	P_ADD		pbyte1,1
	P_IFNOTSAME		pbyte1,20,.abo_norm
	P_SET		pbyte2,1
.abo_norm
	P_RETURN
.bird_end
	P_FORCE		.bird_end2
	P_RETURN
.bird_end2
	P_TRIGGER		.bird_pcheck,OFF
	P_END
.bird_bil
	P_ADD		worldy,pbyte1
	P_ADD		pbyte1,-1
	P_IFNOTSAME		pbyte1,-20,.bil_norm
	P_SET		pbyte2,0
.bil_norm
	P_RETURN
.bird_pcheck
	P_PLAYERDEAD	.bird_end
	P_WITHINRADIUS	40,.bird_pc_0
	P_RETURN
.bird_pc_0
	P_FORCE		.bird_touch
	P_RETURN
.bird_touch
	P_PLAYERDEAD	.bird_endee
	P_SET		pbyte1,1
	P_EXPORT		eflag1,pbyte1
	P_SET	pbyte1,le_enterspec
	P_EXPORT	levelfinished,pbyte1
	P_SET	pbyte1,1
	P_EXPORT	nosetport3,pbyte1

	P_START65816
	s_and_var		B,pshipflags3,#~psf3_enginesnd
	s_or_var	B,pshipflags3,#psf3_nocollisions
	startbgm	$2
	routechange	1
	lda	#0
	sta.l	m_clrbitmaps
	P_END65816
.bird_endee
	P_END

;----------------------------------------------------------------------------

	START_PATH	chibir_2

	P_ADD		childx,-6
	P_IGOTO		pchibir_1.chibir_0

;----------------------------------------------------------------------------

	START_PATH	chibir_1

	P_ADD		childx,6
.chibir_0	LOCAL
	P_ADD		childy,19
	P_ADD		childz,8
	P_COLLISIONS	OFF
	P_SETANIM		4
	P_SET		pbyte1,4
	P_SET		childroty,128
	P_TRIGGER		.bird_anim,always

	P_END
.bird_anim
	P_ADD		pbyte1,1
	P_ADDANIM		1,13
	P_IFNOTSAME		pbyte1,13,.bird_ani1
	P_SETANIM		4
	P_SET		pbyte1,4
.bird_ani1
	P_RETURN
;---------------------------------------------------------------------------
	START_PATH	pinita_b

	P_GOSUB		ppinita_a.pinita_init

	P_SHADOW		OFF

	P_IGOTO		ppinita_a.pinita_0
;---------------------------------------------------------------------------

	START_PATH	pinita_a

	P_GOSUB		.pinita_init

	P_ADD		worldy,-100

.pinita_0	LOCAL
	P_TRIGGER		.pinita,whenhitbyplayer

.pinita_s
	P_WAIT		1
	P_GOTO		.pinita_s

	P_END

.pinita	LOCAL
	P_FORCE		.pinita_1
	P_RETURN
.pinita_1
	P_COLLISIONS	OFF
	P_ABOVEPLAYER	.pinita_2
	P_DO		15
	P_ADD		rotx,-32
	P_NEXT
	P_IGOTO		.pinita_3
.pinita_2
	P_DO		15
	P_ADD		rotx,32
	P_NEXT
.pinita_3
	P_COLLISIONS	ON
	P_SET		roty,128
	P_SET		rotx,64
	P_GOTO		.pinita_s

.pinita_init	LOCAL
	P_RELTOPLAYER	OFF
	P_INVINCIBLE	ON

	P_ADD		worldx,130
	P_QSPAWN		r_bu_7,e_pill,10,8
	P_ADD		worldx,-260
	P_QSPAWN		r_bu_7,e_pill,10,8
	P_ADD		worldx,130

	P_SET		roty,128
	P_SET		rotx,64

	P_RETURN
;---------------------------------------------------------------------------

	START_PATH	e_pill

	P_INVINCIBLE	ON
	P_SHADOW		OFF

	P_SET		rotz,128

	P_END
;---------------------------------------------------------------------------

	START_PATH	itachi_b

	P_SET		coltab,id_1_c
	P_SET		pbyte1,1
	P_SET		pword1,0
	P_RANDOMGOTO	pitachi_a.itachi_init
	P_SET		pword1,1

	P_IGOTO		pitachi_a.itachi_init

;---------------------------------------------------------------------------

	START_PATH	itachi_a

	P_SET		pbyte1,0
.itachi_init	LOCAL
	P_RELTOPLAYER	OFF
	P_WEAPON		Hplasma
	P_SET		pbyte2,0
	P_SET		hp,4
	P_SETRANDOM		roty,127
	P_TRIGGER		.itachi_fire,whenhitbyplayer
	P_TRIGGER		.itachi_kait,always

.itachi_0
	P_DISTLESS		700,.itachi_f
	P_GOTO		.itachi_0

.itachi_f
	P_IFSAME		pbyte1,0,.itachi_ashot
	P_IFSAME		pword1,0,.itachi_g
	P_SET		rotx,0
	P_SET		roty,128
	P_FIRE
	P_SET		rotx,10
	P_SET		roty,128+10
	P_FIRE
	P_SET		roty,128-10
	P_FIRE
	P_SET		rotx,256-10
	P_SET		roty,128+10
	P_FIRE
	P_SET		roty,128-10
	P_FIRE
	P_SET		pword1,0
	P_IGOTO		.itachi_back
.itachi_g
	P_SET		rotx,0
	P_SET		roty,128
	P_FIRE
	P_SET		roty,128+10
	P_FIRE
	P_SET		roty,128-10
	P_FIRE
	P_SET		rotx,256-10
	P_SET		roty,128
	P_FIRE
	P_SET		rotx,10
	P_FIRE
	P_SET		pword1,1
	P_IGOTO		.itachi_back
.itachi_ashot
	P_SET		rotx,0
	P_SET		roty,128
	P_GOSUB		facefire

	P_IFSAME		pbyte2,0,.itachi_back
	P_EXPLODE
.itachi_back
	P_DISTMORE		700,.itachi_0

	P_END

.itachi_fire
	P_FORCE		.itachi_f
	P_SET		pbyte2,1
	P_RETURN
.itachi_kait	LOCAL
	P_ADD		rotx,8
	P_ADD		worldz,30
	P_RETURN

;------------------------------------------------------------------

	START_PATH	e_aste

	P_INVINCIBLE	ON
	P_SPRITE		0

	P_END
;------------------------------------------------------------------

	START_PATH	e_aste_b


	P_INVINCIBLE	ON

	P_SPRITE		0

	P_ZREMOVE		ON


.ast_bw
	P_IFFLAG		.ast_bb
	P_GOTO		.ast_bw
.ast_bb
	P_SETRANDOM		pbyte1,31
	P_RANDOMGOTO	.ast_ne1
	P_NEG		pbyte1
.ast_ne1
	P_SETRANDOM		pbyte2,31
	P_RANDOMGOTO	.ast_ne2
	P_NEG		pbyte2
.ast_ne2
	P_ADD		worldx,pbyte1
	P_ADD		worldy,pbyte2
	P_GOTO		.ast_ne2

;------------------------------------------------------------------

	START_PATH	e_breaste

	P_SETSTRAT	break_meteor_istrat

	P_END
;------------------------------------------------------------------
;use asteroid2

	START_PATH	insekikun

	P_RELTOPLAYER	OFF
	P_INVISIBLE		ON

	P_SPAWN		65,0,0,0,0,0,asteroid1,e_aste_b,10,8,1
	P_SPAWN		130,0,0,0,0,0,asteroid1,e_aste_b,10,8,2
	P_SPAWN		-65,0,0,0,0,0,asteroid1,e_aste_b,10,8,3
	P_SPAWN		-130,0,0,0,0,0,asteroid1,e_aste_b,10,8,4
	P_SPAWN		0,0,0,0,0,0,asteroid1,e_breaste,10,10,5

.inse_0
	P_ADD		rotz,4
	P_CHILDDEAD		5,.unlinast
	P_BEHINDPLAYER	.inse_1
	P_GOTO		.inse_0
.inse_1
	P_GOSUB		.unlin_0
	P_WAIT		20
	P_END
.inse_2
	P_EXPLODE
	P_END
.unlinast
	P_FLAGCHILD		1
	P_FLAGCHILD		2
	P_FLAGCHILD		3
	P_FLAGCHILD		4
	P_GOSUB		.unlin_0
	P_IGOTO		.inse_2
.unlin_0
	P_UNLINKCHILD	1
	P_UNLINKCHILD	2
	P_UNLINKCHILD	3
	P_UNLINKCHILD	4
	P_UNLINKCHILD	5
	P_RETURN
;------------------------------------------------------------------

	START_PATH	pyonta

	P_RELTOPLAYER	OFF
	P_WEAPON		relslowelaser
	P_COLLISIONS	OFF
	P_TRIGGER		.pyonta_j,whenhitbyplayer
	P_TRIGGER		.pyonta_e,whendead
	P_TRIGGER		.pyonta_h,always
	P_SET		pbyte2,20
	P_SET		pword1,0
	P_SET		hp,4

	P_IFLEVEL		2,.pyonta_s

	P_SPAWN		0,50,0,0,0,0,asteroid1,e_aste,10,8
	P_SPAWN		-400,50,0,0,0,0,asteroid1,e_aste,10,8
.pyonta_s
	P_GOSUB		.pyonlr

	P_SET		pbyte1,-47

	P_DO		5
	P_GOSUB		.pyon_up
	P_ADD		pbyte1,4
	P_WAIT		1
	P_GOSUB		.pyon_up
	P_ADD		pbyte1,6
	P_NEXT
	

	P_DISTLESS		1000,.pyon_pass
	P_SET		roty,128
	P_ADD		worldy,-50
	P_GOSUB		facefire

	P_SET		roty,0
	P_SET		rotx,0
	P_ADD		worldy,50
.pyon_pass
	P_SET		pbyte1,3
	P_DO		5
	P_GOSUB		.pyon_up
	P_ADD		pbyte1,4
	P_WAIT		1
	P_GOSUB		.pyon_up
	P_ADD		pbyte1,6
	P_NEXT

	P_WAIT		10
	P_IGOTO		.pyonta_s
.pyon_rem
	P_REMOVE
	P_END
.pyon_up
	P_ADD		worldy,pbyte1
	P_ADD		worldx,pbyte2
	P_IFNOTSAME		pword1,0,.pyon_ru
	P_RETURN
.pyon_ru
	P_ADD		roty,32
	P_RETURN
.pyonlr
	P_IFSAME		pbyte2,20,.pyon_l
	P_SET		pbyte2,20
	P_RETURN
.pyon_l
	P_SET		pbyte2,-20
	P_RETURN
.pyonta_j
	P_FORCE		.pyonta_bye
	P_SETRANDOM		pbyte1,31
	P_RANDOMGOTO	.pyon_ne1
	P_NEG		pbyte1
.pyon_ne1
	P_SETRANDOM		pbyte2,31
	P_RANDOMGOTO	.pyon_ne2
	P_NEG		pbyte2
.pyon_ne2
	P_SET		pword1,1
	P_RELTOPLAYER	ON
	P_RETURN
.pyonta_bye
	P_ADD		pword1,1
	P_IFNOTSAME		pword1,100,.bye_tru
	P_EXPLODE
.bye_tru
	P_GOSUB		.pyon_up
	P_IFNOTBETWEEN	-1000,worldx,1000,.pyon_byey
	P_GOTO		.pyonta_bye
.pyon_byey
	P_IFNOTBETWEEN	-1000,worldy,1000,.pyon_rem
	P_GOTO		.pyonta_bye
.pyonta_e
	P_FORCE		.pyon_ex
	P_RETURN
.pyon_ex
	P_ADD		worldy,-50
	P_RETURN
.pyonta_h
	P_DISTLESS		2500,.pyonta_hit
	P_RETURN
.pyonta_hit
	P_COLLISIONS	ON
	P_RETURN
;------------------------------------------------------------------

	START_PATH	korori

	P_RELTOPLAYER	OFF
	P_TRIGGER		.koro_jump,whenhitbyplayer
	P_TRIGGER		.koro_exp,whendead
	P_SET		hp,6
	P_SET		ap,6
	P_SET		rotz,0
	P_SET		roty,0
	P_SET		rotx,0
	P_SET		pbyte2,0

	P_IGOTO		.koro_star
.koro_0
	P_WAIT		1
	P_GOTO		.koro_0
.koro_jump
	P_FORCE		.koro_1
	P_SET		pbyte2,15
	P_RANDOMGOTO	.koro_r
	P_SET		pbyte2,-15
.koro_r
	P_RETURN
.koro_1
	P_RELTOPLAYER	ON
	P_SET		pbyte1,-47
	P_DO		5
	P_GOSUB		.koro_up
	P_WAIT		1
	P_ADD		pbyte1,4
	P_GOSUB		.koro_up
	P_ADD		pbyte1,6
	P_NEXT

	P_WAIT		2

.koro_star
	P_SET		pbyte1,3
	P_GOSUB		.koro_up
	P_WAIT		1

	P_DO		4
	P_ADD		pbyte1,4
	P_GOSUB		.koro_up
	P_HITGROUND		0,.koro_bre
	P_WAIT		1
	P_ADD		pbyte1,6
	P_GOSUB		.koro_up
	P_HITGROUND		0,.koro_bre
	P_IGOTO		.koro_lp1
.koro_bre
	P_BREAK		.koro_stnd
.koro_lp1
	P_NEXT

	P_WAIT		1
	P_SET		pbyte1,47
.koro_w
	P_GOSUB		.koro_up
	P_HITGROUND		0,.koro_stnd
	P_GOTO		.koro_w
.koro_up
	P_ADD		worldy,pbyte1
	P_ADD		worldx,pbyte2
	P_ADD		worldz,5
	P_ADD		roty,32
	P_RETURN
.koro_stnd
	P_RELTOPLAYER	OFF
	P_SET		roty,0
	P_SET		worldy,0
	P_GOTO		.koro_0
.koro_exp
	P_ADD		worldy,-50
	P_RETURN
;------------------------------------------------------------------

	START_PATH	call_fol

	P_RELTOPLAYER	ON
	P_ZREMOVE		OFF
	P_ALWAYSGENVECS	ON
	P_SPACESHIP		ON
	P_SETANIM		15
	P_SOUND		3
	P_SET		pword1,0
	P_TRIGGER		.colfol_ck,always

	P_SET		hp,10
	P_SET		ap,8

	P_LEFTOFPLAYER	.calfol_l
	P_SET		roty,72
	P_SET		rotx,32
	P_SETVEL		50
	P_IGOTO		.calfol_z
.calfol_l
	P_SET		roty,256-72
	P_SET		rotx,32
	P_SETVEL		50
.calfol_z
	P_WAIT		20
.calfol_s
	P_FACEPLAYER
	P_DISTLESS		1500,.calfol_w
	P_GOTO		.calfol_s
.calfol_w
	P_BEHINDPLAYER	.calfol_spaw
	P_GOTO		.calfol_w

.calfol_spaw
	P_WAIT		5

	P_QSPAWN		shark,folow,10,10
.col_rem
	P_REMOVE
	P_END
.colfol_ck
	P_IFSAME		pword1,200,.colfol_rem
	P_ADD		pword1,1
	P_RETURN
.colfol_rem
	P_FORCE		.col_rem
	P_RETURN
;------------------------------------------------------------------

	START_PATH	folow

	P_ZREMOVE		OFF
	P_SOUND		3
	P_WEAPON		slowelaser
	P_ALWAYSGENVECS	ON
	P_SETANIM		15
	P_SET		pbyte1,0
	P_SET		pbyte2,0
	P_TRIGGER		.fol_adz,always
	P_TRIGGER		.fol_exp,whenhitbyplayer

	P_SET		hp,40
	P_SET		ap,8
	P_SET		rotx,0
	P_SET		roty,0
	P_SET		rotz,0

	P_SET		rotx,2

	P_FIRE
	P_WAIT		10
	P_ADD		roty,-4
	P_FIRE
	P_WAIT		10
	P_ADD		roty,8
	P_FIRE

	P_DO		2
	P_DO		10
	P_FACEPLAYER
	P_NEXT


	P_FIRE

	P_DO		11
	P_FACEPLAYER
	P_NEXT
	

	P_FIRE

	P_DO		13
	P_FACEPLAYER
	P_NEXT


	P_FIRE
	P_NEXT

	P_DO		4
	P_FACEPLAYER
	P_NEXT

	P_TRIGGER		.fol_adz,OFF
	P_RELTOPLAYER	ON
	P_ALWAYSGENVECS	ON

	P_IFBETWEEN		64,roty,192,.fol_goj
.fol_goo
	P_CHASE		rotx,0
	P_CHASE		roty,0
	P_IFSAME		roty,0,.fol_gop
	P_GOTO		.fol_goo
.fol_gop
	P_IFSAME		rotx,0,.fol_goq
	P_GOTO		.fol_goo
.fol_goq
	P_SETVEL		50
	P_COLLISIONS	OFF
	P_WAIT		5
	P_COLLISIONS	ON

	P_WAIT		10

.fol_goj
	P_SETVEL		0
	P_WAITFACEPLAYER

	P_FIRE

	P_ZREMOVE		ON
	P_ACCEL		50,2

	P_DO		8
	P_FIRE
	P_DO		8
	P_FACEPLAYER
	P_NEXT
	P_NEXT

	P_END
.fol_adz
	P_ADD		worldz,61
	P_RETURN
.fol_exp
	P_FORCE		.fol_ex
	P_RETURN
.fol_ex
	P_EXPLODE
;------------------------------------------------------------------
;x=0000,y=-700,z=1000

	START_PATH	check

	P_INVISIBLE		ON
	P_RELTOPLAYER	ON
	P_SET		pbyte1,0

.ck_st
	P_LEFTOFPLAYER	.ck_l
.ck_r
	P_ADD		worldx,-40
	P_LEFTOFPLAYER	.ck_r1
	P_GOTO		.ck_r
.ck_r1
	P_IFNOTBETWEEN	-350,worldx,350,.ck_atck
	P_GOTO		.ck_wait
.ck_l
	P_ADD		worldx,40
	P_RIGHTOFPLAYER	.ck_l1
	P_GOTO		.ck_l
.ck_l1
	P_IFNOTBETWEEN	-350,worldx,350,.ck_atck
	P_GOTO		.ck_wait
.ck_atck
	P_QSPAWN		s_hou_0,at_hbeam,10,10

.ck_wait
	P_WAIT		50
	P_ADD		pbyte1,1
	P_IFNOTSAME		pbyte1,6,.ck_st
	P_REMOVE
	P_END

;------------------------------------------------------------------

	START_PATH	at_hbeam

	P_RELTOPLAYER	ON
	P_INVINCIBLE	ON
	P_ALWAYSGENVECS	ON
	P_SET		pbyte1,0
	P_TRIGGER		.at_rot,always
	P_WEAPON		hplasma

	P_SET		roty,128

.at_down1
	P_IFBETWEEN		-500,worldy,200,.at_atck
	P_GOTO		.at_down1
.at_atck
	P_DO		5
	P_GOSUB		facefire
	P_WAIT		4
	P_NEXT

.at_down2
	P_WAIT		10
	P_REMOVE
	P_END
.at_rot
	P_ADD		rotz,8
	P_ADD		worldy,30
	P_RETURN
;------------------------------------------------------------------

	START_PATH	tmp_tank

	P_RELTOPLAYER	ON
	P_ALWAYSGENVECS	ON
	P_INVISIBLE		ON
	P_WEAPON		relslowelaser
	P_FINDSHAPE		tank_2
	P_TRIGGER		.tmpatck,whenshapedead

	P_SET		hp,2
	P_SET		ap,6
	P_SET		roty,128
	P_SET		rotx,64

	P_WAIT		200
	
	P_REMOVE

	P_END
.tmpatck
	P_FORCE		.tmpatck_0
	P_RETURN
.tmpatck_0
	P_TRIGGER		.tmpatck,OFF
	P_INVISIBLE		OFF
	P_SOUND		7
	P_RANDOMGOTO	.tmpatck_1
	P_TRIGGER		pspiralexplode,WHENDEAD
.tmpatck_1
	P_SETVEL		40

	P_WAITCHASE		rotx,0

	P_FIRE

	P_DO		10
	P_FACEPLAYER
	P_NEXT

	P_DISTLESS		800,.tmpend
	P_FIRE

	P_DO		10
	P_FACEPLAYER
	P_NEXT

	P_DISTLESS		800,.tmpend
	P_FIRE

	P_DO		10
	P_FACEPLAYER
	P_NEXT

	P_DISTLESS		800,.tmpend
	P_FIRE
.tmpend
	P_END
;------------------------------------------------------------------
;y = -100

	START_PATH	kamome

	P_RELTOPLAYER	ON
	P_SPACESHIP		ON
	P_ALWAYSGENVECS	ON
	P_ZREMOVE		OFF
	P_COLLISIONS	OFF
	P_TRIGGER		.dobon,whenhitbyplayer
	P_WEAPON		relslowelaserhome
	P_SET		hp,20
	P_SET		ap,8

	P_IFLEVEL		3,.kamo_jp
	P_SOUND		7
	P_SET		hp,4
	P_SET		ap,4
	P_TRIGGER		.dobon,OFF
	P_TRIGGER		.gasyan,whenhitbyplayer

.kamo_jp
	P_LEFTOFPLAYER	.kamo_l

	P_SET		roty,50
	P_SETVEL		35
	P_WAIT		30
	P_WAITCHASE		rotz,256-20
	P_WAIT		1
	P_WAITCHASE		rotz,0

	P_COLLISIONS	ON
	P_WAIT		10

	P_DO		12
	P_CHASE		rotx,256-32
	P_CHASE		rotz,32
	P_NEXT

	P_ZREMOVE		ON
	P_IFNOTLEVEL	1,.kamo_s1
	P_FIRE
.kamo_s1
	P_WAIT		20
	P_IFNOTLEVEL	1,.kamo_s2
	P_FIRE
.kamo_s2

	P_DO		16
	P_CHASE		rotx,32
	P_CHASE		rotz,0
	P_NEXT

	P_IFNOTLEVEL	1,.kamo_s3
	P_FIRE
.kamo_s3
	P_WAIT		5

	P_IFNOTLEVEL	1,.kamo_s4
	P_FIRE
.kamo_s4
	P_WAITCHASE		rotx,0

	P_DO		16
	P_FACEPLAYER
	P_NEXT

	P_IGOTO		.kamo_z
.kamo_l
	P_SET		roty,256-50
	P_SETVEL		35
	P_WAIT		30
	P_WAITCHASE		rotz,20
	P_WAIT		1
	P_WAITCHASE		rotz,0

	P_COLLISIONS	ON
	P_WAIT		10

	P_DO		12
	P_CHASE		rotx,256-32
	P_CHASE		rotz,256-32
	P_NEXT

	P_ZREMOVE		ON
	P_WAIT		20

	P_DO		16
	P_CHASE		rotx,32
	P_CHASE		rotz,0
	P_NEXT

	P_WAIT		5

	P_WAITCHASE		rotx,0

	P_DO		16
	P_FACEPLAYER
	P_NEXT

.kamo_z
	P_WAIT		80
	P_REMOVE
	P_END
.dobon
	P_FORCE		.dobon_0
	P_IFNOTLEVEL	3,.dobon_nos
	P_SOUNDEFFECT	$38
.dobon_nos
	P_SETVEL		0
	P_RETURN
.dobon_0
	P_RELTOPLAYER	OFF
	P_SPACESHIP		OFF
	P_ZREMOVE		ON
	P_SETANIM		0
.dobon_1
	P_ADD		rotz,32
	P_ADD		worldy,40
	P_HITGROUND		0,.dobon_2
	P_GOTO		.dobon_1
.dobon_2
	P_QSPAWN		splash,e_spla_dw,10,10
	P_REMOVE
.gasyan
	P_FORCE		.gasyan_0
	P_SPACESHIP		OFF
	P_ZREMOVE		ON
	P_RETURN
.gasyan_0
	P_TRIGGER		.gasyan,OFF
	P_SMOKE		ON
	P_SET		rotx,64
	P_SETVEL		20
.gasyan_1
	P_ADD		rotz,16
	P_HITGROUND		0,.gasyan_2
	P_GOTO		.gasyan_1
.gasyan_2
	P_EXPLODE
	P_END
;------------------------------------------------------------------

	START_PATH	e_spla_up

	P_SET		pbyte1,1

	P_IGOTO		pe_spla_dw.spla_0

;------------------------------------------------------------------

	START_PATH	e_spla_dw

	P_SET		pbyte1,0

.spla_0	LOCAL

	P_COLLISIONS	OFF
	P_SHADOW		OFF
	P_SET		coltab,splash_c&WM
	P_SET		colframe,128

	P_SPRITE		0

	P_IFSAME		pbyte1,1,.spla_u

	P_JSL65816		enemydownsea_l

	P_IGOTO		.justonce
.spla_u
	P_JSL65816		enemyupsea_l

.justonce	P_WAIT		1
	P_ADD		colframe,1
	P_IFNOTSAME		colframe,128+6,.justonce
	P_REMOVE

;---------------------------------------------------------------------------

	START_PATH	e_flyfish

	P_INVISIBLE		ON

	P_SET		hp,2
	P_SET		ap,8
	P_TRIGGER		.ffish_adz,always

	P_LEFTOFPLAYER	.ffish_l

	P_SET		roty,64
	P_SET		pbyte1,-30
	P_IGOTO		.ffish_0
.ffish_l
	P_SET		roty,192
	P_SET		pbyte1,30
.ffish_0
	P_SET		pbyte2,-40

.ffish_1
	P_QSPAWN		splash,e_spla_up,10,10
	P_INVISIBLE		OFF

	P_DO		8
	P_ADD		worldx,pbyte1
	P_ADD		worldy,pbyte2
	P_ADD		pbyte2,5
	P_NEXT

	P_ADD		worldx,pbyte1
	P_WAIT		1

	P_DO		9
	P_ADD		worldx,pbyte1
	P_ADD		worldy,pbyte2
	P_ADD		pbyte2,5
	P_NEXT

	P_QSPAWN		splash,e_spla_dw,10,10
	P_INVISIBLE		ON

	P_WAIT		20

	P_IFSAME		roty,64,.ffish_roy
	P_SET		roty,64
	P_IGOTO		.ffish_sety
.ffish_roy
	P_SET		roty,192
.ffish_sety
	P_IFSAME		pbyte1,-30,.ffipby1_30
	P_SET		pbyte1,-30
	P_IGOTO		.ffish_0
.ffipby1_30
	P_SET		pbyte1,30
	P_IGOTO		.ffish_0
.ffish_adz
	P_ADD		worldz,30
	P_RETURN
;-------------------------------------------------------------------

	START_PATH	e_bee

	P_RELTOPLAYER	OFF
	P_ALWAYSGENVECS	OFF
	P_SET		coltab,id_0_c
	P_SET		pbyte1,0
	P_SET		pbyte2,1
	P_TRIGGER		.bee_m,always
	P_TRIGGER		.bee_h,always
	P_TRIGGER		.bee_f,whenhitbyplayer
	P_SET		hp,10
	P_SET		ap,4
	P_SOUND		3

	P_SET		roty,128
;	P_SETVEL		90
.bee_0
	P_DISTLESS		800,.bee_1
	P_GOTO		.bee_0
.bee_1
	P_RELTOPLAYER	ON
	P_ALWAYSGENVECS	ON
	
	P_GOTOPOS		0,-100,500,10
	P_WAIT		10
	P_TRIGGER		.bee_f,OFF
	P_TRIGGER		.bee_c,2
	P_SET		coltab,id_2_c
	P_SET		hp,30

	P_SETVEL		29

	P_WAIT		100

	P_ZREMOVE		ON
	P_TRIGGER		.bee_m,OFF
	P_TRIGGER		.bee_c,OFF
	P_WAITCHASE		roty,128

	P_WAIT		20

	P_RELTOPLAYER	OFF

	P_REMOVE

	P_END
.bee_c
	P_FACEPLAYER
	P_RETURN
.bee_m
	P_IFSAME		pbyte2,-1,.bee_dw
	P_ADD		worldy,-3
	P_IFSAME		pbyte1,15,.bee_inu
	P_ADD		pbyte1,1
	P_RETURN
.bee_inu
	P_SET		pbyte2,-1
	P_RETURN
.bee_dw
	P_ADD		worldy,3
	P_IFSAME		pbyte1,-15,.bee_ind
	P_ADD		pbyte1,-1
	P_RETURN
.bee_ind
	P_SET		pbyte2,1
	P_RETURN
.bee_h
	P_HITGROUND		80,.bee_i
	P_RETURN
.bee_i
	P_ADD		worldy,-5
	P_RETURN
.bee_f
	P_FORCE		.bee_g
	P_SET		coltab,id_1_c
	P_RETURN
.bee_g
	P_DO		10
	P_ADD		worldz,40
	P_ADD		worldy,-6
	P_ADD		roty,64
	P_NEXT
	P_SET		coltab,id_0_c
	P_RELTOPLAYER	OFF
	P_IGOTO		.bee_0
;------------------------------------------------------------------
	START_PATH	tomhaha

	P_RELTOPLAYER	ON
	P_INVINCIBLE	ON

	P_WAIT		30

	P_ADD		worldx,-300
	P_QSPAWN		f_dragon,e_tombo,10,10
	P_WAIT		30

	P_ADD		worldx,600
	P_QSPAWN		f_dragon,e_tombo,10,10

	P_REMOVE
	
;------------------------------------------------------------------

	START_PATH	tomset

	P_INVINCIBLE	ON
	P_ZREMOVE		ON
	P_SETANIM		8

	P_SPAWN		0,-75,-12,-4,0,0,stalk,tomset2,10,10
	P_SPAWN		0,-150,-16,-8,0,0,stalk,tomset2,10,10
	P_RANDOMGOTO	.tomleafb
	P_SPAWN		35,-40,0,0,128,0,leaf,tomset1,10,10
	P_IGOTO		.tompat_0
.tomleafb
	P_SPAWN		-35,-120,0,0,0,0,leaf,tomset1,10,10

.tompat_0
	P_RANDOMGOTO	.tompat_a
	P_RANDOMGOTO	.tompat_b
	P_SPAWN		0,-200,0,0,128,0,f_dragon,tomset3,10,10
	P_IGOTO		.tomset_z
.tompat_b
	P_SPAWN		60,-200,0,0,64,0,f_dragon,tomset3,10,10
	P_IGOTO		.tomset_z
.tompat_a
	P_RANDOMGOTO	.tompat_c
	P_SPAWN		0,-200,0,0,0,0,f_dragon,tomset3,10,10
	P_IGOTO		.tomset_z
.tompat_c
	P_SPAWN		-60,-200,0,0,192,0,f_dragon,tomset3,10,10

.tomset_z
	P_END

;------------------------------------------------------------------

	START_PATH	tomset1

	P_SETANIM		6

	P_IGOTO		ptomset2.tomset2_0
;------------------------------------------------------------------
	START_PATH	tomset2

	P_SETANIM		8

.tomset2_0	LOCAL

	P_INVINCIBLE	ON

	P_END

;------------------------------------------------------------------

	START_PATH	tomset3

	P_ALWAYSGENVECS	ON
	P_ZREMOVE		ON
	P_INVINCIBLE	ON
	P_SETANIM		1
	P_SET		hp,100
	P_SET		ap,6
	P_SET		pbyte1,0

	P_RANDOMGOTO	.set3_0
	P_RANDOMGOTO	.set3_0
	P_IGOTO		.set3_zz

.set3_0
	P_DISTLESS		3000,.set3_1
	P_GOTO		.set3_0
.set3_1
	P_TRIGGER		pe_tombo.tom_des,whenhitbyplayer
	P_TRIGGER		.tomadani,always
	P_INVINCIBLE	OFF
	P_RELTOPLAYER	ON

	P_DO		30
	P_ADD		worldy,-10
	P_NEXT

	P_SETVEL		60

	P_DO		60
	P_FACEPLAYER
	P_NEXT

	P_DO		50
	P_NEXT

	P_REMOVE
	P_END
.set3_zz
	P_WAIT		200
	P_REMOVE
	P_END

.tomadani
	P_ADDANIM		1,7
.tomup_1	LOCAL
	P_HITGROUND		0,.tomup_0
	P_RETURN
.tomup_0
	P_ADD		rotx,-10
	P_RETURN
;------------------------------------------------------------------


	START_PATH	e_tombo

	P_RELTOPLAYER	ON
	P_ZREMOVE		ON
	P_ALWAYSGENVECS	ON
	P_TRIGGER		.tom_des,whenhitbyplayer
	P_TRIGGER		ptomset3.tomup_1,always
	P_SET		pbyte1,0

	P_SET		roty,128
	P_SET		rotx,20
	P_SET		hp,100
	P_SET		ap,6

	P_SETVEL		50

.tom_0
	P_WAIT		1
	P_IFBETWEEN		-200,worldy,0,.tom_1
	P_GOTO		.tom_0

.tom_1
	P_ACCEL		0,3
.tom_12
	P_CHASE		rotx,0
	P_IFSAME		rotx,0,.tom_11
	P_GOTO		.tom_12

.tom_11
	P_RANDOMGOTO	.tom_r0

	P_ACCEL		30,1
.tom_l1
	P_CHASE		rotx,256-32
	P_CHASE		roty,128+64
	P_IFSAME		rotx,256-32,.tom_l2
	P_GOTO		.tom_l1

.tom_l2
	P_WAIT		10
	P_ACCEL		0,1
.tom_l3
	P_CHASE		rotx,0
	P_CHASE		roty,128
	P_IFSAME		rotx,0,.tom_cz
	P_GOTO		.tom_l3
;-------------------------------
.tom_r0
	P_ACCEL		30,1
.tom_r1
	P_CHASE		rotx,256-32
	P_CHASE		roty,128-64
	P_IFSAME		rotx,256-32,.tom_r2
	P_GOTO		.tom_r1

.tom_r2
	P_WAIT		10
	P_ACCEL		0,1
.tom_r3
	P_CHASE		rotx,0
	P_CHASE		roty,128
	P_IFSAME		rotx,0,.tom_cz
	P_GOTO		.tom_r3
;-------------------------------
.tom_des	LOCAL
	P_ADD		pbyte1,1
	P_IFNOTSAME		pbyte1,3,.tom_des1
	P_FORCE		.tom_de
.tom_des1
	P_RETURN
.tom_de
	P_TRIGGER		.tom_des,OFF

	P_ACCEL		100,5
	P_WAITCHASE		rotx,0

	P_WAITCHASE		roty,0

	P_WAIT		10

	P_WAITCHASE		rotx,256-32

	P_WAIT		30

	P_REMOVE
;	
;.tom_de0
;	
;	P_CHASE		rotx,64
;	P_ADD		rotz,8
;	P_ADD		worldy,40
;	P_HITGROUND		12,.tom_de1
;	P_GOTO		.tom_de0
;.tom_de1
;	P_CHASE		rotx,0
;	P_CHASE		rotz,0
;	P_IFSAME		rotz,0,.tom_de2
;	P_GOTO		.tom_de1
;.tom_de2
;	P_END
;-------------------------------
.tom_cz
	P_ACCEL		60,3
.tom_cz2
	P_FACEPLAYER
	P_WAIT		1
	P_DISTLESS		500,.tom_cz1
	P_GOTO		.tom_cz2

.tom_cz1
	P_WAIT		100

	P_REMOVE
;------------------------------------------------------------------
dummyparent
	START_PATH	e_ufo

	P_RELTOPLAYER	ON
	P_TRIGGER		.ufo_rot,always
	P_SOUND		$E
	P_SET		hp,10
	P_set		ap,8

.ufo_0
	P_ADD		worldz,35
	P_CHASE		worldy,-600
	P_WAIT		1
	P_DISTLESS		3050,.ufo_0

	P_SPAWN		0,10,0,0,0,0,bom_wing,ponpon,10,10
.ufo_1
	P_CHASE		rotz,8
	P_ADD		worldx,50
	P_LOOP		10,.ufo_1

	P_WAIT		10

	P_SPAWN		-5,10,0,0,0,0,walker_2,korori,10,10
.ufo_2
	P_CHASE		rotz,0
	P_ADD		worldx,-50
	P_LOOP		10,.ufo_2

	P_WAIT		10

	P_SPAWN		5,10,0,0,0,0,walker_2,korori,10,10
.ufo_3
	P_CHASE		rotz,-4
	P_ADD		worldx,50
	P_LOOP		10,.ufo_3

	P_WAIT		10

	P_SPAWN		0,10,0,0,0,0,bom_wing,ponpon,10,10

	P_ZREMOVE		ON
	P_RELTOPLAYER	OFF
.ufo_6
	P_ADD		roty,4
	P_CHASE		rotz,0
	P_WAIT		1
	P_LOOP		40,.ufo_6


	P_END
.ufo_rot
	P_ADD		roty,16
	P_RETURN

;------------------------------------------------------------------

	START_PATH	ponpon

	P_RELTOPLAYER	ON
	P_SHADOW		OFF
	P_TRIGGER		.pon_exp,whenhitbyplayer
	P_WEAPON		relbeamball

	P_SET		hp,6
	P_SET		ap,6
	P_SET		roty,128
	P_SET		rotz,0

.pon_0
	P_HITGROUND		30,.pon_1
	P_ADD		worldy,20
	P_GOTO		.pon_0

.pon_1
	P_DISTLESS		3000,.pon_2
	P_ADD		worldz,-15
	P_WAIT		1
	P_GOTO		.pon_1

.pon_2
	P_FACEPLAYER
	P_LOOP		15,.pon_2

	P_DISTLESS		1000,.pon_4
	P_FIRE

	P_RANDOMGOTO	.pon_2l

.pon_2r
	P_ADD		worldx,8
	P_LOOP		10,.pon_2r
	P_GOTO		.pon_3

.pon_2l
	P_ADD		worldx,-8
	P_LOOP		10,.pon_2l

.pon_3
	P_DISTLESS		1000,.pon_4
	P_FACEPLAYER
	P_LOOP		5,.pon_3

	P_RANDOMGOTO	.pon_31
	P_RANDOMGOTO	.pon_32
	P_FIRE
	P_IGOTO		.pon_32
.pon_31
	P_RANDOMGOTO	.pon_32
	P_ADD		rotx,-6
	P_FIRE
	P_ADD		rotx,6
.pon_32
	P_RELTOPLAYER	OFF

	P_RANDOMGOTO	.pon_3l
.pon_3r
	P_ADD		worldx,8
	P_LOOP		15,.pon_3r
	P_GOTO		.pon_2

.pon_3l
	P_ADD		worldx,-8
	P_LOOP		15,.pon_3l
	P_GOTO		.pon_2

.pon_4
	P_END

.pon_exp	
	P_FORCE		.pon_ex1
	P_SETRANDOM		pbyte2,31
	P_SHADOW		ON
	P_RANDOMGOTO	.pon_ex3
	P_NEG		pbyte2
.pon_ex3
	P_RETURN
.pon_ex1
	P_TRIGGER		.pon_exp,OFF
	P_SMOKE		ON
	P_SET		pbyte1,-45

.pon_ex12
	P_ADD		worldy,pbyte1
	P_ADD		worldx,pbyte2
	P_ADD		rotz,32
	P_ADD		rotx,32
	P_ADD		pbyte1,5
	P_IFNOTBETWEEN	-50,pbyte1,20,.pon_ex13
	P_GOTO		.pon_ex12

.pon_ex13
	P_EXPLODE

	P_END
;------------------------------------------------------------------
;use set pos
;ue no hou

	START_PATH	egu1

	P_WEAPON		RelSlowElaser
	P_BOOST		ON
	P_SETANIM		9
	P_RELTOPLAYER	ON
	P_ALWAYSGENVECS	ON
	P_SOUND		3
	P_SET		hp,2
	P_SET		ap,6

	P_SETVEL		70

	P_LEFTOFPLAYER	.e1_6

.e1_1
	P_ADD		worldx,-60
	P_ADD		worldy,39
	P_LOOP		20,.e1_1
.e1_2
	P_ADD		worldx,-30
	P_ADD		worldy,20
	P_LOOP		8,.e1_2

	P_WAIT		10

	P_SETVEL		30
	
.e1_3
	P_ADD		worldx,32
	P_ADD		worldy,-16
	P_LOOP		25,.e1_3

	P_SETVEL		20
	P_ZREMOVE		ON

.e1_4
	P_WAITFACEPLAYER
	P_FIRE
	P_WAIT		16
	P_LOOP		2,.e1_4

	P_IGOTO		.e1_z
;----------------------------------

.e1_6
	P_ADD		worldx,60
	P_ADD		worldy,39
	P_LOOP		20,.e1_6
.e1_7
	P_ADD		worldx,30
	P_ADD		worldy,20
	P_LOOP		8,.e1_7

	P_WAIT		10

	P_SETVEL		30
	
.e1_8
	P_ADD		worldx,-32
	P_ADD		worldy,-16
	P_LOOP		25,.e1_8

	P_SETVEL		20
	P_ZREMOVE		ON

.e1_9
	P_WAITFACEPLAYER
	P_FIRE
	P_WAIT		16
	P_LOOP		2,.e1_9
;----------------------------------
.e1_z
	P_WAITFACEPLAYER
	P_FIRE
	P_SETVEL		60
.e1_z2
	P_FACEPLAYER
	P_DISTLESS		600,.e1_z3
	P_GOTO		.e1_z2

.e1_z3
	P_END
;;----------------------------------------------------------------------
;use set pos
;x>=0,y<-1300,z>2000


	START_PATH	egu3

	P_WEAPON		RelSlowElaser
	P_RELTOPLAYER	ON
	P_ALWAYSGENVECS	ON
	P_ZREMOVE		ON
	P_SOUND		3

	P_SET		hp,2
	P_SET		ap,6

	P_ABOVEPLAYER	.e3_0

	P_GOTO		.e3_6

.e3_0
	P_WAITCHASE		rotx,48
	P_SETVEL		50

.e3_1
	P_ADD		rotz,12
	P_LOOP		20,.e3_1

     	P_WAITCHASE		rotz,0

	P_WAIT		10

	P_WAITCHASE		vel,0

	P_WAITFACEPLAYER
	P_FIRE

	P_ACCEL		50,5
.e3_2
	P_CHASE		roty,96
	P_CHASE		rotx,224
	P_LOOP		10,.e3_2

	P_WAIT		25

	P_ACCEL		0,5
.e3_22
	P_FACEPLAYER
	P_LOOP		20,.e3_22

	P_FIRE

	P_ACCEL		50,5
.e3_3
	P_CHASE		roty,180
	P_CHASE		rotx,16
	P_LOOP		10,.e3_3

	P_WAIT		10

	P_ACCEL		0,5
.e3_33
	P_FACEPLAYER
	P_LOOP		20,.e3_33

	P_FIRE

	P_WAIT		4

.e3_34
	P_FACEPLAYER
	P_LOOP		20,.e3_34

	P_FIRE

	P_ACCEL		30,4

.e3_4
	P_FACEPLAYER
	P_DISTLESS		300,.e3_5
	P_LOOP		10,.e3_4

	P_GOTO		.e3_5
;----------------------------
.e3_6
	P_WAITCHASE		rotx,208
	P_SETVEL		50

.e3_7
	P_ADD		rotz,12
	P_LOOP		20,.e3_7

     	P_WAITCHASE		rotz,0

	P_WAIT		10

	P_WAITCHASE		vel,0

	P_WAITFACEPLAYER
	P_FIRE

	P_ACCEL		50,5
.e3_8
	P_CHASE		roty,160
	P_CHASE		rotx,32
	P_LOOP		10,.e3_8

	P_WAIT		25

	P_ACCEL		0,5

.e3_88
	P_FACEPLAYER
	P_LOOP		20,.e3_88

	P_FIRE

	P_ACCEL		50,5
.e3_9
	P_CHASE		roty,76
	P_CHASE		rotx,240
	P_LOOP		10,.e3_9

	P_WAIT		10

	P_ACCEL		0,5

.e3_99
	P_FACEPLAYER
	P_LOOP		20,.e3_99

	P_FIRE

	P_WAIT		4

.e3_9a
	P_FACEPLAYER
	P_LOOP		20,.e3_9a

	P_FIRE

	P_ACCEL		30,4

.e3_a
	P_FACEPLAYER
	P_DISTLESS		300,Pegu4.e4_5
	P_LOOP		10,.e3_a
	
;----------------------------
.e3_5
	P_RELTOPLAYER	OFF

	P_WAIT		10
	
	P_END

;------------------------------------------------------------------
;use set pos
;x<-2300,z>3000

	START_PATH	egu4

	P_WEAPON		RelSlowElaser
	P_SPACESHIP		ON
	P_RELTOPLAYER	ON
	P_ALWAYSGENVECS	ON
	P_ZREMOVE		ON
	P_SOUND		3

	P_SET		hp,2
	P_SET		ap,6

	P_RIGHTOFPLAYER	.e4_r

	P_WAITCHASE		roty,192
	P_SETVEL		100

	P_WAIT		30

	P_SETVEL		50

.e4_1
	P_ADD		rotz,-2
	P_LOOP		13,.e4_1

.e4_2			 
	P_ADD		rotz,2
	P_LOOP		13,.e4_2

	P_SETVEL		70

.e4_5	LOCAL
	P_FIRE
	P_WAIT		8
	P_LOOP		2,.e4_5

	P_SETVEL		50	
.e4_3
	P_ADD		rotz,-2
	P_LOOP		15,.e4_3

	P_ALWAYSGENVECS	OFF


.e4_4
	P_ADD		rotz,2
	P_LOOP		15,.e4_4

	P_SETVEL		70

.e4_6
	P_FACEPLAYER
	P_FIRE
	P_WAIT		6
	P_LOOP		1,.e4_6

	P_ALWAYSGENVECS	ON
	P_SETVEL		60

.e4_8
	P_FACEPLAYER
	P_WAIT		2
	P_DISTLESS		600,.e4_z
	P_GOTO		.e4_8
;----------------------------------
.e4_r

	P_WAITCHASE		roty,64
	P_SETVEL		100

	P_WAIT		30

	P_SETVEL		50


.e4_9
	P_ADD		rotz,2
	P_LOOP		13,.e4_9

.e4_a 
	P_ADD		rotz,-2
	P_LOOP		13,.e4_a

	P_SETVEL		70

.e4_b
	P_FIRE
	P_WAIT		8
	P_LOOP		2,.e4_b

	P_SETVEL		50	
	
.e4_c
	P_ADD		rotz,2
	P_LOOP		15,.e4_c

	P_ALWAYSGENVECS	OFF


.e4_d
	P_ADD		rotz,-2
	P_LOOP		15,.e4_d

	P_SETVEL		70

.e4_e
	P_FACEPLAYER
	P_FIRE
	P_WAIT		6
	P_LOOP		1,.e4_e

	P_ALWAYSGENVECS	ON
	P_SETVEL		60

.e4_g
	P_FACEPLAYER
	P_WAIT		2
	P_DISTLESS		600,.e4_z
	P_GOTO		.e4_g
;----------------------------------
.e4_z
	P_WAIT		20
	P_END

;-------------------------------------------------------------------

	START_PATH	egu5

	P_WEAPON		ringlaser
	P_RELTOPLAYER	ON
	P_ALWAYSGENVECS	ON
	P_ZREMOVE		ON
	P_SETANIM		3
	P_SOUND		3

	P_SET		hp,2
	P_SET		ap,6

	P_ABOVEPLAYER	.e5_7

	P_SET		roty,128
	P_SET		rotx,256-64

	P_SETVEL		60

.e5_0
	P_WAIT		1

	P_ABOVEPLAYER	.e5_01

	P_GOTO		.e5_0
.e5_01
	P_ACCEL		40,1
.e5_1
	P_ADD		rotx,-8
	P_LOOP		23,.e5_1

	P_ACCEL		60,1
.e5_2
	P_ADD		rotz,4
	P_FACEPLAYER
	P_LOOP		10,.e5_2

	P_DISTLESS		1300,.e5_z

	P_FIRE

.e5_3
	P_ADD		rotz,4
	P_FACEPLAYER
	P_LOOP		15,.e5_3

	P_DISTLESS		1300,.e5_z

	P_FIRE
.e5_4
	P_ADD		rotz,4
	P_FACEPLAYER
	P_LOOP		15,.e5_4

	P_DISTLESS		1300,.e5_z

	P_FIRE

.e5_5
	P_ADD		rotz,4
	P_FACEPLAYER
	P_LOOP		15,.e5_5

	P_DISTLESS		1300,.e5_z
	P_FIRE
.e5_6
	P_DISTLESS		1300,.e5_z
	P_ADD		rotz,4
	P_FACEPLAYER
	P_GOTO		.e5_6

;---------------------------------
.e5_7
	P_SET		roty,128
	P_SET		rotx,64

	P_SETVEL		60

.e5_8
	P_WAIT		1

	P_ABOVEPLAYER	.e5_8

	P_ACCEL		40,1
.e5_9
	P_ADD		rotx,8
	P_LOOP		23,.e5_9

	P_ACCEL		60,1

	P_GOTO		.e5_2
.e5_z
	P_ADD		rotz,4
	P_LOOP		60,.e5_z

	P_END
;-------------------------------------------------------------------

	START_PATH	egu6

	P_WEAPON		RelSlowElaser
	P_RELTOPLAYER	ON
	P_ALWAYSGENVECS	ON
	P_ZREMOVE		ON
	P_SETANIM		3
	P_SOUND		3

	P_SET		hp,2
	P_SET		ap,6

	P_ABOVEPLAYER	.e6_a

	P_RIGHTOFPLAYER	.e6_br
	P_GOTO		.e6_bl
.e6_a
	P_RIGHTOFPLAYER	.e6_ar

;e6_al
	P_SET		roty,256-64
	P_SET		rotx,32

	P_SETVEL		60

.e6_al_1
	P_WAIT		1
	P_ABOVEPLAYER	.e6_al_1

	P_ACCEL		30,1

.e6_al_2
	P_CHASE		rotx,0
	P_CHASE		rotz,32
	P_CHASE		roty,256-32
	P_IFSAME		roty,256-32,.e6_al_3
	P_GOTO		.e6_al_2

.e6_al_3
	P_CHASE		rotx,256-64
	P_CHASE		rotz,0
	P_IFSAME		rotx,256-64,.e6_al_4
	P_GOTO		.e6_al_3

.e6_al_4
	P_ADD		roty,4
	P_CHASE		rotx,0
	P_IFSAME		roty,128,.e6_0
	P_GOTO		.e6_al_4

.e6_0
	P_ACCEL		40,1

	P_DO		4
	P_DO		11
	P_FACEPLAYER
	P_NEXT
	P_FIRE
	P_NEXT
.e6_4
	P_FACEPLAYER
	P_WAIT		3
	P_LOOP		10,.e6_4

	P_GOTO		.e6_z

;---------------------------------
.e6_ar

	P_SET		roty,64
	P_SET		rotx,32

	P_SETVEL		60

.e6_ar_1
	P_WAIT		1
	P_ABOVEPLAYER	.e6_ar_1

	P_ACCEL		30,1

.e6_ar_2
	P_CHASE		rotx,0
	P_CHASE		rotz,256-32
	P_CHASE		roty,32
	P_IFSAME		roty,32,.e6_ar_3
	P_GOTO		.e6_ar_2

.e6_ar_3
	P_CHASE		rotx,256-64
	P_CHASE		rotz,0
	P_IFSAME		rotx,256-64,.e6_ar_4
	P_GOTO		.e6_ar_3

.e6_ar_4
	P_ADD		roty,-4
	P_CHASE		rotx,0
	P_IFSAME		roty,128,.e6_0
	P_GOTO		.e6_ar_4

;---------------------------------
.e6_bl
	P_SET		roty,256-64
	P_SET		rotx,256-32

	P_SETVEL		60

.e6_bl_1
	P_WAIT		1
	P_ABOVEPLAYER	.e6_bl_11
	P_GOTO		.e6_bl_1

.e6_bl_11
	P_ACCEL		30,1

.e6_bl_2
	P_CHASE		rotx,0
	P_CHASE		rotz,32
	P_CHASE		roty,256-32
	P_IFSAME		roty,256-32,.e6_bl_3
	P_GOTO		.e6_bl_2

.e6_bl_3
	P_CHASE		rotx,40
	P_CHASE		rotz,0
	P_IFSAME		rotx,40,.e6_bl_4
	P_GOTO		.e6_bl_3

.e6_bl_4
	P_ADD		roty,4
	P_CHASE		rotx,0
	P_IFSAME		roty,128,.e6_0
	P_GOTO		.e6_bl_4

;---------------------------------
.e6_br
	P_SET		roty,64
	P_SET		rotx,256-32

	P_SETVEL		60

.e6_br_1
	P_WAIT		1
	P_ABOVEPLAYER	.e6_br_11
	P_GOTO		.e6_br_1

.e6_br_11
	P_ACCEL		30,1

.e6_br_2
	P_CHASE		rotx,0
	P_CHASE		rotz,256-32
	P_CHASE		roty,32
	P_IFSAME		roty,32,.e6_br_3
	P_GOTO		.e6_br_2

.e6_br_3
	P_CHASE		rotx,40
	P_CHASE		rotz,0
	P_IFSAME		rotx,40,.e6_br_4
	P_GOTO		.e6_br_3

.e6_br_4
	P_ADD		roty,-4
	P_CHASE		rotx,0
	P_IFSAME		roty,128,.e6_0
	P_GOTO		.e6_br_4

;---------------------------------
.e6_z
	P_WAIT		30

	P_REMOVE

	P_END
;-------------------------------------------------------------------

	START_PATH	minicas0

	P_ZREMOVE		ON
	P_SET		hp,2
	P_SET		ap,10

	P_SPAWN		200,40,150,0,0,0,boss_e_4,minicas1,2,10
	P_SPAWN		-120,170,200,0,0,0,boss_e_4,minicas1,2,10
	P_SPAWN		-80,-190,250,0,0,0,boss_e_4,minicas1,2,10

.mini0_0
	P_ADD		rotz,16
	P_LOOP		400,.mini0_0

	P_END
;-------------------------------------------------------------------

	START_PATH	minicas1

	P_ZREMOVE		ON

.mini1_0
	P_ADD		rotz,16
	P_LOOP		400,.mini1_0

	P_END

;-------------------------------------------------------------------
;use set pos
;y=about 2000,z=about 2600

	START_PATH	minicas2

	P_RELTOPLAYER	ON
	P_ALWAYSGENVECS	ON
	P_ZREMOVE		ON

	P_SET		hp,2

	P_SET		rotx,256-64

	P_SETVEL		40

.mini2_0
	P_WAIT		1
	P_ABOVEPLAYER	.mini2_1
	P_GOTO		.mini2_0

.mini2_1
	P_ACCEL		0,3

.mini2_2
	P_WAIT		1
	P_IFSAME		vel,0,.mini2_21
	P_GOTO		.mini2_2

.mini2_21
	P_RELTOPLAYER	OFF
	
.mini2_3
	P_ADD		worldz,30
	P_CHASE		vel,-50
	P_CHASE		rotx,0
	P_LOOP		30,.mini2_3

.mini2_4
	P_QSPAWN		mine_0,minimine1,2,8
	P_QSPAWN		mine_0,minimine2,2,8
	P_QSPAWN		mine_0,minimine3,2,8
	P_QSPAWN		mine_0,minimine4,2,8
	P_QSPAWN		mine_0,minimine5,2,8
	P_QSPAWN		mine_0,minimine6,2,8
	P_QSPAWN		mine_0,minimine7,2,8

	P_EXPLODE

	P_END

;-------------------------------------------------------------------

	START_PATH	minimine1

	P_ZREMOVE		ON

.ne1
	P_ADD		rotz,16
	P_ADD		worldz,5
	P_LOOP		100,.ne1

	P_END

;-------------------------------------------------------------------

	START_PATH	minimine2

	P_ZREMOVE		ON

	P_SET		pbyte1,15
	P_SET		pbyte2,0

	P_IGOTO		pminimine7.mini_su16

;-------------------------------------------------------------------

	START_PATH	minimine3

	P_ZREMOVE		ON

	P_SET		pbyte1,-15
	P_SET		pbyte2,0

	P_IGOTO		pminimine7.mini_su16

;-------------------------------------------------------------------

	START_PATH	minimine4

	P_ZREMOVE		ON

	P_SET		pbyte1,8
	P_SET		pbyte2,8

	P_IGOTO		pminimine7.mini_ad16

;-------------------------------------------------------------------

	START_PATH	minimine5

	P_ZREMOVE		ON

	P_SET		pbyte1,8
	P_SET		pbyte2,-8

	P_IGOTO		pminimine7.mini_ad16

;-------------------------------------------------------------------

	START_PATH	minimine6

	P_ZREMOVE		ON

	P_SET		pbyte1,-8
	P_SET		pbyte2,8

	P_IGOTO		pminimine7.mini_su16

;-------------------------------------------------------------------

	START_PATH	minimine7

	P_ZREMOVE		ON

	P_SET		pbyte1,-8
	P_SET		pbyte2,-8

.mini_ad16	LOCAL
	P_ADD		worldx,pbyte1
	P_ADD		worldy,pbyte2
	P_ADD		rotz,16
	P_LOOP		100,.mini_ad16

	P_END

.mini_su16	LOCAL
	P_ADD		worldx,pbyte1
	P_ADD		worldy,pbyte2
	P_ADD		rotz,-16
	P_LOOP		100,.mini_su16
	
	P_END

	
;-------------------------------------------------------------------
;use set pos
;z=more than 4000

	START_PATH	e_heli

	P_WEAPON		RelSlowElaser
	P_ALWAYSGENVECS	ON
	P_HELICOPTER		ON
	P_ZREMOVE		ON
	P_SOUND		7
	P_TRIGGER		.heli_exp,whenhitbyplayer
	P_SET		pbyte1,0

	P_SET		hp,8

	P_SET		roty,128

.e_h_0
	P_DISTLESS		4000,.e_h_1
	P_GOTO		.e_h_0

.e_h_1
	P_ADD		worldy,-7
	P_IFBETWEEN		-400,worldy,-300,.e_h_2
	P_GOTO		.e_h_1

.e_h_2
	P_ADD		worldy,-4
	P_LOOP		5,.e_h_2

	P_RELTOPLAYER	ON

.e_h_3
	P_DO		2
	P_LEFTOFPLAYER	.e_h_l0
;----------------------------------------------------

	P_DO		20
	P_CHASE		roty,64
	P_NEXT

	P_RANDOMGOTO	.e_h_r3

	P_DO		30
	P_CHASE		rotx,32
	P_ADD		worldy,-3
	P_NEXT

.e_h_r2
	P_DO		10
	P_FACEPLAYER
	P_NEXT

	P_DISTLESS		500,.e_h_z3
	P_FIRE

	P_GOTO		.e_h_lp
;--------
.e_h_r3
	P_DO		20
	P_CHASE		rotx,32
	P_ADD		worldy,3
	P_HITGROUND		0,.e_h_z2
	P_NEXT

	P_GOTO		.e_h_r2
;----------------------------------------------------

.e_h_l0
	P_DO		20
	P_CHASE		roty,192
	P_NEXT

	P_RANDOMGOTO	.e_h_l3

	P_DO		30
	P_CHASE		rotx,32
	P_ADD		worldy,-3
	P_NEXT

.e_h_l2
	P_DO		10
	P_FACEPLAYER
	P_NEXT

	P_DISTLESS		500,.e_h_z3
	P_FIRE

	P_GOTO		.e_h_lp
;--------
.e_h_l3
	P_DO		20
	P_CHASE		rotx,32
	P_ADD		worldy,3
	P_HITGROUND		0,.e_h_z2
	P_NEXT

	P_GOTO		.e_h_l2
;-----------------------------------------------------
.e_h_lp
	P_NEXT

.e_h_z3
	P_DO		5
	P_FACEPLAYER
	P_NEXT

	P_ABOVEPLAYER	.e_h_z5

	P_DO		30
	P_CHASE		rotx,32
	P_ADD		worldy,-5
	P_NEXT

	P_GOTO		.e_h_z6
.e_h_z5
	P_DO		30
	P_CHASE		rotx,32
	P_ADD		worldy,5
	P_HITGROUND		0,.e_h_z2
	P_NEXT
.e_h_z6
	P_RELTOPLAYER	OFF

	P_END

.e_h_z
	P_TRIGGER		.heli_exp,OFF
	P_SMOKE		ON

.e_h_z1
	P_ADD		roty,10
	P_ADD		rotz,10
	P_ADD		worldy,10
	P_HITGROUND		0,.e_h_y
	P_GOTO		.e_h_z1

.e_h_y
	P_EXPLODE

.e_h_z2
	P_HELICOPTER		OFF
	P_ALWAYSGENVECS	OFF
	P_SMOKE		ON

	P_DO		4
	P_ADD		rotx,10
	P_ADD		worldy,-10
	P_NEXT

	P_WAIT		1

	P_DO		4
	P_ADD		rotx,10
	P_ADD		worldy,-8
	P_NEXT

	P_WAIT		1

	P_DO		6
	P_ADD		rotx,10
	P_ADD		worldy,-5
	P_NEXT

	P_WAIT		1


	P_EXPLODE

.heli_exp
	P_ADD		pbyte1,1
	P_IFSAME		pbyte1,2,.heli_jump
	P_RETURN
.heli_jump
	P_FORCE		.e_h_z
	P_RETURN
;-------------------------------------------------------------------
;note
;put at the same time as rock but pos z = rock's z + 550
;and next rock needs 1100 waiting time

	START_PATH	e_walk_1

	P_FINDSHAPE		gro_5
	P_IMMUNE
	P_SOUND		$D
	P_TRIGGER		.e_wa_dead,whendead

	P_SET		ap,20
	P_SET		hp,2

.e_wa_0
	P_DISTLESS		2400,.e_wa_1
	P_WAIT		1
	P_GOTO		.e_wa_0

.e_wa_1
	P_LEFTOFPLAYER	.e_wa_l

	P_SET		roty,64
	P_GOTO		.e_wa_2

.e_wa_l
	P_SET		roty,192

.e_wa_2
	P_SETVEL		15

	P_WAITCHASE		roty,128

	P_SETVEL		0

	P_SETANIM		1

	P_END
.e_wa_dead
	P_ADD		worldy,-160
	P_QSPAWN		nullshape,damy_exp2,10,10
	P_ADD		worldy,160
	P_RETURN
;-------------------------------------------------------------------

	START_PATH	e_tank

	P_ZREMOVE		OFF
	P_SHADOW		OFF
	P_ALWAYSGENVECS	ON
	P_SOUND		4

	P_SET		hp,4
	P_SET		ap,8

.etan_0
	P_DISTLESS		2000,.etan_1
	P_GOTO		.etan_0
.etan_1
	P_RELTOPLAYER	ON
	P_FLAGCHILD		1
	P_SETVEL		5

	P_DO		16
	P_ADD		roty,2
	P_NEXT

	P_DO		16
	P_ADD		roty,-2
	P_NEXT
	P_QSPAWN		s_tank_0,e_tank_s,100,0
	P_DO		16
	P_ADD		roty,-2
	P_NEXT

	P_DO		16
	P_ADD		roty,2
	P_NEXT
	P_QSPAWN		s_tank_0,e_tank_s,100,0
	P_DO		16
	P_ADD		roty,2
	P_NEXT

	P_DO		16
	P_ADD		roty,-2
	P_NEXT
	P_QSPAWN		s_tank_0,e_tank_s,100,0
	P_DO		16
	P_ADD		roty,-2
	P_NEXT

	P_RELTOPLAYER	OFF
	P_SETVEL		0
	P_WAITCHASE		roty,8

	P_WAIT		50

	P_REMOVE

	P_END
;-------------------------------------------------------------------

	START_PATH	e_tank_s

	P_RELTOPLAYER	ON
	P_ALWAYSGENVECS	ON
	P_INVISIBLE		ON
	P_SHADOW		OFF
	P_WEAPON		relovalbeam

	P_ADD		worldy,-20
	P_SET		roty,128
	P_SET		rotx,256-6

.etan_s
	P_GOSUB		facefire

	P_REMOVE
;-------------------------------------------------------------------


	START_PATH	e_kururi

	P_INVINCIBLE	ON
	P_ZREMOVE		ON

	P_SET		roty,128

.e_ku_0
	P_DISTLESS		1300,.e_ku_1
	P_WAIT		1
	P_GOTO		.e_ku_0

.e_ku_1
	P_ADD		rotx,5
	P_WAIT		1
	P_ADD		rotx,-10
	P_WAIT		1
	P_ADD		rotx,5
	P_LOOP		2,.e_ku_1

.e_ku_2
	P_ADD		rotx,16
	P_WAIT		1
	P_LOOP		3,.e_ku_2

.e_ku_3
	P_QSPAWN		r_but_2,e_kururi2,10,10
	P_REMOVE

;-------------------------------------------------------------------

	START_PATH	e_kururi2

	P_RELTOPLAYER	OFF
	P_INVINCIBLE	ON
	P_ZREMOVE		ON

.kuru2_0
	P_WAIT		1
	P_GOTO		.kuru2_0

;-------------------------------------------------------------------
;use set pos 
; z>= 1500, y=anywhere but above ground
;use shape "r_bu_1"

	START_PATH	e_dosun

	P_INVINCIBLE	ON
	P_SET		roty,128

.e_do_0
	P_DISTLESS		1300,.e_do_1
	P_GOTO		.e_do_0

.e_do_1
	P_ADD		worldx,-10
	P_WAIT		2
	P_ADD		worldx,20
	P_WAIT		2
	P_ADD		worldx,-10
	P_LOOP		2,.e_do_1

.e_do_2
	P_IFBETWEEN		-41,worldy,0,.e_do_3
	P_ADD		worldy,40
	P_GOTO		.e_do_2

.e_do_3
	P_SOUNDEFFECT	$49
	P_SET		worldy,-50

	P_END

;-------------------------------------------------------------------

	START_PATH	itadosun

	P_INVINCIBLE	ON
	P_SET		roty,128

.i_do_0
	P_DISTLESS		1100,.i_do_1
	P_GOTO		.i_do_0

.i_do_1
	P_ADD		worldx,-10
	P_WAIT		2
	P_ADD		worldx,20
	P_WAIT		2
	P_ADD		worldx,-10
	P_LOOP		2,.i_do_1

.i_do_2
	P_IFBETWEEN		-41,worldy,0,.i_do_3
	P_ADD		worldy,40
	P_GOTO		.i_do_2

.i_do_3
	P_SOUNDEFFECT	$49
	P_SET		worldy,-10

	P_END
;-------------------------------------------------------------------

	START_PATH	e_shieldr

	P_WEAPON		RelSlowElaser
	P_RELTOPLAYER	ON
	P_ALWAYSGENVECS	ON
	P_INVINCIBLE	ON
	P_ZREMOVE		ON
	P_TRIGGER		.e_sh_disck,always
	P_TRIGGER		.e_sh_ref,whenhitbyplayer

	P_SET		hp,2

	P_SETVEL		-60

	P_WAIT		30

.e_sh_0
	P_SETVEL		0

	P_WAITCHASE		roty,128

	P_INVINCIBLE	OFF
	P_TRIGGER		.e_sh_ref,OFF

	P_WAIT		5

	P_DO		10
	P_FACEPLAYER
	P_NEXT

	P_FIRE

	P_WAIT		5

	P_INVINCIBLE	ON
	P_TRIGGER		.e_sh_ref,whenhitbyplayer

.e_sh_01
	P_CHASE		roty,0
	P_CHASE		rotx,0
	P_WAIT		1
	P_IFNOTSAME	roty,0,.e_sh_01
	P_IFNOTSAME	rotx,0,.e_sh_01

	P_SETVEL		-40

	P_RANDOMGOTO	.e_sh_r
	P_SET		pbyte1,-3
	P_RANDOMGOTO	.e_sh_ld
	P_SET		pbyte2,-3
	P_IGOTO		.e_sh_mv
.e_sh_ld
	P_SET		pbyte2,3
	P_IGOTO		.e_sh_mv
.e_sh_r
	P_SET		pbyte1,3
	P_RANDOMGOTO	.e_sh_rd
	P_SET		pbyte2,-3
	P_IGOTO		.e_sh_mv
.e_sh_rd
	P_SET		pbyte2,3

.e_sh_mv
	P_DO		32
	P_ADD		worldx,pbyte1
	P_ADD		worldy,pbyte2
	P_IFSAME	pbyte1,3,.e_sh_mvr
	P_ADD		rotz,-2
	P_IGOTO		.e_sh_mvn
.e_sh_mvr
	P_ADD		rotz,2
.e_sh_mvn
	P_NEXT

	P_IGOTO		.e_sh_0
;----------------------------
.e_sh_z
	P_SETVEL		0
	P_TRIGGER		.e_sh_disck,OFF
	P_DO		10
	P_FACEPLAYER
	P_NEXT
	P_INVINCIBLE	OFF
	P_TRIGGER		.e_sh_ref,OFF
	P_WAITFACEPLAYER

	P_WAIT		6

	P_FIRE

	P_INVINCIBLE	ON
	P_TRIGGER		.e_sh_ref,whenhitbyplayer

.e_sh_z1
	P_ADD		rotx,16
	P_LOOP		7,.e_sh_z1

.e_sh_z2
	P_CHASE		vel,-40
	P_ADD		rotz,4
	P_LOOP		100,.e_sh_z2

	P_END
.e_sh_disck
	P_DISTLESS	700,.e_sh_disck1
	P_RETURN
.e_sh_disck1
	P_FORCE		.e_sh_z
	P_RETURN

.e_sh_ref
	P_PUSH		pbyte1
	P_PUSH		pbyte2

	P_WEAPON	rebelaser
	P_SETRANDOM	pbyte1,31
	P_SETRANDOM	pbyte2,31
	P_RANDOMGOTO	.e_sh_neg2
	P_NEG		pbyte1
.e_sh_neg2
	P_RANDOMGOTO	.e_sh_shot
	P_NEG		pbyte2
.e_sh_shot
	P_ADD		rotx,pbyte1
	P_ADD		roty,pbyte2
	P_ADD		roty,128
	P_FIRE
	P_ADD		roty,128
	P_NEG		pbyte1
	P_NEG		pbyte2
	P_ADD		rotx,pbyte1
	P_ADD		roty,pbyte2
	P_WEAPON	RelSlowElaser
	P_PULL		pbyte2
	P_PULL		pbyte1
	P_RETURN

;-------------------------------------------------------------------
;use set pos 
;x and y = anywhere , z=3000

	START_PATH	e_ray_0

	P_RELTOPLAYER	ON
	P_ALWAYSGENVECS	ON
	P_TRIGGER		.turn_b,whenhitbyplayer

	P_SET		hp,20
	P_SET		ap,8
	P_SET		roty,128

	P_SETVEL		30

	P_RANDOMGOTO	.smray_8

.smray_0
	P_CHASE		rotz,256-32
	P_CHASE		roty,128-32
	P_IFSAME		roty,128-32,.smray_1
	P_GOTO		.smray_0
.smray_1
	P_CHASE		rotz,0
	P_CHASE		roty,128
	P_IFSAME		roty,128,.smray_2
	P_GOTO		.smray_1
.smray_2
	P_WAIT		12
.smray_3
	P_CHASE		rotz,32
	P_CHASE		roty,128+32
	P_IFSAME		roty,128+32,.smray_4
	P_GOTO		.smray_3
.smray_4
	P_CHASE		rotz,0
	P_CHASE		roty,128
	P_IFSAME		roty,128,.smray_5
	P_GOTO		.smray_4
.smray_5
	P_WAIT		12
.smray_6
	P_CHASE		rotz,256-32
	P_CHASE		roty,128-16
	P_IFSAME		roty,128-16,.smray_7
	P_GOTO		.smray_6
;----------------------------------
.smray_8
	P_CHASE		rotz,32
	P_CHASE		roty,128+32
	P_IFSAME		roty,128+32,.smray_9
	P_GOTO		.smray_8
.smray_9
	P_CHASE		rotz,0
	P_CHASE		roty,128
	P_IFSAME		roty,128,.smray_a
	P_GOTO		.smray_9
.smray_a
	P_WAIT		12
.smray_b
	P_CHASE		rotz,0
	P_CHASE		roty,128-32
	P_IFSAME		roty,128-32,.smray_c
	P_GOTO		.smray_b
.smray_c
	P_CHASE		rotz,0
	P_CHASE		roty,128
	P_IFSAME		roty,128,.smray_d
	P_GOTO		.smray_c
.smray_d
	P_WAIT		12
.smray_e
	P_CHASE		rotz,32
	P_CHASE		roty,128+16
	P_IFSAME		roty,128+16,.smray_7
	P_GOTO		.smray_e
;----------------------------------
.smray_7
	P_TRIGGER		.turn_b,OFF
	P_SET		roty,128
	P_LEFTOFPLAYER	.smray_l

	P_DO		15
	P_CHASE		rotz,32
	P_ADD		roty,8
	P_NEXT

	P_ZREMOVE		ON
	P_WAITCHASE		rotz,0

	P_DO		50
	P_FACEPLAYER
	P_NEXT

	P_WAITCHASE		roty,128

	P_WAIT		20

	P_REMOVE
	P_END
.smray_l
	P_DO		15
	P_CHASE		rotz,224
	P_ADD		roty,-8
	P_NEXT

	P_ZREMOVE		ON
	P_WAITCHASE		rotz,0

	P_DO		50
	P_FACEPLAYER
	P_NEXT

	P_WAITCHASE		roty,128

	P_WAIT		20

	P_REMOVE
	P_END
;---------------------------------
.turn_b
	P_FORCE		.smray_run
	P_IMPORT		pbyte1,ebyte1
	P_ADD		pbyte1,1
	P_EXPORT		ebyte1,pbyte1
	P_SET		coltab,id_1_c
	P_SOUNDEFFECT	$93
	P_RETURN
.smray_run
	P_TRIGGER		.turn_b,OFF
	P_INVINCIBLE	ON
	P_SETVEL		50
;	P_QSPAWN		amoeba2,e_ameoba,10,10

	P_LEFTOFPLAYER	.smray_run_l

.smray_run_r
	P_CHASE		roty,192
	P_CHASE		rotz,32
	P_IFSAME		roty,192,.smray_run_r1
	P_GOTO		.smray_run_r
.smray_run_r1
	P_ACCEL		30,2
	P_WAITCHASE		rotz,0
.smray_run_r2
	P_IFBETWEEN		-1500,worldx,1500,.smray_end
	P_GOTO		.smray_run_r2
.smray_end
	P_REMOVE
	P_END
.smray_run_l
	P_CHASE		roty,64
	P_CHASE		rotz,224
	P_IFSAME		roty,64,.smray_run_r1
	P_GOTO		.smray_run_l

;----------------------------------------------------------------------
;
;	START_PATH		e_ameoba
;
;	P_SETSTRAT		amoeba_istrat
;
;	P_END
;
;----------------------------------------------------------------------

	START_PATH	e_whale

	P_INVISIBLE		ON
	P_INVINCIBLE	ON
	P_RELTOPLAYER	ON
	P_ZREMOVE		OFF

	P_SET		ap,1

	P_SET		pbyte1,0
	P_EXPORT		ebyte1,pbyte1

.weal_1
	P_IMPORT		pbyte1,ebyte1
	P_IFSAME		pbyte1,10,.weal_2
	P_IFSAME		pbyte1,100,.weal_rem
	P_GOTO		.weal_1
.weal_rem
	P_REMOVE
.weal_2
	P_WAIT		100
	P_INVISIBLE		OFF
	P_ALWAYSGENVECS	ON

	P_SETVEL		20
	P_SOUNDEFFECT	$92
	P_SET		pbyte2,0

	P_WAIT		50
	P_ZREMOVE		ON
	P_DO		50
	P_CHASE		worldx,100
	P_CHASE		worldy,-100
	P_NEXT

	P_QSPAWN		gate_0,e_sup_1,10,10
	P_WAIT		8
	P_QSPAWN		item_5,e_sup_2,10,10
	P_WAIT		8
	P_QSPAWN		item_5,e_sup_2,10,10
	P_WAIT		8
	P_QSPAWN		item_6,e_sup_3,10,10
	P_WAIT		8
	P_QSPAWN		item_7,e_sup_4,10,10
	P_WAIT		8
	P_QSPAWN		item_5,e_sup_2,10,10
	P_WAIT		8
	P_QSPAWN		item_5,e_sup_2,10,10
	P_WAIT		8
	P_QSPAWN		gate_0,e_sup_1,10,10
	P_WAIT		8

	P_DO		32
	P_ADD		roty,2
	P_IFSAME		pbyte2,0,.weal_a
	P_ADD		rotx,2
	P_SET		pbyte2,0
	P_IGOTO		.weal_b
.weal_a
	P_SET		pbyte2,1
.weal_b
	P_NEXT

	P_SET		pbyte2,0

	P_DO		32
	P_ADD		roty,2
	P_IFSAME		pbyte2,0,.weal_c
	P_ADD		rotx,-2
	P_SET		pbyte2,0
	P_IGOTO		.weal_d
.weal_c
	P_SET		pbyte2,1
.weal_d
	P_NEXT

	P_ACCEL		80,2

	P_WAIT		40

	P_END
;-------------------------------------------------------------------

	START_PATH	rem_whale

	P_INVISIBLE		ON

	P_SET		pbyte1,100
	P_EXPORT		ebyte1,pbyte1

	P_REMOVE
	P_END

;-------------------------------------------------------------------
	START_PATH	e_sup_1

	P_SETSTRAT		gate3_istrat

	P_END

;-------------------------------------------------------------------
	START_PATH	e_sup_2

	P_SETSTRAT		item5_istrat

	P_END

;-------------------------------------------------------------------
	START_PATH	e_sup_3

	P_SETSTRAT		item6_istrat

	P_END

;-------------------------------------------------------------------
	START_PATH	e_sup_4

	P_SETSTRAT		item7_istrat

	P_END


;*******************************************************************

eguchi1

;*******************************************************************
;-------------------------------------------------------------------
;use set pos
;x=anywhere , y>=250 or y<=-250 , z<=0

	START_PATH	e_ray_1

	P_RELTOPLAYER	ON
	P_ALWAYSGENVECS	ON

	P_SET		pbyte1,0
	P_TRIGGER		.ray_1_hit,whenhitbyplayer

	P_SETVEL		8
	P_SET		hp,20
	P_SET		ap,10

	P_WAIT		50

	P_LEFTOFPLAYER	.e_rb_l

	P_ABOVEPLAYER	.e_rb_ra

	P_GOTO		.e_rb_rb
.e_rb_l
	P_ABOVEPLAYER	.e_rb_la

;left,below-------------------
.e_rb_lb
	P_ADD		rotx,-2
	P_ADD		rotz,-1
	P_ADD		roty,-1
	P_IFSAME		rotx,256-64,.e_rb_lb1
	P_GOTO		.e_rb_lb

.e_rb_lb1
	P_WAIT		4
.e_rb_lb2
	P_ADD		roty,-3
	P_ADD		rotz,1
	P_ADD		rotx,2
	P_IFSAME		rotx,0,.e_rb_z
	P_GOTO		.e_rb_lb2
;left,above-------------------
.e_rb_la
	P_ADD		rotx,2
	P_ADD		roty,-1
	P_ADD		rotz,-1
	P_IFSAME		rotx,64,.e_rb_la1
	P_GOTO		.e_rb_la
.e_rb_la1
	P_WAIT		4
.e_rb_la2
	P_ADD		roty,-3
	P_ADD		rotz,1
	P_ADD		rotx,-2
	P_IFSAME		rotx,0,.e_rb_z
	P_GOTO		.e_rb_la2
;right,below------------------
.e_rb_rb
	P_ADD		rotx,-2
	P_ADD		rotz,1
	P_ADD		roty,1
	P_IFSAME		rotx,256-64,.e_rb_rb1
	P_GOTO		.e_rb_rb

.e_rb_rb1
	P_WAIT		4
.e_rb_rb2
	P_ADD		roty,3
	P_ADD		rotz,-1
	P_ADD		rotx,2
	P_IFSAME		rotx,0,.e_rb_z
	P_GOTO		.e_rb_rb2
;right,above------------------
.e_rb_ra
	P_ADD		rotx,2
	P_ADD		roty,1
	P_ADD		rotz,1
	P_IFSAME		rotx,64,.e_rb_ra1
	P_GOTO		.e_rb_ra
.e_rb_ra1
	P_WAIT		4
.e_rb_ra2
	P_ADD		roty,3
	P_ADD		rotz,-1
	P_ADD		rotx,-2
	P_IFSAME		rotx,0,.e_rb_z
	P_GOTO		.e_rb_ra2
;------------------------------
.e_rb_z
	P_ACCEL		40,1
	P_WAIT		40

	P_REMOVE

	P_END
;------------------------------
.e_rr_1
	P_SET		coltab,id_1_c
	P_INVINCIBLE	ON

	P_SET		ap,16
	P_ACCEL		30,2
.e_rc_0
	P_CHASE		rotz,0
	P_FACEPLAYER
	P_DISTLESS		20,.e_rc_1
	P_GOTO		.e_rc_0

.e_rc_1
	P_WAITCHASE		roty,128

	P_WAIT		40

	P_REMOVE
.ray_1_hit
	P_ADD		pbyte1,1
	P_IFNOTSAME		pbyte1,5,.ray_1_norm
	P_FORCE		.e_rr_1
.ray_1_norm
	P_RETURN
;-------------------------------------------------------------------
;use set pos
;x=about -1800 or 1800 +- 300, y= about 1000 +- 100 ,z= about 3000 +- 200 

;anim = 0 to 22

	START_PATH	e_ika

	P_ALWAYSGENVECS	ON
	P_RELTOPLAYER	ON
	P_SET		hp,100
	P_SET		ap,8
	P_SET		rotz,0
	P_SET		pbyte1,0
	P_TRIGGER		.ika_hit,whenhitbyplayer

	P_LEFTOFPLAYER	.e_ik_l

	P_SET		roty,64
	P_SET		rotx,256-32

	P_GOTO		.e_ik_s

.e_ik_l
	P_SET		roty,256-64
	P_SET		rotx,256-32

.e_ik_s

	P_SETANIM		0
	P_ACCEL		20,1

.e_ik_00
	P_ADD		rotz,4
	P_ADD		worldz,-10
	P_ADDANIM		1,21
	P_LOOP		20,.e_ik_00

	P_SETANIM		0

.e_ik_02
	P_ADD		rotz,4
	P_ADD		worldz,-10
	P_ADDANIM		1,21
	P_LOOP		20,.e_ik_02

	P_SETANIM		0

.e_ik_04
	P_ADD		rotz,4
	P_ADD		worldz,-10
	P_ADDANIM		1,21
	P_LOOP		20,.e_ik_04

	P_ACCEL		0,1

.e_ik_05
	P_ADD		rotz,4
	P_ADD		worldz,-10
	P_ADD		worldy,10
	P_LOOP		35,.e_ik_05

	P_SETANIM		0
	P_ACCEL		20,1

.e_ik_06
	P_ADD		rotz,4
	P_ADD		worldz,-10
	P_ADDANIM		1,21
	P_LOOP		20,.e_ik_06

	P_ACCEL		0,1

.e_ik_07
	P_ADD		rotz,4
	P_ADD		worldz,-10
	P_ADD		worldy,5
	P_LOOP		30,.e_ik_07

.e_ik_77
	P_IFBETWEEN		-200,worldz,0,.e_ik_z

	P_GOTO		.e_ik_s
;---------------------------------

.e_ik_d
	P_INVINCIBLE	ON
	P_SET		coltab,id_3_c
	P_SET		ap,2
	P_ACCEL		0,1
	P_SETANIM		0
	P_SOUNDEFFECT	$94
	P_SMOKE		ON
.e_ik_d0
	P_ADDANIM		5,21
	P_CHASE		vel,30
	P_CHASE		rotx,64
	P_IFSAME		rotx,64,.e_ik_d1
	P_GOTO		.e_ik_d0
.e_ik_d1
	P_ACCEL		30,1
	P_SETANIM		0
	P_WAIT		10
;---------------------------------
.e_ik_z
	P_REMOVE
.ika_hit
	P_ADD		pbyte1,1
	P_IFNOTSAME		pbyte1,3,.ika_norm
	P_FORCE		.e_ik_d
.ika_norm
	P_RETURN
;---------------------------------------------------------------------------
	START_PATH	ika_2

	P_ALWAYSGENVECS	ON
	P_RELTOPLAYER	OFF
	P_SET		hp,100
	P_SET		ap,8
	P_SET		rotz,0
	P_SET		pbyte1,0
	P_TRIGGER		.ika_rot,always
	P_TRIGGER		.ika_hit,whenhitbyplayer

	P_LEFTOFPLAYER	.e_ika_l

	P_SET		roty,64
	P_SET		rotx,256-32

	P_GOTO		.e_ika_s

.e_ika_l
	P_SET		roty,256-64
	P_SET		rotx,256-32
.e_ika_s
	P_SETVEL		30

	P_WAIT		20
	P_RELTOPLAYER	ON
.e_ika_up
	P_IFBETWEEN		-1000,worldy,100,.e_ika_side
	P_GOTO		.e_ika_up

.e_ika_side
	P_WAITCHASE		rotx,0
	P_WAITCHASE		roty,128

.e_ika_chase
	P_FACEPLAYER
	P_DISTLESS		300,.e_ika_end
	P_GOTO		.e_ika_chase
.e_ika_end
	P_END

.ika_rot
	P_ADD		rotz,8
	P_RETURN
.ika_hit
	P_ADD		pbyte1,1
	P_IFNOTSAME		pbyte1,5,.ika_mada
	P_FORCE		.ika_nige
.ika_mada
	P_RETURN
.ika_nige
	P_TRIGGER		.ika_hit,OFF

	P_SET		coltab,id_3_c
	P_SOUNDEFFECT	$94

	P_DO		16
	P_ADD		rotx,-8
	P_NEXT

	P_SMOKE		ON

	P_WAIT		30
	P_WAITCHASE		rotx,256-64

	P_REMOVE
;-------------------------------------------------------------------
; hankei 200, hidarimawari

	START_PATH	l_clisla

	P_ALWAYSGENVECS	ON
	P_INVINCIBLE	ON
	P_ZREMOVE		ON
	P_TRIGGER		.l_cl_sub,always
	P_RANDOMGOTO	.l_cl_ran
	P_TRIGGER		.coin_clis,whenhitbyplayer
	P_SET		pbyte1,-47
.l_cl_ran
	P_SET		ap,8

.l_cl_0
	P_ADD		worldz,39
	P_ADD		worldx,-4

	P_WAIT		1

	P_ADD		worldz,38
	P_ADD		worldx,-11

	P_WAIT		1

	P_ADD		worldz,34
	P_ADD		worldx,-19

	P_WAIT		1

	P_ADD		worldz,30
	P_ADD		worldx,-25

	P_WAIT		1

	P_ADD		worldz,25
	P_ADD		worldx,-30

	P_WAIT		1

	P_ADD		worldz,19
	P_ADD		worldx,-34

	P_WAIT		1

	P_ADD		worldz,11
	P_ADD		worldx,-38

	P_WAIT		1

	P_ADD		worldz,4
	P_ADD		worldx,-39

	P_WAIT		1
;
	P_ADD		worldx,-39
	P_ADD		worldz,-4

	P_WAIT		1

	P_ADD		worldx,-38
	P_ADD		worldz,-11

	P_WAIT		1

	P_ADD		worldx,-34
	P_ADD		worldz,-19

	P_WAIT		1

	P_ADD		worldx,-30
	P_ADD		worldz,-25

	P_WAIT		1

	P_ADD		worldx,-25
	P_ADD		worldz,-30

	P_WAIT		1

	P_ADD		worldx,-19
	P_ADD		worldz,-34

	P_WAIT		1

	P_ADD		worldx,-11
	P_ADD		worldz,-38

	P_WAIT		1

	P_ADD		worldx,-4
	P_ADD		worldz,-39

	P_WAIT		1
;
	P_ADD		worldz,-39
	P_ADD		worldx,4

	P_WAIT		1

	P_ADD		worldz,-38
	P_ADD		worldx,11

	P_WAIT		1

	P_ADD		worldz,-34
	P_ADD		worldx,19

	P_WAIT		1

	P_ADD		worldz,-30
	P_ADD		worldx,25

	P_WAIT		1

	P_ADD		worldz,-25
	P_ADD		worldx,30

	P_WAIT		1

	P_ADD		worldz,-19
	P_ADD		worldx,34

	P_WAIT		1

	P_ADD		worldz,-11
	P_ADD		worldx,38

	P_WAIT		1

	P_ADD		worldz,-4
	P_ADD		worldx,39

	P_WAIT		1
;
	P_ADD		worldx,39
	P_ADD		worldz,4

	P_WAIT		1

	P_ADD		worldx,38
	P_ADD		worldz,11

	P_WAIT		1

	P_ADD		worldx,34
	P_ADD		worldz,19

	P_WAIT		1

	P_ADD		worldx,30
	P_ADD		worldz,25

	P_WAIT		1

	P_ADD		worldx,25
	P_ADD		worldz,30

	P_WAIT		1

	P_ADD		worldx,19
	P_ADD		worldz,34

	P_WAIT		1

	P_ADD		worldx,11
	P_ADD		worldz,38

	P_WAIT		1

	P_ADD		worldx,4
	P_ADD		worldz,39

	P_GOTO		.l_cl_0
;---------------------------------
.l_cl_sub	LOCAL
	P_ADD		rotz,4
	P_ADD		roty,4
	P_IFSAME		pbyte1,0,.l_sub_set
	P_RETURN
.l_sub_set
	P_SET		pbyte1,-47
	P_RETURN

.coin_clis	LOCAL
	P_FORCE		.coin_2
	P_SET		pbyte2,-60
	P_SET		pword1,8
	P_SET		pbyte1,-47
	P_RELTOPLAYER	ON
	P_RANDOMGOTO	.coin_r
	P_SET		pword1,-8
.coin_r
	P_RETURN
.coin_2
	P_GOSUB		.coin_up
	P_WAIT		1
	P_ADD		pbyte1,4
	P_GOSUB		.coin_up
	P_ADD		pbyte1,6
	P_IFBETWEEN		0,pbyte1,120,.coin_3
	P_GOTO		.coin_2
.coin_3
	P_WAIT		2

;.coin_star
	P_SET		pbyte1,3
	P_GOSUB		.coin_up
	P_WAIT		1

.coin_down
	P_ADD		pbyte1,4
	P_GOSUB		.coin_up
	P_HITGROUND		0,.coin_stnd
	P_WAIT		1
	P_ADD		pbyte1,6
	P_GOSUB		.coin_up
	P_HITGROUND		0,.coin_stnd
	P_IFBETWEEN		47,pbyte1,80,.coin_setpby
	P_GOTO		.coin_down
.coin_setpby
	P_SET		pbyte1,37
	P_GOTO		.coin_down
.coin_up
	P_ADD		worldy,pbyte1
	P_ADD		worldx,pword1
	P_ADD		rotx,32
	P_RETURN
.coin_stnd
	P_RELTOPLAYER	OFF
	P_DIV2		pbyte2
	P_IFBETWEEN		0,pbyte2,5,.coin_en
	P_SET		pbyte1,pbyte2
	P_IGOTO		.coin_2
.coin_en
	P_SET		worldy,-10

	P_END

;-------------------------------------------------------------------

	START_PATH	mini_cli

	P_INVINCIBLE	ON
	P_RELTOPLAYER	OFF
	P_ZREMOVE		ON
	P_TRIGGER		pl_clisla.l_cl_sub,always
	P_RANDOMGOTO	.mini_cl_0
	P_TRIGGER		pl_clisla.coin_clis,whenhitbyplayer
	P_SET		pbyte1,-47

.mini_cl_0
	P_SETRANDOM		rotx,127
	P_SETRANDOM		roty,127
	P_SETRANDOM		rotz,127

	P_SET		ap,8

.mini_cli_w
	P_WAIT		1
	P_GOTO		.mini_cli_w
;-------------------------------------------------------------------
; hankei 200, migimawari

	START_PATH	r_clisla

	P_ALWAYSGENVECS	ON
	P_INVINCIBLE	ON
	P_TRIGGER		pl_clisla.l_cl_sub,always
	P_RANDOMGOTO	.r_cl_ran
	P_TRIGGER		pl_clisla.coin_clis,whenhitbyplayer
	P_SET		pbyte1,-47

.r_cl_ran
	P_SET		ap,8

.r_cl_0
	P_ADD		worldz,39
	P_ADD		worldx,4

	P_WAIT		1

	P_ADD		worldz,38
	P_ADD		worldx,11

	P_WAIT		1

	P_ADD		worldz,34
	P_ADD		worldx,19

	P_WAIT		1

	P_ADD		worldz,30
	P_ADD		worldx,25

	P_WAIT		1

	P_ADD		worldz,25
	P_ADD		worldx,30

	P_WAIT		1

	P_ADD		worldz,19
	P_ADD		worldx,34

	P_WAIT		1

	P_ADD		worldz,11
	P_ADD		worldx,38

	P_WAIT		1

	P_ADD		worldz,4
	P_ADD		worldx,39

	P_WAIT		1
;
	P_ADD		worldx,39
	P_ADD		worldz,-4

	P_WAIT		1

	P_ADD		worldx,38
	P_ADD		worldz,-11

	P_WAIT		1

	P_ADD		worldx,34
	P_ADD		worldz,-19

	P_WAIT		1

	P_ADD		worldx,30
	P_ADD		worldz,-25

	P_WAIT		1

	P_ADD		worldx,25
	P_ADD		worldz,-30

	P_WAIT		1

	P_ADD		worldx,19
	P_ADD		worldz,-34

	P_WAIT		1

	P_ADD		worldx,11
	P_ADD		worldz,-38

	P_WAIT		1

	P_ADD		worldx,4
	P_ADD		worldz,-39

	P_WAIT		1
;
	P_ADD		worldz,-39
	P_ADD		worldx,-4

	P_WAIT		1

	P_ADD		worldz,-38
	P_ADD		worldx,-11

	P_WAIT		1

	P_ADD		worldz,-34
	P_ADD		worldx,-19

	P_WAIT		1

	P_ADD		worldz,-30
	P_ADD		worldx,-25

	P_WAIT		1

	P_ADD		worldz,-25
	P_ADD		worldx,-30

	P_WAIT		1

	P_ADD		worldz,-19
	P_ADD		worldx,-34

	P_WAIT		1

	P_ADD		worldz,-11
	P_ADD		worldx,-38

	P_WAIT		1

	P_ADD		worldz,-4
	P_ADD		worldx,-39

	P_WAIT		1
;
	P_ADD		worldx,-39
	P_ADD		worldz,4

	P_WAIT		1

	P_ADD		worldx,-38
	P_ADD		worldz,11

	P_WAIT		1

	P_ADD		worldx,-34
	P_ADD		worldz,19

	P_WAIT		1

	P_ADD		worldx,-30
	P_ADD		worldz,25

	P_WAIT		1

	P_ADD		worldx,-25
	P_ADD		worldz,30

	P_WAIT		1

	P_ADD		worldx,-19
	P_ADD		worldz,34

	P_WAIT		1

	P_ADD		worldx,-11
	P_ADD		worldz,38

	P_WAIT		1

	P_ADD		worldx,-4
	P_ADD		worldz,39

	P_WAIT		1

	P_IFBETWEEN		-500,worldz,-100,.r_cl_1

	P_GOTO		.r_cl_0

.r_cl_1
	P_END
;.r_cl_sub
;	P_ADD		rotz,4
;	P_ADD		roty,4
;	P_RETURN
;-------------------------------------------------------------------
	START_PATH	kanihaha

	P_INVINCIBLE	ON
	P_RELTOPLAYER	ON
	P_SET		pbyte1,0

.e_haha_0
	P_SET		worldx,-800
	P_QSPAWN		walk_4_0,e_kani_0,10,10
	P_IFNOTSAME		pbyte1,1,.e_haha_pas1
	P_SET		worldx,-500
	P_SPAWN		0,170,0,0,0,0,hou_5,kani_withhou,10,10
.e_haha_pas1
	P_WAIT		100
	P_SET		worldx,800
	P_QSPAWN		walk_4_0,e_kani_0,10,10
	P_IFNOTSAME		pbyte1,1,.e_haha_pas
	P_SET		worldx,500
	P_SPAWN		0,170,0,0,0,0,hou_5,kani_withhou,10,10
.e_haha_pas
	P_ADD		pbyte1,1
	P_IFSAME		pbyte1,2,.e_haha_next
	P_WAIT		100
	P_IGOTO		.e_haha_0

.e_haha_next
	P_ADD		worldz,-2000

;.e_haha_1
	P_WAIT		40
	P_SET		worldx,2300
	P_SPAWN		0,-30,0,0,0,0,zaco_5,egu4,10,10
	P_SET		worldx,-2300
	P_SPAWN		0,70,0,0,0,0,zaco_5,egu4,10,10

	P_WAIT		50

	P_SET		worldy,0
	P_WAIT		50
	P_SET		worldx,400
	P_GOSUB		.e_haha_sub
	P_WAIT		50
	P_SET		worldx,-400
	P_GOSUB		.e_haha_sub

	P_REMOVE
.e_haha_sub
	P_QSPAWN		hou_5,kani_withhou,10,10
	P_RETURN
;---------------------------------------------------------------------

	START_PATH	kani_withhou

	P_SETSTRAT	houdai5f_istrat

	P_END
;---------------------------------------------------------------------
;use set pos
;x=+-800,y=-170,z=5000

	START_PATH	e_kani_0

	P_TRIGGER		.kani_childck,always
	P_INVINCIBLE	ON
	P_ZREMOVE		OFF
	P_SOUND		$D

	P_ADD		rotx,4

	P_SPAWN	-40,10,-50,-4,148,0,walk_4_l,e_kani_l2,4,10,2
	P_SPAWN	-40,10,10,-4,103,0,walk_4_l,e_kani_l1,4,10,1
	P_SPAWN	40,10,-50,-4,108,0,walk_4_r,e_kani_l1,4,10,4
	P_SPAWN	40,10,10,-4,153,0,walk_4_r,e_kani_l2,4,10,3


	P_SET		pbyte2,20

	P_LEFTOFPLAYER	.e_k0_l

	P_SET		roty,64
	P_SET		pbyte1,-27
	P_IGOTO		.e_k0_r
.e_k0_l
	P_SET		roty,192
	P_SET		pbyte1,27

.e_k0_r
	P_DISTLESS		2000,.e_k0_r1
	P_ADD		worldx,pbyte1
	P_ADD		worldz,pbyte2
	P_IFNOTSAME		pbyte1,-27,.e_k0_l2
	P_LEFTOFPLAYER	.e_k0_r0
	P_GOTO		.e_k0_r
.e_k0_l2
	P_RIGHTOFPLAYER	.e_k0_r0
	P_GOTO		.e_k0_r
.e_k0_r0
	P_IFNOTSAME		pbyte1,-27,.e_k0_r01
	P_SET		pbyte1,-10
	P_IGOTO		.e_k0_r02
.e_k0_r01
	P_SET		pbyte1,10
.e_k0_r02
	P_QSPAWN		nullshape,kani_shot,10,10
	P_TRIGGER		.kani_fire,16
.e_k0_r1
	P_ADD		worldx,pbyte1
	P_ADD		worldz,pbyte2
	P_IFNOTSAME		pbyte1,-10,.e_k0_r10
	P_ADD		roty,4
	P_IGOTO		.e_k0_r11
.e_k0_r10
	P_ADD		roty,-4
.e_k0_r11
	P_IFBETWEEN		124,roty,132,.e_k0_r2
	P_GOTO		.e_k0_r1

.e_k0_r2
	P_CHASE		roty,128
	P_DISTLESS		700,.e_k0_r3
	P_GOTO		.e_k0_r2
.e_k0_r3
	P_TRIGGER		.kani_fire,OFF
.e_k0_r4
	P_BEHINDPLAYER	.e_k0_bh
	P_GOTO		.e_k0_r4
.e_k0_bh
	P_WAIT		5

	P_QSPAWN		nullshape,e_back,10,10
	P_REMOVE
;---------------------------------
.e_fl
	P_TRIGGER		.kani_childck,OFF
	P_TRIGGER		.kani_fire,OFF
	P_HELICOPTER	OFF
	P_SETVEL		0

.e_fl1
	P_CHILDDEAD		2,.e_flbl
	P_CHILDDEAD		3,.e_flfr
	P_CHILDDEAD		4,.e_flbr
	P_ADD		rotx,1
	P_ADD		rotz,1
	P_ADD		worldy,5
	P_ADD		worldx,3
	P_HITGROUND		30,.e_k0_z
	P_GOTO		.e_fl1
.e_flbr
	P_EXPLODE
.e_flfr
	P_CHILDDEAD		2,.e_flfrbl
	P_CHILDDEAD		4,.e_flfrbr
	P_CHASE		rotz,0
	P_ADD		rotx,1
	P_ADD		worldy,5
	P_HITGROUND		15,.e_k0_z
	P_GOTO		.e_flfr
.e_flbl
	P_CHILDDEAD		3,.e_flblfr
	P_CHILDDEAD		4,.e_flblbr
	P_ADD		rotz,1
	P_CHASE		rotx,0
	P_ADD		worldy,5
	P_ADD		worldx,3
	P_HITGROUND		40,.e_k0_z
	P_GOTO		.e_flbl
.e_flfrbr
	P_CHILDDEAD		2,.e_k0_all
	P_ADD		rotz,-2
	P_ADD		rotx,1
	P_ADD		worldy,5
	P_ADD		worldx,-3
	P_HITGROUND		20,.e_k0_z
	P_GOTO		.e_flfrbr
.e_flfrbl
	P_CHILDDEAD		4,.e_k0_all
	P_ADD		rotx,1
	P_ADD		rotz,2
	P_ADD		worldy,5
	P_ADD		worldx,3
	P_HITGROUND		20,.e_k0_z
	P_GOTO		.e_flfrbl
.e_flblbr
	P_CHILDDEAD		3,.e_k0_all
	P_ADD		rotz,2
	P_ADD		rotx,-3
	P_ADD		worldy,5
	P_ADD		worldx,3
	P_HITGROUND		55,.e_k0_z
	P_GOTO		.e_flblbr
.e_flblfr
	P_CHILDDEAD		4,.e_k0_all
	P_ADD		rotx,1
	P_ADD		rotz,1
	P_ADD		worldy,5
	P_ADD		worldx,3
	P_HITGROUND		30,.e_k0_z
	P_GOTO		.e_flblfr
.e_k0_all
	P_CHASE		rotx,0
	P_CHASE		rotz,0
	P_ADD		worldy,5
	P_HITGROUND		25,.e_k0_fin
	P_GOTO		.e_k0_all
.e_k0_fin
	P_CHASE		rotx,0
	P_CHASE		rotz,0
	P_IFSAME		rotx,0,.e_k0_fi1
	P_GOTO		.e_k0_fin
.e_k0_fi1
	P_IFSAME		rotz,0,.e_k0_fl3
	P_GOTO		.e_k0_fin
.e_k0_fl3
	P_ZREMOVE		ON
.e_k0_flz
	P_WAIT		1
	P_GOTO		.e_k0_flz
;---------------------------------
.e_bl
	P_TRIGGER		.kani_fire,OFF
	P_TRIGGER		.kani_childck,OFF
	P_HELICOPTER	OFF
	P_SETVEL		0

.e_bl1
	P_CHILDDEAD		1,.e_flbl
	P_CHILDDEAD		3,.e_flbr
	P_CHILDDEAD		4,.e_blbr
	P_ADD		rotx,-1
	P_ADD		rotz,1
	P_ADD		worldy,5
	P_ADD		worldx,3
	P_HITGROUND		70,.e_k0_z
	P_GOTO		.e_bl1
.e_blbr
	P_ADD		rotx,-1
	P_CHASE		rotz,0
	P_ADD		worldy,2
	P_HITGROUND		85,.e_k0_z
	P_GOTO		.e_blbr
;---------------------------------
.e_fr
	P_TRIGGER		.kani_fire,OFF
	P_TRIGGER		.kani_childck,OFF
	P_HELICOPTER	OFF
	P_SETVEL		0

	P_CHILDDEAD		1,.e_flfr
	P_CHILDDEAD		2,.e_flbr
	P_CHILDDEAD		4,.e_frbr
	P_ADD		rotz,-1
	P_ADD		rotx,1
	P_ADD		worldy,5
	P_ADD		worldx,-3
	P_HITGROUND		30,.e_k0_z
	P_GOTO		.e_fr
.e_frbr
	P_CHILDDEAD		1,.e_flfrbr
	P_CHILDDEAD		2,.e_frbrbl
	P_ADD		rotz,-1
	P_CHASE		rotx,0
	P_ADD		worldy,5
	P_ADD		worldx,-3
	P_HITGROUND		40,.e_k0_z
	P_GOTO		.e_frbr
.e_frbrbl
	P_CHILDDEAD		1,.e_k0_all
	P_ADD		rotz,-1
	P_ADD		rotx,-3
	P_ADD		worldy,5
	P_ADD		worldx,-3
	P_HITGROUND		55,.e_k0_z
	P_GOTO		.e_frbrbl
;---------------------------------
.e_br
	P_TRIGGER		.kani_fire,OFF
	P_TRIGGER		.kani_childck,OFF
	P_HELICOPTER	OFF
	P_SETVEL		0

.e_br1
	P_CHILDDEAD		1,.e_flbr
	P_CHILDDEAD		2,.e_blbr
	P_CHILDDEAD		3,.e_frbr
	P_ADD		rotx,-1
	P_ADD		rotz,-1
	P_ADD		worldy,5
	P_ADD		worldx,-3
	P_HITGROUND		70,.e_k0_z
	P_GOTO		.e_br1
;---------------------------------
.e_k0_z
	P_DO		50
	P_CHILDDEAD		1,.e_k0_z1
	P_IGOTO		.e_k0_zw
.e_k0_z1
	P_CHILDDEAD		2,.e_k0_z2
	P_IGOTO		.e_k0_zw
.e_k0_z2
	P_CHILDDEAD		3,.e_k0_z3
	P_IGOTO		.e_k0_zw
.e_k0_z3
	P_CHILDDEAD		4,.e_k0_z4
	P_IGOTO		.e_k0_zw
.e_k0_z4
	P_BREAK		.e_k0_all
.e_k0_zw
	P_NEXT
.e_k0_zz
	P_REMOVE
	P_END

.kani_childck
	P_CHILDDEAD		1,.e_ckfl
	P_CHILDDEAD		2,.e_ckbl
	P_CHILDDEAD		3,.e_ckfr
	P_CHILDDEAD		4,.e_ckbr
	P_RETURN
.e_ckfl
	P_FORCE		.e_fl
	P_RETURN
.e_ckbl
	P_FORCE		.e_bl
	P_RETURN
.e_ckfr
	P_FORCE		.e_fr
	P_RETURN
.e_ckbr
	P_FORCE		.e_br
	P_RETURN
.kani_fire
	P_RANDOMGOTO	.kani_fire1
	P_QSPAWN		nullshape,kani_shot,10,10
.kani_fire1
	P_RETURN
;------------------------------------------------------------------------
;anim 0 - 23
	START_PATH	e_kani_l1

	P_SETANIM		10

	P_IGOTO		pe_kani_l2.ek_l2_init

;------------------------------------------------------------------------
;anim 0 - 23
	START_PATH	e_kani_l2

	P_SETANIM		0

.ek_l2_init		LOCAL

	P_ZREMOVE		OFF

.ek_l2_0	      
	P_ADDANIM		1,23
	P_GOTO		.ek_l2_0
;------------------------------------------------------------------------


	START_PATH	e_back

	P_RELTOPLAYER	ON
	P_INVISIBLE		ON
	P_ZREMOVE		OFF
	P_WEAPON		relovalbeam
	P_SOUND		$D

.e_back1
	P_SET		roty,0
	P_SET		rotx,5
	P_FIRE
.e_back2
	P_FACEPLAYER
	P_LOOP		8,.e_back2
	P_WAIT		7
	P_FIRE
.e_back3
	P_FACEPLAYER
	P_LOOP		8,.e_back3
	P_WAIT		3
	P_FIRE

	P_WAIT		10

	P_REMOVE
;------------------------------------------------------------------------

	START_PATH	kani_shot

	P_WEAPON		ovalbeam
.shoot_fire		LOCAL
	P_INVISIBLE		ON

	P_GOSUB		facefire

	P_REMOVE

;-------------------------------------------------------------------

	START_PATH	saka_shot

	P_WEAPON		hplasma
	P_SET		roty,128
	P_ADD		worldy,140

	P_IGOTO		pkani_shot.shoot_fire

;-------------------------------------------------------------------

	START_PATH	saka_hou

	P_SHADOW		OFF
	P_TRIGGER		.saka_ochi,whenhitbyplayer

	P_SET		hp,4
	P_SET		ap,8

	P_SET		rotz,128

.saka_w
	P_DISTLESS		2500,.saka_t
	P_GOTO		.saka_w
.saka_t
	P_TRIGGER		.saka_fire,16

	P_END
.saka_fire
	P_RANDOMGOTO	.saka_fran
	P_QSPAWN		nullshape,saka_shot,10,10
.saka_fran
	P_RETURN
.saka_ochi
	P_FORCE		.saka_ochiru
	P_RETURN
.saka_ochiru
	P_SET		pbyte1,3
.saka_ochi1
	P_ADD		worldy,pbyte1
	P_HITGROUND		100,.saka_exp
	P_ADD		pbyte1,6
	P_GOTO		.saka_ochi1
.saka_exp
	P_EXPLODE
;-------------------------------------------------------------------

	START_PATH	matemsg

	P_FRIEND
	P_RELTOPLAYER	ON
	P_INVISIBLE		ON

	P_WAIT		54

	P_MSG		1
	P_WAIT		25
	P_MSG		5
	P_WAIT		25
	P_MSG		45
	P_WAIT		25
	P_MSG		25

	P_REMOVE
;-------------------------------------------------------------------

	START_PATH	astemsg

	P_FRIEND
	P_RELTOPLAYER	ON
	P_INVISIBLE		ON

	P_NOTFRIEND		falcon,.astms_0
	P_MSG		16
	P_GOTO		.astms_2
.astms_0
	P_NOTFRIEND		rabbit,.astms_1
	P_MSG		36
	P_GOTO		.astms_2
.astms_1
	P_NOTFRIEND		frog,.astms_2
	P_MSG		56

.astms_2
	P_REMOVE

	P_END

;-------------------------------------------------------------------

	START_PATH	dragonmsg

	P_FRIEND
	P_RELTOPLAYER	ON
	P_INVISIBLE		ON

.dra_0
	P_WAIT		1
	P_LOOP		50,.dra_0

	P_NOTFRIEND		falcon,.drams_0
	P_MSG		17
	P_GOTO		.drams_2
.drams_0
	P_NOTFRIEND		rabbit,.drams_1
	P_MSG		37
	P_GOTO		.drams_2
.drams_1
	P_NOTFRIEND		frog,.drams_2
	P_MSG		57
.drams_2
	P_REMOVE

	P_END
;-------------------------------------------------------------------

	START_PATH	handmsg

	P_FRIEND
	P_RELTOPLAYER	ON
	P_INVISIBLE		ON

.han_0
	P_WAIT		1
	P_LOOP		50,.han_0
.han_1
	P_WAIT		1
	P_LOOP		50,.han_1

	P_NOTFRIEND		falcon,.hanms_0
	P_MSG		18
	P_GOTO		.hanms_2
.hanms_0
	P_NOTFRIEND		rabbit,.hanms_1
	P_MSG		38
	P_GOTO		.hanms_2
.hanms_1
	P_NOTFRIEND		frog,.hanms_2
	P_MSG		58
.hanms_2
	P_REMOVE

	P_END
;-------------------------------------------------------------------

	START_PATH	kastmsg

	P_FRIEND
	P_RELTOPLAYER	ON
	P_INVISIBLE		ON

	P_WAIT		150


	P_NOTFRIEND		falcon,.kasms_0
	P_MSG		19
	P_GOTO		.kasms_2
.kasms_0
	P_NOTFRIEND		rabbit,.kasms_1
	P_MSG		39
	P_GOTO		.kasms_2
.kasms_1
	P_NOTFRIEND		frog,.kasms_2
	P_MSG		57
.kasms_2
	P_REMOVE

	P_END
;-------------------------------------------------------------------
	START_PATH	kastmsg2

	P_FRIEND
	P_RELTOPLAYER	ON
	P_INVISIBLE		ON

	P_NOTFRIEND		falcon,.2kasms_0
	P_MSG		19
	P_IGOTO		.2kasms_2
.2kasms_0
	P_NOTFRIEND		rabbit,.2kasms_1
	P_MSG		39
	P_IGOTO		.2kasms_2
.2kasms_1
	P_NOTFRIEND		frog,.2kasms_2
	P_MSG		57
.2kasms_2
	P_REMOVE

	P_END
;-------------------------------------------------------------------

	START_PATH	braymsg

	P_FRIEND
	P_RELTOPLAYER	ON
	P_INVISIBLE		ON

	P_WAIT		80

	P_NOTFRIEND		falcon,.rayms_0
	P_MSG		140
	P_GOTO		.rayms_2
.rayms_0
	P_NOTFRIEND		rabbit,.rayms_1
	P_MSG		141
	P_GOTO		.rayms_2
.rayms_1
	P_NOTFRIEND		frog,.rayms_2
	P_MSG		142
.rayms_2
	P_REMOVE

	P_END
;-------------------------------------------------------------------

	START_PATH	amebmsg

	P_FRIEND
	P_RELTOPLAYER	ON
	P_INVISIBLE		ON

.amems_a	LOCAL
	P_NOTFRIEND		falcon,.amems_0
	P_MSG		20
	P_GOTO		.amems_2
.amems_0
	P_NOTFRIEND		rabbit,.amems_1
	P_MSG		40
	P_GOTO		.amems_2
.amems_1
	P_NOTFRIEND		frog,.amems_2
	P_MSG		59
.amems_2
	P_REMOVE

	P_END
;-------------------------------------------------------------------

	START_PATH	amebmsg2

	P_FRIEND
	P_RELTOPLAYER	ON
	P_INVISIBLE		ON

.amems2_0
	P_WAIT		1
	P_LOOP		50,.amems2_0

.amems2_1
	P_WAIT		1
	P_LOOP		50,.amems2_1

	P_GOTO		pamebmsg.amems_a
;-------------------------------------------------------------------

	START_PATH	 totumsg

	P_FRIEND
	P_RELTOPLAYER	ON
	P_INVISIBLE		ON

	P_WAIT		40

	P_NOTFRIEND		falcon,.totms_0
	P_MSG		66
	P_GOTO		.totms_2
.totms_0
	P_NOTFRIEND		rabbit,.totms_1
	P_MSG		67
	P_GOTO		.totms_2
.totms_1
	P_NOTFRIEND		frog,.totms_2
	P_MSG		68
.totms_2
	P_REMOVE

	P_END
;-------------------------------------------------------------------

	START_PATH		mes_andross2

	P_RELTOPLAYER	ON
	P_INVISIBLE		ON

	P_WAIT		40

	P_IFLEVEL		2,.andr2_2
	P_IFLEVEL		3,.andr2_3

	P_MSG		128
	P_REMOVE
.andr2_2
	P_MSG		131
	P_REMOVE
.andr2_3
	P_MSG		134
	P_REMOVE
;-------------------------------------------------------------------

	START_PATH		mes_andross1

	P_RELTOPLAYER	ON
	P_INVISIBLE		ON

	P_IFLEVEL		2,.andro_2
	P_IFLEVEL		3,.andro_3

	P_MSG		126

	P_WAIT		60

	P_MSG		127
	P_REMOVE
.andro_2
	P_MSG		129

	P_WAIT		60

	P_MSG		130
	P_REMOVE
.andro_3
	P_MSG		132

	P_WAIT		60

	P_MSG		133
	P_REMOVE

;-------------------------------------------------------------------

	START_PATH	e_shawerl

	P_GOSUB		pe_shawer.shawer_init
	P_SET		pbyte1,1

	P_IGOTO		pe_shawerr.e_shar_0
;-------------------------------------------------------------------

	START_PATH	e_shawerr

	P_GOSUB		pe_shawer.shawer_init
	P_SET		pbyte1,0

.e_shar_0	LOCAL
	P_ABOVEPLAYER	.e_shar_1
	P_WAIT		1
	P_GOTO		.e_shar_0
.e_shar_1
	P_SETVEL		0
	P_WAITCHASE		rotx,0

	P_IFSAME		pbyte1,1,.e_shar_2
	P_IGOTO		pe_shawer.e_sha_r
.e_shar_2
	P_IGOTO		pe_shawer.e_sha_l
;-------------------------------------------------------------------

	START_PATH	e_shawer

	P_GOSUB		.shawer_init

.e_sha_0
	P_ABOVEPLAYER	.e_sha_1
	P_WAIT		1
	P_GOTO		.e_sha_0
.e_sha_1
	P_SETVEL		0
	P_WAITCHASE		rotx,0

	P_RANDOMGOTO	.e_sha_l

.e_sha_r	LOCAL
	P_SET		pbyte1,30
	P_SET		pbyte2,30
	P_GOSUB		.e_sha_adxy
	P_WAIT		20

	P_NEG		pbyte2
	P_GOSUB		.e_sha_adxy

	P_WAIT		20

	P_NEG		pbyte1
	P_GOSUB		.e_sha_adxy

	P_DO		30
	P_ADD		roty,16
	P_NEXT

	P_DO		10
	P_GOSUB		facefire
	P_WAIT		1
	P_FACEPLAYER
	P_WAIT		1
	P_FACEPLAYER
	P_NEXT

	P_RELTOPLAYER	OFF
.e_sha_rz
	P_ADD		worldx,-20
	P_ADD		worldy,20
	P_GOTO		.e_sha_rz
;------------------------------
.e_sha_l	LOCAL
	P_SET		pbyte1,-30
	P_SET		pbyte2,30
	P_GOSUB		.e_sha_adxy

	P_WAIT		20

	P_NEG		pbyte2
	P_GOSUB		.e_sha_adxy

	P_WAIT		20

	P_NEG		pbyte1
	P_GOSUB		.e_sha_adxy

	P_DO		30
	P_ADD		roty,16
	P_NEXT

	P_DO		10
	P_GOSUB		facefire
	P_WAIT		1
	P_FACEPLAYER
	P_WAIT		1
	P_FACEPLAYER
	P_NEXT

	P_RELTOPLAYER	OFF

.e_sha_lz
	P_ADD		worldx,20
	P_ADD		worldy,20
	P_GOTO		.e_sha_lz

.shawer_init	LOCAL
	P_RELTOPLAYER	ON
	P_WEAPON		relslowelaser
	P_ZREMOVE		ON

	P_SET		hp,2
	P_SET		ap,8
	P_SET		roty,128
	P_SET		rotx,192

	P_SETVEL		30

	P_RETURN
.e_sha_adxy
	P_DO		7
	P_FACEPLAYER
	P_ADD		worldx,pbyte1
	P_ADD		worldy,pbyte2
	P_NEXT
	P_RETURN
;-------------------------------------------------------------------

	START_PATH	patrol

	P_RELTOPLAYER	ON
	P_WEAPON		relslowelaser
	P_RANDOMGOTO	.patr_ran
	P_TRIGGER		pspiralexplode,WHENDEAD

.patr_ran
	P_SOUND		3

	P_SET		hp,2
	P_SET		ap,8

	P_RIGHTOFPLAYER	.pat_r

	P_SET		roty,192

	P_SETVEL		50

.pat_l_0
	P_IFBETWEEN		-250,worldx,250,.pat_l_1
	P_RIGHTOFPLAYER	.pat_l_1
	P_GOTO		.pat_l_0
.pat_l_1
	P_GOSUB		.pat_f_sub

	P_WAITCHASE		roty,192
	P_IGOTO		.pat_b_end
;--------------------------
.pat_r
	P_SET		roty,64
.pat_r_s
	P_SETVEL		50

.pat_r_0
	P_IFBETWEEN		-250,worldx,250,.pat_r_1
	P_LEFTOFPLAYER	.pat_r_1
	P_GOTO		.pat_r_0

.pat_r_1
	P_GOSUB		.pat_f_sub

	P_WAITCHASE		roty,64
.pat_b_end
	P_ACCEL		50,5

	P_DO		50
	P_CHASE		rotx,0
	P_NEXT

	P_REMOVE
.pat_f_sub
	P_ACCEL		0,5
	P_WAITCHASE		roty,128
	P_DO		3
	P_DO		10
	P_FACEPLAYER
	P_NEXT
	P_FIRE
	P_NEXT
	P_RETURN
;-------------------------------------------------------------------

	START_PATH	patret

	P_RELTOPLAYER	ON
	P_ZREMOVE		OFF
	P_SPACESHIP		ON
	P_ALWAYSGENVECS	ON
	P_WEAPON		ringlaser
	P_SETANIM		3

	P_RANDOMGOTO	.patr_ran
	P_TRIGGER		pcoinexplode,WHENDEAD

.patr_ran
	P_IFLEVEL		1,.pret_jp
	P_SOUND		3

.pret_jp
	P_SET		hp,2
	P_SET		ap,8

	P_SETVEL		60

	P_WAIT		50

	P_LEFTOFPLAYER	.pret_0
	P_WAITCHASE		rotz,28
	P_IGOTO		.pret_1
.pret_0
	P_WAITCHASE		rotz,256-28
.pret_1
	P_WAITCHASE		rotz,0

	P_SETVEL		50

	P_ZREMOVE		ON

	P_DO		3

	P_DO		15
	P_FACEPLAYER
	P_NEXT

	P_DISTLESS		1300,.pret_11
	P_FIRE

	P_NEXT

.pret_11
	P_WAITCHASE		roty,128

	P_WAIT		100

	P_END

;-------------------------------------------------------------------

	START_PATH	patcom

	P_BOOST		ON
	P_ALWAYSGENVECS	ON
	P_RELTOPLAYER	ON
	P_SPACESHIP		ON
	P_SETANIM		9
	P_SOUND		3
	P_WEAPON		relslowelaser
	P_FINDSHAPE		ship_1
	P_IMMUNE
	P_RANDOMGOTO	.patc_ran
	P_TRIGGER		pcoinexplode,WHENDEAD

.patc_ran
	P_SET		hp,6
	P_SET		ap,6

	P_SET		roty,128
	P_ADD		rotz,8
	P_SETVEL		30

	P_DO		96
	P_ADD		rotx,-4
	P_ADD		worldz,-50
	P_NEXT

	P_TRIGGER		.comz,always
	P_SPACESHIP		OFF
	
	P_DO		3
	P_DO		10
	P_FACEPLAYER
	P_NEXT

	P_FIRE
	P_NEXT

	P_END
.comz
	P_ADD		worldz,-40
	P_RETURN
;-------------------------------------------------------------------

	START_PATH	screw

	P_ALWAYSGENVECS	OFF
	P_RELTOPLAYER	OFF
	P_WEAPON		relovalbeam
	P_TRIGGER		pdamyscr.scr_rot,always

	P_SET		hp,2
	P_SET		ap,6

.scr_0
	P_DISTLESS		1500,.scr_1
	P_GOTO		.scr_0

.scr_1
	P_TRIGGER		pdamyscr.scr_rot,OFF
	P_RELTOPLAYER	ON
	P_RANDOMGOTO	.scr_3

	P_SET		roty,128+32
	P_SET		rotx,192+32

	P_DO		10
	P_FIRE
	P_ADD		rotx,6
	P_ADD		roty,-6
	P_NEXT

	P_IGOTO		.scr_2
.scr_3
	P_SET		roty,128-32
	P_SET		rotx,192+32

	P_DO		10
	P_FIRE
	P_ADD		rotx,6
	P_ADD		roty,6
	P_NEXT

.scr_2
	P_RELTOPLAYER	OFF
	P_TRIGGER		pdamyscr.scr_rot,always
	P_END

;-------------------------------------------------------------------

	START_PATH	damyscr

	P_RELTOPLAYER	OFF
	P_ALWAYSGENVECS	OFF
	P_TRIGGER		.scr_rot,always

	P_SET		hp,2
	P_SET		ap,6

	P_END

.scr_rot	LOCAL
	P_ADD		rotx,8
	P_ADD		roty,-8
	P_RETURN
;*******************************************************************
;***	         FRIEND  AND  CHASING ENEMY                  ***
;*******************************************************************
;-------------------------------------------------------------------
;------------------------------------------------------------------
;******************************************************************

eguchi2

;******************************************************************
;-------------------------------------------------------------------
;x=1200,y=200,z=600,bt=-0

	START_PATH	chase1_1

	P_FRIEND
	P_LINK
	P_GOSUB		friend_init
	P_SPACESHIP		ON
	P_ZREMOVE		OFF
	P_SOUND		1

	P_NOTFRIEND		anyone,.c1_1_e

.c1_1_0
	P_SET		roty,DEG90

	P_SETVEL		30

	P_NOTFRIEND		falcon,.c1_1_m2
	P_MSG		7,meter		;FALCON SAYS
	P_GOTO		.c1_1_4

.c1_1_m2
	P_NOTFRIEND		rabbit,.c1_1_m3
	P_MSG		27,meter		;RABBIT SAYS
	P_GOTO		.c1_1_4

.c1_1_m3
	P_MSG		47,meter		;FROG SAYS


.c1_1_4
	P_WAIT		35

.c1_1_1
	P_ZREMOVE		ON
	P_ADD		rotx,-4
	P_ADD		rotz,-1
	P_IFSAME		rotz,-64,.c1_1_2
	P_GOTO		.c1_1_1
.c1_1_2
	P_CHASE		rotx,0
	P_CHASE		rotz,0
	P_LOOP		20,.c1_1_2

.c1_1_21
	P_WAIT		30

	P_TRIGGER		save,OFF

	P_ALMOSTDEAD	.c1_1_c		;IF 4th


	P_NOTFRIEND		falcon,.c1_1_2a
	P_MSG		15,meter
	P_IGOTO		.c1_a_3
.c1_1_2a
	P_NOTFRIEND		rabbit,.c1_1_2b
	P_MSG		35,meter
	P_IGOTO		.c1_a_3
.c1_1_2b
	P_MSG		55,meter
;--------------------------------
.c1_a_3
	P_DAMAGE				;FRIEND GETS DAMAGE
.c1_a_30
	P_ADD		rotz,4
	P_LOOP		7,.c1_a_30

.c1_a_31
	P_WAIT		21

	P_WAITCHASE		rotz,0

	P_ACCEL		60,5

	P_WAITCHASE		rotx,234
.c1_a_32
	P_WAIT		7
	P_GOTO		.c1_1_e

;--- friend dead ---
.c1_1_c
	P_FLAGSHAPE
	P_TRIGGER		yamete,OFF
	P_NOTFRIEND		frog,.c1_1_h
	P_WAIT		1
.c1_1_h
	P_SMOKE		ON
	P_WAIT		4
	P_SMOKE		OFF

	P_ACCEL		10,1

	P_NOTFRIEND		falcon,.c1_1_m6
	P_MSG		9,meter		;FALCON SAYS
	P_GOTO		.c1_1_d

.c1_1_m6
	P_NOTFRIEND		rabbit,.c1_1_m7
	P_MSG		29,meter		;RABBIT SAYS
	P_GOTO		.c1_1_d

.c1_1_m7
	P_MSG		49,meter		;FROG SAYS

.c1_1_d

	P_DAMAGE
	P_SPACESHIP		OFF

	P_WAITCHASE		roty,0

.c1_1_f
	P_CHASE		vel,-20
	P_ADD		worldy,-3
	P_ADD		rotz,10
	P_LOOP		50,.c1_1_f

	P_SMOKE		ON

.c1_1_g
	P_ADD		rotz,10
	P_LOOP		30,.c1_1_g
	P_EXPLODE
.c1_1_e
	P_REMOVE
	P_END

;---------------------------------------------------------------------
;use set pos
;same as chase1_1

	START_PATH	chase1_2

	P_LINK
	P_SPACESHIP		ON
	P_GOSUB		chase_init
	P_ZREMOVE	OFF
.c1_2_0
	P_WAIT		12

	P_SHAPEDEAD		.c1_2_z


	P_SET		roty,DEG90

	P_SETVEL		30

	P_WAIT		20
	P_COLLISIONS	ON
	P_ZREMOVE	ON


	P_FIRE

	P_WAIT		15

.c1_2_1
	P_ADD		rotx,-4
	P_ADD		rotz,-1
	P_LOOP		63,.c1_2_1

.c1_2_2
	P_CHASE		rotx,0
	P_CHASE		rotz,0
	P_LOOP		20,.c1_2_2

	P_FIRE
	P_WAIT		8

	P_FIRE

	P_SET		hp,100
	P_WAIT		8

	P_FIRE

	P_WAIT		14
	P_SET		hp,2
.c1_2_4
	P_ADD		rotz,4
	P_LOOP		7,.c1_2_4

	P_WAIT		20

	P_WAITCHASE		rotz,0

	P_ACCEL		60,5

	P_WAITCHASE		rotx,234

	P_IFFLAG		.c1_2_y
	P_WAIT		7

	P_SETVEL		0

	P_GOTO		.c1_2_z

.c1_2_y
	P_SPACESHIP		OFF
	P_WAITCHASE		roty,128
	P_SET		hp,10
	P_GOTOPOS		0,0,600,40
	P_WAITFACEPLAYER
	P_ADD		rotz,16
	P_WAIT		5
	P_ADD		rotz,-32
	P_WAIT		5
	P_ADD		rotz,16
	P_WAIT		5
	P_SMOKE		ON
	P_WAIT		5
	P_SMOKE		OFF

	P_WAITCHASE		roty,64

	P_ACCEL		50,2

	P_WAIT		50

.c1_2_z
	P_REMOVE
	
	P_END

;------------------------------------------------------------------
;x=-900,y=0,z=0,bt=0

	START_PATH	chase2_1

	P_FRIEND
	P_LINK
	P_GOSUB		friend_init
	P_ZREMOVE	OFF

	P_NOTFRIEND		anyone,.c2_1_z

.c2_1_0
	P_CHASE		roty,200
	P_CHASE		rotz,224
	P_LOOP		20,.c2_1_0


	P_NOTFRIEND		falcon,.c2_1_m1
	P_MSG		7,meter		;FALCON SAYS
	P_GOTO		.c2_1_1

.c2_1_m1
	P_NOTFRIEND		rabbit,.c2_1_m2
	P_MSG		27,meter		;RABBIT SAYS
	P_GOTO		.c2_1_1

.c2_1_m2
	P_MSG		47,meter		;FROG SAYS

.c2_1_1
	P_SOUND		1
	P_SETVEL		30

.c2_1_11
	P_WAIT		40

.c2_1_2
	P_CHASE		roty,0
	P_CHASE		rotz,0
	P_LOOP		20,.c2_1_2

	P_SPACESHIP		ON

.c2_1_3
	P_ADD		rotz,1
	P_ADD		rotx,-2
	P_LOOP		15,.c2_1_3

	P_WAIT	1

.c2_1_4
	P_ADD		rotz,-1
	P_ADD		rotx,2
	P_LOOP		15,.c2_1_4

	P_WAIT	1
	P_ACCEL	40,1
.c2_1_5
	P_ADD		rotz,1
	P_ADD		rotx,2
	P_LOOP		24,.c2_1_5
;;;;;;
	P_ALMOSTDEAD	.c2_1_ta		;FRIEND DEAD


	P_NOTFRIEND		falcon,.c2_1_tm1
	P_MSG		69,meter
	P_IGOTO		.c2_1_tm3
.c2_1_tm1
	P_NOTFRIEND		rabbit,.c2_1_tm2
	P_MSG		70,meter
	P_IGOTO		.c2_1_tm3
.c2_1_tm2
	P_MSG		71,meter

;;;;;;
.c2_1_tm3
	P_DAMAGE
	P_WAIT	3
	P_ACCEL	30,1
.c2_1_6
	P_CHASE		rotz,0
	P_CHASE		rotx,245
	P_LOOP		20,.c2_1_6

	P_WAIT	4

	P_ADD		rotz,-13
.c2_1_61
	P_WAIT		21

	P_ADD		rotz,13

	P_WAIT	4

.c2_1_7
	P_ADD		rotx,-6
	P_LOOP		18,.c2_1_7

	P_SPACESHIP		OFF

	P_WAIT	5

.c2_1_8
	P_ADD		rotz,-8
	P_LOOP		15,.c2_1_8

	P_TRIGGER		save,OFF

	P_ALMOSTDEAD	.c2_1_a		;FRIEND DEAD


	P_NOTFRIEND		falcon,.c2_1_8a
	P_MSG		15,meter
	P_GOTO		.c2_1_8c
.c2_1_8a
	P_NOTFRIEND		rabbit,.c2_1_8b
	P_MSG		35,meter
	P_GOTO		.c2_1_8c
.c2_1_8b
	P_MSG		55,meter

.c2_1_8c
	P_DAMAGE
	P_ACCEL		50,2

	P_WAITCHASE		rotx,192

	P_SETVEL		0

	P_GOTO		.c2_1_z

;---- friend dead -------
.c2_1_ta
	P_TRIGGER		save,OFF
	P_TRIGGER		yamete,OFF
	P_FLAGSHAPE

	P_SPACESHIP		OFF

	P_SMOKE		ON

	P_SETVEL		10

	P_NOTFRIEND		falcon,.c2_1_tm5
	P_MSG		9,meter		;FALCON SAYS
	P_GOTO		.c2_1_tj

.c2_1_tm5
	P_NOTFRIEND		rabbit,.c2_1_tm6
	P_MSG		29,meter		;RABBIT SAYS
	P_GOTO		.c2_1_tj

.c2_1_tm6
	P_MSG		49,meter		;FROG SAYS

.c2_1_tj
	P_DAMAGE
	P_WAITCHASE		roty,256-64
	P_WAITCHASE		rotx,256-32

	P_SETVEL		30

	P_DO		10
	P_ADD		rotz,8
	P_NEXT

	P_EXPLODE

;------------------------
.c2_1_a
	P_TRIGGER		yamete,OFF

	P_FLAGSHAPE

	P_ACCEL		0,1

	P_SMOKE		ON
	P_WAIT		4
	P_SMOKE		OFF

	P_ADD		rotz,16
	P_WAIT		5
	P_ADD		rotz,-32
	P_WAIT		5
	P_ADD		rotz,16
	P_WAIT		5

.c2_1_g
	P_CHASE		roty,128
	P_CHASE		rotx,128
	P_LOOP		15,.c2_1_g

	P_NOTFRIEND		falcon,.c2_1_m5
	P_MSG		9,meter		;FALCON SAYS
	P_GOTO		.c2_1_j

.c2_1_m5
	P_NOTFRIEND		rabbit,.c2_1_m6
	P_MSG		29,meter		;RABBIT SAYS
	P_GOTO		.c2_1_j

.c2_1_m6
	P_MSG		49,meter		;FROG SAYS
	P_WAIT		2

.c2_1_j
	P_DAMAGE
	P_WAITCHASE		vel,-16

.c2_1_h
	P_ADD		rotz,10
	P_ADD		worldy,4
	P_ADD		worldx,-6
	P_LOOP		37,.c2_1_h

	P_SMOKE		ON
.c2_1_i
	P_ADD		rotz,10
	P_ADD		worldy,4
	P_ADD		worldx,-6
	P_LOOP		18,.c2_1_i

	P_EXPLODE

.c2_1_z
	P_REMOVE

	P_END
;------------------------------------------------------------------
;use set pos
;same as chase2_1

	START_PATH	chase2_2

	P_LINK
	P_GOSUB		chase_init
	P_ZREMOVE	OFF
.c2_2_02
	P_WAIT		12

	P_SHAPEDEAD		.c2_2_z

.c2_2_0
	P_CHASE		roty,200
	P_CHASE		rotz,224
	P_LOOP		10,.c2_2_0

	P_FIRE

.c2_2_a
	P_CHASE		roty,200
	P_CHASE		rotz,224
	P_LOOP		9,.c2_2_a

	P_SETVEL		30

	P_COLLISIONS	ON
	P_WAIT		40

.c2_2_1
	P_CHASE		roty,0
	P_CHASE		rotz,0
	P_LOOP		20,.c2_2_1

	P_SPACESHIP		ON

	P_FIRE

.c2_2_2
	P_ADD		rotz,1
	P_ADD		rotx,-2
	P_LOOP		15,.c2_2_2

	P_FIRE

	P_WAIT		1

.c2_2_3
	P_ADD		rotz,-1
	P_ADD		rotx,2
	P_LOOP		15,.c2_2_3

	P_FIRE

	P_WAIT		1

	P_ACCEL		40,1

.c2_2_4
	P_ADD		rotz,1
	P_ADD		rotx,2
	P_LOOP		24,.c2_2_4

	P_WAIT		3
	P_ACCEL		30,1

	P_FIRE

	P_IFFLAG		.c2_2_lea
.c2_2_5
	P_CHASE		rotz,0
	P_CHASE		rotx,245
	P_LOOP		20,.c2_2_5

	P_FIRE

	P_WAIT		4

	P_ADD		rotz,-13

	P_WAIT		21

	P_ADD		rotz,13

	P_WAIT		4

.c2_2_6
	P_ADD		rotx,-6
	P_LOOP		18,.c2_2_6

	P_FIRE

	P_SPACESHIP		OFF

	P_WAIT		8

	P_FIRE
	
.c2_2_9
	P_ADD		rotz,-8
	P_LOOP		15,.c2_2_9

	P_ACCEL		50,2

	P_WAIT		5

	P_WAITCHASE		rotx,192

	P_SETVEL		0

	P_IFFLAG		.c2_2_y

	P_GOTO		.c2_2_z

.c2_2_y
	P_SET		rotz,0
	P_SET		rotx,64
	P_SET		roty,128
	P_SET		worldx,0
	P_SET		worldy,-1100

	P_SETVEL		50

.c2_2_w
	P_IFBETWEEN		-450,worldy,200,.c2_2_x
	P_GOTO		.c2_2_w

.c2_2_x
	P_SET		hp,10
	P_ACCEL		0,1
	P_WAITCHASE		rotx,0

	P_SETVEL		0

	P_SPACESHIP		ON

	P_WAITCHASE		rotz,28
	P_WAITCHASE		rotz,0

	P_SMOKE		ON
	P_WAITCHASE		rotx,250
	P_ACCEL		70,2
	P_SMOKE		OFF
	P_WAIT		8
	P_WAITCHASE		rotx,192

	P_WAIT		20

.c2_2_z
	P_REMOVE

	P_END

.c2_2_lea
	P_WAIT		30
	P_RELTOPLAYER	OFF
	P_WAIT		10
	P_REMOVE
	P_END

;------------------------------------------------------------------
;use set pos
;x=0,y=400,z=0,bt=0

	START_PATH		chase3_1

	P_FRIEND
	P_LINK
	P_GOSUB		friend_init
	P_ZREMOVE	OFF
	P_SPACESHIP		ON
	P_SOUND		1

	P_NOTFRIEND		anyone,.c3_1_z

.c3_1_0
	P_ADD		rotx,-32
	P_SETVEL		30

	P_NOTFRIEND		falcon,.c3_1_m1
	P_MSG		7,meter		;FALCON SAYS HELP!
	P_GOTO		.c3_1_1
.c3_1_m1
	P_NOTFRIEND		rabbit,.c3_1_m2
	P_MSG		27,meter		;RABBIT SAYS HELP!
	P_GOTO		.c3_1_1
.c3_1_m2
	P_MSG		47,meter		;FROG SAYS HELP!

.c3_1_1
	P_CHASE		rotx,0
	P_CHASE		worldx,0
	P_CHASE		worldy,-60
	P_LOOP		20,.c3_1_1

.c3_1_11
	P_WAIT		20

.c3_1_s
	P_ABOVEPLAYER	.c3_1_a
.c3_1_b
	P_RIGHTOFPLAYER	.c3_1_br
	P_GOTO		.c3_1_bl
.c3_1_a
	P_RIGHTOFPLAYER	.c3_1_ar
	P_GOTO		.c3_1_al

.c3_1_ar
	P_PUSH		pbyte1
	P_SET		pbyte1,1
	P_EXPORT		ebyte2,pbyte1
	P_PULL		pbyte1
	P_WAITCHASE		rotz,242
	P_WAITCHASE		rotz,0


.c3_1_ar1
	P_ADD		rotx,-4
	P_LOOP		31,.c3_1_ar1
	P_SET		rotx,128

.c3_1_ar2
	P_IFBETWEEN		-100,worldx,300,.c3_1_ar3
	P_GOTO		.c3_1_ar2
.c3_1_ar3
	P_ALMOSTDEAD	.c3_1_td
	P_GOSUB		.c3_tyame
	P_DAMAGE

	P_WAITCHASE		rotz,14
	P_WAITCHASE		rotz,0
.c3_1_ar33
	P_WAIT		10
.c3_1_ar4
	P_ADD		rotx,-4
	P_LOOP		31,.c3_1_ar4

	P_GOTO		.c3_1_e


.c3_1_al
	P_PUSH		pbyte1
	P_SET		pbyte1,2
	P_EXPORT		ebyte2,pbyte1
	P_PULL		pbyte1
	P_WAITCHASE		rotz,14
	P_WAITCHASE		rotz,0

.c3_1_al1
	P_ADD		rotx,-4
	P_LOOP		31,.c3_1_al1
	P_SET		rotx,128

.c3_1_al2
	P_IFBETWEEN		-300,worldx,100,.c3_1_al3
	P_GOTO		.c3_1_al2
.c3_1_al3
	P_ALMOSTDEAD	.c3_1_td
	P_GOSUB		.c3_tyame
	P_DAMAGE

	P_WAITCHASE		rotz,242
	P_WAITCHASE		rotz,0
.c3_1_al33
	P_WAIT		10

.c3_1_al4
	P_ADD		rotx,-4
	P_LOOP		31,.c3_1_al4

	P_GOTO		.c3_1_e

.c3_1_br
	P_PUSH		pbyte1
	P_SET		pbyte1,3
	P_EXPORT		ebyte2,pbyte1
	P_PULL		pbyte1
	P_WAITCHASE		rotz,242
	P_WAITCHASE		rotz,0

	P_SPACESHIP		OFF

.c3_1_br1
	P_ADD		rotx,4
	P_CHASE		rotz,128
	P_LOOP		31,.c3_1_br1

.c3_1_br2
	P_IFBETWEEN		-100,worldx,200,.c3_1_br3
	P_GOTO		.c3_1_br2
.c3_1_br3
	P_ALMOSTDEAD	.c3_1_td
	P_GOSUB		.c3_tyame
	P_DAMAGE

	P_WAITCHASE		roty,0
.c3_1_br33
	P_WAIT		9
.c3_1_br4
	P_ADD		rotx,4
	P_CHASE		rotz,0
	P_LOOP		31,.c3_1_br4

	P_SPACESHIP		ON

	P_WAITCHASE		worldx,0

	P_GOTO		.c3_1_f
.c3_1_bl
	P_PUSH		pbyte1
	P_SET		pbyte1,4
	P_EXPORT		ebyte2,pbyte1
	P_PULL		pbyte1
	P_WAITCHASE		rotz,14
	P_WAITCHASE		rotz,0

	P_SPACESHIP		OFF

.c3_1_bl1
	P_ADD		rotx,4
	P_CHASE		rotz,128
	P_LOOP		31,.c3_1_bl1

.c3_1_bl2
	P_IFBETWEEN		-200,worldx,100,.c3_1_bl3
	P_GOTO		.c3_1_bl2
.c3_1_bl3
	P_ALMOSTDEAD	.c3_1_td
	P_GOSUB		.c3_tyame
	P_DAMAGE

	P_WAITCHASE		roty,0
.c3_1_bl33
	P_WAIT		9
.c3_1_bl4
	P_ADD		rotx,4
	P_CHASE		rotz,0
	P_LOOP		31,.c3_1_bl4

	P_SPACESHIP		ON

	P_WAITCHASE		worldx,0
	P_WAITCHASE		worldy,-60
	P_GOTO		.c3_1_f

.c3_1_e
	P_WAITCHASE		worldx,0
	P_WAITCHASE		worldy,-60
.c3_1_ee
	P_WAIT		10

.c3_1_f
	P_WAIT		10
	P_TRIGGER		save,OFF

	P_ALMOSTDEAD	.c3_1_4

	P_WAIT		10

	P_NOTFRIEND		falcon,.c3_1_2a
	P_MSG		15,meter
	P_GOTO		.c3_1_2c
.c3_1_2a
	P_NOTFRIEND		rabbit,.c3_1_2b
	P_MSG		35,meter
	P_GOTO		.c3_1_2c
.c3_1_2b
	P_MSG		55,meter
.c3_1_2c
	P_DAMAGE
	P_GOTO		.c3_1_y

;------- friend dead -------
.c3_1_4
	P_FLAGSHAPE
	P_TRIGGER		yamete,OFF
	P_WAIT		7
	P_SMOKE		ON
	P_WAIT		4
	P_SMOKE		OFF

	P_SPACESHIP		OFF

	P_NOTFRIEND		falcon,.c3_1_m5
	P_MSG		9,meter		;FALCON SAYS
	P_GOTO		.c3_1_8

.c3_1_m5
	P_NOTFRIEND		rabbit,.c3_1_m6
	P_MSG		29,meter		;RABBIT SAYS
	P_GOTO		.c3_1_8

.c3_1_m6
	P_MSG		49,meter		;FROG SAYS


.c3_1_8
	P_DAMAGE
	P_ADD		rotz,10
	P_CHASE		vel,-14
	P_ADD		worldy,1
	P_LOOP		50,.c3_1_8

	P_SMOKE		ON
.c3_1_9
	P_ADD		rotz,10
	P_ADD		worldy,2
	P_LOOP		30,.c3_1_9

	P_EXPLODE
;---------------------------
.c3_1_y
	P_ACCEL		70,1
	P_WAITCHASE		rotx,192
.c3_1_z
	P_REMOVE

	P_END

.c3_tyame
	P_NOTFRIEND		falcon,.c3_m_t1
	P_MSG		69,meter
	P_RETURN
.c3_m_t1
	P_NOTFRIEND		rabbit,.c3_m_t2
	P_MSG		70,meter
	P_RETURN
.c3_m_t2
	P_MSG		71,meter
	P_RETURN

.c3_1_td
	P_FLAGSHAPE
	P_TRIGGER		save,OFF
	P_TRIGGER		yamete,OFF
	P_SPACESHIP		OFF
	P_SETVEL		0

	P_SMOKE		ON

	P_NOTFRIEND		falcon,.c3_1_tm5
	P_MSG		9,meter		;FALCON SAYS
	P_IGOTO		.c3_1_td1

.c3_1_tm5
	P_NOTFRIEND		rabbit,.c3_1_tm6
	P_MSG		29,meter		;RABBIT SAYS
	P_IGOTO		.c3_1_td1

.c3_1_tm6
	P_MSG		49,meter		;FROG SAYS

.c3_1_td1
	P_DAMAGE
	P_ADD		worldz,-20
	P_CHASE		rotx,0
	P_CHASE		roty,0
	P_ADD		rotz,8
	P_ABOVEPLAYER	.c3_d
	P_ADD		worldy,-10
	P_IGOTO		.c3_x
.c3_d
	P_ADD		worldy,10
.c3_x
	P_LEFTOFPLAYER	.c3_r
	P_ADD		worldx,-10
	P_IGOTO		.c3_lo
.c3_r
	P_ADD		worldx,10
.c3_lo
	P_LOOP		60,.c3_1_td1

	P_EXPLODE

	P_END

;------------------------------------------------------------------
;use set pos
;same as chase3_1

	START_PATH		chase3_2

	P_LINK
	P_SPACESHIP		ON
	P_SET		pbyte2,0
	P_GOSUB		chase_init
	P_ZREMOVE	OFF

.c3_2_0
	P_ADD		rotx,-32
	P_WAIT		12
	P_SHAPEDEAD		.c3_2_z

	P_SETVEL		30
	P_COLLISIONS	ON

.c3_2_1
	P_CHASE		rotx,0
	P_CHASE		worldx,0
	P_CHASE		worldy,-60
	P_LOOP		20,.c3_2_1

	P_WAIT		20

.c3_2_s
	P_IMPORT		pbyte1,ebyte2
	P_IFSAME		pbyte1,1,.c3_2_ar
	P_IFSAME		pbyte1,2,.c3_2_al
	P_IFSAME		pbyte1,3,.c3_2_br
	P_IFSAME		pbyte1,4,.c3_2_bl
;---- hoken
	P_ABOVEPLAYER	.c3_2_a

.c3_2_b
	P_RIGHTOFPLAYER	.c3_2_br
	P_GOTO		.c3_2_bl

.c3_2_a
	P_RIGHTOFPLAYER	.c3_2_ar
	P_GOTO		.c3_2_al
;---------
.c3_2_ar

	P_FIRE
	P_WAIT		10
	P_WAITCHASE		rotz,242
	P_WAITCHASE		rotz,0


.c3_2_ar0
	P_FIRE

.c3_2_ar1
	P_ADD		rotx,-4
	P_ADD		pbyte2,1
	P_IFNOTSAME		pbyte2,20,.c3_2_ar2g
	P_FIRE
.c3_2_ar2g
	P_LOOP		31,.c3_2_ar1
	P_SET		rotx,128
	P_FIRE

	P_IFFLAG		.c3_2_td
.c3_2_ar2
	P_IFBETWEEN		-100,worldx,300,.c3_2_ar3
	P_GOTO		.c3_2_ar2
.c3_2_ar3
	P_WAITCHASE		rotz,14
	P_WAITCHASE		rotz,0
	P_WAIT		10

.c3_2_ar4
	P_ADD		rotx,-4
	P_LOOP		31,.c3_2_ar4

	P_GOTO		.c3_2_e

.c3_2_al
	P_FIRE
	P_WAIT		10
	P_WAITCHASE		rotz,14
	P_WAITCHASE		rotz,0


.c3_2_al0
	P_FIRE

.c3_2_al1
	P_ADD		rotx,-4
	P_ADD		pbyte2,1
	P_IFNOTSAME		pbyte2,20,.c3_2_al2g
	P_FIRE
.c3_2_al2g
	P_LOOP		31,.c3_2_al1
	P_SET		rotx,128
	P_FIRE

	P_IFFLAG		.c3_2_td
.c3_2_al2
	P_IFBETWEEN		-300,worldx,100,.c3_2_al3
	P_GOTO		.c3_2_al2
.c3_2_al3
	P_WAITCHASE		rotz,242
	P_WAITCHASE		rotz,0
	P_WAIT		10

.c3_2_al4
	P_ADD		rotx,-4
	P_LOOP		31,.c3_2_al4

	P_GOTO		.c3_2_e

.c3_2_br
	P_FIRE
	P_WAIT		9
	P_WAITCHASE		rotz,242
	P_WAITCHASE		rotz,0

.c3_2_br0
	P_SPACESHIP		OFF
	P_FIRE

.c3_2_br1
	P_ADD		rotx,4
	P_CHASE		rotz,128
	P_ADD		pbyte2,1
	P_IFNOTSAME		pbyte2,25,.c3_2_br2g
	P_FIRE
.c3_2_br2g
	P_LOOP		31,.c3_2_br1
	P_FIRE

	P_IFFLAG		.c3_2_td
.c3_2_br2
	P_IFBETWEEN		-100,worldx,200,.c3_2_br3
	P_GOTO		.c3_2_br2
.c3_2_br3
	P_WAITCHASE		roty,0
	P_WAIT		10

.c3_2_br4
	P_ADD		rotx,4
	P_CHASE		rotz,0
	P_LOOP		31,.c3_2_br4

	P_SPACESHIP		ON

	P_GOTO		.c3_2_e

.c3_2_bl
	P_FIRE
	P_WAIT		10
	P_WAITCHASE		rotz,14
	P_WAITCHASE		rotz,0

.c3_2_bl0
	P_FIRE
	P_SPACESHIP		OFF

.c3_2_bl1
	P_ADD		rotx,4
	P_CHASE		rotz,128
	P_ADD		pbyte2,1
	P_IFNOTSAME		pbyte2,25,.c3_2_bl2g
	P_FIRE
.c3_2_bl2g
	P_LOOP		31,.c3_2_bl1
	P_FIRE

	P_IFFLAG		.c3_2_td
.c3_2_bl2
	P_IFBETWEEN		-200,worldx,100,.c3_2_bl3
	P_GOTO		.c3_2_bl2
.c3_2_bl3
	P_WAITCHASE		roty,0
	P_WAIT		10

.c3_2_bl4
	P_ADD		rotx,4
	P_CHASE		rotz,0
	P_LOOP		31,.c3_2_bl4

	P_SPACESHIP		ON

.c3_2_e
	P_FIRE
	P_WAIT		25
	P_ACCEL		70,1
	P_WAITCHASE		rotx,192
	P_IFFLAG		.c3_2_td
	P_WAIT		10
.c3_2_z
	P_REMOVE

	P_END
.c3_2_td
	P_GOTOPOS		0,0,600,40

	P_WAITFACEPLAYER

	P_SMOKE		ON
	P_WAIT		4
	P_SMOKE		OFF

	P_FIRE

	P_RELTOPLAYER	OFF
	P_ZREMOVE		ON

	P_END
;------------------------------------------------------------------
;use pos
;x=900,y=-60,z=0,bt=0

	START_PATH		chase4_1

	P_FRIEND
	P_LINK
	P_GOSUB		friend_inib
	P_ZREMOVE	OFF

	P_NOTFRIEND		anyone,.c4_1_z

.c4_1_0
	P_CHASE		roty,56
	P_CHASE		rotz,224
	P_LOOP		20,.c4_1_0

	P_NOTFRIEND		falcon,.c4_1_a1
	P_MSG		13
	P_IGOTO		.c4_1_a3
.c4_1_a1
	P_NOTFRIEND		rabbit,.c4_1_a2
	P_MSG		33
	P_IGOTO		.c4_1_a3
.c4_1_a2
	P_MSG		50
.c4_1_a3
	P_WAIT		20
	P_SOUND		1
	P_SETVEL		40
.c4_1_aa
	P_WAIT		23
	P_ZREMOVE	ON

	P_NOTFRIEND		falcon,.c4_1_a
	P_GOSUB		.c4_fal_ms
	P_GOTO		.c4_1_1
.c4_1_a
	P_NOTFRIEND		rabbit,.c4_1_b
	P_GOSUB		.c4_rab_ms
	P_GOTO		.c4_1_1
.c4_1_b
	P_GOSUB		.c4_fro_ms
.c4_1_1
	P_CHASE		roty,0
	P_CHASE		rotz,0
	P_LOOP		18,.c4_1_1

	P_WAIT		1

	P_SPACESHIP		ON

.c4_1_2
	P_CHASE		rotz,229
	P_CHASE		rotx,32
	P_LOOP		10,.c4_1_2

	P_FIRE		canhit

	P_WAITCHASE		rotz,0
	P_WAITCHASE		rotx,0

.c4_1_3
	P_ADD		rotx,-4
	P_LOOP		32,.c4_1_3

	P_SHAPEDEAD		.c4_1_6

	P_NOTFRIEND		falcon,.c4_1_m1
	P_GOSUB		.c4_fal_ms
	P_IGOTO		.c4_1_4
.c4_1_m1
	P_NOTFRIEND		rabbit,.c4_1_m3
	P_GOSUB		.c4_rab_ms
	P_IGOTO		.c4_1_4
.c4_1_m3
	P_GOSUB		.c4_fro_ms

	P_IGOTO		.c4_1_4
;------ shape dead ---------
.c4_1_6
	P_NOTFRIEND		falcon,.c4_1_m5
	P_MSG		22		;FALCON 1
	P_GOTO		.c4_1_8
.c4_1_m5
	P_NOTFRIEND		rabbit,.c4_1_m7
	P_MSG		42		;RABBIT 1
	P_GOTO		.c4_1_8
.c4_1_m7
	P_MSG		61		;FROG
.c4_1_8
	P_WAIT		12

	P_GOTO		.c4_1_7
;------ shape alive --------
.c4_1_4
	P_FIRE		canhit
	P_WAIT		8
.c4_1_7
	P_WAITCHASE		rotz,16
	P_WAITCHASE		rotz,0

	P_ACCEL		30,1
	P_SPACESHIP		OFF

.c4_1_5
	P_ADD		rotx,-1
	P_ADD		rotz,-8
	P_LOOP		31,.c4_1_5

.c4_1_z
	P_REMOVE

	P_END
;---------------------------------
.c4_fal_ms	LOCAL
	P_RANDOMGOTO	.c4_fal_1
	P_RANDOMGOTO	.c4_fal_2
.c4_fal_4
	P_IFSAME		pbyte1,23,.c4_fal_2
	P_MSG		23
	P_SET		pbyte1,23
	P_RETURN
.c4_fal_2
	P_IFSAME		pbyte1,12,.c4_fal_1
	P_MSG		12
	P_SET		pbyte1,12
	P_RETURN
.c4_fal_1
	P_RANDOMGOTO	.c4_fal_3
	P_IFSAME		pbyte1,11,.c4_fal_3
	P_MSG		11
	P_SET		pbyte1,11
	P_RETURN
.c4_fal_3
	P_IFSAME		pbyte1,10,.c4_fal_4
	P_MSG		10
	P_SET		pbyte1,10
	P_RETURN
;---------------------------------
.c4_rab_ms	LOCAL
	P_RANDOMGOTO	.c4_rab_1
	P_RANDOMGOTO	.c4_rab_2
.c4_rab_4
	P_IFSAME		pbyte1,43,.c4_rab_2
	P_MSG		43
	P_SET		pbyte1,43
	P_RETURN
.c4_rab_2
	P_IFSAME		pbyte1,32,.c4_rab_1
	P_MSG		32
	P_SET		pbyte1,32
	P_RETURN
.c4_rab_1
	P_RANDOMGOTO	.c4_rab_3
	P_IFSAME		pbyte1,31,.c4_rab_3
	P_MSG		31
	P_SET		pbyte1,31
	P_RETURN
.c4_rab_3
	P_IFSAME		pbyte1,30,.c4_rab_4
	P_MSG		30
	P_SET		pbyte1,30
	P_RETURN
;---------------------------------
.c4_fro_ms	LOCAL
	P_RANDOMGOTO	.c4_fro_1
	P_RANDOMGOTO	.c4_fro_2
.c4_fro_4
	P_IFSAME		pbyte1,62,.c4_fro_2
	P_MSG		62
	P_SET		pbyte1,62
	P_RETURN
.c4_fro_2
	P_IFSAME		pbyte1,53,.c4_fro_1
	P_MSG		53
	P_SET		pbyte1,53
	P_RETURN
.c4_fro_1
	P_RANDOMGOTO	.c4_fro_3
	P_IFSAME		pbyte1,52,.c4_fro_3
	P_MSG		52
	P_SET		pbyte1,52
	P_RETURN
.c4_fro_3
	P_IFSAME		pbyte1,51,.c4_fro_4
	P_MSG		51
	P_SET		pbyte1,51
	P_RETURN
;------------------------------------------------------------------
;use set pos
;same as chase4_1

	START_PATH		chase4_2

	P_LINK
	P_WEAPON		RelSlowElaser
	P_SETANIM		3
	P_RELTOPLAYER	ON
	P_ALWAYSGENVECS	ON
	P_ZREMOVE	OFF
	P_SET		hp,6

.c4_2_0
	P_CHASE		roty,56
	P_CHASE		rotz,224
	P_LOOP		20,.c4_2_0

	P_SHAPEDEAD		.c4_2_z

	P_SETVEL		40

	P_WAIT		23
.c4_2_1
	P_CHASE		roty,0
	P_CHASE		rotz,0
	P_LOOP		18,.c4_2_1

	P_WAIT		1

	P_SPACESHIP		ON

	P_WAIT		1

	P_ACCEL		0,2

	P_WAITCHASE		rotx,224


	P_WAITCHASE		rotz,28
	P_WAITCHASE		rotz,0

	P_SETVEL		0

.c4_2_4
	P_CHASE		rotx,19
	P_CHASE		roty,138
	P_LOOP		10,.c4_2_4

	P_FIRE
	P_ADD		worldy,1
	P_WAIT		1
	P_ADD		worldy,1
	P_WAIT		1
	P_DO		4
	P_ADD		worldy,3
	P_NEXT
	P_WAIT		1
	P_ADD		worldy,1
	P_WAIT		1
	
	P_WAITCHASE		roty,140
	P_FIRE
	P_ADD		worldy,1
	P_WAIT		5

	P_DO		3
	P_ADD		worldy,-1
	P_NEXT
	P_WAIT		1

	P_WAITCHASE		roty,136
	P_FIRE

	P_DO		4
	P_ADD		worldy,-1
	P_NEXT

	P_WAIT		7

	P_SETVEL		10

	P_SMOKE		ON
	P_WAIT		4
	P_SMOKE		OFF

	P_ALWAYSGENVECS	OFF

.c4_2_y
	P_ADD		rotz,10
	P_ADD		rotx,10
	P_ADD		worldx,10
	P_ADD		worldy,5
	P_LOOP		15,.c4_2_y

	P_SMOKE		ON
.c4_2_w
	P_ADD		rotz,10
	P_ADD		rotx,10
	P_ADD		worldx,10
	P_ADD		worldy,5
	P_LOOP		15,.c4_2_w

	P_EXPLODE

.c4_2_z
	P_REMOVE
	P_END
;--------------------------------------------------------------------
;use set pos
;same as chase4_1

	START_PATH		chase4_3

	P_SETANIM		3
	P_WEAPON		RelSlowElaser
	P_RELTOPLAYER	ON
	P_ALWAYSGENVECS	ON
	P_ZREMOVE	OFF
	P_FINDSHAPE		zaco_b
	P_IMMUNE

	P_FINDSHAPE		friendship_4

	P_WAIT		3

	P_SHAPEDEAD		.c4_3_z

.c4_3_0
	P_CHASE		roty,56
	P_CHASE		rotz,224
	P_LOOP		20,.c4_3_0

	P_SETVEL		40

	P_WAIT		23

.c4_3_1
	P_CHASE		roty,0
	P_CHASE		rotz,0
	P_LOOP		18,.c4_3_1

	P_WAIT		1

	P_SPACESHIP		ON


.c4_3_2
	P_CHASE		rotz,229
	P_CHASE		rotx,32
	P_LOOP		10,.c4_3_2

	P_ALWAYSGENVECS	OFF

	P_WAITCHASE		rotz,0

	P_WAIT		4
	P_EXPLODE

.c4_3_z
	P_REMOVE

	P_END
;------------------------------------------------------------------
;use set pos
;x=0,y=-600,z=0,bt=0

	START_PATH	chase5_1

	P_FRIEND
	P_LINK
	P_GOSUB		friend_inib
	P_SPACESHIP		ON
	P_ZREMOVE		OFF

	P_NOTFRIEND		anyone,.c5_1_z

.c5_1_0
	P_WAIT		18

	P_WAITCHASE		rotx,50

	P_SOUND		1
	P_ACCEL		40,1

	P_NOTFRIEND		falcon,.c5_1_a
	P_MSG		13
	P_GOTO		.c5_1_01
.c5_1_a
	P_NOTFRIEND		rabbit,.c5_1_b
	P_MSG		33
	P_GOTO		.c5_1_01
.c5_1_b
	P_MSG		50
.c5_1_01
	P_WAIT		35

	P_WAITCHASE		rotx,0

	P_ZREMOVE		ON
	P_WAIT		2

	P_WAITCHASE		rotz,13
;	P_FIRE
	P_WAITCHASE		rotz,0

	P_WAIT		1

	P_NOTFRIEND		falcon,.c5_1_m1
	P_GOSUB		pchase4_1.c4_fal_ms
	P_GOTO		.c5_1_1
.c5_1_m1
	P_NOTFRIEND		rabbit,.c5_1_m2
	P_GOSUB		pchase4_1.c4_rab_ms
	P_GOTO		.c5_1_1
.c5_1_m2
	P_GOSUB		pchase4_1.c4_fro_ms
.c5_1_1
	P_ADD		rotx,-4
	P_LOOP		15,.c5_1_1

	P_FIRE		canhit

	P_WAIT		5

	P_ACCEL		10,2
.c5_1_11
	P_WAIT		15

	P_SPACESHIP		OFF
.c5_1_2
	P_ADD		rotx,-8
	P_ADD		rotz,8
	P_LOOP		15,.c5_1_2

	P_ACCEL		40,1
.c5_1_21
	P_WAIT		20

.c5_1_3
	P_ADD		rotx,4
	P_LOOP		15,.c5_1_3

	P_SHAPEDEAD		.c5_1_5

;-------- shape alive --------
	P_NOTFRIEND		falcon,.c5_1_m3
	P_GOSUB		pchase4_1.c4_fal_ms
	P_GOTO		.c5_1_4
.c5_1_m3
	P_NOTFRIEND		rabbit,.c5_1_m4
	P_GOSUB		pchase4_1.c4_rab_ms
	P_GOTO		.c5_1_4
.c5_1_m4
	P_GOSUB		pchase4_1.c4_fro_ms

.c5_1_4
	P_FIRE		canhit

	P_GOTO		.c5_1_6
;-------- shape dead ---------
.c5_1_5
	P_NOTFRIEND		falcon,.c5_1_m5
	P_MSG		22
	P_GOTO		.c5_1_6
.c5_1_m5
	P_NOTFRIEND		rabbit,.c5_1_m6
	P_MSG		42
	P_GOTO		.c5_1_6
.c5_1_m6
	P_MSG		61
;-----------------------------

.c5_1_6
	P_WAIT		2

	P_WAITCHASE		roty,4

	P_WAITCHASE		rotx,130
.c5_1_61
	P_WAIT		40

.c5_1_z
	P_REMOVE

	P_END
;------------------------------------------------------------------
;use set pos
;x=1500,y=100,z=1300
	START_PATH	chase5_2

	P_LINK
	P_WEAPON		RelSlowElaser
	P_SETANIM		3
	P_RELTOPLAYER	ON
	P_ALWAYSGENVECS	ON
	P_ZREMOVE	OFF

	P_WAIT		3
	P_SHAPEDEAD		.c5_2_z
	P_WAIT		90

	P_WAITCHASE		roty,64

	P_SETVEL		40

	P_WAIT		20

	P_ACCEL		0,2

	P_WAIT		20

.c5_2_1
	P_CHASE		roty,110
	P_CHASE		rotx,250
	P_LOOP		20,.c5_2_1

	P_FIRE

	P_ADD		worldy,-1
	P_WAIT		1

	P_ADD		worldy,-1
	P_WAIT		1

	P_DO		4
	P_ADD		worldy,-3
	P_NEXT

	P_WAIT		1

	P_ADD		worldy,-1
	P_WAIT		1

	P_ADD		worldy,-1
	P_WAIT		1

	P_WAITCHASE		roty,112

	P_FIRE

	P_WAIT		4

	P_ADD		worldy,1
	P_WAIT		1

	P_ADD		worldy,1
	P_WAIT		1

	P_ADD		worldy,3
	P_WAIT		1

	P_ADD		worldy,3
	P_WAIT		1


	P_WAITCHASE		roty,114

	P_FIRE

	P_ADD		worldy,3
	P_WAIT		1

	P_ADD		worldy,3
	P_WAIT		1

	P_ADD		worldy,1
	P_WAIT		1

	P_ADD		worldy,1
	P_WAIT		5

	P_SET		hp,200

	P_WAITCHASE		roty,116

	P_FIRE

	P_ADD		worldy,-1
	P_WAIT		1

	P_ADD		worldy,-1
	P_WAIT		1

	P_DO		4
	P_ADD		worldy,-3
	P_NEXT

	P_WAIT		1

	P_ADD		worldy,-1
	P_WAIT		1

	P_ADD		worldy,-1
	P_WAIT		1

	P_WAITCHASE		roty,118

	P_FIRE

	P_WAIT		5

	P_EXPLODE

.c5_2_z
	P_REMOVE

	P_END
;------------------------------------------------------------------
;use set pos
;x=0,y=-600,z=0
	START_PATH	chase5_3

	P_SETANIM		3
	P_WEAPON		RelSlowElaser
	P_RELTOPLAYER	ON
	P_ALWAYSGENVECS	ON
	P_ZREMOVE		OFF
	P_SPACESHIP		ON

	P_FINDSHAPE		friendship_4
	P_IMMUNE

	P_WAIT		3
	P_SHAPEDEAD		.c5_3_z

	P_SET		hp,200
	P_WAITCHASE		rotx,50

	P_ACCEL		40,1

	P_WAIT		35

	P_WAITCHASE		rotx,0

	P_WAIT		2

	P_WAITCHASE		rotz,13
	P_WAITCHASE		rotz,0

	P_WAIT		3

.c5_3_1
	P_ADD		rotx,-4
	P_LOOP		15,.c5_3_1

	P_ACCEL		30,1

	P_WAIT		19

	P_EXPLODE
.c5_3_z
	P_REMOVE

	P_END
;------------------------------------------------------------------
;use set pos
;x=-750,y=-400,z=0,bt=0

	START_PATH	chase6_1

	P_FRIEND
	P_LINK
	P_GOSUB		friend_init
	P_ZREMOVE	OFF

	P_NOTFRIEND		anyone,.c6_1_z

.c6_1_0
	P_WAITCHASE		rotx,35
	P_WAITCHASE		roty,215


	P_NOTFRIEND		falcon,.c6_1_m1
	P_MSG		7,meter
	P_GOTO		.c6_1_6
.c6_1_m1
	P_NOTFRIEND		rabbit,.c6_1_m2
	P_MSG		27,meter
	P_GOTO		.c6_1_6
.c6_1_m2
	P_MSG		47,meter

.c6_1_6
	P_SOUND		1
	P_SETVEL		40

	P_WAIT		3

	P_WAITCHASE		rotx,0
.c6_1_61
	P_WAIT		14

	P_ZREMOVE	ON
	P_SPACESHIP		ON

	P_WAITCHASE		rotz,20

	P_WAITCHASE		rotz,0
.c6_1_62
	P_WAIT		15

	P_ALMOSTDEAD	.c6_td
	P_GOSUB		.c6_tyame
	P_DAMAGE

.c6_1_1
	P_ADD		rotx,-2
	P_ADD		rotz,3
	P_LOOP		15,.c6_1_1

.c6_1_2
	P_ADD		rotx,2
	P_ADD		rotz,-3
	P_LOOP		15,.c6_1_2

.c6_1_21
	P_WAIT		22

.c6_1_3
	P_ADD		rotx,2
	P_ADD		rotz,-4
	P_LOOP		7,.c6_1_3

	P_WAIT		7

.c6_1_4
	P_ADD		rotx,-2
	P_ADD		rotz,4
	P_LOOP		7,.c6_1_4

.c6_1_41
	P_WAIT		25

	P_TRIGGER		save,OFF

	P_ALMOSTDEAD	.c6_1_8

	P_NOTFRIEND		falcon,.c6_1_4a
	P_MSG		15,meter
	P_GOTO		.c6_1_4c
.c6_1_4a
	P_NOTFRIEND		rabbit,.c6_1_4b
	P_MSG		35,meter
	P_GOTO		.c6_1_4c
.c6_1_4b
	P_MSG		55,meter
.c6_1_4c
	P_DAMAGE
	P_WAIT		5
.c6_1_5
	P_ADD		rotz,2
	P_LOOP		8,.c6_1_5

	P_WAITCHASE		rotz,0

	P_ACCEL		70,2

	P_WAITCHASE		rotx,-8

.c6_1_51
	P_WAIT		30

	P_GOTO		.c6_1_z
;----- friend dead ---------------
.c6_1_8
	P_TRIGGER		yamete,OFF
	P_WAIT		8
	P_NOTFRIEND		falcon,.c6_1_m3
	P_MSG		9,meter
	P_GOTO		.c6_1_e
.c6_1_m3
	P_NOTFRIEND		rabbit,.c6_1_m4
	P_MSG		29,meter
	P_GOTO		.c6_1_e
.c6_1_m4
	P_MSG		49,meter

.c6_1_e
	P_ACCEL		0,1

	P_DAMAGE

	P_SMOKE		ON
	P_WAIT		4
	P_SMOKE		OFF

	P_SPACESHIP		OFF

.c6_1_9
	P_ADD		worldy,8
	P_ADD		roty,-6
	P_ADD		rotz,-10
	P_HITGROUND		0,.c6_1_a
	P_GOTO		.c6_1_9

	
.c6_1_a
	P_SMOKE		ON
.c6_1_b
	P_CHASE		roty,0
	P_ADD		rotz,-10
	P_ADD		worldy,-4
	P_LOOP		20,.c6_1_b

	P_WAITCHASE		vel,-18

.c6_1_c
	P_ADD		rotz,-10
	P_ADD		worldy,4
	P_HITGROUND		0,.c6_1_d
	P_GOTO		.c6_1_c

.c6_1_d
	P_EXPLODE


.c6_1_z
	P_REMOVE

	P_END


.c6_tyame
	P_NOTFRIEND		falcon,.c6_m_t1
	P_MSG		69,meter
	P_RETURN
.c6_m_t1
	P_NOTFRIEND		rabbit,.c6_m_t2
	P_MSG		70,meter
	P_RETURN
.c6_m_t2
	P_MSG		71,meter
	P_RETURN

.c6_td
	P_TRIGGER		save,OFF
	P_TRIGGER		yamete,OFF

	P_SMOKE		ON

	P_NOTFRIEND		falcon,.c6_1_tm5
	P_MSG		9,meter		;FALCON SAYS
	P_IGOTO		.c6_1_td1

.c6_1_tm5
	P_NOTFRIEND		rabbit,.c6_1_tm6
	P_MSG		29,meter		;RABBIT SAYS
	P_IGOTO		.c6_1_td1

.c6_1_tm6
	P_MSG		49,meter		;FROG SAYS

.c6_1_td1
	P_DAMAGE
	P_ADD		rotx,-2
	P_ADD		rotz,3
	P_ADD		worldy,8
	P_LOOP		15,.c6_1_td1

.c6_1_td2
	P_ADD		rotx,2
	P_ADD		rotz,-3
	P_ADD		worldy,8
	P_LOOP		15,.c6_1_td2

	P_EXPLODE

	P_END
	
;------------------------------------------------------------------
;use set pos
;x=-720,y=-400,z=0

	START_PATH	chase6_2

	P_LINK
	P_GOSUB		chase_init
	P_ZREMOVE	OFF

.c6_2_0
	P_WAIT		3

	P_SHAPEDEAD		.c6_2_z

	P_WAITCHASE		rotx,35
	P_WAITCHASE		roty,215

	P_WAIT		12

	P_SETVEL		40
	P_COLLISIONS	ON

	P_WAIT		3

	P_WAITCHASE		rotx,0

	P_FIRE

	P_WAIT		14

	P_ZREMOVE	ON
	P_SPACESHIP		ON

	P_WAITCHASE		rotz,20

	P_WAITCHASE		rotz,0

	P_FIRE
	P_WAIT		5
	P_FIRE
	P_WAIT		10

.c6_2_1
	P_ADD		rotx,-2
	P_ADD		rotz,3
	P_LOOP		15,.c6_2_1

.c6_2_2
	P_ADD		rotx,2
	P_ADD		rotz,-3
	P_LOOP		15,.c6_2_2

	P_FIRE
	P_WAIT		6
	P_SHAPEDEAD		.c6_2_td
	P_FIRE
	P_WAIT		16


.c6_2_3
	P_ADD		rotx,2
	P_ADD		rotz,-4
	P_LOOP		7,.c6_2_3

	P_WAIT		7

.c6_2_4
	P_ADD		rotx,-2
	P_ADD		rotz,4
	P_LOOP		7,.c6_2_4


	P_FACESHAPE
	P_FIRE

	P_WAIT		25
.c6_2_5
	P_ADD		rotz,2
	P_ADD		rotx,-1
	P_LOOP		8,.c6_2_5

	P_WAITCHASE		rotz,0

	P_ACCEL		70,2

	P_WAITCHASE		rotx,-32

.c6_2_z
	P_REMOVE

	P_END

.c6_2_td

	P_GOTOPOS		0,-80,800,40

	P_WAITFACEPLAYER

	P_FIRE

	P_ACCEL		40,2

	P_ZREMOVE		ON

	P_WAITCHASE		rotx,0

	P_WAIT		60

	P_REMOVE

	P_END
;------------------------------------------------------------------
;use set pos
;x=0,y=-400,z=-150,bt=0

	START_PATH	chase7_1

	P_FRIEND
	P_LINK
	P_GOSUB		friend_init
	P_ZREMOVE		OFF

	P_NOTFRIEND		anyone,.c7_1_zz

.c7_1_0
	P_NOTFRIEND		falcon,.c7_1_m1
	P_MSG		7,meter
	P_IGOTO		.c7_1_1
.c7_1_m1
	P_NOTFRIEND		rabbit,.c7_1_m2
	P_MSG		27,meter
	P_IGOTO		.c7_1_1
.c7_1_m2
	P_MSG		47,meter

.c7_1_1
	P_SOUND		1
	P_SETVEL		50

	P_WAIT		4

	P_SET		rotx,32

	P_WAIT		2

	P_WAITCHASE		rotx,0
.c7_1_11
	P_WAIT		15
	P_ZREMOVE	ON

.c7_1_2
	P_ADD		rotx,-8
	P_LOOP		7,.c7_1_2

	P_WAIT		1

	P_ACCEL		10,1

	P_WAITCHASE		roty,32

	P_WAITCHASE		rotx,128

	P_WAIT		5

	P_ALMOSTDEAD	.c7_td
	P_GOSUB		.c7_tyame
	P_DAMAGE

	P_ACCEL		50,2

.c7_1_3
	P_CHASE		rotx,64
	P_CHASE		roty,112
	P_LOOP		15,.c7_1_3

.c7_1_4
	P_WAIT		1
	P_IFBETWEEN		-420,worldy,0,.c7_1_5
	P_GOTO		.c7_1_4
.c7_1_5
	P_ADD		rotx,-8
	P_LOOP		11,.c7_1_5

	P_WAIT		5

	P_WAITCHASE		rotx,0

	P_SPACESHIP		ON

	P_ACCEL		40,1

.c7_1_6
	P_CHASE		rotz,32
	P_CHASE		rotx,5
	P_LOOP		20,.c7_1_6

	P_WAITCHASE		rotz,0
	P_WAITCHASE		rotx,0

.c7_1_61
	P_WAIT		16

	P_TRIGGER		save,OFF

	P_ALMOSTDEAD	.c7_1_9


	P_NOTFRIEND		falcon,.c7_1_6a
	P_MSG		15,meter
	P_GOTO		.c7_1_6c
.c7_1_6a
	P_NOTFRIEND		rabbit,.c7_1_6b
	P_MSG		35,meter
	P_GOTO		.c7_1_6c
.c7_1_6b
	P_MSG		55,meter
.c7_1_6c
	P_DAMAGE
	P_WAITCHASE		rotz,240

	P_WAITCHASE		rotz,0

.c7_1_6d
	P_WAIT		30

	P_GOTO		.c7_1_z
;------ friend dead ------------

.c7_1_9
	P_TRIGGER		yamete,OFF
	P_WAIT		8

	P_NOTFRIEND		falcon,.c7_1_m5
	P_MSG		9,meter
	P_GOTO		.c7_1_h
.c7_1_m5
	P_NOTFRIEND		rabbit,.c7_1_m6
	P_MSG		29,meter
	P_GOTO		.c7_1_h
.c7_1_m6
	P_MSG		49,meter

.c7_1_h
	P_DAMAGE
	P_SETVEL		-19

	P_SMOKE		ON
	P_WAIT		4
	P_SMOKE		OFF

	P_SPACESHIP		OFF

.c7_1_i
	P_ADD		worldy,8
	P_CHASE		roty,0
	P_ADD		rotz,-10
	P_HITGROUND		0,.c7_1_j
	P_GOTO		.c7_1_i

	
.c7_1_j
	P_SMOKE		ON
.c7_1_k
	P_CHASE		roty,0
	P_ADD		rotz,-10
	P_ADD		worldy,-4
	P_LOOP		20,.c7_1_k

.c7_1_l
	P_ADD		rotz,-10
	P_ADD		worldy,4
	P_HITGROUND		0,.c7_1_m
	P_GOTO		.c7_1_l

.c7_1_m
	P_EXPLODE

;-------------------------------
.c7_1_z
	P_RELTOPLAYER	OFF

	P_WAIT		20

.c7_1_zz
	P_REMOVE
	P_END

.c7_tyame
	P_NOTFRIEND		falcon,.c7_m_t1
	P_MSG		69,meter
	P_RETURN
.c7_m_t1
	P_NOTFRIEND		rabbit,.c7_m_t2
	P_MSG		70,meter
	P_RETURN
.c7_m_t2
	P_MSG		71,meter
	P_RETURN

.c7_td
	P_TRIGGER		save,OFF
	P_TRIGGER		yamete,OFF

	P_SMOKE		ON

	P_NOTFRIEND		falcon,.c7_1_tm5
	P_MSG		9,meter		;FALCON SAYS
	P_IGOTO		.c7_1_td1

.c7_1_tm5
	P_NOTFRIEND		rabbit,.c7_1_tm6
	P_MSG		29,meter		;RABBIT SAYS
	P_IGOTO		.c7_1_td1

.c7_1_tm6
	P_MSG		49,meter		;FROG SAYS

.c7_1_td1
	P_DAMAGE
	P_ACCEL		50,2

.c7_1_td3
	P_CHASE		rotx,64
	P_CHASE		roty,112
	P_LOOP		15,.c7_1_td3

.c7_1_td4
	P_IFBETWEEN		-420,worldy,0,.c7_td5
	P_GOTO		.c7_1_td4

.c7_td5
	P_WAIT		4
	P_EXPLODE

	P_END
	
;------------------------------------------------------------------
;use set pos
;same as chase7_1

	START_PATH	chase7_2

	P_LINK
	P_ZREMOVE		OFF
	P_GOSUB		chase_init

.c7_2_0
	P_WAIT		3
	P_SHAPEDEAD		.c7_2_z

	P_WAIT		10

	P_SETVEL		50
	P_COLLISIONS	ON

	P_WAIT		4

	P_SET		rotx,32

	P_WAIT		2

	P_WAITCHASE		rotx,0

	P_FIRE
	P_ZREMOVE	ON
	P_WAIT		15

.c7_2_1
	P_ADD		rotx,-8
	P_LOOP		7,.c7_2_1

	P_FIRE
	P_WAIT		1

	P_ACCEL		10,1

	P_WAITCHASE		roty,32

	P_WAITCHASE		rotx,128

	P_WAIT		5

	P_ACCEL		50,2

.c7_2_2
	P_CHASE		rotx,64
	P_CHASE		roty,112
	P_LOOP		15,.c7_2_2

	P_FIRE
	P_WAIT		4
	P_FIRE
.c7_2_4
	P_WAIT		1
	P_IFBETWEEN		-420,worldy,0,.c7_2_3
	P_GOTO		.c7_2_4
.c7_2_3
	P_ADD		rotx,-8
	P_LOOP		11,.c7_2_3

	P_WAIT		5

	P_SHAPEDEAD		.c7_2_td

	P_WAITCHASE		rotx,0

	P_FIRE

	P_SPACESHIP		ON

	P_ACCEL		40,1

.c7_2_5
	P_CHASE		rotz,32
	P_CHASE		rotx,5
	P_LOOP		20,.c7_2_5

	P_WAITCHASE		rotz,0
	P_SET		hp,100
	P_FIRE
	P_WAITCHASE		rotx,0

	P_FIRE

	P_WAIT		15

	P_WAITCHASE		rotz,240

	P_WAITCHASE		rotz,0

	P_WAIT		30

.c7_2_z
	P_REMOVE

	P_END

.c7_2_td
	P_ZREMOVE		ON

	P_GOTOPOS		0,-80,700,40

	P_WAITFACEPLAYER

	P_FIRE

	P_ACCEL		40,2

	P_WAITCHASE		rotx,0

	P_WAIT		60

	P_REMOVE

	P_END
;---------------------------------------------------------------------------
;use set pos
;x = 750, y=-100,z = 0

	START_PATH	chase8_1

	P_FRIEND
	P_LINK
	P_GOSUB		friend_inib
	P_TRIGGER		.c8_toru,whenshapedead
	P_SPACESHIP		ON
	P_ZREMOVE	OFF
	P_SET		pbyte1,0

	P_NOTFRIEND		anyone,.c8_1_z

.c8_1_0
	P_WAIT		15

	P_WAITCHASE		roty,42

	P_SOUND		1
	P_SETVEL		40

	P_NOTFRIEND		falcon,.c8_1_a
	P_MSG		13
	P_IGOTO		.c8_1_01
.c8_1_a
	P_NOTFRIEND		rabbit,.c8_1_b
	P_MSG		33
	P_IGOTO		.c8_1_01
.c8_1_b
	P_MSG		50
.c8_1_01
	P_WAIT		25
	P_ZREMOVE	ON

	P_WAITCHASE		rotz,231

	P_WAITCHASE		rotz,0

	P_WAITCHASE		rotz,28

	P_IFSAME		pbyte1,1,.c8_1_1

	P_NOTFRIEND		falcon,.c8_1_m1
	P_ADD		rotz,-5
	P_GOSUB		pchase4_1.c4_fal_ms
	P_IGOTO		.c8_1_1
.c8_1_m1
	P_NOTFRIEND		rabbit,.c8_1_m2
	P_ADD		rotz,-5
	P_GOSUB		pchase4_1.c4_rab_ms
	P_IGOTO		.c8_1_1
.c8_1_m2
	P_GOSUB		pchase4_1.c4_fro_ms

.c8_1_1
	P_WAITCHASE		rotz,0

	P_IFSAME		pbyte1,1,.c8_1_11
	P_FIRE		canhit

.c8_1_11
	P_TRIGGER		.c8_toru,OFF
	P_SET		pbyte1,0
	P_WAIT		12

.c8_1_2
	P_CHASE		rotx,240
	P_CHASE		rotz,33
	P_LOOP		18,.c8_1_2

	P_FINDSHAPE		zaco_a
	P_TRIGGER		.c8_toru,whenshapedead

.c8_1_3
	P_CHASE		rotx,0
	P_CHASE		rotz,0
	P_LOOP		18,.c8_1_3

	P_IFSAME		pbyte1,1,.c8_1_43

	P_NOTFRIEND		falcon,.c8_1_m3
	P_GOSUB		pchase4_1.c4_fal_ms
	P_IGOTO		.c8_1_5
.c8_1_m3
	P_NOTFRIEND		rabbit,.c8_1_m4
	P_GOSUB		pchase4_1.c4_rab_ms
	P_IGOTO		.c8_1_5
.c8_1_m4
	P_GOSUB		pchase4_1.c4_fro_ms
.c8_1_5
	P_FIRE		canhit
	P_SET		pbyte1,1

.c8_1_43
	P_ACCEL		50,1

	P_WAITCHASE		rotz,234

	P_WAITCHASE		rotz,0

.c8_1_44
	P_WAIT		10

.c8_1_z
	P_REMOVE

	P_END
;---------------------------
.c8_toru
	P_IFSAME		pbyte1,0,.c8_toru1
	P_RETURN
.c8_toru1
	P_SET		pbyte1,1

	P_NOTFRIEND		falcon,.c8_toru2
	P_MSG		22
	P_RETURN
.c8_toru2
	P_NOTFRIEND		rabbit,.c8_toru3
	P_MSG		42
	P_RETURN
.c8_toru3
	P_MSG		61
	P_RETURN

;---------------------------------
;---------------------------------------------------------------------------
;x = 3800,y = -3600, z = 4260

	START_PATH	chase8_2

	P_WEAPON		RelSlowElaser
	P_RELTOPLAYER	ON
	P_ALWAYSGENVECS	ON
	P_SET		hp,4

	P_WAIT		3

	P_WAITCHASE		roty,64
	P_WAITCHASE		rotx,32

	P_SETVEL		70

.c8_2_0
	P_IFBETWEEN		-900,worldy,-350,.c8_2_1
	P_WAIT		1
	P_GOTO		.c8_2_0

.c8_2_1
	P_CHASE		rotz,32
	P_CHASE		rotx,0
	P_CHASE		roty,128
	P_LOOP		31,.c8_2_1

	P_ACCEL		0,2

.c8_2_2
	P_CHASE		rotz,0
	P_ADD		worldy,2
	P_LOOP		37,.c8_2_2

	P_FIRE

.c8_2_3
	P_FACEPLAYER
	P_LOOP		2,.c8_2_3

.c8_2_5
	P_FACEPLAYER
	P_LOOP		5,.c8_2_5

	P_FIRE

.c8_2_4
	P_FACEPLAYER
	P_LOOP		7,.c8_2_4

	P_FIRE

	P_FINDSHAPE		friendship_4
	P_SHAPEDEAD		.c8_2_z1
	P_EXPLODE
.c8_2_z1
	P_RELTOPLAYER	OFF
	P_WAIT		20
.c8_2_z
	P_REMOVE

	P_END

;---------------------------------------------------------------------------
;x = 750,y = -100,z = 0

	START_PATH	chase8_3

	P_LINK
	P_WEAPON		RelSlowElaser
	P_RELTOPLAYER	ON
	P_ALWAYSGENVECS	ON
	P_SPACESHIP		ON
	P_SET		hp,4
	P_WAIT		3
	P_SHAPEDEAD		.c8_3_z

	P_WAITCHASE		roty,42

	P_SETVEL		40

	P_WAIT		25

	P_WAITCHASE		rotz,231

	P_WAITCHASE		rotz,0

	P_WAITCHASE		rotz,28

	P_WAITCHASE		rotz,0

	P_WAIT		15

	P_SMOKE		ON
	P_WAIT		5
	P_SMOKE		OFF

	P_SPACESHIP		OFF

.c8_3_x
	P_ADD		rotz,20
	P_ADD		worldy,10
	P_HITGROUND		0,.c8_3_y
	P_GOTO		.c8_3_x

.c8_3_y
	P_EXPLODE

.c8_3_z
	P_REMOVE

	P_END

;---------------------------------------------------------------------------
	START_PATH	patret_irab

	P_GOSUB		ppatret_ifal.patfal_init
	P_GOSUB		ppatret_ifal.inter_sub

	P_ADD		worldz,-1500
	P_SPAWN		0,-300,0,0,128,0,friendship_4,septer_rab,100,1,link
	P_ADD		worldz,1500

	P_IGOTO		ppatret_ifal.inter_tim
;---------------------------------
	START_PATH	patret_ifro

	P_GOSUB		ppatret_ifal.patfal_init
	P_GOSUB		ppatret_ifal.inter_sub

	P_ADD		worldz,-1500
	P_SPAWN		0,-300,0,0,128,0,friendship_4,septer_fro,100,1,link
	P_ADD		worldz,1500

	P_IGOTO		ppatret_ifal.inter_tim
;---------------------------------
	START_PATH	patret_ifal

	P_GOSUB		.patfal_init
	P_GOSUB		.inter_sub

	P_ADD		worldz,-1500
	P_SPAWN		0,-300,0,0,128,0,friendship_4,septer_fal,100,1,link
	P_ADD		worldz,1500

.inter_tim	LOCAL
	P_SET		hp,30
	P_SETVEL		30

	P_WAIT		22

	P_IFFLAG		.inter_con
	P_EXPLODE

.inter_con
	P_WAIT		50

	P_END

;---------------------------------
.patfal_init	LOCAL
	P_RELTOPLAYER	ON
	P_ZREMOVE		OFF
	P_SPACESHIP		ON
	P_ALWAYSGENVECS	ON
	P_WEAPON		ringlaser
	P_SETANIM		3

	P_SET		pbyte1,0
	P_EXPORT		ebyte2,pbyte1

	P_IFLEVEL		1,.patfal_jp
	P_SOUND		3

.patfal_jp
	P_SET		hp,2
	P_SET		ap,8

	P_RETURN

;---------------------------------
.inter_sub	LOCAL
	P_SETVEL		60

	P_WAIT		50

	P_ACCEL		20,2

	P_LEFTOFPLAYER	.inter_0
	P_WAITCHASE		rotz,28
	P_IGOTO		.inter_1
.inter_0
	P_WAITCHASE		rotz,256-28
.inter_1
	P_WAITCHASE		rotz,0

	P_SETVEL		50

	P_ZREMOVE		ON

	P_DO		15
	P_FACEPLAYER
	P_NEXT

	P_FIRE

	P_DO		15
	P_FACEPLAYER
	P_NEXT

	P_FIRE

.inter_w
	P_FACEPLAYER
	P_DISTLESS		1300,.inter_11
	P_GOTO		.inter_w

.inter_11
	P_RETURN
;-------------------------------------------------------------------
	START_PATH	egu6_irab

	P_GOSUB		pegu6_ifal.e6i_init
	P_GOSUB		pegu6_ifal.e6i_sub

	P_ADD		worldz,-1500
	P_SPAWN		0,-300,0,0,128,0,friendship_4,septer_rab,100,1,link
	P_ADD		worldz,1500

	P_IGOTO		pegu6_ifal.e6i_tim
;----------------------------------
	START_PATH	egu6_ifro

	P_GOSUB		pegu6_ifal.e6i_init
	P_GOSUB		pegu6_ifal.e6i_sub

	P_ADD		worldz,-1500
	P_SPAWN		0,-300,0,0,128,0,friendship_4,septer_fro,100,1,link
	P_ADD		worldz,1500

	P_IGOTO		pegu6_ifal.e6i_tim
;----------------------------------
	START_PATH	egu6_ifal

	P_GOSUB		.e6i_init
	P_GOSUB		.e6i_sub

	P_ADD		worldz,-1500
	P_SPAWN		0,-300,0,0,128,0,friendship_4,septer_fal,100,1,link
	P_ADD		worldz,1500

.e6i_tim	LOCAL
	P_SET		hp,30
	P_SETVEL		30

	P_WAIT		25

	P_IFFLAG		.e6i_z
	P_EXPLODE

;---------------------------------
.e6i_z
	P_WAIT		30

	P_REMOVE

	P_END
;---------------------------------
.e6i_init	LOCAL
	P_WEAPON		RelSlowElaser
	P_RELTOPLAYER	ON
	P_ALWAYSGENVECS	ON
	P_ZREMOVE		ON
	P_SETANIM		3
	P_SOUND		3

	P_SET		pbyte1,0
	P_EXPORT		ebyte2,pbyte1
	P_SET		hp,2
	P_SET		ap,6
	P_RETURN
;---------------------------------
.e6i_sub	LOCAL
	P_ABOVEPLAYER	.e6i_a

	P_RIGHTOFPLAYER	.e6i_br
	P_GOTO		.e6i_bl
.e6i_a
	P_RIGHTOFPLAYER	.e6i_ar

;e6_al
	P_SET		roty,256-64
	P_SET		rotx,32

	P_SETVEL		60

.e6i_al_1
	P_WAIT		1
	P_ABOVEPLAYER	.e6i_al_1

	P_ACCEL		30,1

.e6i_al_2
	P_CHASE		rotx,0
	P_CHASE		rotz,32
	P_CHASE		roty,256-32
	P_IFSAME		roty,256-32,.e6i_al_3
	P_GOTO		.e6i_al_2

.e6i_al_3
	P_CHASE		rotx,256-64
	P_CHASE		rotz,0
	P_IFSAME		rotx,256-64,.e6i_al_4
	P_GOTO		.e6i_al_3

.e6i_al_4
	P_ADD		roty,4
	P_CHASE		rotx,0
	P_IFSAME		roty,128,.e6i_0
	P_GOTO		.e6i_al_4

.e6i_0
	P_ACCEL		40,1

.e6i_01
	P_FACEPLAYER
	P_DISTLESS		1300,.e6i_02
	P_ADD		pbyte1,1
	P_IFSAME		pbyte1,10,.e6i_03
	P_GOTO		.e6i_01
.e6i_03
	P_SET		pbyte1,0
	P_FIRE
	P_GOTO		.e6i_01
.e6i_02
	P_RETURN

;---------------------------------
.e6i_ar

	P_SET		roty,64
	P_SET		rotx,32

	P_SETVEL		60

.e6i_ar_1
	P_WAIT		1
	P_ABOVEPLAYER	.e6i_ar_1

	P_ACCEL		30,1

.e6i_ar_2
	P_CHASE		rotx,0
	P_CHASE		rotz,256-32
	P_CHASE		roty,32
	P_IFSAME		roty,32,.e6i_ar_3
	P_GOTO		.e6i_ar_2

.e6i_ar_3
	P_CHASE		rotx,256-64
	P_CHASE		rotz,0
	P_IFSAME		rotx,256-64,.e6i_ar_4
	P_GOTO		.e6i_ar_3

.e6i_ar_4
	P_ADD		roty,-4
	P_CHASE		rotx,0
	P_IFSAME		roty,128,.e6i_0
	P_GOTO		.e6i_ar_4

;---------------------------------
.e6i_bl
	P_SET		roty,256-64
	P_SET		rotx,256-32

	P_SETVEL		60

.e6i_bl_1
	P_WAIT		1
	P_ABOVEPLAYER	.e6i_bl_11
	P_GOTO		.e6i_bl_1

.e6i_bl_11
	P_ACCEL		30,1

.e6i_bl_2
	P_CHASE		rotx,0
	P_CHASE		rotz,32
	P_CHASE		roty,256-32
	P_IFSAME		roty,256-32,.e6i_bl_3
	P_GOTO		.e6i_bl_2

.e6i_bl_3
	P_CHASE		rotx,40
	P_CHASE		rotz,0
	P_IFSAME		rotx,40,.e6i_bl_4
	P_GOTO		.e6i_bl_3

.e6i_bl_4
	P_ADD		roty,4
	P_CHASE		rotx,0
	P_IFSAME		roty,128,.e6i_0
	P_GOTO		.e6i_bl_4

;---------------------------------
.e6i_br
	P_SET		roty,64
	P_SET		rotx,256-32

	P_SETVEL		60

.e6i_br_1
	P_WAIT		1
	P_ABOVEPLAYER	.e6i_br_11
	P_GOTO		.e6i_br_1

.e6i_br_11
	P_ACCEL		30,1

.e6i_br_2
	P_CHASE		rotx,0
	P_CHASE		rotz,256-32
	P_CHASE		roty,32
	P_IFSAME		roty,32,.e6i_br_3
	P_GOTO		.e6i_br_2

.e6i_br_3
	P_CHASE		rotx,40
	P_CHASE		rotz,0
	P_IFSAME		rotx,40,.e6i_br_4
	P_GOTO		.e6i_br_3

.e6i_br_4
	P_ADD		roty,-4
	P_CHASE		rotx,0
	P_IFSAME		roty,128,.e6i_0
	P_GOTO		.e6i_br_4

;------------------------------------------------------------------
;use set pos
;ue no hou
	START_PATH	egu1_irab

	P_GOSUB		pegu1_ifal.e1i_init
	P_GOSUB		pegu1_ifal.e1i_sub

	P_ADD		worldz,-1500
	P_SPAWN		0,-300,0,0,128,0,friendship_4,septer_rab,100,1,link
	P_ADD		worldz,1500

	P_IGOTO		pegu1_ifal.e1i_tim

;---------------------------------
	START_PATH	egu1_ifro

	P_GOSUB		pegu1_ifal.e1i_init
	P_GOSUB		pegu1_ifal.e1i_sub

	P_ADD		worldz,-1500
	P_SPAWN		0,-300,0,0,128,0,friendship_4,septer_fro,100,1,link
	P_ADD		worldz,1500

	P_IGOTO		pegu1_ifal.e1i_tim
;---------------------------------
	START_PATH	egu1_ifal

	P_GOSUB		.e1i_init
	P_GOSUB		.e1i_sub

	P_ADD		worldz,-1500
	P_SPAWN		0,-300,0,0,128,0,friendship_4,septer_fal,100,1,link
	P_ADD		worldz,1500

.e1i_tim	LOCAL
	P_SET		hp,30
	P_SETVEL		30

	P_WAIT		25

	P_IFFLAG		.e1i_z
	P_EXPLODE

;----------------------------------
.e1i_z
	P_ZREMOVE	ON
	P_WAIT		3

	P_END

;--------------------------------
.e1i_init	LOCAL
	P_WEAPON		RelSlowElaser
	P_RELTOPLAYER	ON
	P_ALWAYSGENVECS	ON
	P_BOOST		ON
	P_SETANIM		9
	P_SOUND		3
	P_SET		hp,2
	P_SET		ap,6
	P_SET		pbyte1,0
	P_EXPORT		ebyte2,pbyte1

	P_SETVEL		70
	P_RETURN
;--------------------------------
.e1i_sub	LOCAL
	P_LEFTOFPLAYER	.e1i_6

.e1i_1
	P_ADD		worldx,-60
	P_ADD		worldy,39
	P_LOOP		20,.e1i_1
.e1i_2
	P_ADD		worldx,-30
	P_ADD		worldy,20
	P_LOOP		8,.e1i_2

	P_WAIT		10

	P_SETVEL		30
	
.e1i_3
	P_ADD		worldx,32
	P_ADD		worldy,-16
	P_LOOP		25,.e1i_3

	P_SETVEL		20
	P_ZREMOVE		ON

.e1i_4
	P_FACEPLAYER
	P_DISTLESS		1300,.e1i_41
	P_ADD		pbyte1,1
	P_IFSAME		pbyte1,16,.e1i_42
	P_GOTO		.e1i_4
.e1i_42
	P_FIRE
	P_SET		pbyte1,0
	P_GOTO		.e1i_4
.e1i_41
	P_RETURN
;----------------------------------

.e1i_6
	P_ADD		worldx,60
	P_ADD		worldy,39
	P_LOOP		20,.e1i_6
.e1i_7
	P_ADD		worldx,30
	P_ADD		worldy,20
	P_LOOP		8,.e1i_7

	P_WAIT		10

	P_SETVEL		30
	
.e1i_8
	P_ADD		worldx,-32
	P_ADD		worldy,-16
	P_LOOP		25,.e1i_8

	P_SETVEL		20
	P_ZREMOVE		ON

	P_IGOTO		.e1i_4
;---------------------------------------------------------------------------
	START_PATH	septer_rab

	P_FRIEND		rabbit

	P_IGOTO		psepter_fal.sept_ck

;-------------------------------

	START_PATH	septer_fro

	P_FRIEND		frog	
	P_IGOTO		psepter_fal.sept_ck

;-------------------------------

	START_PATH	septer_fal

	P_FRIEND		falcon	

.sept_ck	LOCAL

	P_RELTOPLAYER	ON
	P_ZREMOVE		OFF
	P_COLLISIONS	OFF
	P_ALWAYSGENVECS	ON
	P_WEAPON		friendelaser
	P_TRIGGER		yamete,whenhitbyplayer
	P_TRIGGER		recover,whenhit
	P_TRIGGER		clpby2,32

	P_NOTFRIEND		anyone,.sept_nof

.sept_x
	P_FACESHAPE

	P_FIRE		canhit

	P_WAIT		5

	P_FACESHAPE

	P_FIRE		canhit

	P_SET		rotx,25
	P_SET		roty,0

	P_WAIT		4

	P_SOUND		1
	P_SETVEL		40

.sept_wl2
	P_ABOVEPLAYER	.sept_wl
	P_GOTO		.sept_sup
.sept_wl
	P_GOTO		.sept_wl2
.sept_sup
	P_ACCEL		0,4

.sept_aa
	P_CHASE		rotx,0
	P_CHASE		roty,0
	P_IFSAME		rotx,0,.sept_ba
	P_GOTO		.sept_aa
.sept_ba
	P_IFSAME		roty,0,.sept_bb
	P_GOTO		.sept_aa
.sept_bb
	P_IMPORT		pbyte1,ebyte2
	P_IFNOTSAME		pbyte1,0,.sept_bye
	P_NOTFRIEND		falcon,.sept_a
	P_MSG		72
	P_SET		pbyte1,1
	P_EXPORT		ebyte2,pbyte1
	P_IGOTO		.sept_bye
.sept_a
	P_NOTFRIEND		rabbit,.sept_b
	P_MSG		73
	P_SET		pbyte1,1
	P_EXPORT		ebyte2,pbyte1
	P_IGOTO		.sept_bye
.sept_b
	P_MSG		74
	P_SET		pbyte1,1
	P_EXPORT		ebyte2,pbyte1
.sept_bye
	P_COLLISIONS	ON
	P_ZREMOVE		ON
	P_RANDOMGOTO	.bye_4
	P_WAITCHASE		rotz,224
.bye_2
	P_ADD		rotx,-2
	P_ADD		roty,-2
	P_ADD		worldx,10
	P_ADD		worldy,-10
	P_LOOP		6,.bye_2
	P_SET		pbyte1,0
	P_EXPORT		ebyte2,pbyte1
.bye_3
	P_ADD		worldx,10
	P_ADD		worldy,-10
	P_LOOP		20,.bye_3

	P_RELTOPLAYER	OFF

	P_END
.bye_4
	P_WAITCHASE		rotz,32
.bye_5
	P_ADD		rotx,-2
	P_ADD		roty,2
	P_ADD		worldx,-10
	P_ADD		worldy,-10
	P_LOOP		6,.bye_5
	P_SET		pbyte1,0
	P_EXPORT		ebyte2,pbyte1
.bye_6
	P_ADD		worldx,-10
	P_ADD		worldy,-10
	P_LOOP		20,.bye_6

	P_RELTOPLAYER	OFF

	P_END

.sept_nof
	P_FLAGSHAPE
	P_REMOVE
	P_END

;---------------------------------------------------------------------------

	START_PATH	falcon3_1

	P_FRIEND		falcon

	P_GOSUB		friend_inib
	P_COLLISIONS	OFF
	P_ZREMOVE		OFF

	P_SOUND		1
	P_SETVEL		30
	
	P_ACCEL		0,1

	P_ZREMOVE		ON

	P_WAIT		15

	P_MSG		117
	P_WAIT		30
	P_COLLISIONS	ON

	P_BOOST		ON
	P_SETVEL		100

	P_WAIT		15

	P_DO		5
	P_ADD		worldx,5
	P_NEXT

	P_WAIT		5

	P_REMOVE
	P_END
;---------------------------------------------------------------------------

	START_PATH	frog1_1

	P_FRIEND		frog

	P_GOSUB		friend_inib
	P_COLLISIONS	OFF
	P_ZREMOVE		OFF

	P_WAIT		38
	P_SET		rotx,32
	P_SOUND		1
	P_SETVEL		30
	
	P_WAIT		10

	P_WAITCHASE		rotx,0

	P_COLLISIONS	ON
	P_ZREMOVE		ON
	P_SETVEL		-20

	P_WAIT		20

	P_SETVEL		0

	P_MSG		78
.frog1_1w
	P_FINDSHAPE		arch_0
	P_SHAPEDEAD		.frog1_1w0
	P_IGOTO		.frog1_10
.frog1_1w0
	P_GOTO		.frog1_1w
.frog1_10
	P_SHAPEDISTLESS	60,.frog1_11
	P_GOTO		.frog1_10

.frog1_11
	P_DO		10
	P_ADD		worldx,10
	P_ADD		rotz,-3
	P_NEXT

	P_WAIT		1

	P_DO		10
	P_ADD		worldx,10
	P_ADD		rotz,3
	P_NEXT

	P_FINDSHAPE		arch_0
.frog1_12
	P_SHAPEDISTLESS	60,.frog1_13
	P_GOTO		.frog1_12

.frog1_13
	P_DO		14
	P_ADD		worldx,-15
	P_ADD		rotz,3
	P_NEXT

	P_WAIT		1

	P_DO		14
	P_ADD		worldx,-15
	P_ADD		rotz,-3
	P_NEXT

	P_MSG		64

	P_WAIT		25

	P_IGOTO		pe_falcon.gfal_ff
;***************************************************************************

;	GOSUB

;***************************************************************************
;***** CHASE ENEMY INIT ****
chase_init
	P_WEAPON		relslowelaser
	P_RELTOPLAYER	ON
	P_ALWAYSGENVECS	ON
	P_COLLISIONS	OFF

	P_SET		hp,6

	P_IFLEVEL		2,.chase_hp1
	P_IFLEVEL		3,.chase_hp2
	P_SET		hp,4
	P_GOTO		.chase_hp1
.chase_hp2
	P_SET		hp,8
.chase_hp1
	P_RETURN

;***** FRIEND'S INIT ***
friend_init
	P_TRIGGER		save,WhenShapeDead
	P_TRIGGER		yamete,WhenHitByPlayer
	P_TRIGGER		recover,WhenHit
	P_TRIGGER		clpby2,32
	P_SET		pbyte1,0
	P_SET		pbyte2,0
	P_WEAPON		friendelaser
	P_RELTOPLAYER	ON
	P_ALWAYSGENVECS	ON

	P_SET		hp,100
	P_SET		ap,1

	P_RETURN

;***** FRIEND INIT TYPE B *****
friend_inib
	P_TRIGGER		yamete,WhenHitByPlayer
	P_TRIGGER		recover,WhenHit
	P_TRIGGER		clpby2,32
	P_RELTOPLAYER	ON
	P_ALWAYSGENVECS	ON
	P_WEAPON		friendelaser

	P_SET		hp,100
	P_SET		ap,1

	P_RETURN
;***** FACEPLAYER AND FIRE *****
facefire
	P_FACEPLAYER
	P_FACEPLAYER
	P_FACEPLAYER
	P_FACEPLAYER
	P_FACEPLAYER
	P_FACEPLAYER
	P_FACEPLAYER
	P_FACEPLAYER
	P_FACEPLAYER

	P_FIRE

	P_RETURN

;***** RECOVER HP ******
recover
	P_SET		hp,100

	P_DISTLESS		100,.fri_nocol

	P_RETURN
.fri_nocol
	P_COLLISIONS	OFF
	P_RETURN

;***** PBYTE2 CLEAR ****
clpby2
	P_SET		pbyte2,0
	P_RETURN
;***** YAMETE ! ********
yamete
	P_IFSAME		pbyte2,0,.yame_ck
	P_SET		hp,100
	P_RETURN
.yame_ck
	P_SET		pbyte2,1
	P_NOTFRIEND		falcon,.yame_a
	P_MSG		14
	P_SET		hp,110
	P_RETURN
.yame_a
	P_NOTFRIEND		rabbit,.yame_b
	P_MSG		34
	P_SET		hp,110
	P_RETURN
.yame_b
	P_MSG		54
	P_SET		hp,110
	P_RETURN

;***************************************************************************

;***** FRIEND SAVED *****

save
	P_FORCE		.fit_0

	P_NOTFRIEND		falcon,.save_0
	P_MSG		8,meter		;FALCON SAYS
	P_IGOTO		.save_2

.save_0
	P_NOTFRIEND		rabbit,.save_1
	P_MSG		28,meter		;RABBIT SAYS
	P_IGOTO		.save_2

.save_1
	P_MSG		48,meter		;FROG SAYS
.save_2
	P_RETURN

;--------------------------------

.fit_0
	P_TRIGGER		save,OFF

	P_NOTFRIEND		falcon,.fit_sr
	P_QSPAWN		friendship_4,e_falcon,100,1
	P_REMOVE
;	P_END
.fit_sr
	P_NOTFRIEND		rabbit,.fit_sf
	P_QSPAWN		friendship_4,e_rabbit,100,1
	P_REMOVE
;	P_END
.fit_sf
	P_QSPAWN		friendship_4,e_frog,100,1
	P_REMOVE
;	P_END
;--------------------------------
	START_PATH	e_rabbit

	P_FRIEND		rabbit

	P_IGOTO		pe_falcon.fit_start_0

;---------------------------------------------------------------------------

	START_PATH	e_frog

	P_FRIEND		frog

	P_IGOTO		pe_falcon.fit_start_0

;---------------------------------------------------------------------------
	START_PATH	e_falcon

	P_FRIEND		falcon

.fit_start_0	LOCAL

	P_GOSUB			friend_inib

	P_ZREMOVE		ON
	P_SPACESHIP		OFF
	P_SOUND		1

.fit_start	LOCAL

	P_SETVEL		30
	P_DISTLESS		2000,.fit
	P_SETVEL		10
.fit
	P_CHASE		rotx,0
	P_CHASE		roty,0
	P_CHASE		rotz,0
	P_IFSAME		rotx,0,.fit_1
	P_GOTO		.fit
.fit_1
	P_IFSAME		roty,0,.fit_2
	P_GOTO		.fit
.fit_2
	P_IFSAME		rotz,0,.go
	P_GOTO		.fit

.go
	P_SETVEL		-30
.go_0
	P_DISTLESS		200,.go_1
	P_IFBETWEEN		-15,worldx,15,.go_d
	P_IFBETWEEN		1000,worldx,7000,.go_bl
	P_IFBETWEEN		0,worldx,1000,.go_l
	P_IFBETWEEN		-1000,worldx,0,.go_r
	P_ADD		worldx,100
	P_IGOTO		.go_d
.go_r
	P_ADD		worldx,10
	P_IGOTO		.go_d
.go_bl
	P_ADD		worldx,-100
	P_IGOTO		.go_d
.go_l
	P_ADD		worldx,-10
.go_d
	P_IFBETWEEN		-115,worldy,-85,.go_e
	P_IFBETWEEN		-100,worldy,5000,.go_u
	P_IFBETWEEN		-7000,worldy,-1000,.go_bd
	P_ADD		worldy,10
	P_IGOTO		.go_e
.go_bd
	P_ADD		worldy,100
	P_IGOTO		.go_e
.go_u
	P_ADD		worldy,-10
.go_e
	P_GOTO		.go_0

.go_1
	P_SETVEL		0

	P_FIRE		canhit
	P_WAIT		15
	P_FIRE		canhit
	P_WAIT		15
	P_FIRE		canhit
	P_WAIT		15
	P_FIRE		canhit
	P_WAIT		15
	P_FIRE		canhit
	P_WAIT		15
	P_FIRE		canhit
	P_WAIT		15

.gfal_ff	LOCAL
	P_WAITCHASE		rotz,224
.go_2
	P_ADD		rotx,-2
	P_ADD		roty,-2
	P_ADD		worldx,10
	P_ADD		worldy,-10
	P_LOOP		6,.go_2
.go_3
	P_ADD		worldx,10
	P_ADD		worldy,-10
	P_LOOP		20,.go_3

	P_RELTOPLAYER	OFF

	P_END

;---------------------------------------------------------------------------

	START_PATH	falco_lv1

	P_FRIEND	falcon
	P_ALWAYSGENVECS	ON
	P_SOUND		1
	P_TRIGGER		recover,whenhit

	P_WAIT		80
	P_RELTOPLAYER	ON
	P_WAIT		50

	P_IGOTO		pe_falcon.gfal_ff

;---------------------------------------------------------------------------

	START_PATH	frog_lv1

	P_FRIEND	frog
	P_ALWAYSGENVECS	ON
	P_SOUND		1
	P_TRIGGER		recover,whenhit

	P_WAIT		80
	P_RELTOPLAYER	ON
	P_WAIT		50
	P_WAIT		15

.gfro_ff	LOCAL
	P_WAITCHASE	rotz,32

	P_DO		7
	P_ADD		rotx,-2
	P_ADD		roty,2
	P_ADD		worldx,-10
	P_ADD		worldy,-10
	P_NEXT

	P_DO		21
	P_ADD		worldx,-10
	P_ADD		worldy,-10
	P_NEXT

	P_RELTOPLAYER	OFF

	P_END

;---------------------------------------------------------------------------

	START_PATH	hentai_fro

	P_FRIEND		frog

	P_IGOTO		phentai_fal.hentai_init

;---------------------------------------------------------------------------

	START_PATH	hentai_rab

	P_FRIEND		rabbit

	P_IGOTO		phentai_fal.hentai_init

;---------------------------------------------------------------------------

	START_PATH	hentai_damy

	P_TRIGGER		.hen_ckrad,always
	P_TRIGGER		.hen_clp2,64
	P_RELTOPLAYER	ON
	P_ALWAYSGENVECS	ON
	P_COLLISIONS	OFF

	P_SET		pbyte1,0
	P_EXPORT		eflag1,pbyte1

	P_ADD		worldy,70
	P_ADD		worldz,-180

	P_IGOTO		phentai_fal.move_left

.hen_ckrad
	P_IFSAME		pbyte2,1,.hen_ckmes
	P_WITHINRADIUS	130,.hen_ckmes
	P_MSG		137
	P_PUSH		pbyte1
	P_IMPORT		pbyte1,eflag1
	P_ADD		pbyte1,1
	P_EXPORT		eflag1,pbyte1
	P_PULL		pbyte1
	P_SET		pbyte2,1
.hen_ckmes
	P_RETURN
.hen_clp2
	P_SET		pbyte2,0
	P_RETURN
;---------------------------------------------------------------------------

	START_PATH	hentai_fal

	P_FRIEND		falcon
	P_SET		pbyte1,0
	P_EXPORT		eroll1,pbyte1

.hentai_init	LOCAL
	P_NOTFRIEND		anyone,.hentai_rem
	P_GOSUB		friend_inib
	P_COLLISIONS	OFF
	P_ZREMOVE		OFF

	P_SET		rotx,40
	P_SETVEL		40
	P_SOUND		1
	P_WAIT		6
	P_ACCEL		0,1
	P_WAITCHASE		rotx,0

.hentai_mov
	P_DISTLESS		130,.hentai_koko
	P_ADD		worldz,-10
	P_GOTO		.hentai_mov
.hentai_koko
	P_ZREMOVE		ON
	P_COLLISIONS	ON
	P_NOTFRIEND		falcon,.move_left
	P_QSPAWN		my_w,hentai_damy,10,10

	P_MSG		135
.move_left	LOCAL
	P_WAIT		20

	P_SET		pbyte1,0

	P_DO		14
	P_ADD		rotz,1
	P_ADD		worldx,pbyte1
	P_ADD		pbyte1,-2
	P_NEXT

	P_WAIT		1

	P_DO		14
	P_ADD		rotz,-1
	P_ADD		worldx,pbyte1
	P_ADD		pbyte1,2
	P_NEXT

	P_WAITCHASE		rotz,0
	P_SET		pbyte1,0

	P_WAIT		10

	P_DO		17
	P_ADD		rotz,-1
	P_ADD		worldx,pbyte1
	P_ADD		pbyte1,2
	P_NEXT

	P_WAIT		1

	P_DO		17
	P_ADD		rotz,1
	P_ADD		worldx,pbyte1
	P_ADD		pbyte1,-2
	P_NEXT

	P_WAITCHASE		rotz,0
	P_SET		pbyte1,0

	P_WAIT		5

	P_DO		10
	P_ADD		rotz,1
	P_ADD		worldx,pbyte1
	P_ADD		pbyte1,-2
	P_NEXT

	P_WAIT		1

	P_DO		10
	P_ADD		rotz,-1
	P_ADD		worldx,pbyte1
	P_ADD		pbyte1,2
	P_NEXT

	P_WAIT		10
	P_SET		pbyte1,0
	P_WAITCHASE		rotz,0
;;move up
	P_DO		14
	P_ADD		rotx,-1
	P_ADD		worldy,pbyte1
	P_ADD		pbyte1,-1
	P_NEXT

	P_WAIT		1

	P_DO		14
	P_ADD		rotx,1
	P_ADD		worldy,pbyte1
	P_ADD		pbyte1,1
	P_NEXT

	P_WAIT		15

	P_DO		14
	P_ADD		rotx,1
	P_ADD		worldy,pbyte1
	P_ADD		pbyte1,1
	P_NEXT

	P_WAIT		1

	P_DO		14
	P_ADD		rotx,-1
	P_ADD		worldy,pbyte1
	P_ADD		pbyte1,-1
	P_NEXT

	P_WAIT		20
	P_WAITCHASE		rotx,0

;;rotation play
	P_DO		8
	P_ADD		rotz,8
	P_NEXT

	P_WAIT		10

	P_DO		16
	P_ADD		rotz,-8
	P_NEXT

	P_WAIT		5

	P_WAITCHASE		rotz,0

	P_WAIT		8

	P_NOTFRIEND		falcon,.roll_ck0
	P_TRIGGER		.roll_ck,always
.roll_ck0
	P_DO		19
	P_ADD		rotz,16
	P_NEXT

	P_WAITCHASE		rotz,0

	P_NOTFRIEND		falcon,.roll_ck1
	P_TRIGGER		.roll_ck,OFF

	P_IMPORT		pbyte1,eroll1
	P_IFNOTSAME		pbyte1,0,.roll_ck1
	P_MSG		136

	P_IMPORT		pbyte1,eflag1
	P_ADD		pbyte1,1
	P_EXPORT		eflag1,pbyte1
	P_SET		pbyte1,0
	P_EXPORT		eroll1,pbyte1

.roll_ck1
	P_WAIT		10

;;move left a little
	P_SET		pbyte1,0
	P_DO		10
	P_ADD		rotz,1
	P_ADD		worldx,pbyte1
	P_ADD		pbyte1,-2
	P_NEXT

	P_WAIT		1

	P_DO		10
	P_ADD		rotz,-1
	P_ADD		worldx,pbyte1
	P_ADD		pbyte1,2
	P_NEXT

	P_WAITCHASE		rotz,0
	P_WAIT		5

;roll right
	P_NOTFRIEND		falcon,.roll_ck4
	P_TRIGGER		.roll_ck,always
.roll_ck4
	P_DO		14
	P_ADD		rotz,-16
	P_ADD		worldx,15
	P_NEXT
	P_WAIT		1
	P_DO		5
	P_ADD		rotz,-16
	P_ADD		worldx,8
	P_NEXT

	P_WAITCHASE		rotz,0

	P_NOTFRIEND		falcon,.roll_ck5
	P_TRIGGER		.roll_ck,OFF

	P_IMPORT		pbyte1,eroll1
	P_IFNOTSAME		pbyte1,0,.roll_ck5
	P_MSG		136

	P_IMPORT		pbyte1,eflag1
	P_ADD		pbyte1,1
	P_EXPORT		eflag1,pbyte1
	P_SET		pbyte1,0
	P_EXPORT		eroll1,pbyte1

.roll_ck5
;roll left
	P_DO		14
	P_ADD		rotz,16
	P_ADD		worldx,-15
	P_NEXT
	P_WAIT		1
	P_DO		5
	P_ADD		rotz,16
	P_ADD		worldx,-8
	P_NEXT

	P_WAITCHASE		rotz,0
	P_WAIT		10

;move right a little
	P_SET		pbyte1,0
	P_DO		10
	P_ADD		rotz,-1
	P_ADD		worldx,pbyte1
	P_ADD		pbyte1,2
	P_NEXT

	P_WAIT		1

	P_DO		10
	P_ADD		rotz,1
	P_ADD		worldx,pbyte1
	P_ADD		pbyte1,-2
	P_NEXT

	P_WAITCHASE		rotz,0

	P_NOTFRIEND		anyone,.hentai_rem2

	P_WAIT		5

	P_IFFRIEND		rabbit,pfrog_lv1.gfro_ff

	P_IFFRIEND		frog,pe_falcon.gfal_ff

;falcon_bye
	P_WAIT		10
	P_DO		25
	P_CHASE		rotx,256-32
	P_ADD		worldy,-10
	P_NEXT

	P_RELTOPLAYER	OFF

	P_END

.hentai_rem
	P_REMOVE
.hentai_rem2
	P_IMPORT		pbyte1,eflag1
	P_IFSAME		pbyte1,0,.hentai_rem3
	P_IFSAME		pbyte1,1,.hentai_rem
	P_IFSAME		pbyte1,2,.hentai_rem
	P_IFSAME		pbyte1,3,.hentai_rem
	P_MSG		138
	P_REMOVE
.hentai_rem3
	P_MSG		139
	P_REMOVE

.roll_ck
	P_PUSH		pbyte1
	P_IMPORT		pbyte1,player_rollZvel
	P_IFSAME		pbyte1,0,.roll_ck3
	P_SET		pbyte1,1
	P_EXPORT		eroll1,pbyte1
.roll_ck3
	P_PULL		pbyte1
	P_RETURN
;---------------------------------------------------------------------------
;*************************   TEST   TEST    TEST    ************************

	START_PATH	tes

	P_RELTOPLAYER	ON

	P_END




;---------------------------------------------------------------------
; displays pword1.. by spawning individual text objects for each digit

display_pword1

; preserves all registers
	P_PUSH	coltab
	P_PUSH	pbyte1
	P_PUSH	pword1
	P_PUSH	pbyte2
	P_PUSH	tx

	P_SET	tx,0
	P_SET	pbyte2,0

	P_SET	coltab,100
	P_GOSUB	.dividedown

	P_SET	coltab,10
	P_GOSUB	.dividedown

	P_SET	pbyte1,pword1
	P_GOSUB	.setdigit

	P_PULL	tx
	P_PULL	pbyte2
	P_PULL	pword1
	P_PULL	pbyte1
	P_PULL	coltab

	P_RETURN

; pword1/coltab = pbyte1
; pword1 = number that we are displaying
; coltab = divisor
; returns pbyte1 = result

.dividedown
	P_SET	pbyte1,-1
	P_NEG	coltab

.divide	P_ADD	pword1,coltab
	P_ADD	pbyte1,1
	P_IFBETWEEN	-1,pword1,32767,.divide

	P_NEG	coltab
	P_ADD	pword1,coltab

	P_GOSUB	.setdigit
	P_RETURN

.setdigit
	P_IFNOTSAME	pbyte1,0,.nochk
; don't print leading zeros
	P_IFNOTSAME	tx,0,.nochk
	P_ADD	pbyte2,1
	P_RETURN

.nochk	P_SET	tx,1
	P_EXPORT	gbyte1,pbyte1
	P_EXPORT	gbyte2,pbyte2
	P_SPAWN	000,000,000,0,0,0,nullshape,edigit,10,10,0

	P_BECOME
	P_COLLISIONS	OFF
	P_TEXT		msg_0,14,64		; digit size
	P_IMPORT	sbyte1,gbyte2
	P_INDEX		childx,.xpos,sbyte1
	P_ADD		sbyte1,256-5		; unique child number
; import number to be printed and calculate message address:
	P_IMPORT	pbyte1,gbyte1
	P_SET		coltab,msg_0&WM
	P_ADD		coltab,pbyte1
	P_ADD		coltab,pbyte1
	P_UNBECOME

	P_ADD	pbyte2,1
	P_RETURN


.xpos
	db	-25
	db	0
	db	25

;-------------------------------------------------------------
; digit displaying routine:

	START_PATH	edigit
	P_SHADOW		OFF
	P_WAIT	1
	P_REMOVE













