;***************************************************************************
;*                                                                         *
;*                               Star Fox                                  *
;*                              -----------                                *
;*                                                                         *
;*                           SuperNES version.                             *
;*                                                                         *
;*                                                                         *
;*                           Argonaut Software.                            *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   File: ALCS.INC                                                        *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr: Definitions for memory allocations.                             *
;*                                                                         *
;***************************************************************************

alcon	=	1



;---- Zero Page variables ----

	zalc	trans_flag,1
	zalc	x1fract,1
	zalc	x1,2
	zalc	x2,2
	zalc	framecnt,1
	zalc	y1fract,1
	zalc	y1,2
	zalc	y2,2
	zalc	dx,2
	zalc	dy,2
	zalc	lgrad,2
	zalc	ocode1,2
	zalc	ocode2,2
	zalc	cla1,2
	zalc	cla2,2
	zalc	clb1,2
	zalc	clb2,2
	zalc	clac,2
	zalc	clam,2
	zalc	clbm,2
	zalc	plotx1,2
	zalc	plotx2,2
	zalc	ploty1,2
	alc	mask1,2
	alc	mask2,2
	alc	pmask,2
	zalc	clx1,2
	zalc	cly1,2
	zalc	clx2,2
	zalc	cly2,2
	zalc	rad,2
	zalc	py1,2
	zalc	py2,2
	zalc	plm,2
	alc	framec,1
	zalc	tpx,1
	zalc	tpx1,1
	zalc	tpy,1
	zalc	tpy1,1
	zalc	tpz,1
	zalc	tpz1,1
;	zalc	tracept,2	; unused zp
	zalc	printpt,2
	zalc	drawmap,2
	zalc	showmap,2
;	zalc	drawsprptr,2	; unused zp
	zalc	vmap1,2
	zalc	vmap2,2
;	zalc	vcmap,2	; unused zp
	zalc	textpt,3
	zalc	tempaddrl,3

	alc	cont0l,1
	alc	cont0,1
	alc	contl0l,1
	alc	contl0,1
	alc	cont1l,1
	alc	cont1,1
	alc	contl1l,1
	alc	contl1,1
	alc	trig0,0
	alc	trig0l,1
	alc	trig0h,1
	alc	trig1,0
	alc	trig1l,1
	alc	trig1h,1
	alc	nmitimen_gc,1
	alc	hdmaen_gc,1
	alc	bcx,2
	alc	bcy,2
	alc	bcz,2
	zalc	blinktemp,1


;Map game zone alien lists and heights
	alc	zonex,1
	alc	zonez,1
	alc	zoneof,2
	alc	worldx,2
	alc	worldy,2
	alc	worldz,2
	alc	allst,2		;alien list
	alc	alfreeLst,2		;alien free blocks
	alc	scennum,2
	alc	plzoneof,2		;player zone ptr
	alc	alzoneof,2		;alien zone ptr
	alc	debug_1,2
	alc	sortz,2

;game movement vars
;	alc	pwepcnty,1
;	alc	pwepcnta,1
;	alc	pwepYnotA,1
;	alc	tankroty,2

	alc	plrotx,2
	alc	plroty,2
	alc	plrotz,2
	alc	viewpt,2
	alc	playpt,2
	alc	al1pt,2
	alc	al2pt,2
	alc	al3pt,2
	alc	gunx,1
	alc	guny,1
	alc	tjmp,2
	alc	flags,1
	alc	type,1
	alc	nearestpt,2
	alc	aldead,1
	alc	demoshape,2
	alc	walkrock,2	
	alc	fireh,2
	alc	instruments,1	;flag for gauge NMI
	alc	rangexz,2
	alc	anglexz,1
	alc	maxturn,1
	alc	enemys,1
	alc	attackers,1
	alc	rcol,2
	alc	xcol,2
	alc	ycol,2
	alc	zcol,2
	alc	depthtabptr,2
	alc	mario_draw_mode,1
	alc	spriteblk,(128*4)+(128/4)
	alc	windowarray,maxwindows*wm_sizeof
	alc	windowmode,1

	include	INC\GILESalc.inc

	xalc	friends,2
