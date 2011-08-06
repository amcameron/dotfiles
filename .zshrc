# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(autojump brew git github vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
MAC=""
if [ "`uname`" = "Darwin" ] ; then
	MAC="true"
fi

export WORKON_HOME=$HOME/.virtualenvs
if [ -e /usr/local/bin/virtualenvwrapper.sh ]
then source /usr/local/bin/virtualenvwrapper.sh
fi

if [ -z "$MAC" ]
then LSCOLOR="--color=always"
else LSCOLOR="-G"
fi
alias ls="ls -F $LSCOLOR"
alias ll="ls -l"
alias la="ls -a"
alias grep="grep --color=always"
alias ga="gitk --all >/dev/null 2>&1 &"

# Speed up git completion on large repositories.
__git_files () { 
    _wanted files expl 'local files' _files 
}

# Don't hang up jobs when exiting, but do warn that they're still running
setopt NO_HUP
setopt CHECK_JOBS

# If on Mac, make sure that /usr/local/bin appears before /usr/bin, so that
# Homebrew formulae run instead of Mac OS commands.
if [ -z "$MAC" ]
then export PATH=/usr/local/bin:/usr/local/sbin:$PATH
fi

# Ensure that ~/bin/ is on the path.
export PATH=$PATH:~/bin/

# Even though we're using vi keybindings, use ^r for reverse history search.
bindkey '^R' history-incremental-search-backward
