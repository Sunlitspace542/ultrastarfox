;***************************************************************************
;*                                                                         *
;*                               Star Fox                                  *
;*                              -----------                                *
;*                                                                         *
;*                           SuperNES version.                             *
;*                                                                         *
;*                                                                         *
;*                           Argonaut Software.        		               *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   File: STRATEQU.inc	                                                   *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*  Descr: STRATEGY EQUATES FOR OBJECTS.                                   *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;*   Date: 24/2/92                                                         *
;*                                                                         *
;*                                                                         *
;*_________________________________________________________________________*
;*                                                                         *
;* Author:								                                   *
;*          Anybody !                                                      *
;*                                                                         *
;***************************************************************************
;*
;*
;* nameHP   = hit count.
;* nameAP 	= hit count affect on other objects.
;* nameNS	= number of shots fired.
;*
;*
;*

;-----------------------------------------------------------------------------
; Things.

Xspacebarlen	equ	500
Xspacebarsize	equ	50
Yspacebarlen	equ	500
Yspacebarsize	equ	50
Zspacebarlen	equ	500
Zspacebarsize	equ	50


SXspacebarlen	equ	250
SXspacebarsize	equ	50
SYspacebarlen	equ	250
SYspacebarsize	equ	50
SZspacebarlen	equ	250
SZspacebarsize	equ	50




;-----------------------------------------------------------------------------
; STATIC NEUTRAL.

tunnelHP	equ	20		
hardAP	equ	8		
rockhardAP	equ	20		
hardHP	equ	-1
core1HP	equ	6


;-----------------------------------------------------------------------------
; WEAPON HP/AP

missile1AP	equ	8		
kamihmissile1HP	equ	2		
kamihmissile1AP	equ	8		
hmissile1HP	equ	2		
hmissile1AP	equ	8		
hmissile2HP	equ	8		
hmissile2AP	equ	4		
missile2HP	equ	2		
missile2AP	equ	4		
phazerAP	equ	1		
enemylaserAP	equ	2		
plasmaAP	equ	10		
HplasmaAP	equ	10		
;; Nova Bomb (Nuke) Parameters
nukeAP	equ	8		; on each object.
nukeRATE	equ	200		;
nukeMAXRADIUS	equ	7000		;
defaultNukeCount	equ	3
;;

;; ELASER
	IFEQ	cesdemo-1
elaserAP	equ	4	
playerbeamAP	equ	5
	ELSEIF		
elaserAP	equ	2
playerbeamAP	equ	3
	ENDC	

;-----------------------------------------------------------------------------
; MOVING ENEMY.

windmillHP	equ	6
windmillAP	equ	4
bee1HP	equ	4
bee1AP	equ	6
domaHP	equ	2
starbullHP	equ	16		; G
starbullAP	equ	1		; G
textbullHP	equ	30		; G
textbullNS	equ	20		; G
walkerHP	equ	5		; G
misspodHP	equ	2
misspodAP	equ	16
fighterHP	equ	2+2
fighterAP	equ	4
flypillarHP	equ	12
flypillarAP	equ	16
sokutenHP	equ	16
sokutenAP	equ	16
wormHP	equ	2
wormAP	equ	4
sharkHP	equ	4
sharkAP	equ	6
ship1HP	equ	20
ship1AP	equ	16
ship2HP	equ	40
ship2AP	equ	16
ship3HP	equ	hardHP
ship3AP	equ	16
ship4HP	equ	hardHP
ship4AP	equ	16
torpedoHP	equ	4
torpedoAP	equ	4
crabHP	equ	4
crabAP	equ	4
kamiHP	equ	4
kamiAP	equ	8
jump0HP	equ	2
jump0AP	equ	4
jump1HP	equ	hardHP
jump1AP	equ	8
truckHP	equ	4
truckAP	equ	8
patrolHP	equ	4
patrolAP	equ	4
evaderHP	equ	8
evaderAP	equ	4
woodsHP	equ	2
woodsAP	equ	8
misstankHP	equ	4
misstankAP	equ	8
houdaiHP	equ	8
houdaiAP	equ	8
zaco1HP	equ	2
zaco1AP	equ	4
zaco2HP	equ	4
zaco2AP	equ	4
Szaco0HP	equ	4
Szaco0AP	equ	8
Szaco2HP	equ	2
Szaco2AP	equ	8
Szaco5HP	equ	2
Szaco5AP	equ	8
FzacoHP	equ	4
FzacoAP	equ	8
door1AP	equ	8
zacosHP	equ	2
zacosAP	equ	4
raderHP	equ	8
raderAP	equ	4
friendHP	equ	8
friendAP	equ	4
wlHP	equ	8
wlAP	equ	16
ripmanHP	equ	4
ripmanAP	equ	16
winglazermanHP	equ	8
winglazermanAP	equ	16
up1manAP	equ	8
bomwingHP	equ	4
bomwingAP	equ	8
wiremanHP	equ	4
wiremanAP	equ	16

