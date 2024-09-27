#!/bin/bash

set -euo pipefail

echo "Installing AWS CLI version 2..."

# Download the AWS CLI bundle
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"

# Unzip the installer
unzip /tmp/awscliv2.zip -d /tmp

# Run the installer
/tmp/aws/install

# Verify installation
aws --version

echo "AWS CLI installation completed."
