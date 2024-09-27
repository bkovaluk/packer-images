#!/bin/bash

set -euo pipefail

echo "Updating system packages..."

# Update all installed packages to their latest versions
yum update -y

echo "System packages updated successfully."
