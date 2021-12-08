
	INCPUBLICS	maps\maplist.ext

incmap	MACRO
	incfile	maps\\\1.asm
	ENDM

	mapdef	mapp	; player's map address

courses
	coursedef	course2
	coursedef	course1
	coursedef	course3
	coursedef	course4
	coursedef	course5
	coursedef	course6
	coursedef	course7

course7
	mapdef	level7_1
	mapdef	level7_2
	mapdef	level7_3
	mapdef	level7_4
	mapdef	level7_5

course6
	mapdef	level6_1
	mapdef	level6_2
	mapdef	level6_3
	mapdef	level6_4
	mapdef	level6_5
	mapdef	level6_6

course5
	mapdef	level5_1
	mapdef	level5_2
	mapdef	level5_3
	mapdef	level5_4
	mapdef	level5_5

course4
	mapdef	level4_1
	mapdef	level4_2
	mapdef	level4_3
	mapdef	level4_4
	mapdef	level4_5
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
course1
	mapdef	level1_1
	mapdef	level1_2
	mapdef	level1_3
	mapdef	level1_4
	mapdef	level1_5
	mapdef	level1_6
	INCMAP	map1_4
	INCMAP	map4_3
	INCMAP	bossbgm1
	INCMAP	bossbgm2
	INCMAP	bossbgm3
	INCMAP	map1_6a
	INCMAP	map1_6b

	INCMAP	map2_6a
;	INCMAP	map2_6b
;	INCMAP	map2_6c
;	INCMAP	map2_6d

	INCMAP	map4_1
	INCMAP	map4_2

	INCMAP	map4_4
	INCMAP	map4_5

	;printroulen	armsstart,<armsmap>



	INCMAP	MOTHERS

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
