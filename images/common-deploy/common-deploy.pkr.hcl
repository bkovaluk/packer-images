packer {
  required_plugins {
    docker = {
      version = ">= 0.0.7"
      source  = "github.com/hashicorp/docker"
    }
  }
}

includes = ["../../variables/global.pkr.hcl", "variables.pkr.hcl"]

source "docker" "common-deploy" {
  image  = var.source_image
  commit = true
}

build {
  name    = "common-deploy-image"
  sources = ["source.docker.common-deploy"]

  provisioner "shell" {
    environment_vars = [
      "TERRAFORM_VERSION={{user `terraform_version`}}",
      "PACKER_VERSION={{user `packer_version`}}",
      "AWS_CLI_VERSION={{user `aws_cli_version`}}",
      "KUBECTL_VERSION"={{user `kubectl_version`}}
    ]
    scripts = [
      "../../shared-scripts/update_system.sh",
      "../../shared-scripts/install_utility_tools.sh",
      "scripts/install_aws_cli.sh",
      "scripts/install_terraform.sh",
      "scripts/install_packer.sh",
      "scripts/install_kubectl.sh",
      "../../shared-scripts/install_python.sh",
      "scripts/test_image.sh",
      "../../shared-scripts/cleanup.sh",
    ]
  }

  post-processor "docker-tag" {
    repository = "${var.dockerhub_username}/common-deploy-image"
    tag        = "latest"
  }
}
