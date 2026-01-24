#!/usr/bin/env bash
# Export dotfiles and repository information for backup and version control.
# Interactive menu to select what to export.

set -euo pipefail

# Get the script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Function to run a script
run_script() {
    local script_name="$1"
    shift
    local args="$@"
    local script_path="$SCRIPT_DIR/../scripts/$script_name"

    if [[ ! -f "$script_path" ]]; then
        echo "Error: Script not found: $script_path"
        return 1
    fi

    echo ""
    echo "==> Running $script_name..."
    bash "$script_path" $args
}

# Main menu
show_menu() {
    echo ""
    echo "╔════════════════════════════════════════════════════════════╗"
    echo "║                   Export Menu                               ║"
    echo "╚════════════════════════════════════════════════════════════╝"
    echo ""
    echo "  1) Export dotfiles (.bash_aliases)"
    echo "  2) Export repositories (~/code -> reclone.sh)"
    echo "  3) Export Claude skills"
    echo "  4) Export all (1-3)"
    echo "  q) Quit"
    echo ""
}

# Run selected options
run_selection() {
    local selection="$1"

    case "$selection" in
        1)
            run_script "export-dotfiles.sh"
            ;;
        2)
            run_script "export-repos.sh" "-o generated/reclone.sh"
            ;;
        3)
            run_script "export-claude.sh"
            ;;
        4)
            run_script "export-dotfiles.sh"
            run_script "export-repos.sh" "-o generated/reclone.sh"
            run_script "export-claude.sh"
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
