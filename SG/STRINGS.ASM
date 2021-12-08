	strats_start

	INCPUBLICS	strings.ext	



version				
	db	"8.85"
	dw	0

superfx2text
	db	"SUPERFX2 CHIP"
	dw	0

nobackgroundstext
	db	"NO BACKGROUNDS"
	dw	0

SHIPtext
	db	"SHIP"
	dw	0


nanmodetext
	db	"-NAN MODE"
	dw	0
	
weaponslist			
.start
	dw	.end-.start
	db	"Elaser"
	dw	0
	db	"Dual Laser"
	dw	0
	db	"Dual Beam"
	dw	0
	db	"Cross Laser"
	dw	0
	db	"Quintouple Laser"
	dw	0
	db	"Plasma Beam"
	dw	0
	db	"Oval Beam"
	dw	0 
	db	"Ring Laser"
	dw	0 
	db	"Fireball"
	dw	0 
	db	"Flame Thrower"
	dw	0 
	db	"Black Hole"
	dw	0 
	db	"Electric Shock"
	dw	0 
	db	"Space Debris"
	dw	0 	
	db	"Iron Ball"
	dw	0 
	db	"Asteroid"
	dw	0 
	db	"Amoeba"
	dw	0 
	db	"Escapee"
	dw	0 
	dw	.end-.start
.end
	dw	0

weaponslist2					
.start
	dw	.end-.start
	db	"Fire Breath"
	dw	0
	db	"Missile"
	dw	0
	db	"Chicken Missile"
	dw	0
	db	"Water Gun"
	dw	0
	db	"Smoke Gun"
	dw	0
	db	"Spikey Ball"
	dw	0
	db	"Egg Shooter"
	dw	0 
	db	"Arwing Shooter"
	dw	0 
	db	"Andross Shooter"
	dw	0 
	db	"Nano Wasps"
	dw	0 
	db	"Nucleus Beam"
	dw	0 
	db	"Super Homing Laser"
	dw	0 
	db	"Shotgun"
	dw	0
	db	"God Gun 98"
	dw	0 	
	db	"God Gun 99"
	dw	0 
	dw	.end-.start
.end
	dw	0
	
BGMlist				
.start
	dw	.end-.start
	db	"Title Demonstration"
	dw	0
	db	"Title Screen"
	dw	0
	db	"Controls"
	dw	0
	db	"Training Mode"
	dw	0
	db	"Course Map Select"
	dw	0
	db	"Black Hole Map Select"
	dw	0
	db	"Emergency Call"
	dw	0 
	db	"Corneria"
	dw	0 
	db	"Asteroid and Venom Orbital"
	dw	0 
	db	"Coming out of warp speed"
	dw	0 
	db	"Space Armada"
	dw	0 
	db	"Meteor"
	dw	0 
	db	"Titania"
	dw	0 	
	db	"Sector Y"
	dw	0 
	db	"Venom Base Level 2"
	dw	0 
	db	"Fortuna"
	dw	0 
	dw	.end-.start
.end
	dw	0	
	
BGMlist2					
.start
	dw	.end-.start
	db	"Sector X and Sector Z"
	dw	0
	db	"Macbeth"
	dw	0
	db	"Black Hole BGM"
	dw	0
	db	"Out of this Dimension"
	dw	0
	db	"Game Over"
	dw	0
	db	"Continue"
	dw	0
	db	"Game Clear Demonstration"
	dw	0 
	db	"Ending"
	dw	0
	db	"Main Theme"
	dw	0 
	db	"Venom Base Levels 1 and 3"
	dw	0 
	db	"Press R again for bossbgm"
	dw	0
	dw	.end-.start
.end
	dw	0	
	
bgmspeedtext
	db	"BGM Speed"
	dw	0

modelviewtext
	db	"MODEL VIEW"
	dw	0

fasttext
	db	"FAST"
	dw	0

playercolboxtext
	db	"Show Player ColBox"
	dw	0
	
subtracknumbertext
	db	"Sub Track Number"
	dw	0

slowtext
	db	"SLOW"
	dw	0

menudarkmodetext
	db	"Dark Mode"
	dw	0

menudefaultmodetext
	db	" Default"
	dw	0

menurainbowkmodetext
	db	"RainbowK"
	dw	0
	
menublackscmodetext
	db	"Black.Sc"
	dw	0
	
menuwhitescmodetext
	db	"White.Sc"
	dw	0
	
menugreenscmodetext
	db	"Green.Sc"
	dw	0

menubluescmodetext
	db	" Blue.Sc"
	dw	0

menucyanscmodetext
	db	" Cyan.Sc"
	dw	0

menupalettetext
	db	"Palette"
	dw	0

menuretro2modetext
	db	" Retro 2"
	dw	0

menugreenmodetext
	db	"   Green"
	dw	0
	
menuretro1modetext
	db	" Retro 1"
	dw	0
	

