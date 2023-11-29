;***************************************************************************
;*                              -----------                                *
;*                               Star Fox                                  *
;*                              -----------                                *
;*                                                                         *
;*                           SuperNES version.                             *
;*                                                                         *
;*                           Argonaut Software.      		               *
;*_________________________________________________________________________*
;*                                                                         *
;*   File: ENDSEQ.ASM                                                      *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr: End sequence code                                               *
;*_________________________________________________________________________*
;*                                                                         *
;*   Date: 10/9/92                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;* Author:   Krister Wombell.                                              *
;*                                                                         *
;***************************************************************************
; #############################
; ## Boss Roll Sequence code ##
; #############################

bg3xinit	equ	128
bg3yinit	equ	-17
bg2xinit	equ	0
bg2yinit	equ	256
bg1xinit	equ	0
bg1yinit	equ	0

bg1xmove	equ	6*8
bg1ymove	equ	3*8
bg2xmove	equ	6*8
bg2ymove	equ	3*8
bg3xmove	equ	12*8
bg3ymove	equ	6*8

bg1xspd	equ	2
bg1yspd	equ	1
bg2xspd	equ	2
bg2yspd	equ	1
bg3xspd	equ	4
bg3yspd	equ	2

	incpublics	EXT\endseq.ext


;--------------------------------------------------------------------------
defseq	MACRO
	dw	\1&07fffh		;mapobj for object
	db	\1>>16
	dw	\2&WM
	ENDM

defdemo	MACRO
	mapobj	\1,\2,\3,\4,\5,\6
	setvarobj	mapvar1
	mapwait	1000
	ENDM

setdpos	MACRO
	db	1
	dw	\1
	ENDM


q_stratmac	MACRO
	a8
	ENDM

q_seqmac	MACRO
	a16
	ENDM

q_start	MACRO
	ENDM

q_rept_strat MACRO
	lda	\1
.lp\@	pha
	jsr	dostratlist
	pla
	dec	a
	bne	.lp\@
	ENDM

q_set_han	MACRO
	lda	#(\1)&WM
	sta	seq_handler
	ENDM

q_set_cnt	MACRO
	lda	\1
	sta	democnt
	ENDM

q_set_viewdist MACRO
	a16
	lda	\1
	sta	outdist
	sta	viewdist
	ENDM

q_set_Xpos	MACRO
	a16
	lda	\1
	sta	mapvar2
	ENDM

q_init_text	MACRO
	ldx	#(\1)-demotxtbase
	jsr	prtdemotxt
	ENDM

q_end	MACRO
	rts
	ENDM

q_chk_cnteq	MACRO
	lda	democnt
	cmp	\1
	lbeq	\2
	ENDM

q_chk_cntne	MACRO
	lda	democnt
	cmp	\1
	lbne	\2
	ENDM


q_jsr	MACRO
	jsr	\1
	ENDM

q_add_var	MACRO
	lda	\1
	clc
	adc	\2
	sta	\1
	ENDM

q_sub_var	MACRO
	lda	\1
	sec
	sbc	\2
	sta	\1
	ENDM

q_jmp_varless MACRO
	lda	\1
	cmp	\2
	lbmi	\3
	ENDM

q_jmp_varmore MACRO
	lda	\1
	cmp	\2
	lbpl	\3
	ENDM

q_achase_var MACRO
	q_stratmac
	IFEQ	NARG-5
	s_achase_var	\1,\2,\3,\4,\5
	ELSEIF
	s_achase_var	\1,\2,\3,\4
	ENDC
	q_seqmac
	ENDM

q_fchase_var MACRO
	q_stratmac
	IFEQ	NARG-5
	s_achase_var	\1,\2,\3,\4,\5
	ELSEIF
	s_achase_var	\1,\2,\3,\4
	ENDC
	q_seqmac
	ENDM

q_set_text	MACRO
	a8
	ldx	#(\1)-demotxtbase
	ldy	#0
	sty	seq_tptr
.lp\@	lda.l	demotxtbase,x
	beq	.end\@
.ok\@	lda.l	demotxtbase,x
	phx
	tyx
	sta.l	seq_buffer,x
	plx
	inx
;	lda	#boss31-endseqboss
	iny
	bra	.lp\@
.end\@
	lda.l	demotxtbase+1,x
	bne	.ok\@
	tyx
	sta.l	seq_buffer,x
	a16
	ENDM

q_start_text MACRO
	lda	bgflags
	ora	#bgf_text
	sta	bgflags
	a16
	ENDM

q_set_bg	MACRO
	a8
	jsr	setmybg\1
	a16
	ENDM

q_set_viewhgt MACRO
	lda	\1
	sta	viewyoff
	ENDM

;--------------------------------------------------------------------------

endseq_l	php

	jsl	initgame3d_l
	jsl	setcharmapfox_l

	ifeq	1	; level 1
	ai16
	lda	#boss11-endseqboss
	sta	boss_seq
	lda	#boss12-endseqboss
	sta	boss_seq+2
	lda	#boss13-endseqboss
	sta	boss_seq+4
	lda	#boss14-endseqboss
	sta	boss_seq+6
	lda	#boss15-endseqboss
	sta	boss_seq+8
	lda	#boss16-endseqboss
	sta	boss_seq+10
	lda	#12
	sta	boss_ptr
	endc

	ifeq	1	; level 2
	ai16
	lda	#boss21-endseqboss
	sta	boss_seq
	lda	#boss22-endseqboss
	sta	boss_seq+2
	lda	#boss23-endseqboss
	sta	boss_seq+4
	lda	#boss24-endseqboss
	sta	boss_seq+6
	lda	#boss25-endseqboss
	sta	boss_seq+8
	lda	#boss26-endseqboss
	sta	boss_seq+10
	lda	#bossfinal-endseqboss
	sta	boss_seq+12
	lda	#14
	sta	boss_ptr
	endc

	ifeq	1	; level 3
	ai16
	lda	#boss31-endseqboss
	sta	boss_seq
	lda	#boss32-endseqboss
	sta	boss_seq+2
	lda	#boss33-endseqboss
	sta	boss_seq+4
	lda	#boss34-endseqboss
	sta	boss_seq+6
	lda	#boss35-endseqboss
	sta	boss_seq+8
	lda	#boss36-endseqboss
	sta	boss_seq+10
	lda	#boss37-endseqboss
	sta	boss_seq+12
	lda	#14
	sta	boss_ptr
	endc


	a8i16
	disable
	lda	#$80
	setinidisp1
	startbgm	012h
	stz	doingend

	a8i16
	stz	cont0l
	stz	cont1l
	stz	trig0
	stz	trig1

	a16
	lda	#bg1xinit
	sta	bg1hofsbak
	sta	bg1hofsreq
	lda	#bg1yinit
	sta	bg1vofsbak
	sta	bg1vofsreq

	lda	#bg2xinit
	sta	bg2hofsbak
	sta	bg2hofsreq
	lda	#bg2yinit
	sta	bg2vofsbak
	sta	bg2vofsreq

	lda	#bg3xinit
	sta	bg3hofsbak
	sta	bg3hofsreq
	lda	#bg3yinit
	sta	bg3vofsbak
	sta	bg3vofsreq

	stz	democnt
	ldx	boss_ptr
	lda	#-1
	sta	boss_seq,x	;mark the end of the boss demos
	ldx	#0
	stx	boss_ptr

	stz	dotsflag
	stz	circleanim

	a8i16
	stz	gameframe
	lda	#1+8
	sta	bgmode
	lda	#1+2+4
	sta	tm
	stz	windowmode

	lda	#(0c000h/2)>>12
	sta	bg34nba
	lda	#(0e000h/2)>>8+1
	sta	bg3sc

	decvramnotrans	0,vchr_logback,bgetest2ccr,6*k
	decvramnotrans	0,vsc_base2+2*k,bgetest2pcr,4*k,scr_offset
	decvramnotrans	0,0d000h/2,bgetestccr,4*k

	lda	#32
	sta	trans_flag
	lda	#1
	sta	nosetport3
	enable

