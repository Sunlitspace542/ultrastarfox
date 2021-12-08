;
; File:	MOBJ.MC
;
; Use: 	3D Graphics Kernal
; Code:	MARIO
; By:  	Peter Warnes
;      	Copyright 1991
;		Argonaut Software Ltd.


; G'day Nishida!
;
; Have fun!
;	Cheers,
;		Pete
;


; reg equates

rshapeptr	equr	14


; equates

msafeobj		equ	0
mfastproj		equ	1
mtowerofplots		equ	0
monscreenobj		equ	1
mviscache		equ	1

mrot_pnts8		equ	1
msmooth_shading	equ	0
;mario_stats3d		equ	1

mshadowcolour	equ	$09


	ifne	mario_stats3d

	malc	m_shapes_notdrawn,2
	malc	m_polys_drawn,2
	malc	m_lines_drawn,2
	malc	m_points_done,2
	malc	m_visis_done,2
	malc	m_polys_clip2d,2
	malc	m_polys_clip3d,2

	endc



	ifne	1
mleftclp	=	0		;80
mrightclp	=	num_col*8-1	;223	;140
mtopclp    	=	0		;40
mbotclp    	=	num_row*8-1	;127	;90
mvanishx	=	mrightclp/2+1
mvanishy	=	mbotclp/2+1
	endc
	ifne	0
mleftclp	=	80		; Test clip window
mrightclp	=	140
mtopclp    	=	40
mbotclp    	=	90
	endc

; objflags

litesrc	equ	1<<15
onscreen	equ	1<<14
drawshadow	equ	1<<13
truecolourshadow equ	1<<12

; texturemap values

textured	equ	$ffff
smoothshade	equ	$fffe
bumpmap	equ	$fffd
phongshade	equ	$fffc
reflectionmap	equ	$fffb



; macros


mshape_rts	macro
	to	pc
	getb
;	move	pc,r0
	inc	r14
	endm

;mshape_rts2	macro
;	getb
;	inc	r14
;	getbh
;	move	pc,r0
;	inc	r14
;	endm

;mshape_rts3	macro
;	getb
;	miwt	r1,ram_jmp_tab
;	add	r1
;	to	pc
;	ldw	[r0]
;	inc	r14
;	endm


mshape_jsr	macro
	from	pc
	add	#5
	stw	[rsp]
	inc	rsp
	inc	rsp
	to	pc
	getb
;	move	pc,r0
	inc	r14
	endm


	ifne	0

mshape_jsr	macro
	link	#4	  	; r11 = pc+4
	with	r11
	add	#7
	from	r11
	stw	[rsp]
	inc	rsp
	inc	rsp
;	to	pc
	getb
	move	pc,r0
	inc	r14
	endm

	endc

mdbug
	ibt	r0,#-1
	colour
	ibt	r1,#0
	ibt	r2,#64
	ibt	r12,#32
	move	r13,pc
	loop
	plot

	stop
	nop


;************************************************

; runmario_l entry point
;

mshowobj
	sub	r0
	ramb
	romb

	miwt	rsp,m_stack


	ifne	1
	lms	r0,[m_bigy]
	mpush	r0
	miwt	r1,128
	add	r1
	sub	r0
	sbk

	mcall	mshowshadow
	nop

	lms	r0,[m_rotx]
	swap
	mneg	r0
	sbk	

	lms	r0,[m_roty]
	swap
	mneg	r0
	sbk	

	lms	r0,[m_rotz]
	swap
	mneg	r0
	sbk	

	mpop	r0
	sms	[m_bigy],r0
	endc

	mcall	mshowobject
	nop

	stop
	nop

mshowobj3
	sub	r0
	ramb
	romb
	miwt	rsp,m_stack

	lm	r4,[m_shapeptr]
	ibt	r14,#sh_col_ptr
	from	r4
	to	r14
	add	r14
	mgetw	r0
	sms	[m_colourptr],r0	; store the colour ptr

	ibt	r14,#sh_shift
	from	r4
	to	r14
	add	r14
	getb
	sms	[m_shift],r0

	ibt	r14,#sh_points
	from	r4
	to	r14
	add	r14
	mgetw	r0
	sms	[m_pntptr],r0		; store pntptr

	ibt	r14,#sh_bank		;store shape bank
	from	r4
	to	r14
	add	r14
	getb
	sms	[m_shapebank],r0

	ibt	r14,#sh_faces		;store faceptr
	from	r4
	to	r14
	add	r14
	mgetw	r0
	sms	[m_faceptr],r0

;	sub	r0
;	sms	[m_framenum],r0
;	sms	[m_colframe],r0

	IFEQ	1

	lms	r0,[m_bigy]
	mpush	r0

	ibt	r1,#25
	add	r1
	sms	[m_bigy],r0

	mcall	mshowshadow
	nop

	mpop	r0
	sms	[m_bigy],r0

	lms	r0,[m_rotx]
	swap
	mneg	r0
	sbk	

	lms	r0,[m_roty]
	swap
	mneg	r0
	sbk	

	lms	r0,[m_rotz]
	swap
	mneg	r0
	sbk	

	ENDC

	miwt	r0,litesrc		; litesrc on
	mcall	mshowo
	nop

	stop
	nop


mshowobj2
	lms	r0,[m_shadowpass]
	lob
	beq	mshowobject	; need the shadow?
	nop

	mpush	r11


	mcall	mshowshadow
	nop

	mpop	pc
	nop
	


;************************************************

; draw shape object as a shadow
;

mshowshadow

; set objflags

	iwt	r2,#truecolourshadow
	iwt	r1,#drawshadow
	lms	r0,[m_objflags]
	and	r2
	or	r1	
	
	bra	mshowo
 	nop




;************************************************

; draw shape object
;


mshowobject
	mpush	r11

;************************************************

;	lms	r0,[m_objflags]
;	miwt	r1,drawshadow
;	and	r1
;	bne	.nobox
;	nop
;
;	ibt	r0,#14		; colour
;	mcall	mshowbox
;	nop
;.nobox

;************************************************

	mpop	r11

; set objflags

	miwt	r0,litesrc		; litesrc on

mshowo
	sms	[m_objflags],r0
	mpush	r11

	ibt	r0,#depthtables>>16
	romb

;	mlbra	mandy
;	mlbra	mdrawtart
;	mlbra	testcode
;	mlbra	mdrawsphere		; shaded sphere

;************************************************

minit3dvars
	ifne	msafeobj	; force reinit of clip window vars
	miwt	r0,mvanishx
	sms	[m_vanishx],r0
	miwt	r0,mvanishy
	sms	[m_vanishy],r0
	miwt	r0,mleftclp
	sms	[m_xleft],r0
	miwt	r0,mrightclp
	sms	[m_xright],r0
	miwt	r0,mtopclp
	sms	[m_ytop],r0
	miwt	r0,mbotclp
	sms	[m_ybot],r0
	endc

;************************************************

	ifne	0
	sub	r0		; unit world matrix
	sms	[m_wmat12],r0
	sms	[m_wmat21],r0
	sms	[m_wmat31],r0
	sms	[m_wmat13],r0
	sms	[m_wmat32],r0
	sms	[m_wmat23],r0
	miwt	r0,$7fff
	sms	[m_wmat11],r0
	sms	[m_wmat22],r0
	sms	[m_wmat33],r0
	endc


;************************************************

	ifne	0
	lms	r0,[m_colframe]	; animate colour frame number
	inc	r0
	lob
	and	#3
	sbk
	endc

;************************************************

	ifne	0		; animate texture map scroll offsets
	lms	r0,[m_sprxscroll]
	miwt	r1,$100
	add	r1
	miwt	r1,$7f00
	and	r1
	sub	r0
	sms	[m_sprxscroll],r0

	lms	r0,[m_spryscroll]
	miwt	r1,$200
	add	r1
	miwt	r1,$7f00
	and	r1
	sub	r0
	sms	[m_spryscroll],r0
	endc

;************************************************

; select depth cue shade table 

	ibt	r0,#depthtables>>16
	romb

	lms	r14,[m_depthtable]

	lms	r0,[m_depthoffset]	; depth cue table DYLAN -- 7/9/92
	lob
	beq	.noff
	nop

	dec	r0

	add	r0
	add	r0			; multiply by 4

	iwt	r2,#depthtables&WM
	to	r14
	add	r2

.noff
	lms	r1,[m_bigz]

	sub	r0
	getbh
	inc	r14

;	miwt	r0,-depthcue1 $a00		; bright
	add	r1
	bpl	.1
	nop
.6	miwt	r0,shadestab2_0
	miwt	r2,0
	mlbra	.5
.1
	sub	r0
	getbh
	inc	r14
;	miwt	r0,-depthcue2 $d00
	add	r1
	bpl	.2
	nop
	miwt	r0,shadestab2_1
	miwt	r2,32
	mlbra	.5
.2
	sub	r0
	getbh
	inc	r14
;	miwt	r0,-depthcue3 $f00
	add	r1
	bpl	.3
	nop
	miwt	r0,shadestab2_2
	miwt	r2,32*2
	mlbra	.5
.3
	miwt	r0,shadestab2_3		; dark
	miwt	r2,32*3

.5
;	miwt	r0,shadestab2
	sms	[m_shadestab],r0
	lms	r0,[m_depthstab]
	add	r2
	sms	[m_depthsptr],r0

;************************************************

	mcache
; calc shape scale value from shift value

	ibt	r0,#1
	lms	r12,[m_shift]
	mtest	r12
	beq	mshow1
	nop
	move	r13,pc

	loop
	add	r0
mshow1
	sms	[m_scale],r0


;************************************************


	ifne	0

; create 8 bit shape matrix

	lms	r0,[m_rotx]
	not
	inc	r0
	to	r1
	lob

	lms	r0,[m_roty]
	not
	inc	r0
	to	r2
	lob

	lms	r0,[m_rotz]
	not
	inc	r0
	to	r3
	lob

	miwt	r9,m_rmat1211

	mcall	mcrotmatzxy8
	nop

	mcall	mtransmat8
	nop


; multiply matrices

	lms	r5,[m_wmat1211]
	lms	r6,[m_wmat2113]
	lms	r7,[m_wmat2322]
	lms	r8,[m_wmat3231]
	lms	r12,[m_wmat0033]

	miwt	r9,m_mat1211

	mcall	mrmatmult8
	nop

	endc


	ifne	1

; create 16 bit shape matrix

	lms	r1,[m_rotx]
	from	r1
	lob
	swap
	mneg	r0
	sbk	

	lms	r2,[m_roty]
	from	r2
	lob
	swap
	mneg	r0
	sbk	

	lms	r3,[m_rotz]
	from	r3
	lob
	swap
	mneg	r0
	sbk	

	from	r1
	or	r3	
	mlbne	.not0y0

	or	r2
	bne	.is0y0
	nop

.is000

; x=0, y=0 , z=0
; just copy wmat to mat

	lms	r0,[m_wmat11]
	sms	[m_mat11],r0
	lms	r0,[m_wmat12]
	sms	[m_mat12],r0
	lms	r0,[m_wmat13]
	sms	[m_mat13],r0

	lms	r0,[m_wmat21]
	sms	[m_mat21],r0
	lms	r0,[m_wmat22]
	sms	[m_mat22],r0
	lms	r0,[m_wmat23]
	sms	[m_mat23],r0

	lms	r0,[m_wmat31]
	sms	[m_mat31],r0
	lms	r0,[m_wmat32]
	sms	[m_mat32],r0
	lms	r0,[m_wmat33]
	sms	[m_mat33],r0

	lms	r0,[m_objflags]
	miwt	r1,drawshadow
	and	r1
	beq	.y0_ns
;	nop

	sub	r0
	sms	[m_mat21],r0
	sms	[m_mat22],r0
	sms	[m_mat23],r0
	
.y0_ns

	mlbra	initlight
;	mlbra	mexec_shape
;	mlbra	mshowobjexit

.is0y0
	miwt	r4,$40
	from	r2
	sub	r4		; 90
;	mlbeq	mshowobjexit
	mlbeq	.not0y0
	sub	r4		; 180
;	mlbeq	mshowobjexit
 	bne	.noty180
	nop

; cy	0	sy
; 0	1	0
;-sy	0	cy

;-1	0	0
; 0	1	0
; 0	0      -1

;-11  -12    -13
; 21	22     23
;-31  -32    -33

	lms	r0,[m_wmat11]
	mneg	r0
	sms	[m_mat11],r0
	lms	r0,[m_wmat12]
	mneg	r0
	sms	[m_mat12],r0
	lms	r0,[m_wmat13]
	mneg	r0
	sms	[m_mat13],r0

	lms	r0,[m_wmat21]
	sms	[m_mat21],r0
	lms	r0,[m_wmat22]
	sms	[m_mat22],r0
	lms	r0,[m_wmat23]
	sms	[m_mat23],r0

	lms	r0,[m_wmat31]
	mneg	r0
	sms	[m_mat31],r0
	lms	r0,[m_wmat32]
	mneg	r0
	sms	[m_mat32],r0
	lms	r0,[m_wmat33]
	mneg	r0
	sms	[m_mat33],r0

	lms	r0,[m_objflags]
	miwt	r1,drawshadow
	and	r1
	beq	.noty180_ns
;	nop

	sub	r0
	sms	[m_mat21],r0
	sms	[m_mat22],r0
	sms	[m_mat23],r0
	
.noty180_ns

;	mlbra	mexec_shape
	mlbra	initlight
;	mlbra	mshowobjexit

.noty180
;	sub	r4		; 270
;	mlbeq	mshowobjexit
		
.not0y0
	miwt	r9,m_rmat11
;	miwt	r9,m_mat11

	mcall	mcrotmatzxy16
	nop

	miwt	r9,m_rmat11
;	miwt	r9,m_mat11

	mcall	mtransmat16
	nop

; if drawshadow flag set, zero y components of shape matrix (rmat)

	ifne	1
	lms	r0,[m_objflags]
	miwt	r1,drawshadow
	and	r1
	beq	.1
;	nop

	sub	r0
	sms	[m_rmat12],r0
	sms	[m_rmat22],r0
	sms	[m_rmat32],r0


; multiply matrices

	miwt	r9,m_mat11

	mcall	mrmatmult16
	nop

	mlbra	initlight
;	mlbra	mexec_shape
.1
	endc

; multiply matrices

	miwt	r9,m_mat11

	mcall	mrmatmult16
	nop

	endc



;************************************************

; init light source vector


