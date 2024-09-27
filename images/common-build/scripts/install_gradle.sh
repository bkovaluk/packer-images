#!/bin/bash

# Install Gradle

# Ensure that GRADLE_VERSION is set
if [ -z "$GRADLE_VERSION" ]; then
  echo "GRADLE_VERSION is not set. Using default version 7.5.1"
  GRADLE_VERSION="7.5.1"
fi

echo "Installing Gradle version $GRADLE_VERSION"

wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -P /tmp
unzip -d /opt/gradle /tmp/gradle-${GRADLE_VERSION}-bin.zip
ln -s /opt/gradle/gradle-${GRADLE_VERSION} /opt/gradle/latest
echo 'export PATH=$PATH:/opt/gradle/latest/bin' >> /etc/profile.d/gradle.sh
chmod +x /etc/profile.d/gradle.sh
source /etc/profile.d/gradle.sh

# Clean up
rm -f /tmp/gradle-${GRADLE_VERSION}-bin.zip