.self
	jsr	getaboss
	jsr	handler
	jsr	endtrans
	a8
	lda	stayblack
	bne	.black
	lda	#14
	sta	fade
	lda	#1
	sta	fadedir
	bra	.self
.black	cmp	#1
	beq	.set
	dec	stayblack
	bra	.self
.set	a16
	lda	#mroundwipeclear_circle
	sta	circleanim
	a8
	dec	stayblack
	bra	.self

end_endseq	plp
	ai16
	pla		;getaboss
end_endseq2	plp
	rtl


;----------------------------------------------------------------------------
endtrans_l	jsr	endtrans
	rtl
endtrans	a8i16
.notfinished
	lda	trans_flag
	cmp	#32
	bne	.notfinished
	stz	noirqbit3
	lda	#26		;start screen transferring
	sta	trans_flag

	jsl	do_circle_explosion_l
	jsl	find_window_pri_l
	a8i16
	lda	doingwipe
	bne	.skip2
	inc	noirqbit3
.skip2

	jsr	dostratlist
	jsl	getview_l
	jsl	showview_l
	jsl	build_drawlist_l
	jsl	generate_collist_l

	a8i16
.twait	lda	transbmp1
	beq	.twait
	jsl	clronehalf_l
.twait2	lda	transbmp1
	cmp	#2
	bne	.twait2
	stz	transbmp1

	ai16
	lda	#0
	sta.l	m_meters

	lda	dotsflag
	sta.l	m_dotsorstars
	beq	.skip
	jsl	mshowgrid_l
.skip
	jsl	do_3d_display_l

	jsl	do_window_wipe_l

 	a8
	lda	doingwipe
	beq	.nd3
	inc	noirqbit3
.nd3
	rts


dostratlist	php
	a8i16
	incw	gameframe


	phb
	lda	#07eh
	pha
	plb
	jsl	init_strats_l	;init coll player move, etc.
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
.cont	plb


	ldx	mapvar1
	beq	.sk
	s_copy_alvar2var	W,x,pviewposx,al_worldx
	s_copy_alvar2var	W,x,pviewposy,al_worldy
	s_add_var		W,pviewposy,viewyoff
	s_copy_alvar2var	W,x,pviewposz,al_worldz

	ldx	mapvar2
	beq	.sk
	stx		pviewposx

.sk
	plp
	rts


	longa
	longi
setboss_l	phx
	pha
	lda.l	boss_ptr
	tax
	beq	.do
	pla
	cmp.l	boss_seq-2,x
	beq	.noadd
	pha
.do	pla
	sta.l	boss_seq,x
	inx
	inx
	txa
	sta.l	boss_ptr
	plx
	rtl
.noadd	plx
	rtl

;------------------------------------------------------------------------
getaboss	php
	ai16
	dec	democnt
	bmi	.do
	plp
	rts
.do
	a8
	lda	doingend
	beq	.first
	cmp	#2
	bne	.nf
   	startbgm $f1
.nf
	a16
	lda	#mroundwipefill_circle
	sta	circleanim
	lda	#37
.flp	pha
	jsr	endtrans
	a16
	pla
	dec	a
	bne	.flp
.first
	a8
	stz	hdmaen
	waitdma	140
	waitdma	100
	stz	fade
	stz	fadedir
	lda	#$80
	setinidisp1
	sta	inidisp

	a16
	stz	mapcnt
	stz	lastplayz
	stz	lastzchange
	stz	viewposz		; reset map position
	jsl	kill_list_l		; format alien list

	stz	pviewposx
	stz	pviewposy
	stz	pviewposz

	a8i16
	ldx	allst
	s_make_obj	#nullshape,.kk
.kk	sty	playpt
	s_set_strat	y,playercred_Istrat
	s_make_obj	#nullshape,.kk2
.kk2	sty	viewpt

	ai16
	ldx	boss_ptr
	lda	boss_seq,x
	cmp	#-1
	lbeq	end_endseq
	inx
	inx
	stx	boss_ptr
	tax
	a8
.redo	lda.l	endseqboss+2,x
	sta	mapbank
	a16
	lda.l	endseqboss,x
	pha

	lda.l	endseqboss+3,x
	sta	seq_handler

	inx
	inx
	inx
	inx
	inx
	stx	demoptr
	plx
	jsl	newobjs_l

	stz	outvx
	stz	outvy
	stz	outvz
	stz	outdist

	a8i16
	jsl	initgame_strats_l

	jsr	handler

	a16
	lda	#mwipefill_circle
	sta	circleanim
	a8
	lda	#4
	sta	stayblack
	lda	#hdmaf_inidisp+hdmaf_win
	sta	hdmaen
	waitdma	150
	waitdma	140
	lda	#32
	sta	trans_flag

	lda	#1
	sta	doingend

	ldx	boss_ptr
	lda	boss_seq,x
	cmp	#-1
	bne	.nf2
	lda	#2
	sta	doingend
.nf2
	plp
	rts


	shorta
	longi
setmybga	dmacgram	0,0,(bgetestpac),512
	jmp		qsetit
