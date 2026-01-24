#!/usr/bin/env bash
# Export personal dotfiles to this repository for backup and version control.

set -euo pipefail

# Get the script directory (dotfiles repo)
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "==> Exporting dotfiles to $DOTFILES_DIR"

echo "==> Ensuring dotfiles/ directory exists..."
mkdir -p "$DOTFILES_DIR/dotfiles"

echo "==> Copying ~/.bash_aliases..."
cp "$HOME/.bash_aliases" "$DOTFILES_DIR/dotfiles/"

if [[ -f "$HOME/.config/ghostty/config" ]]; then
  echo "==> Copying ~/.config/ghostty/config..."
  cp "$HOME/.config/ghostty/config" "$DOTFILES_DIR/dotfiles/"
fi

echo "==> Done."
echo "==> Review changes with: git status"
