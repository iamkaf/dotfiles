# Commands

Documentation for custom scripts in this repository.

## scripts/export-repos.sh

Traverse `~/code` and generate git clone commands to recreate your repository structure.

### Behavior

- Scans `~/code` up to 2 levels deep for git repositories
- Captures each repo's path, remote URL, and dirty status (uncommitted changes)
- Outputs `mkdir -p` and `git clone` commands that can be reviewed and run manually

### Output Colors

- **Normal**: Clean repos with configured remotes
- **Bold Red**: Dirty repos (uncommitted changes) with configured remotes
- **Bold Yellow**: Local-only repos (no remote configured) — assumes `https://github.com/iamkaf/<dirname>.git`

### Usage

```bash
./scripts/export-repos.sh
./scripts/export-repos.sh -o reclone.sh  # Write to file (no colors)
```

Pipe to a file to save, or use `-o` flag for clean output (no ANSI codes):

```bash
./scripts/export-repos.sh -o ~/code-reclone.sh
```

The output file will be executable and ready to run.

## scripts/export-dotfiles.sh

Export personal dotfiles to this repository for backup and version control.

### Behavior

- Copies `~/.bash_aliases` to `dotfiles/`
- Preserves your shell aliases and customizations

### Usage

```bash
./scripts/export-dotfiles.sh
```

Run periodically to keep your dotfiles in sync with this repository.

## scripts/install-gcm.sh

Install Git Credential Manager (GCM) with secretservice backend for secure credential storage.

### Behavior

- Installs dependencies: libsecret, gnome-keyring, dbus-user-session
- Downloads and installs GCM .deb package from GitHub releases
- Configures Git to use GCM as the credential helper
- Sets secretservice as the credential store (integrates with system keyring)
- Ensures DBus user session is running
- Runs diagnostics to verify installation

### Usage

```bash
./scripts/install-gcm.sh
```

Run once on a fresh system. After installation, Git will prompt for credentials once and store them securely in the system keyring.

## scripts/install-core.sh

Install core development utilities via apt.

### Behavior

- Updates package list
- Installs Flatpak and adds Flathub remote
- Installs essential tools: build-essential, curl, wget, git, vim, jq, tree, zip, unzip
- Installs quality-of-life tools: ripgrep (rg), bat, neofetch, fzf, tldr
- Creates symlink: batcat → bat
- Updates tldr cache
- Verifies installations with version checks

### Usage

```bash
./scripts/install-core.sh
```

Run once on a fresh system to establish a functional development environment.

## scripts/install-dev-tools.sh

Install package managers, programming languages, and development tools.

### Behavior

- Installs nvm (Node Version Manager) and Node.js LTS
- Installs rustup (Rust toolchain)
- Installs uv (Python package manager)
- Installs Deno (TypeScript/JavaScript runtime)
- Installs SDKMAN and JDK 21 (Temurin)
- Installs npm global packages: wrangler, dotenvx
- Verifies installations with version checks

### Usage

```bash
./scripts/install-dev-tools.sh
```

Restart your shell after running to load all tool environments.

## scripts/install-apps.sh

Install essential applications via Flatpak and direct install scripts.

### Behavior

- Installs Claude Code via official install script
- Installs Visual Studio Code (Flatpak)
- Installs Discord (Flatpak)
- Installs Steam (Flatpak)
- Installs Obsidian (Flatpak)
- Installs VLC (Flatpak)
- Installs GIMP (Flatpak)
- Installs OBS Studio (Flatpak)

### Usage

```bash
./scripts/install-apps.sh
```

Requires Flatpak to be installed first (run `install-core.sh` before this script).

## scripts/install-docker.sh

Install Docker Engine from official Docker repository.

### Behavior

- Adds Docker's official GPG key
- Adds Docker repository to Apt sources
- Installs Docker Engine, CLI, and plugins (buildx, compose)
- Starts and enables Docker service
- Adds current user to docker group (requires logout/login to take effect)
- Verifies installation with hello-world container

### Usage

```bash
./scripts/install-docker.sh
```

Run `newgrp docker` to activate group changes immediately, or log out and back in.
