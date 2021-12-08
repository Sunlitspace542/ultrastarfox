	include	header.inc
	include	stratequ.inc

	include	shmacs.inc

	include	colboxes.ext
	include	coltabs.ext

	INCPUBLICS shbanks.ext

do_hdr	=	0


;------------------------------------------------------------------
	bank	13
	incshapes	shapes.asm	
	incshapes	kshapes.asm

	IFEQ	PAL
bgmintro	incbinfile	snd\sgbgmm.bin
	fileslog	snd\psgbgmm.bin
	ELSEIF
bgmintro	incbinfile	snd\psgbgmm.bin
	fileslog	snd\sgbgmm.bin
	ENDC

bgmintrolen	equ	*-bgmintro
	bankend	13

;------------------------------------------------------------------
	bank	14
	incshapes	shapes2.asm
	inccru	bgmpcr,data\m.pcr
bgm2	incbinfile	snd\sgbgm2.bin
bgm2len	equ	*-bgm2
	bankend	14

;------------------------------------------------------------------
	bank	15
	INCshapes	shapes3.asm

bgmn	incbinfile	snd\sgbgmn.bin
bgmnlen	equ	*-bgmn
	bankend	15

;------------------------------------------------------------------
	bank	16
	incshapes	shapes4.asm

bgmj	incbinfile	snd\sgbgmj.bin
bgmjlen	equ	*-bgmj
	bankend	16

;------------------------------------------------------------------
	bank	17
	incshapes	shapes5.asm
	incshapes	ushapes.asm
	incshapes	pshapes.asm

	public	dogccr
	inccru	dogccr,data\dog.ccr

bgm7	incbinfile	snd\sgbgm7.bin
bgm7len	equ	*-bgm7
bgm3	incbinfile	snd\sgbgm3.bin
bgm3len	equ	*-bgm3

	bankend	17


	bank	18
    incshapes    shapes8.asm

    fileslog    shapes8.asm
	bankend	18
    
	bank	19
	incshapes	shapes9.asm
	
	fileslog	shapes9.asm
	bankend	19    
	bank	20
	incshapes	shapes10.asm
	
	fileslog	shapes10.asm
	bankend	20

	bank	49
	incshapes	shapes11.asm
	fileslog	shapes11.asm
	bankend	49
	
	bank	50
	incshapes	shapes12.asm
	fileslog	shapes12.asm
	bankend	50
	
	include	tail.inc

