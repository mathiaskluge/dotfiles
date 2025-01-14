# zsh Options
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_VERIFY
setopt SHARE_HISTORY

# Custom zsh
[ -f "$HOME/.config/zsh/custom.zsh" ] && source "$HOME/.config/zsh/custom.zsh"

# Aliases
[ -f "$HOME/.config/zsh/aliases.zsh" ] && source "$HOME/.config/zsh/aliases.zsh"
