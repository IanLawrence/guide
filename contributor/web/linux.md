# Setup on Linux

To get RapidFTR running on your Linux machine while it's in a dev environment, you'll need to install the following:

* CouchDB
* ImageMagick
* Java
* Git
* Ruby 1.9.3 via RVM

### Install the following core software:

```
sudo apt-get install libxml2-dev libxslt1-dev build-essential git openjdk-7-jdk imagemagick openssh-server zlib1g-dev
```

## CouchDB

* Install latest CouchDB (1.3.x) from a PPA:
```
sudo apt-add-repository ppa:nilya/couchdb-1.3
sudo apt-get update
sudo apt-get install couchdb
```

## Ruby 1.9.3 via RVM

* Follow [RVM install instructions](https://rvm.io/rvm/install/)
* Install Ruby 1.9.3 using rvm
```
rvm install 1.9.3-p392 --patch railsexpress
```
* Clone this RapidFTR git repo(http://github.com/rapidftr/RapidFTR).
* Run `rvm --create use 1.9.3-p392@rapidftr`
* Run `bundle install`
* Follow [Initial Run](initial-run.md)