menumistmodetext
	db	"    Mist"
	dw	0

menurainbowmodetext
	db	" Rainbow"
	dw	0
	
versiontext					
	db	"Vers"
	dw	0

menunodotsoldtext
	db	"No Ground Dots"
	dw	0
	
pressstarttext					
	db	"PRESS START"
	dw	0
	
stepbysteptext
	db	"Step By Step"
	dw	0

menunodotstext
	db	"No Ground Dots"
	dw	0

	
fireratetext
	db	"FireRate"
	dw	0
	
settingstext	
	db	"settings"
	dw	0

bgmtext				
	db	"BGM"
	dw	0
	
sfxtext				
	db	"SFX"
	dw	0
	
rapidfiretext					
	db	"Rapid Fire"
	dw	0
	
godmodetext					
	db	"God"
	dw	0

curspetext					
	db	"CurSpec"
	dw	0

totspetext					
	db	"TotSpec"
	dw	0

plustext					
	db	"+"
	dw	0

minustext					
	db	"-"
	dw	0
	
doubletext					
	db	"double"
	dw	0

ontext						
	db	"on  "
	dw	0

p2text
	db	"2p "
	dw	0

p2plustext
	db	"2p+"
	dw	0

p4text
	db	"4p "
	dw	0

onplusplustext						
	db	"Assault"
	dw	0
	
blank7						
	db	"       "
	dw	0
	
onplustext						
	db	"on+ "
	dw	0
	
worldxtext						
	db	"worldx"
	dw	0

worldytext						
	db	"worldy"
	dw	0
	
offtext						
	db	"off "
	dw	0

weapontext					
	db	"Weapon"
	dw	0

healthtext
	db	"Health"
	dw	0
		
ngplustext
	db	"NGPLUS"
	dw	0
		
text51
	db	"Corneria Boss"
	dw	0

text52
	db	"Asteroid Boss"
	dw	0
text53
	db	"Titania Boss"
	dw	0

text54
	db	"Fortuna Boss"
	dw	0

text55
	db	"Meteor Boss"
	dw	0

text56
	db	"Macbeth Boss"
	dw	0
	
text57
	db	"Venom Boss"
	dw	0

text58
	db	"Course Clear OOTD"
	dw	0

text59
	db	"Last Boss Andross"
	dw	0

text510
	db	"Space Armada Boss"
	dw	0

PressRtext
	db	"Press Start to exit         Press R to kill"
	dw	0
	
menutitletext
	db	"++SPECIAL MENU++"
	dw	0

menumodestext
	db	"Game Modes"
	dw	0

menucheatstext
	db	"Cheats"
	dw	0

menumodstext
	db	"Mods"
	dw	0
	
menupressstarttext
	db	"Press start to exit"
	dw	0

menu1text
	db	"God Mode"
	dw	0
	
menu2text
	db	"SNES Mini"
	dw	0
	
menu3text
	db	"Random Fire"
	dw	0

menu4text
	db	"Scored"
	dw	0
	
menu5text
	db	"New Game+"
	dw	0

menu6text
	db	"Endurance"
	dw	0		

menu7text
	db	"Level Features"
	dw	0	

menu8text
	db	"Enemy fire disabled"
	dw	0		

menu9text
	db	"2 Player Mode"
	dw	0
	
menu10text
	db	"Rainbow Laser"
	dw	0

menu11text
	db	"Model Size"
	dw	0

menu12text
	db	"Team Assault Mode"
	dw	0
	
menufonttext
	db	"BAD WIREFRAME MODE"
	dw	0
	
menunewtext
	db	"New "
	dw	0
	
menuorigtext
	db	"Orig"
	dw	0
	
menumodeltestmodetext
	db	"model test mode"
	dw	0
	
menunormaltext
	db	"x1"
	dw	0

menubiggertext
	db	"x2"
	dw	0

menubiggesttext
	db	"x4"
	dw	0

menupagetext
	db	"page"
	dw	0

menupreviouspagetext
	db	"previous page"
	dw	0
	
menustartgametext
	db	"start game"
	dw	0

menuscrambletext
	db	"scramble skip"
	dw	0
	
menudisablesfxtext
	db	"Disable SFX"
	dw	0	

menudisablebgmtext
	db	"Disable BGM"
	dw	0		
	
freezeexp
	db	"Frz+Exp"
	dw	0
	
pressytext	
	db	"Press Y to play sfx+bgm"
	dw	0

thankstext	
	db	"Thanks"
	dw	0

altsoundfonttext
	db	"Alt Instruments"
	dw	0
	
thanks1
	db	"Emuchicken MLGari CornFlakesDel.Devilish JirachiKid 41DNHayao Gersonzao Dajoho FenixOrengefox Snaphat Wilptx w7nDoctorWarez DrGreen SFAN    metal64 SunlitSpace542 Deltapigma1 Dirtbag RandomStuff  Starxxon Birdonwheels PikangChrisHighwind"
	dw	0
	
