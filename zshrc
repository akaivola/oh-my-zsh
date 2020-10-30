export PATH=/usr/local/sbin:/usr/local/bin:$PATH
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
plugins=(git osx fasd zsh-autosuggestions per-directory-history)

# Load default oh-my-zsh stuff
source $ZSH/oh-my-zsh.sh

LANG="en_US.UTF-8"
LC_CTYPE="en_US.UTF-8"

alias sed=gsed
alias g='nocorrect git'
alias du='nocorrect du'
alias gg='nocorrect gitgrep'
alias ino='nocorrect ino'
alias less='less -X -F -R'
# PS
alias psg="ps aux | grep "
alias psr='ps aux | grep ruby'
alias dfc='nocorrect dfc'

# Show human friendly numbers and colors
alias ll='ls -alGh'
alias ls='ls -Gh'

# show me files matching "ls grep"
alias lsg='ll | grep'

# Common shell functions
alias tf='tail -f'
alias l='less'
alias lh='ls -alt | head' # see the last modified files
alias screen='TERM=screen screen'
alias ps='ps aux'
# Global aliases
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias -g .......='../../../../../..'
alias -g ........='../../../../../../..'
alias -g C='| wc -l'
alias -g H='| head'
alias -g L="| less"
alias -g N="| /dev/null"
alias -g S='| sort'
alias -g G='| grep' # now you can do: ls foo G something
alias -g T="| sed 's/\x1b\[[0-9]*m//g'"

# http aliases
alias GET='http GET'
alias PUT='http PUT'
alias POST='http POST'
alias DELETE='http DELETE'
alias OPTIONS='http OPTIONS'

# alias for emacs
alias ec='emacsclient -c'

alias ag='ag --pager less'

# docker aliases
alias dockercleancontainers="docker ps -a --no-trunc| grep 'Exit' | awk '{print \$1}' | xargs -L 1 docker rm"
alias dockercleanimages="docker images -a --no-trunc | grep none | awk '{print \$3}' | xargs -L 1 docker rmi"
alias dockerclean="dockercleancontainers && dockercleanimages"
#alias dps="docker ps | q -bH1 'select c1, c2, c3 from -' | column -t"
alias dps="docker ps | sed -e 's/  /\+/g' -e 's/CONTAINER ID/CONTAINER_ID/' | tr -s '+' '\t' | tail -n+2 | q -t 'select c1,substr(c7, 0, 40),c2,c6 from -' | column -t"
alias drun="docker run -t -i --rm"

#Emacs
alias emc="emacsclient"

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

export EDITOR=/usr/bin/vim
#export VISUAL=/usr/local/bin/mvim
#export JAVA_HOME="$(/usr/libexec/java_home)"
#export JDK_HOME=$JAVA_HOME
export JAVA_OPTS="-Dfile.encoding=UTF8"
#export GROOVY_HOME=$(brew --prefix groovy)/libexec
export SCALA_HOME=/usr/local/opt/scala/2.13.1/libexec

export M2_HOME=/usr/local/opt/maven/libexec
export ACK_PAGER='less -X -F'
export ACK_PAGER_COLOR='less -X -R -F'
#export REBEL_HOME=/home/aki/Programs/jrebel
export NODE_PATH="/usr/local/share/npm/lib/node_modules"
export PYTHONPATH=/usr/local/lib/python:$PYTHONPATH
export LEIN_JAVA_CMD=/usr/local/opt/drip/bin/drip
export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"
export ANDROID_HOME=$ANDROID_SDK_ROOT
export ANDROID_NDK_HOME="/usr/local/share/android-ndk"
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

source ~/.homebrew_api_token

#export AWS_ACCESS_KEY="$(pass aws/aki/access_key)"\
#       AWS_SECRET_KEY="$(pass aws/aki/secret_key)"\
#       EC2_AMITOOL_HOME="$(brew --prefix ec2-ami-tools)/libexec"\
#       EC2_HOME="$(brew --prefix ec2-api-tools)/libexec"

#
# Customize to your needs...
export PATH=.:/usr/local/share/npm/bin:$M2_HOME/bin:$PATH:$HOME/bin:/usr/local/opt/go/libexec/bin:/usr/local/share/pypy:~/.cargo/bin

eval "$(jenv init -)"

unsetopt share_history

BREW_PREFIX=$(brew --prefix)

# Autojump
#[[ -s $BREW_PREFIX/etc/profile.d/autojump.sh ]] && . $BREW_PREFIX/etc/profile.d/autojump.sh


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

# added by travis gem
[ -f /Users/akaivola/.travis/travis.sh ] && source /Users/akaivola/.travis/travis.sh

# history autosuggest color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bold"

# Docker buildkit and Docker compose buildkit support
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1
