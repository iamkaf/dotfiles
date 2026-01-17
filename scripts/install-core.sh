#!/usr/bin/env bash
# Install core utilities for development.
# Essential tools for a functional development environment.

set -euo pipefail

echo "==> Updating package list..."
sudo apt update

echo "==> Installing core utilities..."
sudo apt install -y \
  build-essential \
  curl \
  wget \
  git \
  vim \
  jq \
  tree \
  ripgrep \
  bat \
  neofetch \
  fzf \
  tldr \
  zip \
  unzip

echo "==> Installing Flatpak..."
sudo apt install -y flatpak

echo "==> Adding Flathub remote..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "==> Creating bat symlink (batcat -> bat)..."
sudo ln -sf /usr/bin/batcat /usr/bin/bat

echo "==> Updating tldr cache..."
tldr --update

echo "==> Verifying installations..."
git --version
jq --version
tree --version
rg --version
bat --version
fzf --version
flatpak --version

echo "==> Done."
