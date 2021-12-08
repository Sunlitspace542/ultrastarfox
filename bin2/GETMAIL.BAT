@echo off
loadbtm on
setlocal
c:
cd \ameol
del>&NUL: %user\data\outbaskt.*
echo Receiving.
echo>grabfile.cmd cd d:
echo>>grabfile.cmd cd \ameol
echo>>grabfile.cmd binary
echo>>grabfile.cmd mget *.log
echo>>grabfile.cmd mget *.lst
echo>>grabfile.cmd lcd %user/archive
echo>>grabfile.cmd cd %user/archive
echo>>grabfile.cmd mget *.001
echo>>grabfile.cmd lcd ../script
echo>>grabfile.cmd cd ../script
echo>>grabfile.cmd mget *.*
echo>>grabfile.cmd lcd ../data
echo>>grabfile.cmd cd ../data
echo>>grabfile.cmd mget outbaskt.*
echo>>grabfile.cmd mget *.rsm
echo>>grabfile.cmd mget *.lst
echo>>grabfile.cmd mget *.fls
echo>>grabfile.cmd mget *.scr
echo>>grabfile.cmd lcd ../info
echo>>grabfile.cmd cd ../info
echo>>grabfile.cmd mget *.*
echo>>grabfile.cmd lcd /ameol
echo>>grabfile.cmd cd /ameol
echo>>grabfile.cmd get finished.tmp
echo>>grabfile.cmd quit
echo>netrc machine modem
echo>>netrc 	login modem
echo>>netrc 	password
echo>>netrc 	macdef
echo>>netrc 	progress-reports "0"

if exist finished.tmp del>NUL: finished.tmp
REM *** del>&NUL: /Y %user\data
REM *** del>&NUL: /Y %user\script
ncftp >& ncftp.err -r -d 5 modem <grabfile.cmd

cd \ameol
iff not exist finished.tmp THEN
  xsend -d %user:0 "FTP of AMEOL messages failed.  Check AMEOL\ncftp.err at %user:0, then RUN GETMAIL"
  goto end
endiff

del>NUL: grabfile.cmd
del>NUL: netrc

xsend -d %user:0 "AMEOL Messages successfully received. Run Windows/AMEOL and select IMPORT *.001 to read."
:end
exit