MOTHERDIST	EQU	1600
TURRETDIST	EQU	1300
flyHP	EQU	2
flyAP	EQU	4
flyDIST	EQU	700
flyFC	EQU	4	; amount of times the fly fires
cubeHP	EQU	100
cubeAP	EQU	16
saucer1HP	EQU	12
saucer1AP	EQU	1
saucer1FC	EQU	2
saucer1DIST	EQU	400
paraHP	EQU	2
paraAP	EQU	4
paraSWINGSPD	EQU	5
paraSWINGMAX	EQU	paraSWINGSPD*3
pillar3HP	EQU	8
pillar3fallHP 	EQU	4
pillar3AP	EQU	8
pillar3DIST	EQU	500
floor1HP	EQU	5
floor1AP	EQU	2
floor1DIST	EQU	600
walkingHP	EQU	8
walkingAP	EQU	16
wall1AP	EQU	16
wall1DIST	EQU	600
meteorHP	EQU	2
meteorAP	EQU	12
beamboxHP	EQU	10
beamboxAP	EQU	8
swingwalHP	EQU	20
swingwalAP	EQU	8
irisHP	EQU	2
irisAP	EQU	8
swingHP	EQU	12
swingAP	EQU	6
cameleonHP	EQU	2
cameleonAP	EQU	8
hiderHP	EQU	2
hiderAP	EQU	6
mine0HP	EQU	2
mine0AP	EQU	10
dbossHP	EQU	10
dbossAP	EQU	10
crown3HP	EQU	8
crown3AP	EQU	8
saucerHP	EQU	10
saucerAP	EQU	4
ejectHP	EQU	8
ejectAP	EQU	8
cruiser2launcherHP	EQU	4
bazookaHP	EQU	8
bazookaAP	EQU	16
upermHP	EQU	2
upermAP	EQU	8
warpHP	EQU	4
warpAP	EQU	8
tank2HP	EQU	40
tank2AP	EQU	32
dragonflyHP	EQU	2
dragonflyAP	EQU	8
SdragonflyHP	EQU	2
SdragonflyAP	EQU	4
shou0HP	equ	2
shou0AP	equ	12
walker2HP	equ	10
walker2AP	equ	8

;-----------------------------------------------------------------------------
; BOSS ENEMY

boss1turretHP	equ	8		; barricader
boss1turretAP	equ	16
boss1HP	equ	70
boss2covAP	equ	16

boss2turretHP	equ	16		; spin top
boss2turretAP	equ	16
boss2petalAP	equ	1
boss2topHP	equ	64
boss2topAP	equ	1
			  	; bar launcher
boss5launchHP	equ	4
boss5barAP	equ	8

boss7HP		equ	40	; planet launcher
boss7hatchHP		equ	16
boss7launcherHP	equ	8

boss8HP		equ	32	; washing machine 
nucleusLaunchAP	equ	8
nucleusBeamLAP		equ	8


bossAturrHP	equ	12		 
bossAcupHP	equ	24
bossAAP	equ	16

bossBairHP	equ	40	64
bossBspinHP	equ	30	50
bossBrobHP	equ	32	64
bossBAP	equ	16

bossFlauncherAP	equ	10
bossFlauncherHP	equ	8/2
bossFlauncher2HP	equ	16/2



boss2_scale	equ	3
boss5_scale	equ	3
boss7_scale	equ	3
boss8_scale	equ	3
boss8_rotspeed	equ	1
boss8_circ	equ	150<<boss8_scale
bossA_scale	equ	2
bossB_scale	equ	2
bossF_scale	equ	3
bossH_scale	equ	2
mybase_scale	equ	3

