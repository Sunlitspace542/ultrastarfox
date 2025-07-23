dist1	equ	200
ctrlmapobj	equ	0
ctrlend	equ	2
ctrlloop	equ	4
ctrlmapdeb	equ	6
ctrlmapnop equ	8
ctrlmapmother equ	10
ctrlmapremove equ	12
ctrlsetstage equ 	14
ctrlsetbg	equ	16
ctrlmapwait	equ	18
ctrlsetbgm	equ	20
ctrlnodots	equ	22
ctrlgnddots	equ	24
ctrlspacedust equ	26
ctrlsetothmus equ	28
ctrlvofson	equ	30
ctrlvofsoff	equ	32
ctrlhofson	equ	34
ctrlhofsoff	equ	36
ctrlmapobjzrot equ	38
ctrlmapjsr	equ	40
ctrlmaprts	equ	42
ctrlmapif	equ	44
ctrlmapgoto	equ	46
ctrlsetxrot	equ	48
ctrlsetyrot	equ	50
ctrlsetzrot	equ	52
ctrlsetalvarb equ	54
ctrlsetalvarw equ	56
ctrlsetalvarl equ	58
ctrlsetalxvarb equ	60
ctrlsetalxvarw equ	62
ctrlsetalxvarl equ	64
ctrlsetfadeup equ	66
ctrlsetfadedown equ	68
ctrlsetalvarptrb equ	70
ctrlsetalvarptrw equ	72
ctrlsetvarobj equ	74
ctrlmapwaitfade equ	76
ctrlsetqfadeup equ	78
ctrlsetqfadedown equ	80
ctrlscreenoff equ	82
ctrlscreenon equ	84
ctrlzrotoff	equ	86
ctrlzroton	equ	88
ctrlmapspecial equ	90
ctrlsetvarb     equ	92
ctrlsetvarw     equ	94
ctrlsetvarl     equ	96
ctrlsetbgslow   equ	98
ctrlwaitsetbg   equ	100
ctrlsetbginfo   equ	102
ctrladdalvarptrb equ	104
ctrladdalvarptrw equ	106
ctrlfadetosea    equ 108
ctrlfadetoground equ 110
ctrlmapqobj	    equ 112
ctrlmapobj8	equ	114
ctrlmapdobj	equ	116
ctrlmapqobj2	equ	118
ctrl65816	equ	120
ctrlmapcodejsl equ	122
ctrlmapjmpvarless	equ	124
ctrlmapjmpvarmore	equ	126
ctrlmapjmpvareq	equ	128
ctrlsendmessage	equ	130
ctrlmapcspecial	equ	132
ctrlnobj		equ	134
ctrlmqnobj		equ	136
ctrlmapwait2		equ	138
ctrlmapsetpath		equ	140

;-----------------------------------------------------------------------------
mapdef	macro
	dw	((\1)&$7fff)
	db	(\1)>>16
	endm

mapsetpath	macro	[path]
	db	ctrlmapsetpath
	dw	path_{path}
	endm

wipein	macro
	mapcode_jsl	initblack_l
	setvar.b stayblack,30
	mapwait	300
	setvar.w circleanim,\1
	setvar.b stayblack,-1
	endm

wipeout	MACRO
	setvar.w circleanim,\1
	setvar.b doneacircle,1
	ENDM

markboss	macro
	start_65816
	ai16
	lda	#\1-endseqboss
	jsl	setboss_l
	end_65816
	endm

coursedef	macro
	dw	((\1)&$7fff)
	endm

;mapobj8	macro	frame,x,y,z,shape,strategy
;	db	ctrlmapobj8
;	db	(\1)>>2
;	db	(\2)>>2,(\3)>>2,(\4)>>4
;	dw	(\5)&WM
;	dw	(\6)&WM
;	db	(\6)>>16
;	endm

mapdobj	macro	frame,x,y,z,shape,strategy

	db	ctrlmapdobj		; control.
	dw	\1		; frame relative to last.
	dw	\2,\3,\4		; x,y,z position.
	db	is_\6
	endm

mapobj	macro	frame,x,y,shape,strategy

qqmapnormobj	=	1
	IFD	is_\5
	IFD	sh_\6

qqmapnormobj	=	0
	IFLT	((\1)>>4)-256
	IFGT	((\2)+512)
	IFLT	((\2)-512)
	IFGT	((\3)+512)
	IFLT	((\3)-512)
	IFLT	((\4)>>4)-256
	mapqobj	\1,\2,\3,\4,\5,\6
	MEXIT
	ENDC
	ENDC
	ENDC
	ENDC
	ENDC
	ENDC

	IFD	is_\5
	IFEQ	sh_\6-is_\5
	mapdobj	\1,\2,\3,\4,\5,\6
	MEXIT
	ENDC
	ELSEIF
	printf	"\5 is undefined in istrats.asm%n"
;	fail	; \5 is undefined in istrats.asm
	ENDC

	db	ctrlmapobj		; control.
	dw	\1		; frame relative to last.
	IFD	_SASM
	dw	\2,\3,\4		; x,y,z position.
	ENDC
	IFD	_ARGSFX
	dw	(\2)&WM,(\3)&WM,(\4)&WM		; x,y,z position.
	ENDC
	db	is_\5		; shape.
	db	is_\6

	ENDC
	ENDC

	IFNE	qqmapnormobj

	mapnobj	\1,\2,\3,\4,\5,\6

	ENDC
	endm


mnobjnum	=	0
mapnobj	macro


; not worth implementing yet:
;	IFLT	((\1)>>4)-256
;	IFGT	((\2)+512)
;	IFLT	((\2)-512)
;	IFGT	((\3)+512)
;	IFLT	((\3)-512)
;	IFLT	((\4)>>4)-256
;	mapqnobj	\1,\2,\3,\4,\5,\6
;	MEXIT
;	ENDC
;	ENDC
;	ENDC
;	ENDC
;	ENDC
;	ENDC


mnobjnum	=	mnobjnum+1
	db	ctrlnobj
	dw	(\1)
	dw	(\2),(\3),(\4)
	dw	(\5)
	dw	(\6)&WM
	db	(\6)>>16
	endm





mapqnobj	macro	frame,x,y,z,shape,strategy
	db	ctrlmqnobj			; control.
	db	((\1)>>4)&$ff		; frame relative to last.
	db	((\2)>>2)&$ff		; x position.
	db	((\3)>>2)&$ff
	db	((\4)>>4)&$ff		; z pos
	dw	\5		; shape.
	dw	\6		; strategy
	db	\6>>16
	endm




mapqobj	macro	frame,x,y,z,shape,strategy
mqom	=	ctrlmapqobj
	IFD	is_\5
	IFEQ	sh_\6-is_\5
mqom	=	ctrlmapqobj2
	ENDC
	ELSEIF
	printf	"\5 is undefined in istrats.asm%n"
;	fail	; \5 is undefined in istrats.asm
	ENDC


	db	mqom			; control.
	db	((\1)>>4)&$ff		; frame relative to last.
	db	((\2)>>2)&$ff		; x position.
	db	((\3)>>2)&$ff
	db	((\4)>>4)&$ff		; z pos
	IFNE	mqom-ctrlmapqobj2
	db	is_\5		; shape.
	ELSEIF
	ENDC
	db	is_\6		; strategy
	endm

