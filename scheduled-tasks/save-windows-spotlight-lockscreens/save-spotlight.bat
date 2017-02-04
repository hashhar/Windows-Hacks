@echo off
if [%1]==[] (
	set base_path=%USERPROFILE%\Pictures\Spotlight
) else (
	set base_path=%1
)
if not exist "%base_path%" mkdir "%base_path%"
mkdir "%base_path%\Temp"
cd /D %USERPROFILE%\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager*\LocalState\Assets\
@echo on
for %%e in ("*") do copy /Y %%e "%base_path%\Temp\"
@echo off
rem "Go to the Temp directory to rename all the files to *.jpg"
cd /D "%base_path%\Temp\"
for %%f in ("*") do ren %%f %%f.jpg
rem "Move all the renamed files from the Temp directory to the Target directory"
@echo on
for %%g in ("*") do move %%g ../
cd ..
rmdir Temp
