sasmx -e__NOTITLE -e_COL -e_STRT=%2 -e_END=%3 -d1,"%1" make.asm
@copy /b allcols.col col2.tmp
@copy /b col2.tmp+col.tmp allcols.col

