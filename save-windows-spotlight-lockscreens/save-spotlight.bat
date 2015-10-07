rem Create a Temp directory within the target directory passed as the argument to hold copied files
mkdir %1%\Temp
rem Go to the directory containing the images
cd /D %USERPROFILE%\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager*\LocalState\Assets\
rem Copy all the files to the Temp directory we just created (Target directory must not end in slashes)
for %%e in ("*") do copy /Y %%e %1%\Temp\
rem Go to the Temp directory to rename all the files to *.jpg
cd /D %1%\Temp\
for %%f in ("*") do ren %%f %%f.jpg
rem Move all the renamed files from the Temp directory to the Target directory
for %%g in ("*") do move %%g ../
cd ..
rem Remove the Temp directory
rmdir Temp
rem TODO: Save the files to %USERPROFILE%/Pictures/ if no argument is passed