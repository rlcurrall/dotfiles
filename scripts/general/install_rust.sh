#!/bin/bash

# Check that curl has been installed
if ! hash curl 2>/dev/null; then
    printf "\n\ncurl is not installed!\n\n";
    exit 1;
fi

# Install Rust
printf "\n\nInstalling Deno...\n\n";
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y;

if hash cargo 2>/dev/null; then
  cargo install bat;
  cargo install ripgrep;
fi
