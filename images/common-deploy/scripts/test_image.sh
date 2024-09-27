#!/bin/bash

set -euo pipefail

echo "Testing installed tools..."

echo "Python version:"
python3 --version

echo "pip version:"
pip3 --version

echo "AWS CLI version:"
aws --version

echo "Terraform version:"
terraform -version

echo "Packer version:"
packer -version

echo "kubectl version:"
kubectl version --client

echo "All tools are installed correctly."
