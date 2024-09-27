#!/bin/bash

# Clean up package manager caches and temporary files

echo "Cleaning up..."

# For Amazon Linux 2023 using DNF
dnf clean all
rm -rf /var/cache/dnf /tmp/* /var/tmp/*

echo "Cleanup completed."
