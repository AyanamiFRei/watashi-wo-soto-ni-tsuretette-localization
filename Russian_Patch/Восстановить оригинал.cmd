@echo off
chcp 65001 >nul
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0restore_original.ps1"
set "result=%errorlevel%"
echo.
if not "%result%"=="0" echo Восстановление завершилось с ошибкой.
pause
exit /b %result%
