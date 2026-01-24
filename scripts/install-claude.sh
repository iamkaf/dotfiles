#!/usr/bin/env bash
# Install Claude skills from this repository.

set -euo pipefail

# Get the script directory (dotfiles repo)
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "==> Installing Claude skills from $DOTFILES_DIR"

echo "==> Ensuring ~/.claude/skills/ directory exists..."
mkdir -p "$HOME/.claude/skills"

echo "==> Copying skills..."
if [[ -d "$DOTFILES_DIR/claude/skills" ]]; then
  cp -r "$DOTFILES_DIR/claude/skills/"* "$HOME/.claude/skills/" 2>/dev/null || true
  echo "    Installed skills"
else
  echo "    No skills to install"
fi

echo "==> Done."
echo "==> Restart Claude Code to apply changes."
