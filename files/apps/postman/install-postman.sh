#!/bin/bash

# define provisioning steps
sudo apt-get update

# install postman
wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
sudo tar -xzf postman.tar.gz -C /opt
rm postman.tar.gz
sudo ln -s /opt/Postman/Postman /usr/bin/postman

# create desktop icon and menue item
DESKTOPFILENAME=postman.desktop
DESKTOPFILEPATH=/home/vagrant/Desktop
DESKTOPAPPFILEPATH=/home/vagrant/.local/share/applications
DESKTOPSOURCEPATH=/vagrant/files/apps/postman
sudo cp $DESKTOPSOURCEPATH/$DESKTOPFILENAME $DESKTOPFILEPATH/$DESKTOPFILENAME
sudo chmod 0744 $DESKTOPFILEPATH/$DESKTOPFILENAME
sudo chown vagrant $DESKTOPFILEPATH/$DESKTOPFILENAME
sudo chgrp vagrant $DESKTOPFILEPATH/$DESKTOPFILENAME

### Check if a directory does not exist ###
if [ ! -d $DESKTOPAPPFILEPATH ]
then
  sudo mkdir $DESKTOPAPPFILEPATH
  sudo chmod -R 0775 $DESKTOPAPPFILEPATH
fi

sudo cp $DESKTOPSOURCEPATH/$DESKTOPFILENAME $DESKTOPAPPFILEPATH/$DESKTOPFILENAME
sudo chmod 0744 $DESKTOPAPPFILEPATH/$DESKTOPFILENAME
sudo chown vagrant $DESKTOPAPPFILEPATH/$DESKTOPFILENAME
sudo chgrp vagrant $DESKTOPAPPFILEPATH/$DESKTOPFILENAME
