@echo off

REM =======================
REM ACS_COMP, by Samuzero15tlh, based on Nash's.bat from Zdoom mod template.
REM =======================

cd %1

REM First, delete all previously compiled libraries
cd acs
del *.o
del error.txt
cls

REM Now let's go to the source directory
cd ../src
del *.o
del error.txt
cls

REM Get all the folders inside, and make a single line for the acc include files.
for /f "tokens=*" %%i in ('DIR /a:d /s /b') DO (
	call :concat "%%i"
)

REM Now compile everything. This will not cover ach files, letting you to import functions without compiling them.
for %%v in (*.acs) do (
acc %inc% "%%v" ../acs/"%%~nv.o"
if exist acs.err ren acs.err error.txt
if exist error.txt goto acserror
)
goto acsnoerror

:concat
set "inc=%inc% -i %1"
goto end

:acsnoerror

REM Go to the ACS directory to do some cleaning up
cd ../acs

REM These objects aren't necessary
del zcommon.o
del zdefs.o
del zspecial.o
del zwvars.o

REM Generate the LOADACS
REM Skipped this part. I'd prefer to name what files will form part of the loadacs set.
type NUL > ../acs_comp.txt
echo // Compiled with ACS_COMP.bat %TIME% on %DATE%.>>../acs_comp.txt
REM for %%v in (*.o) do (
REM echo %%~nv>>../loadacs.txt
REM )

cls
echo ACS compiled successfully.
goto end

:acserror

echo Errors found in compiling ACS libraries. Aborting...
REM Open's error text
error.txt
echo Close this to skip the routine.
pause
goto end

:end