thanks2
	db	" NickReynolds  CoolK FuxMcClown VitorVilelaCrashOverride Snakpak Wolfy RetroMasterHD Ecks Matze    MrL314 Atomic PaulieWalnuts MrHashshashin Catador TranceKaine23 HGWells628 Talnova  theangryscotsman Karmic JunoSegaMegaDrive citizen17 DAD CMM1215 JakeDSnake MADevil "
	dw	0

thanks3
	db	" Wifey + Kids K.A.O.T. MOM   Studsx Loz EdenGT Mediafireo"
	dw	0
	
titledemonstrationtext
	db	"Title Demonstration         "
	dw	0

titlescreentext
	db	"Title Screen                "
	dw	0

controlstext
	db	"Controls                    "
	dw	0

trainingmodetext
	db	"Training Mode               "
	dw	0

CourseMapSelecttext
	db	"Course Map Select           "
	dw	0

blackholemapselecttext
	db	"Black Hole Map Select       "
	dw	0

emergencycalltext
	db	"Emergency Call              "
	dw	0

corneriatext
	db	"Corneria                    "
	dw	0

asteroidandvenomorbitaltext
	db	"Asteroid and Venom Orbital  "
	dw	0

Comingoutofwarpspeedtext
	db	"Coming out of warp speed    "
	dw	0

spacearmadatext
	db	"space armada                "
	dw	0

meteortext
	db	"Meteor                      "
	dw	0

titaniatext
	db	"Titania                     "
	dw	0

SectorYText
	db	"Sector Y                    "
	dw	0

VenomBaseLevel2text
	db	"Venom Base Level 2          "
	dw	0

fortunatext
	db	"Fortuna                     "
	dw	0

sectorxandsectorztext	
	db	"Sector X and Sector Z       "
	dw	0
	
macbethtext
	db	"Macbeth                     "
	dw	0
	
blackholebgmtext
	db	"Black Hole BGM              "
	dw	0
	
Outofthisdimensiontext
	db	"Out of this Dimension       "
	dw	0
	
gameovertext	
	db	"game over                   "
	dw	0
	
blankspace
	db	" "
	dw	0
	
continuetext	
	db	"Continue                   "
	dw	0
	
gamecleardemonstrationtext
	db	"Game Clear Demonstration    "
	dw	0
	
endingtext	
	db	"Ending                      "
	dw	0
	
MainThemetext	
	db	"Main Theme                  "
	dw	0

venombaselevels1and3text	
	db	"Venom Base Levels 1 and 3   "
	dw	0
	
bosscorneriatext
	db	"Boss Corneria               "
	dw	0

BossMeteortext
	db	"Boss Meteor                 "
	dw	0

Bossfortunatext
	db	"Boss Fortuna                "
	dw	0
	
BossMacbethtext
	db	"Boss Macbeth                "
	dw	0
	
BossTitaniaText
	db	"Boss Titania                "
	dw	0

BossAsteroidText
	db	"Boss Asteroid               "
	dw	0

BossSpaceArmadaText	
	db	"Boss Space Armada           "
	dw	0
	
Bossvenombase1text
	db	"Boss Venom Base 1           "
	dw	0

BossVenomBase2text
	db	"Boss Venom Base 2           "
	dw	0

bossvenombaseextendedtext
	db	"Boss Venom Base Extended    "
	dw	0

BossVenomBaseShortText
	db	"Boss Venom Base Short       "
	dw	0

lastbossandrosstext
	db	"Last Boss Andross           "
	dw	0

playerdownorchestratext
	db	"Player Down Orchestra       "
	dw	0

PlayerDownBandText
	db	"Player Down Band            "
	dw	0

lastbosscleartext
	db	"Last Boss Clear             "
	dw	0

courseclearorchestratext
	db	"Course Clear Orchestra      "
	dw	0

courseclearbandtext
	db	"Course Clear Band           "
	dw	0
	
slotmachinetext
	db	"Slot Machine                "
	dw	0
	
EnteringDangerousTerritorytext
	db	"Entering Dangerous Territory"
	dw	0
	
courseclearootdtext
	db	"Course Clear OOTD           "
	dw	0
		
secretactivatedtext
	db	"Secret Activated            "
	dw	0
	
bgmtesttext
	db	"BGM Test"
	dw	0

bgmnumbertext
	db	"BGM Number"
	dw	0
	
playrestarttext
	db	"Play-restart"
	dw	0

tracknumbertext
	db	"Track Number"
	dw	0
	
speeduptext
	db	"SPEED UP"
	dw	0
	
slowdowntext
	db	"slow down"
	dw	0

fadeouttext
	db	"fade out"
	dw	0

soundfxnumbertext
	db	"Sound FX Number"
	dw	0

playsoundtext
	db	"Play Sound"
	dw	0

shipselecttext
	db	"SHIP SELECT"
	dw	0	
	
