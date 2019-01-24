DIR="$HOME/.zim"

#!/bin/bash
if [ ! -d "$DIR" ]; then
    echo "  Installing zim";
    curl -s --proto -all,+https https://raw.githubusercontent.com/zimfw/install/develop/install.zsh | zsh
else
    echo "  Skipping zim: already installed"
fi
