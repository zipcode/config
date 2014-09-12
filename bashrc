export HISTCONTROL="ignoreboth"
export HISTTIMEFORMAT="%m/%d %T "
export CLICOLOR=""
export EDITOR="/usr/bin/emacs"
export SYSSCREENRC=""

# Ensure PS1 magic is in scope
. $HOME/config/scripts/prompt.sh
. $HOME/config/scripts/completion.sh

# root path
export PATH="$HOME/root/bin:$PATH"

# Brew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

sl() { ls $@ | cowsay -n; }
alias fast="env EDITOR=/bin/true "

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Syntax highlighting in less
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '
alias hcat='/usr/local/bin/src-hilite-lesspipe.sh'
