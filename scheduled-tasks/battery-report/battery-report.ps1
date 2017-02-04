# The path where to generate the battery report. If left empty, it defaults to $USERPROFILE/Documents/batteryreport
Param(
    [Parameter(Position=1,ParameterSetName="Output")]
    [string]
    $ReportLocation = "$env:USERPROFILE\Documents\Battery Reports"
)

$date=(Get-Date).ToString('MM-dd-yyyy')
if ( -not (Test-Path $ReportLocation -PathType Container)) {
    New-Item -ItemType Directory $ReportLocation
}
powercfg.exe /batteryreport /output "$ReportLocation\$date.html"