bgmlisttext
	dw	titledemonstrationtext
	dw	titlescreentext
	dw	controlstext
	dw	coursemapselecttext
	dw	emergencycalltext
	dw	corneriatext
	dw	meteortext
	dw	titaniatext
	dw	fortunatext
	dw	asteroidandvenomorbitaltext
	dw	spacearmadatext
	dw	venombaselevel2text
	dw	sectorxandsectorztext
	dw	sectorytext
	dw	venombaselevels1and3text
	dw	bosscorneriatext
	dw	bossmeteortext
	dw	bossfortunatext
	dw	bossmacbethtext
	dw	bosstitaniatext
	dw	bossasteroidtext
	dw	bossspacearmadatext
	dw	bossvenombase2text
	dw	bossvenombaseextendedtext
	dw	bossvenombaseshorttext
	dw	lastbossandrosstext
	dw	playerdownorchestratext
	dw	playerdownbandtext
	dw	gameovertext
	dw	continuetext
	dw	courseclearorchestratext
	dw	courseclearbandtext
	dw	lastbosscleartext
	dw	gamecleardemonstrationtext
	dw	endingtext
	dw	mainthemetext
	dw	outofthisdimensiontext
	dw	slotmachinetext
	dw	blackholebgmtext
	dw	blackholemapselecttext
	dw	trainingmodetext
	dw	enteringdangerousterritorytext
	dw	courseclearootdtext
	dw	secretactivatedtext
	dw	Comingoutofwarpspeedtext
	
sfx1text	    ;took 4 days,CK,8.8.21
	db	"PAUSE                       "
	dw	0
sfx2text
	db	"-NAN                        "
	dw	0
sfx3text
	db	"PLAYER DOWN                 "
	dw	0
sfx4text
	db	"PLAYER CRASH                "
	dw	0
sfx5text
	db	"LEFT WING DAMAGED           "
	dw	0
sfx6text
	db	"RIGHT WING DAMAGED          "
	dw	0
sfx7text
	db	"LEFT WING CRASH             "
	dw	0
sfx8text
	db	"RIGHT WING CRASH            "
	dw	0
sfx9text
	db	"LEFT WING SCRATCH           "
	dw	0
sfx10text
	db	"RIGHT WING SCRATCH          "
	dw	0
sfx11text
	db	"INCOMING ENEMY              "
	dw	0
sfx12text
	db	"WING DAMAGED                "
	dw	0
sfx13text
	db	"COME IN CORNERIA -BGM 34-   "
	dw	0
sfx14text
	db	"BONUS CREDIT                "
	dw	0
sfx15text
	db	"BIG SUPPORT RING            "
	dw	0
sfx16text
	db	"1UP RING HIT                "
	dw	0
sfx17text
	db	"CONTROLS SELECT             "
	dw	0
sfx18text
	db	"PERCENTAGE RING             "
	dw	0
sfx19text
	db	"JINGLE + GOOD LUCK -BGM 4-  "
	dw	0
sfx20text
	db	"CONE HIT                    "
	dw	0
sfx21text
	db	"TWIN BLASTER POWERUP        "
	dw	0
sfx22text
	db	"SHIELD POWERUP              "
	dw	0
sfx23text
	db	"WING REPAIRED POWERUP       "
	dw	0
sfx24text
	db	"BOMB POWERUP                "
	dw	0
sfx25text
	db	"WINGLESS ARWING COLLISION   "
	dw	0
sfx26text
	db	"SLOT MACHINE COIN           "
	dw	0
sfx27text
	db	"SMALL ARWING DAMAGE ALARM   "
	dw	0
sfx28text
	db	"BIG ARWING DAMAGE ALARM     "
	dw	0
sfx29text
	db	"SMALL BOSS EXPLOSION        "
	dw	0
sfx30text
	db	"NEAR BIG BOSS EXPLOSION     "
	dw	0
sfx31text
	db	"MID BIG BOSS EXPLOSION      "
	dw	0
sfx32text
	db	"FAR BIG BOSS EXPLOSION      "
	dw	0
sfx33text
	db	"NEAR ENEMY EXPLOSION        "
	dw	0
sfx34text
	db	"MID ENEMY EXPLOSION         "
	dw	0
sfx35text
	db	"FAR ENEMY EXPLOSION         "
	dw	0
sfx36text
	db	"NEAR ENEMY HIT              "
	dw	0
sfx37text
	db	"MID ENEMY HIT               "
	dw	0
sfx38text
	db	"FAR ENEMY HIT               "
	dw	0
sfx39text
	db	"NEAR LASER DEFLECT          "
	dw	0
sfx40text
	db	"MID LASER DEFLECT           "
	dw	0
sfx41text
	db	"FAR LASER DEFLECT           "
	dw	0
sfx42text
	db	"GOOD LUCK -BGM 4-           "
	dw	0
sfx43text
	db	"ENEMY WARP-IN               "
	dw	0
