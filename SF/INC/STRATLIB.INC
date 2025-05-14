;***************************************************************************
;*                                                                         *
;*                                Star Fox                                 *
;*                              -----------                                *
;*                                                                         *
;*                           SuperNES version.                             *
;*                                                                         *
;*                           Argonaut Software.      		               *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                	       *
;*   File: STRATLIB.ASM                                                    *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr: EXTRA STRATEGY MACROS.                                          *
;*_________________________________________________________________________*
;*                                                                         *
;*   Date: 11/2/92                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;* Author:		Dylan Cuthbert      				                       *
;*                                                                         *
;***************************************************************************

;--------------------------------------------------------------------------
; s_implode		MACRO		obj1,strat
s_implode	MACRO
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	s_set_alvar	W,\1,al_ptr,\2
	s_set_strat	\1,#implode_istrat&WM
	
	stratmac_end
	endm


;--------------------------------------------------------------------------
; s_bemother		MACRO		obj1

s_bemother	MACRO
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	1

	phx
	phy
	php

	IFC	"y","\1"
	tyx
	ENDC

	jsl	bemother_l

	plp
	ply
	plx
	
	
	stratmac_end
	endm

;--------------------------------------------------------------------------
; s_init_anim		MACRO		obj1,frame

s_init_anim		MACRO
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1

	lda	\2
	ora	#128
	s_sta	al_animframe,\1

	stratmac_end
	endm

;--------------------------------------------------------------------------
; s_init_colanim	MACRO		obj1,colframe

s_init_colanim	MACRO
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1

	lda	\2
	ora	#128
	s_sta	al_colframe,\1

	stratmac_end
	endm

;--------------------------------------------------------------------------
; s_add_colanim	MACRO		obj1,amount,maxframes[,label][,firstframe][NOJUMP,firstframe]
sac_NOJUMP	=	12345

s_add_colanim	MACRO
	stratmac_start

	IFLT	NARG-3
	fail	; strategy parameter error
	ENDC

	CHK_OBJ	\1

; set up the init frame value
	IFEQ	NARG-5
if	=	1
	ELSEIF
if	=	0
	ENDC


	s_lda	al_colframe,\1
	clc
	adc	\2

	IFEQ	if
	bmi	.ok\@
	clc
	adc	\3
	ELSEIF
	cmp	\5
	bmi	.ok\@
	clc
	adc	\3
	sec
	sbc	\5
	ENDC
.ok\@
	and	#127

; set up the jmp condition
jmp	=	0
	IFGE	NARG-4
	IFD	sac_\4
jmp	=	0
	ELSEIF
jmp	=	1
	ENDC
	ENDC


	IFNE	jmp
	cmp	\3
	bcc	.ok2\@
	lda	\3
	dec	a
	ora	#128
	s_sta	al_colframe,\1
	jmp	\4
.ok2\@
	ELSEIF
	cmp	\3
	bcc	.ok2\@
	sec
	sbc	\3
	IFNE	if
	clc
	adc	\5
	ENDC
.ok2\@
	ENDC

	ora	#128

	s_sta	al_colframe,\1

		
	stratmac_end
	endm


;--------------------------------------------------------------------------
; s_add_anim	MACRO		obj1,amount,maxframes[,label][,firstframe][NOJUMP,firstframe]

s_add_anim	MACRO
	stratmac_start

	IFLT	NARG-3
	fail	; strategy parameter error
	ENDC

	CHK_OBJ	\1

; set up the init frame value
	IFEQ	NARG-5
if	=	1
	ELSEIF
if	=	0
	ENDC


	s_lda	al_animframe,\1
	clc
	adc	\2

	IFEQ	if
	bmi	.ok\@
	clc
	adc	\3
	ELSEIF
	cmp	\5
	bmi	.ok\@
	lda	\5
;	clc
;	adc	\3
;	sec
;	sbc	\5
	ENDC
.ok\@
	and	#127

; set up the jmp condition
jmp	=	0
	IFGE	NARG-4
	IFD	sac_\4
jmp	=	0
	ELSEIF
