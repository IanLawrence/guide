# Troubleshooting Production

### No pages are getting served:

Check the application logs to see if the application is running.

### Application is running, but still no pages are getting served:

Check if the application can be started manually. Go to the folder where the application is installed and type:

`bundle exec rails server`

Then try accessing the application by visiting localhost:3000 in the browser.

### Login page is getting served but users get an error page after entering their username and password

Then it's likely CouchDB is not running. From the server, try this.

`curl http://localhost:5984/`

You should get something like this if couch is up and running.

`{"couchdb":"Welcome","version":"1.0.1"}`

(Your version may vary.) If it's down, try starting it with this.

`sudo /etc/init.d/couchdb start`

### CouchDB is up, but things are still not working correctly

You can look at the Couch logs with this command on the server.

`sudo less /var/log/couchdb/couch.log`

### Can view and register children, but error page when searching or exporting

Then it's likely Solr is not running. From the server, try this.

`ps aux | grep java`

You should see at least one running process like:

`java -Djetty.port=... -Dsolr.data.dir=... -Dsolr.solr.home=...`

If you don't, then Solr is not running. At the same time, if you see multiple Solr process with same `jetty.port`, then that means that multiple Solr instances are running on the same port, which is also a problem. The best thing to do is to kill all these Solr processes and restart them.

```
killall java
cd <path-to-rapidftr e.g. /srv/rapid_ftr_production/current>
RAILS_ENV=production bundle exec rake sunspot:clean_start
```

If there's some data issue requiring you to **browse the CouchDB data**, you won't be able to access Futon (the CouchDB UI) from your browser due to firewall restrictions. You can access it using ssh port forwarding. From your workstation, log into the server via ssh, adding the `-L` (dash-capital-L argument).

`ssh user@your.rapidftr.server -L 5999:localhost:5984`

After logging in, open your browser to [http://localhost:5999/_utils](http://localhost:5999/_utils) and you should see the remote server's Futon.
