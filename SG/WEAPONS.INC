

;---------------------------------------------------
weapon	MACRO	; name,fire weapon strategy.

	IFNE	weaphdr
WEAPON_\1	equ	cweapon
	ELSEIF
	dw	((cweapon-2)/2)*wchrlen
	dw	\2&WM		; ptr. to fire weapon strat
	db	\2>>16,0
	ENDC

cweapon	=	cweapon+2
	ENDM
;---------------------------------------------------



cweapon	=	0
	IFEQ	weaphdr
weapons_data
	ENDC
	weapon	<current>,0
	weapon	<RebElaser>,fire_RebElaser
	weapon	<Elaser>,fire_Elaser
	weapon	<RainbowElaser>,fire_RainbowElaser
	weapon	<orb>,fire_orb
	weapon	<SlowElaser>,fire_slowElaser
	weapon	<RelSlowElaserHome>,fire_RelslowElaserHome
	weapon	<TAME>,fire_tame
	weapon	<Vortex1>,fire_vortex1
	weapon	<Vortex2>,fire_vortex2
	weapon	<RelSlowElaser>,fire_RelslowElaser
	weapon	<RelFastElaser>,fire_RelFastElaser
	weapon	<Qhmissile1>,fire_Qhmissile1
	weapon	<hmissile1>,fire_hmissile1
	weapon	<FakeFarHmissile1>,fire_FakeFarHmissile1
	weapon	<kamiHmissile1>,fire_kamihmissile1
	weapon	<chickhmissile1>,fire_chickhmissile1
	weapon	<STBhmissile1>,fire_STBhmissile1
	weapon	<hmissile2>,fire_hmissile2
	weapon	<missile1>,fire_missile1
	weapon	<missile2>,fire_missile2
	weapon	<plasma>,fire_plasma
	weapon	<shortplasma>,fire_shortplasma
	weapon	<Hplasma>,fire_Hplasma
	weapon	<Hplasma2>,fire_Hplasma2
	weapon	<YHplasma>,fire_YHplasma
	weapon	<nuke>,fire_nuke
	weapon	<spread>,fire_spread	
	weapon	<ovalbeam>,fire_ovalbeam
	weapon	<ringlaser>,fire_ringlaser
	weapon	<relovalbeam>,fire_relovalbeam
	weapon	<relringlaser>,fire_relringlaser
	weapon	<relovalbeam2>,fire_relovalbeam2
	weapon	<relringlaser2>,fire_relringlaser2
	weapon	<beamball>,fire_beamball
	weapon	<relbeamball>,fire_relbeamball
	weapon	<bosshmissile1>,fire_bosshmissile1
	weapon	<bosshmissile2>,fire_bosshmissile2
	weapon	<playerbeam>,fire_playerbeam
	weapon	<qlaser>,fire_qlaser
	weapon	<qelaser>,fire_qelaser


