#!/bin/bash

DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && cd .. && pwd )";
SCRIPTS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )";

##
# Create User Bin folder
##
if [ -d "$HOME/.bin" ]; then
  mkdir "$HOME/.bin";
fi

##
# Install dependencies
##
source "$SCRIPTS/ubuntu/install.sh";

# Install Oh My Zsh
source "$SCRIPTS/general/install_oh_my_zsh.sh";

##
# Setup symbolic links for dot files
##
rm "$HOME/.zshrc" && ln -s "$DOTFILES/.zshrc" "$HOME/.zshrc" && source "$HOME/.zshrc";
rm "$HOME/.zshenv" && ln -s "$DOTFILES/.zshenv" "$HOME/.zshenv" && source "$HOME/.zshenv";
rm "$HOME/.zprofile" && ln -s "$DOTFILES/.zprofile" "$HOME/.zprofile" && source "$HOME/.zprofile";
rm "$HOME/.gitconfig" && ln -s "$DOTFILES/.gitconfig" "$HOME/.gitconfig";
rm "$HOME/.gitignore" && ln -s "$DOTFILES/.gitignore" "$HOME/.gitignore";
rm "$HOME/.vimrc" && ln -s "$DOTFILES/.vimrc" "$HOME/.vimrc";

##
# Platform Independent Installs (Unix)
##
source "$SCRIPTS/general/install.sh";
