@echo off
set /p UserInputPath="Enter path where you would like the report to be generated?"
rem "Extract the current date and store it in mydate"
for /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
rem "Call up powercfg /batteryreport at the directory entered by the user
powercfg /batteryreport /output "%UserInputPath%\battery_report_%mydate%.html"
