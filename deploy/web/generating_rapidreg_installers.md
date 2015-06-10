# Generating RapidREG installers

## Linux & windows Installers

The source for the Linux Installer for RapidFTR is located at: https://github.com/rapidftr/rapidftr-infrastructure/tree/master/installer

Generated versions of  the Linux installer are currently located on the [RapidREG Downloads](https://bit.ly/rapidreg) page on Dropbox. However it is also possible to generate an installer on the fly with the latest changes.

To generate the latest version of the installer, a machine with **vagrant** *already installed* is required. **Internet access** *is also a prerequisite*. Once these prerequistes have been met, the following steps should be followed to generate the installer:

* Clone the repo https://github.com/rapidftr/rapidftr-infrastructure
* Do a git pull to get the latest changes (in case you already had the repo)
* CD into the `rapidftr-infrastructure/installer` directory
* Run:

```
./rapidreg-installers-build.sh
```

*This will boot up a Vagrant VM, install Docker, download and export RapidFTR docker image as a tar.gz file, download and install the **nsis** package for making windows installers. It will also copy all the DEB dependencies that can be used to install Docker offline in Ubuntu 14.04.*

* Once the vagrant machine is run, an "artifacts" folder is created with the RapidFTR image and the DEBs.
* Once the script is done running, it will create two files, `rapidreg-linux-installer.tar.gz` and `rapidreg-windows-installer.tar.gz`
* To distribute the installer to a target machine, unzip the required installer on the target machine and run the `setup.exe` or `install.sh` for windows or linux respectively.

**Troubleshooting**

* If you encounter any errors while running `rapidreg-installers-build.sh` that interrupt the generation of the installer, simply destroy the VM and create a new one:

    ```
    vagrant destroy rapidreg-installers
    ./rapidreg-installers-build.sh
    ```
* Also note that a frequent cause of errors while generating the installer is an unstable internet connection. If you keep encountering errors, please make sure you are online and that your internet connection is stable.
