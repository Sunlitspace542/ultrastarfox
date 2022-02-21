;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
;±                                                            ±
;±     32x32 sprite draw for planets' selection screen        ±
;±                                                            ±
;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
;±                   Dylan Cuthbert                       ±
;±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±

rsprite		equr	r14
rsprx		equr	r1
rspry		equr	r2
rtemploopa	equr	r7
rtemploopc	equr	r8
rtempx		equr	r9
rsprinc		equr	r10
ryloopcount	equr	r11
rloopcount	equr	r12
rloopaddr	equr	r13

rtx		equr	r7
rtxi		equr	r3
rty		equr	r8
rtyi		equr	r5

;---------------------------------------------------------------
; mdrawsprite32
; entry:
;         msprite  = sprite number to draw
;         mspr_x   = x coordinate (from middle)
;         mspr_y   = y coordinate
;         mspr_pal = palette number (0-15) if in 256 colour mode
; exit:
;         a drawn sprite (mebbe)
;---------------------------------------------------------------



mdrawsprite32

	ibt	r0,#textureaddrtab>>16
	romb

	sub	r0
	cmode
	ibt	r1,#16
	lms	r0,[mspr_pal]
	mult	r1
	colour


	iwt	r2,#32
	lms	r1,[msprite]
	from	r1
	lob
	and	r2
	beq	.firstsprbank
	nop
	ibt	r0,#1<<2
.firstsprbank
	or	#1<<3
	cmode
	
	from	r1
	umult	#3
	iwt	r1,#textureaddrtab&WM
	to	rsprite
	add	r1
	getb
	inc	rsprite
	getbh
	inc	rsprite
	to	r1
	getb
	from	r1
	romb
	move	rsprite,r0



	ibt	r0,#-16
	lms	rsprx,[mspr_x]
	to	rsprx
	add	rsprx
	lms	rspry,[mspr_y]
	to	rspry
	add	rspry

	move	rtempx,rsprx


	iwt	ryloopcount,#32
	iwt	rsprinc,#256-32
	iwt	rtemploopa,#.xloop&WM
	ibt	rtemploopc,#32




	mcache

.yloop
	move	rloopcount,rtemploopc
	move	rloopaddr,r15
.xloop
	getc
	inc	rsprite
	loop
	plot

	nop			; cache bug

	with	rsprite
	add	rsprinc

	move	rsprx,rtempx

	dec	ryloopcount
	bne	.yloop
	inc	rspry

	mrpix

	stop
	nop



;--------------------------------------------------------------
; musprite
; entry:
;         m_sprsize   = size of sprite
;         mspr_x      = projected x
;         mspr_y      = projected y
;         msprite     = sprite number
;         mspr_pal    = palette number
;         m_sprxscale = size of sprite
;--------------------------------------------------------------

musprite
	miwt	rsp,m_stack

	ibt	r0,#textureaddrtab>>16
	romb
	sub	r0
	cmode

	lms	r0,[mspr_x]
	sms	[m_sprx],r0
	lms	r0,[mspr_y]
	sms	[m_spry],r0

	ibt	r1,#16
	lms	r0,[mspr_pal]
	mult	r1
	colour

	iwt	r2,#32
	lms	r1,[msprite]
	from	r1
	lob
	and	r2
	beq	.firstsprbank
	nop
	ibt	r0,#1<<2
.firstsprbank
	or	#1<<3
	cmode
	
	from	r1
	umult	#3
	iwt	r1,#textureaddrtab&WM
	to	r14
	add	r1
	getb
	inc	r14
	getbh
	inc	r14
	sms	[m_sprdata],r0
	getb
	sms	[m_sprbank],r0

	lms	r1,[m_sprxscale]

	mcall	musprite_entry
	nop

	mrpix
	stop
	nop



;--------------------------------------------------------------

