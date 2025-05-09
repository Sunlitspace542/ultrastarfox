
shnumfaces	=	0

;Shape header structure --  --  --  --  --  --

	structure	0
	struct	sh_points,2
	struct	sh_bank,1
	struct	sh_faces,2
;	struct	sh_type,1
	struct	sh_sortz,2
;	struct	sh_height,2
;	struct	sh_view_y,2
	struct	sh_shift,1
	struct	sh_radius,2
	struct	sh_xmax,2
	struct	sh_ymax,2
	struct	sh_zmax,2
	struct	sh_size,2
	struct	sh_col_ptr,2
	struct	sh_shadow,2
	IFEQ	NOLODS
	struct	sh_simple1,2
	struct	sh_simple2,2
	struct	sh_simple3,2
	ENDC	;NOLODS
	struct	sh_name,0
	struct	sh_header_size,0

;Shape header macro -- -- --

no_of_shapes	=	0

	IFEQ	1

oShapeHdr	macro ;pptr,?,fptr,num,radcol,hgt,vy,shift,rad,xm,ym,zm,size,cptr,Name

no_of_shapes	=	no_of_shapes+1
.thisshape\@
;	dw	(\1)&$ffff	;sh_points,2
	dw	petecube_p&$ffff
;	db	(\1)>>16	;sh_Bank,2
	db	petecube_p>>16
;	dw	(\3)&$ffff	;sh_faces,2
	dw	petecube_f&$ffff
	db	\4	;sh_type,1
	dw	(\5)<<(\8)	;sh_sortz,2
	dw	(\6)<<(\8)	;sh_height,2
	dw	(\7)<<(\8)	;sh_view_y,2
	db	\8	;sh_shift,1
	dw	(\9)&WM	;sh_radius,2
	dw	(\A)<<(\8)	;sh_xmax,2
	dw	(\B)<<(\8)	;sh_ymax,2
	dw	(\C)<<(\8)	;sh_zmax,2
	dw	(\D)<<(\8)	;sh_size,2
	dw	(\E)&$ffff	;sh_col_ptr,2
	IFC	"\F","0"
	dw	.thisshape\@&WM
	ELSEIF
	dw	(\F)&$ffff	;sh_shadow,2
	ENDC

	IFC	"\G","0"
	dw	.thisshape\@&WM
	ELSEIF
	dw	(\G)&$FFFF	;sh_simple1,2
	ENDC

	IFC	"\H","0"
	dw	.thisshape\@&WM
	ELSEIF
	dw	(\H)&$FFFF	;sh_simple2,2
	ENDC

	IFC	"\I","0"
	dw	.thisshape\@&WM
	ELSEIF
	dw	(\I)&$FFFF	;sh_simple3,2
	ENDC

	db	"\J",0		;sh_name,0
	endm

	ENDC

chk1dig	macro
	run	"char = '","[1]\1","'%n"

err	=	1
	ifge	char-'A'
	ifle	char-'z'
err	=	0
	endc
	endc

	ifc	"\1","0"
err	=	0
	endc

	ifne	err
	printf	"%01%31Error: Shape %phas a funny collision box%n%00"
	error+
	endc

;;	printf	"\1:%xchar %n"

	endm


ShapeHdr	macro ;pptr,?,fptr,num,radcol,hgt,vy,shift,rad,xm,ym,zm,size,cptr,Name

	IFEQ	*-$c964
	printf	"%p%n"
	ENDC


	IFND	hdrpublics

	run	' public %p'

	IFNC	'0','\1'
	IFND	t_\1
	EXTERN	\1
t_\1	equ	0
	ENDC
	IFND	ta_\3
	EXTERN	\3
ta_\3	equ	0
	ENDC
	ENDC

no_of_shapes	=	no_of_shapes+1

.thisshape\@
	dw	(\1)&$ffff	;sh_points,2
	db	(\1)>>16	;sh_Bank,2
	dw	(\3)&$ffff	;sh_faces,2
