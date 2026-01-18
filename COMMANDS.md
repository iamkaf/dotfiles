# Commands

Documentation for scripts in this repository.

## bootstrap/export.sh
Interactive menu to export dotfiles and repository information.

```bash
./bootstrap/export.sh
```

Options: export dotfiles, export repos (generates reclone.sh), or export both.

---

## bootstrap/init.sh
Interactive menu for fresh Linux installation. Run individual components or all at once.

```bash
./bootstrap/init.sh
```

Options: core utilities, dev tools, apps, dotfiles, Git Credential Manager, Docker, repo recreation, Ollama.

---

## scripts/export-repos.sh
Scan `~/code` (2 levels deep) and generate git clone commands to recreate repository structure.

```bash
./scripts/export-repos.sh                    # Color-coded output to stdout
./scripts/export-repos.sh -o reclone.sh      # Write executable script to file
```

Output shows dirty repos (red) and local-only repos (yellow, assumes GitHub default).

---

## scripts/export-dotfiles.sh
Export personal dotfiles from `~` to this repository for version control.

```bash
./scripts/export-dotfiles.sh
```

Copies `.bash_aliases` to `dotfiles/`. Run periodically to keep dotfiles synced.

---

## scripts/install-dotfiles.sh
Install dotfiles from this repository to home directory.

```bash
./scripts/install-dotfiles.sh
```

Copies `.bash_aliases` to `~`. Reload shell with `source ~/.bash_aliases` after.

---

## scripts/install-core.sh
Install essential development utilities via apt.

```bash
./scripts/install-core.sh
```

Installs: build-essential, git, vim, jq, tree, ripgrep, bat, fzf, tldr, neofetch, Flatpak + Flathub. Creates `bat` symlink and updates tldr cache.

---

## scripts/install-dev-tools.sh
Install programming language runtimes and package managers.

```bash
./scripts/install-dev-tools.sh
```

Installs: nvm + Node.js LTS, rustup, uv, Deno, SDKMAN + JDK 21, npm globals (wrangler, dotenvx). Restart shell after.

---

## scripts/install-apps.sh
Install desktop applications via Flatpak and direct installers.

```bash
./scripts/install-apps.sh
```

Installs: Claude Code, Google Chrome, JetBrains Toolbox, VS Code, Discord, Steam, Obsidian, VLC, GIMP, OBS Studio. Requires Flatpak first.

---

## scripts/install-docker.sh
Install Docker Engine from official repository with NVIDIA GPU support.

```bash
./scripts/install-docker.sh
```

Adds Docker repo, installs Docker Engine + plugins, configures NVIDIA Container Toolkit, adds user to docker group. Run `newgrp docker` to activate.

---

## scripts/install-gcm.sh
Install Git Credential Manager with system keyring integration.

```bash
./scripts/install-gcm.sh
```

Installs GCM .deb with libsecret/gnome-keyring dependencies, configures Git credential helper, ensures DBus session running.

---

## dotfiles/.bash_aliases
Shell aliases for development workflow.

Git: `gpt` (push + push tags). NPM: `nrd`, `ns`, `ni`, `nt`, `nr`, `nrf`, `nrl`, `nrb`, `nrtc`, `ncu`. Docker: `ollama` (exec into ollama container).

Run `kaf` to see all aliases.
