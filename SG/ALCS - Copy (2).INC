;-------------------------------------------------------------
; ALCS.INC
;

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
	zalc	tracept,2
	zalc	printpt,2
	zalc	drawmap,2
	zalc	showmap,2
	zalc	drawsprptr,2
	zalc	vmap1,2
	zalc	vmap2,2
	zalc	vcmap,2
	zalc	textpt,3
	zalc	tempaddrl,3

;	alc	godnuke,1
	
	alc	cont0l,1
	alc	cont0,1
	alc	cont1l,1
	alc	cont1,1
	alc	contl0l,1
	alc	contl0,1
	alc	contl1,1

	alc	trig0,0
	alc	trig0l,1
	alc	trig0h,1
	alc	trig1,0
	alc	trig1l,1
	alc	trig1h,1

	alc	hdmaen_gc,1
	alc	androssdead,2
	alc	nogodgun,2
	alc	subbgmmode,2
	zalc	blinktemp,1


;Map game zone alien lists and heights
	alc	zoneof,2
	alc	worldx,2
	alc	worldy,2
	alc	worldz,2
	alc	allst,2		;alien list
	alc	alfreeLst,2		;alien free blocks
	alc	sortz,2

;game movement vars

	alc	plrotx,2
	alc	plroty,2
	alc	plrotz,2
	alc	viewpt,2
	alc	playpt,2
	alc	al1pt,2
	alc	tjmp,2
	alc	flags,1
	alc	type,1
	alc	findfind,2
	alc	aldead,1
	alc	instruments,1	;flag for gauge NMI
	alc	rangexz,2
	alc	xcol,2
	alc	ycol,2
	alc	zcol,2
	alc	subbgm,2
	alc	mario_draw_mode,1
	alc	spriteblk,(128*4)+(128/4)
	alc	windowarray,maxwindows*wm_sizeof
	alc	windowmode,1

	include	GILESalc.inc

	xalc	friends,2
xlen	=	22*1024+450
	xalc	xroutines,xlen


	alc	helpshots,1

	alc	doingend,1
	alc	spranimcnt,2
	alc	crosshairon,2
	alc	shieldon,1
	alc	specwepcntone,2
	alc	speccnttwo,2
	alc	specwepcnttootemp,2
	alc	spritespos,2
	alc	mespos,2
	alc	mesendpos,2
	alc	scramble,1
	alc	gameover,1
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
	zalc	pat0ptr,2
	zalc	pattern0,1
	zalc	pattern1,1


; Vars kept between levels
	zalc	rand,4

;
; Workspace Vars
;
	alc	mariocode,1
	alc	varstart,0

	alc	z2,2

	alc	sinvx,1
	alc	cosvx,1
	alc	sinvy,1
	alc	cosvy,1
	alc	sinvz,1
	alc	cosvz,1
	alc	viewtype,1
	alc	ponex,2
	alc	poney,2
	
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

	alc	teamshots,2
	alc	teamon,2
	alc	sy,1
	alc	cy,1


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
	alc	actualroute,1
	alc	dontuse,1

; emuvars
	alc	ponehp,1



;Zero page variables
	zalc	mariopc,2
	zalc	marioBank,1


;RAM variables

	alc	isoviewmode,2	;*2
	alc	firerate,2	;*2

regs	equ	$3000
mr0	equ	$3000
mr1	equ	$3002	
mr2	equ	$3004	
mr3	equ	$3006	
mr4	equ	$3008	
mr5	equ	$300a	
mr6	equ	$300c	
mr7	equ	$300e	
mr8	equ	$3010	
mr9	equ	$3012	
mr10	equ	$3014	
mr11	equ	$3016	
mr12	equ	$3018	
mr13	equ	$301a	
mr14	equ	$301c	
mr15	equ	$301e	
mflags	equ	$3030
mcodebank	equ	$3034
mscrbase	equ	$3038
mio_mode	equ	$303a

	alc	open7,1
	alc	open8,1
	alc	godnuke,2

	alc	secretgodmode,2
	alc	madtrucker,2
	alc	darkmode,2
	alc	playpttwo,2
	alc	open1,1
	alc	open2,1
	alc	open31,1
	alc	open41,1
	alc	open51,1
	alc	open61,1

	alc	palnumber,2

	alc	weapptr,2
	alc	bgmtestptr,2
	alc	weapnextptr,2
	alc	bgmtestnextptr,2
	alc	playeronex,2
	alc	playeroney,2
	alc	testforassault,2
	alc	finalandross,2
	alc	keyrdown,2
	alc	keyldown,2
	alc	mouseleft,2
	alc	nolockview,2
	alc	bgmspeed,2
	alc	open55,1
	alc	open56,1
	alc	tunneltime,2
	alc	curstrat,2
	alc	noview,2
	alc	open3,2
	alc	open4,2
	alc	open5,2
	alc	open6,2

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
;	alc	swapcircle,1

