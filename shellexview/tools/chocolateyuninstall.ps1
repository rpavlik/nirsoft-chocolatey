# Edit config.ps1 to change the variables used here.
# Things in this file should be relatively universal for NirSoft tools.

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
# Source the shared config file
. $(Join-Path $toolsDir 'config.ps1')

# stop on all errors
$ErrorActionPreference = 'Stop';

# Uninstall the zip file
$osBitness = Get-ProcessorBits
if ($osBitness -eq 64) {
    UnInstall-ChocolateyZipPackage $packageName "$shortName-x64.zip"
} else {
    UnInstall-ChocolateyZipPackage $packageName "$shortName.zip"
}

# Uninstall the dummy for the GUI shim
$guiDummyFile = $(Join-Path "$toolsDir" "$shortName.exe.gui")
if (Test-Path "$guiDummyFile") {
    Remove-Item "$guiDummyFile" | Out-Null
}

# Uninstall our handy extra shim
UnInstall-BinFile -name "$PackageName" -path $(Join-Path "$toolsDir" "$shortName.exe")