;-----------------------------------------------------------------------------
; STATIC ENEMY.

bu_scale	equ	2
bu_scale2	equ	3
turretHP	equ	4		; D
turretAP	equ	1		; D
flowerHP	equ	4		; D
flowerAP	equ	1		; D
recItemHP	equ	1
coreHP	equ	8
coreAP	equ	4


;-----------------------------------------------------------------------------
; PLAYER.

playerW_HP	equ	5	; Wings HP/health/shield (Stock = 5)
playerB_HP	equ	40	; Player Body HP/health/shield (Stock = 40)
playerW_AP	equ	3
playerB_AP	equ	3	       
playerB_boxsize	equ	10

playerW_boxsize	equ	5
TplayerW_x	equ	20
playerW_x	equ	33
playerW_y	equ	13
playerW_z	equ	0
playerB_z	equ	0


playerB_Ystop	equ	-20


pBhardAP	equ	4
pBsoftAP	equ	2
pWhardAP	equ	1
pWsoftAP	equ	1

maxPspeed	equ	85	
medPspeed	equ	65	
minPspeed	equ	20	

pexitbasespeed	equ	50

nullpship	equ	2


;-----------------------------------------------------------------------------
Stunnel_viewCY		equ	-60
Stunnel_minX		equ	-60	
Stunnel_maxX		equ	60	
Stunnel_MminX		equ	-60	
Stunnel_MmaxX		equ	60	
Stunnel_minY		equ	-60+Stunnel_viewCY
Stunnel_maxY		equ	60+Stunnel_viewCY	
Stunnel_MmaxY		equ	60+Stunnel_viewCY	
Stunnel_flymode	equ	pfm_diefall!pfm_shadows
Stunnel_pmovelimitAND	equ	pml_all
Stunnel_missboundflags	equ	mb_left!mb_right!mb_bottom
Stunnel_gameflagsON	equ	0
Stunnel_gameflagsOFF	equ	gf_viewrot

Stunnel_macro		MACRO
	s_and_var	B,pshipflags2,#~psf2_nospark
	s_and_var		B,pstratflags,#~(pstf_inseq!pstf_notdie)
	s_set_alsflag		x,shadow
	s_or_var		B,pshipflags3,#psf3_intunnel
		ENDM


;-----------------------------------------------------------------------------
Mtunnel_viewCY		equ	-60
Mtunnel_minX		equ	-90	
Mtunnel_maxX		equ	90	
Mtunnel_MminX		equ	-90	
Mtunnel_MmaxX		equ	90	
Mtunnel_minY		equ	-60+Mtunnel_viewCY	
Mtunnel_maxY		equ	60+Mtunnel_viewCY	
Mtunnel_MmaxY		equ	60+Mtunnel_viewCY	
Mtunnel_flymode	equ	pfm_diefall!pfm_shadows
Mtunnel_pmovelimitAND	equ	pml_all
Mtunnel_missboundflags	equ	mb_left!mb_right!mb_bottom
Mtunnel_gameflagsON	equ	0
Mtunnel_gameflagsOFF	equ	gf_viewrot

Mtunnel_macro		MACRO
	s_and_var	B,pshipflags2,#~psf2_nospark
	s_and_var		B,pstratflags,#~(pstf_inseq!pstf_notdie)
	s_set_alsflag		x,shadow
	s_or_var		B,pshipflags3,#psf3_intunnel
		ENDM


;-----------------------------------------------------------------------------
Ltunnel_viewCY		equ	-60
Ltunnel_minX		equ	-120	
Ltunnel_maxX		equ	120	
Ltunnel_MminX		equ	-120	
Ltunnel_MmaxX		equ	120	
Ltunnel_minY		equ	-60+Ltunnel_viewCY	
Ltunnel_maxY		equ	60+Ltunnel_viewCY    
Ltunnel_MmaxY		equ	60+Ltunnel_viewCY	
Ltunnel_flymode	equ	pfm_diefall!pfm_shadows
Ltunnel_pmovelimitAND	equ	pml_all
Ltunnel_missboundflags	equ	mb_left!mb_right!mb_bottom
Ltunnel_gameflagsON	equ	0
Ltunnel_gameflagsOFF	equ	gf_viewrot

