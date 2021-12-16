***************************************************************
**
**  Draw polygon list by Krister Wombell/Dylan
**
**
**
	zmalc	m_clrbitmaps,2
	zmalc	m_player,2
	zmalc	m_numshapes,2
	zmalc	m_damage,2
	zmalc	m_boostcnt,2
	zmalc	m_boostanim,2

rlistptr	equr	r1
rzstore	equr	r2
rshapehdrptr	equr	r3
rsflags	equr	r4
rwork	equr	r5
rzspare	equr	r6

;Drawlist in format :
; struct dl_xxxxx in SG.ASM
;
;	dl_rotx,1
;	dl_roty,1
;	dl_rotz,1
;	dl_sflags,1
;	dl_shape,2
;	dl_shadx,2
;	dl_shady,2
;	dl_shadz,2
;	dl_y,2
;	dl_x,2
;	dl_z,2
;	dl_coltab,2
;	dl_expcnt,1
;	dl_animframe,1
;	dl_colframe,1
;	dl_depth,1
;	dl_tscrollx,1
;	dl_tscrolly,1

mdo_3d_display

	ifne	mario_stats3d
	sub	r0
	sm	[m_shapes_notdrawn],r0
	sm	[m_lines_drawn],r0
	sm	[m_polys_drawn],r0
	sm	[m_polys_clip2d],r0
	sm	[m_polys_clip3d],r0
	sm	[m_points_done],r0
	sm	[m_visis_done],r0
	endc

	miwt	r10,m_stack&WM
	lms	r0,[m_clrbitmaps]
	lob
	beq	.noclr
	nop
	mcall	mclrbitmaps		;Clear bitmaps
	nop
.noclr
	lms	r0,[m_dotsorstars]	;do nodots/spacedust/gnd dots
	moves	r0,r0
	beq	.skip
	nop
	bmi	.stars
	nop
	mcall	mshowgrid
	nop
	bra	.skip
	nop
.stars
	mcall	mshowdust
	nop
.skip




; SHOW ALL OBJECTS
mshowview
	miwt	r10,m_stack&WM

	mibt	r1,pfm_shadows
	lms	r0,[m_pfm]
	and	r1
	beq	.noshad
	nop

	ibt	r0,#1
	sms	[m_shadowpass],r0
	mcall	mshow
	nop
.noshad
	sub	r0
	sms	[m_shadowpass],r0
	mcall	mshow
	nop

	miwt	r10,m_stack&WM

	sub	r0
	cmode


	lm	r0,[m_meters]
	lob
	beq	.skip
	nop
	mcall	mboostmeter
	nop
	mcall	mdamagemeter
	nop
	mcall	mdrawbossHP
	nop
;	mcall	mmand
;	nop
.skip

	mcall	mdrawhud
	nop

	lm	r0,[m_particlesON]
	mtest	r0
	beq	.npart
	nop
	mcall	mupdate_particles
	nop
.npart


	mrpix

	stop
	nop



mshow
	lm	rlistptr,[m_dlptr]
	moves	rlistptr,rlistptr
	bne	.tisok
	nop
	jmp	r11
	nop
.tisok
	mpush	r11	; store the caller

mdrawloop
	sub	r0			;clear r0.w
	romb

	sms	[m_numpnts],r0		; for particles

	mpush	rlistptr

	inc	rlistptr
	inc	rlistptr
	inc	rlistptr
	inc	rlistptr

	ldb	[rlistptr]		;rotx
	sms	[m_rotx],r0
	inc	rlistptr
	ldb	[rlistptr]		;roty
	sms	[m_roty],r0
	inc	rlistptr
	ldb	[rlistptr]		;rotz
	sms	[m_rotz],r0
	inc	rlistptr

	to	rsflags
	ldb	[rlistptr]		;sflags
	inc	rlistptr

	to	rshapehdrptr
	ldw	[rlistptr]		;shape header
	inc	rlistptr
	inc	rlistptr



