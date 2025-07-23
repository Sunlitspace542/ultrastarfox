;***************************************************************************
;*                                                                         *
;*                               Star Fox                                  *
;*                              -----------                                *
;*                                                                         *
;*                           SuperNES version.                             *
;*                                                                         *
;*                                                                         *
;*                           Argonaut Software.                            *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   File: WORLD                                                           *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr: WORLD                                                           *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   Date: 12/2/92                                                         *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;* Author:                                                                 *
;*                                                                         *
;*	Krister Wombell, Giles Goddard, and Dylan Cuthbert                     *
;*                                                                         *
;***************************************************************************

	incpublics	EXT\world.ext




ifobjinvalid	macro
	phx
	ldx	lastmapobj
	bne	.\@
	plx
	jmp	\1
.\@
	plx
	endm

	shorta
	longi

update_objects_l
	ai16
	ldx	playpt
	lda	al_worldz,x
	sec
	sbc	lastplayz
	sta	lastzchange
	lda	al_worldz,x
	sta	lastplayz
	ldx	mapptr
	lda	mapcnt
	sec
	sbc	lastzchange
	bmi	newobjs_l
	sta	mapcnt
	rtl
newobjs_l
	php
	a8
	phb
	jsr	newobjex
	plb
	plp
	rtl
newobjex
	a8
	lda	mapbank
	pha
	plb
	a16
	lda	mapbase&WM,x
	and	#$ff
	txy
	tax
	jmp	(mapjmp,x)
mapjmp	dw	mapobjdo&WM	;0
	dw	mapenddo&WM
	dw	maploopdo&WM	;4
	dw	mapdebdo&WM
	dw	mapnopdo&WM	;8
	dw	mapmother&WM
	dw	mapremove&WM	;12
	dw	setstagedo&WM
	dw	setbgdo&WM	;16
	dw	mapwait&WM
	dw	setbgmdo&WM
	dw	setnodotsdo&WM
	dw	setgnddotsdo&WM	;24
	dw	setspacedustdo&WM
	dw	setothmusdo&WM	;28
	dw	setvofson&WM
	dw	setvofsoff&WM	;32
	dw	sethofson&WM
	dw	sethofsoff&WM	;36
	dw	mapobjzrotdo&WM
	dw	mapjsrdo&WM	;40
	dw	maprtsdo&WM
	dw	mapifdo&WM	;44
	dw	mapgotodo&WM
	dw	setxrotdo&WM	;48
	dw	setyrotdo&WM
	dw	setzrotdo&WM	;52
	dw	setalvarbdo&WM
	dw	setalvarwdo&WM	;56
	dw	setalvarldo&WM
	dw	setalxvarbdo&WM	;60
	dw	setalxvarwdo&WM
	dw	setalxvarldo&WM	;64
	dw	setfadeupdo&WM
	dw	setfadedowndo&WM ;68
	dw	setalvarptrbdo&WM
	dw	setalvarptrwdo&WM ;72
	dw	setvarobjdo&WM
	dw	mapwaitfadedo&WM ;76
	dw	setfadequpdo&WM
	dw	setfadeqdowndo&WM ;80
	dw	setscreenoffdo&WM
	dw	setscreenondo&WM ;84
	dw	setzrotoffdo&WM
	dw	setzrotondo&WM	;88
	dw	mapspecial&WM
	dw	setvarbdo&WM	;92
	dw	setvarwdo&WM
	dw	setvarldo&WM	;96
	dw	setbgslowdo&WM
	dw	waitsetbg&WM	;100
	dw	setbginfo&WM
	dw	addalvarptrbdo&WM ;104
	dw	addalvarptrwdo&WM
	dw	fadetoseado&WM	;108
	dw	fadetogrounddo&WM
	dw	mapqobjdo&WM	;112
	dw	mapobj8do&WM
	dw	mapdobjdo&WM	;116
	dw	mapqobjdo&WM
	dw	map65816&WM	;120
	dw	mapcodejsl&WM
	dw	mapjmpvarlessdo&WM	;124
	dw	mapjmpvarmoredo&WM	;126
	dw	mapjmpvareqdo&WM	;128
	dw	mapsendmessage&WM	;130
	dw	mapCspecial&WM		;132
	dw	mapnormobj&WM		;134
	dw	notneededyet&WM		;136
	dw	mapwait2do&WM		;138
	dw	mapsetpathdo&WM		;140


	longa
	longi
mapsetpathdo	tyx
	ifobjinvalid	.dekinai
	ldy	lastmapobj
	lda	mapbase&WM+1,x
	sta.w	al_sword2,y
.dekinai	inx
	inx
	inx
	jmp	newobjex


	longa
	longi
