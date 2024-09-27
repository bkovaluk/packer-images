#!/bin/bash

set -euo pipefail

usage() {
  echo "Usage: $0 -i image_name [-v variables_file] [-p packer_file] [-- packer_options]"
  echo "  -i image_name       Specify the image name (required). Example: common-deploy, common-build"
  echo "  -v variables_file   Specify the variables file (default: variables.pkr.hcl)"
  echo "  -p packer_file      Specify the Packer template file (default: image_name.pkr.hcl)"
  echo "  -h                  Show this help message"
  echo
  echo "Example:"
  echo "  $0 -i common-build -v custom_vars.pkr.hcl -p custom_template.pkr.hcl -- -var 'node_version=16.x'"
  exit 1
}

parse_args() {
  IMAGE_NAME=""
  VARIABLES_FILE="variables.pkr.hcl"
  PACKER_FILE=""

  while getopts ":i:v:p:h" opt; do
    case $opt in
      i)
        IMAGE_NAME="$OPTARG"
        ;;
      v)
        VARIABLES_FILE="$OPTARG"
        ;;
      p)
        PACKER_FILE="$OPTARG"
        ;;
      h)
        usage
        ;;
      \?)
        echo "Invalid option: -$OPTARG"
        usage
        ;;
      :)
        echo "Option -$OPTARG requires an argument."
        usage
        ;;
    esac
  done

  shift $((OPTIND -1))
  PACKER_OPTIONS="$@"

  if [ -z "$IMAGE_NAME" ]; then
    echo "Error: Image name is required."
    usage
  fi

  if [ -z "$PACKER_FILE" ]; then
    PACKER_FILE="${IMAGE_NAME}.pkr.hcl"
  fi
}

check_dependencies() {
  if ! command -v packer &> /dev/null; then
    echo "Error: Packer is not installed. Please install Packer to continue."
    exit 1
  fi
}

validate_inputs() {
  IMAGE_DIR="images/$IMAGE_NAME"

  if [ ! -d "$IMAGE_DIR" ]; then
    echo "Error: Image directory '$IMAGE_DIR' does not exist."
    exit 1
  fi

  if [ ! -f "$IMAGE_DIR/$PACKER_FILE" ]; then
    echo "Error: Packer template file '$PACKER_FILE' not found in '$IMAGE_DIR'."
    exit 1
  fi

  if [ ! -f "$IMAGE_DIR/$VARIABLES_FILE" ]; then
    echo "Error: Variables file '$VARIABLES_FILE' not found in '$IMAGE_DIR'."
    exit 1
  fi
}

build_image() {
  echo "Building image '$IMAGE_NAME' using Packer template '$PACKER_FILE' and variables file '$VARIABLES_FILE'."

  cd "$IMAGE_DIR"

  packer build -var-file="$VARIABLES_FILE" $PACKER_OPTIONS "$PACKER_FILE"
}

main() {
  parse_args "$@"
  check_dependencies
  validate_inputs
  build_image
}

main "$@"