; shadow pass-through only-----
	lms	r0,[m_shadowpass]
	lob
	beq	.z		; not the shadow pass
	nop

	move	r0,#0
	ibt	rwork,#asf_shadowshape
	from	rsflags
	and	rwork
	beq	.nottruecolourset
	nop
	iwt	r0,#truecolourshadow
.nottruecolourset
	sms	[m_objflags],r0

	ibt	rwork,#asf_shadow!asf_shadowshape
	from	rsflags
	and	rwork
	mlbeq	.nextobj	; this object doesn't have a shadow

	ibt	r14,#sh_shadow
	from	rshapehdrptr
	to	r14
	add	r14
	mgetw	rshapehdrptr	; change the current shape to it's shadow shape
	ldw	[rlistptr]
	sms	[m_bigy],r0	; shadow's y
	inc	rlistptr
	inc	rlistptr
	ldw	[rlistptr]
	sms	[m_bigx],r0	; shadow's x
	inc	rlistptr
	inc	rlistptr
	ldw	[rlistptr]
	sms	[m_bigz],r0	; shadow's z

	inc	rlistptr
	inc	rlistptr
	inc	rlistptr
	inc	rlistptr
	inc	rlistptr
	inc	rlistptr	; skip normal x,y,z
	bra	.shady
	nop
.z
;------------------------------

	ibt	rwork,#asf_shadowshape
	from	rsflags
	and	rwork
	mlbne	.nextobj	; if it is a shadowshape, then don't draw normal shape


	inc	rlistptr
	inc	rlistptr	; shady

	inc	rlistptr
	inc	rlistptr	; shadx

	inc	rlistptr
	inc	rlistptr	; shadz

.doneshad

	ldw	[rlistptr]		;bigy
	sms	[m_bigy],r0
	inc	rlistptr
	inc	rlistptr

	ldw	[rlistptr]		;bigx
	sms	[m_bigx],r0
	inc	rlistptr
	inc	rlistptr

	ldw	[rlistptr]		;bigz
	sms	[m_bigz],r0
.shady
	move	rzspare,r0
	inc	rlistptr
	inc	rlistptr


;------------------------------------------------------------
	miwt	rwork,asf_partobj
	from	rsflags
	and	rwork
	beq	.notpart
	nop

	ibt	r0,#-12
	to	rlistptr
	add	rlistptr

;----------------------------
; unique number used for particle object.
	ldw	[rlistptr]		
	sms	[m_numgroups],r0
;----------------------------
.here
	inc	rlistptr
	inc	rlistptr	; shady

;----------------------------
; parameters for particle obj.
	ldb	[rlistptr]		; amount
	lob
	sms	[m_groupnum],r0

	inc	rlistptr

	ldb	[rlistptr]		; life
	lob
	sms	[m_grouptab],r0

	inc	rlistptr	; shadx

	ldb	[rlistptr]		; type
	lob
	ibt	rwork,#7
	and	rwork
	bne	.isinit
	nop
	ibt	r0,#-1
.isinit
	sms	[m_numpnts],r0


;************************************************
; particles use these as tempary MARIO vars:
; 	
; 		 m_numpnts
; 		 m_numgroups
; 		 m_groupnum
; 		 m_grouptab
; 	
; 	
	lm	r0,[m_particlesON]
	mtest	r0
	beq	.nopart
	nop

	lms	r0,[m_numpnts]
	mtest	r0
	beq	.nopart
	nop	
	bmi	.ninit
	nop	

	lms	r1,[m_grouptab]		; life
	lms	r2,[m_numgroups]	; unique object number.
	lms	r3,[m_groupnum]		; amount
	mcall	mmake_particles
	nop

.ninit
	lms	r2,[m_numgroups]	; unique object number.
	mcall	mshow_particles
	nop

.nopart
	mlbra	.nextobj

;************************************************

.notpart

