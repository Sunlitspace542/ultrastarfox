; Asar 1.91
norom

org $0000

; ===========================================
; patch sound effect $60 for MSU-1 voice stuff
; assemble with
; asar --no-title-check msuvoice.asm msuvoice.bin
!BASE_ADDR = $1D85	; location of sound $60 pattern table in ARAM
dw patch_data_end-patch_data_start		; calculate size in bytes
dw !BASE_ADDR								; spc destination


patch_data_start:

se_foxradiochat: ; Fox radio chat
	db $E0, $0F, $12, $14, $BE, $06, $00, $BE
	db $E0, $15, $18, $7D, $98, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00

patch_data_end:
; ===========================================

; ============================
; end of data, start execution
; ============================
dw $0000
dw $0400									; start execution here