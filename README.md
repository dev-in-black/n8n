# Custom n8n Docker Image with langfuse-langchain

This repository contains a custom n8n Docker image that includes the `langfuse-langchain` library for enhanced AI workflow capabilities.

## Features

- ✅ Based on the official n8n:latest image
- ✅ Pre-installed `langfuse-langchain` library
- ✅ Automated builds and pushes to GitHub Container Registry
- ✅ Multi-platform support (linux/amd64, linux/arm64)
- ✅ Security scanning with Trivy
- ✅ Health checks included
- ✅ Optimized for production use

## Usage

### Running the Container

```bash
docker run -d \
  --name n8n-langfuse \
  -p 5678:5678 \
  -e N8N_BASIC_AUTH_ACTIVE=true \
  -e N8N_BASIC_AUTH_USER=admin \
  -e N8N_BASIC_AUTH_PASSWORD=your-password \
  -v n8n_data:/data \
  ghcr.io/dev-in-black/n8n:latest
```

### Using Docker Compose

```yaml
version: '3.8'

services:
  n8n:
    image: ghcr.io/dev-in-black/n8n:latest
    restart: unless-stopped
    ports:
      - "5678:5678"
    environment:
      - N8N_BASIC_AUTH_ACTIVE=true
      - N8N_BASIC_AUTH_USER=admin
      - N8N_BASIC_AUTH_PASSWORD=your-password
    volumes:
      - n8n_data:/data

volumes:
  n8n_data:
```

### Available Tags

- `latest` - Latest stable build from main branch
- `v*` - Version-specific tags (e.g., v1.0.0)
- `main` - Latest build from main branch

## Development

### Building Locally

```bash
docker build -t n8n-langfuse .
```

### Running Locally

```bash
docker run -p 5678:5678 n8n-langfuse
```

## Configuration

The image includes all standard n8n configuration options. Additionally, the `langfuse-langchain` library is available globally for use in your workflows.

### Environment Variables

All standard n8n environment variables are supported. Key ones include:

- `N8N_BASIC_AUTH_ACTIVE` - Enable basic authentication
- `N8N_BASIC_AUTH_USER` - Basic auth username
- `N8N_BASIC_AUTH_PASSWORD` - Basic auth password
- `N8N_HOST` - Host for n8n
- `N8N_PORT` - Port for n8n (default: 5678)
- `N8N_PROTOCOL` - Protocol (http/https)

## Security

- Container runs as non-root user for security
- Regular security scanning with Trivy
- Based on official n8n image security practices
- Health checks included for monitoring

## Automated Builds

The image is automatically built and pushed to GitHub Container Registry when:

- Code is pushed to the main branch
- New tags are created (v*)
- Manual workflow dispatch is triggered

## License

This project follows the same license as the base n8n project.

## Support

For issues specific to this custom image, please create an issue in this repository.
For general n8n support, refer to the [official n8n documentation](https://docs.n8n.io/).