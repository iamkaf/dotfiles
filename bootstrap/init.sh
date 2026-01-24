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

# Function to run the reclone script
run_reclone() {
    local reclone_path="$SCRIPT_DIR/../generated/reclone.sh"

    if [[ ! -f "$reclone_path" ]]; then
        echo "Error: Recreate script not found: $reclone_path"
        echo "Please run ./scripts/export-repos.sh to generate it first"
        return 1
    fi

    echo ""
    echo "==> Recreating ~/code directory from git remotes..."
    echo "    Using: $reclone_path"
    bash "$reclone_path"
}

# Function to run Ollama container
run_ollama() {
    echo ""
    echo "==> Starting Ollama container with GPU support..."
    echo "    This will:"
    echo "    - Download and run ollama/ollama image"
    echo "    - Use all available GPUs (--gpus=all)"
    echo "    - Create a named volume 'ollama' for persistence"
    echo "    - Expose port 11434 for API access"
    echo ""
    read -p "Continue? (y/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        docker run -d --gpus=all -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama
        echo ""
        echo "==> Ollama is now running!"
        echo "    API available at: http://localhost:11434"
        echo "    After installing dotfiles, use the 'ollama' alias:"
        echo "      ollama pull llama3.2"
        echo "      ollama run llama3.2"
        echo "    Or use docker directly:"
        echo "      docker exec -it ollama ollama pull llama3.2"
        echo "      docker exec -it ollama ollama run llama3.2"
    else
        echo "Cancelled."
    fi
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
    echo "  6) Install Docker (with NVIDIA toolkit)"
    echo "  7) Install Claude skills"
    echo "  8) Recreate ~/code from git remotes"
    echo "  9) Run all (1-7)"
    echo "  0) Run everything (1-8)"
    echo "  o) Run Ollama (LLM server with GPU support)"
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
            run_script "install-claude.sh"
            ;;
        8)
            run_reclone
            ;;
        o|O)
            run_ollama
            ;;
        9)
            run_script "install-core.sh"
            run_script "install-dev-tools.sh"
            run_script "install-apps.sh"
            run_script "install-dotfiles.sh"
            run_script "install-gcm.sh"
            run_script "install-docker.sh"
            run_script "install-claude.sh"
            ;;
        0)
            run_script "install-core.sh"
            run_script "install-dev-tools.sh"
            run_script "install-apps.sh"
            run_script "install-dotfiles.sh"
            run_script "install-gcm.sh"
            run_script "install-docker.sh"
            run_script "install-claude.sh"
            run_reclone
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
