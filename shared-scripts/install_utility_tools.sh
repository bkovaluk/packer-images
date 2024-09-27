#!/bin/bash

set -euo pipefail

echo "Installing debugging tools..."

# Define mutually exclusive package groups
FULLY_FEATURED=("curl" "wget" "less" "vim")
MINIMAL_FEATURED=("curl-minimal" "wget" "less" "vim")

# Function to check if a package is installed
is_installed() {
    rpm -q "$1" &> /dev/null
}

# PACKAGE_GROUP=FULLY_FEATURED
PACKAGE_GROUP=MINIMAL_FEATURED

echo "Using package group: ${PACKAGE_GROUP}"

# Iterate over each package and install if not present
for pkg in "${!PACKAGE_GROUP}"; do
    if is_installed "${PACKAGE_GROUP[$pkg]}"; then
        echo "✔️  ${PACKAGE_GROUP[$pkg]} is already installed."
    else
        echo "🔍  ${PACKAGE_GROUP[$pkg]} is not installed. Installing..."
        sudo yum install -y "${PACKAGE_GROUP[$pkg]}"
        echo "✔️  ${PACKAGE_GROUP[$pkg]} installed successfully."
    fi
done

echo "All debugging tools are installed and up-to-date."
