
level1_2									;LEVEL HEADER
	initlevel	1_2,mstarwipe_circle		;Load level data from 1_2 in bgs.asm

	mapjsr	map1_2							;jump to MAP1_2.ASM

	IFEQ	CONTEST							;if contest = 0 (which it always will)

	mapjsr	cl_warp							;jump to cl_warp.asm (Warp Out Clear Fanfare)
	mapend	4								;End the map

	ELSEIF									;otherwise blah blah we dont need the rest of this

	mapjsr	cl_turn
	mapend

	ENDC									;end if statement


