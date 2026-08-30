@echo off
chcp 65001 >nul
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0restore_original.ps1"
set "result=%errorlevel%"
echo.
if not "%result%"=="0" echo Restore failed.
pause
exit /b %result%
