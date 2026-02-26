
	include	INC\header.inc

	incpublics	EXT\incbins.ext


	bank	18
msprites1	incbinfile	msprites\tex_01.bin
mworldspr	equ	msprites1
	bankend	18

	bank	19
	IFEQ	GERMAN
msprites2	incbinfile	msprites\tex_23.bin
	ELSEIF
msprites2	incbinfile	msprites\tex_23_a.bin
	ENDC
	bankend	19

	bank	20
	incfile	MARIO\mdata.mc
msprites3
	inccru	bgdemoccr,data\demo.ccr
	inccru	bgdemopcr,data\demo.pcr
	inccru	bgholeaccr,data\hole-a.ccr
	inccru	bgbccr,data\b.ccr
	inccru	bgbpcr,data\b.pcr

	IFEQ	german
	inccru	sprites,data\obj-1.ccr
	ELSEIF
	inccru	sprites,data\obj-1-g.ccr
	ENDC

	inccru	bgetestccr,data\e-test.ccr
	inccru	bgetestpcr,data\e-test.pcr
	inccru	bgetest2ccr,data\e-test2.ccr
	inccru	bgetest2pcr,data\e-test2.pcr

	IFEQ	german
	inccru	bgfoxccr,data\fox.ccr
	ELSEIF
	inccru	bgfoxccr,data\fox-g.ccr
	ENDC

	inccru	bgfoxpcr,data\fox.pcr
	inccru	bgbmccr,data\b-m.ccr
	inccru	bgstpccr,data\st-p.ccr
	inccru	bg23hpcr,data\2-3h.pcr
	bankend	20

	bank	21
	inccru	bgstppcr,data\st-p.pcr
	inccru	bg22ccr,data\2-2.ccr
	inccru	bg23ccr,data\2-3.ccr
	inccru	bg23bccr,data\2-3b.ccr
	inccru	bgstarsccr,data\stars.ccr
	inccru	bg13bccr,data\1-3-b.ccr
	inccru	bgspaceccr,data\space.ccr
	inccru	bglastpcr,data\last.pcr
	inccru	bg32ccr,data\3-2.ccr
	inccru	bgfsbg3ccr,data\fs-bg3.ccr

	IFEQ	german
	inccru	mapccr,data\map.ccr
	inccru	bg33ccr,data\3-3.ccr
	ELSEIF
	inccru	mapccr,data\map-g.ccr
	inccru	bg33ccr,data\3-3.ccr
	ENDC

	inccru	bgfsnipcr,data\fs-ni.pcr
	inccru	bgtsspcr,data\t-ss.pcr
	inccru	bg34ccr,data\3-4.ccr
	bankend	21

	bank	22
	inccru	bg22pcr,data\2-2.pcr
	inccru	bglsbccr,data\lsb.ccr
	inccru	bgf1ccr,data\f-1.ccr
	inccru	bgbholeccr,data\b-hole.ccr
	inccru	bgtfspcr,data\t-f-s.pcr
	inccru	bg23pcr,data\2-3.pcr
	inccru	bg23bpcr,data\2-3b.pcr
	inccru	mappcr,data\map.pcr
	inccru	bgstarspcr,data\stars.pcr
	inccru	bg32pcr,data\3-2.pcr
	inccru	bg13bpcr,data\1-3-b.pcr
	inccru	bg13pcr,data\1-3.pcr
	inccru	bg14pcr,data\1-4.pcr
	inccru	bg14ccr,data\1-4.ccr
	inccru	bg33pcr,data\3-3.pcr
	inccru	bg34pcr,data\3-4.pcr
	inccru	bglsbpcr,data\lsb.pcr
	inccru	fobjccr,data\f-obj.ccr
	inccru	bgbholepcr,data\b-hole.pcr
	inccru	bgholeapcr,data\hole-a.pcr
	inccru	bgtsppcr,data\t-sp.pcr
	inccru	bg24pcr,data\2-4.pcr
	inccru	bgtstpcr,data\t-st.pcr
	bankend	22

	bank	23

	IFEQ	german
	inccru	bgcppcr,data\cp.pcr
	ELSEIF
	inccru	bgcppcr,data\cp-p.pcr
	ENDC

	inccru	bgtstccr,data\t-st.ccr
	inccru	bgtspccr,data\t-sp.ccr
	inccru	bgcmccr,data\c-m.ccr

	IFNE	JAPANESE
	inccru	bgcontccr,data\cont.ccr
	inccru	bgcontpcr,data\cont.pcr
	elseif

	IFEQ	german
	inccru	bgcontccr,data\cont-2.ccr
	inccru	bgcontpcr,data\cont-2.pcr
	ELSEIF
	inccru	bgcontccr,data\cont-2-g.ccr
	inccru	bgcontpcr,data\cont-2-g.pcr
	ENDC
	endc

	IFEQ	titlelogo ; if titlelogo=0 (JP)
	inccru	bgti3ccr,data\ti-3.ccr
	inccru	bgti3pcr,data\ti-3.pcr
	ENDC

	IFEQ	titlelogo-1 ; if titlelogo=1 (US Rev. 1/2)
	inccru	bgti3ccr,data\ti-3-us.ccr
	inccru	bgti3pcr,data\ti-3-us.pcr
	ENDC

	IFEQ	titlelogo-2 ; if titlelogo=2 (US Rev. 0)
	inccru	bgti3ccr,data\ti-3-us.ccr
	inccru	bgti3pcr,data\ti-3-us.pcr
	ENDC

	IFEQ	titlelogo-3 ; if titlelogo=3 (PAL/Germany StarWing)
	inccru	bgti3ccr,data\ti-3-g.ccr
	inccru	bgti3pcr,data\ti-3-g.pcr
	ENDC

	inccru	bg24ccr,data\2-4.ccr

	IFEQ	GERMAN					
	inccru	bgcpccr,data\cp.ccr
	ELSEIF
	inccru	bgcpccr,data\cp-p.ccr
	ENDC

