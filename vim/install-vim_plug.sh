FILE="$HOME/.vim/autoload/plug.vim"

#!/bin/bash
if [ ! -f "$FILE" ]; then
    echo "Installing vim-plug";
    mkdir -p $(dirname "$FILE")
    curl -fLo "$FILE" --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim";
else
    echo "vim-plug already installed"
fi
exit