setmybgb	dmacgram	0,0,(bgetest0pac),512
qsetit	decvram		0,0e000h/2,bgetestpcr,4*k,256
	stz		cgadd
	stz		cgdata
	stz		cgdata
	lda		#1
	jsl		setpal_l
	setdepth	night
	set_zdepthtable	normal
	rts


	ifeq		1

#dmacgram (txt channel=chan0!!chan1!!chan2!!chan3!!chan4!!chan5!!chan6!!chan7, 
    int addr>0<=255, txt source, int len) {

	lda	#cgdata&$ff
	sta	ch{channel}addrb
	lda	#{addr}
	sta	cgadd
	ldx	#{source}&WM
	stx	ch{channel}addra1tl
	lda	#{source}>>16
	sta	ch{channel}atbank
	ldx	#{len}
	stx	ch{channel}dataddrl
	lda	#0
	sta	ch{channel}params
	lda	#{channel}<<1
	sta	mdmaen

}


    dmacgram (chan0, addr=0, bgetestpac, len=512);
    jmp qsetit
    dmacgram (chan0, addr=0, bgetest0pac, len=512);
qsetit
    decvram (chan0, addr=0e000h/2, bgetestpcr, len=4*k, offset=256);
    set_zdepthtable (normal);
    set_col (0, 0);
    set_3dpal (1);
    set_depth (night);
    set_zdepthtable (normal);
    rts


	endc

;-----------------------------------------------------------------------------
prtdemotxt	php
	a8i16
.lp
	lda.l	demotxtbase,x
	inx
	cmp	#0
	beq	.end
	cmp	#1
	bne	.notpos
	a16
	lda.l	demotxtbase,x
	inx
	inx
	clc
	adc	#0e000h/2
	sta	vmaddl
	a8
	bra	.lp
.notpos
	a16
	and	#0ffh
	txy
	tax
	lda.l	etesttrans-32,x
	and	#0ffh
	tyx
	ora	#1<<13
	clc
	adc	#256
	sta	vmdatal

	a8
	bra	.lp
.end
	plp
	rts



;------------------------------------------------------------------------
handler	ai16
	jmp	(seq_handler)

scrollinl	php
	a16
	lda	#bg1xinit+bg1xmove
	sta	bg1hofsreq
	lda	#bg1yinit+bg1ymove
	sta	bg1vofsreq
;	lda	#bg2xinit+bg2xmove
;	sta	bg2hofsreq
	lda	#bg2yinit+bg2ymove
	sta	bg2vofsreq
	lda	#bg3xinit+bg3xmove
	sta	bg3hofsreq
	lda	#bg3yinit+bg3ymove
	sta	bg3vofsreq
	plp
	rts

scrolloutr	php
	a16
	lda	#bg1xinit
	sta	bg1hofsreq
	lda	#bg1yinit
	sta	bg1vofsreq
;	lda	#bg2xinit
;	sta	bg2hofsreq
	lda	#bg2yinit
	sta	bg2vofsreq
	lda	#bg3xinit
	sta	bg3hofsreq
	lda	#bg3yinit
	sta	bg3vofsreq
	plp
    	rts

scrollinr	php
	a16
	lda	#bg1xinit-bg1xmove
	sta	bg1hofsreq
	lda	#bg1yinit+bg1ymove
	sta	bg1vofsreq
;	lda	#bg2xinit-bg2xmove
;	sta	bg2hofsreq
	lda	#bg2yinit+bg2ymove
	sta	bg2vofsreq
	lda	#bg3xinit-bg3xmove
	sta	bg3hofsreq
	lda	#bg3yinit+bg3ymove
	sta	bg3vofsreq
	plp
	rts

scrolloutl	php
	a16
	lda	#bg1xinit
	sta	bg1hofsreq
	sta	bg1hofsbak
	lda	#bg1yinit
	sta	bg1vofsreq
	sta	bg1vofsbak
	lda	#bg2yinit
	sta	bg2vofsreq
	sta	bg2vofsbak
	lda	#bg3xinit
	sta	bg3hofsreq
	sta	bg3hofsbak
	lda	#bg3yinit
	sta	bg3vofsreq
	sta	bg3vofsbak
	plp
    	rts




	longa
	longi
boss11_ihan	q_start
	q_set_bg		a
	q_set_bg		a
	q_set_han		boss11_han
	q_set_cnt		#180
	q_set_viewdist		#1500
	q_set_viewhgt		#0
	q_init_text		boss11txt
	q_set_text		boss11txt2
	q_rept_strat		#200
	q_end

boss11_han	q_start
	q_jmp_varmore		democnt,#110,.ok
	q_chk_cnteq		#100,.prt
	q_jsr			scrollinr
	q_achase_var		W,outdist,#2300,2
	q_achase_var		W,viewdist,#2300,2
	q_end
.ok	q_jsr			scrolloutl
	q_end
.out
	q_end
.prt
	q_start_text
	q_end

boss12_ihan	q_start
	q_set_bg		b
	q_set_han		boss11_han
	q_set_cnt		#195
	q_set_viewdist		#1000
	q_set_viewhgt		#0
	q_init_text		boss12txt
	q_set_text		boss12txt2
	q_end

boss13_ihan	q_start
	q_set_bg		b
	q_set_han		boss13_han
	q_set_cnt		#200
	q_set_viewdist		#1500
	q_set_viewhgt		#0
	q_init_text		boss13txt
	q_set_text		boss13txt2
	q_end


boss13_han	q_start
	q_jmp_varmore		democnt,#110,.ok
	q_chk_cnteq		#100,.prt
	q_jsr			scrollinr
	q_achase_var		W,outdist,#1500,2
	q_achase_var		W,viewdist,#1500,2
	q_end
.ok	q_jsr			scrolloutl
	q_end
.out
	q_end
.prt
	q_start_text
	q_end
	

boss14_ihan	q_start
	q_set_bg		a
	q_set_han		boss11_han
	q_set_cnt		#200
	q_set_viewdist		#2500
	q_set_viewhgt		#200
	q_init_text		boss14txt
	q_set_text		boss14txt2
	q_rept_strat		#230
	q_end


boss15_ihan	q_start
	q_set_bg		b
	q_set_han		boss11_han
	q_set_cnt		#200
	q_set_viewdist		#1500
	q_set_viewhgt		#0
	q_set_Xpos		#1
	q_rept_strat		#40
	q_init_text		boss15txt
	q_set_text		boss15txt2
	q_end

