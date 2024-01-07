	INCMAP	MAPP

	INCMAP	map2_1b
	INCMAP	map1_1b
	INCMAP	map2_2
	INCMAP	map1_2


	INCMAP	map1_3a
	INCMAP	map1_3b
	INCMAP	map1_3a1
	INCMAP	map1_3b1
	INCMAP	map1_3a2
	INCMAP	map1_3b2
	INCMAP	map1_3c
	INCMAP	map1_3d
	INCMAP	map1_4
	INCMAP	map1_6a
	INCMAP	map1_6b
	INCMAP	map1_6c
	INCMAP	map1_6d


	INCMAP	map2_1a


	INCMAP	map3_7d




mexitstart
	INCMAP	mexitmap
	IFNE	prntrouln_on
	printroulen	mexitstart,<mexitmap>
	ENDC
lexitstart
	INCMAP	lexitmap
	IFNE	prntrouln_on
	printroulen	lexitstart,<lexitmap>
	ENDC

	INCMAP	cl_gnd

	INCMAP	level1_1


	INCMAP	level1_2
	INCMAP	level1_3
	INCMAP	level1_4
	INCMAP	level1_5
	INCMAP	level1_6

	INCMAP	level2_1
	INCMAP	level2_2
	INCMAP	level2_3
	INCMAP	level2_4
	INCMAP	level2_5
	INCMAP	level2_6

	INCMAP	level3_1
	INCMAP	level3_2
	INCMAP	level3_3
	INCMAP	level3_4
	INCMAP	level3_5
	INCMAP	level3_6
	INCMAP	level3_7

	INCMAP	cl_turn
	INCMAP	cl_bridg
	INCMAP	cl_warpo

	INCMAP	level_bh
	INCMAP	level_s
	INCMAP	special
	INCMAP	bhole

	incmap	training

creditsmap	incmap	credits

intromap	incmap	intro

titlemap	incmap	title


