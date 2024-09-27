#!/bin/bash

set -euo pipefail

echo "Installing Amazon Corretto..."

JAVA_PACKAGE="${JAVA_PACKAGE:-java-21-amazon-corretto}"

dnf install -y "${JAVA_PACKAGE}"

# Verify installation
java -version

echo "Java installation completed."