xlen	=	22*1024+450
	xalc	xroutines,xlen




	alc	doingend,1
;	alc	spranimcnt,2	; unused work ram
	alc	crosshairon,1
;	alc	shieldon,1	; unused work ram
	alc	specwepcnt,2
	alc	spritespos,2
	alc	mespos,2
	alc	mesendpos,2
	alc	scramble,1
;	alc	gameover,1	; unused work ram
;	alc	clearsprs,1
	alc	stageclear,1


	alc	stagecnt,2
	

	zalc	sptr,2
	zalc	pptr,2
	zalc	lptr,2
	zalc	fptr,3
	zalc	count1,1
	zalc	count2,1
	zalc	divsor,0
	zalc	m0,1
	zalc	m1,1
	zalc	divdnd,0
	zalc	m2,1
	zalc	m3,1
	zalc	m4,1
	zalc	m5,1
	zalc	quotient,0
	zalc	m6,1
	zalc	m7,1
	zalc	m8,1
	zalc	m9,1
	zalc	xp,1
	zalc	yp,1
	zalc	zp,1
	zalc	xr,1
	zalc	yr,1
	zalc	zr,1
	zalc	xs,2
	zalc	ys,2
	zalc	tmpx,2
	zalc	tmpy,2
	zalc	siny,1
	zalc	cosy,1
	zalc	mptr,2
	zalc	tmpz,2
	zalc	jmpvec,2
	zalc	sinx,1
	zalc	cosx,1
	zalc	px,2
	zalc	pz,2
	zalc	pr,2
	zalc	shift,1
	zalc	sign,1
	zalc	pl1x,1
	zalc	pl2x,1
	zalc	sinz,1
	zalc	cosz,1
	zalc	z1,2
	zalc	shiftz,1
	zalc	numnoclip,1
	zalc	noclip,1
	zalc	noclipx,1
	zalc	linedrawvec,2
	zalc	pauseflag,1
	zalc	strptr,2

	zalc	rotx,1
	zalc	roty,1
	zalc	rotz,1
	zalc	modx,1
	zalc	mody,1
	zalc	modz,1
	zalc	x3,2
	zalc	y3,2
	zalc	ux,2
	zalc	uy,2
	zalc	vx,2
	zalc	vy,2
	zalc	normx,2
	zalc	normy,2
	zalc	normz,2
	zalc	bigx,2
	zalc	bigy,2
	zalc	bigz,2
	zalc	expcnt,1
	zalc	numpnts,1
	zalc	numlines,1
	zalc	numfaces,1
	zalc	numals,1
	zalc	numdrawn,1
	zalc	numinrange,1
	alc	gameframe,2
	alc	colframe,1
	alc	animframe,1
	zalc	framenum,1
	zalc	viewposx,2
	zalc	viewposy,2
	zalc	viewposz,2
	zalc	viewx,1
	zalc	view1x,1
	zalc	view2x,1
	zalc	vanishx,2
	zalc	vanishy,2

	zalc	keybyte,1
	zalc	keybytel,1
	zalc	keybytep1,1
	zalc	keybytep2,1
	zalc	keybytec1,1
	zalc	keybytec2,1

	zalc	lasertemp,1
	zalc	collradius,2
	zalc	nearest,2
	zalc	nearestz,2
	zalc	drawflags,1
	zalc	drawopt,1

	zalc	x1f,1
	zalc	x2f,1
	zalc	x1finc,1
	zalc	x1inc,2
	zalc	x2finc,1
	zalc	x2inc,2
	zalc	dy1,1
	zalc	dy2,1
	zalc	tr1x,1
	zalc	tr2x,1
	zalc	highx,1
	zalc	numpnts2,1
;	zalc	pat0ptr,2
;	zalc	pattern0,1
;	zalc	pattern1,1


; Vars kept between levels
	IFEQ	rngmode-2
	zalc	rand,2
	ELSEIF
	zalc	rand,4
	ENDC