mapwait2do	tyx
	lda	mapbase&WM+1,x
	and	#255
	asl	a
	asl	a
	asl	a
	asl	a
	sta	mapcnt
	inx
	inx
	stx	mapptr

	rts



notneededyet
	longa
	longi
setbgmdo	tyx
	a8
	lda		pshipflags2
	and		#psf2_playerHP0
	bne		.nobgm

	lda	mapbase&WM+1,x
	sta	bgm_music
	stz	bgmcnt
.nobgm
	inx
	inx
	jmp	newobjex

	longa
	longi
mapsendmessage
	tyx
	phx
	lda	mapbase&WM+1,x
	jsl	send_message_l
	plx
	inx
	inx
	jmp	newobjex


	longa
	longi
map65816	tyx
	txa
	clc
	adc	#mapbase&WM
	tax
	a8
	IFNE	FASTROM
	lda	#$80
	pha
	plb
	ELSEIF
	lda	#0
	pha
	plb
	ENDC	; dbr=0
	lda	#newobjex>>16
	pha
	ldy	#(newobjex-1)&WM
	phy
	lda	mapbank
	pha
	phx
	ldx	lastmapobj
	rtl

	longa
	longi
mapcodejsl	tyx
	phx
	a8
	lda	#.ret>>16
	pha
	ldy	#(.ret-1)&WM
	phy
	lda	mapbase&WM+3,x
	pha
	ldy	mapbase&WM+1,x
	phy
	ldx	lastmapobj
	IFNE	FASTROM
	lda	#$80
	pha
	plb
	ELSEIF
	lda	#0
	pha
	plb
	ENDC	; dbr=0
	rtl

.ret	ai16
	plx
	inx
	inx
	inx
	inx
	jmp	newobjex



	
;--------------------------------------------------------
	longa
	longi
mapjmpvarlessdo
	tyx
	lda	mapbase&WM+1,x
	sta	fptr
	lda	mapbase&WM+2,x
	sta	fptr+1
	a8
	lda.l	[fptr]
	cmp	mapbase&WM+4,x
	bpl	.njmp
	a16
	lda	mapbase&WM+5,x
	tax
	jmp	newobjex
.njmp
	inx
	inx
	inx
	inx
	inx
	inx
	inx
	jmp	newobjex
	
;--------------------------------------------------------
	longa
	longi
mapjmpvarmoredo
	tyx
	lda	mapbase&WM+1,x
	sta	fptr
	lda	mapbase&WM+2,x
	sta	fptr+1
	a8
	lda.l	[fptr]
	cmp	mapbase&WM+4,x
	beq	.njmp
	bmi	.njmp
	a16
	lda	mapbase&WM+5,x
	tax
	jmp	newobjex
.njmp
	inx
	inx
	inx
	inx
	inx
	inx
	inx
	jmp	newobjex
	
;--------------------------------------------------------
	longa
	longi
mapjmpvareqdo
	tyx
	lda	mapbase&WM+1,x
	sta	fptr
	lda	mapbase&WM+2,x
	sta	fptr+1
	a8
	lda.l	[fptr]
	cmp	mapbase&WM+4,x
	bne	.njmp
	a16
	lda	mapbase&WM+5,x
	tax
	jmp	newobjex
.njmp
	inx
	inx
	inx
	inx
	inx
	inx
	inx
	jmp	newobjex
	



	longa
	longi
fadetoseado	tyx
	inx
	ldy	#seapal-seapal+30
	sty	palfade
	sty	lastpalfade
	ldy	#2
	sty	palcnt
	lda	#30
	sta	palnum
	jmp	newobjex
	
	longa
	longi
fadetogrounddo
	tyx
	inx
	ldy	#groundpal-seapal+30
	sty	palfade
	sty	lastpalfade
	ldy	#2
	sty	palcnt
	lda	#30
	sta	palnum
	jmp	newobjex

setrestartfade_l
	php
	ai16
	lda	restartpalfade
	beq	.nodo
	sta	palfade
	ldy	#2
	sty	palcnt
	lda	#30
	sta	palnum
.nodo
	plp
	rtl

	longa
	longi
addalvarptrbdo	tyx
	ifobjinvalid	.dekinai
	lda	mapbase&WM+1,x
	clc
	adc	lastmapobj
	tay
	lda	mapbase&WM+3,x
	sta	fptr
	lda	mapbase&WM+4,x
	sta	fptr+1
	a8
	lda	[fptr]
	clc
	adc.w	0,y
	sta.w	0,y
.dekinai
	inx
	inx
	inx
	inx
	inx
	inx
	jmp	newobjex

	longa
	longi
