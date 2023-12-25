
	INCPUBLICS	EXT\maplist.ext

incmap	MACRO
	incfile	maps\\\1.asm
	ENDM

	mapdef	mapp	; player's map address

courses
	coursedef	course2
	coursedef	course1
	coursedef	course3

course3
	mapdef	level3_1
	mapdef	level3_2
	mapdef	level3_3
	mapdef	level3_4
	mapdef	level3_5
	mapdef	level3_6
	mapdef	level3_7
course2
	mapdef	level2_1
	mapdef	level2_2
	mapdef	level2_3
	mapdef	level2_4
	mapdef	level2_5
	mapdef	level2_6

course1	mapdef	level1_1
	mapdef	level1_2
	mapdef	level1_3
	mapdef	level1_4
	mapdef	level1_5
	mapdef	level1_6



	INCMAP	map2_3a
	INCMAP	map2_3b
	INCMAP	map2_3c
	INCMAP	map2_4
	INCMAP	map2_5


armsstart
	INCMAP	armsmap
	IFNE	prntrouln_on
	printroulen	armsstart,<armsmap>
	ENDC


	INCMAP	map3_1a
	INCMAP	map3_3a
	INCMAP	map3_3b
	INCMAP	map3_4a
	INCMAP	map3_4b
	INCMAP	map3_4c
	INCMAP	map3_5
	INCMAP	map3_6
	INCMAP	map3_7b
	INCMAP	map3_7c

	INCMAP	map3_7a
	INCMAP	MOTHERS

	INCMAP	cl_warp
	INCMAP	cl_ship
	INCMAP	cl_earth
	INCMAP	cl_chase
	INCMAP	cl_under
	INCMAP	cl_dive


	INCMAP	map1_5


	IFEQ	cesdemo-1
	INCMAP	cmap3_1b
	INCMAP	cmap3_2
	fileslog	maps\map3_1b.asm
	fileslog	maps\map3_2.asm
	ELSEIF
	INCMAP	map3_1b
	INCMAP	map3_2
	fileslog	maps\cmap3_1b.asm
	fileslog	maps\cmap3_2.asm
	ENDC



maps	=	*-mapbase
	?maps



