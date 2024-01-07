cls
set path=%path%;c:\bin
set sasmheap=14400
cd sf
make NOANSI=-sNOANSI > ..\build.log
cd ..
pause
exit
