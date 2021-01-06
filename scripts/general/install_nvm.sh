#!/bin/bash

# Check that curl has been installed
if ! hash curl 2>/dev/null; then
    printf "\n\ncurl is not installed!\n\n";
    exit 1;
fi

# Install NVM and Node
printf "\n\nInstalling NVM...\n\n";
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash;

if hash nvm 2>/dev/null; then
  nvm install 14;
fi