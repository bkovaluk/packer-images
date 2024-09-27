#!/bin/bash

# Install AWS CLI

# Ensure that AWS_CLI_VERSION is set
if [ -z "$AWS_CLI_VERSION" ]; then
  echo "AWS_CLI_VERSION is not set. Using default version 2.13.8"
  AWS_CLI_VERSION="2.13.8"
fi

echo "Installing AWS CLI version $AWS_CLI_VERSION"

# Download and install AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${AWS_CLI_VERSION}.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install
rm -rf aws awscliv2.zip
