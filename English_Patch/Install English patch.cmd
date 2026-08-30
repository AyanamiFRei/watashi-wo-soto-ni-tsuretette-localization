@echo off
chcp 65001 >nul
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0install_english.ps1"
set "result=%errorlevel%"
echo.
if not "%result%"=="0" echo Installation failed.
pause
exit /b %result%
