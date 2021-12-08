cls
set path=%path%;C:\bin
set sasmheap=14400
cd sf
make sg.rom
cd ..
copy sf\sg.rom SF.SFC
del sf\sg.rom
del sf\*.sob
pause
exit
