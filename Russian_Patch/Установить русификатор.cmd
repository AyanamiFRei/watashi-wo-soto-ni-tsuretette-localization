@echo off
chcp 65001 >nul
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0install_russian.ps1"
set "result=%errorlevel%"
echo.
if not "%result%"=="0" echo Установка завершилась с ошибкой.
pause
exit /b %result%