;
; Workspace Vars
;
	alc	mariocode,1
	alc	varstart,0

	alc	scalejmp,2
	alc	z2,2

	alc	sinvx,1
	alc	cosvx,1
	alc	sinvy,1
	alc	cosvy,1
	alc	sinvz,1
	alc	cosvz,1
	alc	viewtype,1
	alc	cxptr,1
	alc	cyptr,1
	alc	czptr,1


	alc	rotxx,1	;maxpts
	alc	rotxy,1	;maxpts
	alc	rotxz,1	;maxpts
	alc	rotyx,1	;maxpts
	alc	rotyy,1	;maxpts
	alc	rotyz,1	;maxpts
	alc	rotzx,1	;maxpts
	alc	rotzy,1	;maxpts
	alc	rotzz,1	;maxpts

	alc	mat11w,1
	alc	mat11,1
	alc	mat12w,1
	alc	mat12,1
	alc	mat13w,1
	alc	mat13,1
	alc	mat21w,1
	alc	mat21,1
	alc	mat22w,1
	alc	mat22,1
	alc	mat23w,1
	alc	mat23,1
	alc	mat31w,1
	alc	mat31,1
	alc	mat32w,1
	alc	mat32,1
	alc	mat33w,1
	alc	mat33,1

	alc	t1w,1
	alc	t1,1
	alc	t2w,1
	alc	t2,1
	alc	t3w,1
	alc	t3,1
	alc	t4w,1
	alc	t4,1
	alc	sx,1
	alc	cx,1
	alc	sy,1
	alc	cy,1
	alc	sz,1
	alc	cz,1

	alc	rmat11w,1
	alc	rmat11,1
	alc	rmat12w,1
	alc	rmat12,1
	alc	rmat13w,1
	alc	rmat13,1
	alc	rmat21w,1
	alc	rmat21,1
	alc	rmat22w,1
	alc	rmat22,1
	alc	rmat23w,1
	alc	rmat23,1
	alc	rmat31w,1
	alc	rmat31,1
	alc	rmat32w,1
	alc	rmat32,1
	alc	rmat33w,1
	alc	rmat33,1

	alc	pmat11w,1
	alc	pmat11,1
	alc	pmat12w,1
	alc	pmat12,1
	alc	pmat13w,1
	alc	pmat13,1
	alc	pmat21w,1
	alc	pmat21,1
	alc	pmat22w,1
	alc	pmat22,1
	alc	pmat23w,1
	alc	pmat23,1
	alc	pmat31w,1
	alc	pmat31,1
	alc	pmat32w,1
	alc	pmat32,1
	alc	pmat33w,1
	alc	pmat33,1

	alc	wmat11w,1
	alc	wmat11,1
	alc	wmat12w,1
	alc	wmat12,1
	alc	wmat13w,1
	alc	wmat13,1
	alc	wmat21w,1
	alc	wmat21,1
	alc	wmat22w,1
	alc	wmat22,1
	alc	wmat23w,1
	alc	wmat23,1
	alc	wmat31w,1
	alc	wmat31,1
	alc	wmat32w,1
	alc	wmat32,1
	alc	wmat33w,1
	alc	wmat33,1

	alc	matxw,1
	alc	matx,1
	alc	matyw,1
	alc	maty,1
	alc	matzw,1
	alc	matz,1

	alc	viewrotxw,1
	alc	viewrotx,1
	alc	viewrotyw,1
	alc	viewroty,1
	alc	viewrotzw,1
	alc	viewrotz,1

	alc	pxx,2
	alc	pxy,2
	alc	pxz,2
	alc	pyx,2
	alc	pyy,2
	alc	pyz,2
	alc	pzx,2
	alc	pzy,2
	alc	pzz,2

	alc	gridx,1
	alc	gridz,1
	alc	gridcol,1

;Zero page variables
	zalc	mariopc,2
	zalc	marioBank,1

;RAM variables
	alc	sreg,2	;*2
	alc	dreg,2	;*2
	alc	oreg,2	;*2
	alc	imbuf,2

	alc	mr14old,2
	alc	getbuf,2

	alc	mr0d,2
	alc	mr1d,2
	alc	mr2d,2
	alc	mr3d,2
	alc	mr4d,2
	alc	mr5d,2
	alc	mr6d,2
	alc	mr7d,2

	alc	mrcolour,2

	alc	omode,1
	alc	dispbuf,33
	alc	mmtr,4
	alc	mmt1,2
	alc	mmt2,2
	alc	cycles,2
	alc	cyclec,2
	alc	cycler,2	;ram


