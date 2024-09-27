#!/bin/bash

# Test the installed software

set -e  # Exit immediately if a command exits with a non-zero status

# Test AWS CLI
echo "Testing AWS CLI"
aws --version

# Test Terraform
echo "Testing Terraform"
terraform -version

# Test Packer
echo "Testing Packer"
packer -version

echo "All tests passed!"
