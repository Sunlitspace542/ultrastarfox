;	alc	playermac,2
;	xalc	macstrat,number_mac*2
;	xalc	macnmi,number_mac*2
;	xalc	macshape,number_mac*2
;	xalcp	macwepnumY,macwepnumA,number_mac
;	xalc	macflags,number_mac*2
;	xalcp	machp,macmaxhp,number_mac
;	xalc	wepfirecode,number_wep*2
;	xalcp	wepnumber,wepmackey,number_wep
;	xalcp	wepid,wepextra,number_wep



;---------------------------------------------------------------------------
	alc	slowstars,1
	alc	hudrot,2
	alc	tpa,2 ; Used as a temporary location for the accumulator (A)
	alc	pweptemp,2
	alc	strat_valid,1
	alc	fobj,2
	alc	nomaxbg2Yscroll,1
	alc	slowstars_viewposz,2

	alc	sflags,1
;---------------------------------------------------------------------------
	alc	gameflags,1
gf_nozremove		equ	1
gf_playerdying		equ	2
gf_bossdead		equ	4
gf_stratdone1		equ	8
gf_stratdone2		equ	16
gf_viewrot		equ	32
gf_playerdead		equ	64
gf_stagedone		equ	128

;---------------------------------------------------------------------------
	alc	gameflags2,1
gf2_stratflag1		equ	1
gf2_stratflag2		equ	2
gf2_viewclose		equ	4
gf2_ingame		equ	8

;---------------------------------------------------------------------------
	alc	stratflags,1
sf_nofiring	equ	1	


;---------------------------------------------------------------------------
	alc	bossflags,1
bf_flag1	equ	1
bf_flag2	equ	2
bf_flag3	equ	4
bf_easymode	equ	8
bf_dying	equ	16

;---------------------------------------------------------------------------
; giles strat vars.
	alc	svar_flags,1
	
	alc	missboundflags,1
mb_left	equ	1
mb_right	equ	2
mb_top	equ	4
mb_bottom	equ	8
mb_Lbottom	equ	16	; special left-bottom
mb_Ltop	equ	32	; special left-top
mb_Rtop	equ	64	; special left-top

;---------------------------------------------------------------------------
; player's ship flags
	alc	pshipflags,1
psf_bodycoll		equ	1	
psf_LWingcoll		equ	2
psf_Rwingcoll		equ	4	
psf_brkLWing		equ	8
psf_brkRwing		equ	16	
psf_noctrl		equ	32
psf_nofire		equ	64
psf_noYctrl		equ	128

	alc	pshipflags2,1
psf2_doublaser		equ	1	
psf2_wireship		equ	2
psf2_nospark		equ	4
psf2_turn180		equ	8
psf2_forceboost	equ	16
psf2_boosting		equ	32
psf2_braking		equ	64
psf2_playerHP0		equ	128

	alc	pshipflags3,1
psf3_intunnel		equ	1
psf3_enginesnd		equ	2	; 0/1 , off/on
psf3_forcebrake	equ	4
psf3_nocollisions	equ	8
psf3_beamball		equ	16

	alc	specials_dead,1

;---------------------------------------------------------------------------
	alc	playerflymode,1        
pfm_diefall	equ	1
pfm_dieYrot	equ	2
pfm_water	equ	4
pfm_shadows	equ	8        
pfm_wobble	equ	16


	alc	splayerflymode,1
spfm_norm		equ	0
spfm_close		equ	1
spfm_toinside		equ	2
spfm_inside		equ	3
spfm_tonorm		equ	4
spfm_maxmode		equ	5

	alc	splayerflymodeopt,1
spfmo_AB	equ	spfm_toinside	
spfmo_ABC	equ	spfm_maxmode


;---------------------------------------------------------------------------
	alc	pstratflags,1
pstf_novdistC		equ	1
pstf_flag1		equ	2
pstf_noviewmove	equ	4
pstf_inseq		equ	8
pstf_firstframeLcol	equ	16	; first frame player laser collision ON.
pstf_notdie		equ	32

;---------------------------------------------------------------------------
pml_Lwleft	equ	1
pml_Rwright	equ	2
pml_Lwtop	equ	4
pml_Lwbottom	equ	8
pml_Rwtop	equ	16
pml_Rwbottom	equ	32
pml_Btop	equ	64
pml_Bbottom	equ	128

pml_all	equ	pml_lwtop!pml_rwtop!pml_lwbottom!pml_rwbottom!pml_lwleft!pml_rwright!pml_Btop!pml_Bbottom

	alc	pmovelimit,1
	alc	pmovelimitAND,1

;---------------------------------------------------------------------------
; key flags.

kf_Lkeydown	equ	1
kf_LRkeydown	equ	2

	alc	keyflags,1