addalvarptrwdo	tyx
	ifobjinvalid	.dekinai
	lda	mapbase&WM+1,x
	clc
	adc	lastmapobj
	tay
	lda	mapbase&WM+3,x
	sta	fptr
	lda	mapbase&WM+4,x
	sta	fptr+1
	a16
	lda	[fptr]
	clc
	adc.w	0,y
	sta.w	0,y
.dekinai
	inx
	inx
	inx
	inx
	inx
	inx
	jmp	newobjex


	longa
	longi
setbginfo	tyx
	phx

	jsl	setbginfo_l

	plx
	inx
	jmp	newobjex

setbginfo_l
	lda	bgflags
	ora	#bgf_info
	sta	bgflags
	rtl


setbginforeq_l
	php
	ai16
	ldx	playpt
	beq	.nowrite

	lda	newplayerstrat
	ora	newplayerstrat+1
	beq	.con534

	a8
	lda	pshipflags3
	bit	#psf3_keeppstrat
	bne	.con534
	a16

	lda	newplayerstrat
	sta	al_stratptr,x
	lda	newplayerstrat+1
	sta	al_stratptr+1,x
	bra	.con534
.nowrite	blink
.con534
	a8
	lda	pshipflags3
	and	#~psf3_keeppstrat
	sta	pshipflags3
;	stz	keeppstrat


	lda	inatunnel
	sta	tunnelscroll

	lda	levelinfo
	bit	#if_ground!if_space
	beq	.nodots
	bit	#if_ground
	beq	.space
	lda	#1
	sta	dotsflag
	bra	.con_2
.space	lda	#-1
	sta	dotsflag
	sta	dotsflag+1
	bra	.con
.nodots	stz	dotsflag	; set the dots up
.con_2	stz	dotsflag+1
.con

;-----------------------------------------
	lda	levelinfo
	bit	#if_vofson
	beq	.novofs
	jsr	vofsonplease
	bra	.con2
.novofs	jsr	vofsoffplease
.con2
	lda	levelinfo
	bit	#if_hofson
	beq	.nohofs
	lda	#1
	sta	dohofs
	bra	.con3
.nohofs	stz	dohofs
.con3	

;-----------------------------------------
	lda	#0
	sta.l	m_planetstars
	sta.l	m_planetstars+1

	lda	levelinfo
	bit	#if_snow
	beq	.nsnow
	lda	#1
	sta.l	m_planetstars
	sta.l	m_planetstars+1
	bra	.pst

.nsnow
	bit	#if_pollen
	beq	.noplanetstars
	lda	#2
	sta.l	m_planetstars
	sta.l	m_planetstars+1


.pst
	lda	#-1
	sta	dotsflag
	sta	dotsflag+1

.noplanetstars

;-----------------------------------------

	lda	levelinfo
	bit	#if_zroton
	beq	.nozrot
	lda	#1
	sta	dozrot
	bra	.con4
.nozrot	stz	dozrot
.con4	plp
	rtl


	longa
	longi
setvarldo	tyx
	lda	mapbase&WM+1,x
	sta	fptr
	lda	mapbase&WM+2,x
	sta	fptr+1

	lda	mapbase&WM+4,x
	sta.l	[fptr]
	inc	fptr
	inc	fptr
	a8
	lda	mapbase&WM+6,x
	sta.l	[fptr]
	inx

	inx
	inx
	inx

	inx
	inx
	inx
	jmp	newobjex

	longa
	longi
setvarwdo	tyx
	lda	mapbase&WM+3,x
	sta	fptr
	lda	mapbase&WM+4,x
	sta	fptr+1
	lda	mapbase&WM+1,x
	sta	[fptr]
	inx
	inx
	inx
	inx
	inx
	inx
	jmp	newobjex


	longa
	longi
setvarbdo	tyx
	lda	mapbase&WM+2,x
	sta	fptr
	lda	mapbase&WM+3,x
	sta	fptr+1
	a8
	lda	mapbase&WM+1,x
	sta	[fptr]
	inx
	inx
	inx
	inx
	inx
	jmp	newobjex




	longa
	longi
mapspecial	tyx
	ifobjinvalid	.dekinai
	ldy	lastmapobj
	a8
	lda	#asf_special
	sta.w	al_sflags,y
	inc	specialobjtotal
.dekinai
	inx
	jmp	newobjex


	longa
	longi
mapCspecial	tyx
	ifobjinvalid	.dekinai
	ldy	lastmapobj
	a8
	lda	#asf_Cspecial
	sta_sflags	y,Cspecial
	inc	specialobjtotal
.dekinai
	inx
	jmp	newobjex

	longa
	longi
setzrotoffdo
	tyx
	a8
	stz	dozrot
	inx
	jmp	newobjex

	longa
	longi
setzrotondo
	tyx
	a8
	lda	#1
	sta	dozrot
	inx
	jmp	newobjex

	longa
	longi