; check for scaled text
	ibt	rwork,#asf_textobj
	from	rsflags
	and	rwork
	beq	.nottext
	nop


	ldw	[rlistptr]
	sms	[m_shapeptr],r0
	ibt	r0,#mariomsgs>>16
	sms	[m_shapebank],r0

	inc	rlistptr
	inc	rlistptr
	inc	rlistptr	; coltab and explode counter
	inc	rlistptr
	inc	rlistptr	; animframe and colframe
	ldb	[rlistptr]	; depth offset = colour
	inc	rlistptr
	to	rwork
	ldb	[rlistptr]		; tscrollx = size (signed)
	with	rwork
	sex
	sms	[m_sprsize],rwork	; store size

; depth cue:

	ibt	rwork,#15
	cmp	rwork
	bne	.norm
	nop
	from	rzspare
	hib
	lsr
	lsr
	ibt	rwork,#5
	cmp	rwork
	bcc	.daijobu
	nop
	move	r0,rwork
.daijobu
	ibt	rwork,#14
	from	rwork
	sub	r0

.norm
	mcall	msprint
	nop

	mlbra	.nextobj

.nottext




	ibt	rwork,#asf_hitflash
	from	rsflags
	and	rwork
	bne	.hf
	nop
	ibt	rwork,#asf_special
	from	rsflags
	and	rwork
	beq	.normal
	nop
.spec	miwt	rwork,id_1_c
	sms	[m_colourptr],rwork
	bra	.gotcptr
	nop
.spechf	miwt	rwork,red_c
	sms	[m_colourptr],rwork
	bra	.gotcptr
	nop
.hf	ibt	rwork,#asf_ssprite
	from	rsflags
	and	rwork
	bne	.normal	; if a software sprite, then always use normal colour table
	nop
	ibt	rwork,#asf_special
	from	rsflags
	and	rwork
	bne	.spechf
	nop
	miwt	rwork,white_c
	sms	[m_colourptr],rwork
	bra	.gotcptr
	nop
.normal
	ldw	[rlistptr]
	moves	r0,r0			;sets the sign flag
	bne	.gotcptr2
	nop
	
	ibt	r14,#sh_col_ptr		;store colour ptr
	from	rshapehdrptr
	to	r14
	add	r14
	mgetw	r0
	iwt	rwork,#ID_0_C&WM
	cmp	rwork
	bne	.gotcptr2
	nop
	lm	rwork,[m_defaultID]
	moves	rwork,rwork
	beq	.gotcptr2
	nop
	move	r0,rwork
.gotcptr2
	sms	[m_colourptr],r0
.gotcptr
	inc	rlistptr
	inc	rlistptr

	ibt	r14,#sh_shift		;store shift
	from	rshapehdrptr
	to	r14
	add	r14
	getb
	sms	[m_shift],r0
	mpush	rshapehdrptr

	move	r0,rzspare
	miwt	rwork,3000
	cmp	rwork
	bcs	.simplest
	nop
	miwt	rwork,2000
	cmp	rwork
	bcs	.middle
	nop
	miwt	rwork,1000
	cmp	rwork
	bcs	.large
	nop
	bra	.gotshapehd
	nop
.simplest
	ibt	r14,#sh_simple3
	from	rshapehdrptr
	to	r14
	add	r14
	mgetw	rshapehdrptr
	bra	.gotshapehd
	nop
.middle	ibt	r14,#sh_simple2
	from	rshapehdrptr
	to	r14
	add	r14
	mgetw	rshapehdrptr
	bra	.gotshapehd
	nop
.large	ibt	r14,#sh_simple1
	from	rshapehdrptr
	to	r14
	add	r14
	mgetw	rshapehdrptr
.gotshapehd

