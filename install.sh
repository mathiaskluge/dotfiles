#!/bin/bash

set -e

# Colors for output
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
RESET=$(tput sgr0)

info() {
    printf "${BLUE}==> %s${RESET}\n" "$1"
}

success() {
    printf "${GREEN}==> %s${RESET}\n" "$1"
}

error() {
    printf "${RED}==> %s${RESET}\n" "$1"
}

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    error "This script is only for macOS"
    exit 1
fi

info "Dotfiles installation initialized..."

# Install Xcode Command Line Tools
info "Installing Xcode Command Line Tools..."
if xcode-select -p >/dev/null 2>&1; then
    info "Xcode Command Line Tools already installed"
else
    xcode-select --install
    info "Please complete the Xcode installation and re-run this script"
    exit 0
fi

# Install Homebrew
info "Installing Homebrew..."
if command -v brew &>/dev/null; then
    info "Homebrew already installed"
else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH for this session
    if [[ -d "/opt/homebrew/bin" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -d "/usr/local/bin" ]]; then
        eval "$(/usr/local/bin/brew shellenv)"
    fi
fi

# Install chezmoi
info "Installing chezmoi..."
if command -v chezmoi &>/dev/null; then
    info "chezmoi already installed"
else
    brew install chezmoi
fi

# Initialize chezmoi with this repository
info "Initializing chezmoi..."
if [[ -d "$HOME/.local/share/chezmoi" ]]; then
    info "chezmoi already initialized, updating..."
    chezmoi update --apply
else
    # Prompt for GitHub username (defaults to mathiaskluge)
    echo ""
    read -p "GitHub username for dotfiles repo [{github_username}/dotfiles]: " github_user
    github_user=${github_user:-mathiaskluge}

    chezmoi init --apply ${github_user}/dotfiles
fi

success "Dotfiles installation complete!"
echo ""
info "To update your dotfiles in the future, run: chezmoi update"
info "To see what would change, run: chezmoi diff"
info "To manually apply changes, run: chezmoi apply"