mapozrotnum	=	0
mapobjzrot	macro	x,y,strategy,zrot
mapozrotnum	=	mapozrotnum+1
	db	ctrlmapobjzrot	; control.
	dw	\1
	dw	\2,\3,\4		; x,y,z position.
	db	is_\5		; shape 
	db	is_\6
	db	\7		; z rot
	endm

maploop	macro	label
	db	ctrlloop
	dw	(\1)&$7fff
	dw	\2-1
	endm

mapend	macro
	IFEQ	NARG-1
	setvar	levelfinished,\1
	ELSEIF
	setvar	levelfinished,1
	ENDC
	db	ctrlend
	endm

mapdeb	macro
	db	ctrlmapdeb
	endm

mapnop	macro
	db	ctrlnopobj
	endm

setstage	macro
	db	ctrlsetstage
	endm

setbg	macro
c_SLOW	=	1234
c_SLOWLY	=	1234
c_WITHTIME	=	1234
c_TAKEYOURTIMEABOUTIT	=	1234
	IFEQ	(NARG-2)&(NARG-3)
	IFEQ	c_\2-1234
	db	ctrlsetbgslow
	IFEQ	NARG-3
	db	\3
	ELSEIF
	db	7
	ENDC
	ELSEIF
	error	"Illegal Parameter: \1"
	ENDC
	ELSEIF
	db	ctrlsetbg
	ENDC
	dw	bg_\1-bglists
	endm

setnodots	macro
	db	ctrlnodots
	endm

setgnddots	macro
	db	ctrlgnddots
	endm

setspacedust macro
	db	ctrlspacedust
	endm

setothmus	macro
	db	ctrlsetothmus
	db	\1
	endm

setbgm	macro
	db	ctrlsetbgm
	db	\1
	endm

vofson	macro
	db	ctrlvofson
	endm
vofsoff	macro
	db	ctrlvofsoff
	endm
hofson	macro
	db	ctrlhofson
	endm
hofsoff	macro
	db	ctrlhofsoff
	endm

mapjsr	macro
	db	ctrlmapjsr
	dw	(\1)&$7fff
	db	(\1)>>16
	endm

maprts	macro
	db	ctrlmaprts
	endm

mapif	macro
	db	ctrlmapif
	dw	\1&wm
	db	\1>>16
	dw	(\2)&$7fff
	endm

mapgoto	macro
	db	ctrlmapgoto
	dw	(\1)&$7fff
	db	(\1)>>16
	endm

setxrot	macro
	db	ctrlsetxrot
	db	\1
	endm
setyrot	macro
	db	ctrlsetyrot
	db	\1
	endm
setzrot	macro
	db	ctrlsetzrot
	db	\1
	endm


addalvarptr	macro				; alvar,value
	ifc	'\0','N'
	db	ctrladdalvarptrb
	endc
	ifc	'\0','W'
	db	ctrladdalvarptrw
	endc
	dw	al_\1
	dw	\2&wm
	db	\2>>16
	endm

setalvar	macro

	ifd	alx_\1
	error	<Can't do alx_var in setalvar>
	endc

	ifc	'\0','N'
	db	ctrlsetalvarb
	dw	al_\1
	db	\2
	endc
	ifc	'\0','W'
	db	ctrlsetalvarw
	dw	al_\1
	dw	\2
	endc
	ifc	'\0','L'
	db	ctrlsetalvarl
	dw	al_\1
	dw	\2&wm
	db	\2>>16
	endc
	endm

setalvarptr	macro				; alptr,ptr
	ifc	'\0','N'
	db	ctrlsetalvarptrb
	endc
	ifc	'\0','W'
	db	ctrlsetalvarptrw
	endc
	dw	al_\1
	dw	\2
	db	\2>>16
	endm



setvarobj	macro				; ptr
	db	ctrlsetvarobj
	dw	\1
	db	\1>>16
	endm

setvar	macro
	ifc	'\0','N'
	db	ctrlsetvarb
	db	\2
	endc
	ifc	'\0','B'
	db	ctrlsetvarb
	db	\2
	endc
	ifc	'\0','W'
	db	ctrlsetvarw
	dw	\2
	endc
	ifc	'\0','L'
	db	ctrlsetvarl
	dw	\2&wm
	db	\2>>16
	endc
	IFD	_SASM
	dw	\1
	db	\1>>16
	ENDC
	IFD	_ARGSFX
	dw	(\1)&WM
	db	(\1)>>16
	ENDC
	endm



setalxvar	macro
	ifc	'\0','N'
	db	ctrlsetalxvarb
	dw	alx_\1-xalblks
	db	\2
	endc
	ifc	'\0','W'
	db	ctrlsetalxvarw
	dw	alx_\1-xalblks
	dw	\2
	endc
	ifc	'\0','L'
	db	ctrlsetalxvarl
	dw	alx_\1-xalblks
	dw	\2&wm
	db	\2>>16
	endc
	endm

setfadeup	macro
	ifeq	narg
	db	ctrlsetfadeup
	elseif
	db	ctrlsetqfadeup
	endc
	endm
setfadedown	macro
	ifeq	narg
	db	ctrlsetfadedown
	elseif
	db	ctrlsetqfadedown
	endc
	endm
mapwaitfade	macro
	db	ctrlmapwaitfade
	endm
mapscreenoff macro
	db	ctrlscreenoff
	endm
mapscreenon macro
	db	ctrlscreenon
	endm

zrotoff	macro
	db	ctrlzrotoff
	endm

zroton	macro
	db	ctrlzroton
	endm

special	MACRO
	mapobj	0,\2,\3,\4,\5,\6
	mapspecial
	mapwait	\1
	ENDM

Cspecial	MACRO
	mapobj	0,\2,\3,\4,\5,\6
	mapCspecial
	mapwait	\1
	ENDM


mapspecial	MACRO
	db	ctrlmapspecial
	ENDM

mapCspecial	MACRO
	db	ctrlmapCspecial
	ENDM

waitsetbg	MACRO
	db	ctrlwaitsetbg
	ENDM

initbg	MACRO
	waitsetbg
	db	ctrlsetbginfo
	ENDM

;------------------------------------------------------------------------
ctrlmotherobj   equ	0
ctrlmotherloop  equ	2
ctrlmotherend   equ	4
ctrlmotherrnd   equ	6
ctrlmothergoto  equ	8
ctrlmotherwait  equ	10
ctrlmothercount equ	12
ctrlmotherjump  equ	14
ctrlmotherset   equ	16
;------------------------------------------------------------------------
mapmother	macro	frame,x,y,z,shape,strategy,map
	db	ctrlmapmother	; control
	dw	\1		; wait value
	dw	\2,\3,\4		; x,y,z
	dw	\5&wm		; shape
	dw	(\6)&wm		; strategy
	db	(\6)>>16	; strategy
	dw	(\7)&$7fff	; map
	endm

