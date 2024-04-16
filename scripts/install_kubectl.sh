#!/usr/bin/env bash

# Download installer
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# Validate the binary
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

# Install kubectl
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Check version installed
kubectl version --client
