#!/bin/bash

# Install Java

# Ensure that JAVA_PACKAGE is set
if [ -z "$JAVA_PACKAGE" ]; then
  echo "JAVA_PACKAGE is not set. Using default java-11-amazon-corretto"
  JAVA_PACKAGE="java-11-amazon-corretto"
fi

echo "Installing Java package $JAVA_PACKAGE"

dnf install -y $JAVA_PACKAGE
