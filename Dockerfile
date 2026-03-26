FROM jenkins/jenkins:lts-jdk21

USER root

LABEL org.opencontainers.image.source https://github.com/the-khiem7/jenkins-docker-builder

# Install required packages for Docker repository setup
RUN apt-get update \
 && apt-get install -y ca-certificates curl gnupg \
 && rm -rf /var/lib/apt/lists/*

# Add Docker GPG key and repository
RUN install -m 0755 -d /etc/apt/keyrings \
 && curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg \
 && chmod a+r /etc/apt/keyrings/docker.gpg \
 && echo "deb [arch=\"$(dpkg --print-architecture)\" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \"$(. /etc/os-release && echo \"$VERSION_CODENAME\")\" stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker CLI
RUN apt-get update \
 && apt-get install -y docker-ce-cli \
 && rm -rf /var/lib/apt/lists/*

USER jenkins