DIR="$HOME/.zim"

#!/bin/bash
if [ ! -d "$DIR" ]; then
    echo "  Installing zim";
    curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
else
    echo "  Skipping zim: already installed"
fi
