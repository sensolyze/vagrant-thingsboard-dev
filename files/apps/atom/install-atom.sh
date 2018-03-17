#!/bin/bash

# install atom
sudo add-apt-repository ppa:webupd8team/atom
sudo apt update
sudo apt install -y atom

# create desktop icon and menue item
DESKTOPFILENAME=atom.desktop
DESKTOPFILEPATH=/home/vagrant/Desktop
DESKTOPAPPFILEPATH=/home/vagrant/.local/share/applications
DESKTOPSOURCEPATH=/vagrant/files/apps/atom
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