sfx44text
	db	"CONE TRIANGLE               "
	dw	0
sfx45text
	db	"1-6+2-3 BOSS SHADOWING      "
	dw	0
sfx46text
	db	"PLASMA HYDRA ARM HIT        "
	dw	0
sfx47text
	db	"ROCK CRUSHER ROLL           "
	dw	0
sfx48text
	db	"PLAYER BOMB EXPLOSION       "
	dw	0
sfx49text
	db	"PLAYER BOMB SHOT            "
	dw	0
sfx50text
	db	"PLAYER BOOST                "
	dw	0
sfx51text
	db	"PLAYER BRAKE                "
	dw	0
sfx52text
	db	"PLAYER TWIN BLASTER SHOT    "
	dw	0
sfx53text
	db	"PLAYER LASER SHOT           "
	dw	0
sfx54text
	db	"DUAL BEAM SHOT              "
	dw	0
sfx55text
	db	"DUAL BEAM SHOT -UNUSED-     "
	dw	0
sfx56text
	db	"BIRD SCREAM -UNUSED-        "
	dw	0
sfx57text
	db	"ENEMY ROCKET PLAYER HIT     "
	dw	0
sfx58text
	db	"DODORA EGG CRACK + BIRD     "
	dw	0
sfx59text
	db	"DODORA HIT                  "
	dw	0
sfx60text
	db	"NEAR ENEMY ROCKET SHOT      "
	dw	0
sfx61text
	db	"MID ENEMY ROCKET SHOT       "
	dw	0
sfx62text
	db	"FAR ENEMY ROCKET SHOT       "
	dw	0
sfx63text
	db	"LEFT GATE MOVEING           "
	dw	0
sfx64text
	db	"CENTRE GATE MOVEING         "
	dw	0
sfx65text
	db	"RIGHT GATE MOVEING          "
	dw	0
sfx66text
	db	"MID GATE MOVEING            "
	dw	0
sfx67text
	db	"FAR GATE MOVEING            "
	dw	0
sfx68text
	db	"LEFT ENEMY LASER SHOT       "
	dw	0
sfx69text
	db	"CENTRE ENEMY LASER SHOT     "
	dw	0
sfx70text
	db	"RIGHT ENEMY LASER SHOT      "
	dw	0
sfx71text
	db	"MID ENEMY LASER SHOT        "
	dw	0
sfx72text
	db	"FAR ENEMY LASER SHOT        "
	dw	0
sfx73text
	db	"NEAR ENEMY BATTERY          "
	dw	0
sfx74text
	db	"MID ENEMY BATTERY           "
	dw	0
sfx75text
	db	"FAR ENEMY BATTERY           "
	dw	0
sfx76text
	db	"PHATRON 2 LANDING           "
	dw	0
sfx77text
	db	"PHATRON 2 JUMP              "
	dw	0
sfx78text
	db	"-UNUSED-                    "
	dw	0
sfx79text
	db	"DANCING INSECTOR PROPELLING "
	dw	0
sfx80text
	db	"BLADE BARRIER POST-DRILL ATK"
	dw	0
sfx81text
	db	"BLADE BARRIER PLAYER WEB HIT"
	dw	0
sfx82text
	db	"LAST BASE ENTRY 2.DOOR CLOSE"
	dw	0
sfx83text
	db	"FAR LB ENTRY 2.DOOR CLOSE   "
	dw	0
sfx84text
	db	"LAST BASE ENTRY 2.DOOR OPEN "
	dw	0
sfx85text
	db	"FAR LB ENTRY 2.DOOR OPEN    "
	dw	0
sfx86text
	db	"PLAYER AMOEBA HIT           "
	dw	0
sfx87text
	db	"BLOCKADE DIRECTION CHANGE   "
	dw	0
sfx88text
	db	"HOVERING -UNUSED-           "
	dw	0
sfx89text
	db	"DOOR CLOSE -UNUSED-         "
	dw	0
sfx90text
	db	"DOOR OPEN -UNUSED-          "
	dw	0
sfx91text
	db	"HOVERING -UNUSED-           "
	dw	0
sfx92text
	db	"NEAR ENEMY RING SHOT        "
	dw	0
sfx93text
	db	"MID ENEMY RING SHOT         "
	dw	0
sfx94text
	db	"FAR ENEMY RING SHOT         "
	dw	0
sfx95text
	db	"PEPPER RADIO CHAT           "
	dw	0
sfx96text
	db	"FOX RADIO CHAT              "
	dw	0
sfx97text
	db	"FALCO RADIO CHAT            "
	dw	0
sfx98text
	db	"PEPPY RADIO CHAT            "
	dw	0
sfx99text
	db	"SLIPPY RADIO CHAT           "
	dw	0
sfx100text
	db	"RADIO CHAT QUIT             "
	dw	0
sfx101text
	db	"PLAYER CAMERA CHANGE        "
	dw	0
