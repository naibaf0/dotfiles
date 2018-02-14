DIR="$HOME/.zim"

#!/bin/bash
if [ ! -d "$DIR" ]; then
    echo "  Installing zim";
    git clone --recursive https://github.com/Eriner/zim.git ${ZDOTDIR:-${HOME}}/.zim
else
    echo "  Skipping zim: already installed"
fi

POWERLEVEL9KDIR="$DIR/modules/prompt/external-themes/powerlevel9k"

if [ ! -d "$POWERLEVEL9KDIR" ]; then
    echo "  Installing powerlevel9k theme";
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.zim/modules/prompt/external-themes/powerlevel9k
    ln -s ~/.zim/modules/prompt/external-themes/powerlevel9k/powerlevel9k.zsh-theme ~/.zim/modules/prompt/functions/prompt_powerlevel9k_setup
else
    echo "  Skipping powerlevel9k theme: already installed"
fi

exit
