#!/bin/bash

SECRET_NAME=$1

display_usage() {
  echo "Vault get secret"
  echo -e "Usage: vault-get-secret.sh [secret-name]"
}

# if less than two arguments supplied, display usage
if [  $# -eq 0 ]
then
	display_usage
	exit 1
fi

# check whether user had supplied -h or --help . If yes display usage
if [ "$1" == "-h" ]
then
	display_usage
	exit 0
fi

# get secret
sudo curl -s \
    --header "X-Vault-Token: $VAULT_TOKEN" \
    http://127.0.0.1:8200/v1/secret/$SECRET_NAME | jq '.'
