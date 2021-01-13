#!/bin/bash

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && cd .. && pwd)"

#==============================================================================#
# Create local bin directory
#==============================================================================#
if [ -d "$HOME/.bin" ]; then
  rm -rf "$HOME/.bin"
fi
mkdir "$HOME/.bin"

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
# Install Gnome applications
#==============================================================================#
sudo apt install -y \
  celluloid \
  gnome-calculator \
  gnome-calendar \
  gnome-gmail \
  gnome-maps \
  gnome-music \
  gnome-photos \
  gnome-weather

#==============================================================================#
# Install Desktop Applications
#==============================================================================#
sudo snap install typora
sudo snap install gimp
sudo snap install spotify
sudo snap install chromium
sudo snap install --classic phpstorm

#==============================================================================#
# Customize Desktop Files
#==============================================================================#
sudo ln -s "$DOTFILES/assets/gmail_icon.png" /usr/share/pixmaps/gmail_icon.png
ln -s "$DOTFILES/ubuntu/gnome-gmail.desktop" "$HOME/.local/share/applications/gnome-gmail.desktop"

ln -s "$DOTFILES/ubuntu/nvim.desktop" "$HOME/.local/share/applications/nvim.desktop"
ln -s "$DOTFILES/ubuntu/vim.desktop" "$HOME/.local/share/applications/vim.desktop"
ln -s "$DOTFILES/ubuntu/mpv.desktop" "$HOME/.local/share/applications/mpv.desktop"

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
# Install PHP & Extensions
#==============================================================================#
sudo apt install -y php \
  php-mbstring \
  php-dom

# Install Composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

# Install Composer Global Packages
"$DOTFILES"/composer.phar global require tightenco/takeout

# Move to local bin folder
mv "$DOTFILES/composer.phar" "$HOME/.bin/composer"

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
# install_docker
#==============================================================================#
sudo apt install -y \
  docker \
  docker-compose

# Create Docker group & add user to it
sudo groupadd docker
sudo usermod -aG docker "$USER"

# Enable Docker Daemon
sudo systemctl enable docker

#==============================================================================#
# install_fusuma
#==============================================================================#
sudo apt install -y \
  libinput-tools \
  ruby \
  xdotool

# Add current user to input group
sudo gpasswd -a "$USER" input

# Install Fusuma
sudo gem install fusuma

# Fusuma Config
if [ -d "$HOME/.config/fusuma" ]; then
  rm -rf "$HOME/.config/fusuma"
fi
mkdir "$HOME/.config/fusuma"
ln -s "$DOTFILES/fusuma.yml" "$HOME/.config/fusuma/config.yml"

# Set Fusuma to start on boot
if [ ! -d "$HOME/.config/autostart" ]; then
  mkdir "$HOME/.config/autostart"
fi
ln -s "$DOTFILES/ubuntu/fusuma.desktop" "$HOME/.config/autostart/fusuma.desktop"

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
