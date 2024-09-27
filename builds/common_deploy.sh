#!/bin/bash

set -e

cd images/deploy

packer build -var-file=variables.pkr.hcl deploy_image.pkr.hcl
