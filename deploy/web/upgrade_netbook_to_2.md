# Upgrading a Linux Netbook to 2.0

## Prerequisites
You MUST be using a 64-bit machine.  If the netbook is running a 32-bit
Ubuntu, upgrade the system. To check you machine, run the following
command:
```
file /sbin/init 
```
If your machine is a 64-bit machine, this will return something like "ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.15, stripped"

## Upgrading
The easiest way to upgrade the netbook is to use two computers.  Your computer, the host, will update and deploy code onto the netbook.  You will need the netbook's IP address and login info (use it to replace <netbook_ip> and <netbook_login> below), and you will need to be on the same network/wifi as the netbook
* On the netbook (you could ssh into it), stop and backup the current app:
* Stop the current app:
```
sudo pkill nginx
sudo pkill Passenger
rm /etc/init.d/nginx
rm /etc/init.d/couchdb
mkdir ~/couch_bkp
sudo cp -R /var/lib/couchdb/1.3.1 ~/couch_bkp
sudo mkdir -p /data/production/couchdb/
sudo cp -r ~/couch_bkp/1.3.1/.* /data/production/couchdb/
sudo chown -R couchdb:couchdb /data/production/couchdb
```

* On your machine, the host, get the updated code.
```
cd /tmp
git clone https://github.com/rapidftr/rapidftr-infrastructure.git
cd rapidftr-infrastructure/
git checkout release-2.0.0
bundle install
```
* Deploy 2.0.0 to the netbook
```
echo '{"run_list":["role[production]"]}' > nodes/<netbook_ip>.json
bundle exec knife solo bootstrap <netbook_login>@<netbook_ip> --no-host-key-verify --clean-up
```
