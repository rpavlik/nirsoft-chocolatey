$packageName = 'ShellExView'
$shortName = 'shexview' # used to create the download URL and the exe shim dummy file.
$checksum = '41DE6F2448FDAACA987CDC461EDCBAC4102CAE78' # 32-bit download's sha1
$checksum64 = 'EDE598083ECE04C9C1A72F7C465A5243A785CA7F' # 64-bit download's sha1

# Things following this line should be relatively universal for NirSoft tools.
$url = "http://www.nirsoft.net/utils/$shortName.zip"
$url64 = "http://www.nirsoft.net/utils/$shortName-x64.zip"

$ErrorActionPreference = 'Stop';
$checksumType = 'sha1'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# Install the zip file - checksums are required since the download doesn't have a version in its name.
Install-ChocolateyZipPackage "$packageName" "$url" "$toolsDir" "$url64" -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType

# Create the dummy file to indicate a GUI shim needed
New-Item -ItemType file $(Join-Path "$toolsDir" "$shortName.exe.gui")