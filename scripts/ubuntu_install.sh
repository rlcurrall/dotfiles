#!/bin/bash

DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && cd .. && pwd )";

function create_user_bin () {
  if [ -d "$HOME/.bin" ]; then
    rm -rf "$HOME/.bin";
  fi
  mkdir "$HOME/.bin";
}

function install_apt_misc () {
  sudo apt install -y \
    build-essential \
    curl \
    fonts-firacode \
    jq \
    xclip;
}

function install_desktop_apps () {
  sudo snap install typora;
  sudo snap install gimp;
  sudo snap install spotify;
  sudo snap install chromium;
  sudo snap install --classic phpstorm;
}

function install_gnome_apps () {
  sudo apt install -y \
    celluloid \
    gnome-calculator \
    gnome-calendar \
    gnome-gmail \
    gnome-maps \
    gnome-music \
    gnome-photos \
    gnome-weather;
}

function install_fusuma () {
  # Install Dependencies
  sudo apt install -y \
    libinput-tools \
    ruby \
    xdotool;

  # Add current user to input group
  sudo gpasswd -a "$USER" input;

  # Install Fusuma
  sudo gem install fusuma;

  # Fusuma Config
  if [ -d "$HOME/.config/fusuma" ]; then
    rm -rf "$HOME/.config/fusuma";
  fi
  mkdir "$HOME/.config/fusuma";
  ln -s "$DOTFILES/fusuma/config.yml" "$HOME/.config/fusuma/config.yml";

  # Set Fusuma to start on boot
  if [ ! -d "$HOME/.config/autostart" ]; then
    mkdir "$HOME/.config/autostart";
  fi
  ln -s "$DOTFILES/ubuntu_desktop/fusuma.desktop" "$HOME/.config/autostart/fusuma.desktop";
}

function install_docker () {
  # Install Docker
  sudo apt install -y \
    docker \
    docker-compose;

  # Create Docker group & add user to it
  sudo groupadd docker;
  sudo usermod -aG docker "$USER";

  # Enable Docker Daemon
  sudo systemctl enable docker;
}

function install_neovim () {
  # Install NeoVim
  sudo apt install -y neovim;

  # Global Vim Config
  rm -f "$HOME/.vimrc";
  ln -s "$DOTFILES/.vimrc" "$HOME/.vimrc";

  # Neovim Config
  rm -rf "$HOME/.config/nvim";
  if [ ! -d "$HOME/.config" ]; then
    mkdir "$HOME/.config";
  fi
  mkdir "$HOME/.config/nvim";
  ln -s "$DOTFILES/.vimrc" "$HOME/.config/nvim/init.vim";

  # Install Plugin Manager - Vim Plug
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim';

  # Install plugins
  nvim +PlugInstall +qall;
}

function install_oh_my_zsh () {
  # Install zsh
  sudo apt install -y zsh;

  # Install Oh My Zsh
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";

  rm -f "$HOME/.zshrc";
  ln -s "$DOTFILES/.zshrc" "$HOME/.zshrc";
  source "$HOME/.zshrc";

  rm -f "$HOME/.zshenv";
  ln -s "$DOTFILES/.zshenv" "$HOME/.zshenv";
  source "$HOME/.zshenv";

  rm -f "$HOME/.zprofile";
  ln -s "$DOTFILES/.zprofile" "$HOME/.zprofile";
  source "$HOME/.zprofile";
}

function install_git () {
  # Install Git
  sudo apt install -y git;

  # Link Git Config
  rm -f "$HOME/.gitconfig";
  ln -s "$DOTFILES/.gitconfig" "$HOME/.gitconfig";

  # Link Global Git Ignore
  rm -f "$HOME/.gitignore";
  ln -s "$DOTFILES/.gitignore" "$HOME/.gitignore";
}

function install_php () {
  # Install PHP & Extensions
  sudo apt install -y php \
    php-mbstring \
    php-dom;

  # Install Composer
  php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
  php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
  php composer-setup.php
  php -r "unlink('composer-setup.php');"

  # Install Composer Global Packages
  "$DOTFILES"/composer.phar global require tightenco/takeout;

  # Move to local bin folder
  mv "$DOTFILES/composer.phar" "$HOME/.bin/composer";
}

function install_deno () {
  # Install from web
  curl -fsSL https://deno.land/x/install/install.sh | bash;
}

function install_node () {
  # Install from web
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash;

  # Load NVM
  source "$HOME/.nvm/nvm.sh";

  # Install Node
  nvm install 14;
}

function install_rust () {
  # Install from web
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y;

  # Load Rust
  source "$HOME/.cargo/env";

  # Install Cargo Packages
  cargo install bat;
  cargo install ripgrep;
}

function customize_desktop_files () {
  # Update Gnome Gmail Icon
  sudo ln -s "$DOTFILES/assets/gmail_icon.png" /usr/share/pixmaps/gmail_icon.png;
  ln -s "$DOTFILES/ubuntu_desktop/gnome-gmail.desktop" "$HOME/.local/share/applications/gnome-gmail.desktop"

  ln -s "$DOTFILES/ubuntu_desktop/nvim.desktop" "$HOME/.local/share/applications/nvim.desktop";
  ln -s "$DOTFILES/ubuntu_desktop/vim.desktop" "$HOME/.local/share/applications/vim.desktop";
  ln -s "$DOTFILES/ubuntu_desktop/mpv.desktop" "$HOME/.local/share/applications/mpv.desktop";
}

##
# Start
##
create_user_bin;
install_apt_misc;
install_gnome_apps;
install_desktop_apps;
customize_desktop_files;

install_git;
install_php;
install_deno;
install_node;
install_rust;
install_neovim;
install_docker;
install_fusuma;
install_oh_my_zsh;