;	db	\4	;sh_type,1
	dw	(\5)<<(\8)	;sh_sortz,2
;	dw	(\6)<<(\8)	;sh_height,2
;	dw	(\7)<<(\8)	;sh_view_y,2
	db	\8	;sh_shift,1
	dw	(\9)&WM	;sh_radius,2
	chk1dig	\9
;	printf	"%ncolision box = \9 : %$6,%l."
	dw	(\A)<<(\8)	;sh_xmax,2
	dw	(\B)<<(\8)	;sh_ymax,2
	dw	(\C)<<(\8)	;sh_zmax,2
	dw	(\D)<<(\8)	;sh_size,2
	dw	(\E)&$ffff	;sh_col_ptr,2

	IFC	"\F","0"
	dw	.thisshape\@&WM
	ELSEIF
	dw	(\F)&$ffff	;sh_shadow,2
	ENDC

	IFEQ	NOLODS
	IFC	"\G","0"
	dw	.thisshape\@&WM
	ELSEIF
	dw	(\G)&$FFFF	;sh_simple1,2
	ENDC

	IFC	"\H","0"
	dw	.thisshape\@&WM
	ELSEIF
	dw	(\H)&$FFFF	;sh_simple2,2
	ENDC

	IFC	"\I","0"
	dw	.thisshape\@&WM
	ELSEIF
	dw	(\I)&$FFFF	;sh_simple3,2
	ENDC
	ENDC	;NOLODS

	IFNE	debuginfo
	db	"\J"
	dw	0	;sh_name
	run	"%tdefshapename%t%p"
	ENDC

	IFNE	MAKE_SHAPE_REPORT

	FOPEN	+shapes.tmp
	printf	"%tprintf%t%q%%n%q,%q[28,*]%q,%q  %q,%q[16]%p%q,%q  %q,%q[31,*]%q,%q%%n%q%n"
	printf	"%tprintf%t%qCOLOUR TABLE:  %q,%q[20]\E%q,%q%%n%q%n"
	printf	"%tprintf%t%qSIZE/COLBOX:- XMAX: %q,[4](\A)<<(\8),%q, YMAX: %q,[4](\B)<<(\8),%q, ZMAX: %q,[4](\C)<<(\8),%q, CBOX: %q,%q[10]\9%q,%q%%n%q%n"
	printf	"%tprintf%t%qSIMPLE SHAPES: (1/2/3/shadow)  %q,%q[11] \G%q,%q[11] \H%q,%q[11] \I%q,%q%%n%q%n"

	printf	"%tIFD%tlen_\1%n"
	printf	"%tprintf%t%qMEMORY USAGE: %q,len_\1,%q%%n%q%n"
	printf	"%tELSEIF%n"
	printf	"%tprintf%t%qMEMORY USAGE: --UNAVAILABLE--%%n%q%n"
	printf	"%tENDC%n"

	printf	"%tprintf%t%q[79,*]%q,%q%%n%%n%q%n"
	FCLOSE
	ENDC


	ELSEIF
	IFNC	'0','\1'
	IFND	t_\1
	PUBLIC	\1
t_\1	equ	0
	ENDC
	IFND	ta_\3
	PUBLIC	\3
ta_\3	equ	0
	ENDC
	ENDC
	ENDC

	endm

defshapename	macro
;	db	0
;	run	" db '","[1]\1","',0"		;sh_name,0
	endm

	IFEQ	MAKE_SHAPE_REPORT
datahdr	macro
	endm

endshape	macro
	db	0	;mval_endshape
	endm

	ELSEIF
datahdr	macro
	defs	$1,"%p"
tmpaddr	=	*
	endm

endshape	macro
	db	0	;mval_endshape
	IFNE	tmpaddr+1
len_\$1	equ	*-tmpaddr
tmpaddr	=	-1
	ENDC
	endm
