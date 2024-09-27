#!/bin/bash

set -euo pipefail

TERRAFORM_VERSION="${TERRAFORM_VERSION:-1.5.7}"
DOWNLOAD_URL="https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"

echo "Installing Terraform version $TERRAFORM_VERSION..."

# Download Terraform
wget -q $DOWNLOAD_URL -O /tmp/terraform.zip

# Verify checksum (you can implement checksum verification here if desired)

# Unzip and install
unzip -o /tmp/terraform.zip -d /usr/local/bin

# Verify installation
terraform -version

echo "Terraform installation completed."
