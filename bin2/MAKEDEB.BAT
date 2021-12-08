@echo off
touch *.asm *.mc
echo>%sasmdir%symson.mak SYMSON=-x$*.SYM
make sg.rom
echo>%sasmdir%symson.mak SYMSON=
copy /b bank0.sym bank1.sym bank2.sym bank4.sym bank5.sym bank6.sym tmp.sym
copy /b bank7.sym bank8.sym bank9.sym bank10.sym bank11.sym shbanks.sym incbins.sym tmp.sym sg.sym
lha a -o sym sg.sym
lha a -o bin sg.rom

