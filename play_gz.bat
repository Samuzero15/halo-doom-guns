@echo off

REM This compiles, quick-packs and plays the Zandronum version for the project 
set devPath=C:\Users\Samuzero15\Desktop\Cosas para doom\Samu Projects\Halo Guns
set portPath=C:\Users\Samuzero15\Desktop\Cosas para doom\Programas para test\LZDoom_3.83a_x86
set portExe=lzdoom.exe
set fileoutput="HaloGuns_Dev.pk3"

cd %devPath%
set PATH=%PATH%;%~dp0\Tools
set WorkingCopyPath=%~dp0
set folder=%devPath%\GZDoom
cls

cd "%folder%"

call acs_comp "%folder%" 

cd "%folder%"

call 7za a -y -tzip -mx=0 -mmt -x!.svn ..\%fileoutput% "%folder%"

rem cd "C:\Users\Samuzero15\Desktop\Cosas para doom\Samu Projects\Halo Guns\Zandronum"

cd %portpath%

move "%devPath%\%fileoutput%" "%portpath%"

%portexe% -file %fileoutput% -noautoload

REM After that, delete it.
del %fileoutput%