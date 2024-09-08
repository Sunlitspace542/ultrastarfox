;########################################
;# MEDIA STREAMING UNIT (MSU) REGISTERS #
;########################################
; based on docs from
; https://helmet.kafuka.org/msu1.htm

; The MSU1 registers range from 
; $2000 to $2007. Their functions
; are different between reading and 
; writing.

; READING
msu_status	equ	$2000 ; Status port
msu_read	equ	$2001 ; Data read port
msu_id		equ	$2002 ; Identification bytes
msu_id2     equ $2003 ; contains ASCII string "S-MSU1"
msu_id3     equ $2004
msu_id4     equ $2005
msu_id5     equ $2006
msu_id6     equ $2007

; WRITING
msu_seek	equ	$2000 ; Data seek port
msu_seek2	equ	$2001
msu_seek3	equ	$2002
msu_seek4	equ	$2003
msu_track	equ	$2004 ; Current audio track
msu_track2	equ	$2005
msu_volume	equ	$2006 ; track volume from 0 - 255 ($FF)
msu_control	equ	$2007 ; stop/play/repeat track

; #################
; # MSU CONSTANTS #
; #################

; ## MSU_STATUS register ($2000) ##
status_databusy         equ 10000000b ; 128
status_audiobusy        equ 01000000b ; 64
status_audiorepeat      equ 00100000b ; 32
status_audioplaying     equ 00010000b ; 16
status_trackmissing     equ 00001000b ; 8
; Chip revision, will always be 1
status_revision1        equ 00000100b ; 4
status_revision2        equ 00000010b ; 2
status_revision3        equ 00000001b ; 1

; ## MSU_CONTROL register ($2007) ##
; Bit 0: Play track flag
; Bit 1: Repeat track flag
; Bits 2 - 7: unused
audiostate_none		equ	00000000b ; 0
audiostate_norepeat	equ	00000001b ; 1
audiostate_repeat	equ	00000011b ; 3
audiostate_pause	equ	00000100b ; 4

; EOF