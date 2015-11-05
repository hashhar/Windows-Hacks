rem Go to the Bing wallpaper cache location
rem The location is actually %USERPROFILE%\AppData\Local\Microsoft\BingDesktop\locale\Apps\Wallpaper_somerandomhash\VersionIndependent\images where locale is en-us, en-gb etc.
cd /D %USERPROFILE%\AppData\Local\Microsoft\BingDesktop\en-us\Apps\Wallpaper_*\VersionIndependent\images\
rem Copy all the jpg files to the Target directory passed as argument
rem TODO: Copy to %USERPROFILE%/Pictures/ if no argument is passed
for %%e in ("*.jpg") do copy /Y %%e %1%\
