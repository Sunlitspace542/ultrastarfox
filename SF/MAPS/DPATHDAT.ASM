;*********************** PATH DATA **************************


;------------------------------------------------------------
; paper aircraft 2
	START_PATH	paper_1b

	P_ALWAYSGENVECS	ON
	P_ADD		roty,deg180
	P_SETCOLANIM	0
	P_SETANIM	0
	P_SET		hp,6
	P_SET		ap,4
	P_ADD		rotx,deg22+deg11

	P_SET		pbyte1,1
	P_LEFTOFPLAYER	.wait
	P_SET		pbyte1,-1

.wait
	P_DO		deg360/deg22
	P_ADD		rotx,deg22
	P_NEXT
	P_DISTMORE	1500,.wait


	P_RELTOPLAYER	ON

	P_DO		19
	P_ADDCOLANIM	1,20
	P_ADDANIM	1,20
	P_NEXT

	P_SPACESHIP	ON

	P_ACCEL		50,1

.t1	P_DO		0+(deg22+deg5)/2
	P_ADD		rotz,pbyte1
	P_ADD		rotz,pbyte1
	P_DEC		rotx
	P_NEXT

.t3	P_WAIT		1
	P_DEC		rotx
	P_IFNOTSAME	rotx,-deg11,.t3

	P_ACCEL		0,1
	P_WAITCHASE	rotz,0

.t4	P_WAIT		1
	P_IFBETWEEN	8,vel,100,.t4

	P_ACCEL		40,2
	P_DO		5
	P_ADD		rotx,deg11
	P_INC		rotz
	P_NEXT

	P_WAIT		14

	P_ACCEL		15,1
	P_DO		deg180/deg5
	P_ADD		rotx,-deg5
	P_NEXT

	P_ACCEL		50,2
	P_DO		0+(deg90+deg45)/deg11
	P_ADD		rotx,-deg11
	P_NEXT

	P_SPACESHIP	OFF

	P_WAITFACEPLAYER

	P_END
	

;------------------------------------------------------------
; strange paper bomb
	START_PATH	paper_3
	P_SETCOLANIM	0
	P_SETANIM	0
	P_TRIGGER	.rotit,ALWAYS
	P_SET		rotx,deg90
	P_SET		hp,2
	P_SET		ap,6

	P_TRIGGER	.explode,WHENDEAD

.waitfor1000	P_WAIT		1
	P_DISTMORE	2000,.waitfor1000

	P_RELTOPLAYER	ON

	P_DO		17
	P_ADDCOLANIM	1,20
	P_ADDANIM	1,20
	P_NEXT

	P_TRIGGER	.rotit,OFF

	P_WAITFACEPLAYER

	P_SETVEL	80

	P_SET		hp,6

	P_DO		deg90/deg22
	P_ADD		rotx,deg22
	P_NEXT

	P_TRIGGER	.explode,OFF

	P_END

.explode
	P_DO		4
	P_QSPAWN	paper_1,paperfly,10,10
	P_INEXT
	P_RETURN
.rotit
	P_ADD		rotx,deg11
	P_ADD		roty,deg5
	P_RETURN

;------------------------------------------------------------
; papers up into the air

	START_PATH	paperfly
	P_SETCOLANIM	0
	P_SETANIM	0
	P_RELTOPLAYER	ON
	P_COLLISIONS	OFF

	P_SETRANDOM	roty

	P_SETVEL	20

	P_SETRANDOM	pbyte1,7
	P_ADD		pbyte1,12
	P_DO		pbyte1

	P_ADD		worldy,-100
	P_ADD		rotx,deg22+deg11
	P_NEXT

	P_SETRANDOM	roty,128

	P_COLLISIONS	ON
; continue to next path...

;------------------------------------------------------------
; strange paper folding thing that floats down

	START_PATH	paper_1
	P_SETCOLANIM	0
	P_SETANIM	0
	P_ALWAYSGENVECS	ON
	P_RELTOPLAYER	ON
	P_ADD	roty,deg90
	P_SET	rotx,deg22
	P_SET		hp,4
	P_SET		ap,4

	P_SET		rotz,deg22

	P_GOSUB		pleaf_float

	P_DO		19
	P_ADDCOLANIM	1,20
	P_ADDANIM	1,20
	P_NEXT

	P_ACCEL		20,2
	P_DO		deg180/deg11
	P_ADD		rotx,-deg11
	P_NEXT


	P_ACCEL		40,2
	P_DO		deg180/deg11
	P_ADD		rotx,-deg11
	P_NEXT

	P_SET		pbyte1,deg5
	P_IFBETWEEN	-1,roty,deg90+deg22,.noneg
	P_NEG		pbyte1
.noneg

	P_DO		deg90/deg5
	P_ADD		roty,pbyte1
	P_CHASE		rotx,0
	P_CHASE		rotz,0
	P_NEXT

	P_WAITFACEPLAYER
	

	P_END

;------------------------------------------------------------
; float down like a leaf

pleaf_float
	P_SETVEL	40

	P_DO		4

.oneway	P_WAIT		1
	P_ADD		worldy,2
	P_ADD		rotx,-4
	P_IFNOTSAME	rotx,-deg22,.oneway

	P_ACCEL		0,5
	P_WAIT		9
	P_ACCEL		-40,5
	P_WAIT		9

.otherway	P_WAIT		1
	P_ADD		worldy,2
	P_ADD		rotx,4
	P_IFNOTSAME	rotx,deg22,.otherway

	P_ACCEL		0,5
	P_WAIT		9
	P_ACCEL		40,5
	P_WAIT		9

	P_INEXT

	P_RETURN


;------------------------------------------------------------
; pillar with top that explodes letting the top fall down

	START_PATH	tow_0
	P_SET		hp,4
	P_SET		ap,hardAP
	P_SHADOW	OFF

	P_ADD		worldy,-160
	P_START65816
	s_set_expstrat	x,tow0explode_istrat
	P_END65816

	P_SPAWN		0,-200,5,0,0,0,tow_1,tow_1,10,10,LINK

	P_TRIGGER	.explode,WHENDEAD

	P_END

.explode	P_FLAGSHAPE
	P_RETURN

;------------------------------------------------------------
; pillar's head

	START_PATH	tow_1
	P_INVINCIBLE	ON
.waitforflag
	P_IFFLAG	.falldown
	P_GOTO		.waitforflag
.falldown
	P_WAIT		7
	P_SET		pbyte1,0
.fall
	P_WAIT		1
	P_ADD		pbyte1,4
	P_ADD		worldy,pbyte1
	P_IFBETWEEN	-1100,worldy,-25,.fall
	P_SET		worldy,-25
;	P_NEG	pbyte1
;	P_DIV2	pbyte1
	P_SOUNDEFFECT	$49
;	P_IFNOTBETWEEN	-3,pbyte1,0,.fall

	P_QSPAWN	smoke,dsmoke,10,10
	P_QSPAWN	smoke,dsmoke2,10,10
	P_QSPAWN	smoke,dsmoke3,10,10
	
	P_END


	START_PATH	dsmoke2
	P_ADD		worldx,-40
	START_PATH	dsmoke3
	P_ADD		worldx,20
	START_PATH	dsmoke
	P_SPRITE	0
	P_ADD		worldz,-10

	P_START65816
	s_init_colanim	x,#0
	P_END65816

	P_DO		8
	P_START65816
	s_add_colanim	x,#1,#15
	P_END65816
	P_NEXT
	P_REMOVE



