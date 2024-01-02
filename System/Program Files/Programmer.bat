@echo off
setlocal enabledelayedexpansion

set "tempFile=temp.txt"
set "counter=1"
set "programName="

cls
color 0c
cd ..
cd Users

if exist "username.txt" (
    for /f "Delims=" %%a in (username.txt) do (
        set osname=%%a
    )
) else (
    echo Your account does not exist.
    timeout /t 3 /nobreak >nul
    goto start
)

:mainMenu
color 0a
cls
echo.
echo Moon OS X Programmer
echo ---------------------
echo 1. Create New Program
echo 2. Edit Existing Program
echo 3. Compile Program
echo 4. Back
echo 5. Info
echo.

set /p "choice=Enter your choice: "

if "%choice%"=="1" goto createProgram
if "%choice%"=="2" goto editProgram
if "%choice%"=="3" goto compileProgram
if "%choice%"=="4" goto back
if "%choice%"=="5" goto info
 
:createProgram
cls
echo.
set /p "programName=Enter the program name (without extension): "
set "programName=!programName!.bat"
goto inputLoop

:inputLoop
cls
echo.
echo Enter the code for your program (Type 'exit' to finish and return to main menu):
echo.

set /p "line="
if "%line%"=="exit" goto mainMenu

cd "!osname!"\Programs\Temp
echo %line% > !programName!_line!counter!.txt
set /a "counter+=1"
move !programName!_line!counter!.txt Temp
cd ..\..
goto inputLoop

:editProgram
cls
echo.
if "%programName%"=="" (
    echo Please create or select a program first.
    pause
    goto mainMenu
)

echo Editing program: %programName%
echo.
echo Current content:
type %programName%
echo.
set /p "newLine=Enter the new line of code (Type 'exit' to finish editing): "

if "%newLine%"=="exit" goto mainMenu

echo %newLine% >> %programName%
goto editProgram

:compileProgram
@echo on
echo.
echo.
cd "!osname!"\Programs
echo.
echo.
dir
cls
echo.
if "%programName%"=="" (
    echo Please create or select a program first.
    pause
    goto mainMenu
)

if %counter% leq 1 (
    echo Please enter some code for the program first.
    pause
    goto mainMenu
)

type !programName!_line*.txt > %programName%
echo Program '%programName%' has been compiled.
pause
goto mainMenu

:back
cd ..
desk.bat
exit

:info
echo.
echo.
echo.
echo.
echo Why do you need to compile your program?
echo.
echo Well, the way you create your batch program is suprisingly simple yet complicated,
echo Every line is stored in a seperate file, and when you are done with making your
echo batch file, and you type 'exit', you can type 3 to open the automatic compiler.
echo.
echo The reason lines are stored in different text files is because it's the easiest
echo method of creating programs using batch.
echo.
echo.
echo Press any key to delete the text above.
pause >nul
goto mainMenu