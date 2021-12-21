;***************************************************************************
;*                                                                         *
;*                                Star Fox                                 *
;*_________________________________________________________________________*
;*                                                                         *
;*  File : SOUND.ASM                                                       *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr : Sound Driver                                                   *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*  Author: Koji Kondo                                                     *
;*                                                                         *
;***************************************************************************

	INCPUBLICS	EXT\sound.ext

obsdist	equ	100	;320

cutoffsnd	equ	3150
dist3snd	equ	1150
dist2snd	equ	650
dist1snd	equ	250

ship_1_cutoffsnd equ	11000
ship_1_dist3snd equ	10000
ship_1_dist2snd equ	10000
ship_1_dist1snd equ	5000
ship_1_mindist  equ	500

playaccel1	equ	2
playaccel2	equ	4
playaccel3	equ	8
playaccel4	equ	16

	shorta
	longi
do_bgm_init	bootapu	#snd_init
do_bgm_title	bootapu	#snd_title
do_bgm_ops	bootapu	#snd_ops
do_bgm_training bootapu #snd_training
do_bgm_map	bootapu	#snd_map
do_bgm_10	bootapu	#snd_10
do_bgm_11	bootapu	#snd_11
do_bgm_12	bootapu	#snd_12
do_bgm_13	bootapu	#snd_13
do_bgm_13b	bootapu	#snd_13b
do_bgm_14	bootapu	#snd_14
do_bgm_15	bootapu	#snd_15
do_bgm_16	bootapu	#snd_16
do_bgm_20	bootapu	#snd_20
do_bgm_21	bootapu	#snd_21
do_bgm_22	bootapu	#snd_22
do_bgm_23	bootapu	#snd_23
do_bgm_24	bootapu	#snd_24
do_bgm_25	bootapu	#snd_25
do_bgm_26	bootapu	#snd_26
do_bgm_30	bootapu	#snd_30
do_bgm_31	bootapu	#snd_31
do_bgm_32	bootapu	#snd_32
do_bgm_33	bootapu	#snd_33
do_bgm_34	bootapu	#snd_34
do_bgm_35	bootapu	#snd_35
do_bgm_36	bootapu	#snd_36
do_bgm_37	bootapu	#snd_37
do_bgm_continue bootapu #snd_continue
do_bgm_bhole	bootapu	#snd_bhole
do_bgm_intro	bootapu	#snd_intro
do_bgm_endseq	bootapu	#snd_endseq
do_bgm_staff	bootapu	#snd_staff
do_bgm_gameover	bootapu	#snd_gameover
do_bgm_special	bootapu	#snd_special

sndtbl
	snd_data	init,0h,sound0
	snd_data	intro,012h,sound1,sound2,bgmm
	snd_data	title,012h,sound7
	snd_data	ops,012h,sound1,bgmn
	snd_data	training,03h,sound3,bgmo
	snd_data	map,01,sound2,sound6
	snd_data	continue,0ah,sound9

	snd_data	bhole,3,bgml

	snd_data	10,16,bgma,bgm1,sound5
	snd_data	11,3,sound1,sound3,bgma,bgm1
	snd_data	12,3,bgmf,bgm7
	snd_data	13,9,bgmg,bgm6
	snd_data	13b,3,bgmg,bgm6
	snd_data	14,3,sound3,sound4,bgmb,bgm5
	snd_data	15,3,bgmf,bgm8
	snd_data	16,3,bgmk,bgm8,bgm10
	
	snd_data	20,16,bgma,bgm1,sound5
	snd_data	21,3,sound1,sound3
	snd_data	22,3,bgmi,bgm7
	snd_data	23,3,sound3,sound4,bgmc,bgm4
	snd_data	24,3,bgmj,bgm7
	snd_data	25,3,bgmf,bgm8
	snd_data	26,3,bgmh,bgm8,bgm10
	
	snd_data	30,16,bgma,bgm1,sound5
	snd_data	31,3,sound1,sound3
	snd_data	32,3,bgmf,bgm7
	snd_data	33,3,sound3,sound4,bgmd,bgm2
	snd_data	34,3,bgmi,bgm6
	snd_data	35,3,sound3,bgme,bgm3
	snd_data	36,3,bgmf,bgm9
	snd_data	37,3,bgmk,bgm9,bgm10

	snd_data	endseq,3,sound8
	snd_data	staff,012h,sounda
	snd_data	gameover,0ch,bgm11
	snd_data	special,03h,sound3,bgmp



