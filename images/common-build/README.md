# Common Build Image

This image includes:

- System packages updated to the latest versions.
- Debugging tools: curl, wget, less, vim.
- Node.js (version defined in `variables.auto.pkrvars.hcl`)
- Python 3 and pip
- Java (Amazon Corretto)

## Usage

Pull the image:

```bash
docker pull your-dockerhub-username/common-build-image:latest
```

Run a container:

```bash
docker run -it your-dockerhub-username/common-build-image:latest bash
```