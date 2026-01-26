# Dotfiles

Modern macOS dotfiles managed with [chezmoi](https://www.chezmoi.io/) and [Homebrew](https://brew.sh/).

One command to set up a new Mac from scratch.

---

## Quick Start

### Fresh Mac Setup

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/mathiaskluge/dotfiles/main/install.sh)"
```

This installs Xcode CLI tools, Homebrew, chezmoi, and applies all your dotfiles and packages.

**Time:** ~15-30 minutes depending on internet speed.

---

## What's Included

**Tools:** Node.js, Go, Neovim, GitHub CLI, Tmux, Eza, Ripgrep
**Apps:** 1Password, Docker, Ghostty, AeroSpace, Obsidian, Zen Browser
**Configs:** Zsh, Neovim (LSP + completion), Tmux, Git, AeroSpace, Ghostty
**macOS:** Optimized system preferences for development

---

## Daily Workflow

### Making Changes

Edit files directly in your home directory, then sync back to the repo:

```bash
# Edit any config file normally
nvim ~/.zshrc

# Add changes to chezmoi
chezmoi add ~/.zshrc

# Commit and push from chezmoi source directory
chezmoi cd
git add .
git commit -m "Update zsh config"
git push
exit
```

**Shortcut:** Use `chezmoi edit ~/.zshrc` to edit the source file directly, then commit from `~/.local/share/chezmoi`.

### Pulling Updates

To pull and apply changes from GitHub:

```bash
chezmoi update
```

### Adding New Configs

```bash
# Add a new file to chezmoi
chezmoi add ~/.config/newapp/config

# Commit and push
chezmoi cd
git add .
git commit -m "Add newapp config"
git push
exit
```

### Adding New Packages

```bash
# Edit Brewfile
chezmoi edit ~/.Brewfile

# Add your package
# brew "package-name"
# cask "app-name"

# Apply (this auto-installs packages)
chezmoi apply

# Commit and push
chezmoi cd
git add .
git commit -m "Add new packages"
git push
exit
```

---

## Useful Commands

```bash
chezmoi diff              # See what would change
chezmoi apply             # Apply all changes
chezmoi managed           # List managed files
chezmoi status            # Check for differences
chezmoi cd                # Go to source directory
```

---

## Repository Structure

```
dotfiles/
├── install.sh                   # Bootstrap script
├── .chezmoi.toml.tmpl          # Config prompts (name/email)
└── home/                        # Managed files
    ├── .chezmoiscripts/         # Auto-run scripts
    ├── dot_Brewfile             # Packages
    ├── dot_gitconfig.tmpl       # Git config
    ├── dot_zshrc                # Zsh config
    └── dot_config/              # App configs
        ├── nvim/
        ├── tmux/
        ├── ghostty/
        └── aerospace/
```

Files in `home/` are managed by chezmoi:
- `dot_file` → `~/.file`
- `dot_config/app/` → `~/.config/app/`

---

## Keybindings Reference

### AeroSpace (Window Manager)
*Prefix: `alt` (⌥)*

**Navigation**
- `⌥h/j/k/l` - Focus window
- `⌥⇧h/j/k/l` - Move window
- `⌥1-4` - Switch workspace
- `⌥⇧1-4` - Move to workspace

**Layout**
- `⌥/` - Toggle split direction
- `⌥⇧;` - Service mode

### Tmux
*Prefix: `Ctrl-Space` (⌃⎵)*

**Windows**
- `⌃⎵c` - New window
- `⌃⎵p/n` - Previous/next window
- `⌃⎵0-9` - Go to window

**Panes**
- `⌃⎵%` - Split horizontal
- `⌃⎵"` - Split vertical
- `⌃h/j/k/l` - Navigate (vim-style)

### Neovim
*Leader: `Space` (⎵)*

**Files**
- `⎵sf` - Search files
- `⎵sg` - Live grep
- `⎵⎵` - Buffer picker

**LSP**
- `gd` - Go to definition
- `gr` - References
- `K` - Hover docs
- `⎵rn` - Rename
- `⎵ca` - Code actions

**Buffers**
- `⇥/⇧⇥` - Next/prev buffer
- `⎵x` - Close buffer

---

## Troubleshooting

**Installation fails:**
```bash
# Check prerequisites
xcode-select -p
brew --version

# Reinitialize
rm -rf ~/.local/share/chezmoi
bash -c "$(curl -fsSL https://raw.githubusercontent.com/mathiaskluge/dotfiles/main/install.sh)"
```

**Packages not installing:**
```bash
brew bundle --global
```

**See what chezmoi would do:**
```bash
chezmoi diff
chezmoi apply --dry-run --verbose
```

---

## License

MIT