Ltunnel_macro		MACRO
	s_and_var	B,pshipflags2,#~psf2_nospark
	s_and_var		B,pstratflags,#~(pstf_inseq!pstf_notdie)
	s_set_alsflag		x,shadow
	s_or_var		B,pshipflags3,#psf3_intunnel
		ENDM

;-----------------------------------------------------------------------------
LTexit_viewCY		equ	-60
LTexit_minX		equ	-70	
LTexit_maxX		equ	70	
LTexit_MminX		equ	-70	
LTexit_MmaxX		equ	70	
LTexit_minY		equ	-100+60+LTexit_viewCY
LTexit_maxY		equ	-25+60+LTexit_viewCY	
LTexit_MmaxY		equ	-25+60+LTexit_viewCY	
LTexit_flymode		equ	pfm_shadows
LTexit_pmovelimitAND	equ	pml_all
LTexit_missboundflags	equ	mb_left!mb_right!mb_bottom
LTexit_gameflagsON	equ	gf_viewrot
LTexit_gameflagsOFF	equ	0

LTexit_macro		MACRO
	s_or_var	B,pshipflags2,#psf2_nospark
	s_and_var		B,pstratflags,#~pstf_inseq
	s_or_var		B,pstratflags,#pstf_notdie
	s_clr_alsflag		x,shadow
	s_and_var		B,pshipflags3,#~psf3_intunnel
		ENDM

;-----------------------------------------------------------------------------
MTexit_viewCY		equ	-60
MTexit_minX		equ	-50	
MTexit_maxX		equ	50	
MTexit_MminX		equ	-50	
MTexit_MmaxX		equ	50	
MTexit_minY		equ	-95
MTexit_maxY		equ	-25
MTexit_MmaxY		equ	-25
MTexit_flymode		equ	pfm_shadows
MTexit_pmovelimitAND	equ	pml_all
MTexit_missboundflags	equ	mb_left!mb_right!mb_bottom
MTexit_gameflagsON	equ	gf_viewrot
MTexit_gameflagsOFF	equ	0

MTexit_macro		MACRO
	s_or_var	B,pshipflags2,#psf2_nospark
	s_and_var		B,pstratflags,#~pstf_inseq
	s_or_var		B,pstratflags,#pstf_notdie
	s_clr_alsflag		x,shadow
	s_and_var		B,pshipflags3,#~psf3_intunnel
		ENDM

;-----------------------------------------------------------------------------
STexit_viewCY		equ	-60
STexit_minX		equ	-35	
STexit_maxX		equ	35	
STexit_MminX		equ	-35	
STexit_MmaxX		equ	35	
STexit_minY		equ	-95
STexit_maxY		equ	-25
STexit_MmaxY		equ	-25
STexit_flymode		equ	pfm_shadows
STexit_pmovelimitAND	equ	pml_all
STexit_missboundflags	equ	mb_left!mb_right!mb_bottom
STexit_gameflagsON	equ	gf_viewrot
STexit_gameflagsOFF	equ	0

STexit_macro		MACRO
	s_or_var	B,pshipflags2,#psf2_nospark
	s_and_var		B,pstratflags,#~pstf_inseq
	s_or_var		B,pstratflags,#pstf_notdie
	s_clr_alsflag		x,shadow
	s_and_var		B,pshipflags3,#~psf3_intunnel
		ENDM


;-----------------------------------------------------------------------------
space_viewCY		equ	-60
space_minX		equ	-240	
space_maxX		equ	240	
space_MminX		equ	-240	
space_MmaxX		equ	240	
space_minY		equ	-190
space_maxY		equ	80	
space_MmaxY		equ	10000	
space_flymode		equ	pfm_dieYrot!pfm_wobble
space_pmovelimitAND	equ	0
space_missboundflags	equ	0
space_gameflagsON	equ	gf_viewrot
space_gameflagsOFF	equ	0

space_macro		MACRO
	s_and_var	B,pshipflags2,#~psf2_nospark
	s_and_var		B,pstratflags,#~(pstf_inseq!pstf_notdie)
	s_and_var		B,pshipflags3,#~psf3_intunnel
		ENDM

