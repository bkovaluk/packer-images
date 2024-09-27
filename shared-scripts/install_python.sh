#!/bin/bash

set -euo pipefail

echo "Installing Python 3 and pip..."

# Install Python 3 and pip
dnf install -y python3 python3-pip

# Verify installation
python3 --version
pip3 --version

echo "Python installation completed."