;---------------------------------------
;;; col box drawing
;;	ibt	r14,#sh_xmax
;;	from	rshapehdrptr
;;	to	r14
;;	add	r14
;;	mgetwi	r0
;;	miwt	rwork,m_boxX
;;	stw	[rwork]
;;	
;;	mgetwi	r0
;;	miwt	rwork,m_boxY
;;	stw	[rwork]
;;
;;	mgetwi	r0
;;	miwt	rwork,m_boxZ
;;	stw	[rwork]
;---------------------------------------

	ibt	r14,#sh_points		;store pntptr
	from	rshapehdrptr
	to	r14
	add	r14
	mgetw	r0
	sms	[m_pntptr],r0

	ibt	r14,#sh_bank		;store shape bank
	from	rshapehdrptr
	to	r14
	add	r14
	getb
	sms	[m_shapebank],r0

	ibt	r14,#sh_faces		;store faceptr
	from	rshapehdrptr
	to	r14
	add	r14
	mgetw	r0
	sms	[m_faceptr],r0


	mpop	rshapehdrptr

	ldb	[rlistptr]		;expcnt
	inc	rlistptr
	sms	[m_expcnt],r0

	ldb	[rlistptr]		;animframe
	sms	[m_framenum],r0
	inc	rlistptr
	ldb	[rlistptr]
	sms	[m_colframe],r0
	inc	rlistptr

; check for simple scaled sprite:

	ibt	rwork,#asf_ssprite
	from	rsflags
	and	rwork
	beq	.notssprite
	nop

	lms	r0,[m_shadowpass]
	lob
	bne	.notssprite		; the shadow pass?
	nop

	sub	r0
	romb

	ibt	r14,#sh_size
	from	rshapehdrptr
	to	r14
	add	r14
	mgetw	r0
	sms	[m_spra],r0

	ldb	[rlistptr]	; depth offset = colour in coltab
	sms	[m_spr0],r0
	inc	rlistptr
	ldb	[rlistptr]		; tscrollx = size (signed)
	sex
	sms	[m_sprxscale],r0	; store size

	lms	r0,[m_pntptr]
	mtest	r0
	beq	.notsprite
	nop

	mcall	mssprite
	nop

.notsprite
	mlbra	.nextobj




; show shape

.notssprite

	ldb	[rlistptr]
	sms	[m_depthoffset],r0	; depth cued z offset
	inc	rlistptr

	sub	r0
	ldb	[rlistptr]
	swap
	sms	[m_sprxscroll],r0
	inc	rlistptr		; texture map x

	ldb	[rlistptr]
	swap
	sms	[m_spryscroll],r0
	inc	rlistptr		; texture map y

;	sub	r0
;	sms	(m_player),r0
;	iwt	rzspare,myship_0&WM
;	with	rshapehdrptr
;	cmp	rzspare
;	bne	.ok
;	nop
;	ibt	r0,1
;	sms	(m_player),r0
;.ok

	lms	r0,[m_faceptr]
	moves	r0,r0
	beq	.nextobj
	nop



	ifne	1			; quick object reject checks

rrad	equr	5
rzrad	equr	6
	
	sub	r0
	romb

;	ibt	r14,#sh_radius
	ibt	r14,#sh_size
	with	r14
	add	rshapehdrptr
	mgetw	rrad

;	mtest	rrad
;	mlbmi	.okobj
;	mlbeq	.okobj
;	mlbra	.okobj

	lms	rzrad,[m_bigz]
	from	rzrad
	add	rrad
	bmi	.rejectobj		; if (z + radius) < 0 reject
	nop

	with	rrad
	add	rrad

	with	rzrad
	asr

	lms	r1,[m_bigx]
	mtest	r1
	bmi	.xmi			; if (x >= 0)
	nop

	from	r1
	sub	rrad
	sub	rzrad
	bpl	.rejectobj
	nop

;	mlbra	.okobj
	mlbra	.checky

.xmi
	from	rrad
	not
	inc	r0
	sub	r1
	sub	rzrad
	bpl	.rejectobj
	nop

;	mlbra	.okobj

.checky
	lms	r2,[m_bigy]
	mtest	r2
	bmi	.ymi			; if (y >= 0)
	nop

	from	r2
	sub	rrad
	sub	rzrad
	bpl	.rejectobj
	nop

	mlbra	.okobj

.ymi
	from	rrad
	not
	inc	r0
	sub	r2
	sub	rzrad
	bpl	.rejectobj
	nop

	mlbra	.okobj


.rejectobj

	ifne	mario_stats3d
	lm	r0,[m_shapes_notdrawn]
	swap
	inc	r0
	swap
	sm	[m_shapes_notdrawn],r0
	endc

	mlbra	.nextobj

