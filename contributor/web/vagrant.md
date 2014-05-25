# Using a VM for Development

Rather than installing RapidFTR and all its dependencies directly on your workstation, you can develop using a pre-built VM that has everything ready for you to start developing on RapidFTR.

Here are the instructions to get up and running:

* Install [VirtualBox](http://virtualbox.org/)
* Install [Vagrant](http://vagrantup.com/)
* Fork and clone the [RapidFTR repository](https://github.com/rapidftr/RapidFTR)
* From that folder, run:
      vagrant up
  This downloads the VM and sets up all the dependencies for RapidFTR. Beware this may take a long time depending upon your internet speed.
* Once that command completes, your VM is up and running in the background.
* Run `vagrant ssh` to login to the VM.
* To start RapidFTR, run:
      cd /vagrant
      rails server
* RapidFTR is up and running! Browse to `http://localhost:3000` to access
* Refer to the [Initial Run](initial-run.md) for the default usernames and passwords to login to RapidFTR.

Once you're done developing, remember to shutdown the VM afterwards. You can run:

* `vagrant suspend` to temporarly suspend the VM, and later `vagrant resume` to resume it again
* `vagrant halt` to shutdown the machine, and later `vagrant up` to boot it up again
* `vagrant destroy` to completely remove the VM
