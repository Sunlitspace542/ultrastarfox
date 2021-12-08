@echo off
loadbtm on

:again

if "%1" == "" goto end
echo **-- Mapping %1's drives --**
gosub %1
shift
goto again

:jishin
rmtdrive -h jishin -l jishin -d q: -r c:
rmtdrive -h jishin -l jishin -d r: -r d:
return

:kawaguchi
rmtdrive -h kawaguchi -l kawaguchi -d k: -r c:
rmtdrive -h kawaguchi -l kawaguchi -d l: -r d:
return

:modem
rmtdrive -h takoyaki -l takoyaki -d m: -r c:
rmtdrive -h takoyaki -l takoyaki -d n: -r i:
return

:takoyaki
rmtdrive -h takoyaki.demon.co.uk -l takoyaki -d m: -r c:
rmtdrive -h takoyaki.demon.co.uk -l takoyaki -d n: -r i:
return

:spam
rmtdrive -h spam -l spam -d s: -r c:
return

:pentium
rmtdrive -h pentium -l pentium -d p: -r c:
return

:kawagoe
rmtdrive -h kawagoe -l kawagoe -d t: -r c:
rmtdrive -h kawagoe -l kawagoe -d u: -r d:
return

:yamada
rmtdrive -h yamada -l yamada -d y: -r c:
return

:eguchi
rmtdrive -h sonic -l sonic -d g: -r c:
return

:backup
rmtdrive -h spam -l spam -d f: -r d:
return

:end
