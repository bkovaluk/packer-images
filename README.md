# Packer Images Repository

Welcome to the Packer Images Repository. This project automates the creation of Docker images using HashiCorp Packer, providing a consistent and repeatable build process for development and deployment environments.

## Table of Contents

- [Overview](#overview)
- [Project Structure](#project-structure)
- [Available Images](#available-images)
- [Prerequisites](#prerequisites)
- [Building Images](#building-images)
- [Adding New Images](#adding-new-images)
- [Testing](#testing)
- [Continuous Integration](#continuous-integration)
- [License](#license)

## Overview

This repository contains Packer configurations and scripts to build Docker images tailored for specific purposes. The images are designed to include necessary tools and dependencies for building and deploying applications in various environments.

## Project Structure

The repository is organized as follows:

~~~
packer-images/
├── images/
│   ├── common-build/
│   │   ├── scripts/
│   │   │   ├── install_node.sh
│   │   │   ├── install_python.sh
│   │   │   ├── install_java.sh
│   │   │   ├── install_gradle.sh
│   │   │   ├── test_image.sh
│   │   ├── variables.pkr.hcl
│   │   ├── common-build.pkr.hcl
│   │   └── README.md
│   ├── common-deploy/
│   │   ├── scripts/
│   │   │   ├── install_aws_cli.sh
│   │   │   ├── install_terraform.sh
│   │   │   ├── install_packer.sh
│   │   │   ├── test_image.sh
│   │   ├── variables.pkr.hcl
│   │   ├── common-deploy.pkr.hcl
│   │   └── README.md
│   └── ... (additional images)
├── shared-scripts/
│   ├── cleanup.sh
│   └── ... (shared scripts)
├── variables/
│   ├── global.pkr.hcl
│   └── ... (additional variable files)
├── builds/
│   ├── build_image.sh
│   ├── build_all.sh
│   └── ... (additional build scripts)
├── .github/
│   └── workflows/
│       ├── common_build_image.yml
│       ├── common_deploy_image.yml
│       └── ... (additional workflows)
├── docs/
│   └── ... (documentation)
└── README.md
└── Makefile
~~~

- **images/**: Contains directories for each image, including Packer configurations and scripts.
- **shared-scripts/**: Scripts shared across multiple images.
- **variables/**: Global and shared variables for Packer configurations.
- **builds/**: Build scripts to automate image creation.
- **.github/workflows/**: GitHub Actions workflows for CI/CD.
- **docs/**: Additional documentation.
- **README.md**: Project documentation.

## Available Images

| Image Name       | Description                                                                                                                                      |
| -----------------  | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| **common-build**  | A Docker image equipped with tools for building frontend code and applications, including Node.js, Python, Java, and Gradle.                     |
| **common-deploy** | A Docker image containing tools for deploying applications to AWS, such as Python, AWS CLI, Terraform, and Packer.                               |

## Prerequisites

- **Docker**: Install Docker Engine to build and run Docker images.
- **Packer**: Install HashiCorp Packer (version specified in the Packer configurations).
- **Git**: Clone the repository and manage version control.

## Building Images

You can build the images using the provided build scripts or directly with Packer.

### Using Build Scripts

Navigate to the `builds/` directory and execute the build scripts:

~~~
cd builds

# Build the common-build image
./build_image.sh -i "common-build"

# Build all images
./build_all.sh
~~~

### Directly with Packer

Navigate to the image directory and run the Packer build command:

~~~
# For the common-build image
cd images/common-build
packer build -var-file=variables.pkr.hcl common-build.pkr.hcl

# For the common-deploy image
cd images/common-deploy
packer build -var-file=variables.pkr.hcl common-deploy.pkr.hcl
~~~

## Adding New Images

To add a new image to the project:

1. **Create a New Directory**: Under `images/`, create a directory for your new image.

   ~~~
   images/
   └── your-new-image/
       ├── scripts/
       ├── variables.pkr.hcl
       ├── your-new-image.pkr.hcl
       └── README.md
   ~~~

2. **Create Packer Configuration**: Write a Packer template (`your-new-image.pkr.hcl`) defining the image build process.

3. **Write Scripts**: Add any necessary installation or configuration scripts in the `scripts/` directory.

4. **Define Variables**: Specify variables in `variables.pkr.hcl` for versions and configurations.

5. **Update Build Scripts**: Add a build script in the `builds/` directory (e.g., `build_your_new_image.sh`).

6. **Document the Image**: Update `README.md` in the image directory with details and usage instructions.

7. **Update the Main README**: Add the new image to the "Available Images" table with a description.

## Testing

Testing ensures that the images function as expected.

### Running Tests Locally

1. **Build the Image**:

   ~~~bash
   packer build -var-file=variables.pkr.hcl your-image.pkr.hcl
   ~~~

2. **Run the Container**:

   ~~~bash
   docker run -it your-dockerhub-username/your-image:latest bash
   ~~~

3. **Execute Test Scripts**:

   Inside the container, run the test script:

   ~~~bash
   /test_image.sh
   ~~~

### Automated Testing with GitHub Actions

The project includes GitHub Actions workflows that automatically build and test images on code changes.

- Workflows are located in `.github/workflows/`.
- On push or pull request events, the workflows:
  - Build the image using Packer.
  - Run tests to verify functionality.
  - Optionally, push the image to Docker Hub (requires repository secrets).

## Continuous Integration

The project uses GitHub Actions for Continuous Integration (CI):

- **Build and Test Workflows**: Automatically build and test images on code changes.
- **Dependabot Integration**: Monitors dependencies and creates pull requests for updates.

### Repository Secrets

For workflows that push images to Docker Hub, set up the following secrets in your repository:

- `DOCKERHUB_USERNAME`: Your Docker Hub username.
- `DOCKERHUB_TOKEN`: A Docker Hub access token with permissions to push images.

Please ensure that all new code includes appropriate tests and documentation.

## License

This project is licensed under the [MIT License](LICENSE).
