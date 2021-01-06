#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )";

source "$DIR/install_composer.sh";
source "$DIR/install_deno.sh";
source "$DIR/install_nvm.sh";
source "$DIR/install_rust.sh";
