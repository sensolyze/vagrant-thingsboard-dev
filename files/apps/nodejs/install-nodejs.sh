#!/bin/bash

# define provisioning steps
sudo apt-get update

# install node nodejs
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential
