#!/bin/bash

set -euo pipefail

PACKER_VERSION="${PACKER_VERSION:-1.9.4}"
DOWNLOAD_URL="https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip"

echo "Installing Packer version $PACKER_VERSION..."

# Download Packer
wget -q $DOWNLOAD_URL -O /tmp/packer.zip

# Verify checksum (you can implement checksum verification here if desired)

# Unzip and install
unzip -o /tmp/packer.zip -d /usr/local/bin

# Verify installation
packer -version

echo "Packer installation completed."
