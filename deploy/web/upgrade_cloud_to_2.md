# Upgrading Cloud to 2.0

The Cloud upgrade process is relatively simple.  You will need to be comfortable ssh'ing into the current cloud instance and using the command line though. The upgrade process below lets you keep the original application data.

Before starting, you will need ssh credentials for the cloud server, and admin credentials for our CI instance at https://ci.rapidftr.com.

* SSH into the server
* Stop the current app:
```
sudo pkill nginx
sudo pkill Passenger
rm /etc/init.d/nginx
rm /etc/init.d/couchdb
```
* Backup the data in case anything happens:
```
mkdir ~/couch_bkp
sudo cp -R /var/lib/couchdb/1.3.1 ~/couch_bkp
```
* Move the DB files to their new home:
```
sudo mkdir -p /data/production/couchdb/
sudo cp -r ~/couch_bkp/1.3.1/.* /data/production/couchdb/
sudo chown -R couchdb:couchdb /data/production/couchdb
```
* Upgrade by following instructions in [the guide](automatedchef_with_ci.md) for the server

Note, this won't setup enquiry form sections, so you will need to log in as an admin and set up the enquiry form sections before you can create new enquiries.

Ensure you have added the correct certificate and key for the updated cloud instance to /data/production/ssl.
