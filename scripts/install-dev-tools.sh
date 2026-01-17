#!/usr/bin/env bash
# Install package managers, programming languages, and development tools.
# Includes nvm (Node.js), rustup (Rust), uv (Python), Deno, and SDKMAN (Java).

set -euo pipefail

echo "==> Installing nvm (Node Version Manager)..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# Source nvm so we can use it immediately
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

echo "==> Installing Node.js LTS via nvm..."
nvm install --lts
nvm use --lts

echo "==> Installing rustup (Rust toolchain)..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Source cargo env so we can use it immediately
export PATH="$HOME/.cargo/bin:$PATH"

echo "==> Installing uv (Python package manager)..."
curl -LsSf https://astral.sh/uv/install.sh | sh

echo "==> Installing Deno..."
curl -fsSL https://deno.land/install.sh | sh

echo "==> Installing SDKMAN..."
curl -s "https://get.sdkman.io" | bash

# Source SDKMAN so we can use it immediately
source "$HOME/.sdkman/bin/sdkman-init.sh"

echo "==> Installing JDK 21 (Temurin) via SDKMAN..."
sdk install java 21-tem

echo "==> Installing npm global packages (wrangler, dotenvx)..."
npm install -g @dotenvx/dotenvx wrangler

echo "==> Verifying installations..."
node --version
npm --version
rustc --version
cargo --version
uv --version
deno --version
java -version
wrangler --version
dotenvx --version

echo "==> Done."
echo "==> Restart your shell or run: source ~/.bashrc"
