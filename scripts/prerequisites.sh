#!/bin/bash

# Get the absolute path of the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

. $SCRIPT_DIR/utils.sh

install_xcode() {
    info "Installing Apple's CLI tools (prerequisites for Git and Homebrew)..."
    if xcode-select -p >/dev/null; then
        warning "xcode is already installed"
    else
        xcode-select --install
        sudo xcodebuild -license accept
    fi
}

install_homebrew() {
    info "Installing Homebrew..."
    export HOMEBREW_CASK_OPTS="--appdir=/Applications"

    if hash brew &>/dev/null; then
        warning "Homebrew already installed"
    else
        sudo --validate
        NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    fi

    # Check if Homebrew is installed and the path is not set
    if [ ! -d "/opt/homebrew/bin" ] && [ ! -d "/usr/local/bin" ]; then
        warning "Homebrew installation failed or Homebrew is not in the expected directory."
        return 1
    fi

    # Add Homebrew to the PATH if it's not already there
    if [[ "$SHELL" == *"zsh"* ]]; then
        SHELL_CONFIG_FILE="$HOME/.zshrc"
    else
        SHELL_CONFIG_FILE="$HOME/.bash_profile"
    fi

    # Determine the Homebrew binary path
    if [ -d "/opt/homebrew/bin" ]; then
        HOMEBREW_BIN="/opt/homebrew/bin"
    else
        HOMEBREW_BIN="/usr/local/bin"
    fi

    # Add Homebrew to the PATH in the correct shell config file
    if ! grep -q "$HOMEBREW_BIN" "$SHELL_CONFIG_FILE"; then
        echo "export PATH=\"$HOMEBREW_BIN:\$PATH\"" >> "$SHELL_CONFIG_FILE"
        info "Added Homebrew to PATH in $SHELL_CONFIG_FILE. Please restart your terminal or run 'source $SHELL_CONFIG_FILE'."
    else
        info "Homebrew is already in the PATH."
    fi
}

if [ "$(basename "$0")" = "$(basename "${BASH_SOURCE[0]}")" ]; then
    install_xcode
    install_homebrew
fi
