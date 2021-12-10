	IFEQ	cesdemo-1
	INCMAP	cmap1_1b
	INCMAP	cmap2_1b
	INCMAP	cmap1_2
	INCMAP	cmap2_2
	fileslog maps\emap1_2.asm
	fileslog maps\e1-1.asm
	fileslog maps\map1_1b.asm
	fileslog maps\map2_1b.asm
	fileslog maps\map1_2.asm
	fileslog maps\map2_2.asm
	ELSEIF
	INCMAP	map2_1b
	INCMAP	map1_1b
	INCMAP	map2_2
	IFEQ	CONTEST
	INCMAP	map1_2
	fileslog	maps\emap1_2.asm
	ELSEIF
	INCMAP	emap1_2
	fileslog	maps\map1_2.asm
	ENDC
	fileslog maps\cmap1_1b.asm
	fileslog maps\cmap2_1b.asm
	fileslog maps\cmap1_2.asm
	fileslog maps\cmap2_2.asm
	ENDC


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
	printroulen	mexitstart,<mexitmap>
lexitstart
	INCMAP	lexitmap
	printroulen	lexitstart,<lexitmap>

	INCMAP	cl_gnd

	IFEQ	cesdemo-1
	INCMAP	clevel1_1
	fileslog	maps\eleve1_1.asm
	fileslog	maps\level1_1.asm
	ELSEIF
	IFEQ	CONTEST
	INCMAP	level1_1
	fileslog	maps\eleve1_1.asm
	fileslog	maps\clevel1_1.asm
	ELSEIF
	INCMAP	eleve1_1
	fileslog	maps\level1_1.asm
	fileslog	maps\clevel1_1.asm
	ENDC
	ENDC


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

	INCMAP	bhole

	incmap	training

creditsmap	incmap	credits

intromap	incmap	intro

titlemap	incmap	title