jmp	=	1
	ENDC
	ENDC


	IFNE	jmp
	cmp	\3
	bcc	.ok2\@
	lda	\3
	dec	a
	ora	#128
	s_sta	al_animframe,\1
	jmp	\4
.ok2\@
	ELSEIF
	cmp	\3
	bcc	.ok2\@
	sec
	sbc	\3
	IFNE	if
	clc
	adc	\5
	ENDC
.ok2\@
	ENDC

	ora	#128

	s_sta	al_animframe,\1

		
	stratmac_end
	endm



;--------------------------------------------------------------------------
; s_cmp_anim		MACRO		obj1,value

s_cmp_anim		MACRO
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1

	s_lda	al_animframe,\1
	and	#127
	cmp	\2

	stratmac_end
	endm


;--------------------------------------------------------------------------
; s_cmp_colanim	MACRO		obj1,value

s_cmp_colanim	MACRO
	stratmac_start
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1

	s_lda	al_colframe,\1
	and	#127
	cmp	\2
		
	stratmac_end
	endm


;--------------------------------------------------------------------------
; s_test_hitflags	MACRO		obj1,mask (e.g. #HF1...HF8)

s_test_hitflags	MACRO
	stratmac_start

MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1

	lda.\0	al_hitflags,\1
	and	\2

	stratmac_end
	endm


;--------------------------------------------------------------------------
; s_clr_hitflags	MACRO		obj1,mask (e.g. #HF1...HF8)

s_clr_hitflags	MACRO
	stratmac_start

MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1

	lda	\2
	eor	#-1
	and	al_hitflags,\1
	sta.\0	al_hitflags,\1

	stratmac_end
	endm


;--------------------------------------------------------------------------
; s_mode_table	MACRO
; begins a table of modes

s_mode_table	MACRO
	stratmac_start

	a16
	lda	#(.table\@)&WM
	sta	tempaddrl
	a8
	lda	#(.table\@)>>16
	sta	tempaddrl+2

	jml	jumptostate_l

.table\@
smt_modenum	=	0
	stratmac_end
	ENDM

;--------------------------------------------------------------------------
; s_mode_entry	MACRO		routine name

s_mode_entry	MACRO
	stratmac_start
	IFEQ	NARG-2
\2	equ	smt_modenum
	ENDC

	db	(\1)>>16
	dw	((\1)-1)&WM
	db	0
smt_modenum	=	smt_modenum+1

	stratmac_end
	ENDM

;--------------------------------------------------------------------------
; s_mode_label	MACRO		label name

s_mode_label		MACRO
	stratmac_start
\1	equ	smt_modenum
	stratmac_end
		ENDM

;--------------------------------------------------------------------------
; s_mode_change	MACRO		obj,A|((ABS modenumber OR #+/-offset)|obj,alvar)

s_mode_change	MACRO
MYNARG	=	NARG
	stratmac_start

	remhash	2,\2

	CHK_OBJ	\1
	CHK_NARG	2
	EXG_IFY	\1

	run	" IFND sabo_%$2"

	defs	$1,"[1]\2"
	getmval	<\2>

	IFNE	smc
	IFEQ	smc-1
	lda	#\2
	jsl	modechangeadd_l
	ELSEIF
	IFEQ	smc-2
	lda.\0	\3,\2
	jsl	modechangeadd_l
	ELSEIF
	lda.\0	\3,\2
	eor	#-1
	inc	a
	jsl	modechangeadd_l
	ENDC
	ENDC
	ELSEIF
	IFC	"\2","A"
	sta	al_stratstate,x
	ELSEIF
	IFC	"\2","a"
	sta	al_stratstate,x
	ELSEIF
	lda	\2
	sta	al_stratstate,x
	ENDC
	ENDC
	ENDC

	ELSEIF
	lda.\0	\3,\2
	sta	al_stratstate,x
	ENDC

	EXG_IFY	\1

	stratmac_end
		ENDM

getmval	MACRO
smc	=	0
	IFC	"\$1","+"
smc	=	1
	IFC	"\1","+x"
smc	=	2
	ENDC
	IFC	"\1","+y"
smc	=	2
	ENDC
	ENDC
	IFC	"\$1","-"
smc	=	1
	IFC	"\1","-x"
smc	=	3
	ENDC
	IFC	"\1","-y"
smc	=	3
	ENDC
	ENDC
	ENDM

chg_mode_a	MACRO
	phy
	a16
	and	#255
	asl	a
	asl	a
	tay
	lda.l	[tempaddrl],y
	sta	al_stratptr,x
	iny
	iny
	a8
	lda.l	[tempaddrl],y
	sta	al_stratptr+2,x
	ply
	ENDM

;--------------------------------------------------------------------------
; s_mode_table_end	MACRO

s_mode_table_end	MACRO
		ENDM

;--------------------------------------------------------------------------
; s_move_objtoend	MACRO	obj

s_move_objtoend	MACRO
MYNARG	=	NARG
	stratmac_start
	CHK_OBJ		\1
	CHK_NARG	1
	EXG_IFY		\1
	jsl	moveobjtoend_l
	EXG_IFY		\1
	stratmac_end
		ENDM
;--------------------------------------------------------------------------
; s_set_coltab	MACRO	obj,colour table

s_set_coltab	MACRO
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ	\1
	a16
	lda	\2
	sta	al_coltab,\1
	a8
	ENDM

;--------------------------------------------------------------------------
; s_clr_coltab	MACRO	obj

s_clr_coltab	MACRO
MYNARG	=	NARG
	CHK_NARG	1
	CHK_OBJ	\1
	a16
	lda	#0
	sta	al_coltab,\1
	a8
	ENDM



;--------------------------------------------------------------------------
; s_set_bossmaxHP	MACRO	maxHP | obj,alvar

s_set_bossmaxHP	MACRO	[value,alvar]

	stratmac_start

	IFEQ	NARG-1
	lda	{value}
	sta.l	m_bossmaxHP
	ELSEIF
	IFEQ	NARG-2
	CHK_OBJ	{value}
	s_copy_alvar2var.l	B,{value},m_bossmaxHP,{alvar}
	ELSEIF

	printf	"%m maxHP | obj,alvar"
	ENDC
	
	ENDC

	lda	#0
	sta.l	m_bossHP

	stratmac_end
		ENDM

;--------------------------------------------------------------------------
; s_add_bossHP	macro	([var] | [obj,alvar]), ([offset | []  ] | [obj2,alvar])

sabo_x		=	1
sabo_y		=	2


remhash	macro	[stringnum,string]
	defs	{stringnum},"{string}"
	run	" IFC '#','","[1]{string}","'"
	rols	{stringnum},1
	ENDC

	endm



s_add_bossHP	macro

	stratmac_start

	lda.l	m_bossHP

	remhash	1,\1
	remhash	2,\2
	remhash	3,\3

	run	" IFD sabo_%$1"
	clc
	adc.\0	\2,\1

	IFEQ	NARG-2
	ELSEIF

	run	" IFD sabo_%$3"
 	clc
	adc.\0	\4,\3
	ELSEIF
	clc
	adc	\3
	ENDC
	ENDC


	ELSEIF
	clc
	adc.\0		\1

	IFEQ	NARG-1
	ELSEIF
	run	" IFD sabo_%$2"
	clc
	adc.\0	\3,\2
	ELSEIF
	clc
	adc	\2
	ENDC
	ENDC
	ENDC

	sta.l	m_bossHP

	stratmac_end

	endm

;--------------------------------------------------------------------------
; s_add_bossmaxHP	macro	([var] | [obj,alvar]), ([offset | []  ] | [obj2,alvar])

sabo_x		=	1
sabo_y		=	2

s_add_bossmaxHP	macro

	stratmac_start

	remhash	1,\1
	remhash	2,\2
	remhash	3,\3

	lda.l	m_bossmaxHP

	run	" IFD sabo_%$1"
	clc
	adc.\0	\2,\1

	IFEQ	NARG-2
	ELSEIF
	run	" IFD sabo_%$3"
	clc
	adc.\0	\4,\3
	ELSEIF
	clc
	adc	\3
	ENDC
	ENDC


	ELSEIF
	clc
	adc.\0		\1

	IFEQ	NARG-1
	ELSEIF
	run	" IFD sabo_%$2"
	clc
	adc.\0	\3,\2
	ELSEIF
	clc
	adc	\2
	ENDC
	ENDC
	ENDC

	sta.l	m_bossmaxHP

	stratmac_end

	endm


;-----------------------------------------------------------------------------
; s_make_childobjrotpos	MACRO	shape,child,x,y,z,rotx,roty,rotz,#strategy ptr,[colltype]
childscale	=	3

s_make_childobjrotpos	MACRO	[shape,child,x,y,z,rotx,roty,rotz,strat,colltype]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG    	9,10

	s_make_obj	{shape},.\@
	s_make_child	{child}
	exg_xy
	s_set_strat	x,{strat}
	IFEQ		NARG-10
	s_set_colltype	x,{colltype}
	ENDC
	IFNC		"{x}","#0"
	s_set_alvar	B,x,al_childx,{x}
	ENDC
	IFNC		"{y}","#0"
	s_set_alvar	B,x,al_childy,{y}
	ENDC
	IFNC		"{z}","#0"
	s_set_alvar	B,x,al_childz,{z}
	ENDC
	IFNC		"{rotx}","#0"
	s_set_alvar	B,x,al_childrotx,{rotx}
	ENDC
	IFNC		"{roty}","#0"
	s_set_alvar	B,x,al_childroty,{roty}
	ENDC
	IFNC		"{rotz}","#0"
	s_set_alvar	B,x,al_childrotz,{rotz}
	ENDC
;	s_set_alvar	W,x,al_childrotobj,#0
	exg_xy
.\@
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
; s_rotpos_child	MACRO	childobj
; sets the child to the position specified in alx_childx,alx_childy...

s_rotpos_child	MACRO	[child]
	stratmac_start
MYNARG	=	NARG
	CHK_NARG    	1
	exg_ify		{child}
	s_jsl		child_rotpos_l
	exg_ify		{child}
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
; s_rotpos_allchildren	MACRO	motherobj

s_rotpos_allchildren		MACRO	[motherobj]
	stratmac_start
	exg_ify	{motherobj}

	s_jsl	rotpos_allchildren_l

	exg_ify	{motherobj}
	stratmac_end
	ENDM

;-----------------------------------------------------------------------------
; s_set_childs_sflag	MACRO	motherobj,sflag[,rangebegin,rangeend]|[,child num]

s_set_childsflag	MACRO	[motherobj,sflag,begin,end]
	stratmac_start
	exg_ify	{motherobj}
	phy
	IFEQ	NARG-3
	s_set_objtobechild	y,x,{begin}
	s_chk_objptr		y,.pla\@
	s_set_alsflag		y,{sflag}
.pla\@
	ELSEIF
	lda	{begin}
	dec	a
.nxt\@
	inc	a
	sta	tpa
	pha
	s_set_objtobechild	y,x,tpa
	s_chk_objptr		y,.pla\@
	s_set_alsflag		y,{sflag}
.pla\@
	pla
	cmp	{end}
	bne	.nxt\@
	ENDC

	ply
	exg_ify	{motherobj}
	stratmac_end
		ENDM


;-----------------------------------------------------------------------------
; s_clr_childs_sflag	MACRO	motherobj,sflag[,rangebegin,rangeend]|[,child num]

s_clr_childsflag	MACRO	[motherobj,sflag,begin,end]
	stratmac_start
	exg_ify	{motherobj}
	phy
	IFEQ	NARG-3
	s_set_objtobechild	y,x,{begin}
	s_chk_objptr		y,.pla\@
	s_clr_alsflag		y,{sflag}
.pla\@
	ELSEIF
	lda	{begin}
	dec	a
.nxt\@
	inc	a
	sta	tpa
	pha
	s_set_objtobechild	y,x,tpa
	s_chk_objptr		y,.pla\@
	s_clr_alsflag		y,{sflag}
.pla\@
	pla
	cmp	{end}
	bne	.nxt\@
	ENDC

	ply
	exg_ify	{motherobj}
	stratmac_end
		ENDM

;-----------------------------------------------------------------------------
; s_jmp_childrendead	MACRO	motherobj[,rangebegin,rangeend]|[,child num],label

s_jmp_childrendead	MACRO	[motherobj,begin,end,jump]
	stratmac_start
	exg_ify	{motherobj}
	phy
	IFEQ	NARG-3
	s_set_objtobechild	y,x,{begin}
	cpy	#0
	bne	.out\@
	ply
	exg_ify	{motherobj}
	s_jmp	{end}	
	ELSEIF
	lda	{begin}
	dec	a
.nxt\@
	inc	a
	sta	tpa
	pha
	s_set_objtobechild	y,x,tpa
	pla
	cpy	#0
	bne	.out\@
	cmp	{end}
	bne	.nxt\@
	ply
	exg_ify	{motherobj}
	s_jmp	{jump}
	ENDC
.out\@

	ply
	exg_ify	{motherobj}
	stratmac_end
		ENDM

;-----------------------------------------------------------------------------
s_set_path	MACRO	[obj,path]

	s_set_alvar	W,{obj},al_sword2,#path_{path}

	ENDM
;-----------------------------------------------------------------------------
s_set_pstrat	MACRO	[obj]

	a16
	s_lda	al_strat,{obj}
	sta	newplayerstrat
	a8
	s_lda	al_strat+2,{obj}
	sta	newplayerstrat+2

	ENDM
;-----------------------------------------------------------------------------
s_text_obj	MACRO	[obj,text,colour,size]
MYNARG	=	NARG
	CHK_NARG	3,4
	CHK_OBJ		{obj}

	s_set_alsflag	{obj},textobj
	s_set_alsflag	{obj},colldisable
	s_set_alvar	B,{obj},al_depthoffset,{colour}
	s_set_alvar	W,{obj},al_coltab,{text}&WM
	IFEQ	NARG-3
	s_set_alvar	B,{obj},al_tx,#0
	ELSEIF
	s_set_alvar	B,{obj},al_tx,{size}
	ENDC

	ENDM
;-----------------------------------------------------------------------------
s_sprite_obj	MACRO	[obj,colour,size]
MYNARG	=	NARG
	CHK_NARG	2,3
	CHK_OBJ		{obj}

	s_set_alsflag	{obj},ssprite
	s_set_alvar	B,{obj},al_depthoffset,{colour}

	IFEQ	NARG-2
	s_set_alvar	B,{obj},al_tx,#0
	ELSEIF
	s_set_alvar	B,{obj},al_tx,{size}
	ENDC

	ENDM
;-----------------------------------------------------------------------------
; Makes an object a software sprite
s_becomesprite	MACRO	[obj]
	CHK_OBJ		{obj}
	s_sprite_obj	{obj},#0
	ENDM
;-----------------------------------------------------------------------------
smp_B	=	1
smp_W	=	2
smp_D	=	3
smpo_A	=	1
smpo_X	=	2
smpo_Y	=	2
s_mpush	MACRO	[size,sobj,obj,var] ; | [size,sobj,A] | [size,sobj,mem] | [size,sobj,X] | [size,sobj,Y]
MYNARG	=	NARG
	CHK_NARG	3,4
	CHK_OBJ		{sobj}

	IFEQ	smp_{size}-smp_B
; byte push
	IFEQ	NARG-3
	IFD	smpo_{obj}
	IFNE	smpo_{obj}-smpo_A
	t{obj}a
	ENDC
	ELSEIF
	lda	{obj}
	ENDC
	ENDC

	IFEQ	NARG-4
	s_lda	{var},{obj}
	ENDC

	sta	stackdata
	a16
	lda	al_stackptr,{sobj}
	jsl	smpush_l
	sta	al_stackptr,{sobj}
	a8
	ENDC

	IFEQ	smp_{size}-smp_W

	a16

	IFEQ	NARG-3
	IFD	smpo_{obj}
	IFNE	smpo_{obj}-smpo_A
	t{obj}a
	ENDC
	ELSEIF
	lda	{obj}
	ENDC
	ENDC

	IFEQ	NARG-4
	s_lda	{var},{obj}
	ENDC

	sta	stackdata
	lda	al_stackptr,{sobj}
	jsl	smpush_l
	sta	al_stackptr,{sobj}
	a8
	ENDC

	IFEQ	smp_{size}-smp_D

	IFEQ	NARG-3
	IFD	smpo_{obj}
	error	"unable to D mode with A,X or Y"
	ELSEIF
	lda	{obj}
	sta	stackdata
	a16
	lda	{obj}+1
	sta	stackdata+1
	ENDC
	ENDC

	IFEQ	NARG-4
	s_lda	{var},{obj}
	sta	stackdata
	a16
	s_lda	{var}+1,{obj}
	sta	stackdata+1
	ENDC

	lda	al_stackptr,{sobj}
	jsl	smpush_l
	sta	al_stackptr,{sobj}
	a8
	ENDC


	ENDM
;-----------------------------------------------------------------------------

s_mpull	MACRO	[size,sobj,obj,var] ; | [size,sobj,A] | [size,sobj,mem] | [size,sobj,X] | [size,sobj,Y]
MYNARG	=	NARG
	CHK_NARG	3,4
	CHK_OBJ		{sobj}

	
	a16
	lda	al_stackptr,{sobj}
	jsl	smpull_l
	sta	al_stackptr,{sobj}

	IFEQ	smp_{size}-smp_B
; byte pull
	a8

	lda	stackdata

	IFEQ	NARG-3
	IFD	smpo_{obj}
	IFNE	smpo_{obj}-smpo_A
	ta{obj}
	ENDC
	ELSEIF
	sta	{obj}
	ENDC
	ENDC

	IFEQ	NARG-4
	s_sta	{var},{obj}
	ENDC

	ENDC

	IFEQ	smp_{size}-smp_W
; word pull
	lda	stackdata

	IFEQ	NARG-3
	IFD	smpo_{obj}
	IFNE	smpo_{obj}-smpo_A
	ta{obj}
	ENDC
	ELSEIF
	sta	{obj}
	ENDC
	ENDC

	IFEQ	NARG-4
	s_sta	{var},{obj}
	ENDC

	a8
	ENDC

	IFEQ	smp_{size}-smp_D

	IFEQ	NARG-3
	IFD	smpo_{obj}
	error	"unable to D mode with A,X or Y"
	ELSEIF
	lda	stackdata
	sta	{obj}
	a8
	lda	stackdata+2
	sta	{obj}+2
	ENDC
	ENDC

	IFEQ	NARG-4
	lda	stackdata
	s_sta	{var},{obj}
	a8
	lda	stackdata+2
	s_sta	{var}+2,{obj}
	ENDC

	ENDC

	ENDM
;-----------------------------------------------------------------------------
s_alloc	MACRO	[mobj,dest,amount]
MYNARG	=	NARG
	CHK_NARG	3
	CHK_OBJ		{mobj}
	CHK_OBJ		{dest}

	a16
	lda	{amount}
	EXG_IFY	{mobj}
	jsl	salloc_l
	EXG_IFY	{mobj}
	ta{dest}
	a8
	
	ENDM
;-----------------------------------------------------------------------------
s_free	MACRO	[mobj,source]
MYNARG	=	NARG
	CHK_NARG	2
	CHK_OBJ		{mobj}
	CHK_OBJ		{source}

	a16
	t{source}a
	EXG_IFY	{mobj}
	jsl	sfree_l
	EXG_IFY	{mobj}
	a8
	
	ENDM
;-----------------------------------------------------------------------------
s_score	MACRO	[score]
MYNARG	=	NARG
	CHK_NARG	1
	ENDM
;-----------------------------------------------------------------------------