;------------------------------------------------------------
;
sm_star	equ	0
sm_bell	equ	1*16
sm_cherry	equ	2*16
sm_7	equ	3*16
sm_andross	equ	4*16
sm_bar	equ	5*16
sm_cherry2	equ	6*16
sm_watermelon equ	7*16

;------------------------------------------------------------
; slot machine boss - main body

sscale	=	slot_scale-1

	START_PATH	slotmachine
	P_COLLISIONS	OFF
	P_RELTOPLAYER	ON
	P_TRIGGER	.colanim,ALWAYS
	P_ADD		roty,deg180
	P_SPAWN		-45<<sscale,15<<sscale,-10<<sscale,0,0,0,slot_1,slotarmwait,10,10,1
	P_SPAWN		-25<<sscale,(-43<<sscale)+1,30<<sscale,0,0,0,slot_4,slotreel1,10,10,2
	P_SPAWN		0<<sscale,(-43<<sscale)+1,30<<sscale,0,0,0,slot_4,slotreel2,10,10,3
	P_SPAWN		25<<sscale,(-43<<sscale)+1,30<<sscale,0,0,0,slot_4,slotreel3,10,10,4
	P_SPAWN		30<<sscale,30<<sscale,35<<sscale,0,0,0,slot_2,slothold3,10,10,5
	P_SPAWN		0<<sscale,30<<sscale,35<<sscale,0,0,0,slot_2,slothold2,10,10,6
	P_SPAWN		-30<<sscale,30<<sscale,35<<sscale,0,0,0,slot_2,slothold1,10,10,7

	P_SET		pbyte1,0
	P_EXPORT	slot1_spin,pbyte1
	P_EXPORT	slot2_spin,pbyte1
	P_EXPORT	slot3_spin,pbyte1
	P_GOSUB		resetholds

	P_START65816
	s_set_expstrat	x,bossexplode_istrat
	P_END65816

	P_TRIGGER	.explode,WHENDEAD

	P_ALWAYSGENVECS	ON
	P_SPACESHIP	ON
	P_TRIGGER	.locky,ALWAYS

	P_SET		pword1,0
	P_SET		roty,deg90
	P_SET		rotx,deg90
	P_ACCEL		100,5

.wait
	P_ADD		rotx,-deg90
	P_WAIT		1
	P_IFBETWEEN	1500,worldx,5000,.wait

.ok3466
	P_ADD		rotx,-deg90
	P_WAIT		1
	P_ADD		rotz,1
	P_IFBETWEEN	deg90-1,roty,deg90+deg45,.ok3466
.decit
	P_ADD		rotx,-deg90
	P_WAIT		1
	P_ADD		rotz,-1
	P_IFNOTSAME	rotz,0,.decit

	P_ACCEL		0,1
.waittostop
	P_ADD		pword1,-10
	P_ADD		rotx,-deg90-2
	P_WAIT		1
	P_IFNOTSAME	vel,0,.waittostop

	P_TRIGGER	.locky,OFF

	P_ALWAYSGENVECS	OFF
	P_SPACESHIP	OFF

	P_SET		vx,0
	P_SET		vy,0
	P_SET		vz,0

.spindown	P_WAIT		1
	P_ADD		worldz,-5
	P_ADD		worldy,16
	P_IFSAME	rotx,0,.norxchg
	P_ADD		rotx,-4
.norxchg	P_CHASE		roty,deg180
	P_IFBETWEEN	-2000,worldy,0,.spindown
	P_SET		worldy,0

; now to 'walk' forwards
	P_SET		pbyte1,0

	P_DO		32
	P_ADD		worldz,-10
	P_INDEX		roty,.walktaby,pbyte1
	P_INDEX		rotz,.walktabz,pbyte1
	P_ADD		pbyte1,1
	P_IFNOTSAME	pbyte1,16,.nores
	P_SET		pbyte1,0
.nores
	P_NEXT

	P_SET		roty,deg180
	P_SET		rotx,0

	P_TRIGGER	.chkdist,4
	P_FLAGCHILD	1		; tell the arm it can be pulled
.chkloop
	P_IFFLAG	.chkjackpot
	P_GOTO		.chkloop

.locky	P_SET		worldy,pword1
	P_ADD		rotx,deg90
	P_RETURN

.walktaby	db	deg180,deg180+1,deg180+3,deg180+5
	db	deg180+3,deg180+1,deg180,deg180
	db	deg180,deg180-1,deg180-3,deg180-5
	db	deg180-3,deg180-1,deg180,deg180
.walktabz	db	3,5,7,8
	db	7,5,3,0
	db	-3,-5,-7,-8
	db	-7,-5,-3,0

.colanim
	P_ADD	tx,1
	P_RETURN

.chkdist
	P_IFSAME	worldx,0,.nochange234
	P_IFBETWEEN	0,worldx,4000,.decit223
	P_ADD		worldx,1
	P_IGOTO		.nochange234
.decit223
	P_ADD		worldx,-1
.nochange234
	P_DISTLESS	950,.further
	P_DISTLESS	1050,.ok223
	P_ADD		worldz,-10
	P_RETURN
.further	P_ADD		worldz,10
.ok223	P_RETURN

; explosion routine:
.explode
	P_REMOVE	1
	P_REMOVE	2
	P_REMOVE	3
	P_REMOVE	4
	P_REMOVE	5
	P_REMOVE	6
	P_REMOVE	7
	P_RETURN


;-------------------------------------------------------------------
; check the jackpot variations
.chkjackpot
; first count how many androsses
	P_SET		pbyte1,0
	P_SET		pword1,0
	P_DO		3
	P_INDEX		pbyte2,slot1_pos,pbyte1
	P_START65816
	lda		al_pbyte2,x
	and		#127
	sta		al_pbyte2,x
	P_END65816
	P_IFNOTSAME	pbyte2,sm_andross,.ok
	P_ADD		pword1,1
.ok	P_ADD		pbyte1,1
	P_INEXT

	P_IFSAME	pword1,0,.chkjack
	P_GOSUB		.andross
	P_FLAGCHILD	1
	P_GOTO		.chkloop
.chkjack

	P_SET		pbyte2,0	; index into jackpot table
	P_PUSH		tx
	P_PUSH		ty
	P_GOSUB		.chknextcomb
	P_PULL		ty
	P_PULL		tx
	P_FLAGCHILD	1
	P_GOTO		.chkloop
.chknextcomb
	P_PUSH		pbyte2

	P_SET		pbyte1,0

	P_DO		3
	P_INDEX		ty,slot1_pos,pbyte1
	P_INDEX		tx,.chktable,pbyte2
	P_IFSAME	tx,-1,.okhit1		; check wild card

	P_START65816
	lda		al_ty,x
	and		#127
	eor		#255
	inc		a
	sta		al_ty,x
	P_END65816

	P_IFNOTSAME	tx,sm_cherry,.notcherrycheck
	P_IFSAME	ty,-sm_cherry2,.okhit1
.notcherrycheck

	P_ADD		tx,ty
	P_IFSAME	tx,0,.okhit1
	P_BREAK		.out			; check fail, so break
