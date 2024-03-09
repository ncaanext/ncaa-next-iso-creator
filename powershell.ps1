$ISOPath =  ((Get-Item -Path ".\" -Verbose).FullName+"\NCAA06.iso")
$next =  ((Get-Item -Path ".\" -Verbose).FullName+"\next")

$DiskImage = Mount-DiskImage -ImagePath $ISOPath -StorageType ISO -NoDriveLetter -PassThru
New-PSDrive -Name ISOFile -PSProvider FileSystem -Root (Get-Volume -DiskImage $DiskImage).UniqueId
Push-Location ISOFile:
# read files with the usual filesystem commands
xcopy *.* $next /E
Pop-Location
Remove-PSDrive ISOFile
Dismount-DiskImage -DevicePath $DiskImage.DevicePath

ECHO "Patching NCAA 06 with NCAA NEXT Mods!"
xcopy mod next /E /Y /A

