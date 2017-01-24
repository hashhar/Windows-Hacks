@echo off
rem "Extract the current date and store it in mydate"
for /f "tokens=1-4 delims=- " %%a in ('date /t') do (set mydate=%%c-%%b-%%a)
rem "Call up powercfg /batteryreport at the directory passed as argument"
if [%1]==[] (
	if not exist "%USERPROFILE%/Documents/batteryreport" mkdir "%USERPROFILE%/Documents/batteryreport"
	powercfg /batteryreport /output "%USERPROFILE/Documents/batteryreport/%%mydate%%.html"
) else (
	powercfg /batteryreport /output "%1%/%%mydate%%.html"
)