.okhit1	P_ADD		pbyte1,1
	P_ADD		pbyte2,1
	P_INEXT

; ok, jackpot (of one kind of other)
; clear the holds
	P_GOSUB		resetholds

	P_IFSAME	pbyte2,3,.jackpotorder
	P_GOSUB		showhatch
	P_SOUNDEFFECT	$1a
	P_IGOTO		.otherway
.jackpotorder
	P_SOUNDEFFECT	$1a
	P_GOSUB		showhatch
.otherway
	P_INDEX		tx,.chktable,pbyte2
	P_PULL		pbyte2
; deal with type of jackpot:
	P_INDEX		pword1,.jumptable,tx
	P_GOSUB		pword1

	P_GOSUB		showreels

	P_RETURN

; oops, no jackpot on that one, check the next combination
.out	P_PULL		pbyte2
	P_ADD		pbyte2,4	; skip last combination
	P_IFNOTSAME	pbyte2,chktablelen,.chknextcomb
	
	P_RETURN

.andross
	P_SOUNDEFFECT	$88
	P_GOSUB		showhatch

	P_SET		pbyte1,pword1
	P_ADD		pbyte1,2
	P_DO		pbyte1
	P_WEAPON	hmissile1
	P_GOSUB		.fireleft
	P_GOSUB		.fireright
	P_WAIT		15
	P_WEAPON	RelSlowElaserHome
	P_GOSUB		.firecentre
	P_WAIT		10
	P_NEXT

	P_IFSAME	pword1,1,.thatsit

	P_DO		pword1
	P_WAIT		13
	P_PUSH		rotz
	P_PUSH		rotx
	P_PUSH		roty
	P_DO		8
	P_FACEPLAYER
	P_INEXT
	P_WEAPON	RelSlowElaserHome
	P_GOSUB		.firecentre
	P_GOSUB		.fireleft
	P_GOSUB		.fireright

	P_PULL		roty
	P_PULL		rotx
	P_PULL		rotz
	P_NEXT

	P_IFSAME	pword1,2,.thatsit

	P_DO		3
	P_WAIT		5	

	P_WEAPON	Hplasma
	P_GOSUB		.fireleft
	P_GOSUB		.fireright
	P_GOSUB		.firecentre
	P_NEXT

.thatsit
	P_GOSUB		showreels
	P_RETURN

.fireleft
	P_PUSH		worldx
	P_PUSH		worldy
	P_PUSH		roty
	P_PUSH		rotx
	P_ADD		worldx,-50
	P_ADD		roty,-deg11
	P_ADD		worldy,-250
	P_SETRANDOM	rotx,deg22-1
	P_ADD		rotx,-deg11
	P_FIRE		ATPLAYER
	P_PULL		rotx
	P_PULL		roty
	P_PULL		worldy
	P_PULL		worldx
	P_RETURN

.firecentre
	P_PUSH		worldy
	P_ADD		worldy,-250
	P_FIRE		ATPLAYER
	P_PULL		worldy
	P_RETURN

.fireright
	P_PUSH		worldx
	P_PUSH		worldy
	P_PUSH		roty
	P_PUSH		rotx
	P_ADD		worldx,50
	P_ADD		roty,deg11
	P_ADD		worldy,-250
	P_SETRANDOM	rotx,deg22-1
	P_ADD		rotx,-deg11
	P_FIRE		ATPLAYER
	P_PULL		rotx
	P_PULL		roty
	P_PULL		worldy
	P_PULL		worldx
	P_RETURN

.jackpot
	P_START65816
	startbgm	$f1
	P_END65816

	P_DO		15
	P_ADD		worldz,-50
	P_SET		coltab,ID_1_C&WM
	P_SPAWN	0,110<<sscale,0,0,0,0,slot_3,coin,10,10
	P_SOUNDEFFECT	$1a
	P_WAIT		2
	P_SET		coltab,ID_0_C&WM
	P_ADD		worldz,50
	P_SPAWN	0,110<<sscale,0,0,0,0,slot_3,coin,10,10
	P_SOUNDEFFECT	$1a
	P_WAIT		1
	P_NEXT

	P_EXPLODE

	P_RETURN
.threecherries
	P_SET		pbyte1,15
	P_GOSUB		spewcoins
	P_RETURN
.twocherries
	P_SET		pbyte1,10
	P_GOSUB		spewcoins
	P_RETURN
.onecherry
	P_SET		pbyte1,5
	P_GOSUB		spewcoins
	P_RETURN
.allsame
	P_SET		pbyte1,20
	P_GOSUB		spewcoins
	P_RETURN
.allbars
	P_SET		pbyte1,30
	P_GOSUB		spewcoins
	P_RETURN

.spinit
	P_DO		deg360/deg11
	P_ADD		rotz,deg11
	P_NEXT
	P_RETURN



; table of jackpots... in priority order
.chktable
	db	sm_7,sm_7,sm_7,0
	db	sm_cherry,sm_cherry,sm_cherry,1
	db	-1,sm_cherry,sm_cherry,2
	db	sm_cherry,-1,sm_cherry,2
	db	sm_cherry,sm_cherry,-1,2
	db	-1,-1,sm_cherry,3
	db	-1,sm_cherry,-1,3
	db	-1,-1,sm_cherry,3
	db	sm_cherry,-1,-1,3
	db	sm_bell,sm_bell,sm_bell,4
	db	sm_watermelon,sm_watermelon,sm_watermelon,4
	db	sm_star,sm_star,sm_star,4
	db	sm_bar,sm_bar,sm_bar,5
chktablelen	=	*-.chktable

.jumptable
	dw	.jackpot
	dw	.threecherries
	dw	.twocherries
	dw	.onecherry
	dw	.allsame
	dw	.allbars


resetholds
	P_SET		pbyte1,2
	P_EXPORT	slot1_hold,pbyte1
	P_EXPORT	slot2_hold,pbyte1
	P_EXPORT	slot3_hold,pbyte1
	P_RETURN

showhatch
	P_PUSH		pbyte1
	P_SET		pbyte1,1
.loop
	P_WAIT		1
	P_ADD		worldy,5
	P_ADD		rotz,pbyte1
	P_ADD		pbyte1,1
	P_IFBETWEEN	0,rotz,deg180-1,.loop
	P_SET		rotz,deg180
	
	P_PULL		pbyte1
	P_RETURN

showreels
	P_PUSH		pbyte1
	P_SET		pbyte1,1
.loop
	P_WAIT		1
	P_ADD		worldy,-5
	P_ADD		rotz,pbyte1
	P_ADD		pbyte1,1
	P_IFBETWEEN	deg180,rotz,deg360-1,.loop
	P_SET		rotz,0
	
	P_PULL		pbyte1
	P_RETURN

;------------------------------------------------------------
; slot machine boss - hold 1

	START_PATH	slothold1
	P_ZREMOVE	OFF
	P_INVINCIBLE	ON
	P_TRIGGER	.hit,WHENHITBYPLAYER

.chk	P_IMPORT	pbyte1,slot1_hold
	P_GOSUB		holdcheck
	P_GOTO		.chk

