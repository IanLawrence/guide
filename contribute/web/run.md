# Initial Seeding and Running

## Make sure

* You have the RapidFTR codebase
* You have installed Ruby, CouchDB and all other necessary software (follow the instructions for OSX, Windows or Linux in the wiki)
* You have run `bundle install` to install all the gems

## Start CouchDB:

On the command line, execute the command `couchdb`. This should start couchdb.

### If you have not yet created admin username/password for CouchDB:

* Either run:
`bundle exec rake db:create_couch_sysadmin[<desired-username>,<desired-password>]`

(OR)

* Go to: `localhost:5984/_utils` (assuming that's where your CouchDB is running)
  * On the right bottom you should see "Welcome to Admin Party! Every one is admin. Fix this!". Click on "Fix this!" to create your first admin user.
  * And choose what username and password you want to use.
  * If you instead see the "Sign-In" link at the bottom right, that means the username and password is already configured for your couchDB. Find out what it is!

### Once you have a username/password for CouchDB:

Run:

`bundle exec rake db:create_couchdb_yml[<username>,<password>]`

That will create the CouchDB configuration file at `config/couchdb.yml`. You can check if the username and password is stored in this file (by opening this file in a text editor).

If you encounter the following error:

```
dlopen(.../.rvm/rubies/ruby-1.9.3-p392/lib/ruby/1.9.1/x86_64-darwin13.0.0/readline.bundle, 9): Library not loaded: @@HOMEBREW_PREFIX@@/opt/readline/lib/libreadline.6.2.dylib
  Referenced from: .../.rvm/rubies/ruby-1.9.3-p392/lib/ruby/1.9.1/x86_64-darwin13.0.0/readline.bundle
  Reason: image not found - .../.rvm/rubies/ruby-1.9.3-p392/lib/ruby/1.9.1/x86_64-darwin13.0.0/readline.bundle
```

Try running the commands `rvm pkg install readline` and `brew link readline`.

## Seeding the Database

* Run:
`bundle exec rake app:reset`
This will add all the seed data (users and form sections)

## Running the server:

* Like any Rails project, run:
`bundle exec rails server`

* To start Solr (required for searching), run:
`bundle exec rake sunspot:clean_start`

* To start the background scheduler, run:
`bundle exec rake scheduler:restart`

Most of the time, you won't need the Scheduler (unless you're doing some work on the Scheduler). So its enough if you just start Solr, and henceforth just use `bundle exec rails server` normally as in any rails project.

## Accessing the server:

* Open your browser and go to `http://localhost:3000`
* Here are a list of pre-configured usernames and passwords that you can use:
  * `rapidftr/rapidftr` (administrator account, can only administer the system, cannot view any data)
  * `field_admin/field_admin` (can view and export data, cannot collect or edit the data)
  * `field_worker/field_worker` (can only collect data)
