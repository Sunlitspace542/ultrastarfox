@echo off
setlocal
loadbtm on

IFF %# == 0 THEN
  echo GET host file [destination directory]
  echo     If destination directory isn't specified then the file is copied
  echo     into the current directory.
  goto endend
ENDIFF

rem change directory to NCFTP dir (C:\ncftp)

set olddisk=%_DISK
set oldcd=%_CWD
c:
set oldcd2=%_CWD

iff not exist c:\ncftp\netrc then
  iff not exist c:\bin\netrc then
    echo Configuration file 'netrc' should be in C:\BIN
    goto end
  endiff
  md >NUL: c:\ncftp
  copy >NUL: c:\bin\netrc c:\ncftp
endiff

cd \ncftp

rem grab the file

set temp=%2
gosub bs
ncftp>error.log %1:%temp
if not exist %@name[%2].%@ext[%2] goto err

rem now to move it to where the user wants it

%olddisk:
cd %oldcd
if "%_CWD" NE "C:\NCFTP" move>nul: c:\NCFTP\%@name[%2].%@ext[%2] %3
echo %1:[%2] copied successfully.
goto end

rem Error not responding

:err
echo File [%2] doesn't exist at %1, or %1 not responding.
goto end

:bs

if %@index[%temp,\] EQ -1 return
set temp=%@substr[%temp,0,%@index[%temp,\]]/%@substr[%temp,%@eval[%@index[%temp,\]+1]]
goto bs

rem Restore all the drives and paths

:end
c:
cd %oldcd2
%olddisk:
cd %oldcd
:endend

