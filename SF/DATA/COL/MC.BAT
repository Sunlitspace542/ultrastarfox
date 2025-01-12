@..\win_bin\inccol.exe DATA\COL\%1.COL %2 %3
@copy /b DATA\COL\allcols.col DATA\COL\col2.tmp > nul
@copy /b DATA\COL\col2.tmp+DATA\COL\col.tmp DATA\COL\allcols.col > nul