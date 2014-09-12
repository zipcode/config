if [ -f ~/.bashrc ] ; then
  . ~/.bashrc
fi

# Check that we're a top-level shell
#if [ "x$SHLVL" == "x1" ]; then
    # Custom prompt
    setps1
#fi

function watch-coffee {
  fswatch -r0 . | xargs -0 -n 1 coffee-check
}
