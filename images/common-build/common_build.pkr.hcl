packer {
  required_plugins {
    docker = {
      version = ">= 0.0.7"
      source  = "github.com/hashicorp/docker"
    }
  }
}

includes = ["../../variables/global.pkr.hcl", "variables.pkr.hcl"]

source "docker" "common_build" {
  image  = var.source_image
  commit = true
}

build {
  name    = "common-build-image"
  sources = ["source.docker.common_build"]

  provisioner "shell" {
    environment_vars = [
      "NODE_VERSION={{user `node_version`}}",
      "GRADLE_VERSION={{user `gradle_version`}}",
      "JAVA_PACKAGE={{user `java_package`}}",
    ]
    scripts = [
      "scripts/install_node.sh",
      "scripts/install_python.sh",
      "scripts/install_java.sh",
      "scripts/install_gradle.sh",
      "scripts/test_image.sh",
      "../../shared-scripts/cleanup.sh",
    ]
  }

  post-processor "docker-tag" {
    repository = "your-dockerhub-username/common-build-image"
    tag        = "latest"
  }
}
