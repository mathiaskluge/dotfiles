# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
export HOMEBREW_NO_AUTO_UPDATE=1

# Auto-start tmux session if not in Cursor, VSCode, or already in tmux
if which tmux >/dev/null 2>&1; then
  if [[ -z "$TMUX" && \
        -z "$CURSOR_ENVIRONMENT" && \
        -z "$VSCODE_INJECTION" && \
        $TERM != "screen-256color" && \
        $TERM != "screen" && \
        -z "$INSIDE_EMACS" && \
        -z "$EMACS" && \
        -z "$VIM" && \
        -z "$INTELLIJ_ENVIRONMENT_READER" ]]; then
    tmux attach -t default || tmux new -s default
  fi
fi

# Plugins
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(starship init zsh)"
