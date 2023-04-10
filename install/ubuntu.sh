#!/bin/bash

#==============================================================================#
# Install min required apt packages
#==============================================================================#
sudo apt install -y \
  build-essential \
  curl \
  fonts-firacode \
  jq \
  xclip

#==============================================================================#
# Install Oh My Zsh
#==============================================================================#
sudo apt install -y zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

rm -f "$HOME/.zshrc"
ln -s "$DOTFILES/.zshrc" "$HOME/.zshrc"
source "$HOME/.zshrc"

rm -f "$HOME/.zshenv"
ln -s "$DOTFILES/.zshenv" "$HOME/.zshenv"
source "$HOME/.zshenv"

rm -f "$HOME/.zprofile"
ln -s "$DOTFILES/.zprofile" "$HOME/.zprofile"
source "$HOME/.zprofile"

#==============================================================================#
# Install Git
#==============================================================================#
sudo apt install -y git

# Link Git Config
rm -f "$HOME/.gitconfig"
ln -s "$DOTFILES/.gitconfig" "$HOME/.gitconfig"

# Link Global Git Ignore
rm -f "$HOME/.gitignore"
ln -s "$DOTFILES/.gitignore" "$HOME/.gitignore"

#==============================================================================#
# Install NeoVim
#==============================================================================#
sudo apt install -y neovim

# Global Vim Config
rm -f "$HOME/.vimrc"
ln -s "$DOTFILES/.vimrc" "$HOME/.vimrc"

# Neovim Config
rm -rf "$HOME/.config/nvim"
if [ ! -d "$HOME/.config" ]; then
  mkdir "$HOME/.config"
fi
mkdir "$HOME/.config/nvim"
ln -s "$DOTFILES/.vimrc" "$HOME/.config/nvim/init.vim"

# Install Plugin Manager - Vim Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install plugins
nvim +PlugInstall +qall

#==============================================================================#
# install_node
#==============================================================================#
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

# Load NVM
source "$HOME/.nvm/nvm.sh"

# Install Node
nvm install 14

#==============================================================================#
# install_rust
#==============================================================================#
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y

# Load Rust
source "$HOME/.cargo/env"

# Install Cargo Packages
cargo install bat
cargo install ripgrep

#==============================================================================#
# install_deno
#==============================================================================#
curl -fsSL https://deno.land/x/install/install.sh | bash