mapwait	macro	; map wait function
	IFNE	\1
	IFLT	((\1)>>4)-256
	db	ctrlmapwait2
	db	(\1)>>4
	ELSEIF
	db	ctrlmapwait

	IFD	_SASM
	dw	\1
	ENDC

	IFD	_ARGSFX
	dw	(\1)&WM
	ENDC

	ENDC
	ENDC
	endm



maprem	macro	frame,shape to remove
	db	ctrlmapremove
	ifeq	narg-1
	dw	0
	dw	\1&wm
	elseif
	dw	\1
	dw	\2&wm
	endc
	endm

motherobj	macro	frame,x,y,z,shape,strat
	db	ctrlmotherobj		; control.
	dw	\1		; frame relative to last.
	dw	\2,\3,\4		; x,y,z position.
	dw	\5&wm		; shape.
	dw	(\6)&wm		; strategy.
	db	(\6)>>16
	endm

motherloop	macro	frame,addr,count or addr,count
	db	ctrlmotherloop
	ifeq	narg-2
	dw	0
	dw	(\1)&$7fff
	db	\2
	elseif
	dw	\1
	dw	(\2)&$7fff
	db	\3
	endc
	endm

mothergoto	macro	frame,addr or just addr only
	db	ctrlmothergoto
	ifeq	narg-1
	dw	0
	dw	(\1)&$7fff
	elseif
	dw	\1
	dw	(\2)&$7fff
	endc
	endm

motherend	macro	(deletes the current alien mother)
	db	ctrlmotherend
	endm

motherrnd	macro	frame,x,y,z,shape,strat
	db	ctrlmotherrnd		; control.
	dw	\1		; frame relative to last.
	dw	\2,\3,\4		; x,y,z random mask.
	dw	\5&wm		; shape.
	dw	(\6)&wm		; strategy.
	db	(\6)>>16
	endm

motherwait	macro	frame
	db	ctrlmotherwait
	dw	\1
	endm

motherset	macro	frame,b|w,alvar|var,alvar,value or b|w,type,alvar,value
	db	ctrlmotherset
	ifeq	narg-5
	dw	\1
type	=	0

	ifc	'\2','w'
type	=	type!1
	elseif
	ifcc	'\2','b'
	fail	; invalid parameter (b/w should be specified)
	endc
	endc

	ifc	'\3','alvar'
type	=	type!2
	endc
	elseif
	ifcc	'\3','var'
	fail	; invalid parameter (alvar!var should be specified)
	endc

	db	type

	dw	(\4)&wm
	db	(\4)>>16
	dw	\5
	elseif
	endc
	endm


mothercnt	macro	frame,shape or just shape to count
	db	ctrlmothercount
	ifeq	narg-1
	dw	0
	dw	\1
	elseif
	dw	\1
	dw	\2
	endc
	endm



pubalub	macro	frame,shape or just shape to count
	db	ctrlmothercount
	ifeq	narg-1
	dw	0
	dw	\1
	elseif
	dw	\1
	dw	\2
	endc
	endm


motherjump	macro	frame,cmp value,condition,address
	db	ctrlmotherjump

	ifeq	narg-3
	dw	0
	dw	\1
	dw	(\3)&$7fff

	ifc	'\2','EQ'
	db	mj_eq
	endc

	ifc	'\2','NE'
	db	mj_ne
	endc

	ifc	'\2','GT'
	db	mj_gt
	endc

	ifc	'\2','LT'
	db	mj_lt
	endc

	elseif

	dw	\1
	dw	\2
	dw	(\4)&$7fff

	ifc	'\3','eq'
	db	mj_eq
	endc

	ifc	'\3','ne'
	db	mj_ne
	endc

	ifc	'\3','gt'
	db	mj_gt
	endc

	ifc	'\3','lt'
	db	mj_lt
	endc
	endc

	endm


mapfadetosea macro
	db	ctrlfadetosea
	endm

mapfadetoground macro
	db	ctrlfadetoground
	endm


;-----------------------------------------------------------------

setrestart	MACRO
	start_65816
	a8i16

	IFEQ	NARG
	lda	#.\@>>16
	ldx	#.\@&$7fff
	ELSEIF
	lda	#\1>>16
	ldx	#\1&$7fff
	ENDC

	jsl	set_restart_position_l
	end_65816
.\@
	ENDM

;-----------------------------------------------------------------
; x is set up pointing to the last map object created
start_65816	MACRO
	db	ctrl65816
	shorta
	longi
	ENDM
;-----------------------------------------------------------------

end_65816	MACRO
	IFEQ	longi
	i16
	ENDC
	ldx	#.con\@&$7fff
	rtl
.con\@
	ENDM

;------------------------------------------------------------------
; switch out of 65816 into the map at the specified point
switch	MACRO
	IFC	"\0","N"
	IFEQ	LONGI
	i16
	ENDC
	ldx	#(\1)&$7fff
	rtl
	ELSEIF
tli_blob	=	longi
	b\0	.doit\@
	bra	.dontdoit\@
.doit\@
	IFEQ	LONGI
	i16
	ENDC
	ldx	#(\1)&$7fff
	rtl
	IFNE	tli_blob
	LONGI
	ELSEIF
	SHORTI
	ENDC
.dontdoit\@
	ENDC


	ENDM
;------------------------------------------------------------------

mapcode_jsl	MACRO
	db	ctrlmapcodejsl
	dw	((\1)-1)&WM
	db	((\1)>>16)
	ENDM
;------------------------------------------------------------------


meters_off	MACRO
	setvar	m_meters,0
	IFD	mo_\1
; only if screen is off! (and before a set or initbg)
	mapcode_jsl	setcharmapfrommap_l
	ENDC
		ENDM
mo_trans
meters_on	MACRO
	setvar	m_meters,1
	IFD	mo_\1
; only if screen is off! (and before a set or initbg)
	mapcode_jsl	setcharmapfrommap_l
	ENDC
		ENDM

;------------------------------------------------------------------
il_nofadenostage	equ	1
il_whitefadeout		equ	2
il_nometers		equ	3

initlevel	MACRO
wipedone	=	0
	setfadedown	quick
	mapwaitfade
	setbg	\1
	initbg
	setvar	specialobjtotal,0
	setvar	specials_dead,0


;	start_65816
;	a16
;	stz	lastplayz
;	stz	pviewposz
;	ldx	playpt
;	stz	al_worldz,x
;	a8
;	end_65816


	IFEQ	NARG-3

	IFEQ	il_\2-il_nofadenostage
	ifnc	"\3","0"
	wipein	\3
wipedone	=	1
	endc
	mapcode_jsl	initblack_l
	setvar		stayblack,2
	MEXIT
	ENDC

	IFEQ	il_\2-il_whitefadeout
	mapcode_jsl	initblack_l
	setvar		stayblack,-1
	mapcode_jsl	initfadewhite2norm_l
	ENDC

	ELSEIF

	ifnc	"\2","0"
	wipein	\2
wipedone	=	1
	endc
	mapcode_jsl	initblack_l
	setvar		stayblack,2
	ENDC

	mapwait	1
	mapwait	1
	setstage
	IFNE	wipedone
	setvar	stayblack,-1
	ENDC
	setfadeup	quick
	setrestart
	ENDM

