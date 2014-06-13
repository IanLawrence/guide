# Production Failover Setup

This guide will cover how to setup two servers in a Redundant/Failover configuration.

## Deploying the two servers

* Setup two target servers by following instructions as specified in [[Server Deployment]]

## Setting up failover

* In the backup server, create the following script called "/usr/bin/couchdb_replicate.rb"
  ```
  #!/usr/bin/env ruby
  require 'rubygems'
  require 'optparse'
  require 'uri'
  require 'net/http'
  require 'json'

  source_couch_url = nil
  target_couch_url = nil
  databases = nil
  dry_run = false

  parser = OptionParser.new do |opts|
    opts.banner = "Usage: #{__FILE__} [options]"
    opts.separator ""
    opts.separator "Options:"

    opts.on("-s", "--source https://user:pass@host:port/",
            "Required. CouchDB Source URL from which data should be pulled.") do |s|
      source_couch_url = s
    end

    opts.on("-t", "--target https://user:pass@host:port/",
            "Required. CouchDB Target URL where data will be pushed.") do |t|
      target_couch_url = t
    end

    opts.on("-d", "--databases x,y,z",
            Array, "Required. Comma-separated list of database names to replicate.") do |list|
      databases = list
    end

    opts.on("-n", "--dry-run", "Don't make requests, just print them") do |d|
      dry_run = true
    end

    opts.on_tail("-h", "--help", "Show this message") do
      puts opts
      exit
    end
  end

  parser.parse! ARGV

  source_couch_uri = URI.parse source_couch_url
  target_couch_uri = URI.parse target_couch_url

  def post_uri(uri, post_params = {}, dry_run = false)
    if dry_run
      puts "Post: #{uri.to_s}"
      puts "Params: #{post_params.inspect}"
      return
    end

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true if uri.scheme == "https"
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE if uri.scheme == "https"

    request = Net::HTTP::Post.new(uri.request_uri)
    request.basic_auth uri.user, uri.password if uri.user and uri.password
    request.body = JSON.unparse post_params
    request.content_type = "application/json"
    response = http.start { |req| req.request(request) }

    if response && response.code == "200"
      puts "SUCCESS: #{response.body}"
    else
      puts "FAILURE: #{response.body}"
    end
  end

  puts "Replicating #{databases.join(', ')}"
  puts "From #{source_couch_uri.host} to #{target_couch_uri.host}"

  target_couch_uri.path = "/_replicate"

  databases.each do |database|
    puts "Replicating #{database}..."
    source_couch_uri.path = "/#{database}"
    post_uri target_couch_uri, {
      "source" => source_couch_uri.to_s,
      "target" => database
    }, dry_run
  end
  ```
* You can run the backup once as follows:
  ```
  /usr/bin/couchdb_replicate.rb \
    -s "https://username:password@source-couchdb:6984" \
    -t "https://username:password@target-couchdb:6984" \
    -d rapidftr_child_production,rapidftr_form_section_production,rapidftr_user_production,rapidftr_device_production,rapidftr_sessions_production,rapidftr_password_recovery_request_production,rapidftr_contact_information_production,rapidftr_suggested_field_production,rapidftr_role_production,rapidftr_mobile_db_key_production
  ```
  * For example, if you're backing up prod1.rapidftr.com to prod2.rapidftr.com,
  * `-s` is the source URL - e.g. `https://prod1-couchdb-username:prod1-couchdb-password@prod1.rapidftr.com:6984`
  * `-t` is the target URL - e.g. `https://prod2-couchdb-username:prod2-couchdb-password@prod2.rapidftr.com:6984`
* To run this automatically, we have configure a Cron job. Run:
  ```
  sudo crontab -e
  ```
* And in the resulting cron configuration, paste the following:
  ```
  */5 * * * * /usr/bin/couchdb_replicate.rb -s source-url -t target-url -d rapidftr_child_production,rapidftr_form_section_production,rapidftr_user_production,rapidftr_device_production,rapidftr_sessions_production,rapidftr_password_recovery_request_production,rapidftr_contact_information_production,rapidftr_suggested_field_production,rapidftr_role_production,rapidftr_mobile_db_key_production
  ```
* This will run the replication script for the specified databases **every 5 minutes**
* So even if one of the servers goes down, the second can be used straight away