boss16_ihan	q_start
	q_set_bg		b
	q_set_han		boss11_han
	q_set_cnt		#200
	q_set_viewdist		#1000
	q_set_viewhgt		#0
	q_init_text		boss16txt
	q_set_text		boss15txt2
	q_end


boss21_ihan	q_start
	q_set_bg		a
	q_set_bg		a
	q_set_han		boss11_han
	q_set_cnt		#180
	q_set_viewdist		#1500
	q_init_text		boss21txt
	q_set_text		boss21txt2
	q_rept_strat		#200
	q_end

boss22_ihan	q_start
	q_set_bg		b
	q_set_han		boss11_han
	q_set_cnt		#195
	q_set_viewdist		#1500
	q_init_text		boss22txt
	q_set_text		boss22txt2
	q_end

boss23_ihan	q_start
	q_set_bg		a
	q_set_han		boss23_han
	q_set_cnt		#180
	q_set_viewdist		#200
	q_init_text		boss23txt
	q_set_text		boss23txt2
	q_end

boss23_han	q_start
	q_jmp_varmore		democnt,#110,.ok
	q_chk_cnteq		#100,.prt
	q_jsr			scrollinr
	q_achase_var		W,outdist,#400,2
	q_achase_var		W,viewdist,#400,2
	q_end
.ok	q_jsr			scrolloutl
	q_end
.out
	q_end
.prt
	q_start_text
	q_end

boss24_ihan	q_start
	q_set_bg		b
	q_set_han		boss11_han
	q_set_cnt		#200
	q_set_viewdist		#1500
	q_init_text		boss24txt
	q_set_text		boss24txt2
	q_end

boss25_ihan	q_start
	q_set_bg		b
	q_set_han		boss11_han
	q_set_cnt		#220
	q_set_viewdist		#1000
	q_init_text		boss25txt
	q_set_text		boss25txt2
	q_end


boss26_ihan	q_start
	q_set_bg		b
	q_set_han		boss26_han
	q_set_cnt		#220
	q_set_viewdist		#500
	q_rept_strat		#50
	q_init_text		boss26txt
	q_set_text		boss26txt2
	q_end


boss26_han	q_start
	q_jmp_varmore		democnt,#110,.ok
	q_chk_cnteq		#100,.prt
	q_jsr			scrollinr
	q_achase_var		W,outdist,#1000,2
	q_achase_var		W,viewdist,#1000,2
	q_end
.ok	q_jsr			scrolloutl
	q_end
.out
	q_end
.prt
	q_start_text
	q_end

boss31_ihan	q_start
	q_set_bg		a
	q_set_han		boss11_han
	q_set_cnt		#200
	q_set_viewdist		#1500
	q_set_viewhgt		#-400
	q_init_text		boss31txt
	q_set_text		boss31txt2
	q_rept_strat		#230
	q_end

;boss31_ihan	q_start
;	q_set_bg		a
;	q_set_bg		a
;	q_set_han		boss11_han
;	q_set_cnt		#180
;	q_set_viewdist		#1500
;	q_set_viewhgt		#0
;	q_init_text		boss31txt
;	q_set_text		boss31txt2
;	q_rept_strat		#200
;	q_end

boss32_ihan	q_start
	q_set_bg		b
	q_set_han		boss11_han
	q_set_cnt		#200
	q_set_viewdist		#1000
	q_set_viewhgt		#0
	q_rept_strat		#50
	q_init_text		boss32txt
	q_set_text		boss32txt2
	q_end

boss33_ihan	q_start
	q_set_bg		a
	q_set_han		boss11_han
	q_set_cnt		#200
	q_set_viewdist		#1500
	q_set_viewhgt		#-300
	q_init_text		boss33txt
	q_set_text		boss33txt2
	q_end

boss34_ihan	q_start
	q_set_bg		b
	q_set_han		boss11_han
	q_set_cnt		#200
	q_set_viewdist		#1500
	q_set_viewhgt		#0
	q_init_text		boss34txt
	q_set_text		boss34txt2
	q_end

boss35_ihan	q_start
	q_set_bg		b
	q_set_han		boss11_han
	q_set_cnt		#200
	q_set_viewdist		#1000
	q_set_viewhgt		#-300
	q_init_text		boss35txt
	q_set_text		boss35txt2
	q_rept_strat		#200
	q_end

boss36_ihan	q_start
	q_set_bg		b
	q_set_han		boss11_han
	q_set_cnt		#200
	q_set_viewdist		#1500
	q_set_viewhgt		#-200
	q_rept_strat		#300
	q_init_text		boss36txt
	q_set_text		boss36txt2
	q_end

boss37_ihan	q_start
	q_set_bg		b
	q_set_han		boss11_han
	q_set_cnt		#250
	q_set_viewdist		#1500
	q_set_viewhgt		#-300
	q_rept_strat		#50
	q_init_text		boss37txt
	q_set_text		boss37txt2
	q_end

bossfinal_ihan	q_start
	q_set_bg		b
	q_set_han		boss11_han
	q_set_cnt		#200
	q_set_viewdist		#2000
	q_set_viewhgt		#-300
	q_rept_strat		#200
	q_init_text		bossfinaltxt
	q_set_text		bossfinaltxt2
	q_end


endseqboss
boss11	defseq	boss11demo,boss11_ihan
boss12	defseq	boss12demo,boss12_ihan
boss13	defseq	boss13demo,boss13_ihan
boss14	defseq	boss14demo,boss14_ihan
boss15	defseq	boss15demo,boss15_ihan
boss16	defseq	boss16demo,boss16_ihan

boss21	defseq	boss11demo,boss21_ihan
boss22	defseq	boss12demo,boss22_ihan
boss23	defseq	boss23demo,boss23_ihan
boss24	defseq	boss24demo,boss24_ihan
boss25	defseq	boss25demo,boss25_ihan
boss26	defseq	boss26demo,boss26_ihan

boss31	defseq	boss31demo,boss31_ihan
boss32	defseq	boss32demo,boss32_ihan
boss33	defseq	boss33demo,boss33_ihan
boss34	defseq	boss13demo,boss34_ihan
boss35	defseq	boss35demo,boss35_ihan
boss36	defseq	boss36demo,boss36_ihan
boss37	defseq	boss37demo,boss37_ihan

bossfinal	defseq	bossfinaldemo,bossfinal_ihan

boss11demo	defdemo	0000,0000,-70<<boss7_scale,-200,boss_7_1o,boss7_Istrat,2_4
boss12demo	defdemo	0000,0000,0000,2500,boss_1_2,boss1_istrat
boss14demo	defdemo	0000,2000,-600,1000,boss_h_0,bossh_istrat
boss15demo	defdemo	0000,0000,-1000,2500,boss_b_1,bossBrob_Istrat
boss16demo	defdemo	0000,0000,-1000,2500,boss_b_0,bossBrobdemo_Istrat

