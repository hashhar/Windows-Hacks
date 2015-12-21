@echo off
start "Starting Bing Desktop Toolbar" "C:\Program Files (x86)\Microsoft\BingDesktop\BingDesktop.exe"
timeout /nobreak /t 120
rem Kill the BingDesktop task
taskkill /f /t /im BingDesktop.exe
