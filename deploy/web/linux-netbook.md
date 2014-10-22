# Installing on Linux NetBook

To install RapidFTR, you must download the RapidFTR Installer, extract the contents, and then run the installer.

## Software Requirements

* 64-bit Ubuntu 14.04.1 LTS Desktop or Server

## Installing on a netbook with a graphical user interface

* Log into the Netbook using an account with administrator or root privileges
* Download the RapidFTR Web installer to the Desktop

    *The RapidFTR web installer is available at the link: **https://bit.ly/rapidftr** under the folder named server*

* Find the downloaded RapidFTR installer on the Desktop and right-click it, then select *Extract here*

    *The **RapidFTR-dev** folder is extracted to the Ubuntu Desktop.*

* Open a Terminal window
* In the Terminal, run this command to navigate to the *RapidFTR-dev* folder:

    `cd Desktop/RapidFTR-dev/`

* Run this command to install RapidFTR:

    `sudo ./install.sh`

* Enter your Ubuntu password.

*On completion, the installer automatically starts the RapidFTR server. To access the RapidFTR server, simply open up a web browser and type `https://localhost` into the URL field of the browser*

## Installing on a netbook with only a command line interface

* Log into the Netbook using an account with administrator or root privileges
* Download the RapidFTR Web installer by running the command:

    `wget https://bit.ly/rapidftr-server`

* Extract the contents of the downloaded RapidFTR installer by running the command:

    `unzip xvf RapidFTR-server -C /tmp/`

*The **RapidFTR-dev** folder is extracted to the current location.*

* Change directories into the RapidFTR-dev folder by running the command:

    `cd /tmp/RapidFTR-dev/`

* Run this command to install RapidFTR:

    `sudo ./install.sh`

## Offline Installation

The RapidFTR installer is able to automatically detect the connectivity status of the netbook and adjust appropriately. Performing an offline installation can therefore be performed in the same way as noted above.

## Hardware Requirements

Following are the minimum hardware requirements:

* 1.0 Ghz Processor
* 2 GB RAM
* 10 GB Free Disk Space (for RapidFTR + all required software)
