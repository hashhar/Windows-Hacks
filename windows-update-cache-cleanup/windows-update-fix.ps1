Write-Warning "DO NOT RUN THIS IF YOU ARE UNSURE WHAT THIS IS DOING AS IT CAN BREAK WINDOWS UPDATE CAUSING YOU TO REINSTALL."
Pause

Write-Output "Stop Windows Update Service"
Stop-Service wuauserv
Write-Output "Stop Cryptographic Services"
Stop-Service CryptSvc
Write-Output "Stop Background Intelligent Transfer Service"
Stop-Service BITS
Stop-Service msiserver

Rename-Item "$env:windir\SoftwareDistribution" "SoftwareDistribution.old"
Remove-Item -Recurse -Force "$env:windir\SoftwareDistribution.old"

Rename-Item "$env:windir\catroot2" "catroot2.old"
Remove-Item -Recurse -Force "$env:windir\catroot2.old"

Write-Output "Start Windows Update Service"
Start-Service wuauserv
Write-Output "Start Cryptographic Services"
Start-Service CryptSvc
Write-Output "Start Background Intelligent Transfer Service"
Start-Service BITS
Start-Service msiserver
