export PATH=/opt/homebrew/bin:/usr/local/sbin:/usr/local/bin:$PATH

export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# skwp theme comes from skwp/oh-my-zsh fork
ZSH_THEME="akis"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git zsh-autosuggestions per-directory-history)

# Load default oh-my-zsh stuff
source $ZSH/oh-my-zsh.sh

LANG="en_US.UTF-8"
LC_CTYPE="en_US.UTF-8"

source ~/.zshalias

# Functions
gitgrep() {
  git grep --color "$*" $(git rev-list --all)
}

# Speed up git completion
# http://talkings.org/post/5236392664/zsh-and-slow-git-completion
__git_files () {
  _wanted files expl 'local files' _files
}

# Always pushd when changing directory
setopt auto_pushd

# Fuzzy matching of completions for when you mistype them:
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export EDITOR=/opt/homebrew/bin/nvim
export JAVA_OPTS="-Dfile.encoding=UTF8"
export SCALA_HOME=/usr/local/opt/scala/2.13.1/libexec
export M2_HOME=/usr/local/opt/maven/libexec
export ACK_PAGER='less -X -F'
export ACK_PAGER_COLOR='less -X -R -F'
export NODE_PATH="/usr/local/share/npm/lib/node_modules"
export PYTHONPATH=/usr/local/lib/python:$PYTHONPATH

BREW_PREFIX=$(brew --prefix)

source ~/.homebrew_api_token

export PATH=.:/usr/local/share/npm/bin:$M2_HOME/bin:$PATH:$HOME/bin:/usr/local/opt/go/libexec/bin:/usr/local/share/pypy:~/.cargo/bin

eval "$(jenv init -)"


# Give me my bash style incremental search
bindkey '^R' history-incremental-search-backward
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# fix backward and forward keys
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

noop() {}

zle -N noop
bindkey '^[[I' noop
bindkey '^[[O' noop

# Appends every command to the history file once it is executed
setopt inc_append_history
# # Reloads the history whenever you use it
setopt share_history

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# history autosuggest color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bold"

# Docker buildkit and Docker compose buildkit support
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

# Npm analytics lib which phones home
export SCARF_ANALYTICS=false

export MCFLY_FUZZY=2
#export MCFLY_DEBUG=0
export MCFLY_RESULTS=50
export MCFLY_INTERFACE_VIEW=BOTTOM
export MCFLY_RESULTS_SORT=LAST_RUN
eval "$(mcfly init zsh)"

export RIPGREP_CONFIG_PATH=~/.ripgreprc

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/akaivola/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/akaivola/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/akaivola/miniconda3/etc/profile.d/conda.sh" &
    else
        export PATH="/Users/akaivola/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Antidote plugin manager
source $(brew --prefix antidote)/share/antidote/antidote.zsh
antidote load
export PATH="$PATH:$HOME/.babashka/bbin/bin"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(fnm env)"

## SOK
export PATH=$PATH:/Users/aki.kaivola/Development/SOK/ad-aws-login/bin
export AWS_PAGER=
export AWS_DEFAULT_REGION=eu-west-1
export GPG_TTY=$(tty)

## Rancher
export PATH="/Users/aki.kaivola/.rd/bin:$PATH"

autoload -U compinit
compinit
source <(jj util completion --zsh)

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/aki.kaivola/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
