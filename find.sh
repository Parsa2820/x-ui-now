#!/bin/bash

set -e

if [ ! -d .terraform ]; then
    terraform init
fi

while :
do
    terraform apply --var-file variables.tfvars

    if ansible vpn_server -m ping
    then
        break
    fi

    terraform destroy --var-file variables.tfvars
done

