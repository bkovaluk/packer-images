#!/bin/bash

set -euo pipefail

echo "Installing debugging tools..."

dnf install -y curl-minimal wget less vim unzip

echo "Debugging tools installed successfully."