;--------------------------------------------------------------------
sbootapu	a8
	disable
	lda.l	sndtbl,x
	sta	bgm_music
	inx
	stx	snd_ptr

	lda	firstdnld
	beq	.first
	lda	#$ff
	sta	apu_port0
.first	lda	#1
	sta	firstdnld

; If the sound data does overlap a bank then use this code
; ALL sound data goes through here to start with.
	ai16
	ldy	#0
	lda	#$bbaa
sboot_initial
	cmp	apu_port0		;m16
	bne	sboot_initial
	a8
	lda 	#$cc
	pha
	jmp	sboot_entry3
sboot_repeat
	lda	[address],y
	iny
	bne	.cok1
	inc	address+2
	stz	address+1
	stz	address
	ldy	#$8000
.cok1
	xba
	lda	#0
	bra	sboot_entry2
sboot_loop	xba
	lda	[address],y
	iny
	bne	.cok2
	inc	address+2
	stz	address+1
	stz	address
	ldy	#$8000
.cok2
	xba
sboot_wait1	cmp	apu_port0
	bne	sboot_wait1
	inc	a
sboot_entry2
	a16
	sta	apu_port0		;m16
	a8
	dex
	bne	sboot_loop
sboot_wait2	cmp	apu_port0
	bne	sboot_wait2
sboot_zero	adc	#3
	beq	sboot_zero
sboot_entry1
	pha			;>
sboot_entry4
	ifeq	1
	phx
	phy
	pha
	php
	a8i16
	stratdebug
	plp
	pla
	ply
	plx
	endc

	a16
	lda	[address],y		;m16
	beq	sboot_entry3
	iny
	bne	.cok3
	blink	3
.cok3
	iny
	bne	.cok6
	blink	3
.cok6
	tax
	lda	[address],y		;m16
	iny
	bne	.cok4
	blink	3
.cok4
	iny	          	
	bne	.cok5
	blink	3
.cok5
	sta	apu_port2		;m16
	a8
	cpx	#1
	lda	#0
	rol	a
	sta	apu_port1
	pla
	sta	apu_port0
sboot_wait3	cmp	apu_port0
	bne	sboot_wait3
	jmp	sboot_repeat
	longa
sboot_entry3
	a16
	ldx	snd_ptr
	lda.l	sndtbl,x
	sta	ktpy
	lda.l	sndtbl+3,x
	sta	ktpz
	a8
	lda.l	sndtbl+2,x
	sta	address+2
	inx
	inx
	inx
	inx
	inx
	stx	snd_ptr

	a16
	stz	address
	lda	ktpy
	beq	.end
	tay
	clc
	adc	ktpz
	bcc	boot_entry4
	jmp	sboot_entry4
.end
	a16
	lda	#0400h
	sta	apu_port2

	ai8
	lda	#0
	xba
	pla
	a16
	sta	apu_port0

	a8
sboot_wait4	cmp	apu_port0
	bne	sboot_wait4

	stz	apu_port1
	stz	apu_port2
	stz	apu_port3

	stz	bgmcnt
	enable
	rts


; If the sound data does not overlap a bank then use this code
	shorta
	longi
boot_repeat
	lda	[address],y
	iny
	xba
	lda	#0
	bra	boot_entry2
boot_loop	xba
	lda	[address],y
	iny
	xba
boot_wait1	cmp	apu_port0
	bne	boot_wait1
	inc	a
boot_entry2
	a16
	sta	apu_port0		;m16
	a8
	dex
	bne	boot_loop
boot_wait2	cmp	apu_port0
	bne	boot_wait2
boot_zero	adc	#3
	beq	boot_zero
boot_entry1
	pha			;>
boot_entry4
	ifeq	1
	phx
	phy
	pha
	php
	a8i16
	stratdebug
	plp
	pla
	ply
	plx
	endc

	a16
	lda	[address],y		;m16
	lbeq	sboot_entry3
	iny
	iny
	tax
	lda	[address],y		;m16
	iny
	iny	          	
	sta	apu_port2		;m16
	a8
	cpx	#1
	lda	#0
	rol	a
	sta	apu_port1
	pla
	sta	apu_port0
