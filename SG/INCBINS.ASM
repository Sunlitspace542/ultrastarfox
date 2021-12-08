
	include	header.inc

	incpublics	incbins.ext


	bank	21
msprites1	incbinfile	msprites\sprites3.dat
mworldspr	equ	msprites1
	bankend	21

	bank	22
msprites2	incbinfile	msprites\sprites4.dat
	fileslog	msprites\spritesg.dat
	bankend	22

	bank	23
msprites3	incbinfile	msprites\msprite4.dat
	bankend	23
	
	bank	48
msprites5	incbinfile	msprites\msprite5.dat
	bankend	48

	bank	24
	inccru	bgdemoccr,data\demo.ccr
	inccru	bgdemopcr,data\demo.pcr
	inccru	bgholeaccr,data\hole-a.ccr
	inccru	bgbccr,data\b.ccr
	inccru	bgbpcr,data\b.pcr

	inccru	sprites,data\obj-1.ccr
	fileslog	data\obj-1-g.ccr

	inccru	bgetestccr,data\e-test.ccr
	inccru	bgetestpcr,data\e-test.pcr
	inccru	bgetest2ccr,data\e-test2.ccr
	inccru	bgetest2pcr,data\e-test2.pcr

	inccru	bgfoxccr,data\fox.ccr
	fileslog	data\fox-g.ccr

	inccru	bgfoxpcr,data\fox.pcr
	inccru	bgbmccr,data\b-m.ccr
	inccru	bgstpccr,data\st-p.ccr	
	inccru	bg23hpcr,data\2-3h.pcr
	bankend	24
	
	bank	25
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


	inccru	mapccr,data\map.ccr
	inccru	bg33ccr,data\3-3.ccr

	fileslog	data\map-g.ccr
	fileslog	data\sc.ccr
	fileslog	data\sc.pcr

	inccru	bgfsnipcr,data\fs-ni.pcr
	inccru	bgtsspcr,data\t-ss.pcr
	inccru	bg34ccr,data\3-4.ccr
	bankend	25

	bank	26
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
	bankend	26

	bank	27
	inccru	dogpcr,data\dog.pcr

	inccru	bgcppcr,data\cp.pcr
	fileslog	data\cp-g.pcr
	fileslog	data\e.pcr

	inccru	bgtstccr,data\t-st.ccr
	inccru	bgtspccr,data\t-sp.ccr


	inccru	bgcontccr,data\cont-2.ccr
	inccru	bgcontpcr,data\cont-2.pcr
	fileslog	data\cont-2-g.ccr
	fileslog	data\cont-2-g.pcr

	inccru	bgti3ccr,data\ti-3-us.ccr
	inccru	bgti3pcr,data\ti-3-us.pcr


	fileslog	data\cont.ccr
	fileslog	data\cont.pcr
	fileslog	data\ti-3.pcr
	fileslog	data\ti-3.ccr

	inccru	bg24ccr,data\2-4.ccr
	fileslog	data\ti.ccr
	fileslog	data\ti.pcr


	inccru	bgcpccr,data\cp.ccr
	fileslog	data\cp-g.ccr
	fileslog	data\e.ccr


facedata	inccolfile	data\face.cgx,0,360
	inccru	allcolscru,data\gfx\allcol.pac

	inccru	bgmccr,data\m.ccr

	bankend	27

	bank	28
	inccru	bgfortnccr,data\fortn.ccr
	inccru	bgfortnpcr,data\fortn.pcr
	inccru	bgfxdesccr,data\FXDES.ccr
	inccru	bgfxdespcr,data\FXDES.pcr
	inccru	bgcornccr,data\corn.ccr
	inccru	bgcornpcr,data\corn.pcr
	inccru	bgasteroidccr,data\asteroid.ccr
	inccru	bgasteroidpcr,data\asteroid.pcr
	inccru	bgalphaccr,data\alpha.ccr
	inccru	bgalphapcr,data\alpha.pcr
	inccru	bgrbccr,data\rb.ccr
	inccru	bgrbpcr,data\rb.pcr
	inccru	bgvhwypccr,data\vhwyp.ccr
	inccru	bgvhwyppcr,data\vhwyp.pcr
	inccru	bgvenomaccr,data\venoma.ccr
	inccru	bgvenomapcr,data\venoma.pcr
	inccru	bgcmccr,data\c-m.ccr
	inccru	bgvorcloccr,data\vorclo.ccr
	inccru	bgvorclopcr,data\vorclo.pcr
	bankend	28

	bank	29
	inccru	bgcityccr,data\city.ccr
	inccru	bgcitypcr,data\city.pcr
	inccru	bgvordesccr,data\vordes.ccr
	inccru	bgvordespcr,data\vordes.pcr
	inccru	bgvoriceccr,data\vorice.ccr
	inccru	bgvoricepcr,data\vorice.pcr
	inccru	bgmap2pcr,data\map2.pcr
	inccru	bgmap2ccr,data\map2.ccr
	inccru	bgsgsxpcr,data\sgsx.pcr
	inccru	bgsgsxccr,data\sgsx.ccr
	

	bankend	29
