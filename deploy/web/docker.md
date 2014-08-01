# Manual Deployment with Docker

* Install Docker as given in [their instructions](http://docs.docker.com/)
* Run:

        # Pull RapidFTR image
        docker pull rapidftr/rapidftr:latest

        # Create a folder to store RapidFTR data
        mkdir -p /data/rapidftr/production
        
        # Run RapidFTR
        docker run --detach --publish 80:80 --publish 443:443 --publish 6984:6984 --volume /data/rapidftr/production:/data --name rapidftr-production --tty rapidftr/rapidftr:latest

        # See the logs
        docker logs -f rapidftr-production
