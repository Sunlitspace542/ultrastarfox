

;Mario chip flags (mflags)
mf_e	equ	1	;exec flag
mf_z	equ	2	;zero flag
mf_c	equ	4	;carry flag
mf_s	equ	8	;sign 0/1 pos/neg
mf_v	equ	16	;overflow
mf_g	equ	32	;go (chip running)
;mode set by prefixes
mf_alt1	equ	256	;Set by ALT1 prefix
mf_alt2	equ	512	;Set by ALT2 prefix
mf_il	equ	1024	;immediate low byte (done before ih)
mf_ih	equ	2048	;immediate hight byte
mf_b	equ	4096	;Set by WITH
mf_irq	equ	32768	;mario interrupt flag



;Mario chip input/output mode (mio_mode)
mm_scm0	equ	1	;\Screen mode (0,1,2)(4,16,256 colours)
mm_scm1	equ	2	;/
mm_sch	equ	4	;Screen height (0,1)(128,160 pix high)
mm_ramn	equ	8	;RAM nasty flag
mm_romn	equ	16	;ROM nasty flag
mm_sch1	equ	32	;second screen height flag

height_128	equ	0
height_160	equ	mm_sch
height_192	equ	mm_sch1

colours_4	equ	0
colours_16	equ	mm_scm0
colours_256	equ	mm_scm0!mm_scm1


; Mario chip register defs

r0	equr	0
r1	equr	1
r2	equr	2
r3	equr	3
r4	equr	4
r5	equr	5
r6	equr	6
r7	equr	7
r8	equr	8
r9	equr	9
r10	equr	10
r11	equr	11
r12	equr	12
r13	equr	13
r14	equr	14
r15	equr	15
pc	equr	r15


;Macros for mario chip instruction set macros

mcache	macro
	ifne	cacheon
	db	2
	endc
	ifeq	cacheon
	mnop
	endc
	endm

mrpix	macro
	mrpixbugfix
	endm

mrpixbugfix	macro

;	sub	r0
;	cmode
;	colour
	rpix
;	rpix



;	sub	r0
;	cmode
;	move	r1,r0
;	move	r2,r0
;	move	r0,#1
;	colour
;	plot
;	plot
;	plot
;	plot
;	plot
;	plot
;	plot
;	plot
;	plot
;	plot
;



	endm

miwt	macro
Error	=	13
	ifne	\1<16
	db	\1+$f0
	dw	(\2)&$ffff
Error	=	0
	endc
	ifne	Error
	m_error	Bad IWT reg
	endc
	endm
	

mlm	macro
Error	=	13
	ifne	\1<16
	db	$3d,\1+$f0
	dw	(\2)&$ffff
Error	=	0
	endc
	ifne	Error
	m_error	Bad LM reg
	endc
	endm


msm	macro
Error	=	13
	ifne	\2<16
	db	$3e,\2+$f0
	dw	(\1)&$ffff
Error	=	0
	endc
	ifne	Error
	m_error	Bad SM reg
	endc
	endm

morn	macro
Error	=	10
	ifne	(\1>0)&(\1<16)
	db	$3e,\1+$c0
Error	=	0
	endc
	ifne	Error
	m_error	Bad ORn val
	endc	
	endm


;************************************************

mnop	macro
	db	1
	endm


mibt	macro
Error	=	13
	ifne	\1<16
	db	\1+$a0
	db	(\2)&$ff
Error	=	0
	endc
	ifne	Error
	m_error	Bad IBT reg
	endc
	endm

	ifeq	1

mstop	macro
	db	0
	endm


mcache	macro
	ifne	cacheon
	db	2
	endc
	ifeq	cacheon
	mnop
	endc
	endm

mlsr	macro
	db	3
	endm


mrol	macro
	db	4
	endm


mbra	macro
	db	$05,\1-*-1
	endm

mbge	macro
	db	$06,\1-*-1
	endm

mblt	macro
	db	$07,\1-*-1
	endm

mbne	macro
	db	$08,\1-*-1
	endm

mbeq	macro
	db	$09,\1-*-1
	endm

mbpl	macro
	db	$0A,\1-*-1
	endm

mbmi	macro
	db	$0B,\1-*-1
	endm

mbcc	macro
	db	$0C,\1-*-1
	endm

mbcs	macro
	db	$0D,\1-*-1
	endm

mbvc	macro
	db	$0E,\1-*-1
	endm

mbvs	macro
	db	$0F,\1-*-1
	endm



mto	macro
Error	=	2
	ifne	(\1>-1)&(\1<16)
	db	\1+$10
Error	=	0
	endc
	ifne	Error
	m_error	Bad TO reg
	endc	
	endm

mmove	macro
error	=	2
	ifne	((\1>-1)&(\1<16))|((\2>-1)&(\2<16))
	db	$20+\2,$10+\1
