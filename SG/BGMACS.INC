flashscr	macro
	endm
;	ldx	#0
;	lda	#15
;.lp\@	sta.l	inidisp
;	dec	a
;	dex
;	bne	.lp\@
;	endm

flashscr2	macro
	endm
;	ldx	#0
;	lda	#15
;.lp\@	sta.l	inidisp
;	dec	a
;	stz	cgadd
;	sta	cgdata
;	sta	cgdata
;	dex
;	bne	.lp\@
;	endm



;------------------------------------------------------------------------
flashtunnel	macro
	inc	flashtunnelon
	endm

flashbg	macro
	inc	flashbg
	endm

scrollbg	macro
	lda	#1
	sta	dospacesc
	lda	#\1
	sta	bg2yscroll
	stz	bg2yscroll+1
	endm


;------------------------------------------------------------------------
setbgdma	macro
bgaddr	=	bg_\1-bglists
	IFEQ	LONGA
	lda	#bgaddr&BM
	sta	bg_dmalist
	lda	#bgaddr>>8
	sta	bg_dmalist+1
	ELSEIF
	lda	#bgaddr
	sta	bg_dmalist
	ENDC
	endm

;------------------------------------------------------------------------

setdepth	macro
	IFEQ	LONGA
	lda	#\1&BM
	sta.l	m_depthstab
	lda	#(\1>>8)&BM
	sta.l	m_depthstab+1
	ELSEIF
	lda	#\1&WM
	sta.l	m_depthstab
	ENDC
	endm

;------------------------------------------------------------------------

defbg	macro	name
bg_\1
	IFGT	NARG-1
bg_\2
	IFGT	NARG-2
bg_\3
	ENDC
	ENDC
	db	bg_\1_1>>16
	dw	bg_\1_1&WM
	db	0
	dw	0
	ENDM


;-------------------------------------------------------
decvram	macro
offset	=	0
	ifeq	narg-5
offset	=	\5
	endc
	a16
	lda	#offset
	sta.l	m_decoffset
	lda	#\3>>16
	sta.l	m_enddatabnk
	lda	#\3&WM
	sta.l	m_enddata
	lda	#\2
	sta	vram1addr
	lda	#\4
	sta	vram1len
	a8
	jsl	dec_chr_l
	waittrans
	lda	#20
	sta	trans_flag
	waittrans
	endm

decbg2vram	macro
	a16
	lda	#\3>>16
	sta.l	m_enddatabnk
	lda	#\3&WM
	sta.l	m_enddata
	lda	#\2
	sta	vram1addr
	lda	#\4
	sta	vram1len
	IFNE	NARG-5
	lda	#(vchr_logback-vchr_physback)/16
	ELSEIF
	lda	#\5
	ENDC
	sta.l	m_decoffset
	a8
	jsl	dec_l
	waittrans
	lda	#20
	sta	trans_flag
	waittrans
	endm


;------------------------------------------------------------------------
decvramnotrans macro
offset	=	0
	ifeq	narg-5
offset	=	\5
	endc
	a16
	lda	#offset
	sta.l	m_decoffset
	lda	#\3>>16
	sta.l	m_enddatabnk
	lda	#\3&WM
	sta.l	m_enddata
	lda	#\2
	sta	vram1addr
	lda	#\4
	sta	vram1len
	a8
	jsl	dec_chr_l
	jsl	randtrans
	endm

decbg2vramnotrans macro
	a16
	lda	#\3>>16
	sta.l	m_enddatabnk
	lda	#\3&WM
	sta.l	m_enddata
	lda	#\2
	sta	vram1addr
	lda	#\4
	sta	vram1len
	IFNE	NARG-5
	lda	#(vchr_logback-vchr_physback)/16
	ELSEIF
	lda	#\5
	ENDC
	sta.l	m_decoffset
	a8
	jsl	dec_l
	jsl	randtrans
	endm

;------------------------------------------------------------------------
init_bg	macro	[mode]
	a8

	flashscr2

	ifc	"{mode}","mode1"
	jsr	initmode1
	endc

	ifc	"{mode}","mode2"
	jsr	initmode2
	endc

	ifc	"{mode}","mode2sp"
	jsr	initmode2sp
	endc
	
	endm

