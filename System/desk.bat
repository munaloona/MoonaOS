@echo off
cd ..
set colors=0a

title MoonaOS Alpha v0.2.0
:Start
cd "System\Users\%osuser%\Settings"
if exist "colors.txt" (
    for /f "Delims=" %%a in (colors.txt) do (
        set colors=%%a
    )
) else (
    <nul set /p "= %colors%" > colors.txt
)
color %colors%
cls
cd ..\..\..\..
echo.
echo  Welcome, %osuser%!
echo.
echo  1    Apps
echo  2    Settings
echo  3    Info
echo  4    Log Out
set /p "option=> "
if %option%==1 goto Apps
if %option%==2 goto Settings
if %option%==3 goto Info
if %option%==4 goto Exit
if %option% GEQ 5 (
    echo Error: Invalid number.
    timeout /t 2 /nobreak >nul
    goto Start
)

:Apps
cd "System\Program Files"
cls
echo  Z to go back
echo.
echo  1   Calculator
echo  2   Notepad v1.0
set /p "option=> "
if %option%==Z goto Start
if %option%==1 call Calculator.bat
if %option%==2 Notepad_v1.0.bat

:Settings
cls
echo  Z to go back
echo.
echo  1   Colors
set /p "option=> "
if %option%==1 goto Settings-Colors
if %option% GEQ 2 (
    echo Error: Invalid number.
    timeout /t 2 /nobreak >nul
    goto Start
)

:Settings-colors
cls
echo  Z to go back
echo.
echo  1  Dark Mode
echo  2  Light Mode
set /p "option=> "
if %option%==1 (
dir
    cd System\Users\%osuser%\Settings
    <nul set /p "= 0a" > colors.txt
)

if %option%==2 (
    cd System\Users\%osuser%\Settings
    <nul set /p "= fd" > colors.txt
)
goto Start

:Info
cls
echo  Z to go back
echo.
echo  Made by MoonaLoona
echo  Build 0.2.0-alpha
echo  Date 1/2/2024
echo.
echo  Changelog
echo  1   Added settings
echo  2   Removed automatic login
echo  3   Changed exit to Log Out
echo  4   Added Notepad program
echo  5   Added qLog for quick login
set /p "option=> "
if %option%==Z goto Start
echo.
echo no
timeout /t 2 /nobreak >nul
exit

:Exit
main.bat
exit