@echo off

REM This compiles, quick-packs and plays the Zandronum version for the project 
REM vv -- Modify this before you run this bat! -- vv
set portPath=C:\Users\Samuzero15\Desktop\Cosas para doom\Programas para test\LZDoom_3.83a_x86
REM ^^ -- Modify this before you run this bat! -- ^^

set portExe=lzdoom.exe
set fileoutput="HaloGuns_Dev.pk3"

cd %~dp0
set PATH=%PATH%;%~dp0\Tools;%portPath%
set folder=%~dp0\GZDoom
cls

cd "%folder%"

call acs_comp "%folder%" 

cd "%folder%"

call 7za a -y -tzip -mx=0 -mmt -x!.svn ..\%fileoutput% ".\"

cd %~dp0

%portexe% -noautoload -iwad Doom2.wad -file %fileoutput%

REM After that, delete it.
del %fileoutput%

