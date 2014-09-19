# Generating Installers

## Linux Installer

The source for the Linux Installer for RapidFTR is located at: https://github.com/rapidftr/rapidftr-infrastructure/tree/master/installer

Generated versions of  the Linux installer are currently located on the [RapidFTR Downloads](https://bit.ly/rapidftr) page on Dropbox. However it is also possible to generate an installer on the fly with the latest changes.

To generate the latest version of the installer, a machine with vagrant already installed is required. Internet access is also a prerequisite. The following steps should be followed to generate the installer:

* Clone the repo https://github.com/rapidftr/rapidftr-infrastructure
* Do a git pull to get the latest changes (in case you already had the repo)
* CD into the `rapidftr-infrastructure/installer` directory
* Run:

```
vagrant up linux-dev
```

*This will boot up a Vagrant VM, install Docker, download and export RapidFTR image as a tar.gz file. It will also copy all the DEB dependencies that can be used to install Docker offline in Ubuntu 14.04.*

* Once the vagrant machine is run, an "artifacts" folder is created with the RapidFTR image and the DEBs.

## Windows Installer

TBD