error	=	0
	endc
	ifne	Error
	m_error	Bar MOVE reg
	endc
	endm



mwith	macro
Error	=	3
	ifne	(\1>-1)&(\1<16)
	db	\1+$20
Error	=	0
	endc
	ifne	Error
	?Error
	endc	
	endm


mstw	macro
Error	=	4
	ifne	(\1>-1)&(\1<12)
	db	\1+$30
Error	=	0
	endc
	ifne	Error
	m_error	Bad STB reg
	endc	
	endm



mstb	macro
Error	=	4
	ifne	(\1>-1)&(\1<12)
	db	$3d,\1+$30
Error	=	0
	endc
	ifne	Error
	m_error	Bad_STW_reg
	endc	
	endm


mloop	macro
	db	$3c
	endm


malt1	macro
	db	$3d
	endm

malt2	macro
	db	$3e
	endm

malt3	macro
	db	$3f
	endm



mldw	macro
Error	=	5
	ifne	(\1>-1)&(\1<12)
	db	\1+$40
Error	=	0
	endc
	ifne	Error
	m_error	Bad STB reg
	endc	
	endm


mldb	macro
Error	=	5
	ifne	(\1>-1)&(\1<12)
	db	$3d,\1+$40
Error	=	0
	endc
	ifne	Error
	m_error	Bad STW reg
	endc	
	endm


mplot	macro
	db	$4c
	endm

;	db	$3d,$4c

	IFEQ	1
mrpix	macro
	mrpixbugfix
	endm

mrpixbugfix	macro
	mibt	r0,1
	mcolour
	msub	r0
	mcmode
	mibt	r1,0
	mibt	r2,0
	mplot
	endm

	ENDC


mswap	macro
	db	$4D
	endm




mcolour	macro
	db	$4e
	endm


mcmode	macro
	db	$3d,$4e
	endm

mnot	macro
	db	$4f
	endm



madd	macro
Error	=	6
	ifne	(\1>-1)&(\1<16)
	db	\1+$50
Error	=	0
	endc
	ifne	Error
	m_error	Bad ADD reg
	endc	
	endm


madc	macro
Error	=	6
	ifne	(\1>-1)&(\1<16)
	db	$3d,\1+$50
Error	=	0
	endc
	ifne	Error
	m_error	Bad ADC reg
	endc	
	endm

maddn	macro
Error	=	6
	ifne	(\1>-1)&(\1<16)
	db	$3e,\1+$50
Error	=	0
	endc
	ifne	Error
	m_error	Bad ADDn val
	endc	
	endm

madcn	macro
Error	=	6
	ifne	(\1>-1)&(\1<16)
	db	$3f,\1+$50
Error	=	0
	endc
	ifne	Error
	m_error	Bad ADCn val
	endc	
	endm


msub	macro
Error	=	7
	ifne	(\1>-1)&(\1<16)
	db	\1+$60
Error	=	0
	endc
	ifne	Error
	m_error	Bad SUB reg
	endc	
	endm


msbc	macro
Error	=	7
	ifne	(\1>-1)&(\1<16)
	db	$3d,\1+$60
Error	=	0
	endc
	ifne	Error
	m_error	Bad SBC reg
	endc	
	endm


msubn	macro
Error	=	7
	ifne	(\1>-1)&(\1<16)
	db	$3e,\1+$60
Error	=	0
	endc
	ifne	Error
	m_error	Bad SUBn val
	endc	
	endm


mcmp	macro
Error	=	7
	ifne	(\1>-1)&(\1<16)
	db	$3f,\1+$60
Error	=	0
	endc
	ifne	Error
	m_error	Bad cmp reg
	endc	
	endm

mmerge	macro
	db	$70
	endm


mand	macro
Error	=	8
	ifne	(\1>0)&(\1<16)
	db	\1+$70
Error	=	0
	endc
	ifne	Error
	m_error	Bad AND reg
	endc	
	endm


mbic	macro
Error	=	9
	ifne	(\1>0)&(\1<16)
	db	$3d,\1+$70
Error	=	0
	endc
	ifne	Error
	m_error	Bad BIC reg
	endc	
	endm



mandn	macro
Error	=	8
	ifne	(\1>0)&(\1<16)
	db	$3e,\1+$70
Error	=	0
	endc
	ifne	Error
	m_error	Bad ANDn val
	endc	
	endm


mbicn	macro
Error	=	9
	ifne	(\1>0)&(\1<16)
	db	$3f,\1+$70
Error	=	0
	endc
	ifne	Error
	m_error	Bad BIC val
	endc	
	endm


mmult	macro
Error	=	8
	ifne	(\1>-1)&(\1<16)
	db	\1+$80
Error	=	0
	endc
	ifne	Error
	m_error	Bad MULT reg
	endc	
	endm


