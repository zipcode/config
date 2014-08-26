function setps1 {
  local bl='\[\033[30m\]'
  local r='\[\033[31m\]'
  local g='\[\033[32m\]'
  local y='\[\033[33m\]'
  local b='\[\033[34m\]'
  local m='\[\033[35m\]'
  local c='\[\033[36m\]'
  local w='\[\033[37m\]'

  local N='\[\033[0m\]'
  local B='\[\033[1m\]'

  local remote=""

  if [ ! "x$SSH_TTY" == "x" ]; then
      remote="${g}\h "
  fi

  export PS1="\
$N$B$bl\!$w $remote\$(is_afs '${N}${m}afs:${B}')$m\W$N \$(get_git_branch '$g%s$N ')\
$B$r\${?/0/}$N$w\$(get_git_status)$y\$ $N\
"
}

function is_afs {
    s=$?
    if $(pwd -P | grep --quiet "^/afs/"); then
	printf "$1"
    fi;
    return $s
}

function get_git_status {
    s=$?
    if $(pwd -P | grep --quiet "^/afs/"); then return $s; fi
    if git_status=$(git status 2>/dev/null | grep 'added to commit' 2>/dev/null); then
	echo "●";
    elif git_status=$(git status 2>/dev/null | grep 'Changes to be committed' 2>/dev/null); then
	echo "○";
    fi;
    return $s
}

function get_git_branch {
    s=$?
    if $(pwd -P | grep --quiet "^/afs/"); then return $s; fi
    #r=`git name-rev HEAD 2>/dev/null | cut '-d ' -f 2`
    r=`git branch 2>/dev/null | grep '^*' | cut '-d ' -f 2-`
    [ "x$1" == "x" ] && f="(%s)" || f=$1
    [ "x$r" != "x" ] && printf "$f" $r
    return $s
}
