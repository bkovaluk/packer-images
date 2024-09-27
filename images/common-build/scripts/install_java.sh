#!/bin/bash

set -euo pipefail

echo "Installing Amazon Corretto 11..."

# Import the public key and install Corretto 11
curl -sSL https://yum.corretto.aws/corretto.key | rpm --import -
curl -sSL https://yum.corretto.aws/corretto.repo | tee /etc/yum.repos.d/corretto.repo

dnf install -y java-11-amazon-corretto

# Verify installation
java -version

echo "Java installation completed."
