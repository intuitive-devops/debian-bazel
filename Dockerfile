FROM debian:bullseye-slim

ARG BAZELISK_VERSION=v1.20.0

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        file \
        git \
        gnupg \
        openjdk-17-jdk-headless \
        python3 \
        unzip \
        zip \
        build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL -o /usr/local/bin/bazel \
      "https://github.com/bazelbuild/bazelisk/releases/download/${BAZELISK_VERSION}/bazelisk-linux-amd64" \
    && chmod +x /usr/local/bin/bazel \
    && ln -s /usr/local/bin/bazel /usr/local/bin/bazelisk

ENV BAZELISK_HOME=/usr/local/share/bazelisk
WORKDIR /workspace

CMD ["bazel", "--version"]