setscreenoffdo
	tyx
	a8
	stz	fadedir
	stz	fade
	lda	#$80
	setinidisp1
	sta	inidisp
	inx
	jmp	newobjex

	longa
	longi
setscreenondo
	tyx
	a8
	stz	fadedir
	lda	#$f
	sta	fade
	setinidisp1
	sta	inidisp
	inx
	jmp	newobjex

	longa
	longi
mapwaitfadedo
	tyx
	a8
	lda	fade
	bne	.wait
	lda.l	xinidisp1
	cmp	#$80
	bne	.wait
	inx
	jmp	newobjex
.wait	lda	#1
	sta	mapcnt
	stz	mapcnt+1
	stx	mapptr
	rts

	longa
	longi
setvarobjdo	tyx
	ifobjinvalid	.dekinai
	lda	mapbase&WM+1,x
	sta	fptr
	lda	mapbase&WM+2,x
	sta	fptr+1
	lda	lastmapobj
	sta.l	[fptr]
.dekinai
	inx
	inx
	inx
	inx
	jmp	newobjex


	longa
	longi
setalvarptrbdo	tyx
	ifobjinvalid	.dekinai
	lda	mapbase&WM+1,x
	clc
	adc	lastmapobj
	tay
	lda	mapbase&WM+3,x
	sta	fptr
	lda	mapbase&WM+4,x
	sta	fptr+1
	a8
	lda	[fptr]
	sta.w	0,y
.dekinai
	inx
	inx
	inx
	inx
	inx
	inx
	jmp	newobjex

	longa
	longi
setalvarptrwdo	
	tyx
	ifobjinvalid	.dekinai
	lda	mapbase&WM+1,x
	clc
	adc	lastmapobj
	tay
	lda	mapbase&WM+3,x
	sta	fptr
	lda	mapbase&WM+4,x
	sta	fptr+1
	a16
	lda	[fptr]
	sta.w	0,y
.dekinai
	inx
	inx
	inx
	inx
	inx
	inx
	jmp	newobjex

	longa
	longi
setfadeupdo	tyx
	a8
	lda	#1
	sta	fadedir
	inx
	jmp	newobjex
	longa
	longi
setfadedowndo
	tyx
	a8
	lda	#-1
	sta	fadedir
	inx
	jmp	newobjex

	longa
	longi
setfadequpdo
	tyx
	a8
	lda	#2
	sta	fadedir
	inx
	jmp	newobjex
	longa
	longi
setfadeqdowndo
	tyx
	a8
	lda	#-2
	sta	fadedir
	inx
	jmp	newobjex

	longa
	longi
setalvarbdo	tyx
	ifobjinvalid	.dekinai
	lda	mapbase&WM+1,x
	clc
	adc	lastmapobj
	tay
	a8
	lda	mapbase&WM+3,x
	sta.w	0,y
.dekinai
	inx
	inx
	inx
	inx
	jmp	newobjex

	longa
	longi
setalvarwdo	tyx
	ifobjinvalid	.dekinai
	lda	mapbase&WM+1,x
	clc
	adc	lastmapobj
	tay
	lda	mapbase&WM+3,x
	sta.w	0,y
.dekinai	inx
	inx
	inx
	inx
	inx
	jmp	newobjex

	longa
	longi
setalvarldo	tyx
	ifobjinvalid	.dekinai
	lda	mapbase&WM+1,x
	clc
	adc	lastmapobj
	tay
	lda	mapbase&WM+3,x
	sta.w	0,y
	a8
	lda	mapbase&WM+5,x
	sta.w	2,y
.dekinai
	inx
	inx
	inx
	inx
	inx
	inx
	jmp	newobjex


	longa
	longi
setalxvarbdo
	tyx
	ifobjinvalid	.dekinai
	lda	lastmapobj
	clc
	adc	mapbase&WM+1,x
	txy
	tax
	a8
	lda.w	mapbase&WM+3,y
	sta.l	xalblks,x
	tyx
.dekinai
	inx
	inx
	inx
	inx
	jmp	newobjex

	longa
	longi
setalxvarwdo
	tyx
	ifobjinvalid	.dekinai
	lda	lastmapobj
	clc
	adc	mapbase&WM+1,x
	txy
	tax
	lda.w	mapbase&WM+3,y
	sta.l	xalblks,x
	tyx
.dekinai
	inx
	inx
	inx
	inx
	inx
	jmp	newobjex

	longa
	longi
setalxvarldo
	tyx
	ifobjinvalid	.dekinai
	lda	lastmapobj
	clc
	adc	mapbase&WM+1,x
	txy
	tax
	lda.w	mapbase&WM+3,y
	sta.l	xalblks,x
	a8
	lda.w	mapbase&WM+5,y
	sta.l	xalblks+2,x
	tyx
