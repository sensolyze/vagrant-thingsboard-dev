#!/bin/bash

SECRET_NAME=$1
SECRET_KEY=$2
SECRET_VALUE=$3

display_usage() {
  echo "Vault create new secret"
  echo "Usage: vault-create-secret.sh [secret-name] [secret-key] [secret-value]"
}

# if less than three arguments supplied, display usage
if [  $# -le 2 ]
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

# create secret
sudo curl -s \
    --header "X-Vault-Token: $VAULT_TOKEN" \
    --request POST \
    --data "{\"$SECRET_KEY\": \"$SECRET_VALUE\"}" \
    http://127.0.0.1:8200/v1/secret/$SECRET_NAME
