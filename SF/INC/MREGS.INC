; ###################################
; # MARIO Chip (Super FX) Registers #
; ###################################

	IFEQ	SUPERFX3
; MARIO chip registers 0-15
regs		equ	$3000
mr0			equ	$3000 ; Default source/destination register
mr1			equ	$3002 ; Pixel plot X position register
mr2			equ	$3004 ; Pixel plot Y position register
mr3			equ	$3006
mr4			equ	$3008 ; Lower 16 bit result of LMULT
mr5			equ	$300a
mr6			equ	$300c ; Multiplier for FMULT and LMULT
mr7			equ	$300e ; Fixed point texel X position for MERGE
mr8			equ	$3010 ; Fixed point texel Y position for MERGE
mr9			equ	$3012
mr10		equ	$3014
mr11		equ	$3016 ; Return address set by LINK
mr12		equ	$3018 ; Loop counter
mr13		equ	$301a ; Loop point address
mr14		equ	$301c ; ROM address for GETB, GETBH, GETBL, GETBS
mr15		equ	$301e ; Program counter

; MARIO chip control registers
m_sfr		equ	$3030 ; Status Flag Register (R/W)
m_un32		equ	$3032 ; Unused
m_bramr		equ	$3033 ; Backup RAM register (W)
m_pbr		equ	$3034 ; Program Bank Register (R/W)
m_un35		equ	$3035 ; Unused
m_rombr		equ	$3036 ; ROM Bank Register (R)
m_cfgr		equ	$3037 ; Control Flags Register (W)
m_scbr		equ	$3038 ; Screen Base Register (W)
m_clsr		equ	$3039 ; Clock Speed Register (W)
m_scmr		equ	$303A ; Screen Mode Register (W)
m_vcr		equ	$303B ; Version Code Register (R)
m_rambr		equ	$303C ; RAM Bank Register (R)
m_un3d		equ	$303D ; Unused
m_cbr		equ	$303E ; Cache Base Register (R)

; MARIO chip Config Register (CFGR, $3037) bits
cfgr_noirq	equ	%10000000	; IRQs DISABLED
cfgr_ms1		equ	%00100000	; HighSpeed Multiply ON (MS1)
	ELSEIF
; Super FX 3 registers 0-15
regs		equ	$3000
mr0			equ	$3000 ; Default source/destination register
mr1			equ	$3002 ; Pixel plot X position register
mr2			equ	$3004 ; Pixel plot Y position register
mr3			equ	$3006
mr4			equ	$3008 ; Lower 16 bit result of LMULT
mr5			equ	$300a
mr6			equ	$300c ; Multiplier for FMULT and LMULT
mr7			equ	$300e ; Fixed point texel X position for MERGE
mr8			equ	$3010 ; Fixed point texel Y position for MERGE
mr9			equ	$3012
mr10		equ	$3014
mr11		equ	$3016 ; Return address set by LINK
mr12		equ	$3018 ; Loop counter
mr13		equ	$301a ; Loop point address
mr14		equ	$301c ; ROM address for GETB, GETBH, GETBL, GETBS
mr15		equ	$701e ; Program counter - set to 0 when a STOP command is hit

; Super FX 3 control registers
m_sfr		equ	$7030 ; Status Flag Register (R/W)
m_un32		equ	$7032 ; Unused
m_bramr		equ	$7033 ; Backup RAM register (W)
m_pbr		equ	$7034 ; Program Bank Register (R/W)
m_un35		equ	$7035 ; Unused
m_rombr		equ	$7036 ; ROM Bank Register (R)
m_cfgr		equ	$7037 ; Control Flags Register (W)
m_scbr		equ	$7038 ; Screen Base Register (W)
m_clsr		equ	$7039 ; Clock Speed Register (W)
m_scmr		equ	$703A ; Screen Mode Register (W)
m_vcr		equ	$703B ; Version Code Register (R) - Reports $52 if Super FX 3
m_rambr		equ	$703C ; RAM Bank Register (R)
m_un3d		equ	$703D ; Unused
m_cbr		equ	$703E ; Cache Base Register (R)

; Super FX 3 Config Register (CFGR, $7037) bits
cfgr_noirq	equ	%00000000	; No IRQs on GSU3
cfgr_ms1		equ	%00100000	; HighSpeed Multiply ON (MS1)
	ENDC