boot_wait3	cmp	apu_port0
	bne	boot_wait3
	bra	boot_repeat





;--------------------------------------------------------------------
dosounds_l	a8
	lda	gameflags2
	and	#gf2_ingame
	beq	.dosnds
	lda	pshipflags2
	and	#psf2_playerHP0
	bne	.nsnds
.dosnds
	lda	levelfinished
	cmp	#le_enterspec
	beq	.nsnds
	cmp	#le_enterbhole
	beq	.nsnds
	cmp	#le_bhole1
	beq	.nsnds
	cmp	#le_bhole2
	beq	.nsnds
	cmp	#le_bhole3
	beq	.nsnds

	jsr	nearobjs
	jsr	do_obstacles
	bra	.fin

.nsnds	shorta
	stz	apu_port2
.fin
	jsr	playersnd
	rtl

	shorta

playersnd	a8i16
	ldx	internalplaypt
	s_jmp_alcollflag	x,firstframe,.nsnd


	lda	gameflags
	and	#gf_playerdead
	bne	.nsnd
	lda	pshipflags3
	and	#psf3_enginesnd
	beq	.nsnd
	lda	pshipflags2
	and	#psf2_playerHP0
	bne	.dying
	bra	.ndying

.nsnd	lda	#$00
	sta	apu_port1
	sta	port1bolox
	rts
.dying
	lda	#$4b
	sta	apu_port1
	sta	port1bolox
	rts
.ndying
	lda	inatunnel
	bne	.tunnel
	lda	gamemode
	bit	#space_mode
	bne	.space
.planet	lda	#%11000000
	bra	.gotmode
.water	lda	#%11000000
	bra	.gotmode
.space	lda	#%00000000
	bra	.gotmode
.tunnel	cmp	#2		;for water
	beq	.water
	lda	#%10000000
.gotmode	ora	playersndflag	;boost/slowdown sound
	sta	tpa


	lda	contl0
	bit	#key_leftl+key_rightl
	beq	.skip

	ai16			;get players acceleration
	ldx	playpt
	lda	al_worldx,x
	tax
	sec
	sbc	lastplayx
	stx	lastplayx
	bpl	.ok
	nega
.ok
	cmp	#playaccel1
	bcc	.accel1
	cmp	#playaccel2
	bcc	.accel2
	cmp	#playaccel3
	bcc	.accel3
.accel4	lda	#%11
	bra	.gotaccel
.accel3	lda	#%10
	bra	.gotaccel
.accel2	lda	#%01
	bra	.gotaccel
.accel1	lda	#%00
.gotaccel	ora	tpa
	sta	tpa
.skip	a8
	lda	tpa
	sta	apu_port1
	sta	port1bolox
	rts

.playport2
	sta	apu_port2
	rts



do_obstacles
	ai16			;do nearest sounds
	ldx	allst
.loop
	a8
	lda	al_hp,x
	cmp	#hardhp
	bne	.no
	s_jmpNOT_alsflag	x,realobj,.no
	s_jmp_alsflag	x,donesnd,.no

	a16
	ldy	playpt
	lda	pviewposx
	sec
	sbc	al_worldx,x
	bmi	.left
	cmp	#300
	bcs	.no
	bra	.ok
.left	cmp	#-300
	bcc	.no
.ok	lda	al_worldz,x
	sec
	sbc.w	al_worldz,y
	cmp	#obsdist
	bcc	.make


.no	ldy	_next,x
	tyx
	bne	.loop
	rts
.make
	a8
	s_set_alsflag	x,donesnd
	a16
	lda	pviewposx
	sec
	sbc	al_worldx,x
	bmi	.left2
.right	cmp	#80
	bcc	.centre
	a8
	trigse	se_dopright
	rts
	longa
.left2	cmp	#-80
	bcs	.centre
	a8
	trigse	se_dopleft
	rts
	longa
.centre	a8
	trigse	se_dopcentre
	rts




nearobjs	ai16			;do nearest sounds for port1
	ldx	allst
	lda	#$7fff
	stz	ktpx
