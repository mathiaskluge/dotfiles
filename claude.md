# Dotfiles - Claude Context

## Chezmoi Architecture

### .chezmoiroot (CRITICAL)
**Contains:** `home`

This file tells chezmoi that source files are in the `home/` subdirectory, not the repo root. Without it:
- `chezmoi init` creates a literal `home/` folder in `~/`
- Dotfiles won't deploy correctly
- Root files like `install.sh` would incorrectly appear in `~/`

**Always verify this file exists when troubleshooting deployment issues.**

### File Naming Convention
Chezmoi uses special prefixes:
- `dot_filename` → `~/.filename`
- `dot_config/app/` → `~/.config/app/`
- `.tmpl` suffix → Template file (processed with Go templates)

### Templating System
`.chezmoi.toml.tmpl` defines user variables via `promptStringOnce`:
- Prompts appear during `chezmoi init --apply`
- Variables available in `.tmpl` files as `{{ .variable }}`
- Currently used: `{{ .name }}` and `{{ .email }}` in `home/dot_gitconfig.tmpl`

### Auto-Run Scripts
`home/.chezmoiscripts/` contains scripts that execute during `chezmoi apply`:
- `run_onchange_*` - Runs when the script file changes
- `run_once_*` - Runs only once (tracked in chezmoi state)
- Current scripts: package installation, macOS defaults configuration

## Working with This Repo

**File locations:**
- Source files: `home/` directory in this repo
- Chezmoi source dir: `~/.local/share/chezmoi/` (never edit directly)
- Deployed files: `~/` (edit here, then `chezmoi add`)

**Package management:**
- All packages defined in `home/dot_Brewfile`
- Auto-installed via `run_onchange_after_install-packages.sh.tmpl`
- To add packages: edit Brewfile, then `chezmoi apply`

**When helping with configs:**
- Edit files in `home/` directory (source of truth)
- Respect existing file naming conventions
- Use `.tmpl` suffix only when templating is needed
- Check if similar configs exist before creating new patterns