.hit	P_IMPORT	pbyte1,slot1_hold
	P_IFNOTSAME	pbyte1,0,.ret
	P_IMPORT	pbyte1,slot1_spin
	P_IFNOTSAME	pbyte1,0,.ret
	P_SET		pbyte1,1
	P_EXPORT	slot1_hold,pbyte1
	P_SOUNDEFFECT	$57
.ret	P_RETURN


holdcheck
	P_IFSAME	pbyte1,0,.resetanim
	P_IFSAME	pbyte1,1,.pushed
	P_SETANIM	0
	P_START65816
	s_init_colanim	x,#0
	P_END65816
	P_RETURN
.pushed
	P_SETANIM	3
	P_RETURN
.resetanim
	P_SETANIM	0
	P_START65816
	s_add_colanim	x,#1,#4
	P_END65816
	P_RETURN

;------------------------------------------------------------
; slot machine boss - hold 2

	START_PATH	slothold2
	P_ZREMOVE	OFF
	P_INVINCIBLE	ON
	P_TRIGGER	.hit,WHENHITBYPLAYER

.chk	P_IMPORT	pbyte1,slot2_hold
	P_GOSUB		holdcheck
	P_GOTO		.chk

.hit	P_IMPORT	pbyte1,slot2_hold
	P_IFNOTSAME	pbyte1,0,.ret
	P_IMPORT	pbyte1,slot2_spin
	P_IFNOTSAME	pbyte1,0,.ret
	P_SET		pbyte1,1
	P_EXPORT	slot2_hold,pbyte1
	P_SOUNDEFFECT	$57
.ret
	P_RETURN

;------------------------------------------------------------
; slot machine boss - hold 3

	START_PATH	slothold3
	P_ZREMOVE	OFF
	P_INVINCIBLE	ON
	P_SETANIM	0
	P_TRIGGER	.hit,WHENHITBYPLAYER

.chk	P_IMPORT	pbyte1,slot3_hold
	P_GOSUB		holdcheck
	P_GOTO		.chk

.hit	P_IMPORT	pbyte1,slot3_hold
	P_IFNOTSAME	pbyte1,0,.ret
	P_IMPORT	pbyte1,slot3_spin
	P_IFNOTSAME	pbyte1,0,.ret
	P_SET		pbyte1,1
	P_EXPORT	slot3_hold,pbyte1
	P_SOUNDEFFECT	$57
.ret	P_RETURN

;------------------------------------------------------------
; slot machine boss - reel 1

	START_PATH	slotreel1
	P_COLLISIONS	OFF
	P_ZREMOVE	OFF
.chkspin	P_IMPORT	pbyte1,slot1_spin
	P_IFSAME	pbyte1,0,.nospin

	P_IMPORT	pbyte1,slot1_hold
	P_IFNOTSAME	pbyte1,1,.con
	P_SET		pbyte1,0
	P_IGOTO		.reset
.con	P_SET		pbyte2,8
	P_GOSUB		reelspinning
.reset
	P_EXPORT	slot1_spin,pbyte1
	P_EXPORT	slot1_pos,tx
	
.nospin
	P_GOTO		.chkspin
	P_END

;------------------------------------------------------------
; slot machine boss - reel 2

	START_PATH	slotreel2
	P_COLLISIONS	OFF
	P_ZREMOVE	OFF
.chkspin	P_IMPORT	pbyte1,slot2_spin
	P_IFSAME	pbyte1,0,.nospin

	P_IMPORT	pbyte1,slot2_hold
	P_IFNOTSAME	pbyte1,1,.con
	P_SET		pbyte1,0
	P_IGOTO		.reset
.con	P_SET		pbyte2,6
	P_GOSUB		reelspinning
.reset	P_EXPORT	slot2_spin,pbyte1
	P_EXPORT	slot2_pos,tx
	
.nospin
	P_GOTO		.chkspin
	P_END

;------------------------------------------------------------
; slot machine boss - reel 3

	START_PATH	slotreel3
	P_COLLISIONS	OFF
	P_ZREMOVE	OFF
.chkspin	P_IMPORT	pbyte1,slot3_spin
	P_IFSAME	pbyte1,0,.nospin

	P_IMPORT	pbyte1,slot3_hold
	P_IFNOTSAME	pbyte1,1,.con
	P_SET		pbyte1,0
	P_IGOTO		.reset
.con	P_SET		pbyte2,4
	P_GOSUB		reelspinning
.reset	P_EXPORT	slot3_spin,pbyte1
	P_EXPORT	slot3_pos,tx
	
.nospin
	P_GOTO		.chkspin
	P_END

;---------------------------------------------
reelspinning
	P_SETRANDOM	pbyte1,63
	P_ADD		pbyte1,16
	P_ADD		pbyte1,pbyte2
	P_ADD		pbyte1,pbyte2
	P_NEG		pbyte2
.spinning	P_WAIT		1
	P_PUSH		tx
	P_ADD		tx,pbyte2
	P_PULL		ty
	P_START65816
	lda	al_tx,x
	and	#-16
	sta	x1
	lda	al_pbyte1,x
	and	#-16
	cmp	x1
	beq	.nosnd2
	trigse	$9c
.nosnd2
	stz	al_ty,x
	P_END65816
	P_ADD		pbyte1,-1
	P_IFNOTSAME	pbyte1,0,.spinning
.slowitdown
	P_PUSH		tx
	P_DO		3
	P_IFNOTSAME	pbyte2,-1,.oknotandross
	P_IFSAME	tx,sm_7,.ok7
	P_IFSAME	tx,sm_7+128,.ok7
;	P_IMPORT	pbyte1,androssposs	; possibility of an andross?
;	P_IFSAME	pbyte1,0,.oknotandross
;	P_IFNOTSAME	tx,sm_andross,.oknotandross
	P_IGOTO		.oknotandross
.ok7
	P_PULL		pbyte1
	P_BREAK		.breakout
.oknotandross
	P_ADD		tx,pbyte2
	P_NEXT
	P_PULL		pbyte1

	P_START65816
	lda	al_tx,x
	and	#-16
	sta	x1
	lda	al_pbyte1,x
	and	#-16
	cmp	x1
	beq	.nosnd
	trigse	$9c
.nosnd
	P_END65816

	P_IFNOTSAME	pbyte2,-1,.norm
.breakout
	P_START65816
	lda	al_tx,x
	and	#15
	beq	.cont
	P_SWITCHOUT	.slowitdown
.cont
	P_END65816

.norm	P_ADD		pbyte2,1
	P_IFNOTSAME	pbyte2,0,.slowitdown

	P_SET		pbyte1,0
	P_SOUNDEFFECT	$24
	P_RETURN

;------------------------------------------------------------
; slot machine boss - arm

	START_PATH	slotarmwait
	P_INVINCIBLE	ON
	P_ZREMOVE	OFF
.waitflag	P_IFFLAG	pslotarm
	P_GOTO		.waitflag

	START_PATH	slotarm
	P_TRIGGER	.hit,WHENHITBYPLAYER
.loopforever
	P_JSL65816	random_l
	P_GOTO		.loopforever

.handledown
	P_TRIGGER	.hit,OFF

	P_SOUNDEFFECT	$9b

	P_SETRANDOM	pbyte1,3
	P_EXPORT	androssposs,pbyte1

	P_DO		10
	P_ADD		childrotx,deg11
	P_NEXT

	P_SET		pbyte2,1
	P_EXPORT	slot1_spin,pbyte2
	P_EXPORT	slot2_spin,pbyte2
	P_EXPORT	slot3_spin,pbyte2
	
	P_DO		10
	P_ADD		childrotx,-deg11
	P_NEXT

