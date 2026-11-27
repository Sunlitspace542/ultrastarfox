	alc	reg0l,1			; Work registers
	alc	reg0h,1
	alc	mouse_sp_set1,1	; Mouse Speed Setting 0=slow, 1=medium, 2=fast, $80=error (joy2)
	alc	mouse_con1,1	; Mouse connection port D0=4017
	alc	mouse_y1,1		; Mouse Y-direction  (joy2)
	alc	mouse_x1,1		; Mouse X-direction  (joy2)
	alc	mouse_sp1,1		; Mouse speed 00=slow 01=mid 10=fast (joy2)
	alc	mouse_sw1,1		; Mouse button pressed d0=left d1=right (joy2)
	alc	mouse_swt1,1	; Mouse button trigger (joy2)
	alc	mouse_sb1,1		; Previous switch status (joy2)
	alc	connect_st1,1	; Connection-start confirmation
