@echo off

REM This compiles and packs the Zandronum version.
REM Perfect to make standalone files.

set devPath=C:\Users\Samuzero15\Desktop\Cosas para doom\Samu Projects\Halo Guns
set portPath=C:\Users\Samuzero15\Desktop\Cosas para doom\Programas para test\Zandro
set portExe=zandronum.exe
set fileoutput="HaloGuns_Zand.pk3"

cd %devPath%
set PATH=%PATH%;%~dp0\Tools
set WorkingCopyPath=%~dp0
set folder=%devPath%\Zandronum
cls

cd "%folder%"

call acs_comp "%folder%" 

cd "%folder%"

call 7za a -y -tzip -mx=9 -mmt -x!.svn ..\%fileoutput% "%folder%"
