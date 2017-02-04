param (
    # The location to save the images to.
    [Parameter(Position=1,HelpMessage="The location to save the images to.")]
    [string]
    $SavePath = "$($env:USERPROFILE)\Pictures"
)

$Spotlight = "$SavePath\Spotlight"
$SpotlightAssets = "$Spotlight\CopyAssets"
$SpotlightHorizontal = "$Spotlight\Desktop"
$SpotlightVertical = "$Spotlight\Mobile"
$SpotlightLocal = "$($env:LOCALAPPDATA)\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets"

Add-Type -AssemblyName System.Drawing
New-Item "$Spotlight" -ItemType directory -Force;
New-Item "$SpotlightAssets" -ItemType directory -Force;
New-Item "$SpotlightHorizontal" -ItemType directory -Force;
New-Item "$SpotlightVertical" -ItemType directory -Force;

foreach($file in (Get-Item "$SpotlightLocal\*")) {
    if ((Get-Item $file).length -lt 100kb) {
        continue 
    }
    Copy-Item $file.FullName "$SpotlightAssets\$($file.Name).jpg";
}

foreach($newfile in (Get-Item "$SpotlightAssets\*")) {
    $image = New-Object -comObject WIA.ImageFile;
    $image.LoadFile($newfile.FullName);
    if($image.Width.ToString() -eq "1920") {
        Move-Item $newfile.FullName "$SpotlightHorizontal" -Force; 
    }
    elseif($image.Width.ToString() -eq "1080") {
        Move-Item $newfile.FullName "$SpotlightVertical" -Force; 
    }
}

Remove-Item "$SpotlightAssets\*";
Remove-Item "$SpotlightAssets"
