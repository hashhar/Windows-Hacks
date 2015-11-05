@echo off
rem Ask the user for the Target directory to store the report
set /p UserInputPath= Enter path where you would like the report to be generated?
rem Extract the current date and store it in mydate
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
rem Call up powercfg /batteryreport to generate the output at the Target directory entered by the user
powercfg /batteryreport /output "%UserInputPath%\battery_report_%mydate%.html"