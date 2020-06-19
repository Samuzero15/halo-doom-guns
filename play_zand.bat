@echo off

REM This compiles, quick-packs and plays the Zandronum version for the project 
REM vv -- Modify this before you run this bat! -- vv
set portPath=C:\Users\Samuzero15\Desktop\Cosas para doom\Programas para test\Zandro
REM ^^ -- Modify this before you run this bat! -- ^^

set portExe=zandronum.exe
set fileoutput="HaloGuns_Dev.pk3"

cd %~dp0
set PATH=%PATH%;%~dp0\Tools;%portpath%
set folder=%~dp0\Zandronum
cls

cd "%folder%"

call acs_comp "%folder%" 

cd "%folder%"

call 7za a -y -tzip -mx=0 -mmt -x!.svn ..\%fileoutput% ".\"


cd %~dp0

%portexe% -noautoload -iwad Doom2.wad -file %fileoutput%

REM After that, delete it.
del %fileoutput%