.loop
	ldy	al_shape,x
	cpy	#ship_1
	lbeq	.forcesnd
	cpy	#ship_5s
	lbeq	.forcesnd
	cpy	#ship_5m
	lbeq	.forcesnd
	cpy	#ship_5
	lbeq	.forcesnd
	cpy	#ship_0_c
	lbeq	.forcesnd

	pha
	a8
	lda	al_flags,x
	bit	#afexp
	bne	.notnearest8
	lda.l	alx_snd1,x
	bne	.tst
	lda.l	alx_snd2,x
	beq	.notnearest8
.tst
	ldy	playpt
	a16
	lda	al_worldz,x
	sec
	sbc.w	al_worldz,y
	bpl	.okp
	nega
.okp	sta	rangexz
	pla

	cmp	rangexz    		;check if closest
	bcc	.skip
	lda	rangexz
	stx	ktpx		;store away ptr to block
	sta	ktpy		;and range
	bra	.skip

.notnearest8
	a16
.notnearest	pla
.skip	ldy	_next,x
	tyx
	lbne	.loop


	ldx	ktpx		;x = block of nearest alien
	lbeq	.nothing
	cpx	lastblock
	lbne	.nothing

	lda.l	alx_snd1,x
	and	#$ff
	lbne	.snd1

	lda.l	alx_snd2,x
	and	#$ff
	sta	ktpx		;store sound fx


	ldy	viewpt		;do arctan to object
	jsl	anglexy_l
	xba
	shorta
	longi
	a16
	and	#$ff
	tax
	lda.l	pantab,x
	and	#$ff
	ora	ktpx
	sta	ktpx

	lda	ktpy		;range
	cmp	#dist1snd
	bcc	.near
	cmp	#dist2snd
	bcc	.nmed
	cmp	#dist3snd
	bcc	.med
	cmp	#cutoffsnd
	bcs	.nothing
.far	a8
	lda	#%110000
	bra	.or
.med	a8
	lda	#%100000
	bra	.or
.nmed	a8
	lda	#%010000
	bra	.or
.near	a8
	lda	#%000000
.or	ora	ktpx
	sta	apu_port2
	rts
.nothing	a8
	stz	apu_port2
	stx	lastblock
	rts

.snd1	a8
	sta	apu_port2
	rts

.forcesnd	a16
	lda.l	alx_snd2,x
	and	#$ff
	sta	ktpx
	stx	lastblock

	ldy	playpt
	lda	al_worldz,x
	sec
	sbc.w	al_worldz,y
	bmi	.nothing
	sta	ktpy

	lda	pviewposx
	sec
	sbc	al_worldx,x
	bmi	.left
.right	cmp	#80
	bcc	.centre
	lda	ktpx
	ora	#%01000000
	bra	.donea
.left	cmp	#-80
	bcs	.centre
	lda	ktpx
	ora	#%11000000
	bra	.donea
.centre	lda	ktpx
	ora	#%10000000
.donea	sta	ktpx

	lda	ktpy
	cmp	#ship_1_mindist
	bcc	.nothing
	cmp	#ship_1_dist1snd
	bcc	.near
	cmp	#ship_1_dist2snd
	bcc	.nmed
	cmp	#ship_1_dist3snd
	lbcc	.med
	cmp	#ship_1_cutoffsnd
	lbcc	.far
	bra	.nothing

;---------------------------------------------------------------
pantab
	rept	$78
	db	%01000000
	endr

	db	%01000000
	db	%01000000
	db	%01000000
	db	%01000000
	db	%01000000
	db	%10000000
	db	%10000000
	db	%10000000
	db	%10000000
	db	%10000000
	db	%11000000
	db	%11000000
	db	%11000000
	db	%11000000
	db	%11000000
	db	%11000000

	rept	$78
	db	%11000000
	endr


;---------------------------------------------------------------
	shorta
destbosssound_l
	lda	#se_destructbossnear
	sta	lsnd
	sta	csnd
	sta	rsnd
	lda	#se_destructbossmid
	sta	msnd
	lda	#se_destructbossfar
	sta	fsnd
	jmp	makesnd

destenemysound_l
	lda	#se_destructenemynear
	sta	lsnd
	sta	csnd
	sta	rsnd
	lda	#se_destructenemymid
	sta	msnd
	lda	#se_destructenemyfar
	sta	fsnd
	jmp	makesnd

damenemysound_l
	lda	#se_damageenemynear
	sta	lsnd
	sta	csnd
	sta	rsnd
	lda	#se_damageenemymid
	sta	msnd
	lda	#se_damageenemyfar
	sta	fsnd
	jmp	makesnd

