# Dotfiles

My macOS dotfiles managed with [chezmoi](https://www.chezmoi.io/) and [Homebrew](https://brew.sh/).

Sets up a new Mac with on command and manages configs accross devices.

---

## What it does

1. InstallsXcode CLI tools, Homebrew, chezmoi
2. Initializes chezmoi with this dotfiles repo and applies it
3. Applies macOS settings
4. Installs software via homebrew

---

## Setup

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/mathiaskluge/dotfiles/main/install.sh)"
```

---

## How to use

Use the install script as is. It prompts for a GitHub username to intialize chezmoi (requires this repo structure `{github_username}/dotfiles`).

Or use the enitire structure replace contents of `home/` (the managed files by chezmoi) with your personal configs.

Note:
- [run_once_after_setup-macos.sh.tmpl](https://github.com/mathiaskluge/dotfiles/blob/main/home/.chezmoiscripts/run_once_after_setup-macos.sh.tmpl) applies macOS settings. Customize or remove
- [.chezmoi.toml.tmpl](https://github.com/mathiaskluge/dotfiles/blob/main/.chezmoi.toml.tmpl) captures name and email to be used in e.g. a gitconfig. Use or remove.

---

### Manage configs

```bash
# Fetch and Apply changes to dotfiles repo
chezmoi update

```

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
