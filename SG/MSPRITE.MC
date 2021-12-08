

mshowspr
	jmp	r11
	nop

	IFEQ	1


;
; File:	MSPRITE.MC
;
; Use: 	Sprites
; Code:	MARIO
; By:  	Peter Warnes
;      	Copyright 1991
;		Argonaut Software Ltd.
;



rangle		equr	7	; 256 = 360 degrees
rxscale	equr	8	; 64 = 0.5 (= max if rotating)
ryscale	equr	9	; 64 = 0.5 (= max if rotating)

rx	equr	1
ry	equr	2
rt	equr	3
rmask	equr	4
rshift	equr	5
rsize	equr	6
rxpy	equr	3
rxpyi	equr	4
rypy	equr	5
rypyi	equr	6
ryp	equr	7
rxp	equr	8
rxpi	equr	9
rypi	equr	10
rspdata	equr	11


;************************************************
;************************************************


mfsprite16_rotate

	ifeq	0

	miwt	r0,112	;56	;0
	sms	[m_sprx],r0
	miwt	r0,64	;32	;0
	sms	[m_spry],r0

	miwt	r0,64	;32
	sms	[m_sprsize],r0

	sub	r0
;	miwt	r0,bowsprite256data>>16
	sms	[m_sprbank],r0
;	miwt	r0,bowsprite256data&$ffff
	sms	[m_sprdata],r0

	endc

	ifeq	1
	miwt	r0,32	;0
	sms	[m_sprxscale],r0
	miwt	r0,16	;0
	sms	[m_sprangle],r0
	endc

	ifeq	0
	lms	r0,[m_sprangle]
	add	#6
	sms	[m_sprangle],r0

;	lms	r0,[m_sprxscale]
;	sub	#4
;	lob
;	ibt	r1,#$7f
;	and	r1
;	sms	[m_sprxscale],r0

	endc

	mlbra	msprrot

;************************************************
;************************************************