; wait for reels to finish
.tryagain	P_WAIT		1
	P_SET		pbyte2,0
	P_IMPORT	pbyte1,slot1_spin
	P_ADD		pbyte2,pbyte1
	P_IMPORT	pbyte1,slot2_spin
	P_ADD		pbyte2,pbyte1
	P_IMPORT	pbyte1,slot3_spin
	P_ADD		pbyte2,pbyte1
	P_IFNOTSAME	pbyte2,0,.tryagain
; now set the holds randomly
	P_SETRANDOM	pbyte1,1
	P_ADD		pbyte1,pbyte1
	P_EXPORT	slot1_hold,pbyte1

	P_SETRANDOM	pbyte1,1
	P_ADD		pbyte1,pbyte1
	P_EXPORT	slot2_hold,pbyte1

	P_SETRANDOM	pbyte1,1
	P_ADD		pbyte1,pbyte1
	P_EXPORT	slot3_hold,pbyte1

	P_FLAGMOTHER

.waitforflag
	P_IFFLAG	pslotarm
	P_GOTO		.waitforflag

.hit
	P_FORCE		.handledown
	P_RETURN
;------------------------------------------------------------
spewcoins
; pbyte1 = how many coins you want

.andchkagain
	P_IFBETWEEN	-5,pbyte1,0,.exit
	P_DO	3
	P_SPAWN	0,110<<sscale,0,0,0,0,slot_3,coin,10,10
	P_NEXT
	P_WAIT	10
	P_ADD	pbyte1,-3
	P_IGOTO	.andchkagain
.exit
	P_RETURN

;------------------------------------------------------------
; coins spewed from slot machine
	START_PATH	coin
	P_RELTOPLAYER	ON
	P_COLLISIONS	OFF
	P_SETRANDOM	pbyte1
	P_ADD		worldx,pbyte1
	P_SETRANDOM	pbyte2,15
	P_ADD		pbyte2,-8
	P_ADD		roty,pbyte2
	P_SETRANDOM	pbyte1,7
	P_ADD		pbyte1,-4
	P_ADD		rotx,pbyte1
	P_SETVEL	40
	P_SETRANDOM	pbyte1,1
	P_INC		pbyte1
	P_ADD		pbyte1,pbyte1
	P_IFSAME	pbyte1,2,.spin
	P_SET		coltab,ID_2_C&WM
.spin
	P_WITHINRADIUS	80,.hpup
	P_ADD		rotx,pbyte2
	P_ADD		rotx,pbyte2
	P_ADD		rotx,pbyte2
	P_GOTO		.spin
.hpup
	P_START65816
	ldy	pcboxobj_B
	lda.w	al_hp,y
	beq	.nodo
	clc
	adc	al_pbyte1,x
	cmp	#40
	bmi	.ok
	lda	#40
.ok
	sta.w	al_hp,y		

	trigse		$11
.nodo
	P_END65816
	P_REMOVE



	IFEQ	1
;------------------------------------------------------------
; the end - scrolls the end on from the right

	START_PATH	dtheend
	P_RELTOPLAYER	ON
	P_WAIT		1
	P_ADD		depthoffset,1
	P_WAIT		1
	P_ADD		depthoffset,1
	P_WAIT		1
	P_ADD		depthoffset,1
.eternity	P_GOTO		.eternity
	

	ENDC


;------------------------------------------------------------
; explode routine (spiral away and explode)

pspiralexplode
	P_COLLISIONS	OFF
	P_SET		hp,10
	P_FORCE		.spiral
	P_RETURN
.spiral
	P_SMOKE		ON
	P_TRIGGER	pspiralexplode,OFF
	P_TRIGGER	.spinit,ALWAYS
	P_ALWAYSGENVECS	OFF
	P_SETVEL	0

	P_SETRANDOM	pbyte1,63
	P_ADD		pbyte1,-32
	P_SETRANDOM	pbyte2,63
	P_NEG		pbyte2

	P_DO		8
	P_ADD		worldz,100
	P_ADD		worldx,pbyte1
	P_ADD		worldy,pbyte2
	P_NEXT

	P_EXPLODE


.spinit	P_ADD		rotz,deg22
	P_RETURN


;------------------------------------------------------------
;  explode routine (coin explode)

pcoinexplode
	P_COLLISIONS	OFF
	P_SET		hp,10
	P_FORCE		.coin
	P_RETURN
.coin	LOCAL
	P_SMOKE		ON
	P_TRIGGER	pcoinexplode,OFF
	P_TRIGGER	.spinit,ALWAYS
	P_ALWAYSGENVECS	OFF
	P_SETVEL	0

	P_DO		5
	P_ADD		worldy,-50
	P_NEXT

	P_EXPLODE


.spinit	P_ADD		rotz,deg22
	P_RETURN


;--------------------------------------------------------
; bird which swoops in and drops a whole load of bonus rings

	START_PATH	my_bird
	P_IMPORT	pbyte1,eroll1
	P_IFZERO	pbyte1,.carryon
	P_REMOVE
.carryon
	P_ZERO		pbyte1
	P_EXPORT	eroll1,pbyte1

	P_RELTOPLAYER	ON
	P_INVINCIBLE	ON
	P_COLLISIONS	OFF
	P_ZREMOVE	OFF
	P_ALWAYSGENVECS	ON
	P_SPACESHIP	ON
	P_TRIGGER	.anim,ALWAYS
	P_SETVEL	30
	P_SOUNDEFFECT	$90

	P_ADD		rotx,deg22
	P_LEFTOFPLAYER	.oneway
	P_ADD		roty,deg45+deg22
.oneway	P_ADD		roty,-deg22-deg11


.wait	P_WAIT		1
	P_DISTLESS	1000,.wait

	P_ZREMOVE	ON

	P_TRIGGER	.anim,OFF
	P_TRIGGER	.special,8
.leftright
	P_DO		30
	P_CHASE		rotx,0
	P_IFBETWEEN	0,roty,127,.bankright
	P_ADD		rotz,4
.bankright	P_ADD		rotz,-2
	P_NEXT

	P_TRIGGER	.special,OFF

	P_ACCEL		60,5

	P_RANDOMGOTO	.backtowardsplayer
	P_TRIGGER	.anim,ALWAYS

	P_DO		50

	P_IFBETWEEN	-deg45,rotx,-deg90,.nomore
	P_ADD		rotx,-2
.nomore	P_CHASE		rotz,0
	P_NEXT

	P_REMOVE

.backtowardsplayer
	P_LEFTOFPLAYER	.oneway2
	P_SET		pbyte1,2
	P_IGOTO		.otherway2
.oneway2	P_SET		pbyte1,-2
.otherway2
	P_DO	10
	P_ADD	rotz,pbyte1
	P_NEXT
	P_NEG	pbyte1
	P_DO	10
	P_ADD	rotz,pbyte1
	P_NEXT
.forever
	P_CHASE		rotz,0
	P_DISTMORE	700,.nochange
	P_ADDANIM	1,16
	P_IFBETWEEN	-deg90,rotx,-deg45,.nochange2
	P_ADD		rotx,-3
	P_IGOTO		.nochange2
