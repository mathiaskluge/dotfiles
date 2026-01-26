# Dotfiles

Modern, automated macOS dotfiles powered by [chezmoi](https://www.chezmoi.io/) and [Homebrew](https://brew.sh/).

One-command setup for a consistent development environment across all your Macs.

---

## Quick Start

### Fresh Mac Setup

Run this single command:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/mathiaskluge/dotfiles/main/install.sh)"
```

This will:
1. Install Xcode Command Line Tools
2. Install Homebrew
3. Install chezmoi
4. Prompt for your name and email (for git config)
5. Clone and apply all dotfiles
6. Install all packages via Homebrew
7. Configure macOS system defaults

**Time:** ~15-30 minutes (depending on internet speed)

---

## What's Included

### Applications & Tools
- **Development:** Node.js, Go, Neovim, GitHub CLI
- **Terminal:** Zsh (with autosuggestions & syntax highlighting), Tmux, Ghostty, Eza
- **Window Management:** AeroSpace (tiling window manager)
- **Utilities:** 1Password, Docker, KeepingYouAwake, Obsidian, VLC
- **Browsers:** Zen Browser, Yaak (API client)
- **Fonts:** JetBrains Mono Nerd Font

### Configurations
- **Zsh:** Custom aliases, auto-suggestions, syntax highlighting, auto-start tmux
- **Neovim:** Complete IDE setup with LSP, completion, Telescope, Treesitter
- **Tmux:** Sensible defaults with vim navigation integration
- **Ghostty:** Modern terminal emulator configuration
- **AeroSpace:** Tiling window manager with vim-style keybindings
- **Git:** Configured with your name/email, sensible aliases
- **macOS:** System preferences optimized for development

---

## Existing Mac (Update)

If you already have the dotfiles installed:

```bash
# Pull latest changes and apply
chezmoi update
```

To see what would change before applying:
```bash
chezmoi diff
```

---

## Extending Your Dotfiles

### Adding a New Configuration File

1. Add the file to chezmoi:
   ```bash
   chezmoi add ~/.config/newapp/config
   ```

2. Edit it through chezmoi:
   ```bash
   chezmoi edit ~/.config/newapp/config
   ```

3. Apply changes:
   ```bash
   chezmoi apply
   ```

### Adding a New Package

1. Edit the Brewfile:
   ```bash
   chezmoi edit ~/.Brewfile
   ```

2. Add your package:
   ```ruby
   # For a CLI tool
   brew "package-name"

   # For a GUI application
   cask "app-name"
   ```

3. Apply changes (this will automatically run brew bundle):
   ```bash
   chezmoi apply
   ```

### Updating Existing Configs

```bash
# Edit any config file
chezmoi edit ~/.zshrc

# Or edit directly in the source directory
chezmoi cd
nvim home/dot_zshrc
exit

# Apply changes
chezmoi apply
```

---

## Repository Structure

```
dotfiles/
├── README.md                    # This file
├── install.sh                   # Bootstrap script
├── .chezmoi.toml.tmpl          # Chezmoi config (prompts for name/email)
├── .chezmoiignore              # Files to ignore
└── home/                        # Chezmoi source directory
    ├── .chezmoiscripts/         # Auto-run scripts
    │   ├── run_onchange_after_install-packages.sh.tmpl
    │   └── run_once_after_setup-macos.sh.tmpl
    ├── dot_Brewfile             # Homebrew package definitions (~/.Brewfile)
    ├── dot_gitconfig.tmpl       # Git configuration
    ├── dot_zshrc                # Zsh configuration
    ├── dot_hushlogin            # Suppress login message
    └── dot_config/              # XDG config directory
        ├── zsh/                 # Zsh scripts
        ├── nvim/                # Neovim configuration
        ├── tmux/                # Tmux configuration
        ├── ghostty/             # Ghostty configuration
        └── aerospace/           # AeroSpace configuration
```

---

## Common Tasks

### Update Everything
```bash
# Update dotfiles
chezmoi update

# Update Homebrew packages
brew update && brew upgrade

# Update nvim plugins (from within nvim)
:Lazy sync
```

### View Managed Files
```bash
chezmoi managed
```

### Check Dotfiles Status
```bash
chezmoi status
```

### Manually Apply Single File
```bash
chezmoi apply ~/.zshrc
```

### Edit Config in Your Editor
```bash
# Opens source file in $EDITOR
chezmoi edit ~/.config/nvim/init.lua

# Apply after editing
chezmoi apply
```

### Re-run macOS Defaults
If you want to re-apply macOS system defaults, remove the script marker:
```bash
chezmoi state delete-bucket --bucket=scriptState
chezmoi apply
```

---

## Troubleshooting

### Installation Fails
```bash
# Check prerequisites
xcode-select -p
brew --version

# Reinstall chezmoi
brew reinstall chezmoi

# Re-initialize dotfiles
chezmoi init --apply mathiaskluge/dotfiles
```

### Configs Not Applying
```bash
# Dry run to see what would change
chezmoi diff

# Force apply
chezmoi apply --force
```

### Homebrew Packages Not Installing
```bash
# Check Brewfile location
ls ~/.Brewfile