initlight
	ifne	0
	lms	r0,[m_mat2113]
	lob
	sex
	sms	[m_rotlightx],r0
	lms	r0,[m_mat2322]
	hib
	sex
	sms	[m_rotlighty],r0
	lms	r0,[m_mat0033]
	lob
	sex
	sms	[m_rotlightz],r0
	endc

	ifne	0
	lms	r0,[m_mat13]
	hib
	sex
	sms	[m_rotlightx],r0
	lms	r0,[m_mat23]
	hib
	sex
	sms	[m_rotlighty],r0
	lms	r0,[m_mat33]
	hib
	sex
	sms	[m_rotlightz],r0
	endc

	ifne	1
	miwt	r0,18917
	sms	[m_lightx],r0
	miwt	r0,18917
	sms	[m_lighty],r0
	miwt	r0,18917
	sms	[m_lightz],r0
	endc

	ifne	0
	miwt	r0,0
	sms	[m_lightx],r0
	miwt	r0,0
	sms	[m_lighty],r0
	miwt	r0,32767
	sms	[m_lightz],r0
	endc

;************************************************

	ifne	0		; rotating light source

; inc light source angles

	ifne	1
	lms	r0,[m_lrotx]
	miwt	r1,64*2
	add	r1
;	sub	r0
	sbk

	lms	r0,[m_lroty]
	miwt	r1,64*3
	add	r1
;	sub	r0
	sbk

	lms	r0,[m_lrotz]
	miwt	r1,64*1
	add	r1
	sbk
	endc

; create 16 bit light matrix

	lms	r0,[m_lrotx]
	sms	[m_rotx],r0	

	lms	r0,[m_lroty]
	sms	[m_roty],r0	

	lms	r0,[m_lrotz]
	sms	[m_rotz],r0	

	miwt	r9,m_lmat11

	mcall	mcrotmatzxy16
	nop

;	miwt	r9,m_lmat11

;	mcall	mtransmat16
;	nop


; rotate light source

	miwt	r1,18917
	miwt	r2,18917
	miwt	r3,18917

	miwt	r1,0
	miwt	r2,0
	miwt	r3,32767

	mdotprod16mq	m_lmat11,m_lmat12,m_lmat13
	hib
	sex
;	sms	[m_lightx],r0
	sms	[m_rotlightx],r0
	mdotprod16mq	m_lmat21,m_lmat22,m_lmat23
	hib
	sex
;	sms	[m_lighty],r0
	sms	[m_rotlighty],r0
	mdotprod16mq	m_lmat31,m_lmat32,m_lmat33
	hib
	sex
;	sms	[m_lightz],r0
	sms	[m_rotlightz],r0

	endc

;************************************************

	ifne	1
	lms	r1,[m_lightx]
	lms	r2,[m_lighty]
	lms	r3,[m_lightz]

	mdotprod16mq	m_mat11,m_mat12,m_mat13
	hib
	sex
	sms	[m_rotlightx],r0
	mdotprod16mq	m_mat21,m_mat22,m_mat23
	hib
	sex
	sms	[m_rotlighty],r0
	mdotprod16mq	m_mat31,m_mat32,m_mat33
	hib
	sex
	sms	[m_rotlightz],r0
	endc

	ifne	0
	mdotprod16mq	m_rmat11,m_rmat12,m_rmat13
	hib
	sex
	sms	[m_rotlightx],r0
	mdotprod16mq	m_rmat21,m_rmat22,m_rmat23
	hib
	sex
	sms	[m_rotlighty],r0
	mdotprod16mq	m_rmat31,m_rmat32,m_rmat33
	hib
	sex
	sms	[m_rotlightz],r0
	endc

	ifne	0
	mdotprod16mq	m_wmat11,m_wmat12,m_wmat13
	hib
	sex
	sms	[m_rotlightx],r0
	mdotprod16mq	m_wmat21,m_wmat22,m_wmat23
	hib
	sex
	sms	[m_rotlighty],r0
	mdotprod16mq	m_wmat31,m_wmat32,m_wmat33
	hib
	sex
	sms	[m_rotlightz],r0
	endc


;	mlbra	mandy

;************************************************

; execute shape language

mexec_shape

;	stop
;	nop


	ifne	mrot_pnts8

	lms	r0,[m_shift]
	sub	#3
	bpl	.not8bit
	nop

rp	equr	2

; copy 16 bit matrix to 8 bit matrix

	miwt	rp,m_mat11+1

	to	r1
	ldb	[rp]
	inc	rp
	inc	rp
	ldb	[rp]
	swap
	or	r1
	sms	[m_mat1211],r0
	inc	rp
	inc	rp

	to	r1
	ldb	[rp]
	inc	rp
	inc	rp
	ldb	[rp]
	swap
	or	r1
	sms	[m_mat2113],r0
	inc	rp
	inc	rp

	to	r1
	ldb	[rp]
	inc	rp
	inc	rp
	ldb	[rp]
	swap
	or	r1
	sms	[m_mat2322],r0
	inc	rp
	inc	rp

	to	r1
	ldb	[rp]
	inc	rp
	inc	rp
	ldb	[rp]
	swap
	or	r1
	sms	[m_mat3231],r0
	inc	rp
	inc	rp

	ldb	[rp]
	sms	[m_mat0033],r0
.not8bit

	endc
	

;	miwt	rsp,m_stack		; init stack ptr

	sub	r0
	sms	[m_numpnts],r0		; numpnts = 0
	miwt	r0,m_rotpnts		; init RAM ptr to rotpnts x,y,z
	sms	[m_rotptr],r0

	lms	r0,[m_shapebank]	; init shape ROM bank
	romb

	lms	rshapeptr,[m_pntptr]	; init shape ROM ptr
	sms	[m_shapeptr],rshapeptr

	miwt	r0,mshowobjend
	mpush	r0			; stack exit word

	mshape_rts			; execute shape language

;************************************************

; quit

msh_lines
msh_spheres
msh_outword
msh_quit
	mpop	pc			; jump to stacked addr
	nop


;************************************************

; frames

msh_frames
	mgetbi	r1		; get max framenum
	lms	r0,[m_framenum]
	ibt	r2,#63
	and	r2
.0
	cmp	r1
	bmi	.1
	nop
;	sub	r0
	bra	.0
	sub	r1
.1
	add	r0
	with	r14
	add	r0	       	; r14 += framenum<<1

; jump

msh_jump
	mgetw	r0	       	; get relative word offset
	with	rshapeptr
	add	r0		; r14 += getw(r14)

	mshape_rts


;************************************************

; light source vertex normals

rx	equr	1
ry	equr	2
rz	equr	3
rdotprod	equr	5
rshadeptr	equr	6
rt		equr	4
routptr	equr	9
rinptr		equr	8

; 6 greys in game

msh_vnormals

	ifne	msmooth_shading

	mgetbi	r12			; get number of vnormals
	miwt	routptr,m_intpnts

	lms	rx,[m_rotlightx]	; rotated light vector
	lms	ry,[m_rotlighty]
	lms	rz,[m_rotlightz]

;	lms	r0,[m_mariomode]	; check 16 or 256 colour mode
;	and	#3
;	dec	r0
;	mlbne	mvnormals16

mvnormals6
	mcache

	move	r13,pc

	mgetbi	r0		; nx*lx
	to	rdotprod
	mult	rx

	mgetbi	r0		; +ny*ly
	mult	ry
	to	rdotprod
	add	rdotprod

	mgetbi	r0		; +nz*lz
	mult	rz
	add	rdotprod
	asr
	asr
	hib
	sex			; shade = -15...15

	add	#15
	asr
	asr
	add	#8

	ibt	rt,#9 ;6   	; if shade < 9 then shade = 9
	cmp	rt
	blt	.1
	nop
	ibt	rt,#15 ;16	; if shade >=15 then shade = 14
	cmp	rt
	blt	.2
	nop
	dec	rt
.1
	move	r0,rt ;15
.2
	ibt	rt,#14+9
	from	rt
	sub	r0
	stb	[routptr]	; store shade
	loop
	inc	routptr
	
	mlbra	mcopyshades

	mshape_rts


;************************************************

; 16 shades in intro


	ifne	1

mvnormals16
	mcache

	move	r13,pc

	mgetbi	r0		; nx*lx
	to	rdotprod
	mult	rx

	mgetbi	r0		; +ny*ly
	mult	ry
	to	rdotprod
	add	rdotprod

	mgetbi	r0		; +nz*lz
	mult	rz
	add	rdotprod
	asr
	asr
	hib
	sex			; -15...15

	add	#15
	asr

	ibt	rt,#1 ;6  	; shade >=6
	cmp	rt
	bge	.1
	nop
	ibt	r0,#1 ;6
	bra	.2
	nop
.1
	ibt	rt,#16		; shade <16
	cmp	rt
	blt	.2
	nop
	ibt	r0,#15
.2
	stb	[routptr]	; store shade
	loop
	inc	routptr
	

mcopyshades
	miwt	rinptr,m_intpnts
	miwt	routptr,m_bnorms
	ibt	r12,#16

	move	r13,pc

	ldb	[rinptr]	; copy shade
	stb	[routptr]
	inc	rinptr
	loop
	inc	routptr
	
	mshape_rts

	endc

;************************************************

; 32 shades in intro

	ifne	0

mvnormals32
	mcache

	move	r13,pc

	mgetbi	r0		; nx*lx
	to	rdotprod
	mult	rx

	mgetbi	r0		; +ny*ly
	mult	ry
	to	rdotprod
	add	rdotprod

	mgetbi	r0		; +nz*lz
	mult	rz
	add	rdotprod
	asr
	asr
	hib
	sex			; -15...15

	add	#15
;	asr

;	ibt	rt,#9 ;6		; shade >=6
;	cmp	rt
;	bge	.1
;	nop
;	ibt	r0,#9 ;6
;	bra	.2
;	nop
;.1
	ibt	rt,#16		; shade <16
	cmp	rt
	blt	.2
	nop
;	ibt	r0,#15
.2

	stb	[routptr]	; store shade
	loop
	inc	routptr
	
	mshape_rts

	endc

	endc

;************************************************

rsumhi	equr	0
rx	equr	1
ry	equr	2
rz	equr	3

rsumlo	equr	7
rt	equr	8
rscale	equr	8
routptr equr	9

rmmat11	equr	10
rmmat21	equr	11
rmmat31	equr	13

rmmat12	equr	4
rmmat22	equr	7
rmmat32	equr	8


msh_rotpoints16
	mgetbi	r12
	lms	r0,[m_numpnts]
	add	r12
	sbk
;	miwt	routptr,m_rotpnts
	lms	routptr,[m_rotptr]

	sms	[m_sp],rsp

	ifne	1
	lms	rmmat11,[m_mat11]
	lms	rmmat21,[m_mat21]
	lms	rmmat31,[m_mat31]
	lms	rmmat12,[m_mat12]
	lms	rmmat22,[m_mat22]
	lms	rmmat32,[m_mat32]

	mcache
	
.1
	mgetwi	rx		; get x,y,z
	mgetwi	ry
	mgetwi	rz

	mdotprod16mqr	rmmat11,rmmat21,rmmat31
	mstwi	routptr
	mdotprod16mqr	rmmat12,rmmat22,rmmat32
	mstwi	routptr
	mdotprod16mq	m_mat13,m_mat23,m_mat33
	stw	[routptr]
	inc	routptr
	dec	r12
	bne	.1
	inc	routptr
	endc

	ifne	0
	mcache

	move	r13,pc

	mgetwi	rx
	mgetwi	ry
	mgetwi	rz

	mdotprod16mq	m_mat11,m_mat21,m_mat31
	mstwi	routptr
	mdotprod16mq	m_mat12,m_mat22,m_mat32
	mstwi	routptr
	mdotprod16mq	m_mat13,m_mat23,m_mat33
	stw	[routptr]
	inc	routptr
	loop
	inc	routptr
	endc

	sms	[m_rotptr],routptr
	lms	rsp,[m_sp]
	mshape_rts


;************************************************

; rx  = x*m11
; ryz = y*m21+z*m31
; xp = ryz + rx
; xn = ryz - rx

mdotprod16mqx	macro		; r0=(r1*\1 + r2*\2 + r3*\3)>>15 (uses r5,r6)
	lms	r6,[\1]		; = 7	(+3+11 = 21)
	from	rx
	fmult
	to	rt
	rol

	lms	r6,[\2]		; = 8	(+3+11 = 22)
	from	ry
	fmult
	to	r5
	rol
	lms	r6,[\3]		; = 7	(+3+11 = 21)
	from	rz
	fmult
	rol
	add	r5		; = 22  (+42 = 64)

	add	rt
	stw	[routptr]	; +x

	sub	rt
	sub	rt
	with	routptr
	add	#6
	stw	[routptr]	; -x
	with	routptr
	sub	#4
	
	endm

msh_rotpointsx16
	mgetbi	r12
	lms	r0,[m_numpnts]
	add	r12
	add	r12
	sbk
;	miwt	routptr,m_rotpnts
	lms	routptr,[m_rotptr]

	mcache

	move	r13,pc
	
	mgetwi	rx
	mgetwi	ry
	mgetwi	rz

	mdotprod16mqx	m_mat11,m_mat21,m_mat31
	mdotprod16mqx	m_mat12,m_mat22,m_mat32
	mdotprod16mqx	m_mat13,m_mat23,m_mat33

	with	routptr
	add	#6

	loop
	nop	

	sms	[m_rotptr],routptr
	mshape_rts


;************************************************


;	ifeq	mrot_pnts8

rsumhi	equr	0
rx	equr	1
ry	equr	2
rz	equr	3

rsumlo	equr	7
rt	equr	8
rscale	equr	8
routptr equr	9

rmmat11	equr	10
rmmat21	equr	11
rmmat31	equr	13

rmmat12	equr	4
rmmat22	equr	7
rmmat32	equr	8

;msh_rotpoints8

msh_rotpoints8_16

	ifne	0

	mgetbi	r12
	lms	r0,[m_numpnts]
	add	r12
	sbk
;	miwt	routptr,m_rotpnts
	lms	routptr,[m_rotptr]

	sms	[m_cnt],r12
	lms	rscale,[m_scale]

	sms	[m_sp],rsp

	lms	rmmat11,[m_mat11]
	lms	rmmat21,[m_mat21]
	lms	rmmat31,[m_mat31]
	lms	rmmat12,[m_mat12]
	lms	rmmat22,[m_mat22]
	lms	rmmat32,[m_mat32]

	mcache
	
.1
	mgetbi	r0
	to	rx
	mult	rscale

	mgetbi	r0
	to	ry
	mult	rscale

	mgetbi	r0
	to	rz
	mult	rscale

	mdotprod16mqr	rmmat11,rmmat21,rmmat31
	mstwi	routptr
	mdotprod16mqr	rmmat12,rmmat22,rmmat32
	mstwi	routptr
	mdotprod16mq	m_mat13,m_mat23,m_mat33
	mstwi	routptr
	
	lms	r0,[m_cnt]
	dec	r0
	bne	.1
	sbk
	lms	rsp,[m_sp]
	endc


	ifne	1
	mgetbi	r12
	lms	r0,[m_numpnts]
	add	r12
	sbk