.dekinai
	inx
	inx
	inx
	inx
	inx
	inx
	jmp	newobjex


	longa
	longi
mapwaitdo	tyx
	lda	mapbase&WM+1,x
	sta	mapcnt
	inx
	inx
	inx
	stx	mapptr

	rts

	longa
	longi
setxrotdo	tyx
	a8
	ifobjinvalid	.dekinai
	lda	mapbase&WM+1,x
	ldy	lastmapobj
	sta.w	al_rotx,y
.dekinai
	inx
	inx
	jmp	newobjex

	longa
	longi
setyrotdo	tyx
	ifobjinvalid	.dekinai
	a8
	lda	mapbase&WM+1,x
	ldy	lastmapobj
	sta.w	al_roty,y
.dekinai
	inx
	inx
	jmp	newobjex

	longa
	longi
setzrotdo	tyx
	a8
	ifobjinvalid	.dekinai
	lda	mapbase&WM+1,x
	ldy	lastmapobj
	sta.w	al_rotz,y
.dekinai
	inx
	inx
	jmp	newobjex

	longa
	longi
mapgotodo
	tyx
	a8
	lda	mapbase&WM+3,x
	sta	mapbank
	a16
	lda	mapbase&WM+1,x
	tax
	jmp	newobjex

	longa
	longi
mapifdo
	tyx
	phx
	a8
	lda	#.ret>>16
	pha
	a16
	lda	#(.ret-1)&WM
	pha

	a8
	lda	mapbase&WM+3,x
	pha
	a16
	lda	mapbase&WM+1,x
	dec	a
	pha

	a8
	IFNE	FASTROM
	lda	#$80
	pha
	plb
	ELSEIF
	lda	#0
	pha
	plb
	ENDC	; dbr=0

	rtl


.ret	bcs	.nodo

	a8
	lda	mapbank
	pha
	plb

	ai16
	plx
	inx
	inx
	inx
	inx
	inx
	inx
	stx	mapptr
	lda	#1
	sta	mapcnt

	rts

.nodo	
	a8
	lda	mapbank
	pha
	plb

	ai16
	plx
	lda	mapbase&WM+4,x
	tax
	jmp	newobjex

	longa
	longi
mapjsrdo
	tyx
	ldy	mapjsrptr
	txa
	sta.w	mapjsrstk,y
	a8
	lda	mapbank
	sta.w	mapjsrstk+2,y
	a16
	iny
	iny
	iny
	sty	mapjsrptr
	a8
	lda	mapbase&WM+3,x
	sta	mapbank
	a16
	lda	mapbase&WM+1,x
	tax
	inc	nummapjsr
	jmp	newobjex

	longa
	longi
maprtsdo
	tyx
	ldy	mapjsrptr
	dey
	a8
	lda.w	mapjsrstk,y
	sta	mapbank
	a16
	dey
	dey
	ldx	mapjsrstk,y
	sty	mapjsrptr
	inx
	inx
	inx
	inx
	dec	nummapjsr
	jmp	newobjex


	longa
	longi
setvofson	tyx
	jsr	vofsonplease
	inx
	jmp	newobjex
vofsonplease_l
	jsr	vofsonplease
	rtl
vofsonplease
	php
	a8
	lda	bg2scroll
	sta	bg2vofs
	lda	bg2scroll+1
	sta	bg2vofs
	lda	#1
	sta	dovofs
	lda	#2
	sta	bgmode
	plp
	rts

	longa
setvofsoff	tyx
	jsr	vofsoffplease
	inx
	jmp	newobjex
vofsoffplease_l
	jsr	vofsoffplease
	rtl

vofsoffplease
	php
	a8
	stz	dovofs
	lda	#1
	sta	bgmode
	lda	bg2scroll
	sta	bg2vofs
	lda	bg2scroll+1
	sta	bg2vofs
	plp
	rts


	longa
sethofson	tyx
	a8
	lda	#1
	sta	dohofs
	inx
	jmp	newobjex
	longa
sethofsoff	tyx
	a8
	stz	dohofs
	inx
	jmp	newobjex

	longa
	longi
setothmusdo	tyx
	a8
	lda	mapbase&WM+1,x
	sta	othmusic
	inx
	inx
	jmp	newobjex

	longa
	longi
setnodotsdo	tyx
	stz	dotsflag
	inx
	jmp	newobjex
setgnddotsdo
	tyx
	lda	#1
	sta	dotsflag
	inx
	jmp	newobjex
setspacedustdo
	tyx
	lda	#-1
	sta	dotsflag
	inx
	jmp	newobjex

	longa
	longi