boss23demo	defdemo	0000,0000,-060,0000,boss_g_0,gnd_istrat
boss24demo	defdemo	0000,0000,-80,2000,flingboss,flingboss_istrat
boss25demo	defdemo	0000,0000,0000,2000,nullshape,castanet_istrat
boss26demo	defdemo	0000,-200,-70,-300,boss_9_5,madtrucker_istrat

boss31demo	defdemo	0000,3000,0000,375<<bossa_scale,boss_A_2,bossA_Istrat
boss32demo	defdemo	0000,000,000,1200,boss_0_1,webmonster_istrat,2_4
boss33demo	defdemo	0000,-100,0000,2500,boss_d_1,chicken_istrat
boss35demo	defdemo	0000,0000,0000,2500,boss_2_2,boss2_istrat
boss36demo	defdemo	0000,0000,2000,2500,boss_f_3,bossf_Istrat
boss37demo	defdemo	0000,-100,-500,0000,boss_f_4,airship_istrat

bossfinaldemo	defdemo	0000,0,Space_viewCY,-200,face_b,monolith_istrat


demotxtbase
boss11txt	SETDPOS	7*32+6
	IFEQ	GERMAN
	DB	'LEVEL 1'
	ELSEIF
	DB	'ROUTE 1'
	ENDC
;	SETDPOS	8*32+6
;	DB	'STAGE 1'
	SETDPOS	9*32+6
	DB	'CORNERIA'
	DB	0
boss21txt	SETDPOS	7*32+6
	IFEQ	GERMAN
	DB	'LEVEL 2'
	ELSEIF
	DB	'ROUTE 2'
	ENDC
;	SETDPOS	8*32+6
;	DB	'STAGE 1'
	SETDPOS	9*32+6
	DB	'CORNERIA'
	DB	0
boss31txt	SETDPOS	7*32+6
	IFEQ	GERMAN
	DB	'LEVEL 3'
	ELSEIF
	DB	'ROUTE 3'
	ENDC
;	SETDPOS	8*32+6
;	DB	'STAGE 1'
	SETDPOS	9*32+6
	DB	'CORNERIA'
	DB	0
boss11txt2
boss21txt2
	SETDPOS	25*32+6
	DB	"NAME   - ATTACK CARRIER"
	SETDPOS	26*32+6
	IFEQ	GERMAN
	DB	"WEAPON - MISSILE BLASTER"
	ELSEIF
	DB	"WAFFE  - MISSILE BLASTER"
	ENDC
	SETDPOS	27*32+6
	IFEQ	GERMAN
	DB	"SIZE   - H70*W100*D150"
	ELSEIF
	DB	"GROESSE- H70*B100*T150"
	ENDC
	DB	0,0
boss31txt2	SETDPOS	25*32+6
	DB	"NAME   - DESTRUCTOR"
	SETDPOS	26*32+6
	IFEQ	GERMAN
	DB	"WEAPON - PLASMA"
	ELSEIF
	DB	"WAFFE  - PLASMA"
	ENDC
	SETDPOS	27*32+6
	IFEQ	GERMAN
	DB	"SIZE   - H45*W150*D90"
	ELSEIF
	DB	"GROESSE- H45*B150*T90"
	ENDC
	DB	0,0

boss12txt	SETDPOS	7*32+6
	IFEQ	GERMAN
	DB	'LEVEL 1'
	ELSEIF
	DB	'ROUTE 1'
	ENDC
;	SETDPOS	8*32+6
;	DB	'STAGE 2'
	SETDPOS	9*32+6
	DB	'ASTEROID'
	DB	0
boss22txt	SETDPOS	7*32+6
	IFEQ	GERMAN
	DB	'LEVEL 2'
	ELSEIF
	DB	'ROUTE 2'
	ENDC
;	SETDPOS	8*32+6
;	DB	'STAGE 2'
	SETDPOS	9*32+6
	IFEQ	GERMAN
	DB	'SECTOR %'
	ELSEIF
	DB	'SEKTOR %'
	ENDC
	DB	0
boss12txt2
boss22txt2	SETDPOS	25*32+6
	DB	"NAME   - ROCK CRUSHER"
	SETDPOS	26*32+6
	IFEQ	GERMAN
	DB	"WEAPON - LASER"
	ELSEIF
	DB	"WAFFE  - LASER"
	ENDC
	SETDPOS	27*32+6
	IFEQ	GERMAN
	DB	"SIZE   - H60*W86*D45"
	ELSEIF
	DB	"GROESSE- H60*B86*T45"
	ENDC
	DB	0,0
boss32txt	SETDPOS	7*32+6
	IFEQ	GERMAN
	DB	'LEVEL 3'
	ELSEIF
	DB	'ROUTE 3'
	ENDC
;	SETDPOS	8*32+6
;	DB	'STAGE 2'
	SETDPOS	9*32+6
	DB	'ASTEROID'
	DB	0
boss32txt2	SETDPOS	25*32+6
	DB	"NAME   - BLADE BARRIER"
	SETDPOS	26*32+6
	IFEQ	GERMAN
	DB	"WEAPON - WEB ATTACK"
	ELSEIF
	DB	"WAFFE  - WEB ATTACK"
	ENDC
	SETDPOS	27*32+6
	IFEQ	GERMAN
	DB	"SIZE   - H90*W90*D65"
	ELSEIF
	DB	"GROESSE- H90*B90*T65"
	ENDC
	DB	0,0

boss13txt	SETDPOS	7*32+6
	IFEQ	GERMAN
	DB	'LEVEL 1'
	ELSEIF
	DB	'ROUTE 1'
	ENDC
;	SETDPOS	8*32+6
;	DB	'STAGE 3'
	SETDPOS	9*32+6
	IFEQ	GERMAN
	DB	'SPACE'
	ELSEIF
	DB	'RAUM-'
	ENDC
	SETDPOS	11*32+6
	IFEQ	GERMAN
	DB	'ARMADA'
	ELSEIF
	DB	'FLOTTE'
	ENDC
	DB	0
boss13txt2	SETDPOS	25*32+6
	DB	"NAME   - ATOMIC BASE"
	SETDPOS	26*32+6
	IFEQ	GERMAN
	DB	"WEAPON - LASER"
	ELSEIF
	DB	"WAFFE  - LASER"
	ENDC
	SETDPOS	27*32+6
	IFEQ	GERMAN
	DB	"SIZE   - H600*W850*D1200"
	ELSEIF
	DB	"GROESSE- H600*B850*T1200"
	ENDC
	DB	0,0