.nochange
	P_FACEPLAYER
.nochange2
	P_GOTO		.forever

.anim	P_ADDANIM	1,16
	P_RETURN

.special
	P_QSPAWN	gate_2,ring,10,10
	P_RETURN


;--------------------------------------------------------
; bonus ring.. sets giles' strategy

	START_PATH	ring
	P_SETSTRAT	gate2_istrat

;--------------------------------------------------------
; heavy clanking robot carrying log

	START_PATH	robotwithlog
	P_ZREMOVE	OFF
	P_EXPORT	gword1,pword1
	P_SPAWN		0,0,0,0,0,0,robot_0,robotwithlog2,4,10,2
	P_SPAWN		0,0,0,0,0,0,nullshape,dummy,4,10,3
	P_IGOTO		probotswithlog.in

	START_PATH	dummy
	P_COLLISIONS	OFF
	P_INVISIBLE	ON
	P_SHADOW	OFF
	P_END

	START_PATH	robotswithlog
	P_SPAWN		0,0,-90,0,0,0,robot_0,robotwithlog2,10,10,2
	P_SPAWN		0,0,90,0,0,0,robot_0,robotwithlog2,10,10,3
.in	LOCAL
	P_COLLISIONS	OFF
	P_IFBETWEEN	0,roty,127,.logoneside
	P_SPAWN		-20,-110,-100,deg90,0,0,nullshape,carriedlog,10,10,1
	P_IGOTO		.logcreated
.logoneside
	P_SPAWN		20,-110,-100,deg90,0,0,nullshape,carriedlog,10,10,1
.logcreated

	P_SETVEL	30
.waitabit	P_BEHINDPLAYER	premove
	P_GOTO		.waitabit

	START_PATH	robotwithlog2
	P_SHADOW	OFF
	P_SOUND		$d
	P_ZREMOVE	OFF
	P_SETANIM	0
	P_TRIGGER	probot.robanim,ALWAYS

.chkflag
	P_IFFLAG	.exit
	P_GOTO		.chkflag

.exit	P_TRIGGER	probot.robanim,OFF
	P_ZREMOVE	ON
	P_IGOTO		probot.robforce

	START_PATH	carriedlog
	P_SETANIM	0
	P_ZREMOVE	OFF
	P_INVINCIBLE	ON
	P_IMPORT	shape,gword1
	P_IFNOTSAME	shape,0,.notapillar
	P_SET		shape,pillar3_ns
.notapillar
; hack for yamada
	P_IFSAME	shape,boss_7_0,.rotit
	P_IFNOTSAME	shape,boss_7_3,.norot
.rotit
	P_ADD	childrotx,deg90
	P_ADD	rotx,deg90
.norot

.chkagain
	P_INDEX		pbyte1,sintab,pbyte2
	P_DIV2		pbyte1
	P_DIV2		pbyte1
	P_DIV2		pbyte1
	P_DIV2		pbyte1
	P_DIV2		pbyte1
	P_DIV2		pbyte1
	P_ADD		pbyte1,-110>>2
	P_SET		childy,pbyte1

	P_ADD		pbyte2,40

	P_CHILDDEAD	2,.man1dead
	P_CHILDDEAD	3,.man2dead
	P_GOTO		.chkagain

.man1dead
	P_FLAGCHILD	3
	P_UNLINKCHILD	3
	P_IGOTO		.mandead
.man2dead
	P_FLAGCHILD	2
	P_UNLINKCHILD	2
.mandead
	P_UNLINKCHILD	1
	P_ZREMOVE		ON
	P_SET		pbyte1,-50
.droplog
	P_WAIT		1
	P_ADD		pbyte1,8
	P_ADD		worldy,pbyte1
	P_IFBETWEEN	-1100,worldy,-5,.droplog
	P_SET		worldy,0
	P_NEG	pbyte1
	P_DIV2	pbyte1
	P_DIV2	pbyte1
	P_SOUNDEFFECT	$49
	P_IFNOTBETWEEN	-3,pbyte1,0,.droplog
	
	P_END
	
;--------------------------------------------------------
; heavy clanking robot:

	START_PATH	robot
	P_SHADOW	OFF
	P_SOUND		$d
	P_SETANIM	0

	P_TRIGGER	.robdead,WHENDEAD

.waittowalk	P_WAIT		1
	P_DISTMORE	2500,.waittowalk
	P_TRIGGER	.robanim,ALWAYS

	P_SETVEL	20

.forever	P_IFFLAG	.robforce
	P_GOTO	.forever

;---------------------------------------------------
; robot exploding routine
.robforce	LOCAL
	P_TRIGGER	.robdead,OFF
	P_TRIGGER	.robanim,OFF

	P_SETVEL	0
	P_SETANIM	0

	P_TRIGGER	.dying,ALWAYS

	P_SET		pbyte1,0
	P_WAIT		10
	P_TRIGGER	.dying,OFF

	P_COLLISIONS	OFF

.falloverdead
	P_WAIT		1
	P_ADD		pbyte1,1
	P_ADD		rotx,pbyte1
	P_IFBETWEEN	0,rotx,deg90,.falloverdead

	P_SET		rotx,deg90	; force it flat
	P_NEG		pbyte1
	P_DIV2		pbyte1
	P_DIV2		pbyte1
	P_SOUNDEFFECT	$49
	P_IFNOTSAME	pbyte1,0,.falloverdead

	P_EXPLODE

	P_END

.dying
	P_QSPAWN	mediumshape,robexplode,10,10
	P_RETURN

.robdead	LOCAL
	P_COLLISIONS	OFF
	P_SET		hp,10
	P_FORCE		.robforce
	P_RETURN


.robanim	LOCAL
	P_ADDANIM	1,12
	P_RETURN


	START_PATH	robexplode
	P_COLLISIONS	OFF

	P_START65816
	s_set_alsflag	x,nopolyexp
	P_END65816

	P_SETRANDOM	pbyte1,127
	P_ADD		pbyte1,-64
	P_ADD		worldx,pbyte1
	P_SETRANDOM	pword1,511
	P_NEG		pword1
	P_ADD		worldy,pword1

	P_ADD		worldz,-20

	P_EXPLODE
	P_END

	IFEQ	1
;--------------------------------------------------------
; little man with gun:

	START_PATH	littleman
	P_COLLISIONS	OFF
	P_WAITCHASE	roty,-(deg11)
	P_SETANIM	0

.waittoshoot	P_WAIT		1
	P_DISTMORE	3000,.waittoshoot

	P_DO		6
	P_SPAWN		0,-20,0,0,0,0,laserline,laserline,10,10
	P_WAIT		5
	P_NEXT


	P_TRIGGER	.animit,2

	P_WAIT		8

	P_SET		pbyte1,-6
	P_TRIGGER	.bounce,ALWAYS

.addtoz
	P_ADD		worldx,-5
	P_ADD		worldz,20
	P_GOTO		.addtoz

	P_END

.animit	P_IFSAME	animframe,9+128,.noadd
	P_ADDANIM	1,16
.noadd	P_RETURN

.bounce
	P_IFSAME	pbyte1,8,.nomore
	P_ADD		worldy,pbyte1
	P_ADD		pbyte1,2
.nomore	P_RETURN
	