set_bg	macro
;	waittrans
	lda	#16
	sta	trans_flag
;	waittrans
	endm

set_bg3	macro
;	waittrans
	lda	#22
	sta	trans_flag
;	waittrans
	endm

;------------------------------------------------------------------------
bg2chr	MACRO	name[,start,len]
addr	=	vchr_logback
len	=	6*k
	IFNE	NARG-1
addr	=	\2
len	=	\3
	ENDC

	IFNE	LONGA
	printf	"%m needs to be in a8%n"
	ENDC

	IFEQ	0
	jsr	bg2chr
	dw	bg\1ccr&WM
	db	bg\1ccr>>16
	dw	addr
	dw	len

	ELSEIF
	a16
	lda	#0
	sta.l	m_decoffset
	lda	#bg\1ccr>>16
	sta.l	m_enddatabnk
	lda	#bg\1ccr&WM
	sta.l	m_enddata
	lda	#addr
	sta	vram1addr
	lda	#len
	sta	vram1len
	a8
	jsl	dec_chr_l
	ENDC
	ENDM

bg2scr	MACRO	name[,start,len]
addr	=	vsc_base2
len	=	8*k
	IFNE	NARG-1
addr	=	\2
len	=	\3
	ENDC

	IFEQ	0
	IFNE	LONGA
	printf	"%m needs to be in a8%n"
	ENDC
	jsr	bg2scr
	dw	bg\1pcr&WM
	db	bg\1pcr>>16
	dw	addr
	dw	len

	ELSEIF
	a16
	lda	#bg\1pcr>>16
	sta.l	m_enddatabnk
	lda	#bg\1pcr&WM
	sta.l	m_enddata
	lda	#addr
	sta	vram2addr
	lda	#len
	sta	vram2len
	a8
	jsl	dec_bg_l
	ENDC
	ENDM

;-------------------------------------------------------------------------
bg3chr	MACRO
addr	=	vsc_base2
len	=	2048
	IFNE	NARG-1
addr	=	\2
len	=	\3
	ENDC
	a16
	lda	#0
	sta.l	m_decoffset
	lda	#bg\1ccr>>16
	sta.l	m_enddatabnk
	lda	#bg\1ccr&WM
	sta.l	m_enddata
	lda	#addr
	sta	vram1addr
	lda	#len
	sta	vram1len
	a8
	jsl	dec_chr_l
	lda	#1
	sta	bg3scrollflag
	lda	#1+2+4+16
	sta	tm
	ENDM

bg3scr	MACRO	
addr	=	vsc_base2+1*k
len	=	2048
	IFNE	NARG-1
addr	=	\2
len	=	\3
	ENDC
	a16
	lda	#bg\1pcr>>16
	sta.l	m_enddatabnk
	lda	#bg\1pcr&WM
	sta.l	m_enddata
	lda	#addr
	sta	vram2addr
	lda	#len
	sta	vram2len
	a8
	jsl	dec_bg3_l
	ENDM

;------------------------------------------------------------------------

palette	MACRO	name[,length]
len	=	224
	IFNE	NARG-1
len	=	\2
	ENDC
	IFEQ	0

	IFNE	LONGA
	printf	"%m needs to be in a8%n"
	ENDC

	jsr	dopalette
	dw	bg\1pac&WM
	db	bg\1pac>>16
	dw	len

	ELSEIF
	lda	#bg\1pac>>16
	sta	vram3addr+2
	ldx	#(bg\1pac)&WM
	stx	vram3addr
	ldx	#len
	stx	vram3len

	ldx	#7*32-1
.lp	lda.l	bg\1pac,x
	sta	pal0palette,x
	dex
	bpl	.lp
	ENDC


	lda	nobgmode
	beq	.norm
	jsl	makeBG2black_l
.norm	

	ENDM

;------------------------------------------------------------------------
setbg3vofs	MACRO
	lda	#\1&$ff
	sta	bg3vofs
	lda	#\1>>8
	sta	bg3vofs
	ENDM

;------------------------------------------------------------------------
waittrans	macro
.\@	lda	trans_flag
	beq	.ok\@
	cmp	#32
	bne	.\@
.ok\@
	endm

;------------------------------------------------------------------------

sethdma	macro
	lda	hdmaen_gc
	sta	hdmaen
	endm

