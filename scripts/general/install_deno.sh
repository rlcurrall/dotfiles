#!/bin/bash

# Check that curl has been installed
if ! hash curl 2>/dev/null; then
    printf "\n\ncurl is not installed!\n\n";
    exit 1;
fi

# Install Deno
printf "\n\nInstalling Deno...\n\n";
curl -fsSL https://deno.land/x/install/install.sh | bash;
