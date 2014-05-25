# Setup on Windows

## Software Requirements

* RapidFTR works on Windows XP SP3 and above, and is not yet tested on Windows 8 Metro
* [RailsInstaller](http://railsinstaller.org) - **IMPORTANT**: Download the big green **Windows Ruby 1.9** version
* [CouchDB](http://couchdb.apache.org/) - Download the latest Windows version
* [ImageMagick](http://www.imagemagick.org/script/binary-releases.php) - Download the static, x86 release (e.g. ImageMagick-x.y.z-Q16-x86-static.exe)
* [NodeJS](http://nodejs.org/download/) - Required for Javascript compilation
* [Java Development Kit]( http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html) - Download the JDK release, not the JRE
* [Windows Imaging Component](http://www.microsoft.com/en-in/download/details.aspx?id=32) - required only for Windows XP, download "wic_x86_enu.exe"
* [Firefox](http://getfirefox.com)

* *Optional* Make sure that third-party gem documentations are not installed, since they take a long time. Some of the "echo" commands may fail, but don't worry, its enough if one of these commands succeeds, and anyways this is an optional step that reduces your download time and doesn't affect the installer:
```
echo gem: --no-ri --no-rdoc > "C:\Documents and Settings\All Users\gemrc"
echo gem: --no-ri --no-rdoc > "C:\Documents and Settings\All Users\Application Data\gemrc"
echo gem: --no-ri --no-rdoc > "C:\gemrc"
echo gem: --no-ri --no-rdoc > "C:\Program Files\gemrc"
echo gem: --no-ri --no-rdoc > "C:\ProgramData\gemrc"
```

## Setup RapidFTR

* Download RapidFTR code:
`git clone https://github.com/rapidftr/RapidFTR.git`
* Install gems:
`bundle install`

* Finally follow [Initial Run](initial-run.md)
