# debian-bazel

A Debian + Bazel build container for creating distroless-style images without pulling in extra Google project boilerplate.

The container runs as a non-root `bazel` user by default.

Use it in a multistage Dockerfile:

```dockerfile
FROM docker.io/cartheur/debian-bazel:latest AS build
```

## Local usage (Podman)

Build:

```bash
podman build -t docker.io/cartheur/debian-bazel:latest .
```

Run:

```bash
podman run --rm docker.io/cartheur/debian-bazel:latest bazel --version
```

Push:

```bash
podman login docker.io
podman push docker.io/cartheur/debian-bazel:latest
```

## GitHub Actions auto-publish

Workflow file: `.github/workflows/publish.yml`

Required repository secrets:

- `DOCKERHUB_USERNAME` (for example `cartheur`)
- `DOCKERHUB_TOKEN` (Docker Hub access token with push permissions)

The workflow publishes `docker.io/cartheur/debian-bazel:latest` on every push to `main` and on manual dispatch.

## Note on Docker CLI

`docker-ce-cli` is not currently installed in this image. If you want remote daemon control (`docker`, `docker compose`, `docker swarm`) from inside this container, I can add that in a separate variant.