;	miwt	routptr,m_rotpnts
	lms	routptr,[m_rotptr]

	lms	rscale,[m_scale]

	mcache

	move	r13,pc
	
	mgetbi	r0
	to	rx
	mult	rscale

	mgetbi	r0
	to	ry
	mult	rscale

	mgetbi	r0
	to	rz
	mult	rscale
	
	mdotprod16m	m_mat11,m_mat21,m_mat31
	mstwi	routptr
	mdotprod16m	m_mat12,m_mat22,m_mat32
	mstwi	routptr
	mdotprod16m	m_mat13,m_mat23,m_mat33
	stw	[routptr]
	inc	routptr
	loop
	inc	routptr
	endc

	sms	[m_rotptr],routptr
	mshape_rts



; rx  = x*m11
; ryz = y*m21+z*m31
; xp = ryz + rx
; xn = ryz - rx


;msh_rotpointsx8

msh_rotpointsx8_16

	mgetbi	r12
	lms	r0,[m_numpnts]
	add	r12
	add	r12
	sbk
;	miwt	routptr,m_rotpnts
	lms	routptr,[m_rotptr]

	mcache

	move	r13,pc

	lms	rscale,[m_scale]
	
	mgetbi	r0
	to	rx
	mult	rscale

	mgetbi	r0
	to	ry
	mult	rscale

	mgetbi	r0
	to	rz
	mult	rscale

	mdotprod16mqx	m_mat11,m_mat21,m_mat31
	mdotprod16mqx	m_mat12,m_mat22,m_mat32
	mdotprod16mqx	m_mat13,m_mat23,m_mat33

	with	routptr
	add	#6

	loop
	nop	

	sms	[m_rotptr],routptr
	mshape_rts

;	endc


;************************************************

;	ifne	mrot_pnts8

; rotate points

rx	equr	1
ry	equr	2
rz	equr	3
rt	equr	4
rmat1211	equr	5
rmat2113	equr	6
rmat2322	equr	7
rmat3231	equr	8
rmat0033	equr	9
routptr		equr	11
rscale		equr	9



msh_rotpoints8

mmatrotp
	lms	r0,[m_shift]
	sub	#3
	mlbpl	msh_rotpoints8_16
	nop


;	miwt	routptr,m_rotpnts	; RAM rotpnts x,y,z
	lms	routptr,[m_rotptr]

	lms	rmat1211,[m_mat1211]
	lms	rmat2113,[m_mat2113]
	lms	rmat2322,[m_mat2322]
	lms	rmat3231,[m_mat3231]
	lms	rmat0033,[m_mat0033]

	lms	r1,[m_scale]

	from	rmat0033
	lob
	swap
	to	rmat0033
	or	r1
	

	mgetbi	r12		; get numpnts to rotate
	lms	r0,[m_numpnts]
	add	r12
	sbk

	mcache

	move	r13,pc		; init loop addr
                          
mmatrotploop
	mgetbi	rx
	from	rmat1211	; 11
	to	rt
	mult	rx		; m11*x

	mgetbi	ry
	from	rmat2113	; 21
	hib
	mult	ry		; m21*y
	to	rt
	add	rt

	mgetbi	rz
	from	rmat3231	; 31
	mult	rz		; m31*z
	add	rt

	add	r0
	hib
;	sex
	mult	rscale
	mstwi	routptr	; rotx

;=31
	from	rmat1211	; 12
	hib
	to	rt
	mult	rx		; m12*x

	from	rmat2322	; 22
	mult	ry		; m22*y
	to	rt
	add	rt

	from	rmat3231	; 32
	hib
	mult	rz		; m32*z
	add	rt

	add	r0
	hib
;	sex
	mult	rscale
	mstwi	routptr	; roty
;=15
	from	rmat2113	; 13
	to	rt
	mult	rx		; m13*x

	from	rmat2322	; 23
	hib
	mult	ry		; m23*y
	to	rt
	add	rt

	from	rmat0033	; 33
	hib
	mult	rz		; m33*z
	add	rt

	add	r0
	hib
;	sex
	mult	rscale
	stw	[routptr]	; rotz
	inc	routptr
;=15
	loop
	inc	routptr

rotsize	=	*-mmatrotploop
;	?rotsize


;=61 cycles, 55 bytes

	sms	[m_rotptr],routptr
	mshape_rts


;****************************************************************

; rotate x reflected points

rx	equr	1
ry	equr	2
rz	equr	3
rt	equr	4
rmat1211	equr	5
rmat2113	equr	6
rmat2322	equr	7
rmat3231	equr	8
rmat0033	equr	9
routptr		equr	11
rscale		equr	9

rt2		equr	13


msh_rotpointsx8
mmatrotpx
	lms	r0,[m_shift]
	sub	#3
	mlbpl	msh_rotpointsx8_16
	nop


;	miwt	routptr,m_rotpnts	; RAM rotpnts x,y,z
	lms	routptr,[m_rotptr]

	lms	rmat1211,[m_mat1211]
	lms	rmat2113,[m_mat2113]
	lms	rmat2322,[m_mat2322]
	lms	rmat3231,[m_mat3231]
	lms	rmat0033,[m_mat0033]

	lms	r1,[m_scale]

	from	rmat0033
	lob
	swap
	to	rmat0033
	or	r1
	

	mgetbi	r12		; get numpnts to rotate
	lms	r0,[m_numpnts]
	add	r12
	add	r12
	sbk

	mcache

;	move	r13,pc		; init loop addr
                          
mmatrotpxloop
	mgetbi	rx
	from	rmat1211	; 11
	to	rt2
	mult	rx		; m11*x

	mgetbi	ry
	from	rmat2113	; 21
	hib
	to	rt
	mult	ry		; m21*y
;	to	rt
;	add	rt

	mgetbi	rz
	from	rmat3231	; 31
	mult	rz		; m31*z
	to	rt
	add	rt

	from	rt
	add	rt2
	add	r0
	hib
;	sex
	mult	rscale
	stw	[routptr]	; rotx

	with	routptr
	add	#6

	from	rt
	sub	rt2
	add	r0
	hib
;	sex
	mult	rscale
	stw	[routptr]	; rotx-

	with	routptr
	sub	#4

;=31
	from	rmat1211	; 12
	hib
	to	rt2
	mult	rx		; m12*x

	from	rmat2322	; 22
	to	rt
	mult	ry		; m22*y
;	to	rt
;	add	rt

	from	rmat3231	; 32
	hib
	mult	rz		; m32*z
	to	rt
	add	rt

	from	rt
	add	rt2
	add	r0
	hib
;	sex
	mult	rscale
	stw	[routptr]	; roty

	with	routptr
	add	#6

	from	rt
	sub	rt2
	add	r0
	hib
;	sex
	mult	rscale
	stw	[routptr]	; roty-

	with	routptr
	sub	#4


;=15
	from	rmat2113	; 13
	to	rt2
	mult	rx		; m13*x

	from	rmat2322	; 23
	hib
	to	rt
	mult	ry		; m23*y
;	to	rt
;	add	rt

	from	rmat0033	; 33
	hib
	mult	rz		; m33*z
	to	rt
	add	rt

	from	rt
	add	rt2
	add	r0
	hib
;	sex
	mult	rscale
	stw	[routptr]	; rotz

	with	routptr
	add	#6

	from	rt
	sub	rt2
	add	r0
	hib
;	sex
	mult	rscale
	stw	[routptr]	; rotz-

	inc	routptr
	inc	routptr

;=15
	dec	r12
	bne	mmatrotpxloop
	nop

;	loop
;	nop

rotsize	=	*-mmatrotploop
;	?rotsize


;=61 cycles, 55 bytes

	sms	[m_rotptr],routptr
	mshape_rts

;	endc


;****************************************************************




; project points


msh_endpoints
;	stop
;	nop

	ifne	mario_stats3d

	lms	r1,[m_numpnts]
	lm	r0,[m_points_done]
	add	r1
	sbk

	endc


	ifeq	mfastproj

rx	equr	1
ry	equr	2
;rscale	equr	4
rz		equr	3
rrotptr	equr	7
rprojptr	equr	8
rbigx	equr	9
rbigy	equr	9
rbigz	equr	9

	miwt	rrotptr,m_rotpnts
	miwt	rprojptr,m_projpnts
	sms	[m_shapeptr],rshapeptr
	lms	r0,[m_numpnts]

	mcall	mprojectpntlist
	nop

;	lms	r0,[m_shapebank]	; rom bank = shapebank
;	romb

;	lms	rshapeptr,[m_shapeptr]

	endc


;****************************************************************



	ifne	mfastproj

;0	tmp
;1	x
;2	y
;3	scale
;4	mlo
;5	mhi
;6	z
;7-9	bigx,y,z
;10	rotptr
;11	projptr

;12	loop count
;13	loop addr
;14	romptr
;15	pc

rx	equr	1
ry	equr	2
;rscale	equr	3
rmlo	equr	4
rmhi	equr	5
rz	equr	6
rbigx	equr	3
rbigy	equr	11
rbigz	equr	9
rrotptr	equr	7
rprojptr	equr	8

routcode	equr	4
rxmax		equr	5
rymax		equr	5

; project points

projectpnts
;	lms	rscale,[m_scale]

	lms	rbigx,[m_bigx]		; world x,y,z
	lms	rbigy,[m_bigy]
	lms	rbigz,[m_bigz]

	ibt	r0,#ztab>>16
	romb			      	; ztab rom bank

	sub	r0
	sms	[m_or_of_outcodes],r0	; outcode = 0

	miwt	rrotptr,m_rotpnts
	miwt	rprojptr,m_projpnts
	sms	[m_shapeptr],rshapeptr	; save shapeptr
	lms	r12,[m_numpnts]		; numpnts to project

	mcache

	move	r13,pc

outprojploop
	mldwi	rrotptr	; x
;	mult	rscale
	to	rx
	add	rbigx		; add worldx

	mldwi	rrotptr	; y
;	mult	rscale
	to	ry
	add	rbigy		; add worldy

	mldwi	rrotptr	; z
;	mult	rscale
	to	rz
	add	rbigz		; add worldz

	ibt	routcode,#0

	miwt	r0,maxztab
	sub	rz
	bpl	outproj1	; if z > maxztab then z = maxztab
	nop
	miwt	rz,maxztab-1
outproj1

	miwt	r0,256		; if z < 256 then outprojznear
	sub	rz
	mlbpl	outprojznear

outprojznear1

; look up 32768/z

	with	rz
	bic	#1

	miwt	r0,ztab
	to	r14
	add	rz

	to	rz		; z = 32768/z
	getb
	inc	r14
	with	rz
	getbh

	move	r14,routcode	; save outcode

; project x

	from	rx		; x = (x * 32767/z) >> 15
	fmult
	rol
;	ibt	rx,#mvanishx	; add vanishx
	lms	rx,[m_vanishx]
	add	rx
	move	rx,r0
	mstwi	rprojptr	; output x

; project y

	from	ry		; y = (y * 32767/z) >> 15
	fmult
	rol
;	ibt	ry,#mvanishy	; add vanishy
	lms	ry,[m_vanishy]
	add	ry
	move	ry,r0
	mstwi	rprojptr	; output y

;	ibt	routcode,#0
	move	routcode,r14	; restore outcode

; outcode point

	ifeq	0

	moves	r0,rx
	bmi	outproj2	; x < 0
	nop
	lms	rxmax,[m_xright]
;	miwt	rxmax,mrightclp	; x > xmax-1
	sub	rxmax
	bmi	outproj3
	nop
	inc	routcode
outproj2
	inc	routcode
outproj3
	with	routcode
	mult	#4

	moves	r0,ry
	bmi	outproj4	; y < 0
	nop

	lms	rymax,[m_ybot]
;	miwt	rymax,mbotclp	; y > ymax-1
	sub	rymax
	bmi	outproj5
	nop
	inc	routcode

outproj4
	inc	routcode
outproj5

	endc

	ibt	r0,#31		; store complemented outcode in high byte
	xor	routcode
	swap
	or	routcode
	mstwi	rprojptr	; output outcode

	lms	rz,[m_or_of_outcodes]
	or	rz
	loop
	sbk			; store back or_of_outcodes

;qqq1	=	*-outprojploop
;qqq1	=	*-mmatrotploop
;	?qqq1



	lms	r0,[m_shapebank]	; rom bank = shapebank
	romb
	lms	rshapeptr,[m_shapeptr]

	mlbra	skipout


outprojznear
	moves	r0,rz	
	bpl	outprojz1
	nop
	ibt	routcode,#$10/4	; outcode -z
	mneg	rx		; x = -x
	mneg	ry		; y = -y
	mneg	rz		; z = -z
outprojz1
	from	rz
	add	rz
	add	r0
	add	r0
	to	rz
	add	r0

maxprojXY	=	1024

	moves	rx,rx
	bmi	.negx
	nop
	iwt	r0,#maxprojXY
	cmp	rx
	bpl	.xok
	nop
	iwt	rx,#maxprojXY
	bra	.xok
	nop
.negx
	iwt	r0,#-maxprojXY
	cmp	rx
	bmi	.xok
	nop
	iwt	rx,#-maxprojXY
.xok

	moves	ry,ry
	bmi	.negy
	nop
	iwt	r0,#maxprojXY
	cmp	ry
	bpl	.yok
	nop
	iwt	ry,#maxprojXY
	bra	.yok
	nop
.negy
	iwt	r0,#-maxprojXY
	cmp	ry
	bmi	.yok
	nop
	iwt	ry,#-maxprojXY
.yok


	from	rx
	add	rx
	add	r0
	add	r0
	to	rx
	add	r0

	from	ry
	add	ry
	add	r0
	add	r0
	to	ry
	add	r0

;	miwt	rz,256
	mlbra	outprojznear1

skipout

oprojsize	=	*-outprojploop
;	?oprojsize

	endc




;****************************************************************

; shape outcode checks

mtestoutcodes
	ifne	1

	lms	r0,[m_or_of_outcodes]
	miwt	r1,$1f00
	and	r1		; exit if object is all off any edge
	cmp	r1
	mlbne	mshowobjexit_notdrawn

	endc

	ifne	0

	lms	r1,[m_or_of_outcodes]
	ibt	r0,#$1f
	and	r1		; exit if object needs clipping
	mlbne	mshowobjexit

	endc

	ifne	monscreenobj

	lms	r1,[m_or_of_outcodes]
	ibt	r0,#$1f
	and	r1		; test if object is totally onscreen
	bne	.1
	nop

	lms	r0,[m_objflags]
	miwt	r1,onscreen		; set onscreen flag
	or	r1
	sbk
