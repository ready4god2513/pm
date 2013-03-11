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