; line laser
	START_PATH	laserline
	P_COLLISIONS	OFF
	P_SETVEL	-30
	P_ADD		rotx,-deg90
	P_WAIT		50
	P_REMOVE

	ENDC

	START_PATH	dstarfox2
	P_RELTOPLAYER	ON
	P_TEXT		msg_starfox,4,80
	P_ADD		worldz,2000
	P_SET		worldy,0
	P_SET		worldx,0
	P_END

	IFEQ		1

	START_PATH	dspaceship

	P_ZREMOVE	OFF
	P_RELTOPLAYER	ON
	P_COLLISIONS	OFF
	P_ALWAYSGENVECS	ON

	P_SET		rotx,-deg22
	P_SETVEL	8
	P_TRIGGER	.rotit,ALWAYS
	P_WAIT		30
	P_TRIGGER	.rotdown,2

.waitforit	P_IFSAME	vel,30,.oknext
	P_GOTO		.waitforit
.oknext	;P_TRIGGER	.rotit,OFF
	P_TRIGGER	.rotdown,OFF
;	P_WAITCHASE	rotz,0

	P_WAIT		15
	P_ACCEL		40,1
	P_SET		pbyte1,52
;	P_TRIGGER	.createstarfox,ALWAYS
	P_SET		pbyte2,-1
.swoopround
	P_ADD		rotx,pbyte2
	P_IFSAME	pbyte2,-deg11,.dontadd
	P_ADD		pbyte2,-1
.dontadd
	P_IFBETWEEN	deg180-deg22-deg11,rotx,deg180-deg22,.towardsplayer
	P_GOTO		.swoopround
.towardsplayer
	P_TRIGGER	.shadow,ALWAYS

	P_WAIT		10
.2
	P_CHASE		rotx,deg180+deg11
	P_ADD		rotz,deg11
	P_IFSAME	rotz,0,.1
	P_GOTO		.2

.1
	P_TRIGGER	.shadow,OFF
	P_END

.createstarfox
	P_IFSAME	pbyte1,0,.create
	P_IFSAME	pbyte1,-1,.dontcreate
	P_ADD		pbyte1,-1
	P_RETURN
.create
	P_SET		pbyte1,-1
	P_QSPAWN	nullshape,dstarfox2,100,100
.dontcreate
	P_RETURN

.shadow
;	P_IFSAME	pbyte1,-1,.dontspawn
	P_QSPAWN	my_demo,shipshadow,100,100
.dontspawn
	P_RETURN
.rotdown
	P_IFSAME	rotx,deg11,.accel
	P_ADD		rotx,1
	P_RETURN
.accel
	P_ACCEL		30,1
	P_RETURN
.rotit
	P_ADD		rotz,2
	P_RETURN


	START_PATH	shipshadow
	P_ZREMOVE	OFF
	P_RELTOPLAYER	ON
	P_COLLISIONS	OFF
	P_SET		coltab,blue1_c
	P_WAIT		1
	P_SET		coltab,blue2_c
	P_WAIT		1
	P_SET		coltab,blue3_c
	P_WAIT		1
	P_SET		coltab,blue3_c
	P_WAIT		1
	P_REMOVE

	ENDC

;------------------------------------------------------------
; Nintendo presents
	START_PATH	dintro1
	P_RELTOPLAYER	ON
;	P_ALWAYSGENVECS	ON
	P_TRIGGER		.keep4000,ALWAYS

	P_TRAIL		7

.zoomtocentre
	P_START65816
	a16
; special achase
sa_max	=	400
	lda	al_worldx,x
	adiv2
	cmp	#-sa_max
	bpl	.nochg
	lda	#-sa_max
.nochg	cmp	#sa_max
	bmi	.nochg2
	lda	#sa_max
.nochg2	eor	#-1
	inc	a
	beq	.leave
	clc
	adc	al_worldx,x
	sta	al_worldx,x
	bne	.noexit2
.leave
	stz	al_worldx,x
	P_SWITCHOUT .exit
.noexit2
	P_END65816
	P_GOTO	.zoomtocentre
.exit
	P_TRAIL		OFF
	P_WAIT		20

	P_TRIGGER	.fadeout,ALWAYS
.wait
	P_GOTO		.wait

.fadeout
	P_ADD		depthoffset,-1
	P_IFNOTSAME	depthoffset,9,preturn
	P_FORCE		premove
	P_FINDSHAPE	walker_0
	P_SHAPEDEAD	.spawn
	P_RETURN
.spawn
;	P_QSPAWN	walker_0,dintro2,10,10
	P_RETURN

.keep4000
	P_START65816

	a16
	lda	viewposz
	clc
	adc	#4000
	sta	al_worldz,x

	P_END65816
	P_RETURN

; scroll up
	START_PATH	dintro2
	P_RELTOPLAYER	ON
	P_INVISIBLE	ON
	P_WAIT		135
.andchkagain
	P_START65816
	a8
	s_and_var	B,gameflags,#~gf_viewrot

	a16
	lda		outvx
	cmp		#-128*75
	beq		.getout
	sec
	sbc		#128
	sta		outvx
	bne	.noremove
	
.getout
	P_SWITCHOUT	premove
.noremove
	P_END65816
	P_GOTO		.andchkagain

	IFEQ		1
; scrap metal
	START_PATH	scrapmetal

	P_SETRANDOM	pbyte1,15
	P_ADD		pbyte1,-8

	P_SET		roty,deg180

	P_GOSUB		.spinaway

	P_TRIGGER	.spinaway,whenhit

.here
	P_IFSAME	pbyte2,0,.nochange
	P_IFBETWEEN	-32,pbyte2,0,.incit
	P_ADD		pbyte2,-1
	P_IGOTO		.nochange
.incit	P_ADD		pbyte2,1
.nochange

	P_IFSAME	pword1,0,.nochange2
	P_IFBETWEEN	-32,pword1,0,.incit2
	P_ADD		pword1,-1
	P_IGOTO		.nochange2
.incit2
	P_ADD		pword1,1
.nochange2

	P_ADD		worldx,pbyte2
	P_ADD		worldy,pword1
	P_ADD		rotz,pbyte1
	P_GOTO		.here

	P_END

.spinaway
	P_NEG		pbyte1
	P_SETRANDOM	pbyte2,63
	P_ADD		pbyte2,-32
	P_SETRANDOM	pword1,63
	P_ADD		pword1,-32
	P_RETURN


	ENDC

; non exploding meteor without tadpoles

;.createsmallones
;	P_FORCE		pexplode
;	P_SPAWN		0,0,0,-10,-10+deg180,-10,asteroid1,break,4,12
;	P_SPAWN		0,0,0,10,10+deg180,10,asteroid1,break,4,12
;	P_RETURN

; meteor fragments (with 50% chance of tadpoles)
	START_PATH	break1
	P_TRIGGER	pbreak2.createtadpole,WhenDead
; meteor fragments
	START_PATH	break2
	P_TRIGGER	pparticles,WhenDead
;	P_SETVEL	10
	P_SET		coltab,break_meteor_C&WM
	P_SPRITE	0
	P_END

.createtadpole	LOCAL
	P_RANDOMGOTO	.notad
	P_QSPAWN	tadpole,meteor_tadpole,10,2
.notad
	P_RETURN

