# Generating Installers

## Linux Installer

The source for the Linux Installer for RapidFTR is located at: https://github.com/rapidftr/rapidftr-infrastructure/tree/master/installer

Generated versions of  the Linux installer are currently located on the [RapidFTR Downloads](https://bit.ly/rapidftr) page on Dropbox. However it is also possible to generate an installer on the fly with the latest changes.

To generate the latest version of the installer, a machine with **vagrant** *already installed* is required. **Internet access** *is also a prerequisite*. Once these prerequistes have been met, the following steps should be followed to generate the installer:

* Clone the repo https://github.com/rapidftr/rapidftr-infrastructure
* Do a git pull to get the latest changes (in case you already had the repo)
* CD into the `rapidftr-infrastructure/installer` directory
* Run:

```
vagrant up linux-dev
```

*This will boot up a Vagrant VM, install Docker, download and export RapidFTR image as a tar.gz file. It will also copy all the DEB dependencies that can be used to install Docker offline in Ubuntu 14.04.*

* Once the vagrant machine is run, an "artifacts" folder is created with the RapidFTR image and the DEBs.
* To distribute the installer to a target machine, zip up the installer directory and copy it to the target machine.

**Troubleshooting**

* If you encounter any errors while running `vagrant up linux-dev` that interrupt the generation of the installer, simply destroy the VM and create a new one:

    ```
    vagrant destroy linux-dev
    vagrant up linux-dev
    ```
* If on running `vagrant linux-dev` you encounter the message

    ```
    VM already provisioned. Run 'vagrant provision' or use '--provision' to force it
    ```
This means the vagrant machine is already running and the installer should have already been generated. However if no installer has been generated (if there is no artifacts directory) then you should destroy the VM and create a new one.
* Also note that a frequent cause of errors while generating the installer is an unstable internet connection. If you keep encountering errors, please make sure you are online and that your internet connection is stable.

## Windows Installer

TBD
