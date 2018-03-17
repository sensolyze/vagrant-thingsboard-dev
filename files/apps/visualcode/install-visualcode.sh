#!/bin/bash

# install curl
sudo apt update
sudo apt install -y curl apt-transport-https

# install visual code
sudo curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt-get update
sudo apt-get install -y code  # or code-insiders

# create desktop icon and menue item
DESKTOPFILENAME=visualcode.desktop
DESKTOPFILEPATH=/home/vagrant/Desktop
DESKTOPAPPFILEPATH=/home/vagrant/.local/share/applications
DESKTOPSOURCEPATH=/vagrant/files/apps/visualcode
ICONFILE=xamvs.png
APPTARGETPATH=/usr/share/code
sudo cp $DESKTOPSOURCEPATH/$ICONFILE $APPTARGETPATH/$ICONFILE
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
