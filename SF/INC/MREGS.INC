; ###################################
; # MARIO Chip (Super FX) Registers #
; ###################################

; MARIO chip registers 0-15
regs		equ	$3000
mr0			equ	$3000
mr1			equ	$3002
mr2			equ	$3004
mr3			equ	$3006
mr4			equ	$3008
mr5			equ	$300a
mr6			equ	$300c
mr7			equ	$300e
mr8			equ	$3010
mr9			equ	$3012
mr10		equ	$3014
mr11		equ	$3016
mr12		equ	$3018
mr13		equ	$301a
mr14		equ	$301c
mr15		equ	$301e

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
m_vcr		equ	$303B ; Version Code Register (R) - Reports $52 if Super FX 3
m_rambr		equ	$303C ; RAM Bank Register (R)
m_un3d		equ	$303D ; Unused
m_cbr		equ	$303E ; Cache Base Register (R)

; MARIO chip Config Register (CFGR, $3037) bits
cfgr_noirq	equ	%10000000	; IRQs DISABLED
cfgr_ms1		equ	%00100000	; HighSpeed Multiply ON (MS1)