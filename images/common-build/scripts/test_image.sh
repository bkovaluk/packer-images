#!/bin/bash

# Test the installed software

set -e  # Exit immediately if a command exits with a non-zero status

# Test Node.js and npm
echo "Testing Node.js and npm"
node -v
npm -v

# Test Python 3 and pip
echo "Testing Python 3 and pip"
python3 --version
pip3 --version

# Test Java
echo "Testing Java"
java -version

# Test Gradle
echo "Testing Gradle"
gradle -v

echo "All tests passed!"
