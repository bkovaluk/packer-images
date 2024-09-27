#!/bin/bash

set -euo pipefail

KUBECTL_VERSION="${KUBECTL_VERSION:-latest}"

echo "Installing kubectl version $KUBECTL_VERSION..."

if [ "$KUBECTL_VERSION" == "latest" ]; then
  # Get the latest version number
  KUBECTL_VERSION=$(curl -s https://dl.k8s.io/release/stable.txt)
fi

DOWNLOAD_URL="https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"

# Download kubectl
curl -LO "$DOWNLOAD_URL"

# Install kubectl
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl

# Verify installation
kubectl version --client

echo "kubectl installation completed."
