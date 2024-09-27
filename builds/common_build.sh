#!/bin/bash

set -e

cd images/common-build

packer build -var-file=variables.pkr.hcl common_build.pkr.hcl