;---------------------------------------------------------------------------
	alc	superspeedcnt,1
	alc	superspeeddelay,1

	alc	framerate,1
	alc	viewfloatptr,2
	alc	viewfloatX,2
	alc	viewfloatY,2

	alc	playervelZ,2
	alc	playerdieYrotspeed,2

	alc	player_Zrotfloatptr,2
	alc	player_Zrotfloat,1
	
	alc	gasflags,1
	alc	wireendflash,1
	alc	pnumhits,1
	alc	pviewvelz,2
	alc	pviewposx,2
	alc	pviewposy,2
	alc	pviewposz,2
	alc	bgsscrollZ,2
	alc	pviewposzoff,2
	alc	player_rolldelay,1
	alc	player_rollZvel,1
	alc	player_rollZoff,1
	alc	player_zshake,2
	alc	player_zshakeV,2
	alc	player_Ztilt,1
	alc	player_zstratadd,1
	alc	player_speed,2
	alc	player_tospeed,1
	alc	player_medspeed,1
	alc	player_posx,2
	alc	player_posy,2
	alc	player_posz,2
	alc	stratobj_posx,2
	alc	stratobj_posy,2
	alc	stratobj_posz,2
	alc	playstrat_cnt,2
	alc	svar_word1,2
	alc	svar_word2,2
	alc	svar_word3,2
	alc	svar_dist,2
	alc	numplasers,1
	alc	firecnt,1
	alc	firedelay,1
	alc	specialdelay,1
	alc	screenflashcnt,1
	alc	screenflashtype,1
	alc	player_noctrlcnt,1
	alc	player_turnrot,2

	alc	svar_byte1,1
	alc	svar_byte2,1
	alc	svar_byte3,1
	alc	svar_byte4,1
	alc	svar_byte5,1
	alc	svar_byte6,1
	alc	smvar_byte1,2
	alc	smvar_byte2,2
	alc	smvar_byte3,2
	alc	smvar_word1,2
	alc	smvar_word2,2
	alc	smvar_word3,2
	alc	smvar_word4,2
	alc	swvar_word1,2	

	alc	wpposZ,2
	alc	maxstate,1

	alc	svar_weapx,2
	alc	svar_weapy,2
	alc	svar_weapz,2
	alc	svar_weapRy,1
	alc	svar_weapRx,1
	alc	svar_weapobj,2

	alc	gsvar_byte1,1		; global strategy variables
	alc	gsvar_byte2,1		; global strategy variables
	

	alc	psvar_byte1,1
	alc	psvar_byte2,1
	alc	psvar_byte3,1
	alc	psvar_word1,2
	alc	psvar_word2,2
	alc	psvar_word3,2
	alc	psvar_word4,2

	alc	timeuntilfade,1


	alc	pcollobj_LW,2
	alc	pcollobj_RW,2
	alc	pcollobj_B,2
	alc	pcboxobj_LW,2
	alc	pcboxobj_RW,2
	alc	pcboxobj_B,2

	alc	floatvar1,1	
	alc	floatvar2,1	

	alc	dummyobj,2 
	alc	boostcnt,1
	alc	boostZoff,1
	alc	minpmoveX,2
	alc	maxpmoveX,2
	alc	minMmoveX,2
	alc	maxMmoveX,2
	alc	minpmoveY,2
	alc	maxpmoveY,2
	alc	minpWmoveY,2
	alc	maxpWmoveY,2
	alc	maxMmoveY,2

	alc	missbTOPLEFT,2
	alc	missbTOPRIGHT,2
	alc	missbBOTLEFT,2 	
	alc	missbBOTRIGHT,2 	

	alc	viewCY,2
	alc	boostobj,2
	alc	pwingdistwall,2
	alc	rangexy,2

	alc	viewposXoff,2
	alc	viewposYoff,2
	
	alc	viewshakeX,1
	alc	viewshakeY,1
	alc	viewshakeZ,1

	alc	viewdist,2
	alc	viewaddx,2
	alc	viewaddy,2
	alc	viewtoobj,2
	alc	curr_ship,1
	alc	slimecount,1
	alc	internalPLAYPT,2


	alc	lastcont0,1
	alc	lastcontl0,1

	xalc	svar_collx,2
	xalc	svar_colly,2
	xalc	svar_collz,2

	xalc	playershape,2
	xalc	playershapeL,2
	xalc	playershapeR,2
	xalc	playershapeLR,2

	xalc	mac_numweapons,0 3*number_mac*2
	xalc	mac_Yweapons,0 3*number_mac*2
	xalc	mac_Aweapon,0 number_mac*2
	xalc	mac_strats,0 number_mac*2

	xalc	pcurr_macnum,2
	xalc	pcurr_weapon,1

	alc	trotx,1
	alc	troty,1
		      




