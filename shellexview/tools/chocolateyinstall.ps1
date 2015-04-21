$ErrorActionPreference = 'Stop';

$packageName = 'ShellExView'

$checksumType = 'sha1'

$url = 'http://www.nirsoft.net/utils/shexview.zip'
$checksum = '41DE6F2448FDAACA987CDC461EDCBAC4102CAE78'

$url64 = 'http://www.nirsoft.net/utils/shexview-x64.zip'
$checksum64 = 'EDE598083ECE04C9C1A72F7C465A5243A785CA7F'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# Install the zip file - checksums are required since the download doesn't have a version in its name.
Install-ChocolateyZipPackage "$packageName" "$url" "$toolsDir" "$url64" -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType

# Create the dummy file to indicate a GUI shim needed
New-Item -ItemType file $(Join-Path "$toolsDir" 'shexview.exe.gui')
