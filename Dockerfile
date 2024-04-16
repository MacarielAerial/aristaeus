# Use alpine because of its small size
FROM alpine:3.19.1 AS dev

# Install basic utilities
RUN apk add --update-cache \
    bash \
    curl \
    git \
    sudo \
    unzip \
    # Need the following for vs code dev container to work
    libstdc++

# Make sure all installed packages are available at PATH
ENV PATH /usr/local/bin:$PATH

# Copy installation scripts
COPY scripts/* /scripts/

# Run installation scripts for minikube and kubectl
RUN /scripts/install_minikube.sh && /scripts/install_kubectl.sh

# Keep container alive for dev purpose
ENTRYPOINT ["sleep", "infinity"]