;
; mshowspr
;
; Draws scaled rotated sprites
;
; (Optimised to draw scaled sprites)
;
; Parameters:
;
; sprsize	sprite data size in pixels (e.g. 32 or 64)
; sprxscale	scale (when z=256 and xscale=256 then 32x32 sprite
;		is drawn as 32x32 on screen
; spryscale	ignored
; sprangle	z rotation 
; sprx		screen centre x
; spry		screen centre y
; sprz		z distance
; sprbank
; sprdata


; z	  inc	 scale	 xscale	
;
; $7fff  $7f.ff   1/128 $00.01		
; $0100  $01.00   1     $01.00	
; $0001  $00.01 128	 $7f.ff	

mshowspr
	lms	r0,[m_sprz]		; xscale = (z * xscale) >> 8

	lms	r6,[m_sprxscale]
;	miwt	r6,256*32/32

	lmult

	lob
	swap
	with	r4
	hib
	or	r4
	
	sbk

msprrot
	mpush	r11

	sub	r0			; transparency on, dither off
	cmode
	ramb
	romb
;	sms	[m_sprangle],r0
;	mlbra	msprite256

	lms	r0,[m_sprxscale]	; xscale <<= 8

	mtest	r0
	bne	.x0		       	; if (xscale = 0) xscale = 1
	nop
	inc	r0
.x0
	bpl	.xok			; if (xscale >= $7f00) xscale = $7fff
	nop
	move	r0,#$7fff
.xok
	sbk

	ifne	1
	lms	r0,[m_spryscale]	; yscale <<= 8
	lob
	swap
	mtest	r0
	bne	.y0			; if (yscale = 0) yscale = 1
	nop
	inc	r0
.y0
	bpl	.yok			; if (yscale >= $7f00) yscale = $7fff
	nop
	move	r0,#$7fff
.yok
	sbk
	endc

	lms	r1,[m_sprsize]		; r1 = size/2
	with	r1
	lsr	

	lms	r0,[m_sprx]
	sms	[m_sprx0],r0
	sub	r1
	sms	[m_sprxscroll],r0	; xscroll = x0 - size/2

	lms	r0,[m_spry]
	sms	[m_spry0],r0
	sub	r1
	sms	[m_spryscroll],r0	; yscroll = y0 - size/2

	mcall	msprite_rot
	nop

	mpop	pc
	nop



;************************************************


; xscale = (z / size) << 8
;
; xscale = z << (8 - shift)
; xscale = z << 3	for 32x32
; xscale = z << 2	for 64x64


msprite_rot
	mpush	r11
	move	[m_sp],rsp

; scale factor

	lms	r4,[m_sprsize]

	lms	r6,[m_sprxscale]


	ifne	1		; try to use ztab instead of divide

	miwt	r0,maxztab
	sub	r6
	bmi	.div		; if z > maxztab then div
	nop

	miwt	r0,256		; if z < 256 then div
	sub	r6
	bpl	.div
	nop

; look up 32768/z

	ibt	r0,#ztab>>16
	romb

	with	r6
	bic	#1

	miwt	r0,ztab
	to	r14
	add	r6

	to	r6		; z = 32768/z
	getb
	inc	r14
	with	r6
	getbh

	from	r4
	lsr
	fmult
	to	r4
	rol

	sub	r0
	romb

	bra	.nodiv
	nop

	endc

.div
	from	r4
	lob
	swap
	to	r4
	lsr

 	sub	r0

	mcall	mdivu3216
	nop
.nodiv


; r4 = (size/2) * (256 / z)

	move	r5,r4

	lms	rangle,[m_sprangle]
	with	rangle
	lob
	beq	.3
	nop

	iwt	r6,#23167	; rotscale = sqrt(2) << 14
	from	r5		; rotsize = (projsize * rotscale) >> 14
	lmult

;	maslr0r4 2

	with	r4
	add	r4
	rol

	with	r4
	add	r4
	rol

	move	 r5,r0
.3

;************************************************

; clip sprite

	ifne	0
	lms	r0,[m_sprx]
	sub	r5			; xmin = x-size
	bpl	.5			; if (xmin < xleft) then xmin=0
	nop
	ibt	r0,#0
.5
	sms	[m_sprxmin],r0
	endc

	ifne	1
	lms	r0,[m_sprx]		; xmin = x-size
	to	r1
	sub	r5
	lms	r2,[m_xleft]
	from	r1
	sub	r2
	bpl	.5			; if (xmin < xleft) then xmin=xleft
	nop
	move	r1,r2
.5
	sms	[m_sprxmin],r1
	endc

	lms	r0,[m_sprx]		; xmax = x+size
	to	r1
	add	r5
	lms	r2,[m_xright]
	from	r1
	sub	r2
	bmi	.6			; if (xmax > xright) then xmax=xright
	nop
	move	r1,r2
	dec	r1
.6
	sms	[m_sprxmax],r1

	ifne	0
	lms	r0,[m_spry]
	sub	r5			; ymin = y-size
	bpl	.7			; if (ymin < ytop) then ymin=0
	nop
	ibt	r0,#0
.7
	sms	[m_sprymin],r0
	endc

	ifne	1
	lms	r0,[m_spry]		; ymin = y-size
	to	r1
	sub	r5
	lms	r2,[m_ytop]
	from	r1
	sub	r2
	bpl	.7			; if (ymin < ytop) then ymin=ytop
	nop
	move	r1,r2
.7
	sms	[m_sprymin],r1
	endc

	lms	r0,[m_spry]
	to	r1
	add	r5
	lms	r2,[m_ybot]
	from	r1
	sub	r2			; ymax = y+size
	bmi	.8		     	; if (ymax > xbot) then ymax=ybot
	nop
	move	r1,r2
	dec	r1
.8
	sms	[m_sprymax],r1

;************************************************

; trivial reject sprite
; calc sprwidth, sprheight


	lms	r1,[m_sprxmin]
	lms	r2,[m_xright]
	from	r1
	sub	r2
	mlbpl	msprite_rot_exit	; if sprxmin-xright >= 0 then exit

	lms	r0,[m_sprxmax]		; if sprxmax-xleft < 0 then exit
	lms	r2,[m_xleft]
	cmp	r2
	mlbmi	msprite_rot_exit

	sub	r1			; sprwidth = sprxmax - sprxmin + 1
	inc	r0
	sms	[m_sprwidth],r0

	lms	r1,[m_sprymin]		; if sprymin-ybot >= 0 then exit
	lms	r2,[m_ybot]
	from	r1
	sub	r2
	mlbpl	msprite_rot_exit

	lms	r0,[m_sprymax]		; if sprymax-ytop < 0 then exit
	lms	r2,[m_ytop]
	cmp	r2
	mlbmi	msprite_rot_exit

	sub	r1			; sprheight = sprymax - sprymin + 1
	inc	r0
	sms	[m_sprheight],r0


;************************************************

; load angle, xsccale, yscale
; calc. scaling rotation matrix

	lms	rxscale,[m_sprxscale]
	lms	rangle,[m_sprangle]
	with	rangle
	lob
	bne	.not0
;	nop

	sub	r0
	sms	[m_sprb],r0		; b = c = 0
	sms	[m_sprc],r0

	sms	[m_spra],rxscale	; a = xscale
;	lms	r0,[m_spryscale]
	sms	[m_sprd],rxscale	; d = yscale

	bra	calcxpyp
	nop

.not0
	with	rxscale			; xscale = (xscale / size) << 1
	add	rxscale

	move	ryscale,rxscale

	miwt	r0,costab		; r6 = cos(angle)
	to	r14
	add	rangle
	getb
	to	r6
	swap

	from	rxscale
	fmult
	sms	[m_spra],r0		; a = xscale * cos(angle)

	from	ryscale
	fmult
	sms	[m_sprd],r0		; d = yscale * cos(angle)

	miwt	r0,sintab		; r6 = sin(angle)	
	to	r14
	add	rangle
	getb
	to	r6
	swap

	from	rxscale
	fmult
	sms	[m_sprb],r0		; b = xscale * sin(angle)

	from	ryscale
	not
	inc	r0
	fmult
	sms	[m_sprc],r0		; c = yscale * -sin(angle)

;************************************************

; calc initial xp, yp

rx0	equr	3
rcnt	equr	12
ry0	equr	13


calcxpyp
	lms	rx,[m_sprxmin]
	lms	ry,[m_sprymin]

	lms	rx0,[m_sprx0]
	lms	ry0,[m_spry0]
	lms	rxpi,[m_spra]
	lms	rypi,[m_sprc]

	from	ry
	to	r6
	sub	ry0
	lms	r0,[m_sprb]
	lmult	      		; r4 = (y-y0)*b
	move	rxp,r4

	from	rx
	to	r6
	sub	rx0
	from	rxpi
	lmult			; r4 = (x-x0)*a

	with	rxp		; rxp = (x-x0)*a + (y-y0)*b
	add	r4

	from	rx0
	swap
	with	rxp
	add	r0

	from	ry
	to	r6
	sub	ry0
	lms	r0,[m_sprd]
	lmult			; r4 = (y-y0)*d
	move	ryp,r4		

	from	rx
	to	r6
	sub	rx0
	from	rypi
	lmult	  		; r4 = (x-x0)*c

	with	ryp		; ryp = (x-x0)*c + (y-y0)*d
	add	r4

	with	ry0
	swap
	with	ryp
	add	ry0

; add in xscroll, yscroll

	lms	r0,[m_sprxscroll]
	swap
	with	rxp
	sub	r0

	lms	r0,[m_spryscroll]
	swap
	with	ryp
	sub	r0

	move	rxpy,rxp
	move	rypy,ryp

;************************************************

; load xpyi, ypyi

	lms	rxpyi,[m_sprb]
	lms	rypyi,[m_sprd]

; load sprbank, sprdata

	lms	r0,[m_sprbank]		; set sprite ROM bank
	romb

	lms	rspdata,[m_sprdata]	; set sprite ROM addr

; load sprxmin, sprheight

	lms	rx,[m_sprxmin]		; rx.h = xmin
	with	rx
	swap

	lms	r0,[m_sprheight]	; ry.h = y + height
	lob
	add	ry
	swap
	to	ry
	or	ry


;***********************************************

;rx	equr	1
;ry	equr	2
;rxpy	equr	3
;rypyi	equr	4
;rxpy	equr	5
;rypyi	equr	6
;ryp	equr	7
;rxp	equr	8
;rxpi	equr	9
;rypi	equr	10
;rspdata	equr	11


msprloop	macro

	lms	rypy,[m_sprwidth]
	miwt	r13,.fsprite16y_scaleloop

.fsprite16y_scale

	with	rx		; rx.l = rx.h
	hib
	from	rx
	swap
	to	rx
	or	rx

	move	rxp,rxpy
 	move	rcnt,rypy

	merge
	to	r14
	add	rspdata
	with	rxp
	add	rxpi
;	getc
;	loop
;	plot

.fsprite16y_scaleloop
	merge
	getc
	to	r14
	add	rspdata
	with	rxp
	add	rxpi
	loop
	plot

	with	ryp	     	; ryp += rypyi
	add	rypyi

	from	ry	      	; if ry.h <> ry.l then ry+=1; loop back
	swap
	sub	ry
	bne	.fsprite16y_scale
	inc	ry

	endm




msprrotloop	macro

.fsprite16y_rotate

	with	rx		; rx.l = rx.h
	hib
	from	rx
	swap
	to	rx
	or	rx

	move	rxp,rxpy
	move	ryp,rypy

	lms	rcnt,[m_sprwidth]

	move	r13,pc

.cfsprite16x_loop
	merge			; = 9

	ifeq	\1-32
	bcc	.cfinspr
	endc
	ifeq	\1-64
	bvc	.cfinspr
	endc

	with	rxp
	add	rxpi
	with	ryp
	add	rypi
	loop
;	jmp	r13
	inc	rx

	mlbra	.cfoutspr

.cfinspr
	ifne	1

	nop
	to	r14
	add	rspdata
;	merge
;	bcs	.cfoutspr
	getc
	plot

	move	r13,pc
.cfinsprstill
	to	r14
	add	rspdata
	with	rxp
	add	rxpi
	with	ryp
	add	rypi
	merge
;	bcc	.cfinsprstill

	ifeq	\1-32
	bcs	.cfoutspr2
	endc
	ifeq	\1-64
	bvs	.cfoutspr2
	endc

	getc
	loop
	plot			; =13

.cfoutspr2	
	endc


	ifne	0	; not used

	nop
	to	r14
	add	rspdata
	merge

	move	r13,pc

	ifeq	\1-32
	bcs	.cfoutspr
	endc
	ifeq	\1-64
	bvs	.cfoutspr
	endc

	getc

	plot		= 12
	to	r14
	add	rspdata
	with	rxp
	add	rxpi
	with	ryp
	add	rypi
;	loop
	jmp	r13
	merge

	endc


.cfoutspr

.cfsprrts

	with	rxpy	     	; rxpy += rxpyi
	add	rxpyi
	with	rypy	     	; rypy += rypyi
	add	rypyi

	from	ry	      	; if ry.h <> ry.l then ry+=1; loop back
	swap
	sub	ry
	bne	.fsprite16y_rotate
	inc	ry

.\@exit
	endm


;************************************************

	lms	r0,[m_sprangle]
	lob
	bne	.rotspr
	nop

; Scaled sprite draw

	mcache

	msprloop

	mlbra	msprite_rot_exit

; Choose sprite draw loop according to size

.rotspr
	lms	r0,[m_sprsize]
	swap
	add	r0
	mlbmi	sprloop64
	
sprloop32
	mcache

	msprrotloop	32

	mlbra	msprite_rot_exit

sprloop64
	mcache

	msprrotloop	64


;************************************************

msprite_rot_exit
	move	rsp,[m_sp]

	mpop	pc
	nop

;************************************************









;************************************************
;************************************************

	ifne	0

	miwt	r13,cfsprite16x_loop
	merge

cfsprite16x_loop
	bcs	cfsprskip
	inc	rx

	dec	rx
	and	rmask
	to	r14
	add	rspdata
	with	rxp
	add	rxpi
	with	ryp
	add	rypi
	getc
	merge		= 9 / 9 / 15
	loop
	plot

	mlbra	cfsprrts

cfsprskip
	with	rxp
	add	rxpi
	with	ryp
	add	rypi
	loop
	merge		= 9 / 9 / 15

	endc


;************************************************


	ifeq	1

cfsprite16x_rotate
	mcache
	move	r13,pc

	ifeq	0
	from	rxp
	sub	rsize
	bcs	cfsprskip
	inc	rx
	dec	rx

	from	ryp
	sub	rsize
	bcs	cfsprskip
	inc	rx
	dec	rx

	endc

	from	ryp
	and	rmask
	hib
	to	r14
	mult	rshift
;	to	rt
;	lsr
	from	rxp
	and	rmask
	hib
	add	r14
	to	r14
	add	rspdata

	getb
	colour
	plot
cfsprskip
	with	rxp
	add	rxpi
	with	ryp
	add	rypi
	loop
	nop		= 11 / 17 / 31

	mlbra	cfsprrts

	endc


	ifeq	1

cfsprite16x_rotate
	mcache
	miwt	r13,cfsprite16x_loop

	merge

cfsprite16x_loop
	bcs	cfsprskip
	inc	rx
	dec	rx
	and	rmask
	to	r14
	add	rspdata

	getb
	colour
	plot
cfsprskip
	with	rxp
	add	rxpi
	with	ryp
	add	rypi
	loop
	merge		= 9 / 9 / 16

	miwt	pc,cfsprrts
;	jmp	r0
	nop

	endc




	ifeq	1


offset	=	00000000 000yyyyy000xxxxx
rombank	=	bbbbbbbb 1000000000000000
romaddr	=	bbbbbbbb 100yyyyy000xxxxx

offset	=	00000000 000yyyyy000xxxxx
rombank	=	bbbbbbbb 1bbb0000bbbb0000
romaddr	=	bbbbbbbb 1bbyyyyybbbxxxxx

offset	=	00000000 000yyyyy000xxxxx
rombank	=	bbbbbbbb 0000000000000000
sprbank	=	bbbbbbbb 1sssssssssssssss
romaddr	=	bbbbbbbb 1ssyyyyysssxxxxx


s	=	b15 + b7
v	=	b14 + b6 + s
c	=	b13 + b5 + v
z	=	b12 + b4 + c

	getc
	merge		; r14 = (ryp & $ff00) + (rxp & $ff00)>>8
	plot
	with	ryp
	add	rypi
	loop
	add	rxpi	= 7


	getc
	to	r14
	merge		; r0 = (ryp & $ff00) + (rxp & $ff00)>>8
	plot
	with	ryp
	add	rypi
	loop
	add	rxpi	= 8


	getc
	merge		; r0 = (ryp & $ff00) + (rxp & $ff00)>>8
	to	r14
	or	rspdata
	with	ryp
	add	rypi
	with	rxp
	add	rxpi
	loop
	plot		= 10


	getc
	merge		; r0 = (ryp & $ff00) + (rxp & $ff00)>>8
	and	mask
	to	r14
	or	rspdata
	with	ryp
	add	rypi
	with	rxp
	add	rxpi
	loop
	plot		= 11


	with	rxp
	add	rxpi
	with	ryp
	add	rypi

	merge		; r0 = (ryp & $ff00)+(rxp & $ff00)>>8, s=b15+b7
	bmi	nextpix
	getc

	and	mask
	to	r14
	or	rspdata
	loop
	plot		= 13

	miwt	pc,endloop
	nop

nextpix
	loop
	inc	rx	= 10

endloop

	endc



;************************************************
;************************************************

	ifeq	0

; mode 7 demo

;0  temp
;1  rx
;2  ry
;3  rxp
;4  ryp
;5  rxpi
;6  rypi
;7  rsixteen
;8  rxstart
;9  rwidth  (in bytes, =pixels/2)
;10 rheight
;11 rystart
;12 xloop count
;13 xloop label
;14 rom ptr to sprite data
;15 pc


rxscale	equr	5	; 64 = 0.5 (= max if rotating)
ryscale	equr	6	; 64 = 0.5 (= max if rotating)
rangle	equr	7	; 256 = 360 degrees

rx	equr	1
ry	equr	2
rt	equr	3
rmask	equr	4
rshift	equr	5
rxp	equr	7
ryp	equr	8
rxpi	equr	9
rypi	equr	10
rspdata	equr	11


m7fsprite16_rotate4
	ibt	r0,#0	; dither off
	cmode

	miwt	r0,56	;0
	sms	[m_sprx],r0
	miwt	ry,32	;0
	sms	[m_spry],r0

	miwt	r0,112	;224
	sms	[m_sprwidth],r0
	miwt	r0,64	;128
	sms	[m_sprheight],r0

	mlbra	m7fspr2

m7fsprite16_rotate
	ibt	r0,#0	; dither off
	cmode

	miwt	r0,0	;56	;0
	sms	[m_sprx],r0
	miwt	ry,0	;32	;0
	sms	[m_spry],r0

	miwt	r0,224	;112	;224
	sms	[m_sprwidth],r0
	miwt	r0,128	;64	;128
	sms	[m_sprheight],r0


m7fspr2
	ibt	r0,#0
	romb

	miwt	r0,112-32
	sms	[m_sprx0],r0
	miwt	r0,64-32
	sms	[m_spry0],r0

;	miwt	r0,256
;	sms	[m_spra],r0
;	miwt	r0,0
;	sms	[m_sprb],r0
;	miwt	r0,0
;	sms	[m_sprc],r0
;	miwt	r0,256
;	sms	[m_sprd],r0
	
	lms	rangle,[m_sprangle]
	with	rangle
	add	#6
	sms	[m_sprangle],rangle
	with	rangle
	lob

	lms	r0,[m_sprxscale]
	dec	r0
	dec	r0
	dec	r0
	dec	r0
;	sms	[m_sprxscale],r0
	sbk
	lob
	to	rxscale
	lsr

	lms	r0,[m_spryscale]
	inc	r0
;	sms	[m_spryscale],r0
	sbk
	lob
	to	ryscale
	lsr

	move	ryscale,rxscale

	miwt	r0,costab
	to	r14
	add	rangle
	to	rt
	getb
	from	rt
	mult	rxscale
	asr
	asr
	asr
	asr
;	asr
	sms	[m_spra],r0

	from	rt
	mult	ryscale
	asr
	asr
	asr
	asr
;	asr
	sms	[m_sprd],r0

	miwt	r0,sintab
	to	r14
	add	rangle
	to	rt
	getb
	from	rt
	mult	rxscale
	asr
	asr
	asr
	asr
;	asr
	sms	[m_sprb],r0

	from	rt
	not
	inc	r0
	mult	ryscale
	asr
	asr
	asr
	asr
;	asr
	sms	[m_sprc],r0

;	miwt	rspdata,sprite256data&$ffff
;	ibt	r0,#sprite256data>>16
	sub	r0
	move	rspdata,r0
	romb

	mcache

m7fsprite16_rotate1

m7fsprite16y_rotate

ra	equr	3
rb	equr	3
rtl	equr	rxp
rth	equr	10
rx0	equr	12
ry0	equr	13

	lms	rx,[m_sprx]

	lms	rx0,[m_sprx0]
	lms	ry0,[m_spry0]

	lms	rb,[m_sprb]
	from	ry
	to	r6
	sub	ry0
	from	rb
;	to	r5
	lmult
	move	rtl,r4
;	move	rth,r5

	lms	ra,[m_spra]
	from	rx
	to	r6
	sub	rx0
	from	ra
;	to	r5
	lmult

	with	rtl
	add	r4
;	with	rth
;	adc	r5

	from	rx0
	swap
	with	rtl
	add	r0

rc	equr	3
rd	equr	3
rtl	equr	ryp
rth	equr	10
rx0	equr	12
ry0	equr	13

	lms	rd,[m_sprd]
	from	ry
	to	r6
	sub	ry0
	from	rb
;	to	r5
	lmult
	move	rtl,r4
;	move	rth,r5

	lms	rc,[m_sprc]
	from	rx
	to	r6
	sub	rx0
	from	ra
;	to	r5
	lmult

	with	rtl
	add	r4
;	with	rth
;	adc	r5

	with	ry0
	swap
	with	rtl
	add	ry0


;	move	rxp,rx
;	move	ryp,ry
;	with	rxp
;	swap
;	with	ryp
;	swap

	lms	rxpi,[m_spra]
	lms	rypi,[m_sprc]

	ibt	rshift,#64
;	miwt	rmask,$3f00
	miwt	rmask,$3f3f	; merge code

;	miwt	rspdata,bowsprite256data&$ffff
;	miwt	r0,bowsprite256data>>16
	sub	r0
	move	rspdata,r0
	romb

	lms	r12,[m_sprwidth]

;	mlbra	m7cfsprite16x_rotate

;	mcache
	move	r13,pc

	merge
	and	rmask
	to	r14
	add	rspdata

	with	rxp
	add	rxpi
	with	ryp
	add	rypi
	getc
	loop
	plot

m7cfsprrts
	inc	ry
	lms	r0,[m_sprheight]
	dec	r0
	sbk
	mlbne	m7fsprite16y_rotate

	ibt	r1,#0
	ibt	r2,#0
	mrpix

	nop
	nop
	stop



	ifeq	1
	nop
m7cfsprite16x_rotate
	mcache
	move	r13,pc

	from	ryp
	and	rmask
	hib
	to	rt
	mult	rshift
;	to	rt
;	lsr
	from	rxp
	and	rmask
	hib
	add	rt
	to	r14
	add	rspdata

	with	rxp
	add	rxpi
	with	ryp
	add	rypi
	getb
	colour
	loop
	plot

	miwt	pc,m7cfsprrts
;	jmp	r0
	nop

	endc



	ifeq	1
	nop
m7cfsprite16x_rotate
	mcache
	move	r13,pc

	merge
	and	rmask
	to	r14
	add	rspdata

	with	rxp
	add	rxpi
	with	ryp
	add	rypi
	getb
	colour
	loop
	plot

	miwt	pc,m7cfsprrts
;	jmp	r0
	nop

	endc



	endc


;************************************************
;************************************************


;0  temp
;1  rx
;2  ry
;3  rxp
;4  ryp
;5  rxpi
;6  rypi
;7  rsixteen
;8  rxstart
;9  rwidth  (in bytes, =pixels/2)
;10 rheight
;11 rystart
;12 xloop count
;13 xloop label
;14 rom ptr to sprite data
;15 pc


rxscale	equr	5	; 64 = 0.5 (= max if rotating)
ryscale	equr	6	; 64 = 0.5 (= max if rotating)
rangle	equr	7	; 256 = 360 degrees
rspdata	equr	8	; sprite data addr (2 pixels per byte)

rx	equr	1
ry	equr	2
rxp	equr	3
ryp	equr	4
rxpi	equr	5
rypi	equr	6
rsixteen	equr	7
rxstart	equr	8
rwidth	equr	9
rheight	equr	10
rystart	equr	11


msprite16_rotate
	ibt	r0,#0	; dither off
	cmode

	lms	rangle,[m_spr0]
	inc	rangle
	inc	rangle
;	inc	rangle
;	inc	rangle
	sms	[m_spr0],rangle
	with	rangle
	lob

;	miwt	rangle,5
;	miwt	rangle,133

	lms	rxscale,[2]
	inc	rxscale
	inc	rxscale
	sms	[2],rxscale
	from	rxscale
	lob
	lsr
	to	rxscale
	lsr
	move	ryscale,rxscale

	miwt	rxscale,63
	miwt	ryscale,63

;	miwt	rspdata,sprite16data
	miwt	rspdata,0

	miwt	rxp,64*256
	miwt	ryp,64*256
	miwt	rwidth,32	;16*2*2
	miwt	rheight,32*2	;32*2*2

	miwt	r0,costab
	to	r14
	add	rangle
	getb
	mult	rxscale
	add	r0
	add	r0
	hib
	to	rxpi
	sex

	miwt	r0,sintab
	to	r14
	add	rangle
	getb
	mult	ryscale
	add	r0
	add	r0
	hib
	to	rypi
	sex

	miwt	r13,sprite16x_rotate
	ibt	rsixteen,#16

;	mcache

	move	r14,rspdata

sprite16_rotate1
	move	rxstart,rxp
	move	rystart,ryp

sprite16y_rotate
	move	rxp,rxstart
	from	rxp
	to	rx
	hib
	move	ryp,rystart
	from	ryp
	to	ry
	hib
	move	r12,rwidth

	getb

sprite16x_rotate
	inc	r14		; = 3
	colour	
	plot

	with	rxp
	add	rxpi
	from	rxp
	to	rx
	hib

	with	ryp
	add	rypi
	from	ryp
	to	ry
	hib

	mult	rsixteen
	hib
	colour	
	plot

	with	rxp
	add	rxpi
	from	rxp
	to	rx
	hib

	with	ryp
	add	rypi
	from	ryp
	to	ry
	hib

	loop
	getb

	with	rxstart
	sub	rypi
	with	rystart
	add	rxpi

	dec	rheight
	mlbne	sprite16y_rotate

	ibt	r1,#0
	ibt	r2,#0
	mrpix

	nop
	nop
	stop
	nop



;************************************************
;************************************************




;0  temp
;1  rx
;2  ry
;3
;4
;5  rpix2
;6  rsixteen = 16
;7  rfifteen = 15
;8  rxstart
;9  rwidth  (in bytes, =pixels/2)
;10 rheight
;11 ryloop
;12 xloop count
;13 xloop label
;14 rom ptr to sprite data
;15 pc

rx	equr	1
ry	equr	2
rsixteen	equr	6
rfifteen	equr	7
rxstart	equr	8
rwidth	equr	9
rheight	equr	10
ryloop	equr	11


mtestsprite16
	ibt	r0,#0
	cmode

;	miwt	r14,sprite16data
	miwt	r14,0

;	ibt	rx,#48
	lms	r0,[0]
	inc	r0
	inc	r0
	inc	r0
	sms	[0],r0
	to	rx
	lob

	ibt	ry,#0
	miwt	rwidth,32/2
	miwt	rheight,32

msprite16
	mcache
	ibt	rsixteen,#16
	move	rxstart,rx
	miwt	r13,msprite16x
	move	ryloop,pc

msprite16y
	move	rx,rxstart
	move	r12,rwidth	; = 4

msprite16x
	getb
	inc	r14
	colour	
	plot
	mult	rsixteen	; lsr #4
	hib
	colour	
	loop
	plot			; = 9/2 = 4.5/pix

	dec	rheight
	bne	msprite16y
	inc	ry     		; = 4	= (8 + 4.5*x)*y
.1

	stop
	nop



;************************************************
;************************************************


mtestsprite256
;	ibt	rx,#48
	lms	r0,[m_sprx]
	add	#2
	sbk
	to	rx
	lob

	ibt	ry,#0
	miwt	rwidth,64/2
	miwt	rheight,64

; m_sprx
; m_spry
; m_sprdata
; m_sprbank
; m_sprsize

msprite256
	sub	r0
	cmode

	lms	r0,[m_sprbank]
	romb
	lms	r14,[m_sprdata]

	lms	rx,[m_sprx]
	lms	ry,[m_spry]
	lms	r3,[m_sprsize]
	move	rheight,r3
	with	r3
	lsr
	move	rwidth,r3
	with	rx
	sub	r3	
	with	ry
	sub	r3	

;	mlbra	msprite16


	mcache
sprite256
	move	rxstart,rx
	miwt	r13,sprite256x
	move	ryloop,pc

sprite256y
	move	rx,rxstart
	move	r12,rwidth	; = 4

sprite256x
	getc			; 4
	inc	r14		; 1
	plot			; 1
	getc			; 5
	inc	r14		; 1
	loop			; 1
	plot			; 1 = 14/2 = 7 

	miwt	r0,256
	sub	rwidth
	sub	rwidth
	with	r14
	add	r0
	dec	rheight
	bne	sprite256y
	inc	ry		; = 4	= (8 + 7*x)*y

	stop
	nop

	endc

;************************************************


