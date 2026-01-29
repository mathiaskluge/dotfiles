# Git
alias g='git'
alias ga='git add'
alias gs='git status'
alias gss='git status -s'
alias gd='git diff'
alias glo='git pull origin'
alias gpo='git push origin'
alias gc='git commit -v'
alias gcm='git commit -m'
alias gmom='git fetch && git merge origin/main'
alias gcl='git reset --hard && git clean -fd'

# Directory shortcuts (use: cd ~ws, ~101, or directly in paths like ls ~ws/project)
hash -d ws=$HOME/workspace
hash -d 101="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/101"

# eza
alias ls="eza --all --icons=always"
