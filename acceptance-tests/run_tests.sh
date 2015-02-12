#!/bin/bash

set -e

rm -rf diff2*
rm -rf tmpimg*
rm -rf sshot*

RAILS_ENV=test
bundle install --without nothing
#TODO: for camille, why does this not work on Dog's machine
#why have we needed to specify that all groups should be installed?

if [ -z "$1" ]
 then
   cucumber --tags ~@wip --tags ~@removed --tags ~@performance_test
else
   cucumber -r features $1
fi
