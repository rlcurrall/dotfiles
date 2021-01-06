#!/bin/bash

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

if [ ! -d "$HOME/.config/autostart" ]; then
  mkdir "$HOME/.config/autostart";
fi
ln -s "$DOTFILES/assets/fusuma.desktop" "$HOME/.config/autostart/fusuma.desktop";
