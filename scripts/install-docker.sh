#!/usr/bin/env bash
# Install Docker Engine from official Docker repository.
# Adds Docker repository, installs Docker, and configures user permissions.

set -euo pipefail

echo "==> Installing dependencies..."
sudo apt update
sudo apt install -y ca-certificates curl

echo "==> Adding Docker's official GPG key..."
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo "==> Adding Docker repository to Apt sources..."
sudo tee /etc/apt/sources.list.d/docker.sources > /dev/null <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

echo "==> Installing Docker Engine..."
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "==> Starting Docker service..."
sudo systemctl start docker
sudo systemctl enable docker

echo "==> Adding user to docker group..."
sudo groupadd -f docker
sudo usermod -aG docker "$USER"

echo "==> Verifying installation..."
sudo systemctl status docker --no-pager
echo ""
echo "Running hello-world container..."
sudo docker run hello-world

echo ""
echo "==> Done."
echo "==> Run 'newgrp docker' to activate group changes, or log out and back in."