.1
	endc

;	mlbra	mshowobjend



;********************************************

; get face ptr

;	stop
;	nop

	lms	rshapeptr,[m_faceptr]
	sms	[m_shapeptr],rshapeptr

	mshape_rts

;********************************************

; bsp

;BSP fptr,rel_byte
;if vis then
; shjsr left
; add fptr
; shjsr right
; shrts
;else
; shjsr right 
; shjsr left 
; shrts

;BSPE
;add fptr
;rts 

;BSPEND
;rts

rfptr	equr	12



msh_bspinit

;	stop
;	nop

	miwt	r1,m_bsplist

;	sub	r0
;	mstwi	r1

	sms	[m_bspptr],r1

;	mgetwi	r0
;	mpush	r0		; stack continue addr

	miwt	r0,msh_bspout	; stack bspout addr
	mpush	r0

	mcache

	mshape_rts


msh_bspe
	mgetw	r0
	add	r14

	lms	r1,[m_bspptr]
	mstwi	r1		; add
	sms	[m_bspptr],r1


msh_bspend
	mpop	pc
	nop


	ifne	0
msh_bsp
	inc	r14		; skip vis

	mgetw	r0

	to	rfptr		; rfptr = r14 + relative word
	add	r14

	inc	r14

	move	r13,r14		; save r14

	from	rfptr
	to	r14
	add	#2		; skip faces,np,c,nx,ny,nz

	inc	r14		; skip vis

	mcall	mdo_vis
	nop

	move	r14,r13		; restore r14

	mtest	r0
	bmi	mbspvis
	nop

	mpush	r14

	getb

	lob
	beq	.1
	nop

	to	r14
	add	r14		; right

	mshape_jsr
.1

	mpop	r14		; left

	inc	r14
	
	mshape_rts

mbspvis
	mpush	r14		; stack r14

	inc	r14		; skip relative byte

	mpush	rfptr		; stack rfptr

	mshape_jsr		; left

	mpop	r0
	lms	r1,[m_bspptr]
	mstwi	r1		; add rfptr
	sms	[m_bspptr],r1

	mpop	r14

	getb			; right

	lob
	beq	.1
	nop

	to	r14
	add	r14

	mshape_rts

.1
	mpop	pc
	nop

	endc



	ifne	1
msh_bsp
	mgetbi	r0
	miwt	r1,m_vistab
	add	r1
	ldb	[r0]
	swap

;	inc	r14		; skip vis
;	mgetw	r0
;	to	rfptr		; rfptr = r14 + relative word
;	add	r14

;	inc	r14
;	move	r13,r14		; save r14
;	from	rfptr
;	to	r14
;	add	#2		; skip faces,np,c,nx,ny,nz
;	inc	r14		; skip vis
;	mcall	mdo_vis
;	nop
;	move	r14,r13		; restore r14

	mtest	r0
	bmi	mbspvis
	nop

	inc	r14		; skip fptr word
	inc	r14
	mpush	r14

	getb
	lob
	beq	.1
	nop

	to	r14
	add	r14		; right
	mshape_jsr
.1

	mpop	r14		; left

	inc	r14
	
	mshape_rts

mbspvis
	mgetw	r0
	to	rfptr		; rfptr = r14 + relative word
	add	r14
	inc	r14

	mpush	r14		; stack r14

	inc	r14		; skip relative byte

	mpush	rfptr		; stack rfptr

	mshape_jsr		; left

	mpop	r0
	lms	r1,[m_bspptr]
	mstwi	r1		; add rfptr
	sms	[m_bspptr],r1

	mpop	r14

	getb			; right

	lob
	beq	.1
	nop

	to	r14
	add	r14

	mshape_rts

.1
	mpop	pc
	nop

	endc






	ifne	0
msh_bspout
;	sub	r0
	lms	r1,[m_bspptr]
;	stw	[r1]		; 0 terminate list

;	miwt	r1,m_bsplist
	sms	[m_bspptr],r1
.2
	lms	r1,[m_bspptr]
	dec	r1
	dec	r1
	to	r14
	ldw	[r1]	; get shapeptr
	sms	[m_bspptr],r1

	mtest	r14		; terminate if 0
	beq	.1

	mshape_jsr		; execute until quit

	bra	.2
	nop	
.1
;	mpop	r14		; get continue addr
;	mshape_rts

	mlbra	mshowobjend	; exit
	endc


	ifne	1
msh_bspout
;	mlbra	mshowobjend	; exit

	sub	r0
	lms	r1,[m_bspptr]
	stw	[r1]		; 0 terminate list

	miwt	r0,m_bsplist
	sms	[m_bspptr],r0
.2
	lms	r1,[m_bspptr]
	to	r14
	mldwi	r1	; get shapeptr
	sms	[m_bspptr],r1

	mtest	r14		; terminate if 0
	beq	.1

	mshape_jsr		; execute until quit

	bra	.2
	nop	
.1
;	mpop	r14		; get continue addr
;	mshape_rts

	mlbra	mshowobjend	; exit
	endc




;	BSP	HELLA_f1,.bsp2
;	BSPE	HELLA_f3
;.bsp2	BSP	HELLA_f4,.bsp5
;	BSP	HELLA_f6,.bsp7
;	BSP	HELLA_f8,.bsp9
;	BSP	HELLA_f10,.bsp11
;	BSPE	HELLA_f12
;.bsp11	BSPE	HELLA_f13
;.bsp9	BSPE	HELLA_f14
;.bsp7	BSPE	HELLA_f15
;.bsp5	BSP	HELLA_f16,.bsp17
;	BSPE	HELLA_f18
;.bsp17	BSPE	HELLA_f19


;	BSPINIT
;	BSP	F1,.node
;	BSPE	F3
;.NODE	BSPE	F2


; VIS
; f3 f1 f2

; NOT VIS
; f2 f3


;********************************************


; groups



rzptr		equr	5
rmaxzptr	equr	6
rmaxz		equr	7
rrotzptr	equr	9
rnumgroups	equr	12


msh_groups

mzsortinit
	mgetbi	rnumgroups

;	miwt	r0,-m_zbuf-m_zbuf
	miwt	r0,-m_zbuf
	add	rnumgroups
	add	rshapeptr
	sms	[m_grouptab],r0

	sms	[m_groupnum],rnumgroups
	sms	[m_numgroups],rnumgroups

	miwt	rrotzptr,m_rotpnts+4	; rotated z ptr
	miwt	rzptr,m_zbuf

;	mcache

	move	r13,pc

mzsortinitloop
	mgetbi	r0
	umult	#6
	add	rrotzptr
	ldw	[r0]		; get signed z
	stw	[rzptr]		; store unsigned z
	inc	rzptr
	loop
	inc	rzptr

zsortinitsize	=	*-mzsortinitloop
;	?zsortinitsize



;************************************************


mgrouploop
	miwt	rzptr,m_zbuf
	miwt	rmaxz,-32768
;	move	rmaxzptr,rzptr
	lms	r12,[m_numgroups]

;	mcache

	move	r13,pc

mzsortloop
	ldw	[rzptr]
	cmp	rmaxz
	blt	mzsortloop1
	nop
	move	rmaxz,r0
	move	rmaxzptr,rzptr
mzsortloop1
	inc	rzptr
	loop
	inc	rzptr


zsortsize	=	*-mzsortloop
;	?zsortsize

	miwt	r0,-32768
	stw	[rmaxzptr]	

	lms	r0,[m_grouptab]
;	add	rmaxzptr
	to	rshapeptr
	add	rmaxzptr      

	mgetw	r0			; get group addr
	move	rshapeptr,r0


;	mlbra	mfaces			; call faces
;mnextgroup

	mshape_jsr

	lms	r0,[m_groupnum]
	dec	r0
	bne	mgrouploop
	sbk

	mlbra	mshowobjend


msh_s_spritevis
	mgetbi	r0

	miwt	r1,m_vistab
	add	r1
	ldb	[r0]
	swap
	
	hib
;	bra	msh_sprite
	bmi	msh_s_sprite
	nop

	inc	r14		; skip p1,colour,size
	inc	r14
	inc	r14
	mshape_rts



;*************************************************

; sprite
;
;	db	p1,colour,size

msh_s_sprite
	mgetbi	r0		; get p1
	to	r3
	umult	#6		; p1*6


	miwt	r1,m_projpnts	; projpnt 1
	from	r3
	to	r2
	add	r1

	mldwi	r2		; x
	sms	[m_sprx],r0
	ldw	[r2]		; y
	sms	[m_spry],r0
	miwt	r1,m_projpnts	; p1 x

	miwt	r1,m_rotpnts+4	; rotpnt 1 z
	from	r3
	add	r1
	ldw	[r0]		; rot z
	lms	r1,[m_bigz]
	add	r1
	sms	[m_sprz],r0

;	miwt	r1,256		; if z<minz then skip drawing
	miwt	r1,32		; if z<32 then skip drawing
;	miwt	r1,0		; if z<0 then skip drawing
	sub	r1
	bmi	.zclipped
	nop

	mcall	mdo_colour
	nop
	
	inc	r14		; skip colour byte

	mgetbi	r0		; get size
;	ibt	r0,#32

	lms	r0,[m_sprmask]	; *HACK* get size from sprmask
	lob
	inc	r0
	sms	[m_sprsize],r0
	
	miwt	r1,256		; scale = 1 (i.e. 1<<8)
	add	r0
	swap
	bpl	.not64
	nop

	with	r1		; halve scale if size = 64
	lsr
.not64	
	sms	[m_sprxscale],r1

	sms	[m_shapeptr],r14

;	lms	r0,[m_viewrotz]
;	lob
	sub	r0
	sms	[m_sprangle],r0

	mcall	mshowspr	; draw rotated scaled sprite
	nop

	lms	r0,[m_shapebank]
	romb
	lms	r14,[m_shapeptr]

	mshape_rts

.zclipped
	inc	r14		; skip colour,size
	inc	r14
	mshape_rts


;*************************************************



; faces

;	db	vis,fnumpnts,colour,p1,p2,...pn
;	db	fnumpnts,colour,nx,ny,nz,p1,p2,...pn

;	db	vis,fnumpnts,colour,normal,p1,p2,...pn

;poly	db	colour,vis,p4...pn
;fendq	db	255
;fend	db	254
;line	db	253,colour,p1,p2

; mat					romsin	angles		mat
; rot	to rotpnts			rompnt	mat		rot
; proj	from rotpnts to projpnts	romztab	rot		proj

; vis	from projpnts to vistab		romvis	proj		vis
; lite	from vnormals to inttab		romvnor	vnorm		int
; lite	from normals to litetab		romnorm	norm		lite
; bsp	to bsplist			rombsp	vis		bsp
; copy	from bsplist to drawlist	romface	vis,proj,colr	draw
; draw	from drawlist			romgrad	draw		screen

;
; faces
;  vis	 p1,p2,p3
;   lite nx,ny,nz
;   copy p1...pn
;   outc p1...pn
;   clip p1...pn
;   draw p1...pn


; expfaces
;
; colour
; rot and scale normal vector
; add vector to each rot point and project
; copy
; draw


mfacesend
	inc	r0		; if numpts = -1 then fend
	lob
	beq	.2
	nop

	mshape_rts

.2
	mpop	pc		; else quit
	nop



msh_faces

mfaces
mfaceloop

	ibt	r0,#$70
	colour
	ibt	r0,#2	;8     	; dither on
	cmode

	getb			; numpts
	lob
	bmi	mfacesend
	inc	r14

	ibt	r1,#$3f
	to	r2
	and	r1
	sms	[m_fnumpnts],r2

	dec	r2
	dec	r2
	beq	misline
	inc	r14

;************************************************

mfaceloop1
;	mcall	mdo_vis
;	nop

	dec	r14
	getb
	with	r14
	add	#7

	miwt	r1,m_vistab	; get vis
	add	r1
	ldb	[r0]
	swap
	
mvistest
	hib
;	bra	misvis
	bmi	misvis
	nop

;************************************************

; isnotvis
	lms	r0,[m_expcnt]
	mtest	r0
	mlbne	mexpfacesnvis

	lms	r0,[m_fnumpnts]
	dec	r0
	dec	r0 
	with	rshapeptr
	bra	mfaceloop
	add	r0		; add fnumpnts -2

;**********************************************************

; isvis
misvis
	with	rshapeptr
	sub	#6

misline
	mcall	mdo_colour
	nop

;*************************************************************

; set face colour

	with	rshapeptr
	add	#4

	ifne	0
	lms	r0,[m_fnumpnts]
	with	rshapeptr		; start of next poly
	add	r0
	mlbra	mfacenotvis		; draw no polys
	endc

	lms	r0,[m_expcnt]
	mtest	r0
	mlbne	mexpfacesvis

; copy poly pnts to polybuf

rx	equr	1
ry	equr	2
rpnt	equr	4
rpolyptr	equr	6
routcode	equr	5
rprojbuf	equr	9

mcopypoly
	ifne	monscreenobj

	lms	r0,[m_objflags]
	miwt	r1,onscreen
	and	r1
;	mlbeq	moff_copypoly
	mlbra	moff_copypoly


; on screen version

	miwt	rprojbuf,m_projpnts
	miwt	rpolyptr,m_polybuf
;	ibt	routcode,#0
	lms	r12,[m_fnumpnts]
	move	r13,pc

	mgetbi	rpnt		; p1
	from	rpnt
	umult	#6		; p1*6
	to	rprojptr
	add	rprojbuf

	ldw	[rprojptr]	; x1
	mstwi	rpolyptr
	inc	rprojptr
	inc	rprojptr
	ldw	[rprojptr]	; y1
	mstwi	rpolyptr
;	inc	rprojptr
;	inc	rprojptr
;	ldw	[rprojptr]	; outcode
;	to	routcode
;	or	routcode	; or of all poly point outcodes

	ifne	0
;	ldw	[rprojptr]	; outcode
;	dec	rprojptr
;	dec	rprojptr
	to	ry
	ldw	[rprojptr]	; y1
	dec	rprojptr
	dec	rprojptr
	to	rx
	ldw	[rprojptr]	; x1
	lob			; plot on screen points of visible polys
	bne	.offscreen
	nop
	plot
.offscreen
	endc

; copy texture map coords

	lms	r0,[m_texturemap]
	mtest	r0
	beq	mskiptex2
	nop

	ifne	1
	inc	r0		; smooth shaded?
	beq	.1
	nop
	miwt	r0,m_intpnts
	add	rpnt
	ldb	[r0]
	mstwi	rpolyptr
	mstwi	rpolyptr
	mlbra	mskiptex2
