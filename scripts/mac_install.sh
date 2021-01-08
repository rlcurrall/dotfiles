#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";

# Tap other sources
brew tap homebrew/cask-fonts;

# Install Casks
brew install --cask typort;
brew install --cask spotify;
brew install --cask iterm2;
brew install --cask discord;
brew install --cask phpstorm;
brew install --cask google-chrome;
brew install --cask docker;
brew install --cask font-fira-code;

# Install Formulae
brew install bash;
brew insstall bash-completion2
brew install nvim;
brew install php;
brew install composer;
brew install docker-compose;
brew install nvm;
brew install bat;
brew install ripgrep;