boss23txt	SETDPOS	7*32+6
	IFEQ	GERMAN
	DB	'LEVEL 2'
	ELSEIF
	DB	'ROUTE 2'
	ENDC
;	SETDPOS	8*32+6
;	DB	'STAGE 3'
	SETDPOS	9*32+6
	DB	'TITANIA'
	DB	0
boss23txt2	SETDPOS	25*32+6
	DB	"NAME   - PROFESSOR HANGER"
	SETDPOS	26*32+6
	IFEQ	GERMAN
	DB	"WEAPON - SHADOW THRUSTER"
	ELSEIF
	DB	"WAFFE  - SHADOW THRUSTER"
	ENDC
	SETDPOS	27*32+6
	IFEQ	GERMAN
	DB	"SIZE   - H25*W18*D30"
	ELSEIF
	DB	"GROESSE- H25*B18*T30"
	ENDC
	DB	0,0
boss33txt	SETDPOS	7*32+6
	IFEQ	GERMAN
	DB	'LEVEL 3'
	ELSEIF
	DB	'ROUTE 3'
	ENDC
;	SETDPOS	8*32+6
;	DB	'STAGE 3'
	SETDPOS	9*32+6
	DB	'FORTUNA'
	DB	0
boss33txt2	SETDPOS	25*32+6
	DB	"NAME   - MONARCH DODORA"
	SETDPOS	26*32+6
	IFEQ	GERMAN
	DB	"WEAPON - FIRE BREATH"
	ELSEIF
	DB	"WAFFE  - FIRE BREATH"
	ENDC
	SETDPOS	27*32+6
	IFEQ	GERMAN
	DB	"SIZE   - H85*W160*D200"
	ELSEIF
	DB	"GROESSE- H85*B160*T200"
	ENDC
	DB	0,0

boss14txt	SETDPOS	7*32+6
	IFEQ	GERMAN
	DB	'LEVEL 1'
	ELSEIF
	DB	'ROUTE 1'
	ENDC
;	SETDPOS	8*32+6
;	DB	'STAGE 4'
	SETDPOS	9*32+6
	DB	'METEOR'
	DB	0
boss14txt2	SETDPOS	25*32+6
	DB	"NAME   - DANCING INSECTOR"
	SETDPOS	26*32+6
	IFEQ	GERMAN
	DB	"WEAPON - FIRE BLASTER"
	ELSEIF
	DB	"WAFFE  - FIRE BLASTER"
	ENDC
	SETDPOS	27*32+6
	IFEQ	GERMAN
	DB	"SIZE   - H120*W87*D72"
	ELSEIF
	DB	"GROESSE- H120*B87*T72"
	ENDC
	DB	0,0
boss24txt	SETDPOS	7*32+6
	IFEQ	GERMAN
	DB	'LEVEL 2'
	ELSEIF
	DB	'ROUTE 2'
	ENDC
;	SETDPOS	8*32+6
;	DB	'STAGE 4'
	SETDPOS	9*32+6
	IFEQ	GERMAN
	DB	'SECTOR $'
	ELSEIF
	DB	'SEKTOR $'
	ENDC
	DB	0
boss24txt2	SETDPOS	25*32+6
	DB	"NAME   - PLASMA HYDRA"
	SETDPOS	26*32+6
	IFEQ	GERMAN
	DB	"WEAPON - PLASMA SPEWER"
	ELSEIF
	DB	"WAFFE  - PLASMA SPEWER"
	ENDC
	SETDPOS	27*32+6
	IFEQ	GERMAN
	DB	"SIZE   - H96*W280*D55"
	ELSEIF
	DB	"GROESSE- H96*B280*T55"
	ENDC
	DB	0,0
boss34txt	SETDPOS	7*32+6
	IFEQ	GERMAN
	DB	'LEVEL 3'
	ELSEIF
	DB	'ROUTE 3'
	ENDC
;	SETDPOS	8*32+6
;	DB	'STAGE 4'
	SETDPOS	9*32+6
	IFEQ	GERMAN
	DB	'SECTOR #'
	ELSEIF
	DB	'SEKTOR #'
	ENDC
	DB	0
boss34txt2	SETDPOS	25*32+6
	DB	"NAME   - ATOMIC BASE II"
	SETDPOS	26*32+6
	IFEQ	GERMAN
	DB	"WEAPON - LASER"
	ELSEIF
	DB	"WAFFE  - LASER"
	ENDC
	SETDPOS	27*32+6
	IFEQ	GERMAN
	DB	"SIZE   - H92*W90*D1100"
	ELSEIF
	DB	"GROESSE- H92*B90*T1100"
	ENDC
	DB	0,0

boss15txt	SETDPOS	7*32+6
	IFEQ	GERMAN
	DB	'LEVEL 1'
	ELSEIF
	DB	'ROUTE 1'
	ENDC
;	SETDPOS	8*32+6
;	DB	'STAGE 5'
	SETDPOS	9*32+6
	DB	'VENOM'
	DB	0
boss25txt	SETDPOS	7*32+6
	IFEQ	GERMAN
	DB	'LEVEL 2'
	ELSEIF
	DB	'ROUTE 2'
	ENDC
;	SETDPOS	8*32+6
;	DB	'STAGE 5'
	SETDPOS	9*32+6
	DB	'VENOM'
	DB	0
boss15txt2	SETDPOS	25*32+6
	DB	"NAME   - PHANTRON"
	SETDPOS	26*32+6
	IFEQ	GERMAN
	DB	"WEAPON - LASER"
	ELSEIF
	DB	"WAFFE  - LASER"
	ENDC
	SETDPOS	27*32+6
	IFEQ	GERMAN
	DB	"SIZE   - H25*W22*D31"
	ELSEIF
	DB	"GROESSE- H25*B22*T31"
	ENDC
	DB	0,0
boss25txt2	SETDPOS	25*32+6
	DB	"NAME   - METAL SMASHER"
	SETDPOS	26*32+6
	IFEQ	GERMAN
	DB	"WEAPON - CRUSH ATTACK"
	ELSEIF
	DB	"WAFFE  - CRUSH ATTACK"
	ENDC
	SETDPOS	27*32+6
	IFEQ	GERMAN
	DB	"SIZE   - H17*W20*D38"
	ELSEIF
	DB	"GROESSE- H17*B20*T38"
	ENDC
	DB	0,0

