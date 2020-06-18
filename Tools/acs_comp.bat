@echo off

cd %1

REM First, delete all previously compiled libraries
cd acs
del *.o
del error.txt

REM Now let's go to the source directory
cd ../src
del *.o
del error.txt

for %%v in (*.acs) do (
acc "%%v" ../acs/"%%~nv.o"
if exist acs.err ren acs.err error.txt
if exist error.txt goto acserror
)

goto acsnoerror

:acsnoerror

REM Go to the ACS directory to do some cleaning up
cd ../acs

REM These objects aren't necessary
del zcommon.o
del zdefs.o
del zspecial.o
del zwvars.o

REM Generate the LOADACS
type NUL > ../loadacs.txt
echo // Generated automatically by build script at %TIME% on %DATE%, do not edit>>../loadacs.txt
for %%v in (*.o) do (
echo %%~nv>>../loadacs.txt
)

cls
echo ACS compiled successfully.
goto end

:acserror

echo Errors found in compiling ACS libraries. Aborting...
error.txt
goto end

:end
