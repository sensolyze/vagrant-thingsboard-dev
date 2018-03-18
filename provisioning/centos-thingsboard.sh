#!/bin/bash

# Centos provisioning file
sudo yum -y update

# install oracle jdk
sudo /vagrant/files/apps-centos/oracle-jdk/install-jdk8.sh

# install cassandra
# sudo /vagrant/files/apps-centos/cassandra/install-cassandra.sh

# install thingsboard
sudo /vagrant/files/apps-centos/thingsboard/install-thingsboard.sh
