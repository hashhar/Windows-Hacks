@echo off
rem "Extract the current date and store it in mydate"
for /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
rem "Call up powercfg /batteryreport at the directory passed as argument"
if not exist "%USERPROFILE%/Documents/batteryreport" mkdir "%USERPROFILE%/Documents/batteryreport"
if [%1]==[] (
	powercfg /batteryreport /output "%USERPROFILE/Documents/batteryreport/%%mydate%%.html"
) else (
	powercfg /batteryreport /output "%1%/%%mydate%%.html"
)
