#==============================================================================#
# Environment Variables
#==============================================================================#

export VISUAL=vim
export EDITOR="$VISUAL"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

USER_SCRIPTS="$HOME/.bin";
if [ -d $USER_SCRIPTS ]; then
  export PATH="$USER_SCRIPTS:$PATH";
fi

# Deno setup
DENO_DIR="$HOME/.deno/bin"
if [ -d $DENO_DIR ]; then
  export PATH="$DENO_DIR:$PATH";
fi

# Rust & Cargo setup
CARGO_DIR="$HOME/.cargo"
if [ -d $CARGO_DIR ]; then
    source "$HOME/.cargo/env"
fi

# Composer setup
export COMPOSER_HOME="$HOME/.composer"
COMPOSER_DIR="$HOME/.composer/vendor/bin"
if [ -d $COMPOSER_DIR ]; then
    export PATH="$COMPOSER_DIR:$PATH"
fi

# Symfony setup
SYMFONY_DIR="$HOME/.symfony/bin"
if [ -d $SYMFONY_DIR ]; then
    export PATH="$SYMFONY_DIR:$PATH"
fi

# NVM setup
if [ "$(uname -s)" = "Darwin" ]; then
    NVM_DIR="/usr/local/opt/nvm";
else
    NVM_DIR="$HOME/.nvm";
fi
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