hitwallsound_l
	lda	#se_hitwallnear
	sta	lsnd
	sta	csnd
	sta	rsnd
	lda	#se_hitwallmid
	sta	msnd
	lda	#se_hitwallfar
	sta	fsnd
	jmp	makesnd

missilesound_l
	lda	#se_missilenear
	sta	lsnd
	sta	csnd
	sta	rsnd
	lda	#se_missilemid
	sta	msnd
	lda	#se_missilefar
	sta	fsnd
	jmp	makesnd

movewallsound_l
	lda	#se_movingwallleft
	sta	lsnd
	lda	#se_movingwallcentre
	sta	csnd
	lda	#se_movingwallright
	sta	rsnd
	lda	#se_movingwallmid
	sta	msnd
	lda	#se_movingwallfar
	sta	fsnd
	jmp	makesnd

lasersound_l
	lda	#se_laserleft
	sta	lsnd
	lda	#se_lasercentre
	sta	csnd
	lda	#se_laserright
	sta	rsnd
	lda	#se_lasermid
	sta	msnd
	lda	#se_laserfar
	sta	fsnd
	jmp	makesnd

enemybattrysound_l
	lda	#se_enemybattrynear
	sta	lsnd
	sta	csnd
	sta	rsnd
	lda	#se_enemybattrymid
	sta	msnd
	lda	#se_enemybattryfar
	sta	fsnd
	jmp	makesnd

ringlasersound_l
	lda	#$5c
	sta	lsnd
	sta	csnd
	sta	rsnd
	lda	#$5d
	sta	msnd
	lda	#$5e
	sta	fsnd
	jmp	makesnd


dooropensound_l
	lda	#054h
	sta	lsnd
	sta	csnd
	sta	rsnd
	lda	#055h
	sta	msnd
	lda	#055h
	sta	fsnd
	jmp	makesnd

doorclosesound_l
	lda	#052h
	sta	lsnd
	sta	csnd
	sta	rsnd
	lda	#053h
	sta	msnd
	lda	#053h
	sta	fsnd
	jmp	makesnd

enemyupsea_l
	lda	#068h
	sta	lsnd
	lda	#069h
	sta	csnd
	lda	#06ah
	sta	rsnd
	lda	#06bh
	sta	msnd
	lda	#06ch
	sta	fsnd
	jmp	makesnd

enemydownsea_l
	lda	#074h
	sta	lsnd
	lda	#075h
	sta	csnd
	lda	#076h
	sta	rsnd
	lda	#077h
	sta	msnd
	lda	#078h
	sta	fsnd
	jmp	makesnd

separatemissile_l
	lda	#049h
	sta	lsnd
	sta	csnd
	sta	rsnd
	lda	#04ah
	sta	msnd
	lda	#04bh
	sta	fsnd
	jmp	makesnd


makesnd	phx
	phy
	php
	ldy	playpt
	jsl	xzdiffs_l
	a16

	lda	rangexz
	cmp	#2000		;dist2snd
	bcc	.dist1
	cmp	#dist3snd
	bcc	.dist2
	cmp	#cutoffsnd
	bcc	.dist3
.ret
	plp
	ply
	plx
	rtl

	longa
.dist1	lda	pviewposx
	sec
	sbc	al_worldx,x
	bmi	.left
.right	cmp	#170
	bcc	.centre
	a8
	lda	lsnd
	jmp	.set
	longa
.left	cmp	#-170
	bcs	.centre
	a8
	lda	rsnd
	jmp	.set
.centre	a8
	lda	csnd
	jmp	.set
.dist2	a8
	lda	msnd
	jmp	.set
.dist3	a8
	lda	fsnd
.set
	jsl	setport3_l
.miss	jmp	.ret



	shorta
	longi
setport3_l	
	php
	pha
	a8
	lda	nosetport3
	bne	.noset

	lda	gameflags2
	and	#gf2_ingame
	beq	.dosnd

	lda	pshipflags2
	and	#psf2_playerHP0
	bne	.noset

.dosnd	pla
.ok
	phx
	ldx	sdspt3
	sta	sdport3,x
	lda	sdspt3
	inc	a
	and	#15
	sta	sdspt3
	plx
	plp
	rtl
.noset
	pla
	plp
	rtl





