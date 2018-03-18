#!/bin/bash

# install curl git
sudo apt update
sudo apt-get install -y curl git unzip jq maven

# install oracle-jdk
sudo /vagrant/files/apps/oracle-jdk/install-jdk8.sh

# create or install key for gitlab access
sudo mkdir /root/.ssh
SSHPRIVKEYFILENAME=id_rsa
SSHPUBKEYFILENAME=id_rsa.pub
SSHKEYPATH=/vagrant/files/keys/sensolyze-dev-client
if [ -f "$SSHKEYPATH/$SSHPRIVKEYFILENAME" ] && [ -f "$SSHKEYPATH/$SSHPUBKEYFILENAME" ]
then
  echo "ssh key $SSHKEYPATH/$SSHPRIVKEYFILENAME found"
  sudo cp $SSHKEYPATH/$SSHPRIVKEYFILENAME /home/vagrant/.ssh/id_rsa
  sudo cp $SSHKEYPATH/$SSHPUBKEYFILENAME  /home/vagrant/.ssh/id_rsa.pub
  sudo cp $SSHKEYPATH/$SSHPRIVKEYFILENAME /root/.ssh/id_rsa
  sudo cp $SSHKEYPATH/$SSHPUBKEYFILENAME  /root/.ssh/id_rsa.pub
else
  echo "ssh key /home/vagrant/.ssh/id_rsa created"
  sudo ssh-keygen -t rsa -C "developer@sensolyze.com" -b 4096 -N "" -f /home/vagrant/.ssh/id_rsa
  sudo mkdir $SSHKEYPATH
  sudo cp /home/vagrant/.ssh/id_rsa $SSHKEYPATH
  sudo cp /home/vagrant/.ssh/id_rsa.pub $SSHKEYPATH
  sudo cp /home/vagrant/.ssh/id_rsa /root/.ssh/id_rsa
  sudo cp /home/vagrant/.ssh/id_rsa.pub /root/.ssh/id_rsa.pub
fi
sudo chown vagrant /home/vagrant/.ssh/id_rsa
sudo chgrp vagrant /home/vagrant/.ssh/id_rsa
sudo chmod 600 /home/vagrant/.ssh/id_rsa
sudo chmod 600 /root/.ssh/id_rsa
sudo chown vagrant /home/vagrant/.ssh/id_rsa.pub
sudo chgrp vagrant /home/vagrant/.ssh/id_rsa.pub
sudo chmod 644 /home/vagrant/.ssh/id_rsa.pub
sudo chmod 644 /root/.ssh/id_rsa.pub

# add known host
/vagrant/files/bashshell/add-known-host.sh github.com

# clone thingsboard repo from sensolyze
SOURCE_GITHUB_DIR=/vagrant/source/github
if [ ! -d "$SOURCE_GITHUB_DIR" ]
then
  sudo mkdir -p "$SOURCE_GITHUB_DIR"
  sudo chown vagrant $SOURCE_GITHUB_DIR
  sudo chgrp vagrant $SOURCE_GITHUB_DIR
fi
if [ ! -d "$SOURCE_GITHUB_DIR/thingsboard" ]
then
  cd $SOURCE_GITHUB_DIR
  git clone git@github.com:sensolyze/thingsboard.git
fi

# set directory color
echo "LS_COLORS=$LS_COLORS:'di=0;93:' ; export LS_COLORS" >> /home/vagrant/.bashrc
echo "LS_COLORS=$LS_COLORS:'di=0;93:' ; export LS_COLORS" >> /root/.bashrc
