#!/bin/bash

cd images/common-build

packer build -var-file=variables.pkr.hcl common_build.pkr.hcl
