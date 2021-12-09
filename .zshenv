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

# sbin
if [ -d "/usr/local/sbin" ]; then
    export PATH="/usr/local/sbin:$PATH";
fi

# Custom Scripts
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
    # export PATH="$CARGO_DIR/bin:$PATH"
    source "$HOME/.cargo/env"
fi

# NVM setup
if [ "$(uname -s)" = "Darwin" ]; then
    NVM_DIR="/usr/local/opt/nvm";
else
    NVM_DIR="$HOME/.nvm";
fi
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
