# debian-bazel

Debian Bullseye image with Bazel available for building distroless images.

## Build locally (Podman)

```bash
podman build -t docker.io/cartheur/debian-bazel:latest .
```

## Run locally (Podman)

```bash
podman run --rm docker.io/cartheur/debian-bazel:latest
```

## Push to Docker Hub (Podman)

```bash
podman login docker.io
podman push docker.io/cartheur/debian-bazel:latest
```

## GitHub Actions auto-publish

Workflow file: `.github/workflows/publish.yml`

Set these repository secrets in GitHub:

- `DOCKERHUB_USERNAME`: your Docker Hub username (`cartheur`)
- `DOCKERHUB_TOKEN`: Docker Hub access token (not your password)

The workflow pushes `docker.io/cartheur/debian-bazel:latest` on every push to `main`, and also supports manual run from the Actions tab.
