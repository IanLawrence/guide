# Running tests

**WARNING:** Before running the below commands, ensure sunspot is started:

    bundle exec rake sunspot:solr:start

* To run unit tests:
`RAILS_ENV=test bundle exec rake spec`
* To run cucumber headless tests:
`RAILS_ENV=cucumber bundle exec rake cucumber:headless`
* To run cucumber browser tests:
`RAILS_ENV=cucumber bundle exec rake cucumber:browser`

Note that the Cucumber browser tests require the [Firefox web browser](http://www.mozilla.org/en-US/firefox/) to be installed.
