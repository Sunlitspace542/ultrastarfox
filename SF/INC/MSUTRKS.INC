;###################
;# MSU-1 TRACK IDS #
;###################
; based on track order from
; https://docs.google.com/spreadsheets/d/1_pgX2OIBm2DT4jNIeigdekD9OpZ5tVtaE5Fw2oGWPUc/edit#gid=0
_001_introvideo		equ	$0001 ; Intro FMV audio
_002_dangerous		equ	$0002 ; Entering Dangerous Territory

_004_lastboss		equ	$0004 ; Last Boss Andross

_007_clearband		equ	$0007 ; Clear Band
_008_clearorch		equ	$0008 ; Clear Orch
_009_clearorch		equ	$0009
_010_clearorch		equ	$000A
_011_bossroll		equ	$000B ; Ending (Bosses)

_017_downband		equ	$0011 ; Down Band

_020_maintheme		equ	$0014 ; Main Theme

_023_gameover		equ	$0017 ; Game Over

_028_ootd			equ	$001C ; OOTD

_030_slotboss		equ	$001E ; Slot Machine Boss
_031_clearootd		equ	$001F ; Clear OOTD
_032_clearband		equ	$0020 ; Clear Band

_035_sectorxz		equ	$0023 ; Sector X/Z

_037_astboss		equ	$0025 ; Asteroid Boss

_048_titledemo		equ	$0030 ; Title Demonstration
_049_downorch		equ	$0031 ; Down Orch

_057_titlescr		equ	$0039 ; Title Screen

_059_titania		equ	$003B ; Titania

_061_titaniaboss	equ	$003D ; Titania Boss

_070_training		equ	$0046 ; Training Mode
_071_controls		equ	$0047 ; Controls Select

_073_sectory		equ	$0049 ; Sector Y

_075_astboss		equ	$004B ; Asteroid Boss

_082_mapscr			equ	$0052 ; Map

_088_downorch		equ	$0058 ; Down Orch
_089_bholeexit		equ	$0059 ; Exit Black Hole

_092_misbrief		equ	$005C ; Mission Brief

_094_misbriefshort	equ	$005E ; Mission Brief Short

_096_bholemap		equ $0060 ; Black Hole Map

_100_continue		equ	$0064 ; Continue

_102_bhole			equ	$0066 ; Black Hole

_106_venom2			equ	$006A ; Venom Highway

_108_venom1			equ	$006C ; Venom 1

_121_dangerous		equ	$0079 ; Entering Dangerous Territory

_134_emergency		equ	$0086 ; Emergency Call

_145_corneria		equ	$0091 ; Corneria
_146_bholeenter		equ	$0092 ; Black Hole Enter
_147_cornboss		equ	$0093 ; Corneria Boss

_152_secret			equ	$0098 ; Secret Activated
_153_asteroid_vo	equ	$0099 ; Asteroid/Venom Orbital

_155_asterboss		equ $009B ; Asteroid Boss

_159_asteroid_vo	equ	$009F ; Asteroid/Venom Orbital

_161_asterboss		equ $00A1 ; Asteroid Boss

_164_warpdrive		equ $00A4 ; Warp Drive Spool

_170_hyperspeed		equ	$00AA ; Warp Drive Engage (exit)

_174_spacearm		equ	$00AE ; Space Armada
_175_dangerarm		equ	$00AF ; Dangerous Territory (Armada)
_176_armboss		equ	$00B0 ; Armada Boss Core Type

_178_fortuna		equ $00B2 ; Fortuna
_179_exitwarpenter	equ	$00B3 ; Exiting Warp - Entering Stage
_180_fortboss		equ $00B4 ; Fortuna Boss

_191_sectorxz		equ $00BF ; Sector X/Z

_193_seczapproach	equ	$00C1 ; Approaching Boss - Sector Z
_194_sectorzboss	equ	$00C2 ; Sector Z Boss

_206_downorch		equ	$00CE ; Down Orch

_210_macbeth		equ	$00D2 ; Macbeth
_211_meteor			equ	$00D3 ; Meteor
_212_macboss		equ	$00D4 ; Macbeth Boss
_213_meteboss		equ	$00D5 ; Meteor Boss

_225_asteroid_vo	equ	$00E1 ; Asteroid/Venom Orbital
_226_bossplanet		equ $00E2 ; Boss Battle Planet (Corneria Boss)
_227_venombase		equ	$00E3 ; Venom Base

_230_lastclear		equ	$00E6 ; Last Boss Clear? track id found in v12_msu.asm as "venom destroyed"

_243_venom1			equ	$00F3 ; Venom 1
_244_venom3			equ	$00F4 ; Venom 3

_246_bossvenom1		equ	$00F6 ; Venom 1 Boss
_247_lastboss		equ	$00F7 ; Last Boss Andross
_248_lastclear		equ $00F8 ; Last Boss Clear

_252_cleardemo		equ	$00FC ; Game Clear Demonstration

; EOF