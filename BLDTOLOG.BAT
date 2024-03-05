cls
set path=%path%;c:\bin
cd sf
make NOANSI=-sNOANSI > ..\build.log
cd ..
pause
exit