; COLDET
	zalc	scale,2
	zalc	scalecnt,2

; TRANS
	alc	bg2yscroll,2
	alc	bg2xscroll,2
	alc	spacescz,2
	alc	dospacesc,1
	alc	framer,1
	alc	framecount,1
	alc	frames,1
	alc	framesb,1
	alc	windowptr,2

	alc	circleobj,2
	alc	circleanim,2
	alc	circledestrad,2
	alc	circlerad,2
	alc	circlespeed,2
	alc	circlespeedadd,2
	alc	circleblue,1
	alc	circlegreen,1
	alc	circlered,1
	alc	circlesrcblue,1
	alc	circlesrcgreen,1
	alc	circlesrcred,1
	alc	circlebluespeed,1
	alc	circlegreenspeed,1
	alc	circleredspeed,1
	alc	circleblueframe,1
	alc	circlegreenframe,1
	alc	circleredframe,1
	alc	circleblueframesrc,1
	alc	circlegreenframesrc,1
	alc	circleredframesrc,1
	alc	swapcircle,1

; IRQ
	alc	oldviewposz,2
	alc	nmitemp,2
	alc	inatunnel,1
	alc	flashstarsflag,1
	alc	fstarspos,2
	alc	shieldup,1

; planets
	alc	routes,2*num_routes
	alc	stage,2
	alc	whichroute,1
	alc	currentplanet,2
	alc	dmatemp,2
	alc	mapmode,2
	alc	bg_dmalist,2
	alc	bgtransspeed,2
	alc	newtm,1
	alc	lightx,2
	alc	lighty,2
	alc	lightz,2
	alc	lightangle,2
	alc	lives,1
	alc	comet,1

; draw
	alc	hilite,2
	alc	printbtemp,1

; game
	alc	dozrot,1
	alc	arsebandX,2
	alc	arsebandY,2


; bootnmi
	alc	ntscpal,1

; world
	alc	lastmapobj,2
	alc	dotsflag,2
	alc	mapcnt,2
	alc	mapptr,2
	alc	lastplayz,2
	alc	lastzchange,2
	alc	mapjsrstk,3*15
	alc	mapjsrptr,2
	alc	nummapjsr,2
	alc	mapvar1,2
	alc	mapvar2,2
	alc	mapvar3,2
	alc	mapvar4,2
	alc	specialobjtotal,1
	alc	maprestart,2
	alc	maprestarttemp,2
	alc	currentbg,2
	alc	maploops,2*4
	alc	mapaddrs,2*4
	alc	nummaploops,2

; mother
	alc	motheraccum,2

; paths
	alc	pathx1,2
	alc	pathy1,2
	alc	pathz1,2
	alc	pathx2,2
	alc	pathy2,2
	alc	pathz2,2
	alc	pathx3,2
	alc	pathy3,2
	alc	pathz3,2
	alc	pathlink,2

; dstrats
	alc	armmode,1
	alc	chickenbyte,1
	alc	maptrigger,1
	alc	powerbuild,1
	alc	locusmode,1
	alc	tmpstate,2
	alc	restartbg,2
	alc	restartpalfade,2

; debug
	alc	debugalien,1
	alc	alientemp,2
	alc	aliendflags,1
	alc	freezestrats,1
	alc	selected,2
	alc	debugflash,1

; blink
	alc	blinkval,2
	alc	scrollval,2

; kstrats
	alc	infog,1

; bgs
	alc	nowaits,2
	alc	levelinfo,1
	alc	newplayerstrat,3
	alc	pal0palette,8*32
	alc	newmode,1

	alc	vram1addr,2		;VRAM transfer address
	alc	vram1len,2		;VRAM transfer length (BG2 CHR,gen.)
	alc	vram2addr,2		;BG2 scr
	alc	vram2len,2
	alc	vram3addr,3		;Palette address (24 bit, not VRAM)
	alc	vram3len,2
	alc	gamepal,1

