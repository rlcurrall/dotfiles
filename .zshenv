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

# Deno setup
export DENO_DIR="/home/robb/.deno"
if [ -d $DENO_DIR ]; then
  export PATH="$DENO_DIR/bin:$PATH"
fi

# Rust & Cargo setup
export CARGO_DIR="/home/robb/.cargo"
if [ -d $CARGO_DIR ]; then
  export PATH="$CARGO_DIR/bin:$PATH"
fi

# NVM setup
export NVM_DIR="/home/robb/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
