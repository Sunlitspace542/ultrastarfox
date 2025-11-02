;--------------------------------------------------------------------
getparam	macro	[offset]
	jsr	getparam{offset}
	endm

getparam_codegen	macro	[offset]
getparam{offset}
	phx
	phy
	ldy	al_sword2,x
	tyx
	lda.l	paths+{offset},x
	ply
	plx
	rts
	endm

;--------------------------------------------------------------------

; nullify path info macros:
	IFEQ	pathinfo

pathmac_start	MACRO
	ENDM
;--------------------------------------------------------------------
pathmac_end	MACRO
	ENDM

;--------------------------------------------------------------------
	ELSEIF
; path info macros:

	FOPEN	pathinfo.asm
	printf	"; ------------ PATH MACRO INFORMATION ------------%n"
	FCLOSE

;--------------------------------------------------------------------
pathmac_start	MACRO
	run	" IFND pathmac_%c"

	FOPEN	+pathinfo.asm

	printf	" printf %q%c: %q,pathmac_%c,%q %q,pathmacmem_%c,%q%%n%q%n"
	
	FCLOSE

	run	"pathmac_%c = 1"
	run	"pathmacmem_%c = 0"

	ELSEIF

	run	"pathmac_%c = pathmac_%c+1"
	ENDC
__pms	=	*

		ENDM
;--------------------------------------------------------------------
pathmac_end	MACRO
	run	"pathmacmem_%c = pathmacmem_%c+*-__pms"
	ENDM

;--------------------------------------------------------------------

	ENDC

;--------------------------------------------------------------------

addalvaroffset	MACRO	[param]
	IFNE	LONGA
	printf	"addalvaroffset needs a8 %l%n"
	ENDC
	stx	pathx1
	getparam	{param}
	jsr	.addalvaroffset
		ENDM
	
	

;--------------------------------------------------------------------

psetalvars	MACRO	[code,alvar,var]
	IFEQ	size_al_{alvar}-1
	IFEQ	size_al_{var}-1
	db	p_{code}BB
	ELSEIF
	db	p_{code}BW
	ENDC
	ELSEIF

	IFEQ	size_al_{var}-1
	db	p_{code}WB
	ELSEIF
	db	p_{code}WW
	ENDC
	ENDC

	PALVAROFFSET	{alvar}
	PALVAROFFSET	{var}

	ENDM
;--------------------------------------------------------------------

numpaths	=	0

start_path	MACRO	[name]

p{name}
path_{name}	equ	*-paths

numpaths	=	numpaths+1
	ENDM

;--------------------------------------------------------------------
PCHKSIZE	MACRO	[alvar,size]
	defs	1,"word"
	IFEQ	{size}-1
	defs	1,"byte"
	ENDC

	IFNE	size_al_{alvar}-{size}
	printf	"%00%31%01Error: Size of alvar must be a %$1 (%l: %c).%n%00"
	ENDC
	ENDM
;--------------------------------------------------------------------
PNARG	MACRO	[n1,n2]
	IFEQ	NARG-1
	IFNE	MYNARG-{n1}
	printf	"%00%31%01Error: Incorrect parameters specified (%l: %c).%n%00"
	fail
	ENDC
	ELSEIF
	IFNE	MYNARG<{n1}
	printf	"%00%31%01Error: Incorrect parameters specified (%l: %c).%n%00"
	fail
	ENDC
	IFNE	MYNARG>{n2}
	printf	"%00%31%01Error: Incorrect parameters specified (%l: %c).%n%00"
	fail
	ENDC
	ENDC
	ENDM

;--------------------------------------------------------------------
PALVAR	MACRO	[alvar]
	IFND	al_{alvar}
	printf	"%00%31%01Error: No such alien variable - {alvar} (%l: %c).%n%00"
	fail
	ENDC
	ENDM

;--------------------------------------------------------------------
PALVAROFFSET	MACRO	[alvar]
	IFEQ	al_{alvar}&$ffffff00
	db	al_{alvar}
	ELSEIF
	IFD	_SASM
	db	(al_{alvar}-alx_start)!128
	ENDC
	IFD	_ARGSFX
	db	((al_{alvar}-alx_start)!128)&BM
	ENDC
	ENDC
	ENDM
