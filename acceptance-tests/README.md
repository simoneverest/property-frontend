Cucumber Template
===============

### Overview

This repository contains the front end tests.

### Running the tests in the vagrant virtual env

Navigate to the test repository

To run all the tests:

```
./run_tests.sh
```

Or to run a specific feature:

```
./run_tests.sh features/caseworker/first-registration.feature
```

Or to run a specific scenario(the 29 refers to the line in the future file that your scenario starts on):

```
./run_tests.sh features/caseworker/first-registration.feature:29
```
