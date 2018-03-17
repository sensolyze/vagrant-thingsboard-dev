#!/bin/bash

# define provisioning steps
sudo apt-get update

# Installing @angular/cli globally
sudo npm install --unsafe-perm --verbose -g @angular/cli

# Ubuntu provisioning file
ANGULARDIR="/home/vagrant/angular"

# copy start script
sudo mkdir $ANGULARDIR
sudo cp /vagrant/files/apps/angular/example/* $ANGULARDIR
sudo chown -R vagrant $ANGULARDIR
sudo chgrp -R vagrant $ANGULARDIR
