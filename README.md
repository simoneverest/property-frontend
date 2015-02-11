# Property-Frontend README

[![Build Status](http://54.72.23.130/job/property-title-api-unit-tests/badge/icon)](http://54.72.23.130/job/property-title-api-unit-tests/)

This is the frontend system which displays properties for the Land Registry.

It will display all properties regardless of whether they have a title or not and will display the properties most recent price paid info if it exists.

1. This application for development currently runs on the centos-dev-env and it needs access to the property-title-api to run.
   To run the application locally use the command `rails s` to start up a local webrick server.
   A good starting point to view the application would be :
   [BASE_URL]/properties/PL9%208TB.


2. It uses Ruby Version 2.1 and Rails Version 4.2.

3. As it's a frontend consuming the property-title-api it doesn't have a database to set up.

4. To run the functional tests use the command `bundle exec rake test`

5. To run the unit tests use the command `bundle exec rspec`

6. For the cucumber tests to pass these needs to be run in the virtual dev environment available in the Land Registry    repository and labelled 'centos-dev-env'.  This will make sure that all services needed for the acceptance tests are running.
