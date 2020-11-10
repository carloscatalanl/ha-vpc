#!/bin/bash 

## SSH Keys

# Create folders and ssh keys
mkdir -p private/ssh
ssh-keygen -f $PWD/private/ssh/key_access -N ""

# Change name and privileges
mv $PWD/private/ssh/key_access $PWD/private/ssh/key_access.pem
chmod 400 $PWD/private/ssh/key_access.pem

# Copy to instances module
cp -a $PWD/private $PWD/modules/instances/

## Terraform 
terraform init
terraform apply -auto-approve