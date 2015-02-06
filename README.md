# Property-Frontend README

1. This is the frontend system which displays properties for the Land Registry.

2. It will display all properties regardless of whether they have a title or not and will display the properties most recent ...price paid info if it exists.

3. This application for development currently runs on the centos-dev-env and it needs access to the property-title-api to run.

4. It uses Ruby Version 2.1 and Rails Version 4.2.

5. As it's a frontend consuming the property-title-api it doesn't have a database to set up.

6. To run all tests for the frontend run 'bundle exec rake', for the cucumber tests to pass these needs to be run in the ...virtual dev environment available in the Land Registry repository and labelled 'centos-dev-env'.  This will make sure that ...all services needed for the acceptance tests are running.