.1
	endc

	sms	[m_shapeptr],rshapeptr

	ibt	r0,#default_c>>16
	romb

	lms	r14,[m_texptr]
	mgetbi	r0		; xp1
	mstwi	rpolyptr
	mgetbi	r0		; yp1
	mstwi	rpolyptr
	sms	[m_texptr],r14

	lms	r0,[m_shapebank]
	romb

	lms	rshapeptr,[m_shapeptr]
mskiptex2

	loop
	nop

	sms	[m_shapeptr],rshapeptr
	lms	r0,[m_fnumpnts]
	mlbra	mfaceon

	endc


; off screen version

moff_copypoly
	miwt	rprojbuf,m_projpnts
	miwt	rpolyptr,m_polybuf
	ibt	routcode,#0
	lms	r12,[m_fnumpnts]
;	mcache
	move	r13,pc

	mgetbi	rpnt		; p1
	from	rpnt
	umult	#6		; p1*6
	to	rprojptr
	add	rprojbuf

	ldw	[rprojptr]	; x1
	mstwi	rpolyptr
	inc	rprojptr
	inc	rprojptr
	ldw	[rprojptr]	; y1
	mstwi	rpolyptr
	inc	rprojptr
	inc	rprojptr
	ldw	[rprojptr]	; outcode
	to	routcode
	or	routcode	; or of all poly point outcodes

	ifne	0
	ldw	[rprojptr]	; outcode
	dec	rprojptr
	dec	rprojptr
	to	ry
	ldw	[rprojptr]	; y1
	dec	rprojptr
	dec	rprojptr
	to	rx
	ldw	[rprojptr]	; x1
	lob			; plot on screen points of visible polys
	bne	.offscreen
	nop
	plot
.offscreen
	endc

; copy texture map coords

	lms	r0,[m_texturemap]
	mtest	r0
	beq	mskiptex
	nop

	ifne	1
	inc	r0		; smooth shaded?
	beq	.1
	nop
	miwt	r0,m_intpnts
	add	rpnt
	ldb	[r0]
	mstwi	rpolyptr
	mstwi	rpolyptr
	mlbra	mskiptex
.1
	endc

	sms	[m_shapeptr],rshapeptr

	ibt	r0,#default_c>>16
	romb

	lms	r14,[m_texptr]
	mgetbi	r0		; xp1
	mstwi	rpolyptr
	mgetbi	r0		; yp1
	mstwi	rpolyptr
	sms	[m_texptr],r14

	lms	r0,[m_shapebank]
	romb

	lms	rshapeptr,[m_shapeptr]
mskiptex

	loop
	nop


;**********************************************

; check poly outcodes


mchkpoly

;	mlbra	mfacenotvis		; draw no polys


	sms	[m_shapeptr],rshapeptr

	from	routcode
	lob
	bne	.2			; draw poly if not clipped
	nop
	lms	r0,[m_fnumpnts]
	mlbra	mfaceon
.2
	ifne	1
	ibt	r0,#$10
	and	routcode
	beq	.1			; skip if no points z clipped
	nop

	miwt	r1,$1000
	from	r1
	and	routcode
	sub	r1	
	bne	mfacenotvis		; skip if all points z clipped
	nop

	lms	r0,[m_texturemap]	; don't 3d clip texture maps!
	hib
	mlbne	mfacenotvis

;	mlbra	mfacenotvis		; draw no z clipped polys

	lms	r0,[m_fnumpnts]
	with	rshapeptr		; reset to start of poly points
	sub	r0

;	mlbra	mclippoly3d		; 3d clip poly if any point z clipped

	mcall	mclippoly3d
	nop

	mtest	r0
	beq	mfacelabel2
	nop
	bra	mclppoly2d
	nop
.1
	endc

	ifne	1
	miwt	r1,$0f00
	from	r1
	and	routcode
	sub	r1	
	bne	mfacenotvis		; skip if all clipped off one edge
	nop
	endc

	ifne	0
	lms	r0,[m_texturemap]
	hib
	beq	mskiptex2
	nop

	ibt	r0,#$1f
	and	routcode
	bne	mfacenotvis		; skip texture maps if any point clipped
	nop
mskiptex2
	endc

;	from	routcode		; call clip poly if clipped
;	lob
;	beq	mfaceon
;	nop

	lms	r0,[m_texturemap]
	hib
	bne	mcliptex
	nop

	lms	r0,[m_fnumpnts]
;	mlbra	mclp_poly	  	; draw clipped poly
mclppoly2d
;	mcall	mclp_poly		; Carl clip 2d 
	mcall	mtclippoly2d		; Pete clip 2d
	nop
	mtest	r0
	beq	mfacelabel2
	nop
	mlbra	mfaceon

mcliptex
;	mlbra	mfacelabel2

	lms	r0,[m_fnumpnts]
;	mlbra	mclp_poly	  	; draw clipped poly
mtxclppoly2d
	mcall	mtxclippoly2d
	nop
	mtest	r0
	beq	mfacelabel2
	nop

mfaceon
	sms	[m_clip2drsp],rsp

	ibt	r1,#0
	from	r1
	romb

	mlbra	mdrawpoly		; draw unclipped poly, tpoly, line

mfacelabel
	lms	r0,[m_shapebank]
	romb

	lms	rsp,[m_clip2drsp]

mfacelabel2
	lms	rshapeptr,[m_shapeptr]

; next face

mfacenotvis
	mlbra	mfaceloop



; circle 8	       0,colour,x1,y1,radius
; dot	 4	       1,colour,x1,y1
; line   6	       2,colour,x1,y1,x2,y2
; poly   2+2n 	  numpts,colour,x1,y1,...,xn,yn
; tpoly	 2+4n  64+numpts,texptr,x1,y1,xp1,yp1,...,xn,yn,xpn,ypn

; dec 91
;m 25 2  9 16 23 30
;t 26 3 10 17 24 31
;w 27 4 11 18 25  1
;t 28 5 12 19 26
;f 29 6 13 20 27
;s 30 7 14 21 28
;s  1 8 15 22 29

;************************************************


msh_endshape

mshowobjend

;	?mshowobjend-mfacesend


	ifne	0

; draw all points


rx	equr	1
ry	equr	2
rprojptr	equr	3


	sub	r0		; no dither
	cmode
	ibt	r0,#15		; colour 15
	colour


	miwt	rprojptr,m_projpnts
	lms	r12,[m_numpnts]
	move	r13,pc

	to	rx
	mldwi	rprojptr	; get x
	to	ry
	mldwi	rprojptr	; get y

	mldwi	rprojptr	; get outcode
	lob			; plot on screen points
	bne	misoffscreen
	nop
	plot
misoffscreen

	loop
	nop

	endc



;**********************************************


mshowobjexit

;	mlbra	mcopy


; flush plot buffer

	ibt	r1,#0
	ibt	r2,#0 
	mrpix
	nop
	nop

;	mlbra	mdrawsphere

	mpop	pc
	nop

	stop
	nop



mshowobjexit_notdrawn
	ifne	mario_stats3d

	mincm	m_shapes_notdrawn

	endc

	bra	mshowobjexit
	nop




mshowobjsize	=	mshowobjend-mshowobj

;	?mshowobjsize






;**********************************************
;**********************************************
;**********************************************
;**********************************************





	ifne	0

; inc angles

	lms	r0,[m_roty]
	add	#0
	sbk

	lms	r0,[m_rotx]
	sub	#1
	sbk


; memory debug

	miwt	r0,m_rotpnts
	miwt	r1,m_rotpnts+3
	miwt	r2,m_rotpnts+6
	miwt	r3,m_rotpnts+9
	miwt	r4,m_projpnts
	miwt	r5,m_projpnts+3
	miwt	r6,m_projpnts+6
	miwt	r7,m_projpnts+9
	miwt	r8,m_mat1211
	miwt	r9,m_mat2113
	miwt	r10,m_mat2322
	miwt	r11,m_mat3231
	miwt	r12,m_mat0033
;	miwt	r11,m_bigx
;	miwt	r12,m_bigy
;	miwt	r13,m_bigz
	miwt	r14,m_or_of_outcodes

;	mlbra	mnextframe

	stop

	endc


;**********************************************
;**********************************************
;**********************************************



	ifne	1

rx	equr	1
ry	equr	2
rz	equr	3
rrotbuf	equr	6
rrotptr	equr	7
rpolyptr	equr	8
rbigx	equr	6
rbigy	equr	6
rbigz	equr	6
rexpcnt	equr	9


mexpfacesvis
	mcall	mexpfacesinit
	nop

.projloop
	mgetbi	r0		; p1
	umult	#6		; p1*6
	miwt	rrotbuf,m_rotpnts
	to	rrotptr
	add	rrotbuf

	mldwi	rrotptr	; x
	lms	rbigx,[m_x1]
	to	rx
	add	rbigx

	mldwi	rrotptr	; y
	lms	rbigy,[m_y1]
	to	ry
	add	rbigy

	mldwi	rrotptr	; z
	lms	rbigz,[m_z1]
	to	rz
	add	rbigz

	mcall	mprojectpnt
	nop

	from	rx
	mstwi	rpolyptr	; x
	from	ry
	mstwi	rpolyptr	; y

	lms	rz,[m_or_of_outcodes]
	or	rz
	sbk

; copy texture map coords

	lms	r0,[m_texturemap]
	hib
	beq	.skiptex2
	nop

	ibt	r0,#default_c>>16
	romb

	sms	[m_shapeptr],rshapeptr
	lms	r14,[m_texptr]
	mgetbi	r0		; xp1
	mstwi	rpolyptr
	mgetbi	r0		; yp1
	mstwi	rpolyptr
	sms	[m_texptr],r14

	lms	r0,[m_shapebank]
	romb

	lms	rshapeptr,[m_shapeptr]
.skiptex2

	lms	r0,[m_cnt]
	dec	r0
	bne	.projloop
	sbk

	lms	r5,[m_or_of_outcodes]

	mlbra	mchkpoly



;**********************************************************


mexpfacesnvis
	with	rshapeptr
	sub	#6

	mcall	mdo_colour
	nop

	with	rshapeptr
	add	#4

	mcall	mexpfacesinit
	nop

	lms	r0,[m_fnumpnts]
	with	rshapeptr
	add	r0
	dec	rshapeptr

.projloop
	getb	r0		; p1
	dec	r14
	umult	#6		; p1*6
	miwt	rrotbuf,m_rotpnts
	to	rrotptr
	add	rrotbuf

	mldwi	rrotptr	; x
	lms	rbigx,[m_x1]
	to	rx
	add	rbigx

	mldwi	rrotptr	; y
	lms	rbigy,[m_y1]
	to	ry
	add	rbigy

	mldwi	rrotptr	; z
	lms	rbigz,[m_z1]
	to	rz
	add	rbigz

	mcall	mprojectpnt
	nop

	from	rx
	mstwi	rpolyptr	; x
	from	ry
	mstwi	rpolyptr	; y

	lms	rz,[m_or_of_outcodes]
	or	rz
	sbk

; copy texture map coords

	lms	r0,[m_texturemap]
	hib
	beq	.skiptex2
	nop

	ibt	r0,#default_c>>16
	romb

	sms	[m_shapeptr],rshapeptr
	lms	r14,[m_texptr]
	mgetbi	r0		; xp1
	mstwi	rpolyptr
	mgetbi	r0		; yp1
	mstwi	rpolyptr
	sms	[m_texptr],r14

	lms	r0,[m_shapebank]
	romb

	lms	rshapeptr,[m_shapeptr]
.skiptex2

	lms	r0,[m_cnt]
	dec	r0
	bne	.projloop
	sbk

	lms	r0,[m_fnumpnts]
	with	rshapeptr
	add	r0
	inc	rshapeptr

	lms	r5,[m_or_of_outcodes]

	mlbra	mchkpoly





mexpfacesinit

	sub	r0
	sms	[m_texturemap],r0


;	iwt	r2,#$99
;	lms	r0,[m_expcnt]
;	ibt	r3,#6
;	cmp	r3
;	bcs	.2
;	nop
	
;	add	rshapeptr
;	and	#1
;	beq	.2
;	nop
;	iwt	r2,#$ee
;.2
;	from	r2
;	colour
	with	rshapeptr
	sub	#3


	lms	rexpcnt,[m_expcnt]

	mgetbsi	rx
	mgetbsi	ry
	mgetbsi	rz
	mneg	rx
	mneg	rz

	mdotprod16mq	m_mat11,m_mat21,m_mat31

	mult	rexpcnt
;	asr
;	asr
	asr
	asr
	lms	r6,[m_bigx]
	add	r6
	sms	[m_x1],r0

	mdotprod16mq	m_mat12,m_mat22,m_mat32

	mtest	r0
	bmi	.1
	nop
	mneg	r0
.1
	mult	rexpcnt
;	asr
;	asr
	asr
	asr
	lms	r6,[m_bigy]
	add	r6
	sms	[m_y1],r0

	mdotprod16mq	m_mat13,m_mat23,m_mat33

	mult	rexpcnt
;	asr
;	asr
	asr
	asr
	lms	r6,[m_bigz]
	add	r6
	sms	[m_z1],r0

	sub	r0
	sms	[m_or_of_outcodes],r0
	miwt	rpolyptr,m_polybuf
	lms	r0,[m_fnumpnts]
	sms	[m_cnt],r0

	jmp	r11
	nop



	endc



;**********************************************************


	ifne	0

; select texture map addr from textab using colour byte

	lms	r1,[m_texturemap]
	mtest	r1
	beq	.1
	nop

	sms	[m_shapeptr],rshapeptr	; save shapeptr
	move	r1,r0			; save colour
	miwt	r2,textab
	and	#7
	add	r0
	to	r14
	add	r2
	mgetw	r0
	sms	[m_sprdata],r0		; = textab[(colour&7)*2]
	ibt	r0,#4
	sms	[m_sprbank],r0		; texture ROM bank
	move	r0,r1			; restore colour
	lms	rshapeptr,[m_shapeptr]	; restore shapeptr

	miwt	r0,texturexy
	sms	[m_texptr],r0

	mlbra	misline			; no light source if textured
.1

	endc

;**********************************************************






	ifne	1

; 15	animated    )if both set
; 14	textured    )then smooth shaded
; 13..8	light source table 
;  7..4	colour2
;  3..0	colour1

; animated	animtab7
; textured	texture3
; litesrcd	litetab15,colour9
; 
;


mdo_colour
	move	r2,r14

	ifne	1
	lms	r0,[m_objflags]
	miwt	r1,drawshadow
	to	r1
	and	r1
	beq	.noshadow
	nop

	move	r1,#truecolourshadow
	and	r1
	bne	.noshadow
	nop

	ibt	r0,#2	;8		; dithering on
	cmode

	mibt	r0,mshadowcolour
	colour

	sub	r0
	sms	[m_tcmodecol],r0

	sms	[m_texturemap],r0

	mlbra	mdo_colour4

