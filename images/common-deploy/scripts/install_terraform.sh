#!/bin/bash

# Install Terraform

# Ensure that TERRAFORM_VERSION is set
if [ -z "$TERRAFORM_VERSION" ]; then
  echo "TERRAFORM_VERSION is not set. Using default version 1.5.6"
  TERRAFORM_VERSION="1.5.6"
fi

echo "Installing Terraform version $TERRAFORM_VERSION"

wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin/
rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip
