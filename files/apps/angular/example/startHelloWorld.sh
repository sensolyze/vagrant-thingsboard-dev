#!/bin/bash

# Ubuntu provisioning file
ANGULARDIR="/home/vagrant/angular"

# create hello world
cd $ANGULARDIR/angular-hello-world
ng serve --host 0.0.0.0 &
