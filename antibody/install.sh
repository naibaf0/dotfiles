VERSION="v0.4.0"
mkdir -p ~/.dotfiles/antibody/antibody
wget -O /tmp/antibody.tar.gz \
    "https://github.com/getantibody/antibody/releases/download/$VERSION/antibody_linux_amd64.tar.gz"
tar xvzf /tmp/antibody.tar.gz -C ~/.dotfiles/antibody/antibody
