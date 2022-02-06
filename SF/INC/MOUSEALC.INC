;****************************************************************
;*																*
;*		MOUSEALC.INC											*
;*		Super NES Mouse System file								*
;*		March 10, 1992        									*
;*		Modified by Kandowontu for ultrastarfox					*
;*		(c) 1992 Nintendo of America Inc.						*
;*		2022 Kandowontu											*
;*																*
;****************************************************************
;===================================================================
;               BG Space for character code
space	equ	$005c
;
;===================================================================
;		RAM Definitions
;
;********  Index Register Area  ********
;
reg0
	alc	reg0l,1
	alc	reg0h,1

reg1
	alc	reg1l,1
	alc	reg1h,1

;
;	................
;
;
;********  SYS Subroutine Work Area  ********
;
;

mouse_sp_set
	alc	mouse_sp_set0,1	; Register to set mouse speed       
	alc	mouse_sp_set1,1	; Register to set mouse speed       

mouse_con
	alc	mouse_con0,1	; Mouse connection port d0 = 4016
	alc	mouse_con1,1	; Mouse connection port d0 = 4017

mouse_y
	alc	mouse_y0,1	; Mouse Y-direction value (joy1)
	alc	mouse_y1,1	; Mouse Y-direction value (joy2)

mouse_x
	alc	mouse_x0,1	; Mouse X-direction value (joy1)
	alc	mouse_x1,1	; Mouse X-direction value (joy2)

mouse_sp
	alc	mouse_sp0,1	; Mouse speed 00=slow 01=mid 10=fast (joy1)
	alc	mouse_sp1,1	; Mouse speed 00=slow 01=mid 10=fast (joy2)

mouse_sw
	alc	mouse_sw0,1	; Mouse button d0=left d1=right (joy1)
	alc	mouse_sw1,1	; Mouse button d0=left d1=right (joy2)

mouse_swt
	alc	mouse_swt0,1	; Mouse button trigger
	alc	mouse_swt1,1	; Mouse button trigger

mouse_sb			; Previous switch status 
	alc	mouse_sb0,1
	alc	mouse_sb1,1

	alc	connect_st0,1	; Mouse connection change flag
	alc	connect_st1,1	
