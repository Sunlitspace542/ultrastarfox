@echo off
echo Crunching palettes...
@del col.tmp
@del col2.tmp
@del allcols.col
@copy NUL allcols.col
@call mc bg2-a.col 0 7
@call mc bg2-b.col 0 13
@call mc bg2-c.col 0 7
@call mc bg2-d.col 0 7
@call mc bg2-e.col 0 9
@call mc bg2-f.col 0 7
@call mc bg2-g.col 0 7
@call mc t-m.col 0 7
@call mc t-m-2.col 0 7
@call mc t-m-3.col 0 7
@call mc t-m-4.col 0 7
@call mc b-m.col 0 7
@call mc light.col 0 7
@call mc space.col 0 7
@call mc stars.col 0 7
@call mc cp.col 0 7
@call mc cp-us.col 0 7
@call mc cp-usp.col 0 7
@call mc cp-g.col 0 7
@call mc hole.col 0 7
@call mc l.col 0 7
@call mc e-test0.col 0 7
@call mc e-test.col 0 7
@call mc obj-1.col 8 13
@call mc contest.col 0 7
@call mc 2ep.col 0 9
cru allcols.col allcols.pac
echo Palette crunching Complete.