facedata	incbin	data\face.cgx
	inccru	allcolscru,data\col\allcols.pac

	bankend	23

	bank	35
	inccru	dogpcr,data\dog.pcr
	inccru	bgmccr,data\m.ccr
	bankend	35

; Crash handler GFX (BLINK.ASM)
	bank	41
	inccru	oopsccr,data\oops.ccr
	inccru	oopspcr,data\oops.pcr
	bankend	41

;------------------------------------------------------------------

firstsndbnk	=	24
musicsize	=	0

	IFNE	MSU1
; SUNLITNOTE modified sound driver for MSU-1 may be unnecessary?
; SOUND.ASM seems to do enough to mute BGM already
	incsnd	sound0,snd\msusnd0.bin
	ELSEIF	;IFEQ	MSU1
	incsnd	sound0,snd\sgsound0.bin
	IFNE	MSUVOICE
	incsnd	voicepatch,snd\msuvoice.bin
	ENDC
	ENDC	;MSU1
	incsnd	sound1,snd\sgsound1.bin

	IFEQ	PAL
	incsnd	orchestra,snd\sgsound2.bin
	ELSEIF
	incsnd	orchestra,snd\psgsnd2.bin
	ENDC

	incsnd	band,snd\sgsound3.bin
	incsnd	sound4,snd\sgsound4.bin

	IFEQ	PAL
	incsnd	sound5,snd\sgsound5.bin
	ELSEIF
	incsnd	sound5,snd\psgsnd5.bin
	ENDC

	incsnd	sound6,snd\sgsound6.bin
	incsnd	titlebgm,snd\sgsound7.bin
	incsnd	bgmendseq,snd\sgsound8.bin
	incsnd	bgmcontinue,snd\sgsound9.bin

	IFEQ	GERMAN
	IFEQ	PAL
	incsnd	bgmstaff,snd\sgsounda.bin
	ELSEIF
	incsnd	bgmstaff,snd\psgsnda.bin
	ENDC
	ELSEIF
	incsnd	bgmstaff,snd\gsgsnda.bin
	ENDC

	incsnd	corneria,snd\sgbgma.bin
	incsnd	meteor_base,snd\sgbgmb.bin
	incsnd	titania,snd\sgbgmc.bin
	incsnd	bgmtraining,snd\sgbgmo.bin
	incsnd	macbeth,snd\sgbgme.bin
	incsnd	asteroid_field,snd\sgbgmf.bin
	incsnd	space_armada,snd\sgbgmg.bin
	incsnd	venom_base_2,snd\sgbgmh.bin
	incsnd	sector_x_z,snd\sgbgmi.bin
	incsnd	venom_base_1_3,snd\sgbgmk.bin
	incsnd	out_of_this_dimension,snd\sgbgmp.bin
	incsnd	boss_corneria,snd\sgbgm1.bin
	incsnd	boss_titania,snd\sgbgm4.bin
	incsnd	boss_meteor,snd\sgbgm5.bin
	incsnd	boss_space_armada,snd\sgbgm6.bin
	incsnd	boss_venom_base_2,snd\sgbgm8.bin
	incsnd	boss_venom_base_1,snd\sgbgm9.bin
	incsnd	venom_andross,snd\sgbgm10.bin

	ifne	JAPANESE ; if JAPANESE = 1
	inccru	obj2ccr,data\obj-2.ccr ; training/game text (JP)
	elseif
	ifne	german ; if german = 1
	inccru	obj2ccr,data\obj-4.ccr ; training/game text (GER)
	elseif
	ifne	pal ; if german = 1
	inccru	obj2ccr,data\obj-3.ccr ; training/game text (US/EU)
	elseif
	inccru	obj2ccr,data\obj-3.ccr ; training/game text (US/EU)
	endc
	endc
	endc

	ifgt	@-$200000
	PRINTF	"%01%31MORE THAN 16 MEGA-BITS OF ROM USED!!%n%00"
	FAIL
	endc

	include	INC\tail.inc