.noshadow
	endc


	getb
mdo_colour_ng
	add	r0

	ibt	r1,#default_c>>16
	from	r1
	romb

	lms	r1,[m_colourptr]
	to	r14
	add	r1

.getwordagain
	mgetw	r3		; r3 = colourptr[colourbyte<<1]

;	sub	r0
;	romb			; mario data table bank

	mtest	r3
	bpl	.2
	nop

	from	r3
	add	r3
	bpl	.7		; test texture map bit 14
	nop

; smooth shaded

	miwt	r0,smoothshade
	sms	[m_texturemap],r0	; m_texturemap=smoothshade

	from	r3
	hib
	and	#15	 	; set colour palette to use
	add	r0
	add	r0
	add	r0
	add	r0
	swap			
	or	#8		; set cmode 8
	swap
	sms	[m_tcmodecol],r0	; set texture map colour and cmode
	mlbra	mdo_colour4

.7

; animated

;	lms	r0,[m_shapebank]
;	romb

;	lms	r0,[m_colframe]
;	to	r1
;	and	#3

;	miwt	r0,$3fff	; get 14 bit offset
;	and	r3
;	add	r1
;	to	r14		; r14 = offset14 + (colframe<<1)
;	add	r1

;	mgetw	r3		; get animated colour word value

	miwt	r0,$3fff	; get 14 bit offset
	to	r14
	and	r3
	
;	mfrom	r3
;	madd	r3
;	madd	r0		; mult by 2
;	masr
;	masr			; and shift by 2 (sign extending 15 -> 16)
;	mto	r14
;	madd	r14		; initiate a read

	lms	r0,[m_colframe]	; get the frame counter
	to	r3
	getb			; read the number of frames
	dec	r3
	and	r3
	add	r0
	inc	r0
	to	r14
	bra	.getwordagain
	add	r14		; initiate another read



; textured

.2
	sub	r0
	sms	[m_tcmodecol],r0

	from	r3
	add	r3
	bpl	.6			; test texture map (bit 14)
	sub	r0
	dec	r0	
.6
;	sub	r0
	sms	[m_texturemap],r0	; if bit set then m_texturemap=-1

;	bra	.3
	beq	.3
	nop

	from	r3
	lob
	bpl	.lo			; test hi nybble mode (bit 13)
	nop

	miwt	r0,1<<(2+8)		; cmode bit 2 (hi nybble mode)
	sms	[m_tcmodecol],r0
.lo
	from	r3
	add	r3
	lob
	lsr				; clear the hi bit
					; sprite no. in lo 7 bits
	umult	#3
	miwt	r1,textureaddrtab
	to	r14
	add	r1
	mgetwi	r0
	sms	[m_sprdata],r0		; = textureaddrtab[(colour&255)*3]
	getb
	sms	[m_sprbank],r0		; texture ROM bank

	from	r3
	hib
	ibt	r1,#$3f
	and	r1	
	add	r0
	miwt	r1,texturexytab
	to	r14
	add	r1 			; = texturexytab[((colour>>8)&63)*2]
	mgetw	r0
	move	r14,r0
	mgetw	r1
	sms	[m_sprmask],r1
	inc	r0
	inc	r0			; skip x,y size
	sms	[m_texptr],r0		; texture x,y ptr


	mlbra	mdo_colour4
.3

; light sourced
 
	ibt	r1,#$3f
	from	r3
	hib
	inc	r0
	and	r1
	mlbeq	mdo_colour5	; 63 = fixed

	inc	r0
	and	r1
	mlbne	mdo_colourl	; 62 = depth
	
; depth cued

	from	r3
	lob
	lms	r3,[m_depthsptr] ; depth cued table addr
	to	r14		; r14 = m_depthstab[colour & 255]
	add	r3
	getc			; colour
	mlbra	mdo_colour4

mdo_colourl
	dec	r0
	dec	r0
	and	r1
	move	r3,r0		; litesrc table number

	lms	r0,[m_objflags]	; litesrc on?
	hib
	bpl	mdo_colour5
	nop

	lms	r0,[m_shadestab] ; depth cued shade table addr
	add	r3
	to	r14		; r14 = m_shadestab[litesrctab<<1]
	add	r3
	mgetw	r6		; get shadetab addr


	lms	r0,[m_shapebank]
	romb

	move	r14,r2

; light source

rt		equr	4
rdotprod	equr	5
rshadeptr	equr	6

	inc	rshapeptr

	mgetbi	r0		; nx*lx
	lms	rt,[m_rotlightx]
	to	rdotprod
	mult	rt

	mgetbi	r0		; +ny*ly
	lms	rt,[m_rotlighty]
	mult	rt
	to	rdotprod
	add	rdotprod

	getb			; +nz*lz
	lms	rt,[m_rotlightz]
	mult	rt
	add	rdotprod
	asr
	asr
	hib
	sex

	ibt	rt,#6		; shade >=6
	cmp	rt
	bge	lightsrc1
	nop
	ibt	r0,#6
	bra	lightsrc2
	nop
lightsrc1

	ibt	rt,#16		; shade <16
	cmp	rt
	blt	lightsrc2
	nop
	ibt	r0,#15
lightsrc2
	to	r1
	sub	#6

; get light source colour

;	sub	r0
;	romb			; mario data table bank

	ibt	r0,#default_c>>16
	romb

	from	rshadeptr
	to	r14
	add	r1		; add intensity
	bra	mdo_colour4
	getc			; set light sourced colour
	
mdo_colour5
	from	r3
	lob
	colour

mdo_colour4
	lms	r0,[m_shapebank]
	romb

	move	r14,r2

mdo_colour_rts
	jmp	r11
	nop

	endc

;**********************************************

; hidden surface

rx1	equr	1
ry1	equr	2
rx2	equr	3
ry2	equr	7
rx3	equr	1
ry3	equr	2
routcode	equr	5
rprojptr	equr	8
rprojbuf	equr	9
rvisptr	equr	11


msh_vizis
	ifne	monscreenobj

	lms	r0,[m_objflags]
	miwt	r1,onscreen
	and	r1
	mlbne	mshon_vizis

	endc

	mgetbi	r12

	ifne	mario_stats3d

	lm	r0,[m_visis_done]
	add	r12
	sbk

	endc

	miwt	rprojbuf,m_projpnts
	miwt	rvisptr,m_vistab

	ifne	mviscache
	mcache
	endc

	move	r13,pc

	mgetbi	r0		; p1
	mult	#6		; p1*6
	add	rprojbuf
	to	rx1
	mldwi	r0		; x1
	to	ry1
	mldwi	r0		; y1
	to	routcode
	ldw	[r0]		; out1

	mgetbi	r0		; p2
	mult	#6		; p2*6
	to	rprojptr
	add	rprojbuf
	mldwi	rprojptr	; x2
	to	rx2
	sub	rx1
	mldwi	rprojptr	; y2
	to	ry2
	sub	ry1
	ldw	[rprojptr]	; out2
	to	routcode
	xor	routcode

	getb			; p3
	inc	r14			; pete 8/12/92
;	with	rshapeptr
;	add	#4		; skip nx,ny,nz
	mult	#6		; p3*6
	to	rprojptr
	add	rprojbuf
	mldwi	rprojptr	; x3
	to	rx3
	sub	rx1
	mldwi	rprojptr	; y3
	to	ry3
	sub	ry1
	ldw	[rprojptr]	; out3
	to	routcode
	xor	routcode

	move	r6,rx3
	with	ry2
	lmult
	move	rx3,r4		; y2*x3

	move	r6,rx2
	with	ry3
	lmult			; x2*y3

	with	r4
	sub	rx3
	with	ry3
	sbc	ry2		; x2*y3 - y2*x3

	from	routcode
	add	routcode
	add	r0
	add	r0
	swap
	xor	ry3		; xor bit15 with z bit 
	hib
	stb	[rvisptr]
	loop
	inc	rvisptr
	
	mshape_rts


;**********************************************

; vis, onscreen version

;msh_vizis
mshon_vizis
	mgetbi	r12

	ifne	mario_stats3d

	lm	r0,[m_visis_done]
	add	r12
	sbk

	endc

	miwt	rprojbuf,m_projpnts
	miwt	rvisptr,m_vistab

	ifne	mviscache
	mcache
	endc

	move	r13,pc

	mgetbi	r0		; p1
	umult	#6		; p1*6
	add	rprojbuf
	to	rx1
	mldbi	r0		; x1
	inc	r0
	to	ry1
	ldb	[r0]		; y1

	mgetbi	r0		; p2
	umult	#6		; p2*6
	to	rprojptr
	add	rprojbuf
	mldbi	rprojptr	; x2
	inc	rprojptr
	sub	rx1
	to	rx2
	asr
	ldb	[rprojptr]	; y2
	sub	ry1
	to	ry2
	asr

	getb			; p3
	inc	r14			; pete 8/12/92
;	with	rshapeptr
;	add	#4		; skip nx,ny,nz
	umult	#6		; p3*6
	to	rprojptr
	add	rprojbuf
	mldbi	rprojptr	; x3
	inc	rprojptr
	sub	rx1
	to	rx3
	asr
	ldb	[rprojptr]	; y3
	sub	ry1
	to	ry3
	asr

	from	rx3		; x2*y3 - y2*x3
	to	rx3
	mult	ry2
	from	rx2
	mult	ry3
	sub	rx3

	hib
	stb	[rvisptr]
	loop
	inc	rvisptr
	
	mshape_rts




;**********************************************

; hidden surface

rx1	equr	1
ry1	equr	2
rx2	equr	3
ry2	equr	7
rx3	equr	1
ry3	equr	2
routcode	equr	5
rprojptr	equr	8
rprojbuf	equr	9

mdo_vis
	ifne	1
	dec	r14
	getb
	with	r14
	add	#7
	miwt	r1,m_vistab
	add	r1
	ldb	[r0]
	jmp	r11
	swap
	endc


	ifne	0

	miwt	rprojbuf,m_projpnts
	with	rshapeptr
	add	#4

	ifne	0		; always vis
	inc	rshapeptr
	inc	rshapeptr
	mlbra	misvis
	endc


	ifne	1
	mgetbi	r0		; p1
	umult	#6		; p1*6
	add	rprojbuf
	to	rx1
	mldwi	r0		; x1
	to	ry1
	mldwi	r0		; y1
	to	routcode
	ldw	[r0]		; out1

	mgetbi	r0		; p2
	umult	#6		; p2*6
	to	rprojptr
	add	rprojbuf
	mldwi	rprojptr	; x2
	to	rx2
	sub	rx1
	mldwi	rprojptr	; y2
	to	ry2
	sub	ry1
	ldw	[rprojptr]	; out2
	to	routcode
	xor	routcode

	getb			; p3
	umult	#6		; p3*6
	to	rprojptr
	add	rprojbuf
	mldwi	rprojptr	; x3
	to	rx3
	sub	rx1
	mldwi	rprojptr	; y3
	to	ry3
	sub	ry1
	ldw	[rprojptr]	; out3
	to	routcode
	xor	routcode

	move	r6,rx3
	with	ry2
	lmult
	move	rx3,r4		; y2*x3

	move	r6,rx2
	with	ry3
	lmult			; x2*y3

	with	r4
	sub	rx3
	with	ry3
	sbc	ry2		; x2*y3 - y2*x3

	from	routcode
	add	routcode
	add	r0
	add	r0
	swap
	xor	ry3		; xor bit15 with z bit 
	mtest	r0

	jmp	r11
	nop

	endc

	endc

;**********************************************

; test code

	ifne	0
	mgetbi	r0
	lsr
	with	rvisxor		; bit15 rvisxor = bit0 r0
	ror
	miwt	r1,vistab
	add	r1
	ldb	[r0]
	swap
	xor	rvisxor



	ror
	with	rvisword
	bcc	.1
	rol
	from	rvisword
	mstwi	rvisptr
	ibt	rvisword,#1
.1
	loop
	nop

	endc

;**********************************************

	ifne	0

; vis, onscreen version

	mgetbi	r0		; p1
	umult	#6		; p1*6
	add	rprojbuf
	to	rx1
	mldbi	r0		; x1
	inc	r0
	to	ry1
	ldb	[r0]		; y1

	mgetbi	r0		; p2
	umult	#6		; p2*6
	to	rprojptr
	add	rprojbuf
	mldbi	rprojptr	; x2
	inc	rprojptr
	to	rx2
	sub	rx1
	ldb	[rprojptr]	; y2
	to	ry2
	sub	ry1

	getb			; p3
	umult	#6		; p3*6
	to	rprojptr
	add	rprojbuf
	mldbi	rprojptr	; x3
	inc	rprojptr
	to	rx3
	sub	rx1
	ldb	[rprojptr]	; y3
	to	ry3
	sub	ry1

	with	rx3		; x2*y3 - y2*x3
	mult	ry2
	from	rx2
	mult	ry3
	sub	rx3

	endc

;**********************************************

	ifne	0

; light source

rdotprod	equr	2
rshadeptr	equr	3
rt		equr	4

	inc	rshapeptr

	miwt	rt,shadestab
;	ibt	r0,#0		; force shades of grey
	add	r0
	to	rshadeptr
	add	rt

	mgetbi	r0		; nx*lx
	lms	rt,[m_rotlightx]
	to	rdotprod
	mult	rt

	mgetbi	r0		; +ny*ly
	lms	rt,[m_rotlighty]
	mult	rt
	to	rdotprod
	add	rdotprod

	getb			; +nz*lz
	lms	rt,[m_rotlightz]
	mult	rt
	add	rdotprod
	asr
	asr
	hib
	sex

	ibt	rt,#6		; shade >=6
	cmp	rt
	bge	lightsrc1
	nop
	ibt	r0,#6
	bra	lightsrc2
	nop
lightsrc1

	ibt	rt,#16		; shade <16
	cmp	rt
	blt	lightsrc2
	nop
	ibt	r0,#15
lightsrc2

	to	r1	  	; r1 = shade
	sub	#6

; get light source colour

	ibt	r0,#2	;8		; dithering on
	cmode

	move	rt,rshapeptr	; save shapeptr
	move	r14,rshadeptr
	mgetw	r0		; get shadetab addr

	to	r14
	add	r1		; add shade
	getc			; get light sourced colour

	move	rshapeptr,rt	; restore shapeptr
	with	rshapeptr
	sub	#3

	endc


;**********************************************


; slow project pnt


rx	equr	1
ry	equr	2
rz	equr	3
routcode	equr	5


mprojectstart

	ifne	1

mprojectpnt
	mpush	r11

	mtest	rz
	mlbmi	.zn
	nop
.zp
	bne	.zgt0
	nop
	inc	rz
.zgt0
	ibt	routcode,#0
	mtest	rx
	bmi	.zp_xn
	nop