tmpaddr	=	-1
	ENDC





oShapeHdr_s	macro ;pptr,?,fptr
no_of_shapes	=	no_of_shapes+1
.thisshape\@
	dw	(petecube_p)&$ffff	;sh_points,2
	db	(petecube_p)>>16	;sh_Bank,2
	dw	(petecube_f)&$ffff	;sh_faces,2
	endm

ShapeHdr_s	macro ;pptr,?,fptr

	IFND	hdrpublics

	run	' public %p'

no_of_shapes	=	no_of_shapes+1
	IFNC	'0','\1'
	IFND	t_\1
	EXTERN	\1
t_\1	equ	0
	ENDC
	IFND	ta_\3
	EXTERN	\3
ta_\3	equ	0
	ENDC
	ENDC
.thisshape\@
	dw	(\1)&$ffff	;sh_points,2
	db	(\1)>>16	;sh_Bank,2
	dw	(\3)&$ffff	;sh_faces,2

	ELSEIF
	IFNC	'0','\1'
	IFND	t_\1
	PUBLIC	\1
t_\1	equ	0
	ENDC
	IFND	ta_\3
	PUBLIC	\3
ta_\3	equ	0
	ENDC
	ENDC
	ENDC
	endm


;colbox list macro -- -- -- -- -- -- -- -- --

colframes	MACRO	; amount of frames
colframecount	=	\1
	ENDM

;colbox header -- -- -- -- -- -- -- -- -- -- --
	structure	0
	struct	cb_next,2
	struct	cb_frame,1
	struct	cb_xoff,2
	struct	cb_yoff,2
	struct	cb_zoff,2
	struct	cb_rotz,1
	struct	cb_xmax,2
	struct	cb_ymax,2
	struct	cb_zmax,2
	struct	cb_flagset,1
	struct	cb_flagclr,1
	struct	cb_sizeof,0

;colbox macro -- -- -- -- -- -- -- -- -- -- --

colframecount	=	0

colbox	MACRO ; next,xoff,yoff,zoff,rot[x/y/z]|norot,xmax,ymax,zmax,flags to set,flags to clear[,scale]

	IFEQ	NARG-11
cs	=	\b
cf	=	\b
	ELSEIF
cs	=	0
cf	=	0
	ENDC

	chk1dig	\1
	dw	(\1)&WM
	db	colframecount

	IFEQ	cbf_\5
	dw	(\2)<<cs,(\3)<<cs,(\4)<<cs
	ENDC
	IFEQ	cbf_\5-cbf_rotz
	dw	\2,\3,(\4)<<cs
	ENDC
	IFEQ	cbf_\5-cbf_roty
	dw	\2,(\3)<<cs,\4
	ENDC
	IFEQ	cbf_\5-cbf_rotx
	dw	(\2)<<cs,\3,\4
	ENDC

	db	cbf_\5!cf

	dw	(\6)<<cs,(\7)<<cs,(\8)<<cs
	db	\9,(\a)^255

colframecount	=	0
	ENDM


cbf_norot	equ	0
cbf_rotz	equ	1<<4
cbf_roty	equ	1<<5
cbf_rotx	equ	1<<6
cbf_rotxyz	equ	1<<7

cbf_scale	equ	15



;************************************************

;
; SHAPE DATA
;


	ifne	0

pointsb	macro
	db	4	;mval_rotpoints8
	db	\1
	endm

pointsw	macro
	db	8	;mval_rotpoints16
	db	\1
	endm

pointsxb	macro
	db	56	;mval_rotpointsx8
	db	\1
	endm

pointsxw	macro
	db	52	;mval_rotpointsx16
	db	\1
	endm

vnormals	macro
	db	76	;mval_vnormals
	db	\1
	endm

vn	macro
	db	-(\1),-(\2),-(\3)
	endm

