#!/bin/bash

set -euo pipefail

GRADLE_VERSION="${GRADLE_VERSION:-7.5.1}"

echo "Installing Gradle version $GRADLE_VERSION..."

dnf install gradle $GRADLE_VERSION

# Verify installation
gradle -v

echo "Gradle installation completed."
