#!/bin/bash

display_usage() {
  echo "Vault unseal"
  echo -e "Usage: vault-unseal.sh"
}

# check whether user had supplied -h. If yes display usage
if [ "$1" == "-h" ]
then
	display_usage
	exit 0
fi

# unseal vault
sudo curl -s \
    --request POST \
    --data "{\"key\": \"$VAULT_KEY\"}" \
    http://127.0.0.1:8200/v1/sys/unseal | jq '.'
