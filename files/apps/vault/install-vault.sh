#!/bin/bash

VAULTVERSION="0.9.5"
echo "vault version = $VAULTVERSION"

# define provisioning steps
sudo apt-get update

# install vault
TARGETFILE=/tmp/vault_${VAULTVERSION}_linux_amd64.zip
sudo wget https://releases.hashicorp.com/vault/${VAULTVERSION}/vault_${VAULTVERSION}_linux_amd64.zip -O $TARGETFILE
sudo unzip $TARGETFILE
sudo mv vault /usr/local/bin
sudo rm $TARGETFILE
echo "Hashicorp Vault installed"

# install deamon
sudo mkdir /usr/lib/systemd/system
sudo cp /vagrant/files/apps/vault/vault.service /usr/lib/systemd/system/vault.service
sudo cp /vagrant/files/apps/vault/vault.sh /etc/profile.d/vault.sh
sudo cp /vagrant/files/apps/vault/config.hcl /etc/config.hcl

# start deamon
sudo systemctl daemon-reload
sudo systemctl enable vault
sudo systemctl start vault

# init vault
VAULT_DIR=/vagrant/files/apps/vault/secret-data
VAULT_INIT_DIR=$VAULT_DIR/init
VAULT_INIT_FILE=vault-init.json
if [ -d "$VAULT_DIR" ]
then
  echo "Vault data under $VAULT_DIR found"
else
  echo "Vault data under $VAULT_DIR not found"
  sleep 5
  sudo curl -s \
       --request POST \
       --data '{"secret_shares": 1, "secret_threshold": 1}' \
       http://127.0.0.1:8200/v1/sys/init > /tmp/$VAULT_INIT_FILE
  sudo mkdir $VAULT_INIT_DIR
  sudo cp /tmp/$VAULT_INIT_FILE $VAULT_INIT_DIR/$VAULT_INIT_FILE
  sudo chown -R vagrant $VAULT_INIT_DIR
  sudo chgrp -R vagrant $VAULT_INIT_DIR
  echo "Vault data under $VAULT_DIR created"
fi

# export root_token
VAULT_TOKEN=`cat $VAULT_INIT_DIR/$VAULT_INIT_FILE | jq -r '.root_token'`
sudo echo "" >> /etc/profile.d/vault.sh
sudo echo "# export VAULT_TOKEN" >> /etc/profile.d/vault.sh
sudo echo "export VAULT_TOKEN=$VAULT_TOKEN" >> /etc/profile.d/vault.sh
echo "VAULT_TOKEN = $VAULT_TOKEN"

# export vault_key
VAULT_KEY=`cat $VAULT_INIT_DIR/$VAULT_INIT_FILE | jq -r '.keys_base64[0]'`
sudo echo "" >> /etc/profile.d/vault.sh
sudo echo "# export VAULT_KEY" >> /etc/profile.d/vault.sh
sudo echo "export VAULT_KEY=$VAULT_KEY" >> /etc/profile.d/vault.sh
echo "VAULT_KEY = $VAULT_KEY"

# copy scripts
sudo mkdir /home/vagrant/vault
sudo cp /vagrant/files/apps/vault/vault-*.sh /home/vagrant/vault
sudo chown -R vagrant /home/vagrant/vault
sudo chgrp -R vagrant /home/vagrant/vault
echo "Vault scripts copied"
