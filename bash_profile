if [ -f ~/.bashrc ] ; then
  . ~/.bashrc
fi

# Check that we're a top-level shell
#if [ "x$SHLVL" == "x1" ]; then
    # Custom prompt
    setps1
#fi

# Git completion
#source ~/.git-completion.bash

# Brew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
