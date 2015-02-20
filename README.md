Property-Frontend README
===============

[![Build Status](http://54.72.23.130/job/property-frontend-unit-tests/badge/icon)](http://54.72.23.130/job/property-frontend-unit-tests/)

This is the frontend system which displays properties for the Land Registry.

It will display all properties regardless of whether they have a title or not and will display the properties most recent price paid info if it exists.

1. This application for development currently runs on the centos-dev-env and it needs access to the property-api to run.
   To run the application locally use the command `rails s` to start up a local webrick server.
   A good starting point to view the application would be :
   [BASE_URL]/properties/PL9%208TB.


2. It uses Ruby Version 2.1 and Rails Version 4.2.

3. As it's a frontend consuming the property-api it doesn't have a database to set up.

4. To run the functional tests use the command `bundle exec rake test`

5. To run the unit tests use the command `bundle exec rspec`

6. For the cucumber tests to pass these needs to be run in the virtual dev environment available in the Land Registry    repository and labelled 'centos-dev-env'.  This will make sure that all services needed for the acceptance tests are running.

### Running the app on your local VM

The app runs by default with production settings. For assets to display, please run: `bundle exec rake assets:precompile`. 

### Acceptance Tests

Navigate to the acceptance test repository

```
cd acceptance-tests/
```

To run all the tests:

```
./run_tests.sh
```

Or to run a specific feature:

```
./run_tests.sh features/property_frontend.feature
```

Or to run a specific scenario(the 29 refers to the line in the future file that your scenario starts on):

```
./run_tests.sh features/property_frontend.feature:18
```
