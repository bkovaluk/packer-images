#!/bin/bash

set -euo pipefail

# Node.js version passed as an environment variable or default to 14.x
NODE_VERSION="${NODE_VERSION:-22.x}"

echo "Installing Node.js version $NODE_VERSION..."

# Add NodeSource repository
curl -fsSL https://rpm.nodesource.com/setup_${NODE_VERSION} | bash -

# Install Node.js and npm
dnf install -y nodejs

# Verify installation
node -v
npm -v

echo "Node.js installation completed."
