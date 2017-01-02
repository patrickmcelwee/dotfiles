if [ -f ~/.custom_bash_profile ]; then
  source ~/.custom_bash_profile
fi

export XMLSH=/usr/local/xmlsh
export XMODPATH=/usr/local/xmlsh/ext
export PATH=$PATH:$XMLSH/unix

export NVM_DIR=~/.nvm

if hash brew 2>/dev/null; then
  if [ -f $(brew --prefix nvm)/nvm.sh ]; then
    source $(brew --prefix nvm)/nvm.sh
  fi
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
fi

if hash docker-machine 2>/dev/null; then
  eval $(docker-machine env docker-vm)
fi

alias usenewdocker="unset DOCKER_TLS_VERIFY; unset DOCKER_CERT_PATH; unset DOCKER_MACHINE_NAME; unset DOCKER_HOST"

# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTSIZE=50000
export HISTFILESIZE=
export HISTFILE=~/.bash_eternal_history
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

alias vb='vim ~/.bashrc'
alias sb='source ~/.bashrc'

alias doco='docker-compose'

alias java7='export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)'
alias java8='export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)'

alias ls='ls -G'
alias ll='ls -ltrh'

alias pg='ps aux | grep'
alias hsg='history | grep'
alias start-mysql='mysql.server start'
alias postgres='postgres -D /usr/local/var/postgres'

alias g='git'

# :-)
alias mirror='/Applications/Photo\ Booth.app/Contents/MacOS/Photo\ Booth'

if [ -d /usr/local/Cellar/macvim ]; then
  export EDITOR='/usr/local/Cellar/macvim/*/MacVim.app/Contents/MacOS/Vim'
else
  export EDITOR='vim'
fi
# pass through C-s to vim
vim()
{
  local STTYOPTS="$(stty --save)"
  stty stop '' -ixoff
  command vim "$@"
  stty "$STTYOPTS"
}

export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/mysql/bin
export TERM=screen-256color
 
export PATH=$PATH:/usr/local/mysql/bin

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
if [ -f /usr/local/share/chruby/chruby.sh ]; then
  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh
  chruby ruby
fi

export CPPFLAGS=-I/opt/X11/include

# git autocomplete branches
if [ -f ~/.scripts/git-completion.bash ]; then
  . ~/.scripts/git-completion.bash
fi

set -o vi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [ ! -n "$SSH_CLIENT" ]; then
  export PS1='\W \u$ '
fi

