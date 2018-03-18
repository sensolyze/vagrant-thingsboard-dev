#!/bin/bash

# create or install key for gitlab access
sudo chown -R vagrant /home/vagrant/.ssh
sudo chgrp -R vagrant /home/vagrant/.ssh
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