;------------------------------------------------------------------------

planet	macro	[depth]
	stz	inatunnel
	stz	gamemode
	stz	lastrot
	stz	lastrot+1
	setdepth	{depth}		;night
	sethdma
	waittrans
	flashscr
	rtl
	endm

;------------------------------------------------------------------------

undergnd	macro	[depth]
	lda	#1
	sta	inatunnel
	stz	gamemode
	stz	lastrot
	stz	lastrot+1
	setdepth	{depth}		;night
	sethdma
	waittrans
	flashscr
	rtl
	endm


;------------------------------------------------------------------------

nucleus	macro	[depth]
	lda	#1
	sta	inatunnel
	stz	gamemode
	stz	lastrot
	stz	lastrot+1
	setdepth	{depth}		;night
	sethdma
	waittrans
	flashscr
	rtl
	endm


;------------------------------------------------------------------------

tunnel	macro	[depth]
	lda	#1
	sta	inatunnel
	lda	hdmaen_gc
	ora	#hdmaf_bg2vofs
	sta	hdmaen_gc
	stz	lastrot
	stz	lastrot+1
	stz	gamemode
	setdepth	{depth}		;night
	sethdma
	waittrans
	flashscr
	rtl
	endm

;------------------------------------------------------------------------

space	macro	[depth]
	stz	inatunnel
	lda	#SPACE_MODE
	sta	gamemode
	stz	lastrot
	stz	lastrot+1
	setdepth	{depth}		;night
	sethdma
	waittrans
	flashscr
	rtl
	endm


;------------------------------------------------------------------------

final	macro	[depth]
	lda	#1
	sta	inatunnel
	lda	#SPACE_MODE
	sta	gamemode
	stz	lastrot
	stz	lastrot+1
	setdepth	{depth}		;night
	sethdma
	waittrans
	flashscr
	rtl
	endm

;------------------------------------------------------------------------

water	macro	[depth]
	lda	#2
	sta	inatunnel
	lda	hdmaen_gc
	ora	#hdmaf_bg2vofs
	sta	hdmaen_gc
	stz	lastrot
	stz	lastrot+1
	lda	#WATER_MODE
	sta	gamemode
	setdepth	{depth}		;marine
	sethdma
	waittrans
	flashscr
	rtl
	endm


;------------------------------------------------------------------------

hofmode	macro	[mode]
	lda	#{mode}_hof
	sta	hposjmp
	endm

;------------------------------------------------------------------------
bg2Yscroll	MACRO	[scroll]
	a16
	lda	#{scroll}
	sta	bg2Yscroll
	sta	bg2scroll
	a8
     	ENDM

;------------------------------------------------------------------------
bg2Xscroll	MACRO	[scroll]
	a16
	lda	#{scroll}
	sta	bg2Xscroll
	a8
    	ENDM

;------------------------------------------------------------------------

bg2hoff	macro
	lda	#(\1)&BM
	sta.l	m_scrollxoff
	lda	#(\1)>>8
	sta.l	m_scrollxoff+1
	endm

;------------------------------------------------------------------------
info	MACRO
tempflags	=	0

	rept	NARG
	irs	1,"\1","\2","\3","\4","\5","\6","\7","\8","\9","\a"
	upper	1

	run	' ifc "%$1","VON"'
tempflags	=	tempflags!if_vofson
	endc

	run	' ifc "%$1","HON"'
tempflags	=	tempflags!if_hofson
	lda	hdmaen_gc
	ora	#hdmaf_bg2hofs
	sta	hdmaen_gc
	endc

	run	' ifc "%$1","ZON"'
tempflags	=	tempflags!if_zroton
	endc

	run	' ifc "%$1","GROUND"'
tempflags	=	tempflags!if_ground
	endc

	run	' ifc "%$1","SPACE"'
tempflags	=	tempflags!if_space
	endc

	run	' ifc "%$1","WATER"'
tempflags	=	tempflags!if_ground
	endc


	run	' ifc "%$1","SNOW"'
tempflags	=	tempflags!if_SNOW
	endc

	run	' ifc "%$1","POLLEN"'
tempflags	=	tempflags!if_POLLEN
	endc

	endr


	lda	#tempflags
	sta	levelinfo

	ENDM

