# nirsoft-chocolatey
[Chocolatey](http://chocolatey.org) packages for selected [NirSoft](http://www.nirsoft.net) utilities. **I'm not associated with NirSoft**, just like some of the stuff.

The packages are all (submitted to be/eventually) published to the main chocolatey feed.

## General process for creation

Create the initial templates:

```powershell
choco new shellexview maintainername="Ryan Pavlik" packageversion=1.90.0.0 url=http://www.nirsoft.net/utils/shexview.zip url64=http://www.nirsoft.net/utils/shexview-x64.zip maintainerrepo=rpavlik/nirsoft-chocolatey
```

Remove the uninstall script - these are all just zip files.

Edit the install script - will resemble the ShellExView one.

Edit the `nuspec` file - again, will resemble the ShellExView one.


## License

Apache Software License v2.0 - same as Chocolatey itself.

(Mind you these are pretty trivial scripts...)
