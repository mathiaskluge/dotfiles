# Dotfiles Project - Claude Context

## Project Overview
This is a modern macOS dotfiles repository managed with chezmoi and Homebrew. It provides a one-command setup for a new Mac with all development tools, applications, and configurations.

## Core Technologies
- **chezmoi**: Dotfile manager that handles templating and deployment
- **Homebrew**: Package manager for macOS applications and tools
- **Zsh**: Default shell with custom configuration
- **Git**: Version control for tracking dotfile changes

## Repository Structure

```
dotfiles/
├── install.sh                   # Bootstrap script for fresh Mac setup
├── .chezmoi.toml.tmpl          # Chezmoi config with user prompts (name/email)
├── .chezmoiignore              # Files to ignore in chezmoi
├── .chezmoiroot                # CRITICAL: Points chezmoi to 'home/' subdirectory
├── claude.md                    # This file - context for Claude Code
└── home/                        # Managed files (deployed to ~/)
    ├── .chezmoiscripts/         # Auto-run scripts during apply
    │   ├── run_onchange_after_install-packages.sh.tmpl
    │   └── run_once_after_setup-macos.sh.tmpl
    ├── dot_Brewfile             # Homebrew packages/apps list
    ├── dot_gitconfig.tmpl       # Git configuration (templated)
    ├── dot_zshrc                # Zsh shell configuration
    ├── dot_hushlogin            # Suppress login message
    └── dot_config/              # Application configs
        ├── nvim/                # Neovim configuration
        ├── tmux/                # Tmux configuration
        ├── ghostty/             # Ghostty terminal config
        ├── aerospace/           # AeroSpace window manager
        └── zsh/                 # Zsh modules
            ├── aliases.zsh
            └── custom.zsh
```

## File Naming Convention
Chezmoi uses special prefixes:
- `dot_filename` → `~/.filename`
- `dot_config/app/` → `~/.config/app/`
- `.tmpl` suffix → Template file (processed with user variables)

## Key Files

### .chezmoiroot (CRITICAL)
**Contains:** `home`

This file is ESSENTIAL for the repository to work. It tells chezmoi that the actual dotfile sources are in the `home/` subdirectory, not the repository root. Without this file:
- `chezmoi init` would create a literal `home/` folder in your home directory
- None of your dotfiles would be deployed correctly
- Files like `install.sh` would incorrectly appear in `~/`

This allows keeping the repository organized with documentation and scripts at the root level while all chezmoi source files live in `home/`.

### install.sh
Bootstrap script that:
1. Installs Xcode Command Line Tools
2. Installs Homebrew
3. Installs chezmoi
4. Initializes dotfiles from GitHub
5. Runs all setup scripts

### home/dot_Brewfile
Defines all Homebrew packages to install:
- CLI tools (node, go, neovim, gh, tmux, eza, ripgrep, etc.)
- GUI apps (1Password, Docker, Ghostty, AeroSpace, Obsidian, Zen Browser)

### home/.chezmoiscripts/
Scripts that run automatically:
- `run_onchange_*` - Runs when file changes
- `run_once_*` - Runs only once
- Scripts install packages and configure macOS defaults

## Development Workflow

### Making Changes to Dotfiles
1. Edit files in home directory: `nvim ~/.zshrc`
2. Add to chezmoi: `chezmoi add ~/.zshrc`
3. Commit from chezmoi source dir:
   ```bash
   chezmoi cd
   git add .
   git commit -m "Update config"
   git push
   exit
   ```

### Testing Changes
```bash
chezmoi diff              # Preview changes
chezmoi apply --dry-run   # Test apply without making changes
chezmoi apply             # Apply changes
```

### Adding New Packages
Edit `home/dot_Brewfile` and run `chezmoi apply` (auto-installs packages via the onchange script)

## Important Commands
```bash
chezmoi diff              # Show pending changes
chezmoi apply             # Apply all dotfiles
chezmoi update            # Pull from git and apply
chezmoi managed           # List all managed files
chezmoi cd                # Navigate to source directory
```

## Setup & Installation
Fresh Mac: Run the install script from GitHub
Existing setup: `chezmoi update` to pull and apply changes

## Common Issues & Fixes

### Problem: `home/` folder appears in `~/` after chezmoi init/apply
**Cause:** Missing or incorrect `.chezmoiroot` file
**Solution:** Ensure `.chezmoiroot` exists in repository root and contains exactly: `home`

### Problem: Dotfiles not deploying to home directory
**Cause:** Same as above - chezmoi doesn't know where source files are
**Fix:** Create `.chezmoiroot` with content `home` and run `chezmoi apply` again

## Notes for Claude
- **CRITICAL:** The `.chezmoiroot` file MUST exist and contain `home` for this repository to work
- Files in `home/` are the source of truth for all dotfiles
- Never edit files in `~/.local/share/chezmoi` directly - use chezmoi commands
- `.tmpl` files use Go templates with user data from `.chezmoi.toml.tmpl`
- Scripts in `.chezmoiscripts/` execute during `chezmoi apply`
- The Brewfile manages ALL packages - modify it to add/remove software
- When troubleshooting deployment issues, first check that `.chezmoiroot` exists