; IRQ
	alc	oldviewposz,2
	alc	nmitemp,2
	alc	inatunnel,1
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
	alc	lives,2
	alc	livestwo,2
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
	alc	openalc1,2
	alc	openalc2,2
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
;	alc	pathy3,2
;	alc	pathz3,2
	alc	unused10,2
	alc	unused1,1
	alc	unused2,1
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
	alc	hominglasershots,1
	alc	wiretwoendflash,1
	alc	wireendflash,1
	alc	bgmtest,2
	alc	soundtest,1
	alc	debugalien,2
	alc	alientemp,2
	alc	selected,2
	alc	aliendflags,1
	alc	debugflash,1
	alc	ponedead,2
	alc	frametemp,1

	alc	ptwoshipflags2,1
ptwosf2_doublaser		equ	1	
ptwosf2_wireship		equ	2
ptwosf2_nospark		equ	4
ptwosf2_turn180		equ	8
ptwosf2_forceboost	equ	16
ptwosf2_boosting		equ	32
ptwosf2_braking		equ	64
ptwosf2_playerHP0		equ	128
	
; blink
	alc	arsebandx2,2
	alc	arsebandy2,2
	alc	nodotsmode,2
	alc	blinkval,2
	alc	scrollval,2

; kstrats
	alc	infog,1

; bgs
	alc	openalc3,2
	alc	levelinfo,1
	alc	newplayerstrat,3
	alc	pal0palette,8*32

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
	alc	ptwodead,2
	alc	ptwonumhits,2
	alc	ptworevivedelay,2
	alc	ponerevivedelay,2
	alc	inascene,2
	alc	randomfire,2
	alc	menuselected,2
	alc	rainbowlaser,2
	alc	bigheadmode,2
	alc	newgameplus,2
	alc	weaponnumber,2
	alc	weaponnumberptwo,2
	alc	weaponnumberpone,2
	alc	cockpitmode,2
	alc	twoplayer,2
	alc	playertwoactivated,2   
	alc	playertwocpuactivated,2
	alc	font,2
	alc	skipscramble,2
	alc	freezestrats,2

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
	alc	xval,2
	alc	yval,2
	alc	gamevwpos,1
	alc	planetdead,2
	alc	coldataval,1
	alc	fadedir,1
	alc	fade,1
	alc	hdmabg2hofs1,2
	alc	hdmabg2hofs2,2
	alc	bg3scrollflag,1
	alc	bg3scroll,2
	alc	transbmp1,1
	alc	bossmode,1
	alc	gamemode,2
	alc	depthnum,1
	alc	outvx,2
	alc	outvy,2
	alc	outvz,2
	alc	tempnum,2
	alc	outdist,2
	alc	bg2voffsbak,128
	alc	bg2scroll,2
	alc	lastrot,2
	alc	dobg2,2
	alc	dohofs,1
	alc	dovofs,1
	alc	showtype,1
	alc	kval1,2
	alc	shady,2
	alc	shadx,2
	alc	shadz,2
	alc	shadowheight,2
	alc	stayblack,1
	alc	texxy,2
	alc	head,2
	alc	spare,2
	alc	zbblks,0
;----------
	ifeq	0
	alc	connect_st0,1
	alc	connect_st1,1
	alc	reg0l,1
	alc	reg0h,1
	alc	mouse_con0,1
	alc	mouse_con1,1
	alc	mouse_sp_set0,1
	alc	mouse_sp_set1,1
	alc	mouse_sp0,1
	alc	mouse_sp1,1
	alc	mouse_sb0,1
	alc	mouse_sb1,1
	alc	cursol_x,1
	alc	cursol_y,1
	alc	mouse_sw0,1
	alc	mouse_sw1,1
	alc	mouse_y0,1
	alc	mouse_y1,1
	alc	mouse_x0,1
	alc	mouse_x1,1
	alc	mouse_swt0,1
	alc	mouse_swt1,1
	alc	mouse_con,1
	endc
;--------------
	alc	numshapes,2
	alc	dlptr,2
	alc	palfade,2
	alc	lastpalfade,2
	alc	palnum,2
	alc	palcnt,2
	alc	fadepal,1

; stratrou

	alc	objx,2
	alc	objy,2
	alc	objz,2
	alc	temphitflag2,1
	alc	flagset,1
	alc	collistcnt,2
	alc	collistcnt2,2
	alc	tmpcl,2
	alc	endurance,2
	alc	levelfeatures,2
	alc	enemy_firing,2
	alc	currshape,2
	alc	keeppstrat,1

	xalc	xhdma_tables,xhdma_max

; pstrats
	alc	spectotdead,1
	alc	spectot,1
	alc	defaultID,2


	include	kalcs.inc
	include	dalcs.inc
	include	ealcs.inc

	IFGT	wmempt-$2000
	printf	"%n%nTOO MANY ALCS USED%n%n"
	fail
	ENDC

alcon	=	0




