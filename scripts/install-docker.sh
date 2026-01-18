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
echo "==> Installing NVIDIA Container Toolkit (for GPU support)..."
echo "    Note: Skip this section if you don't have an NVIDIA GPU"
echo "    Adding NVIDIA GPG key..."
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey \
    | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg

echo "    Adding NVIDIA repository..."
curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list \
    | sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' \
    | sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

echo "    Installing nvidia-container-toolkit..."
sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit

echo "    Configuring Docker to use NVIDIA runtime..."
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker

echo ""
echo "==> Done."
echo "==> Run 'newgrp docker' to activate group changes, or log out and back in."
