#!/bin/bash

# Ubuntu provisioning file
sudo apt update

# install oracle jdk
sudo /vagrant/files/apps/oracle-jdk/install-jdk8.sh

# install cassandra
# sudo /vagrant/files/apps/cassandra/install-cassandra.sh

# install thingsboard
sudo /vagrant/files/apps/thingsboard/install-thingsboard.sh
