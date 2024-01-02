@echo off
title MoonaOS Alpha v0.2.0
setlocal enabledelayedexpansion
set "account_created_successfully=."

:start
cls
color 0a
echo %account_created_successfully%
echo.
echo  MoonaOS Alpha v0.2.0
echo.
echo  1    Login
echo  2    Register
echo  3    Info
echo.
set /p "option=> "

if "%option%"=="1" goto login
if "%option%"=="2" goto register

:register
title MoonaOS Alpha v0.2.0 - Register
color 0a
echo.
echo  Type your desired username
set /p "osuser=> "
echo.
echo  Type your desired password
set /p "ospass=> "

:: Going into the Users folder and making the user files
cd SYSTEM\Users
mkdir "!osuser!"

:: In the user's folder (System/Users/%osuser%)
cd "!osuser!"

mkdir "Documents"
mkdir "Settings"

:: In the user's programs folder
cd Documents
mkdir "Temp"

:: Back to the user's folder
cd ..
<nul set /p "= %ospass%" > password.txt

:: Back into system then into Mem
cd ..\..
cd Mem
<nul set /p "= %osuser%" > username.txt

:: Back into System, then root
cd ..\..

set "account_created_successfully=Account %osuser% was created successfully"
goto start

:login
cd System\Mem
if exist "username.txt" (
	for /f "Delims=" %%a in (username.txt) do (
		set "osuser=%%a"
		goto login2
	)
) else (
	set %account_created_successfully%=User does not exist / was not found"
	goto start
)
:login2
cd ..
cd "Users\%osuser%"
if exist "password.txt" (
	for /f "Delims=" %%b in (password.txt) do (
		set "ospass=%%b"
		goto login3
	)
) else (
	set %account_created_successfully%=Password does not exist / was not found
	goto start
)

:login3
echo.
cd ..\..
cls
:: Should be in the system now

echo  Users available
echo  %osuser%
echo  qLog
echo.
set /p "chosenUser=> "
if "%chosenUser%"=="%osuser%" (
	echo.
	echo  Type the password for %osuser%
	set /p "password=> "
	if "%password%"=="%ospass%" goto end
) else if "%chosenUser%"=="qLog" (
	set osuser=qLog
	goto end
) else (
	set %account_created_successfully%=Invaid User
	goto start
)

:end
desk.bat
pause