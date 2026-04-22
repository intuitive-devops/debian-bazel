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

RUN groupadd -g 10001 bazel \
    && useradd -m -u 10001 -g bazel -s /bin/bash bazel \
    && mkdir -p /workspace /home/bazel/.cache/bazelisk \
    && chown -R bazel:bazel /workspace /home/bazel

ENV HOME=/home/bazel
ENV BAZELISK_HOME=/home/bazel/.cache/bazelisk
WORKDIR /workspace
USER bazel

CMD ["bazel", "--version"]
