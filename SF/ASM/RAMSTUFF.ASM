
	incpublics	EXT\ramstuff.ext

	incfile	ASM\irq.asm

	incfile	ASM\hdmatabs.asm

;-------------------------------------
; RUN MARIO ROUTINE ------------------
;-------------------------------------
	shorta
	longi
runmario_l
	sta.l	m_pbr	;code bank

	phb
	IFNE	FASTROM
	lda	#$80
	pha
	plb
	ELSEIF
	lda	#0
	pha
	plb
	ENDC

	lda	mario_draw_mode
	ora	#%00011000	;nasty
	sta	m_scmr

	stx	mr15
.dowait	lda	m_sfr
	and	#$20
	bne	.dowait

	lda	mario_draw_mode
	sta	m_scmr
	plb
	rtl


cop	blink



do_3d_display_l
	ai16
	lda	hudrot
	sta.l	m_hudrot
	lda	defaultID
	sta.l	m_defaultID
	a8
	lda	#mdo_3d_display>>16
	ldx	#mdo_3d_display&WM
	sta	m_pbr	;code bank
	lda	mario_draw_mode
	ora	#%00011000	;nasty
	sta	m_scmr
	stx	mr15

	jsr	parallel_stuff

	a8
.dowait	lda	m_sfr
	and	#$20
	bne	.dowait
	lda	mario_draw_mode
	sta	m_scmr

	jsl	alienflags_l

	rtl


parallel_stuff
	jsl	init_strats_ram_l
	rts

	incfile	ASM\coldet.asm


gamepalbuff	dw	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
;	list	on macros


;---------------------------------------------------
cbeginz	=	3192

cstartz	=	cbeginz

cstep	=	128

citerations	=	cstartz/cstep

canimstep	=	4

cscr1	=	16+8
cscr2	=	256+16+8
cscrc	=	112

tmp	=	0

	REPT	cstep/canimstep

	run	"chequered_tab",tmp


;---------------------------------------------------
; inner loop of ceiling

cyval	=	10
ctoggle	=	1
czpos	=	-(cbeginz-cstartz)+cstep*2
cypos	=	-60

	REPT	citerations

tmp2	=	czpos

	IFLE	czpos
czpos	=	1
	ENDC

clastyval	=	cyval
cyval	=	(cypos*256)/(czpos)+cscrc
	IFLE	cyval-15
cyval	=	15
	ENDC
ctoggle	=	ctoggle+1
cdiff	=	cyval-clastyval
	IFNE	cdiff
	IFLT	cdiff-127
	db	cdiff!((ctoggle&1)<<7)
	ENDC	
	ENDC

	IFEQ	ctoggle&1
czpos	=	tmp2+cstep+(cstep/8)*4
	ELSEIF
czpos	=	tmp2+cstep-(cstep/8)*4
	ENDC
	ENDR


;---------------------------------------------------
; inner loop of floor

ctoggle	=	1
czpos	=	cstartz-cstep*2
cypos	=	60

	REPT	citerations

	IFLE	czpos
czpos	=	1
	ENDC

clastyval	=	cyval
cyval	=	(cypos*256)/(czpos)+cscrc
ctoggle	=	ctoggle+1
cdiff	=	cyval-clastyval
	IFNE	cdiff
	IFLT	cdiff-127
	db	cdiff!((ctoggle&1)<<7)
	ENDC	
	ENDC

czpos	=	czpos-cstep
	ENDR
;---------------------------------------------------
	db	0,0,0
cstartz	=	cstartz-canimstep*2
tmp	=	tmp+1
	ENDR

tmp	=	0
chequered_tables
	REPT	cstep/canimstep
	run	"%tdw%tchequered_tab",tmp,"&WM"
tmp	=	tmp+1
	ENDR



;--------------------------------------------------------------------------
redtunnel	inccolfile	DATA\COL\TUNLRED.COL,0,2

;# = gamma  $ = beta  % = alpha
etesttrans	db	0,01ch,0,02ch,02bh,02ah,0,0,0,0
	db	029h,0,0,027h,028h,0,01dh,01eh,01fh,020h
	db	021h,022h,023h,024h,025h,026h,0,0,0,0
	db	0,0,0,2,3,4,5,6,7,8
	db	9,10,11,12,13,14,15,16,17,18
	db	19,20,21,22,23,24,25,26,27,28


thundercol	inccolfile	DATA\COL\THUNDER.COL,0,1





