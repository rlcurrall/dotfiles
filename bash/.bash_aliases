#==============================================================================#
# Default Aliases
#==============================================================================#

# Enable color support of ls and other handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# File listing aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CG'

# Add an "alert" alias for long running commands.
# Usage:
#	sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#==============================================================================#
# Misc Aliases
#==============================================================================#
alias reload="source ~/.bashrc"
alias vim="nvim "

#==============================================================================#
# Git Aliases
#==============================================================================#
alias ga="git add"
alias gaa="git add ."
alias gs="git status"

alias gc="git commit -m "

alias gundo="git reset --soft HEAD~"
alias nah="git reset --hard && git clean -df"

alias gl="git log"
alias glp="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

