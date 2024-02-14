	alc	flashbg,1
	alc	fadetored,1
	alc	dogyirq,1
	alc	flashtunnelon,1
	alc	c_type,1
	alc	noirqbit3,1
	alc	pallen,2

;----- bg request flags
	alc	bgflags,1
bgf_restart	equ	1
bgf_foxy	equ	2
bgf_bg	equ	4
bgf_info	equ	8
bgf_text	equ	16

	alc	restartcol,1		;on level 3-3, 1=use sea, 2=use gnd

;----- end sequence vars
	alc	palfrom,2
	alc	palto,2
	alc	viewyoff,2
	alc	seq_handler,2
	alc	seq_tptr,2
	alc	seq_vm,2
	xalc	seq_buffer,255
	alc	democnt,2
	alc	demoptr,2
	alc	bg3vofsbak,2
	alc	bg3hofsbak,2
	alc	bg2vofsbak,2
	alc	bg2hofsbak,2
	alc	bg1vofsbak,2
	alc	bg1hofsbak,2
	alc	bg3vofsreq,2
	alc	bg3hofsreq,2
	alc	bg2vofsreq,2
	alc	bg2hofsreq,2
	alc	bg1vofsreq,2
	alc	bg1hofsreq,2

;sound
	zalc	address,3
	alc	ktpx,2
	alc	ktpy,2
	alc	ktpz,2
	alc	playersndflag,1
	alc	lastplayx,2
	alc	bgmcnt,1
	alc	bgm_music,1
	alc	lsnd,1
	alc	csnd,1
	alc	rsnd,1
	alc	msnd,1
	alc	fsnd,1
	alc	sdspt3,2
	alc	sdgpt3,2
	alc	sdpck3,1
	alc	pausesnd,1
	alc	sdport3,16
	alc	snd_ptr,2
	alc	firstdnld,1
	alc	lastblock,2
	alc	circleaff,1

;end sequence
	alc	boss_ptr,2
	alc	boss_seq,5*16
	alc	specptr,2
	alc	specbuf,9

	xalc	lrtw,4
	alc	noxrot,1

sprar_up	equ	1
sprar_down	equ	2
sprar_left	equ	4
sprar_right	equ	8
	alc	arrows,1
	alc	specflash,1
	alc	wintabptr,2
	alc	sprframe,2
	alc	onecredspr,1
	alc	doneacircle,1

	alc	nosetport3,1
	alc	doawipe,1
	alc	doingwipe,1


le_fadetowhite	equ	4
le_fadedown	equ	5
le_endofgame	equ	6
le_startgame	equ	7
le_endofcreds	equ	8
le_endtotalscore equ	9
le_gameover	equ	10
le_bhole1	equ	11
le_bhole2	equ	12
le_bhole3	equ	13
le_special	equ	14
le_enterbhole	equ	15
le_enterspec	equ	16

	alc	levelfinished,2

	alc	kcvposx,2
	alc	kcvposy,2
	alc	kcvposz,2

	alc	contsmart,1
	alc	nmitemp2,2
	alc	bg2vofsoverride,1
	xalc	maintempalc,2
	xalc	contexit,2
	alc	prttraining,1
	alc	defaulttrain,1
	alc	numendok,1
	alc	port1bolox,1

rotate_hof	equ	0
tunnel1_hof	equ	2
tunnel2_hof	equ	4
water_hof	equ	6
tunnel3_hof	equ	8
nograd_hof	equ	10
bhole_hof	equ	12
bholescale_hof	equ	14
	alc	hposjmp,2
	xalc	bholescaleval,2

; Memory allocated for crunched palettes when decrunched. see CONFIG/ALLCOLS.INC.
	xxalc	gamepalettes,maxcolscru*32
__totpallen	=	0
__totpallines	=	0
; Index of crunched palettes in ALLCOLS.PAC
	defpac	bgoopspac,2
	defpac	bg2apac,7
	defpac	bg2bpac,13
	defpac	bg2cpac,7
	defpac	bg2dpac,7
	defpac	bg2epac,9
	defpac	bg2fpac,7
	defpac	bg2gpac,7
	defpac	bgtmpac,7
	defpac	bgtm2pac,7
	defpac	bgtm3pac,7
	defpac	bgtm4pac,7
	defpac	bgbmpac,7
	defpac	bglightpac,7
	defpac	bgspacepac,7
	defpac	bgstarspac,7
	defpac	bgcppac,7
	defpac	bgcpuspac,7
	defpac	bgcpusppac,7
	defpac	bgcpgpac,7
	defpac	bgholepac,7
	defpac	bglpac,7
	defpac	bgetest0pac,7
	defpac	bgetestpac,7
	defpac	spritepal,5
	defpac	bg2eppac,9
; add new palettes before this line
; the order of this list must match DATA\COL\PC.BAT!
bgfoxpac	equ	bg2bpac
	IFEQ	CONTROLSSCREENPAL
bgcontpac	equ	bg2epac ; ntsc
	ELSEIF
bgcontpac	equ	bg2eppac ; pal
	ENDC
obj2pac	equ	bg2epac+8*32
