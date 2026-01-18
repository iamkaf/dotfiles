#!/usr/bin/env bash
# Install my full setup into a fresh linux install - debian distros
# Interactive menu to select which components to install.

set -euo pipefail

# Get the script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Function to run a script
run_script() {
    local script="$1"
    local script_path="$SCRIPT_DIR/../scripts/$script"

    if [[ ! -f "$script_path" ]]; then
        echo "Error: Script not found: $script_path"
        return 1
    fi

    echo ""
    echo "==> Running $script..."
    bash "$script_path"
}

# Main menu
show_menu() {
    echo ""
    echo "╔════════════════════════════════════════════════════════════╗"
    echo "║          Fresh Linux Install Bootstrap Menu               ║"
    echo "╚════════════════════════════════════════════════════════════╝"
    echo ""
    echo "  1) Install core utilities (git, jq, tree, flatpak, etc.)"
    echo "  2) Install dev tools (nvm, rust, uv, deno, java)"
    echo "  3) Install desktop apps (code, discord, steam, obsidian, etc.)"
    echo "  4) Install dotfiles"
    echo "  5) Install Git Credential Manager"
    echo "  6) Install Docker"
    echo "  7) Recreate ~/code from git remotes"
    echo "  8) Run all (1-6)"
    echo "  9) Run everything (1-7)"
    echo "  q) Quit"
    echo ""
}

# Run selected options
run_selection() {
    local selection="$1"

    case "$selection" in
        1)
            run_script "install-core.sh"
            ;;
        2)
            run_script "install-dev-tools.sh"
            ;;
        3)
            run_script "install-apps.sh"
            ;;
        4)
            run_script "install-dotfiles.sh"
            ;;
        5)
            run_script "install-gcm.sh"
            ;;
        6)
            run_script "install-docker.sh"
            ;;
        7)
            echo "==> TODO: Recreate ~/code from git remotes"
            echo "    Run: ./scripts/export-repos.sh > ~/code-reclone.sh"
            ;;
        8)
            run_script "install-core.sh"
            run_script "install-dev-tools.sh"
            run_script "install-apps.sh"
            run_script "install-dotfiles.sh"
            run_script "install-gcm.sh"
            run_script "install-docker.sh"
            ;;
        9)
            run_script "install-core.sh"
            run_script "install-dev-tools.sh"
            run_script "install-apps.sh"
            run_script "install-dotfiles.sh"
            run_script "install-gcm.sh"
            run_script "install-docker.sh"
            echo "==> TODO: Recreate ~/code from git remotes"
            ;;
        q|Q)
            echo "Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid selection: $selection"
            ;;
    esac
}

# Main loop
main() {
    while true; do
        show_menu
        read -p "Select an option: " selection
        run_selection "$selection"
    done
}

main
