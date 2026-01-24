#!/usr/bin/env bash
# Export Claude skills to this repository for backup and version control.

set -euo pipefail

# Get the script directory (dotfiles repo)
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "==> Exporting Claude skills to $DOTFILES_DIR"

echo "==> Ensuring claude/skills/ directory exists..."
mkdir -p "$DOTFILES_DIR/claude/skills"

echo "==> Copying skills..."
if [[ -d "$HOME/.claude/skills" ]]; then
  cp -r "$HOME/.claude/skills/"* "$DOTFILES_DIR/claude/skills/" 2>/dev/null || true
  echo "    Exported skills"
else
  echo "    No skills directory found"
fi

echo "==> Done."
echo "==> Review changes with: git status"
