# Edit config.ps1 to change the variables used here.
# Things in this file should be relatively universal for NirSoft tools.

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
# Source the shared config file
. $(Join-Path $toolsDir 'config.ps1')


$url = "http://www.nirsoft.net/utils/$shortName.zip"
$url64 = "http://www.nirsoft.net/utils/$shortName-x64.zip"

$ErrorActionPreference = 'Stop';
$checksumType = 'sha1'

# Install the zip file - checksums are required since the download doesn't have a version in its name.
Install-ChocolateyZipPackage "$packageName" "$url" "$toolsDir" "$url64" -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType

$guiDummyFile = $(Join-Path "$toolsDir" "$shortName.exe.gui")
# Create the dummy file to indicate a GUI shim needed
if (!$(Test-Path "$guiDummyFile")) {
    New-Item -ItemType file "$guiDummyFile" | Out-Null
}

# Create a shim with the full package name, for ease of use.
Install-BinFile -name "$PackageName" -path $(Join-Path "$toolsDir" "$shortName.exe") -useStart