.okobj
	endc


	mcall	mshowobj2
	nop

.nextobj
	mpop	rlistptr
	to	rlistptr
	ldw	[rlistptr]
	moves	rlistptr,rlistptr
	mlbne	mdrawloop
	nop

	mpop	pc
	mnop		; return to caller


boostx	=	22*8 ; Boost meter X pos
boosty	=	22*8 ; Boost meter Y pos
boostheight =	8

mboostmeter
	mpush	r11


	move	r1,#boostx
	move	r2,#boosty
	move	r3,#40
	move	r4,#boostheight

	move	r0,#$d
	mcall	mdrawbox
	nop

;	move	r1,#boostx+1
;	move	r2,#boosty+1
;	move	r3,#38
;	move	r4,#boostheight-2

;	move	r0,#10
;	mcall	mdrawsolidbox
;	nop


	move	r3,[m_boostanim]
	with	r3
	lob
	move	r0,#36
	cmp	r3
	bge	.iiyo
	nop
	move	r3,r0
.iiyo

	move	r1,#boostx+2
	move	r2,#boosty+2
	move	r4,#boostheight-4

	move	r0,#7
	mcall	mdrawsolidbox
	nop
	

	mpop	pc
	nop




	IFEQ	1
	sub	r0
	cmode
	mcache

	lms	r12,[m_boostanim]
	with	r12
	lob
	miwt	r10,40
	with	r10		;r11=remainder
	sub	r12		;r12=number left

	miwt	r1,22*8
	miwt	r2,22*8

	ibt	r4,#8
.lp
	ibt	r0,#6
	colour
	moves	r3,r10
	beq	.elp2
	nop
.lp2	plot
	dec	r3
	bne	.lp2
	nop
.elp2
	ibt	r0,#5
	colour
	moves	r3,r12
	beq	.elp3
	nop
.lp3	plot
	dec	r3
	bne	.lp3
	nop
.elp3
	ibt	r0,#40
	with	r1
	sub	r0
	inc	r2

	dec	r4
	bne	.lp
	nop

	jmp	r11
	nop

	ENDC

damagex	=	8
damagey	=	22*8
damageheight =	8

mdamagemeter
	mpush	r11

	move	r1,#damagex ; Shield meter (Damage meter) X pos
	move	r2,#damagey ; Shield meter (Damage meter) Y pos
	move	r3,#40
	move	r4,#damageheight

	move	r0,#$d
	mcall	mdrawbox
	nop

;	move	r1,#damagex+1
;	move	r2,#damagey+1
;	move	r3,#38
;	move	r4,#damageheight-2

;	move	r0,#1
;	mcall	mdrawsolidbox
;	nop

	move	r3,[m_damage]
	with	r3
	lob
	move	r0,#36
	cmp	r3
	bge	.iiyo
	nop
	move	r3,r0
.iiyo

	move	r1,#damagex+2
	move	r2,#damagey+2
	move	r4,#damageheight-4

	IFNE	shieldboostcolorbox
	move	r0,#4
	ELSEIF
	move	r0,#2
	ENDC
	mcall	mdrawsolidbox
	nop

	mpop	pc
	nop


	IFEQ	1
	lms	r12,[m_damage]
	with	r12
	lob
	miwt	r10,40
	with	r10		;r11=remainder
	sub	r12		;r12=number left

	miwt	r1,8
	miwt	r2,22*8

	ibt	r4,#8
.lp
	ibt	r0,#2
	colour
	moves	r3,r12
	beq	.elp2
	nop
.lp2	plot
	dec	r3
	bne	.lp2
	nop
.elp2
	ibt	r0,#1
	colour
	moves	r3,r10
	beq	.elp3
	nop
.lp3	plot
	dec	r3
	bne	.lp3
	nop
.elp3
	ibt	r0,#40
	with	r1
	sub	r0
	inc	r2

	dec	r4
	bne	.lp
	nop

	jmp	r11
	nop

	ENDC


;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; m_bossmaxHP is the maximum
; m_bossHP is the current