.zp_xp
	mtest	ry
	bmi	.zp_xp_yn
	nop
.zp_xp_yp
	from	rx
	sub	ry
	bcc	.zp_xp_yp_yx
	nop
.zp_xp_yp_xy
	mcall	mdo_project
	nop
	miwt	pc,mdo_outcode
	nop

.zp_xp_yp_yx
	mexg	rx,ry,r0
	mcall	mdo_project
	nop
	mexg	rx,ry,r0
	miwt	pc,mdo_outcode
	nop

.zp_xp_yn
	mneg	ry
	from	rx
	sub	ry
	bcc	.zp_xp_yn_yx
	nop
.zp_xp_yn_xy
	mcall	mdo_project
	nop
	mneg	ry
	miwt	pc,mdo_outcode
	nop

.zp_xp_yn_yx
	mexg	rx,ry,r0
	mcall	mdo_project
	nop
	mexg	rx,ry,r0
	mneg	ry
	miwt	pc,mdo_outcode
	nop


.zp_xn
	mneg	rx
	mtest	ry
	bmi	.zp_xn_yn
	nop
.zp_xn_yp
	from	rx
	sub	ry
	bcc	.zp_xn_yp_yx
	nop
.zp_xn_yp_xy
	mcall	mdo_project
	nop
	mneg	rx
	miwt	pc,mdo_outcode
	nop

.zp_xn_yp_yx
	mexg	rx,ry,r0
	mcall	mdo_project
	nop
	mexg	rx,ry,r0
	mneg	rx
	miwt	pc,mdo_outcode
	nop

.zp_xn_yn
	mneg	ry
	from	rx
	sub	ry
	bcc	.zp_xn_yn_yx
	nop
.zp_xn_yn_xy
	mcall	mdo_project
	nop
	mneg	ry
	mneg	rx
	miwt	pc,mdo_outcode
	nop

.zp_xn_yn_yx
	mexg	rx,ry,r0
	mcall	mdo_project
	nop
	mexg	rx,ry,r0
	mneg	ry
	mneg	rx
	miwt	pc,mdo_outcode
	nop



.zn
	mneg	rz
	ibt	routcode,#$10/4
	mtest	rx
	bmi	.zn_xn
	nop
.zn_xp
	mtest	ry
	bmi	.zn_xp_yn
	nop
.zn_xp_yp
	from	rx
	sub	ry
	bcc	.zn_xp_yp_yx
	nop
.zn_xp_yp_xy
	mcall	mdo_project
	nop
	mneg	rx
	mneg	ry
	miwt	pc,mdo_outcode
	nop

.zn_xp_yp_yx
	mexg	rx,ry,r0
	mcall	mdo_project
	nop
	mexg	rx,ry,r0
	mneg	rx
	mneg	ry
	miwt	pc,mdo_outcode
	nop

.zn_xp_yn
	mneg	ry
	from	rx
	sub	ry
	bcc	.zn_xp_yn_yx
	nop
.zn_xp_yn_xy
	mcall	mdo_project
	nop
	mneg	rx
	miwt	pc,mdo_outcode
	nop

.zn_xp_yn_yx
	mexg	rx,ry,r0
	mcall	mdo_project
	nop
	mexg	rx,ry,r0
	mneg	rx
	miwt	pc,mdo_outcode
	nop


.zn_xn
	mneg	rx
	mtest	ry
	bmi	.zn_xn_yn
	nop
.zn_xn_yp
	from	rx
	sub	ry
	bcc	.zn_xn_yp_yx
	nop
.zn_xn_yp_xy
	mcall	mdo_project
	nop
	mneg	ry
	miwt	pc,mdo_outcode
	nop

.zn_xn_yp_yx
	mexg	rx,ry,r0
	mcall	mdo_project
	nop
	mexg	rx,ry,r0
	mneg	ry
	miwt	pc,mdo_outcode
	nop

.zn_xn_yn
	mneg	ry
	from	rx
	sub	ry
	bcc	.zn_xn_yn_yx
	nop
.zn_xn_yn_xy
	mcall	mdo_project
	nop
	miwt	pc,mdo_outcode
	nop

.zn_xn_yn_yx
	mexg	rx,ry,r0
	mcall	mdo_project
	nop
	mexg	rx,ry,r0

	endc



	ifne	0

; bugged faster version

mprojectzn
	with	rz
	not
	ibt	routcode,#$10/4
	mtest	rx
	bmi	.zn_xn
	inc	rz
.zn_xp
	mtest	ry
	bmi	.zn_xp_yn
	nop
.zn_xp_yp
	from	rx
	sub	ry
	bcc	.zn_xp_yp_yx
	nop
.zn_xp_yp_xy
	mcall	mdo_project
	nop
	miwt	pc,mdo_outcode_nynx
	with	ry

.zn_xp_yp_yx
	mcall	mdo_projectexg
	nop
	mexg	rx,ry,r0
	miwt	pc,mdo_outcode_nynx
	with	ry

.zn_xp_yn
	mneg	ry		; can't optimise this
	from	rx
	sub	ry		; as used here
	bcc	.zn_xp_yn_yx
	nop
.zn_xp_yn_xy
	mcall	mdo_project
	nop
	miwt	pc,mdo_outcode_nx
	with	rx

.zn_xp_yn_yx
	mcall	mdo_projectexg
	nop
	mexg	rx,ry,r0
	miwt	pc,mdo_outcode_nx
	with	rx


.zn_xn
	with	rx
	not
	mtest	ry
	bmi	.zn_xn_yn
	inc	rx
.zn_xn_yp
	from	rx
	sub	ry
	bcc	.zn_xn_yp_yx
	nop
.zn_xn_yp_xy
	mcall	mdo_project
	nop
	with	ry
	not
	miwt	pc,mdo_outcode
	inc	ry

.zn_xn_yp_yx
	mcall	mdo_projectexg
	nop
	mexg	rx,ry,r0
	with	ry
	not
	miwt	pc,mdo_outcode
	inc	ry

.zn_xn_yn
	mneg	ry		; can't optimise this
	from	rx
	sub	ry		; as used here
	bcc	.zn_xn_yn_yx
	nop
.zn_xn_yn_xy
	mcall	mdo_project
	nop
	miwt	pc,mdo_outcode
	nop

.zn_xn_yn_yx
	mcall	mdo_projectexg
	nop
	mexg	rx,ry,r0
	miwt	pc,mdo_outcode
	nop




mprojectpnt
	mpush	r11

	mtest	rz
	mlbmi	mprojectzn
.zp
	bne	.zgt0
	nop
	inc	rz
.zgt0
;	ibt	routcode,#0
	mtest	rx
	with	routcode
	bmi	.zp_xn
;	nop
	sub	routcode
.zp_xp
	mtest	ry
	bmi	.zp_xp_yn
	nop
.zp_xp_yp
	from	rx
	sub	ry
	bcc	.zp_xp_yp_yx
	nop
.zp_xp_yp_xy
	mcall	mdo_project
	nop
	miwt	pc,mdo_outcode
	nop

.zp_xp_yp_yx
	mcall	mdo_projectexg
	nop
	mexg	rx,ry,r0
	miwt	pc,mdo_outcode
	nop

.zp_xp_yn
	mneg	ry		; can't optimise this
	from	rx
	sub	ry		; as used here
	bcc	.zp_xp_yn_yx
	nop
.zp_xp_yn_xy
	mcall	mdo_project
	nop
	with	ry
	not
	miwt	pc,mdo_outcode
	inc	ry

.zp_xp_yn_yx
	mcall	mdo_projectexg
	nop
	mexg	rx,ry,r0
	with	ry
	not
	miwt	pc,mdo_outcode
	inc	ry


.zp_xn
	with	rx
	not
	mtest	ry
	bmi	.zp_xn_yn
	inc	rx
.zp_xn_yp
	from	rx
	sub	ry
	bcc	.zp_xn_yp_yx
	nop
.zp_xn_yp_xy
	mcall	mdo_project
	nop
	bra	mdo_outcode_nx
	with	rx

.zp_xn_yp_yx
	mcall	mdo_projectexg
	nop
	mexg	rx,ry,r0
	bra	mdo_outcode_nx
	with	rx

.zp_xn_yn
	mneg	ry		; can't optimise this
	from	rx
	sub	ry		; as used here
	bcc	.zp_xn_yn_yx
	nop
.zp_xn_yn_xy
	mcall	mdo_project
	nop
	bra	mdo_outcode_nynx
	with	ry

.zp_xn_yn_yx
	mcall	mdo_projectexg
	nop
	mexg	rx,ry,r0
	with	ry


mdo_outcode_nynx
	not
	inc	ry
	with	rx

mdo_outcode_nx
	not
	inc	rx

	endc





; outcode point x,y,z
;
; z is z < 0
; r is x >= xright
; l is x <  xleft
; b is y >= ybot
; t is y <  ytop
;
; outcodebyte = 000zrlbt
;
; outcode = ((outcodebyte XOR 31) << 8) + outcodebyte
;

mdo_outcode
	mcache

	lms	r0,[m_vanishx]		; x += vanishx
	with	rx
	add	r0

	lms	r0,[m_vanishy]	    	; y += vanishy
	with	ry
	add	r0

	lms	r0,[m_xleft]		; if x < xleft then outcode += 1 
	sub	rx
	bge	mdo_outcodeleft
	nop

	lms	r0,[m_xright]		; if x >= xright then outcode += 2
	sub	rx
	bge	mdo_outcodex
	nop
	inc	routcode
mdo_outcodeleft
	inc	routcode
mdo_outcodex

	with	routcode		; shift outcode left 2 bits
	mult	#4

	lms	r0,[m_ytop]		; if y < ytop then outcode += 1
	sub	ry
	bge	mdo_outcodetop
	nop

	lms	r0,[m_ybot]		; if y >= ybot then outcode += 2
	sub	ry
	bge	mdo_outcodey
	nop
	inc	routcode
mdo_outcodetop
	inc	routcode
mdo_outcodey

	ibt	r0,#31			; set high byte of outcode
	xor	routcode		; to low byte of outcode XOR 31
	swap
	or	routcode

	mpop	pc
	nop


; Project point x,y,z
; All unsigned and x>=y
;
; In:	r1 = x
;	r2 = y
;	r3 = z
;
; Out:	r1 = projected x
;	r2 = projected y
;
; Uses: r0,r4,r6


mdo_projectexg
	mexg	rx,ry,r0

mdo_project
	mpush	r11

	from	rx
	lob
	to	r4
	swap	  		; r4 = (x * 256).lo
	from	rx
	hib			; r0 = (x * 256).hi

	cmp	rz	 	; if r0 >= rz then .overflow
	bcs	.overflow
	nop

	move	r6,rz
	mcall	mpdivu3216	; r4 = rx * 256 / rz
	nop

	miwt	r0,16383	; if r4 >= 16384 then .check
	sub	r4
	bcc	.check
	nop

	move	rx,r4

	from	ry
	lob
	to	r4
	swap	  		; r4 = (y * 256).lo
	from	ry
	hib			; r0 = (y * 256).hi

	move	r6,rz
	mcall	mpdivu3216	; ry = ry * 256 / rz
	nop
	move	ry,r4

	mpop	pc
	nop


.check
	move	rx,r4		; rx>16383

	from	ry
	lob
	to	r4
	swap	  		; r4 = (y * 256).lo
	from	ry
	hib			; r0 = (y * 256).hi

	move	r6,rz
	mcall	mpdivu3216
	nop
	move	ry,r4		; ry = ry * 256 / rz

.overflow
	ibt	r4,#0		; r0:r4 = ry * 16383
	from	ry
	lsr
	with	r4
	ror
	lsr
	with	r4
	ror
	with	r4
	sub	ry
	ibt	r6,#0
	sbc	r6

	move	r6,rx		; ry = ry * 16383 / rx
	mcall	mpdivu3216
	nop
	move	ry,r4
	miwt	rx,16383	; rx = 16383		      	

	mpop	pc
	nop




;************************************************


; Approx. unsigned 32 bit by 16 bit divide
; with 16 bit quotient
;
; In:	r0 = dividend.h
;	r4 = dividend.l
;	r6 = divisor
; Out:	r0 = remainder
;	r4 = quotient
;	r6 = divisor
; Uses:	r12,r13
; Cycles:	150-171
; Bytes:	39

mpdivu3216  			; NB this is not accurate!
	mtest	r0
	bmi	mpdivu3216m	; if divisor > $7fff 
	nop
	mtest	rdivisor
	bpl	mpdivu3115	; or dividend > $7fffffff
	nop
mpdivu3216m	  		; then halve divisor and dividend
	with	rdivisor
	lsr
	lsr
	with	rdividendlo
	ror


;************************************************

; Unsigned 31 bit by 15 bit divide
; with 16 bit quotient and 15 bit remainder
;
; In:	r0 = dividend.h
;	r4 = dividend.l
;	r6 = divisor
; Out:	r0 = remainder
;	r4 = quotient
;	r6 = divisor
; Uses:	r12,r13
; Cycles:	137-153
; Bytes:	24


mpdivu3115
	ibt	r12,#16		; 2
	with	rdividendlo	; 1	asl32	r0,rdividendlo 
	add	rdividendlo	; 1
	rol			; 1
	move	r13,pc		; 2 = 7

mpdivu3115loop
	sub	rdivisor	; 1
	bcc	mpdivu3115cc	; 2
	nop			; 1
	with	rdividendlo	; 1
	rol		        ; 1
	loop		        ; 1
	rol			; 1 = 8

	jmp	r11		; 1
	lsr			; 1

mpdivu3115cc
	add	rdivisor	; 1
	with	rdividendlo	; 1
	add	rdividendlo	; 1
	loop			; 1
	rol			; 1 = 9

	jmp	r11
	lsr


;************************************************

rx	equr	1
ry	equr	2
;rscale	equr	4
rz	equr	3
rrotptr	equr	7
rprojptr	equr	8
rbigx	equr	9
rbigy	equr	9
rbigz	equr	9


mprojectpntlist
	mpush	r11

	sms	[m_cnt],r0
	sub	r0
	sms	[m_or_of_outcodes],r0
.projloop
	mldwi	rrotptr	; x
	lms	rbigx,[m_bigx]
	to	rx
	add	rbigx

	mldwi	rrotptr	; y
	lms	rbigy,[m_bigy]
	to	ry
	add	rbigy

	mldwi	rrotptr	; z
	lms	rbigz,[m_bigz]
	to	rz
	add	rbigz

	mcall	mprojectpnt
	nop

	from	rx
	mstwi	rprojptr	; x
	from	ry
	mstwi	rprojptr	; y
	mstwi	rprojptr	; outcode

	lms	rz,[m_or_of_outcodes]
	or	rz
	sbk

	lms	r0,[m_cnt]
	dec	r0
	bne	.projloop
	sbk

	mpop	pc
	nop


