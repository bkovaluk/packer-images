// images/common-deploy/common-deploy.pkr.hcl

variable "source_image" {
  description = "The base Docker image to build upon."
  type        = string
  default     = "amazonlinux:latest"
}

variable "terraform_version" {
  type    = string
}

variable "packer_version" {
  type    = string
}

variable "kubectl_version" {
  type    = string
}

variable "dockerhub_username" {
  type      = string
  sensitive = true
  default   = "username"
}

packer {
  required_plugins {
    docker = {
      version = ">= 1.0.10"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "common-deploy" {
  image  = var.source_image
  commit = true
}

build {
  name    = "common-deploy-image"
  sources = ["source.docker.common-deploy"]

  provisioner "shell" {
    environment_vars = [
      "TERRAFORM_VERSION=${var.terraform_version}",
      "PACKER_VERSION=${var.packer_version}",
      "KUBECTL_VERSION=${var.kubectl_version}",
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
    tag        = ["latest"]
  }
}
