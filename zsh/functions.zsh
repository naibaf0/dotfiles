#==============================================================================
# Create new directory and cd into it
#==============================================================================
alias md='__make_and_change_directory'

__make_and_change_directory() {
    for v in "$@"
    do
        mkdir "$v"
        cd "$v"
    done
}

#==============================================================================
# Extract an archive
#==============================================================================
extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)        tar xjf $1        ;;
      *.tar.gz)         tar xzf $1        ;;
      *.bz2)            bunzip2 $1        ;;
      *.rar)            unrar x $1        ;;
      *.gz)             gunzip $1         ;;
      *.tar)            tar xf $1         ;;
      *.tbz2)           tar xjf $1        ;;
      *.tgz)            tar xzf $1        ;;
      *.zip)            unzip $1          ;;
      *.Z)              uncompress $1     ;;
      *)                echo "'$1' cannot be extracted via extract()" ;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#==============================================================================
# Useful enter-key
#==============================================================================
__magic-enter () {
  if [[ -z $BUFFER ]]; then
    echo ""
    if git rev-parse --is-inside-work-tree &>/dev/null; then
      git status
    else
      ls
    fi
    zle redisplay
  else
    zle accept-line
  fi
}
zle -N __magic-enter
bindkey "^M" __magic-enter