endpoints	macro
	db	12	;mval_endpoints	
	endm

jump	macro
	db	32	;mval_jump
	dw	\1-*-1
	endm

frames	macro
	db	28	;mval_frames
	db	\1
	endm

pb	macro
	db	\1,\2,\3
	endm

pbd2	macro
	db	(\1)/2,(\2)/2,(\3)/2
	endm

pw	macro
	dw	\1,\2,\3
	endm

jumptab	macro
	dw	\1-*-1
	endm

groups	macro
	db	16	;mval_groups
	db	\1
	endm

faces	macro
	db	20	;mval_faces
	endm

fendq	macro
	db	-1	; end of faces and quit
	endm

fend	macro
	db	-2	; end of faces and continue
	endm

endshape	macro
	db	0	;mval_endshape
	endm

quit	macro
	db	72	;mval_quit
	endm

bspinit	macro
	db	60	;mval_bspinit
	endm

bspend	macro
	db	64	;mval_bspend
	endm

bspe	macro
	db	68	;mval_bspe
	dw	\1-*-1
	endm

bsp	macro
	db	40	;mval_bsp
	dw	\1-*-1
	db	\2-*	;-1
	endm

bspnull	macro
	db	40	;mval_bsp
	dw	\1-*-1
	db	0	;-1
	endm



;************************************************


; colour word macros


colanim	macro	; \1 is label of anim table
	dw	(1<<15)!((\1-*-1)&$3fff)
	endm

collite	macro	; \1 = light source number, \2 is normal colour byte
	dw	(\1<<8)+\2
	endm

coltext	macro	; \1 = texturemap number, \2 is texture xy number
	ifeq	NARG-2
	dw	(1<<14)+(\2<<8)+\1
	mexit
	endc
	ifeq	NARG-1
	dw	(1<<14)+\1
	mexit
	endc
	error	<coltext macro: wrong args>
	endm

colnorm	macro	; \1 = normal colour byte
	ifeq	NARG-2
	dw	(63<<8)+(\2<<4)+\1
	mexit
	endc
	ifeq	NARG-1
	dw	(63<<8)+(\1<<4)+\1
	mexit
	endc
	error	<colnorm macro: wrong args>
	endm


coldepth	macro	; \1 = depth colour
	dw	(62<<8)+\1
	endm

colsmooth	macro	; \1 = light source number, \2 is normal colour byte
	dw	(3<<14)+(\1<<8)+\2
	endm

	endc


	ifne	1

pointsb	macro
	db	4	;mval_rotpoints8
	db	\1
	endm

pointsw	macro
	db	8	;mval_rotpoints16
	db	\1
	endm

pointsxb	macro
	db	56	;mval_rotpointsx8
	db	\1
	endm

pointsxw	macro
	db	52	;mval_rotpointsx16
	db	\1
	endm

vnormals	macro
	db	76	;mval_vnormals
	db	\1
	endm

vn	macro
	db	(\1),(\2),-(\3)
	endm

endpoints	macro
	db	12	;mval_endpoints	
	endm

jump	macro
	db	32	;mval_jump
	dw	\1-*-1
	endm

frames	macro
	db	28	;mval_frames
	db	\1
	endm

	IFEQ	randverts1
	IFEQ	randverts2
pb	macro
	db	\1,\2,\3
	endm
	ENDC
	ENDC
	
	IFNE	randverts1
pb	macro
rndval =	(rndval*91+$61d7)&randvertandbit
	db	(\1)+rndval
rndval =	(rndval*91+$61d7)&randvertandbit
	db	(\2)+rndval
rndval =	(rndval*91+$61d7)&randvertandbit
	db	(\3)+rndval
	endm
	ENDC
	
	IFNE	randverts2
	IFEQ	randverts1
pb	macro
	rndbyte
	rndbyte
	rndbyte
	ENDM
	ENDC
	ENDC

