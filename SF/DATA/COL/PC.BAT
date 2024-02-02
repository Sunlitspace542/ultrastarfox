@echo off
echo Crunching palettes...
@del col.tmp
@del col2.tmp
@del allcols.col
@copy NUL allcols.col
rem syntax: @call mc (file prefix) (start) (end)
@call mc bg2-a 0 7
@call mc bg2-b 0 13
@call mc bg2-c 0 7
@call mc bg2-d 0 7
@call mc bg2-e 0 9
@call mc bg2-f 0 7
@call mc bg2-g 0 7
@call mc t-m 0 7
@call mc t-m-2 0 7
@call mc t-m-3 0 7
@call mc t-m-4 0 7
@call mc b-m 0 7
@call mc light 0 7
@call mc space 0 7
@call mc stars 0 7
@call mc cp 0 7
@call mc cp-us 0 7
@call mc cp-usp 0 7
@call mc cp-g 0 7
@call mc hole 0 7
@call mc l 0 7
@call mc e-test0 0 7
@call mc e-test 0 7
@call mc obj-1 8 13
@call mc 2ep 0 9
rem add new palettes before this line
rem the order of this file must match INC\KALCS.INC!
cru allcols.col allcols.pac
echo Palette crunching Complete.