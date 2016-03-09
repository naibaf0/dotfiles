###############################################################################
# Use zgen
###############################################################################

source "${ZSH}"/zgen/zgen.zsh

if ! zgen saved; then
  echo "Creating a zgen save."

  # prezto options
  zgen prezto editor key-bindings 'emacs'
  zgen prezto editor dot-expansion 'yes'
  zgen prezto ssh identities 'id_rsa'
#  zgen prezto tmux:auto-start local 'yes'
  zgen prezto '*:*' color 'yes'
  zgen prezto terminal auto-title 'yes'

  # prezto plugins
  zgen prezto
  zgen prezto git
  zgen prezto node
  zgen prezto command-not-found
  zgen prezto tmux

  # plugins
  zgen load djui/alias-tips
  zgen load nojhan/liquidprompt
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-history-substring-search

  zgen save
fi

#
# Terminal
#

# Auto set the tab and window titles.
# zstyle ':prezto:module:terminal' auto-title 'yes'

# Set the window title format.
# zstyle ':prezto:module:terminal:window-title' format '%n@%m: %s'

# Set the tab title format.
# zstyle ':prezto:module:terminal:tab-title' format '%m: %s'

#
# Tmux
#

# Auto start a session when Zsh is launched in a SSH connection.
#zstyle ':prezto:module:tmux:auto-start' remote 'yes'
