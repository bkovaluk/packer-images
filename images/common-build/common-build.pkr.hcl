packer {
  required_plugins {
    docker = {
      version = ">= 0.0.7"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "common-build" {
  image  = var.source_image
  commit = true
}

build {
  name    = "common-build-image"
  sources = ["source.docker.common-build"]

  provisioner "shell" {
    environment_vars = [
      "NODE_VERSION={{user `node_version`}}",
      "GRADLE_VERSION={{user `gradle_version`}}",
      "JAVA_PACKAGE={{user `java_package`}}",
    ]
    scripts = [
      "../../shared-scripts/update_system.sh",
      "../../shared-scripts/install_utility_tools.sh",
      "scripts/install_node.sh",
      "scripts/install_java.sh",
      "scripts/install_gradle.sh",
      "../../shared-scripts/install_python.sh",
      "scripts/test_image.sh",
      "../../shared-scripts/cleanup.sh",
    ]
  }

  post-processor "docker-tag" {
    repository = "${var.dockerhub_username}/common-build-image"
    tag        = "latest"
  }
}