;------------------------------------------------------------------
	bank	51
	incfile	mdata.mc
	bankend	51


firstsndbnk	=	53
musicsize	=	0
	incsnd	sound0,snd\sgsound0.bin
	incsnd	sound1,snd\sgsound1.bin

	IFEQ	PAL
	incsnd	sound2,snd\sgsound2.bin
	fileslog	snd\psgsnd2.bin
	ELSEIF
	incsnd	sound2,snd\psgsnd2.bin
	fileslog	snd\sgsound2.bin
	ENDC

	incsnd	sound3,snd\sgsound3.bin
	incsnd	sound4,snd\sgsound4.bin

	IFEQ	PAL
	incsnd	sound5,snd\sgsound5.bin
	fileslog	snd\psgsnd5.bin
	ELSEIF
	incsnd	sound5,snd\psgsnd5.bin
	fileslog	snd\sgsound5.bin
	ENDC

	incsnd	sound6,snd\sgsound6.bin
	incsnd	titlebgm,snd\sgsound7.bin
	incsnd	bgmendseq,snd\sgsound8.bin
	incsnd	bgmcontinue,snd\sgsound9.bin

	IFEQ	GERMAN
	IFEQ	PAL
	incsnd	bgmstaff,snd\sgsounda.bin
	fileslog	snd\gsgsnda.bin
	fileslog	snd\psgsnda.bin
	ELSEIF
	incsnd	bgmstaff,snd\psgsnda.bin
	fileslog	snd\gsgsnda.bin
	fileslog	snd\sgsounda.bin
	ENDC
	ELSEIF
	incsnd	bgmstaff,snd\gsgsnda.bin
	fileslog	snd\sgsounda.bin
	fileslog	snd\psgsnda.bin
	ENDC

	incsnd	bgma,snd\sgbgma.bin
	incsnd	bgmb,snd\sgbgmb.bin
	incsnd	bgmc,snd\sgbgmc.bin
	incsnd	bgmo,snd\sgbgmo.bin
	incsnd	bgme,snd\sgbgme.bin
	incsnd	bgmf,snd\sgbgmf.bin
	incsnd	bgmg,snd\sgbgmg.bin
	incsnd	bgmh,snd\sgbgmh.bin
	incsnd	bgmi,snd\sgbgmi.bin
	incsnd	bgmk,snd\sgbgmk.bin
	incsnd	bgmp,snd\sgbgmp.bin
	incsnd	bgm1,snd\sgbgm1.bin
	incsnd	bgm4,snd\sgbgm4.bin
	incsnd	bgm5,snd\sgbgm5.bin
	incsnd	bgm6,snd\sgbgm6.bin
	incsnd	bgm8,snd\sgbgm8.bin
	incsnd	bgm9,snd\sgbgm9.bin
	incsnd	bgm10,snd\sgbgm10.bin
	inccru	obj2ccr,data\obj-3.ccr
	fileslog data\obj-2.ccr

	printf	:$*,"%n"

;	ifgt	@-$100000
;	printf	"%N%N  MORE THAN 8 MEGA-BITS OF ROM USED!! %N%N"
;	FAIL
;	endc


	fileslog	data\gfx\bg2-a.col
	fileslog	data\gfx\bg2-b.col
	fileslog	data\gfx\bg2-c.col
	fileslog	data\gfx\bg2-d.col
	fileslog	data\gfx\bg2-e.col
	fileslog	data\gfx\bg2-f.col
	fileslog	data\gfx\bg2-g.col
	fileslog	data\gfx\t-m.col
	fileslog	data\gfx\t-m-2.col
	fileslog	data\gfx\t-m-3.col
	fileslog	data\gfx\t-m-4.col
	fileslog	data\gfx\b-m.col
	fileslog	data\gfx\light.col
	fileslog	data\gfx\space.col
	fileslog	data\gfx\stars.col
	fileslog	data\gfx\cp.col
	fileslog	data\gfx\cp-us.col
	fileslog	data\gfx\hole.col
	fileslog	data\gfx\l.col
	fileslog	data\gfx\e-test0.col
	fileslog	data\gfx\e-test.col
	fileslog	data\gfx\obj-1.col


	include	tail.inc


