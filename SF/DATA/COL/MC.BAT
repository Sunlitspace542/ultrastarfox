@..\bin\inccol.exe DATA\COL\%1.COL %2 %3

@move col.tmp DATA\COL\col.tmp

@copy /b DATA\COL\allcols.col DATA\COL\col2.tmp

@copy /b DATA\COL\col2.tmp+DATA\COL\col.tmp DATA\COL\allcols.col