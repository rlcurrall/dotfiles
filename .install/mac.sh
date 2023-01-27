#!/bin/bash

DOTFILES="$HOME/.dotfiles"
installLocation="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && cd .. && pwd)"

if [ ! "$DOTFILES" = "$installLocation" ]; then
  printf "\e[0;31mERROR: Dotfiles not installed in the correct directory.
    Expected: %s
    Found in: %s\e[m\n" "$DOTFILES" "$installLocation"
  return 1
fi

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
brew install --cask docker
brew install --cask discord
brew install --cask font-fira-code
brew install --cask google-chrome
brew install --cask postman
brew install --cask spotify
brew install --cask tableplus
brew install --cask visual-studio-code

#==============================================================================#
# Install Formulae
#==============================================================================#
brew install bash
brew install bash-completion2
brew install bat
brew install neovim
brew install nvm
brew install ripgrep

#==============================================================================#
# Install Rust
#==============================================================================#
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

#==============================================================================#
# Install Deno
#==============================================================================#
curl -fsSL https://deno.land/x/install/install.sh | sh
