#!/bin/bash

set -euo pipefail

echo "Installing debugging tools..."

# Install common utilities
yum install -y curl wget less vim

echo "Debugging tools installed successfully."