; continue
	alc	credits,2
	alc	whichfriend,1
	alc	friends_msg,2
	alc	msg_count1,1
	alc	msg_count2,1


; main
	alc	fox,1	; hack to allow check for fox's hp
	alc	friends_HP,0
	alc	bunny,1
	alc	cock,1
	alc	frog,1
	alc	pepper,1
	alc	andorf,1
	alc	hdmacirclebuf1,2
	alc	hdmacirclebuf2,2
	alc	whichcircle,1
;	alc	numhere,2
	alc	gamevwpos,1
	alc	planetdead,2
;	alc	oldplanetdead,2
;	alc	coldataval,1
	alc	fadedir,1
	alc	fade,1
	alc	hdmabg2hofs1,2
	alc	hdmabg2hofs2,2
	alc	bg3scrollflag,1
	alc	bg3scroll,2
	alc	transbmp1,1
	alc	time1,3
	alc	time2,3
	alc	gamemode,2
;	alc	depthnum,1
	alc	outvx,2
	alc	outvy,2
	alc	outvz,2
	alc	outdist,2
	alc	bg2voffsbak,128
	alc	bg2scroll,2
	alc	lastrot,2
	alc	dobg2,2
	alc	dohofs,1
	alc	dovofs,1
	alc	othmusic,1
	alc	showtype,1
	alc	kval1,2
	alc	shady,2
	alc	shadx,2
	alc	shadz,2
	alc	shadowheight,2
;	alc	foxyfoxy,1
	alc	stayblack,1
;	alc	cgadsub_bak,1
;	alc	coldata_bak,1
;	alc	cgswsel_bak,1
	alc	ts_bak,1
	alc	texxy,2
	alc	head,2
	alc	spare,2
;	alc	zbblks,zb_size*number_zb			;1400 bytes free!

;ADD NEW ALCS HERE------------------------------
	IFNE	mouseon
	alc	mousemode,2
	alc	mousemodetemp,2
	alc	boostorbrake,2
	ENDC
	alc	open_text,2
	IFNE	msu1
	alc	msupresent,1
	ENDC
	alc	boostcnt,1

; msudrv.asm
	IFNE	MSU1
	zalc	msufadeflag,1	; \
	zalc	curmsuvolume,1	; / MUST BE IN ZEROPAGE!!
	zalc	msu_dest_zptr,2	; zp pointer for data stream destination address

	; MSU-1 data streaming routine alcs
	alc	msu_read_len,2
	alc	orchorband,1	; orchestra or band (for player down BGM) [0 = band, 1 = orch]
msu_band	equ	0
msu_orch	equ	1
	ENDC

	IFNE	RUMBLE
; zeropage alcs for rumble
	zalc	rumble_cmd,1	; command byte
	zalc	rumble_time,1	; time (in frames, 0-255) to rumble
	zalc	rumble_index,1	; index into rumble_table for sequenced rumbles (0-255)
	ENDC

;---------------------------------------------------
	alc	numshapes,2
	alc	dlptr,2
	alc	palfade,2
	alc	lastpalfade,2
	alc	palnum,2
	alc	palcnt,2
	alc	fadepal,1
	IFNE	RUMBLE
	alc	rumble_table,rmblseqlen	; cache for sequenced rumble commands (unfortunately it must be done this way)
	ENDC
; stratrou

	alc	objx,2
	alc	objy,2
	alc	objz,2
	alc	temphitflag2,1
	alc	flagset,1
	alc	temphitflag,1
	alc	collistcnt,2
	alc	collistcnt2,2
	alc	tmpcl,2
	alc	temp23,2
	alc	currshape,2
;	alc	keeppstrat,1
;	alc	monitorcrosshairon,1	; FOR MONITOR TEST ONLY!!!

	xalc	xhdma_tables,xhdma_max

; pstrats
	alc	spectotdead,1
	alc	spectot,1
	alc	defaultID,2

	include	INC\mousealc.inc
	include	INC\kalcs.inc
	include	INC\dalcs.inc
	include	INC\ealcs.inc

	IFGT	wmempt-$2000
	printf	"%n%nTOO MANY ALCS USED%n%n"
	fail
	ENDC

alcon	=	0




