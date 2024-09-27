#!/bin/bash

# Install Packer

# Ensure that PACKER_VERSION is set
if [ -z "$PACKER_VERSION" ]; then
  echo "PACKER_VERSION is not set. Using default version 1.9.2"
  PACKER_VERSION="1.9.2"
fi

echo "Installing Packer version $PACKER_VERSION"

wget https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip
unzip packer_${PACKER_VERSION}_linux_amd64.zip -d /usr/local/bin/
rm packer_${PACKER_VERSION}_linux_amd64.zip
