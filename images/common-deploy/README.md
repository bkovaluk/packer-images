# Common Deploy Image

This image includes:

- System packages updated to the latest versions.
- Debugging tools: curl, wget, less, vim.
- Python 3 and pip
- AWS CLI version 2
- Terraform (version defined in `variables.pkr.hcl`)
- Packer (version defined in `variables.pkr.hcl`)
- **kubectl** (version defined in `variables.pkr.hcl`)

## Usage

Pull the image:

```bash
docker pull your-dockerhub-username/common-deploy-image:latest
```

Run a container:

```bash
docker run -it your-dockerhub-username/common-deploy-image:latest bash
```