;-----------------------------------------------------------------------------
bigspace_viewCY		equ	-60
bigspace_minX			equ	-600
bigspace_maxX			equ	600	
bigspace_MminX			equ	-600	
bigspace_MmaxX			equ	600	
bigspace_minY			equ	-190
bigspace_maxY			equ	80	
bigspace_MmaxY			equ	10000	
bigspace_flymode		equ	pfm_dieYrot!pfm_wobble
bigspace_pmovelimitAND		equ	0
bigspace_missboundflags	equ	0
bigspace_gameflagsON		equ	gf_viewrot
bigspace_gameflagsOFF		equ	0

bigspace_macro		MACRO
	s_and_var	B,pshipflags2,#~psf2_nospark
	s_and_var		B,pstratflags,#~(pstf_inseq!pstf_notdie)
	s_and_var		B,pshipflags3,#~psf3_intunnel
		ENDM


;-----------------------------------------------------------------------------
ClearShip_viewCY		equ	-60
ClearShip_minX		equ	-10000
ClearShip_maxX		equ	10000	
ClearShip_MminX		equ	-10000	
ClearShip_MmaxX		equ	10000	
ClearShip_minY		equ	-10000
ClearShip_maxY		equ	10000	
ClearShip_MmaxY		equ	10000	
ClearShip_flymode		equ	0
ClearShip_pmovelimitAND	equ	0
ClearShip_missboundflags	equ	0
ClearShip_gameflagsON		equ	0
ClearShip_gameflagsOFF		equ	gf_viewrot

ClearShip_macro		MACRO
	s_and_var		B,pshipflags3,#~psf3_intunnel
	s_or_var		B,pstratflags,#pstf_notdie
		ENDM
          
          
;-----------------------------------------------------------------------------
planet_viewCY		equ	-50		-105		-60
planet_minX		equ	-500	
planet_maxX		equ	500	
planet_MminX		equ	-500	
planet_MmaxX		equ	500	
planet_minY		equ	-210-45
planet_maxY		equ	0
planet_MmaxY		equ	0	
planet_flymode		equ	pfm_diefall!pfm_dieYrot!pfm_shadows!pfm_wobble
planet_pmovelimitAND	equ	pml_lwbottom!pml_rwbottom!pml_Bbottom
planet_missboundflags	equ	mb_bottom
planet_gameflagsON	equ	gf_viewrot
planet_gameflagsOFF	equ	0

planet_macro		MACRO
	s_and_var	B,pshipflags2,#~psf2_nospark
	s_and_var		B,pstratflags,#~(pstf_inseq!pstf_notdie)
	s_set_alsflag		x,shadow
	s_and_var		B,pshipflags3,#~psf3_intunnel
		ENDM


;-----------------------------------------------------------------------------
exitbase_viewCY		equ	-50		-105		-60
exitbase_minX		equ	-500	
exitbase_maxX		equ	500	
exitbase_MminX		equ	-500	
exitbase_MmaxX		equ	500	
exitbase_minY		equ	-600
exitbase_maxY		equ	0
exitbase_MmaxY		equ	0	
exitbase_flymode		equ	pfm_diefall!pfm_dieYrot!pfm_shadows
exitbase_pmovelimitAND		equ	pml_lwbottom!pml_rwbottom!pml_Bbottom
exitbase_missboundflags	equ	mb_bottom
exitbase_gameflagsON		equ	gf_viewrot
exitbase_gameflagsOFF		equ	0

exitbase_macro		MACRO
	s_and_var	B,pshipflags2,#~psf2_nospark
	s_and_var		B,pstratflags,#~(pstf_inseq!pstf_notdie)
	s_or_var		B,pstratflags,#pstf_notdie
	s_set_alsflag		x,shadow
	s_and_var		B,pshipflags3,#~psf3_intunnel
		ENDM


