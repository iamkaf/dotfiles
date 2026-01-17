# TODO

Tasks to complete for the dotfiles project.

## Bootstrap / Installation

- [ ] Implement "Install dotfiles" option in `bootstrap/init.sh`
  - Create `install-dotfiles.sh` script to symlink dotfiles to home directory
  - Handle existing files with backup/prompt

- [ ] Implement "Recreate ~/code" option in `bootstrap/init.sh`
  - Should run generated `reclone.sh` from `export-repos.sh`

## Directories to Create

- [ ] `dotfiles/` — Add actual dotfiles (currently only has `.bash_aliases`)
  - `.gitconfig`
  - `.vimrc` or `.config/nvim/`
  - Other shell configs

- [ ] `docker/` — Container and volume export helpers
  - Script to export container configs
  - Script to backup/restore volumes

- [ ] `system/` — Package lists and system notes
  - Export installed packages list
  - System configuration notes

## Enhancement Ideas

- [ ] Add more dotfiles to `export-dotfiles.sh`
  - Make it extensible with a list of files to track
  - Support for restoring/symlinking on new systems

- [ ] Add version checking to install scripts
  - Skip installation if already up-to-date
  - Add `--force` flag to reinstall

- [ ] Add configuration file support
  - `.dotfiles.config` for customizing paths and options