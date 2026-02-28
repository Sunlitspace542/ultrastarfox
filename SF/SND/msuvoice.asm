; Asar 1.91
norom

org $0000

; patch sound effects $60,$7B for MSU-1 voice stuff
; assemble with
; asar --no-title-check msuvoice.asm msuvoice.bin

; ===========================================
!BASE_ADDR = $1D85	; location of sound $60 pattern table in ARAM
dw patch_data_end-patch_data_start			; calculate size in bytes
dw !BASE_ADDR								; spc destination

patch_data_start:

se_foxradiochat: ; Fox radio chat
	db $E0, $0F, $12, $14, $BE, $06, $00, $BE
	db $E0, $15, $18, $7D, $98, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00

patch_data_end:
; ===========================================

; ===========================================
!BASE_ADDR = $18DD	; location of sound $7B pattern table in ARAM
dw patch2_data_end-patch2_data_start		; calculate size in bytes
dw !BASE_ADDR								; spc destination

patch2_data_start:

se_falcoradiochatdown: ; Falco radio chat down
	db $E0, $0F, $06, $14, $C0, $04, $00, $C0
	db $12, $14, $C0, $06, $00, $C0, $06, $14
	db $C0, $04, $00, $C0, $12, $14, $C0, $06
	db $00, $C0, $E0, $15, $18, $7D, $98, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00

patch2_data_end:
; ===========================================


; ============================
; end of data, start execution
; ============================
dw $0000
dw $0400									; start execution here