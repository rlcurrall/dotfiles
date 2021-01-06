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

# Update Gnome Gmail Icon
sudo ln -s "$DOTFILES/assets/gmail_icon.png" /usr/share/pixmaps/gmail_icon.png;
ln -s "$DOTFILES/assets/desktop_files/gnome-gmail.desktop" "$HOME/.local/share/applications/gnome-gmail.desktop"

ln -s "$DOTFILES/assets/desktop_files/nvim.desktop" "$HOME/.local/share/applications/nvim.desktop";
ln -s "$DOTFILES/assets/desktop_files/vim.desktop" "$HOME/.local/share/applications/vim.desktop";
ln -s "$DOTFILES/assets/desktop_files/mpv.desktop" "$HOME/.local/share/applications/mpv.desktop";