mumult	macro
Error	=	9
	ifne	(\1>-1)&(\1<16)
	db	$3d,\1+$80
Error	=	0
	endc
	ifne	Error
	m_error	Bad UMULT reg
	endc	
	endm



mmultn	macro
Error	=	8
	ifne	(\1>-1)&(\1<16)
	db	$3e,\1+$80
Error	=	0
	endc
	ifne	Error
	m_error	Bad MULTn val
	endc	
	endm



mumultn	macro
Error	=	8
	ifne	(\1>-1)&(\1<16)
	db	$3f,\1+$80
Error	=	0
	endc
	ifne	Error
	m_error	Bad MULTn val
	endc	
	endm




msbk	macro
	db	$90
	endm


mlnk1	macro
	db	$91
	endm

mlnk2	macro
	db	$92
	endm

mlnk3	macro
	db	$93
	endm

mlnk4	macro
	db	$94
	endm


msex	macro
	db	$95
	endm


masr	macro
	db	$96
	endm

mdiv2	macro
	db	$3d,$96
	endm

mror	macro
	db	$97
	endm

mjmp	macro
Error	=	12
	ifne	(\1>7)&(\1<14)
	db	\1+$90
Error	=	0
	endc
	ifne	Error
	m_error	Bad JMP reg
	endc	
	endm


mljmp	macro
Error	=	12
	ifne	(\1>-1)&(\1<14)
	db	$3d,\1+$90
Error	=	0
	endc
	ifne	Error
	m_error	Bad LJMP reg
	endc	
	endm

mlob	macro
	db	$9e
	endm



mfmult	macro
	db	$9f
	endm

mlmult	macro
	db	$3d,$9f
	endm



	

mlms	macro
Error	=	13
	ifne	\1<16
	db	$3d,\1+$a0
	db	(\2/2)&$ff
Error	=	0
	endc
	ifne	Error
	m_error	Bad LMS reg
	endc
	endm


msms	macro
Error	=	13
	ifne	\2<16
	db	$3e,\2+$a0
	db	(\1/2)&$ff
Error	=	0
	endc
	ifne	Error
	m_error	Bad SMS reg
	endc
	endm


mfrom	macro
Error	=	14
	ifne	(\1>-1)&(\1<16)
	db	\1+$b0
Error	=	0
	endc
	ifne	Error
	?Error
	endc	
	endm


mmoves	macro
error	=	2
	ifne	((\1>-1)&(\1<16))|((\2>-1)&(\2<16))
	db	$20+\1,$b0+\2
error	=	0
	endc
	ifne	Error
	m_error	Bar MOVES reg
	endc
	endm



mhib	macro
	db	$c0
	endm


mor	macro
Error	=	10
	ifne	(\1>0)&(\1<16)
	db	\1+$c0
Error	=	0
	endc
	ifne	Error
	m_error	Bad OR reg
	endc	
	endm


mxor	macro
Error	=	11
	ifne	(\1>0)&(\1<16)
	db	$3d,\1+$c0
Error	=	0
	endc
	ifne	Error
	m_error	Bad XOR reg
	endc	
	endm




mxorn	macro
Error	=	11
	ifne	(\1>0)&(\1<16)
	db	$3f,\1+$c0
Error	=	0
	endc
	ifne	Error
	m_error	Bad XORn val
	endc	
	endm



minc	macro
Error	=	17
	ifne	\1<15
	db	\1+$d0
Error	=	0
	endc
	ifne	Error
	m_error	Bad INC reg
	endc
	endm

mgetc	macro
	db	$df
	endm


mramb	macro
	db	$3e,$df
	endm


mromb	macro
	db	$3f,$df
	endm


mdec	macro
Error	=	18
	ifne	\1<15
	db	\1+$e0
Error	=	0
	endc
	ifne	Error
	?Error
	endc
	endm


mgetb	macro
	db	$EF
	endm

mgetbh	macro
	db	$3D,$EF
	endm


mgetbl	macro
	db	$3E,$EF
	endm

mgetbs	macro
	db	$3F,$EF
	endm



miwt	macro
Error	=	13
	ifne	\1<16
	db	\1+$f0
	dw	(\2)&$ffff
Error	=	0
	endc
	ifne	Error
	m_error	Bad IWT reg
	endc
	endm
	

mlm	macro
Error	=	13
	ifne	\1<16
	db	$3d,\1+$f0
	dw	(\2)&$ffff
Error	=	0
	endc
	ifne	Error
	m_error	Bad LM reg
	endc
	endm


msm	macro
Error	=	13
	ifne	\2<16
	db	$3e,\2+$f0
	dw	(\1)&$ffff
Error	=	0
	endc
	ifne	Error
	m_error	Bad SM reg
	endc
	endm

	endc