boss16txt	SETDPOS	7*32+6
	IFEQ	GERMAN
	DB	'LEVEL 1'
	ELSEIF
	DB	'ROUTE 1'
	ENDC
;	SETDPOS	8*32+6
;	DB	'STAGE 6'
	SETDPOS	9*32+6
	DB	'VENOM'
	DB	0
boss26txt	SETDPOS	7*32+6
	IFEQ	GERMAN
	DB	'LEVEL 2'
	ELSEIF
	DB	'ROUTE 2'
	ENDC
;	SETDPOS	8*32+6
;	DB	'STAGE 6'
	SETDPOS	9*32+6
	DB	'VENOM'
	DB	0
boss26txt2	SETDPOS	25*32+6
	DB	"NAME   - GALACTIC RIDER"
	SETDPOS	26*32+6
	IFEQ	GERMAN
	DB	"WEAPON - AIR BIKERS"
	ELSEIF
	DB	"WAFFE  - AIR BIKERS"
	ENDC
	SETDPOS	27*32+6
	IFEQ	GERMAN
	DB	"SIZE   - H80*W61*D25"
	ELSEIF
	DB	"GROESSE- H80*B61*T25"
	ENDC
	DB	0,0

boss35txt	SETDPOS	7*32+6
	IFEQ	GERMAN
	DB	'LEVEL 3'
	ELSEIF
	DB	'ROUTE 3'
	ENDC
;	SETDPOS	8*32+6
;	DB	'STAGE 5'
	SETDPOS	9*32+6
	DB	'MACBETH'
	DB	0
boss35txt2	SETDPOS	25*32+6
	DB	"NAME   - SPINNING CORE"
	SETDPOS	26*32+6
	IFEQ	GERMAN
	DB	"WEAPON - LASER"
	ELSEIF
	DB	"WAFFE  - LASER"
	ENDC
	SETDPOS	27*32+6
	IFEQ	GERMAN
	DB	"SIZE   - H63*W52*D45"
	ELSEIF
	DB	"GROESSE- H63*B52*T45"
	ENDC
	DB	0,0

boss36txt	SETDPOS	7*32+6
	IFEQ	GERMAN
	DB	'LEVEL 3'
	ELSEIF
	DB	'ROUTE 3'
	ENDC
;	SETDPOS	8*32+6
;	DB	'STAGE 6'
	SETDPOS	9*32+6
	DB	'VENOM'
	DB	0

boss36txt2	SETDPOS	25*32+6
	DB	"NAME   - GREAT COMMANDER"
	SETDPOS	26*32+6
	IFEQ	GERMAN
	DB	"WEAPON - LASER"
	ELSEIF
	DB	"WAFFE  - LASER"
	ENDC
	SETDPOS	27*32+6
	IFEQ	GERMAN
	DB	"SIZE   - H73*W97*D250"
	ELSEIF
	DB	"GROESSE- H73*B97*T250"
	ENDC
	DB	0,0

boss37txt	SETDPOS	7*32+6
	IFEQ	GERMAN
	DB	'LEVEL 3'
	ELSEIF
	DB	'ROUTE 3'
	ENDC
;	SETDPOS	8*32+6
;	DB	'STAGE 7'
	SETDPOS	9*32+6
	DB	'VENOM'
	DB	0
boss37txt2	SETDPOS	25*32+6
	DB	"NAME   - GREAT COMMANDER"
	SETDPOS	26*32+6
	IFEQ	GERMAN
	DB	"WEAPON - IRON BALLS"
	ELSEIF
	DB	"WAFFE  - IRON BALLS"
	ENDC
	SETDPOS	27*32+6
	IFEQ	GERMAN
	DB	"SIZE   - H73*W97*D250"
	ELSEIF
	DB	"GROESSE- H73*B97*T250"
	ENDC
	DB	0,0



bossfinaltxt	SETDPOS	7*32+6
	IFEQ	GERMAN
	DB	"FINAL"
	ELSEIF
	DB	"LETZTE"
	ENDC
	SETDPOS	8*32+6
	IFEQ	GERMAN
	DB	"STAGE"
	ELSEIF
	DB	"ETAPPE"
	ENDC
	DB	0
bossfinaltxt2	SETDPOS	25*32+6
	ifne	JAPANESE
	DB	"NAME   - ANDORF..."
	elseif
	DB	"NAME   - ANDROSS..."
	endc
	SETDPOS	26*32+6
	IFEQ	GERMAN
	DB	"WEAPON - TELEKINESIS"
	ELSEIF
	DB	"WAFFE  - TELEKINESIS"
	ENDC
	SETDPOS	27*32+6
	IFEQ	GERMAN
	DB	"SIZE   - H100*W80*D30"
	ELSEIF
	DB	"GROESSE- H100*B80*T30"
	ENDC
	DB	0,0



rotsize	=	deg45
rotnum	=	deg360/rotsize
prot	=	0

boss13demo	mapobj	0000,0000,(-50<<boss8_scale)+nucleusheight,210<<boss8_scale,boss_8_0,boss8_Istrat
	setvarobj	mapvar1
	mapobj	0000,0000,(-50<<boss8_scale)+nucleusheight,boss8_circ,hou_4,nucleuslauncher_Istrat
	setalvar	sbyte2,deg90+deg22
	mapobj	0000,0000,(-50<<boss8_scale)+nucleusheight,boss8_circ,hou_4,nucleuslauncher_Istrat
	setalvar	sbyte2,deg135+deg22
	mapobj	0000,0000,(-50<<boss8_scale)+nucleusheight,boss8_circ,hou_4,nucleuslauncher_Istrat
	setalvar	sbyte2,deg270-deg22
	mapobj	0000,0000,(-50<<boss8_scale)+nucleusheight,boss8_circ,hou_4,nucleuslauncher_Istrat
	setalvar	sbyte2,-deg22
	REPT	rotnum
	mapobj	0000,0000,0000+nucleusheight,boss8_circ,boss_8_4,nucleuspillar_Istrat
	setalvar	sbyte2,rotsize*prot
prot	=	prot+1
	ENDR
	mapwait	1000






;-------------------------------------------------------------------------
titleseq_l	php

	IFNE	contest
	a8i16
	bgm	init
	a8i16
	ldx	#0
.ll	dex
	bne	.ll
	bgm	intro
	ENDC

titleredo	a8i16
	disable

