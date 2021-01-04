#==============================================================================#
# OH MY ZSH
#==============================================================================#

# Path to your oh-my-zsh installation.
export ZSH="/home/robb/.oh-my-zsh"

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
# ZSH Aliases
#==============================================================================#
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"

alias art="php artisan"
alias dcphp="docker-compose exec php ./bin/console"
alias dcpwa="docker-compose exec pwa"
alias smf="./bin/console"

function homestead() {
    ( cd ~/Homestead && vagrant $* )
}

export PATH="$PATH:$HOME/.symfony/bin"
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
