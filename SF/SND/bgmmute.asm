; Asar 1.91
norom

org $0000

; patch sound driver to mute BGM for MSU-1
; assemble with
; asar --no-title-check bgmmute.asm bgmmute.bin

; ===========================================
!BASE_ADDR = $08A3	; location of instruction to patch in ARAM
dw patch_data_end-patch_data_start			; calculate size in bytes
dw !BASE_ADDR								; spc destination

patch_data_start:

; context of the driver code we're patching:
; tx17:
; 	push	a
; 	mov.b	a,!keyd
; 	and.b	a,!fkin
; 	pop	a
; 	bne	tx18 ; <- this instruction will become a BRA instead
; 	call	dss

	db	$2F

patch_data_end:
; ===========================================

; ============================
; end of data, start execution
; ============================
dw $0000
dw $0400									; start execution here