;	jml	timeupin

	lda	#1
	sta.l	oncewipe
	lda	#titlemap>>16
	ldx	#titlemap&$7fff
	sta	mapbank
	stx	mapptr
	jsl	initgame_l
	s_and_var		B,pshipflags3,#~psf3_enginesnd

	jsl	setcharmapfox_l

	a16
	lda	#0
	sta.l	m_meters
	sta	exitintro
	stz	gameframe

	a16
	lda	#880
	pha
.lp	jsl	setblack_l
	jsl	transfer_l
	a8
	lda	#1+8
	sta	bgmode
	a16
	pla

	IFEQ	contest
	dec	a
	beq	.endtitle
	ENDC

	pha
	lda	gameframe
	cmp	#40
	jb	.lp
	a8
	lda	cont0
	bit	#key_start
	beq	.lp

	a16
	pla
	a8

	trigse		$10
	startbgm	$f1

	lda	#-3
	sta	fadedir
.lp2	jsl	setblack_l
	jsl	transfer_l
	a8
	lda	#1+8
	sta	bgmode
	untilfaded .lp2
	plp
	rtl

.endtitle	a8
	startbgm	$f1
	lda	#-3
	sta	fadedir
.lp3	jsl	setblack_l
	jsl	transfer_l
	a8
	lda	#1+8
	sta	bgmode
	untilfaded .lp3

	jsl	intro_l
	jmp	titleredo



;-------------------------------------------------------------------
; INTRO SEQUENCE

intro_l
	a8i16
	IFNE msu
	lda	msupresent
	beq	.regbgm
    lda	#$FF
    sta	MSU_VOLUME
    ldx	#$0001    ; Writing a 16-bit value will automatically
    stx	MSU_TRACK    ; set $2005 as well, so this is easy.
    lda	#$03   ; Set audio state to play, no repeat.
    sta	MSU_CONTROL
	bra	.donemsu
.regbgm
	bgm	init
.donemsu
	ELSEIF
	bgm	init
	ENDC
	a8i16
	ldx	#0
.ll	dex
	bne	.ll
	bgm	intro
	disable

	lda	#intromap>>16
	ldx	#intromap&$7fff
	sta	mapbank
	stx	mapptr
	jsl	initgame_l
	s_and_var		B,pshipflags3,#~psf3_enginesnd

	jsl	setcharmapfox_l

	lda	#0
	sta.l	m_meters
	sta	exitintro
	sta.l	oncewipe
	stz	gameframe

.lp3	jsl	setblack_l
	jsl	transfer_l
	a8
	lda	gameframe
	cmp	#30
	bcc	.lp3

	lda	exitintro
	bne	.waitup
	lda	cont0
	ora	contl0
	beq	.lp3
.waitup
	lda	#-2
	sta	fadedir
	lda	#11
	sta	fade
.finishlp
	jsl	setblack_l
	jsl	transfer_l
	a8
	lda	fadedir
	bne	.finishlp
	rtl


	IFNE	CONTEST

;-------------------------------------------------------------------
; TIME OVER SEQUENCE

timeover_l
	a8i16
	disable

	lda	#timeovermap>>16
	ldx	#timeovermap&$7fff
	sta	mapbank
	stx	mapptr
	jsl	initgame_l
	s_and_var		B,pshipflags3,#~psf3_enginesnd

	jsl	setcharmapfox_l

	lda	#0
	sta.l	m_meters
	sta	exitintro
	sta	gameframe
	lda	#1
	sta.l	oncewipe

	jsl	setblack_l
	jsl	transfer_l

	a8
.waitup2
	lda	trans_flag
	bne	.waitup2

;-----------------------------------------
; print score in big letters
	
	ldx	#vsc_base2+32*$12+7
	stx	y1

	lda.l	numbuff
	jsr	.printnum

	lda.l	numbuff+1
	jsr	.printnum

	lda.l	numbuff+2
	jsr	.printnum

	lda.l	numbuff+3
	jsr	.printnum

	lda.l	numbuff+4
	jsr	.printnum

;-----------------------------------------

	a16
	stz	gameframe
	a8

.lp3
	jsl	setblack_l
	jsl	transfer_l
	a16
	lda	gameframe
	cmp	#20*30
	a8
	bcc	.lp3

	lda	cont0
	ora	contl0
	beq	.lp3

	lda	#-2
	sta	fadedir

.fadedown
	jsl	setblack_l
	jsl	transfer_l
	a8
	lda	fadedir
	bne	.fadedown
	
	jml	restart

; a = num to print
.printnum	shorta
	i8
	tax
	lda.l	.nums,x
	ai16
	and	#255
	ora	#1<<10
	clc
	adc	#scr_offset
	sta	x1

	lda	y1
	tax
	clc
	adc	#3
	sta	y1

	ldy	#4
.lp
	stx	vmaddl

	lda	x1
	sta	vmdatal
	inc	a
	sta	vmdatal

	txa
	clc
	adc	#32
	tax

	lda	x1
	clc
	adc	#16
	sta	x1

	dey
	bne	.lp
	a8
	rts
	


.nums	db	$10,$12,$14,$16,$18,$1a,$1c,$1e,$50,$52





;-------------------------------------------------------------------
; TIMEUP SEQUENCE

timeup_l
	a8i16
	lda	#-2
	sta	fadedir

	startbgm	$f0

.untiloff
	jsl	setblack_l
	jsl	transfer_l
	a8
	lda	fadedir
	bne	.untiloff

timeupin
	a8i16
	disable

	lda	#timeupmap>>16
	ldx	#timeupmap&$7fff
	sta	mapbank
	stx	mapptr
	jsl	initgame_l
	s_and_var		B,pshipflags3,#~psf3_enginesnd

	jsl	setcharmapfox_l

	lda	#0
	sta.l	m_meters
	sta	exitintro
	sta	gameframe
	sta	gameframe+1
	lda	#1
	sta.l	oncewipe

;-----------------------------------------

.lp3	jsl	setblack_l
	jsl	transfer_l
	a16
	lda	gameframe
	cmp	#200
	bne	.lp3

	a8
	lda	#-2
	sta	fadedir
.finishlp
	jsl	setblack_l
	jsl	transfer_l
	a8
	lda	fadedir
	bne	.finishlp
	
	
	jml	timeover_l


	ENDC


tit_istrat
	s_start_strat
	s_set_alvar	B,x,al_rotx,#-deg45+deg11+deg11+3-deg5
	s_set_alvar	B,x,al_roty,#deg45+deg90	;+deg11
	s_set_alvar	B,x,al_rotz,#0
	s_set_strat	x,tit_strat
tit_strat
	s_start_strat
	s_add_alvar	B,x,al_rotz,#2
	s_add_playerz x
	s_end_strat



