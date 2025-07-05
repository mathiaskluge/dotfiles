# Dotfiles

Contains my configs and scripts to setup a consistent macOS environment across different machines.

## Setup

To start the setup, run:

```
# if not executable
chmod +x install.sh

./install.sh
```

And follow the on-screen promts.

## Adding configs and software

1. Add config dir/file within repository
2. Update `symlink_config.conf`
3. To add software, update `homebrew/Brewfile`
4. Run `./install.sh` to install software and link new configs

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
