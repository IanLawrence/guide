# Automated Deployment to a Hosted/Cloud Server

## Requirements

* You need:
  * A host machine with Ruby and Git installed
  * A target server where you want RapidFTR to be installed (this can be a fresh machine with nothing installed)
  * URL of the target server, i.e. the URL used to access the server from a browser (e.g. dev.rapidftr.com)

## Supported Systems

* Ubuntu 14.04 64 bit **tested and recommended**
* Or any system that can run Docker. Check this [compatibility list](https://github.com/bflad/chef-docker/blob/master/COMPATIBILITY.md)

## Deployment

* All commands to be run in the **Host machine** only. Do not do anything on the target machine directly.
* Clone the [rapidftr-infrastructure](//github.com/rapidftr/rapidftr-infrastructure) repository, and checkout to the release that you want

        git clone https://github.com/rapidftr/rapidftr-infrastructure.git
        git checkout v1.2.1 # (or don't do this, and use the latest master)

* Run `bundle install`
* Run Knife Solo to provision the target server:

        bundle exec knife solo bootstrap <username>@<target-server>
        # enter password to the target server when asked

* Your server is up and running. Go to `https://<target-server>` to check the results.
* To change the SSL certificates, or to do backups, check [[Managing the Server]]
