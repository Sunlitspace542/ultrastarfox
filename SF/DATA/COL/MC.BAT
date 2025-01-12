inccol %1.col %2 %3
@copy /b allcols.col col2.tmp > nul
@copy /b col2.tmp+col.tmp allcols.col > nul