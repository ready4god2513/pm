# NomadPM

Pivotal Tracker Project Board

## Pivotal Tracker API
NomadPM currently uses [Version 3 of the Tracker API](https://www.pivotaltracker.com/help/api?version=v3).  This decision was made for 2 reasons-
1. Version 4 is in alpha
2. The webhooks API only supports version 3

## User Account
Currently the user account is hard-coded in the config to use an account that has access to all of Bethel's projects.  In the next release
we should change this to allow each instance (subdomains, etc) to have a database config which would setup the API keys.  This will
allow this project to be used by many organizations.

## Heroku

### First Time Setup

- Make sure you are a "Collaborator" on all applicable applications (stages) in Heroku.  (Each stage of the project is a separate application in Heroku.)

- Install the Heroku toolbelt (if needed).  See https://devcenter.heroku.com/articles/quickstart

- Login to Heroku on your local machine

        heroku login

- Add stages

         git remote add alpha git@heroku.com:travel-alpha.git
         git remote add beta git@heroku.com:travel-beta.git
         etc...
    
   
    Or, automatically with
 
         rake all heroku:remotes

    Or, by stage
 
         rake beta heroku:remotes

### Deploying

Deploy with a custom deployment strategy that will
     
- Put site in maintenance mode
- Push code to Heroku
- Rebuild the database in alpha/beta or db:migrate otherwise
- Take site out of maintenance mode

         rake [stage] deploy

### Other Tasks (with heroku_san)

    rake [stage] deploy:force
    rake [stage] restart
    rake [stage] logs
    rake [stage] logs:tail
    rake [stage] migrate
    rake [stage] shell
    rake [stage] heroku:maintenance_on
    rake [stage] heroku:maintenance_off


See https://github.com/fastestforward/heroku_san for more information.


### Add-ons & Configuration

*NOTE:  You will need to be logged in as the webdept@ibethel.org user to update addons or create a new stage*

Add-ons and settings should be added to the heroku_san configuration file so that new (and existing) stages will be configured correctly.

     config/heroku.yml

The configuration can be then updated with

     rake [stage] heroku:config
     
and/or

     rake [stage] heroku:addons
     
     
Also, new stages (applications) can be create with 

     rake [stage] heroku:create


## Seed Data

Seed data should be created so that any feature of the application can be easily tested.

Seed files are located in db/fixtures

The goal is to have one rake task that can take a snapshot of the db, but that's not ready yet.

## Dependencies and Requirements

* Ruby 1.9.3.
* Rails 3.2.x
* Postgres?


### Dependencies

1. For the `mini_magick` gem, make sure ImageMagick is installed:

    sudo apt-get install imagemagick

## Development

### Development DB Setup

The DB must be reset and seeded after schema changes

     bundle exec rake db:rebuild

## Running Tests

     rspec spec

or

     bundle exec rspec spec

NOTE:  If the tests fail, be sure to reset the db and clone it to the test db.  (See:  Development DB Setup, above.)

ALSO NOTE:  Sometimes tests run in the full browser environment (with the ":js" option) may leave the db in a strange state if they fail in an unexpected way.  This can happen when the test fails and the transaction is rolled back before the page is completely loaded (and the page load causes a db modification).  Clone the db to fix:

     bundle exec rake db:test:clone