waitsetbg	tyx
	phx
	lda	bg_dmalist
	tax
	lda.l	bglists,x
	sta	x1
	lda.l	bglists+1,x
	ora	x1
	beq	.con
	plx
	stx	mapptr
	rts
.con	plx
	inx
	jmp	newobjex

	longa
	longi
setbgslowdo
	tyx
	lda	mapbase&WM+1,x
	and	#255
	sta	bgtransspeed
	lda	mapbase&WM+2,x
	sta	bg_dmalist
	sta	currentbg
	inx
	inx
	inx
	inx
	jmp	newobjex
	
	longa
	longi
setbgdo	tyx
	phx

	a16
	lda	mapbase&WM+1,x
	jsl	setbg_l

	plx
	inx
	inx
	inx
	jmp	newobjex

	longa
	longi
setbg_l
	sta	currentbg
	lda	bgflags
	ora	#bgf_bg
	sta	bgflags
	rtl

dobgreq_l
	ai16
	ldx	currentbg
.loop
	lda.l	bglists,x
	sta	x1
	lda.l	bglists+1,x
	sta	x2
	ora	x1
	beq	.out
	phx
	a8
	lda	#.ret>>16
	pha
	a16
	lda	#(.ret-1)&WM
	pha

	a8
	lda	x1
	pha
	ldx	x2
	dex
	phx
	rtl
.ret
	a16
	plx
	inx
	inx
	inx
	bra	.loop
.out
	rtl



	longa
	longi
setstagedo
	tyx
	lda	#50
	sta	stagecnt
	inx
	jmp	newobjex

	longa
	longi
mapqobjdo
	tyx
	lda	map_count,x
	and	#255
	asl	a
	asl	a
	asl	a
	asl	a
	sta	mapcnt
	phx
	ldx	allst
	l_add	allst,alfreelst,.nofreeblks
	txy
	plx
	a8
	jsl	init_objvars_l
	a16

	lda	mq_x,x
	sexa
	asl	a
	asl	a
	sta.w	al_worldx,y
	lda	mq_y,x
	sexa
	asl	a
	asl	a
	sta.w	al_worldy,y
	lda	mq_z,x
	and	#255
	asl	a
	asl	a
	asl	a
	asl	a
	phy
	ldy	playpt
	clc
	adc.w	al_worldz,y
	ply
	sta.w	al_worldz,y

	lda	map_ctrl,x
	and	#255
	cmp	#ctrlmapqobj2
	bne	.norm

	lda	mq_shape,x
	phx
	and	#255
	asl	a
	asl	a
	tax
	lda.l	istrats,x
	sta.w	al_stratptr,y
	a8
	lda.l	istrats+2,x
	sta.w	al_stratptr+2,y
	lda.l	istrats+3,x
	a16
	and	#255
	asl	a
	tax
	lda.l	shapes,x
	sta.w	al_shape,y
	plx
	bra	.aha
.norm
	lda	mq_shape,x
	phx
	and	#255
	asl	a
	tax
	lda.l	shapes,x
	sta.w	al_shape,y
	plx

	lda	mq_strat,x
	phx
	and	#255
	asl	a
	asl	a
	tax
	lda.l	istrats,x
	sta.w	al_stratptr,y
	a8
	lda.l	istrats+2,x
	sta.w	al_stratptr+2,y
	plx

.aha
	a16
	sty	lastmapobj

	jsr	.incx

	lda	mapcnt
	bne	.listfull
	jmp	newobjex
.listfull	stx	mapptr
	rts
.nofreeblks	a16
	ldx	#0
	stx	lastmapobj
	plx
	jsr	.incx
	lda	mapcnt
	bne	.listfull
	jmp	newobjex

.incx	lda	map_ctrl,x
	and	#255
	cmp	#ctrlmapqobj2
	beq	.oneway
	txa
	clc
	adc	#mq_sizeof
	tax
	rts
.oneway	txa
	clc
	adc	#mq_sizeof-1
	tax
	rts

	longa
	longi
mapobj8do
	tyx
	lda	map_count,x
	and	#255
	asl	a
	asl	a
	sta	mapcnt
	phx
	ldx	allst
	l_add	allst,alfreelst,.nofreeblks
	txy
	plx
	a8
	jsl	init_objvars_l
	a16

	lda	m8_x,x
	sexa
	asl	a
	asl	a
	sta.w	al_worldx,y
	lda	m8_y,x
	sexa
	asl	a
	asl	a
	sta.w	al_worldy,y
	lda	m8_z,x
	sexa
	asl	a
	asl	a
	asl	a
	asl	a
	phy
	ldy	playpt
	clc
	adc.w	al_worldz,y
	ply
	sta.w	al_worldz,y

	lda	m8_shape,x
	sta.w	al_shape,y
	lda	m8_strat,x
	sta.w	al_stratptr,y
	a8
	lda	m8_strat+2,x
	sta.w	al_stratptr+2,y
	a16
	sty	lastmapobj

	txa
	clc
	adc	#m8_sizeof
	tax

	lda	mapcnt
	bne	.listfull
	jmp	newobjex
