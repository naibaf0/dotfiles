DIR="$HOME/.zim"

#!/bin/bash
if [ ! -d "$DIR" ]; then
    echo "  Installing zim";
    git clone --recursive https://github.com/Eriner/zim.git ${ZDOTDIR:-${HOME}}/.zim
else
    echo "  Skipping zim: already installed"
fi
