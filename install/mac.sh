#!/bin/bash

#==============================================================================#
# Install Homebrew
#==============================================================================#
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#==============================================================================#
# Tap other sources
#==============================================================================#
brew tap homebrew/cask-fonts

#==============================================================================#
# Install Casks
#==============================================================================#
brew install --cask typora
brew install --cask spotify
brew install --cask iterm2
brew install --cask discord
brew install --cask phpstorm
brew install --cask google-chrome
brew install --cask docker
brew install --cask font-fira-code

#==============================================================================#
# Install Formulae
#==============================================================================#
brew install bash
brew install bash-completion2
brew install caddy
brew install mkcert
brew install git
brew install nvim
brew install php
brew install composer
brew install docker-compose
brew install nvm
brew install bat
brew install ripgrep

#==============================================================================#
# Install Rust
#==============================================================================#
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

#==============================================================================#
# Install Deno
#==============================================================================#
curl -fsSL https://deno.land/x/install/install.sh | sh