;	printf	*-mdo_outcode," mprojectpnt cache %n"


;************************************************

	ifne	0

rmatx	equr	1
rmaty	equr	2
rmatz	equr	3
rcosx	equr	4
rsinx	equr	5
rcosy	equr	6
rsiny	equr	7
rcosz	equr	8
rmatptr	equr	9
rsinz	equr	3
rt1	equr	1
rt2	equr	2
rt3	equr	12
rt4	equr	13

; t1= cz*sy 		 yz
; t2= cz*cy 		 yz
; t3= sz*sy		 yz
; t4= sz*cy		 yz
; m11= t3*sx + t2	xyz
; m12= t1*sx - t4	xyz
;>m13= cx*sy		xy
; m21= cx*sz		x z
; m22= cx*cz		x z
;>m23= -sx		x
; m31= t4*sx - t1	xyz
; m32= t2*sx + t3	xyz
;>m33= cx*cy		xy


mcrotmatzxy8
;	?mcrotmatzxy8-mdo_outcode
;	?mcrotmatzxy8-mprojectstart

;	mpush	r11
;	sms	[m_sp],rsp

	miwt	rt1,costab
	from	rt1
	to	r14
	add	rmatx
	to	rcosx
	getb

	from	rt1
	to	r14
	add	rmaty
	to	rcosy
	getb

	from	rt1
	to	r14
	add	rmatz
	to	rcosz
	getb

	miwt	rt1,sintab
	from	rt1
	to	r14
	add	rmatx
	to	rsinx
	getb

	from	rt1
	to	r14
	add	rmaty
	to	rsiny
	getb

	from	rt1
	to	r14
	add	rmatz
	to	rsinz
	getb

; calc temps
; t1= cz*sy 		 yz
; t2= cz*cy 		 yz
; t3= sz*sy		 yz
; t4= sz*cy		 yz

	from	rcosz
	mult	rsiny
	to	rt1
	add	r0

	from	rcosz
	mult	rcosy
	to	rt2
	add	r0

	from	rsinz
	mult	rsiny
	to	rt3
	add	r0

	from	rsinz
	mult	rcosy
	to	rt4
	add	r0

; m11= t3*sx + t2	xyz
; m12= t1*sx - t4	xyz
;>m13= cx*sy		xy

	from	rt3
	hib
	mult	rsinx
	add	r0
	add	rt2
	hib
	mstbi	rmatptr	; mat11

	from	rt1
	hib
	mult	rsinx
	add	r0
	sub	rt4
	hib
	mstbi	rmatptr	; mat12

	from	rsiny
	mult	rcosx
	add	r0
	hib
	mstbi	rmatptr	; mat13

; m21= cx*sz		x z
; m22= cx*cz		x z
;>m23= -sx		x

	from	rcosx
	mult	rsinz
	add	r0
	hib
	mstbi	rmatptr	; mat21

	from	rcosx
	mult	rcosz
	add	r0
	hib
	mstbi	rmatptr	; mat22

	from	rsinx
	not
	inc	r0
	mstbi	rmatptr	; mat23

; m31= t4*sx - t1	xyz
; m32= t2*sx + t3	xyz
;>m33= cx*cy		xy

	from	rt4
	hib
	mult	rsinx
	add	r0
	sub	rt1
	hib
	mstbi	rmatptr	; mat31

	from	rt2
	hib
	mult	rsinx
	add	r0
	add	rt3
	hib
	mstbi	rmatptr	; mat32

	from	rcosy
	mult	rcosx
	add	r0
	hib
	stb	[rmatptr]	; mat33

;	lms	rsp,[m_sp]
;	mpop	pc

	jmp	r11
	nop



;************************************************

; transpose matrix

mtransmat8
	miwt	r2,m_rmat1211+1
	miwt	r3,m_rmat2113+1
	ldb	[r3]
	to	r1
	ldb	[r2]
	from	r1
	stb	[r3]
	stb	[r2]

	miwt	r2,m_rmat2113
	miwt	r3,m_rmat3231
	ldb	[r3]
	to	r1
	ldb	[r2]
	from	r1
	stb	[r3]
	stb	[r2]

	miwt	r2,m_rmat2322+1
	miwt	r3,m_rmat3231+1
	ldb	[r3]
	to	r1
	ldb	[r2]
	from	r1
	stb	[r3]
	stb	[r2]

	jmp	r11
	nop

	endc



; transpose matrix

;11
;12 21
;13 31
;21
;22
;23 32
;31
;32
;33

;+2  2 l1,12
;+2  4 l2,13
;+2  6 l3,21 s1,12
;-4  2 s3,21
;+8 10 l1

mtransmat16
	inc	r9
	inc	r9
	to	r1
	mldwi	r9	; r1 = mat12
	to	r2
	mldwi	r9	; r2 = mat13
	to	r3
	ldw	[r9]	; r3 = mat21

	from	r1
	stw	[r9]	; mat21 = r1
	with	r9
	sub	#4
	from	r3
	stw	[r9]	; mat12 = r3
	with	r9
	add	#8

	to	r1
	mldwi	r9	; r1 = mat23
	to	r3
	ldw	[r9]	; r3 = mat31

	from	r2
	mstwi	r9	; mat31 = r2
	to	r2
	ldw	[r9]	; r2 = mat32
	from	r1
	stw	[r9]	; mat32 = r1
	with	r9
	sub	#4

	from	r2
	stw	[r9]	; mat23 = r2
	with	r9
	sub	#6
	from	r3
	stw	[r9]	; mat13 = r3

	jmp	r11
	nop

;****************************************************

	ifne	0

; multiply matrices

rx	equr	1
ry	equr	2
rz	equr	3
rt	equr	4
rwmat1211	equr	5
rwmat2113	equr	6
rwmat2322	equr	7
rwmat3231	equr	8
rwmat0033	equr	12
routptr 	equr	9


mrmatmult8
	lms	rx,[m_rmat1211]
	from	rx
	to	ry
	hib
	lms	rz,[m_rmat2113]

	mwmatrotp

	lms	r0,[m_rmat2113]
	to	rx
	hib
	lms	ry,[m_rmat2322]
	from	ry
	to	rz
	hib

	mwmatrotp

	lms	rx,[m_rmat3231]
	from	rx
	to	ry
	hib
	lms	rz,[m_rmat0033]

	mwmatrotp

	jmp	r11
	nop

	endc

;****************************************************

rx	equr	1
ry	equr	2
rz	equr	3

mrmatmult16
	lms	rx,[m_rmat11]
	lms	ry,[m_rmat12]
	lms	rz,[m_rmat13]

;	mwmatrotp16

	mdotprod16mq	m_wmat11,m_wmat21,m_wmat31
	mstwi	r9
	mdotprod16mq	m_wmat12,m_wmat22,m_wmat32
	mstwi	r9
	mdotprod16mq	m_wmat13,m_wmat23,m_wmat33
	mstwi	r9


	lms	rx,[m_rmat21]
	lms	ry,[m_rmat22]
	lms	rz,[m_rmat23]

;	mwmatrotp16

	mdotprod16mq	m_wmat11,m_wmat21,m_wmat31
	mstwi	r9
	mdotprod16mq	m_wmat12,m_wmat22,m_wmat32
	mstwi	r9
	mdotprod16mq	m_wmat13,m_wmat23,m_wmat33
	mstwi	r9


	lms	rx,[m_rmat31]
	lms	ry,[m_rmat32]
	lms	rz,[m_rmat33]

;	mwmatrotp16

	mdotprod16mq	m_wmat11,m_wmat21,m_wmat31
	mstwi	r9
	mdotprod16mq	m_wmat12,m_wmat22,m_wmat32
	mstwi	r9
	mdotprod16mq	m_wmat13,m_wmat23,m_wmat33
	stw	[r9]

	jmp	r11
	nop


;****************************************************


	ifne	1

; Y rotate 16 bit x,z pos by 8 bit angle
;
; In:	rx = x pos
;	rz = z pos
;	ryrot = y rot angle
;
; Out:	rx = y rotated x pos
;	rz = y rotated x pos
;
; Dead: r0-r9

rx	equr	1
ryrot	equr	2
rt	equr	2
rz	equr	3
rcosy	equr	5
rprodlo	equr 7
rprodhi	equr 8
rsiny	equr	9

mrotpnty
	mpush	r11
	
	miwt	r0,costab
	to	r14
	add	ryrot
	getb
	to	rcosy
	swap

	miwt	r0,sintab
	to	r14
	add	ryrot
	getb
	to	rsiny
	swap

	move	r6,rx
	from	rsiny
	to	rprodhi
	lmult
	move	rprodlo,r4

	move	r6,rz
	from	rcosy
	lmult
	with	rprodlo
	add	r4
	adc	rprodhi
	to	rt
	asr

	move	r6,rz
	from	rsiny
	to	rprodhi
	lmult
	move	rprodlo,r4

	move	r6,rx
	from	rcosy
	lmult
	with	rprodlo
	sub	r4
	sbc	rprodhi
	to	rz
	asr

	move	rx,rt

	mpop	pc
	nop
;	jmp	r11
;	nop
	
	endc






	ifne	0

; create y rot matrix

mcrotmaty
	lms	r0,[m_roty]
	to	rmaty
	lob
	
	miwt	rmat1211,$0000
	miwt	rmat2113,$0000
	miwt	rmat2322,$007f
	miwt	rmat3231,$0000
	miwt	rmat0033,$0000

	miwt	r0,costab
	to	r14
	add	rmaty
	getb
	move	rmat0033,r0
	move	rmat1211,r0

	miwt	r0,sintab
	to	r14
	add	rmaty
	getb
	move	rmat2113,r0
	not
	inc	r0
	lob
	move	rmat3231,r0

	endc


	ifne	0

; create xy rot matrix

rcosx	equr	4
rsinx	equr	5
rcosy	equr	6
rsiny	equr	7
rmatptr	equr	10

	miwt	rmatptr,m_rmat1211

mcrotmatxy
	lms	r0,[m_rotx]
	not
	inc	r0
	to	rmatx
	lob

	lms	r0,[m_roty]
	not
	inc	r0
	to	rmaty
	lob

	miwt	r3,costab
	from	r3
	to	r14
	add	rmatx
	to	rcosx
	getb

	from	r3
	to	r14
	add	rmaty
	to	rcosy
	getb

	miwt	r3,sintab
	from	r3
	to	r14
	add	rmatx
	to	rsinx
	getb

	from	r3
	to	r14
	add	rmaty
	to	rsiny
	getb


	from	rcosy
	stb	[rmatptr]	; mat11
	inc	rmatptr

	from	rsiny
	mult	rsinx
	add	r0
	hib
	stb	[rmatptr]	; mat12
	inc	rmatptr

	from	rsiny
	mult	rcosx
	add	r0
	hib
	stb	[rmatptr]	; mat13
	inc	rmatptr

	ibt	r0,#0
	stb	[rmatptr]	; mat21
	inc	rmatptr

	from	rcosx
	stb	[rmatptr]	; mat22
	inc	rmatptr

	from	rsinx
	not
	inc	r0
	stb	[rmatptr]	; mat23
	inc	rmatptr

	from	rsiny
	not
	inc	r0
	stb	[rmatptr]	; mat31
	inc	rmatptr

	from	rcosy
	mult	rsinx
	add	r0
	hib
	stb	[rmatptr]	; mat32
	inc	rmatptr

	from	rcosy
	mult	rcosx
	add	r0
	hib
	stb	[rmatptr]	; mat33

	endc



	ifne	0

; SHAPE FORMAT


;****************************

pointsb

	db	mval_pointsb
	db	num_pts

	rept	num_pts
	db	xn,yn,zn
	endr

;****************************

pointsw

	db	mval_pointsw
	db	num_pts

	rept	num_pts
	dw	xn,yn,zn
	endr

;****************************

pointswx

	db	mval_pointsw
	db	num_pts

	rept	num_pts
	dw	xn,yn,zn
	endr

;****************************

frames

	db	mval_frames
	db	maxframes

	rept	maxframes
	dw	rel_offset_n
	endr

;****************************

jump

	db	mval_jump
	dw	rel_offset

;****************************

endpoints

	db	mval_endpoints

;****************************

groups

	db	mval_groups
	db	num_groups

	rept	num_groups
	db	point_offset_n
	endr

	rept	num_groups
	dw	rel_offset_n
	endr

;****************************

face
	db	num_pts
	db	colour
	db	normal
	rept	num_pts
	db	point_offset_n
	endr

;****************************
	
faces

	db	mval_faces
	db	num_faces

	rept	num_faces
	db	num_pts
	db	colour
	db	normal
	rept	num_pts
	db	point_offset_n
	endr
	endr

;****************************

line
	db	colour
	db	point_offset_1
	db	point_offset_2

;****************************

lines
	db	mval_lines
	db	num_lines

	rept	num_lines
	db	colour
	db	point_offset_1
	db	point_offset_2
	endr

;****************************

quit

	db	mval_quit

;****************************

sphere
	db	point_offset_n
	db	colour
	dw	radius_n

;****************************

spheres

	db	mval_spheres
	db	num_spheres

	rept	num_spheres
	db	point_offset_n
	db	colour
	dw	radius_n
	endr

;****************************


vizis
	db	mval_vsbs
	db	num_vsbs

	rept	num_vsbs
	db	point_offset_n_1
	db	point_offset_n_2
	db	point_offset_n_3
	db	normal_x
	db	normal_y
	db	normal_z
	endr

;****************************

bspvsb
	db	mval_bspnode
	db	vsb_offset
	db	left_offset
	db	right_offset

	db	node_offset
	db	continue_offset

;****************************

outword
	db	mval_outword
	dw	addr

;****************************

colours

	db	mval_colours
	db	num_colours

	rept	num_colours
	dw	colour_n
	endr



bit 15		1 = texture mapped
bit 14		1 = light sourced 
bit 13		unused
bits 8..12	0..31 light source colour table
bits 4..7	0..15 colour2
bits 0..3	0..15 colour1

;****************************

normals

	db	mval_normals
	db	num_normals

	rept	num_normals
	db	nx_n,ny_n,nz_n
	endr

;****************************






	bsp	f1,n1
	addlist	f1_rest
	quit
n1
	bsp	f2,n2
	quit
n2
	addlist	f3
	quit


f1
	f3	1,0,0,0,1,2,3
f1_rest
	f3	1,0,0,0,1,2,3
	f3	1,0,0,0,1,2,3
	f3	1,0,0,0,1,2,3
	f3	1,0,0,0,1,2,3
f2
	f3	2,0,0,0,1,2,3
f3
	f3	3,0,0,0,1,2,3

	endc









