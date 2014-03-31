#Locale / lang fix
export LC_ALL="en_US"

# Set up editor
export EDITOR=vim

# When using history commmand do not view duplicates
export HISTCONTROL=ignoredups

# Misc
export GREP_OPTIONS='--color=auto'

# Aliases
alias ls='ls --color=auto'
alias screen='screen -dR'
alias gj='grep -r --include="*.js" --exclude="*.min.js" --exclude-dir="node_modules"'
alias gjc='grep -r --include="*.js" --include="*.css" --exclude="*.min.js" --exclude="*.min.css" --exclude-dir="node_modules"'
alias gvim="vim -g"


export VIMRUNTIME=~/local/vim/runtime

export P4MERGE=`which p4merge 2>/dev/null`
export P4DIFF=`which p4merge 2>/dev/null`
export P4EDITOR=`which vim`

