#!/usr/bin/env bash
# Install Git Credential Manager (GCM) with secretservice backend.
# GCM securely stores Git credentials using the system keyring.

set -euo pipefail

echo "==> Installing secretservice dependencies..."
sudo apt update
sudo apt install -y \
  libsecret-1-0 \
  gnome-keyring \
  libpam-gnome-keyring \
  dbus-user-session \
  curl

echo "==> Installing Git Credential Manager (.deb)..."
TMPDIR="$(mktemp -d)"
cd "$TMPDIR"

curl -LO https://github.com/git-ecosystem/git-credential-manager/releases/latest/download/gcm-linux_amd64.deb
sudo dpkg -i gcm-linux_amd64.deb

cd /
rm -rf "$TMPDIR"

echo "==> Verifying GCM install..."
command -v git-credential-manager >/dev/null
git-credential-manager --version

echo "==> Configuring Git to use GCM..."
git config --global credential.helper manager-core
git config --global credential.credentialStore secretservice

echo "==> Ensuring DBus user session is running..."
if [[ -z "${DBUS_SESSION_BUS_ADDRESS:-}" ]]; then
  echo "DBUS_SESSION_BUS_ADDRESS not set, starting user dbus..."
  systemctl --user start dbus || true
fi

echo "==> Running GCM diagnostics..."
git-credential-manager diagnose

echo "==> Done."
echo "Test with: git clone https://github.com/<org>/<repo>.git"