pbd2	macro
	db	(\1)/2,(\2)/2,(\3)/2
	endm

pby2	macro
	db	\1,(\2)*2,\3
	endm

	IFEQ	randverts1
	IFEQ	randverts2
pw	macro
	dw	\1,\2,\3
	endm
	ENDC
	ENDC
	
	IFNE	randverts1
pw	macro
rndval =	(rndval*91+$61d7)&randvertandbit
	dw	(\1)+rndval
rndval =	(rndval*91+$61d7)&randvertandbit
	dw	(\2)+rndval
rndval =	(rndval*91+$61d7)&randvertandbit
	dw	(\3)+rndval
	endm
	ENDC

	IFNE	randverts2
	IFEQ	randverts1
pw	macro
	rndword
	rndword
	rndword
	ENDM
	ENDC
	ENDC

jumptab	macro
	dw	\1-*-1
	endm

groups	macro
	db	16	;mval_groups
	db	\1
	endm

faces	macro
	db	20	;mval_faces
	endm

fendq	macro
	db	-1	; end of faces and quit
	endm

fend	macro
	db	-2	; end of faces and continue
	endm

;endshape	macro
;	db	0	;mval_endshape
;	endm

quit	macro
	db	72	;mval_quit
	endm

bspinit	macro
	db	60	;mval_bspinit
	endm

bspend	macro
	db	64	;mval_bspend
	endm

bspe	macro
	db	68	;mval_bspe
	dw	\1-*-1
	endm

obsp	macro
	db	40	;mval_bsp
	dw	\1-*-1
	db	\2-*	;-1
	endm

bsp	macro
	db	40	;mval_bsp
	db	\1
	dw	\2-*-1
	db	\3-*	;-1
	endm

obspnull	macro
	db	40	;mval_bsp
	dw	\1-*-1
	db	0	;-1
	endm

bspnull	macro
	db	40	;mval_bsp
	db	\1
	dw	\2-*-1
	db	0	;-1
	endm

vizis	macro
	db	48	;mval_vizis
	db	\1
	endm

;viz	macro
;	db	\1,\2,\3,\4,\5,\6
;	endm

viz	macro
	db	\1,\2,\3		; pete 8/12/92
	endm

s_sprite	macro
	db	80
	db	\1,\2,\3
	endm

s_spritevis	macro
	db	84
	db	\1,\2,\3,\4
	endm


;************************************************


; colour word macros


colanim	macro	; \1 is label of anim table
	dw	(1<<15)+((\1)&$3fff)
	endm

collite	macro	; \1 = light source number, \2 is normal colour byte
	dw	(\1<<8)+\2
	endm

coltext	macro	; \1 = texturemap number, \2 is texture xy number
	ifeq	NARG-2
	dw	(1<<14)+(\2<<8)+\1
	mexit
	endc
	ifeq	NARG-1
	dw	(1<<14)+\1
	mexit
	endc
	error	<coltext macro: wrong args>
	endm

colnorm	macro	; \1 = normal colour byte
	ifeq	NARG-2
	dw	(63<<8)+(\2<<4)+\1
	mexit
	endc
	ifeq	NARG-1
	dw	(63<<8)+(\1<<4)+\1
	mexit
	endc
	error	<colnorm macro: wrong args>
	endm


coldepth	macro	; \1 = depth colour
	dw	(62<<8)+\1
	endm

colsmooth	macro	; \1 = light source number, \2 is normal colour byte
	dw	(3<<14)+(\1<<8)+\2
	endm

	endc

;************************************************



	ifeq	1

; grid shape

gridp    


pxs	=	32
pys	=	32
pxn	=	12
pyn	=	12

	pointsw	pxn*pyn

pyp	=	-pys*(pyn-1)/2

	rept	pyn

pxp	=	-pxs*(pxn-1)/2

	rept	pxn
	dw	pxp,pyp,0
pxp	=	pxp+pxs
	endr

