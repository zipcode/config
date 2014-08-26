export HISTCONTROL="ignoreboth"
export HISTTIMEFORMAT="%m/%d %T "
export CLICOLOR=""
export EDITOR="/usr/bin/emacs"
export SYSSCREENRC=""

# Ensure PS1 magic is in scope
. $HOME/config/scripts/prompt.sh

sl() { ls $@ | cowsay -n; }
alias fast="env EDITOR=/bin/true "

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
