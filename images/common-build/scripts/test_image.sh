#!/bin/bash

set -euo pipefail

echo "Testing installed tools..."

echo "Node.js version:"
node -v

echo "npm version:"
npm -v

echo "Python version:"
python3 --version

echo "pip version:"
pip3 --version

echo "Java version:"
java -version

echo "All tools are installed correctly."
