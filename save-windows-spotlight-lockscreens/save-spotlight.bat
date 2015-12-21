mkdir %1%\Temp
cd /D %USERPROFILE%\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager*\LocalState\Assets\
for %%e in ("*") do copy /Y %%e %1%\Temp\
rem Go to the Temp directory to rename all the files to *.jpg
cd /D %1%\Temp\
for %%f in ("*") do ren %%f %%f.jpg
rem Move all the renamed files from the Temp directory to the Target directory
for %%g in ("*") do move %%g ../
cd ..
rmdir Temp
rem TODO: Save the files to %USERPROFILE%/Pictures/ if no argument is passed
