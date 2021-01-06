#!/bin/bash

# Check that curl has been installed
if ! hash curl 2>/dev/null; then
    printf "\n\ncurl is not installed!\n\n";
    exit 1;
fi

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