mdrawbossHP
	mpush	r11

	move	r0,[m_bossmaxHP]
	add	#10
	to	r1
	lob

	move	r0,[m_bossHP]
	lob
	cmp	r1
	bcc	.nowt
	nop
	ibt	r0,#0
	sms	[m_bossHP],r0
.nowt

	move	r0,[m_bossmaxHP]
	to	r3
	lob
	beq	.nodraw
	nop
	bpl	.nodiv2
	nop
	with	r3
	lsr
.nodiv2

	inc	r3
	inc	r3
	inc	r3
	inc	r3

	move	r4,#6

	move	r0,#gameNum_col*8-2
	to	r1	;set as X position
	sub	r3

	move	r2,#2 ;Y

	move	r5,r1
	move	r6,r2		; store x,y

	move	r0,#14		; colour of outer box
	mcall	mdrawbox
	nop

	move	r1,r5
	move	r2,r6

	inc	r1
	inc	r1
	inc	r2
	inc	r2

	move	r0,[m_bossHP]
	to	r3
	lob
	move	r0,[m_bossmaxHP]
	lob
	bpl	.nodiv2_2
	nop
	with	r3
	lsr	r3
.nodiv2_2
	move	r4,#2
	move	r0,#2
	mcall	mdrawsolidbox
	nop
.nodraw
	sub	r0
	move	[m_bossHP],r0

	mpop	pc
	nop

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; r0    = colour
; r1,r2 = x,y
; r3,r4 = width,height
; r3/r5-r10/r14 unchanged
; ----- returns:
; r1/r2 point to the next row
; r4 returns as 0

mdrawsolidbox
;	mcache
;	colour		; set the colour

	moves	r3,r3
	beq	.nobox
;	nop
	colour		; set the colour
	moves	r4,r4
	beq	.nobox
	nop

	mcache
.nextrow
	moves	r12,r3
	move	r13,r15
	loop		; draw the bottom line
	plot

	with	r1
	sub	r3

	dec	r4

	bne	.nextrow
	inc	r2


.nobox	jmp	r11
	nop


;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; r0 	= colour
; r1,r2 = x,y
; r3,r4 = width,height
; r3-r10/r14 unchanged
mdrawbox
	mcache
	colour		; set the colour

	move	r12,r3	; width
	move	r13,r15
	loop		; draw the top line
	plot

	move	r12,r4
	dec	r12
	dec	r12	; height-2
	move	r13,r15
; vertical line loop
	inc	r2	; inc y
	with	r1
	sub	r3
	plot		; plot left side
	with	r1
	add	r3
	dec	r1
	dec	r1
	loop
	plot

	with	r1
	sub	r3	; subtract width from x
	inc	r2

	move	r12,r3	; width
	move	r13,r15
	loop		; draw the bottom line
	plot


	jmp	r11
	nop

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
; r0 = colour
; r1,r2 = x,y
; r3 = width
; r3-r10/r14 unchanged
mdrawhorzline
;	colour
	mcache
	moves	r12,r3
	beq	.noloop
;	nop
	colour
	move	r13,r15
	loop		; draw the bottom line
	plot

.noloop
	jmp	r11
	nop


planBMPSZ	equ	16*16*64

	printf	"sharp test = ",:$*,"%n"

mclrmapscreen
	sub	r0
	miwt	r1,bitmap1+bitmapbase
	miwt	r12,planbmpsz/2
	mcache
	move	r13,r15
	stw	[r1]
	inc	r1
	loop
	inc	r1

	stop
	nop

pepperscreensize	=	16*24*32

	printf	"sharp test = ",:$*,"%n"

mclrpepperscreen
	sub	r0
	miwt	r1,bitmap1+bitmapbase
	miwt	r12,pepperscreensize/2
	mcache
	move	r13,r15
	stw	[r1]
	inc	r1
	loop
	inc	r1

	stop
	nop

mclrbitmaps	; clear the second half of the bitmap
	sub	r0
	miwt	r1,bitmap1+gametranlen1
	miwt	r12,gametranlen2/2
	mcache
	move	r13,r15
	stw	[r1]
	inc	r1
	loop
	inc	r1

	jmp	r11
	nop