sfx102text
	db	"DESTRUCTOR WEAPN HEAD ATTACK"
	dw	0
sfx103text
	db	"CONTINUE LETS GO -BGM 30-   "
	dw	0
sfx104text
	db	"LEFT WATER SPLASH OUT       "
	dw	0
sfx105text
	db	"CENTRE WATER SPLASH         "
	dw	0
sfx106text
	db	"RIGHT WATER SPLASH          "
	dw	0
sfx107text
	db	"MID WATER SPLASH            "
	dw	0
sfx108text
	db	"FAR WATER SPLASH            "
	dw	0
sfx109text
	db	"LEFT OBJECT FLY-BY          "
	dw	0
sfx110text
	db	"CENTRE OBJECT FLY-BY        "
	dw	0
sfx111text
	db	"RIGHT OBJECT FLY-BY         "
	dw	0
sfx112text
	db	"ATOMIC BASE POWER SUPPLY OFF"
	dw	0
sfx113text
	db	"ATOMIC BASE POWER SUPPLY ON "
	dw	0
sfx114text
	db	"ATOMIC BASE CORE CLOSE      "
	dw	0
sfx115text
	db	"ATOMIC BASE CORE OPEN       "
	dw	0
sfx116text
	db	"LEFT WATER SPLASH IN        "
	dw	0
sfx117text
	db	"CENTRE WATER SPLASH IN      "
	dw	0
sfx118text
	db	"RIGHT WATER SPLASH IN       "
	dw	0
sfx119text
	db	"MID WATER SPLASH IN         "
	dw	0
sfx120text
	db	"FAR WATER SPLASH IN         "
	dw	0
sfx121text
	db	"BACKGROUND THUNDER -UNUSED- "
	dw	0
sfx122text
	db	"FALCO RADIO CHAT HIT        "
	dw	0
sfx123text
	db	"FALCO RADIO CHAT DOWN       "
	dw	0
sfx124text
	db	"PEPPY RADIO CHAT HIT        "
	dw	0
sfx125text
	db	"PEPPY RADIO CHAT DOWN       "
	dw	0
sfx126text
	db	"SLIPPY RADIO CHAT HIT       "
	dw	0
sfx127text
	db	"SLIPPY RADIO CHAT DOWN      "
	dw	0
sfx128text
	db	"PHANTRON 2 HIT              "
	dw	0
sfx129text
	db	"PHANTRON 2 SCREAM           "
	dw	0
sfx130text
	db	"ROCK CRUSHER APPEARS        "
	dw	0
sfx131text
	db	"DESTRUCTOR ENGINE           "
	dw	0
sfx132text
	db	"PHANTRON APPEARS            "
	dw	0
sfx133text
	db	"ROCK CRUSHER UNCOVER        "
	dw	0
sfx134text
	db	"PILON TO GROUND             "
	dw	0
sfx135text
	db	"ANDROSS APPEARS             "
	dw	0
sfx136text
	db	"ANDROSS HIT                 "
	dw	0
sfx137text
	db	"TEXT TING                   "
	dw	0
sfx138text
	db	"SILENCE -BGM 10-            "
	dw	0
sfx139text
	db	"PRE-WING REPAIRED           "
	dw	0
sfx140text
	db	"ANDROSS RADIO CHAT          "
	dw	0
sfx141text
	db	"METAL SMASHER SMASHING      "
	dw	0
sfx142text
	db	"METAL SMASHER CLOSE         "
	dw	0
sfx143text
	db	"BLADE BARRIER WEB ATTACK    "
	dw	0
sfx144text
	db	"BONUS RING BIRD             "
	dw	0
sfx145text
	db	"COMET FLY-BY                "
	dw	0
sfx146text
	db	"WHALE SCREAM                "
	dw	0
sfx147text
	db	"STINGRAY HIT                "
	dw	0
sfx148text
	db	"SQUID HIT                   "
	dw	0
sfx149text
	db	"SPINNING CORE BG THUNDER    "
	dw	0
sfx150text
	db	"PHANTRON SCREAM             "
	dw	0
sfx151text
	db	"DANCING INSECTOR MOVEMENT   "
	dw	0
sfx152text
	db	"DANCING INSECTOR FIRE SHOT  "
	dw	0
sfx153text
	db	"DANCING INSECTOR FIRE FLY-BY"
	dw	0
sfx154text
	db	"VOLCANO FIRE                "
	dw	0
sfx155text
	db	"SLOT MACHINE HANDLE DOWN    "
	dw	0
sfx156text
	db	"SLOT MACHINE SLOT SPINNING  "
	dw	0
sfx157text
	db	"PROFESSOR HANGER APPEARS    "
	dw	0
sfx158text
	db	"PROFESSOR HANGER DISAPPEARS "
	dw	0
sfx159text
	db	"FINAL SCORE SCREEN FLIGHT   "
	dw	0
