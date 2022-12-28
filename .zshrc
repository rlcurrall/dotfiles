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
plugins=(git brew deno docker docker-compose rust)

source "$ZSH/oh-my-zsh.sh"

#==============================================================================#
# ZSH Aliases
#==============================================================================#
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"

if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

dcterm () {
    if [ -z $1 ]; then
        echo 'Must provide service name.'
        return 1
    fi

    pod_id=$(docker-compose ps -q $1 2>/dev/null 1>&1)

    if [ -z $pod_id ]; then
        echo "No service with the name $1 was found."
        return 1
    fi

    docker exec -it $pod_id export /bin/sh
}

alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'

[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

# source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
# source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

alias ppdb='gcloud compute ssh --zone us-central1-c --project hipcomic-main "hipcomic-mysql-gen6" -- -NL 3306:localhost:3306'

alias python=/usr/local/bin/python3

export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export DENO_INSTALL="/Users/robb/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

