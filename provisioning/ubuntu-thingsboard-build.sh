#!/bin/bash

# install curl git
sudo apt update
sudo apt-get install -y curl git unzip jq maven

# install oracle-jdk
sudo /vagrant/files/apps/oracle-jdk/install-jdk8.sh

# init keys
/vagrant/files/keys/init-key.sh

# add known host
/vagrant/files/bashshell/add-known-host.sh github.com

# clone thingsboard
sudo /vagrant/files/apps/thingsboard/clone-thingsboard.sh

# set directory color
echo "LS_COLORS=$LS_COLORS:'di=0;93:' ; export LS_COLORS" >> /home/vagrant/.bashrc
echo "LS_COLORS=$LS_COLORS:'di=0;93:' ; export LS_COLORS" >> /root/.bashrc