sfx160text
	db	"ANDROSS SHELL EXPLOSION     "
	dw	0
sfx161text
	db	"ANDROSS SCREAM 4            "
	dw	0
sfx162text
	db	"ANDROSS SCREAM 3            "
	dw	0
sfx163text
	db	"ANDROSS SCREAM 2            "
	dw	0
sfx164text
	db	"ANDROSS SCREAM 1            "
	dw	0
sfx165text
	db	"-NO SOUND-                  "
	dw	0
sfx166text
	db	"ENEMY HOVERING -UNUSED-     "
	dw	0
sfx167text
	db	"SHOOTING STAR -UNUSED-      "
	dw	0
sfx168text
	db	"OBJECT IMPACT -UNUSED-      "
	dw	0
sfx169text
	db	"ENEMY -UNUSED-              "
	dw	0
sfx170text
	db	"BACKGROUND THUNDER -UNUSED- "
	dw	0
sfx171text
	db	"BONUS -UNUSED-              "
	dw	0
sfx172text
	db	"DESTRUCTOR ENGINE -UNUSED-  "
	dw	0
sfx173text
	db	"PHANTRON SCREAM -UNUSED-    "
	dw	0
sfx174text
	db	"GOOD LUCK -BGM 4- -UNUSED-  "
	dw	0
sfx175text
	db	"BONUS -UNUSED-              "
	dw	0
	
	
ship0text
	db	"   MYSHIP_4"
	dw	0
	
ship1text
	db	"      wired"
	dw	0
	
ship2text
	db	"  nullshape"
	dw	0

ship3text
	db	"      MY_up"
	dw	0

ship4text
	db	"  nullshape"
	dw	0

ship5text
	db	"  bmyship_4"
	dw	0

ship6text
	db	"   MYzoom_4"
	dw	0

ship7text
	db	"     plane1"
	dw	0

ship8text
	db	"   highpoly"
	dw	0

ship9text
	db	"  old_type2"
	dw	0

ship10text
	db	"    ryousan"
	dw	0

ship11text
	db	"     a_wing"
	dw	0

ship12text
	db	"     b_wing"
	dw	0

ship13text
	db	"     c_wing"
	dw	0

ship14text
	db	"       wolf"
	dw	0

ship15text
	db	"     wolf_1"
	dw	0

ship16text
	db	"     c_robo"
	dw	0

ship17text
	db	"   petecube"
	dw	0

ship18text
	db	"androsscube"
	dw	0

ship19text
	db	"   boss_g_s"
	dw	0

ship20text
	db	"   ray_blue"
	dw	0

ship21text
	db	"   ray_bred"
	dw	0

ship22text
	db	"      ray_0"
	dw	0

ship23text
	db	"   wire_man"
	dw	0

ship24text
	db	"   cockpit2"
	dw	0

ship25text
	db	"     f_fish"
	dw	0

ship26text
	db	"    tadpole"
	dw	0

ship27text
	db	"     whale1"
	dw	0

ship28text
	db	"    my_bird"
	dw	0

ship29text
	db	"     shark1"
	dw	0

ship30text
	db	"     zaco_1"
	dw	0

ship31text
	db	"     zaco_5"
	dw	0

ship32text
	db	"     zaco_6"
	dw	0

ship33text
	db	"     zaco_8"
	dw	0

ship34text
	db	"     zaco_a"
	dw	0

ship35text
	db	"     zaco_b"
	dw	0

ship36text
	db	"       heli"
	dw	0

ship37text
	db	"        ika"
	dw	0

ship38text
	db	"   f_dragon"
	dw	0

ship39text
	db	"      AIR_1"
	dw	0

ship40text
	db	"     CAR_10"
	dw	0

ship41text
	db	"     PHAZER"
	dw	0

ship42text
	db	"   BOSS_D_A"
	dw	0

ship43text
	db	"  WIREFRAME"
	dw	0

ship44text
	db	"  BLACKSHIP"
	dw	0

ship45text
	db	"    MYSHIP2"
	dw	0

ship46text
	db	"        DFX"
	dw	0

ship47text
	db	"       FCTA"
	dw	0

ship48text
	db	"       SJPA"
	dw	0

ship49text
	db	"       DJPA"
	dw	0
	
	
sfxplaylist
	dw	sfx1text
	dw	sfx2text
	dw	sfx3text
	dw	sfx4text
	dw	sfx5text
	dw	sfx6text
	dw	sfx7text
	dw	sfx8text
	dw	sfx9text
	dw	sfx10text
	dw	sfx11text
	dw	sfx12text
	dw	sfx13text
	dw	sfx14text
	dw	sfx15text
	dw	sfx16text
	dw	sfx17text
	dw	sfx18text
	dw	sfx19text
	dw	sfx20text
	dw	sfx21text
	dw	sfx22text
	dw	sfx23text
	dw	sfx24text
	dw	sfx25text
	dw	sfx26text
	dw	sfx27text
	dw	sfx28text
	dw	sfx29text
	dw	sfx30text
	dw	sfx31text
	dw	sfx32text
	dw	sfx33text
	dw	sfx34text
	dw	sfx35text
	dw	sfx36text
	dw	sfx37text
	dw	sfx38text
	dw	sfx39text
	dw	sfx40text
	dw	sfx41text
	dw	sfx42text
	dw	sfx43text
	dw	sfx44text
	dw	sfx45text
	dw	sfx46text
	dw	sfx47text
	dw	sfx48text
	dw	sfx49text
	dw	sfx50text
	dw	sfx51text
	dw	sfx52text
	dw	sfx53text
	dw	sfx54text
	dw	sfx55text
	dw	sfx56text
	dw	sfx57text
	dw	sfx58text
	dw	sfx59text
	dw	sfx60text
	dw	sfx61text
	dw	sfx62text
	dw	sfx63text
	dw	sfx64text
	dw	sfx65text
	dw	sfx66text
	dw	sfx67text
	dw	sfx68text
	dw	sfx69text
	dw	sfx70text
	dw	sfx71text
	dw	sfx72text
	dw	sfx73text
	dw	sfx74text
	dw	sfx75text
	dw	sfx76text
	dw	sfx77text
	dw	sfx78text
	dw	sfx79text
	dw	sfx80text
	dw	sfx81text
	dw	sfx82text
	dw	sfx83text
	dw	sfx84text
	dw	sfx85text
	dw	sfx86text
	dw	sfx87text
	dw	sfx88text
	dw	sfx89text
	dw	sfx90text
	dw	sfx91text
	dw	sfx92text
	dw	sfx93text
	dw	sfx94text
	dw	sfx95text
	dw	sfx96text
	dw	sfx97text
	dw	sfx98text
	dw	sfx99text
	dw	sfx100text
	dw	sfx101text
	dw	sfx102text
	dw	sfx103text
	dw	sfx104text
	dw	sfx105text
	dw	sfx106text
	dw	sfx107text
	dw	sfx108text
	dw	sfx109text
	dw	sfx110text
	dw	sfx111text
	dw	sfx112text
	dw	sfx113text
	dw	sfx114text
	dw	sfx115text
	dw	sfx116text
	dw	sfx117text
	dw	sfx118text
	dw	sfx119text
	dw	sfx120text
	dw	sfx121text
	dw	sfx122text
	dw	sfx123text
	dw	sfx124text
	dw	sfx125text
	dw	sfx126text
	dw	sfx127text
	dw	sfx128text
	dw	sfx129text
	dw	sfx130text
	dw	sfx131text
	dw	sfx132text
	dw	sfx133text
	dw	sfx134text
	dw	sfx135text
	dw	sfx136text
	dw	sfx137text
	dw	sfx138text
	dw	sfx139text
	dw	sfx140text
	dw	sfx141text
	dw	sfx142text
	dw	sfx143text
	dw	sfx144text
	dw	sfx145text
	dw	sfx146text
	dw	sfx147text
	dw	sfx148text
	dw	sfx149text
	dw	sfx150text
	dw	sfx151text
	dw	sfx152text
	dw	sfx153text
	dw	sfx154text
	dw	sfx155text
	dw	sfx156text
	dw	sfx157text
	dw	sfx158text
	dw	sfx159text
	dw	sfx160text
	dw	sfx161text
	dw	sfx162text
	dw	sfx163text
	dw	sfx164text
	dw	sfx165text
	dw	sfx166text
	dw	sfx167text
	dw	sfx168text
	dw	sfx169text
	dw	sfx170text
	dw	sfx171text
	dw	sfx172text
	dw	sfx173text
	dw	sfx174text
	dw	sfx175text

shiplist
	dw	ship0text
	dw	ship1text
	dw	ship2text
	dw	ship3text
	dw	ship4text
	dw	ship5text
	dw	ship6text
	dw	ship7text
	dw	ship8text
	dw	ship9text
	dw	ship10text
	dw	ship11text
	dw	ship12text
	dw	ship13text
	dw	ship14text
	dw	ship15text
	dw	ship16text
	dw	ship17text
	dw	ship18text
	dw	ship19text
	dw	ship20text
	dw	ship21text
	dw	ship22text
	dw	ship23text
	dw	ship24text
	dw	ship25text
	dw	ship26text
	dw	ship27text
	dw	ship28text
	dw	ship29text
	dw	ship30text
	dw	ship31text
	dw	ship32text
	dw	ship33text
	dw	ship34text
	dw	ship35text
	dw	ship36text
	dw	ship37text
	dw	ship38text
	dw	ship39text
	dw	ship40text
	dw	ship41text
	dw	ship42text
	dw	ship43text
	dw	ship44text
	dw	ship45text
	dw	ship46text
	dw	ship47text
	dw	ship48text
	dw	ship49text


	
	strats_end