.listfull	stx	mapptr
	rts
.nofreeblks	a16
	stz	lastmapobj
	pla
	clc
	adc	#m8_sizeof
	tax

	lda	mapcnt
	bne	.listfull
	jmp	newobjex



	longa
	longi
mapobjdo
	tyx
	lda	map_count,x
	sta	mapcnt
	phx
	ldx	allst
	l_add	allst,alfreelst,.nofreeblks
	txy
	plx
	a8
	jsl	init_objvars_l
	a16

	lda	mobj_x,x
	sta.w	al_worldx,y
	lda	mobj_y,x
	sta.w	al_worldy,y
	phy
	ldy	playpt
	lda.w	al_worldz,y
	ply
	clc
	adc	mobj_z,x
	sta.w	al_worldz,y

	lda	mobj_shape,x
	phx
	and	#255
	asl	a
	tax
	lda.l	shapes,x
	sta.w	al_shape,y
	plx

	lda	mobj_strat,x
	phx
	and	#255
	asl	a
	asl	a
	tax
	lda.l	istrats,x
	sta.w	al_stratptr,y
	a8
	lda.l	istrats+2,x
	sta.w	al_stratptr+2,y
	plx

	sty	lastmapobj

	a16
	txa
	clc
	adc	#mobj_sizeof
	tax

	lda	mapcnt
	bne	.listfull
	jmp	newobjex
.listfull	stx	mapptr
	rts
.nofreeblks	a16
	stz	lastmapobj
	pla
	clc
	adc	#mobj_sizeof
	tax

	lda	mapcnt
	bne	.listfull
	jmp	newobjex


	longa
	longi
mapdobjdo
	tyx
	lda	map_count,x
	sta	mapcnt
	phx
	ldx	allst
	l_add	allst,alfreelst,.nofreeblks
	txy
	plx
	a8
	jsl	init_objvars_l
	a16

	lda	md_x,x
	sta.w	al_worldx,y
	lda	md_y,x
	sta.w	al_worldy,y
	phy
	ldy	playpt
	lda.w	al_worldz,y
	ply
	clc
	adc	md_z,x
	sta.w	al_worldz,y

	lda	md_strat,x
	phx
	and	#255
	asl	a
	asl	a
	tax
	lda.l	istrats,x
	sta.w	al_stratptr,y
	a8
	lda.l	istrats+2,x
	sta.w	al_stratptr+2,y
	lda.l	istrats+3,x
	a16
	and	#255
	asl	a
	tax
	lda.l	shapes,x
	sta.w	al_shape,y
	plx

	sty	lastmapobj

	a16
	txa
	clc
	adc	#md_sizeof
	tax

	lda	mapcnt
	bne	.listfull
	jmp	newobjex
.listfull	stx	mapptr
	rts
.nofreeblks	a16
	stz	lastmapobj
	pla
	clc
	adc	#md_sizeof
	tax

	lda	mapcnt
	bne	.listfull
	jmp	newobjex

	longa
	longi
mapobjzrotdo
	tyx
	lda	map_count,x
	sta	mapcnt
	phx
	ldx	allst
	l_add	allst,alfreelst,.nofreeblks
	txy
	plx
	a8
	jsl	init_objvars_l
	a16

	lda	mz_x,x
	sta.w	al_worldx,y
	lda	mz_y,x
	sta.w	al_worldy,y
	phy
	ldy	playpt
	lda.w	al_worldz,y
	ply
	clc
	adc	mz_z,x
	sta.w	al_worldz,y

	lda	mz_shape,x
	phx
	and	#255
	asl	a
	tax
	lda.l	shapes,x
	sta.w	al_shape,y
	plx

	lda	mz_strat,x
	phx
	and	#255
	asl	a
	asl	a
	tax
	lda.l	istrats,x
	sta.w	al_stratptr,y
	a8
	lda.l	istrats+2,x
	sta.w	al_stratptr+2,y
	plx

	lda	mz_rotz,x
	sta.w	al_rotz,y

	sty	lastmapobj
	
	a16
	txa
	clc
	adc	#mz_sizeof
	tax

	lda	mapcnt
	bne	.listfull
	jmp	newobjex
.listfull	stx	mapptr
	rts
.nofreeblks	a16
	stz	lastmapobj
	pla
	clc
	adc	#mz_sizeof
	tax

	lda	mapcnt
	bne	.listfull
	jmp	newobjex


	longa
	longi
