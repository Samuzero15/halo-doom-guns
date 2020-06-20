@echo off

REM This compiles, quick-packs and plays the Zandronum version for the project 
REM vv -- Modify this before you run this bat! -- vv
set "GZ_portPath=C:\Users\Samuzero15\Desktop\Cosas para doom\Programas para test\LZDoom_3.83a_x86"
set "Zan_portPath=C:\Users\Samuzero15\Desktop\Cosas para doom\Programas para test\Zandro"
REM ^^ -- Modify this before you run this bat! -- ^^

echo Halo Guns Play Bat!
echo 1) Play with Zandronum
echo 2) Play with LZDoom/GZDoom
CHOICE /C 12 /N /M "Which port? (Number Keys):"
IF ERRORLEVEL 2 goto use_gzdoom
IF ERRORLEVEL 1 goto use_zandro

pause

:use_zandro
REM ECHO Going to zandro
set "portPath=%Zan_portPath%"
set portExe=zandronum.exe
set folder=%~dp0Zandronum

goto compile


:use_gzdoom
REM ECHO Going to lzdoom

set "portPath=%GZ_portPath%"
set portExe=lzdoom.exe
set folder=%~dp0GZDoom

goto compile


:compile

ECHO The game will run in %portExe%
ECHO Executable path %portPath%
ECHO Folder: %folder%
pause

cd %~dp0
set "fileoutput=HaloGuns_Dev.pk3"
set PATH=%PATH%;%~dp0\Tools;%portPath%
cls

cd "%folder%"

call acs_comp "%folder%" 

cd "%folder%"

call 7za a -y -tzip -mx=0 -mmt -x!.svn ..\%fileoutput% ".\"

cd %~dp0
cls
echo Compilation done. Close the game when you're done.
echo After you close the game, %fileoutput% will be deleted.
echo Alternatively, you can close the console, and check %fileoutput% through slade.
echo Just in case you're curious.
%portexe% -noautoload -iwad Doom2.wad -file %fileoutput%

REM After that, delete it.
del %fileoutput%