;------------------------------------------------------------------
mapplayermode	MACRO		\1 mode name
	mapgotoifplayerdead	.skip\@
	start_65816
	phb
	lda	#$7e
	pha
	plb

	jsl		set_player\1_l
	a16
	lda	#set_player\1_l&WM
	sta	newplayerstrat
	a8
	lda	#set_player\1_l>>16
	sta	newplayerstrat+2

	plb
	end_65816
.skip\@
	ENDM


;------------------------------------------------------------------
mapgotoifplayerdead	MACRO	label
	start_65816
	a8
	lda		pshipflags2
	and		#psf2_playerHP0
	beq		.ok\@
	switch		\1
.ok\@
	end_65816
		ENDM

;------------------------------------------------------------------
mapCLplayermode	MACRO		\1 mode name
	start_65816
	phb
	lda	#$7e
	pha
	plb
	jsl	calcteamdamage_l
	jsl	set_player\1_l
	lda	playerflymode
	and	#~pfm_wobble
	sta	playerflymode
	plb
	end_65816

	ENDM


;------------------------------------------------------------------
mapplayercantdie	MACRO		
	start_65816
	a8
	lda		pstratflags
	ora		#pstf_notdie
	sta		pstratflags
	end_65816
	ENDM


;------------------------------------------------------------------
mapPLAYEROUTVIEW	MACRO
.wait\@	mapwait	5

	start_65816
	a8
	lda		pshipflags2
	and		#psf2_playerHP0
	beq		.cont
	switch	.wait\@
.cont
	lda		pstratflags
	ora		#pstf_inseq
	sta		pstratflags

	lda		splayerflymode
	cmp		#spfm_inside
	beq		.do\@
	switch		.cont\@
.do\@	lda		#spfm_tonorm
	sta		splayerflymode

	phb
	lda	#$7e
	pha
	plb
	jsl		changeviewmode_l
	plb

	end_65816
	mapwait		2000
.cont\@
	ENDM


;------------------------------------------------------------------
mapPLAYEROUTDIST	MACRO
	start_65816
	lda		#spfm_tonorm
	sta		splayerflymode
	a16
	lda	#outviewdist
	sta	viewdist
	end_65816
	ENDM




;------------------------------------------------------------------
maptexitwait	MACRO

	IFEQ	NARG-1
	mapwait	1000+\1
	ELSEIF
	mapwait	1000
	ENDC


	ENDM

;------------------------------------------------------------------
mapjmpvarless	macro	  ; var,value
	db	ctrlmapjmpvarless
	dw	\1&wm
	db	\1>>16
	db	\2
	dw	(\3)&$7fff
	endm
;------------------------------------------------------------------
mapjmpvarmore	macro	  ; var,value
	db	ctrlmapjmpvarmore
	dw	\1&wm
	db	\1>>16
	db	\2
	dw	(\3)&$7fff
	endm
;------------------------------------------------------------------
mapjmpvareq	macro	  ; var,value
	db	ctrlmapjmpvareq
	dw	\1&wm
	db	\1>>16
	db	\2
	dw	(\3)&$7fff
	endm

;------------------------------------------------------------------
printlevelfin	MACRO
	setvar	levelfinished,3
	ENDM
;------------------------------------------------------------------

mwb_nosound

mapwaitboss	MACRO	[nosound]
 	mapwait	100

	IFND	mwb_{nosound}
		
	start_65816
	trigse	$0b
	end_65816

	ENDC

.loop\@	mapif	chkbossdead,.cont\@
	mapgoto	.loop\@
.cont\@
	mapplayercantdie	
	start_65816
	a8
	lda	pshipflags
	ora	#psf_nofire
	sta	pshipflags	
	lda	#0
	sta.l	m_bossmaxHP
	IFNE	hidehudonbossdeath
	sta.l	m_meters
	ENDC
	end_65816

	IFND	mwb_{nosound}
	ifeq	NARG
	setbgm	$f1
	elseif
	setbgm	{nosound}
	endc
	endc
	ENDM
;------------------------------------------------------------------

mapmsg	MACRO	[messagenumber]
	db	ctrlsendmessage
	db	{messagenumber}
	ENDM

;------------------------------------------------------------------
waitfadefin	MACRO
.here\@
	mapwait	1

	start_65816
	a8
	lda	fadedir
	beq	.nsw\@
	switch	.here\@
.nsw\@
	end_65816
	ENDM


;------------------------------------------------------------------
CLfriendmsg	MACRO
fmes10_frog	=	87
fmes10_cock	=	85
fmes10_bunny	=	86

fmes20_frog	=	84
fmes20_cock	=	82
fmes20_bunny	=	83

fmes30_frog	=	81
fmes30_cock	=	79
fmes30_bunny	=	80

fmes40_frog	=	77
fmes40_cock	=	75
fmes40_bunny	=	76


	start_65816
	a8
	lda	#-1
	sta	friends_meter

	lda	\1
	beq	.nosend\@
	cmp	#10
	bne	.nm10\@
	lda	#fmes10_\1
	bra	.send\@
.nm10\@
	cmp	#20
	bne	.nm20\@
	lda	#fmes20_\1
	bra	.send\@
.nm20\@
	cmp	#30
	bne	.nm30\@
	lda	#fmes30_\1
	bra	.send\@
.nm30\@
	lda	#fmes40_\1

.send\@
	jsl	send_message_l
.nosend\@	
	end_65816

	ENDM
	
;------------------------------------------------------------------



;**********************************************************************************
;**********************************************************************************
;**********************************************************************************
;**********************************************************************************
;** SPECIAL MAP MACROS


mapt	MACRO	


	REPT	\1
	emapobj	500,0000,0000,4000,RADER_1,RADER1_ISTRAT
	ENDR
	
	mapwait	4000

	mapobj	0000,0000,0000,4000,BU_\1,hard_Istrat
	setalvar	roty,deg180
	mapwait	4000

	mapobj	0000,0000,0000,4000,BU_\1,hard_Istrat
	setalvar	roty,deg180-deg90
	mapwait	4000

	mapobj	0000,0000,0000,4000,BU_\1,hard_Istrat
	setalvar	roty,deg180+deg90
	mapwait	2000


	ENDM


sprout_data	MACRO	; x,y,z,speed,length
	setalvar	sbyte3,\1
	setalvar	sbyte2,\2
	setalvar	sbyte1,\3
	setalvar	sword1,\4
	setalvar	sword1+1,\5
	ENDM

arm	MACRO	; mapwait,x,y,z,shape,strat,number of joints
	mapobj		0000,\2,\3,\4,\5,\6
	setalvar	sword1,\7
	setalvar	rotx,-deg90
	setalvar	roty,-deg90
	mapwait		\1
	ENDM
	



ttruck	MACRO
	mapobj	0000,-500+tsize*\1,0000,4096+(\2*tsize),truck,truck_Istrat
	setalvar	roty,\3
	ENDM

thoriz	MACRO
	mapobj	0000,-500+tsize*\1,0000,4096+(\2*tsize),rail_0,nocoll_Istrat
	ENDM
