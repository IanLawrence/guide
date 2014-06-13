# Deploying to a Hosted/Cloud Server

## Requirements

* You need:
  * A host machine with Ruby and Git installed
  * A target server where you want RapidFTR to be installed (this can be a fresh machine with nothing installed)
  * URL of the target server, i.e. the URL used to access the server from a browser (e.g. dev.rapidftr.com)
* We support Ubuntu 12.04 or later for the target machine

## Deployment

* All commands to be run in the **Host machine** only
  * You will not touch the target machine directly for any reason. You will use the Chef scripts only to provision the target machine.
* Clone the [rapidftr-infrastructure](//github.com/rapidftr/rapidftr-infrastructure) repository
* Run `bundle install`
* Configure the [SSL certificates](ssl.md)
  * Make sure you have `certificate.crt` and `certificate.key`
  * Copy them to `site-cookbooks/rapidftr/files/default` and `site-cookbooks/couchdb/files/default`
* Use Knife Solo to prepare a target server: `bundle exec knife solo prepare <username>@<target-server-url>`
  * This will install Chef and necessary dependencies on the target
* Create a node config file: `nodes/<target-server-url>.json`
  * At minimum, you'll want to override the host name and specify the run list as follows:
    ```json
    {
      "run_list" : [
        "role[production]"
      ],
      "rapidftr" : {
        "host" : "<target-server-url>"
      },
      "automatic" : {
        "ipaddress" : "<target-server-url>"
      }
    }
    ```
  * Check `nodes/dev.rapidftr.com.conf` for an example
* Use Knife Solo to deploy RapidFTR: `bundle exec knife solo cook <username>@<target-server-url>`
  * This will provision the target server with the given node config file