;-----------------------------------------------------------------------------
undergnd_viewCY		equ	-60
undergnd_minX			equ	-500	
undergnd_maxX			equ	500	
undergnd_MminX			equ	-500	
undergnd_MmaxX			equ	500	
undergnd_minY			equ	-120
undergnd_maxY			equ	0
undergnd_MmaxY			equ	0	
undergnd_flymode		equ	pfm_diefall!pfm_dieYrot!pfm_shadows!pfm_wobble
undergnd_pmovelimitAND		equ	pml_lwbottom!pml_rwbottom!pml_Bbottom
undergnd_missboundflags	equ	mb_bottom
undergnd_gameflagsON		equ	0
undergnd_gameflagsOFF		equ	0

undergnd_macro		MACRO
	s_and_var	B,pshipflags2,#~psf2_nospark
	s_and_var		B,pstratflags,#~(pstf_inseq!pstf_notdie)
	s_set_alsflag		x,shadow
	s_and_var		B,pshipflags3,#~psf3_intunnel
		ENDM

;-----------------------------------------------------------------------------
bridge_viewCY		equ	-60
bridge_minX		equ	-200		-120	
bridge_maxX		equ	200		120	
bridge_MminX		equ	-200		-120	
bridge_MmaxX		equ	200		120	
bridge_minY		equ	-120
bridge_maxY		equ	0	
bridge_MmaxY		equ	0	
bridge_flymode		equ	pfm_diefall!pfm_water!pfm_shadows!pfm_wobble
bridge_pmovelimitAND	equ	pml_lwbottom!pml_rwbottom!pml_Bbottom
bridge_missboundflags	equ	mb_bottom!mb_ltop!mb_rtop
bridge_gameflagsON	equ	0
bridge_gameflagsOFF	equ	gf_viewrot

bridge_macro		MACRO
	s_and_var	B,pshipflags2,#~psf2_nospark
	s_set_var	W,missbTOPLEFT,#-90
	s_set_var	W,missbTOPRIGHT,#90
	s_and_var		B,pstratflags,#~(pstf_inseq!pstf_notdie)
	s_set_alsflag		x,shadow
	s_and_var		B,pshipflags3,#~psf3_intunnel
		ENDM

;-----------------------------------------------------------------------------
water_viewCY		equ	-50
water_minX		equ	-500	
water_maxX		equ	500	
water_MminX		equ	-500	
water_MmaxX		equ	500	
water_minY		equ	-210-45
water_maxY		equ	0	
water_MmaxY		equ	0	
water_flymode		equ	pfm_diefall!pfm_dieYrot!pfm_water!pfm_shadows!pfm_wobble
water_pmovelimitAND	equ	pml_lwbottom!pml_rwbottom!pml_Bbottom
water_missboundflags	equ	mb_bottom
water_gameflagsON	equ	gf_viewrot
water_gameflagsOFF	equ	0

water_macro		MACRO
	s_and_var	B,pshipflags2,#~psf2_nospark
	s_and_var		B,pstratflags,#~(pstf_inseq!pstf_notdie)
	s_set_alsflag		x,shadow
	s_and_var		B,pshipflags3,#~psf3_intunnel
		ENDM

;-----------------------------------------------------------------------------
colony_viewCY		equ	-60
colony_minX		equ	-120-50	
colony_maxX		equ	120	
colony_MminX		equ	-5000	
colony_MmaxX		equ	120	
colony_minY		equ	-120
colony_maxY		equ	0	
colony_MmaxY		equ	0	
colony_flymode		equ	pfm_diefall!pfm_shadows
colony_pmovelimitAND	equ	pml_rwright!pml_Bbottom!pml_Btop
colony_missboundflags	equ	mb_right!mb_lbottom!mb_ltop
colony_gameflagsON	equ	0
colony_gameflagsOFF	equ	gf_viewrot

colony_macro		MACRO
	s_and_var	B,pshipflags2,#~psf2_nospark
	s_set_var	W,missbTOPLEFT,#-120-20
	s_set_var	W,missbBOTLEFT,#-120-20
	s_and_var		B,pstratflags,#~(pstf_inseq!pstf_notdie)
	s_or_var		B,pstratflags,#pstf_firstframeLcol
	s_set_alsflag		x,shadow
	s_or_var		B,pshipflags3,#psf3_intunnel
		ENDM


