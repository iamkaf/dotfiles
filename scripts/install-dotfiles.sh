#!/usr/bin/env bash
# Install personal dotfiles from this repository to the home directory.

set -euo pipefail

# Get the script directory (dotfiles repo)
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "==> Installing dotfiles from $DOTFILES_DIR"

echo "==> Copying .bash_aliases to ~..."
cp "$DOTFILES_DIR/dotfiles/.bash_aliases" "$HOME/.bash_aliases"

if [[ -f "$DOTFILES_DIR/dotfiles/config" ]]; then
  echo "==> Copying ghostty config to ~/.config/ghostty/..."
  mkdir -p "$HOME/.config/ghostty"
  cp "$DOTFILES_DIR/dotfiles/config" "$HOME/.config/ghostty/config"
fi

echo "==> Done."
echo "==> Reload your shell with: source ~/.bash_aliases"
