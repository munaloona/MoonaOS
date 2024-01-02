@echo off
color %colors%
cd ..
cls
:start
echo.
echo Z to go back, C to clear
echo.
echo Type an equation
set /p "e=> "
if "e==C" (
	cls
	goto start
) else if "e==Z" (
	desk.bat
) else (
	set /a "r=%e%"
	echo r
	goto start
)