;-----------------------------------------------------------------------------
nucleusheight		equ	(100/2)<<boss8_scale
nucleus_viewCY		equ	-60
nucleus_minX		equ	-110<<boss8_scale	
nucleus_maxX		equ	110<<boss8_scale		
nucleus_MminX		equ	-110<<boss8_scale-1000	
nucleus_MmaxX		equ	110<<boss8_scale+1000		
nucleus_minY		equ	-120
nucleus_maxY		equ	0
nucleus_MmaxY		equ	0
nucleus_flymode	equ	pfm_shadows
nucleus_pmovelimitAND	equ	pml_lwleft!pml_rwright
nucleus_missboundflags	equ	mb_right!mb_left
nucleus_gameflagsON	equ	0
nucleus_gameflagsOFF	equ	gf_viewrot

nucleus_macro		MACRO
	s_and_var	B,pshipflags2,#~psf2_nospark
	s_and_var		B,pstratflags,#~(pstf_inseq!pstf_notdie)
	s_set_alsflag		x,shadow
	s_and_var		B,pshipflags3,#~psf3_intunnel
		ENDM


;-----------------------------------------------------------------------------
field_viewCY		equ	-60
field_minX		equ	-500	
field_maxX		equ	500	
field_MminX		equ	-500	
field_MmaxX		equ	500	
field_minY		equ	-120
field_maxY		equ	0
field_MmaxY		equ	0	
field_flymode		equ	pfm_diefall!pfm_dieYrot!pfm_shadows!pfm_wobble
field_pmovelimitAND	equ	pml_lwbottom!pml_rwbottom!pml_Bbottom
field_missboundflags	equ	mb_bottom
field_gameflagsON	equ	0
field_gameflagsOFF	equ	gf_viewrot

field_macro		MACRO
	s_and_var	B,pshipflags2,#~psf2_nospark
	s_and_var		B,pstratflags,#~(pstf_inseq!pstf_notdie)
	s_set_alsflag		x,shadow
	s_and_var		B,pshipflags3,#~psf3_intunnel
		ENDM

;----------------------------------------------------------------------------
cont_viewCY		equ	-50
cont_minX		equ	0
cont_maxX		equ	0	
cont_MminX		equ	0	
cont_MmaxX		equ	0	
cont_minY		equ	-50
cont_maxY		equ	-50
cont_MmaxY		equ	-50
cont_flymode		equ	pfm_dieYrot
cont_pmovelimitAND	equ	0
cont_missboundflags	equ	0
cont_gameflagsON	equ	gf_viewrot
cont_gameflagsOFF	equ	0

cont_macro		MACRO
	s_and_var	B,pshipflags2,#~psf2_nospark
	s_and_var		B,pstratflags,#~(pstf_inseq!pstf_notdie)
	s_and_var		B,pshipflags3,#~psf3_intunnel
	s_or_var		B,pstratflags,#pstf_notdie
		ENDM


;-----------------------------------------------------------------------------
; MISC.

player_hitflashfrms	equ	7
specialdelayfrms	equ	50
player_firespeed	equ	2
screenflashbodyfrms	equ	4
screenflashbodytype	equ	0
screenflashwingfrms	equ	2
screenflashwingtype	equ	1

crosshairdist		equ	500

player_collmove	equ	1
player_quickstop	equ	0
player_showcolboxes	equ	0
enemy_firing		equ	1

inviewLaserYoff	equ	50

inviewdist		equ	60
outviewdist		equ	120

pshipnum_norm		equ	0
pshipnum_wire		equ	1
pshipnum_null		equ	2
pshipnum_cockship	equ	3
pshipnum_tunnel	equ	4
pshipnum_black		equ	5
pshipnum_zoom		equ	6

framesperAP	equ	10
sghtoff	equ	0


maxdepthdist	equ	$e00



expsize_small	equ	64
expsize_medium	equ	128
expsize_large	equ	256

elaserfireZoff	equ	80


bigLflashDist	equ	1400
bigMflashDist	equ	1000
bigSflashDist	equ	500



;-----------------------------------------------------------------------------
viewtype_norm		equ	0
viewtype_toobj		equ	1
viewtype_fpos		equ	2
;-----------------------------------------------------------------------------
; WP flags

wp_fire	equ	1
wp_fixpos	equ	2
wp_speedchg	equ	4






;---------------------------------------------------------------------
; old vars from stratmacs

weapon_scale	equ	2

MODE_CHG	=	1

