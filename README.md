# dotfiles

Personal setup and migration helpers for Linux systems (Mint → Ubuntu).

This repository documents and partially automates my development environment:
- Dotfiles and shell configuration
- Scripts to recreate `~/code` from git remotes
- Docker container and volume reconstruction helpers
- Package lists and bootstrap notes

## Philosophy
- Prefer reproducible commands over opaque automation
- Generate scripts; review and run them manually
- Capture *how* the system is built, not just the final state

## Structure
- `dotfiles/` — shell, git, and app configuration
- `bootstrap/` — package install and system setup
- `docker/` — container and volume export helpers
- `scripts/` — utility scripts
- `system/` — package lists and system notes

## Usage

Read the scripts before running them. Nothing here is meant to be blindly executed.

This repo is a reference, not an installer.
