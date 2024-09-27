packer {
  required_plugins {
    docker = {
      version = ">= 0.0.7"
      source  = "github.com/hashicorp/docker"
    }
  }
}

includes = ["../../variables/global.pkr.hcl", "variables.pkr.hcl"]

source "docker" "deploy" {
  image  = var.source_image
  commit = true
}

build {
  name    = "deploy-image"
  sources = ["source.docker.deploy"]

  provisioner "shell" {
    environment_vars = [
      "TERRAFORM_VERSION={{user `terraform_version`}}",
      "PACKER_VERSION={{user `packer_version`}}",
      "AWS_CLI_VERSION={{user `aws_cli_version`}}",
    ]
    scripts = [
      "scripts/install_aws_cli.sh",
      "scripts/install_terraform.sh",
      "scripts/install_packer.sh",
      "scripts/test_image.sh",
      "../../shared-scripts/cleanup.sh",
    ]
  }

  post-processor "docker-tag" {
    repository = "your-dockerhub-username/deploy-image"
    tag        = "latest"
  }
}
