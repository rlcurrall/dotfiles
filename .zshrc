#==============================================================================#
# OH MY ZSH
#==============================================================================#

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git)

source $ZSH/oh-my-zsh.sh

#==============================================================================#
# User configuration
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
export DENO_DIR="$HOME/.deno"
if [ -d $DENO_DIR ]
  export PATH="$DENO_DIR/bin:$PATH"
fi

# Rust & Cargo setup
export CARGO_DIR="$HOME/.cargo"
if [ -d $CARGO_DIR ]
  export PATH="$CARGO_DIR/bin:$PATH"
fi

# NVM setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

##
# Load Aliases
##
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi
