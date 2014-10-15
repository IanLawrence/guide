# Manual Deployment with Docker

* Install Docker as given in [their instructions](http://docs.docker.com/)
* Run:

        # Create a folder to store RapidFTR data
        mkdir -p /data/rapidftr/production

        # Run RapidFTR (all in one line)
        docker run --detach \
                   --publish 80:80 \
                   --publish 443:443 \
                   --publish 6984:6984 \
                   --volume /data/rapidftr/production:/data \
                   --name rapidftr-production \
                   --tty
                   rapidftr/rapidftr:<version>
        # where <version> can be an actual version or "latest"

        # OPTIONAL: See the logs
        docker logs -f rapidftr-production