mclrbitmaps2	; clear the first half of the bitmap, called from trans
	lms	r0,[m_clrbitmaps]
	lob
	beq	.noclr
	nop
	printf	"sharp test = ",:$*,"%n"
	sub	r0
	miwt	r1,bitmap1
	miwt	r12,gametranlen1/2
	mcache
	move	r13,r15
	stw	[r1]
	inc	r1
	loop
	inc	r1
.noclr
	stop
	nop


mclrbitmaps3	; clear the second half of the bitmap
	lms	r0,[m_clrbitmaps]
	lob
	beq	.noclr
	nop
	printf	"sharp test = ",:$*,"%n"
	sub	r0
	miwt	r1,bitmap1+gametranlen1
	miwt	r12,gametranlen2/2
	mcache
	move	r13,r15
	stw	[r1]
	inc	r1
	loop
	inc	r1
.noclr
	stop
	nop






basetunnely	=	60
zmax		=	4000
stepsize	=	60


moffsetsize	equ	4000/4


rx		equr	1
ry		equr	2
rz		equr	3
rlasty		equr	4
routcode	equr	5
rptr		equr	6
rtog		equr	7

mtunnelv
	sub	r0
	ramb
	iwt	rx,#0
	iwt	ry,#basetunnely
	iwt	rz,#zmax
	mcall	mprojectpnt
	nop
	iwt	r0,#32
	with	ry
	add	r0
	move	rlasty,ry

	iwt	rz,#zmax-stepsize
;;---	iwt	rptr,#m_tunvoffsets&WM
	iwt	r10,#m_stack&WM
	mcache
.lp
	iwt	rx,#0		;just the y component is needed
	iwt	ry,#basetunnely
	mpush	rtog
	mpush	rptr
	mpush	rlasty
	mpush	rz
	mcall	mprojectpnt	;project the point
	nop
	iwt	r0,#32		;y = 96-192
	with	ry
	add	r0		;y = 128-224
	mpop	rz
	mpop	rlasty
	mpop	rptr
	mpop	rtog

	from	ry		;get difference between this and last frame
	sub	rlasty
	beq	.skip		;we don't want to stop HDMA so skip this line
	nop
	move	rlasty,ry	;last frame=this frame
	stb	[rptr]		;store it
	inc	rptr

	with	rtog
	xor	#1
	bne	.2
	nop
	sub	r0
	bra	.d
	nop
.2	iwt	r0,#256		;add 128
.d
	stb	[rptr]		;store it low byte, high byte
	inc	rptr
	swap
	stb	[rptr]
	inc	rptr
.skip
	iwt	r0,#stepsize	;subtract the step size from the z
	with	rz
	sub	r0
	bmi	.end		;if it is not behind, continue
	nop
;;---	iwt	r0,#(m_tunvoffsets+224*3)&WM
	cmp	rptr
	bmi	.lp
	nop

.end
	sub	r0
	stb	[rptr]
	inc	rptr
	stb	[rptr]
	inc	rptr
	stb	[rptr]
	inc	rptr
	stop
	nop


;--------------------------------------------------------------
; MALLROTZSORT
; This routine rotates and z sorts all the DL blocks

rsumhi	equr	r0	;8
rdlptr	equr	r9
rptr	equr	r8
rzptr	equr	r7

rtemp	equr	r1
rtemp2	equr	r2
rtemp3	equr	r3
rtemp4	equr	r4
rtemp5	equr	r5
rx	equr	r1
ry	equr	r2
rz	equr	r3

mldi	macro	[reg,offset]
	ibt	rptr,#{offset}&127
	with	rptr
	add	rdlptr
	IFNE	{reg}
	to	{reg}
	ENDC
	IFC	"\0","W"
	ldw	[rptr]
	ELSEIF
	ldb	[rptr]
	ENDC
	endm


