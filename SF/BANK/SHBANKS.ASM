	include	INC\header.inc
	include	INC\stratequ.inc

	include	INC\shmacs.inc

	include	EXT\colboxes.ext
	include	EXT\coltabs.ext

	INCPUBLICS EXT\shbanks.ext

do_hdr	=	0

;------------------------------------------------------------------
	bank	12
	incshapes	SHAPES\shapes.asm	
	incshapes	SHAPES\kshapes.asm

	IFEQ	PAL
bgmm	incbinfile	snd\sgbgmm.bin
	fileslog	snd\psgbgmm.bin
	ELSEIF
bgmm	incbinfile	snd\psgbgmm.bin
	fileslog	snd\sgbgmm.bin
	ENDC

bgmmlen	equ	*-bgmm
	bankend	12

;------------------------------------------------------------------
	bank	14
	incshapes	SHAPES\shapes2.asm
	inccru	bgmpcr,data\m.pcr
bgm2	incbinfile	snd\sgbgm2.bin
bgm2len	equ	*-bgm2
	bankend	14

;------------------------------------------------------------------
	bank	15
	INCshapes	SHAPES\shapes3.asm

bgmn	incbinfile	snd\sgbgmn.bin
bgmnlen	equ	*-bgmn
	bankend	15

;------------------------------------------------------------------
	bank	16
	incshapes	SHAPES\shapes4.asm

bgmj	incbinfile	snd\sgbgmj.bin
bgmjlen	equ	*-bgmj
	bankend	16

;------------------------------------------------------------------
	bank	17
	incshapes	SHAPES\shapes5.asm
	incshapes	SHAPES\ushapes.asm
	incshapes	SHAPES\pshapes.asm

	public	dogccr
	inccru	dogccr,data\dog.ccr
bgm7	incbinfile	snd\sgbgm7.bin
bgm7len	equ	*-bgm7
bgm3	incbinfile	snd\sgbgm3.bin
bgm3len	equ	*-bgm3

	bankend	17

	bank	37
	incshapes	SHAPES\shapes6.asm
	bankend	37
	
	bank	38
	incshapes	SHAPES\shapes7.asm
	bankend	38


	include	INC\tail.inc

