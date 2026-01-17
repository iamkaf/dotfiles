#!/usr/bin/env bash
# Traverse ~/code and list git repositories with their remotes and dirty status.
# Prints git clone commands; dirty repos are highlighted in bold red.
#
# Usage:
#   ./scripts/export-repos.sh              # Output to terminal
#   ./scripts/export-repos.sh -o file.sh   # Output to file (no colors)

set -euo pipefail

CODE_DIR="$HOME/code"
BOLD_RED="\033[1;31m"
BOLD_YELLOW="\033[1;33m"
RESET="\033[0m"
OUTPUT_FILE=""
USE_COLORS=true

# Arrays to store repo info
declare -a REPO_PATHS
declare -a REPO_REMOTES
declare -a REPO_DIRTY
declare -a REPO_LOCAL

traverse_repos() {
    local base_dir="$1"
    local max_depth="$2"

    while IFS= read -r -d '' git_dir; do
        repo_dir="${git_dir%/.git}"

        # Check depth relative to CODE_DIR
        rel_path="${repo_dir#$CODE_DIR/}"
        depth=$(echo "$rel_path" | tr -cd '/' | wc -c)

        if [[ $depth -le $max_depth ]]; then
            REPO_PATHS+=("$repo_dir")

            # Get remote URL, or construct one from directory name
            if remote=$(git -C "$repo_dir" remote get-url origin 2>/dev/null); then
                REPO_REMOTES+=("$remote")
                REPO_LOCAL+=(0)
            else
                # No remote - assume iamkaf/<dirname>
                dirname=$(basename "$repo_dir")
                REPO_REMOTES+=("https://github.com/iamkaf/${dirname}.git")
                REPO_LOCAL+=(1)
            fi

            # Check if dirty
            if git -C "$repo_dir" diff --quiet HEAD 2>/dev/null; then
                REPO_DIRTY+=(0)
            else
                REPO_DIRTY+=(1)
            fi
        fi
    done < <(find "$base_dir" -name ".git" -type d -print0 2>/dev/null)
}

main() {
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            -o|--output)
                OUTPUT_FILE="$2"
                USE_COLORS=false
                shift 2
                ;;
            -h|--help)
                echo "Usage: $0 [-o|--output FILE]"
                echo ""
                echo "Options:"
                echo "  -o, --output FILE  Write output to file (no ANSI colors)"
                echo "  -h, --help        Show this help message"
                exit 0
                ;;
            *)
                echo "Unknown option: $1"
                echo "Use -h for help"
                exit 1
                ;;
        esac
    done

    traverse_repos "$CODE_DIR" 2

    # Build output
    {
        echo "# Git clone commands for repositories in ~/code"
        echo

        for i in "${!REPO_PATHS[@]}"; do
            path="${REPO_PATHS[$i]}"
            remote="${REPO_REMOTES[$i]}"
            dirty="${REPO_DIRTY[$i]}"
            local="${REPO_LOCAL[$i]}"

            printf "mkdir -p %s\n" "$(dirname "$path")"

            if [[ $USE_COLORS == true ]]; then
                if [[ $local -eq 1 ]]; then
                    if [[ $dirty -eq 1 ]]; then
                        printf "${BOLD_YELLOW}git clone %s %s  # %s (local, dirty)${RESET}\n" "$remote" "$path" "$path"
                    else
                        printf "${BOLD_YELLOW}git clone %s %s  # %s (local)${RESET}\n" "$remote" "$path" "$path"
                    fi
                elif [[ $dirty -eq 1 ]]; then
                    printf "${BOLD_RED}git clone %s %s  # %s (dirty)${RESET}\n" "$remote" "$path" "$path"
                else
                    printf "git clone %s %s  # %s\n" "$remote" "$path" "$path"
                fi
            else
                # No colors for file output
                if [[ $local -eq 1 ]]; then
                    if [[ $dirty -eq 1 ]]; then
                        printf "git clone %s %s  # %s (local, dirty)\n" "$remote" "$path" "$path"
                    else
                        printf "git clone %s %s  # %s (local)\n" "$remote" "$path" "$path"
                    fi
                elif [[ $dirty -eq 1 ]]; then
                    printf "git clone %s %s  # %s (dirty)\n" "$remote" "$path" "$path"
                else
                    printf "git clone %s %s  # %s\n" "$remote" "$path" "$path"
                fi
            fi
            printf "\n"
        done
    } | if [[ -n "$OUTPUT_FILE" ]]; then
        tee "$OUTPUT_FILE"
        chmod +x "$OUTPUT_FILE"
        echo "==> Output written to: $OUTPUT_FILE (executable)"
    else
        cat
    fi
}

main "$@"