tvert	MACRO
	mapobj	0000,-500+tsize*\1,0000,4096+(\2*tsize),rail_0,nocoll_Istrat
	setalvar	roty,deg90
	ENDM

tcorner	MACRO
	mapobj	0000,-500+tsize*\1,0000,4096+(\2*tsize),rail_4,trackcorner_Istrat
	setalvar	roty,\3
	setalvar	sbyte1,\4
	ENDM

tstart	MACRO
tx	=	\1
tz	=	\2
ta	=	dir\3
	ttruck	tx,tz,ta
	ENDM

tanothertruck	MACRO
	ttruck	tx,tz,ta
		ENDM

tmnorth	MACRO
tz	=	tz+1
	ENDM
tmsouth	MACRO
tz	=	tz-1
	ENDM
tmeast	MACRO
tx	=	tx+1
	ENDM
tmwest	MACRO
tx	=	tx-1
	ENDM

tnorth	MACRO
	IFEQ	ta-dirEAST
	tleft
	tmnorth
	ENDC
	IFEQ	ta-dirWEST
	tright
	tmnorth
	ENDC

	tvert	tx,tz
	tmnorth
ta	=	dirNORTH
	ENDM

twest	MACRO
	IFEQ	ta-dirNORTH
	tleft
	tmwest
	ENDC
	IFEQ	ta-dirSOUTH
	tright
	tmwest
	ENDC

	thoriz	tx,tz
	tmwest
ta	=	dirWEST
	ENDM

tsouth	MACRO
	IFEQ	ta-dirWEST
	tleft
	tmsouth
	ENDC
	IFEQ	ta-dirEAST
	tright
	tmsouth
	ENDC

	tvert	tx,tz
tz	=	tz-1
ta	=	dirSOUTH
	ENDM

teast	MACRO
	IFEQ	ta-dirNORTH
	tright
	tmeast
	ENDC
	IFEQ	ta-dirSOUTH
	tleft
	tmeast
	ENDC

	thoriz	tx,tz
	tmeast
ta	=	dirEAST
	ENDM

tright	MACRO
ta	=	ta-deg90
	tcorner	tx,tz,ta,1
	ENDM

tleft	MACRO
ta	=	ta+deg90
	tcorner	tx,tz,ta,0
	ENDM


szaco2_mapobj	MACRO		; X pos,Y pos,to X pos,to Y offset,wait
	mapobj		0000,\1,\2,2000,zaco_8,szaco2_Istrat
	setalxvar.w	sWPx1,\3
	setalxvar.w	sWPy1,\4
	setalvar	rotx,-deg90

	IFEQ		\1
	setalvar	roty,deg180
	ELSEIF	
	IFLT		0-\1
	setalvar	roty,-deg90
	ELSEIF
	setalvar	roty,deg90
	ENDC
	ENDC
	
	IFNE		\5
	mapwait		\5
	ENDC



	ENDM





;-------------------------------------------------------------------------------------
map_setbarshape	MACRO	solid/wire,[autowait]
	defs	$1,"\1"
dist	=	3000
xlen	=	SXspacebarlen/2
ylen	=	SYspacebarlen/2
zlen	=	SZspacebarlen/2
clen	=	xlen
swait	=	0

wsb_autowait	=	0
dowaitZ	=	1

	IFEQ	NARG-2
	IFD	wsb_\2
dowaitZ	=	0
	ENDC
	ENDC
		ENDM


calcsbwait	MACRO	z
	IFEQ	dowaitZ
	IFGT	\1-swait
	mapwait	(\1-swait)*Zlen
swait	=	\1
	ENDC
	ENDC
	ENDM
	

;-------------------------------------------------------------------------------------

map_spacebarC	MACRO	x,y,z,init Z rot,speed
	mapobj	0000,(\1)*clen,space_viewCY+((\2)*clen),dist+((\3)*clen),XP\$1spacebar,spacebar1_Istrat
	setalvar	rotz,(\4*deg45)	; init z rot
	setalvar	sbyte1,\5	; Zrot speed
	setvarobj	mapvar1
pos	=	\3*Clen
	ENDM

map_spacebarIC	MACRO	x,y,z,init Z rot,speed
	mapobj	0000,(\1)*clen,space_viewCY+((\2)*clen),dist+((\3)*clen),nullshape,spacebar1_Istrat
	setalvar	rotz,(\4*deg45)	; init z rot
	setalvar	sbyte1,\5	; Zrot speed
	setalvar	sbyte2,1	; no collision
	setvarobj	mapvar1
pos	=	\3*Clen
	ENDM


map_spacebarX	MACRO	x,y,z,init Z rot
	mapobj	0000,(\1)*clen,space_viewCY+((\2)*clen),dist+((\3)*clen)+pos,XP\$1spacebar,spacebar3_Istrat
	setalvar	rotz,(\4*deg45)	; init z rot
	setalvarptr.w	ptr,mapvar1
	ENDM

map_spacebarZ	MACRO	x,y,z,init Z rot
	mapobj	0000,(\1)*clen,space_viewCY+((\2)*clen),dist+((\3)*clen)+pos,Z\$1spacebar,spacebar3_Istrat
	setalvar	rotz,(\4*deg45)	; init z rot
	setalvarptr.w	ptr,mapvar1
	ENDM



map_spacebarSC	MACRO	x,y,z,init Z rot,speed
	mapobj	0000,(\1)*clen,space_viewCY+((\2)*clen),dist+(\3),SXP\$1spacebar,spacebar1_Istrat
	setalvar	rotz,(\4*deg45)	; init z rot
	setalvar	sbyte1,\5	; Zrot speed
	setvarobj	mapvar1
pos	=	\3*Clen
	ENDM

map_spacebarSX	MACRO	x,y,z,init Z rot
	mapobj	0000,(\1)*clen,space_viewCY+((\2)*clen),dist+((\3)*clen)+pos,SXP\$1spacebar,spacebar3_Istrat
	setalvar	rotz,(\4*deg45)	; init z rot
	setalvarptr.w	ptr,mapvar1
	ENDM

map_spacebarSZ	MACRO	x,y,z,init Z rot
	mapobj	0000,(\1)*clen,space_viewCY+((\2)*clen),dist+((\3)*clen)+pos,SZ\$1spacebar,spacebar3_Istrat
	setalvar	rotz,(\4*deg45)	; init z rot
	setalvarptr.w	ptr,mapvar1
	ENDM


;-------------------------------------------------------------------------------------


map_XPspacebar	MACRO	wait,x,y,z,init Z rot,speed
	mapobj	0000,(\2*xlen),space_viewCY+(\3*ylen),dist+(\4*Zlen),XP\$1spacebar,SPINspacebar_Istrat
	setalvar	rotz,(\5*deg45)	; init z rot
	setalvar	sbyte1,\6	; Zrot speed
	map_spacebarwait	\1
	ENDM

map_SXPspacebar	MACRO	wait,x,y,z,init Z rot,speed
	mapobj	0000,(\2*xlen),space_viewCY+(\3*ylen),dist+(\4*Zlen),SXP\$1spacebar,SPINspacebar_Istrat
	setalvar	rotz,(\5*deg45)	; init z rot
	setalvar	sbyte1,\6	; Zrot speed
	map_spacebarwait	\1
	ENDM


