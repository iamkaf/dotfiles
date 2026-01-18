#!/usr/bin/env bash
# Install essential applications via Flatpak and direct install scripts.
# Includes development tools, communication, and media applications.

set -euo pipefail

echo "==> Installing Claude Code..."
curl -fsSL https://claude.ai/install.sh | bash

echo "==> Installing Google Chrome..."
temp_deb=$(mktemp)
curl -fsSL https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o "$temp_deb"
sudo apt install -y "$temp_deb"
rm -f "$temp_deb"

echo "==> Installing JetBrains Toolbox..."
temp_dir=$(mktemp -d)
curl -fsSL 'https://data.services.jetbrains.com/products/download?platform=linux&code=TBA' -o "$temp_dir/toolbox.tar.gz"
tar -xzf "$temp_dir/toolbox.tar.gz" -C "$temp_dir"
toolbox_binary=$(find "$temp_dir" -type f -name jetbrains-toolbox | head -n1)

if [[ -z "$toolbox_binary" ]]; then
    echo "Error: Toolbox binary not found in archive"
    rm -rf "$temp_dir"
    exit 1
fi

toolbox_dir="$HOME/.local/share/JetBrains/Toolbox"
toolbox_bin_dir="$HOME/.local/bin"
mkdir -p "$toolbox_dir" "$toolbox_bin_dir"

# Extract the full contents (JRE, libs, etc.)
toolbox_extract_dir=$(dirname "$toolbox_binary")
cp -r "$toolbox_extract_dir"/* "$toolbox_dir/"
chmod +x "$toolbox_dir/jetbrains-toolbox"

# Symlink for easy CLI access
ln -sf "$toolbox_dir/jetbrains-toolbox" "$toolbox_bin_dir/jetbrains-toolbox"

rm -rf "$temp_dir"
echo "    JetBrains Toolbox installed to $toolbox_dir"
echo "    Symlinked to $toolbox_bin_dir/jetbrains-toolbox"
echo "    Make sure ~/.local/bin is in your PATH"

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
