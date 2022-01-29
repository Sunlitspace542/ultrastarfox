;-------------------------------------------------------------------
; structure for basic map header
	structure	mapbase&WM
	struct	map_ctrl,1
	struct	map_count,2
	struct	map_size,0
map_sizeof	=	map_size-mapbase&WM

;-------------------------------------------------------------------
; structure for basic mothermap header
	structure	mapbase
	struct	moth_ctrl,1
	struct	moth_count,2
	struct	moth_size,0
moth_sizeof	=	moth_size-mapbase

;-------------------------------------------------------------------
; structure for mapmother


	structure	map_size
	struct	mm_x,2
	struct	mm_y,2
	struct	mm_z,2
	struct	mm_shape,2
	struct	mm_strat,3
	struct	mm_map,2
	struct	mm_size,0
mm_sizeof	equ	mm_size-mapbase&WM

;-------------------------------------------------------------------
; structure for mapremove
	structure	map_size
	struct	mr_shape,2
	struct	mr_size,0
mr_sizeof	equ	mr_size-mapbase&WM

;-------------------------------------------------------------------
; mothermap structures
;-------------------------------------------------------------------
; structure for motherobj
	structure	moth_size
	struct	mo_x,2
	struct	mo_y,2
	struct	mo_z,2
	struct	mo_shape,2
	struct	mo_strat,3
	struct	mo_size,0
mo_sizeof	=	mo_size-mapbase

;-------------------------------------------------------------------
; structure for motherloop
	structure	moth_size
	struct	ml_loop,2
	struct	ml_count,1
	struct	ml_size,0
ml_sizeof	=	ml_size-mapbase

;-------------------------------------------------------------------
; structure for mothergoto
	structure	moth_size
	struct	mg_loop,2
	struct	mg_size,0
mg_sizeof	=	mg_size-mapbase

;-------------------------------------------------------------------
; structure for mothercount
	structure	moth_size
	struct	mc_shape,2
	struct	mc_size,0
mc_sizeof	=	mc_size-mapbase

;-------------------------------------------------------------------
; structure for motherjump
	structure	moth_size
	struct	mj_val,2
	struct	mj_addr,2
	struct	mj_func,1	; 0 = EQ, 1 = NE, 2 = GT, 3 = LT
	struct	mj_size,0
mj_sizeof	=	mj_size-mapbase

mj_EQ	equ	0
mj_NE	equ	1
mj_GT	equ	2
mj_LT	equ	3


;-------------------------------------------------------------------
; structure for motherset

	structure	moth_size
	struct	ms_size,0
ms_sizeof	=	ms_size-mapbase



;-------------------------------------------------------------------
; normal map structures
;-------------------------------------------------------------------
; structure for mapqobj

	structure	map_size-1
	struct	mq_x,1
	struct	mq_y,1
	struct	mq_z,1
	struct	mq_shape,1
	struct	mq_strat,1
	struct	mq_size,0
mq_sizeof	equ	mq_size-mapbase&WM

;-------------------------------------------------------------------
; structure for mapobj8

	structure	map_size-1 ; (count is only byte sized)
	struct	m8_x,1
	struct	m8_y,1
	struct	m8_z,1
	struct	m8_shape,1
	struct	m8_strat,1
	struct	m8_size,0
m8_sizeof	equ	m8_size-mapbase&WM

;-------------------------------------------------------------------
; structure for mapdobj

	structure	map_size
	struct	md_x,2
	struct	md_y,2
	struct	md_z,2
	struct	md_strat,1
	struct	md_size,0
md_sizeof	equ	md_size-mapbase&WM

;-------------------------------------------------------------------
; structure for mapobj

	structure	map_size
	struct	mobj_x,2
	struct	mobj_y,2
	struct	mobj_z,2
	struct	mobj_shape,1
	struct	mobj_strat,1
	struct	mobj_size,0
mobj_sizeof	equ	mobj_size-mapbase&WM

;-------------------------------------------------------------------
; structure for mapobjzrot

	structure	map_size
	struct	mz_x,2
	struct	mz_y,2
	struct	mz_z,2
	struct	mz_shape,1
	struct	mz_strat,1
	struct	mz_rotz,1
	struct	mz_size,0
mz_sizeof	equ	mz_size-mapbase&WM


