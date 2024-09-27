#!/bin/bash

set -euo pipefail

GRADLE_VERSION="${GRADLE_VERSION:-7.5.1}"
DOWNLOAD_URL="https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip"
CHECKSUM_URL="${DOWNLOAD_URL}.sha256"

echo "Installing Gradle version $GRADLE_VERSION..."

# Download Gradle and checksum
wget -q $DOWNLOAD_URL -P /tmp
wget -q $CHECKSUM_URL -P /tmp

# Verify checksum
(cd /tmp && sha256sum -c gradle-${GRADLE_VERSION}-bin.zip.sha256)

# Extract Gradle
unzip -d /opt/gradle /tmp/gradle-${GRADLE_VERSION}-bin.zip

# Create symbolic link
ln -s /opt/gradle/gradle-${GRADLE_VERSION} /opt/gradle/latest

# Add Gradle to PATH
echo "export PATH=\$PATH:/opt/gradle/latest/bin" >> /etc/profile.d/gradle.sh

# Source the profile script to update PATH
source /etc/profile.d/gradle.sh

# Verify installation
gradle -v

echo "Gradle installation completed."
