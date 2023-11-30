;########################################
;# MEDIA STREAMING UNIT (MSU) REGISTERS #
;########################################

msu_status	equ	$2000
msu_read	equ	$2001
msu_id		equ	$2002
msu_seek	equ	$2000
msu_track	equ	$2004
msu_volume	equ	$2006
msu_control	equ	$2007

; #################
; # MSU CONSTANTS #
; #################
; MSU_CONTROL register ($2007)
audiostate_none		equ	#$00
audiostate_norepeat	equ	#$01
audiostate_repeat	equ	#$03

; EOF