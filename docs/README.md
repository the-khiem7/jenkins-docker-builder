# JenkinsDock

Practical guide to running Jenkins with Docker, covering Docker-in-Docker builds and secure deployments behind an Nginx reverse proxy in a self-hosted environment.

## Overview

JenkinsDock is a reference project and guide for running Jenkins in containerized environments. The repository explains common deployment patterns, security pitfalls, and provides a ready-to-use Jenkins image that includes the Docker CLI.

This project focuses on:

* Understanding the difference between **Jenkins on host** vs **Jenkins in containers**
* Running **Docker builds from Jenkins using Docker-in-Docker (dind)**
* Providing a **Jenkins image bundled with docker-ce-cli**
* Highlighting **security risks when exposing Jenkins directly on port 8080**
* Demonstrating **why Jenkins should be placed behind a reverse proxy**

## Quick Navigation

| Topic | Description |
|-------|-------------|
| [Jenkins Host vs Container](jenkins-host-vs-container.md) | Compare host installation vs containerized Jenkins |
| [Docker-in-Docker](docker-in-docker.md) | Architecture and connection methods for Docker builds |
| [Custom Jenkins Image](custom-jenkins-image.md) | Build Jenkins image with Docker CLI pre-installed |
| [Security Risks](security-risks.md) | Critical security vulnerabilities and attack vectors |
| [Reverse Proxy](reverse-proxy.md) | Nginx configuration for secure deployments |

## Why This Matters

Running Jenkins in production requires understanding:

1. **Architecture decisions** - Host vs container trade-offs
2. **Build requirements** - How to enable Docker builds from pipelines
3. **Security implications** - Why default configurations are dangerous
4. **Production patterns** - Reverse proxy, HTTPS, access control

Use the sidebar to navigate through each topic in detail.
