#!/bin/bash

podman build \
       --build-arg BUILD_DATE="$(date -u +'%Y-%m-%dT%H:%M:%SZ')" \
       --build-arg VCS_REF="$(git rev-parse --short HEAD 2>/dev/null || echo 'no-git')" \
       -t qhe:1.2 -f Containerfile .
