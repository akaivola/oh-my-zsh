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
plugins=(git osx autojump)

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

# aliases for common hostnames
alias -g VAD='viihde-agnes-devapijava1'
alias -g VARC1='viihde-agnes-rcapijava1'
alias -g VARC2='viihde-agnes-rcapijava2'
alias -g VA1='viihde-agnes-apijava1'
alias -g VA2='viihde-agnes-apijava2'

# alias for emacs
alias ec='emacsclient -c'

alias gradle='JAVA_HOME=$(/usr/libexec/java_home -v 1.7) gradle --daemon'
alias ag='ag --pager less'

alias hssh='ssh -t huussi sudo ssh'

# docker aliases
alias dockercleancontainers="docker ps -a --no-trunc| grep 'Exit' | awk '{print \$1}' | xargs -L 1 docker rm"
alias dockercleanimages="docker images -a --no-trunc | grep none | awk '{print \$3}' | xargs -L 1 docker rmi"
alias dockerclean="dockercleancontainers && dockercleanimages"
#alias dps="docker ps | q -bH1 'select c1, c2, c3 from -' | column -t"
alias dps="docker ps | sed -e 's/  /\+/g' -e 's/CONTAINER ID/CONTAINER_ID/' | tr -s '+' '\t' | q -t 'select c1,substr(c7, 0, 40),c2,c6 from -' | column -t"
alias drun="docker run -t -i --rm"
alias b2d="boot2docker"
alias b2ds="boot2docker ssh"
alias b2ip="boot2docker ip 2>/dev/null"

#node aliases
alias nr="NODE_NO_READLINE=1 rlwrap node"

#Emacs
alias emc="emacsclient"

# Functions
gitgrep() {
  git grep --color "$*" $(git rev-list --all)
}

f() {
  find . -iname "$*" 2>/dev/null
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
export JAVA_HOME="$(/usr/libexec/java_home)"
export JAVA_OPTS="-Dfile.encoding=UTF8"
#export JDK_HOME=$JAVA_HOME
export GROOVY_HOME=$(brew --prefix groovy)/libexec
export SCALA_HOME=$(brew --prefix scala)/libexec
export M2_OPTS="-Xms64m -Xmx1024m -XX:PermSize=64m -XX:MaxPermSize=256m -XX:+CMSClassUnloadingEnabled"
export ANT_OPTS="-ea -Xmx4048M -Xms1024M -XX:PermSize=512M -XX:MaxPermSize=1024M -Djavax.net.ssl.trustStore=$HOME/Documents/work/elisa/gitprojects/devel/software/viihde-ui-dist/artifactorykeystore"

export MAVEN_OPTS=$M2_OPTS
export M2_HOME=$(brew --prefix maven)/libexec
export ACK_PAGER='less -X -F'
export ACK_PAGER_COLOR='less -X -R -F'
#export REBEL_HOME=/home/aki/Programs/jrebel
export NODE_PATH="/usr/local/share/npm/lib/node_modules"
export PYTHONPATH=/usr/local/lib/python:$PYTHONPATH
#export DOCKER_HOST=tcp://localhost:2375
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/akaivola/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export LEIN_JAVA_CMD=$(brew --prefix drip)/bin/drip

export AWS_ACCESS_KEY="$(pass aws/aki/access_key)"\
       AWS_SECRET_KEY="$(pass aws/aki/secret_key)"\
       EC2_AMITOOL_HOME="$(brew --prefix ec2-ami-tools)/libexec"\
       EC2_HOME="$(brew --prefix ec2-api-tools)/libexec"

#
# Customize to your needs...
export PATH=.:/usr/local/sbin:/usr/local/bin:/usr/local/share/npm/bin:$(brew --prefix ruby)/bin:$M2_HOME/bin:$PATH:$GROOVY_HOME/bin:$HOME/bin:$(brew --prefix go)/libexec/bin:/usr/local/share/pypy

unsetopt share_history


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
