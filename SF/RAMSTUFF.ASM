
	incpublics	EXT\ramstuff.ext

	incfile	irq.asm

	incfile	hdmatabs.asm

;-------------------------------------
; RUN MARIO ROUTINE ------------------
;-------------------------------------
	shorta
	longi
runmario_l
	sta.l	mcodebank	;code bank

	phb
	lda	#0
	pha
	plb

	lda	mario_draw_mode
	ora	#%00011000	;nasty
	sta	mio_mode

	stx	mr15
.dowait	lda	mflags
	and	#$20
	bne	.dowait

	lda	mario_draw_mode
	sta	mio_mode
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
	sta	mcodebank	;code bank
	lda	mario_draw_mode
	ora	#%00011000	;nasty
	sta	mio_mode
	stx	mr15

	jsr	parallel_stuff

	a8
.dowait	lda	mflags
	and	#$20
	bne	.dowait
	lda	mario_draw_mode
	sta	mio_mode

	jsl	alienflags_l

	rtl


parallel_stuff
	jsl	init_strats_ram_l
	rts

	incfile	coldet.asm


gamepalbuff	dw	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

	IFEQ	1

tunnelgreen	dw	$25ab,$3620,$31e0,$2de0,$29a0,$25a0,$2160,$1d60,$1d40,$1520,$1500,$0ce0,$0cc0,$04a0,$0480,$0020
	dw	$25ab,$31e0,$3620,$29a0,$2de0,$2160,$25a0,$1d40,$1d60,$1500,$1520,$0cc0,$0ce0,$0480,$04a0,$0040
tunnelblue	dw	$25ab,$4dcf,$4def,$3d4b,$3d6b,$2cc7,$2ce7,$1c43,$1c63,$1000,$1020,$0000,$0020,$0000,$0020,$0402
	dw	$25ab,$4def,$458d,$3d6b,$3509,$2ce7,$2485,$1c63,$1401,$1020,$0800,$0020,$0000,$0020,$0803,$0402
tunnelpurple dw	$25ab,$354e,$354f,$2d0c,$2d0d,$24ca,$24cb,$1c88,$1c89,$1446,$1447,$0c04,$0c05,$0402,$0403,$0402
	dw	$25ab,$354f,$312d,$2d0d,$28eb,$24cb,$20a9,$1c89,$1867,$1447,$1025,$0c05,$0803,$0403,$0803,$0402
tunnelred	dw	$25ab,$017c,$019c,$00f8,$0118,$0074,$0094,$0010,$0030,$000c,$002c,$0008,$0028,$0004,$0024,$0000
	dw	$25ab,$019c,$013a,$0118,$00b6,$0094,$0032,$0030,$000e,$002c,$000a,$0028,$0006,$0024,$0002,$0000
tunnelcolony dw	$0000,$3dd2,$3dd4,$3590,$3592,$2d4e,$2d50,$250c,$250e,$1cca,$1ccc,$1488,$148a,$0c46,$0c48,$0404
	dw	$0000,$3dd4,$39b1,$3592,$316f,$2d50,$292d,$250e,$20eb,$1ccc,$18a9,$148a,$1067,$0c46,$0825,$0404
	ENDC
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
redtunnel	dw	0000h,00d1h,00b0h,008fh,006eh,004dh,002ch,000bh
	dw	000ah,0009h,0008h,0007h,0006h,0005h,0004h,7fffh
	dw	0000h,00d1h,00b0h,008fh,006eh,004dh,002ch,000bh
	dw	000ah,0009h,0008h,0007h,0006h,0005h,0004h,0000h


;# = gamma  $ = beta  % = alpha
etesttrans	db	0,01ch,0,02ch,02bh,02ah,0,0,0,0
	db	029h,0,0,027h,028h,0,01dh,01eh,01fh,020h
	db	021h,022h,023h,024h,025h,026h,0,0,0,0
	db	0,0,0,2,3,4,5,6,7,8
	db	9,10,11,12,13,14,15,16,17,18
	db	19,20,21,22,23,24,25,26,27,28


thundercol	dw $0000,$7fff,$36fe,$32bd,$2e7b,$2e79,$2677,$1e35
	dw $15f3,$0db1,$016e,$77ee,$00c7,$00a6,$0085,$0043





