#!/bin/bash

# Install Node.js and npm

# Ensure that NODE_VERSION is set
if [ -z "$NODE_VERSION" ]; then
  echo "NODE_VERSION is not set. Using default version 14.x"
  NODE_VERSION="14.x"
fi

echo "Installing Node.js version $NODE_VERSION"

# Install Node.js
curl -fsSL https://rpm.nodesource.com/setup_$NODE_VERSION | bash -
dnf install -y nodejs