pyp	=	pyp+pys
	endr

	endpoints

en	equ	127

gridf    
	groups	1
	db	0
	dw	gridf1

gridf1
	faces	(pxn-1)*(pyn-1)

boxes	macro

pntn	=	0

	rept	\2
	rept	\1
	f4rc en,0,0,pntn,pntn+1,pntn+\1+2,pntn+\1+1,boxc|(boxc<<4)
pntn	=	pntn+1
boxc	=	(boxc&15)+1
	endr
pntn	=	pntn+1
	endr

	endm

boxc	=	1
	boxes	pxn-1,pyn-1

 	fendq

	endshape

	endc


;************************************************

	ifne	0

face2	macro
	db	2,\1,\3,\4,-(\5),\6,\7
	endm
face3	macro
	db	3,\1,\3,\4,-(\5),\6,\7,\8
	endm
face4	macro
	db	4,\1,\3,\4,-(\5),\6,\7,\8,\9
	endm
face5	macro
	db	5,\1,\3,\4,-(\5),\6,\7,\8,\9,\A
	endm
face6	macro
	db	6,\1,\3,\4,-(\5),\6,\7,\8,\9,\A,\B
	endm
face7	macro
	db	7,\1,\3,\4,-(\5),\6,\7,\8,\9,\A,\B,\C
	endm
face8	macro
	db	8,\1,\3,\4,-(\5),\6,\7,\8,\9,\A,\B,\C,\D
	endm


face12	macro
	db	12,\1,\3,\4,-(\5),\6,\7,\8,\9,\A,\B,\C,\D,\E,\F,\G,\H
	endm

endface	macro
	fendq
	endm

	endc

	ifne	1

face2	macro
	db	2,\2,\1,\3,\4,-(\5),\6,\7
shnumfaces	=	shnumfaces+1
	endm
face3	macro
	db	3,\2,\1,\3,\4,-(\5),\6,\7,\8
shnumfaces	=	shnumfaces+1
	endm
face4	macro
	db	4,\2,\1,\3,\4,-(\5),\6,\7,\8,\9
shnumfaces	=	shnumfaces+1
	endm
face5	macro
	db	5,\2,\1,\3,\4,-(\5),\6,\7,\8,\9,\A
shnumfaces	=	shnumfaces+1
	endm
face6	macro
	db	6,\2,\1,\3,\4,-(\5),\6,\7,\8,\9,\A,\B
shnumfaces	=	shnumfaces+1
	endm
face7	macro
	db	7,\2,\1,\3,\4,-(\5),\6,\7,\8,\9,\A,\B,\C
shnumfaces	=	shnumfaces+1
	endm
face8	macro
	db	8,\2,\1,\3,\4,-(\5),\6,\7,\8,\9,\A,\B,\C,\D
shnumfaces	=	shnumfaces+1
	endm
	
face12	macro
	db	12,\2,\1,\3,\4,-(\5),\6,\7,\8,\9,\A,\B,\C,\D,\E,\F,\G,\H
shnumfaces	=	shnumfaces+1
	endm

; Wireframe tri
aface3	macro
	db	2,-1,44,0,0,0,\7,\8
shnumfaces	=	shnumfaces+1
	db	2,-1,44,0,0,0,\6,\7
shnumfaces	=	shnumfaces+1
	db	2,-1,44,0,0,0,\6,\8
shnumfaces	=	shnumfaces+1
	endm
; Wireframe quad
aface4	macro
	db	2,-1,44,0,0,0,\6,\7
shnumfaces	=	shnumfaces+1
	db	2,-1,44,0,0,0,\7,\8
shnumfaces	=	shnumfaces+1
	db	2,-1,44,0,0,0,\8,\9
shnumfaces	=	shnumfaces+1
	db	2,-1,44,0,0,0,\9,\6
shnumfaces	=	shnumfaces+1
	endm
	
	endc

;************************************************