map_Xspacebar	MACRO	x,y,z
	mapobj	0,(\1)*Xlen,space_viewCY+(\2)*Ylen,dist+(((\3)*Zlen)*dowaitZ),X\$1spacebar,spacebar_Istrat
	calcsbwait	\3
	ENDM

map_Yspacebar	MACRO	x,y,z
	mapobj	0,(\1)*Xlen,space_viewCY+(\2)*Ylen,dist+(((\3)*Zlen)*dowaitZ),Y\$1spacebar,spacebar_Istrat
	calcsbwait	\3
	ENDM

map_Zspacebar	MACRO	x,y,z
	mapobj	0,(\1)*Xlen,space_viewCY+(\2)*Ylen,dist+(((\3)*Zlen)*dowaitZ),Z\$1spacebar,spacebar_Istrat
	calcsbwait	\3
	ENDM


map_SXspacebar	MACRO	x,y,z
	mapobj	0,(\1)*Xlen,space_viewCY+(\2)*Ylen,dist+(((\3)*Zlen)*dowaitZ),SX\$1spacebar,spacebar_Istrat
	calcsbwait	\3
	ENDM

map_SYspacebar	MACRO	x,y,z
	mapobj	0,(\1)*Xlen,space_viewCY+(\2)*Ylen,dist+(((\3)*Zlen)*dowaitZ),SY\$1spacebar,spacebar_Istrat
	calcsbwait	\3
	ENDM

map_SZspacebar	MACRO	x,y,z
	mapobj	0,(\1)*Xlen,space_viewCY+(\2)*Ylen,dist+(((\3)*Zlen)*dowaitZ),SZ\$1spacebar,spacebar_Istrat
	calcsbwait	\3
	ENDM


map_RYspacebar	MACRO	x,y,z,Y rot
	map_Xspacebar	\1,\2,\3
	setalvar	roty,(\4*deg45)
	calcsbwait	\3
	ENDM

map_SRYspacebar	MACRO	x,y,z,Y rot
	map_SXspacebar	\1,\2,\3
	setalvar	roty,(\4*deg45)
	calcsbwait	\3
	ENDM

	


map_spacebarwait	MACRO
	mapwait	((\1)*Zlen)
	ENDM

map_SBtypeOBJ	MACRO		wait,x,y,z,shape,strat
	mapobj	\1*Zlen,\2*Xlen,space_viewCY+(\3*Ylen),dist+(\4*Zlen),\5,\6
	ENDM



map_SBtype0	MACRO		wait,x,y,z
	map_Yspacebar	\2,\3,\4
	map_spacebarwait		\1
	ENDM

map_SBtype1	MACRO		wait,x,y,z
	map_Xspacebar	\2,\3,\4
	map_spacebarwait		\1
	ENDM

map_SBtype2	MACRO		wait,x,y,z
	map_Xspacebar	\2,\3,\4
	map_Yspacebar	\2,\3,\4
	map_spacebarwait		\1
	ENDM

map_SBtype3	MACRO		wait,x,y,z
	map_spacebarC	\2,\3,\4,0,-6
	map_spacebarX	\2,\3,0,2
	map_spacebarwait		\1
	ENDM

map_SBtype4	MACRO		wait,x,y,z
	map_Xspacebar	\2,\3,\4
	map_Yspacebar	\2,\3+2,\4
	map_spacebarwait		\1
	ENDM


map_SBtype5	MACRO		wait,x,y,z
	map_Zspacebar	\2,\3,\4
	map_spacebarwait		\1
	ENDM


map_SBtype6	MACRO		wait,x,y,z
	map_XPspacebar	\1,\2,\3,\4,2,-4
	ENDM


map_SBtype7	MACRO		wait,x,y,z
	map_spacebarC	\2,\3,\4,0,4
	map_spacebarX	\2+2,\3,0,2
	map_spacebarwait		\1
	ENDM

map_SBtype8	MACRO		wait,x,y,z
	map_SZspacebar	\2,\3,\4
	map_spacebarwait		\1
	ENDM

map_SBtypeA	MACRO		wait,x,y,z
	map_SXPspacebar	\1,\2,\3,\4,2,-4
	ENDM



map_SBtypeB	MACRO		wait,x,y,z
	map_SYspacebar	\2,\3,\4
	map_spacebarwait		\1
	ENDM

map_SBtypeC	MACRO		wait,x,y,z
	map_SXspacebar	\2,\3,\4
	map_spacebarwait		\1
	ENDM

map_SBtypeD	MACRO		wait,x,y,z
	map_Xspacebar	\2+2,\3-2,\4
	map_Yspacebar	\2+3,\3,\4
	map_SXspacebar	\2+2,\3,\4
	map_Zspacebar	\2+3,\3+2,\4+2
	map_Xspacebar	\2+5,\3+2,\4+4
	map_Yspacebar	\2+3,\3+1,\4+4
	map_spacebarwait		\1
	ENDM

map_SBtypeE	MACRO		wait,x,y,z
	map_Xspacebar	\2-1,\3,\4		; +1
	map_Xspacebar	\2-5,\3,\4		; -3
	map_Yspacebar	\2-7,\3+1,\4		; -5
	map_Xspacebar	\2-9,\3-1,\4		; -7
	map_Xspacebar	\2-9,\3+3,\4		; -7
	map_Zspacebar	\2-7,\3,\4+2		; -5
	map_SYspacebar	\2-7,\3,\4+4		; -5
	map_SXspacebar	\2-8,\3-1,\4		; -6
	map_SXspacebar	\2-8,\3+1,\4		; -6
	map_spacebarwait		\1
	ENDM

map_SBtypeF	MACRO		wait,x,y,z
	map_Xspacebar	\2,\3,\4
	map_RYspacebar	\2+2,\3,\4,3
	map_RYspacebar	\2-1,\3,\4+3,3
	map_Xspacebar	\2-2,\3,\4+6
	map_Xspacebar	\2+2,\3,\4+6
	map_RYspacebar	\2+4,\3,\4+6,3
	map_RYspacebar	\2+1,\3,\4+9,3
	map_Xspacebar	\2,\3,\4+12
	map_spacebarwait		\1
	ENDM

map_SBtype10	MACRO		wait,x,y,z
	map_spacebarC	\2,\3,\4,0,6
	map_spacebarX	\2,\3,0,2
	map_spacebarwait		\1
	ENDM


map_SBtype11	MACRO		wait,x,y,z
	map_Yspacebar	\2,\3,\4
	map_Xspacebar	\2+2,\3-2,\4
	map_Xspacebar	\2+2,\3+2,\4
	map_Yspacebar	\2+4,\3+2,\4
	map_Zspacebar	\2,\3-2,\4-2
	map_Zspacebar	\2,\3+2,\4+2
	map_SYspacebar	\2,\3+1,\4+4
	map_Zspacebar	\2+4,\3-2,\4+2
	map_SXspacebar	\2+3,\3-2,\4+4
	map_spacebarwait		\1
	ENDM

