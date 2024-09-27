#!/bin/bash

set -euo pipefail

IMAGES=("common-build" "common-deploy")

for IMAGE_NAME in "${IMAGES[@]}"; do
  echo "Building image: $IMAGE_NAME"
  ./build_image.sh -i "$IMAGE_NAME"
done

echo "All images have been built successfully."
