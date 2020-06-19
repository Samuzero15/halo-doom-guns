@echo off

REM This compiles and packs the Zandronum version.
REM Perfect to make standalone files.

set fileoutput="HaloGuns_GZ.pk3"

cd %~dp0
set PATH=%PATH%;%~dp0\Tools
set folder=%~dp0\GZDoom
cls

cd "%folder%"

call acs_comp "%folder%" 

cd "%folder%"

call 7za a -y -tzip -mx=9 -mmt -x!.svn ..\%fileoutput% ".\"
