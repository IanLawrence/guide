# Upgrading or Deploying to 1.1.0:

## SETUP
This assumes the deployment user is rapidftr. You must fill in <ip_address>.
* Install Ruby 1.9.3 and other system dependencies:
```
  sudo apt-get update
  sudo apt-get install ruby1.9.1 ruby1.9.1-dev rubygems1.9.1 irb1.9.1
ri1.9.1 rdoc1.9.1 \
    build-essential libopenssl-ruby1.9.1 libssl-dev zlib1g-dev git
default-jdk nginx-core libcurl4-openssl-dev 
  gem install bundler
  gem install passenger
  sudo apt-get install -y couchdb
  sudo service couchdb restart
```
* Install nginx using passenger.  This will output the new passenger_root and passenger_ruby variables you need.  Update 
```
  sudo passenger-install-nginx-module
```
* Create the necessary directories
```
  sudo mkdir /srv/rapid_ftr_production
  sudo chown rapidftr:rapidftr /srv/rapid_ftr_production
  sudo mkdir /etc/nginx
  sudo chown rapidftr:rapidftr /etc/nginx
  sudo mkdir /etc/nginx/conf
  sudo chown rapidftr:rapidftr /etc/nginx/conf
```
* Install nodejs - Create the node_install.sh shell script, with the contents below first.
```
  # Adapted from https://gist.github.com/dwayne/2983873
  echo 'export PATH=$HOME/local/bin:$PATH' >> ~/.bashrc
  echo 'export NODE_PATH=$HOME/local/lib/node_modules' >> ~/.bashrc
  . ~/.bashrc
  mkdir -p ~/local
  mkdir -p ~/Downloads/node-latest-install
  cd ~/Downloads/node-latest-install
  curl http://nodejs.org/dist/node-latest.tar.gz | tar xz --strip-components=1
  ./configure --prefix=~/local # if SSL support is not required, use --without-ssl
  make install # this step takes a while
```
* Reboot the machine
```
sudo reboot
```
  
## DEPLOY
* Deploy from your machine
```
  cd /tmp
  git clone https://github.com/rapidftr/RapidFTR.git
  cd RapidFTR
  git checkout v1.1.0
  bundle install
  bundle exec cap deploy -S branch=release-1.1.0 -S deploy_server=<ip_address> -S deploy_user=rapidftr -S http_port=80 -S https_port=443 -S solr_port=8983 -S nginx_site_conf=/etc/nginx/conf -S couchdb_username=rapidftr -S couchdb_password=rapidftr -S server_name=localhost
```
* Within a minute or two, you should be able to access the site through
your browser

## Troubleshooting
* If you get an "Unauthorized" error when the cap task is setting up couchdb, make sure the rapidftr/rapidftr user has been created: RAILS_ENV=production rake db:create_couch_sysadmin 
