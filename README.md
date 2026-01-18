# dotfiles

Personal setup and migration helpers for Linux systems (Debian-based: Mint, Ubuntu).

This repository documents and automates my development environment:
- Dotfiles and shell configuration
- Bootstrap scripts for fresh system installation
- Repository recreation from git remotes
- Export utilities for backup and version control

## Philosophy

- **Reproducible over opaque** — Generate commands you can review before running
- **Document the "how"** — Capture the setup process, not just the final state
- **Manual execution** — Scripts are meant to be read and understood, not blindly executed

## Quick Start

```bash
# Interactive installation menu
./bootstrap/init.sh

# Export current state
./bootstrap/export.sh
```

See [COMMANDS.md](COMMANDS.md) for detailed documentation.

## Structure

```
.
├── bootstrap/
│   ├── init.sh      # Interactive installation menu
│   └── export.sh    # Interactive export menu
├── dotfiles/
│   └── .bash_aliases # Shell aliases and functions
├── generated/
│   └── reclone.sh   # Auto-generated repo recreation script
├── scripts/
│   ├── export-*.sh  # Export utilities
│   └── install-*.sh # Installation scripts
├── COMMANDS.md      # Script documentation
└── README.md        # This file
```

## What's Installed

**Core utilities** (git, jq, tree, ripgrep, bat, fzf, tldr, neofetch, Flatpak)

**Development tools** (nvm + Node.js, rustup, uv, Deno, SDKMAN + JDK 21)

**Applications** (Claude Code, Google Chrome, JetBrains Toolbox, VS Code, Discord, Steam, Obsidian, VLC, GIMP, OBS Studio)

**Docker** (Docker Engine, NVIDIA Container Toolkit for GPU support)

**Git Credential Manager** (secure credential storage with system keyring)

## Bootstrap Menu

The `bootstrap/init.sh` menu provides:

1. Install core utilities
2. Install dev tools
3. Install desktop apps
4. Install dotfiles
5. Install Git Credential Manager
6. Install Docker (with NVIDIA toolkit)
7. Recreate ~/code from git remotes
8. Run all (1-6)
9. Run everything (1-7)
o. Run Ollama (LLM server with GPU support)

## Aliases

Run `kaf` to see all available aliases, or see [dotfiles/.bash_aliases](dotfiles/.bash_aliases):

- `gpt` — git push + push tags
- `nrd`, `ns`, `ni`, `nt`, `nr` — npm run commands
- `ollama` — exec into ollama container

## Usage

Read the scripts before running them. This repo is a reference, not a blind installer.
