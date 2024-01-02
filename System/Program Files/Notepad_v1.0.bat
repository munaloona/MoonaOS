@echo off
cls
color %colors%
set echo=.
title Notepad v1.0

:start
echo %echo%
echo.
echo Welcome to MoonaOS Notepad v1.0
echo.
echo 1   Create
echo 2   Edit
set /p "option=> "

if %option%==1 goto create
if %option%==2 goto edit

:Create
echo What do you want to call your document?
set /p "fileName=> "
cd "..\Users\%osuser%\Documents"
echo. > "%fileName%.txt"
set echo= %fileName%.txt has been created in System\Users\%osuser%\Documents
goto start

:Edit
echo Type the name of the file you would like to edit
echo Last file created: %fileName%.txt
set /p "fileToEdit=> "
cls
:editR
cls
echo Type :EXIT: to go back
echo.
type %fileToEdit%
set /p "typing= "
if "%typing%"==":EXIT:" (
    goto start
) else (
    <nul set /p "= %typing%" >> %fileToEdit%
)
goto editR