;------------------------------------------------------------------------

pstrat	macro	stratptr,def. flymode,max fly mode

	ldx	#(\1_istrat)&WM
	stx	newplayerstrat
	lda	#(\1_istrat)>>16
	sta	newplayerstrat+2


	IFEQ	NARG-3
flymodeA	=	spfm_norm
flymodeB	=	spfm_close
flymodeC	=	spfm_inside

	a8
	lda		#flymode\2
	sta		splayerflymode
;	jsl		changeviewmode_l

	lda		#spfmo_\3
	sta		splayerflymodeopt

	ENDC

	endm


;------------------------------------------------------------------------

shadowheight	macro
	a16
	lda	#\1
	sta	shadowheight
	a8
	endm

;-------------------------------------------------------------------

gamepal	MACRO
	lda	palnumber
	beq	.norm\@
	cmp	#1
	beq	.1\@
	cmp	#2
	beq	.2\@
	cmp	#3
	beq	.3\@
	cmp	#4
	beq	.4\@
	cmp	#5
	beq	.5\@
	cmp	#6
	beq	.6\@
	cmp	#7
	beq	.7\@
	cmp	#8
	beq	.8\@
	cmp	#9
	beq	.9\@
	cmp	#10
	beq	.10\@
	cmp	#11
	beq	.11\@

.1\@
	lda	#gamepal_retro1
	bra	.doneloading\@
.2\@
	lda	#gamepal_retro2
	bra	.doneloading\@
.3\@
	lda	#gamepal_mist
	bra	.doneloading\@
.4\@
	lda	#gamepal_green
	bra	.doneloading\@
.5\@
	lda	#gamepal_rainbow
	bra	.doneloading\@
.6\@
	lda	#gamepal_rainbowk
	bra	.doneloading\@
.7\@
	lda	#gamepal_cyansc
	bra	.doneloading\@
.8\@
	lda	#gamepal_bluesc
	bra	.doneloading\@
.9\@
	lda	#gamepal_greensc
	bra	.doneloading\@
.10\@
	lda	#gamepal_whitesc
	bra	.doneloading\@
.11\@
	lda	#gamepal_blacksc
	bra	.doneloading\@

.norm\@
	lda	#gamepal_\1
.doneloading\@
	sta	gamepal
	jsl	setgamepal_l
	ENDM
;-------------------------------------------------------------------

set_zdepthtable	MACRO	[tablenum]
	savemode
	a16
	lda	darkmode
	and	#1
	bne	.night\@
	lda	#depth_{tablenum}*4+depthtables&WM
	sta.l	m_depthtable
	bra	.donedepth\@
.night\@
	lda	#depth_darkmode*4+depthtables&WM
	sta.l	m_depthtable
.donedepth\@
	returnmode
	ENDM

;-------------------------------------------------------------------

bgmrestart	MACRO
	lda	bgflags
	bit	#bgf_restart
	beq	.ok
	bgm	\1
.ok
	ENDM



;------------------------------------------------------------------------
decvramwait macro
	ifeq	narg-6
offset	=	\5
dvnt	=	\6
	elseif
offset	=	0
dvnt	=	\5
	endc
	a16
	lda	#offset
	sta.l	m_decoffset
	lda	#\3>>16
	sta.l	m_enddatabnk
	lda	#\3&WM
	sta.l	m_enddata
	lda	#\2
	sta	vram1addr
	lda	#\4
	sta	vram1len
	a8
	jsl	dec_chr_l
	waitdma	dvnt
	jsl	randtrans
	endm

decbg2vramwait macro
	a16
	lda	#\3>>16
	sta.l	m_enddatabnk
	lda	#\3&WM
	sta.l	m_enddata
	lda	#\2
	sta	vram1addr
	lda	#\4
	sta	vram1len
	IFNE	NARG-6
	lda	#(vchr_logback-vchr_physback)/16
dvnt	=	\5
	ELSEIF
dvnt	=	\6
	lda	#\5
	ENDC
	sta.l	m_decoffset
	a8
	jsl	dec_l
	waitdma	dvnt
	jsl	randtrans
	endm

changedefaultID	macro	[colourID]
	a16
	lda	#{colourID}&WM
	sta	defaultID
	a8
		ENDM