;--------------------------------------------------------------
; mssprite
; entry:
;         m_sprxscale = scale of sprite
;	   m_shift     = shift factor
;         m_sprsize   = size of sprite (eg. 32|64)
;         m_bigx      = unprojected x position
;         m_bigy      = unprojected y position
;         m_bigz      = z position of sprite
;         m_spr0      = colour
;         m_spra      = shape->sh_size
;         m_colourptr = colour table
; exit:
;         a scaled sprite
;--------------------------------------------------------------



rxyscale	equr	r9
rxinc		equr	r8
ryinc		equr	r7
rtemp2		equr	r6
rspritedata	equr	r5
rycount	equr	r4
rtemp		equr	r3


ssprsize	equ	32

mssprite
	mpush	r11

; do projection:

; calculate centre position

	iwt	r0,#128
	lms	r3,[m_bigz]
	sub	r3
	bpl	.exit2			; if (z < 128) exit
	nop

	mcache

; calculate size of sprite

	lms	r1,[m_sprxscale]	; get the size (-127 - +128)

;	lms	r12,[m_scale]
;	with	r1
;	umult	r12

	lms	r12,[m_shift]
	moves	r12,r12
	beq	.noshift
	nop

	move	r0,r1
	move	r13,r15

	loop
	add	r0

	move	r1,r0
.noshift

	lms	r0,[m_spra]
	add	r0
	to	r1
	add	r1
	bne	.tisok
	nop

	move	r1,#1
.tisok



;	ibt	r2,#0		; r2 = 0 (unused)
;	lms	r3,[m_bigz]

;	mcall	mprojectpnt
;	nop

;	iwt	r0,#mvanishx
;	with	r1
;	sub	r0


	move	r5,r1
	lms	r1,[m_bigx]
	lms	r2,[m_bigy]

	mcall	mfast_projectpnt
	nop

	sms	[m_sprx],r1
	sms	[m_spry],r2

	moves	r1,r5			; if (size=0 or size>240) exit
	bne	.tisok3
	nop

.exit2
	mpop	pc
	nop

.tisok3
	iwt	r0,#240
	sub	r1
;	bmi	.exit2
;	nop

	bpl	.sizeok
	add	r1

	move	r1,r0
.sizeok
	sms	[m_sprxscale],r1	; set scaled char size


; get the address of the sprite

	lms	r0,[m_spr0]	; colour number

	mcall	mdo_colour_ng	; deal with colour table information
	nop

	lms	r0,[m_texturemap]	; *** bug?? no flags set ***
	mtest	r0			; *** yes, a bug
	beq	.exit2			; *** but luckily enough the condition wasn't true
	nop				; *** and no1 was stupid enough to set
					; *** the sprite flag with a colour
					; *** that isn't a texture map (phew)
;.exit
;	mpop	pc
;	nop

.oktxmap
	lms	r1,[m_sprxscale]	; fontheight pixels high

	lms	r0,[m_sprmask]
	lob
	inc	r0
	sms	[m_sprsize],r0

	lms	r0,[m_tcmodecol]
	colour
	swap
	cmode

	bra	musprite_entry_nopush
	nop


;-------------------------------------------------
; entry point for one-off 65816 sprite drawer

musprite_entry
	mpush	r11

	mcache

; set clipping boundaries

musprite_entry_nopush
	from	r1
	to	r3
	not
	inc	r3
	sms	[m_clipleft],r3	; left clip = -size of char

	iwt	r3,#28*8-1
	with	r3
	sub	r1
	sms	[m_clipright],r3 ; right clip = 28*8-size of char

