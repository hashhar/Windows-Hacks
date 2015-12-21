@echo off
rem Extract the current date and store it in mydate
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
rem Call up powercfg /batteryreport to generate the output at the Target directory passed as argument
rem TODO: Generate the report at %USERPROFILE%/Documents/batteryreport/ if no argument is passed
powercfg /batteryreport /output "%1%/%%mydate%%.html"