; tadpole
	START_PATH	meteor_tadpole
	P_SETSTRAT	tadpole_istrat

	START_PATH	explodeparticles
	P_PARTICLES
	P_EXPLODE
	P_END
pparticles
	P_PARTICLES
	P_RETURN

pexplode
	P_EXPLODE

premove	P_REMOVE

preturn	P_RETURN

	START_PATH	dtest5

	P_RELTOPLAYER	ON

	P_TRAIL	7

.loop5
	P_DO	39
	P_ADD	worldy,-50
	P_ADD	worldz,200
	P_NEXT
.remit
	P_ALWAYSGENVECS	ON
	P_SETVEL	120
.loopround
	P_ADD		rotx,deg5
	P_IFSAME	rotx,deg180+deg11,.exit
	P_GOTO		.loopround
.exit
	P_END

	START_PATH	dsideslip

	P_RELTOPLAYER	ON

	P_TRAIL	7
.loopit
	P_ADD	worldx,-400
	P_IFSAME	worldx,0000,.stoptrail
	P_GOTO	.loopit
.stoptrail
	P_TRAIL	OFF

	IFEQ	PAL
	P_WAIT	100
	ELSEIF
	IFEQ	GERMAN
	P_WAIT	95
	ELSEIF
	P_WAIT	85
	ENDC
	ENDC

	P_TRAIL	7
.loopit2
	IFEQ	PAL
	P_ADD	worldz,-200
	ELSEIF
	P_ADD	worldz,-230
	ENDC

	P_GOTO	.loopit2

	P_END


;---- STARFOX
	START_PATH	dstarfox

	P_RELTOPLAYER	ON
	P_ALWAYSGENVECS	ON

	P_TEXT	msg_starfox,4,48

	P_TRAIL	3

	P_SETVEL	-120

	P_GOSUB		text_swoopin
.carryon	P_LOOP		5,.carryon
	P_SETVEL	0
	P_TRAIL		OFF
	P_WAIT		60
	P_TRAIL	3
.zoomleft
	P_ADD		worldx,-300
	P_LOOP		5,.zoomleft
	P_REMOVE
	P_END


;---- NINTENDO
	START_PATH	dnintendo
	P_RELTOPLAYER	ON
	P_ALWAYSGENVECS	ON

	P_TEXT	msg_nintendo,8,16

	P_TRAIL	11

	P_SETVEL	-120
	P_GOSUB		text_swoopin
.carryon2
	P_LOOP		5,.carryon2
	P_SETVEL	0
	P_TRAIL		OFF
	P_WAIT		27
	P_TRAIL		11
.zoomright
	P_ADD		worldx,300
	P_LOOP		5,.zoomright
	P_REMOVE
	P_END


;---- PRESENTED BY
	START_PATH	dpresented
	P_RELTOPLAYER	ON
	P_ALWAYSGENVECS	ON
	P_TRAIL	7

	P_LEFTOFPLAYER	.zipright
.zipleft	P_DO		11
	P_ADD		worldx,-150
	P_NEXT
	P_IGOTO		.prwait
.zipright	P_DO		11
	P_ADD		worldx,150
	P_NEXT
;	P_LOOP		10,.zipright
.prwait
	P_TRAIL		OFF
	P_WAIT		60
	P_SET		rotx,deg22+deg11+2
	P_SETVEL	-120
	P_TRAIL		7
.zoomforwards
	P_ADD		rotx,-deg5+1
	P_GOTO		.zoomforwards


text_swoopin
	P_ALWAYSGENVECS	ON
	P_BELOWPLAYER	.swoopup
	P_SET		rotx,-deg90
.loopround
	P_ADD		rotx,deg5
	P_IFSAME	rotx,deg0,.leave
	P_GOTO		.loopround
.leave
	P_RETURN
.swoopup
	P_SET		rotx,deg90
.loopround2
	P_ADD		rotx,-deg5
	P_IFSAME	rotx,deg0,.leave
	P_GOTO		.loopround2



	START_PATH	minicastanet

	P_RELTOPLAYER	ON
	P_ALWAYSGENVECS	ON
	P_SET		roty,deg180

	P_RANDOMGOTO	.leftpath

	P_WAIT		50

	P_SETVEL	30
	P_SET		rotx,deg22
	P_WAIT		10

.roundtoplayer3
	P_ADD		rotz,deg22
	P_ADD		rotx,6
	P_LOOP		10,.roundtoplayer3

.roundtoplayer4
	P_ADD		rotz,deg22
	P_ADD		rotx,-deg5
	P_LOOP		6,.roundtoplayer4


	P_GOTO		.sameasother

.leftpath
	P_WAIT		50

	P_SETVEL	30

	P_SET		rotx,-deg22
	P_WAIT		10

.roundtoplayer
	P_ADD		rotz,deg22
	P_ADD		rotx,-6
	P_LOOP		10,.roundtoplayer

.roundtoplayer2
	P_ADD		rotz,deg22
	P_ADD		rotx,deg5
	P_LOOP		6,.roundtoplayer2
.sameasother
	P_ACCEL		40,5
.andagain2
	P_ADD		rotz,deg45
	P_DISTLESS	100,.enditnow
	P_FACEPLAYER
	P_GOTO		.andagain2
.enditnow
	P_WAIT		1
.enditnowloop
	P_ADD		rotz,deg45
	P_LOOP		20,.enditnowloop
	P_END


	START_PATH	minicastanetLR
minicast2

	P_RELTOPLAYER	ON
	P_ALWAYSGENVECS	ON
	P_SET		roty,deg180



	P_RANDOMGOTO	.leftpath

	P_WAIT		50

	P_SETVEL	30
	P_SET		roty,+deg90+deg22
	P_WAIT		10

.roundtoplayer3
	P_ADD		rotz,deg22
	P_ADD		roty,6
	P_LOOP		10,.roundtoplayer3

.roundtoplayer4
	P_ADD		rotz,deg22
	P_ADD		roty,-deg5
	P_LOOP		6,.roundtoplayer4


	P_GOTO		.sameasother

.leftpath
	P_WAIT		50

	P_SETVEL	30

	P_SET		roty,-deg90-deg22
	P_WAIT		10

.roundtoplayer
	P_ADD		rotz,deg22
	P_ADD		roty,-6
	P_LOOP		10,.roundtoplayer

.roundtoplayer2
	P_ADD		rotz,deg22
	P_ADD		roty,deg5
	P_LOOP		6,.roundtoplayer2
.sameasother
	P_ACCEL		40,5
.andagain2
	P_ADD		rotz,deg45
	P_DISTLESS	100,.enditnow
	P_FACEPLAYER
	P_GOTO		.andagain2
.enditnow
	P_WAIT		1
.enditnowloop
	P_ADD		rotz,deg45
	P_LOOP		20,.enditnowloop
	P_END

;---------------------------------------------------------------------------
; boost on and off subroutines
;---------------------------------------------------------------------------
pbooston

	P_JSL65816	makeengine_srou_l
	P_TRIGGER	pboostcode,ALWAYS
	P_RETURN

pboostcode
	P_JSL65816	updateengine_srou_l
	P_RETURN
pboostoff
	P_RETURN


;---------------------------------------------------------------------------
ppollen
	P_JSL65816	makepollen_srou_l
	P_RETURN