# Manually run bundle
brew bundle --global
```

### Remove All Dotfiles
```bash
# See what would be removed
chezmoi managed

# Remove managed files (WARNING: destructive)
chezmoi purge
```

---

## Keybindings Reference

### AeroSpace (Window Manager)
*Prefix: `alt` (⌥)*

#### Window Navigation
- `⌥h/j/k/l` - Focus window left/down/up/right
- `⌥⇧h/j/k/l` - Move window left/down/up/right
- `⌥⇧-` - Resize window smaller
- `⌥⇧=` - Resize window larger

#### Workspace Management
- `⌥1/2/3/4` - Switch to workspace 1/2/3/4
- `⌥n/s/t` - Switch to workspace N/S/T
- `⌥⇧1/2/3/4` - Move window to workspace 1/2/3/4
- `⌥⇧n/s/t` - Move window to workspace N/S/T
- `⌥⇥` - Switch to last workspace
- `⌥⇧⇥` - Move workspace to next monitor

#### Layout Management
- `⌥/` - Toggle tiles horizontal/vertical
- `⌥,` - Toggle accordion horizontal/vertical
- `⌥⇧;` - Enter service mode

#### Service Mode (`⌥⇧;`)
- `Esc` - Reload config and exit service mode
- `r` - Reset layout (flatten workspace tree)
- `f` - Toggle floating/tiling layout
- `⌫` - Close all windows but current
- `⌥⇧h/j/k/l` - Join with adjacent window

### Tmux
*Prefix: `Ctrl-Space` (⌃⎵)*

#### Session Management
- `⌃⎵c` - Create new window (in current path)
- `⌃⎵,` - Rename current window
- `⌃⎵d` - Detach from session

#### Window Navigation
- `⌃⎵p` - Previous window
- `⌃⎵n` - Next window
- `⌃⎵0-9` - Switch to window by number
- `⌃⎵w` - List windows
- `⌃⎵x` - Kill current pane

#### Pane Management
- `⌃⎵%` - Split window horizontally
- `⌃⎵"` - Split window vertically
- `⌃⎵{` - Swap pane left
- `⌃⎵}` - Swap pane right
- `⌃⎵z` - Zoom/unzoom pane
- `⌃⎵q` - Show pane numbers

#### Navigation (with vim-tmux-navigator)
- `⌃h/j/k/l` - Navigate between tmux panes and vim splits

### Neovim
*Leader: `Space` (⎵)*

#### Basic Movement
- `j/k` - Move down/up (with line wrap support)
- `⌃d/⌃u` - Page down/up (centered)
- `n/N` - Next/previous search result (centered)

#### Buffer Management
- `⇥` - Next buffer
- `⇧⇥` - Previous buffer
- `⎵x` - Close buffer
- `⎵b` - New buffer
- `⎵⎵` - Buffer picker

#### File/Search (Telescope)
- `⎵sf` - Search files
- `⎵sg` - Live grep
- `⎵sw` - Search word under cursor
- `⎵sb` - Search buffers
- `⎵?` - Recent files
- `⎵/` - Fuzzy search in current buffer
- `⎵s/` - Search in open files

#### Git (Telescope)
- `⎵gf` - Git files
- `⎵gc` - Git commits
- `⎵gcf` - Git commits for current file
- `⎵gb` - Git branches
- `⎵gs` - Git status

#### LSP (Language Server)
- `gd` - Go to definition
- `gr` - Go to references
- `gI` - Go to implementation
- `gD` - Go to declaration
- `K` - Show hover documentation
- `⎵D` - Type definition
- `⎵rn` - Rename symbol
- `⎵ca` - Code action
- `⎵ds` - Document symbols
- `⎵ws` - Workspace symbols

#### Completion (Insert Mode)
- `⌃k/⌃j` - Previous/next completion item
- `⌃⎵` - Trigger completion
- `⌃e` - Close completion
- `⌃d/⌃f` - Scroll docs in completion
- `⏎` - Accept completion

#### Diagnostics & Formatting
- `⎵d` - Show diagnostics
- `⎵do` - Toggle diagnostics
- `⎵q` - Diagnostics quickfix list
- `]d` - Next diagnostic
- `[d` - Previous diagnostic
- `⎵f` - Format buffer

#### Editing
- `x` - Delete character (no clipboard)
- `⎵lw` - Toggle line wrap
- `</>` - Indent/outdent (visual mode, stays selected)
- `Esc` - Clear search highlight

#### Telescope Navigation (within picker)
- `⌃k/⌃j` - Previous/next result
- `⌃l` - Select file
- `q` - Close picker (normal mode)

#### Buffer picker specific
- `d` - Delete buffer
- `l` - Select buffer

---

## Resources

- [chezmoi Documentation](https://www.chezmoi.io/)
- [Homebrew Documentation](https://docs.brew.sh/)
- [AeroSpace Documentation](https://nikitabobko.github.io/AeroSpace/)
- [Neovim Documentation](https://neovim.io/doc/)

---

## License

MIT License - Use freely!
