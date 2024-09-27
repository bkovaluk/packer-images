#!/bin/bash

set -euo pipefail

echo "Installing debugging tools..."

sudo yum install -y curl-minimal wget less vim

echo "Debugging tools installed successfully."