;--------------------------------------------------------------------
;--------------------------------------------------------------------
;--------------------------------------------------------------------
;--------------------------------------------------------------------

P_RELTOPLAYER	MACRO	[onoff]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_reltoplayer{onoff}

	pathmac_end
		ENDM

;--------------------------------------------------------------------

P_INVISIBLE		MACRO	[onoff]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_invisible{onoff}

	pathmac_end
		ENDM


;--------------------------------------------------------------------

P_SPACESHIP		MACRO	[onoff]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_spaceship{onoff}

	pathmac_end
		ENDM


;--------------------------------------------------------------------

P_HELICOPTER		MACRO	[onoff]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_zaco{onoff}

	pathmac_end
		ENDM



;--------------------------------------------------------------------
P_WAIT		MACRO	[numframes]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	IFC	"{numframes}","1"
	db	p_wait1
	ELSEIF
	db	p_wait
	db	{numframes}
	ENDC
	pathmac_end
		ENDM
;--------------------------------------------------------------------

P_ALWAYSGENVECS	MACRO	[onoff]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_alwaysgenvecs{onoff}

	pathmac_end
	ENDM

;--------------------------------------------------------------------

P_SETVEL		MACRO	[velocity]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_setvel
	db	{velocity}

	pathmac_end
		ENDM

;--------------------------------------------------------------------

