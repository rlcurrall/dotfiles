#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )";

source "$DIR/install_apt.sh";
source "$DIR/install_snap.sh";
source "$DIR/install_fusuma.sh";
source "$DIR/post_docker_install.sh";

# Neovim Setup
if [ -d "$HOME/.config/nvim" ]; then
  rm -rf "$HOME/.config/nvim";
fi
mkdir "$HOME/.config/nvim";
ln -s "$DOTFILES/.vimrc" "$HOME/.config/nvim/init.vim";
