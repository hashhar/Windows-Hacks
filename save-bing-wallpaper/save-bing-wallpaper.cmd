@echo off
rem "The location is actually %USERPROFILE%\AppData\Local\Microsoft\BingDesktop\locale\Apps\Wallpaper_somerandomhash\VersionIndependent\images where locale is en-us, en-gb etc."
cd /D %USERPROFILE%\AppData\Local\Microsoft\BingDesktop\en-us\Apps\Wallpaper_*\VersionIndependent\images\
@echo on
if not exist "%USERPROFILE%\Pictures\Bing" mkdir "%USERPROFILE%\Pictures\Bing"
if [%1]==[] (
	for %%e in ("*.jpg") do copy /Y %%e %USERPROFILE%\Pictures\Bing\
) else (
	for %%e in ("*.jpg") do copy /Y %%e %1%\
)
