#!/usr/bin/env bash
# Install essential applications via Flatpak and direct install scripts.
# Includes development tools, communication, and media applications.

set -euo pipefail

echo "==> Installing Claude Code..."
curl -fsSL https://claude.ai/install.sh | bash

echo "==> Installing Visual Studio Code..."
flatpak install -y flathub com.visualstudio.code

echo "==> Installing Discord..."
flatpak install -y flathub com.discordapp.Discord

echo "==> Installing Steam..."
flatpak install -y flathub com.valvesoftware.Steam

echo "==> Installing Obsidian..."
flatpak install -y flathub md.obsidian.Obsidian

echo "==> Installing VLC..."
flatpak install -y flathub org.videolan.VLC

echo "==> Installing GIMP..."
flatpak install -y flathub org.gimp.GIMP

echo "==> Installing OBS Studio..."
flatpak install -y flathub com.obsproject.Studio

echo "==> Done."
