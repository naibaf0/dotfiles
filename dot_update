#!/bin/sh
#
# dot_update
#
# `dot_update` handles installation, updates, things like that. Run it
# periodically to make sure you're on the latest and greatest.
set -x

cd ~/.dotfiles
git pull
git submodule update --init --recursive

cd ~
vim +PlugUpgrade +qa
vim +PlugUpdate! +qa

cd .zim
git submodule update --init --recursive

exit 1