; now adjust position of string (r1=scaled size of char, r2= scaled size of string

; x position
	ibt	r3,#-1
	from	r1
	lsr
	sbc	r3

	lms	r3,[m_sprx]
	from	r3
	sub	r0
	sbk		; sub (width of sprite)/2

; left clip
	lms	r3,[m_clipleft]
	inc	r3
	cmp	r3
	bpl	.noabsleftclip
	nop

.exit3
	mpop	pc
	nop

.noabsleftclip

; right clip
	iwt	r3,#28*8-1
	cmp	r3
;	bmi	.noabsrightclip
	bpl	.exit3
	nop

;	mpop	pc
;	nop

.noabsrightclip

; y position
	ibt	r3,#-1
	from	r1
	lsr
	sbc	r3

	lms	r3,[m_spry]
	from	r3
	sub	r0
	sbk

; now check the scale

	lms	r6,[m_sprsize]

	from	r1
	sub	r6	; is new size>normal size?
	mlbcs	mlargesspr

; r6 = unscaled size


	move	r4,r6

	ibt	r0,#reciptab16s>>16
	romb			      	; ztab rom bank

	miwt	r0,reciptab16s
	add	r1
	to	r14
	add	r1

	to	r6		; r6 = 32768/z
	getb
	inc	r14

	with	r6
	getbh

	from	r4		; x = (x * 32767/z) >> 15
	swap
	fmult
	to	rxyscale
	rol


	ifne	0
	from	r6
	to	r4
	swap			; set low word of dividend

	move	r6,r1		; high word = scaled length of string
	sub	r0		; clear hi word of dividend

	mcall	mdivu3216	; this probably clears the cache
	nop			; calculate scale of width

	move	rxyscale,r4	; set the scale
	endc

	
;	mcache

; other set up for outer loop

	lms	r2,[m_spry]
	ibt	ryinc,#0
	move	rxinc,ryinc
	lms	rycount,[m_sprxscale]	; fontheight pixels high
	move	rtemp2,rycount

	lms	r0,[m_sprbank]
	romb
	lms	rspritedata,[m_sprdata]
	lms	rtemp,[m_sprx]	; set x

; check for left clipping

	moves	rtemp,rtemp
	bpl	.noleftclip
	nop

; inner loop for left clipping

	move	r12,rtemp2
	move	r13,r15

; left clipping inner loop

	bpl	.norm
	nop

	with	rxinc
	add	rxyscale
	loop
	inc	rtemp

	mpop	pc
	nop

.norm
	move	rtemp2,r12
	merge
	to	rspritedata
	add	rspritedata

.noleftclip

; check for right clipping

	move	r1,rtemp
	lms	r0,[m_clipright]
	sub	r1
	bpl	.norightclip
	nop

; inner loop for right clipping

	iwt	r0,#28*8-1
	move	r12,rtemp2
	move	r13,r15

; right clipping inner loop

	cmp	r1
	bmi	.normr
	nop

	with	rxinc
	add	rxyscale
	loop
	inc	r1
.normr
	with	rtemp2
	sub	r12

.norightclip

	miwt	r13,.normloop

; loop per sprite line

.yloop

; y clip
	iwt	r0,#192
	sub	r2
	bcc	.outofplot
	nop

; y loop set up:

	ibt	rxinc,#0	; clear the x increment

	merge
	to	r14
	add	rspritedata	; set sprite address & fetch

	move	r1,rtemp	; set x
	move	r12,rtemp2	; width of sprite

; inner loop per pixel

.normloop
	with	rxinc
	add	rxyscale
	merge
	getc
	to	r14
	add	rspritedata
	loop
	plot

.outofplot
	with	ryinc
	add	rxyscale
	dec	rycount
	bne	.yloop
	inc	r2		;p

.finished
	mpop	pc
	nop


;- - - - - - - - - - - - - - - - - - - - - - - - - - -

; moved here so in cache

rx	equr	r1
ry	equr	r2
rz	equr	r3

; in:	r1,r2,r3 = x,y,z
; out:	r1,r2	 = screen x,screen y
;
; uses r0,r6,r14


mfast_projectpnt
	ibt	r0,#ztab>>16
	romb			      	; ztab rom bank

	miwt	r0,maxztab
	sub	rz
	bpl	.outproj1	; if z > maxztab then z = maxztab
	nop
	miwt	rz,maxztab-1

.outproj1
	miwt	r0,256		; if z < 256 then outprojznear
	sub	rz
	bmi	.outprojznearok
	nop

	with	r5
	add	r5
	with	rx
	add	rx
	with	ry
	add	ry
	with	rz
	add	rz
	mlbra	.outproj1

.outprojznearok

; look up 32768/z

	with	rz
	bic	#1

	miwt	r0,ztab
	to	r14
	add	rz

	to	r6		; r6 = 32768/z
	getb
	inc	r14

	with	r6
	getbh

; project x

	from	rx		; x = (x * 32767/z) >> 15
	fmult
	rol
;	ibt	rx,#mvanishx	; add vanishx
	lms	rx,[m_vanishx]

	with	rx
	add	r0

; project y

	from	ry		; y = (y * 32767/z) >> 15
	fmult
	rol
;	ibt	ry,#mvanishy	; add vanishy
	lms	ry,[m_vanishy]

	with	ry
	add	r0

; project size

	from	r5		; y = (y * 32767/z) >> 15
	fmult
	to	r5
	rol

	jmp	r11
	nop	

;- - - - - - - - - - - - - - - - - - - - - - - - - - -


mlargesspr
; r1 = width of sprite

	move	r0,r6	; unscaled size of string

	move	r6,r1	; scaled size of string

	cmp	r6
	bne	.ok
	nop
	iwt	r4,#65535
	bra	.setscale
	nop
	
.ok
	ibt	r4,#0

	mcall	mdivu3216	; this probably clears the cache
	nop			; calculate scale of width

.setscale
	move	rxyscale,r4
	



;--------------------------------------------------------------



	ifne	1

rxinctmp	equr	11

	mcache
.cache

; other set up for outer loop

	lms	rtemp2,[m_sprsize]
	lms	rtemp,[m_sprx]
	lms	r2,[m_spry]
	ibt	ryinc,#0
	ibt	rxinctmp,#0

	lms	r0,[m_sprbank]
	romb
	lms	rspritedata,[m_sprdata]

	with	rxyscale		; so that muls have same res
	bic	#1

; right clip check

	move	r13,rtemp2

	miwt	r0,28*8-1
	to	r6
	sub	rtemp
	
	from	rxyscale		; r4 = (223 * rxyscale) >> 16
	lsr
	fmult
	to	r4
	rol

	from	r13			; if size - 1 - r4 >= 0 then size = r4
	sub	r4					 
	dec	r0	
	bmi	.norightclip
	nop

	move	r13,r4

.norightclip

	move	rtemp2,r13

	mtest	rtemp
	bpl	.noleftclip
	nop

	from	rtemp			; r6 = -rtemp
	to	r6
	not
	inc	r6

	from	rxyscale		; r0,r4 = -rtemp * rxyscale
	lsr
	lmult
	from	r4
	to	rxinctmp
	add	r4
	rol

	bmi	.finished
	nop

	with	rspritedata
	add	r0

	from	r13
	to	rtemp2
	sub	r0

	bmi	.finished
	nop

	ibt	rtemp,#0	

;	move	rtemp2,r13

.noleftclip
	mtest	rtemp2
	beq	.finished
	nop

	ibt	rycount,#0	; fontheight pixels high

; loop per character line

.yloop

; y clip
	moves	r2,r2
;	mlbmi	.outofplot
	bmi	.outofplot
	nop

	iwt	r0,#191
	sub	r2
;	mlbmi	.outofplot
;	mlbmi	.finished
	bmi	.finished
	nop	

; y loop set up

	from	rycount
	swap			; multiply by 256
	to	r14
	add	rspritedata	; set sprite address

	move	r1,rtemp	; set x

	move	r0,rxinctmp	; xinc

	getc

	move	r12,rtemp2
	dec	r12
	beq	.rightclip
	nop

	move	r13,r15

; inner loop per pixel

.normloop
	inc	r14

.repeatplot
	add	rxyscale
	bcc	.repeatplot
	plot
	loop
	getc

.rightclip

; inner loop for last pixel

	move	rxinc,r0
	iwt	r0,#28*8-1

.rightcliploop
.reptplot2
	cmp	r1
	bmi	.outofplot
	with	rxinc
	add	rxyscale
	bcc	.reptplot2
	plot

.outofplot
	nop

.andagain
	with	ryinc
	sub	rxyscale
	bcs	.yloop
	inc	r2

;	bcc	.nextsprline
;	inc	r2
;	mlbra	.yloop

.nextsprline
	inc	rycount
	lms	r0,[m_sprsize]
 	sub	rycount

;	inc	rycount
;	from	rycount
;	sub	rtemp2
;	mlbne	.yloop

	bne	.yloop
	nop

.finished
	mpop	pc
	nop

	endc





;--------------------------------------------------------------




	ifne	0

	mcache
.cache

; other set up for outer loop

	lms	rtemp2,[m_sprsize]
	lms	rtemp,[m_sprx]
	lms	r2,[m_spry]
	ibt	ryinc,#0
	ibt	rycount,#0	; fontheight pixels high

	lms	r0,[m_sprbank]
	romb
	lms	rspritedata,[m_sprdata]

; loop per character line

.yloop

; y clip
	moves	r2,r2
	mlbmi	.outofplot

	iwt	r0,#191
	sub	r2
;	mlbmi	.outofplot
	mlbmi	.finished
	
; y loop set up

	ibt	rxinc,#0	; clear the x increment
	move	r1,rtemp	; set x

	from	rycount
	swap			; multiply by 256
	to	r14
	add	rspritedata	; set sprite address

	moves	r1,r1
	bpl	.noleftclip
	nop

; inner loop for left clipping

	move	r12,rtemp2
	move	r13,r15
	inc	r14

.leftcliploop
	with	rxinc
	sub	rxyscale
	bcs	.leftcliploop
	inc	r1
	bmi	.norm
	nop

; exit from left clip but needs to check right clip boundary

	lms	r0,[m_clipright]
	cmp	r1
	bmi	.leftrightclip
	nop

	iwt	r13,#.normloop&WM
	loop
	nop
	bra	.outofplot
	nop

.leftrightclip
	iwt	r0,#28*8-1
	iwt	r13,#.rightcliploop&WM
	loop
	nop
	bra	.outofplot
	nop

.norm
	loop
	nop
	bra	.outofplot
	nop

.noleftclip
	lms	r0,[m_clipright]
	cmp	r1
	bmi	.rightclip
	nop


.normalinner
	move	r12,rtemp2
	move	r13,r15

; inner loop per pixel

.normloop
	getc
	inc	r14

.repeatplot
	with	rxinc
	sub	rxyscale
	bcs	.repeatplot
	plot
	loop
	nop
	mlbra	.outofplot

.rightclip

; inner loop for right clipping

	iwt	r0,#28*8-1

	move	r12,rtemp2
	move	r13,r15

; inner loop per pixel

.rightcliploop
	getc
	inc	r14

.reptplot2
	cmp	r1
	bmi	.outofplot
	with	rxinc
	sub	rxyscale
	bcs	.reptplot2
	plot
	loop
	nop

.outofplot
	nop

.andagain
	with	ryinc
	sub	rxyscale
;	mlbcs	.yloop
	bcc	.nextsprline
	inc	r2
	mlbra	.yloop

.nextsprline
	inc	rycount
	from	rycount
	sub	rtemp2
	mlbne	.yloop

.finished
	mpop	pc
	nop

	endc






;--------------------------------------------------------------
; scaled text print routine



rxscale		equr	r9
ryscale		equr	r8
rxinc		equr	r7
ryinc		equr	r6
rtxt		equr	r5
rycount		equr	r4
rtemp		equr	r3

mfontheight	equ	16
mfontwidth	equ	mfontheight


msprint

	printf	mlargesspr-mssprite,"%n"
	printf	msprint-mssprite,"%n"


	mpush	r11
	colour		; r0 = colour
	sub	r0
	ramb
	cmode

; do projection:

; calculate centre position

	iwt	r0,#128
	lms	r1,[m_bigx]
	lms	r2,[m_bigy]
	lms	r3,[m_bigz]
	cmp	r3
	bmi	.dontret
	nop
	mpop	pc
	nop
.dontret
	mcall	mprojectpnt
	nop
	sms	[m_bigx],r1
	sms	[m_bigy],r2

	lms	r0,[m_shapebank]
	romb

	mcache

; length of string?
	lms	r14,[m_shapeptr]
	ibt	r12,#-1		; count
.countup
	getb
	inc	r14
	lob
	bne	.countup
	inc	r12

	ibt	rtemp,#mfontwidth
	from	r12
	mult	rtemp
	mpush	r0	; store original length of string for later

; calculate size of character
	ibt	r2,#127		; zero = 127
	lms	r1,[m_sprsize]	; get the size (-127 - +128)
	with	r1
	add	r2
	from	r1
	to	r2
	umult	r12
	lms	r3,[m_bigz]
	mcall	mprojectpnt
	nop

	iwt	r0,#mvanishx
	with	r1
	sub	r0

	iwt	r0,#mvanishy
	with	r2
	sub	r0

	with	r1
	lob
	sms	[m_sprsize],r1	; set scaled char size


; now adjust position of string (r1=scaled size of char, r2= scaled size of string

; x position
	ibt	r3,#-1
	add	#0	; clear carry
	from	r2
	ror
	sbc	r3

	lms	r3,[m_bigx]
	from	r3
	sub	r0
	sbk		; sub (length of string)*charwidth/2

; y position
	ibt	r3,#-1
	add	#0	; clear carry
	from	r1
	ror
	sbc	r3

	lms	r3,[m_bigy]
	from	r3
	sub	r0
	sbk



; set clipping boundaries (r1/r2 = same as above)

	from	r1
	to	r3
	not
	inc	r3
	sms	[m_clipleft],r3	; left clip = -size of char

	iwt	r3,#28*8
	with	r3
	sub	r1
	sms	[m_clipright],r3 ; right clip = 28*8-size of char

	mpop	r6	; retrieve unscaled length of string

	from	r2
	sub	r6	; is new size>normal size?
	mlbcs	mlargescale

; r6 = unscaled size

	move	r0,r2		; high word = scaled length of string
	ibt	r4,#0		; clear low word of dividend

	mcall	mdivu3216	; this probably clears the cache
	nop			; calculate scale of width

	move	rxscale,r4	; set the scale
	move	ryscale,r4
	
	ibt	r3,#0
	sms	[m_clipleft],r3
	
	mcache

; other set up for outer loop
	lms	r2,[m_bigy]
	ibt	ryinc,#0
	ibt	rycount,#0	; fontheight pixels high

; loop per character line
.yloop
; y clip
	moves	r2,r2
	mlbmi	.outofplot
	iwt	r0,#191
	cmp	r2
	mlbmi	.outofplot
; y loop set up
	lms	r1,[m_bigx]
	ibt	rxinc,#0
	lms	rtxt,[m_shapeptr]
.xloop
; inner loop per character
	lms	r0,[m_shapebank]
	romb

	move	r14,rtxt
	getb
	inc	rtxt
	add	r0
	beq	.outofplot
	nop

	ibt	rtemp,#mscalechars>>16
	from	rtemp
	romb		; change rom bank

	ibt	rtemp,#mfontheight
	umult	rtemp	; multiply by 24
	iwt	rtemp,#mscalechars-mfontheight*2
	add	rycount
	add	rycount
	to	r14
	add	rtemp	; get address of char

	lms	r0,[m_clipleft]
	cmp	r1
	bmi	.noabsleftclip
	nop

	lms	r0,[m_sprsize]
	to	r1
	add	r1

	bra	.xloop
	nop

.noabsleftclip

	lms	rtemp,[m_clipright]
	dec	rtemp
	dec	rtemp
	with	rtemp
	cmp	r1
	bmi	.outofplot	; if out of clipping boundary stop
	nop
	getb
	inc	r14
	getbh		; get data word

	ibt	r12,#mfontwidth	; width of char
	move	r13,r15
; inner loop per pixel

	with	rxinc
	sub	rxscale
	bcc	.plotit
	rol
	loop
	nop
	bra	.xloop
	nop
.plotit
	bcs	.plotit2
	nop
	loop
	inc	r1
	bra	.xloop
	nop
.plotit2
	loop
	plot
	bra	.xloop
	nop
.outofplot

.andagain
	with	ryinc
	sub	ryscale
	bcc	.oknxtline
	nop
	inc	rycount
	ibt	rtemp,#mfontheight
	from	rycount
	sub	rtemp
	bne	.andagain
	nop
	bra	.finished
	nop

.oknxtline
	inc	r2
	inc	rycount
	ibt	rtemp,#mfontheight
	from	rycount
	sub	rtemp
	mlbne	.yloop
	nop
.finished

	mpop	pc
	nop


;- - - - - - - - - - - - - - - - - - - - - - - - - - -

mlargescale
; r1 = width of char, r2 = scaled width of string
; r6 = unscaled width of string

	move	r0,r6	; unscaled size of string

	move	r6,r2	; scaled size of string

	cmp	r6
	bne	.ok
	nop
	iwt	r4,#65535
	bra	.setscale
	nop
	
.ok
	ibt	r4,#0

	mcall	mdivu3216	; this probably clears the cache
	nop			; calculate scale of width

.setscale
	move	rxscale,r4
	move	ryscale,r4
	
	mcache
.cache
; other set up for outer loop
	lms	r2,[m_bigy]
	ibt	ryinc,#0
	ibt	rycount,#0	; fontheight pixels high

; loop per character line
.yloop
; y clip
	moves	r2,r2
	mlbmi	.outofplot
	iwt	r0,#191
	cmp	r2
	mlbmi	.outofplot
	

; y loop set up
	lms	r1,[m_bigx]
	ibt	rxinc,#0
	lms	rtxt,[m_shapeptr]
.xloop
; inner loop per character
	lms	r0,[m_shapebank]
	romb

	move	r14,rtxt
	getb
	inc	rtxt
	add	r0
	mlbeq	.outofplot

	ibt	rtemp,#mscalechars>>16
	from	rtemp
	romb		; change rom bank

	ibt	rtemp,#mfontheight
	umult	rtemp	; multiply by 24
	iwt	rtemp,#mscalechars-mfontheight*2
	add	rycount
	add	rycount
	to	r14
	add	rtemp	; get address of char

	lms	r0,[m_clipleft]
	cmp	r1
	mlbpl	.absleftclip

	moves	r1,r1
	bpl	.noleftclip
	getb
; inner loop for left clipping
	inc	r14
	getbh

	ibt	r12,#mfontwidth	; width of char
	move	r13,r15
; inner loop per pixel

	rol
	bcs	.plotit3
	nop
; no plot
.noplot3
	with	rxinc
	sub	rxscale
	bcs	.noplot3
	inc	r1	; increment x
	loop
	nop
	bra	.xloop
	nop
.plotit3
	with	rxinc
	sub	rxscale
	bcs	.plotit3
	inc	r1
	bmi	.norm
	nop
	iwt	r13,#.normloop&WM
	loop
	nop
	bra	.xloop
	nop
.norm
	loop
	nop
	bra	.xloop
	nop


.noleftclip
	inc	r14

	lms	rtemp,[m_clipright]
	dec	rtemp
	with	rtemp
	cmp	r1
	bmi	.rightclip
	nop


.normalinner
	getbh
	ibt	r12,#mfontwidth	; width of char
	move	r13,r15
; inner loop per pixel
.normloop
	rol
	bcs	.plotit
	nop
; no plot
.noplot
	with	rxinc
	sub	rxscale
	bcs	.noplot
	inc	r1	; increment x
	loop
	nop
	bra	.xloop
	nop
.plotit
	with	rxinc
	sub	rxscale
	bcs	.plotit
	plot
	loop
	nop
	mlbra	.xloop

.rightclip
; inner loop for right clipping
	getbh

	iwt	rtemp,#28*8-1

	ibt	r12,#mfontwidth	; width of char
	move	r13,r15
; inner loop per pixel

	rol
	bcs	.plotit2
	nop
; no plot
.noplot2
	with	rxinc
	sub	rxscale
	bcs	.noplot2
	inc	r1	; increment x
	with	r1
	cmp	rtemp
	bpl	.outofplot
	nop
	loop
	nop
	bra	.outofplot
	nop
.plotit2
	with	r1
	cmp	rtemp
	bpl	.outofplot
	with	rxinc
	sub	rxscale
	bcs	.plotit2
	plot
	loop
	nop
	bra	.outofplot
	nop

.absleftclip
	lms	rtemp,[m_sprsize]
	with	r1
	add	rtemp

	with	rxinc
	sub	rxscale
	bcc	.fudgetoffee
	nop
	inc	r1
.fudgetoffee

; slow left clip
;	ibt	r12,#mfontwidth
;	move	r13,r15
;; jump a character
;.zipthrough
;	with	rxinc
;	sub	rxscale
;	bcs	.zipthrough
;	inc	r1
;	loop
;	nop

	mlbra	.xloop
	nop

.outofplot
	nop
.andagain
	inc	r2
	with	ryinc
	sub	ryscale
	mlbcs	.yloop

	inc	rycount
	ibt	rtemp,#mfontheight
	from	rycount
	sub	rtemp
	mlbne	.yloop
.finished


	mpop	pc
	nop




; this copies the face graphic into the bitmap
; 640 bytes per portrait
; 32 x 40 pixels

facex	=	6
facey	=	21*8

mcopyface

	sub	r0			; r0 = 0
	ramb				; set RAM bank to 0
	ibt	r0,#facedata>>16
	romb				; set ROM bank to data\face.cgx
	mcache

; r4 = bitmap1+facex*col_size+facey*4
	lms	r4,[m_bigx]		; x-pos to draw, (Peppy:2 Falco:12 Slippy:22)
	iwt	r0,#col_size/4		; col_size equ 32*24
	umult	r4
	add	r0
	to	r4
	add	r0			; facex*col_size

	lms	r0,[m_bigy]		; y-pos to draw, (All: 12*8)
	umult	#4			; facey*4
	add	r4			; +facex*col_size

	iwt	r4,#bitmap1&WM		; bitmap1 equ 16384
	to	r4
	add	r4			; +bitmap1 = r4

	
	iwt	r5,#col_size		; col_size equ 32*24
	

	lms	r14,[m_faceptr]		; begin ROM buffering first byte of portrait
	ibt	r3,#4			; draw 4 columns
.looptohere

	move	r1,r4			; r4 = bitmap1 address, r1 = bitmap1 pointer

	ibt	r12,#40*4/2		; copy 40 words (1 column of 5 tiles)
	move	r13,r15			; store pc for loop below
;inner loop
	getb				; get byte from ROM buffer into lower byte of r0
	inc	r14			; inc ROM pointer (begin buffering)
	getbh				; get byte from ROM buffer into upper byte of r0
	inc	r14			; inc ROM pointer (begin buffering)
	stw	[r1]			; store word at bitmap1 ptr
	inc	r1			; inc bitmap1 ptr
	loop				; jump to "inner loop"
	inc	r1			; inc bitmap1 ptr (executed regardless of loop instruction)

	with	r4
	add	r5			; add col_size to bitmap1 address

	dec	r3			; draw next column
	bne	.looptohere
	nop

	stop				; return to SNES CPU
	nop








