#!/bin/bash

# install thingsboard
wget https://github.com/thingsboard/thingsboard/releases/download/v1.4/thingsboard-1.4.deb
sudo dpkg -i thingsboard-1.4.deb

# --loadDemo option will load demo data: users, devices, assets, rules, widgets.
sudo /usr/share/thingsboard/bin/install/install.sh --loadDemo

# start service
sudo service thingsboard start
sleep 5
sudo service thingsboard status