maxWPs	equ	1

frm0	equ	0
frm1	equ	1
frm4	equ	3
frm8	equ	7
frm16	equ	15
frm32	equ	31
frm64	equ	63
frm128	equ	127

;---------------------------------------------------------------------------
; Strategy flags.

make_sflag		MACRO

curr_sflag	=	1<<sflag_bitnum


	IFGE	sflag_bitnum-24
	IFLE	sflag_bitnum-31
asf_\1	equ	curr_sflag>>24
wsf4_\1	equ	curr_sflag
	ENDC
	ENDC

	IFGE	sflag_bitnum-16
	IFLE	sflag_bitnum-23
asf_\1	equ	curr_sflag>>16
wsf3_\1	equ	curr_sflag
	ENDC
	ENDC

	IFGE	sflag_bitnum-8
	IFLE	sflag_bitnum-15
asf_\1	equ	curr_sflag>>8
wsf2_\1	equ	curr_sflag
	ENDC
	ENDC

	IFLE	sflag_bitnum-7
asf_\1	equ	curr_sflag
wsf1_\1	equ	curr_sflag
	ENDC
	


	IFEQ	sflag_bitnum-32
	error	<Too many SFLAGS>
	ENDC

sflag_bitnum	=	sflag_bitnum+1
		ENDM	



sflag_bitnum	=	0
	make_sflag	special			; * special alien
	make_sflag	hitflash		; * hit flash.
	make_sflag	shadowshape		; *
	make_sflag	shadow			; * 
	make_sflag	partobj			; * 
	make_sflag	ssprite			; *
	make_sflag	textobj			; *
	make_sflag	collide			; * object collided.

	make_sflag	colldisable		; * collsion detection disable.
	make_sflag	Lcollide		; * last collide.
	make_sflag	smflag1			; strategy macro flag.
	make_sflag	noexpsnd		; no explosion sound.
	make_sflag	sflag1			; 
	make_sflag	sflag2			; 
	make_sflag	sflag3			; 
	make_sflag	sflag4			; 

	make_sflag	sflag5			; 
	make_sflag	sflag6			; 
	make_sflag	sflag7			; 
	make_sflag	realobj			;
	make_sflag	lockon			; 
	make_sflag	nohitaffect
	make_sflag	nopolyexp
	make_sflag	sameshapecollide

	make_sflag	playerobj
	make_sflag	donesnd
	make_sflag	relexplode
	make_sflag	invisible
	make_sflag	childobj
	make_sflag	sflag8
	make_sflag	motherobj
	make_sflag	Cspecial		; 

; N.B. flags with *'s must be within the first 8 flags


;---------------------------------------------------------------------------
; collision flags.
acf_colltype6		equ	1	
acf_weapon		equ	2	 
acf_firstframe		equ	4
acf_colltype1		equ	8	; all lasers
acf_colltype2		equ	16	; enemy type 1
acf_colltype3		equ	32	; enemy type 2
acf_colltype4		equ	64	; enemy type 3
acf_colltype5		equ	128	; friend type 1


colltype_laser		equ	acf_colltype1
colltype_enemy1	equ	acf_colltype2
colltype_enemy2	equ	acf_colltype3
colltype_enemyweap	equ	acf_colltype4
colltype_friend	equ	acf_colltype5
colltype_Zenemy	equ	acf_colltype6


;---------------------------------------------------------------------------
; general strategy flags.

gasf_killtype1	equ	1
gasf_killtype2	equ	2
gasf_killtype3	equ	4
gasf_flag1	equ	8

weaphdr	=	1
	include	INC\weapons.inc

; Dylan's scale equates
boss00_scale	=	2
kichi0_scale	=	6
kichi0_door	=	-10<<kichi0_scale
slot_scale	=	2

kichi2_scale	=	3
kichi2_len	=	49<<kichi2_scale

flingbosswidth	=	40
armlength	=	80
sprout_maxy	=	80

; mapmacs
tsize	=	200
dirEAST	=	deg270
dirNORTH	=	deg0
dirWEST	=	deg90
dirSOUTH	=	deg180


; shapes
stunnwidth	=	80
stunnheight	=	100
iris_h	=	60
iris_w	=	90
iris_boxz	=	50