map_SBtype12	MACRO		wait,x,y,z
	map_Yspacebar	\2,\3,\4
	map_Yspacebar	\2+4,\3,\4
	map_Xspacebar	\2+2,\3-2,\4
	map_Xspacebar	\2+2,\3+2,\4
	map_SYspacebar	\2,\3-3,\4
	map_SZspacebar	\2,\3-2,\4+1
	map_Zspacebar	\2,\3+2,\4+2

	map_SYspacebar	\2,\3+2,\4+4
	map_SZspacebar	\2+1,\3+2,\4+4

	map_RYspacebar	\2+4,\3-2,\4,3
	map_SZspacebar	\2+4,\3-2,\4-1

	map_spacebarwait		\1
	ENDM



map_SBtype13	MACRO		wait,x,y,z
	map_XPspacebar	\1,\2,\3,\4,2,4
	ENDM


map_SBtype14	MACRO		wait,x,y,z
	map_spacebarC	\2,\3,\4,0,-3
	map_spacebarSX	\2-2,\3-1,0,2
	map_spacebarZ	\2+2,\3,2,0
	map_spacebarX	\2+2,\3+2,0,2
	map_spacebarwait		\1
	ENDM


map_SBtype15	MACRO		wait,x,y,z,init Z rot,speed
	map_spacebarIC	\2,\3,\4,\5,\6
	map_spacebarX	\2,\3-2,0,\5
	map_spacebarX	\2,\3+1,0,\5
	map_spacebarwait		\1
	ENDM


map_SBtype16	MACRO		wait,x,y,z,Xvel,Spin speed
	IFEQ	\6
	mapobj	0000,\2*Xlen,space_viewCY+(\3*Ylen),dist+(\4*Zlen),X\$1spacebar,spacebarshoot_Istrat
	ELSEIF
	mapobj	0000,\2*Xlen,space_viewCY+(\3*Ylen),dist+(\4*Zlen),XP\$1spacebar,spacebarshoot_Istrat
	ENDC
	setalvar.w	sword1,\5
	setalvar	sbyte1,\6
	map_spacebarwait		\1
	ENDM

map_SBtype17	MACRO		wait,x,y,z,Yvel,Spin speed
	IFEQ	\6
	mapobj	0000,\2*Xlen,space_viewCY+(\3*Ylen),dist+(\4*Zlen),Y\$1spacebar,spacebarshoot_Istrat
	ELSEIF
	mapobj	0000,\2*Xlen,space_viewCY+(\3*Ylen),dist+(\4*Zlen),XP\$1spacebar,spacebarshoot_Istrat
	setalvar	rotz,deg90
	ENDC

	setalvar.w	sword2,\5
	setalvar	sbyte1,\6
	map_spacebarwait		\1
	ENDM



map_SBtype18	MACRO		wait,x,y,z,init,speed
	map_XPspacebar	\1,\2,\3,\4,\5,\6
	ENDM

map_SBtype19	MACRO		wait,x,y,z,init,speed
	map_SXPspacebar	\1,\2,\3,\4,\5,\6
	ENDM


map_b8beamT	MACRO
	mapobj	0000,0000,(-75<<boss8_scale)+nucleusheight,boss8_circ,boss_8_5,nucleusbeamL_Istrat
	setalvar	sbyte2,\1
		ENDM

map_b8beamB	MACRO
	mapobj	0000,0000,(-35<<boss8_scale)+nucleusheight,boss8_circ,boss_8_5,nucleusbeamL_Istrat
	setalvar	sbyte2,\1
		ENDM




roottree	MACRO
	mapobj	0000,\2,\3,\4,stalk,tree3_istrat
	setalvar	sbyte2,\5
	mapwait	\1
	ENDM


nessie	MACRO
	mapobj	0000,\2,\3,\4,nullshape,lochnessmonster_istrat
	setalvar	roty,\5
	setalvar	sword1+1,\6	; time until tail appears
	mapwait	\1
	ENDM


pathobj	MACRO	; wait,x,y,z,shape,path,hp,ap
defaulthpap	=	0
	IFEQ		\7-10
	IFEQ		\8-10
defaulthpap	=	1
	ENDC
	ENDC

	IFEQ	defaulthpap
	mapobj	0000,\2,\3,\4,\5,path_istrat
	setalvar	hp,\7
	setalvar	ap,\8
	ELSEIF
	mapobj	0000,\2,\3,\4,\5,pathdha_istrat
	ENDC
	mapsetpath	\6
	mapwait	\1
	ENDM

pathspecial	MACRO	; same as path
defaulthpap	=	0
	IFEQ		\7-10
	IFEQ		\8-10
defaulthpap	=	1
	ENDC
	ENDC

	IFEQ	defaulthpap
	mapobj	0000,\2,\3,\4,\5,path_istrat
	setalvar	hp,\7
	setalvar	ap,\8
	ELSEIF
	mapobj	0000,\2,\3,\4,\5,pathdha_istrat
	ENDC
	mapsetpath	\6
	mapspecial
	mapwait	\1
	ENDM

pathCspecial	MACRO	; same as path
defaulthpap	=	0
	IFEQ		\7-10
	IFEQ		\8-10
defaulthpap	=	1
	ENDC
	ENDC

	IFEQ	defaulthpap
	mapobj	0000,\2,\3,\4,\5,path_istrat
	setalvar	hp,\7
	setalvar	ap,\8
	ELSEIF
	mapobj	0000,\2,\3,\4,\5,pathdha_istrat
	ENDC
	mapsetpath	\6
	mapCspecial
	mapwait	\1
	ENDM

textpath	MACRO	; wait,x,y,z,text,path,colour[,size]
	mapobj	0000,\2,\3,\4,nullshape,patht_istrat
	setalxvar.w	coltab,msg_\5&WM
	mapsetpath	\6
	setalxvar.n	depthoffset,\7
	IFEQ	NARG-8
	setalxvar.n	tx,\8
	ENDC
	mapwait	\1
	ENDM

mapdebug	MACRO
	start_65816
	blink	3
	end_65816
	ENDM

mapnozremove	MACRO
	start_65816
	a8
	lda	gameflags
	ora	#gf_nozremove
	sta	gameflags
	end_65816
	ENDM
	
mapzremove	MACRO
	start_65816
	a8
	lda	gameflags
	and	#~gf_nozremove
	sta	gameflags
	end_65816
	ENDM

maphardRot	MACRO
	mapobj	0,\2,\3,\4,\5,hardRot_Istrat
	setalvar	sbyte1,\6
	setalvar	sbyte2,\7
	setalvar	sbyte3,\8
	mapwait	\1
	ENDM	



msfmem	=	0
;-------------------------------------------------------------------------------------
map_farships0	MACRO	
	mapobj		0300,\1,space_viewcy+\2,\3,ship_s_0,ships_Istrat
	setalvar.w	sword1,\4
	setalvar.w	sword2,\5
	setalxvar.w	depthoffset,\6
	setalvar	roty,deg180
	ENDM

map_farships1	MACRO	
	mapobj		0300,\1,space_viewcy+\2,\3,ship_s_1,ships_Istrat
	setalvar.w	sword1,\4
	setalvar.w	sword2,\5
	setalxvar.w	depthoffset,\6
	setalvar	roty,deg180
	ENDM