msti	macro	[offset,reg]
	ibt	rptr,#{offset}&127
	with	rptr
	add	rdlptr
	IFNE	{reg}
	from	{reg}
	ENDC
	IFC	"\0","W"
	stw	[rptr]
	ELSEIF
	stb	[rptr]
	ENDC
	endm

;- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
mallrotzsort

; clear the first ptr
	sub	r0
	romb
	sm	[m_dlptr],r0

	iwt	rdlptr,#m_drawlist&WM

	lms	r12,[m_numshapes]
	with	r12
	lob
	bne	.noret
	nop
	stop
	nop
.noret
	mcache
	move	r13,r15
.sortloop
	mldi.b	r0,dl_sflags
	ibt	rtemp,#asf_shadow
	and	rtemp
	beq	.noshadrot
	nop

; rotate shadow's coordinates
	mldi.w	rx,dl_x
	lm	r0,[m_shadowheight]
	lms	ry,[m_viewposy]
	to	ry
	sub	ry
	mldi.w	rz,dl_z

	mdotprod16mq	m_wmat11,m_wmat21,m_wmat31
	msti.w	dl_shadx,rsumhi
	mdotprod16mq	m_wmat12,m_wmat22,m_wmat32
	msti.w	dl_shady,rsumhi
	mdotprod16mq	m_wmat13,m_wmat23,m_wmat33
	msti.w	dl_shadz,rsumhi

.noshadrot
; rotate shape's coordinates
	mldi.w	rx,dl_x
	mldi.w	ry,dl_y
	mldi.w	rz,dl_z

	mdotprod16mq	m_wmat11,m_wmat21,m_wmat31
	msti.w	dl_x,rsumhi
	mdotprod16mq	m_wmat12,m_wmat22,m_wmat32
	msti.w	dl_y,rsumhi
	mdotprod16mq	m_wmat13,m_wmat23,m_wmat33
	msti.w	dl_z,rsumhi

	mldi.b	r0,dl_sflags
	ibt	rtemp,#asf_shadowshape
	and	rtemp
	beq	.notfakeshadow
	nop

	mldi.w	r0,dl_x
	msti.w	dl_shadx,r0
	mldi.w	r0,dl_y
	msti.w	dl_shady,r0
	mldi.w	r0,dl_z
	msti.w	dl_shadz,r0
.notfakeshadow

; now to z sort it

	mldi.w	r0,dl_shape
	iwt	rtemp,#sh_sortz
	to	r14
	add	rtemp	; get the sort z from the shape (r0+rtemp->r14)
	getb
	inc	r14
	mldi.w	rtemp,dl_z
	getbh
	to	rtemp
	add	rtemp		; add it to the z of the shape
	mldi.w	r0,dl_sortz
	to	rtemp
	add	rtemp		; add current sort z
; rtemp = sort z of shape

	ibt	rtemp2,#0	; last pointer
	lm	rzptr,[m_dlptr]
	moves	rzptr,rzptr
	bne	.zsortit
	nop
	sm	[m_dlptr],rdlptr
	move	rzptr,rtemp2
	bra	.setit
	nop
.zsortit
	inc	rzptr
.zsortit2
	inc	rzptr
	movew	r0,[rzptr]
	dec	rzptr
	dec	r0
	cmp	rtemp		; compare with sort z of current shape
	bpl	.notyet
	dec	rzptr

	moves	rtemp2,rtemp2
	bne	.notfirst	; insert right at beginning?
	nop

	sm	[m_dlptr],rdlptr
	bra	.setit
	nop

.notfirst
	movew	[rtemp2],rdlptr
	bra	.setit
	nop
.notyet

	move	rtemp2,rzptr
	movew	rzptr,[rzptr]
	moves	rzptr,rzptr	; rzptr = rzptr->next
	bne	.zsortit
	nop
;	inc	rzptr		; crashes if use .zsortit2

; add to end of list
	bra	.notfirst
	nop

.setit	msti.w	dl_sortz,rtemp	; store the sort z of the shape
	msti.w	dl_next,rzptr	; store the next pointer to rtemp2

	ibt	r0,#dl_sizeof
	to	rdlptr
	add	rdlptr

	loop
	nop

	stop
	nop





