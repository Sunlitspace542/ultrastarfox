cls
set path=%path%;c:\bin
set sasmheap=14400
cd sf
@echo off
echo Cleaning...
make clean
cd ..
del sf.SFC
del symbols.txt
pause
exit