P_LOOP		MACRO	[number,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	2

	db	p_loop
	db	{number}
	dw	{addr}-paths

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_INC	MACRO	[alvar]
MYNARG	=	NARG
	PNARG	1
	PALVAR	{alvar}

	IFEQ	size_al_{alvar}-1
	db	p_incb
	ELSEIF
	db	p_incw
	ENDC

	PALVAROFFSET	{alvar}

	ENDM
;--------------------------------------------------------------------
P_DEC	MACRO	[alvar]
MYNARG	=	NARG
	PNARG	1
	PALVAR	{alvar}

	IFEQ	size_al_{alvar}-1
	db	p_decb
	ELSEIF
	db	p_decw
	ENDC

	PALVAROFFSET	{alvar}

	ENDM

;--------------------------------------------------------------------

P_ADD		MACRO	[alvar,num]
	pathmac_start
MYNARG	=	NARG
	PNARG	2

	PALVAR	{alvar}

	IFC	"1","{num}"
	P_INC	{alvar}
	ELSEIF
	IFC	"-1","{num}"
	P_DEC	{alvar}
	ELSEIF

	IFD	al_{num}

	psetalvars	<addv>,{alvar},{num}

	ELSEIF

	IFEQ	size_al_{alvar}-1
padddone	=	0

	IFEQ	al_rotx-al_{alvar}
padddone	=	1
	db	p_addrotx
	ENDC

	IFEQ	al_roty-al_{alvar}
padddone	=	1
	db	p_addroty
	ENDC

	IFEQ	al_rotz-al_{alvar}
padddone	=	1
	db	p_addrotz
	ENDC

	IFEQ	padddone
	db	p_addb
	PALVAROFFSET	{alvar}
	ENDC

	db	{num}
	ELSEIF
padddone	=	0

	IFEQ	({num}+128)&$ffffff00

	IFEQ	al_worldx-al_{alvar}
padddone	=	1
	db	p_addworldx
	ENDC

	IFEQ	al_worldy-al_{alvar}
padddone	=	1
	db	p_addworldy
	ENDC

	IFEQ	al_worldz-al_{alvar}
padddone	=	1
	db	p_addworldz
	ENDC

	IFEQ	padddone
	db	p_addws
	PALVAROFFSET	{alvar}
	ENDC
	db	{num}

	ELSEIF

	db	p_addw
	PALVAROFFSET	{alvar}
	dw	{num}
	ENDC

	ENDC

	ENDC
	ENDC
	ENDC

	pathmac_end
		ENDM

;--------------------------------------------------------------------

P_FACEPLAYER		MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0

	db	p_faceplayer

	pathmac_end
		ENDM
;--------------------------------------------------------------------

P_WAITFACEPLAYER		MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0

	db	p_waitfaceplayer

	pathmac_end
		ENDM
;--------------------------------------------------------------------

P_FIRELASER		MACRO	[option]
	pathmac_start
MYNARG	=	NARG
	PNARG	0,1

	P_WEAPON	RELSLOWELASER
	P_FIRE		{option}

	pathmac_end
		ENDM
;--------------------------------------------------------------------

P_FIREMISSILE	MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0

	P_WEAPON	HMISSILE1
	P_FIRE		ATPLAYER

	pathmac_end
		ENDM
;--------------------------------------------------------------------

P_CHASE		MACRO	[alvar,val]
	pathmac_start
MYNARG	=	NARG
	PNARG	2
	PALVAR	{alvar}

	IFEQ	size_al_{alvar}-1
	db	p_achaseB
	db	{val}
	PALVAROFFSET	{alvar}
	ELSEIF
	db	p_achaseW
	dw	{val}
	PALVAROFFSET	{alvar}
	ENDC

	pathmac_end
		ENDM

;--------------------------------------------------------------------
P_WAITCHASE		MACRO	[alvar,val]
	pathmac_start
MYNARG	=	NARG
	PNARG	2
	PALVAR	{alvar}

	IFEQ	size_al_{alvar}-1
	db	p_waitachaseB
	db	{val}
	PALVAROFFSET	{alvar}
	ELSEIF
	db	p_waitachaseW
	dw	{val}
	PALVAROFFSET	{alvar}
	ENDC


	pathmac_end
		ENDM

;--------------------------------------------------------------------

P_END		MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0

	db	p_end
	pathmac_end
		ENDM

;--------------------------------------------------------------------

P_SET		MACRO	[alvar,val]
	pathmac_start
MYNARG	=	NARG
	PNARG	2
	PALVAR	{alvar}

	IFC	"{val}","0"

	P_ZERO	{alvar}

	ELSEIF

	IFD	al_{val}
; set alvar to another alvar

	psetalvars	setv,{alvar},{val}

	ELSEIF
; set alvar to immediate
	IFEQ	size_al_{alvar}-1
	db	p_setb
	db	{val}
	PALVAROFFSET	{alvar}
	ELSEIF
	db	p_setw
	dw	{val}
	PALVAROFFSET	{alvar}
	ENDC

	ENDC
	ENDC
	pathmac_end
		ENDM

;--------------------------------------------------------------------

P_ZERO		MACRO	[alvar]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	IFEQ	size_al_{alvar}-1
	db	p_set0b
	ELSEIF
	db	p_set0w
	ENDC

	PALVAROFFSET	{alvar}

	pathmac_end
		ENDM

;--------------------------------------------------------------------

P_FINDSHAPE		MACRO	[shape]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_findshape
	dw	{shape}

	pathmac_end
		ENDM

;--------------------------------------------------------------------

P_FINDNEXTSHAPE	MACRO	[shape]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_findnextshape
	dw	{shape}

	pathmac_end
		ENDM

;--------------------------------------------------------------------
P_FACESHAPE		MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0

	db	p_faceshape
	pathmac_end
		ENDM
;--------------------------------------------------------------------

P_EXPLODE		MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0

	db	p_explode

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_REMOVE		MACRO	[child]
	pathmac_start
MYNARG	=	NARG
	PNARG	0,1

	IFEQ	NARG
	db	p_remove
	ELSEIF
	db	p_removechild
	db	{child}
	ENDC

	pathmac_end
		ENDM
;--------------------------------------------------------------------


P_GOTOPOS		MACRO	[x,y,z,speed]
	pathmac_start
MYNARG	=	NARG
	PNARG	4

	db	p_gotopos
	dw	{x},{y},{z}
	db	{speed}

	pathmac_end
		ENDM

;--------------------------------------------------------------------


P_GOTOSHAPEPOS	MACRO	[x,y,z,speed]
	pathmac_start
MYNARG	=	NARG
	PNARG	4

	db	p_gotoshapepos
	dw	{x},{y},{z}
	db	{speed}

	pathmac_end
		ENDM

;--------------------------------------------------------------------

P_IMMUNE		MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0

	db	p_immune

	pathmac_end
		ENDM

;--------------------------------------------------------------------
P_GOTO		MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_goto
	dw	{addr}-paths

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_IGOTO		MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_igoto
	dw	{addr}-paths

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_DISTLESS		MACRO	[value,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	2

	db	p_distless
	dw	{value}
	dw	{addr}-paths

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_SHAPEDISTLESS	MACRO	[value,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	2

	db	p_shapedistless
	dw	{value}
	dw	{addr}-paths

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_DISTMORE		MACRO	[value,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	2

	db	p_ifnot

	P_DISTLESS	{value},{addr}

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_SHAPEDISTMORE	MACRO	[value,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	2

	db	p_ifnot

	P_SHAPEDISTLESS	{value},{addr}

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_ACCEL		MACRO	[speed,rate]
	pathmac_start
MYNARG	=	NARG
	PNARG	2

	db	p_accel
	db	{speed}
	db	{rate}

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_HITGROUND		MACRO	[groundheight,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	2

	db	p_hitground
	dw	{groundheight}
	dw	{addr}-paths

	pathmac_end
		ENDM

;--------------------------------------------------------------------
P_NOTHITGROUND		MACRO	[groundheight,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	2

	db	p_ifnot

	P_HITGROUND	{groundheight},{addr}

	pathmac_end
		ENDM

;--------------------------------------------------------------------
P_HITWALL		MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_hitwall
	dw	{addr}-paths

	pathmac_end
		ENDM

;--------------------------------------------------------------------
P_SETANIM		MACRO	[value]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_initanim
	db	{value}

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_ADDANIM		MACRO	[rate,limit]
	pathmac_start
MYNARG	=	NARG
	PNARG	2

	db	p_addanim
	db	{rate},{limit}
	

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_DEBRIS		MACRO	[shape]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_debris
	dw	{shape}

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_FRIEND		MACRO	[friend]
	pathmac_start
MYNARG	=	NARG
	PNARG	0,1

	IFEQ	NARG-1
	db	p_friend
	db	friend_{friend}
	ELSEIF
	db	p_friend
	db	friend_anyone
	ENDC

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_LINK		MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0

	db	p_link

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_SHAPEDEAD		MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_shapedead
	dw	{addr}-paths
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_IFLEVEL		MACRO	[level,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	2

	db	p_iflevel
	db	{level}
	dw	{addr}-paths
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_IFNOTLEVEL		MACRO	[level,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	2

	db	p_ifnot

	P_IFLEVEL	{level},{addr}

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_LEFTOFPLAYER	MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_leftofplayer
	dw	{addr}-paths
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_RIGHTOFPLAYER	MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_rightofplayer
	dw	{addr}-paths
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_BEHINDPLAYER	MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_behindplayer
	dw	{addr}-paths
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_ABOVEPLAYER	MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_aboveplayer
	dw	{addr}-paths
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_BELOWPLAYER	MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_belowplayer
	dw	{addr}-paths
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_NOTFRIEND		MACRO	[friend,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	2

	db	p_notfriend
	db	friend_{friend}
	dw	{addr}-paths
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_IFFRIEND		MACRO	[friend,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	2

	db	p_ifnot

	P_NOTFRIEND	{friend},{addr}

	pathmac_end
		ENDM
;--------------------------------------------------------------------
pm__meter
P_MSG		MACRO	[msg,meter]
	pathmac_start
MYNARG	=	NARG
	PNARG	1,2

	IFND	pm__{meter}
	db	p_msg
	ELSEIF
	db	p_msgwithmeter
	ENDC
	db	{msg}
	pathmac_end
		ENDM
;--------------------------------------------------------------------
; language extension by kando
P_MSG2		MACRO	
	pathmac_start
	db	p_msg2
	db	0
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_DAMAGE		MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0

	db	p_damage
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_ALMOSTDEAD		MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_almostdead
	dw	{addr}-paths
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_SMOKE		MACRO	[onoff]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_smoke{onoff}
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_RANDOMGOTO		MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_randomgoto
	dw	{addr}-paths
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_IFSAME		MACRO	[alvar,val,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	3
	PALVAR	{alvar}

	IFC	"{val}","0"

	P_IFZERO	{alvar},{addr}

	ELSEIF

	IFEQ	size_al_{alvar}-1
	db	p_ifsameb
	PALVAROFFSET	{alvar}
	db	{val}
	dw	{addr}-paths
	ELSEIF
	db	p_ifsamew
	PALVAROFFSET	{alvar}
	dw	{val}
	dw	{addr}-paths
	ENDC

	ENDC

	pathmac_end
		ENDM

;--------------------------------------------------------------------
P_IFZERO		MACRO	[alvar,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	2
	PALVAR	{alvar}

	IFEQ	size_al_{alvar}-1
	db	p_ifzerob
	PALVAROFFSET	{alvar}
	dw	{addr}-paths
	ELSEIF
	db	p_ifzerow
	PALVAROFFSET	{alvar}
	dw	{addr}-paths
	ENDC

	pathmac_end
		ENDM

;--------------------------------------------------------------------
P_IFNOTZERO		MACRO	[alvar,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	2
	PALVAR	{alvar}

	IFEQ	size_al_{alvar}-1
	db	p_ifnotzerob
	PALVAROFFSET	{alvar}
	dw	{addr}-paths
	ELSEIF
	db	p_ifnotzerow
	PALVAROFFSET	{alvar}
	dw	{addr}-paths
	ENDC

	pathmac_end
		ENDM

;--------------------------------------------------------------------
P_IFNOTSAME		MACRO	[alvar,val,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	3
	PALVAR	{alvar}

	IFC	"0","{val}"

	P_IFNOTZERO	{alvar},{addr}

	ELSEIF

	db	p_ifnot

	P_IFSAME	{alvar},{val},{addr}

	ENDC

	pathmac_end
		ENDM


;--------------------------------------------------------------------
P_IFBETWEEN		MACRO	[val1,alvar,val2,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	4
	PALVAR	{alvar}

	IFEQ	size_al_{alvar}-1
	db	p_ifbetweenB
	PALVAROFFSET	{alvar}
	db	{val1},{val2}
	dw	{addr}-paths
	ELSEIF
	db	p_ifbetweenW
	PALVAROFFSET	{alvar}
	dw	{val1},{val2}
	dw	{addr}-paths
	ENDC
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_IFNOTBETWEEN	MACRO	[val1,alvar,val2,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	4
	PALVAR	{alvar}

	db	p_ifnot

	P_IFBETWEEN	{val1},{alvar},{val2},{addr}

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_INVINCIBLE		MACRO	[onoff]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_invincible{onoff}
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_ZREMOVE		MACRO	[onoff]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_zremove{onoff}
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_PLAYERDEAD		MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_playerdead
	dw	{addr}-paths
	pathmac_end
		ENDM

;--------------------------------------------------------------------
__psp_link	equ	0
__psp_	equ	0

P_SPAWN		MACRO	[x,y,z,xrot,yrot,zrot,shape,path,hp,ap,linkonoff]
	pathmac_start
MYNARG	=	NARG
	PNARG	10,11

	IFD	__psp_{linkonoff}
	db	p_spawn{linkonoff}
	ELSEIF
	db	p_spawnchild
	ENDC

	dw	{shape}
	dw	path_{path}
	db	{xrot},{yrot},{zrot}
	db	{hp},{ap}
	db	({x})/4,({y})/4,({z})/4

	IFND	__psp_{linkonoff}
	db	{linkonoff}
	ENDC
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_QSPAWN		MACRO	[shape,path,hp,ap]
	pathmac_start
MYNARG	=	NARG
	PNARG	4
	db	p_qspawn
	dw	{shape}
	dw	path_{path}
	db	{hp},{ap}

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_DEBUG		MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0
	db	p_debug
	blink
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_WEAPON		MACRO	[weapon]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_weapon
	db	WEAPON_{weapon}
	pathmac_end
		ENDM
;--------------------------------------------------------------------
pft_canhit	=	0
pft_	=	0
pft_atplayer	=	0
pft_atshape	=	0
P_FIRE		MACRO	[opt1,opt2]
	pathmac_start
MYNARG	=	NARG
	PNARG	0,2

	IFNE	NARG<2
	db	p_fire{opt1}
	ELSEIF
	db	p_fire{opt1}{opt2}
	ENDC


	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_CHILDDEAD		MACRO	[child,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	2

	db	p_childdead
	db	{child}
	dw	{addr}-paths

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_LINKCHILD		MACRO	[child]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_linkchild
	db	{child}

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_FLAGCHILD		MACRO	[child]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_flagchild
	db	{child}

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_FLAGMOTHER		MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0

	db	p_flagmother

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_IFFLAG		MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_ifflag
	dw	{addr}-paths

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_FLAGSHAPE		MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0

	db	p_flagshape

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_TEXT		MACRO	[text,colour,size]
	pathmac_start
MYNARG	=	NARG
	PNARG	2,3
	db	p_text
	dw	{text}&WM
	db	{colour}
	IFEQ	NARG-3
	db	{size}
	ELSEIF
	db	0
	ENDC
	pathmac_end
		ENDM
;--------------------------------------------------------------------
pt_off
P_TRAIL		MACRO	[colour]
	pathmac_start
MYNARG	=	NARG
	PNARG	1
	db	p_trail
	IFD	pt_{colour}
	db	0
	ELSEIF
	db	{colour}
	ENDC
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_GOSUB		MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	1
	IFD	al_{addr}
	PCHKSIZE	{addr},2
	db	p_gosubalvar
	PALVAROFFSET	{addr}
	ELSEIF
	db	p_gosub
	dw	{addr}-paths
	ENDC
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_RETURN		MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0
	db	p_return
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_DO		MACRO	[num]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	IFD	al_{num}
	IFEQ	size_al_{num}-1
	db	p_doalvarb
	ELSEIF
	db	p_doalvarw
	ENDC
	PALVAROFFSET	{num}
	ELSEIF

	IFEQ	({num})&$ffffff00
	db	p_doq
	db	{num}
	ELSEIF
	db	p_do
	dw	{num}
	ENDC
	ENDC
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_NEXT		MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0
	db	p_next
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_INEXT		MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0
	db	p_inext
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_BREAK		MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	0,1
	IFEQ	NARG-1
	db	p_break
	dw	{addr}-paths
	ELSEIF
	db	p_breakc
	ENDC
	pathmac_end
		ENDM
;--------------------------------------------------------------------

; timing triggers:

trigger_always	equ	0
trigger_2		equ	1
trigger_4		equ	2
trigger_8		equ	3
trigger_16		equ	4
trigger_32		equ	5
trigger_64		equ	6
trigger_128		equ	7

; event triggers:

trigger_whenhit	equ	8
trigger_whenhitbyplayer equ	9
trigger_whenflagged	equ	10
trigger_whenshapedead equ	11
trigger_whendead	equ	12

trigger_off		equ	-1

P_TRIGGER		MACRO	[addr,trigger]
	pathmac_start
MYNARG	=	NARG
	PNARG	1,2

	IFEQ	trigger_off-trigger_{trigger}
	db	p_alwaysoff
	dw	{addr}-paths
	ELSEIF
	
	db	p_always
	dw	{addr}-paths
	db	trigger_{trigger}

	ENDC

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_FORCE	MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	1
	db	p_force
	dw	{addr}-paths
	pathmac_end
	ENDM
;--------------------------------------------------------------------
P_SPRITE	MACRO	[colour,size]
	pathmac_start
MYNARG	=	NARG
	PNARG	1,2

	db	p_sprite
	db	{colour}
	IFEQ	NARG-2
	db	{size}
	ELSEIF
	db	0
	ENDC

	pathmac_end
	ENDM
;--------------------------------------------------------------------
P_HITFLASH	MACRO	[onoff]
	pathmac_start
MYNARG	=	NARG
	PNARG	1
	db	p_hitflash{onoff}
	pathmac_end
	ENDM
;--------------------------------------------------------------------
P_SETSTRAT	MACRO	[strat]
	pathmac_start
MYNARG	=	NARG
	PNARG	1
	db	p_setstrat
	dw	{strat}&WM
	db	{strat}>>16
	pathmac_end
	ENDM
;--------------------------------------------------------------------
P_NEG	MACRO	[alvar]
	pathmac_start
MYNARG	=	NARG
	PNARG	1
	PALVAR	{alvar}

	IFEQ	size_al_{alvar}-1
	db	p_negB
	dw	al_{alvar}
	ELSEIF
	db	p_negW
	dw	al_{alvar}
	ENDC
	pathmac_end
	ENDM
;--------------------------------------------------------------------
P_SETRANDOM	MACRO	[alvar,rndmask]
	pathmac_start
MYNARG	=	NARG
	PNARG	1,2
	PALVAR	{alvar}

	IFEQ	NARG-1

	IFEQ	size_al_{alvar}-1
	db	p_setrandomB
	dw	al_{alvar}
	db	-1
	ELSEIF
	db	p_setrandomW
	dw	al_{alvar}
	dw	-1
	ENDC

	ELSEIF

	IFEQ	size_al_{alvar}-1
	db	p_setrandomB
	dw	al_{alvar}
	db	{rndmask}
	ELSEIF
	db	p_setrandomW
	dw	al_{alvar}
	dw	{rndmask}
	ENDC

	
	ENDC

	pathmac_end
	ENDM
;--------------------------------------------------------------------
P_IFHITFLAG	MACRO	[addr,1,2,3,4,5,6,7,8]
	pathmac_start
MYNARG	=	NARG
	PNARG	1,9

	db	p_ifhitflag
	dw	{addr}-paths
	IFEQ	NARG-1
pifhitmask	=	255
	ELSEIF
pifhitmask	=	0
	REPT	NARG-1
	irs	1,"{1}","{2}","{3}","{4}","{5}","{6}","{7}","{8}"
	run	"pifhitmask = pifhitmask!(1<<(%$1-1)"
	ENDR
	ENDC

	printf	pifhitmask,"%n"
	db	pifhitmask

	pathmac_end
	ENDM
;--------------------------------------------------------------------
P_COLLISIONS	MACRO	[onoff]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_collisions{onoff}

	pathmac_end
	ENDM
;--------------------------------------------------------------------
P_SHADOW	MACRO	[onoff]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_shadow{onoff}

	pathmac_end
	ENDM
;--------------------------------------------------------------------
P_START65816	MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0

	db	p_start65816
	SHORTA
	LONGI
	pathmac_end
	ENDM
;--------------------------------------------------------------------
P_END65816	MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0

	a16
	lda	#.\@-paths
	rtl
.\@
	pathmac_end
	ENDM
;--------------------------------------------------------------------
P_SWITCHOUT	MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	IFEQ	LONGA
	lda	#({addr}-paths)>>8
	xba
	lda	#({addr}-paths)&255
	ELSEIF
	lda	#{addr}-paths
	ENDC
	rtl
	pathmac_end
	ENDM
;--------------------------------------------------------------------
P_PARTICLES	MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0

	db	p_particle

	pathmac_end
	ENDM
;--------------------------------------------------------------------
P_SOUNDEFFECT	MACRO	[sound]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_sound
	db	{sound}

	pathmac_end
	ENDM

;--------------------------------------------------------------------
P_SOUND	MACRO	[sound]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_sound2
	db	{sound}

	pathmac_end
	ENDM
	
;--------------------------------------------------------------------
P_UNLINKCHILD	MACRO	[child]
	pathmac_start
MYNARG	=	NARG
	PNARG	0,1

	IFEQ	NARG-1
	db	p_unlinkchild
	db	{child}
	ELSEIF
	db	p_unlinkself
	ENDC
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_IMPORT		MACRO	[alvar,var]
	pathmac_start
MYNARG	=	NARG
	PNARG	2
	PALVAR	{alvar}

	IFEQ	size_al_{alvar}-1
	db	p_importb
	ELSEIF
	db	p_importw
	ENDC
	PALVAROFFSET	{alvar}
	dw	{var}&WM
	pathmac_end
		ENDM

;--------------------------------------------------------------------
P_EXPORT		MACRO	[var,alvar]
	pathmac_start
MYNARG	=	NARG
	PNARG	2
	PALVAR	{alvar}

	IFEQ	size_al_{alvar}-1
	db	p_exportb
	ELSEIF
	db	p_exportw
	ENDC
	PALVAROFFSET	{alvar}
	dw	{var}&WM
	pathmac_end
		ENDM

;--------------------------------------------------------------------
P_DIV2		MACRO	[alvar]
	pathmac_start
MYNARG	=	NARG
	PNARG	1
	PALVAR	{alvar}

	IFEQ	size_al_{alvar}-1
	db	p_div2b
	ELSEIF
	db	p_div2w
	ENDC

	dw	al_{alvar}

	pathmac_end
		ENDM

;--------------------------------------------------------------------
P_INDEX		MACRO	[alvar,table,index]
	pathmac_start
MYNARG	=	NARG
	PNARG	3
	PALVAR	{alvar}
	PALVAR	{index}

	IFEQ	size_al_{alvar}-1
	db	p_indexb
	ELSEIF
	db	p_indexw
	ENDC

	dw	{table}&WM
	db	{table}>>16
	dw	al_{index}
	dw	al_{alvar}

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_PUSH		MACRO	[alvar]
	pathmac_start
MYNARG	=	NARG
	PNARG	1
	PALVAR	{alvar}

	IFEQ	size_al_{alvar}-1
	db	p_pushb
	ELSEIF
	db	p_pushw
	ENDC

	PALVAROFFSET	{alvar}
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_PULL		MACRO	[alvar]
	pathmac_start
MYNARG	=	NARG
	PNARG	1
	PALVAR	{alvar}

	IFEQ	size_al_{alvar}-1
	db	p_pullb
	ELSEIF
	db	p_pullw
	ENDC

	PALVAROFFSET	{alvar}
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_WITHINRADIUS	MACRO	[val,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	2
	db	p_withinrange
	dw	{val}
	dw	{addr}-paths
	
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_SHAPEINRADIUS	MACRO	[val,addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	2
	db	p_shapeinrange
	dw	{val}
	dw	{addr}-paths
	
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_JSL65816		MACRO	[addr]
	pathmac_start
MYNARG	=	NARG
	PNARG	1
	P_START65816
	jsl	{addr}
	P_END65816
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_BOOST		MACRO	[onoff]
	pathmac_start
MYNARG	=	NARG
	PNARG	1
	P_GOSUB	pboost{onoff}

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_BECOMECHILD	MACRO	[child]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	db	p_becomechild
	db	{child}
	
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_BECOMEMOTHER	MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0

	db	p_becomemother
	
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_BECOMESHAPE	MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0

	db	p_becomeshape
	
	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_UNBECOME		MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0
	db	p_unbecome
	pathmac_end
	ENDM
;--------------------------------------------------------------------
P_BECOME		MACRO
	pathmac_start
MYNARG	=	NARG
	PNARG	0
	db	p_become
	pathmac_end
	ENDM
;--------------------------------------------------------------------
P_SETCOLANIM		MACRO	[val]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	P_START65816
	s_init_colanim	x,#{val}
	P_END65816

	pathmac_end
		ENDM

;--------------------------------------------------------------------
P_ADDCOLANIM		MACRO	[val,endval]
	pathmac_start
MYNARG	=	NARG
	PNARG	2

	P_START65816
	s_add_colanim	x,#{val},#{endval}
	P_END65816

	pathmac_end
		ENDM

;--------------------------------------------------------------------
pollenon	=	0
pollenoff	=	1
P_POLLEN		MACRO	[onoff]
	pathmac_start
MYNARG	=	NARG
	PNARG	1

	IFEQ	pollen{onoff}
	P_JSL65816	makepollen_srou_l
	ELSEIF
	ENDC

	pathmac_end
		ENDM
;--------------------------------------------------------------------
P_SCORE	MACRO	[score]
	pathmac_start
	pathmac_end
	ENDM
;--------------------------------------------------------------------
P_CAMERA_LOCKON	macro
	p_start65816
	s_camera_lockon	x	;camera lock-on
	P_END65816
	ENDM
;--------------------------------------------------------------------
P_RETURN_CAMERA	macro
	p_start65816
	s_return_camera	;return camera to player
	P_END65816
	ENDM
;--------------------------------------------------------------------
P_KILLSHAPE	MACRO
	p_start65816
	s_remove_obj	x	;kill it
	P_END65816
	ENDM
;--------------------------------------------------------------------
P_SETVAR	MACRO	[size,var,value]
	p_start65816
	s_set_var		{size},{var},{value}
	P_END65816
	ENDM
;--------------------------------------------------------------------


