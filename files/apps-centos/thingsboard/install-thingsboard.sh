#!/bin/bash

# install thingsboard
RPM_THINGSBOARD=thingsboard-1.4.rpm
wget https://github.com/thingsboard/thingsboard/releases/download/v1.4/$RPM_THINGSBOARD
sudo rpm -Uvh $RPM_THINGSBOARD
rm $RPM_THINGSBOARD

# --loadDemo option will load demo data: users, devices, assets, rules, widgets.
sudo /usr/share/thingsboard/bin/install/install.sh --loadDemo

# start service
sudo service thingsboard start
sleep 5
sudo service thingsboard status
