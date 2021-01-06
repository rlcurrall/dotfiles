#!/bin/bash

# Add current user to input group
sudo gpasswd -a "$USER" input;
newgrp input;

# Install Fusuma
sudo gem install fusuma;

# Fusuma Config
if [ -d "$HOME/.config/fusuma" ]; then
  rm -rf "$HOME/.config/fusuma";
fi
mkdir "$HOME/.config/fusuma";
ln -s "$DOTFILES/fusuma" "$HOME/.config/fusuma";
