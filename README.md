# Dotfiles

My macOS dotfiles managed with [chezmoi](https://www.chezmoi.io/) and [Homebrew](https://brew.sh/).

Sets up a new Mac with a single command and manages configs accross devices.

## What it does

1. InstallsXcode CLI tools, Homebrew, chezmoi
2. Initializes chezmoi with a github dotfiles repo and applies it
3. Applies macOS settings
4. Installs software via homebrew

## Setup

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/mathiaskluge/dotfiles/main/install.sh)"
```

## How to use

Use the install script as is. It prompts for a GitHub username to intialize chezmoi (requires this repo structure `{github_username}/dotfiles`).

Or use the entire structure and replace contents of `/home` (the managed files by chezmoi) with your personal configs.

Note:
- [run_once_after_setup-macos.sh.tmpl](https://github.com/mathiaskluge/dotfiles/blob/main/home/.chezmoiscripts/run_once_after_setup-macos.sh.tmpl) applies macOS settings. Customize or remove
- [.chezmoi.toml.tmpl](https://github.com/mathiaskluge/dotfiles/blob/main/.chezmoi.toml.tmpl) captures name and email to be used for gitconfig. Use or remove.

## Updates

After changes to dotfile repo run on local machine

```bash
chezmoi update
```

Optional: `chezmoi status` shows pending diffs. `chezmoi apply` reapplies the current source state without fetching remote changes.

## Keybindings

### tmux

Leader: `Ctrl+s`

| Action | Keys |
| --- | --- |
| Focus pane left/down/up/right | `Ctrl+s h/j/k/l` |
| New pane right / below | `Ctrl+s %` / `Ctrl+s "` |
| New window | `Ctrl+s c` |
| Rename window | `Ctrl+s ,` |
| Rename pane title (no direct bind) | `Ctrl+s :` then `select-pane -T <name>` |
| Kill pane / window | `Ctrl+s x` / `Ctrl+s &` |
| TPM install / update plugins | `Ctrl+s I` / `Ctrl+s U` |

### AeroSpace

Leader: `Option`

| Action | Keys |
| --- | --- |
| Focus window | `Option+h/j/k/l` |
| Move window | `Option+Shift+h/j/k/l` |
| Resize window | `Option+Shift+-` / `Option+Shift+=` |
| Toggle tiles / accordion layout | `Option+/` / `Option+,` |
| Workspace `1`-`4` | `Option+1/2/3/4` |
| Workspace `Terminal` / `Notes` | `Option+t` / `Option+n` |
| Send window to workspace | `Option+Shift+1/2/3/4`, `Option+Shift+t`, `Option+Shift+n` |
| Previous workspace | `Option+Tab` |
| Move current workspace to next monitor | `Option+Shift+Tab` |
| Enter service mode | `Option+Shift+;` |

Service mode:

| Action | Keys |
| --- | --- |
| Reload config and leave service mode | `Esc` |
| Reset layout tree | `r` |
| Toggle floating / tiling | `f` |
| Close all windows except current | `Backspace` |
| Join with left/down/up/right | `Option+Shift+h/j/k/l` |

### nvim

Leader: `Space`

| Action | Keys |
| --- | --- |
| Find files | `Space ff` |
| Live grep | `Space fg` |
| Buffers | `Space fb` or `Space Space` |
| Recent files | `Space fr` |
| Grep word under cursor | `Space fw` |
| Help tags | `Space fh` |
| Search current buffer | `Space /` |
| Harpoon add file | `Space a` |
| Harpoon menu | `Space h` |
| Harpoon slots `1`-`4` | `Space 1/2/3/4` |

Lazy UI:

| Action | Keys |
| --- | --- |
| Open plugin manager | `:Lazy` |
| Help | `?` |
| Install / update / sync | `I` / `U` / `S` |
| Check / clean / restore | `C` / `X` / `R` |
| Show details / close | `Enter` / `q` |
