rem Stop Windows Update Service
net stop wuauserv
rem Stop Cryptographic Services
net stop cryptSvc
rem Stop Background Intelligent Transfer Service
net stop bits
net stop msiserver
rem Rename the Update package cache folder to something else and then delete the folder
ren C:\Windows\SoftwareDistribution SoftwareDistribution.old
rmdir /S C:\Windows\SoftwareDistribution.old
rem Rename the Update catalog folder to ssomething else and then delete the folder
ren C:\Windows\System32\catroot2 catroot2.old
rmdir /S C:\Windows\System32\catroot2.old
rem Start the stopped services again
net start wuauserv
net start cryptSvc
net start bits
net start msiserver
echo Done!