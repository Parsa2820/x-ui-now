#!/bin/bash

set -e

if [ ! -d .terraform ]; then
    terraform init
fi

terraform apply --var-file variables.tfvars

ansible-playbook x-ui-install.yml