map_farships2	MACRO	
	mapobj		0300,\1,space_viewcy+\2,\3,ships,ships_Istrat
	setalvar.w	sword1,\4
	setalvar.w	sword2,\5
	setalxvar.w	depthoffset,\6
	ENDM

;-------------------------------------------------------------------------------------

fadeoutbgm	MACRO
	setbgm	$f1
	mapwait	medpspeed*30
	ENDM
;-------------------------------------------------------------------------------------
mapjmpfrienddead	MACRO	name,label
friendwait	=	medpspeed*30

	start_65816
	a8
	lda	\1
	beq	.dead\@
	switch	.ok2\@
.dead\@
	end_65816

	IFNE	NARG-3	
	mapwait	friendwait
	ENDC

	mapgoto	\2
.ok2\@
		ENDM

;-------------------------------------------------------------------------------------
map_sfish	MACRO	wait,x,y,z,number of fish
	mapobj	0,\2,\3,\4,s_fish,sfish_Istrat
	setvarobj	mapvar1
	rept	\5-1
	mapobj	0,0,0,4000,s_fish,sfish_Istrat
	setalvarptr.w	ptr,mapvar1
	endr
	mapwait	\1

	ENDM
;-------------------------------------------------------------------------------------
mapobjnomem	MACRO
	mapobj	\1,\2,\3,\4,\5,\6
	ENDM


;-------------------------------------------------------------------------------------
mapLRdoor	MACRO	wait,Z
	mapobj	0,-45,-60,\2,open_l,openlr_Istrat
	mapobj	0,45,-60,\2,open_l,openlr_Istrat
	setalvar	rotz,deg180
	mapwait	\1
	ENDM

;-------------------------------------------------------------------------------------
mapUPDNdoor	MACRO	wait,Z
	mapobj	\1,0,-60,\2,up_door,updoor_Istrat
	ENDM

;-------------------------------------------------------------------------------------
mapDNUPdoor	MACRO	wait,Z
	mapobj	0,0,-60,\2,up_door,updoor_Istrat
	setalvar	rotz,deg180
	mapwait	\1
	ENDM


;-------------------------------------------------------------------------------------
mappipe	MACRO
	IFEQ		NARG-6
	mapobjnomem	0,0,-60+((\1)*pipescale),pdist+((\2)*pipescale),pipe_\5,nocoll_Istrat
	ELSEIF
	mapobjnomem	0,0,-60+((\1)*pipescale),pdist+((\2)*pipescale),pipe_\5,gnd_Istrat
	ENDC
	setalvar	rotx,((deg360/12)*\3)
	setalvar	rotz,deg180*\4
;	setalvar	roty,-deg90
	ENDM

mappipewait	MACRO
	mapwait		((40*pipescale))
pdist	=	pdist-((40*pipescale))
	ENDM
;-------------------------------------------------------------------------------------

mapend__not	MACRO	[newmap]
	setvar	levelfinished,7
.chkagain\@
	start_65816
	a8
	lda	levelfinished
	bne	.andagain\@
	switch	{newmap}
.andagain\@	end_65816
	mapwait	1
	mapgoto	.chkagain\@

	ENDM

;-------------------------------------------------------------------------------------
mapblocksnd	MACRO
	start_65816
	trigse	$49
	end_65816
	ENDM
;-------------------------------------------------------------------------------------
mapendwipe	MACRO	circle type,wait
	wipeout	m\1_circle
	setbgm	$f1
	start_65816
	lda	pshipflags3
	and	#~psf3_enginesnd
	sta	pshipflags3
	end_65816
	mapwait	\2
	setvar.b	clb2,1
	ENDM
;-------------------------------------------------------------------------------------


mapexploderobot	macro
	mapcode_jsl	kill_robot_l
		endm

;-------------------------------------------------------------------------------------

skillfly_init	macro
	setvar.b	skillfly,0
		endm


skillfly_set	macro	[x,y,z,radius]
	mapobj	0,{x},{y},{z},nullshape,skillfly_istrat,10,10
	IFEQ	NARG-4
	setalvar.w	sword1,{radius}
	ENDC
		endm

skillfly_debug	macro	[x,y,z,radius]
	mapobj	0,{x},{y},{z},item_5,skillfly_istrat,10,10
	IFEQ	NARG-4
	setalvar.w	sword1,{radius}
	ENDC
		endm

skillfly_bonus	macro	[wait,x,y,z,shape,istrat]
	start_65816
	lda.l	skillfly
	beq	.c\@	
	switch	.\@
.c\@	end_65816
	mapobj	{wait},{x},{y},{z},{shape},{istrat}
.\@
		endm

skillfly_pathbonus	macro	[wait,x,y,z,shape,path,hp,ap]
	start_65816
	lda.l	skillfly
	beq	.c\@	
	switch	.\@
.c\@	end_65816
	pathobj	{wait},{x},{y},{z},{shape},{path},{hp},{ap}
.\@
		endm



skillfly_goto	macro	[address]
	start_65816
	lda.l	skillfly
	beq	.c\@
	switch	.\@
.c\@	end_65816
	mapgoto	{address}
.\@
	endm

eguchifly_goto	macro	[address]
	start_65816
	a16
	lda.l	eword1
	cmp	#15
	bcs	.c\@
	switch	.\@
.c\@	end_65816
	mapgoto	{address}
.\@
	endm

eguchi2fly_goto	macro	[address]
	start_65816
	lda.l	ebyte3
	bne	.c\@
	switch	.\@
.c\@	end_65816
	mapgoto	{address}
.\@
	endm


;-------------------------------------------------------------------------------------
maphalfdR	MACRO 	; wait,z
	mapobj	\1,60,-60,\2,half_d,halfd_Istrat
	ENDM
;-------------------------------------------------------------------------------------
maphalfdL	MACRO 	; wait,z
	mapobj	0,-60,-60,\2,half_d,halfd_Istrat
	setalvar	rotz,deg180
	mapwait	\1
	ENDM


;-------------------------------------------------------------------------------------
mapdpilarR	MACRO 	; wait,y,z
	mapobj	\1,60,\2,\3,d_pilar,dpilar_Istrat
	ENDM
;-------------------------------------------------------------------------------------
mapdpilarL	MACRO 	; wait,y,z
	mapobj	0,-60,\2,\3,d_pilar,dpilar_Istrat
	setalvar	rotz,deg180
	mapwait	\1
	ENDM

;-------------------------------------------------------------------------------------
mapgotoiflevel	MACRO	level(1-3),label
	start_65816
	a8
	lda	currentlevel
	cmp	#\1-1
	bne	.no\@
	switch	\2
.no\@
	end_65816
	ENDM

;-------------------------------------------------------------------------------------
mapgotoifnotlevel	MACRO	level(1-3),label
	start_65816
	a8
	lda	currentlevel
	cmp	#\1-1
	beq	.no\@
	switch	\2
.no\@
	end_65816
	ENDM





;**********************************************************************************
;**********************************************************************************
;**********************************************************************************
;**********************************************************************************


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



