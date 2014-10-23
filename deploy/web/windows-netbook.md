# Installing on Windows NetBook

## Software Requirements
* Windows 7 or later
* [Google Chrome](http://www.google.com/chrome/eula.html?standalone=1) or [Firefox](http://getfirefox.com) Browser

*Note: Internet Explorer is not a supported browser*

### Installation Procedure

* Download the appropriate RapidFTR installer for your Operating System from the [Downloads](https://bit.ly/rapidftr) page under the folder named server
* Start the installation by double clicking on the downloaded installer
* Accept the [UAC dialog](http://windows.microsoft.com/en-za/windows/what-are-user-account-control-settings#1TC=windows-7) by clicking `Yes` if displayed

*You will be presented with a dialog asking you to install Oracle VM VirtualBox 4.3.18 on your computer*

* Click `Next`
* When asked to select features to be installed Leave the defaults and click `Next`

*You may be presented with a warning about network interfaces and asked to `Proceed with installation now`*

* Simply Click `Next` and then `Install` on the next dialog

This will install Oracle Virtualbox which is required to run the RapidFTR server on Windows

* If presented with Windows Security dialogs asking you whether you would like to `Install this device software` (from Oracle Corporation), simply click `Install`
*(This may happen about 2 or 3 times)*

* When the Oracle Virtualbox installation is complete leave all options as is and simply click `Finish`

The RapidFTR installer will proceed to unpack RapiDFTR image.

* On completion, the installer will indicate that it has completed. At this point, click `Close` to close the installation dialog

*When done, the installer automatically starts the RapidFTR server. To access the RapidFTR server, simply open up a web browser and type `https://localhost` into the URL field of the browser.
**NOTE**: You may need to wait for up to 10 minutes for the RapidFTR server to start up before you will be able to access `https://localhost`*

## Hardware Requirements

Following are the minimum hardware requirements:

* 2 Ghz Processor with VT-x support
* 4 GB RAM
* 10 GB Free Disk Space (for RapidFTR + all required software)

### Notes:
* RapidFTR on windows is installed as a virtual machine with virtualbox as the supporting virtualization container.

* VT-x support is required because the virtual machine installed is a 64 bit guest and will not work if it's not available.