mapenddo	tyx
	stx	mapptr
	rts  			;**** end of level



	longa
	longi
maploopdo
	tya
	ldx	#0
.findloop	cmp	mapaddrs,x
	beq	.thisloop
	inx
	inx
	cpx	#8
	bne	.findloop
.newloop
	ldx	nummaploops
	sta	mapaddrs,x
	lda.w	mapbase&WM+3,y
	sta	maploops,x

	inc	nummaploops
	inc	nummaploops

	lda.w	mapbase&WM+1,y
	tax
	jmp	newobjex

.thisloop
	lda	maploops,x
	dec	a
	beq	.end
	sta	maploops,x
	tyx
	lda	mapbase&WM+1,x
	tax
	jmp	newobjex

.end
	stz	mapaddrs,x
	stz	maploops,x
	dec	nummaploops
	dec	nummaploops
	tyx
	inx
	inx
	inx
	inx
	inx
	jmp	newobjex


	longa
	longi
mapdebdo	blink

	longa
	longi
mapnopdo	inx
	jmp	newobjex


;--------------------------------------------------------------
; mapnormobj:
;--------------------------------------------------------------

	longa
	longi
mapnormobj

	tyx
	lda	map_count,x
	sta	mapcnt
	phx
	ldx	allst
	l_add	allst,alfreelst,.nofreeblks
	txy
	sty	lastmapobj
	plx
	a8
	jsl	init_objvars_l
	a16

	lda	mm_x,x
	sta.w	al_worldx,y
	lda	mm_y,x
	sta.w	al_worldy,y
	phy
	ldy	playpt
	lda.w	al_worldz,y
	ply
	clc
	adc	mm_z,x
	sta.w	al_worldz,y

	lda	mm_shape,x
	sta.w	al_shape,y

	lda	mm_strat,x
	sta.w	al_stratptr,y
	lda	mm_strat+1,x
	sta.w	al_stratptr+1,y

	a16
	txa
	clc
	adc	#mm_sizeof-2
	tax
.chkit
	lda	mapcnt
	bne	.listfull
	jmp	newobjex
.listfull	stx	mapptr
	rts
.nofreeblks	a16
	stz	lastmapobj
	pla
	clc
	adc	#mm_sizeof-2
	tax
	bra	.chkit





;--------------------------------------------------------------
; mapmother:
; this generates a mother ship type of alien which generates
; other aliens according to the list specified
; the strategy specified must use the macro s_bemother
;--------------------------------------------------------------

	longa
	longi
mapmother

	tyx
	lda	map_count,x
	sta	mapcnt
	phx
	ldx	allst
	l_add	allst,alfreelst,.nofreeblks
	txy
	sty	lastmapobj
	plx
	a8
	jsl	init_objvars_l
	a16

	lda	mm_x,x
	sta.w	al_worldx,y
	lda	mm_y,x
	sta.w	al_worldy,y
	phy
	ldy	playpt
	lda.w	al_worldz,y
	ply
	clc
	adc	mm_z,x
	sta.w	al_worldz,y

	lda	mm_shape,x
	sta.w	al_shape,y

	lda	mm_strat,x
	sta.w	al_stratptr,y
	lda	mm_strat+1,x
	sta.w	al_stratptr+1,y

	lda	mm_map,x
	sta.w	al_ptr,y		; store the pointer to the map

	lda	#atzremove
	sta.w	al_type,y

	a16
	txa
	clc
	adc	#mm_sizeof
	tax
.chkit
	lda	mapcnt
	bne	.listfull
	jmp	newobjex
.listfull	stx	mapptr
	rts
.nofreeblks	a16
	stz	lastmapobj
	pla
	clc
	adc	#mm_sizeof
	tax
	bra	.chkit





;----------------------------------------------------------------------
; mapremove:
; this removes the object with the specified shape from the alien list
;----------------------------------------------------------------------

	longa
	longi
mapremove
	ldx	allst
	beq	.out

.keepsearching
	lda	_next,x
	tax
	beq	.out
	lda	mr_shape,y
	cmp	al_shape,x
	bne	.keepsearching
	phy
	jsl	removedeadal_l
	ply

.out
	tya
	clc
	adc	#mr_sizeof
	tax
	jmp	newobjex


;----------------------------------------------------------------------
; mapwait
; this is like adding a null object
;----------------------------------------------------------------------

	longa
	longi

mapwait
	tyx
	inx
	inx
	inx
	lda	mapbase&WM+1-3,x
	beq	.zero
	sta	mapcnt
	stx	mapptr
	rts
.zero	jmp	newobjex


	incfile	ASM\mother.asm





